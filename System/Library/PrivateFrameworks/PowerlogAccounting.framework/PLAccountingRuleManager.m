@interface PLAccountingRuleManager
+ (id)decryptData:(id)a3 withKey:(id)a4;
+ (id)firstLineWithFile:(id)a3;
+ (id)rulesEntryKey;
+ (id)rulesPath;
+ (id)sharedInstance;
+ (id)storedHashDefaults;
- (NSMutableDictionary)ruleIDToRule;
- (NSRegularExpression)regex;
- (PLAccountingRuleManager)init;
- (id)ruleForRuleID:(id)a3;
- (id)ruleWithString:(id)a3 withEntryDate:(id)a4;
- (id)rulesFromFileWithForceLoad:(BOOL)a3;
- (void)indexRule:(id)a3;
- (void)loadRules;
- (void)setRegex:(id)a3;
- (void)setRuleIDToRule:(id)a3;
@end

@implementation PLAccountingRuleManager

- (id)ruleForRuleID:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__PLAccountingRuleManager_ruleForRuleID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (ruleForRuleID__defaultOnce != -1) {
      dispatch_once(&ruleForRuleID__defaultOnce, block);
    }
    if (ruleForRuleID__classDebugEnabled)
    {
      v6 = NSString;
      v7 = [(PLAccountingRuleManager *)self ruleIDToRule];
      v8 = [v6 stringWithFormat:@"ruleID=%@, ruleIDToRule=%@", v4, v7];

      v9 = (void *)MEMORY[0x263F5F638];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager ruleForRuleID:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:37];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v14 = [(PLAccountingRuleManager *)self ruleIDToRule];
  v15 = [v14 objectForKeyedSubscript:v4];

  return v15;
}

- (NSMutableDictionary)ruleIDToRule
{
  ruleIDToRule = self->_ruleIDToRule;
  if (!ruleIDToRule)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v5 = self->_ruleIDToRule;
    self->_ruleIDToRule = v4;

    ruleIDToRule = self->_ruleIDToRule;
  }
  return ruleIDToRule;
}

+ (id)sharedInstance
{
  return 0;
}

- (PLAccountingRuleManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLAccountingRuleManager;
  v2 = [(PLAccountingRuleManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PLAccountingRuleManager *)v2 loadRules];
  }
  return v3;
}

uint64_t __41__PLAccountingRuleManager_ruleForRuleID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleForRuleID__classDebugEnabled = result;
  return result;
}

- (void)indexRule:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __37__PLAccountingRuleManager_indexRule___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v5;
    if (indexRule__defaultOnce_1 != -1) {
      dispatch_once(&indexRule__defaultOnce_1, &block);
    }
    if (indexRule__classDebugEnabled_1)
    {
      v6 = [NSString stringWithFormat:@"rule=%@", v4, block, v15, v16, v17, v18];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager indexRule:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:42];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [(PLAccountingRuleManager *)self ruleIDToRule];
  v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "entryID"));
  [v12 setObject:v4 forKeyedSubscript:v13];
}

uint64_t __37__PLAccountingRuleManager_indexRule___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  indexRule__classDebugEnabled_1 = result;
  return result;
}

+ (id)rulesEntryKey
{
  return 0;
}

