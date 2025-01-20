@interface PLAccountingOwnerDependencyManager
+ (double)freeTimerInterval;
+ (int)maxDependencies;
+ (int)maxOwners;
- (NSMutableDictionary)dependencyIDToDependencies;
- (NSMutableDictionary)dependencyIDToObservingOwners;
- (NSMutableDictionary)ownerIDToLastOwner;
- (NSMutableDictionary)ownerIDToObservingDependencies;
- (NSMutableSet)ownersRepository;
- (OS_dispatch_queue)workQueue;
- (PLAccountingOwnerDependencyManager)init;
- (PLTimer)freeTimer;
- (id)_lastDependencyForDependencyID:(id)a3;
- (id)dependenciesWithDependencyID:(id)a3 withRange:(id)a4;
- (id)dependencyIDsForOwner:(id)a3;
- (id)lastDependencyForDependencyID:(id)a3;
- (id)lastOwnerForOwnerID:(id)a3;
- (id)ownerIDsForDependency:(id)a3;
- (int)numDependencies;
- (void)addDependency:(id)a3;
- (void)addOwner:(id)a3;
- (void)canFreeDependency:(id)a3;
- (void)canFreeOwner:(id)a3;
- (void)freeExpiredDependenciesAtNow:(id)a3;
- (void)freeExpiredOwnersAtNow:(id)a3;
- (void)notifyDependenciesWithOwner:(id)a3;
- (void)notifyOwnersWithDependency:(id)a3;
- (void)setDependencyIDToDependencies:(id)a3;
- (void)setDependencyIDToObservingOwners:(id)a3;
- (void)setFreeTimer:(id)a3;
- (void)setNumDependencies:(int)a3;
- (void)setOwnerIDToLastOwner:(id)a3;
- (void)setOwnerIDToObservingDependencies:(id)a3;
- (void)setOwnersRepository:(id)a3;
- (void)startObservingDependencyID:(id)a3 forOwner:(id)a4;
- (void)startObservingOwnerID:(id)a3 forDependency:(id)a4;
- (void)stopObservingDependencyID:(id)a3 forOwner:(id)a4;
- (void)stopObservingOwnerID:(id)a3 forDependency:(id)a4;
- (void)updateLastDependencyID:(id)a3 withEndDate:(id)a4;
@end

@implementation PLAccountingOwnerDependencyManager

- (id)dependenciesWithDependencyID:(id)a3 withRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = 0x263F5F000uLL;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (dependenciesWithDependencyID_withRange__defaultOnce != -1) {
      dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce, block);
    }
    if (dependenciesWithDependencyID_withRange__classDebugEnabled)
    {
      v10 = [NSString stringWithFormat:@"dependencyID=%@, range=%@", v6, v7];
      v11 = (void *)MEMORY[0x263F5F638];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:217];

      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      unint64_t v8 = 0x263F5F000uLL;
    }
  }
  v16 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToDependencies];
  v17 = [v16 objectForKeyedSubscript:v6];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_122;
    v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v62[4] = v18;
    if (dependenciesWithDependencyID_withRange__defaultOnce_120 != -1) {
      dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce_120, v62);
    }
    if (dependenciesWithDependencyID_withRange__classDebugEnabled_121)
    {
      v19 = [NSString stringWithFormat:@"dependencies=%@", v17];
      v20 = (void *)MEMORY[0x263F5F638];
      v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:220];

      v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      unint64_t v8 = 0x263F5F000uLL;
    }
  }
  if (v17)
  {
    v25 = [v7 startDate];
    if (v25 && [v17 count])
    {
      unint64_t v26 = 0;
      do
      {
        v27 = [v17 objectAtIndexedSubscript:v26];
        v28 = [v27 range];
        v29 = [v28 endDate];
        [v29 timeIntervalSinceDate:v25];
        double v31 = v30;

        if (v31 >= 1.0) {
          break;
        }
        ++v26;
      }
      while ([v17 count] > v26);
      unint64_t v8 = 0x263F5F000;
    }
    else
    {
      unint64_t v26 = 0;
    }
    v59 = v7;
    if ([*(id *)(v8 + 1600) debugEnabled])
    {
      uint64_t v32 = objc_opt_class();
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_125;
      v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v61[4] = v32;
      if (dependenciesWithDependencyID_withRange__defaultOnce_123 != -1) {
        dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce_123, v61);
      }
      if (dependenciesWithDependencyID_withRange__classDebugEnabled_124)
      {
        id v33 = v6;
        v34 = objc_msgSend(NSString, "stringWithFormat:", @"startIndex=%i", v26);
        v35 = (void *)MEMORY[0x263F5F638];
        v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v37 = [v36 lastPathComponent];
        v38 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]"];
        [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:237];

        v39 = PLLogCommon();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        id v6 = v33;
        unint64_t v8 = 0x263F5F000;
      }
    }
    LODWORD(v40) = [v17 count];
    uint64_t v41 = (v40 - 1);
    v42 = [v59 endDate];
    if (v42 && (int)v26 < (int)v40)
    {
      id v57 = v6;
      uint64_t v40 = (int)v40;
      while (1)
      {
        v43 = [v17 objectAtIndexedSubscript:--v40];
        v44 = [v43 range];
        v45 = [v44 startDate];
        [v42 timeIntervalSinceDate:v45];
        double v47 = v46;

        if (v47 >= 1.0) {
          break;
        }
        uint64_t v41 = (v41 - 1);
        if (v40 <= (int)v26)
        {
          uint64_t v41 = (v26 - 1);
          break;
        }
      }
      id v6 = v57;
      unint64_t v8 = 0x263F5F000uLL;
    }
    if ([*(id *)(v8 + 1600) debugEnabled])
    {
      uint64_t v48 = objc_opt_class();
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_131;
      v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v60[4] = v48;
      if (dependenciesWithDependencyID_withRange__defaultOnce_129 != -1) {
        dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce_129, v60);
      }
      if (dependenciesWithDependencyID_withRange__classDebugEnabled_130)
      {
        id v58 = v6;
        v49 = objc_msgSend(NSString, "stringWithFormat:", @"endIndex=%i", v41);
        v50 = (void *)MEMORY[0x263F5F638];
        v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v52 = [v51 lastPathComponent];
        v53 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]"];
        [v50 logMessage:v49 fromFile:v52 fromFunction:v53 fromLineNumber:251];

        v54 = PLLogCommon();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        id v6 = v58;
      }
    }
    if ((int)v41 >= (int)v26)
    {
      v55 = objc_msgSend(v17, "subarrayWithRange:", v26, (int)v41 - (int)v26 + 1);
    }
    else
    {
      v55 = 0;
    }
    id v7 = v59;
  }
  else
  {
    v55 = 0;
  }

  return v55;
}

