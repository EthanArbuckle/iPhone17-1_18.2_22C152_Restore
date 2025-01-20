@interface PLXPCRelay
+ (id)sharedInstance;
- (BOOL)isDebugEnabled;
- (BOOL)relayActive;
- (OS_dispatch_queue)crashMoverQueue;
- (OS_xpc_object)relayConnection;
- (OS_xpc_object)xpcConnection;
- (OS_xpc_object)xpcCrashMoverConn;
- (PLXPCRelay)init;
- (void)handleCrashMoverConnection:(id)a3;
- (void)handlePeer:(id)a3 forEvent:(id)a4;
- (void)movePowerlogs;
- (void)resetRelayConnection;
- (void)setCrashMoverQueue:(id)a3;
- (void)setRelayActive:(BOOL)a3;
- (void)setRelayConnection:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcCrashMoverConn:(id)a3;
- (void)startRelay;
- (void)stopRelay;
@end

@implementation PLXPCRelay

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_47);
  }
  v2 = (void *)sharedInstance__sharedRelay;
  return v2;
}

uint64_t __28__PLXPCRelay_sharedInstance__block_invoke()
{
  sharedInstance__sharedRelay = objc_alloc_init(PLXPCRelay);
  return MEMORY[0x1F41817F8]();
}

- (PLXPCRelay)init
{
  v21.receiver = self;
  v21.super_class = (Class)PLXPCRelay;
  id v2 = [(PLXPCRelay *)&v21 init];
  if (!v2) {
    goto LABEL_4;
  }
  if (+[PLUtilities isLiteModeDaemon])
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.powerlog_mover", v4, 0);
    v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.powerlog_mover", *((dispatch_queue_t *)v2 + 5), 1uLL);
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = mach_service;

    xpc_connection_set_context(*((xpc_connection_t *)v2 + 4), v2);
    v9 = (_xpc_connection_s *)*((void *)v2 + 4);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __18__PLXPCRelay_init__block_invoke_20;
    v18[3] = &unk_1E62548B0;
    id v19 = v2;
    xpc_connection_set_event_handler(v9, v18);
    xpc_connection_activate(*((xpc_connection_t *)v2 + 4));

LABEL_4:
    v10 = (PLXPCRelay *)v2;
    goto LABEL_13;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __18__PLXPCRelay_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (init_defaultOnce_1 != -1) {
      dispatch_once(&init_defaultOnce_1, block);
    }
    if (init_classDebugEnabled_1)
    {
      v12 = [NSString stringWithFormat:@"Relay: Bad processname, no xpc relay for you"];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLXPCRelay init]"];
      +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:46];

      v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

BOOL __18__PLXPCRelay_init__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_1 = result;
  return result;
}

void __18__PLXPCRelay_init__block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1C1869B20]() == MEMORY[0x1E4F14578]) {
    [*(id *)(a1 + 32) handleCrashMoverConnection:v3];
  }
}

- (void)startRelay
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__PLXPCRelay_startRelay__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (startRelay_defaultOnce != -1) {
      dispatch_once(&startRelay_defaultOnce, block);
    }
    if (startRelay_classDebugEnabled)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"Relay: Relay running in aggd with service %s to %s", "com.apple.powerlog.plxpclogger.xpc", "com.apple.powerlogd.XPCService.xpc");
      dispatch_queue_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLXPCRelay startRelay]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:71];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [(PLXPCRelay *)self setRelayActive:1];
  v9 = +[PLUtilities workQueueForKey:@"XPCRelay_Connection"];
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.powerlog.plxpclogger.xpc", v9, 1uLL);
  [(PLXPCRelay *)self setXpcConnection:mach_service];

  uint64_t v11 = [(PLXPCRelay *)self xpcConnection];
  xpc_connection_set_context(v11, self);

  v12 = [(PLXPCRelay *)self xpcConnection];
  v13 = dispatch_get_global_queue(2, 0);
  xpc_connection_set_target_queue(v12, v13);

  v14 = [(PLXPCRelay *)self xpcConnection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __24__PLXPCRelay_startRelay__block_invoke_30;
  handler[3] = &unk_1E62548B0;
  handler[4] = self;
  xpc_connection_set_event_handler(v14, handler);

  v15 = [(PLXPCRelay *)self xpcConnection];
  xpc_connection_activate(v15);
}

