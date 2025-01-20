@interface PLAccountingDistributionRuleManager
+ (id)rulesEntryKey;
+ (id)rulesPath;
+ (id)sharedInstance;
- (NSMutableDictionary)distributionIDToDistributionRules;
- (NSMutableDictionary)rootNodeIDToNodeIDToDistributionRule;
- (id)distributionRuleForRootNodeID:(id)a3 andNodeID:(id)a4;
- (id)distributionRulesForDistributionID:(id)a3;
- (id)regex;
- (id)ruleWithString:(id)a3 withEntryDate:(id)a4;
- (void)indexRule:(id)a3;
- (void)setDistributionIDToDistributionRules:(id)a3;
- (void)setRegex:(id)a3;
- (void)setRootNodeIDToNodeIDToDistributionRule:(id)a3;
@end

@implementation PLAccountingDistributionRuleManager

- (id)distributionRuleForRootNodeID:(id)a3 andNodeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (distributionRuleForRootNodeID_andNodeID__defaultOnce != -1) {
      dispatch_once(&distributionRuleForRootNodeID_andNodeID__defaultOnce, block);
    }
    if (distributionRuleForRootNodeID_andNodeID__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"rootNodeID=%@, nodeID=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager distributionRuleForRootNodeID:andNodeID:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:36];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingDistributionRuleManager *)self rootNodeIDToNodeIDToDistributionRule];
  v16 = [v15 objectForKeyedSubscript:v6];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke_18;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v17;
    if (distributionRuleForRootNodeID_andNodeID__defaultOnce_16 != -1) {
      dispatch_once(&distributionRuleForRootNodeID_andNodeID__defaultOnce_16, v26);
    }
    if (distributionRuleForRootNodeID_andNodeID__classDebugEnabled_17)
    {
      v18 = [NSString stringWithFormat:@"nodeIDToDistributionRule=%@", v16];
      v19 = (void *)MEMORY[0x263F5F638];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
      v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager distributionRuleForRootNodeID:andNodeID:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:40];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v16)
  {
    v24 = [v16 objectForKeyedSubscript:v7];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSMutableDictionary)rootNodeIDToNodeIDToDistributionRule
{
  rootNodeIDToNodeIDToDistributionRule = self->_rootNodeIDToNodeIDToDistributionRule;
  if (!rootNodeIDToNodeIDToDistributionRule)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = self->_rootNodeIDToNodeIDToDistributionRule;
    self->_rootNodeIDToNodeIDToDistributionRule = v4;

    rootNodeIDToNodeIDToDistributionRule = self->_rootNodeIDToNodeIDToDistributionRule;
  }
  return rootNodeIDToNodeIDToDistributionRule;
}

+ (id)sharedInstance
{
  v3 = [MEMORY[0x263F5F698] sharedCore];
  v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PLAccountingDistributionRuleManager_sharedInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedInstance_onceToken_0 != -1) {
      dispatch_once(&sharedInstance_onceToken_0, block);
    }
    id v6 = (id)sharedInstance_sharedInstance_0;
  }
  return v6;
}

- (id)distributionRulesForDistributionID:(id)a3
{
  id v4 = a3;
  char v5 = [(PLAccountingDistributionRuleManager *)self distributionIDToDistributionRules];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSMutableDictionary)distributionIDToDistributionRules
{
  distributionIDToDistributionRules = self->_distributionIDToDistributionRules;
  if (!distributionIDToDistributionRules)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    char v5 = self->_distributionIDToDistributionRules;
    self->_distributionIDToDistributionRules = v4;

    distributionIDToDistributionRules = self->_distributionIDToDistributionRules;
  }
  return distributionIDToDistributionRules;
}

uint64_t __53__PLAccountingDistributionRuleManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

uint64_t __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  distributionRuleForRootNodeID_andNodeID__classDebugEnabled = result;
  return result;
}

uint64_t __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke_18(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  distributionRuleForRootNodeID_andNodeID__classDebugEnabled_17 = result;
  return result;
}