- (id)_lastDependencyForDependencyID:(id)a3
{
  id v4 = a3;
  v5 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToDependencies];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 lastObject];

  return v7;
}

- (NSMutableDictionary)dependencyIDToDependencies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)startObservingDependencyID:(id)a3 forOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (startObservingDependencyID_forOwner__defaultOnce != -1) {
      dispatch_once(&startObservingDependencyID_forOwner__defaultOnce, block);
    }
    if (startObservingDependencyID_forOwner__classDebugEnabled)
    {
      uint64_t v9 = [NSString stringWithFormat:@"dependencyID=%@, owner=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager startObservingDependencyID:forOwner:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:259];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToObservingOwners];
  v16 = [v15 objectForKeyedSubscript:v6];

  if (!v16)
  {
    v16 = [MEMORY[0x263EFF9C0] set];
    v17 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToObservingOwners];
    [v17 setObject:v16 forKeyedSubscript:v6];
  }
  [v16 addObject:v7];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke_140;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v18;
    if (startObservingDependencyID_forOwner__defaultOnce_138 != -1) {
      dispatch_once(&startObservingDependencyID_forOwner__defaultOnce_138, v27);
    }
    if (startObservingDependencyID_forOwner__classDebugEnabled_139)
    {
      v19 = NSString;
      v20 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToObservingOwners];
      v21 = [v19 stringWithFormat:@"dependencyIDToObservingOwners=%@", v20];

      v22 = (void *)MEMORY[0x263F5F638];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager startObservingDependencyID:forOwner:]"];
      [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:267];

      unint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

- (NSMutableDictionary)dependencyIDToObservingOwners
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

void __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_0 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_0, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_0)
    {
      v3 = [NSString stringWithFormat:@"dependency=%@", *(void *)(a1 + 40)];
      id v4 = (void *)MEMORY[0x263F5F638];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:117];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_64;
      v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v90[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_62 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_62, v90);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_63)
      {
        v10 = NSString;
        v11 = [*(id *)(a1 + 40) ID];
        v12 = [v10 stringWithFormat:@"dependency.ID=%@", v11];

        v13 = (void *)MEMORY[0x263F5F638];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v15 = [v14 lastPathComponent];
        v16 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:120];

        v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v18 = [*(id *)(a1 + 32) dependencyIDToDependencies];
    v19 = [*(id *)(a1 + 40) ID];
    v20 = [v18 objectForKeyedSubscript:v19];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      v89[0] = MEMORY[0x263EF8330];
      v89[1] = 3221225472;
      v89[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_71;
      v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v89[4] = v21;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_69 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_69, v89);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_70)
      {
        v22 = v20;
        v23 = [NSString stringWithFormat:@"before dependencies=%@", v20];
        v24 = (void *)MEMORY[0x263F5F638];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        unint64_t v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:124];

        v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        v20 = v22;
      }
    }
    if (!v20)
    {
      v20 = [MEMORY[0x263EFF980] array];
      v29 = [*(id *)(a1 + 32) dependencyIDToDependencies];
      double v30 = [*(id *)(a1 + 40) ID];
      [v29 setObject:v20 forKeyedSubscript:v30];
    }
    [v20 addObject:*(void *)(a1 + 40)];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v31 = objc_opt_class();
      v88[0] = MEMORY[0x263EF8330];
      v88[1] = 3221225472;
      v88[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_78;
      v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v88[4] = v31;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_76 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_76, v88);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_77)
      {
        uint64_t v32 = v20;
        id v33 = [NSString stringWithFormat:@"after dependencies=%@", v20];
        v34 = (void *)MEMORY[0x263F5F638];
        v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v36 = [v35 lastPathComponent];
        v37 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2"];
        [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:130];

        v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        v20 = v32;
      }
    }
    [*(id *)(a1 + 40) setManager:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) activate];
    v39 = *(void **)(a1 + 32);
    int v40 = [v39 numDependencies];
    [v39 setNumDependencies:(v40 + 1)];
    if (v40 >= (int)[(id)objc_opt_class() maxDependencies])
    {
      v69 = v20;
      [*(id *)(a1 + 32) dependencyIDToDependencies];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      v72 = long long v87 = 0u;
      id obj = [v72 allKeys];
      uint64_t v73 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
      id v41 = 0;
      if (!v73) {
        goto LABEL_55;
      }
      uint64_t v71 = *(void *)v85;
      unint64_t v42 = 0x263EFF000uLL;
      while (1)
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v85 != v71) {
            objc_enumerationMutation(obj);
          }
          uint64_t v74 = v43;
          uint64_t v44 = *(void *)(*((void *)&v84 + 1) + 8 * v43);
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          v45 = [v72 objectForKeyedSubscript:v44];
          double v46 = (void *)[v45 copy];

          id v76 = v46;
          uint64_t v47 = [v46 countByEnumeratingWithState:&v80 objects:v92 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v81;
            uint64_t v75 = *(void *)v81;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v81 != v49) {
                  objc_enumerationMutation(v76);
                }
                v51 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                v52 = [v51 range];
                v53 = [v52 endDate];
                v54 = [*(id *)(v42 + 2320) distantFuture];
                if ([v53 isEqualToDate:v54])
                {

                  goto LABEL_50;
                }
                if (!v41)
                {

LABEL_49:
                  v52 = v41;
                  id v41 = v51;
LABEL_50:

                  continue;
                }
                v55 = [v51 activationDate];
                [v41 activationDate];
                id v56 = v41;
                v58 = unint64_t v57 = v42;
                [v55 timeIntervalSinceDate:v58];
                double v60 = v59;

                unint64_t v42 = v57;
                id v41 = v56;

                uint64_t v49 = v75;
                if (v60 < 0.0) {
                  goto LABEL_49;
                }
              }
              uint64_t v48 = [v76 countByEnumeratingWithState:&v80 objects:v92 count:16];
            }
            while (v48);
          }

          uint64_t v43 = v74 + 1;
        }
        while (v74 + 1 != v73);
        uint64_t v73 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
        if (!v73)
        {
LABEL_55:

          if ([MEMORY[0x263F5F640] debugEnabled])
          {
            uint64_t v61 = objc_opt_class();
            v77[0] = MEMORY[0x263EF8330];
            v77[1] = 3221225472;
            v77[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_84;
            v77[3] = &unk_2647B4F90;
            v78 = @"free";
            uint64_t v79 = v61;
            if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_82 != -1) {
              dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_82, v77);
            }
            int v62 = PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_83;

            if (v62)
            {
              v63 = [NSString stringWithFormat:@"freeing dependency=%@", v41];
              v64 = (void *)MEMORY[0x263F5F638];
              v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
              v66 = [v65 lastPathComponent];
              v67 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2"];
              [v64 logMessage:v63 fromFile:v66 fromFunction:v67 fromLineNumber:148];

              v68 = PLLogCommon();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
                -[PLAccountingDependency activate]();
              }
            }
          }
          [v41 deactivate];

          v20 = v69;
          break;
        }
      }
    }
  }
}

