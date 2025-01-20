@interface PLAccountingDistributionManager
+ (double)freeTimerInterval;
- (PLAccountingDistributionManager)init;
- (PLAccountingDistributionManagerDelegate)delegate;
- (id)dependencyIDsForOwner:(id)a3;
- (id)ownerIDsForDependency:(id)a3;
- (void)addDistributionEvent:(id)a3;
- (void)addEnergyEstimate:(id)a3 withNow:(id)a4;
- (void)closeLastDistributionEventForwardWithDistributionID:(id)a3 withEndDate:(id)a4;
- (void)didDistributeEnergyEstimate:(id)a3;
- (void)didDistributeToChildEnergyEstimate:(id)a3 fromParentEnergyEstimate:(id)a4;
- (void)reloadDependenciesNewerThanDate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PLAccountingDistributionManager

- (void)addEnergyEstimate:(id)a3 withNow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addEnergyEstimate_withNow__defaultOnce_0 != -1) {
      dispatch_once(&addEnergyEstimate_withNow__defaultOnce_0, block);
    }
    if (addEnergyEstimate_withNow__classDebugEnabled_0)
    {
      v9 = [NSString stringWithFormat:@"energyEstimate=%@, now=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager addEnergyEstimate:withNow:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:26];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v6 && v7)
  {
    if ((int)[v6 numAncestors] < 100)
    {
      v15 = [[PLAccountingDistributionOwner alloc] initWithEnergyEstimate:v6];
      v21 = [v6 distributionRuleID];
      int v22 = [v21 intValue];

      if (v22 < 1)
      {
        if ([v6 writeToDB])
        {
          [v6 setDistributionDate:v7];
          v30 = [(PLAccountingDistributionManager *)self delegate];
          [v30 didDistributeEnergyEstimate:v6];
        }
      }
      else
      {
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v23 = objc_opt_class();
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke_20;
          v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v31[4] = v23;
          if (addEnergyEstimate_withNow__defaultOnce_18 != -1) {
            dispatch_once(&addEnergyEstimate_withNow__defaultOnce_18, v31);
          }
          if (addEnergyEstimate_withNow__classDebugEnabled_19)
          {
            v24 = [NSString stringWithFormat:@"rule exists"];
            v25 = (void *)MEMORY[0x263F5F638];
            v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
            v27 = [v26 lastPathComponent];
            v28 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager addEnergyEstimate:withNow:]"];
            [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:39];

            v29 = PLLogCommon();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        [(PLAccountingOwnerDependencyManager *)self addOwner:v15];
      }
      [(PLAccountingOwnerDependencyManager *)self notifyDependenciesWithOwner:v15];
    }
    else
    {
      [NSString stringWithFormat:@"WARNING: possible accounting distribution loop detected for energyEstimate=%@", v6];
      v15 = (PLAccountingDistributionOwner *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x263F5F638];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager addEnergyEstimate:withNow:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:31];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

- (void)didDistributeEnergyEstimate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = v5;
    if (didDistributeEnergyEstimate__defaultOnce != -1) {
      dispatch_once(&didDistributeEnergyEstimate__defaultOnce, v17);
    }
    if (didDistributeEnergyEstimate__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"energyEstimate=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager didDistributeEnergyEstimate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:177];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [(PLAccountingDistributionManager *)self delegate];
  v13 = [v12 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke_115;
  block[3] = &unk_2647B4FE0;
  block[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_async(v13, block);
}

- (PLAccountingDistributionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLAccountingDistributionManagerDelegate *)WeakRetained;
}

- (void)didDistributeToChildEnergyEstimate:(id)a3 fromParentEnergyEstimate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = v8;
    if (didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__defaultOnce != -1) {
      dispatch_once(&didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__defaultOnce, v22);
    }
    if (didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"childEnergyEstimate=%@, parentEnergyEstimate=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager didDistributeToChildEnergyEstimate:fromParentEnergyEstimate:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:169];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingDistributionManager *)self delegate];
  id v16 = [v15 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke_111;
  block[3] = &unk_2647B4FB8;
  block[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v17 = v7;
  id v18 = v6;
  dispatch_async(v16, block);
}

- (void)closeLastDistributionEventForwardWithDistributionID:(id)a3 withEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce != -1) {
      dispatch_once(&closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce, block);
    }
    if (closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"distributionID=%@, endDate=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager closeLastDistributionEventForwardWithDistributionID:withEndDate:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:71];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  int v15 = [v6 intValue];
  if (v7 && v15 >= 1)
  {
    id v16 = objc_msgSend(&unk_26DA69EB0, "objectAtIndexedSubscript:", (int)objc_msgSend(v6, "intValue"));
    uint64_t v17 = [v16 intValue];

    if (v17 == 1)
    {
      [(PLAccountingOwnerDependencyManager *)self updateLastDependencyID:v6 withEndDate:v7];
    }
    else if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v18 = objc_opt_class();
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke_49;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v18;
      if (closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce_47 != -1) {
        dispatch_once(&closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce_47, v25);
      }
      if (closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled_48)
      {
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"directionality=%i not allowed for closing", v17);
        id v20 = (void *)MEMORY[0x263F5F638];
        id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
        int v22 = [v21 lastPathComponent];
        uint64_t v23 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager closeLastDistributionEventForwardWithDistributionID:withEndDate:]"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:76];

        v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
  }
}

- (id)ownerIDsForDependency:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (ownerIDsForDependency__defaultOnce_0 != -1) {
      dispatch_once(&ownerIDsForDependency__defaultOnce_0, block);
    }
    if (ownerIDsForDependency__classDebugEnabled_0)
    {
      uint64_t v5 = [NSString stringWithFormat:@"dependency=%@", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager ownerIDsForDependency:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:197];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v3)
  {
    v11 = +[PLAccountingDistributionRuleManager sharedInstance];
    v12 = [v3 ID];
    v13 = [v11 distributionRulesForDistributionID:v12];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_131;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v14;
      if (ownerIDsForDependency__defaultOnce_129 != -1) {
        dispatch_once(&ownerIDsForDependency__defaultOnce_129, v45);
      }
      if (ownerIDsForDependency__classDebugEnabled_130)
      {
        int v15 = [NSString stringWithFormat:@"distributionRules=%@", v13];
        id v16 = (void *)MEMORY[0x263F5F638];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
        uint64_t v18 = [v17 lastPathComponent];
        v19 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager ownerIDsForDependency:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:202];

        id v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    if (v13)
    {
      id v21 = [MEMORY[0x263EFF9C0] set];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v22 = v13;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "entryID"));
            [v21 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v24);
      }

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v28 = objc_opt_class();
        uint64_t v36 = MEMORY[0x263EF8330];
        uint64_t v37 = 3221225472;
        v38 = __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_135;
        v39 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v40 = v28;
        if (ownerIDsForDependency__defaultOnce_133 != -1) {
          dispatch_once(&ownerIDsForDependency__defaultOnce_133, &v36);
        }
        if (ownerIDsForDependency__classDebugEnabled_134)
        {
          v29 = [NSString stringWithFormat:@"distributionRuleIDs=%@", v21, v36, v37, v38, v39, v40, (void)v41];
          v30 = (void *)MEMORY[0x263F5F638];
          v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
          v32 = [v31 lastPathComponent];
          v33 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager ownerIDsForDependency:]"];
          [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:209];

          v34 = PLLogCommon();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)addDistributionEvent:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (addDistributionEvent__defaultOnce != -1) {
      dispatch_once(&addDistributionEvent__defaultOnce, block);
    }
    if (addDistributionEvent__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"distributionEvent=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager addDistributionEvent:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:52];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v4)
  {
    v12 = [[PLAccountingDistributionDependency alloc] initWithDistributionEvent:v4];
    v13 = +[PLAccountingDistributionRuleManager sharedInstance];
    uint64_t v14 = [v4 distributionID];
    int v15 = [v13 distributionRulesForDistributionID:v14];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke_31;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v16;
      if (addDistributionEvent__defaultOnce_29 != -1) {
        dispatch_once(&addDistributionEvent__defaultOnce_29, v23);
      }
      if (addDistributionEvent__classDebugEnabled_30)
      {
        uint64_t v17 = [NSString stringWithFormat:@"distributionRules=%@", v15];
        uint64_t v18 = (void *)MEMORY[0x263F5F638];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
        id v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager addDistributionEvent:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:59];

        id v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    if (v15 && [v15 count]) {
      [(PLAccountingOwnerDependencyManager *)self addDependency:v12];
    }
    [(PLAccountingOwnerDependencyManager *)self notifyOwnersWithDependency:v12];
  }
}

- (id)dependencyIDsForOwner:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (dependencyIDsForOwner__defaultOnce_0 != -1) {
      dispatch_once(&dependencyIDsForOwner__defaultOnce_0, block);
    }
    if (dependencyIDsForOwner__classDebugEnabled_0)
    {
      uint64_t v5 = [NSString stringWithFormat:@"owner=%@", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager dependencyIDsForOwner:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:185];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v3)
  {
    v11 = +[PLAccountingDistributionRuleManager sharedInstance];
    v12 = [v3 ID];
    v13 = [v11 ruleForRuleID:v12];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke_121;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v14;
      if (dependencyIDsForOwner__defaultOnce_119_0 != -1) {
        dispatch_once(&dependencyIDsForOwner__defaultOnce_119_0, v25);
      }
      if (dependencyIDsForOwner__classDebugEnabled_120_0)
      {
        int v15 = [NSString stringWithFormat:@"distributionRule=%@", v13];
        uint64_t v16 = (void *)MEMORY[0x263F5F638];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
        uint64_t v18 = [v17 lastPathComponent];
        v19 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager dependencyIDsForOwner:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:189];

        id v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    if (v13)
    {
      id v21 = (void *)MEMORY[0x263EFF9C0];
      id v22 = [v13 distributionID];
      uint64_t v23 = [v21 setWithObject:v22];
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

void __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke_111(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didCreateChildEnergyEstimate:*(void *)(a1 + 40) withParentEnergyEstimate:*(void *)(a1 + 48)];
}

void __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke_115(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didDistributeEnergyEstimate:*(void *)(a1 + 40)];
}

- (PLAccountingDistributionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLAccountingDistributionManager;
  return [(PLAccountingOwnerDependencyManager *)&v3 init];
}

uint64_t __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addEnergyEstimate_withNow__classDebugEnabled_0 = result;
  return result;
}

uint64_t __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke_20(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addEnergyEstimate_withNow__classDebugEnabled_19 = result;
  return result;
}

uint64_t __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEvent__classDebugEnabled = result;
  return result;
}

