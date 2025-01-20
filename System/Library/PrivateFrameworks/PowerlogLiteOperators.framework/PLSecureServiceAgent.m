@interface PLSecureServiceAgent
+ (BOOL)isSecureServiceSupported;
+ (id)defaults;
+ (id)entryEventPointDefinitionConnectionState;
+ (id)entryEventPointDefinitionSummary;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSString)previousHash;
- (PLSecureServiceAgent)init;
- (PLTimer)entriesPerHourTimer;
- (PLXPCListenerOperatorComposition)connectionListener;
- (PLXPCListenerOperatorComposition)daemonLaunchListener;
- (PLXPCListenerOperatorComposition)deviceIntentListener;
- (PLXPCListenerOperatorComposition)disconnectionListener;
- (PLXPCListenerOperatorComposition)periodicReportListener;
- (int64_t)numBTConn;
- (int64_t)numEntries;
- (int64_t)periodicReportCount;
- (int64_t)prevActiveKeys;
- (int64_t)previousEvent;
- (void)initOperatorDependancies;
- (void)logEventPointConnectionState:(id)a3 withEvent:(int64_t)a4;
- (void)logEventPointPeriodicReport:(id)a3;
- (void)setConnectionListener:(id)a3;
- (void)setDaemonLaunchListener:(id)a3;
- (void)setDeviceIntentListener:(id)a3;
- (void)setDisconnectionListener:(id)a3;
- (void)setEntriesPerHourTimer:(id)a3;
- (void)setNumBTConn:(int64_t)a3;
- (void)setNumEntries:(int64_t)a3;
- (void)setPeriodicReportCount:(int64_t)a3;
- (void)setPeriodicReportListener:(id)a3;
- (void)setPrevActiveKeys:(int64_t)a3;
- (void)setPreviousEvent:(int64_t)a3;
- (void)setPreviousHash:(id)a3;
@end

@implementation PLSecureServiceAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSecureServiceAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1F29E9298;
}

+ (id)entryEventPointDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"ConnectionState";
  objc_super v2 = +[PLSecureServiceAgent entryEventPointDefinitionConnectionState];
  v6[1] = @"Summary";
  v7[0] = v2;
  v3 = +[PLSecureServiceAgent entryEventPointDefinitionSummary];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventPointDefinitionConnectionState
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F29F05F0;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"keyId";
  objc_super v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"UUID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v15[1] = v5;
  v14[2] = @"EventType";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v15[2] = v7;
  v14[3] = @"Confidence";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionSummary
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F05F0;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"ActiveConnections";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"ConnectionCount";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (BOOL)isSecureServiceSupported
{
  return objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 102030, 102031, 102032, 102034, 102035, 102036, 102037, 102038, 102039, 102040, 102041, 0);
}

- (PLSecureServiceAgent)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (+[PLSecureServiceAgent isSecureServiceSupported])
  {
    v15.receiver = self;
    v15.super_class = (Class)PLSecureServiceAgent;
    v3 = [(PLAgent *)&v15 init];
    v4 = v3;
    if (v3)
    {
      v3->_numBTConn = 0;
      v3->_periodicReportCount = 0;
      v3->_prevActiveKeys = -1;
      v3->_numEntries = 0;
      v3->_previousEvent = -1;
      previousHash = v3->_previousHash;
      v3->_previousHash = 0;
    }
    else
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_13;
      }
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__PLSecureServiceAgent_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (qword_1EBD57EF8 != -1) {
        dispatch_once(&qword_1EBD57EF8, block);
      }
      if (!_MergedGlobals_1_20) {
        goto LABEL_13;
      }
      previousHash = [NSString stringWithFormat:@"PLSecureServiceAgent: failed to init"];
      v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent init]"];
      [v8 logMessage:previousHash fromFile:v10 fromFunction:v11 fromLineNumber:130];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = previousHash;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