- (void)setNumDependencies:(int)a3
{
  self->_numDependencies = a3;
}

- (int)numDependencies
{
  return self->_numDependencies;
}

- (id)lastOwnerForOwnerID:(id)a3
{
  id v4 = a3;
  v5 = [(PLAccountingOwnerDependencyManager *)self ownerIDToLastOwner];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSMutableDictionary)ownerIDToLastOwner
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)startObservingOwnerID:(id)a3 forDependency:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (startObservingOwnerID_forDependency__defaultOnce != -1) {
      dispatch_once(&startObservingOwnerID_forDependency__defaultOnce, block);
    }
    if (startObservingOwnerID_forDependency__classDebugEnabled)
    {
      uint64_t v9 = [NSString stringWithFormat:@"ownerID=%@, dependency=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager startObservingOwnerID:forDependency:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:303];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingOwnerDependencyManager *)self ownerIDToObservingDependencies];
  v16 = [v15 objectForKeyedSubscript:v6];

  if (!v16)
  {
    v16 = [MEMORY[0x263EFF9C0] set];
    v17 = [(PLAccountingOwnerDependencyManager *)self ownerIDToObservingDependencies];
    [v17 setObject:v16 forKeyedSubscript:v6];
  }
  [v16 addObject:v7];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke_152;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v18;
    if (startObservingOwnerID_forDependency__defaultOnce_150 != -1) {
      dispatch_once(&startObservingOwnerID_forDependency__defaultOnce_150, v27);
    }
    if (startObservingOwnerID_forDependency__classDebugEnabled_151)
    {
      v19 = NSString;
      v20 = [(PLAccountingOwnerDependencyManager *)self ownerIDToObservingDependencies];
      uint64_t v21 = [v19 stringWithFormat:@"ownerIDToObservingDependencies=%@", v20];

      v22 = (void *)MEMORY[0x263F5F638];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager startObservingOwnerID:forDependency:]"];
      [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:311];

      unint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

- (NSMutableDictionary)ownerIDToObservingDependencies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

+ (int)maxDependencies
{
  return 200;
}

void __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_0 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_0, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_0)
    {
      v3 = [NSString stringWithFormat:@"dependency=%@", *(void *)(a1 + 40)];
      id v4 = (void *)MEMORY[0x263F5F638];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager notifyOwnersWithDependency:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:156];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_90;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_88 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_88, v30);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_89)
      {
        v10 = NSString;
        v11 = [*(id *)(a1 + 32) dependencyIDToObservingOwners];
        v12 = [v10 stringWithFormat:@"dependencyIDToObservingOwners=%@", v11];

        v13 = (void *)MEMORY[0x263F5F638];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v15 = [v14 lastPathComponent];
        v16 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager notifyOwnersWithDependency:]_block_invoke_2"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:160];

        v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = [*(id *)(a1 + 32) dependencyIDToObservingOwners];
    v19 = [*(id *)(a1 + 40) ID];
    v20 = [v18 objectForKeyedSubscript:v19];
    uint64_t v21 = (void *)[v20 copy];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) didReceiveDependency:*(void *)(a1 + 40)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v23);
    }
  }
}

