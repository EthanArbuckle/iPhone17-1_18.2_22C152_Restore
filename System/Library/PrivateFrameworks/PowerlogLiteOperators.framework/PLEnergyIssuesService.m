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
- (BOOL)isUrsaDevModeEnabled;
- (CSDaemon)safeguardsDaemon;
- (PLEnergyIssuesService)init;
- (PLStateTrackingComposition)stateTrackerForSafeguards;
- (PLXPCListenerOperatorComposition)eventListener;
- (PLXPCListenerOperatorComposition)ursaInteractionListener;
- (PLXPCListenerOperatorComposition)ursaInvocationListener;
- (PLXPCListenerOperatorComposition)xpcListenerEnergyIssueTrigger;
- (_TtC21PowerlogLiteOperators10UrsaClient)ursaClient;
- (__CFDictionary)createAssertionThreshold:(int)a3 withAggregateLimit:(int)a4;
- (id)getRepeatingTaskWith:(id)a3 needsSubmit:(BOOL *)a4;
- (id)getUrsaTask:(BOOL *)a3;
- (void)addUrsaResponders;
- (void)checkUrsaBootArgs;
- (void)deregister:(id)a3;
- (void)deregisterUrsa;
- (void)fetchForIssues;
- (void)fetchForIssuesWithFlag:(id)a3;
- (void)handleAssertionNotifications;
- (void)handleStateChangeForSafeguards;
- (void)handleUrsaTask:(id)a3;
- (void)initOperatorDependancies;
- (void)initializeSafeguardsSystem;
- (void)invalidateIssues;
- (void)registerTaskWith:(id)a3 inQueue:(id)a4 launchHandler:(id)a5;
- (void)registerUrsa;
- (void)removeNotifications;
- (void)setAssertionThresholds;
- (void)setEventListener:(id)a3;
- (void)setSafeguardsDaemon:(id)a3;
- (void)setStateTrackerForSafeguards:(id)a3;
- (void)setUpUrsa;
- (void)setUrsaClient:(id)a3;
- (void)setUrsaInteractionListener:(id)a3;
- (void)setUrsaInvocationListener:(id)a3;
- (void)setXpcListenerEnergyIssueTrigger:(id)a3;
- (void)submitTask:(id)a3;
- (void)surfaceNotifications:(id)a3;
- (void)updateDisplayState;
- (void)updateParamsForUrsaTask:(id)a3;
- (void)updatePluggedInState;
- (void)updateTask:(id)a3;
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
  if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0)
  {
    [(PLEnergyIssuesService *)self setAssertionThresholds];
    [(PLEnergyIssuesService *)self setUpUrsa];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CFDictionaryValueCallBacks valueCallBacks = *(CFDictionaryValueCallBacks *)byte_1F2947820;
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
      if (qword_1EBD58960 != -1) {
        dispatch_once(&qword_1EBD58960, &v18);
      }
      if (byte_1EBD58951)
      {
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unsuccessful initialization of thresholds", v18, v19, v20, v21, v22);
        CFNumberRef v8 = (void *)MEMORY[0x1E4F929B8];
        CFNumberRef v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLEnergyIssuesService.m"];
        v10 = [v9 lastPathComponent];
        int v11 = [NSString stringWithUTF8String:"-[PLEnergyIssuesService setAssertionThresholds]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:797];

        v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v7;
LABEL_18:
          _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_13;
        }
        goto LABEL_13;
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
    if (qword_1EBD58958 != -1) {
      dispatch_once(&qword_1EBD58958, block);
    }
    if (_MergedGlobals_1_31)
    {
      v7 = [NSString stringWithFormat:@"Succesful initialization of thresholds"];
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLEnergyIssuesService.m"];
      v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLEnergyIssuesService setAssertionThresholds]"];
      [v14 logMessage:v7 fromFile:v16 fromFunction:v17 fromLineNumber:794];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        goto LABEL_18;
      }
LABEL_13:
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
  _MergedGlobals_1_31 = result;
  return result;
}

