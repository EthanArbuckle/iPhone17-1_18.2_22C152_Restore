@interface PLAccountingQualificationRuleManager
+ (id)rulesEntryKey;
+ (id)rulesPath;
+ (id)sharedInstance;
- (NSMutableDictionary)qualificationIDToQualificationRules;
- (NSMutableDictionary)rootNodeIDToQualificationRules;
- (id)qualificationRulesForQualificationID:(id)a3;
- (id)qualificationRulesForRootNodeID:(id)a3;
- (id)regex;
- (id)ruleWithString:(id)a3 withEntryDate:(id)a4;
- (void)indexRule:(id)a3;
- (void)setQualificationIDToQualificationRules:(id)a3;
- (void)setRegex:(id)a3;
- (void)setRootNodeIDToQualificationRules:(id)a3;
@end

@implementation PLAccountingQualificationRuleManager

- (id)qualificationRulesForRootNodeID:(id)a3
{
  id v4 = a3;
  v5 = [(PLAccountingQualificationRuleManager *)self rootNodeIDToQualificationRules];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSMutableDictionary)rootNodeIDToQualificationRules
{
  rootNodeIDToQualificationRules = self->_rootNodeIDToQualificationRules;
  if (!rootNodeIDToQualificationRules)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = self->_rootNodeIDToQualificationRules;
    self->_rootNodeIDToQualificationRules = v4;

    rootNodeIDToQualificationRules = self->_rootNodeIDToQualificationRules;
  }
  return rootNodeIDToQualificationRules;
}

+ (id)sharedInstance
{
  v3 = [MEMORY[0x263F5F698] sharedCore];
  id v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__PLAccountingQualificationRuleManager_sharedInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedInstance_onceToken_1 != -1) {
      dispatch_once(&sharedInstance_onceToken_1, block);
    }
    id v6 = (id)sharedInstance_sharedInstance_1;
  }
  return v6;
}

- (id)qualificationRulesForQualificationID:(id)a3
{
  id v4 = a3;
  char v5 = [(PLAccountingQualificationRuleManager *)self qualificationIDToQualificationRules];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSMutableDictionary)qualificationIDToQualificationRules
{
  qualificationIDToQualificationRules = self->_qualificationIDToQualificationRules;
  if (!qualificationIDToQualificationRules)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    char v5 = self->_qualificationIDToQualificationRules;
    self->_qualificationIDToQualificationRules = v4;

    qualificationIDToQualificationRules = self->_qualificationIDToQualificationRules;
  }
  return qualificationIDToQualificationRules;
}

uint64_t __54__PLAccountingQualificationRuleManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (id)regex
{
  regex = self->_regex;
  if (!regex)
  {
    id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([-.\\w]*) -> ([-\\w]*)" options:0 error:0];
    char v5 = self->_regex;
    self->_regex = v4;

    regex = self->_regex;
  }
  return regex;
}

+ (id)rulesEntryKey
{
  return +[PLAccountingQualificationRuleEntry entryKey];
}

+ (id)rulesPath
{
  v2 = NSString;
  v3 = [MEMORY[0x263F5F668] kPLDeviceClassName];
  id v4 = [v2 stringWithFormat:@"Qualification_Rules_%@.txt", v3];

  char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [(__CFString *)v4 stringByDeletingPathExtension];
  v7 = [(__CFString *)v4 pathExtension];
  v8 = [v5 pathForResource:v6 ofType:v7];

  if (!v8)
  {
    v9 = NSString;
    v10 = [MEMORY[0x263F5F668] kPLDeviceClassName];
    v11 = [v9 stringWithFormat:@"ERROR: Could not find qualification rules file for %@", v10];

    v12 = (void *)MEMORY[0x263F5F638];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m"];
    v14 = [v13 lastPathComponent];
    v15 = [NSString stringWithUTF8String:"+[PLAccountingQualificationRuleManager rulesPath]"];
    [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:78];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PLAccountingDependency activate]();
    }

    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = @"Qualification_Rules_N41.txt";
    v18 = [@"Qualification_Rules_N41.txt" stringByDeletingPathExtension];
    v19 = [@"Qualification_Rules_N41.txt" pathExtension];
    v8 = [v17 pathForResource:v18 ofType:v19];
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
    block[2] = __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (ruleWithString_withEntryDate__defaultOnce_0 != -1) {
      dispatch_once(&ruleWithString_withEntryDate__defaultOnce_0, block);
    }
    if (ruleWithString_withEntryDate__classDebugEnabled_0)
    {
      v9 = [NSString stringWithFormat:@"str=%@, entryDate=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingQualificationRuleManager ruleWithString:withEntryDate:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:89];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingQualificationRuleManager *)self regex];
  v16 = objc_msgSend(v15, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  if (v16)
  {
    uint64_t v17 = [v16 rangeAtIndex:1];
    v19 = objc_msgSend(v6, "substringWithRange:", v17, v18);
    v20 = +[PLAccountingNodeManager sharedInstance];
    v21 = [v20 nodeIDForNodeName:v19 isPermanent:1];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_36;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v22;
      if (ruleWithString_withEntryDate__defaultOnce_34 != -1) {
        dispatch_once(&ruleWithString_withEntryDate__defaultOnce_34, v45);
      }
      if (ruleWithString_withEntryDate__classDebugEnabled_35)
      {
        id v42 = v7;
        v23 = [NSString stringWithFormat:@"rootNodeName=%@, rootNodeID=%@", v19, v21];
        v24 = (void *)MEMORY[0x263F5F638];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m"];
        v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLAccountingQualificationRuleManager ruleWithString:withEntryDate:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:100];

        v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        id v7 = v42;
      }
    }
    if (v21)
    {
      uint64_t v29 = [v16 rangeAtIndex:2];
      v31 = objc_msgSend(v6, "substringWithRange:", v29, v30);
      v32 = +[PLAccountingEngine qualificationIDForQualificationName:v31];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v33 = objc_opt_class();
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_43;
        v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v44[4] = v33;
        if (ruleWithString_withEntryDate__defaultOnce_41 != -1) {
          dispatch_once(&ruleWithString_withEntryDate__defaultOnce_41, v44);
        }
        if (ruleWithString_withEntryDate__classDebugEnabled_42)
        {
          id v43 = v7;
          v41 = [NSString stringWithFormat:@"qualificationName=%@, qualificationID=%@", v31, v32];
          v34 = (void *)MEMORY[0x263F5F638];
          v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m"];
          v36 = [v35 lastPathComponent];
          v37 = [NSString stringWithUTF8String:"-[PLAccountingQualificationRuleManager ruleWithString:withEntryDate:]"];
          [v34 logMessage:v41 fromFile:v36 fromFunction:v37 fromLineNumber:105];

          v38 = PLLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }

          id v7 = v43;
        }
      }
      if (v32) {
        v39 = [[PLAccountingQualificationRuleEntry alloc] initWithRootNodeID:v21 withQualificationID:v32 withEntryDate:v7];
      }
      else {
        v39 = 0;
      }
    }
    else
    {
      v39 = 0;
    }
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