void __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0)
    {
      v3 = [NSString stringWithFormat:@"owner=%@", *(void *)(a1 + 40)];
      id v4 = (void *)MEMORY[0x263F5F638];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager notifyDependenciesWithOwner:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:104];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_54;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_52 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_52, v30);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_53)
      {
        v10 = NSString;
        v11 = [*(id *)(a1 + 32) ownerIDToObservingDependencies];
        v12 = [v10 stringWithFormat:@"ownerIDToObservingDependencies=%@", v11];

        v13 = (void *)MEMORY[0x263F5F638];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v15 = [v14 lastPathComponent];
        v16 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager notifyDependenciesWithOwner:]_block_invoke_2"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:108];

        v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = [*(id *)(a1 + 32) ownerIDToObservingDependencies];
    v19 = [*(id *)(a1 + 40) ID];
    v20 = [v18 objectForKeyedSubscript:v19];
    uint64_t v21 = (void *)[v20 copy];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) didReceiveOwner:*(void *)(a1 + 40)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v23);
    }
  }
}

- (void)stopObservingOwnerID:(id)a3 forDependency:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (stopObservingOwnerID_forDependency__defaultOnce != -1) {
      dispatch_once(&stopObservingOwnerID_forDependency__defaultOnce, block);
    }
    if (stopObservingOwnerID_forDependency__classDebugEnabled)
    {
      uint64_t v9 = [NSString stringWithFormat:@"ownerID=%@, dependency=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager stopObservingOwnerID:forDependency:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:317];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingOwnerDependencyManager *)self ownerIDToObservingDependencies];
  v16 = [v15 objectForKeyedSubscript:v6];
  [v16 removeObject:v7];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke_155;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v17;
    if (stopObservingOwnerID_forDependency__defaultOnce_153 != -1) {
      dispatch_once(&stopObservingOwnerID_forDependency__defaultOnce_153, v26);
    }
    if (stopObservingOwnerID_forDependency__classDebugEnabled_154)
    {
      uint64_t v18 = NSString;
      v19 = [(PLAccountingOwnerDependencyManager *)self ownerIDToObservingDependencies];
      v20 = [v18 stringWithFormat:@"ownerIDToObservingDependencies=%@", v19];

      uint64_t v21 = (void *)MEMORY[0x263F5F638];
      uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager stopObservingOwnerID:forDependency:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:320];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

- (void)stopObservingDependencyID:(id)a3 forOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (stopObservingDependencyID_forOwner__defaultOnce != -1) {
      dispatch_once(&stopObservingDependencyID_forOwner__defaultOnce, block);
    }
    if (stopObservingDependencyID_forOwner__classDebugEnabled)
    {
      uint64_t v9 = [NSString stringWithFormat:@"dependencyID=%@, owner=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager stopObservingDependencyID:forOwner:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:273];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v15 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToObservingOwners];
  v16 = [v15 objectForKeyedSubscript:v6];

  [v16 removeObject:v7];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke_143;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v17;
    if (stopObservingDependencyID_forOwner__defaultOnce_141 != -1) {
      dispatch_once(&stopObservingDependencyID_forOwner__defaultOnce_141, v26);
    }
    if (stopObservingDependencyID_forOwner__classDebugEnabled_142)
    {
      uint64_t v18 = NSString;
      v19 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToObservingOwners];
      v20 = [v18 stringWithFormat:@"dependencyIDToObservingOwners=%@", v19];

      uint64_t v21 = (void *)MEMORY[0x263F5F638];
      uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager stopObservingDependencyID:forOwner:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:277];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

- (void)canFreeOwner:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (canFreeOwner__defaultOnce != -1) {
      dispatch_once(&canFreeOwner__defaultOnce, block);
    }
    if (canFreeOwner__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"owner=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager canFreeOwner:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:282];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [(PLAccountingOwnerDependencyManager *)self ownersRepository];
  [v12 removeObject:v4];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke_146;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = v13;
    if (canFreeOwner__defaultOnce_144 != -1) {
      dispatch_once(&canFreeOwner__defaultOnce_144, v22);
    }
    if (canFreeOwner__classDebugEnabled_145)
    {
      v14 = NSString;
      v15 = [(PLAccountingOwnerDependencyManager *)self ownersRepository];
      v16 = [v14 stringWithFormat:@"ownersRepository=%@", v15];

      uint64_t v17 = (void *)MEMORY[0x263F5F638];
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager canFreeOwner:]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:285];

      uint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

void __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0)
    {
      v3 = [NSString stringWithFormat:@"owner=%@", *(void *)(a1 + 40)];
      id v4 = (void *)MEMORY[0x263F5F638];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:71];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      v72[0] = MEMORY[0x263EF8330];
      v72[1] = 3221225472;
      v72[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_29;
      v72[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v72[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_27 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_27, v72);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_28)
      {
        v10 = NSString;
        v11 = [*(id *)(a1 + 40) ID];
        v12 = [v10 stringWithFormat:@"owner.ID=%@", v11];

        uint64_t v13 = (void *)MEMORY[0x263F5F638];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v15 = [v14 lastPathComponent];
        v16 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:74];

        uint64_t v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v18 = [*(id *)(a1 + 32) ownersRepository];
    [v18 addObject:*(void *)(a1 + 40)];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_36;
      v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v71[4] = v19;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_34 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_34, v71);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_35)
      {
        v20 = NSString;
        uint64_t v21 = [*(id *)(a1 + 32) ownersRepository];
        uint64_t v22 = [v20 stringWithFormat:@"ownersRepository=%@", v21];

        uint64_t v23 = (void *)MEMORY[0x263F5F638];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v25 = [v24 lastPathComponent];
        long long v26 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:78];

        long long v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v28 = *(void *)(a1 + 40);
    long long v29 = [*(id *)(a1 + 32) ownerIDToLastOwner];
    double v30 = [*(id *)(a1 + 40) ID];
    [v29 setObject:v28 forKeyedSubscript:v30];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v31 = objc_opt_class();
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_42;
      v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v70[4] = v31;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_40 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_40, v70);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_41)
      {
        uint64_t v32 = NSString;
        uint64_t v33 = [*(id *)(a1 + 32) ownerIDToLastOwner];
        v34 = [v32 stringWithFormat:@"ownerIDToLastOwner=%@", v33];

        v35 = (void *)MEMORY[0x263F5F638];
        v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        v37 = [v36 lastPathComponent];
        v38 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2"];
        [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:82];

        v39 = PLLogCommon();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    [*(id *)(a1 + 40) setManager:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) activate];
    int v40 = [*(id *)(a1 + 32) ownersRepository];
    unint64_t v41 = [v40 count];
    int v42 = [(id)objc_opt_class() maxOwners];

    if (v41 > v42)
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      uint64_t v43 = [*(id *)(a1 + 32) ownersRepository];
      uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        double v46 = 0;
        uint64_t v47 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v67 != v47) {
              objc_enumerationMutation(v43);
            }
            uint64_t v49 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            if (!v46) {
              goto LABEL_38;
            }
            v50 = [*(id *)(*((void *)&v66 + 1) + 8 * i) activationDate];
            v51 = [v46 activationDate];
            [v50 timeIntervalSinceDate:v51];
            double v53 = v52;

            if (v53 < 0.0)
            {
LABEL_38:
              id v54 = v49;

              double v46 = v54;
            }
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v74 count:16];
        }
        while (v45);
      }
      else
      {
        double v46 = 0;
      }

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v55 = objc_opt_class();
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_48;
        v63[3] = &unk_2647B4F90;
        v64 = @"free";
        uint64_t v65 = v55;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_46 != -1) {
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_46, v63);
        }
        int v56 = PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_47;

        if (v56)
        {
          unint64_t v57 = [NSString stringWithFormat:@"freeing owner=%@", v46];
          id v58 = (void *)MEMORY[0x263F5F638];
          double v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
          double v60 = [v59 lastPathComponent];
          uint64_t v61 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2"];
          [v58 logMessage:v57 fromFile:v60 fromFunction:v61 fromLineNumber:96];

          int v62 = PLLogCommon();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      [v46 deactivate];
    }
  }
}

