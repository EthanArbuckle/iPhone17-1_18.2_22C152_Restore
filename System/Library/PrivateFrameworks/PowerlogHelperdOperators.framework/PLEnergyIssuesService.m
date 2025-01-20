@interface PLEnergyIssuesService
+ (id)createIssueEntriesFrom:(id)a3 forKey:(id)a4 now:(id)a5 midnight:(id)a6;
+ (id)entryEventForwardDefinitionHighPowerDetection;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventIntervalDefinitionsUrsaIssues;
+ (id)entryEventPointDefinitionEnergySignatures;
+ (id)entryEventPointDefinitionUrsaInteraction;
+ (id)entryEventPointDefinitionUrsaSummary;
+ (id)entryEventPointDefinitions;
+ (id)parseBootArgs:(id)a3;
+ (void)load;
- (CSDaemon)safeguardsDaemon;
- (PLEnergyIssuesService)init;
- (PLStateTrackingComposition)stateTrackerForSafeguards;
- (PLXPCListenerOperatorComposition)eventListener;
- (PLXPCListenerOperatorComposition)xpcListenerEnergyIssueTrigger;
- (__CFDictionary)createAssertionThreshold:(int)a3 withAggregateLimit:(int)a4;
- (void)handleAssertionNotifications;
- (void)handleStateChangeForSafeguards;
- (void)initOperatorDependancies;
- (void)initializeSafeguardsSystem;
- (void)setAssertionThresholds;
- (void)setEventListener:(id)a3;
- (void)setSafeguardsDaemon:(id)a3;
- (void)setStateTrackerForSafeguards:(id)a3;
- (void)setXpcListenerEnergyIssueTrigger:(id)a3;
- (void)updateDisplayState;
- (void)updatePluggedInState;
@end

@implementation PLEnergyIssuesService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEnergyIssuesService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitionEnergySignatures
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionHighPowerDetection
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLEnergyIssuesService)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLEnergyIssuesService;
    self = [(PLOperator *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if (!+[PLUtilities isPowerlogHelperd])
  {
    [(PLEnergyIssuesService *)self setAssertionThresholds];
    [(PLEnergyIssuesService *)self initializeSafeguardsSystem];
  }
}

- (__CFDictionary)createAssertionThreshold:(int)a3 withAggregateLimit:(int)a4
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int valuePtr = a3;
  CFNumberRef v8 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  int v11 = a4;
  CFNumberRef v9 = CFNumberCreate(v6, kCFNumberIntType, &v11);
  CFDictionarySetValue(Mutable, @"Asssertion Duration Limit", v8);
  CFDictionarySetValue(Mutable, @"Aggregate Assertion Limit", v9);
  CFRelease(v8);
  CFRelease(v9);
  return Mutable;
}

