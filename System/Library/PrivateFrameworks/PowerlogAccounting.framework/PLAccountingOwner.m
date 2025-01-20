@interface PLAccountingOwner
- (BOOL)hasRun;
- (NSDate)activationDate;
- (NSDate)runDate;
- (NSMutableDictionary)dependencyIDToDependenciesInRange;
- (NSMutableSet)observingDependencyIDs;
- (NSNumber)ID;
- (NSString)description;
- (PLAccountingOwnerManager)manager;
- (PLAccountingRange)range;
- (void)activate;
- (void)addDependency:(id)a3;
- (void)allRun;
- (void)deactivate;
- (void)didReceiveDependency:(id)a3;
- (void)setActivationDate:(id)a3;
- (void)setDependencyIDToDependenciesInRange:(id)a3;
- (void)setID:(id)a3;
- (void)setManager:(id)a3;
- (void)setObservingDependencyIDs:(id)a3;
- (void)setRange:(id)a3;
- (void)setRunDate:(id)a3;
@end

@implementation PLAccountingOwner

- (void)activate
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v106[0] = MEMORY[0x263EF8330];
    v106[1] = 3221225472;
    v106[2] = __29__PLAccountingOwner_activate__block_invoke;
    v106[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v106[4] = v3;
    if (activate_defaultOnce_0 != -1) {
      dispatch_once(&activate_defaultOnce_0, v106);
    }
    if (activate_classDebugEnabled_0)
    {
      v4 = [NSString stringWithFormat:@"self=%@", self];
      v5 = (void *)MEMORY[0x263F5F638];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAccountingOwner activate]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:39];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v10 = [(PLAccountingOwner *)self manager];
  v84 = [v10 dependencyIDsForOwner:self];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = __29__PLAccountingOwner_activate__block_invoke_17;
    v105[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v105[4] = v11;
    if (activate_defaultOnce_15_0 != -1) {
      dispatch_once(&activate_defaultOnce_15_0, v105);
    }
    if (activate_classDebugEnabled_16_0)
    {
      v12 = [NSString stringWithFormat:@"initialObservingDependencyIDs=%@", v84];
      v13 = (void *)MEMORY[0x263F5F638];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v15 = [v14 lastPathComponent];
      v16 = [NSString stringWithUTF8String:"-[PLAccountingOwner activate]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:43];

      v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obuint64_t j = (id)[v84 copy];
  uint64_t v87 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v87)
  {
    uint64_t v86 = *(void *)v102;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v102 != v86) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v101 + 1) + 8 * v18);
        v20 = [(PLAccountingOwner *)self manager];
        v21 = [(PLAccountingOwner *)self range];
        v22 = [v20 dependenciesWithDependencyID:v19 withRange:v21];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v23 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __29__PLAccountingOwner_activate__block_invoke_23;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v23;
          if (activate_defaultOnce_21_0 != -1) {
            dispatch_once(&activate_defaultOnce_21_0, block);
          }
          if (activate_classDebugEnabled_22_0)
          {
            v24 = [NSString stringWithFormat:@"dependencyID=%@, dependencies=%@", v19, v22];
            v25 = (void *)MEMORY[0x263F5F638];
            v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
            v27 = [v26 lastPathComponent];
            v28 = [NSString stringWithUTF8String:"-[PLAccountingOwner activate]"];
            [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:48];

            v29 = PLLogCommon();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v110 = v24;
              _os_log_debug_impl(&dword_2267F1000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v30 = v22;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v96 objects:v108 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v97;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v97 != v33) {
                objc_enumerationMutation(v30);
              }
              [(PLAccountingOwner *)self addDependency:*(void *)(*((void *)&v96 + 1) + 8 * i)];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v96 objects:v108 count:16];
          }
          while (v32);
        }

        v35 = [(PLAccountingOwner *)self manager];
        v36 = [v35 _lastDependencyForDependencyID:v19];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v37 = objc_opt_class();
          v95[0] = MEMORY[0x263EF8330];
          v95[1] = 3221225472;
          v95[2] = __29__PLAccountingOwner_activate__block_invoke_29;
          v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v95[4] = v37;
          if (activate_defaultOnce_27_0 != -1) {
            dispatch_once(&activate_defaultOnce_27_0, v95);
          }
          if (activate_classDebugEnabled_28_0)
          {
            v38 = [NSString stringWithFormat:@"lastDependency=%@", v36];
            v39 = (void *)MEMORY[0x263F5F638];
            v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
            v41 = [v40 lastPathComponent];
            v42 = [NSString stringWithUTF8String:"-[PLAccountingOwner activate]"];
            [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:57];

            v43 = PLLogCommon();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v110 = v38;
              _os_log_debug_impl(&dword_2267F1000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        if (v36)
        {
          v44 = [v36 range];
          v45 = [v44 endDate];
          v46 = [(PLAccountingOwner *)self range];
          v47 = [v46 endDate];
          [v45 timeIntervalSinceDate:v47];
          double v49 = v48;

          if (v49 >= -1.0)
          {
            if ([MEMORY[0x263F5F640] debugEnabled])
            {
              uint64_t v50 = objc_opt_class();
              v94[0] = MEMORY[0x263EF8330];
              v94[1] = 3221225472;
              v94[2] = __29__PLAccountingOwner_activate__block_invoke_35;
              v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v94[4] = v50;
              if (activate_defaultOnce_33_0 != -1) {
                dispatch_once(&activate_defaultOnce_33_0, v94);
              }
              if (activate_classDebugEnabled_34_0)
              {
                v51 = [NSString stringWithFormat:@"dependency's range has surpassed the range of this owner"];
                v52 = (void *)MEMORY[0x263F5F638];
                v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
                v54 = [v53 lastPathComponent];
                v55 = [NSString stringWithUTF8String:"-[PLAccountingOwner activate]"];
                [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:59];

                v56 = PLLogCommon();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v110 = v51;
                  _os_log_debug_impl(&dword_2267F1000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            [v84 removeObject:v19];
          }
        }

        ++v18;
      }
      while (v18 != v87);
      uint64_t v87 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
    }
    while (v87);
  }

  [(PLAccountingOwner *)self setObservingDependencyIDs:v84];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v57 = objc_opt_class();
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3221225472;
    v93[2] = __29__PLAccountingOwner_activate__block_invoke_41;
    v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v93[4] = v57;
    if (activate_defaultOnce_39 != -1) {
      dispatch_once(&activate_defaultOnce_39, v93);
    }
    if (activate_classDebugEnabled_40)
    {
      v58 = NSString;
      v59 = [(PLAccountingOwner *)self observingDependencyIDs];
      v60 = [v58 stringWithFormat:@"observingDependencyIDs=%@", v59];

      v61 = (void *)MEMORY[0x263F5F638];
      v62 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v63 = [v62 lastPathComponent];
      v64 = [NSString stringWithUTF8String:"-[PLAccountingOwner activate]"];
      [v61 logMessage:v60 fromFile:v63 fromFunction:v64 fromLineNumber:66];

      v65 = PLLogCommon();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v66 = [(PLAccountingOwner *)self observingDependencyIDs];
  uint64_t v67 = [v66 countByEnumeratingWithState:&v89 objects:v107 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v68; ++j)
      {
        if (*(void *)v90 != v69) {
          objc_enumerationMutation(v66);
        }
        uint64_t v71 = *(void *)(*((void *)&v89 + 1) + 8 * j);
        v72 = [(PLAccountingOwner *)self manager];
        [v72 startObservingDependencyID:v71 forOwner:self];
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v89 objects:v107 count:16];
    }
    while (v68);
  }

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v73 = objc_opt_class();
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __29__PLAccountingOwner_activate__block_invoke_47;
    v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v88[4] = v73;
    if (activate_defaultOnce_45 != -1) {
      dispatch_once(&activate_defaultOnce_45, v88);
    }
    if (activate_classDebugEnabled_46)
    {
      v74 = NSString;
      v75 = [(PLAccountingOwner *)self observingDependencyIDs];
      v76 = objc_msgSend(v74, "stringWithFormat:", @"observingDependencyIDs.count=%i", objc_msgSend(v75, "count"));

      v77 = (void *)MEMORY[0x263F5F638];
      v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v79 = [v78 lastPathComponent];
      v80 = [NSString stringWithUTF8String:"-[PLAccountingOwner activate]"];
      [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:74];

      v81 = PLLogCommon();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v82 = [(PLAccountingOwner *)self observingDependencyIDs];
  uint64_t v83 = [v82 count];

  if (!v83) {
    [(PLAccountingOwner *)self allRun];
  }
}

- (PLAccountingOwnerManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (PLAccountingOwnerManager *)WeakRetained;
}

- (void)setObservingDependencyIDs:(id)a3
{
}

- (void)allRun
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__PLAccountingOwner_allRun__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (allRun_defaultOnce != -1) {
      dispatch_once(&allRun_defaultOnce, block);
    }
    if (allRun_classDebugEnabled)
    {
      v4 = [NSString stringWithFormat:@"self=%@", self];
      v5 = (void *)MEMORY[0x263F5F638];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAccountingOwner allRun]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:151];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (![(PLAccountingOwner *)self hasRun])
  {
    v10 = [MEMORY[0x263EFF910] monotonicDate];
    runDate = self->_runDate;
    self->_runDate = v10;

    [(PLAccountingOwner *)self setRunDate:self->_runDate];
    [(PLAccountingOwner *)self run];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = [(PLAccountingOwner *)self observingDependencyIDs];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v18 = [(PLAccountingOwner *)self manager];
          [v18 stopObservingDependencyID:v17 forOwner:self];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    [(PLAccountingOwner *)self setDependencyIDToDependenciesInRange:0];
    uint64_t v19 = [(PLAccountingOwner *)self manager];
    [v19 canFreeOwner:self];
  }
}