LABEL_13:
    self = v4;
    v6 = self;
    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

uint64_t __28__PLSecureServiceAgent_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_20 = result;
  return result;
}

- (void)initOperatorDependancies
{
  [(PLOperator *)self defaultDoubleForKey:@"EntriesPerHourTimer"];
  double v4 = v3;
  id v5 = objc_alloc(MEMORY[0x1E4F92A80]);
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];
  uint64_t v7 = [(PLOperator *)self workQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke;
  v25[3] = &unk_1E692A200;
  v25[4] = self;
  v8 = (PLTimer *)[v5 initWithFireDate:v6 withInterval:1 withTolerance:0 repeats:v7 withUserInfo:v25 withQueue:v4 withBlock:0.0];
  entriesPerHourTimer = self->_entriesPerHourTimer;
  self->_entriesPerHourTimer = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_81;
  v24[3] = &unk_1E692A6F8;
  v24[4] = self;
  v11 = (void *)[v10 initWithOperator:self withRegistration:&unk_1F29E92C0 withBlock:v24];
  [(PLSecureServiceAgent *)self setDaemonLaunchListener:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_94;
  v23[3] = &unk_1E692A6F8;
  v23[4] = self;
  v13 = (void *)[v12 initWithOperator:self withRegistration:&unk_1F29E92E8 withBlock:v23];
  [(PLSecureServiceAgent *)self setConnectionListener:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_106;
  v22[3] = &unk_1E692A6F8;
  v22[4] = self;
  objc_super v15 = (void *)[v14 initWithOperator:self withRegistration:&unk_1F29E9310 withBlock:v22];
  [(PLSecureServiceAgent *)self setDisconnectionListener:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_118;
  v21[3] = &unk_1E692A6F8;
  v21[4] = self;
  v17 = (void *)[v16 initWithOperator:self withRegistration:&unk_1F29E9338 withBlock:v21];
  [(PLSecureServiceAgent *)self setDeviceIntentListener:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_130;
  v20[3] = &unk_1E692A6F8;
  v20[4] = self;
  v19 = (void *)[v18 initWithOperator:self withRegistration:&unk_1F29E9360 withBlock:v20];
  [(PLSecureServiceAgent *)self setPeriodicReportListener:v19];
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setNumEntries:0];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2;
    id v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v13 = v2;
    if (qword_1EBD57F00 != -1) {
      dispatch_once(&qword_1EBD57F00, &block);
    }
    if (byte_1EBD57EE9)
    {
      double v3 = objc_msgSend(NSString, "stringWithFormat:", @"PLSecureServiceAgent:: Timer Credit refreshed %lu", *(void *)(*(void *)(a1 + 32) + 120), block, v10, v11, v12, v13);
      double v4 = (void *)MEMORY[0x1E4F929B8];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent initOperatorDependancies]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:141];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v15 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EE9 = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_81(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_82;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57F08 != -1) {
      dispatch_once(&qword_1EBD57F08, block);
    }
    if (byte_1EBD57EEA)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLSecureServiceAgent:: Daemon Launch State =%@ for %@", v8, v7];
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:145];

      objc_super v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointConnectionState:v8 withEvent:0];
}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_82(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EEA = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_94(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_95;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57F10 != -1) {
      dispatch_once(&qword_1EBD57F10, block);
    }
    if (byte_1EBD57EEB)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLSecureServiceAgent:: Connection State=%@ for %@", v8, v7];
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:150];

      objc_super v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointConnectionState:v8 withEvent:1];
}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_95(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EEB = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_106(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_107;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57F18 != -1) {
      dispatch_once(&qword_1EBD57F18, block);
    }
    if (byte_1EBD57EEC)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLSecureServiceAgent:: Disconnection Connection State=%@ for %@", v8, v7];
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:155];

      objc_super v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointConnectionState:v8 withEvent:2];
}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_107(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EEC = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_118(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_119;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57F20 != -1) {
      dispatch_once(&qword_1EBD57F20, block);
    }
    if (byte_1EBD57EED)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLSecureServiceAgent:: Device Intent State=%@ for %@", v8, v7];
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:160];

      objc_super v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointConnectionState:v8 withEvent:3];
}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_119(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EED = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_130(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_131;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57F28 != -1) {
      dispatch_once(&qword_1EBD57F28, block);
    }
    if (byte_1EBD57EEE)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLSecureServiceAgent:: Periodic Report State=%@ for %@", v8, v7];
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:165];

      objc_super v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointPeriodicReport:v8];
}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_131(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EEE = result;
  return result;
}