- (id)regex
{
  regex = self->_regex;
  if (!regex)
  {
    [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([-.\\w]*) -> .* \\[label=\"([-\\w]*): ([-\\w]*)\"]" options:0 error:0];
    id v4 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    char v5 = self->_regex;
    self->_regex = v4;

    regex = self->_regex;
  }
  return regex;
}

+ (id)rulesEntryKey
{
  return +[PLAccountingDistributionRuleEntry entryKey];
}

+ (id)rulesPath
{
  v2 = NSString;
  v3 = [MEMORY[0x263F5F668] kPLDeviceClassName];
  id v4 = [v2 stringWithFormat:@"Distribution_Rules_%@.txt", v3];

  char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [(__CFString *)v4 stringByDeletingPathExtension];
  id v7 = [(__CFString *)v4 pathExtension];
  uint64_t v8 = [v5 pathForResource:v6 ofType:v7];

  if (!v8)
  {
    v9 = NSString;
    v10 = [MEMORY[0x263F5F668] kPLDeviceClassName];
    v11 = [v9 stringWithFormat:@"ERROR: Could not find distribution rules file for %@", v10];

    v12 = (void *)MEMORY[0x263F5F638];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
    v14 = [v13 lastPathComponent];
    v15 = [NSString stringWithUTF8String:"+[PLAccountingDistributionRuleManager rulesPath]"];
    [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:87];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PLAccountingDependency activate]();
    }

    uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = @"Distribution_Rules_N41.txt";
    v18 = [@"Distribution_Rules_N41.txt" stringByDeletingPathExtension];
    v19 = [@"Distribution_Rules_N41.txt" pathExtension];
    uint64_t v8 = [v17 pathForResource:v18 ofType:v19];
  }
  return v8;
}

