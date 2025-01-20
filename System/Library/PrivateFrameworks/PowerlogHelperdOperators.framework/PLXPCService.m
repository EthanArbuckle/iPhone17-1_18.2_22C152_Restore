@interface PLXPCService
+ (id)defaults;
+ (id)entryAggregateDefinitionXPCEvent;
+ (id)entryAggregateDefinitions;
+ (id)entryEventIntervalDefinitionResponderEvent;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventPointDefinitionClientLogging;
+ (id)entryEventPointDefinitionClientLoggingDrops;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSArray)clientIDs;
- (NSDictionary)clientNames;
- (NSDictionary)permissionCache;
- (NSMutableDictionary)registeredListeners;
- (NSMutableDictionary)registeredResponders;
- (OS_xpc_object)xpcConnection;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLNSNotificationOperatorComposition)registrationNotification;
- (PLSemaphore)satelliteProcessSemaphore;
- (PLTimer)resetPermissionsForClientsTimer;
- (PLXPCService)init;
- (id)registeredOperatorFromDictionary:(id)a3 forMessage:(id)a4;
- (signed)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withProcessName:(id)a6;
- (unsigned)responderWaitTime;
- (void)dailyTasks;
- (void)handlePeer:(id)a3 forEvent:(id)a4;
- (void)handlePeerListenerEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8;
- (void)handlePeerResponderEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8;
- (void)handlePeerShouldLogEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7;
- (void)handleSingleMessage:(id)a3 fromPeer:(id)a4 forEvent:(id)a5;
- (void)initOperatorDependancies;
- (void)initSatelliteProcessSemaphore;
- (void)logMessage:(id)a3 withPayload:(id)a4;
- (void)resetPermissionsForClients;
- (void)respondToEvent:(id)a3 withResponse:(id)a4;
- (void)setClientIDs:(id)a3;
- (void)setClientNames:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setPermissionCache:(id)a3;
- (void)setRegisteredListeners:(id)a3;
- (void)setRegisteredResponders:(id)a3;
- (void)setRegistrationNotification:(id)a3;
- (void)setResetPermissionsForClientsTimer:(id)a3;
- (void)setResponderWaitTime:(unsigned int)a3;
- (void)setSatelliteProcessExit;
- (void)setSatelliteProcessExitWithTime:(double)a3;
- (void)setSatelliteProcessSemaphore:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)stopPowerlogHelperd:(id)a3;
@end

