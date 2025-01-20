@interface PLAccountingDistributionOwner
- (PLAccountingDistributionOwner)initWithEnergyEstimate:(id)a3;
- (PLAccountingEnergyEstimateEventEntry)energyEstimate;
- (id)ID;
- (id)activationDate;
- (id)range;
- (void)distribute;
- (void)setEnergyEstimate:(id)a3;
- (void)setRunDate:(id)a3;
@end

@implementation PLAccountingDistributionOwner

- (id)range
{
  v2 = [(PLAccountingDistributionOwner *)self energyEstimate];
  v3 = [v2 range];

  return v3;
}

- (void).cxx_destruct
{
}

- (id)ID
{
  v2 = [(PLAccountingDistributionOwner *)self energyEstimate];
  v3 = [v2 distributionRuleID];

  return v3;
}

- (PLAccountingDistributionOwner)initWithEnergyEstimate:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLAccountingDistributionOwner;
    v6 = [(PLAccountingDistributionOwner *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_energyEstimate, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setRunDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLAccountingDistributionOwner *)self energyEstimate];
  [v5 setDistributionDate:v4];
}

- (void)distribute
{
  uint64_t v264 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v252[0] = MEMORY[0x263EF8330];
    v252[1] = 3221225472;
    v252[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke;
    v252[3] = &unk_2647B4F90;
    uint64_t v254 = v3;
    v253 = @"distribute";
    if (distribute_defaultOnce != -1) {
      dispatch_once(&distribute_defaultOnce, v252);
    }
    int v4 = distribute_classDebugEnabled;

    if (v4)
    {
      id v5 = NSString;
      v6 = [(PLAccountingDistributionOwner *)self energyEstimate];
      v7 = [v5 stringWithFormat:@"self.energyEstimate=%@", v6];

      v8 = (void *)MEMORY[0x263F5F638];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
      objc_super v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:52];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v13 = [(PLAccountingOwner *)self dependencyIDToDependenciesInRange];
  v14 = [v13 allValues];
  v15 = [v14 firstObject];

  v199 = self;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v249[0] = MEMORY[0x263EF8330];
    v249[1] = 3221225472;
    v249[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_19;
    v249[3] = &unk_2647B4F90;
    uint64_t v251 = v16;
    v250 = @"distribute";
    if (distribute_defaultOnce_17 != -1) {
      dispatch_once(&distribute_defaultOnce_17, v249);
    }
    int v17 = distribute_classDebugEnabled_18;

    if (v17)
    {
      v18 = [NSString stringWithFormat:@"distributionDependenciesInRange=%@", v15];
      v19 = (void *)MEMORY[0x263F5F638];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
      v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:56];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      self = v199;
    }
  }
  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  id obj = v15;
  uint64_t v193 = [obj countByEnumeratingWithState:&v245 objects:v263 count:16];
  if (!v193)
  {
    double v24 = 0.0;
    goto LABEL_114;
  }
  v191 = v242;
  uint64_t v192 = *(void *)v246;
  v187 = v234;
  v188 = v226;
  v189 = v238;
  v190 = v222;
  double v24 = 0.0;
  do
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v246 != v192) {
        objc_enumerationMutation(obj);
      }
      uint64_t v195 = v25;
      v197 = [*(id *)(*((void *)&v245 + 1) + 8 * v25) distributionEvent];
      [v197 setUsed:1];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v26 = objc_opt_class();
        v241[0] = MEMORY[0x263EF8330];
        v241[1] = 3221225472;
        v242[0] = __43__PLAccountingDistributionOwner_distribute__block_invoke_25;
        v242[1] = &unk_2647B4F90;
        uint64_t v244 = v26;
        v243 = @"distribute";
        if (distribute_defaultOnce_23 != -1) {
          dispatch_once(&distribute_defaultOnce_23, v241);
        }
        int v27 = distribute_classDebugEnabled_24;

        if (v27)
        {
          v28 = [NSString stringWithFormat:@"distributionEvent=%@", v197];
          v29 = (void *)MEMORY[0x263F5F638];
          v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
          v31 = [v30 lastPathComponent];
          v32 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
          [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:62];

          v33 = PLLogCommon();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v256 = *(double *)&v28;
            _os_log_debug_impl(&dword_2267F1000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          self = v199;
        }
      }
      if ([v197 instanceDirectionality] == 4)
      {
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v34 = objc_opt_class();
          v237[0] = MEMORY[0x263EF8330];
          v237[1] = 3221225472;
          v238[0] = __43__PLAccountingDistributionOwner_distribute__block_invoke_31;
          v238[1] = &unk_2647B4F90;
          uint64_t v240 = v34;
          v239 = @"distribute";
          if (distribute_defaultOnce_29 != -1) {
            dispatch_once(&distribute_defaultOnce_29, v237);
          }
          int v35 = distribute_classDebugEnabled_30;

          if (v35)
          {
            v36 = [NSString stringWithFormat:@"EventPoint"];
            v37 = (void *)MEMORY[0x263F5F638];
            v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
            v39 = [v38 lastPathComponent];
            v40 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
            [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:69];

            v41 = PLLogCommon();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v256 = *(double *)&v36;
              _os_log_debug_impl(&dword_2267F1000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v199;
          }
        }
        v42 = [(PLAccountingDistributionOwner *)self energyEstimate];
        v196 = [v42 range];

        double v43 = 1.0 / (double)(unint64_t)[obj count];
      }
      else
      {
        int v44 = [v197 distributeRangeWeightedTotal];
        int v45 = [MEMORY[0x263F5F640] debugEnabled];
        if (v44)
        {
          if (v45)
          {
            uint64_t v46 = objc_opt_class();
            v233[0] = MEMORY[0x263EF8330];
            v233[1] = 3221225472;
            v234[0] = __43__PLAccountingDistributionOwner_distribute__block_invoke_37;
            v234[1] = &unk_2647B4F90;
            uint64_t v236 = v46;
            v235 = @"distribute";
            if (distribute_defaultOnce_35 != -1) {
              dispatch_once(&distribute_defaultOnce_35, v233);
            }
            int v47 = distribute_classDebugEnabled_36;

            if (v47)
            {
              v48 = [NSString stringWithFormat:@"RangeWeightedTotal"];
              v49 = (void *)MEMORY[0x263F5F638];
              v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
              v51 = [v50 lastPathComponent];
              v52 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
              [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:75];

              v53 = PLLogCommon();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v256 = *(double *)&v48;
                _os_log_debug_impl(&dword_2267F1000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v199;
            }
          }
          v54 = [v197 range];
          v55 = [(PLAccountingDistributionOwner *)self energyEstimate];
          v56 = [v55 range];
          v196 = [v54 intersect:v56];

          long long v231 = 0u;
          long long v232 = 0u;
          long long v229 = 0u;
          long long v230 = 0u;
          id v57 = obj;
          uint64_t v58 = [v57 countByEnumeratingWithState:&v229 objects:v262 count:16];
          if (v58)
          {
            uint64_t v59 = v58;
            uint64_t v60 = *(void *)v230;
            double v61 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v59; ++i)
              {
                if (*(void *)v230 != v60) {
                  objc_enumerationMutation(v57);
                }
                v63 = [*(id *)(*((void *)&v229 + 1) + 8 * i) range];
                v64 = [(PLAccountingDistributionOwner *)self energyEstimate];
                v65 = [v64 range];
                v66 = [v63 intersect:v65];

                self = v199;
                [v66 length];
                double v61 = v61 + v67;
              }
              uint64_t v59 = [v57 countByEnumeratingWithState:&v229 objects:v262 count:16];
            }
            while (v59);

            double v43 = 1.0;
            if (v61 > 0.0)
            {
              [v196 length];
              double v43 = v68 / v61;
            }
          }
          else
          {

            double v43 = 1.0;
          }
        }
        else
        {
          if (v45)
          {
            uint64_t v69 = objc_opt_class();
            v225[0] = MEMORY[0x263EF8330];
            v225[1] = 3221225472;
            v226[0] = __43__PLAccountingDistributionOwner_distribute__block_invoke_43;
            v226[1] = &unk_2647B4F90;
            uint64_t v228 = v69;
            v227 = @"distribute";
            if (distribute_defaultOnce_41 != -1) {
              dispatch_once(&distribute_defaultOnce_41, v225);
            }
            int v70 = distribute_classDebugEnabled_42;

            if (v70)
            {
              v71 = [NSString stringWithFormat:@"EventInterval"];
              v72 = (void *)MEMORY[0x263F5F638];
              v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
              v74 = [v73 lastPathComponent];
              v75 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
              [v72 logMessage:v71 fromFile:v74 fromFunction:v75 fromLineNumber:86];

              v76 = PLLogCommon();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v256 = *(double *)&v71;
                _os_log_debug_impl(&dword_2267F1000, v76, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v199;
            }
          }
          v77 = [v197 range];
          v78 = [(PLAccountingDistributionOwner *)self energyEstimate];
          v79 = [v78 range];
          v80 = [v77 intersect:v79];

          v196 = v80;
          [v80 length];
          double v82 = v81;
          v83 = [(PLAccountingDistributionOwner *)self energyEstimate];
          v84 = [v83 range];
          [v84 length];
          double v43 = v82 / v85;
        }
      }
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v86 = objc_opt_class();
        v221[0] = MEMORY[0x263EF8330];
        v221[1] = 3221225472;
        v222[0] = __43__PLAccountingDistributionOwner_distribute__block_invoke_49;
        v222[1] = &unk_2647B4F90;
        uint64_t v224 = v86;
        v223 = @"distribute";
        if (distribute_defaultOnce_47 != -1) {
          dispatch_once(&distribute_defaultOnce_47, v221);
        }
        int v87 = distribute_classDebugEnabled_48;

        if (v87)
        {
          v88 = [NSString stringWithFormat:@"childRange=%@, childRangeWeight=%f", v196, *(void *)&v43];
          v89 = (void *)MEMORY[0x263F5F638];
          v90 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
          v91 = [v90 lastPathComponent];
          v92 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
          [v89 logMessage:v88 fromFile:v91 fromFunction:v92 fromLineNumber:90];

          v93 = PLLogCommon();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v256 = *(double *)&v88;
            _os_log_debug_impl(&dword_2267F1000, v93, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          self = v199;
        }
      }
      long long v219 = 0u;
      long long v220 = 0u;
      long long v217 = 0u;
      long long v218 = 0u;
      id v198 = [v197 childNodeIDToWeight];
      uint64_t v201 = [v198 countByEnumeratingWithState:&v217 objects:v261 count:16];
      if (v201)
      {
        uint64_t v200 = *(void *)v218;
        do
        {
          uint64_t v94 = 0;
          do
          {
            if (*(void *)v218 != v200) {
              objc_enumerationMutation(v198);
            }
            v95 = *(void **)(*((void *)&v217 + 1) + 8 * v94);
            if ([MEMORY[0x263F5F640] debugEnabled])
            {
              uint64_t v96 = objc_opt_class();
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_55;
              block[3] = &unk_2647B4F90;
              v215 = @"distribute";
              uint64_t v216 = v96;
              if (distribute_defaultOnce_53 != -1) {
                dispatch_once(&distribute_defaultOnce_53, block);
              }
              int v97 = distribute_classDebugEnabled_54;

              if (v97)
              {
                v98 = [NSString stringWithFormat:@"childNodeID=%@", v95];
                v99 = (void *)MEMORY[0x263F5F638];
                v100 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
                v101 = [v100 lastPathComponent];
                v102 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
                [v99 logMessage:v98 fromFile:v101 fromFunction:v102 fromLineNumber:94];

                v103 = PLLogCommon();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  double v256 = *(double *)&v98;
                  _os_log_debug_impl(&dword_2267F1000, v103, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            v104 = [(PLAccountingDistributionOwner *)self energyEstimate];
            v105 = [v104 nodeID];
            int v106 = [v95 isEqual:v105];

            if (!v106)
            {
              v115 = [v197 childNodeIDToWeight];
              v116 = [v115 objectForKeyedSubscript:v95];
              [v116 doubleValue];
              double v118 = v117;

              v119 = [(PLAccountingDistributionOwner *)self energyEstimate];
              [v119 energy];
              double v121 = v43 * v118 * v120;

              +[PLAccountingEngine minDistributionEnergy];
              if (v121 >= v122)
              {
                double v24 = v24 + v121;
                if ([MEMORY[0x263F5F640] debugEnabled])
                {
                  uint64_t v124 = objc_opt_class();
                  v208[0] = MEMORY[0x263EF8330];
                  v208[1] = 3221225472;
                  v208[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_68;
                  v208[3] = &unk_2647B4F90;
                  v209 = @"distribute";
                  uint64_t v210 = v124;
                  if (distribute_defaultOnce_66 != -1) {
                    dispatch_once(&distribute_defaultOnce_66, v208);
                  }
                  int v125 = distribute_classDebugEnabled_67;

                  if (v125)
                  {
                    v126 = [NSString stringWithFormat:@"childElementWeight=%f, childEnergy=%f, energyDistributed=%f", *(void *)&v118, *(void *)&v121, *(void *)&v24, v187, v188, v189, v190, v191];
                    v127 = (void *)MEMORY[0x263F5F638];
                    v128 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
                    v129 = [v128 lastPathComponent];
                    v130 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
                    [v127 logMessage:v126 fromFile:v129 fromFunction:v130 fromLineNumber:112];

                    v131 = PLLogCommon();
                    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      double v256 = *(double *)&v126;
                      _os_log_debug_impl(&dword_2267F1000, v131, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
                v132 = [PLAccountingEnergyEstimateEventEntry alloc];
                v133 = [(PLAccountingDistributionOwner *)self energyEstimate];
                v134 = [v133 rootNodeID];
                v135 = [(PLAccountingDistributionOwner *)self energyEstimate];
                uint64_t v136 = [v135 entryID];
                v137 = [(PLAccountingDistributionOwner *)self energyEstimate];
                uint64_t v138 = [v137 numAncestors] + 1;
                v139 = [(PLAccountingOwner *)v199 runDate];
                uint64_t v140 = v138;
                self = v199;
                v109 = [(PLAccountingEnergyEstimateEventEntry *)v132 initWithNodeID:v95 withRootNodeID:v134 withParentEntryID:v136 withNumAncestors:v140 withEnergy:v196 withRange:v139 withEntryDate:v121];

                if ([MEMORY[0x263F5F640] debugEnabled])
                {
                  uint64_t v141 = objc_opt_class();
                  v205[0] = MEMORY[0x263EF8330];
                  v205[1] = 3221225472;
                  v205[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_75;
                  v205[3] = &unk_2647B4F90;
                  v206 = @"distribute";
                  uint64_t v207 = v141;
                  if (distribute_defaultOnce_73 != -1) {
                    dispatch_once(&distribute_defaultOnce_73, v205);
                  }
                  int v142 = distribute_classDebugEnabled_74;

                  if (v142)
                  {
                    v143 = [NSString stringWithFormat:@"childEnergyEstimate=%@", v109];
                    v144 = (void *)MEMORY[0x263F5F638];
                    v145 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
                    v146 = [v145 lastPathComponent];
                    v147 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
                    [v144 logMessage:v143 fromFile:v146 fromFunction:v147 fromLineNumber:121];

                    v148 = PLLogCommon();
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      double v256 = *(double *)&v143;
                      _os_log_debug_impl(&dword_2267F1000, v148, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
                v149 = [(PLAccountingOwner *)v199 manager];
                v150 = [(PLAccountingDistributionOwner *)v199 energyEstimate];
                [v149 didDistributeToChildEnergyEstimate:v109 fromParentEnergyEstimate:v150];
              }
              else
              {
                v109 = PLLogCommon();
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                {
                  v114 = [(PLAccountingDistributionOwner *)self energyEstimate];
                  v123 = [v114 rootNodeID];
                  *(_DWORD *)buf = 134218498;
                  double v256 = v121;
                  __int16 v257 = 2112;
                  v258 = v95;
                  __int16 v259 = 2112;
                  v260 = v123;
                  _os_log_debug_impl(&dword_2267F1000, v109, OS_LOG_TYPE_DEBUG, "Skipping distribution of childEnergy=%f, childNodeID=%@, rootNodeID=%@", buf, 0x20u);

                  goto LABEL_88;
                }
              }
LABEL_107:

              goto LABEL_108;
            }
            if ([MEMORY[0x263F5F640] debugEnabled])
            {
              uint64_t v107 = objc_opt_class();
              v211[0] = MEMORY[0x263EF8330];
              v211[1] = 3221225472;
              v211[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_61;
              v211[3] = &unk_2647B4F90;
              v212 = @"distribute";
              uint64_t v213 = v107;
              if (distribute_defaultOnce_59 != -1) {
                dispatch_once(&distribute_defaultOnce_59, v211);
              }
              int v108 = distribute_classDebugEnabled_60;

              if (v108)
              {
                v109 = [NSString stringWithFormat:@"skipping distribution to self"];
                v110 = (void *)MEMORY[0x263F5F638];
                v111 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
                v112 = [v111 lastPathComponent];
                v113 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
                [v110 logMessage:v109 fromFile:v112 fromFunction:v113 fromLineNumber:98];

                v114 = PLLogCommon();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  double v256 = *(double *)&v109;
                  _os_log_debug_impl(&dword_2267F1000, v114, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
LABEL_88:

                goto LABEL_107;
              }
            }
LABEL_108:
            ++v94;
          }
          while (v201 != v94);
          uint64_t v201 = [v198 countByEnumeratingWithState:&v217 objects:v261 count:16];
        }
        while (v201);
      }

      uint64_t v25 = v195 + 1;
    }
    while (v195 + 1 != v193);
    uint64_t v193 = [obj countByEnumeratingWithState:&v245 objects:v263 count:16];
  }
  while (v193);
LABEL_114:

  v151 = [(PLAccountingDistributionOwner *)self energyEstimate];
  [v151 energy];
  double v153 = v152;

  if (v153 > 0.0)
  {
    v154 = [(PLAccountingDistributionOwner *)self energyEstimate];
    [v154 energy];
    double v156 = 1.0 - v24 / v155;
    v157 = [(PLAccountingDistributionOwner *)self energyEstimate];
    [v157 setTerminationRatio:v156];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v158 = objc_opt_class();
      v202[0] = MEMORY[0x263EF8330];
      v202[1] = 3221225472;
      v202[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_81;
      v202[3] = &unk_2647B4F90;
      v203 = @"distribute";
      uint64_t v204 = v158;
      if (distribute_defaultOnce_79 != -1) {
        dispatch_once(&distribute_defaultOnce_79, v202);
      }
      int v159 = distribute_classDebugEnabled_80;

      if (v159)
      {
        v160 = NSString;
        v161 = [(PLAccountingDistributionOwner *)self energyEstimate];
        [v161 terminationRatio];
        v163 = objc_msgSend(v160, "stringWithFormat:", @"terminationRatio=%f", v162);

        v164 = (void *)MEMORY[0x263F5F638];
        v165 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
        v166 = [v165 lastPathComponent];
        v167 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
        [v164 logMessage:v163 fromFile:v166 fromFunction:v167 fromLineNumber:132];

        v168 = PLLogCommon();
        if (os_log_type_enabled(v168, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    v169 = [(PLAccountingDistributionOwner *)self energyEstimate];
    [v169 energy];
    double v171 = v24 - v170;
    +[PLAccountingEngine minEnergy];
    double v173 = v172;

    if (v171 > v173)
    {
      v174 = NSString;
      v175 = [(PLAccountingDistributionOwner *)self energyEstimate];
      [v175 energy];
      uint64_t v177 = v176;
      v178 = [(PLAccountingDistributionOwner *)self energyEstimate];
      v179 = [v174 stringWithFormat:@"ERROR: energyDistributed=%f greater than energy=%f for energyEstimate=%@", *(void *)&v24, v177, v178];

      v180 = (void *)MEMORY[0x263F5F638];
      v181 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m"];
      v182 = [v181 lastPathComponent];
      v183 = [NSString stringWithUTF8String:"-[PLAccountingDistributionOwner distribute]"];
      [v180 logMessage:v179 fromFile:v182 fromFunction:v183 fromLineNumber:136];

      v184 = PLLogCommon();
      if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v185 = [(PLAccountingOwner *)self manager];
  v186 = [(PLAccountingDistributionOwner *)self energyEstimate];
  [v185 didDistributeEnergyEstimate:v186];
}

- (PLAccountingEnergyEstimateEventEntry)energyEstimate
{
  return (PLAccountingEnergyEstimateEventEntry *)objc_getProperty(self, a2, 64, 1);
}

- (id)activationDate
{
  v2 = [(PLAccountingDistributionOwner *)self energyEstimate];
  uint64_t v3 = [v2 entryDate];

  return v3;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_19(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_18 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_25(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_24 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_31(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_30 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_37(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_36 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_42 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_49(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_48 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_55(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_54 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_61(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_60 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_68(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_67 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_75(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_74 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_81(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  distribute_classDebugEnabled_80 = result;
  return result;
}

- (void)setEnergyEstimate:(id)a3
{
}

@end