uint64_t __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke_120(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58951 = result;
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
  uint64_t v27 = &unk_1F29F0B10;
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
  v17 = &unk_1F29F0B20;
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
  v15 = &unk_1F29F0B20;
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

- (void)setUpUrsa
{
  *(void *)&v15[5] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F92A88] mobileUserADG];
  int v4 = PLLogUrsa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    *(void *)v15 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "adg: %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v5 = [v3 length];
  if (!_os_feature_enabled_impl()
    || ![MEMORY[0x1E4F92A38] internalBuild]
    || v5)
  {
    v12 = PLLogUrsa();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [MEMORY[0x1E4F92A38] internalBuild];
      int v14 = 67109376;
      v15[0] = v13;
      LOWORD(v15[1]) = 1024;
      *(_DWORD *)((char *)&v15[1] + 2) = v5 != 0;
      _os_log_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEFAULT, "Feature disabled int=%d adg=%d", (uint8_t *)&v14, 0xEu);
    }

    goto LABEL_18;
  }
  if (([MEMORY[0x1E4F929C0] objectExistsForKey:@"kUrsaEnabledKey"] & 1) == 0) {
    [MEMORY[0x1E4F929C0] setObject:MEMORY[0x1E4F1CC38] forKey:@"kUrsaEnabledKey" saveToDisk:1];
  }
  uint64_t v6 = [MEMORY[0x1E4F929C0] objectForKey:@"kUrsaEnabledKey"];
  int v7 = [v6 BOOLValue];

  CFNumberRef v8 = PLLogUrsa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFNumberRef v9 = @"disabled";
    if (v7) {
      CFNumberRef v9 = @"enabled";
    }
    int v14 = 138412290;
    *(void *)v15 = v9;
    _os_log_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEFAULT, "Feature %@", (uint8_t *)&v14, 0xCu);
  }

  if ((v7 & 1) == 0)
  {
LABEL_18:
    [(PLEnergyIssuesService *)self deregisterUrsa];
    goto LABEL_19;
  }
  v10 = [[_TtC21PowerlogLiteOperators10UrsaClient alloc] initWith:[(PLEnergyIssuesService *)self isUrsaDevModeEnabled]];
  [(PLEnergyIssuesService *)self setUrsaClient:v10];

  [(PLEnergyIssuesService *)self addUrsaResponders];
  [(PLEnergyIssuesService *)self registerUrsa];
  LOBYTE(v14) = 0;
  int v11 = [(PLEnergyIssuesService *)self getUrsaTask:&v14];
  [(PLEnergyIssuesService *)self updateParamsForUrsaTask:v11];
  if ((_BYTE)v14) {
    [(PLEnergyIssuesService *)self submitTask:v11];
  }
  else {
    [(PLEnergyIssuesService *)self updateTask:v11];
  }
  [(PLEnergyIssuesService *)self checkUrsaBootArgs];

LABEL_19:
}

- (BOOL)isUrsaDevModeEnabled
{
  dispatch_queue_t v2 = [MEMORY[0x1E4F929C0] objectForKey:@"UrsaDevMode" ifNotSet:MEMORY[0x1E4F1CC28]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)addUrsaResponders
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PLEnergyIssuesService_addUrsaResponders__block_invoke;
  void v8[3] = &unk_1E692A6F8;
  v8[4] = self;
  int v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29EA008 withBlock:v8];
  [(PLEnergyIssuesService *)self setUrsaInvocationListener:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __42__PLEnergyIssuesService_addUrsaResponders__block_invoke_225;
  v7[3] = &unk_1E692A6F8;
  v7[4] = self;
  uint64_t v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F29EA030 withBlock:v7];
  [(PLEnergyIssuesService *)self setUrsaInteractionListener:v6];
}

void __42__PLEnergyIssuesService_addUrsaResponders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogUrsa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Payload for invocation via XPC: %@", (uint8_t *)&v12, 0xCu);
  }

  if (v6
    && ([v6 objectForKeyedSubscript:@"UrsaFetchFlagKey"],
        CFNumberRef v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    CFNumberRef v9 = NSString;
    v10 = [v6 objectForKeyedSubscript:@"UrsaFetchFlagKey"];
    int v11 = [v9 stringWithString:v10];

    [*(id *)(a1 + 32) fetchForIssuesWithFlag:v11];
  }
  else
  {
    int v11 = PLLogUrsa();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "No payload available or key missing", (uint8_t *)&v12, 2u);
    }
  }
}