@implementation PLXPCService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLXPCService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ClientLogging";
  v3 = [a1 entryEventPointDefinitionClientLogging];
  v7[1] = @"ClientLoggingDrops";
  v8[0] = v3;
  v4 = [a1 entryEventPointDefinitionClientLoggingDrops];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventPointDefinitionClientLoggingDrops
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F40122F8;
  v14[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"clientID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"PLXPCBatchedMessageDropCounts";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionClientLogging
{
  v27[3] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F40122F8;
  v25[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92C28];
  v24[2] = *MEMORY[0x1E4F92C30];
  v24[3] = v3;
  v25[2] = &unk_1F400DCD8;
  v25[3] = &unk_1F400DCF0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v17;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"clientID";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v23[0] = v15;
  v22[1] = @"process-name";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v23[1] = v5;
  v22[2] = @"event";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v23[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v27[1] = v8;
  v26[2] = *MEMORY[0x1E4F92C68];
  v20[0] = @"value";
  uint64_t v18 = *MEMORY[0x1E4F92D10];
  v19 = &unk_1F400DD08;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"unit";
  v21[0] = v9;
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v21[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

  return v13;
}

+ (id)entryEventIntervalDefinitions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabled])
  {
    v6 = @"ResponderEvent";
    uint64_t v3 = [a1 entryEventIntervalDefinitionResponderEvent];
    v7[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (id)entryEventIntervalDefinitionResponderEvent
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F40122F8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"timestampEnd";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_DateFormat");
  v15[0] = v3;
  v14[1] = @"clientID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"process-name";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v15[2] = v7;
  v14[3] = @"event";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryAggregateDefinitions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabledForKey:@"LogAggregateXPC"])
  {
    v6 = @"XPCEvent";
    uint64_t v3 = [a1 entryAggregateDefinitionXPCEvent];
    v7[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (id)entryAggregateDefinitionXPCEvent
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v29[0] = *MEMORY[0x1E4F92CD0];
  v29[1] = v2;
  v30[0] = &unk_1F40122F8;
  v30[1] = MEMORY[0x1E4F1CC28];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v32[0] = v20;
  v31[1] = *MEMORY[0x1E4F92CA8];
  v27[0] = @"clientID";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v28[0] = v18;
  v27[1] = @"process-name";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v28[1] = v16;
  v27[2] = @"event";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v28[2] = v3;
  v27[3] = @"type";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v28[3] = v5;
  v27[4] = @"count";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v28[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  v32[1] = v8;
  v31[2] = *MEMORY[0x1E4F92BE0];
  v25[0] = &unk_1F4012308;
  uint64_t v23 = *MEMORY[0x1E4F92BD8];
  uint64_t v9 = v23;
  v24 = &unk_1F4012318;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v25[1] = &unk_1F4012328;
  v26[0] = v10;
  uint64_t v21 = v9;
  v22 = &unk_1F4012308;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v26[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v31[3] = *MEMORY[0x1E4F92BF0];
  v32[2] = v12;
  v32[3] = &unk_1F4014560;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

  return v13;
}

+ (id)defaults
{
  return &unk_1F4011568;
}

- (PLXPCService)init
{
  v85.receiver = self;
  v85.super_class = (Class)PLXPCService;
  uint64_t v2 = [(PLOperator *)&v85 init];
  if (!v2)
  {
LABEL_40:
    v65 = v2;
    goto LABEL_41;
  }
  uint64_t v3 = objc_opt_new();
  registeredListeners = v2->_registeredListeners;
  v2->_registeredListeners = (NSMutableDictionary *)v3;

  uint64_t v5 = objc_opt_new();
  registeredResponders = v2->_registeredResponders;
  v2->_registeredResponders = (NSMutableDictionary *)v5;

  clientIDs = v2->_clientIDs;
  v2->_clientIDs = (NSArray *)&unk_1F4014578;

  v8 = objc_opt_new();
  uint64_t v9 = v2->_clientIDs;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __20__PLXPCService_init__block_invoke;
  v83[3] = &unk_1E6E47E18;
  id v10 = v8;
  id v84 = v10;
  [(NSArray *)v9 enumerateObjectsUsingBlock:v83];
  objc_storeStrong((id *)&v2->_clientNames, v8);
  if (+[PLUtilities isPowerlogHelperd]) {
    int v11 = 200000;
  }
  else {
    int v11 = 1000000;
  }
  v2->_responderWaitTime = v11;
  uint64_t v12 = getClientPermissions();
  permissionCache = v2->_permissionCache;
  v2->_permissionCache = (NSDictionary *)v12;

  v14 = v2->_permissionCache;
  if ((!v14 || !-[NSDictionary count](v14, "count")) && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    v15 = [NSString stringWithFormat:@"**** unable to load ClientPermissions ****"];
    uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
    v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
    uint64_t v18 = [v17 lastPathComponent];
    v19 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
    [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:229];

    v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
  }
  id v21 = objc_alloc(MEMORY[0x1E4F92A28]);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __20__PLXPCService_init__block_invoke_534;
  v81[3] = &unk_1E6E47908;
  v22 = v2;
  v82 = v22;
  uint64_t v23 = [v21 initWithOperator:v22 forNotification:@"register.PLXPCService" withBlock:v81];
  registrationNotification = v22->_registrationNotification;
  v22->_registrationNotification = (PLNSNotificationOperatorComposition *)v23;

  if (+[PLUtilities isPowerlogHelperd])
  {
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v22 selector:sel_stopPowerlogHelperd_ name:@"PLBatteryGaugeService.stopPowerlogHelperd" object:0];
  }
  if (+[PLUtilities isLiteModeDaemon])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __20__PLXPCService_init__block_invoke_555;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v26;
      if (init_defaultOnce_1 != -1) {
        dispatch_once(&init_defaultOnce_1, block);
      }
      if (init_classDebugEnabled_1)
      {
        v27 = NSString;
        v28 = +[PLUtilities liteModeDaemonName];
        v29 = [v27 stringWithFormat:@"running in %@ with service %s", v28, "com.apple.powerlog.plxpclogger.xpc"];

        v30 = (void *)MEMORY[0x1E4F929B8];
        v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v32 = [v31 lastPathComponent];
        v33 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
        [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:255];

        v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v35 = [(PLOperator *)v22 workQueue];
    v36 = "com.apple.powerlog.plxpclogger.xpc";
LABEL_37:
    xpc_connection_t mach_service = xpc_connection_create_mach_service(v36, v35, 1uLL);
    xpcConnection = v22->_xpcConnection;
    v22->_xpcConnection = mach_service;

    xpc_connection_set_context(v22->_xpcConnection, v22);
    v54 = v22->_xpcConnection;
    v55 = dispatch_get_global_queue(2, 0);
    xpc_connection_set_target_queue(v54, v55);

    v56 = v22->_xpcConnection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __20__PLXPCService_init__block_invoke_574;
    handler[3] = &unk_1E6E4A4A0;
    v57 = v22;
    v77 = v57;
    xpc_connection_set_event_handler(v56, handler);
    xpc_connection_activate(v22->_xpcConnection);
    if (!+[PLUtilities isPowerlogHelperd])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlog.state_changed", 0, 0, 0);
    }
    v59 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
    id v60 = objc_alloc(MEMORY[0x1E4F92A80]);
    v61 = [(PLOperator *)v57 workQueue];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __20__PLXPCService_init__block_invoke_596;
    v74[3] = &unk_1E6E489A8;
    v62 = v57;
    v75 = v62;
    uint64_t v63 = [v60 initWithFireDate:v59 withInterval:1 withTolerance:0 repeats:v61 withUserInfo:v74 withQueue:3600.0 withBlock:0.0];
    resetPermissionsForClientsTimer = v62->_resetPermissionsForClientsTimer;
    v62->_resetPermissionsForClientsTimer = (PLTimer *)v63;

    goto LABEL_40;
  }
  if (+[PLUtilities isFullModeDaemon])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v37 = objc_opt_class();
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __20__PLXPCService_init__block_invoke_562;
      v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v79[4] = v37;
      if (init_defaultOnce_560 != -1) {
        dispatch_once(&init_defaultOnce_560, v79);
      }
      if (init_classDebugEnabled_561)
      {
        v38 = NSString;
        v39 = +[PLUtilities fullModeDaemonName];
        v40 = [v38 stringWithFormat:@"running in %@ with service %s", v39, "com.apple.powerlogd.XPCService.xpc"];

        v41 = (void *)MEMORY[0x1E4F929B8];
        v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v43 = [v42 lastPathComponent];
        v44 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
        [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:259];

        v45 = PLLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v35 = [(PLOperator *)v22 workQueue];
    v36 = "com.apple.powerlogd.XPCService.xpc";
    goto LABEL_37;
  }
  if (+[PLUtilities isPowerlogHelperd])
  {
    [(PLXPCService *)v22 initSatelliteProcessSemaphore];
    if ([(PLOperator *)v22 isDebugEnabled])
    {
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"running in BLDService with service %s", "com.apple.powerlogHelperd.XPCService.xpc");
      v47 = (void *)MEMORY[0x1E4F929B8];
      v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v49 = [v48 lastPathComponent];
      v50 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
      [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:264];

      v51 = PLLogCommon();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
    v35 = [(PLOperator *)v22 workQueue];
    v36 = "com.apple.powerlogHelperd.XPCService.xpc";
    goto LABEL_37;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v67 = objc_opt_class();
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __20__PLXPCService_init__block_invoke_570;
    v78[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v78[4] = v67;
    if (init_defaultOnce_568 != -1) {
      dispatch_once(&init_defaultOnce_568, v78);
    }
    if (init_classDebugEnabled_569)
    {
      v68 = [NSString stringWithFormat:@"Bad processname, no xpc for you"];
      v69 = (void *)MEMORY[0x1E4F929B8];
      v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v71 = [v70 lastPathComponent];
      v72 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
      [v69 logMessage:v68 fromFile:v71 fromFunction:v72 fromLineNumber:267];

      v73 = PLLogCommon();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }

  v65 = 0;
LABEL_41:

  return v65;
}

void __20__PLXPCService_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __20__PLXPCService_init__block_invoke_534(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __20__PLXPCService_init__block_invoke_2;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v10;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_defaultOnce, &block);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_classDebugEnabled)
    {
      int v11 = NSString;
      uint64_t v12 = [v7 objectForKeyedSubscript:@"type"];
      v13 = [v7 objectForKeyedSubscript:@"registration"];
      v14 = [v11 stringWithFormat:@"registration of type %@ of key %@ for %@", v12, v13, v9, block, v28, v29, v30, v31];

      v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:233];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v20 = [v7 objectForKeyedSubscript:@"type"];
  uint64_t v21 = [v20 caseInsensitiveCompare:@"Post"];

  if (!v21)
  {
    v24 = [*(id *)(a1 + 32) registeredListeners];
    objc_sync_enter(v24);
    v25 = [*(id *)(a1 + 32) registeredListeners];
    uint64_t v26 = [v7 objectForKeyedSubscript:@"registration"];
    [v25 setObject:v9 forKeyedSubscript:v26];
    goto LABEL_12;
  }
  v22 = [v7 objectForKeyedSubscript:@"type"];
  uint64_t v23 = [v22 caseInsensitiveCompare:@"Query"];

  if (!v23)
  {
    v24 = [*(id *)(a1 + 32) registeredResponders];
    objc_sync_enter(v24);
    v25 = [*(id *)(a1 + 32) registeredResponders];
    uint64_t v26 = [v7 objectForKeyedSubscript:@"registration"];
    [v25 setObject:v9 forKeyedSubscript:v26];
LABEL_12:

    objc_sync_exit(v24);
  }
}

uint64_t __20__PLXPCService_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_555(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_1 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_562(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_561 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_570(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_569 = result;
  return result;
}

void __20__PLXPCService_init__block_invoke_574(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__PLXPCService_init__block_invoke_2_575;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_defaultOnce, block);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_classDebugEnabled)
    {
      uint64_t v5 = NSString;
      id v6 = [*(id *)(a1 + 32) xpcConnection];
      id v7 = [v5 stringWithFormat:@"event handler fired peerPID=%d %@", xpc_connection_get_pid(v6), v3];

      id v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v10 = [v9 lastPathComponent];
      int v11 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:277];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (MEMORY[0x1E4E7F750](v3) != MEMORY[0x1E4F145A8])
  {
    v13 = (_xpc_connection_s *)v3;
    context = xpc_connection_get_context(*(xpc_connection_t *)(*(void *)(a1 + 32) + 56));
    xpc_connection_set_context(v13, context);
    v15 = dispatch_get_global_queue(2, 0);
    xpc_connection_set_target_queue(v13, v15);

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __20__PLXPCService_init__block_invoke_585;
    handler[3] = &unk_1E6E4A478;
    v24 = *(id *)(a1 + 32);
    v25 = v13;
    uint64_t v16 = v13;
    xpc_connection_set_event_handler(v16, handler);
    xpc_connection_activate(v16);

    v17 = v24;
LABEL_10:

    goto LABEL_17;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __20__PLXPCService_init__block_invoke_581;
    void v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v18;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_defaultOnce_579 != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_defaultOnce_579, v26);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_classDebugEnabled_580)
    {
      uint64_t v16 = [NSString stringWithFormat:@"XPC error! %@", v3];
      v19 = (void *)MEMORY[0x1E4F929B8];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke_2"];
      [v19 logMessage:v16 fromFile:v21 fromFunction:v22 fromLineNumber:280];

      v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_10;
    }
  }
LABEL_17:
}

uint64_t __20__PLXPCService_init__block_invoke_2_575(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_2_classDebugEnabled_580 = result;
  return result;
}

void __20__PLXPCService_init__block_invoke_585(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F929C0];
  id v4 = a2;
  if ([v3 debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __20__PLXPCService_init__block_invoke_2_586;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v5;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_3_defaultOnce, &block);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_3_classDebugEnabled)
    {
      id v6 = NSString;
      uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
      id v8 = objc_msgSend(v6, "stringWithFormat:", @"peer(%d) connected", pid, block, v16, v17, v18, v19);
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      int v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:288];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v14 = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
  [v14 handlePeer:*(void *)(a1 + 40) forEvent:v4];
}

uint64_t __20__PLXPCService_init__block_invoke_2_586(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_596(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetPermissionsForClients];
}

- (void)initOperatorDependancies
{
  if ([(PLOperator *)self isDebugEnabledForKey:@"LogAggregateXPC"])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92A28]);
    id v4 = +[PLUtilities workQueueForClass:objc_opt_class()];
    uint64_t v5 = *MEMORY[0x1E4F1C2E0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __40__PLXPCService_initOperatorDependancies__block_invoke;
    v7[3] = &unk_1E6E47908;
    v7[4] = self;
    id v6 = (void *)[v3 initWithWorkQueue:v4 forNotification:v5 withBlock:v7];

    [(PLXPCService *)self setDailyTaskNotification:v6];
  }
}

uint64_t __40__PLXPCService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __40__PLXPCService_initOperatorDependancies__block_invoke_2;
    v14 = &unk_1E6E4A300;
    v15 = @"DailyTasks";
    uint64_t v16 = v2;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_4_defaultOnce, &v11);
    }
    int v3 = kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_4_classDebugEnabled;

    if (v3)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"DailyTasks notification!", v11, v12, v13, v14);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLXPCService initOperatorDependancies]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:313];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dailyTasks", v11, v12, v13, v14);
}

