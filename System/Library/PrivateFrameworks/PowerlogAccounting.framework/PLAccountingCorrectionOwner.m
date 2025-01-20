@interface PLAccountingCorrectionOwner
- (PLAccountingCorrectionOwner)initWithRootEnergyEstimate:(id)a3;
- (PLAccountingEnergyEstimateEventEntry)rootEnergyEstimate;
- (id)ID;
- (id)activationDate;
- (id)range;
- (void)correct;
- (void)setRootEnergyEstimate:(id)a3;
- (void)setRunDate:(id)a3;
@end

@implementation PLAccountingCorrectionOwner

- (id)ID
{
  v2 = [(PLAccountingCorrectionOwner *)self rootEnergyEstimate];
  v3 = [v2 nodeID];

  return v3;
}

- (id)range
{
  v2 = [(PLAccountingCorrectionOwner *)self rootEnergyEstimate];
  v3 = [v2 range];

  return v3;
}

- (PLAccountingEnergyEstimateEventEntry)rootEnergyEstimate
{
  return (PLAccountingEnergyEstimateEventEntry *)objc_getProperty(self, a2, 64, 1);
}

- (id)activationDate
{
  v2 = [(PLAccountingCorrectionOwner *)self rootEnergyEstimate];
  v3 = [v2 entryDate];

  return v3;
}

- (void)setRunDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLAccountingCorrectionOwner *)self rootEnergyEstimate];
  [v5 setCorrectionDate:v4];
}

