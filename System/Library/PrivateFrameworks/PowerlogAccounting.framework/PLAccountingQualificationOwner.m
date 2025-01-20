@interface PLAccountingQualificationOwner
- (PLAccountingEnergyEstimateEventEntry)energyEstimate;
- (PLAccountingQualificationOwner)initWithEnergyEstimate:(id)a3;
- (id)ID;
- (id)activationDate;
- (id)range;
- (void)qualify;
- (void)setEnergyEstimate:(id)a3;
- (void)setRunDate:(id)a3;
@end

@implementation PLAccountingQualificationOwner

- (void).cxx_destruct
{
}

- (id)ID
{
  v2 = [(PLAccountingQualificationOwner *)self energyEstimate];
  v3 = [v2 rootNodeID];

  return v3;
}

- (PLAccountingEnergyEstimateEventEntry)energyEstimate
{
  return (PLAccountingEnergyEstimateEventEntry *)objc_getProperty(self, a2, 64, 1);
}

- (PLAccountingQualificationOwner)initWithEnergyEstimate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingQualificationOwner;
  v6 = [(PLAccountingQualificationOwner *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_energyEstimate, a3);
  }

  return v7;
}

- (id)range
{
  v2 = [(PLAccountingQualificationOwner *)self energyEstimate];
  v3 = [v2 range];

  return v3;
}

- (id)activationDate
{
  v2 = [(PLAccountingQualificationOwner *)self energyEstimate];
  v3 = [v2 entryDate];

  return v3;
}

- (void)setRunDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLAccountingQualificationOwner *)self energyEstimate];
  [v5 setQualificationDate:v4];
}