uint64_t __40__PLXPCService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_4_classDebugEnabled = result;
  return result;
}

- (void)initSatelliteProcessSemaphore
{
  int v3 = [MEMORY[0x1E4F92A48] sharedSemaphoreForKey:*MEMORY[0x1E4F92D80]];
  satelliteProcessSemaphore = self->_satelliteProcessSemaphore;
  self->_satelliteProcessSemaphore = v3;

  uint64_t v5 = [(PLXPCService *)self satelliteProcessSemaphore];
  [v5 setTimeout:100.0];

  id v6 = [(PLXPCService *)self satelliteProcessSemaphore];
  [v6 signalStartListening];
}

- (void)dailyTasks
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v3 dateByAddingTimeInterval:-86400.0];
  id v5 = v3;
  [v4 timeIntervalSince1970];
  double v7 = v6;
  [v5 timeIntervalSince1970];
  double v9 = v8;

  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"XPCEvent"];
  uint64_t v11 = [(PLOperator *)self storage];
  uint64_t v12 = objc_msgSend(v11, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v10, 3600.0, v7, v9 - v7);

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __26__PLXPCService_dailyTasks__block_invoke;
  v44[3] = &unk_1E6E47848;
  v44[4] = self;
  v36 = (void *)v10;
  uint64_t v37 = v5;
  if (dailyTasks_defaultOnce != -1) {
    dispatch_once(&dailyTasks_defaultOnce, v44);
  }
  uint64_t v13 = dailyTasks_objectForKey;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * v17);
        uint64_t v19 = [v18 objectForKeyedSubscript:@"count"];
        uint64_t v20 = [v19 longValue];

        if (v20 > v13)
        {
          uint64_t v21 = NSString;
          v22 = [v18 objectForKeyedSubscript:@"type"];
          uint64_t v23 = [v18 objectForKeyedSubscript:@"clientID"];
          v24 = [v18 objectForKeyedSubscript:@"process-name"];
          v25 = [v18 objectForKeyedSubscript:@"event"];
          uint64_t v26 = [v21 stringWithFormat:@"com.apple.power.xpc.highRatePerHour.%@.%@.%@.%@", v22, v23, v24, v25, v36, v37];

          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v27 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __26__PLXPCService_dailyTasks__block_invoke_2;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v27;
            if (dailyTasks_defaultOnce_610 != -1) {
              dispatch_once(&dailyTasks_defaultOnce_610, block);
            }
            if (dailyTasks_classDebugEnabled)
            {
              uint64_t v28 = NSString;
              v29 = [v18 objectForKeyedSubscript:@"count"];
              v30 = [v28 stringWithFormat:@"Reporting %@ crossing ratePerHourThreshold with %@", v26, v29];

              uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
              v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
              v33 = [v32 lastPathComponent];
              v34 = [NSString stringWithUTF8String:"-[PLXPCService dailyTasks]"];
              [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:338];

              v35 = PLLogCommon();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v30;
                _os_log_debug_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
          MEMORY[0x1E4E7E330](v26, 1);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v15);
  }
}

uint64_t __26__PLXPCService_dailyTasks__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ratePerHourThreshold"];
  dailyTasks_objectForKey = result;
  return result;
}

uint64_t __26__PLXPCService_dailyTasks__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  dailyTasks_classDebugEnabled = result;
  return result;
}

- (id)registeredOperatorFromDictionary:(id)a3 forMessage:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [&unk_1F4014590 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(&unk_1F4014590);
        }
        uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];
        [v7 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [&unk_1F4014590 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v8);
  }
  id v13 = v5;
  objc_sync_enter(v13);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v14 = [&unk_1F4014590 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
LABEL_10:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(&unk_1F4014590);
      }
      uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * v16);
      uint64_t v18 = [v13 objectForKeyedSubscript:v7];
      if (v18) {
        break;
      }
      [v7 removeObjectForKey:v17];
      if (v14 == ++v16)
      {
        uint64_t v14 = [&unk_1F4014590 countByEnumeratingWithState:&v29 objects:v40 count:16];
        if (v14) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v19 = [&unk_1F4014590 countByEnumeratingWithState:&v25 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
LABEL_18:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(&unk_1F4014590);
        }
        uint64_t v37 = *(void *)(*((void *)&v25 + 1) + 8 * v21);
        v22 = objc_msgSend(v6, "objectForKeyedSubscript:");
        v38 = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        uint64_t v18 = [v13 objectForKeyedSubscript:v23];

        if (v18) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [&unk_1F4014590 countByEnumeratingWithState:&v25 objects:v39 count:16];
          uint64_t v18 = 0;
          if (v19) {
            goto LABEL_18;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  objc_sync_exit(v13);

  return v18;
}

- (void)respondToEvent:(id)a3 withResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v8;
      if (respondToEvent_withResponse__defaultOnce != -1) {
        dispatch_once(&respondToEvent_withResponse__defaultOnce, v44);
      }
      if (respondToEvent_withResponse__classDebugEnabled)
      {
        uint64_t v9 = [NSString stringWithFormat:@"empty response"];
        uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v12 = [v11 lastPathComponent];
        id v13 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:378];

        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }
  if ([(PLOperator *)self isDebugEnabled])
  {
    uint64_t v15 = [NSString stringWithFormat:@"adding debug to response"];
    uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
    uint64_t v18 = [v17 lastPathComponent];
    uint64_t v19 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
    [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:383];

    uint64_t v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

    uint64_t v21 = (void *)[v7 mutableCopy];
    v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PLOperator isDebugEnabled](self, "isDebugEnabled"));
    [v21 setObject:v22 forKeyedSubscript:@"PLXPCClientDebug"];

    id v7 = v21;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  v24 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  xpc_dictionary_set_value(reply, (const char *)[@"PLXPCConnectionReturnDict" UTF8String], v24);
  xpc_dictionary_get_remote_connection(v6);
  long long v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  long long v26 = v25;
  if (v25)
  {
    xpc_connection_send_message(v25, reply);
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v27 = objc_opt_class();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke_631;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v27;
    if (respondToEvent_withResponse__defaultOnce_629 != -1) {
      dispatch_once(&respondToEvent_withResponse__defaultOnce_629, v43);
    }
    if (respondToEvent_withResponse__classDebugEnabled_630)
    {
      uint64_t v28 = [NSString stringWithFormat:@"remote connection missing"];
      long long v41 = (void *)MEMORY[0x1E4F929B8];
      long long v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      long long v30 = [v29 lastPathComponent];
      long long v31 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
      [v41 logMessage:v28 fromFile:v30 fromFunction:v31 fromLineNumber:397];

      long long v32 = (void *)v28;
      long long v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke_637;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v34;
    if (respondToEvent_withResponse__defaultOnce_635 != -1) {
      dispatch_once(&respondToEvent_withResponse__defaultOnce_635, block);
    }
    if (respondToEvent_withResponse__classDebugEnabled_636)
    {
      long long v35 = [NSString stringWithFormat:@"responded to event! event=%@ response=%@ replyMessage=%@", v6, v7, reply];
      long long v36 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:400];

      long long v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  respondToEvent_withResponse__classDebugEnabled = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke_631(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  respondToEvent_withResponse__classDebugEnabled_630 = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke_637(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  respondToEvent_withResponse__classDebugEnabled_636 = result;
  return result;
}

- (void)logMessage:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __39__PLXPCService_logMessage_withPayload___block_invoke;
      v30[3] = &unk_1E6E4A300;
      long long v31 = @"Listener";
      uint64_t v32 = v8;
      if (logMessage_withPayload__defaultOnce != -1) {
        dispatch_once(&logMessage_withPayload__defaultOnce, v30);
      }
      int v9 = logMessage_withPayload__classDebugEnabled;

      if (v9)
      {
        uint64_t v10 = [NSString stringWithFormat:@"No registered Listener"];
        uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        id v13 = [v12 lastPathComponent];
        uint64_t v14 = [NSString stringWithUTF8String:"-[PLXPCService logMessage:withPayload:]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:413];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    uint64_t v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ClientLogging"];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
    [v17 setObjectsFromRawData:v6];
    [v17 setDynamicObjectsFromRawData:v7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLXPCService_logMessage_withPayload___block_invoke_652;
    block[3] = &unk_1E6E4A4C8;
    uint64_t v28 = @"dynamicClientLogging";
    char v29 = 1;
    if (logMessage_withPayload__defaultOnce_651 != -1) {
      dispatch_once(&logMessage_withPayload__defaultOnce_651, block);
    }
    int v18 = logMessage_withPayload__objectForKey;

    if (v18)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v19 = objc_opt_class();
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        void v26[2] = __39__PLXPCService_logMessage_withPayload___block_invoke_2;
        void v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v26[4] = v19;
        if (logMessage_withPayload__defaultOnce_653 != -1) {
          dispatch_once(&logMessage_withPayload__defaultOnce_653, v26);
        }
        if (logMessage_withPayload__classDebugEnabled_654)
        {
          uint64_t v20 = [NSString stringWithFormat:@"entry=%@", v17];
          uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
          v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          uint64_t v23 = [v22 lastPathComponent];
          v24 = [NSString stringWithUTF8String:"-[PLXPCService logMessage:withPayload:]"];
          [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:419];

          long long v25 = PLLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      [(PLOperator *)self logEntry:v17];
    }
  }
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  logMessage_withPayload__classDebugEnabled = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke_652(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  logMessage_withPayload__objectForKey = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logMessage_withPayload__classDebugEnabled_654 = result;
  return result;
}

- (signed)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withProcessName:(id)a6
{
  int v8 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (__CFString *)a6;
  id v13 = [(PLXPCService *)self clientIDs];
  unint64_t v14 = [v13 count];

  if (v14 <= v8)
  {
    uint64_t v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109890;
      int v47 = v8;
      __int16 v48 = 2112;
      id v49 = v10;
      __int16 v50 = 2112;
      id v51 = v11;
      __int16 v52 = 2112;
      v53 = v12;
      _os_log_fault_impl(&dword_1E4220000, v16, OS_LOG_TYPE_FAULT, "Invalid client ID %d request for key : %@, type : %@, processName %@", buf, 0x26u);
    }
    signed __int16 v24 = 0;
  }
  else
  {
    uint64_t v15 = [(PLXPCService *)self clientIDs];
    uint64_t v16 = [v15 objectAtIndexedSubscript:v8];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      long long v43 = __71__PLXPCService_permissionForClientID_withKey_withType_withProcessName___block_invoke;
      v44 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v45 = v17;
      if (permissionForClientID_withKey_withType_withProcessName__defaultOnce != -1) {
        dispatch_once(&permissionForClientID_withKey_withType_withProcessName__defaultOnce, &block);
      }
      if (permissionForClientID_withKey_withType_withProcessName__classDebugEnabled)
      {
        int v18 = objc_msgSend(NSString, "stringWithFormat:", @"PLXPCService: permissionForClientID:%hd", v8, block, v42, v43, v44, v45);
        uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLXPCService permissionForClientID:withKey:withType:withProcessName:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:439];

        uint64_t v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (+[PLUtilities isPowerlogHelperd])
    {
      signed __int16 v24 = 1;
    }
    else
    {
      long long v25 = [(PLXPCService *)self permissionCache];
      long long v26 = [v25 objectForKeyedSubscript:v11];
      uint64_t v27 = [v26 objectForKeyedSubscript:v16];
      uint64_t v28 = [v27 objectForKeyedSubscript:@"__PL__Global"];

      char v29 = [(PLXPCService *)self permissionCache];
      long long v30 = [v29 objectForKeyedSubscript:v11];
      long long v31 = [v30 objectForKeyedSubscript:v16];
      uint64_t v32 = v31;
      if (v28)
      {
        long long v33 = [v31 objectForKeyedSubscript:@"__PL__Global"];
        signed __int16 v24 = [v33 BOOLValue];
      }
      else
      {
        uint64_t v34 = [v31 objectForKeyedSubscript:v10];
        long long v35 = [v34 objectForKeyedSubscript:@"__PL__Global"];

        char v29 = [(PLXPCService *)self permissionCache];
        long long v30 = [v29 objectForKeyedSubscript:v11];
        uint64_t v32 = [v30 objectForKeyedSubscript:v16];
        long long v36 = [v32 objectForKeyedSubscript:v10];
        long long v33 = v36;
        if (v35)
        {
          uint64_t v37 = @"__PL__Global";
        }
        else
        {
          v38 = [v36 objectForKeyedSubscript:v12];

          if (!v38)
          {
            signed __int16 v24 = [MEMORY[0x1E4F929C0] fullMode];
            goto LABEL_22;
          }
          char v29 = [(PLXPCService *)self permissionCache];
          long long v30 = [v29 objectForKeyedSubscript:v11];
          uint64_t v32 = [v30 objectForKeyedSubscript:v16];
          long long v36 = [v32 objectForKeyedSubscript:v10];
          long long v33 = v36;
          uint64_t v37 = v12;
        }
        v39 = [v36 objectForKeyedSubscript:v37];
        signed __int16 v24 = [v39 BOOLValue];
      }
    }
  }
LABEL_22:

  return v24;
}

uint64_t __71__PLXPCService_permissionForClientID_withKey_withType_withProcessName___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  permissionForClientID_withKey_withType_withProcessName__classDebugEnabled = result;
  return result;
}

- (void)resetPermissionsForClients
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (resetPermissionsForClients_defaultOnce != -1) {
      dispatch_once(&resetPermissionsForClients_defaultOnce, block);
    }
    if (resetPermissionsForClients_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"resetPermissionsForClients start!"];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLXPCService resetPermissionsForClients]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:467];

      int v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  id v10 = [(PLXPCService *)self permissionCache];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_667;
  void v19[3] = &unk_1E6E49ED8;
  v19[4] = self;
  [v10 enumerateKeysAndObjectsUsingBlock:v19];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_677;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v11;
    if (resetPermissionsForClients_defaultOnce_675 != -1) {
      dispatch_once(&resetPermissionsForClients_defaultOnce_675, v18);
    }
    if (resetPermissionsForClients_classDebugEnabled_676)
    {
      uint64_t v12 = [NSString stringWithFormat:@"resetPermissionsForClients done!"];
      id v13 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLXPCService resetPermissionsForClients]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:478];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  resetPermissionsForClients_classDebugEnabled = result;
  return result;
}