- (void)logEventPointConnectionState:(id)a3 withEvent:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = NSString;
    uint64_t v9 = [v6 objectForKeyedSubscript:@"UUID"];
    uint64_t v10 = objc_msgSend(v8, "stringWithFormat:", @"%lu", objc_msgSend(v9, "hash"));

    if ((unint64_t)(a4 - 1) <= 1
      && [(NSString *)self->_previousHash isEqualToString:v10]
      && self->_previousEvent == a4)
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_29;
      }
      uint64_t v11 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v11;
      if (qword_1EBD57F30 != -1) {
        dispatch_once(&qword_1EBD57F30, v35);
      }
      if (!byte_1EBD57EEF) {
        goto LABEL_29;
      }
      id v12 = [NSString stringWithFormat:@"PLSecureServiceAgent:: Too many connect/disconnects, avoiding duplicates=%@", v7];
      uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
      id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
      objc_super v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent logEventPointConnectionState:withEvent:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:180];

      v17 = PLLogCommon();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:

LABEL_29:
        goto LABEL_30;
      }
      *(_DWORD *)buf = 138412290;
      v37 = v12;
LABEL_32:
      _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_23;
    }
    int64_t v18 = a4;
    if (a4 != 1)
    {
      if (a4 != 2)
      {
        BOOL v19 = a4 == 3;
        if ((unint64_t)(a4 - 1) >= 3)
        {
          [(PLSecureServiceAgent *)self numEntries];
          goto LABEL_26;
        }
LABEL_17:
        [(PLSecureServiceAgent *)self setNumEntries:[(PLSecureServiceAgent *)self numEntries] + 1];
        if ([(PLSecureServiceAgent *)self numEntries] > 10)
        {
          if (![MEMORY[0x1E4F929C0] debugEnabled]) {
            goto LABEL_29;
          }
          uint64_t v20 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke_145;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v20;
          if (qword_1EBD57F38 != -1) {
            dispatch_once(&qword_1EBD57F38, block);
          }
          if (!byte_1EBD57EF0) {
            goto LABEL_29;
          }
          id v12 = [NSString stringWithFormat:@"PLSecureServiceAgent:: Too many connect/disconnects=%@", v7];
          v21 = (void *)MEMORY[0x1E4F929B8];
          v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m"];
          v23 = [v22 lastPathComponent];
          v24 = [NSString stringWithUTF8String:"-[PLSecureServiceAgent logEventPointConnectionState:withEvent:]"];
          [v21 logMessage:v12 fromFile:v23 fromFunction:v24 fromLineNumber:212];

          v17 = PLLogCommon();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 138412290;
          v37 = v12;
          goto LABEL_32;
        }
LABEL_26:
        v25 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ConnectionState"];
        v26 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v25];
        [v26 setObject:v10 forKeyedSubscript:@"keyId"];
        v27 = [NSNumber numberWithInteger:a4];
        [v26 setObject:v27 forKeyedSubscript:@"EventType"];

        v28 = [v7 objectForKeyedSubscript:@"PeerUUID"];
        [v26 setObject:v28 forKeyedSubscript:@"UUID"];

        if (v19)
        {
          v29 = NSNumber;
          v30 = [v7 objectForKeyedSubscript:@"ConfidenceLevel"];
          [v30 floatValue];
          *(float *)&double v32 = v31 * 100.0;
          v33 = [v29 numberWithFloat:v32];
          [v26 setObject:v33 forKeyedSubscript:@"Confidence"];
        }
        [(PLOperator *)self logEntry:v26];
        self->_previousEvent = a4;
        objc_storeStrong((id *)&self->_previousHash, v10);

        goto LABEL_29;
      }
      if ([(PLSecureServiceAgent *)self numBTConn] <= 0)
      {
LABEL_16:
        BOOL v19 = 0;
        goto LABEL_17;
      }
      int64_t v18 = -1;
    }
    [(PLSecureServiceAgent *)self setNumBTConn:[(PLSecureServiceAgent *)self numBTConn] + v18];
    goto LABEL_16;
  }