void __42__PLEnergyIssuesService_addUrsaResponders__block_invoke_225(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogUrsa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Payload from Ursa Interaction via XPC: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    CFNumberRef v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"UrsaInteraction"];
    CFNumberRef v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v6];
    [*(id *)(a1 + 32) logEntry:v9];
  }
  else
  {
    CFNumberRef v8 = PLLogUrsa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, "No payload available", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)registerUrsa
{
  objc_initWeak(&location, self);
  id v3 = [(PLOperator *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PLEnergyIssuesService_registerUrsa__block_invoke;
  v4[3] = &unk_1E692D9D0;
  objc_copyWeak(&v5, &location);
  [(PLEnergyIssuesService *)self registerTaskWith:@"com.apple.PerfPowerServices.ursaTask" inQueue:v3 launchHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__PLEnergyIssuesService_registerUrsa__block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleUrsaTask:v3];
}

- (void)registerTaskWith:(id)a3 inQueue:(id)a4 launchHandler:(id)a5
{
  int v7 = (void *)MEMORY[0x1E4F4F440];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 sharedScheduler];
  [v11 registerForTaskWithIdentifier:v10 usingQueue:v9 launchHandler:v8];
}

- (id)getUrsaTask:(BOOL *)a3
{
  return [(PLEnergyIssuesService *)self getRepeatingTaskWith:@"com.apple.PerfPowerServices.ursaTask" needsSubmit:a3];
}

- (id)getRepeatingTaskWith:(id)a3 needsSubmit:(BOOL *)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F4F440], "sharedScheduler", a3);
  id v6 = [v5 taskRequestForIdentifier:@"com.apple.PerfPowerServices.ursaTask"];

  *a4 = 0;
  if (!v6)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4F428]) initWithIdentifier:@"com.apple.PerfPowerServices.ursaTask"];
    *a4 = 1;
  }
  return v6;
}

- (void)updateParamsForUrsaTask:(id)a3
{
  id v3 = a3;
  [v3 setPriority:1];
  [v3 setRequiresNetworkConnectivity:1];
  [v3 setRequiresExternalPower:0];
  [v3 setInterval:21600.0];
}

- (void)submitTask:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = PLLogUrsa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "Submitting task with id, %@...", buf, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F4F440] sharedScheduler];
  id v12 = 0;
  char v7 = [v6 submitTaskRequest:v3 error:&v12];
  id v8 = v12;

  id v9 = PLLogUrsa();
  id v10 = v9;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    id v11 = [v3 identifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_error_impl(&dword_1D2690000, v10, OS_LOG_TYPE_ERROR, "Failed to submit task with id, %@, error: %@", buf, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v3 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v11;
    _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "Submitted task with id, %@", buf, 0xCu);
LABEL_6:
  }
LABEL_8:
}

- (void)updateTask:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = PLLogUrsa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "Updating task with id, %@...", buf, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F4F440] sharedScheduler];
  id v12 = 0;
  char v7 = [v6 updateTaskRequest:v3 error:&v12];
  id v8 = v12;

  id v9 = PLLogUrsa();
  id v10 = v9;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    id v11 = [v3 identifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_error_impl(&dword_1D2690000, v10, OS_LOG_TYPE_ERROR, "Failed to update task with id, %@, error: %@", buf, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v3 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v11;
    _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "Updated task with id, %@ successfully", buf, 0xCu);
LABEL_6:
  }
LABEL_8:
}

- (void)deregisterUrsa
{
  [(PLEnergyIssuesService *)self setUrsaClient:0];
  [(PLEnergyIssuesService *)self setUrsaInvocationListener:0];
  [(PLEnergyIssuesService *)self setUrsaInteractionListener:0];
  [(PLEnergyIssuesService *)self invalidateIssues];
  id v3 = [MEMORY[0x1E4F4F440] sharedScheduler];
  id v5 = [v3 taskRequestForIdentifier:@"com.apple.PerfPowerServices.ursaTask"];

  int v4 = v5;
  if (v5)
  {
    [(PLEnergyIssuesService *)self deregister:v5];
    int v4 = v5;
  }
}