void __42__PLXPCService_resetPermissionsForClients__block_invoke_667(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 allKeys];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_2;
  v5[3] = &unk_1E6E47E18;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __42__PLXPCService_resetPermissionsForClients__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4E7EF70]();
  id v5 = NSString;
  id v6 = [*(id *)(a1 + 32) clientNames];
  id v7 = [v6 objectForKeyedSubscript:v3];
  int v8 = [v5 stringWithFormat:@"%@.ClientID.%@", @"com.apple.powerlog.state_changed", v7];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 0);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v10;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_5_defaultOnce != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_5_defaultOnce, block);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_5_classDebugEnabled)
    {
      uint64_t v11 = [NSString stringWithFormat:@"resetPermissionsForClients posted %@", v8];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      unint64_t v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLXPCService resetPermissionsForClients]_block_invoke_2"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:474];

      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_5_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke_677(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  resetPermissionsForClients_classDebugEnabled_676 = result;
  return result;
}

- (void)handlePeer:(id)a3 forEvent:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1E4E7F750]();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v9;
    if (handlePeer_forEvent__defaultOnce != -1) {
      dispatch_once(&handlePeer_forEvent__defaultOnce, block);
    }
    if (handlePeer_forEvent__classDebugEnabled)
    {
      uint64_t v10 = [NSString stringWithFormat:@"!!! %s/%d: type=%@, event=%@", "-[PLXPCService handlePeer:forEvent:]", 487, v8, v7];
      uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v13 = [v12 lastPathComponent];
      unint64_t v14 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:487];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v8 == MEMORY[0x1E4F145A8])
  {
    if (v7 == (id)MEMORY[0x1E4F14528])
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_67;
      }
      uint64_t v50 = objc_opt_class();
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_686;
      v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v97[4] = v50;
      if (handlePeer_forEvent__defaultOnce_684 != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce_684, v97);
      }
      if (!handlePeer_forEvent__classDebugEnabled_685) {
        goto LABEL_67;
      }
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"peer(%d) received XPC_ERROR_CONNECTION_INVALID", xpc_connection_get_pid(v6));
      id v51 = (void *)MEMORY[0x1E4F929B8];
      __int16 v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v53 = [v52 lastPathComponent];
      uint64_t v54 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
      [v51 logMessage:v44 fromFile:v53 fromFunction:v54 fromLineNumber:492];

      id v49 = PLLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
    else if (v7 == (id)MEMORY[0x1E4F14520])
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_67;
      }
      uint64_t v61 = objc_opt_class();
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_692;
      v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v96[4] = v61;
      if (handlePeer_forEvent__defaultOnce_690 != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce_690, v96);
      }
      if (!handlePeer_forEvent__classDebugEnabled_691) {
        goto LABEL_67;
      }
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", xpc_connection_get_pid(v6));
      v62 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v64 = [v63 lastPathComponent];
      v65 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
      [v62 logMessage:v44 fromFile:v64 fromFunction:v65 fromLineNumber:496];

      id v49 = PLLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
    else
    {
      id v41 = (id)MEMORY[0x1E4F14550];
      int v42 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v7 == v41)
      {
        if (!v42) {
          goto LABEL_67;
        }
        uint64_t v66 = objc_opt_class();
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_698;
        v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v95[4] = v66;
        if (handlePeer_forEvent__defaultOnce_696 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_696, v95);
        }
        if (!handlePeer_forEvent__classDebugEnabled_697) {
          goto LABEL_67;
        }
        v44 = objc_msgSend(NSString, "stringWithFormat:", @"peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", xpc_connection_get_pid(v6));
        uint64_t v67 = (void *)MEMORY[0x1E4F929B8];
        v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v69 = [v68 lastPathComponent];
        v70 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
        [v67 logMessage:v44 fromFile:v69 fromFunction:v70 fromLineNumber:500];

        id v49 = PLLogCommon();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
      else
      {
        if (!v42) {
          goto LABEL_67;
        }
        uint64_t v43 = objc_opt_class();
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_704;
        v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v94[4] = v43;
        if (handlePeer_forEvent__defaultOnce_702 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_702, v94);
        }
        if (!handlePeer_forEvent__classDebugEnabled_703) {
          goto LABEL_67;
        }
        v44 = [NSString stringWithFormat:@"peer(%d) received Unidentified error:%@", xpc_connection_get_pid(v6), v7];
        uint64_t v45 = (void *)MEMORY[0x1E4F929B8];
        v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        int v47 = [v46 lastPathComponent];
        __int16 v48 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
        [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:505];

        id v49 = PLLogCommon();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }

LABEL_67:
    xpc_connection_cancel(v6);
    goto LABEL_83;
  }
  if (v8 == MEMORY[0x1E4F14590])
  {
    uint64_t v16 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    uint64_t v17 = [v16 objectForKeyedSubscript:@"content"];
    if (!v16)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        v55 = [NSString stringWithFormat:@"no message"];
        v56 = (void *)MEMORY[0x1E4F929B8];
        v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v58 = [v57 lastPathComponent];
        v59 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
        [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:549];

        id v60 = PLLogCommon();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
      if (+[PLUtilities isPowerlogHelperd]) {
        [(PLXPCService *)self setSatelliteProcessExitWithTime:10.0];
      }
      goto LABEL_82;
    }
    int v18 = [v16 objectForKeyedSubscript:@"clientID"];
    int v19 = [v18 shortValue];

    if (v19 == 110)
    {
      v71 = [v17 objectForKey:@"PLXPCBatchedMessage"];

      if (v71)
      {
        id v29 = [v17 objectForKeyedSubscript:@"PLXPCBatchedMessage"];
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_727;
        v85[3] = &unk_1E6E48C28;
        v85[4] = self;
        v86 = v6;
        id v87 = v7;
        [v29 enumerateKeysAndObjectsUsingBlock:v85];

LABEL_81:
        goto LABEL_82;
      }
    }
    else if ((unsigned __int16)v19 == 51)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v20 = objc_opt_class();
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_713;
        v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v93[4] = v20;
        if (handlePeer_forEvent__defaultOnce_711 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_711, v93);
        }
        if (handlePeer_forEvent__classDebugEnabled_712)
        {
          uint64_t v21 = [NSString stringWithFormat:@"Got a batched message %@", v16];
          v22 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          signed __int16 v24 = [v23 lastPathComponent];
          long long v25 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:517];

          long long v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      uint64_t v27 = [v17 objectForKeyedSubscript:@"PLXPCBatchedMessage"];
      uint64_t v28 = [v17 objectForKeyedSubscript:@"PLXPCBatchedMessageDropCounts"];
      int v83 = [v28 intValue];

      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v29 = v27;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v89 objects:v99 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v90 != v32) {
              objc_enumerationMutation(v29);
            }
            [(PLXPCService *)self handleSingleMessage:*(void *)(*((void *)&v89 + 1) + 8 * i) fromPeer:v6 forEvent:v7];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v89 objects:v99 count:16];
        }
        while (v31);
      }

      uint64_t v34 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ClientLoggingDrops"];
      long long v35 = (void *)MEMORY[0x1E4F929E0];
      long long v36 = [(PLOperator *)self className];
      LODWORD(v35) = [v35 isEntryKeySetup:v34 forOperatorName:v36];

      if (v35) {
        BOOL v37 = v83 < 1;
      }
      else {
        BOOL v37 = 1;
      }
      if (!v37)
      {
        if ([v29 count])
        {
          v38 = [v29 objectAtIndexedSubscript:0];
          v39 = [v38 objectForKeyedSubscript:@"clientID"];
          uint64_t v40 = [v39 shortValue];
        }
        else
        {
          uint64_t v40 = 0;
        }
        v82 = v34;
        v72 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v34];
        v73 = [MEMORY[0x1E4F28ED0] numberWithInt:v83];
        [v72 setObject:v73 forKeyedSubscript:@"PLXPCBatchedMessageDropCounts"];

        v74 = [MEMORY[0x1E4F28ED0] numberWithShort:v40];
        [v72 setObject:v74 forKeyedSubscript:@"clientID"];

        [(PLOperator *)self logEntry:v72];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v75 = objc_opt_class();
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_723;
          v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v88[4] = v75;
          if (handlePeer_forEvent__defaultOnce_721 != -1) {
            dispatch_once(&handlePeer_forEvent__defaultOnce_721, v88);
          }
          if (handlePeer_forEvent__classDebugEnabled_722)
          {
            uint64_t v76 = [NSString stringWithFormat:@"Dropped messages %@", v72];
            id v84 = (void *)MEMORY[0x1E4F929B8];
            v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
            v78 = [v77 lastPathComponent];
            v79 = (void *)v76;
            v80 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
            [v84 logMessage:v79 fromFile:v78 fromFunction:v80 fromLineNumber:534];

            v81 = PLLogCommon();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }

        uint64_t v34 = v82;
      }

      goto LABEL_81;
    }
    [(PLXPCService *)self handleSingleMessage:v16 fromPeer:v6 forEvent:v7];
LABEL_82:
  }
