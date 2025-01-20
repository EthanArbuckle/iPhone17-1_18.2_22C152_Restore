@interface PLAccountingCorrectionManager
+ (double)disableCorrection;
+ (double)freeTimerInterval;
- (NSMutableDictionary)parentEntryIDToChildEnergyEstimates;
- (PLAccountingCorrectionManagerDelegate)delegate;
- (id)childEnergyEstimatesForParentEntryID:(int)a3;
- (id)dependencyIDsForOwner:(id)a3;
- (id)ownerIDsForDependency:(id)a3;
- (void)addEnergyMeasurement:(id)a3;
- (void)addRootEnergyEstimate:(id)a3 withNow:(id)a4;
- (void)correctChildEnergyEstimate:(id)a3 withParentEnergyEstimate:(id)a4 withNow:(id)a5;
- (void)didCorrectEnergyEstimate:(id)a3;
- (void)reloadDependenciesNewerThanDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setParentEntryIDToChildEnergyEstimates:(id)a3;
@end

@implementation PLAccountingCorrectionManager

- (id)dependencyIDsForOwner:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (dependencyIDsForOwner__defaultOnce_1 != -1) {
      dispatch_once(&dependencyIDsForOwner__defaultOnce_1, block);
    }
    if (dependencyIDsForOwner__classDebugEnabled_1)
    {
      v5 = [NSString stringWithFormat:@"owner=%@", v3];
      v6 = (void *)MEMORY[0x263F5F638];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager dependencyIDsForOwner:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:144];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v3)
  {
    v11 = +[PLAccountingEngine deviceRootNodeIDs];
    v12 = (void *)[v11 mutableCopy];

    v13 = [v3 ID];
    [v12 removeObject:v13];

    [v12 addObject:&unk_26DA69D18];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke_109;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (dependencyIDsForOwner__defaultOnce_107 != -1) {
        dispatch_once(&dependencyIDsForOwner__defaultOnce_107, v22);
      }
      if (dependencyIDsForOwner__classDebugEnabled_108)
      {
        v15 = [NSString stringWithFormat:@"deviceRootNodeIDs=%@", v12];
        v16 = (void *)MEMORY[0x263F5F638];
        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
        v18 = [v17 lastPathComponent];
        v19 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager dependencyIDsForOwner:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:150];

        v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)ownerIDsForDependency:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (ownerIDsForDependency__defaultOnce_1 != -1) {
      dispatch_once(&ownerIDsForDependency__defaultOnce_1, block);
    }
    if (ownerIDsForDependency__classDebugEnabled_1)
    {
      v5 = [NSString stringWithFormat:@"dependency=%@", v3];
      v6 = (void *)MEMORY[0x263F5F638];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager ownerIDsForDependency:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:156];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v3)
  {
    v11 = +[PLAccountingEngine deviceRootNodeIDs];
    v12 = (void *)[v11 mutableCopy];

    v13 = [v3 ID];
    [v12 removeObject:v13];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke_118;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (ownerIDsForDependency__defaultOnce_116 != -1) {
        dispatch_once(&ownerIDsForDependency__defaultOnce_116, v22);
      }
      if (ownerIDsForDependency__classDebugEnabled_117)
      {
        v15 = [NSString stringWithFormat:@"deviceRootNodeIDs=%@", v12];
        v16 = (void *)MEMORY[0x263F5F638];
        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
        v18 = [v17 lastPathComponent];
        v19 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager ownerIDsForDependency:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:162];

        v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addEnergyMeasurement:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __54__PLAccountingCorrectionManager_addEnergyMeasurement___block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (addEnergyMeasurement__defaultOnce != -1) {
      dispatch_once(&addEnergyMeasurement__defaultOnce, &block);
    }
    if (addEnergyMeasurement__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"energyMeasurement=%@", v4, block, v14, v15, v16, v17];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager addEnergyMeasurement:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:49];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [[PLAccountingCorrectionDependency alloc] initWithEnergyEvent:v4];
  [(PLAccountingOwnerDependencyManager *)self addDependency:v12];
  [(PLAccountingOwnerDependencyManager *)self notifyOwnersWithDependency:v12];
}