- (NSMutableSet)ownersRepository
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

+ (int)maxOwners
{
  return 200;
}

- (void)canFreeDependency:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (canFreeDependency__defaultOnce != -1) {
      dispatch_once(&canFreeDependency__defaultOnce, block);
    }
    if (canFreeDependency__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"dependency=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager canFreeDependency:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:325];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToDependencies];
  uint64_t v13 = [v4 ID];
  v14 = [v12 objectForKeyedSubscript:v13];
  [v14 removeObject:v4];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke_158;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v15;
    if (canFreeDependency__defaultOnce_156 != -1) {
      dispatch_once(&canFreeDependency__defaultOnce_156, v24);
    }
    if (canFreeDependency__classDebugEnabled_157)
    {
      v16 = NSString;
      uint64_t v17 = [(PLAccountingOwnerDependencyManager *)self dependencyIDToDependencies];
      uint64_t v18 = [v16 stringWithFormat:@"dependencyIDToDependencies=%@", v17];

      uint64_t v19 = (void *)MEMORY[0x263F5F638];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager canFreeDependency:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:328];

      uint64_t v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  [(PLAccountingOwnerDependencyManager *)self setNumDependencies:[(PLAccountingOwnerDependencyManager *)self numDependencies] - 1];
}

- (void)notifyOwnersWithDependency:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAccountingOwnerDependencyManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke;
  v7[3] = &unk_2647B4FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (void)addOwner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAccountingOwnerDependencyManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke;
  v7[3] = &unk_2647B4FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAccountingOwnerDependencyManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke;
  v7[3] = &unk_2647B4FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (void)notifyDependenciesWithOwner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAccountingOwnerDependencyManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke;
  v7[3] = &unk_2647B4FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

void __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_0 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_0, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_0)
    {
      v3 = [NSString stringWithFormat:@"dependencyID=%@, endDate=%@", *(void *)(a1 + 40), *(void *)(a1 + 48)];
      id v4 = (void *)MEMORY[0x263F5F638];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:170];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if ((int)[*(id *)(a1 + 40) intValue] >= 1 && *(void *)(a1 + 48))
  {
    uint64_t v9 = [*(id *)(a1 + 32) dependencyIDToDependencies];
    v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_100;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v11;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_98 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_98, v39);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_99)
      {
        v12 = [NSString stringWithFormat:@"dependencies=%@", v10];
        uint64_t v13 = (void *)MEMORY[0x263F5F638];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
        uint64_t v15 = [v14 lastPathComponent];
        v16 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke_2"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:175];

        uint64_t v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    if (v10)
    {
      uint64_t v18 = [v10 lastObject];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v19 = objc_opt_class();
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_107;
        v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v38[4] = v19;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_105 != -1) {
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_105, v38);
        }
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_106)
        {
          v20 = [NSString stringWithFormat:@"lastDependency=%@", v18];
          uint64_t v21 = (void *)MEMORY[0x263F5F638];
          uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
          uint64_t v23 = [v22 lastPathComponent];
          uint64_t v24 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke_2"];
          [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:180];

          v25 = PLLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      long long v26 = [v18 range];
      long long v27 = [v26 endDate];
      uint64_t v28 = [MEMORY[0x263EFF910] distantFuture];
      int v29 = [v27 isEqualToDate:v28];

      if (v29) {
        [v18 updateWithEndDate:*(void *)(a1 + 48)];
      }
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v30 = objc_opt_class();
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_113;
        v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v37[4] = v30;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_111 != -1) {
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_111, v37);
        }
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_112)
        {
          uint64_t v31 = [NSString stringWithFormat:@"after update: lastDependency=%@", v18];
          uint64_t v32 = (void *)MEMORY[0x263F5F638];
          uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
          v34 = [v33 lastPathComponent];
          v35 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke_2"];
          [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:186];

          v36 = PLLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
    }
  }
}