LABEL_83:
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_686(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_685 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_692(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_691 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_698(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_697 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_704(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_703 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_713(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_712 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_723(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_722 = result;
  return result;
}

void __36__PLXPCService_handlePeer_forEvent___block_invoke_727(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) handleSingleMessage:*(void *)(*((void *)&v9 + 1) + 8 * v8++) fromPeer:*(void *)(a1 + 40) forEvent:*(void *)(a1 + 48)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)handleSingleMessage:(id)a3 fromPeer:(id)a4 forEvent:(id)a5
{
  id v8 = a3;
  long long v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  long long v11 = [v8 objectForKeyedSubscript:@"clientID"];
  uint64_t v12 = [v11 shortValue];

  id v13 = [v8 objectForKeyedSubscript:@"process-name"];
  uint64_t v14 = [v8 objectForKeyedSubscript:@"event"];
  if (+[PLUtilities isPowerlogHelperd])
  {
    if (v12 != 48)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v29 = objc_opt_class();
        v131[0] = MEMORY[0x1E4F143A8];
        v131[1] = 3221225472;
        v131[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke;
        v131[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v131[4] = v29;
        if (handleSingleMessage_fromPeer_forEvent__defaultOnce != -1) {
          dispatch_once(&handleSingleMessage_fromPeer_forEvent__defaultOnce, v131);
        }
        if (handleSingleMessage_fromPeer_forEvent__classDebugEnabled)
        {
          unsigned int v115 = v12;
          v110 = v13;
          id v30 = v10;
          v120 = v9;
          uint64_t v31 = [NSString stringWithFormat:@"!!! %s/%d: message=%@", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 571, v8];
          uint64_t v32 = (void *)MEMORY[0x1E4F929B8];
          long long v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          uint64_t v34 = [v33 lastPathComponent];
          long long v35 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:571];

          long long v36 = PLLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          long long v9 = v120;
          id v10 = v30;
          id v13 = v110;
          uint64_t v12 = v115;
        }
      }
      double v28 = 30.0;
      goto LABEL_20;
    }
    uint64_t v15 = v9;
    uint64_t v16 = [v8 objectForKeyedSubscript:@"content"];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"battery_gauge_event"];
    int v18 = [v17 intValue];

    int v19 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v18 == 1)
    {
      long long v9 = v15;
      uint64_t v12 = 48;
      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        v130[0] = MEMORY[0x1E4F143A8];
        v130[1] = 3221225472;
        v130[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_740;
        v130[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v130[4] = v20;
        if (handleSingleMessage_fromPeer_forEvent__defaultOnce_738 != -1) {
          dispatch_once(&handleSingleMessage_fromPeer_forEvent__defaultOnce_738, v130);
        }
        if (handleSingleMessage_fromPeer_forEvent__classDebugEnabled_739)
        {
          v109 = v13;
          id v21 = v10;
          v119 = v15;
          v22 = [NSString stringWithFormat:@"!!! %s/%d: message=%@", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 577, v8];
          uint64_t v23 = (void *)MEMORY[0x1E4F929B8];
          signed __int16 v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          long long v25 = [v24 lastPathComponent];
          long long v26 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:577];

          uint64_t v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          long long v9 = v119;
          id v10 = v21;
          id v13 = v109;
          uint64_t v12 = 48;
        }
      }
      double v28 = 100.0;
LABEL_20:
      [(PLXPCService *)self setSatelliteProcessExitWithTime:v28];
      goto LABEL_21;
    }
    long long v9 = v15;
    uint64_t v12 = 48;
    if (v19)
    {
      uint64_t v72 = objc_opt_class();
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_743;
      v129[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v129[4] = v72;
      if (handleSingleMessage_fromPeer_forEvent__defaultOnce_741 != -1) {
        dispatch_once(&handleSingleMessage_fromPeer_forEvent__defaultOnce_741, v129);
      }
      if (handleSingleMessage_fromPeer_forEvent__classDebugEnabled_742)
      {
        v113 = v13;
        id v73 = v10;
        v122 = v15;
        v74 = [NSString stringWithFormat:@"!!! %s/%d: message=%@", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 582, v8];
        uint64_t v75 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v76 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v77 = [v76 lastPathComponent];
        v78 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
        [v75 logMessage:v74 fromFile:v77 fromFunction:v78 fromLineNumber:582];

        v79 = PLLogCommon();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        long long v9 = v122;
        id v10 = v73;
        id v13 = v113;
        uint64_t v12 = 48;
      }
    }
  }
LABEL_21:
  BOOL v37 = [v8 objectForKey:@"shouldLog"];

  if (v37)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v38 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_749;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v38;
      if (handleSingleMessage_fromPeer_forEvent__defaultOnce_747 != -1) {
        dispatch_once(&handleSingleMessage_fromPeer_forEvent__defaultOnce_747, block);
      }
      if (handleSingleMessage_fromPeer_forEvent__classDebugEnabled_748)
      {
        unsigned int v116 = v12;
        v106 = self;
        v39 = v14;
        uint64_t v40 = v13;
        id v41 = v10;
        v121 = v9;
        int v42 = [NSString stringWithFormat:@"Should log request(%d): %@", xpc_connection_get_pid(v9), v8];
        uint64_t v43 = (void *)MEMORY[0x1E4F929B8];
        v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v45 = [v44 lastPathComponent];
        v46 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
        [v43 logMessage:v42 fromFile:v45 fromFunction:v46 fromLineNumber:588];

        int v47 = PLLogCommon();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        id v10 = v41;
        id v13 = v40;
        uint64_t v14 = v39;
        self = v106;
        long long v9 = v121;
        uint64_t v12 = v116;
      }
    }
    [(PLXPCService *)self handlePeerShouldLogEvent:v10 withMessage:v8 withClientID:v12 withProcessName:v13 withKey:v14];
    __int16 v48 = @"shouldLog";
  }
  else
  {
    id v49 = [v8 objectForKeyedSubscript:@"content"];
    uint64_t v50 = [v8 objectForKey:@"Query"];

    if (v50)
    {
      if (!+[PLUtilities allowQueryFromPeer:v9])
      {
LABEL_70:

        goto LABEL_71;
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v51 = objc_opt_class();
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_755;
        v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v127[4] = v51;
        if (handleSingleMessage_fromPeer_forEvent__defaultOnce_753 != -1) {
          dispatch_once(&handleSingleMessage_fromPeer_forEvent__defaultOnce_753, v127);
        }
        if (handleSingleMessage_fromPeer_forEvent__classDebugEnabled_754)
        {
          v103 = v49;
          v107 = self;
          unsigned int v117 = v12;
          v111 = v14;
          __int16 v52 = v13;
          id v53 = v10;
          uint64_t v54 = [NSString stringWithFormat:@"Response request(%d): %@", xpc_connection_get_pid(v9), v8];
          v55 = (void *)MEMORY[0x1E4F929B8];
          v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v57 = [v56 lastPathComponent];
          v58 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:599];

          v59 = PLLogCommon();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          id v10 = v53;
          id v13 = v52;
          self = v107;
          uint64_t v14 = v111;
          uint64_t v12 = v117;
          id v49 = v103;
        }
      }
      [(PLXPCService *)self handlePeerResponderEvent:v10 withMessage:v8 withClientID:v12 withProcessName:v13 withKey:v14 withPayload:v49];
      id v60 = v49;
      __int16 v48 = @"Query";
    }
    else
    {
      uint64_t v61 = [v8 objectForKey:@"Post"];

      int v62 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v61)
      {
        if (v62)
        {
          uint64_t v63 = objc_opt_class();
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_761;
          v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v126[4] = v63;
          if (handleSingleMessage_fromPeer_forEvent__defaultOnce_759 != -1) {
            dispatch_once(&handleSingleMessage_fromPeer_forEvent__defaultOnce_759, v126);
          }
          if (handleSingleMessage_fromPeer_forEvent__classDebugEnabled_760)
          {
            v104 = v49;
            v108 = self;
            unsigned int v118 = v12;
            v112 = v14;
            v64 = v13;
            id v65 = v10;
            uint64_t v66 = [NSString stringWithFormat:@"Data posted(%d): %@", xpc_connection_get_pid(v9), v8];
            uint64_t v67 = (void *)MEMORY[0x1E4F929B8];
            v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
            v69 = [v68 lastPathComponent];
            v70 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
            [v67 logMessage:v66 fromFile:v69 fromFunction:v70 fromLineNumber:604];

            v71 = PLLogCommon();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }

            id v10 = v65;
            id v13 = v64;
            self = v108;
            uint64_t v14 = v112;
            uint64_t v12 = v118;
            id v49 = v104;
          }
        }
        [(PLXPCService *)self handlePeerListenerEvent:v10 withMessage:v8 withClientID:v12 withProcessName:v13 withKey:v14 withPayload:v49];
        id v60 = v49;
        __int16 v48 = @"Post";
      }
      else if (v62)
      {
        v123 = v9;
        v80 = v14;
        uint64_t v81 = objc_opt_class();
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_767;
        v125[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v125[4] = v81;
        id v102 = v10;
        v82 = v13;
        if (handleSingleMessage_fromPeer_forEvent__defaultOnce_765 != -1) {
          dispatch_once(&handleSingleMessage_fromPeer_forEvent__defaultOnce_765, v125);
        }
        v105 = v49;
        if (handleSingleMessage_fromPeer_forEvent__classDebugEnabled_766)
        {
          int v83 = [NSString stringWithFormat:@"Message with no direction: %@", v8];
          id v84 = (void *)MEMORY[0x1E4F929B8];
          objc_super v85 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v86 = [v85 lastPathComponent];
          id v87 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v84 logMessage:v83 fromFile:v86 fromFunction:v87 fromLineNumber:608];

          v88 = PLLogCommon();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
        __int16 v48 = 0;
        id v10 = v102;
        id v60 = v105;
        id v13 = v82;
        uint64_t v14 = v80;
        long long v9 = v123;
      }
      else
      {
        id v60 = v49;
        __int16 v48 = 0;
      }
    }
  }
  if ([(PLOperator *)self isDebugEnabledForKey:@"LogAggregateXPC"])
  {
    v124 = v9;
    v114 = v14;
    long long v89 = v13;
    id v90 = v10;
    uint64_t v91 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"XPCEvent"];
    long long v92 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v91];
    v93 = [v8 objectForKeyedSubscript:@"event"];
    [v92 setObject:v93 forKeyedSubscript:@"event"];

    v94 = [v8 objectForKeyedSubscript:@"clientID"];
    [v92 setObject:v94 forKeyedSubscript:@"clientID"];

    v95 = [v8 objectForKeyedSubscript:@"process-name"];
    [v92 setObject:v95 forKeyedSubscript:@"process-name"];

    if (v48) {
      [v92 setObject:v48 forKeyedSubscript:@"type"];
    }
    [v92 setObject:&unk_1F400DD38 forKeyedSubscript:@"count"];
    [(PLOperator *)self logEntry:v92];
    v96 = NSString;
    v97 = [v92 objectForKeyedSubscript:@"type"];
    v98 = [v92 objectForKeyedSubscript:@"clientID"];
    v99 = [v92 objectForKeyedSubscript:@"process-name"];
    uint64_t v100 = [v92 objectForKeyedSubscript:@"event"];
    v101 = [v96 stringWithFormat:@"com.apple.power.xpc.%@.%@.%@.%@", v97, v98, v99, v100];

    MEMORY[0x1E4E7E330](v101, 1);
    id v10 = v90;
    id v13 = v89;
    uint64_t v14 = v114;
    long long v9 = v124;
    id v49 = (void *)v91;
    goto LABEL_70;
  }
