@interface PLAccountingQualificationManager
+ (double)freeTimerInterval;
- (NSDate)lastQualifiedEnergyEventDate;
- (PLAccountingQualificationManagerDelegate)delegate;
- (id)dependencyIDsForOwner:(id)a3;
- (id)ownerIDsForDependency:(id)a3;
- (void)addEnergyEstimate:(id)a3 withNow:(id)a4;
- (void)addQualificationEvent:(id)a3;
- (void)closeLastQualificationEventForwardWithQualificationID:(id)a3 withEndDate:(id)a4;
- (void)didQualifyEnergyEvent:(id)a3 withRootNodeID:(id)a4 withQualificationID:(id)a5;
- (void)reloadDependenciesNewerThanDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastQualifiedEnergyEventDate:(id)a3;
@end

@implementation PLAccountingQualificationManager

- (void)closeLastQualificationEventForwardWithQualificationID:(id)a3 withEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce != -1) {
      dispatch_once(&closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce, block);
    }
    if (closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"qualificationID=%@, endDate=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager closeLastQualificationEventForwardWithQualificationID:withEndDate:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:58];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  int v15 = [v6 intValue];
  if (v7 && v15 >= 1)
  {
    v16 = objc_msgSend(&unk_26DA69E50, "objectAtIndexedSubscript:", (int)objc_msgSend(v6, "intValue"));
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
      v25[2] = __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke_41;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v18;
      if (closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce_39 != -1) {
        dispatch_once(&closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce_39, v25);
      }
      if (closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled_40)
      {
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"directionality=%i not allowed for closing", v17);
        v20 = (void *)MEMORY[0x263F5F638];
        v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
        v22 = [v21 lastPathComponent];
        v23 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager closeLastQualificationEventForwardWithQualificationID:withEndDate:]"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:63];

        v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
  }
}

- (void)addQualificationEvent:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (addQualificationEvent__defaultOnce != -1) {
      dispatch_once(&addQualificationEvent__defaultOnce, block);
    }
    if (addQualificationEvent__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"qualificationEvent=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager addQualificationEvent:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:39];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v4)
  {
    v12 = [[PLAccountingQualificationDependency alloc] initWithQualificationEvent:v4];
    v13 = +[PLAccountingQualificationRuleManager sharedInstance];
    v14 = [v4 qualificationID];
    int v15 = [v13 qualificationRulesForQualificationID:v14];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke_24;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v16;
      if (addQualificationEvent__defaultOnce_22 != -1) {
        dispatch_once(&addQualificationEvent__defaultOnce_22, v23);
      }
      if (addQualificationEvent__classDebugEnabled_23)
      {
        uint64_t v17 = [NSString stringWithFormat:@"qualificationRules=%@", v15];
        uint64_t v18 = (void *)MEMORY[0x263F5F638];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
        v20 = [v19 lastPathComponent];
        v21 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager addQualificationEvent:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:46];

        v22 = PLLogCommon();
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

- (id)ownerIDsForDependency:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    int v15 = __58__PLAccountingQualificationManager_ownerIDsForDependency___block_invoke;
    uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v4;
    if (ownerIDsForDependency__defaultOnce != -1) {
      dispatch_once(&ownerIDsForDependency__defaultOnce, &block);
    }
    if (ownerIDsForDependency__classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"dependency=%@", v3, block, v14, v15, v16, v17];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager ownerIDsForDependency:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:188];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v3)
  {
    v11 = [MEMORY[0x263EFF9C0] setWithObject:&unk_26DA69808];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addEnergyEstimate:(id)a3 withNow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__PLAccountingQualificationManager_addEnergyEstimate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addEnergyEstimate_withNow__defaultOnce != -1) {
      dispatch_once(&addEnergyEstimate_withNow__defaultOnce, block);
    }
    if (addEnergyEstimate_withNow__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"energyEstimate=%@, now=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager addEnergyEstimate:withNow:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:19];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v6 && v7)
  {
    int v15 = [[PLAccountingQualificationOwner alloc] initWithEnergyEstimate:v6];
    uint64_t v16 = [v6 qualificationRuleIDSum];
    if ([v16 longLongValue])
    {
      [v6 terminationRatio];
      double v18 = v17;
      [v6 energy];
      double v20 = v19;
      [v6 correctionEnergy];
      double v22 = v18 * (v20 + v21);
      +[PLAccountingEngine minEnergy];
      double v24 = v23;

      if (v22 > v24)
      {
        [(PLAccountingOwnerDependencyManager *)self addOwner:v15];
LABEL_16:
        [(PLAccountingOwnerDependencyManager *)self notifyDependenciesWithOwner:v15];

        goto LABEL_17;
      }
    }
    else
    {
    }
    if ([v6 writeToDB])
    {
      [v6 setQualificationDate:v7];
      v25 = [(PLAccountingQualificationManager *)self delegate];
      [v25 didQualifyEnergyEvent:v6 withRootNodeID:&unk_26DA697F0 withQualificationID:&unk_26DA697F0];
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (PLAccountingQualificationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLAccountingQualificationManagerDelegate *)WeakRetained;
}

uint64_t __62__PLAccountingQualificationManager_addEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addEnergyEstimate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEvent__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke_24(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEvent__classDebugEnabled_23 = result;
  return result;
}

uint64_t __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled = result;
  return result;
}

uint64_t __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke_41(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled_40 = result;
  return result;
}

+ (double)freeTimerInterval
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__PLAccountingQualificationManager_freeTimerInterval__block_invoke;
  v4[3] = &unk_2647B4F40;
  uint64_t v5 = @"PLAccountingQualificationManager_freeTimerInterval";
  uint64_t v6 = 0x40A5180000000000;
  if (freeTimerInterval_defaultOnce != -1) {
    dispatch_once(&freeTimerInterval_defaultOnce, v4);
  }
  double v2 = *(double *)&freeTimerInterval_objectForKey;

  return v2;
}