- (void)updateLastDependencyID:(id)a3 withEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLAccountingOwnerDependencyManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke;
  block[3] = &unk_2647B4FB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async_and_wait(v8, block);
}

- (PLAccountingOwnerDependencyManager)init
{
  v41.receiver = self;
  v41.super_class = (Class)PLAccountingOwnerDependencyManager;
  uint64_t v2 = [(PLAccountingOwnerDependencyManager *)&v41 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F5F688] workQueueForClass:objc_opt_class()];
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    dependencyIDToObservingOwners = v2->_dependencyIDToObservingOwners;
    v2->_dependencyIDToObservingOwners = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    dependencyIDToDependencies = v2->_dependencyIDToDependencies;
    v2->_dependencyIDToDependencies = (NSMutableDictionary *)v7;

    v2->_numDependencies = 0;
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    ownerIDToObservingDependencies = v2->_ownerIDToObservingDependencies;
    v2->_ownerIDToObservingDependencies = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    ownerIDToLastOwner = v2->_ownerIDToLastOwner;
    v2->_ownerIDToLastOwner = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    ownersRepository = v2->_ownersRepository;
    v2->_ownersRepository = (NSMutableSet *)v13;

    id v15 = objc_alloc(MEMORY[0x263F5F680]);
    v16 = (void *)MEMORY[0x263EFF910];
    [(id)objc_opt_class() freeTimerInterval];
    uint64_t v18 = [v16 dateWithTimeIntervalSinceNow:v17 * 0.25];
    [(id)objc_opt_class() freeTimerInterval];
    double v20 = v19 * 0.25;
    uint64_t v21 = [(PLAccountingOwnerDependencyManager *)v2 workQueue];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __42__PLAccountingOwnerDependencyManager_init__block_invoke;
    v39[3] = &unk_2647B5288;
    uint64_t v22 = v2;
    int v40 = v22;
    uint64_t v23 = [v15 initWithFireDate:v18 withInterval:1 withTolerance:0 repeats:v21 withUserInfo:v39 withQueue:v20 withBlock:0.0];
    freeTimer = v22->_freeTimer;
    v22->_freeTimer = (PLTimer *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __42__PLAccountingOwnerDependencyManager_init__block_invoke_2;
    v36 = &unk_2647B4F90;
    v37 = @"free";
    uint64_t v38 = v25;
    if (init_defaultOnce != -1) {
      dispatch_once(&init_defaultOnce, &block);
    }
    int v26 = init_classDebugEnabled;

    if (v26)
    {
      long long v27 = NSString;
      uint64_t v28 = (objc_class *)objc_opt_class();
      int v29 = NSStringFromClass(v28);
      uint64_t v30 = [v27 stringWithFormat:@"com.apple.powerlogd.%@.testFree", v29, block, v34, v35, v36];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v22, (CFNotificationCallback)testFree, v30, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v2;
}

void __42__PLAccountingOwnerDependencyManager_init__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF910] monotonicDate];
  [*(id *)(a1 + 32) freeExpiredOwnersAtNow:v2];
  [*(id *)(a1 + 32) freeExpiredDependenciesAtNow:v2];
}