- (void)deregister:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = PLLogUrsa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 identifier];
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "Deregistering task with id, %@...", (uint8_t *)&v12, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F4F440] sharedScheduler];
  char v7 = [v3 identifier];
  int v8 = [v6 deregisterTaskWithIdentifier:v7];

  id v9 = PLLogUrsa();
  id v10 = v9;
  if (!v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    id v11 = [v3 identifier];
    int v12 = 138412290;
    id v13 = v11;
    _os_log_error_impl(&dword_1D2690000, v10, OS_LOG_TYPE_ERROR, "Failed to deregister task with id, %@", (uint8_t *)&v12, 0xCu);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v3 identifier];
    int v12 = 138412290;
    id v13 = v11;
    _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "Deregistered task with id, %@", (uint8_t *)&v12, 0xCu);
LABEL_6:
  }
LABEL_8:
}

- (void)handleUrsaTask:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PLEnergyIssuesService_handleUrsaTask___block_invoke;
  v5[3] = &unk_1E692A250;
  v5[4] = self;
  id v4 = a3;
  [v4 setExpirationHandler:v5];
  [(PLEnergyIssuesService *)self fetchForIssues];
  [v4 setTaskCompleted];
}

void __40__PLEnergyIssuesService_handleUrsaTask___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) ursaClient];
  [v1 cancel];
}

- (void)fetchForIssues
{
  if (_os_feature_enabled_impl()) {
    id v3 = @"beta";
  }
  else {
    id v3 = @"noFlag";
  }
  [(PLEnergyIssuesService *)self fetchForIssuesWithFlag:v3];
}

- (void)fetchForIssuesWithFlag:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [MEMORY[0x1E4F1C9C8] nearestMidnightBeforeDate:v5];
  [v6 timeIntervalSince1970];
  double v8 = v7;
  id v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];

  objc_initWeak(&location, self);
  id v11 = [(PLEnergyIssuesService *)self ursaClient];
  int v12 = [MEMORY[0x1E4F92A88] crashReporterKey];
  id v13 = [MEMORY[0x1E4F92A88] buildVersion];
  uint64_t v14 = [MEMORY[0x1E4F92A88] hardwareModel];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke;
  v16[3] = &unk_1E692DA20;
  objc_copyWeak(&v18, &location);
  v16[4] = self;
  id v15 = v10;
  id v17 = v15;
  [v11 submitUrsaWith:v12 build:v13 device:v14 flag:v4 fetchStartTime:v15 requestId:v16 completion:v8 + -86400.0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    double v7 = PLLogUrsa();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v65 = (uint64_t)v5;
      _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, "CloudKit function failed with error: %@", buf, 0xCu);
    }

    uint64_t v57 = MEMORY[0x1E4F143A8];
    uint64_t v58 = 3221225472;
    v59 = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_246;
    v60 = &unk_1E692A2A0;
    id v61 = v5;
    AnalyticsSendEventLazy();
    double v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"UrsaSummary"];
    id v9 = objc_alloc(MEMORY[0x1E4F929D0]);
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    id v11 = [v10 convertFromSystemToMonotonic];
    int v12 = (void *)[v9 initWithEntryKey:v8 withDate:v11];

    id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v61, "code"));
    [v12 setObject:v13 forKeyedSubscript:@"error"];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained logEntry:v12];

    id v15 = v61;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    id v16 = [v15 convertFromSystemToMonotonic];
    id v17 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v15];
    id v18 = [v17 convertFromSystemToMonotonic];

    unint64_t v19 = 0x1E6928000uLL;
    v20 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"UrsaDefinition"];
    [*(id *)(a1 + 32) invalidateIssues];
    v21 = +[PLEnergyIssuesService createIssueEntriesFrom:v6 forKey:v20 now:v16 midnight:v18];
    uint64_t v22 = v21;
    if (v21)
    {
      v47 = v18;
      v49 = v16;
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      v54 = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_252;
      v55 = &unk_1E692A2A0;
      v23 = v21;
      v56 = v23;
      AnalyticsSendEventLazy();
      if ([v23 count])
      {
        id v24 = objc_loadWeakRetained((id *)(a1 + 48));
        v62 = v20;
        v63 = v23;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        [v24 logEntries:v25 withGroupID:v20];
      }
      id location = (id *)(a1 + 48);
      id v26 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v27 = [v26 storage];
      [v27 blockingFlushCachesWithReason:@"ursa"];

      if (([MEMORY[0x1E4F929C0] objectExistsForKey:@"kUrsaNotificationEnabledKey"] & 1) == 0) {
        [MEMORY[0x1E4F929C0] setObject:MEMORY[0x1E4F1CC38] forKey:@"kUrsaNotificationEnabledKey" saveToDisk:1];
      }
      v45 = v20;
      if (_os_feature_enabled_impl()
        && ([MEMORY[0x1E4F929C0] objectForKey:@"kUrsaNotificationEnabledKey"],
            v28 = objc_claimAutoreleasedReturnValue(),
            int v29 = [v28 BOOLValue],
            v28,
            v29))
      {
        id v30 = objc_loadWeakRetained(location);
        [v30 removeNotifications];

        v31 = [MEMORY[0x1E4F1CA48] array];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_2;
        v50[3] = &unk_1E692D9F8;
        v50[4] = *(void *)(a1 + 32);
        id v32 = v31;
        id v51 = v32;
        [v23 enumerateObjectsUsingBlock:v50];
        uint64_t v33 = [v32 count];
        v34 = PLLogUrsa();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = [v32 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v65 = v35;
          _os_log_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEFAULT, "Found %lu critical issues", buf, 0xCu);
        }

        id v36 = objc_loadWeakRetained(location);
        [v36 surfaceNotifications:v32];

        v37 = v49;
        unint64_t v19 = 0x1E6928000;
        uint64_t v38 = v33;
      }
      else
      {
        uint64_t v38 = 0;
        v37 = v49;
      }
      v39 = objc_msgSend(*(id *)(v19 + 3896), "entryKeyForType:andName:", *MEMORY[0x1E4F92D48], @"UrsaSummary", v45);
      v40 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v39 withDate:v37];
      [v40 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"requestId"];
      v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v23, "count"));
      [v40 setObject:v41 forKeyedSubscript:@"countBui"];

      id v16 = v49;
      v42 = [NSNumber numberWithUnsignedInteger:v38];
      [v40 setObject:v42 forKeyedSubscript:@"countNotification"];

      id v43 = objc_loadWeakRetained(location);
      [v43 logEntry:v40];

      v44 = v56;
      v20 = v46;
      id v18 = v47;
    }
    else
    {
      v44 = PLLogUrsa();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D2690000, v44, OS_LOG_TYPE_ERROR, "No entries for ursa", buf, 2u);
      }
    }
  }
}