BOOL __24__PLXPCRelay_startRelay__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  startRelay_classDebugEnabled = result;
  return result;
}

void __24__PLXPCRelay_startRelay__block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__PLXPCRelay_startRelay__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (relayConnectionSync_block_invoke_defaultOnce != -1) {
      dispatch_once(&relayConnectionSync_block_invoke_defaultOnce, block);
    }
    if (relayConnectionSync_block_invoke_classDebugEnabled)
    {
      dispatch_queue_t v5 = NSString;
      v6 = [*(id *)(a1 + 32) xpcConnection];
      v7 = [v5 stringWithFormat:@"Relay: event handler fired peerPID=%d %@", xpc_connection_get_pid(v6), v3];

      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLXPCRelay startRelay]_block_invoke"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:78];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (MEMORY[0x1C1869B20](v3) != MEMORY[0x1E4F145A8])
  {
    v12 = (_xpc_connection_s *)v3;
    v13 = [*(id *)(a1 + 32) xpcConnection];
    context = xpc_connection_get_context(v13);
    xpc_connection_set_context(v12, context);

    v15 = dispatch_get_global_queue(2, 0);
    xpc_connection_set_target_queue(v12, v15);

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __24__PLXPCRelay_startRelay__block_invoke_41;
    handler[3] = &unk_1E6255AD8;
    handler[4] = *(void *)(a1 + 32);
    v23 = v12;
    v16 = v12;
    xpc_connection_set_event_handler(v16, handler);
    xpc_connection_activate(v16);

LABEL_10:
    goto LABEL_18;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __24__PLXPCRelay_startRelay__block_invoke_36;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v17;
    if (relayConnectionSync_block_invoke_defaultOnce_34 != -1) {
      dispatch_once(&relayConnectionSync_block_invoke_defaultOnce_34, v24);
    }
    if (relayConnectionSync_block_invoke_classDebugEnabled_35)
    {
      v16 = [NSString stringWithFormat:@"Relay: XPC error! %@", v3];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      id v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLXPCRelay startRelay]_block_invoke_2"];
      +[PLCoreStorage logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:81];

      objc_super v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      goto LABEL_10;
    }
  }
LABEL_18:
}

BOOL __24__PLXPCRelay_startRelay__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnectionSync_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __24__PLXPCRelay_startRelay__block_invoke_36(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnectionSync_block_invoke_classDebugEnabled_35 = result;
  return result;
}

void __24__PLXPCRelay_startRelay__block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __24__PLXPCRelay_startRelay__block_invoke_2_42;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v4;
    if (relayConnectionSync_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&relayConnectionSync_block_invoke_2_defaultOnce, &block);
    }
    if (relayConnectionSync_block_invoke_2_classDebugEnabled)
    {
      dispatch_queue_t v5 = NSString;
      uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
      v7 = objc_msgSend(v5, "stringWithFormat:", @"Relay: peer(%d) connected", pid, block, v14, v15, v16, v17);
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLXPCRelay startRelay]_block_invoke"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:88];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v12 = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
  [v12 handlePeer:*(void *)(a1 + 40) forEvent:v3];
}

