@interface PLMDNSAgent
+ (id)entryEventBackwardDefinitionClientSummary;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)entryEventPointDefinitionsReceivedMDNSEvent;
+ (void)load;
- (PLMDNSAgent)init;
- (PLXPCListenerOperatorComposition)clientSummary;
- (PLXPCListenerOperatorComposition)startAdvertise;
- (PLXPCListenerOperatorComposition)startBrowse;
- (PLXPCListenerOperatorComposition)startResolve;
- (PLXPCListenerOperatorComposition)stopAdvertise;
- (PLXPCListenerOperatorComposition)stopBrowse;
- (PLXPCListenerOperatorComposition)stopResolve;
- (void)initOperatorDependancies;
- (void)logEventBackwardClientSummary:(id)a3;
- (void)logEventPointMDNS:(id)a3 forEvent:(id)a4;
- (void)setClientSummary:(id)a3;
- (void)setStartAdvertise:(id)a3;
- (void)setStartBrowse:(id)a3;
- (void)setStartResolve:(id)a3;
- (void)setStopAdvertise:(id)a3;
- (void)setStopBrowse:(id)a3;
- (void)setStopResolve:(id)a3;
@end

@implementation PLMDNSAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLMDNSAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"MDNSEvent";
  objc_super v2 = [a1 entryEventPointDefinitionsReceivedMDNSEvent];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionsReceivedMDNSEvent
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F04C0;
  v20[1] = MEMORY[0x1E4F1CC38];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"eventName";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v18[0] = v14;
  v17[1] = @"clientName";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  v17[2] = @"clientPID";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v18[2] = v6;
  v17[3] = @"recordType";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v18[3] = v8;
  v17[4] = @"service";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"ClientSummary";
  uint64_t v2 = [a1 entryEventBackwardDefinitionClientSummary];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventBackwardDefinitionClientSummary
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F04C0;
  v28[1] = MEMORY[0x1E4F1CC38];
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"clientName";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat_withProcessName");
  v26[0] = v22;
  v25[1] = @"carryoverCountAWDL";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v26[1] = v20;
  v25[2] = @"carryoverCountInfra";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v26[2] = v18;
  v25[3] = @"durationAWDL";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v26[3] = v16;
  v25[4] = @"durationInfra";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v26[4] = v14;
  v25[5] = @"startCountAWDL";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  v25[6] = @"startCountInfra";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v26[6] = v6;
  v25[7] = @"stopCountAWDL";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[7] = v8;
  v25[8] = @"stopCountInfra";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
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

- (PLMDNSAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLMDNSAgent;
  return [(PLAgent *)&v3 init];
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke;
  v23[3] = &unk_1E692A6F8;
  v23[4] = self;
  v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29E8FC8 withBlock:v23];
  [(PLMDNSAgent *)self setStartBrowse:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_98;
  v22[3] = &unk_1E692A6F8;
  void v22[4] = self;
  v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F29E8FF0 withBlock:v22];
  [(PLMDNSAgent *)self setStopBrowse:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_107;
  v21[3] = &unk_1E692A6F8;
  v21[4] = self;
  v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F29E9018 withBlock:v21];
  [(PLMDNSAgent *)self setStartAdvertise:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_116;
  v20[3] = &unk_1E692A6F8;
  v20[4] = self;
  v10 = (void *)[v9 initWithOperator:self withRegistration:&unk_1F29E9040 withBlock:v20];
  [(PLMDNSAgent *)self setStopAdvertise:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_122;
  v19[3] = &unk_1E692A6F8;
  v19[4] = self;
  v12 = (void *)[v11 initWithOperator:self withRegistration:&unk_1F29E9068 withBlock:v19];
  [(PLMDNSAgent *)self setStartResolve:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_131;
  v18[3] = &unk_1E692A6F8;
  v18[4] = self;
  v14 = (void *)[v13 initWithOperator:self withRegistration:&unk_1F29E9090 withBlock:v18];
  [(PLMDNSAgent *)self setStopResolve:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_142;
  v17[3] = &unk_1E692A6F8;
  v17[4] = self;
  v16 = (void *)[v15 initWithOperator:self withRegistration:&unk_1F29E90B8 withBlock:v17];
  [(PLMDNSAgent *)self setClientSummary:v16];
}

void __39__PLMDNSAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57C58 != -1) {
      dispatch_once(&qword_1EBD57C58, block);
    }
    if (_MergedGlobals_1_14)
    {
      v10 = [NSString stringWithFormat:@"PLMDNSAgent:: AWDL Browse state with payload=%@ for %@", v8, v7];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLMDNSAgent.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLMDNSAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:157];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMDNS:v8 forEvent:@"startAWDLBrowse"];
}