id __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_246(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"failed";
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v5[0] = v1;
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

id __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_252(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"showing";
  id v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v5[0] = v1;
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

void __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_2(uint64_t a1, void *a2)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"isCritical"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v16[0] = @"Notification";
    v15[0] = @"source";
    v15[1] = @"radar";
    id v6 = objc_msgSend(v3, "objectForKeyedSubscript:");
    v15[2] = @"action";
    v16[1] = v6;
    void v16[2] = @"seen";
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = v7;
    id v8 = v7;
    AnalyticsSendEventLazy();
    id v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48], @"UrsaInteraction", v13, 3221225472, __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_3, &unk_1E692A2A0 andName];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v8];
    [*(id *)(a1 + 32) logEntry:v10];
    id v11 = *(void **)(a1 + 40);
    int v12 = [v3 dictionary];
    [v11 addObject:v12];
  }
}

id __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)invalidateIssues
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"UrsaDefinition"];
  id v4 = [(PLOperator *)self storage];
  int v5 = [v4 entriesForKey:v3];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [MEMORY[0x1E4F92AD0] sharedCore];
        int v12 = [v11 storage];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        void v16[2] = __41__PLEnergyIssuesService_invalidateIssues__block_invoke;
        v16[3] = &unk_1E692A250;
        void v16[4] = v10;
        [v12 updateEntry:v10 withBlock:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  uint64_t v13 = PLLogUrsa();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEFAULT, "Invalidated issues", buf, 2u);
  }
}

void __41__PLEnergyIssuesService_invalidateIssues__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"timestampInvalid"];
}