BOOL __24__PLXPCRelay_startRelay__block_invoke_2_42(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnectionSync_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (void)stopRelay
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__PLXPCRelay_stopRelay__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (stopRelay_defaultOnce != -1) {
      dispatch_once(&stopRelay_defaultOnce, block);
    }
    if (stopRelay_classDebugEnabled)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Relay: closing relay in aggd with service %s to %s", "com.apple.powerlog.plxpclogger.xpc", "com.apple.powerlogd.XPCService.xpc");
      dispatch_queue_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLXPCRelay stopRelay]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:106];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [(PLXPCRelay *)self setRelayActive:0];
  v9 = [(PLXPCRelay *)self xpcConnection];
  xpc_connection_cancel(v9);

  [(PLXPCRelay *)self setXpcConnection:0];
  [(PLXPCRelay *)self resetRelayConnection];
}

BOOL __23__PLXPCRelay_stopRelay__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  stopRelay_classDebugEnabled = result;
  return result;
}

- (void)handleCrashMoverConnection:(id)a3
{
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __41__PLXPCRelay_handleCrashMoverConnection___block_invoke;
  handler[3] = &unk_1E62548B0;
  handler[4] = self;
  uint64_t v4 = (_xpc_connection_s *)a3;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_crashMoverQueue);
  xpc_connection_activate(v4);
}

uint64_t __41__PLXPCRelay_handleCrashMoverConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1C1869B20](a2);
  if (result == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 movePowerlogs];
  }
  return result;
}

- (void)movePowerlogs
{
  if (+[PLDefaults fullMode])
  {
    MEMORY[0x1F4145D78]();
  }
}

- (BOOL)isDebugEnabled
{
  uint64_t v2 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PLXPCRelay_isDebugEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v2;
  if (isDebugEnabled_defaultOnce != -1) {
    dispatch_once(&isDebugEnabled_defaultOnce, block);
  }
  return isDebugEnabled_classDebugEnabled
      || +[PLDefaults isClassNameDebugEnabled:@"PLXPCService"];
}

BOOL __28__PLXPCRelay_isDebugEnabled__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  isDebugEnabled_classDebugEnabled = result;
  return result;
}

