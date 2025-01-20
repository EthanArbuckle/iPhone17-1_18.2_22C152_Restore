@interface PLAccountingDependency
- (NSDate)activationDate;
- (NSMutableSet)observingOwnerIDs;
- (NSNumber)ID;
- (PLAccountingDependencyManager)manager;
- (PLAccountingRange)range;
- (id)description;
- (void)activate;
- (void)deactivate;
- (void)didReceiveOwner:(id)a3;
- (void)setActivationDate:(id)a3;
- (void)setID:(id)a3;
- (void)setManager:(id)a3;
- (void)setObservingOwnerIDs:(id)a3;
- (void)updateWithEndDate:(id)a3;
@end

@implementation PLAccountingDependency

- (void)activate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2267F1000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (PLAccountingDependencyManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (PLAccountingDependencyManager *)WeakRetained;
}

- (void)setObservingOwnerIDs:(id)a3
{
}

- (void)setManager:(id)a3
{
}

- (void)deactivate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__PLAccountingDependency_deactivate__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (deactivate_defaultOnce != -1) {
      dispatch_once(&deactivate_defaultOnce, block);
    }
    if (deactivate_classDebugEnabled)
    {
      uint64_t v4 = [NSString stringWithFormat:@"self=%@", self];
      uint64_t v5 = (void *)MEMORY[0x263F5F638];
      uint8_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAccountingDependency deactivate]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:112];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [(PLAccountingDependency *)self observingOwnerIDs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v16 = [(PLAccountingDependency *)self manager];
        [v16 stopObservingOwnerID:v15 forDependency:self];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }

  [(PLAccountingDependency *)self setObservingOwnerIDs:0];
  v17 = [(PLAccountingDependency *)self manager];
  [v17 canFreeDependency:self];
}