- (void)removeNotifications
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = PLQueryRegistered();
  id v3 = v2;
  if (v2
    && ([v2 objectForKeyedSubscript:@"UrsaNotificationState"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    int v5 = PLLogUrsa();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      uint64_t v10 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Entire response from Notification Service: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = [v3 objectForKeyedSubscript:@"UrsaNotificationState"];
    uint64_t v7 = PLLogUrsa();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Response was successful", (uint8_t *)&v9, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, "Response was failed", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    uint64_t v6 = PLLogUrsa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      uint64_t v10 = v3;
      _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Invalid response from Notification Service: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)surfaceNotifications:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ShowUrsaNotification"];
    [v4 setObject:v3 forKeyedSubscript:@"UrsaNotificationIssues"];
    int v5 = PLQueryRegistered();
    uint64_t v6 = v5;
    if (v5
      && ([v5 objectForKeyedSubscript:@"UrsaNotificationState"],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      uint64_t v8 = PLLogUrsa();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412290;
        uint64_t v13 = v6;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Entire response from Notification Service: %@", (uint8_t *)&v12, 0xCu);
      }

      int v9 = [v6 objectForKeyedSubscript:@"UrsaNotificationState"];
      uint64_t v10 = PLLogUrsa();
      uint64_t v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "Response was successful", (uint8_t *)&v12, 2u);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "Response was failed", (uint8_t *)&v12, 2u);
      }
    }
    else
    {
      int v9 = PLLogUrsa();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412290;
        uint64_t v13 = v6;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "Invalid response from Notification Service: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)checkUrsaBootArgs
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A88] deviceRebooted])
  {
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:*MEMORY[0x1E4F928A8]];
    id v4 = v3;
    if (v3)
    {
      int v5 = [v3 objectForKeyedSubscript:@"ursa"];
      uint64_t v6 = PLLogUrsa();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "checking for boot args", buf, 2u);
      }

      uint64_t v7 = [MEMORY[0x1E4F92A88] deviceBootArgs];
      uint64_t v8 = +[PLEnergyIssuesService parseBootArgs:v7];

      int v9 = PLLogUrsa();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = (uint64_t)v8;
        _os_log_impl(&dword_1D2690000, v9, OS_LOG_TYPE_INFO, "found args: %@", buf, 0xCu);
      }

      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v11 = [v5 objectForKeyedSubscript:@"bootargs"];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __42__PLEnergyIssuesService_checkUrsaBootArgs__block_invoke;
      v23 = &unk_1E692DA48;
      id v12 = v8;
      id v24 = v12;
      id v13 = v10;
      id v25 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:&v20];

      if (objc_msgSend(v13, "count", v20, v21, v22, v23))
      {
        uint64_t v14 = PLLogUrsa();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v13 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v27 = v15;
          _os_log_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEFAULT, "notifying %lu boot args", buf, 0xCu);
        }

        id v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"UrsaSummary"];
        long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
        [v17 setObject:@"bootarg" forKeyedSubscript:@"requestId"];
        long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        [v17 setObject:v18 forKeyedSubscript:@"countNotification"];

        [(PLOperator *)self logEntry:v17];
        long long v19 = [(PLOperator *)self storage];
        [v19 blockingFlushCachesWithReason:@"ursa"];

        [(PLEnergyIssuesService *)self surfaceNotifications:v13];
      }
    }
    else
    {
      int v5 = PLLogUrsa();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, "failed to read configuration", buf, 2u);
      }
    }
  }
  else
  {
    id v4 = PLLogUrsa();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "skipping boot arg check", buf, 2u);
    }
  }
}

void __42__PLEnergyIssuesService_checkUrsaBootArgs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"values"];

    if (v8)
    {
      int v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = [v6 objectForKeyedSubscript:@"values"];
      uint64_t v11 = [v9 setWithArray:v10];

      id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      if ([v11 containsObject:v12])
      {
        id v13 = PLLogUrsa();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          id v16 = v5;
          _os_log_impl(&dword_1D2690000, v13, OS_LOG_TYPE_INFO, "found boot arg:%@", (uint8_t *)&v15, 0xCu);
        }

        uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
        [v14 setObject:v5 forKeyedSubscript:@"bootarg"];
        [v14 setObject:&unk_1F29E6298 forKeyedSubscript:@"radar"];
        [*(id *)(a1 + 40) addObject:v14];
      }
    }
  }
}