- (void)handlePeer:(id)a3 forEvent:(id)a4
{
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1C1869B20]();
  if (v8 == MEMORY[0x1E4F145A8])
  {
    if (v7 == (id)MEMORY[0x1E4F14528])
    {
      if (!+[PLDefaults debugEnabled]) {
        goto LABEL_48;
      }
      uint64_t v31 = objc_opt_class();
      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke;
      v136[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v136[4] = v31;
      if (handlePeer_forEvent__defaultOnce != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce, v136);
      }
      if (!handlePeer_forEvent__classDebugEnabled) {
        goto LABEL_48;
      }
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Relay: peer(%d) received XPC_ERROR_CONNECTION_INVALID", xpc_connection_get_pid(v6));
      v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
      +[PLCoreStorage logMessage:v18 fromFile:v33 fromFunction:v34 fromLineNumber:146];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    else if (v7 == (id)MEMORY[0x1E4F14520])
    {
      if (!+[PLDefaults debugEnabled]) {
        goto LABEL_48;
      }
      uint64_t v35 = objc_opt_class();
      v135[0] = MEMORY[0x1E4F143A8];
      v135[1] = 3221225472;
      v135[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_57;
      v135[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v135[4] = v35;
      if (handlePeer_forEvent__defaultOnce_55 != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce_55, v135);
      }
      if (!handlePeer_forEvent__classDebugEnabled_56) {
        goto LABEL_48;
      }
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Relay: peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", xpc_connection_get_pid(v6));
      v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
      +[PLCoreStorage logMessage:v18 fromFile:v37 fromFunction:v38 fromLineNumber:150];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    else
    {
      id v15 = (id)MEMORY[0x1E4F14550];
      BOOL v16 = +[PLDefaults debugEnabled];
      if (v7 == v15)
      {
        if (!v16) {
          goto LABEL_48;
        }
        uint64_t v39 = objc_opt_class();
        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_63;
        v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v134[4] = v39;
        if (handlePeer_forEvent__defaultOnce_61 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_61, v134);
        }
        if (!handlePeer_forEvent__classDebugEnabled_62) {
          goto LABEL_48;
        }
        v18 = objc_msgSend(NSString, "stringWithFormat:", @"Relay: peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", xpc_connection_get_pid(v6));
        v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        v41 = [v40 lastPathComponent];
        v42 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
        +[PLCoreStorage logMessage:v18 fromFile:v41 fromFunction:v42 fromLineNumber:154];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
      else
      {
        if (!v16) {
          goto LABEL_48;
        }
        uint64_t v17 = objc_opt_class();
        v133[0] = MEMORY[0x1E4F143A8];
        v133[1] = 3221225472;
        v133[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_69;
        v133[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v133[4] = v17;
        if (handlePeer_forEvent__defaultOnce_67 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_67, v133);
        }
        if (!handlePeer_forEvent__classDebugEnabled_68) {
          goto LABEL_48;
        }
        v18 = [NSString stringWithFormat:@"Relay: peer(%d) received Unidentified error:%@", xpc_connection_get_pid(v6), v7];
        id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        v20 = [v19 lastPathComponent];
        objc_super v21 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
        +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:159];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }

LABEL_48:
    xpc_connection_cancel(v6);
    goto LABEL_133;
  }
  if (v8 == MEMORY[0x1E4F14590])
  {
    v23 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v24 = objc_opt_class();
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_75;
      v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v132[4] = v24;
      if (handlePeer_forEvent__defaultOnce_73 != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce_73, v132);
      }
      if (handlePeer_forEvent__classDebugEnabled_74)
      {
        v25 = [NSString stringWithFormat:@"Relay: message = %@", v23];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        v27 = [v26 lastPathComponent];
        v28 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
        +[PLCoreStorage logMessage:v25 fromFile:v27 fromFunction:v28 fromLineNumber:165];

        v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if (!v23) {
      goto LABEL_132;
    }
    v30 = [v23 objectForKey:@"shouldLog"];
    if (v30)
    {
    }
    else
    {
      v43 = [v23 objectForKey:@"Query"];

      if (!v43)
      {
        v94 = [v23 objectForKey:@"Post"];

        if (v94)
        {
          v95 = (void *)_CFXPCCreateXPCMessageWithCFObject();
          v96 = [(PLXPCRelay *)self relayConnection];
          xpc_connection_send_notification();
        }
        else
        {
          if (!+[PLDefaults debugEnabled]) {
            goto LABEL_132;
          }
          uint64_t v111 = objc_opt_class();
          v123[0] = MEMORY[0x1E4F143A8];
          v123[1] = 3221225472;
          v123[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_141;
          v123[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v123[4] = v111;
          if (handlePeer_forEvent__defaultOnce_139 != -1) {
            dispatch_once(&handlePeer_forEvent__defaultOnce_139, v123);
          }
          if (!handlePeer_forEvent__classDebugEnabled_140) {
            goto LABEL_132;
          }
          v95 = [NSString stringWithFormat:@"Message with no direction: %@", v23];
          v112 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
          v113 = [v112 lastPathComponent];
          v114 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
          +[PLCoreStorage logMessage:v95 fromFile:v113 fromFunction:v114 fromLineNumber:229];

          v96 = PLLogCommon();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }

LABEL_132:
        goto LABEL_133;
      }
    }
    uint64_t v44 = [v23 objectForKey:@"Query"];
    if (v44)
    {
      v45 = (void *)v44;
      BOOL v46 = +[PLUtilities allowQueryFromPeer:v6];

      if (!v46) {
        goto LABEL_132;
      }
    }
    v47 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    v48 = [(PLXPCRelay *)self relayConnection];
    xpc_object_t v49 = xpc_connection_send_message_with_reply_sync(v48, v47);

    BOOL v50 = +[PLDefaults debugEnabled];
    if (!v49)
    {
      if (!v50) {
        goto LABEL_131;
      }
      uint64_t v88 = objc_opt_class();
      v131[0] = MEMORY[0x1E4F143A8];
      v131[1] = 3221225472;
      v131[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_87;
      v131[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v131[4] = v88;
      v89 = v23;
      if (handlePeer_forEvent__defaultOnce_85 != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce_85, v131);
      }
      if (!handlePeer_forEvent__classDebugEnabled_86) {
        goto LABEL_131;
      }
      xpc_object_t v121 = 0;
      uint64_t v90 = [NSString stringWithFormat:@"Relay: no xpc_response"];
      v91 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v92 = [v91 lastPathComponent];
      v93 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
      +[PLCoreStorage logMessage:v90 fromFile:v92 fromFunction:v93 fromLineNumber:177];

      v67 = PLLogCommon();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
      v23 = v89;
      v58 = (void *)v90;
      goto LABEL_128;
    }
    xpc_object_t v121 = v49;
    if (v50)
    {
      uint64_t v51 = objc_opt_class();
      v130[0] = MEMORY[0x1E4F143A8];
      v130[1] = 3221225472;
      v130[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_93;
      v130[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v130[4] = v51;
      if (handlePeer_forEvent__defaultOnce_91 != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce_91, v130);
      }
      if (handlePeer_forEvent__classDebugEnabled_92)
      {
        v116 = v47;
        v52 = v23;
        v53 = [NSString stringWithFormat:@"Relay: xpc_response=%@", v49];
        v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        v55 = [v54 lastPathComponent];
        v56 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
        +[PLCoreStorage logMessage:v53 fromFile:v55 fromFunction:v56 fromLineNumber:183];

        v57 = PLLogCommon();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        v23 = v52;
        v47 = v116;
        xpc_object_t v49 = v121;
      }
    }
    v58 = xpc_dictionary_get_value(v49, (const char *)[@"PLXPCConnectionReturnDict" UTF8String]);
    BOOL v59 = +[PLDefaults debugEnabled];
    if (v58)
    {
      v120 = v58;
      if (v59)
      {
        uint64_t v60 = objc_opt_class();
        v128[0] = MEMORY[0x1E4F143A8];
        v128[1] = 3221225472;
        v128[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_108;
        v128[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v128[4] = v60;
        if (handlePeer_forEvent__defaultOnce_106 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_106, v128);
        }
        if (handlePeer_forEvent__classDebugEnabled_107)
        {
          v117 = v47;
          v61 = v23;
          v62 = [NSString stringWithFormat:@"Relay: xpc_return_dict=%@", v58];
          v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
          v64 = [v63 lastPathComponent];
          v65 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
          +[PLCoreStorage logMessage:v62 fromFile:v64 fromFunction:v65 fromLineNumber:194];

          v66 = PLLogCommon();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }

          v23 = v61;
          v47 = v117;
        }
      }
      v67 = _CFXPCCreateCFObjectFromXPCMessage();
      BOOL v68 = +[PLDefaults debugEnabled];
      if (v67)
      {
        if (v68)
        {
          uint64_t v69 = objc_opt_class();
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_120;
          v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v126[4] = v69;
          if (handlePeer_forEvent__defaultOnce_118 != -1) {
            dispatch_once(&handlePeer_forEvent__defaultOnce_118, v126);
          }
          if (handlePeer_forEvent__classDebugEnabled_119)
          {
            v115 = v23;
            v118 = v47;
            v70 = [NSString stringWithFormat:@"Relay: response=%@", v67];
            v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
            v72 = [v71 lastPathComponent];
            v73 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
            +[PLCoreStorage logMessage:v70 fromFile:v72 fromFunction:v73 fromLineNumber:206];

            v74 = PLLogCommon();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }

            v23 = v115;
            v47 = v118;
          }
        }
        xpc_dictionary_get_remote_connection(v7);
        v75 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        BOOL v76 = +[PLDefaults debugEnabled];
        if (v75)
        {
          if (v76)
          {
            uint64_t v77 = objc_opt_class();
            v124[0] = MEMORY[0x1E4F143A8];
            v124[1] = 3221225472;
            v124[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_132;
            v124[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v124[4] = v77;
            if (handlePeer_forEvent__defaultOnce_130 != -1) {
              dispatch_once(&handlePeer_forEvent__defaultOnce_130, v124);
            }
            if (handlePeer_forEvent__classDebugEnabled_131)
            {
              v119 = v47;
              v78 = v23;
              uint64_t v79 = [NSString stringWithFormat:@"Relay: have remoteConnection"];
              v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
              v81 = [v80 lastPathComponent];
              v82 = (void *)v79;
              v83 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
              +[PLCoreStorage logMessage:v82 fromFile:v81 fromFunction:v83 fromLineNumber:217];

              v84 = PLLogCommon();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
                -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
              }

              v23 = v78;
              v47 = v119;
            }
          }
          v85 = v23;
          reply = xpc_dictionary_create_reply(v7);
          v87 = _CFXPCCreateXPCMessageWithCFObject();
          xpc_dictionary_set_value(reply, (const char *)[@"PLXPCConnectionReturnDict" UTF8String], v87);
          xpc_connection_send_message(v75, reply);
LABEL_85:

          v23 = v85;
LABEL_127:

LABEL_128:
LABEL_129:
          xpc_object_t v49 = v121;
LABEL_130:

LABEL_131:
          goto LABEL_132;
        }
        if (!v76) {
          goto LABEL_127;
        }
        uint64_t v107 = objc_opt_class();
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_126;
        v125[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v125[4] = v107;
        if (handlePeer_forEvent__defaultOnce_124 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_124, v125);
        }
        if (handlePeer_forEvent__classDebugEnabled_125)
        {
          v85 = v23;
          reply = [NSString stringWithFormat:@"Relay: no remoteConnection"];
          v108 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
          v109 = [v108 lastPathComponent];
          v110 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
          +[PLCoreStorage logMessage:reply fromFile:v109 fromFunction:v110 fromLineNumber:211];

          v87 = PLLogCommon();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
          v58 = v120;
          goto LABEL_85;
        }
      }
      else
      {
        if (!v68) {
          goto LABEL_129;
        }
        uint64_t v103 = objc_opt_class();
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_114;
        v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v127[4] = v103;
        if (handlePeer_forEvent__defaultOnce_112 != -1) {
          dispatch_once(&handlePeer_forEvent__defaultOnce_112, v127);
        }
        if (!handlePeer_forEvent__classDebugEnabled_113)
        {
          xpc_object_t v49 = v121;
          goto LABEL_130;
        }
        v67 = [NSString stringWithFormat:@"Relay: no response"];
        v104 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        v105 = [v104 lastPathComponent];
        v106 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
        +[PLCoreStorage logMessage:v67 fromFile:v105 fromFunction:v106 fromLineNumber:200];

        PLLogCommon();
        v75 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    else
    {
      if (!v59) {
        goto LABEL_130;
      }
      uint64_t v97 = objc_opt_class();
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_102;
      v129[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v129[4] = v97;
      if (handlePeer_forEvent__defaultOnce_100 != -1) {
        dispatch_once(&handlePeer_forEvent__defaultOnce_100, v129);
      }
      if (!handlePeer_forEvent__classDebugEnabled_101) {
        goto LABEL_129;
      }
      v120 = 0;
      v98 = v47;
      v99 = v23;
      v67 = [NSString stringWithFormat:@"Relay: no xpc_return_dict"];
      v100 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v101 = [v100 lastPathComponent];
      v102 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
      +[PLCoreStorage logMessage:v67 fromFile:v101 fromFunction:v102 fromLineNumber:188];

      PLLogCommon();
      v75 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
      v23 = v99;
      v47 = v98;
    }
    v58 = v120;
    goto LABEL_127;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_147;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (handlePeer_forEvent__defaultOnce_145 != -1) {
      dispatch_once(&handlePeer_forEvent__defaultOnce_145, block);
    }
    if (handlePeer_forEvent__classDebugEnabled_146)
    {
      v10 = [NSString stringWithFormat:@"Relay: unknown type"];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLXPCRelay handlePeer:forEvent:]"];
      +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:233];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
LABEL_133:
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_57(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_56 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_63(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_62 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_69(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_68 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_75(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_74 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_87(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_86 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_93(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_92 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_102(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_101 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_108(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_107 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_114(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_113 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_120(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_119 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_126(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_125 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_132(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_131 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_141(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_140 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_147(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePeer_forEvent__classDebugEnabled_146 = result;
  return result;
}

- (OS_xpc_object)relayConnection
{
  objc_sync_enter(@"__relayConnectionSync__");
  if (self->_relayConnection)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __29__PLXPCRelay_relayConnection__block_invoke_185;
      v28 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v29 = v3;
      if (relayConnection_defaultOnce_183 != -1) {
        dispatch_once(&relayConnection_defaultOnce_183, &v25);
      }
      if (relayConnection_classDebugEnabled_184)
      {
        uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Relay: Reusing connection!", v25, v26, v27, v28, v29);
        dispatch_queue_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        v6 = [v5 lastPathComponent];
        id v7 = [NSString stringWithUTF8String:"-[PLXPCRelay relayConnection]"];
        +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:265];

        uint64_t v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
LABEL_21:
      }
    }
  }
  else
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__PLXPCRelay_relayConnection__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (relayConnection_defaultOnce != -1) {
        dispatch_once(&relayConnection_defaultOnce, block);
      }
      if (relayConnection_classDebugEnabled)
      {
        v10 = [NSString stringWithFormat:@"Relay: creating connection!"];
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        v12 = [v11 lastPathComponent];
        v13 = [NSString stringWithUTF8String:"-[PLXPCRelay relayConnection]"];
        +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:246];

        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    id v15 = +[PLUtilities workQueueForKey:@"XPCRelay_Relay"];
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.powerlogd.XPCService.xpc", v15, 0);
    relayConnection = self->_relayConnection;
    self->_relayConnection = mach_service;

    v18 = self->_relayConnection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29__PLXPCRelay_relayConnection__block_invoke_157;
    handler[3] = &unk_1E62548B0;
    handler[4] = self;
    xpc_connection_set_event_handler(v18, handler);
    xpc_connection_activate(self->_relayConnection);
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __29__PLXPCRelay_relayConnection__block_invoke_179;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v19;
      if (relayConnection_defaultOnce_177 != -1) {
        dispatch_once(&relayConnection_defaultOnce_177, v30);
      }
      if (relayConnection_classDebugEnabled_178)
      {
        uint64_t v4 = [NSString stringWithFormat:@"Relay: connection created!"];
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        objc_super v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLXPCRelay relayConnection]"];
        +[PLCoreStorage logMessage:v4 fromFile:v21 fromFunction:v22 fromLineNumber:263];

        uint64_t v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_21;
      }
    }
  }
  v23 = self->_relayConnection;
  objc_sync_exit(@"__relayConnectionSync__");
  return v23;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnection_classDebugEnabled = result;
  return result;
}

void __29__PLXPCRelay_relayConnection__block_invoke_157(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__PLXPCRelay_relayConnection__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (relayConnectionSync_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce, block);
    }
    if (relayConnectionSync_block_invoke_3_classDebugEnabled)
    {
      dispatch_queue_t v5 = NSString;
      v6 = [*(id *)(a1 + 32) relayConnection];
      id v7 = [v5 stringWithFormat:@"Relay: event handler fired peerPID=%d %@", xpc_connection_get_pid(v6), v3];

      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      uint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLXPCRelay relayConnection]_block_invoke"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:249];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v12 = MEMORY[0x1C1869B20](v3);
  uint64_t v13 = MEMORY[0x1E4F145A8];
  BOOL v14 = +[PLDefaults debugEnabled];
  if (v12 == v13)
  {
    if (v14)
    {
      uint64_t v21 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __29__PLXPCRelay_relayConnection__block_invoke_160;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v21;
      if (relayConnectionSync_block_invoke_3_defaultOnce_158 != -1) {
        dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce_158, v35);
      }
      if (relayConnectionSync_block_invoke_3_classDebugEnabled_159)
      {
        v22 = [NSString stringWithFormat:@"*** Relay ERROR*** XPC error! %@", v3];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
        uint64_t v24 = [v23 lastPathComponent];
        uint64_t v25 = [NSString stringWithUTF8String:"-[PLXPCRelay relayConnection]_block_invoke_2"];
        +[PLCoreStorage logMessage:v22 fromFile:v24 fromFunction:v25 fromLineNumber:252];

        uint64_t v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if (v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520])
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v27 = objc_opt_class();
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __29__PLXPCRelay_relayConnection__block_invoke_167;
        v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v34[4] = v27;
        if (relayConnectionSync_block_invoke_3_defaultOnce_165 != -1) {
          dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce_165, v34);
        }
        if (relayConnectionSync_block_invoke_3_classDebugEnabled_166)
        {
          v28 = [NSString stringWithFormat:@"*** Relay RESET *** Resetting our connection"];
          uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
          v30 = [v29 lastPathComponent];
          uint64_t v31 = [NSString stringWithUTF8String:"-[PLXPCRelay relayConnection]_block_invoke_2"];
          +[PLCoreStorage logMessage:v28 fromFile:v30 fromFunction:v31 fromLineNumber:254];

          v32 = PLLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      [*(id *)(a1 + 32) resetRelayConnection];
    }
  }
  else if (v14)
  {
    uint64_t v15 = objc_opt_class();
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __29__PLXPCRelay_relayConnection__block_invoke_173;
    v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v33[4] = v15;
    if (relayConnectionSync_block_invoke_3_defaultOnce_171 != -1) {
      dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce_171, v33);
    }
    if (relayConnectionSync_block_invoke_3_classDebugEnabled_172)
    {
      BOOL v16 = [NSString stringWithFormat:@"*** Relay ERROR*** XPC relay back? %@", v3];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m"];
      v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLXPCRelay relayConnection]_block_invoke_2"];
      +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:259];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnectionSync_block_invoke_3_classDebugEnabled = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_160(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnectionSync_block_invoke_3_classDebugEnabled_159 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_167(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnectionSync_block_invoke_3_classDebugEnabled_166 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_173(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnectionSync_block_invoke_3_classDebugEnabled_172 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_179(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnection_classDebugEnabled_178 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_185(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  relayConnection_classDebugEnabled_184 = result;
  return result;
}

- (void)resetRelayConnection
{
  objc_sync_enter(@"__relayConnectionSync__");
  relayConnection = self->_relayConnection;
  if (relayConnection)
  {
    xpc_connection_cancel(relayConnection);
    uint64_t v4 = self->_relayConnection;
    self->_relayConnection = 0;
  }
  objc_sync_exit(@"__relayConnectionSync__");
}

- (BOOL)relayActive
{
  return self->_relayActive;
}

- (void)setRelayActive:(BOOL)a3
{
  self->_relayActive = a3;
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void)setRelayConnection:(id)a3
{
}

- (OS_xpc_object)xpcCrashMoverConn
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcCrashMoverConn:(id)a3
{
}

- (OS_dispatch_queue)crashMoverQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCrashMoverQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crashMoverQueue, 0);
  objc_storeStrong((id *)&self->_xpcCrashMoverConn, 0);
  objc_storeStrong((id *)&self->_relayConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end