- (id)ruleWithString:(id)a3 withEntryDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (ruleWithString_withEntryDate__defaultOnce != -1) {
      dispatch_once(&ruleWithString_withEntryDate__defaultOnce, block);
    }
    if (ruleWithString_withEntryDate__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"str=%@, entryDate=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:98];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingDistributionRuleManager *)self regex];
  v16 = objc_msgSend(v15, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  if (v16)
  {
    uint64_t v17 = [v16 rangeAtIndex:1];
    v19 = objc_msgSend(v6, "substringWithRange:", v17, v18);
    v20 = +[PLAccountingNodeManager sharedInstance];
    v21 = [v20 nodeIDForNodeName:v19 isPermanent:1];

    v58 = v19;
    id v59 = v7;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_45;
      v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v62[4] = v22;
      if (ruleWithString_withEntryDate__defaultOnce_43 != -1) {
        dispatch_once(&ruleWithString_withEntryDate__defaultOnce_43, v62);
      }
      if (ruleWithString_withEntryDate__classDebugEnabled_44)
      {
        v23 = [NSString stringWithFormat:@"nodeName=%@, nodeID=%@", v19, v21];
        v24 = (void *)MEMORY[0x263F5F638];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
        v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:109];

        v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        v19 = v58;
        id v7 = v59;
      }
    }
    if (v21)
    {
      uint64_t v29 = [v16 rangeAtIndex:2];
      v31 = objc_msgSend(v6, "substringWithRange:", v29, v30);
      v32 = +[PLAccountingNodeManager sharedInstance];
      v33 = [v32 nodeIDForNodeName:v31 isPermanent:1];

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v34 = objc_opt_class();
        v61[0] = MEMORY[0x263EF8330];
        v61[1] = 3221225472;
        v61[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_51;
        v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v61[4] = v34;
        if (ruleWithString_withEntryDate__defaultOnce_49 != -1) {
          dispatch_once(&ruleWithString_withEntryDate__defaultOnce_49, v61);
        }
        if (ruleWithString_withEntryDate__classDebugEnabled_50)
        {
          v54 = v33;
          v56 = v31;
          v35 = [NSString stringWithFormat:@"rootNodeName=%@, rootNodeID=%@", v31, v33];
          v36 = (void *)MEMORY[0x263F5F638];
          v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
          v38 = [v37 lastPathComponent];
          v39 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]"];
          [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:115];

          v40 = PLLogCommon();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }

          v19 = v58;
          id v7 = v59;
          v33 = v54;
          v31 = v56;
        }
      }
      if (v33)
      {
        uint64_t v41 = [v16 rangeAtIndex:3];
        v43 = objc_msgSend(v6, "substringWithRange:", v41, v42);
        v44 = +[PLAccountingEngine distributionIDForDistributionName:v43];
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v45 = objc_opt_class();
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_58;
          v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v60[4] = v45;
          if (ruleWithString_withEntryDate__defaultOnce_56 != -1) {
            dispatch_once(&ruleWithString_withEntryDate__defaultOnce_56, v60);
          }
          if (ruleWithString_withEntryDate__classDebugEnabled_57)
          {
            v55 = v33;
            v57 = v31;
            v46 = [NSString stringWithFormat:@"distributionName=%@, distributionID=%@", v43, v44];
            v47 = (void *)MEMORY[0x263F5F638];
            v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
            v49 = [v48 lastPathComponent];
            v50 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]"];
            [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:120];

            v51 = PLLogCommon();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }

            v33 = v55;
            v31 = v57;
          }
        }
        if (v44) {
          v52 = [[PLAccountingDistributionRuleEntry alloc] initWithNodeID:v21 withRootNodeID:v33 withDistributionID:v44 withEntryDate:v59];
        }
        else {
          v52 = 0;
        }

        v19 = v58;
        id v7 = v59;
      }
      else
      {
        v52 = 0;
      }
    }
    else
    {
      v52 = 0;
    }
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleWithString_withEntryDate__classDebugEnabled = result;
  return result;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_45(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleWithString_withEntryDate__classDebugEnabled_44 = result;
  return result;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_51(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleWithString_withEntryDate__classDebugEnabled_50 = result;
  return result;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_58(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleWithString_withEntryDate__classDebugEnabled_57 = result;
  return result;
}

- (void)indexRule:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PLAccountingDistributionRuleManager;
  [(PLAccountingRuleManager *)&v37 indexRule:v4];
  id v5 = v4;
  id v6 = [(PLAccountingDistributionRuleManager *)self rootNodeIDToNodeIDToDistributionRule];
  id v7 = [v5 rootNodeID];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = [(PLAccountingDistributionRuleManager *)self rootNodeIDToNodeIDToDistributionRule];
    v10 = [v5 rootNodeID];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  v11 = [v5 nodeID];
  [v8 setObject:v5 forKeyedSubscript:v11];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__PLAccountingDistributionRuleManager_indexRule___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (indexRule__defaultOnce != -1) {
      dispatch_once(&indexRule__defaultOnce, block);
    }
    if (indexRule__classDebugEnabled)
    {
      v13 = NSString;
      v14 = [(PLAccountingDistributionRuleManager *)self rootNodeIDToNodeIDToDistributionRule];
      v15 = [v13 stringWithFormat:@"rootNodeIDToNodeIDToDistributionRule=%@", v14];

      v16 = (void *)MEMORY[0x263F5F638];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
      uint64_t v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager indexRule:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:143];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v21 = [(PLAccountingDistributionRuleManager *)self distributionIDToDistributionRules];
  uint64_t v22 = [v5 distributionID];
  v23 = [v21 objectForKeyedSubscript:v22];

  if (!v23)
  {
    v23 = [MEMORY[0x263EFF980] array];
    v24 = [(PLAccountingDistributionRuleManager *)self distributionIDToDistributionRules];
    v25 = [v5 distributionID];
    [v24 setObject:v23 forKeyedSubscript:v25];
  }
  [v23 addObject:v5];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v26 = objc_opt_class();
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __49__PLAccountingDistributionRuleManager_indexRule___block_invoke_68;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v26;
    if (indexRule__defaultOnce_66 != -1) {
      dispatch_once(&indexRule__defaultOnce_66, v35);
    }
    if (indexRule__classDebugEnabled_67)
    {
      v27 = NSString;
      v28 = [(PLAccountingDistributionRuleManager *)self distributionIDToDistributionRules];
      uint64_t v29 = [v27 stringWithFormat:@"distributionIDToDistributionRules=%@", v28];

      uint64_t v30 = (void *)MEMORY[0x263F5F638];
      v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m"];
      v32 = [v31 lastPathComponent];
      v33 = [NSString stringWithUTF8String:"-[PLAccountingDistributionRuleManager indexRule:]"];
      [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:152];

      uint64_t v34 = PLLogCommon();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __49__PLAccountingDistributionRuleManager_indexRule___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  indexRule__classDebugEnabled = result;
  return result;
}

uint64_t __49__PLAccountingDistributionRuleManager_indexRule___block_invoke_68(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  indexRule__classDebugEnabled_67 = result;
  return result;
}

- (void)setRegex:(id)a3
{
}

- (void)setRootNodeIDToNodeIDToDistributionRule:(id)a3
{
}

- (void)setDistributionIDToDistributionRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributionIDToDistributionRules, 0);
  objc_storeStrong((id *)&self->_rootNodeIDToNodeIDToDistributionRule, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end