+ (id)parseBootArgs:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 whitespaceCharacterSet];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__PLEnergyIssuesService_parseBootArgs___block_invoke;
  v11[3] = &unk_1E692DA70;
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
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
        id v5 = [v4 firstObject];
        uint64_t v6 = [v4 lastObject];
        uint64_t v7 = (void *)v6;
        if (v5 && v6)
        {
          [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
        }
        else
        {
          id v8 = PLLogUrsa();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v9 = 138412290;
            id v10 = v3;
            _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, "failed to parse %@", (uint8_t *)&v9, 0xCu);
          }
        }
      }
      else
      {
        id v5 = PLLogUrsa();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v9 = 138412290;
          id v10 = v3;
          _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, "failed to parse %@", (uint8_t *)&v9, 0xCu);
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
    id v10 = PLLogUrsa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v82 = v9;
      _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "CloudKit function connected successfully: %@", buf, 0xCu);
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
          int v15 = objc_msgSend(v14, "objectForKeyedSubscript:", v12, v61);
          id v16 = [v14 objectForKeyedSubscript:@"impact"];
          uint64_t v17 = [v14 objectForKeyedSubscript:@"timestampStart"];
          v74 = [v14 objectForKeyedSubscript:@"timestampEnd"];
          v73 = [v14 objectForKeyedSubscript:@"hitIn"];
          v72 = [v14 objectForKeyedSubscript:@"fixedIn"];
          long long v18 = [v14 objectForKeyedSubscript:@"isCritical"];
          v71 = [v14 objectForKeyedSubscript:@"timestampInvalid"];
          v75 = [v14 objectForKeyedSubscript:@"driMessage"];
          uint64_t v19 = [v14 objectForKeyedSubscript:@"notificationMessage"];
          v69 = (void *)v17;
          v70 = (void *)v19;
          if (!v15 || !v16 || !v17 || !v74 || !v73 || !v72 || !v18 || !v71 || !v75 || !v19)
          {
            id v32 = PLLogUrsa();
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
          uint64_t v21 = v15;
          if (v15 == (void *)v20) {
            goto LABEL_30;
          }
          uint64_t v22 = (void *)v20;
          uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
          id v24 = v18;
          if (v18 == (void *)v23) {
            goto LABEL_29;
          }
          id v25 = (void *)v23;
          uint64_t v66 = v16;
          id v26 = v12;
          id v27 = v11;
          uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
          if (v75 == (void *)v28)
          {

            id v24 = v25;
            id v12 = v26;
LABEL_29:

            uint64_t v21 = v22;
LABEL_30:

LABEL_31:
            id v32 = PLLogUrsa();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              goto LABEL_32;
            }
            *(_DWORD *)buf = 138412290;
            id v82 = v14;
            v41 = v32;
            v42 = "Null data found in issue: %@";
LABEL_51:
            _os_log_error_impl(&dword_1D2690000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);
            goto LABEL_32;
          }
          int v29 = (void *)v28;
          id v30 = [MEMORY[0x1E4F1CA98] null];

          BOOL v31 = v70 == v30;
          id v11 = v27;
          id v12 = v26;
          id v16 = v66;
          if (v31) {
            goto LABEL_31;
          }
          id v32 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v64 withDate:v65];
          uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "unsignedIntValue"));
          [v32 setObject:v33 forKeyedSubscript:v26];

          v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v18, "BOOLValue"));
          [v32 setObject:v34 forKeyedSubscript:@"isCritical"];

          [v32 setObject:v75 forKeyedSubscript:@"driMessage"];
          [v32 setObject:v70 forKeyedSubscript:@"notificationMessage"];
          uint64_t v35 = [MEMORY[0x1E4F1CA98] null];

          if (v71 == v35)
          {
            double v37 = 0.0;
            uint64_t v38 = v74;
LABEL_35:
            [v32 setObject:v62 forKeyedSubscript:@"timestampInvalid"];
            int v40 = 0;
            goto LABEL_36;
          }
          [v71 doubleValue];
          double v37 = v36;
          uint64_t v38 = v74;
          if (v36 == 0.0) {
            goto LABEL_35;
          }
          v39 = [NSNumber numberWithDouble:v36];
          [v32 setObject:v39 forKeyedSubscript:@"timestampInvalid"];

          int v40 = 1;