LABEL_71:
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleSingleMessage_fromPeer_forEvent__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_740(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleSingleMessage_fromPeer_forEvent__classDebugEnabled_739 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_743(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleSingleMessage_fromPeer_forEvent__classDebugEnabled_742 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_749(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleSingleMessage_fromPeer_forEvent__classDebugEnabled_748 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_755(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleSingleMessage_fromPeer_forEvent__classDebugEnabled_754 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_761(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleSingleMessage_fromPeer_forEvent__classDebugEnabled_760 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_767(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleSingleMessage_fromPeer_forEvent__classDebugEnabled_766 = result;
  return result;
}

- (void)handlePeerShouldLogEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7
{
  uint64_t v9 = a5;
  id v38 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = [v14 objectForKeyedSubscript:@"shouldLog"];
  uint64_t v16 = (void *)[v14 mutableCopy];

  LODWORD(v9) = [(PLXPCService *)self permissionForClientID:v9 withKey:v12 withType:v15 withProcessName:v13];
  uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v9 != 0];
  [v16 setObject:v17 forKeyedSubscript:@"shouldLog"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v18;
    if (handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__defaultOnce != -1) {
      dispatch_once(&handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__defaultOnce, block);
    }
    if (handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__classDebugEnabled)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"!!! response=%@; %s:%d",
        v16,
        "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
      int v19 = 638);
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v22 = [v21 lastPathComponent];
      uint64_t v23 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:638];

      signed __int16 v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke_781;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v25;
    if (handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__defaultOnce_779 != -1) {
      dispatch_once(&handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__defaultOnce_779, v39);
    }
    if (handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__classDebugEnabled_780)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"!!! vlad=%@; %s:%d",
        v16,
        "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
      long long v26 = 639);
      uint64_t v27 = (void *)MEMORY[0x1E4F929B8];
      double v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v29 = [v28 lastPathComponent];
      id v30 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]"];
      [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:639];

      uint64_t v31 = PLLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([(PLOperator *)self isDebugEnabled])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"!!! response=%@; %s:%d",
      v16,
      "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
    uint64_t v32 = 640);
    long long v33 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
    long long v35 = [v34 lastPathComponent];
    long long v36 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]"];
    [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:640];

    BOOL v37 = PLLogCommon();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
  }
  [(PLXPCService *)self respondToEvent:v38 withResponse:v16];
}

uint64_t __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__classDebugEnabled = result;
  return result;
}

uint64_t __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke_781(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey__classDebugEnabled_780 = result;
  return result;
}

- (void)handlePeerResponderEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8
{
  int v76 = a5;
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v80 = a4;
  id v13 = a6;
  id v78 = a7;
  id v14 = a8;
  if (+[PLUtilities isPowerlogHelperd])
  {
    uint64_t v15 = [(PLXPCService *)self satelliteProcessSemaphore];
    [v15 signalInterestByObject:v80];

    uint64_t v16 = [MEMORY[0x1E4F929F8] sharedManager];
    [v16 signalServiceActive:0];
  }
  uint64_t v127 = 0;
  v128 = &v127;
  uint64_t v129 = 0x3032000000;
  v130 = __Block_byref_object_copy__16;
  v131 = __Block_byref_object_dispose__16;
  id v132 = 0;
  if ([(PLOperator *)self isDebugEnabled])
  {
    uint64_t v17 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ResponderEvent"];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v17];
    int v19 = (void *)v128[5];
    v128[5] = v18;

    uint64_t v20 = [v80 objectForKeyedSubscript:@"event"];
    [(id)v128[5] setObject:v20 forKeyedSubscript:@"event"];

    id v21 = [v80 objectForKeyedSubscript:@"clientID"];
    [(id)v128[5] setObject:v21 forKeyedSubscript:@"clientID"];

    v22 = [v80 objectForKeyedSubscript:@"process-name"];
    [(id)v128[5] setObject:v22 forKeyedSubscript:@"process-name"];

    if (!+[PLUtilities isPowerlogHelperd]) {
      [(PLOperator *)self logEntry:v128[5]];
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke;
    v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v126[4] = v23;
    if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce != -1) {
      dispatch_once(&handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce, v126);
    }
    if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled)
    {
      signed __int16 v24 = [NSString stringWithFormat:@"clientID=%i, processName=%@, key=%@, payload=%@", v76, v13, v78, v14];
      uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
      long long v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v27 = [v26 lastPathComponent];
      double v28 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:666];

      uint64_t v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v124[0] = 0;
  v124[1] = v124;
  v124[2] = 0x3032000000;
  v124[3] = __Block_byref_object_copy__16;
  v124[4] = __Block_byref_object_dispose__16;
  id v75 = v74;
  id v125 = v75;
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x2020000000;
  __int16 v123 = v76;
  uint64_t v114 = 0;
  unsigned int v115 = &v114;
  uint64_t v116 = 0x3032000000;
  unsigned int v117 = __Block_byref_object_copy__16;
  unsigned int v118 = __Block_byref_object_dispose__16;
  id v73 = v13;
  id v119 = v73;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__16;
  v112 = __Block_byref_object_dispose__16;
  id v77 = v78;
  id v113 = v77;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__16;
  v106 = __Block_byref_object_dispose__16;
  id v79 = v14;
  id v107 = v79;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__16;
  uint64_t v100 = __Block_byref_object_dispose__16;
  id v30 = [(PLXPCService *)self registeredResponders];
  id v101 = [(PLXPCService *)self registeredOperatorFromDictionary:v30 forMessage:v80];

  uint64_t v31 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__16;
  v94[4] = __Block_byref_object_dispose__16;
  id v95 = 0;
  while (1)
  {
    uint64_t v32 = [(PLXPCService *)self registeredResponders];
    uint64_t v33 = [(PLXPCService *)self registeredOperatorFromDictionary:v32 forMessage:v80];
    uint64_t v34 = (void *)v97[5];
    void v97[5] = v33;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v35 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_791;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v35;
      if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_789 != -1) {
        dispatch_once(&handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_789, block);
      }
      if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_790)
      {
        long long v36 = NSString;
        BOOL v37 = [(PLXPCService *)self registeredResponders];
        id v38 = [v36 stringWithFormat:@"!!! %s/%d: count=%d, [self registeredResponders]=%@, message=%@, responder=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 681, v31, v37, v80, v97[5]];

        v39 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        id v41 = [v40 lastPathComponent];
        int v42 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:681];

        uint64_t v43 = PLLogCommon();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v134 = v38;
          _os_log_debug_impl(&dword_1E4220000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v97[5]) {
      break;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v44 = objc_opt_class();
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_850;
      v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v82[4] = v44;
      if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_848 != -1) {
        dispatch_once(&handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_848, v82);
      }
      if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_849)
      {
        uint64_t v45 = [NSString stringWithFormat:@"No registered Responder"];
        v46 = (void *)MEMORY[0x1E4F929B8];
        int v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        __int16 v48 = [v47 lastPathComponent];
        id v49 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:731];

        uint64_t v50 = PLLogCommon();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v134 = v45;
          _os_log_debug_impl(&dword_1E4220000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v31 > 3) {
      useconds_t v51 = 1000000;
    }
    else {
      useconds_t v51 = [(PLXPCService *)self responderWaitTime];
    }
    usleep(v51);
    uint64_t v31 = (v31 + 1);
    if (v31 == 20) {
      goto LABEL_50;
    }
  }
  id v52 = [v80 objectForKeyedSubscript:@"clientID"];
  if ([v52 integerValue] != 32) {
    goto LABEL_45;
  }
  id v53 = [v80 objectForKeyedSubscript:@"event"];
  uint64_t v54 = [v53 description];
  int v55 = [v54 isEqualToString:@"SafeLogFile"];

  if (v55)
  {
    v56 = (void *)[v79 mutableCopy];
    [v56 setObject:MEMORY[0x1E4F1CC38] forKey:@"BLDRetail"];
    id v52 = v56;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v57 = objc_opt_class();
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_803;
      v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v92[4] = v57;
      if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_801 != -1) {
        dispatch_once(&handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_801, v92);
      }
      if (handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_802)
      {
        v58 = [NSString stringWithFormat:@"!!! %s/%d: clientID=%d, event=%@, processName=%@, key=%@, payload=%@, message=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 687, *((__int16 *)v121 + 12), v75, v115[5], v109[5], v103[5], v80];
        v59 = (void *)MEMORY[0x1E4F929B8];
        id v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v61 = [v60 lastPathComponent];
        int v62 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v59 logMessage:v58 fromFile:v61 fromFunction:v62 fromLineNumber:687];

        uint64_t v63 = PLLogCommon();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v64 = dispatch_get_global_queue(0, 0);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_807;
    v91[3] = &unk_1E6E47E68;
    v91[4] = self;
    v91[5] = v94;
    dispatch_sync(v64, v91);

    id v79 = v52;
LABEL_45:
  }
  id v65 = [v80 objectForKeyedSubscript:@"event"];
  uint64_t v66 = [v65 description];
  int v67 = [v66 isEqualToString:@"Aggregate"];

  if (v67) {
    intptr_t v68 = -32768;
  }
  else {
    intptr_t v68 = 0;
  }
  v69 = dispatch_get_global_queue(v68, 0);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_843;
  v83[3] = &unk_1E6E4A4F0;
  v86 = &v120;
  id v87 = &v114;
  v88 = &v108;
  long long v89 = &v102;
  objc_super v85 = &v96;
  void v83[4] = self;
  id v90 = v124;
  id v84 = v80;
  dispatch_async(v69, v83);

