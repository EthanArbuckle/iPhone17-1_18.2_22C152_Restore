@interface PLTestService
+ (void)load;
- (PLTestService)init;
- (PLXPCResponderOperatorComposition)presubmissionTestResponder;
- (id)presubmissionTest_testEPLMode:(id)a3 withParam:(id)a4;
- (void)initOperatorDependancies;
- (void)setPresubmissionTestResponder:(id)a3;
@end

@implementation PLTestService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLTestService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLTestService)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLTestService;
    v4 = [(PLOperator *)&v14 init];
    if (v4 && [MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __21__PLTestService_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1EBD5C378 != -1) {
        dispatch_once(&qword_1EBD5C378, block);
      }
      if (_MergedGlobals_101)
      {
        v6 = [NSString stringWithFormat:@"PLTestService initialized"];
        v7 = (void *)MEMORY[0x1E4F929B8];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m"];
        v9 = [v8 lastPathComponent];
        v10 = [NSString stringWithUTF8String:"-[PLTestService init]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:32];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

uint64_t __21__PLTestService_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_101 = result;
  return result;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v4 = dispatch_get_global_queue(-32768, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PLTestService_initOperatorDependancies__block_invoke;
  v6[3] = &unk_1E692A118;
  v6[4] = self;
  uint64_t v5 = (void *)[v3 initWithWorkQueue:v4 withRegistration:&unk_1F29EA760 withBlock:v6];
  [(PLTestService *)self setPresubmissionTestResponder:v5];
}

id __41__PLTestService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10
    || ([v10 objectForKeyedSubscript:@"testName"],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    id v27 = 0;
    goto LABEL_27;
  }
  v13 = [v11 objectForKeyedSubscript:@"testName"];
  objc_super v14 = objc_opt_new();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLTestService_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (qword_1EBD5C380 != -1) {
      dispatch_once(&qword_1EBD5C380, block);
    }
    if (byte_1EBD5C371)
    {
      v40 = v14;
      v16 = NSString;
      uint64_t v17 = [v11 objectForKeyedSubscript:@"testParam"];
      v18 = [v16 stringWithFormat:@"presubmissionTestResponder testName=%@ testParam=%@", v13, v17];

      v19 = (void *)MEMORY[0x1E4F929B8];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m"];
      v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLTestService initOperatorDependancies]_block_invoke"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:43];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      objc_super v14 = v40;
    }
  }
  if ([v13 isEqualToString:@"DebugServiceForATP"])
  {
    v24 = [v11 objectForKeyedSubscript:@"testParam"];
    if (v24)
    {
      v25 = [v11 objectForKeyedSubscript:@"testParam"];
      uint64_t v26 = [v25 isEqualToString:@"ENABLE"];
    }
    else
    {
      uint64_t v26 = 0;
    }

    v30 = (void *)MEMORY[0x1E4F929C0];
    v31 = [NSNumber numberWithBool:v26];
    [v30 setObject:v31 forKey:@"PLDebugService_Enabled" saveToDisk:1];

    [MEMORY[0x1E4F92A88] exitWithReason:8];
    goto LABEL_18;
  }
  if (![v13 isEqualToString:@"testEPLMode"])
  {
LABEL_18:
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v32 = objc_opt_class();
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __41__PLTestService_initOperatorDependancies__block_invoke_56;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v32;
      if (qword_1EBD5C388 != -1) {
        dispatch_once(&qword_1EBD5C388, v41);
      }
      if (byte_1EBD5C372)
      {
        v33 = [NSString stringWithFormat:@"payload=%@\nresult=%@", v11, v14];
        v34 = (void *)MEMORY[0x1E4F929B8];
        v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m"];
        v36 = [v35 lastPathComponent];
        v37 = [NSString stringWithUTF8String:"-[PLTestService initOperatorDependancies]_block_invoke_2"];
        [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:55];

        v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v33;
          _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v27 = v14;
    goto LABEL_26;
  }
  v28 = *(void **)(a1 + 32);
  v29 = [v11 objectForKeyedSubscript:@"testParam"];
  objc_msgSend(v28, "presubmissionTest_testEPLMode:withParam:", v14, v29);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
LABEL_27:

  return v27;
}

uint64_t __41__PLTestService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C371 = result;
  return result;
}

uint64_t __41__PLTestService_initOperatorDependancies__block_invoke_56(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C372 = result;
  return result;
}

- (id)presubmissionTest_testEPLMode:(id)a3 withParam:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1EBD5C390 != -1) {
      dispatch_once(&qword_1EBD5C390, block);
    }
    if (byte_1EBD5C373)
    {
      id v8 = [NSString stringWithFormat:@"presubmissionTest_testEPLMode with param=%@", v6];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLTestService presubmissionTest_testEPLMode:withParam:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:62];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v14 = [MEMORY[0x1E4F929C0] eplEnabled];
  if (v6)
  {
    int v15 = v14;
    if ([v6 isEqualToString:@"ENABLE"])
    {
      v16 = @"FAIL";
      uint64_t v17 = @"PASS";
    }
    else
    {
      if (![v6 isEqualToString:@"DISABLE"]) {
        goto LABEL_17;
      }
      v16 = @"PASS";
      uint64_t v17 = @"FAIL";
    }
    if (v15) {
      v18 = v17;
    }
    else {
      v18 = v16;
    }
    [v5 setObject:v18 forKeyedSubscript:v6];
  }
LABEL_17:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke_76;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v19;
    if (qword_1EBD5C398 != -1) {
      dispatch_once(&qword_1EBD5C398, v27);
    }
    if (byte_1EBD5C374)
    {
      v20 = [NSString stringWithFormat:@"presubmissionTest_testEPLMode with result=%@", v5];
      v21 = (void *)MEMORY[0x1E4F929B8];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m"];
      v23 = [v22 lastPathComponent];
      v24 = [NSString stringWithUTF8String:"-[PLTestService presubmissionTest_testEPLMode:withParam:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:74];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }

  return v5;
}

uint64_t __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C373 = result;
  return result;
}

uint64_t __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke_76(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C374 = result;
  return result;
}

- (PLXPCResponderOperatorComposition)presubmissionTestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPresubmissionTestResponder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end