LABEL_36:
          id v43 = [MEMORY[0x1E4F1CA98] null];

          if (v66 != v43)
          {
            v44 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v66, "unsignedIntValue"));
            [v32 setObject:v44 forKeyedSubscript:@"impact"];
          }
          v45 = [MEMORY[0x1E4F1CA98] null];

          if (v69 != v45)
          {
            v46 = NSNumber;
            [v69 doubleValue];
            v47 = objc_msgSend(v46, "numberWithDouble:");
            [v32 setObject:v47 forKeyedSubscript:@"timestampStart"];
          }
          v48 = [MEMORY[0x1E4F1CA98] null];

          if (v38 != v48)
          {
            v49 = NSNumber;
            [v38 doubleValue];
            v50 = objc_msgSend(v49, "numberWithDouble:");
            [v32 setObject:v50 forKeyedSubscript:@"timestampEnd"];
          }
          id v51 = [MEMORY[0x1E4F1CA98] null];

          if (v73 != v51)
          {
            uint64_t v52 = objc_msgSend(NSString, "stringWithString:");
            [v32 setObject:v52 forKeyedSubscript:@"hitIn"];
          }
          uint64_t v53 = [MEMORY[0x1E4F1CA98] null];

          if (v72 != v53)
          {
            v54 = objc_msgSend(NSString, "stringWithString:");
            [v32 setObject:v54 forKeyedSubscript:@"fixedIn"];
          }
          v55 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v37];
          v56 = v55;
          if (!v40
            || ([v55 laterDate:v65],
                uint64_t v57 = objc_claimAutoreleasedReturnValue(),
                char v58 = [v57 isEqualToDate:v65],
                v57,
                (v58 & 1) == 0))
          {
            [v63 addObject:v32];
          }

          id v16 = v66;
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

    id v5 = [MEMORY[0x1E4F92A50] sharedInstance];
    stateTrackerForSafeguards = self->_stateTrackerForSafeguards;
    self->_stateTrackerForSafeguards = v5;

    uint64_t v7 = self->_stateTrackerForSafeguards;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke;
    v10[3] = &unk_1E692A250;
    v10[4] = self;
    [(PLStateTrackingComposition *)v7 registerForStates:5 withOperator:self withBlock:v10];
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke_2;
    v9[3] = &unk_1E692A250;
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
  id v2 = *(void **)(a1 + 32);
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
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLStateTrackingComposition *)self->_stateTrackerForSafeguards getCurrState:4];
  id v4 = PLLogComputeSafeguards();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Display state has changed to: %@", (uint8_t *)&v6, 0xCu);
  }

  if ([v3 intValue] == 1) {
    id v5 = &unk_1F29E62B0;
  }
  else {
    id v5 = &unk_1F29E6298;
  }
  [(CSDaemon *)self->_safeguardsDaemon updateContextForIdentifier:@"Display" withState:v5];
}

- (void)updatePluggedInState
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLStateTrackingComposition *)self->_stateTrackerForSafeguards getCurrState:1];
  int v4 = [v3 BOOLValue];

  id v5 = PLLogComputeSafeguards();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "PluggedIn state has changed to: %d", (uint8_t *)v7, 8u);
  }

  if (v4) {
    int v6 = &unk_1F29E62B0;
  }
  else {
    int v6 = &unk_1F29E6298;
  }
  [(CSDaemon *)self->_safeguardsDaemon updateContextForIdentifier:@"PluggedIn" withState:v6];
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

- (_TtC21PowerlogLiteOperators10UrsaClient)ursaClient
{
  return (_TtC21PowerlogLiteOperators10UrsaClient *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUrsaClient:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ursaInvocationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUrsaInvocationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ursaInteractionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUrsaInteractionListener:(id)a3
{
}

- (PLStateTrackingComposition)stateTrackerForSafeguards
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStateTrackerForSafeguards:(id)a3
{
}

- (CSDaemon)safeguardsDaemon
{
  return (CSDaemon *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSafeguardsDaemon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeguardsDaemon, 0);
  objc_storeStrong((id *)&self->_stateTrackerForSafeguards, 0);
  objc_storeStrong((id *)&self->_ursaInteractionListener, 0);
  objc_storeStrong((id *)&self->_ursaInvocationListener, 0);
  objc_storeStrong((id *)&self->_ursaClient, 0);
  objc_storeStrong((id *)&self->_xpcListenerEnergyIssueTrigger, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);
}

@end