- (PLAccountingCorrectionOwner)initWithRootEnergyEstimate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingCorrectionOwner;
  v6 = [(PLAccountingCorrectionOwner *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rootEnergyEstimate, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)correct
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v154[0] = MEMORY[0x263EF8330];
    v154[1] = 3221225472;
    v154[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke;
    v154[3] = &unk_2647B4F90;
    uint64_t v156 = v3;
    v155 = @"correct";
    if (correct_defaultOnce != -1) {
      dispatch_once(&correct_defaultOnce, v154);
    }
    int v4 = correct_classDebugEnabled;

    if (v4)
    {
      id v5 = NSString;
      v6 = [(PLAccountingCorrectionOwner *)self rootEnergyEstimate];
      v7 = [v5 stringWithFormat:@"self.rootEnergyEstimate=%@", v6];

      v8 = (void *)MEMORY[0x263F5F638];
      objc_super v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
      v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:49];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]((uint64_t)v7, v12);
      }
    }
  }
  v13 = [(PLAccountingCorrectionOwner *)self rootEnergyEstimate];
  [v13 energy];
  double v15 = v14;

  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  v16 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
  v17 = [v16 allKeys];

  id obj = v17;
  v121 = self;
  uint64_t v118 = [v17 countByEnumeratingWithState:&v150 objects:v160 count:16];
  if (v118)
  {
    uint64_t v117 = *(void *)v151;
    double v18 = 0.0;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v151 != v117) {
          objc_enumerationMutation(obj);
        }
        uint64_t v120 = v19;
        v20 = *(void **)(*((void *)&v150 + 1) + 8 * v19);
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          v147[0] = MEMORY[0x263EF8330];
          v147[1] = 3221225472;
          v147[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_19;
          v147[3] = &unk_2647B4F90;
          uint64_t v149 = v21;
          v148 = @"correct";
          if (correct_defaultOnce_17 != -1) {
            dispatch_once(&correct_defaultOnce_17, v147);
          }
          int v22 = correct_classDebugEnabled_18;

          if (v22)
          {
            v23 = [NSString stringWithFormat:@"rootNodeID=%@", v20];
            v24 = (void *)MEMORY[0x263F5F638];
            v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
            v26 = [v25 lastPathComponent];
            v27 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
            [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:53];

            v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v159 = v23;
              _os_log_debug_impl(&dword_2267F1000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v121;
          }
        }
        v29 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
        v30 = [v29 objectForKeyedSubscript:v20];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v31 = objc_opt_class();
          v144[0] = MEMORY[0x263EF8330];
          v144[1] = 3221225472;
          v144[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_25;
          v144[3] = &unk_2647B4F90;
          uint64_t v146 = v31;
          v145 = @"correct";
          if (correct_defaultOnce_23 != -1) {
            dispatch_once(&correct_defaultOnce_23, v144);
          }
          int v32 = correct_classDebugEnabled_24;

          if (v32)
          {
            v33 = [NSString stringWithFormat:@"dependenciesInRange=%@", v30];
            v34 = (void *)MEMORY[0x263F5F638];
            v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
            v36 = [v35 lastPathComponent];
            v37 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
            [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:56];

            v38 = PLLogCommon();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v159 = v33;
              _os_log_debug_impl(&dword_2267F1000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v121;
          }
        }
        v119 = v20;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        id v39 = v30;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v140 objects:v157 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v141;
          double v43 = 0.0;
          do
          {
            uint64_t v44 = 0;
            do
            {
              if (*(void *)v141 != v42) {
                objc_enumerationMutation(v39);
              }
              v45 = [*(id *)(*((void *)&v140 + 1) + 8 * v44) energyEvent];
              if ([MEMORY[0x263F5F640] debugEnabled])
              {
                uint64_t v46 = objc_opt_class();
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_31;
                block[3] = &unk_2647B4F90;
                v138 = @"correct";
                uint64_t v139 = v46;
                if (correct_defaultOnce_29 != -1) {
                  dispatch_once(&correct_defaultOnce_29, block);
                }
                int v47 = correct_classDebugEnabled_30;

                if (v47)
                {
                  v48 = [NSString stringWithFormat:@"energyEvent=%@", v45];
                  v49 = (void *)MEMORY[0x263F5F638];
                  v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
                  v51 = [v50 lastPathComponent];
                  v52 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
                  [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:62];

                  v53 = PLLogCommon();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v159 = v48;
                    _os_log_debug_impl(&dword_2267F1000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v121;
                }
              }
              [v45 energy];
              if (v54 != 0.0)
              {
                v55 = [v45 range];
                v56 = [(PLAccountingCorrectionOwner *)self range];
                v57 = [v55 intersect:v56];
                [v57 length];
                double v59 = v58;
                v60 = [v45 range];
                [v60 length];
                double v62 = v59 / v61;
                [v45 energy];
                double v43 = v43 + v62 * v63;

                if ([MEMORY[0x263F5F640] debugEnabled])
                {
                  uint64_t v64 = objc_opt_class();
                  v134[0] = MEMORY[0x263EF8330];
                  v134[1] = 3221225472;
                  v134[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_37;
                  v134[3] = &unk_2647B4F90;
                  v135 = @"correct";
                  uint64_t v136 = v64;
                  if (correct_defaultOnce_35 != -1) {
                    dispatch_once(&correct_defaultOnce_35, v134);
                  }
                  int v65 = correct_classDebugEnabled_36;

                  if (v65)
                  {
                    v66 = objc_msgSend(NSString, "stringWithFormat:", @"totalEstimatedForNode=%f", *(void *)&v43);
                    v67 = (void *)MEMORY[0x263F5F638];
                    v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
                    v69 = [v68 lastPathComponent];
                    v70 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
                    [v67 logMessage:v66 fromFile:v69 fromFunction:v70 fromLineNumber:67];

                    v71 = PLLogCommon();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v159 = v66;
                      _os_log_debug_impl(&dword_2267F1000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    self = v121;
                  }
                }
              }

              ++v44;
            }
            while (v41 != v44);
            uint64_t v41 = [v39 countByEnumeratingWithState:&v140 objects:v157 count:16];
          }
          while (v41);
        }
        else
        {
          double v43 = 0.0;
        }

        int v72 = [v119 intValue];
        double v73 = -0.0;
        if (v72 == 1) {
          double v74 = -0.0;
        }
        else {
          double v74 = v43;
        }
        double v15 = v15 + v74;
        if (v72 == 1) {
          double v73 = v43;
        }
        double v18 = v18 + v73;

        uint64_t v19 = v120 + 1;
      }
      while (v120 + 1 != v118);
      uint64_t v118 = [obj countByEnumeratingWithState:&v150 objects:v160 count:16];
    }
    while (v118);
  }
  else
  {
    double v18 = 0.0;
  }

  if (v15 <= 0.0) {
    double v75 = 0.0;
  }
  else {
    double v75 = v18 / v15;
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v76 = objc_opt_class();
    v131[0] = MEMORY[0x263EF8330];
    v131[1] = 3221225472;
    v131[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_43;
    v131[3] = &unk_2647B4F90;
    v132 = @"correct";
    uint64_t v133 = v76;
    if (correct_defaultOnce_41 != -1) {
      dispatch_once(&correct_defaultOnce_41, v131);
    }
    int v77 = correct_classDebugEnabled_42;

    if (v77)
    {
      v78 = [NSString stringWithFormat:@"totalMeasured=%f, totalEstimated=%f, multiplier=%f", *(void *)&v18, *(void *)&v15, *(void *)&v75];
      v79 = (void *)MEMORY[0x263F5F638];
      v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
      v81 = [v80 lastPathComponent];
      v82 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
      [v79 logMessage:v78 fromFile:v81 fromFunction:v82 fromLineNumber:80];

      v83 = PLLogCommon();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]((uint64_t)v78, v83);
      }
    }
  }
  v84 = [MEMORY[0x263EFF980] array];
  v85 = [(PLAccountingCorrectionOwner *)self rootEnergyEstimate];
  [v84 addObject:v85];

  do
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v86 = objc_opt_class();
      v128[0] = MEMORY[0x263EF8330];
      v128[1] = 3221225472;
      v128[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_50;
      v128[3] = &unk_2647B4F90;
      v129 = @"correct";
      uint64_t v130 = v86;
      if (correct_defaultOnce_48 != -1) {
        dispatch_once(&correct_defaultOnce_48, v128);
      }
      int v87 = correct_classDebugEnabled_49;

      if (v87)
      {
        v88 = [NSString stringWithFormat:@"energyEstimatesToCorrect=%@", v84];
        v89 = (void *)MEMORY[0x263F5F638];
        v90 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
        v91 = [v90 lastPathComponent];
        v92 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
        [v89 logMessage:v88 fromFile:v91 fromFunction:v92 fromLineNumber:86];

        v93 = PLLogCommon();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v159 = v88;
          _os_log_debug_impl(&dword_2267F1000, v93, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        self = v121;
      }
    }
    v94 = [v84 firstObject];
    [v84 removeObjectAtIndex:0];
    [v94 energy];
    [v94 setCorrectionEnergy:(v75 + -1.0) * v95];
    v96 = [(PLAccountingOwner *)self runDate];
    [v94 setCorrectionDate:v96];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v97 = objc_opt_class();
      v125[0] = MEMORY[0x263EF8330];
      v125[1] = 3221225472;
      v125[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_56;
      v125[3] = &unk_2647B4F90;
      v126 = @"correct";
      uint64_t v127 = v97;
      if (correct_defaultOnce_54 != -1) {
        dispatch_once(&correct_defaultOnce_54, v125);
      }
      int v98 = correct_classDebugEnabled_55;

      if (v98)
      {
        v99 = [NSString stringWithFormat:@"energyEstimateToCorrect=%@", v94];
        v100 = (void *)MEMORY[0x263F5F638];
        v101 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
        v102 = [v101 lastPathComponent];
        v103 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
        [v100 logMessage:v99 fromFile:v102 fromFunction:v103 fromLineNumber:94];

        v104 = PLLogCommon();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v159 = v99;
          _os_log_debug_impl(&dword_2267F1000, v104, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        self = v121;
      }
    }
    v105 = [(PLAccountingOwner *)self manager];
    v106 = objc_msgSend(v105, "childEnergyEstimatesForParentEntryID:", objc_msgSend(v94, "entryID"));

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v107 = objc_opt_class();
      v122[0] = MEMORY[0x263EF8330];
      v122[1] = 3221225472;
      v122[2] = __38__PLAccountingCorrectionOwner_correct__block_invoke_62;
      v122[3] = &unk_2647B4F90;
      v123 = @"correct";
      uint64_t v124 = v107;
      if (correct_defaultOnce_60 != -1) {
        dispatch_once(&correct_defaultOnce_60, v122);
      }
      int v108 = correct_classDebugEnabled_61;

      if (v108)
      {
        v109 = [NSString stringWithFormat:@"childEnergyEstimatesToCorrect=%@", v106];
        v110 = (void *)MEMORY[0x263F5F638];
        v111 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionOwner.m"];
        v112 = [v111 lastPathComponent];
        v113 = [NSString stringWithUTF8String:"-[PLAccountingCorrectionOwner correct]"];
        [v110 logMessage:v109 fromFile:v112 fromFunction:v113 fromLineNumber:98];

        v114 = PLLogCommon();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v159 = v109;
          _os_log_debug_impl(&dword_2267F1000, v114, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        self = v121;
      }
    }
    if (v106) {
      [v84 addObjectsFromArray:v106];
    }
    v115 = [(PLAccountingOwner *)self manager];
    [v115 didCorrectEnergyEstimate:v94];
  }
  while ([v84 count]);
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_19(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_18 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_25(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_24 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_31(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_30 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_37(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_36 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_42 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_50(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_49 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_56(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_55 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_62(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  correct_classDebugEnabled_61 = result;
  return result;
}

- (void)setRootEnergyEstimate:(id)a3
{
}

@end