- (void)setAssertionThresholds
{
  CFDictionaryValueCallBacks valueCallBacks = *(CFDictionaryValueCallBacks *)byte_1F3FC6C98;
  v3 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], &valueCallBacks);
  CFDictionarySetValue(v3, @"Default Limits", [(PLEnergyIssuesService *)self createAssertionThreshold:1800 withAggregateLimit:1800]);
  CFDictionarySetValue(v3, @"backboardd", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"SpringBoard", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"mediaserverd", [(PLEnergyIssuesService *)self createAssertionThreshold:7200 withAggregateLimit:3150]);
  CFDictionarySetValue(v3, @"locationd", [(PLEnergyIssuesService *)self createAssertionThreshold:7200 withAggregateLimit:3150]);
  CFDictionarySetValue(v3, @"InCallService", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"itunesstored", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:2250]);
  CFDictionarySetValue(v3, @"CommCenter", [(PLEnergyIssuesService *)self createAssertionThreshold:7200 withAggregateLimit:3150]);
  CFDictionarySetValue(v3, @"assertiond", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:2250]);
  CFDictionarySetValue(v3, @"nsurlsessiond", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:2250]);
  CFDictionarySetValue(v3, @"MobileMail", [(PLEnergyIssuesService *)self createAssertionThreshold:1800 withAggregateLimit:1800]);
  CFDictionarySetValue(v3, @"assetsd", [(PLEnergyIssuesService *)self createAssertionThreshold:1800 withAggregateLimit:1800]);
  CFDictionarySetValue(v3, @"iaptransportd", [(PLEnergyIssuesService *)self createAssertionThreshold:1800 withAggregateLimit:1800]);
  CFDictionarySetValue(v3, @"bluetoothd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"identityservicesd", [(PLEnergyIssuesService *)self createAssertionThreshold:1800 withAggregateLimit:1800]);
  CFDictionarySetValue(v3, @"cloudd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:3600]);
  CFDictionarySetValue(v3, @"backupd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:2250]);
  CFDictionarySetValue(v3, @"apsd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"ReportCrash", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"com.apple.TapToRadar", [(PLEnergyIssuesService *)self createAssertionThreshold:7200 withAggregateLimit:3150]);
  CFDictionarySetValue(v3, @"iapd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:2250]);
  CFDictionarySetValue(v3, @"Music", [(PLEnergyIssuesService *)self createAssertionThreshold:7200 withAggregateLimit:3150]);
  CFDictionarySetValue(v3, @"pmset", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"Tap-To-Radar", [(PLEnergyIssuesService *)self createAssertionThreshold:7200 withAggregateLimit:3150]);
  CFDictionarySetValue(v3, @"callservicesd", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"terminusd", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"wifid", [(PLEnergyIssuesService *)self createAssertionThreshold:999999 withAggregateLimit:2250]);
  CFDictionarySetValue(v3, @"softwareupdateservicesd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"sharingd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"homed", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:999999]);
  CFDictionarySetValue(v3, @"dasd", [(PLEnergyIssuesService *)self createAssertionThreshold:3600 withAggregateLimit:999999]);
  int v4 = IOPMSetAssertionExceptionLimits();
  int v5 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke_120;
      v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v22 = v6;
      if (setAssertionThresholds_defaultOnce_118 != -1) {
        dispatch_once(&setAssertionThresholds_defaultOnce_118, &v18);
      }
      if (setAssertionThresholds_classDebugEnabled_119)
      {
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unsuccessful initialization of thresholds", v18, v19, v20, v21, v22);
        CFNumberRef v8 = (void *)MEMORY[0x1E4F929B8];
        CFNumberRef v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLEnergyIssuesService.m"];
        v10 = [v9 lastPathComponent];
        int v11 = [NSString stringWithUTF8String:"-[PLEnergyIssuesService setAssertionThresholds]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:797];

        v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
LABEL_14:
      }
    }
  }
  else if (v5)
  {
    uint64_t v13 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v13;
    if (setAssertionThresholds_defaultOnce != -1) {
      dispatch_once(&setAssertionThresholds_defaultOnce, block);
    }
    if (setAssertionThresholds_classDebugEnabled)
    {
      v7 = [NSString stringWithFormat:@"Succesful initialization of thresholds"];
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLEnergyIssuesService.m"];
      v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLEnergyIssuesService setAssertionThresholds]"];
      [v14 logMessage:v7 fromFile:v16 fromFunction:v17 fromLineNumber:794];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_14;
    }
  }
  if (v3)
  {
    CFDictionaryRemoveAllValues(v3);
    CFRelease(v3);
  }
}

uint64_t __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setAssertionThresholds_classDebugEnabled = result;
  return result;
}

uint64_t __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke_120(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setAssertionThresholds_classDebugEnabled_119 = result;
  return result;
}

- (void)handleAssertionNotifications
{
  dispatch_queue_t v2 = dispatch_queue_create("PM test queue", 0);
  IOPMScheduleAssertionExceptionNotification();
}

void __53__PLEnergyIssuesService_handleAssertionNotifications__block_invoke()
{
}