- (void)didReceiveDependency:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveDependency__defaultOnce != -1) {
      dispatch_once(&didReceiveDependency__defaultOnce, block);
    }
    if (didReceiveDependency__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"dependency=%@, self=%@", v4, self];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingOwner didReceiveDependency:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:81];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v4 && ![(PLAccountingOwner *)self hasRun])
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_56;
      v76[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v76[4] = v12;
      if (didReceiveDependency__defaultOnce_54 != -1) {
        dispatch_once(&didReceiveDependency__defaultOnce_54, v76);
      }
      if (didReceiveDependency__classDebugEnabled_55)
      {
        uint64_t v13 = NSString;
        uint64_t v14 = [v4 range];
        uint64_t v15 = [(PLAccountingOwner *)self range];
        v16 = [v13 stringWithFormat:@"dependency.range=%@, self.range=%@", v14, v15];

        uint64_t v17 = (void *)MEMORY[0x263F5F638];
        uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
        uint64_t v19 = [v18 lastPathComponent];
        long long v20 = [NSString stringWithUTF8String:"-[PLAccountingOwner didReceiveDependency:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:87];

        long long v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_62;
      v75[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v75[4] = v22;
      if (didReceiveDependency__defaultOnce_60 != -1) {
        dispatch_once(&didReceiveDependency__defaultOnce_60, v75);
      }
      if (didReceiveDependency__classDebugEnabled_61)
      {
        long long v23 = NSString;
        v24 = [(PLAccountingOwner *)self observingDependencyIDs];
        v25 = [v23 stringWithFormat:@"observingDependencyIDs=%@", v24];

        uint64_t v26 = (void *)MEMORY[0x263F5F638];
        v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
        v28 = [v27 lastPathComponent];
        v29 = [NSString stringWithUTF8String:"-[PLAccountingOwner didReceiveDependency:]"];
        [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:90];

        id v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v31 = [(PLAccountingOwner *)self observingDependencyIDs];
    uint64_t v32 = [v4 ID];
    int v33 = [v31 containsObject:v32];

    if (v33)
    {
      v34 = [v4 range];
      v35 = [(PLAccountingOwner *)self range];
      int v36 = [v34 overlaps:v35];

      if (v36)
      {
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v37 = objc_opt_class();
          v74[0] = MEMORY[0x263EF8330];
          v74[1] = 3221225472;
          v74[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_65;
          v74[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v74[4] = v37;
          if (didReceiveDependency__defaultOnce_63 != -1) {
            dispatch_once(&didReceiveDependency__defaultOnce_63, v74);
          }
          if (didReceiveDependency__classDebugEnabled_64)
          {
            v38 = [NSString stringWithFormat:@"dependency overlaps owner's range"];
            v39 = (void *)MEMORY[0x263F5F638];
            v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
            v41 = [v40 lastPathComponent];
            v42 = [NSString stringWithUTF8String:"-[PLAccountingOwner didReceiveDependency:]"];
            [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:95];

            v43 = PLLogCommon();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        [(PLAccountingOwner *)self addDependency:v4];
      }
      v44 = [v4 range];
      v45 = [v44 endDate];
      v46 = [(PLAccountingOwner *)self range];
      v47 = [v46 endDate];
      [v45 timeIntervalSinceDate:v47];
      double v49 = v48;

      if (v49 >= -1.0)
      {
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v50 = objc_opt_class();
          v73[0] = MEMORY[0x263EF8330];
          v73[1] = 3221225472;
          v73[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_71;
          v73[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v73[4] = v50;
          if (didReceiveDependency__defaultOnce_69 != -1) {
            dispatch_once(&didReceiveDependency__defaultOnce_69, v73);
          }
          if (didReceiveDependency__classDebugEnabled_70)
          {
            v51 = [NSString stringWithFormat:@"dependency exceeds owner's range"];
            v52 = (void *)MEMORY[0x263F5F638];
            v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
            v54 = [v53 lastPathComponent];
            v55 = [NSString stringWithUTF8String:"-[PLAccountingOwner didReceiveDependency:]"];
            [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:101];

            v56 = PLLogCommon();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        uint64_t v57 = [(PLAccountingOwner *)self observingDependencyIDs];
        v58 = [v4 ID];
        [v57 removeObject:v58];

        v59 = [(PLAccountingOwner *)self manager];
        v60 = [v4 ID];
        [v59 stopObservingDependencyID:v60 forOwner:self];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v61 = objc_opt_class();
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_77;
          v72[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v72[4] = v61;
          if (didReceiveDependency__defaultOnce_75 != -1) {
            dispatch_once(&didReceiveDependency__defaultOnce_75, v72);
          }
          if (didReceiveDependency__classDebugEnabled_76)
          {
            v62 = NSString;
            v63 = [(PLAccountingOwner *)self observingDependencyIDs];
            v64 = objc_msgSend(v62, "stringWithFormat:", @"observingDependencyIDs.count=%i", objc_msgSend(v63, "count"));

            v65 = (void *)MEMORY[0x263F5F638];
            v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
            uint64_t v67 = [v66 lastPathComponent];
            uint64_t v68 = [NSString stringWithUTF8String:"-[PLAccountingOwner didReceiveDependency:]"];
            [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:108];

            uint64_t v69 = PLLogCommon();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        v70 = [(PLAccountingOwner *)self observingDependencyIDs];
        uint64_t v71 = [v70 count];

        if (!v71) {
          [(PLAccountingOwner *)self allRun];
        }
      }
    }
  }
}

- (NSMutableSet)observingDependencyIDs
{
  observingDependencyIDs = self->_observingDependencyIDs;
  if (!observingDependencyIDs)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    uint64_t v5 = self->_observingDependencyIDs;
    self->_observingDependencyIDs = v4;

    observingDependencyIDs = self->_observingDependencyIDs;
  }
  return observingDependencyIDs;
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PLAccountingOwner_addDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (addDependency__defaultOnce != -1) {
      dispatch_once(&addDependency__defaultOnce, block);
    }
    if (addDependency__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"self=%@, dependencyInRange=%@", self, v4];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingOwner addDependency:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:139];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  uint64_t v12 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
  uint64_t v13 = [v4 ID];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    uint64_t v15 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
    v16 = [v4 ID];
    [v15 setObject:v14 forKeyedSubscript:v16];
  }
  [v14 addObject:v4];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __35__PLAccountingOwner_addDependency___block_invoke_86;
    id v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v17;
    if (addDependency__defaultOnce_84 != -1) {
      dispatch_once(&addDependency__defaultOnce_84, &v27);
    }
    if (addDependency__classDebugEnabled_85)
    {
      uint64_t v18 = NSString;
      uint64_t v19 = [v4 ID];
      long long v20 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
      long long v21 = [v18 stringWithFormat:@"dependencyInRange.ID=%@, dependencyIDToDependenciesInRange=%@", v19, v20, v27, v28, v29, v30, v31];

      uint64_t v22 = (void *)MEMORY[0x263F5F638];
      long long v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLAccountingOwner addDependency:]"];
      [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:147];

      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

- (NSMutableDictionary)dependencyIDToDependenciesInRange
{
  dependencyIDToDependenciesInRange = self->_dependencyIDToDependenciesInRange;
  if (!dependencyIDToDependenciesInRange)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v5 = self->_dependencyIDToDependenciesInRange;
    self->_dependencyIDToDependenciesInRange = v4;

    dependencyIDToDependenciesInRange = self->_dependencyIDToDependenciesInRange;
  }
  return dependencyIDToDependenciesInRange;
}

- (BOOL)hasRun
{
  v2 = [(PLAccountingOwner *)self runDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSDate)runDate
{
  return self->_runDate;
}

- (void)setManager:(id)a3
{
}

- (void)setDependencyIDToDependenciesInRange:(id)a3
{
}

- (void)deactivate
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __31__PLAccountingOwner_deactivate__block_invoke;
    uint64_t v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (deactivate_defaultOnce_0 != -1) {
      dispatch_once(&deactivate_defaultOnce_0, &block);
    }
    if (deactivate_classDebugEnabled_0)
    {
      id v4 = [NSString stringWithFormat:@"self=%@", self, block, v11, v12, v13, v14];
      uint64_t v5 = (void *)MEMORY[0x263F5F638];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAccountingOwner deactivate]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:116];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  [(PLAccountingOwner *)self allRun];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencyIDToDependenciesInRange, 0);
  objc_storeStrong((id *)&self->_observingDependencyIDs, 0);
  objc_storeStrong((id *)&self->_runDate, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (NSNumber)ID
{
  return (NSNumber *)&unk_26DA69D00;
}

- (PLAccountingRange)range
{
  return 0;
}

- (NSDate)activationDate
{
  return 0;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_17(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_16_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_23(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_22_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_29(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_28_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_35(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_34_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_41(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_40 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_47(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  activate_classDebugEnabled_46 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDependency__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_56(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDependency__classDebugEnabled_55 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_62(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDependency__classDebugEnabled_61 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_65(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDependency__classDebugEnabled_64 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_71(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDependency__classDebugEnabled_70 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_77(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDependency__classDebugEnabled_76 = result;
  return result;
}

uint64_t __31__PLAccountingOwner_deactivate__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  deactivate_classDebugEnabled_0 = result;
  return result;
}

uint64_t __35__PLAccountingOwner_addDependency___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDependency__classDebugEnabled = result;
  return result;
}

uint64_t __35__PLAccountingOwner_addDependency___block_invoke_86(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDependency__classDebugEnabled_85 = result;
  return result;
}

uint64_t __27__PLAccountingOwner_allRun__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  allRun_classDebugEnabled = result;
  return result;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = [(PLAccountingOwner *)self ID];
  uint64_t v5 = [(PLAccountingOwner *)self range];
  v6 = [v3 stringWithFormat:@"(ID=%@, range=%@)", v4, v5];

  return (NSString *)v6;
}

- (void)setID:(id)a3
{
}

- (void)setRange:(id)a3
{
}

- (void)setActivationDate:(id)a3
{
}

- (void)setRunDate:(id)a3
{
}

@end