uint64_t __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_14 = result;
  return result;
}

void __39__PLMDNSAgent_initOperatorDependancies__block_invoke_98(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_99;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57C60 != -1) {
      dispatch_once(&qword_1EBD57C60, block);
    }
    if (byte_1EBD57C41)
    {
      v10 = [NSString stringWithFormat:@"PLMDNSAgent:: AWDL Browse with payload=%@ for %@", v8, v7];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLMDNSAgent.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLMDNSAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:162];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMDNS:v8 forEvent:@"stopAWDLBrowse"];
}

uint64_t __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_99(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C41 = result;
  return result;
}

void __39__PLMDNSAgent_initOperatorDependancies__block_invoke_107(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_108;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57C68 != -1) {
      dispatch_once(&qword_1EBD57C68, block);
    }
    if (byte_1EBD57C42)
    {
      v10 = [NSString stringWithFormat:@"PLMDNSAgent:: AWDL Advertise with payload=%@ for %@", v8, v7];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLMDNSAgent.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLMDNSAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:168];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMDNS:v8 forEvent:@"startAWDLAdvertise"];
}

uint64_t __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_108(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C42 = result;
  return result;
}

void __39__PLMDNSAgent_initOperatorDependancies__block_invoke_116(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_117;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57C70 != -1) {
      dispatch_once(&qword_1EBD57C70, block);
    }
    if (byte_1EBD57C43)
    {
      v10 = [NSString stringWithFormat:@"PLMDNSAgent:: AWDL Advertise with payload=%@ for %@", v8, v7];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLMDNSAgent.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLMDNSAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:174];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMDNS:v8 forEvent:@"stopAWDLAdvertise"];
}

uint64_t __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_117(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C43 = result;
  return result;
}

void __39__PLMDNSAgent_initOperatorDependancies__block_invoke_122(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_123;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57C78 != -1) {
      dispatch_once(&qword_1EBD57C78, block);
    }
    if (byte_1EBD57C44)
    {
      v10 = [NSString stringWithFormat:@"PLMDNSAgent:: AWDL Resolve with payload=%@ for %@", v8, v7];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLMDNSAgent.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLMDNSAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:180];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMDNS:v8 forEvent:@"startAWDLResolve"];
}

uint64_t __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_123(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C44 = result;
  return result;
}

void __39__PLMDNSAgent_initOperatorDependancies__block_invoke_131(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_132;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD57C80 != -1) {
      dispatch_once(&qword_1EBD57C80, block);
    }
    if (byte_1EBD57C45)
    {
      v10 = [NSString stringWithFormat:@"PLMDNSAgent:: AWDL Resolve with payload=%@ for %@", v8, v7];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLMDNSAgent.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLMDNSAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:186];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMDNS:v8 forEvent:@"stopAWDLResolve"];
  v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"stopAWDLResolve"];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16 withRawData:v8];
  [*(id *)(a1 + 32) logEntry:v17];
}

uint64_t __39__PLMDNSAgent_initOperatorDependancies__block_invoke_2_132(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C45 = result;
  return result;
}

void __39__PLMDNSAgent_initOperatorDependancies__block_invoke_142(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = PLLogMDNS();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "mDNSResponder eventName: %@ | payload= %@", (uint8_t *)&v10, 0x16u);
  }

  [*(id *)(a1 + 32) logEventBackwardClientSummary:v8];
}