LABEL_30:
}

uint64_t __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EEF = result;
  return result;
}

uint64_t __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke_145(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57EF0 = result;
  return result;
}

- (void)logEventPointPeriodicReport:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    [(PLSecureServiceAgent *)self setPeriodicReportCount:[(PLSecureServiceAgent *)self periodicReportCount] + 1];
    id v5 = [v13 objectForKeyedSubscript:@"NumberOfActiveKeys"];
    uint64_t v6 = [v5 integerValue];
    if (v6 == [(PLSecureServiceAgent *)self prevActiveKeys])
    {
      uint64_t v7 = [(PLSecureServiceAgent *)self periodicReportCount];

      id v4 = v13;
      if (v7 >= 4) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v8 = [v13 objectForKeyedSubscript:@"NumberOfActiveKeys"];
    -[PLSecureServiceAgent setPrevActiveKeys:](self, "setPrevActiveKeys:", [v8 integerValue]);

    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Summary"];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
    uint64_t v11 = [v13 objectForKeyedSubscript:@"NumberOfActiveKeys"];
    [v10 setObject:v11 forKeyedSubscript:@"ActiveConnections"];

    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLSecureServiceAgent numBTConn](self, "numBTConn"));
    [v10 setObject:v12 forKeyedSubscript:@"ConnectionCount"];

    [(PLOperator *)self logEntry:v10];
    id v4 = v13;
  }
LABEL_7:
}

- (PLXPCListenerOperatorComposition)daemonLaunchListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDaemonLaunchListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)connectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnectionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)disconnectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisconnectionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)deviceIntentListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDeviceIntentListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)periodicReportListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPeriodicReportListener:(id)a3
{
}

- (PLTimer)entriesPerHourTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEntriesPerHourTimer:(id)a3
{
}

- (int64_t)numBTConn
{
  return self->_numBTConn;
}

- (void)setNumBTConn:(int64_t)a3
{
  self->_numBTConn = a3;
}

- (int64_t)periodicReportCount
{
  return self->_periodicReportCount;
}

- (void)setPeriodicReportCount:(int64_t)a3
{
  self->_periodicReportCount = a3;
}

- (int64_t)prevActiveKeys
{
  return self->_prevActiveKeys;
}

- (void)setPrevActiveKeys:(int64_t)a3
{
  self->_prevActiveKeys = a3;
}

- (int64_t)numEntries
{
  return self->_numEntries;
}

- (void)setNumEntries:(int64_t)a3
{
  self->_numEntries = a3;
}

- (int64_t)previousEvent
{
  return self->_previousEvent;
}

- (void)setPreviousEvent:(int64_t)a3
{
  self->_previousEvent = a3;
}

- (NSString)previousHash
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPreviousHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousHash, 0);
  objc_storeStrong((id *)&self->_entriesPerHourTimer, 0);
  objc_storeStrong((id *)&self->_periodicReportListener, 0);
  objc_storeStrong((id *)&self->_deviceIntentListener, 0);
  objc_storeStrong((id *)&self->_disconnectionListener, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_daemonLaunchListener, 0);
}

@end