- (void)addRootEnergyEstimate:(id)a3 withNow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__PLAccountingCorrectionManager_addRootEnergyEstimate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addRootEnergyEstimate_withNow__defaultOnce != -1) {
      dispatch_once(&addRootEnergyEstimate_withNow__defaultOnce, block);
    }
    if (addRootEnergyEstimate_withNow__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"rootEnergyEstimate=%@, now=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager addRootEnergyEstimate:withNow:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:24];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v6 && v7)
  {
    if ([MEMORY[0x263F5F688] gasGaugeEnabled])
    {
      [(id)objc_opt_class() disableCorrection];
      BOOL v16 = v15 == 0.0;
    }
    else
    {
      BOOL v16 = 0;
    }
    uint64_t v17 = [[PLAccountingCorrectionOwner alloc] initWithRootEnergyEstimate:v6];
    [v6 energy];
    double v19 = v18;
    +[PLAccountingEngine minEnergy];
    if (v19 <= v20 || !v16)
    {
      if ([v6 writeToDB])
      {
        [v6 setCorrectionDate:v7];
        v22 = [(PLAccountingCorrectionManager *)self delegate];
        [v22 didCorrectEnergyEstimate:v6];
      }
    }
    else
    {
      [(PLAccountingOwnerDependencyManager *)self addOwner:v17];
    }
    if (v16)
    {
      [(PLAccountingCorrectionManager *)self addEnergyMeasurement:v6];
      [(PLAccountingOwnerDependencyManager *)self notifyDependenciesWithOwner:v17];
    }
  }
}

+ (double)disableCorrection
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__PLAccountingCorrectionManager_disableCorrection__block_invoke;
  v4[3] = &unk_2647B5078;
  uint64_t v5 = @"PLAccountingCorrectionManager_disableCorrection";
  char v6 = 0;
  if (disableCorrection_defaultOnce != -1) {
    dispatch_once(&disableCorrection_defaultOnce, v4);
  }
  int v2 = disableCorrection_objectForKey;

  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (PLAccountingCorrectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLAccountingCorrectionManagerDelegate *)WeakRetained;
}

- (id)childEnergyEstimatesForParentEntryID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (childEnergyEstimatesForParentEntryID__defaultOnce != -1) {
      dispatch_once(&childEnergyEstimatesForParentEntryID__defaultOnce, block);
    }
    if (childEnergyEstimatesForParentEntryID__classDebugEnabled)
    {
      char v6 = objc_msgSend(NSString, "stringWithFormat:", @"parentEntryID=%i", v3);
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager childEnergyEstimatesForParentEntryID:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:122];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [(PLAccountingCorrectionManager *)self parentEntryIDToChildEnergyEstimates];
  v13 = [NSNumber numberWithInt:v3];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_92;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v15;
    if (childEnergyEstimatesForParentEntryID__defaultOnce_90 != -1) {
      dispatch_once(&childEnergyEstimatesForParentEntryID__defaultOnce_90, v40);
    }
    if (childEnergyEstimatesForParentEntryID__classDebugEnabled_91)
    {
      BOOL v16 = [NSString stringWithFormat:@"childEnergyEstimates=%@", v14];
      uint64_t v17 = (void *)MEMORY[0x263F5F638];
      double v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      double v19 = [v18 lastPathComponent];
      double v20 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager childEnergyEstimatesForParentEntryID:]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:125];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v14)
  {
    v22 = [(PLAccountingCorrectionManager *)self parentEntryIDToChildEnergyEstimates];
    v23 = [NSNumber numberWithInt:v3];
    [v22 removeObjectForKey:v23];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v24 = objc_opt_class();
      uint64_t v35 = MEMORY[0x263EF8330];
      uint64_t v36 = 3221225472;
      v37 = __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_98;
      v38 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v39 = v24;
      if (childEnergyEstimatesForParentEntryID__defaultOnce_96 != -1) {
        dispatch_once(&childEnergyEstimatesForParentEntryID__defaultOnce_96, &v35);
      }
      if (childEnergyEstimatesForParentEntryID__classDebugEnabled_97)
      {
        v25 = NSString;
        v26 = [(PLAccountingCorrectionManager *)self parentEntryIDToChildEnergyEstimates];
        v27 = [v25 stringWithFormat:@"parentEntryIDToChildEnergyEstimates=%@", v26, v35, v36, v37, v38, v39];

        v28 = (void *)MEMORY[0x263F5F638];
        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
        v30 = [v29 lastPathComponent];
        v31 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager childEnergyEstimatesForParentEntryID:]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:130];

        v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    id v33 = v14;
  }

  return v14;
}