- (void)qualify
{
  uint64_t v197 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x263F5F000uLL;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    v190[0] = MEMORY[0x263EF8330];
    v190[1] = 3221225472;
    v190[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke;
    v190[3] = &unk_2647B4F90;
    uint64_t v192 = v4;
    v191 = @"qualify";
    if (qualify_defaultOnce != -1) {
      dispatch_once(&qualify_defaultOnce, v190);
    }
    int v5 = qualify_classDebugEnabled;

    if (v5)
    {
      v6 = NSString;
      v7 = [(PLAccountingQualificationOwner *)self energyEstimate];
      v8 = [v6 stringWithFormat:@"self.energyEstimate=%@", v7];

      objc_super v9 = (void *)MEMORY[0x263F5F638];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:49];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]((uint64_t)v8, v13);
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v187[0] = MEMORY[0x263EF8330];
    v187[1] = 3221225472;
    v187[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_19;
    v187[3] = &unk_2647B4F90;
    uint64_t v189 = v14;
    v188 = @"qualify";
    if (qualify_defaultOnce_17 != -1) {
      dispatch_once(&qualify_defaultOnce_17, v187);
    }
    int v15 = qualify_classDebugEnabled_18;

    if (v15)
    {
      v16 = NSString;
      v17 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
      v18 = [v16 stringWithFormat:@"dependencyIDToDependenciesInRange=%@", v17];

      v19 = (void *)MEMORY[0x263F5F638];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
      v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:50];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]((uint64_t)v18, v23);
      }
    }
  }
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  v24 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
  v25 = [v24 allKeys];

  id obj = v25;
  uint64_t v144 = [v25 countByEnumeratingWithState:&v183 objects:v196 count:16];
  if (v144)
  {
    uint64_t v143 = *(void *)v184;
    v140 = v176;
    v141 = v180;
    v146 = self;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v184 != v143) {
          objc_enumerationMutation(obj);
        }
        uint64_t v145 = v26;
        uint64_t v27 = *(void *)(*((void *)&v183 + 1) + 8 * v26);
        if ([*(id *)(v3 + 1600) debugEnabled])
        {
          uint64_t v28 = objc_opt_class();
          v179[0] = MEMORY[0x263EF8330];
          v179[1] = 3221225472;
          v180[0] = __41__PLAccountingQualificationOwner_qualify__block_invoke_25;
          v180[1] = &unk_2647B4F90;
          uint64_t v182 = v28;
          v181 = @"qualify";
          if (qualify_defaultOnce_23 != -1) {
            dispatch_once(&qualify_defaultOnce_23, v179);
          }
          int v29 = qualify_classDebugEnabled_24;

          if (v29)
          {
            v30 = [NSString stringWithFormat:@"qualificationID=%@", v27];
            v31 = (void *)MEMORY[0x263F5F638];
            v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
            v33 = [v32 lastPathComponent];
            v34 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
            [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:53];

            v35 = PLLogCommon();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v195 = v30;
              _os_log_debug_impl(&dword_2267F1000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        v36 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
        v37 = [v36 objectForKeyedSubscript:v27];

        if ([*(id *)(v3 + 1600) debugEnabled])
        {
          uint64_t v38 = objc_opt_class();
          v175[0] = MEMORY[0x263EF8330];
          v175[1] = 3221225472;
          v176[0] = __41__PLAccountingQualificationOwner_qualify__block_invoke_31;
          v176[1] = &unk_2647B4F90;
          uint64_t v178 = v38;
          v177 = @"qualify";
          if (qualify_defaultOnce_29 != -1) {
            dispatch_once(&qualify_defaultOnce_29, v175);
          }
          int v39 = qualify_classDebugEnabled_30;

          if (v39)
          {
            v40 = [NSString stringWithFormat:@"dependenciesInRange=%@", v37];
            v41 = (void *)MEMORY[0x263F5F638];
            v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
            v43 = [v42 lastPathComponent];
            v44 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
            [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:56];

            v45 = PLLogCommon();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v195 = v40;
              _os_log_debug_impl(&dword_2267F1000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        id v147 = v37;
        uint64_t v149 = [v147 countByEnumeratingWithState:&v171 objects:v193 count:16];
        if (v149)
        {
          uint64_t v148 = *(void *)v172;
          do
          {
            uint64_t v46 = 0;
            do
            {
              if (*(void *)v172 != v148) {
                objc_enumerationMutation(v147);
              }
              v47 = [*(id *)(*((void *)&v171 + 1) + 8 * v46) qualificationEvent];
              [v47 setUsed:1];
              if ([*(id *)(v3 + 1600) debugEnabled])
              {
                uint64_t v48 = objc_opt_class();
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_37;
                block[3] = &unk_2647B4F90;
                v169 = @"qualify";
                uint64_t v170 = v48;
                if (qualify_defaultOnce_35 != -1) {
                  dispatch_once(&qualify_defaultOnce_35, block);
                }
                int v49 = qualify_classDebugEnabled_36;

                if (v49)
                {
                  v50 = [NSString stringWithFormat:@"qualificationEvent=%@", v47];
                  v51 = (void *)MEMORY[0x263F5F638];
                  v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
                  v53 = [v52 lastPathComponent];
                  v54 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
                  [v51 logMessage:v50 fromFile:v53 fromFunction:v54 fromLineNumber:61];

                  v55 = PLLogCommon();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v195 = v50;
                    _os_log_debug_impl(&dword_2267F1000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }
                }
              }
              v56 = [v47 childNodeIDs];
              if ([v56 containsObject:&unk_26DA69D30])
              {

LABEL_49:
                int v61 = [v47 instanceDirectionality];
                int v62 = [*(id *)(v3 + 1600) debugEnabled];
                if (v61 == 4)
                {
                  if (v62)
                  {
                    uint64_t v63 = objc_opt_class();
                    v162[0] = MEMORY[0x263EF8330];
                    v162[1] = 3221225472;
                    v162[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_50;
                    v162[3] = &unk_2647B4F90;
                    v163 = @"qualify";
                    uint64_t v164 = v63;
                    if (qualify_defaultOnce_48 != -1) {
                      dispatch_once(&qualify_defaultOnce_48, v162);
                    }
                    int v64 = qualify_classDebugEnabled_49;

                    if (v64)
                    {
                      v65 = [NSString stringWithFormat:@"EventPoint"];
                      v66 = (void *)MEMORY[0x263F5F638];
                      v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
                      v68 = [v67 lastPathComponent];
                      v69 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
                      [v66 logMessage:v65 fromFile:v68 fromFunction:v69 fromLineNumber:75];

                      v70 = PLLogCommon();
                      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v195 = v65;
                        _os_log_debug_impl(&dword_2267F1000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }
                    }
                  }
                  v71 = [(PLAccountingQualificationOwner *)self energyEstimate];
                  v72 = [v71 range];

                  double v73 = 1.0 / (double)(unint64_t)[v147 count];
                }
                else
                {
                  if (v62)
                  {
                    uint64_t v74 = objc_opt_class();
                    v159[0] = MEMORY[0x263EF8330];
                    v159[1] = 3221225472;
                    v159[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_56;
                    v159[3] = &unk_2647B4F90;
                    v160 = @"qualify";
                    uint64_t v161 = v74;
                    if (qualify_defaultOnce_54 != -1) {
                      dispatch_once(&qualify_defaultOnce_54, v159);
                    }
                    int v75 = qualify_classDebugEnabled_55;

                    if (v75)
                    {
                      v76 = [NSString stringWithFormat:@"EventInterval"];
                      v77 = (void *)MEMORY[0x263F5F638];
                      v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
                      v79 = [v78 lastPathComponent];
                      v80 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
                      [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:81];

                      v81 = PLLogCommon();
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v195 = v76;
                        _os_log_debug_impl(&dword_2267F1000, v81, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }
                    }
                  }
                  v82 = [v47 range];
                  v83 = [(PLAccountingQualificationOwner *)self energyEstimate];
                  v84 = [v83 range];
                  v72 = [v82 intersect:v84];

                  [v72 length];
                  double v86 = v85;
                  v87 = [(PLAccountingQualificationOwner *)self energyEstimate];
                  v88 = [v87 range];
                  [v88 length];
                  double v73 = v86 / v89;
                }
                if ([*(id *)(v3 + 1600) debugEnabled])
                {
                  uint64_t v90 = objc_opt_class();
                  v156[0] = MEMORY[0x263EF8330];
                  v156[1] = 3221225472;
                  v156[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_62;
                  v156[3] = &unk_2647B4F90;
                  v157 = @"qualify";
                  uint64_t v158 = v90;
                  if (qualify_defaultOnce_60 != -1) {
                    dispatch_once(&qualify_defaultOnce_60, v156);
                  }
                  int v91 = qualify_classDebugEnabled_61;

                  if (v91)
                  {
                    v92 = [NSString stringWithFormat:@"qualificationRange=%@, qualificationRangeWeight=%f", v72, *(void *)&v73, v140, v141];
                    v93 = (void *)MEMORY[0x263F5F638];
                    v94 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
                    v95 = [v94 lastPathComponent];
                    v96 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
                    [v93 logMessage:v92 fromFile:v95 fromFunction:v96 fromLineNumber:85];

                    v97 = PLLogCommon();
                    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v195 = v92;
                      _os_log_debug_impl(&dword_2267F1000, v97, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
                v98 = [(PLAccountingQualificationOwner *)self energyEstimate];
                [v98 terminationRatio];
                double v100 = v73 * v99;
                v101 = [(PLAccountingQualificationOwner *)self energyEstimate];
                [v101 energy];
                double v103 = v102;
                v104 = [(PLAccountingQualificationOwner *)self energyEstimate];
                [v104 correctionEnergy];
                double v106 = v100 * (v103 + v105);

                if ([*(id *)(v3 + 1600) debugEnabled])
                {
                  uint64_t v107 = objc_opt_class();
                  v153[0] = MEMORY[0x263EF8330];
                  v153[1] = 3221225472;
                  v153[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_68;
                  v153[3] = &unk_2647B4F90;
                  v154 = @"qualify";
                  uint64_t v155 = v107;
                  if (qualify_defaultOnce_66 != -1) {
                    dispatch_once(&qualify_defaultOnce_66, v153);
                  }
                  int v108 = qualify_classDebugEnabled_67;

                  if (v108)
                  {
                    v109 = objc_msgSend(NSString, "stringWithFormat:", @"qualificationEnergy=%f", *(void *)&v106);
                    v110 = (void *)MEMORY[0x263F5F638];
                    v111 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
                    v112 = [v111 lastPathComponent];
                    v113 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
                    [v110 logMessage:v109 fromFile:v112 fromFunction:v113 fromLineNumber:88];

                    v114 = PLLogCommon();
                    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v195 = v109;
                      _os_log_debug_impl(&dword_2267F1000, v114, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
                v115 = [PLAccountingEnergyEventEntry alloc];
                v116 = [(PLAccountingQualificationOwner *)self energyEstimate];
                v117 = [v116 nodeID];
                v118 = [(PLAccountingOwner *)self runDate];
                v119 = [(PLAccountingEnergyEventEntry *)v115 initWithNodeID:v117 withEnergy:v72 withRange:v118 withEntryDate:v106];

                if ([*(id *)(v3 + 1600) debugEnabled])
                {
                  uint64_t v120 = objc_opt_class();
                  v150[0] = MEMORY[0x263EF8330];
                  v150[1] = 3221225472;
                  v150[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_75;
                  v150[3] = &unk_2647B4F90;
                  v151 = @"qualify";
                  uint64_t v152 = v120;
                  if (qualify_defaultOnce_73 != -1) {
                    dispatch_once(&qualify_defaultOnce_73, v150);
                  }
                  int v121 = qualify_classDebugEnabled_74;

                  if (v121)
                  {
                    unint64_t v122 = v3;
                    v123 = [NSString stringWithFormat:@"qualificationEnergyEvent=%@", v119];
                    v124 = (void *)MEMORY[0x263F5F638];
                    v125 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
                    v126 = [v125 lastPathComponent];
                    v127 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
                    [v124 logMessage:v123 fromFile:v126 fromFunction:v127 fromLineNumber:94];

                    v128 = PLLogCommon();
                    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v195 = v123;
                      _os_log_debug_impl(&dword_2267F1000, v128, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    unint64_t v3 = v122;
                    self = v146;
                  }
                }
                v129 = [(PLAccountingOwner *)self manager];
                v130 = [(PLAccountingQualificationOwner *)self energyEstimate];
                v131 = [v130 rootNodeID];
                v132 = [v47 qualificationID];
                [v129 didQualifyEnergyEvent:v119 withRootNodeID:v131 withQualificationID:v132];

LABEL_88:
                goto LABEL_89;
              }
              v57 = [v47 childNodeIDs];
              v58 = [(PLAccountingQualificationOwner *)self energyEstimate];
              v59 = [v58 nodeID];
              char v60 = [v57 containsObject:v59];

              if (v60) {
                goto LABEL_49;
              }
              if ([*(id *)(v3 + 1600) debugEnabled])
              {
                uint64_t v133 = objc_opt_class();
                v165[0] = MEMORY[0x263EF8330];
                v165[1] = 3221225472;
                v165[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_44;
                v165[3] = &unk_2647B4F90;
                v166 = @"qualify";
                uint64_t v167 = v133;
                if (qualify_defaultOnce_42 != -1) {
                  dispatch_once(&qualify_defaultOnce_42, v165);
                }
                int v134 = qualify_classDebugEnabled_43;

                if (v134)
                {
                  v72 = [NSString stringWithFormat:@"qualificationEvent does not pertain to self"];
                  v135 = (void *)MEMORY[0x263F5F638];
                  v136 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m"];
                  v137 = [v136 lastPathComponent];
                  v138 = [NSString stringWithUTF8String:"-[PLAccountingQualificationOwner qualify]"];
                  [v135 logMessage:v72 fromFile:v137 fromFunction:v138 fromLineNumber:66];

                  v119 = PLLogCommon();
                  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v195 = v72;
                    _os_log_debug_impl(&dword_2267F1000, v119, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }
                  goto LABEL_88;
                }
              }
LABEL_89:

              ++v46;
            }
            while (v149 != v46);
            uint64_t v139 = [v147 countByEnumeratingWithState:&v171 objects:v193 count:16];
            uint64_t v149 = v139;
          }
          while (v139);
        }

        uint64_t v26 = v145 + 1;
      }
      while (v145 + 1 != v144);
      uint64_t v144 = [obj countByEnumeratingWithState:&v183 objects:v196 count:16];
    }
    while (v144);
  }
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_19(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_18 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_25(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_24 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_31(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_30 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_37(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_36 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_44(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_43 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_50(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_49 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_56(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_55 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_62(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_61 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_68(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_67 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_75(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  qualify_classDebugEnabled_74 = result;
  return result;
}

- (void)setEnergyEstimate:(id)a3
{
}

@end