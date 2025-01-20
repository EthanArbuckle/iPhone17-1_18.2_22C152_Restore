@interface PLHealthKitAgent
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLXPCListenerOperatorComposition)cloudSyncHandler;
- (PLXPCListenerOperatorComposition)queryHandler;
- (void)initOperatorDependancies;
- (void)setCloudSyncHandler:(id)a3;
- (void)setQueryHandler:(id)a3;
@end

@implementation PLHealthKitAgent

+ (void)load
{
  v2 = (void *)MEMORY[0x1E4F929B0];
  uint64_t v3 = objc_opt_class();
  [v2 registerOperator:v3];
}

+ (id)entryEventPointDefinitions
{
  v62[2] = *MEMORY[0x1E4F143B8];
  v61[0] = @"HealthKitQuery";
  uint64_t v58 = *MEMORY[0x1E4F92C50];
  uint64_t v2 = v58;
  uint64_t v4 = *MEMORY[0x1E4F92C08];
  v56[0] = *MEMORY[0x1E4F92CD0];
  uint64_t v3 = v56[0];
  v56[1] = v4;
  v57[0] = &unk_1F29F0FE0;
  v57[1] = MEMORY[0x1E4F1CC38];
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  v60[0] = v47;
  uint64_t v59 = *MEMORY[0x1E4F92CA8];
  uint64_t v5 = v59;
  v54[0] = @"clientID";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v55[0] = v45;
  v54[1] = @"bundleID";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_StringFormat_withBundleID");
  v55[1] = v43;
  v54[2] = @"queryID";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_StringFormat");
  v55[2] = v41;
  v54[3] = @"queryType";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  v39 = objc_msgSend(v40, "commonTypeDict_StringFormat");
  v55[3] = v39;
  v54[4] = @"totalDuration";
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
  v55[4] = v37;
  v54[5] = @"isBackgroundQuery";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_BoolFormat");
  v55[5] = v35;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:6];
  v60[1] = v34;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v58 count:2];
  v61[1] = @"HealthKitCloudSync";
  v62[0] = v33;
  uint64_t v50 = v3;
  v51 = &unk_1F29F0FF0;
  v52[0] = v2;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v52[1] = v5;
  v53[0] = v32;
  v48[0] = @"options";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v49[0] = v30;
  v48[1] = @"reason";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v49[1] = v28;
  v48[2] = @"operation";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v49[2] = v26;
  v48[3] = @"zone-count";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v49[3] = v24;
  v48[4] = @"rebase-reason";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v49[4] = v22;
  v48[5] = @"deadline";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v49[5] = v20;
  v48[6] = @"epoch-change";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v49[6] = v18;
  v48[7] = @"status";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v49[7] = v6;
  v48[8] = @"result";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v49[8] = v8;
  v48[9] = @"upload";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v49[9] = v10;
  v48[10] = @"download";
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  v12 = objc_msgSend(v11, "commonTypeDict_BoolFormat");
  v49[10] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:11];
  v53[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
  v62[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];

  return v15;
}

- (void)initOperatorDependancies
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    if ([MEMORY[0x1E4F929C0] fullMode])
    {
      if ([MEMORY[0x1E4F92A88] isHealthDataSubmissionAllowed])
      {
        id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __44__PLHealthKitAgent_initOperatorDependancies__block_invoke;
        v10[3] = &unk_1E692A6F8;
        v10[4] = self;
        uint64_t v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29EADA0 withBlock:v10];
        queryHandler = self->_queryHandler;
        self->_queryHandler = v4;
      }
    }
    id v6 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_2;
    v9[3] = &unk_1E692A6F8;
    v9[4] = self;
    v7 = (PLXPCListenerOperatorComposition *)[v6 initWithOperator:self withRegistration:&unk_1F29EADC8 withBlock:v9];
    cloudSyncHandler = self->_cloudSyncHandler;
    self->_cloudSyncHandler = v7;
  }
}