void __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_42(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) parentEntryIDToChildEnergyEstimates];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "entryID"));
  id v6 = [v2 objectForKeyedSubscript:v3];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    id v4 = [*(id *)(a1 + 32) parentEntryIDToChildEnergyEstimates];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "entryID"));
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:*(void *)(a1 + 48)];
}

- (NSMutableDictionary)parentEntryIDToChildEnergyEstimates
{
  parentEntryIDToChildEnergyEstimates = self->_parentEntryIDToChildEnergyEstimates;
  if (!parentEntryIDToChildEnergyEstimates)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v5 = self->_parentEntryIDToChildEnergyEstimates;
    self->_parentEntryIDToChildEnergyEstimates = v4;

    parentEntryIDToChildEnergyEstimates = self->_parentEntryIDToChildEnergyEstimates;
  }
  return parentEntryIDToChildEnergyEstimates;
}

- (void)didCorrectEnergyEstimate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = v5;
    if (didCorrectEnergyEstimate__defaultOnce_0 != -1) {
      dispatch_once(&didCorrectEnergyEstimate__defaultOnce_0, v17);
    }
    if (didCorrectEnergyEstimate__classDebugEnabled_0)
    {
      id v6 = [NSString stringWithFormat:@"energyEstimate=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager didCorrectEnergyEstimate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:136];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [(PLAccountingCorrectionManager *)self delegate];
  v13 = [v12 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke_102;
  block[3] = &unk_2647B4FE0;
  block[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_async(v13, block);
}

void __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke_102(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didCorrectEnergyEstimate:*(void *)(a1 + 40)];
}

- (void)correctChildEnergyEstimate:(id)a3 withParentEnergyEstimate:(id)a4 withNow:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke;
    v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v71[4] = v11;
    if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce != -1) {
      dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce, v71);
    }
    if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled)
    {
      v12 = [NSString stringWithFormat:@"childEnergyEstimate=%@, parentEnergyEstimate=%@", v8, v9];
      v13 = (void *)MEMORY[0x263F5F638];
      id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      uint64_t v15 = [v14 lastPathComponent];
      id v16 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:59];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v9 && [v8 writeToDB])
  {
    double v18 = [v9 correctionDate];

    int v19 = [MEMORY[0x263F5F640] debugEnabled];
    if (v18)
    {
      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_26;
        v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v70[4] = v20;
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_24 != -1) {
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_24, v70);
        }
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_25)
        {
          v21 = [NSString stringWithFormat:@"parent has already been corrected"];
          v22 = (void *)MEMORY[0x263F5F638];
          v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
          uint64_t v24 = [v23 lastPathComponent];
          v25 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:66];

          v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      [v9 energy];
      double v28 = v27;
      double v29 = 0.0;
      if (v28 > 0.0)
      {
        objc_msgSend(v8, "energy", 0.0);
        double v31 = v30;
        [v9 correctionEnergy];
        double v33 = v32;
        [v9 energy];
        double v29 = v31 * (v33 / v34);
      }
      [v8 setCorrectionEnergy:v29];
      [v8 setCorrectionDate:v10];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v35 = objc_opt_class();
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_32;
        v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v69[4] = v35;
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_30 != -1) {
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_30, v69);
        }
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_31)
        {
          uint64_t v36 = NSString;
          [v8 correctionEnergy];
          uint64_t v38 = v37;
          uint64_t v39 = [v8 correctionDate];
          v40 = [v36 stringWithFormat:@"childEnergyEstimate.correctionEnergy=%f, childEnergyEstimate.correctionDate=%@", v38, v39];

          v41 = (void *)MEMORY[0x263F5F638];
          v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
          v43 = [v42 lastPathComponent];
          v44 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]"];
          [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:69];

          v45 = PLLogCommon();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      v46 = [(PLAccountingCorrectionManager *)self delegate];
      [v46 didCorrectEnergyEstimate:v8];
    }
    else
    {
      if (v19)
      {
        uint64_t v47 = objc_opt_class();
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_38;
        v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v68[4] = v47;
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_36 != -1) {
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_36, v68);
        }
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_37)
        {
          v48 = [NSString stringWithFormat:@"parent has not yet been corrected"];
          v49 = (void *)MEMORY[0x263F5F638];
          v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
          v51 = [v50 lastPathComponent];
          v52 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]"];
          [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:73];

          v53 = PLLogCommon();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      v54 = [(PLAccountingOwnerDependencyManager *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_42;
      block[3] = &unk_2647B4FB8;
      block[4] = self;
      id v66 = v9;
      id v67 = v8;
      dispatch_async(v54, block);

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v55 = objc_opt_class();
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_2;
        v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v64[4] = v55;
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_45 != -1) {
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_45, v64);
        }
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_46)
        {
          v56 = NSString;
          v57 = [(PLAccountingCorrectionManager *)self parentEntryIDToChildEnergyEstimates];
          v58 = [v56 stringWithFormat:@"parentEntryIDToChildEnergyEstimates=%@", v57];

          v59 = (void *)MEMORY[0x263F5F638];
          v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
          v61 = [v60 lastPathComponent];
          v62 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]"];
          [v59 logMessage:v58 fromFile:v61 fromFunction:v62 fromLineNumber:83];

          v63 = PLLogCommon();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
    }
  }
}