- (void)didReceiveOwner:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveOwner__defaultOnce != -1) {
      dispatch_once(&didReceiveOwner__defaultOnce, block);
    }
    if (didReceiveOwner__classDebugEnabled)
    {
      uint8_t v6 = [NSString stringWithFormat:@"owner=%@, self=%@", v4, self];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingDependency didReceiveOwner:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:73];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v4)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke_44;
      v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v54[4] = v12;
      if (didReceiveOwner__defaultOnce_42 != -1) {
        dispatch_once(&didReceiveOwner__defaultOnce_42, v54);
      }
      if (didReceiveOwner__classDebugEnabled_43)
      {
        uint64_t v13 = NSString;
        v14 = [(PLAccountingDependency *)self observingOwnerIDs];
        uint64_t v15 = [v13 stringWithFormat:@"observingOwnerIDs=%@", v14];

        v16 = (void *)MEMORY[0x263F5F638];
        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
        long long v18 = [v17 lastPathComponent];
        long long v19 = [NSString stringWithUTF8String:"-[PLAccountingDependency didReceiveOwner:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:77];

        long long v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    long long v21 = [(PLAccountingDependency *)self observingOwnerIDs];
    v22 = [v4 ID];
    int v23 = [v21 containsObject:v22];

    if (v23)
    {
      uint64_t v24 = [v4 range];
      v25 = [v24 endDate];
      v26 = [(PLAccountingDependency *)self range];
      v27 = [v26 endDate];
      [v25 timeIntervalSinceDate:v27];
      double v29 = v28;

      if (v29 >= -1.0)
      {
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v30 = objc_opt_class();
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke_47;
          v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v53[4] = v30;
          if (didReceiveOwner__defaultOnce_45 != -1) {
            dispatch_once(&didReceiveOwner__defaultOnce_45, v53);
          }
          if (didReceiveOwner__classDebugEnabled_46)
          {
            v31 = [NSString stringWithFormat:@"owner exceeds dependency's range"];
            v32 = (void *)MEMORY[0x263F5F638];
            v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
            v34 = [v33 lastPathComponent];
            v35 = [NSString stringWithUTF8String:"-[PLAccountingDependency didReceiveOwner:]"];
            [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:82];

            v36 = PLLogCommon();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        v37 = [(PLAccountingDependency *)self observingOwnerIDs];
        v38 = [v4 ID];
        [v37 removeObject:v38];

        v39 = [(PLAccountingDependency *)self manager];
        v40 = [v4 ID];
        [v39 stopObservingOwnerID:v40 forDependency:self];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v41 = objc_opt_class();
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke_53;
          v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v52[4] = v41;
          if (didReceiveOwner__defaultOnce_51 != -1) {
            dispatch_once(&didReceiveOwner__defaultOnce_51, v52);
          }
          if (didReceiveOwner__classDebugEnabled_52)
          {
            v42 = NSString;
            v43 = [(PLAccountingDependency *)self observingOwnerIDs];
            v44 = objc_msgSend(v42, "stringWithFormat:", @"observingOwnerIDs.count=%i", objc_msgSend(v43, "count"));

            v45 = (void *)MEMORY[0x263F5F638];
            v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
            v47 = [v46 lastPathComponent];
            v48 = [NSString stringWithUTF8String:"-[PLAccountingDependency didReceiveOwner:]"];
            [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:89];

            v49 = PLLogCommon();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        v50 = [(PLAccountingDependency *)self observingOwnerIDs];
        uint64_t v51 = [v50 count];

        if (!v51) {
          [(PLAccountingDependency *)self deactivate];
        }
      }
    }
  }
}

- (NSMutableSet)observingOwnerIDs
{
  observingOwnerIDs = self->_observingOwnerIDs;
  if (!observingOwnerIDs)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    uint64_t v5 = self->_observingOwnerIDs;
    self->_observingOwnerIDs = v4;

    observingOwnerIDs = self->_observingOwnerIDs;
  }
  return observingOwnerIDs;
}

- (void)updateWithEndDate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__PLAccountingDependency_updateWithEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (updateWithEndDate__defaultOnce != -1) {
      dispatch_once(&updateWithEndDate__defaultOnce, block);
    }
    if (updateWithEndDate__classDebugEnabled)
    {
      uint8_t v6 = [NSString stringWithFormat:@"endDate=%@, self=%@", v4, self];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingDependency updateWithEndDate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:99];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  uint64_t v12 = [(PLAccountingDependency *)self range];
  uint64_t v13 = [v12 endDate];
  [v4 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 >= 0.0)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v28 = objc_opt_class();
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __44__PLAccountingDependency_updateWithEndDate___block_invoke_59;
      v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v34[4] = v28;
      if (updateWithEndDate__defaultOnce_57 != -1) {
        dispatch_once(&updateWithEndDate__defaultOnce_57, v34);
      }
      if (updateWithEndDate__classDebugEnabled_58)
      {
        v22 = [NSString stringWithFormat:@"cannot push endDate further into the future"];
        double v29 = (void *)MEMORY[0x263F5F638];
        uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
        v31 = [v30 lastPathComponent];
        v32 = [NSString stringWithUTF8String:"-[PLAccountingDependency updateWithEndDate:]"];
        [v29 logMessage:v22 fromFile:v31 fromFunction:v32 fromLineNumber:103];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
        goto LABEL_21;
      }
    }
  }
  else
  {
    v16 = [(PLAccountingDependency *)self range];
    v17 = [v16 startDate];
    long long v18 = +[PLAccountingRange rangeWithStartDate:v17 withEndDate:v4];
    [(PLAccountingDependency *)self setRange:v18];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __44__PLAccountingDependency_updateWithEndDate___block_invoke_66;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = v19;
      if (updateWithEndDate__defaultOnce_64 != -1) {
        dispatch_once(&updateWithEndDate__defaultOnce_64, v33);
      }
      if (updateWithEndDate__classDebugEnabled_65)
      {
        long long v20 = NSString;
        long long v21 = [(PLAccountingDependency *)self range];
        v22 = [v20 stringWithFormat:@"range=%@", v21];

        int v23 = (void *)MEMORY[0x263F5F638];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m"];
        v25 = [v24 lastPathComponent];
        v26 = [NSString stringWithUTF8String:"-[PLAccountingDependency updateWithEndDate:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:108];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
LABEL_21:
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingOwnerIDs, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (NSNumber)ID
{
  return (NSNumber *)&unk_26DA69760;
}

- (PLAccountingRange)range
{
  return 0;
}

- (NSDate)activationDate
{
  return 0;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_17(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_16 = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_23(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_22 = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_29(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_28 = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_35(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_34 = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveOwner__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke_44(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveOwner__classDebugEnabled_43 = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke_47(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveOwner__classDebugEnabled_46 = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke_53(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveOwner__classDebugEnabled_52 = result;
  return result;
}

uint64_t __44__PLAccountingDependency_updateWithEndDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateWithEndDate__classDebugEnabled = result;
  return result;
}

uint64_t __44__PLAccountingDependency_updateWithEndDate___block_invoke_59(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateWithEndDate__classDebugEnabled_58 = result;
  return result;
}

uint64_t __44__PLAccountingDependency_updateWithEndDate___block_invoke_66(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateWithEndDate__classDebugEnabled_65 = result;
  return result;
}

uint64_t __36__PLAccountingDependency_deactivate__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  deactivate_classDebugEnabled = result;
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(PLAccountingDependency *)self ID];
  uint64_t v5 = [(PLAccountingDependency *)self range];
  uint8_t v6 = [v3 stringWithFormat:@"(ID=%@, range=%@)", v4, v5];

  return v6;
}

- (void)setID:(id)a3
{
}

- (void)setActivationDate:(id)a3
{
}

@end