uint64_t __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleWithString_withEntryDate__classDebugEnabled_0 = result;
  return result;
}

uint64_t __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_36(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleWithString_withEntryDate__classDebugEnabled_35 = result;
  return result;
}

uint64_t __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ruleWithString_withEntryDate__classDebugEnabled_42 = result;
  return result;
}

- (void)indexRule:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PLAccountingQualificationRuleManager;
  [(PLAccountingRuleManager *)&v36 indexRule:v4];
  id v5 = v4;
  id v6 = [(PLAccountingQualificationRuleManager *)self rootNodeIDToQualificationRules];
  id v7 = [v5 rootNodeID];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    v9 = [(PLAccountingQualificationRuleManager *)self rootNodeIDToQualificationRules];
    v10 = [v5 rootNodeID];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  [v8 addObject:v5];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__PLAccountingQualificationRuleManager_indexRule___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (indexRule__defaultOnce_0 != -1) {
      dispatch_once(&indexRule__defaultOnce_0, block);
    }
    if (indexRule__classDebugEnabled_0)
    {
      v12 = NSString;
      v13 = [(PLAccountingQualificationRuleManager *)self rootNodeIDToQualificationRules];
      v14 = [v12 stringWithFormat:@"rootNodeIDToQualificationRules=%@", v13];

      v15 = (void *)MEMORY[0x263F5F638];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLAccountingQualificationRuleManager indexRule:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:127];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v20 = [(PLAccountingQualificationRuleManager *)self qualificationIDToQualificationRules];
  v21 = [v5 qualificationID];
  uint64_t v22 = [v20 objectForKeyedSubscript:v21];

  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x263EFF980] array];
    v23 = [(PLAccountingQualificationRuleManager *)self qualificationIDToQualificationRules];
    v24 = [v5 qualificationID];
    [v23 setObject:v22 forKeyedSubscript:v24];
  }
  [v22 addObject:v5];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __50__PLAccountingQualificationRuleManager_indexRule___block_invoke_53;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = v25;
    if (indexRule__defaultOnce_51 != -1) {
      dispatch_once(&indexRule__defaultOnce_51, v34);
    }
    if (indexRule__classDebugEnabled_52)
    {
      v26 = NSString;
      v27 = [(PLAccountingQualificationRuleManager *)self qualificationIDToQualificationRules];
      v28 = [v26 stringWithFormat:@"qualificationIDToQualificationRules=%@", v27];

      uint64_t v29 = (void *)MEMORY[0x263F5F638];
      uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m"];
      v31 = [v30 lastPathComponent];
      v32 = [NSString stringWithUTF8String:"-[PLAccountingQualificationRuleManager indexRule:]"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:136];

      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __50__PLAccountingQualificationRuleManager_indexRule___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  indexRule__classDebugEnabled_0 = result;
  return result;
}

uint64_t __50__PLAccountingQualificationRuleManager_indexRule___block_invoke_53(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  indexRule__classDebugEnabled_52 = result;
  return result;
}

- (void)setRegex:(id)a3
{
}

- (void)setRootNodeIDToQualificationRules:(id)a3
{
}

- (void)setQualificationIDToQualificationRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualificationIDToQualificationRules, 0);
  objc_storeStrong((id *)&self->_rootNodeIDToQualificationRules, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end