uint64_t __63__PLAccountingCorrectionManager_addRootEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addRootEnergyEstimate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLAccountingCorrectionManager_addEnergyMeasurement___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addEnergyMeasurement__classDebugEnabled = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_26(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_25 = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_32(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_31 = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_38(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_37 = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_46 = result;
  return result;
}

uint64_t __50__PLAccountingCorrectionManager_disableCorrection__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  disableCorrection_objectForKey = result;
  return result;
}

+ (double)freeTimerInterval
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__PLAccountingCorrectionManager_freeTimerInterval__block_invoke;
  v4[3] = &unk_2647B4F40;
  uint64_t v5 = @"PLAccountingCorrectionManager_freeTimerInterval";
  uint64_t v6 = 0x409C200000000000;
  if (freeTimerInterval_defaultOnce_1 != -1) {
    dispatch_once(&freeTimerInterval_defaultOnce_1, v4);
  }
  double v2 = *(double *)&freeTimerInterval_objectForKey_1;

  return v2;
}

uint64_t __50__PLAccountingCorrectionManager_freeTimerInterval__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  freeTimerInterval_objectForKey_1 = v2;
  return result;
}

- (void)reloadDependenciesNewerThanDate:(id)a3
{
  v68[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke;
    v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v64[4] = v5;
    if (reloadDependenciesNewerThanDate__defaultOnce_1 != -1) {
      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_1, v64);
    }
    if (reloadDependenciesNewerThanDate__classDebugEnabled_1)
    {
      uint64_t v6 = [NSString stringWithFormat:@"date=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager reloadDependenciesNewerThanDate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:97];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v4)
  {
    v12 = [MEMORY[0x263EFF910] distantFuture];
    char v13 = [v4 isEqualToDate:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = objc_alloc(MEMORY[0x263F5F690]);
      uint64_t v15 = NSNumber;
      id v55 = v4;
      [v4 timeIntervalSince1970];
      id v16 = objc_msgSend(v15, "numberWithDouble:");
      uint64_t v17 = [v14 initWithKey:@"timestampEnd" withValue:v16 withComparisonOperation:3];

      double v18 = [MEMORY[0x263F5F698] sharedCore];
      int v19 = [v18 storage];
      v54 = (void *)v17;
      v68[0] = v17;
      uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:1];
      v21 = [v19 entriesForKey:@"PLBatteryAgent_EventInterval_GasGauge" withComparisons:v20];

      unint64_t v22 = 0x263F5F000uLL;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v23 = objc_opt_class();
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_71;
        v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v63[4] = v23;
        if (reloadDependenciesNewerThanDate__defaultOnce_69 != -1) {
          dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_69, v63);
        }
        if (reloadDependenciesNewerThanDate__classDebugEnabled_70)
        {
          uint64_t v24 = [NSString stringWithFormat:@"gasGaugeEntries=%@", v21];
          v25 = (void *)MEMORY[0x263F5F638];
          v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
          double v27 = [v26 lastPathComponent];
          double v28 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager reloadDependenciesNewerThanDate:]"];
          [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:105];

          double v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }

          unint64_t v22 = 0x263F5F000uLL;
        }
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = v21;
      uint64_t v30 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v60;
        double v33 = @"Readings";
        do
        {
          uint64_t v34 = 0;
          uint64_t v56 = v31;
          do
          {
            if (*(void *)v60 != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v35 = *(void **)(*((void *)&v59 + 1) + 8 * v34);
            if ([*(id *)(v22 + 1600) debugEnabled])
            {
              uint64_t v36 = objc_opt_class();
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_77;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v36;
              if (reloadDependenciesNewerThanDate__defaultOnce_75 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_75, block);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_76)
              {
                uint64_t v37 = v32;
                uint64_t v38 = self;
                uint64_t v39 = v33;
                v40 = [NSString stringWithFormat:@"gasGaugeEntry=%@", v35];
                v41 = (void *)MEMORY[0x263F5F638];
                v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m"];
                v43 = [v42 lastPathComponent];
                v44 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionManager reloadDependenciesNewerThanDate:]"];
                [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:108];

                v45 = PLLogCommon();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  id v66 = v40;
                  _os_log_debug_impl(&dword_2267F1000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v22 = 0x263F5F000;
                double v33 = v39;
                self = v38;
                uint64_t v32 = v37;
                uint64_t v31 = v56;
              }
            }
            v46 = [v35 objectForKeyedSubscript:v33];
            int v47 = [v46 intValue];

            if (v47 < 1)
            {
              double v50 = 0.0;
            }
            else
            {
              v48 = [v35 objectForKeyedSubscript:@"TotalPower"];
              [v48 doubleValue];
              double v50 = v49 / (double)v47;
            }
            v51 = [(PLAccountingCorrectionManager *)self delegate];
            v52 = [v35 entryDate];
            v53 = [v35 objectForKeyedSubscript:@"timestampEnd"];
            [v51 addPowerMeasurementEventIntervalWithPower:v52 withStartDate:v53 withEndDate:v50];

            ++v34;
          }
          while (v31 != v34);
          uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v31);
      }

      id v4 = v55;
    }
  }
}

uint64_t __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_1 = result;
  return result;
}

uint64_t __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_71(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_70 = result;
  return result;
}

uint64_t __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_77(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_76 = result;
  return result;
}

uint64_t __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  childEnergyEstimatesForParentEntryID__classDebugEnabled = result;
  return result;
}

uint64_t __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_92(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  childEnergyEstimatesForParentEntryID__classDebugEnabled_91 = result;
  return result;
}

uint64_t __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_98(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  childEnergyEstimatesForParentEntryID__classDebugEnabled_97 = result;
  return result;
}

uint64_t __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didCorrectEnergyEstimate__classDebugEnabled_0 = result;
  return result;
}

uint64_t __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependencyIDsForOwner__classDebugEnabled_1 = result;
  return result;
}

uint64_t __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke_109(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependencyIDsForOwner__classDebugEnabled_108 = result;
  return result;
}

uint64_t __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ownerIDsForDependency__classDebugEnabled_1 = result;
  return result;
}

uint64_t __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke_118(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ownerIDsForDependency__classDebugEnabled_117 = result;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (void)setParentEntryIDToChildEnergyEstimates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentEntryIDToChildEnergyEstimates, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end