LABEL_50:
  if (+[PLUtilities isPowerlogHelperd] && !v97[5])
  {
    v70 = PLLogCommon();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      -[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]();
    }

    v71 = [(PLXPCService *)self satelliteProcessSemaphore];
    [v71 signalDoneByObject:v80];
  }
  uint64_t v72 = v128[5];
  if (v72)
  {
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_854;
    v81[3] = &unk_1E6E47B58;
    void v81[4] = &v127;
    [(PLOperator *)self updateEntry:v72 withBlock:v81];
  }
  _Block_object_dispose(v94, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v102, 8);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(&v120, 8);
  _Block_object_dispose(v124, 8);

  _Block_object_dispose(&v127, 8);
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_791(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_790 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_803(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_802 = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_807(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  PLTalkToPowerlogHelper();
  uint64_t v2 = PLQueryRegistered();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unint64_t v5 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v6;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_defaultOnce != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_defaultOnce, v48);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_classDebugEnabled)
    {
      uint64_t v7 = [NSString stringWithFormat:@"%s/%d: buiResults=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke", 693, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v8 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v10 = [v9 lastPathComponent];
      long long v11 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:693];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      unint64_t v5 = 0x1E4F92000uLL;
    }
  }
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v13)
  {
    [v13 objectForKeyedSubscript:@"result"];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = @"EntryKey";
      uint64_t v17 = *(void *)v45;
      uint64_t v39 = *(void *)v45;
      do
      {
        uint64_t v18 = 0;
        uint64_t v40 = v15;
        do
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(obj);
          }
          int v19 = *(void **)(*((void *)&v44 + 1) + 8 * v18);
          id v20 = objc_alloc(MEMORY[0x1E4F929D0]);
          id v21 = [v19 objectForKeyedSubscript:v16];
          v22 = (void *)[v20 initWithEntryKey:v21 withRawData:v19];

          [*(id *)(a1 + 32) logEntry:v22];
          if ([*(id *)(v5 + 2496) debugEnabled])
          {
            uint64_t v23 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_829;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            void block[4] = v23;
            if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_defaultOnce_827 != -1) {
              dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_defaultOnce_827, block);
            }
            if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_classDebugEnabled_828)
            {
              uint64_t v24 = a1;
              uint64_t v25 = v16;
              objc_msgSend(NSString, "stringWithFormat:", @"!!! %s/%d: log to database; entry=%@, serializedEntry=%@",
                "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2",
                702,
                v22,
              long long v26 = v19);
              uint64_t v27 = (void *)MEMORY[0x1E4F929B8];
              double v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
              uint64_t v29 = [v28 lastPathComponent];
              id v30 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2"];
              [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:702];

              uint64_t v31 = PLLogCommon();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v50 = v26;
                _os_log_debug_impl(&dword_1E4220000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v5 = 0x1E4F92000;
              uint64_t v16 = v25;
              a1 = v24;
              uint64_t v17 = v39;
              uint64_t v15 = v40;
            }
          }

          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v15);
    }
LABEL_31:

    return;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_836;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v32;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_defaultOnce_834 != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_defaultOnce_834, v42);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_classDebugEnabled_835)
    {
      uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"!!! %s/%d: buiResults is nil", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2", 705);
      uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      long long v36 = [v35 lastPathComponent];
      BOOL v37 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2"];
      id obj = (id)v33;
      [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:705];

      id v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      goto LABEL_31;
    }
  }
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_classDebugEnabled = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_829(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_classDebugEnabled_828 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_836(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_6_classDebugEnabled_835 = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_843(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) respondToRequestForClientID:*(__int16 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) withProcessName:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withKey:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) withPayload:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2_844;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_7_defaultOnce != -1) {
      dispatch_once(&kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_7_defaultOnce, block);
    }
    if (kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_7_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"!!! %s/%d: responder=%@, response=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke", 722, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v2];
      unint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:722];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) respondToEvent:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) withResponse:v2];
  if (+[PLUtilities isPowerlogHelperd])
  {
    id v10 = [*(id *)(a1 + 32) satelliteProcessSemaphore];
    [v10 signalDoneByObject:*(void *)(a1 + 40)];
  }
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2_844(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLXPCServiceEventPointNameClientLoggingDrops_block_invoke_7_classDebugEnabled = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_850(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_849 = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_854(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v2 forKeyedSubscript:@"timestampEnd"];
}

- (void)handlePeerListenerEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8
{
  uint64_t v11 = a5;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if ([(PLXPCService *)self permissionForClientID:v11 withKey:v15 withType:@"Post" withProcessName:v14])
  {
    uint64_t v17 = [(PLXPCService *)self registeredListeners];
    uint64_t v18 = [(PLXPCService *)self registeredOperatorFromDictionary:v17 forMessage:v13];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_860;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v19;
      if (handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_858 != -1) {
        dispatch_once(&handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce_858, block);
      }
      if (handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_859)
      {
        id v34 = v13;
        id v35 = v16;
        id v20 = NSString;
        id v21 = [(PLXPCService *)self registeredListeners];
        v22 = [v20 stringWithFormat:@"!!! %s/%d: [self registeredListeners]=%@, listener=%@", "-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 774, v21, v18];

        uint64_t v23 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v25 = [v24 lastPathComponent];
        long long v26 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:774];

        uint64_t v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        id v13 = v34;
        id v16 = v35;
      }
    }
    if (v18) {
      [v18 messageRecievedForClientID:v11 withProcessName:v14 withKey:v15 withPayload:v16];
    }
    else {
      [(PLXPCService *)self logMessage:v13 withPayload:v16];
    }
LABEL_19:

    goto LABEL_20;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v28;
    if (handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce != -1) {
      dispatch_once(&handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__defaultOnce, v37);
    }
    if (handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled)
    {
      uint64_t v18 = [NSString stringWithFormat:@"no permission to log!"];
      uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
      id v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v31 = [v30 lastPathComponent];
      uint64_t v32 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
      [v29 logMessage:v18 fromFile:v31 fromFunction:v32 fromLineNumber:766];

      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      goto LABEL_19;
    }
  }
LABEL_20:
}

uint64_t __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled = result;
  return result;
}

uint64_t __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_860(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload__classDebugEnabled_859 = result;
  return result;
}

- (void)stopPowerlogHelperd:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:@"timeout"];
  -[PLXPCService setSatelliteProcessExitWithTime:](self, "setSatelliteProcessExitWithTime:", (double)(int)[v4 intValue]);
}

- (void)setSatelliteProcessExitWithTime:(double)a3
{
  id v5 = [(PLXPCService *)self satelliteProcessSemaphore];
  [v5 setTimeout:a3];

  [(PLXPCService *)self setSatelliteProcessExit];
}

- (void)setSatelliteProcessExit
{
  if (+[PLUtilities isPowerlogHelperd])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke;
    block[3] = &unk_1E6E47848;
    void block[4] = self;
    if (setSatelliteProcessExit_onceToken != -1) {
      dispatch_once(&setSatelliteProcessExit_onceToken, block);
    }
  }
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke_2;
  block[3] = &unk_1E6E47848;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke_2(uint64_t a1)
{
  while (1)
  {
    id v2 = [*(id *)(a1 + 32) satelliteProcessSemaphore];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke_3;
    v3[3] = &unk_1E6E47848;
    v3[4] = *(void *)(a1 + 32);
    [v2 waitWithBlockSync:v3];
  }
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  [(id)v2 blockingFlushCachesWithReason:@"SatelliteExit"];

  sleep(0xAu);
  uint64_t v3 = [*(id *)(a1 + 32) satelliteProcessSemaphore];
  LOBYTE(v2) = [v3 isActive];

  if ((v2 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F929F8] sharedManager];
    [v4 signalServiceInactive:0];
  }
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableDictionary)registeredListeners
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRegisteredListeners:(id)a3
{
}

- (NSMutableDictionary)registeredResponders
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRegisteredResponders:(id)a3
{
}

- (NSDictionary)permissionCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPermissionCache:(id)a3
{
}

- (PLNSNotificationOperatorComposition)registrationNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRegistrationNotification:(id)a3
{
}

- (NSArray)clientIDs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientIDs:(id)a3
{
}

- (NSDictionary)clientNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientNames:(id)a3
{
}

- (PLTimer)resetPermissionsForClientsTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setResetPermissionsForClientsTimer:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (PLSemaphore)satelliteProcessSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSatelliteProcessSemaphore:(id)a3
{
}

- (unsigned)responderWaitTime
{
  return self->_responderWaitTime;
}

- (void)setResponderWaitTime:(unsigned int)a3
{
  self->_responderWaitTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteProcessSemaphore, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_resetPermissionsForClientsTimer, 0);
  objc_storeStrong((id *)&self->_clientNames, 0);
  objc_storeStrong((id *)&self->_clientIDs, 0);
  objc_storeStrong((id *)&self->_registrationNotification, 0);
  objc_storeStrong((id *)&self->_permissionCache, 0);
  objc_storeStrong((id *)&self->_registeredResponders, 0);
  objc_storeStrong((id *)&self->_registeredListeners, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "powerlogHelperd received unhandled query: %@", v1, 0xCu);
}

@end