uint64_t __53__PLAccountingQualificationManager_freeTimerInterval__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  freeTimerInterval_objectForKey = v2;
  return result;
}

- (void)reloadDependenciesNewerThanDate:(id)a3
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = 0x263F5F000uLL;
  v102 = self;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v119[0] = MEMORY[0x263EF8330];
    v119[1] = 3221225472;
    v119[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke;
    v119[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v119[4] = v6;
    if (reloadDependenciesNewerThanDate__defaultOnce != -1) {
      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce, v119);
    }
    if (reloadDependenciesNewerThanDate__classDebugEnabled)
    {
      id v7 = v4;
      uint64_t v8 = [NSString stringWithFormat:@"date=%@", v4];
      v9 = (void *)MEMORY[0x263F5F638];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:77];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      id v4 = v7;
      self = v102;
      unint64_t v5 = 0x263F5F000uLL;
    }
  }
  if (v4)
  {
    [MEMORY[0x263EFF910] distantFuture];
    uint64_t v14 = v95 = v4;
    char v15 = [v95 isEqualToDate:v14];

    id v4 = v95;
    if ((v15 & 1) == 0)
    {
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      id obj = +[PLAccountingEngine allQualificationIDs];
      uint64_t v97 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
      if (v97)
      {
        uint64_t v96 = *(void *)v116;
        uint64_t v93 = *MEMORY[0x263F5F810];
        uint64_t v92 = *MEMORY[0x263F5F800];
        unint64_t v16 = 0x263F08000uLL;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v116 != v96) {
              objc_enumerationMutation(obj);
            }
            uint64_t v100 = v17;
            double v18 = *(void **)(*((void *)&v115 + 1) + 8 * v17);
            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v19 = objc_opt_class();
              v114[0] = MEMORY[0x263EF8330];
              v114[1] = 3221225472;
              v114[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_54;
              v114[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v114[4] = v19;
              if (reloadDependenciesNewerThanDate__defaultOnce_52 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_52, v114);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_53)
              {
                double v20 = [*(id *)(v16 + 2880) stringWithFormat:@"qualificationID=%@", v18];
                double v21 = (void *)MEMORY[0x263F5F638];
                double v22 = [*(id *)(v16 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
                double v23 = [v22 lastPathComponent];
                double v24 = [*(id *)(v16 + 2880) stringWithUTF8String:"-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]"];
                [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:82];

                v25 = PLLogCommon();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v20;
                  _os_log_debug_impl(&dword_2267F1000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v26 = objc_opt_class();
              v113[0] = MEMORY[0x263EF8330];
              v113[1] = 3221225472;
              v113[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_60;
              v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v113[4] = v26;
              if (reloadDependenciesNewerThanDate__defaultOnce_58 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_58, v113);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_59)
              {
                v27 = [*(id *)(v16 + 2880) stringWithFormat:@"PLAccountingQualificationIDDirectionalities=%@", &unk_26DA69E68];
                v28 = (void *)MEMORY[0x263F5F638];
                v29 = [*(id *)(v16 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
                v30 = [v29 lastPathComponent];
                v31 = [*(id *)(v16 + 2880) stringWithUTF8String:"-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]"];
                [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:85];

                v32 = PLLogCommon();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v27;
                  _os_log_debug_impl(&dword_2267F1000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            v33 = objc_msgSend(&unk_26DA69E80, "objectAtIndexedSubscript:", (int)objc_msgSend(v18, "intValue"));
            uint64_t v34 = [v33 intValue];

            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v35 = objc_opt_class();
              v112[0] = MEMORY[0x263EF8330];
              v112[1] = 3221225472;
              v112[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_72;
              v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v112[4] = v35;
              if (reloadDependenciesNewerThanDate__defaultOnce_70 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_70, v112);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_71)
              {
                v36 = objc_msgSend(*(id *)(v16 + 2880), "stringWithFormat:", @"directionality=%i", v34);
                v37 = (void *)MEMORY[0x263F5F638];
                v38 = [*(id *)(v16 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
                v39 = [v38 lastPathComponent];
                v40 = [*(id *)(v16 + 2880) stringWithUTF8String:"-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]"];
                [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:87];

                v41 = PLLogCommon();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v36;
                  _os_log_debug_impl(&dword_2267F1000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            uint64_t v42 = (v34 - 1);
            switch((int)v34)
            {
              case 1:
                uint64_t v43 = +[PLAccountingQualificationEventForwardEntry entryKey];
                v44 = *(void **)(v16 + 2880);
                [v95 timeIntervalSince1970];
                uint64_t v91 = v45;
                uint64_t v46 = v93;
                goto LABEL_39;
              case 2:
                uint64_t v43 = +[PLAccountingQualificationEventBackwardEntry entryKey];
                v44 = *(void **)(v16 + 2880);
                [v95 timeIntervalSince1970];
                uint64_t v91 = v47;
                uint64_t v46 = v92;
LABEL_39:
                [v44 stringWithFormat:@"ID >= (SELECT MIN(ID)-1 FROM '%@' WHERE (timestamp+%@) >= %f)", v43, v46, v91];
                goto LABEL_42;
              case 3:
                uint64_t v43 = +[PLAccountingQualificationEventIntervalEntry entryKey];
                v48 = *(void **)(v16 + 2880);
                [v95 timeIntervalSince1970];
                [v48 stringWithFormat:@"(timestamp+%@) >= %f", v92, v49, v90];
                goto LABEL_42;
              case 4:
                uint64_t v43 = +[PLAccountingQualificationEventPointEntry entryKey];
                v50 = *(void **)(v16 + 2880);
                [v95 timeIntervalSince1970];
                [v50 stringWithFormat:@"(timestamp+%@) >= %f", v93, v51, v90];
                uint64_t v52 = LABEL_42:;
                break;
              default:
                uint64_t v52 = 0;
                uint64_t v43 = 0;
                break;
            }
            v98 = (void *)v52;
            uint64_t v53 = [*(id *)(v16 + 2880) stringWithFormat:@"SELECT * FROM '%@' WHERE (%@);", v43, v52];
            v101 = (void *)v53;
            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v54 = objc_opt_class();
              v111[0] = MEMORY[0x263EF8330];
              v111[1] = 3221225472;
              v111[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_91;
              v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v111[4] = v54;
              if (reloadDependenciesNewerThanDate__defaultOnce_89 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_89, v111);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_90)
              {
                uint64_t v55 = v42;
                v56 = [*(id *)(v16 + 2880) stringWithFormat:@"qualificationQuery=%@", v53];
                v57 = (void *)MEMORY[0x263F5F638];
                v58 = [*(id *)(v16 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
                v59 = [v58 lastPathComponent];
                v60 = [*(id *)(v16 + 2880) stringWithUTF8String:"-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]"];
                [v57 logMessage:v56 fromFile:v59 fromFunction:v60 fromLineNumber:116];

                v61 = PLLogCommon();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v56;
                  _os_log_debug_impl(&dword_2267F1000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v42 = v55;
                uint64_t v53 = (uint64_t)v101;
              }
            }
            v62 = [MEMORY[0x263F5F698] sharedCore];
            v63 = [v62 storage];
            v64 = [v63 entriesForKey:v43 withQuery:v53];

            v99 = (void *)v43;
            if ([*(id *)(v5 + 1600) debugEnabled])
            {
              uint64_t v65 = objc_opt_class();
              v110[0] = MEMORY[0x263EF8330];
              v110[1] = 3221225472;
              v110[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_98;
              v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v110[4] = v65;
              if (reloadDependenciesNewerThanDate__defaultOnce_96 != -1) {
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_96, v110);
              }
              if (reloadDependenciesNewerThanDate__classDebugEnabled_97)
              {
                uint64_t v66 = v42;
                v67 = [*(id *)(v16 + 2880) stringWithFormat:@"qualificationEvents=%@", v64];
                v68 = (void *)MEMORY[0x263F5F638];
                v69 = [*(id *)(v16 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
                v70 = [v69 lastPathComponent];
                v71 = [*(id *)(v16 + 2880) stringWithUTF8String:"-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]"];
                [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:120];

                v72 = PLLogCommon();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v67;
                  _os_log_debug_impl(&dword_2267F1000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v42 = v66;
              }
            }
            long long v108 = 0u;
            long long v109 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            id v103 = v64;
            uint64_t v73 = [v103 countByEnumeratingWithState:&v106 objects:v120 count:16];
            if (v73)
            {
              uint64_t v74 = v73;
              id v104 = 0;
              uint64_t v75 = *(void *)v107;
              do
              {
                uint64_t v76 = 0;
                do
                {
                  if (*(void *)v107 != v75) {
                    objc_enumerationMutation(v103);
                  }
                  v77 = *(void **)(*((void *)&v106 + 1) + 8 * v76);
                  if ([*(id *)(v5 + 1600) debugEnabled])
                  {
                    uint64_t v78 = objc_opt_class();
                    block[0] = MEMORY[0x263EF8330];
                    block[1] = 3221225472;
                    block[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_104;
                    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    block[4] = v78;
                    if (reloadDependenciesNewerThanDate__defaultOnce_102 != -1) {
                      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_102, block);
                    }
                    if (reloadDependenciesNewerThanDate__classDebugEnabled_103)
                    {
                      uint64_t v79 = v75;
                      uint64_t v80 = v42;
                      v81 = [NSString stringWithFormat:@"qualificationEvent=%@, lastQualificationEvent=%@", v77, v104];
                      v82 = (void *)MEMORY[0x263F5F638];
                      v83 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
                      v84 = [v83 lastPathComponent];
                      v85 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]"];
                      [v82 logMessage:v81 fromFile:v84 fromFunction:v85 fromLineNumber:125];

                      v86 = PLLogCommon();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v122 = v81;
                        _os_log_debug_impl(&dword_2267F1000, v86, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      self = v102;
                      unint64_t v5 = 0x263F5F000;
                      uint64_t v42 = v80;
                      uint64_t v75 = v79;
                    }
                  }
                  switch((int)v42)
                  {
                    case 0:
                      v87 = [(PLAccountingQualificationManager *)self delegate];
                      v88 = v104;
                      [v87 addQualificationEventIntervalWithLastQualificationEventForward:v104 withQualificationEventForward:v77];
                      goto LABEL_74;
                    case 1:
                      v87 = [(PLAccountingQualificationManager *)self delegate];
                      v88 = v104;
                      [v87 addQualificationEventIntervalWithLastQualificationEventBackward:v104 withQualificationEventBackward:v77];
LABEL_74:

                      id v104 = v77;
                      goto LABEL_75;
                    case 2:
                      v88 = [(PLAccountingQualificationManager *)self delegate];
                      [v88 addQualificationEventInterval:v77];
                      goto LABEL_75;
                    case 3:
                      v88 = [(PLAccountingQualificationManager *)self delegate];
                      [v88 addQualificationEventPoint:v77];
LABEL_75:

                      break;
                    default:
                      break;
                  }
                  ++v76;
                }
                while (v74 != v76);
                uint64_t v74 = [v103 countByEnumeratingWithState:&v106 objects:v120 count:16];
              }
              while (v74);
            }
            else
            {
              id v104 = 0;
            }

            uint64_t v17 = v100 + 1;
            unint64_t v16 = 0x263F08000;
          }
          while (v100 + 1 != v97);
          uint64_t v89 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
          uint64_t v97 = v89;
        }
        while (v89);
      }

      id v4 = v95;
    }
  }
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_54(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_53 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_60(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_59 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_72(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_71 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_91(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_90 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_98(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_97 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_104(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadDependenciesNewerThanDate__classDebugEnabled_103 = result;
  return result;
}

- (void)didQualifyEnergyEvent:(id)a3 withRootNodeID:(id)a4 withQualificationID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v11;
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce != -1) {
      dispatch_once(&didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce, v31);
    }
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled)
    {
      v12 = [NSString stringWithFormat:@"qualificationEnergyEvent=%@, rootNodeID=%@, qualificationID=%@", v8, v9, v10];
      v13 = (void *)MEMORY[0x263F5F638];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
      char v15 = [v14 lastPathComponent];
      unint64_t v16 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager didQualifyEnergyEvent:withRootNodeID:withQualificationID:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:158];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  double v18 = PLLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[PLAccountingQualificationManager didQualifyEnergyEvent:withRootNodeID:withQualificationID:]();
  }

  uint64_t v19 = [v8 range];
  double v20 = [v19 endDate];
  double v21 = (void *)[v20 copy];
  [(PLAccountingQualificationManager *)self setLastQualifiedEnergyEventDate:v21];

  double v22 = [(PLAccountingQualificationManager *)self delegate];
  double v23 = [v22 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_111;
  block[3] = &unk_2647B4F68;
  block[4] = self;
  id v28 = v8;
  id v29 = v9;
  id v30 = v10;
  id v24 = v10;
  id v25 = v9;
  id v26 = v8;
  dispatch_async(v23, block);
}

uint64_t __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled = result;
  return result;
}

void __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_111(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didQualifyEnergyEvent:*(void *)(a1 + 40) withRootNodeID:*(void *)(a1 + 48) withQualificationID:*(void *)(a1 + 56)];
}

- (id)dependencyIDsForOwner:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (dependencyIDsForOwner__defaultOnce != -1) {
      dispatch_once(&dependencyIDsForOwner__defaultOnce, block);
    }
    if (dependencyIDsForOwner__classDebugEnabled)
    {
      unint64_t v5 = [NSString stringWithFormat:@"owner=%@", v3];
      uint64_t v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager dependencyIDsForOwner:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:170];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v3)
  {
    uint64_t v11 = +[PLAccountingQualificationRuleManager sharedInstance];
    v12 = [v3 ID];
    v13 = [v11 qualificationRulesForRootNodeID:v12];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_117;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v14;
      if (dependencyIDsForOwner__defaultOnce_115 != -1) {
        dispatch_once(&dependencyIDsForOwner__defaultOnce_115, v45);
      }
      if (dependencyIDsForOwner__classDebugEnabled_116)
      {
        char v15 = [NSString stringWithFormat:@"qualificationRules=%@", v13];
        unint64_t v16 = (void *)MEMORY[0x263F5F638];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
        double v18 = [v17 lastPathComponent];
        uint64_t v19 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager dependencyIDsForOwner:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:175];

        double v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    if (v13)
    {
      double v21 = [MEMORY[0x263EFF9C0] set];
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
            v27 = [*(id *)(*((void *)&v41 + 1) + 8 * i) qualificationID];
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
        v38 = __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_121;
        v39 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v40 = v28;
        if (dependencyIDsForOwner__defaultOnce_119 != -1) {
          dispatch_once(&dependencyIDsForOwner__defaultOnce_119, &v36);
        }
        if (dependencyIDsForOwner__classDebugEnabled_120)
        {
          id v29 = [NSString stringWithFormat:@"qualificationIDs=%@", v21, v36, v37, v38, v39, v40, (void)v41];
          id v30 = (void *)MEMORY[0x263F5F638];
          v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m"];
          v32 = [v31 lastPathComponent];
          v33 = [NSString stringWithUTF8String:"-[PLAccountingQualificationManager dependencyIDsForOwner:]"];
          [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:182];

          uint64_t v34 = PLLogCommon();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
    }
    else
    {
      double v21 = 0;
    }
  }
  else
  {
    double v21 = 0;
  }

  return v21;
}

uint64_t __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependencyIDsForOwner__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_117(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependencyIDsForOwner__classDebugEnabled_116 = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_121(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  dependencyIDsForOwner__classDebugEnabled_120 = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_ownerIDsForDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  ownerIDsForDependency__classDebugEnabled = result;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)lastQualifiedEnergyEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastQualifiedEnergyEventDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQualifiedEnergyEventDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didQualifyEnergyEvent:withRootNodeID:withQualificationID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2267F1000, v0, v1, "didQualifyEnergyEvent=%@", v2, v3, v4, v5, v6);
}

@end