+ (id)entryEventIntervalDefinitions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    uint64_t v6 = @"UrsaDefinition";
    v3 = [a1 entryEventIntervalDefinitionsUrsaIssues];
    v7[0] = v3;
    int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (id)entryEventIntervalDefinitionsUrsaIssues
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v26 = *MEMORY[0x1E4F92CD0];
  v27 = &unk_1F4011BB8;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"radar";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v25[0] = v21;
  v24[1] = @"impact";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v25[1] = v19;
  v24[2] = @"timestampStart";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  v25[2] = v17;
  v24[3] = @"timestampEnd";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  v25[3] = v15;
  v24[4] = @"hitIn";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v25[4] = v13;
  v24[5] = @"fixedIn";
  dispatch_queue_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v25[5] = v3;
  v24[6] = @"isCritical";
  int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v25[6] = v5;
  v24[7] = @"timestampInvalid";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  v25[7] = v7;
  v24[8] = @"driMessage";
  CFNumberRef v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  CFNumberRef v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v25[8] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
  v29[1] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v11;
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    v7[0] = @"UrsaSummary";
    v3 = [a1 entryEventPointDefinitionUrsaSummary];
    v7[1] = @"UrsaInteraction";
    v8[0] = v3;
    int v4 = [a1 entryEventPointDefinitionUrsaInteraction];
    v8[1] = v4;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v5;
}

+ (id)entryEventPointDefinitionUrsaSummary
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F4011BC8;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"requestId";
  dispatch_queue_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v15[0] = v3;
  v14[1] = @"countBui";
  int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  v14[2] = @"countNotification";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v15[2] = v7;
  v14[3] = @"error";
  CFNumberRef v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  CFNumberRef v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionUrsaInteraction
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F4011BC8;
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"source";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v13[0] = v4;
  v12[1] = @"radar";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  v12[2] = @"action";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  CFNumberRef v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v13[2] = v8;
  CFNumberRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)parseBootArgs:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  int v5 = [v3 whitespaceCharacterSet];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__PLEnergyIssuesService_parseBootArgs___block_invoke;
  v11[3] = &unk_1E6E47E18;
  id v8 = v7;
  id v12 = v8;
  [v6 enumerateObjectsUsingBlock:v11];
  if ([v8 count]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

void __39__PLEnergyIssuesService_parseBootArgs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    if ([v3 rangeOfString:@"="] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) setObject:@"?" forKeyedSubscript:v3];
    }
    else
    {
      id v4 = [v3 componentsSeparatedByString:@"="];
      if ([v4 count] == 2)
      {
        int v5 = [v4 firstObject];
        uint64_t v6 = [v4 lastObject];
        v7 = (void *)v6;
        if (v5 && v6)
        {
          [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
        }
        else
        {
          id v8 = PLLogUrsa();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            __39__PLEnergyIssuesService_parseBootArgs___block_invoke_cold_1();
          }
        }
      }
      else
      {
        int v5 = PLLogUrsa();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __39__PLEnergyIssuesService_parseBootArgs___block_invoke_cold_1();
        }
      }
    }
  }
}