void __44__PLHealthKitAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *MEMORY[0x1E4F92D48];
  id v7 = a5;
  id v18 = +[PLOperator entryKeyForType:v6 andName:@"HealthKitQuery"];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v18];
  v9 = [v7 objectForKeyedSubscript:@"clientId"];
  [v8 setObject:v9 forKeyedSubscript:@"clientID"];

  v10 = [v7 objectForKeyedSubscript:@"bundleId"];
  [v8 setObject:v10 forKeyedSubscript:@"bundleID"];

  v11 = [v7 objectForKeyedSubscript:@"queryId"];
  [v8 setObject:v11 forKeyedSubscript:@"queryID"];

  v12 = [v7 objectForKeyedSubscript:@"queryType"];
  [v8 setObject:v12 forKeyedSubscript:@"queryType"];

  v13 = [v7 objectForKeyedSubscript:@"totalDuration"];
  [v8 setObject:v13 forKeyedSubscript:@"totalDuration"];

  v14 = [v7 objectForKeyedSubscript:@"isBackgroundQuery"];

  uint64_t v15 = MEMORY[0x1E4F1CC38];
  int v16 = [v14 isEqual:MEMORY[0x1E4F1CC38]];

  if (v16) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = MEMORY[0x1E4F1CC28];
  }
  [v8 setObject:v17 forKeyedSubscript:@"isBackgroundQuery"];
  [*(id *)(a1 + 32) logEntry:v8];
}

void __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_3;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v7;
    if (qword_1EBD5A1C0 != -1) {
      dispatch_once(&qword_1EBD5A1C0, &block);
    }
    if (_MergedGlobals_1_51)
    {
      v8 = [NSString stringWithFormat:@"Payload: %@", v6, block, v28, v29, v30, v31];
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLHealthKitAgent.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLHealthKitAgent initOperatorDependancies]_block_invoke_2"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:228];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"HealthKitCloudSync"];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
  int v16 = [v6 objectForKeyedSubscript:@"options"];
  [v15 setObject:v16 forKeyedSubscript:@"options"];

  uint64_t v17 = [v6 objectForKeyedSubscript:@"reason"];
  [v15 setObject:v17 forKeyedSubscript:@"reason"];

  id v18 = [v6 objectForKeyedSubscript:@"operation"];
  [v15 setObject:v18 forKeyedSubscript:@"operation"];

  v19 = [v6 objectForKeyedSubscript:@"zone-count"];
  [v15 setObject:v19 forKeyedSubscript:@"zone-count"];

  v20 = [v6 objectForKeyedSubscript:@"rebase-reason"];
  [v15 setObject:v20 forKeyedSubscript:@"rebase-reason"];

  v21 = [v6 objectForKeyedSubscript:@"deadline"];
  [v15 setObject:v21 forKeyedSubscript:@"deadline"];

  v22 = [v6 objectForKeyedSubscript:@"epoch-change"];
  [v15 setObject:v22 forKeyedSubscript:@"epoch-change"];

  v23 = [v6 objectForKeyedSubscript:@"status"];
  [v15 setObject:v23 forKeyedSubscript:@"status"];

  v24 = [v6 objectForKeyedSubscript:@"result"];
  [v15 setObject:v24 forKeyedSubscript:@"result"];

  v25 = [v6 objectForKeyedSubscript:@"upload"];
  [v15 setObject:v25 forKeyedSubscript:@"upload"];

  v26 = [v6 objectForKeyedSubscript:@"download"];
  [v15 setObject:v26 forKeyedSubscript:@"download"];

  [*(id *)(a1 + 32) logEntry:v15];
}

uint64_t __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_51 = result;
  return result;
}

- (PLXPCListenerOperatorComposition)queryHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueryHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cloudSyncHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCloudSyncHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncHandler, 0);
  objc_storeStrong((id *)&self->_queryHandler, 0);
}

@end