- (void)logEventPointMDNS:(id)a3 forEvent:(id)a4
{
  id v12 = a4;
  uint64_t v6 = *MEMORY[0x1E4F92D48];
  id v7 = a3;
  id v8 = +[PLOperator entryKeyForType:v6 andName:@"MDNSEvent"];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v7];

  if ([v12 isEqualToString:@"startAWDLAdvertise"])
  {
    uint64_t v10 = 3;
  }
  else if ([v12 isEqualToString:@"stopAWDLAdvertise"])
  {
    uint64_t v10 = 4;
  }
  else if ([v12 isEqualToString:@"startAWDLBrowse"])
  {
    uint64_t v10 = 1;
  }
  else if ([v12 isEqualToString:@"stopAWDLBrowse"])
  {
    uint64_t v10 = 2;
  }
  else if ([v12 isEqualToString:@"startAWDLResolve"])
  {
    uint64_t v10 = 5;
  }
  else if ([v12 isEqualToString:@"stopAWDLResolve"])
  {
    uint64_t v10 = 6;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [NSNumber numberWithInt:v10];
  [v9 setObject:v11 forKeyedSubscript:@"eventName"];

  [(PLOperator *)self logEntry:v9];
}

- (void)logEventBackwardClientSummary:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  uint64_t v6 = +[PLOperator entryKeyForType:v4 andName:@"ClientSummary"];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __45__PLMDNSAgent_logEventBackwardClientSummary___block_invoke;
  v16 = &unk_1E692B758;
  id v9 = v6;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  [v5 enumerateKeysAndObjectsUsingBlock:&v13];

  if (objc_msgSend(v11, "count", v13, v14, v15, v16))
  {
    id v20 = v9;
    v21[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [(PLOperator *)self logEntries:v12 withGroupID:v9];
  }
}

void __45__PLMDNSAgent_logEventBackwardClientSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
    [v7 setObject:v5 forKeyedSubscript:@"clientName"];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __45__PLMDNSAgent_logEventBackwardClientSummary___block_invoke_146;
    uint64_t v13 = &unk_1E692B730;
    id v8 = v7;
    uint64_t v14 = v8;
    id v15 = v6;
    [v15 enumerateKeysAndObjectsUsingBlock:&v10];
    id v9 = PLLogMDNS();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "logEventBackwardClientSummary summary entry: %@ for clientName %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8, v10, v11, v12, v13);
  }
  else
  {
    id v8 = PLLogMDNS();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "logEventBackwardClientSummary payload for clientName %@ is not NSDictionary", buf, 0xCu);
    }
  }
}

void __45__PLMDNSAgent_logEventBackwardClientSummary___block_invoke_146(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v7 = [v4 objectForKeyedSubscript:v5];
  id v6 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v7, "intValue"));
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (PLXPCListenerOperatorComposition)startBrowse
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartBrowse:(id)a3
{
}

- (PLXPCListenerOperatorComposition)stopBrowse
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStopBrowse:(id)a3
{
}

- (PLXPCListenerOperatorComposition)startAdvertise
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStartAdvertise:(id)a3
{
}

- (PLXPCListenerOperatorComposition)stopAdvertise
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStopAdvertise:(id)a3
{
}

- (PLXPCListenerOperatorComposition)startResolve
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStartResolve:(id)a3
{
}

- (PLXPCListenerOperatorComposition)stopResolve
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStopResolve:(id)a3
{
}

- (PLXPCListenerOperatorComposition)clientSummary
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSummary, 0);
  objc_storeStrong((id *)&self->_stopResolve, 0);
  objc_storeStrong((id *)&self->_startResolve, 0);
  objc_storeStrong((id *)&self->_stopAdvertise, 0);
  objc_storeStrong((id *)&self->_startAdvertise, 0);
  objc_storeStrong((id *)&self->_stopBrowse, 0);
  objc_storeStrong((id *)&self->_startBrowse, 0);
}

@end