+ (id)createIssueEntriesFrom:(id)a3 forKey:(id)a4 now:(id)a5 midnight:(id)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v64 = a4;
  id v65 = a5;
  id v62 = a6;
  if (v9)
  {
    v10 = PLLogUrsa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v82 = v9;
      _os_log_impl(&dword_1E4220000, v10, OS_LOG_TYPE_DEFAULT, "CloudKit function connected successfully: %@", buf, 0xCu);
    }

    id v63 = [MEMORY[0x1E4F1CA48] array];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v61 = v9;
    id v11 = v9;
    uint64_t v68 = [v11 countByEnumeratingWithState:&v76 objects:v80 count:16];
    if (v68)
    {
      id v12 = @"radar";
      uint64_t v67 = *(void *)v77;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v77 != v67) {
            objc_enumerationMutation(v11);
          }
          uint64_t v14 = *(void **)(*((void *)&v76 + 1) + 8 * v13);
          v15 = objc_msgSend(v14, "objectForKeyedSubscript:", v12, v61);
          uint64_t v16 = [v14 objectForKeyedSubscript:@"impact"];
          uint64_t v17 = [v14 objectForKeyedSubscript:@"timestampStart"];
          v74 = [v14 objectForKeyedSubscript:@"timestampEnd"];
          v73 = [v14 objectForKeyedSubscript:@"hitIn"];
          v72 = [v14 objectForKeyedSubscript:@"fixedIn"];
          uint64_t v18 = [v14 objectForKeyedSubscript:@"isCritical"];
          v71 = [v14 objectForKeyedSubscript:@"timestampInvalid"];
          v75 = [v14 objectForKeyedSubscript:@"driMessage"];
          uint64_t v19 = [v14 objectForKeyedSubscript:@"notificationMessage"];
          v69 = (void *)v17;
          v70 = (void *)v19;
          if (!v15 || !v16 || !v17 || !v74 || !v73 || !v72 || !v18 || !v71 || !v75 || !v19)
          {
            v32 = PLLogUrsa();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              goto LABEL_32;
            }
            *(_DWORD *)buf = 138412290;
            id v82 = v14;
            v41 = v32;
            v42 = "Insufficient information for issue. Given information: %@";
            goto LABEL_51;
          }
          uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
          v21 = v15;
          if (v15 == (void *)v20) {
            goto LABEL_30;
          }
          uint64_t v22 = (void *)v20;
          uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
          v24 = v18;
          if (v18 == (void *)v23) {
            goto LABEL_29;
          }
          v25 = (void *)v23;
          v66 = v16;
          uint64_t v26 = v12;
          id v27 = v11;
          uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
          if (v75 == (void *)v28)
          {

            v24 = v25;
            id v12 = v26;
LABEL_29:

            v21 = v22;
LABEL_30:

LABEL_31:
            v32 = PLLogUrsa();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              goto LABEL_32;
            }
            *(_DWORD *)buf = 138412290;
            id v82 = v14;
            v41 = v32;
            v42 = "Null data found in issue: %@";
LABEL_51:
            _os_log_error_impl(&dword_1E4220000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);
            goto LABEL_32;
          }
          v29 = (void *)v28;
          v30 = [MEMORY[0x1E4F1CA98] null];

          BOOL v31 = v70 == v30;
          id v11 = v27;
          id v12 = v26;
          uint64_t v16 = v66;
          if (v31) {
            goto LABEL_31;
          }
          v32 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v64 withDate:v65];
          v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v15, "unsignedIntValue"));
          [v32 setObject:v33 forKeyedSubscript:v26];

          v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v18, "BOOLValue"));
          [v32 setObject:v34 forKeyedSubscript:@"isCritical"];

          [v32 setObject:v75 forKeyedSubscript:@"driMessage"];
          [v32 setObject:v70 forKeyedSubscript:@"notificationMessage"];
          v35 = [MEMORY[0x1E4F1CA98] null];

          if (v71 == v35)
          {
            double v37 = 0.0;
            v38 = v74;
LABEL_35:
            [v32 setObject:v62 forKeyedSubscript:@"timestampInvalid"];
            int v40 = 0;
            goto LABEL_36;
          }
          [v71 doubleValue];
          double v37 = v36;
          v38 = v74;
          if (v36 == 0.0) {
            goto LABEL_35;
          }
          v39 = [MEMORY[0x1E4F28ED0] numberWithDouble:v36];
          [v32 setObject:v39 forKeyedSubscript:@"timestampInvalid"];

          int v40 = 1;
