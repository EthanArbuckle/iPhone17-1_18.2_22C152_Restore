@interface PLWatchKitAgent
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLXPCListenerOperatorComposition)xpcHandler;
- (id)appNameForWatchAppExtension:(id)a3;
- (void)initOperatorDependancies;
- (void)setXpcHandler:(id)a3;
@end

@implementation PLWatchKitAgent

+ (void)load
{
  v2 = (void *)MEMORY[0x1E4F929B0];
  uint64_t v3 = objc_opt_class();
  [v2 registerOperator:v3];
}

+ (id)entryEventPointDefinitions
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22 = @"WatchKitTransport";
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v18[0] = *MEMORY[0x1E4F92CD0];
  v18[1] = v2;
  v19[0] = &unk_1F29F0E90;
  v19[1] = MEMORY[0x1E4F1CC38];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"action";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v17[0] = v3;
  v16[1] = @"bundleID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v17[1] = v5;
  v16[2] = @"length";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v17[2] = v7;
  v16[3] = @"count";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v23[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  return v12;
}

- (void)initOperatorDependancies
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__PLWatchKitAgent_initOperatorDependancies__block_invoke;
    v6[3] = &unk_1E692A6F8;
    v6[4] = self;
    v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29EAAD0 withBlock:v6];
    xpcHandler = self->_xpcHandler;
    self->_xpcHandler = v4;
  }
}

void __43__PLWatchKitAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ([v7 isEqualToString:@"SP-transport"])
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v8;
    uint64_t v43 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v43)
    {
      id v40 = v8;
      id v41 = v7;
      uint64_t v42 = *(void *)v56;
      uint64_t v47 = *MEMORY[0x1E4F92D48];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v56 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = v9;
          v10 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * v9)];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v46 = v10;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v48 = *(void *)v52;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v52 != v48) {
                  objc_enumerationMutation(v46);
                }
                v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
                v15 = +[PLOperator entryKeyForType:v47 andName:@"WatchKitTransport"];
                v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15];
                v17 = [v14 objectForKeyedSubscript:@"action"];
                [v16 setObject:v17 forKeyedSubscript:@"action"];

                v18 = [v14 objectForKeyedSubscript:@"application"];
                [v16 setObject:v18 forKeyedSubscript:@"bundleID"];

                v19 = [v14 objectForKeyedSubscript:@"length"];
                [v16 setObject:v19 forKeyedSubscript:@"length"];

                v20 = [v14 objectForKeyedSubscript:@"count"];
                [v16 setObject:v20 forKeyedSubscript:@"count"];

                [*(id *)(a1 + 32) logEntry:v16];
                if ([MEMORY[0x1E4F929C0] debugEnabled])
                {
                  uint64_t v21 = objc_opt_class();
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_2;
                  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  block[4] = v21;
                  if (qword_1EBD5C3A8 != -1) {
                    dispatch_once(&qword_1EBD5C3A8, block);
                  }
                  if (_MergedGlobals_102)
                  {
                    v22 = [NSString stringWithFormat:@"Entry %@", v16];
                    v23 = (void *)MEMORY[0x1E4F929B8];
                    v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLWatchKitAgent.m"];
                    v25 = [v24 lastPathComponent];
                    v26 = [NSString stringWithUTF8String:"-[PLWatchKitAgent initOperatorDependancies]_block_invoke"];
                    [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:77];

                    v27 = PLLogCommon();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v62 = (uint64_t)v22;
                      _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
                if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
                {
                  v28 = [v16 objectForKeyedSubscript:@"bundleID"];
                  if (v28)
                  {
                    v29 = [MEMORY[0x1E4F92900] sharedInstance];
                    v30 = [*(id *)(a1 + 32) appNameForWatchAppExtension:v28];
                    v59 = v30;
                    v60 = &unk_1F29F0EA0;
                    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
                    v32 = [v16 entryDate];
                    [v29 createDistributionEventPointWithDistributionID:32 withChildNodeNameToWeight:v31 withStartDate:v32];
                  }
                }

                ++v13;
              }
              while (v12 != v13);
              uint64_t v12 = [v46 countByEnumeratingWithState:&v51 objects:v63 count:16];
            }
            while (v12);
          }

          uint64_t v9 = v45 + 1;
        }
        while (v45 + 1 != v43);
        uint64_t v43 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v43);
      id v8 = v40;
      id v7 = v41;
    }
LABEL_35:

    goto LABEL_36;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v33 = objc_opt_class();
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_52;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v33;
    if (qword_1EBD5C3B0 != -1) {
      dispatch_once(&qword_1EBD5C3B0, v49);
    }
    if (byte_1EBD5C3A1)
    {
      uint64_t v34 = [NSString stringWithFormat:@"New event: %@ = %@", v7, v8];
      v35 = (void *)MEMORY[0x1E4F929B8];
      v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLWatchKitAgent.m"];
      v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLWatchKitAgent initOperatorDependancies]_block_invoke_2"];
      id obj = (id)v34;
      [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:93];

      v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v62 = v34;
        _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_35;
    }
  }
LABEL_36:
}

uint64_t __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_102 = result;
  return result;
}

uint64_t __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_52(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3A1 = result;
  return result;
}

- (id)appNameForWatchAppExtension:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@".watchapp"])
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@".watchapp" withString:&stru_1F294E108];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (PLXPCListenerOperatorComposition)xpcHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end