- (void)loadRules
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x263F5F000uLL;
  id v4 = [MEMORY[0x263F5F698] sharedCore];
  uint64_t v5 = [v4 storage];
  v6 = [(id)objc_opt_class() rulesEntryKey];
  v86 = [v5 entriesForKey:v6];

  unint64_t v7 = 0x263F5F000uLL;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v113[0] = MEMORY[0x263EF8330];
    v113[1] = 3221225472;
    v113[2] = __36__PLAccountingRuleManager_loadRules__block_invoke;
    v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v113[4] = v8;
    if (loadRules_defaultOnce != -1) {
      dispatch_once(&loadRules_defaultOnce, v113);
    }
    if (loadRules_classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"rulesFromDB=%@", v86];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager loadRules]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:62];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      unint64_t v3 = 0x263F5F000;
    }
  }
  uint64_t v15 = -[PLAccountingRuleManager rulesFromFileWithForceLoad:](self, "rulesFromFileWithForceLoad:", [v86 count] == 0);
  v84 = (void *)v15;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v112[0] = MEMORY[0x263EF8330];
    v112[1] = 3221225472;
    v112[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_25;
    v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v112[4] = v16;
    if (loadRules_defaultOnce_23 != -1) {
      dispatch_once(&loadRules_defaultOnce_23, v112);
    }
    if (loadRules_classDebugEnabled_24)
    {
      v17 = [NSString stringWithFormat:@"rulesFromFile=%@", v15];
      uint64_t v18 = (void *)MEMORY[0x263F5F638];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager loadRules]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:67];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      uint64_t v15 = (uint64_t)v84;
      unint64_t v3 = 0x263F5F000;
    }
  }
  if (v15)
  {
    v23 = [MEMORY[0x263EFFA08] setWithArray:v86];
    uint64_t v24 = [MEMORY[0x263EFFA08] setWithArray:v15];
    id v87 = v23;
    v25 = (void *)[v23 mutableCopy];
    v85 = (void *)v24;
    [v25 minusSet:v24];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id obj = v25;
    uint64_t v26 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v109;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v109 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v108 + 1) + 8 * v29);
          if ([MEMORY[0x263F5F640] debugEnabled])
          {
            uint64_t v31 = objc_opt_class();
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_32;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v31;
            if (loadRules_defaultOnce_30 != -1) {
              dispatch_once(&loadRules_defaultOnce_30, block);
            }
            if (loadRules_classDebugEnabled_31)
            {
              v32 = [NSString stringWithFormat:@"ruleToDelete=%@", v30];
              v33 = (void *)MEMORY[0x263F5F638];
              v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
              v35 = [v34 lastPathComponent];
              v36 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager loadRules]"];
              [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:78];

              v37 = PLLogCommon();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v32;
                _os_log_debug_impl(&dword_2267F1000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v7 = 0x263F5F000uLL;
              unint64_t v3 = 0x263F5F000uLL;
            }
          }
          v38 = [*(id *)(v3 + 1688) sharedCore];
          v39 = [v38 storage];
          [v39 deleteEntry:v30];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
      }
      while (v27);
    }

    v40 = (void *)[v85 mutableCopy];
    [v40 minusSet:v87];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v90 = v40;
    uint64_t v41 = [v90 countByEnumeratingWithState:&v103 objects:v116 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v104;
      v44 = &__block_literal_global_14;
      do
      {
        uint64_t v45 = 0;
        uint64_t v88 = v42;
        do
        {
          if (*(void *)v104 != v43) {
            objc_enumerationMutation(v90);
          }
          uint64_t v46 = *(void *)(*((void *)&v103 + 1) + 8 * v45);
          if ([MEMORY[0x263F5F640] debugEnabled])
          {
            uint64_t v47 = objc_opt_class();
            v102[0] = MEMORY[0x263EF8330];
            v102[1] = 3221225472;
            v102[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_38;
            v102[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v102[4] = v47;
            if (loadRules_defaultOnce_36 != -1) {
              dispatch_once(&loadRules_defaultOnce_36, v102);
            }
            if (loadRules_classDebugEnabled_37)
            {
              uint64_t v48 = v43;
              v49 = self;
              v50 = v44;
              v51 = [NSString stringWithFormat:@"ruleToAdd=%@", v46];
              v52 = (void *)MEMORY[0x263F5F638];
              v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
              v54 = [v53 lastPathComponent];
              v55 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager loadRules]"];
              [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:86];

              v56 = PLLogCommon();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v51;
                _os_log_debug_impl(&dword_2267F1000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v7 = 0x263F5F000uLL;
              unint64_t v3 = 0x263F5F000uLL;
              v44 = v50;
              self = v49;
              uint64_t v43 = v48;
              uint64_t v42 = v88;
            }
          }
          v57 = [*(id *)(v3 + 1688) sharedCore];
          v58 = [v57 storage];
          [v58 blockingWriteEntry:v46 withCompletionBlock:v44];

          [(PLAccountingRuleManager *)self indexRule:v46];
          ++v45;
        }
        while (v42 != v45);
        uint64_t v42 = [v90 countByEnumeratingWithState:&v103 objects:v116 count:16];
      }
      while (v42);
    }

    v59 = (void *)[v87 mutableCopy];
    [v59 intersectSet:v85];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v89 = v59;
    uint64_t v60 = [v89 countByEnumeratingWithState:&v98 objects:v115 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v99;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v99 != v62) {
            objc_enumerationMutation(v89);
          }
          uint64_t v64 = *(void *)(*((void *)&v98 + 1) + 8 * v63);
          if ([*(id *)(v7 + 1600) debugEnabled])
          {
            uint64_t v65 = objc_opt_class();
            v97[0] = MEMORY[0x263EF8330];
            v97[1] = 3221225472;
            v97[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_2;
            v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v97[4] = v65;
            if (loadRules_defaultOnce_43 != -1) {
              dispatch_once(&loadRules_defaultOnce_43, v97);
            }
            if (loadRules_classDebugEnabled_44)
            {
              v66 = [NSString stringWithFormat:@"ruleInBoth=%@", v64];
              v67 = (void *)MEMORY[0x263F5F638];
              v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
              v69 = [v68 lastPathComponent];
              v70 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager loadRules]"];
              [v67 logMessage:v66 fromFile:v69 fromFunction:v70 fromLineNumber:95];

              v71 = PLLogCommon();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v66;
                _os_log_debug_impl(&dword_2267F1000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v7 = 0x263F5F000;
            }
          }
          [(PLAccountingRuleManager *)self indexRule:v64];
          ++v63;
        }
        while (v61 != v63);
        uint64_t v61 = [v89 countByEnumeratingWithState:&v98 objects:v115 count:16];
      }
      while (v61);
    }
  }
  else
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v87 = v86;
    uint64_t v72 = [v87 countByEnumeratingWithState:&v93 objects:v114 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v94;
      do
      {
        uint64_t v75 = 0;
        do
        {
          if (*(void *)v94 != v74) {
            objc_enumerationMutation(v87);
          }
          uint64_t v76 = *(void *)(*((void *)&v93 + 1) + 8 * v75);
          if ([*(id *)(v7 + 1600) debugEnabled])
          {
            uint64_t v77 = objc_opt_class();
            v92[0] = MEMORY[0x263EF8330];
            v92[1] = 3221225472;
            v92[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_50;
            v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v92[4] = v77;
            if (loadRules_defaultOnce_48 != -1) {
              dispatch_once(&loadRules_defaultOnce_48, v92);
            }
            if (loadRules_classDebugEnabled_49)
            {
              v78 = [NSString stringWithFormat:@"ruleFromDB=%@", v76];
              v79 = (void *)MEMORY[0x263F5F638];
              v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
              v81 = [v80 lastPathComponent];
              v82 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager loadRules]"];
              [v79 logMessage:v78 fromFile:v81 fromFunction:v82 fromLineNumber:102];

              v83 = PLLogCommon();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v78;
                _os_log_debug_impl(&dword_2267F1000, v83, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v7 = 0x263F5F000;
            }
          }
          [(PLAccountingRuleManager *)self indexRule:v76];
          ++v75;
        }
        while (v73 != v75);
        uint64_t v73 = [v87 countByEnumeratingWithState:&v93 objects:v114 count:16];
      }
      while (v73);
    }
  }
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  loadRules_classDebugEnabled = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_25(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  loadRules_classDebugEnabled_24 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_32(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  loadRules_classDebugEnabled_31 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_38(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  loadRules_classDebugEnabled_37 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  loadRules_classDebugEnabled_44 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_50(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  loadRules_classDebugEnabled_49 = result;
  return result;
}

- (id)rulesFromFileWithForceLoad:(BOOL)a3
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)objc_opt_class() rulesPath];
  unint64_t v6 = 0x263F08000uLL;
  if (v5)
  {
    unint64_t v7 = [(id)objc_opt_class() firstLineWithFile:v5];
    if ([v7 rangeOfString:@"Error"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [NSString stringWithFormat:@"*** ERROR: parsing error in file %@", v5];
      v33 = (void *)MEMORY[0x263F5F638];
      v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      v35 = [v34 lastPathComponent];
      v36 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
      [v33 logMessage:v8 fromFile:v35 fromFunction:v36 fromLineNumber:120];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
      id v90 = 0;
      goto LABEL_65;
    }
    uint64_t v8 = [v7 substringFromIndex:3];
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v9 stringWithFormat:@"%@_storedHash", v11];

    unint64_t v13 = 0x263F5F000uLL;
    v14 = [MEMORY[0x263F5F640] objectForKey:v12];
    id v87 = v14;
    id v89 = self;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      v100[0] = MEMORY[0x263EF8330];
      v100[1] = 3221225472;
      v100[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke;
      v100[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v100[4] = v15;
      if (rulesFromFileWithForceLoad__defaultOnce != -1) {
        dispatch_once(&rulesFromFileWithForceLoad__defaultOnce, v100);
      }
      if (rulesFromFileWithForceLoad__classDebugEnabled)
      {
        uint64_t v16 = [NSString stringWithFormat:@"firstLine=%@, fileHash=%@, storedHash=%@", v7, v8, v14];
        v17 = (void *)MEMORY[0x263F5F638];
        uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
        v19 = [v18 lastPathComponent];
        v20 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:128];

        v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        unint64_t v6 = 0x263F08000uLL;
        v14 = v87;
        self = v89;
        unint64_t v13 = 0x263F5F000uLL;
      }
    }
    if (!a3 && v14 && [v8 isEqualToString:v14])
    {
      if (![MEMORY[0x263F5F640] debugEnabled])
      {
        id v90 = 0;
        goto LABEL_64;
      }
      uint64_t v22 = objc_opt_class();
      v99[0] = MEMORY[0x263EF8330];
      v99[1] = 3221225472;
      v99[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_71;
      v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v99[4] = v22;
      if (rulesFromFileWithForceLoad__defaultOnce_69 != -1) {
        dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_69, v99);
      }
      if (!rulesFromFileWithForceLoad__classDebugEnabled_70)
      {
        id v90 = 0;
        v14 = v87;
        goto LABEL_64;
      }
      uint64_t v23 = [NSString stringWithFormat:@"hashes match, skipping parsing"];
      uint64_t v24 = (void *)MEMORY[0x263F5F638];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      uint64_t v26 = [v25 lastPathComponent];
      uint64_t v27 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
      v86 = (void *)v23;
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:132];

      uint64_t v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
      id v90 = 0;
      v14 = v87;
    }
    else
    {
      [MEMORY[0x263F5F640] setObject:v8 forKey:v12 saveToDisk:1];
      v37 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5];
      v86 = v37;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v38 = objc_opt_class();
        v98[0] = MEMORY[0x263EF8330];
        v98[1] = 3221225472;
        v98[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_78;
        v98[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v98[4] = v38;
        if (rulesFromFileWithForceLoad__defaultOnce_76 != -1) {
          dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_76, v98);
        }
        if (rulesFromFileWithForceLoad__classDebugEnabled_77)
        {
          v39 = objc_msgSend(NSString, "stringWithFormat:", @"fileBytes.length=%lu", objc_msgSend(v37, "length"));
          v40 = (void *)MEMORY[0x263F5F638];
          uint64_t v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
          uint64_t v42 = [v41 lastPathComponent];
          uint64_t v43 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
          [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:141];

          v44 = PLLogCommon();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }

          unint64_t v6 = 0x263F08000uLL;
          unint64_t v13 = 0x263F5F000uLL;
          v37 = v86;
        }
      }
      uint64_t v81 = objc_msgSend(v37, "subdataWithRange:", 89, objc_msgSend(v37, "length") - 89);
      uint64_t v45 = [(id)objc_opt_class() decryptData:v81 withKey:@"563e097d3dea5165"];
      uint64_t v46 = NSString;
      id v80 = v45;
      uint64_t v47 = objc_msgSend(v46, "stringWithUTF8String:", objc_msgSend(v80, "bytes"));
      uint64_t v48 = [MEMORY[0x263F08708] newlineCharacterSet];
      v79 = v47;
      v49 = [v47 componentsSeparatedByCharactersInSet:v48];

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v50 = objc_opt_class();
        v97[0] = MEMORY[0x263EF8330];
        v97[1] = 3221225472;
        v97[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_88;
        v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v97[4] = v50;
        if (rulesFromFileWithForceLoad__defaultOnce_86 != -1) {
          dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_86, v97);
        }
        if (rulesFromFileWithForceLoad__classDebugEnabled_87)
        {
          v51 = [NSString stringWithFormat:@"allLines=%@", v49];
          v52 = (void *)MEMORY[0x263F5F638];
          v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
          v54 = [v53 lastPathComponent];
          v55 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
          [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:150];

          v56 = PLLogCommon();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }

          unint64_t v6 = 0x263F08000uLL;
          self = v89;
          unint64_t v13 = 0x263F5F000uLL;
        }
      }
      v82 = v12;
      v83 = v8;
      v84 = v7;
      v85 = v5;
      id v90 = [MEMORY[0x263EFF980] array];
      v57 = [MEMORY[0x263EFF910] monotonicDate];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id obj = v49;
      uint64_t v58 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v94;
        do
        {
          uint64_t v61 = 0;
          do
          {
            if (*(void *)v94 != v60) {
              objc_enumerationMutation(obj);
            }
            uint64_t v62 = *(void *)(*((void *)&v93 + 1) + 8 * v61);
            if ([*(id *)(v13 + 1600) debugEnabled])
            {
              uint64_t v63 = objc_opt_class();
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_96;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v63;
              if (rulesFromFileWithForceLoad__defaultOnce_94 != -1) {
                dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_94, block);
              }
              if (rulesFromFileWithForceLoad__classDebugEnabled_95)
              {
                uint64_t v64 = [*(id *)(v6 + 2880) stringWithFormat:@"line=%@", v62];
                uint64_t v65 = (void *)MEMORY[0x263F5F638];
                v66 = [*(id *)(v6 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
                v67 = [v66 lastPathComponent];
                v68 = [*(id *)(v6 + 2880) stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
                [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:156];

                v69 = PLLogCommon();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v102 = v64;
                  _os_log_debug_impl(&dword_2267F1000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v6 = 0x263F08000uLL;
                self = v89;
                unint64_t v13 = 0x263F5F000uLL;
              }
            }
            v70 = [(PLAccountingRuleManager *)self ruleWithString:v62 withEntryDate:v57];
            if ([*(id *)(v13 + 1600) debugEnabled])
            {
              uint64_t v71 = objc_opt_class();
              v91[0] = MEMORY[0x263EF8330];
              v91[1] = 3221225472;
              v91[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_102;
              v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v91[4] = v71;
              if (rulesFromFileWithForceLoad__defaultOnce_100 != -1) {
                dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_100, v91);
              }
              if (rulesFromFileWithForceLoad__classDebugEnabled_101)
              {
                uint64_t v72 = [*(id *)(v6 + 2880) stringWithFormat:@"rule=%@", v70];
                uint64_t v73 = (void *)MEMORY[0x263F5F638];
                uint64_t v74 = [*(id *)(v6 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
                uint64_t v75 = [v74 lastPathComponent];
                uint64_t v76 = [*(id *)(v6 + 2880) stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
                [v73 logMessage:v72 fromFile:v75 fromFunction:v76 fromLineNumber:160];

                uint64_t v77 = PLLogCommon();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v102 = v72;
                  _os_log_debug_impl(&dword_2267F1000, v77, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v6 = 0x263F08000;
                self = v89;
                unint64_t v13 = 0x263F5F000;
              }
            }
            if (v70) {
              [v90 addObject:v70];
            }

            ++v61;
          }
          while (v59 != v61);
          uint64_t v59 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
        }
        while (v59);
      }

      [(PLAccountingRuleManager *)self setRegex:0];
      unint64_t v7 = v84;
      uint64_t v5 = v85;
      v12 = v82;
      uint64_t v8 = v83;
      v14 = v87;
      uint64_t v28 = v81;
    }

LABEL_64:
LABEL_65:

    goto LABEL_66;
  }
  unint64_t v7 = [NSString stringWithFormat:@"*** ERROR: missing rules file %@", 0];
  uint64_t v29 = (void *)MEMORY[0x263F5F638];
  uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
  uint64_t v31 = [v30 lastPathComponent];
  v32 = [NSString stringWithUTF8String:"-[PLAccountingRuleManager rulesFromFileWithForceLoad:]"];
  [v29 logMessage:v7 fromFile:v31 fromFunction:v32 fromLineNumber:111];

  uint64_t v8 = PLLogCommon();
  id v90 = 0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[PLAccountingDependency activate]();
    id v90 = 0;
  }
LABEL_66:

  return v90;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rulesFromFileWithForceLoad__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_71(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rulesFromFileWithForceLoad__classDebugEnabled_70 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_78(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rulesFromFileWithForceLoad__classDebugEnabled_77 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_88(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rulesFromFileWithForceLoad__classDebugEnabled_87 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_96(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rulesFromFileWithForceLoad__classDebugEnabled_95 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_102(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rulesFromFileWithForceLoad__classDebugEnabled_101 = result;
  return result;
}

+ (id)rulesPath
{
  return 0;
}

+ (id)storedHashDefaults
{
  return 0;
}

+ (id)firstLineWithFile:(id)a3
{
  MEMORY[0x270FA5388](a1, a2, a3);
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = fopen((const char *)[v3 UTF8String], "r");
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v16 = 0;
    int v6 = fscanf(v4, "%4096[^\n]%n%*c", v17, &v16);
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__PLAccountingRuleManager_firstLineWithFile___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (firstLineWithFile__defaultOnce != -1) {
        dispatch_once(&firstLineWithFile__defaultOnce, block);
      }
      if (firstLineWithFile__classDebugEnabled)
      {
        uint64_t v8 = [NSString stringWithFormat:@"buffer=%s, bytesRead=%i", v17, v16];
        v9 = (void *)MEMORY[0x263F5F638];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"+[PLAccountingRuleManager firstLineWithFile:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:189];

        unint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    fclose(v5);
    if (v6)
    {
      id v4 = [NSString stringWithUTF8String:v17];
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

uint64_t __45__PLAccountingRuleManager_firstLineWithFile___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  firstLineWithFile__classDebugEnabled = result;
  return result;
}

- (id)ruleWithString:(id)a3 withEntryDate:(id)a4
{
  return 0;
}

+ (id)decryptData:(id)a3 withKey:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  key[0] = 0;
  key[1] = 0;
  char v30 = 0;
  [a4 getCString:key maxLength:17 encoding:4];
  dataOut = malloc_type_malloc([v5 length] + 16, 0x4E7C9DECuLL);
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingRuleManager_decryptData_withKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (decryptData_withKey__defaultOnce != -1) {
      dispatch_once(&decryptData_withKey__defaultOnce, block);
    }
    if (decryptData_withKey__classDebugEnabled)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"encryptedData.length=%lu", objc_msgSend(v5, "length"));
      v9 = (void *)MEMORY[0x263F5F638];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"+[PLAccountingRuleManager decryptData:withKey:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:215];

      unint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  size_t v27 = 0;
  id v14 = v5;
  CCCryptorStatus v15 = CCCrypt(1u, 0, 3u, key, 0x10uLL, 0, (const void *)[v14 bytes], objc_msgSend(v14, "length"), dataOut, objc_msgSend(v14, "length") + 16, &v27);
  unsigned int v16 = 0;
  size_t v17 = v27;
  *((unsigned char *)dataOut + v27) = 0;
  if (!v15)
  {
    unsigned int v16 = [MEMORY[0x263EFF8F8] dataWithBytes:dataOut length:v17 + 1];
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __47__PLAccountingRuleManager_decryptData_withKey___block_invoke_113;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v18;
    if (decryptData_withKey__defaultOnce_111 != -1) {
      dispatch_once(&decryptData_withKey__defaultOnce_111, v26);
    }
    if (decryptData_withKey__classDebugEnabled_112)
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"numBytesDecrypted=%lu", v27);
      v20 = (void *)MEMORY[0x263F5F638];
      v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m"];
      uint64_t v22 = [v21 lastPathComponent];
      uint64_t v23 = [NSString stringWithUTF8String:"+[PLAccountingRuleManager decryptData:withKey:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:236];

      uint64_t v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  free(dataOut);

  return v16;
}

uint64_t __47__PLAccountingRuleManager_decryptData_withKey___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  decryptData_withKey__classDebugEnabled = result;
  return result;
}

uint64_t __47__PLAccountingRuleManager_decryptData_withKey___block_invoke_113(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  decryptData_withKey__classDebugEnabled_112 = result;
  return result;
}

- (NSRegularExpression)regex
{
  return self->_regex;
}

- (void)setRegex:(id)a3
{
}

- (void)setRuleIDToRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleIDToRule, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end