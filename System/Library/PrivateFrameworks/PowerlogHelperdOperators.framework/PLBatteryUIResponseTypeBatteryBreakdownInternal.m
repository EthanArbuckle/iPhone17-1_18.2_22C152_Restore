@interface PLBatteryUIResponseTypeBatteryBreakdownInternal
- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4;
- (BOOL)shouldShowBreakdown:(id)a3;
- (BOOL)showRootNodesInInternal;
- (void)filterEnergyEntries:(id)a3;
- (void)populateInternalRootNodeEnergyKeys:(id)a3;
@end

@implementation PLBatteryUIResponseTypeBatteryBreakdownInternal

- (BOOL)shouldShowBreakdown:(id)a3
{
  return 1;
}

- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4
{
  return 0;
}

- (void)populateInternalRootNodeEnergyKeys:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v37 = v4;
  id obj = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v41 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v54;
    unint64_t v5 = 0x1E4F92000uLL;
    v43 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v54 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v6;
        v7 = *(void **)(*((void *)&v53 + 1) + 8 * v6);
        if ([*(id *)(v5 + 2496) debugEnabled])
        {
          uint64_t v8 = objc_opt_class();
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke;
          v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v52[4] = v8;
          if (populateInternalRootNodeEnergyKeys__defaultOnce != -1) {
            dispatch_once(&populateInternalRootNodeEnergyKeys__defaultOnce, v52);
          }
          if (populateInternalRootNodeEnergyKeys__classDebugEnabled)
          {
            v9 = [NSString stringWithFormat:@"energyEntry=%@", v7];
            v10 = (void *)MEMORY[0x1E4F929B8];
            v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdownInternal.m"];
            v12 = [v11 lastPathComponent];
            v13 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdownInternal populateInternalRootNodeEnergyKeys:]"];
            [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:29];

            v14 = PLLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v9;
              _os_log_debug_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v43;
          }
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v44 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getRootNodeIDToRootNodeEnergyKeys];
        uint64_t v15 = [v44 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v45 = *(void *)v49;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v49 != v45) {
                objc_enumerationMutation(v44);
              }
              uint64_t v18 = *(void *)(*((void *)&v48 + 1) + 8 * v17);
              if ([*(id *)(v5 + 2496) debugEnabled])
              {
                uint64_t v19 = objc_opt_class();
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_20;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v19;
                if (populateInternalRootNodeEnergyKeys__defaultOnce_18 != -1) {
                  dispatch_once(&populateInternalRootNodeEnergyKeys__defaultOnce_18, block);
                }
                if (populateInternalRootNodeEnergyKeys__classDebugEnabled_19)
                {
                  v20 = [NSString stringWithFormat:@"rootNodeName=%@", v18];
                  v21 = (void *)MEMORY[0x1E4F929B8];
                  v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdownInternal.m"];
                  v23 = [v22 lastPathComponent];
                  v24 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdownInternal populateInternalRootNodeEnergyKeys:]"];
                  [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:32];

                  v25 = PLLogCommon();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v20;
                    _os_log_debug_impl(&dword_1E4220000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  unint64_t v5 = 0x1E4F92000uLL;
                }
              }
              v26 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getRootNodeIDToRootNodeEnergyKeys];
              v27 = [v26 objectForKeyedSubscript:v18];

              if ([*(id *)(v5 + 2496) debugEnabled])
              {
                uint64_t v28 = objc_opt_class();
                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3221225472;
                v46[2] = __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_26;
                v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v46[4] = v28;
                if (populateInternalRootNodeEnergyKeys__defaultOnce_24 != -1) {
                  dispatch_once(&populateInternalRootNodeEnergyKeys__defaultOnce_24, v46);
                }
                if (populateInternalRootNodeEnergyKeys__classDebugEnabled_25)
                {
                  v29 = [NSString stringWithFormat:@"rootNodeEnergyKey=%@", v27];
                  v30 = (void *)MEMORY[0x1E4F929B8];
                  v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdownInternal.m"];
                  v32 = [v31 lastPathComponent];
                  v33 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdownInternal populateInternalRootNodeEnergyKeys:]"];
                  [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:35];

                  v34 = PLLogCommon();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v29;
                    _os_log_debug_impl(&dword_1E4220000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v43;
                  unint64_t v5 = 0x1E4F92000;
                }
              }
              uint64_t v35 = [v7 objectForKeyedSubscript:v18];
              if (v35) {
                v36 = (void *)v35;
              }
              else {
                v36 = &unk_1F400E590;
              }
              [v7 setObject:v36 forKeyedSubscript:v27];

              ++v17;
            }
            while (v16 != v17);
            uint64_t v16 = [v44 countByEnumeratingWithState:&v48 objects:v57 count:16];
          }
          while (v16);
        }

        [v40 addObject:v7];
        uint64_t v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v41);
  }

  [v37 setObject:v40 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

uint64_t __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  populateInternalRootNodeEnergyKeys__classDebugEnabled = result;
  return result;
}

uint64_t __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_20(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  populateInternalRootNodeEnergyKeys__classDebugEnabled_19 = result;
  return result;
}

uint64_t __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_26(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  populateInternalRootNodeEnergyKeys__classDebugEnabled_25 = result;
  return result;
}

- (BOOL)showRootNodesInInternal
{
  if (showRootNodesInInternal_onceToken_0 != -1) {
    dispatch_once(&showRootNodesInInternal_onceToken_0, &__block_literal_global_32);
  }
  v2 = (void *)showRootNodesInInternal_val_0;
  if (showRootNodesInInternal_val_0)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

uint64_t __74__PLBatteryUIResponseTypeBatteryBreakdownInternal_showRootNodesInInternal__block_invoke()
{
  +[PLUtilities containerPath];
  showRootNodesInInternal_val_0 = _CFPreferencesCopyValueWithContainer();
  return MEMORY[0x1F41817F8]();
}

- (void)filterEnergyEntries:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PLBatteryUIResponseTypeBatteryBreakdownInternal *)self showRootNodesInInternal])
  {
    uint64_t v16 = v4;
    uint64_t v17 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v5 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
          int v12 = [v11 intValue];

          if (v12 != 5)
          {
            v13 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            v14 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getIntermediateRootNodes];
            char v15 = [v14 containsObject:v13];

            if ((v15 & 1) == 0 && [v13 rangeOfString:@"AssertionPID"] == 0x7FFFFFFFFFFFFFFFLL) {
              [v17 addObject:v10];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    id v4 = v16;
    [v16 setObject:v17 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  }
}

@end