uint64_t __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke_31(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEvent__classDebugEnabled_30 = result;
  return result;
}

uint64_t __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled = result;
  return result;
}

uint64_t __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke_49(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled_48 = result;
  return result;
}

+ (double)freeTimerInterval
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__PLAccountingDistributionManager_freeTimerInterval__block_invoke;
  v4[3] = &unk_2647B4F40;
  uint64_t v5 = @"PLAccountingDistributionManager_freeTimerInterval";
  uint64_t v6 = 0x409C200000000000;
  if (freeTimerInterval_defaultOnce_0 != -1) {
    dispatch_once(&freeTimerInterval_defaultOnce_0, v4);
  }
  double v2 = *(double *)&freeTimerInterval_objectForKey_0;

  return v2;
}

uint64_t __52__PLAccountingDistributionManager_freeTimerInterval__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  freeTimerInterval_objectForKey_0 = v2;
  return result;
}

- (void)reloadDependenciesNewerThanDate:(id)a3
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = 0x263F5F000uLL;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v116[0] = MEMORY[0x263EF8330];
    v116[1] = 3221225472;
    v116[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke;
    v116[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v116[4] = v6;
    if (reloadDependenciesNewerThanDate__defaultOnce_0 != -1) {
      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_0, v116);
    }
    if (reloadDependenciesNewerThanDate__classDebugEnabled_0)
    {
      id v7 = v4;
      uint64_t v8 = [NSString stringWithFormat:@"date=%@", v4];
      v9 = (void *)MEMORY[0x263F5F638];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:90];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      id v4 = v7;
      unint64_t v5 = 0x263F5F000uLL;
    }
  }
  if (v4)
  {
    uint64_t v14 = [MEMORY[0x263EFF910] distantFuture];
    char v15 = [v4 isEqualToDate:v14];

    if ((v15 & 1) == 0)
    {
      v92 = v4;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id obj = +[PLAccountingEngine allDistributionIDs];
      uint64_t v94 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
      if (v94)
      {
        uint64_t v93 = *(void *)v113;
        uint64_t v90 = *MEMORY[0x263F5F7D0];
        uint64_t v89 = *MEMORY[0x263F5F7C8];
        uint64_t v16 = *MEMORY[0x263F5F7C0];
        unint64_t v17 = 0x263F08000uLL;
        uint64_t v95 = *MEMORY[0x263F5F7C0];
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v113 != v93) {
              objc_enumerationMutation(obj);
            }
            uint64_t v97 = v18;
            v19 = *(void **)(*((void *)&v112 + 1) + 8 * v18);
            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v20 = objc_opt_class();
              v111[0] = MEMORY[0x263EF8330];
              v111[1] = 3221225472;
              v111[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_63;
              v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v111[4] = v20;
              if (reloadDependenciesNewerThanDate__defaultOnce_61 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_61, v111);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_62)
              {
                id v21 = [*(id *)(v17 + 2880) stringWithFormat:@"distributionID=%@", v19];
                id v22 = (void *)MEMORY[0x263F5F638];
                [*(id *)(v17 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
                v24 = unint64_t v23 = v17;
                uint64_t v25 = [v24 lastPathComponent];
                v26 = [*(id *)(v23 + 2880) stringWithUTF8String:"-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]"];
                [v22 logMessage:v21 fromFile:v25 fromFunction:v26 fromLineNumber:95];

                v27 = PLLogCommon();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v119 = v21;
                  _os_log_debug_impl(&dword_2267F1000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v16 = v95;
                unint64_t v17 = 0x263F08000uLL;
              }
            }
            uint64_t v28 = objc_msgSend(&unk_26DA69EC8, "objectAtIndexedSubscript:", (int)objc_msgSend(v19, "intValue"));
            uint64_t v29 = [v28 intValue];

            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v30 = objc_opt_class();
              v110[0] = MEMORY[0x263EF8330];
              v110[1] = 3221225472;
              v110[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_72;
              v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v110[4] = v30;
              if (reloadDependenciesNewerThanDate__defaultOnce_70_0 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_70_0, v110);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_71_0)
              {
                v31 = objc_msgSend(*(id *)(v17 + 2880), "stringWithFormat:", @"directionality=%i", v29);
                unint64_t v32 = v17;
                v33 = (void *)MEMORY[0x263F5F638];
                v34 = [*(id *)(v32 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
                v35 = [v34 lastPathComponent];
                uint64_t v36 = [*(id *)(v32 + 2880) stringWithUTF8String:"-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]"];
                [v33 logMessage:v31 fromFile:v35 fromFunction:v36 fromLineNumber:99];

                uint64_t v37 = PLLogCommon();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v119 = v31;
                  _os_log_debug_impl(&dword_2267F1000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v16 = v95;
                unint64_t v17 = 0x263F08000uLL;
              }
            }
            uint64_t v38 = (v29 - 1);
            switch((int)v29)
            {
              case 1:
                uint64_t v39 = +[PLAccountingDistributionEventForwardEntry entryKey];
                uint64_t v40 = *(void **)(v17 + 2880);
                [v92 timeIntervalSince1970];
                uint64_t v88 = v41;
                uint64_t v42 = v90;
                goto LABEL_32;
              case 2:
                uint64_t v39 = +[PLAccountingDistributionEventBackwardEntry entryKey];
                uint64_t v40 = *(void **)(v17 + 2880);
                [v92 timeIntervalSince1970];
                uint64_t v88 = v43;
                uint64_t v42 = v89;
LABEL_32:
                [v40 stringWithFormat:@"ID >= (SELECT MIN(ID)-1 FROM '%@' WHERE (%@ = %@ AND (timestamp+%@) >= %f))", v39, v16, v19, v42, v88];
                goto LABEL_35;
              case 3:
                uint64_t v39 = +[PLAccountingDistributionEventIntervalEntry entryKey];
                long long v44 = *(void **)(v17 + 2880);
                [v92 timeIntervalSince1970];
                [v44 stringWithFormat:@"(timestamp+%@) >= %f", v89, v45, v85, v86, v87];
                goto LABEL_35;
              case 4:
                uint64_t v39 = +[PLAccountingDistributionEventPointEntry entryKey];
                v46 = *(void **)(v17 + 2880);
                [v92 timeIntervalSince1970];
                [v46 stringWithFormat:@"(timestamp+%@) >= %f", v90, v47, v85, v86, v87];
                uint64_t v48 = LABEL_35:;
                break;
              default:
                uint64_t v48 = 0;
                uint64_t v39 = 0;
                break;
            }
            v96 = (void *)v48;
            v85 = v19;
            uint64_t v86 = v48;
            objc_msgSend(*(id *)(v17 + 2880), "stringWithFormat:", @"SELECT * FROM '%@' WHERE (%@ = %@ AND (%@));",
              v39,
            v99 = v16);
            v98 = (void *)v39;
            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v49 = objc_opt_class();
              v109[0] = MEMORY[0x263EF8330];
              v109[1] = 3221225472;
              v109[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_91;
              v109[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v109[4] = v49;
              if (reloadDependenciesNewerThanDate__defaultOnce_89_0 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_89_0, v109);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_90_0)
              {
                uint64_t v50 = v38;
                v51 = [*(id *)(v17 + 2880) stringWithFormat:@"distributionQuery=%@", v99];
                v52 = (void *)MEMORY[0x263F5F638];
                v53 = [*(id *)(v17 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
                v54 = [v53 lastPathComponent];
                v55 = [*(id *)(v17 + 2880) stringWithUTF8String:"-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]"];
                [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:128];

                v56 = PLLogCommon();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v119 = v51;
                  _os_log_debug_impl(&dword_2267F1000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v38 = v50;
                uint64_t v39 = (uint64_t)v98;
              }
            }
            v57 = [MEMORY[0x263F5F698] sharedCore];
            v58 = [v57 storage];
            v59 = [v58 entriesForKey:v39 withQuery:v99];

            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v60 = objc_opt_class();
              v108[0] = MEMORY[0x263EF8330];
              v108[1] = 3221225472;
              v108[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_98;
              v108[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v108[4] = v60;
              if (reloadDependenciesNewerThanDate__defaultOnce_96_0 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_96_0, v108);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_97_0)
              {
                uint64_t v61 = v38;
                v62 = [*(id *)(v17 + 2880) stringWithFormat:@"distributionEvents=%@", v59];
                v63 = (void *)MEMORY[0x263F5F638];
                v64 = [*(id *)(v17 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
                v65 = [v64 lastPathComponent];
                v66 = [*(id *)(v17 + 2880) stringWithUTF8String:"-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]"];
                [v63 logMessage:v62 fromFile:v65 fromFunction:v66 fromLineNumber:132];

                v67 = PLLogCommon();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v119 = v62;
                  _os_log_debug_impl(&dword_2267F1000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v38 = v61;
              }
            }
            long long v106 = 0u;
            long long v107 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            id v101 = v59;
            uint64_t v68 = [v101 countByEnumeratingWithState:&v104 objects:v117 count:16];
            if (v68)
            {
              uint64_t v69 = v68;
              id v102 = 0;
              uint64_t v70 = *(void *)v105;
              do
              {
                uint64_t v71 = 0;
                uint64_t v100 = v69;
                do
                {
                  if (*(void *)v105 != v70) {
                    objc_enumerationMutation(v101);
                  }
                  v72 = *(void **)(*((void *)&v104 + 1) + 8 * v71);
                  if ([*(id *)(v5 + 1600) debugEnabled])
                  {
                    uint64_t v73 = objc_opt_class();
                    block[0] = MEMORY[0x263EF8330];
                    block[1] = 3221225472;
                    block[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_104;
                    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    block[4] = v73;
                    if (reloadDependenciesNewerThanDate__defaultOnce_102_0 != -1) {
                      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_102_0, block);
                    }
                    if (reloadDependenciesNewerThanDate__classDebugEnabled_103_0)
                    {
                      uint64_t v74 = v38;
                      v75 = self;
                      v76 = [NSString stringWithFormat:@"distributionEvent=%@, lastDistributionEvent=%@", v72, v102];
                      v77 = (void *)MEMORY[0x263F5F638];
                      v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m"];
                      v79 = [v78 lastPathComponent];
                      v80 = [NSString stringWithUTF8String:"-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]"];
                      [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:137];

                      v81 = PLLogCommon();
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v119 = v76;
                        _os_log_debug_impl(&dword_2267F1000, v81, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      self = v75;
                      unint64_t v5 = 0x263F5F000;
                      uint64_t v38 = v74;
                      uint64_t v69 = v100;
                    }
                  }
                  switch((int)v38)
                  {
                    case 0:
                      v82 = [(PLAccountingDistributionManager *)self delegate];
                      v83 = v102;
                      [v82 addDistributionEventIntervalWithLastDistributionEventForward:v102 withDistributionEventForward:v72];
                      goto LABEL_67;
                    case 1:
                      v82 = [(PLAccountingDistributionManager *)self delegate];
                      v83 = v102;
                      [v82 addDistributionEventIntervalWithLastDistributionEventBackward:v102 withDistributionEventBackward:v72];
LABEL_67:

                      id v102 = v72;
                      goto LABEL_68;
                    case 2:
                      v83 = [(PLAccountingDistributionManager *)self delegate];
                      [v83 addDistributionEventInterval:v72];
                      goto LABEL_68;
                    case 3:
                      v83 = [(PLAccountingDistributionManager *)self delegate];
                      [v83 addDistributionEventPoint:v72];
LABEL_68:

                      break;
                    default:
                      break;
                  }
                  ++v71;
                }
                while (v69 != v71);
                uint64_t v69 = [v101 countByEnumeratingWithState:&v104 objects:v117 count:16];
              }
              while (v69);
            }
            else
            {
              id v102 = 0;
            }

            uint64_t v18 = v97 + 1;
            uint64_t v16 = v95;
            unint64_t v17 = 0x263F08000;
          }
          while (v97 + 1 != v94);
          uint64_t v84 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
          uint64_t v94 = v84;
        }
        while (v84);
      }

      id v4 = v92;
    }
  }
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_63(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_62 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_72(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_71_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_91(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_90_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_98(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_97_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_104(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_103_0 = result;
  return result;
}

uint64_t __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didDistributeEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependencyIDsForOwner__classDebugEnabled_0 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke_121(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependencyIDsForOwner__classDebugEnabled_120_0 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ownerIDsForDependency__classDebugEnabled_0 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_131(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ownerIDsForDependency__classDebugEnabled_130 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_135(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ownerIDsForDependency__classDebugEnabled_134 = result;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end