uint64_t __42__PLAccountingOwnerDependencyManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  init_classDebugEnabled = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_29(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_28 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_36(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_35 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_42(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_41 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_48(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_47 = result;
  return result;
}

uint64_t __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0 = result;
  return result;
}

uint64_t __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_54(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_53 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_0 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_64(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_63 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_71(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_70 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_78(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_77 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_84(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_83 = result;
  return result;
}

uint64_t __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_0 = result;
  return result;
}

uint64_t __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_90(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_89 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_0 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_100(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_99 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_107(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_106 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_113(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_112 = result;
  return result;
}

- (id)dependencyIDsForOwner:(id)a3
{
  return 0;
}

- (id)lastDependencyForDependencyID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(PLAccountingOwnerDependencyManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__PLAccountingOwnerDependencyManager_lastDependencyForDependencyID___block_invoke;
  block[3] = &unk_2647B52B0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __68__PLAccountingOwnerDependencyManager_lastDependencyForDependencyID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _lastDependencyForDependencyID:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependenciesWithDependencyID_withRange__classDebugEnabled = result;
  return result;
}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_122(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependenciesWithDependencyID_withRange__classDebugEnabled_121 = result;
  return result;
}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_125(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependenciesWithDependencyID_withRange__classDebugEnabled_124 = result;
  return result;
}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_131(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependenciesWithDependencyID_withRange__classDebugEnabled_130 = result;
  return result;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startObservingDependencyID_forOwner__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke_140(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startObservingDependencyID_forOwner__classDebugEnabled_139 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopObservingDependencyID_forOwner__classDebugEnabled = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke_143(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopObservingDependencyID_forOwner__classDebugEnabled_142 = result;
  return result;
}

uint64_t __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  canFreeOwner__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke_146(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  canFreeOwner__classDebugEnabled_145 = result;
  return result;
}

- (id)ownerIDsForDependency:(id)a3
{
  return 0;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startObservingOwnerID_forDependency__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke_152(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startObservingOwnerID_forDependency__classDebugEnabled_151 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopObservingOwnerID_forDependency__classDebugEnabled = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke_155(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopObservingOwnerID_forDependency__classDebugEnabled_154 = result;
  return result;
}

uint64_t __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  canFreeDependency__classDebugEnabled = result;
  return result;
}

uint64_t __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke_158(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  canFreeDependency__classDebugEnabled_157 = result;
  return result;
}

+ (double)freeTimerInterval
{
  return 0.0;
}

- (void)freeExpiredOwnersAtNow:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = 0x263F5F000uLL;
  id v56 = v4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke;
    v73[3] = &unk_2647B4F90;
    uint64_t v74 = @"free";
    uint64_t v75 = v6;
    if (freeExpiredOwnersAtNow__defaultOnce != -1) {
      dispatch_once(&freeExpiredOwnersAtNow__defaultOnce, v73);
    }
    int v7 = freeExpiredOwnersAtNow__classDebugEnabled;

    if (v7)
    {
      id v8 = [NSString stringWithFormat:@"now=%@, class=%@", v4, objc_opt_class()];
      uint64_t v9 = (void *)MEMORY[0x263F5F638];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:350];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      id v4 = v56;
      unint64_t v5 = 0x263F5F000uLL;
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_167;
    v70[3] = &unk_2647B4F90;
    uint64_t v71 = @"free";
    uint64_t v72 = v14;
    if (freeExpiredOwnersAtNow__defaultOnce_165 != -1) {
      dispatch_once(&freeExpiredOwnersAtNow__defaultOnce_165, v70);
    }
    int v15 = freeExpiredOwnersAtNow__classDebugEnabled_166;

    if (v15)
    {
      v16 = NSString;
      id v17 = [(PLAccountingOwnerDependencyManager *)self ownersRepository];
      uint64_t v18 = (void *)[v17 copy];
      double v19 = [v16 stringWithFormat:@"ownersRepositoryCopy=%@, class=%@", v18, objc_opt_class()];

      double v20 = (void *)MEMORY[0x263F5F638];
      uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v22 = [v21 lastPathComponent];
      uint64_t v23 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:352];

      uint64_t v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      id v4 = v56;
      unint64_t v5 = 0x263F5F000uLL;
    }
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v25 = [(PLAccountingOwnerDependencyManager *)self ownersRepository];
  int v26 = (void *)[v25 copy];

  id obj = v26;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v59 = *(void *)v67;
    do
    {
      uint64_t v29 = 0;
      uint64_t v57 = v28;
      do
      {
        if (*(void *)v67 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void **)(*((void *)&v66 + 1) + 8 * v29);
        uint64_t v31 = [v30 range];
        uint64_t v32 = [v31 endDate];

        uint64_t v33 = [v30 activationDate];
        if (v32)
        {
          uint64_t v34 = [v32 laterDate:v33];

          uint64_t v33 = (void *)v34;
        }
        if ([*(id *)(v5 + 1600) debugEnabled])
        {
          uint64_t v35 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_173;
          block[3] = &unk_2647B4F90;
          v64 = @"free";
          uint64_t v65 = v35;
          if (freeExpiredOwnersAtNow__defaultOnce_171 != -1) {
            dispatch_once(&freeExpiredOwnersAtNow__defaultOnce_171, block);
          }
          int v36 = freeExpiredOwnersAtNow__classDebugEnabled_172;

          if (v36)
          {
            v37 = NSString;
            uint64_t v38 = [v30 activationDate];
            v39 = [v37 stringWithFormat:@"lastValidDate=%@, endDate=%@, activationDate=%@, class=%@", v33, v32, v38, objc_opt_class()];

            int v40 = (void *)MEMORY[0x263F5F638];
            objc_super v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
            int v42 = [v41 lastPathComponent];
            uint64_t v43 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]"];
            [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:356];

            uint64_t v44 = PLLogCommon();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v77 = v39;
              _os_log_debug_impl(&dword_2267F1000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            id v4 = v56;
            uint64_t v28 = v57;
            unint64_t v5 = 0x263F5F000uLL;
          }
        }
        [v4 timeIntervalSinceDate:v33];
        double v46 = v45;
        [(id)objc_opt_class() freeTimerInterval];
        if (v46 > v47)
        {
          if ([*(id *)(v5 + 1600) debugEnabled])
          {
            uint64_t v48 = objc_opt_class();
            v60[0] = MEMORY[0x263EF8330];
            v60[1] = 3221225472;
            v60[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_179;
            v60[3] = &unk_2647B4F90;
            uint64_t v61 = @"free";
            uint64_t v62 = v48;
            if (freeExpiredOwnersAtNow__defaultOnce_177 != -1) {
              dispatch_once(&freeExpiredOwnersAtNow__defaultOnce_177, v60);
            }
            int v49 = freeExpiredOwnersAtNow__classDebugEnabled_178;

            if (v49)
            {
              v50 = [NSString stringWithFormat:@"freeing owner=%@, class=%@", v30, objc_opt_class()];
              v51 = (void *)MEMORY[0x263F5F638];
              double v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
              double v53 = [v52 lastPathComponent];
              id v54 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]"];
              [v51 logMessage:v50 fromFile:v53 fromFunction:v54 fromLineNumber:360];

              uint64_t v55 = PLLogCommon();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v77 = v50;
                _os_log_debug_impl(&dword_2267F1000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v4 = v56;
              uint64_t v28 = v57;
              unint64_t v5 = 0x263F5F000;
            }
          }
          [v30 deactivate];
        }

        ++v29;
      }
      while (v28 != v29);
      uint64_t v28 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    }
    while (v28);
  }
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  freeExpiredOwnersAtNow__classDebugEnabled = result;
  return result;
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_167(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  freeExpiredOwnersAtNow__classDebugEnabled_166 = result;
  return result;
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_173(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  freeExpiredOwnersAtNow__classDebugEnabled_172 = result;
  return result;
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_179(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  freeExpiredOwnersAtNow__classDebugEnabled_178 = result;
  return result;
}

- (void)freeExpiredDependenciesAtNow:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = 0x263F5F000uLL;
  uint64_t v44 = self;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke;
    v58[3] = &unk_2647B4F90;
    uint64_t v59 = @"free";
    uint64_t v60 = v6;
    if (freeExpiredDependenciesAtNow__defaultOnce != -1) {
      dispatch_once(&freeExpiredDependenciesAtNow__defaultOnce, v58);
    }
    int v7 = freeExpiredDependenciesAtNow__classDebugEnabled;

    if (v7)
    {
      id v8 = [NSString stringWithFormat:@"now=%@", v4];
      uint64_t v9 = (void *)MEMORY[0x263F5F638];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager freeExpiredDependenciesAtNow:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:368];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      self = v44;
      unint64_t v5 = 0x263F5F000uLL;
    }
  }
  [(PLAccountingOwnerDependencyManager *)self dependencyIDToDependencies];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  int v40 = v57 = 0u;
  id obj = [v40 allKeys];
  uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v55;
    id v43 = v4;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v55 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v14;
        uint64_t v15 = *(void *)(*((void *)&v54 + 1) + 8 * v14);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v16 = [v40 objectForKeyedSubscript:v15];
        id v17 = (void *)[v16 copy];

        id v46 = v17;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v63 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v51;
          do
          {
            uint64_t v21 = 0;
            uint64_t v45 = v19;
            do
            {
              if (*(void *)v51 != v20) {
                objc_enumerationMutation(v46);
              }
              uint64_t v22 = *(void **)(*((void *)&v50 + 1) + 8 * v21);
              uint64_t v23 = [v22 range];
              uint64_t v24 = [v23 endDate];

              uint64_t v25 = [v22 activationDate];
              if (v24)
              {
                uint64_t v26 = [v24 laterDate:v25];

                uint64_t v25 = (void *)v26;
              }
              [v4 timeIntervalSinceDate:v25];
              double v28 = v27;
              [(id)objc_opt_class() freeTimerInterval];
              if (v28 > v29)
              {
                if ([*(id *)(v5 + 1600) debugEnabled])
                {
                  uint64_t v30 = objc_opt_class();
                  block[0] = MEMORY[0x263EF8330];
                  block[1] = 3221225472;
                  block[2] = __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke_188;
                  block[3] = &unk_2647B4F90;
                  uint64_t v48 = @"free";
                  uint64_t v49 = v30;
                  if (freeExpiredDependenciesAtNow__defaultOnce_186 != -1) {
                    dispatch_once(&freeExpiredDependenciesAtNow__defaultOnce_186, block);
                  }
                  int v31 = freeExpiredDependenciesAtNow__classDebugEnabled_187;

                  if (v31)
                  {
                    uint64_t v32 = [NSString stringWithFormat:@"freeing dependency=%@", v22];
                    uint64_t v33 = (void *)MEMORY[0x263F5F638];
                    uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m"];
                    uint64_t v35 = [v34 lastPathComponent];
                    int v36 = [NSString stringWithUTF8String:"-[PLAccountingOwnerDependencyManager freeExpiredDependenciesAtNow:]"];
                    [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:378];

                    v37 = PLLogCommon();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v62 = v32;
                      _os_log_debug_impl(&dword_2267F1000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    id v4 = v43;
                    unint64_t v5 = 0x263F5F000;
                  }
                }
                [v22 deactivate];
                uint64_t v19 = v45;
              }

              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v46 countByEnumeratingWithState:&v50 objects:v63 count:16];
          }
          while (v19);
        }

        uint64_t v14 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v41);
  }
}

uint64_t __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  freeExpiredDependenciesAtNow__classDebugEnabled = result;
  return result;
}

uint64_t __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke_188(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  freeExpiredDependenciesAtNow__classDebugEnabled_187 = result;
  return result;
}

- (void)setDependencyIDToObservingOwners:(id)a3
{
}

- (void)setDependencyIDToDependencies:(id)a3
{
}

- (void)setOwnerIDToObservingDependencies:(id)a3
{
}

- (void)setOwnerIDToLastOwner:(id)a3
{
}

- (void)setOwnersRepository:(id)a3
{
}

- (PLTimer)freeTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFreeTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeTimer, 0);
  objc_storeStrong((id *)&self->_ownersRepository, 0);
  objc_storeStrong((id *)&self->_ownerIDToLastOwner, 0);
  objc_storeStrong((id *)&self->_ownerIDToObservingDependencies, 0);
  objc_storeStrong((id *)&self->_dependencyIDToDependencies, 0);
  objc_storeStrong((id *)&self->_dependencyIDToObservingOwners, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end