LABEL_36:
          v43 = [MEMORY[0x1E4F1CA98] null];

          if (v66 != v43)
          {
            v44 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v66, "unsignedIntValue"));
            [v32 setObject:v44 forKeyedSubscript:@"impact"];
          }
          v45 = [MEMORY[0x1E4F1CA98] null];

          if (v69 != v45)
          {
            v46 = (void *)MEMORY[0x1E4F28ED0];
            [v69 doubleValue];
            v47 = objc_msgSend(v46, "numberWithDouble:");
            [v32 setObject:v47 forKeyedSubscript:@"timestampStart"];
          }
          v48 = [MEMORY[0x1E4F1CA98] null];

          if (v38 != v48)
          {
            v49 = (void *)MEMORY[0x1E4F28ED0];
            [v38 doubleValue];
            v50 = objc_msgSend(v49, "numberWithDouble:");
            [v32 setObject:v50 forKeyedSubscript:@"timestampEnd"];
          }
          v51 = [MEMORY[0x1E4F1CA98] null];

          if (v73 != v51)
          {
            v52 = objc_msgSend(NSString, "stringWithString:");
            [v32 setObject:v52 forKeyedSubscript:@"hitIn"];
          }
          v53 = [MEMORY[0x1E4F1CA98] null];

          if (v72 != v53)
          {
            v54 = objc_msgSend(NSString, "stringWithString:");
            [v32 setObject:v54 forKeyedSubscript:@"fixedIn"];
          }
          v55 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v37];
          v56 = v55;
          if (!v40
            || ([v55 laterDate:v65],
                v57 = objc_claimAutoreleasedReturnValue(),
                char v58 = [v57 isEqualToDate:v65],
                v57,
                (v58 & 1) == 0))
          {
            [v63 addObject:v32];
          }

          uint64_t v16 = v66;
LABEL_32:

          ++v13;
        }
        while (v68 != v13);
        uint64_t v59 = [v11 countByEnumeratingWithState:&v76 objects:v80 count:16];
        uint64_t v68 = v59;
      }
      while (v59);
    }

    id v9 = v61;
  }
  else
  {
    id v63 = 0;
  }

  return v63;
}

- (void)initializeSafeguardsSystem
{
  if (([MEMORY[0x1E4F92A38] nonUIBuild] & 1) == 0)
  {
    initComputeSafeguards();
    id v3 = (CSDaemon *)objc_claimAutoreleasedReturnValue();
    safeguardsDaemon = self->_safeguardsDaemon;
    self->_safeguardsDaemon = v3;

    int v5 = [MEMORY[0x1E4F92A50] sharedInstance];
    stateTrackerForSafeguards = self->_stateTrackerForSafeguards;
    self->_stateTrackerForSafeguards = v5;

    v7 = self->_stateTrackerForSafeguards;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke;
    v10[3] = &unk_1E6E47848;
    v10[4] = self;
    [(PLStateTrackingComposition *)v7 registerForStates:5 withOperator:self withBlock:v10];
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke_2;
    v9[3] = &unk_1E6E47848;
    v9[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleStateChangeForSafeguards];
}

uint64_t __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateDisplayState];
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  return [v2 updatePluggedInState];
}

- (void)handleStateChangeForSafeguards
{
  if ([(PLStateTrackingComposition *)self->_stateTrackerForSafeguards stateChanged:4]) {
    [(PLEnergyIssuesService *)self updateDisplayState];
  }
  if ([(PLStateTrackingComposition *)self->_stateTrackerForSafeguards stateChanged:1])
  {
    [(PLEnergyIssuesService *)self updatePluggedInState];
  }
}

- (void)updateDisplayState
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Display state has changed to: %@", v2, v3, v4, v5, v6);
}

- (void)updatePluggedInState
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "PluggedIn state has changed to: %d", (uint8_t *)v2, 8u);
}

- (PLXPCListenerOperatorComposition)eventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)xpcListenerEnergyIssueTrigger
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcListenerEnergyIssueTrigger:(id)a3
{
}

- (PLStateTrackingComposition)stateTrackerForSafeguards
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateTrackerForSafeguards:(id)a3
{
}

- (CSDaemon)safeguardsDaemon
{
  return (CSDaemon *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSafeguardsDaemon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeguardsDaemon, 0);
  objc_storeStrong((id *)&self->_stateTrackerForSafeguards, 0);
  objc_storeStrong((id *)&self->_xpcListenerEnergyIssueTrigger, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);
}

void __39__PLEnergyIssuesService_parseBootArgs___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "failed to parse %@", v1, 0xCu);
}

@end