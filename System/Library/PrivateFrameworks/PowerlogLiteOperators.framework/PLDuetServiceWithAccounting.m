@interface PLDuetServiceWithAccounting
+ (id)mapBundleID:(id)a3;
- (PLDuetServiceWithAccounting)init;
- (id)energyResponse;
- (id)energyResponseWithQualificationID:(int)a3;
- (id)eventTransitionsWithEvents:(id)a3;
- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4;
- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4 withQualificationID:(int)a5;
- (void)createQualificationEventsWithEventTransitions:(id)a3 withQualificationID:(int)a4;
- (void)didReceiveEventWithPayload:(id)a3;
- (void)initOperatorDependancies:(id)a3;
@end

@implementation PLDuetServiceWithAccounting

- (PLDuetServiceWithAccounting)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PLDuetServiceWithAccounting;
    v4 = [(PLDuetServiceWithAccounting *)&v6 init];
    [(PLDuetServiceImpl *)v4 setDuetService:0];
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F92A88] isPowerlogHelperd];
  if (v4 && (v5 & 1) == 0)
  {
    [(PLDuetServiceImpl *)self setDuetService:v4];
    id v6 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke;
    v20[3] = &unk_1E692A6F8;
    v20[4] = self;
    v7 = (void *)[v6 initWithOperator:v4 withRegistration:&unk_1F29EB7C8 withBlock:v20];
    [(PLDuetServiceImpl *)self setEventListener:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F92AA8]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_2;
    v19[3] = &unk_1E692A118;
    v19[4] = self;
    v9 = (void *)[v8 initWithOperator:v4 withRegistration:&unk_1F29EB7F0 withBlock:v19];
    [(PLDuetServiceImpl *)self setEnergyResponder:v9];

    v10 = [MEMORY[0x1E4F92978] timeCriterionWithInterval:21600.0];
    v21[0] = v10;
    v11 = [MEMORY[0x1E4F92970] pluggedInCriterion];
    v21[1] = v11;
    v12 = [MEMORY[0x1E4F92970] displayOffCriterion];
    v21[2] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];

    v14 = [MEMORY[0x1E4F92980] sharedInstance];
    v15 = [v4 workQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_3;
    v18[3] = &unk_1E6931388;
    v18[4] = self;
    [v14 scheduleActivityWithIdentifier:@"PLDuetService_duetEnergyAccumulator" withCriteria:v13 withMustRunCriterion:0 withQueue:v15 withInterruptBlock:0 withActivityBlock:v18];

    if (([v4 isDebugEnabled] & 1) != 0
      || [MEMORY[0x1E4F929C0] BOOLForKey:@"PLDuetService_test" ifNotSet:0])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)testLogEvents, @"com.apple.powerlogd.PLDuetService.testLogEvents", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, self, (CFNotificationCallback)testReportEnergy, @"com.apple.powerlogd.PLDuetService.testReportEnergy", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveEventWithPayload:a5];
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) energyResponse];
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) accumulateWithLastCompletedDate:a2 withNow:a3];
}

- (void)didReceiveEventWithPayload:(id)a3
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5A860 != -1) {
      dispatch_once(&qword_1EBD5A860, block);
    }
    if (_MergedGlobals_1_59)
    {
      id v6 = [NSString stringWithFormat:@"payload=%@", v4];
      v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting didReceiveEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:181];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v141 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService didReceiveEventWithPayload start", buf, 2u);
  }

  if (!v4
    || ([v4 objectForKeyedSubscript:@"events"],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    v109 = PLLogCommon();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v109, OS_LOG_TYPE_ERROR, "┗ PLDuetService didReceiveEventWithPayload end: Invalid payload", buf, 2u);
    }
    goto LABEL_91;
  }
  v14 = (void *)MEMORY[0x1D942A350]();
  v15 = [MEMORY[0x1E4F1CA48] array];
  v117 = [MEMORY[0x1E4F1CA48] array];
  v16 = [(PLDuetServiceImpl *)self duetService];

  v17 = PLLogCommon();
  v18 = v17;
  if (v16)
  {
    context = v14;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v4 objectForKeyedSubscript:@"events"];
      int v20 = [v19 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v141) = v20;
      _os_log_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEFAULT, "┃ ┏ PLDuetService didReceiveEventWithPayload processing %d events", buf, 8u);
    }
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v111 = v4;
    obuint64_t j = [v4 objectForKeyedSubscript:@"events"];
    uint64_t v115 = [obj countByEnumeratingWithState:&v135 objects:v147 count:16];
    if (v115)
    {
      uint64_t v113 = *(void *)v136;
      uint64_t v118 = *MEMORY[0x1E4F92D38];
      v122 = self;
      v114 = v15;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v136 != v113) {
            objc_enumerationMutation(obj);
          }
          uint64_t v116 = v21;
          v22 = *(void **)(*((void *)&v135 + 1) + 8 * v21);
          v23 = objc_opt_new();
          v24 = objc_opt_class();
          v25 = [v22 objectForKeyedSubscript:@"bundleID"];
          v26 = [v24 mapBundleID:v25];
          [v23 setBundleID:v26];

          v27 = [v22 objectForKeyedSubscript:@"processName"];
          [v23 setProcessName:v27];

          v28 = [v22 objectForKeyedSubscript:@"updateType"];
          objc_msgSend(v23, "setUpdateType:", objc_msgSend(v28, "integerValue"));

          v29 = [v22 objectForKeyedSubscript:@"childBundleIDToWeight"];
          [v23 setChildBundleIDToWeight:v29];

          v30 = PLLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v141 = (uint64_t)v23;
            _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing event: %@", buf, 0xCu);
          }

          uint64_t v31 = [v23 childBundleIDToWeight];
          if (v31
            && (v32 = (void *)v31,
                [v23 childBundleIDToWeight],
                v33 = objc_claimAutoreleasedReturnValue(),
                uint64_t v34 = [v33 count],
                v33,
                v32,
                v34))
          {
            v120 = v22;
            v35 = [v23 bundleID];
            int v36 = [v35 isEqualToString:@"cloudphotod"];

            if (v36) {
              uint64_t v37 = 35;
            }
            else {
              uint64_t v37 = 0;
            }
            v38 = [MEMORY[0x1E4F1CA60] dictionary];
            long long v131 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            v39 = [v23 childBundleIDToWeight];
            uint64_t v40 = [v39 countByEnumeratingWithState:&v131 objects:v146 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v132;
              do
              {
                for (uint64_t i = 0; i != v41; ++i)
                {
                  if (*(void *)v132 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v44 = *(void *)(*((void *)&v131 + 1) + 8 * i);
                  v45 = [v23 childBundleIDToWeight];
                  v46 = [v45 objectForKeyedSubscript:v44];
                  v47 = [(id)objc_opt_class() mapBundleID:v44];
                  [v38 setObject:v46 forKeyedSubscript:v47];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v131 objects:v146 count:16];
              }
              while (v41);
            }

            [v23 setChildBundleIDToWeight:v38];
            v22 = v120;
            self = v122;
          }
          else
          {
            uint64_t v37 = 0;
          }
          v121 = [MEMORY[0x1E4F1CA48] array];
          v48 = PLLogCommon();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            v49 = [v22 objectForKeyedSubscript:@"eventIntervals"];
            int v50 = [v49 count];
            *(_DWORD *)buf = 67109120;
            LODWORD(v141) = v50;
            _os_log_impl(&dword_1D2690000, v48, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing %d intervals", buf, 8u);
          }
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v119 = [v22 objectForKeyedSubscript:@"eventIntervals"];
          uint64_t v51 = [v119 countByEnumeratingWithState:&v127 objects:v145 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v128;
            do
            {
              for (uint64_t j = 0; j != v52; ++j)
              {
                if (*(void *)v128 != v53) {
                  objc_enumerationMutation(v119);
                }
                v55 = *(void **)(*((void *)&v127 + 1) + 8 * j);
                v56 = objc_opt_new();
                v57 = [v55 objectForKeyedSubscript:@"startDate"];
                v58 = [v57 convertFromSystemToMonotonic];
                [v56 setStartDate:v58];

                v59 = [v55 objectForKeyedSubscript:@"endDate"];
                v60 = [v59 convertFromSystemToMonotonic];
                [v56 setEndDate:v60];

                [v121 addObject:v56];
                v61 = PLLogCommon();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v141 = (uint64_t)v56;
                  _os_log_debug_impl(&dword_1D2690000, v61, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService didReceiveEventWithPayload new interval:%@", buf, 0xCu);
                }

                if (v37)
                {
                  v62 = [MEMORY[0x1E4F92900] sharedInstance];
                  v63 = [v23 childBundleIDToWeight];
                  v64 = [v56 startDate];
                  v65 = [v56 endDate];
                  [v62 createDistributionEventIntervalWithDistributionID:v37 withChildNodeNameToWeight:v63 withStartDate:v64 withEndDate:v65];

                  self = v122;
                }
                uint64_t v66 = [(PLDuetServiceImpl *)self duetService];
                if (v66)
                {
                  v67 = (void *)v66;
                  v68 = [(PLDuetServiceImpl *)self duetService];
                  int v69 = [v68 isDebugEnabled];

                  if (v69)
                  {
                    v70 = +[PLOperator entryKeyForType:v118 andName:@"DuetEvents"];
                    v71 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v70];
                    v72 = [v23 bundleID];
                    if (v72) {
                      [v23 bundleID];
                    }
                    else {
                    v73 = [v23 processName];
                    }
                    [v71 setObject:v73 forKeyedSubscript:@"BundleID"];

                    v74 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v23, "updateType"));
                    [v71 setObject:v74 forKeyedSubscript:@"UpdateType"];

                    v75 = [v56 startDate];
                    [v71 setObject:v75 forKeyedSubscript:@"StartDate"];

                    v76 = [v56 endDate];
                    [v71 setObject:v76 forKeyedSubscript:@"EndDate"];

                    self = v122;
                    v77 = [(PLDuetServiceImpl *)v122 duetService];

                    if (v77)
                    {
                      v78 = [(PLDuetServiceImpl *)v122 duetService];
                      [v78 logEntry:v71];
                    }
                  }
                }
              }
              uint64_t v52 = [v119 countByEnumeratingWithState:&v127 objects:v145 count:16];
            }
            while (v52);
          }

          v79 = PLLogCommon();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2690000, v79, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing intervals", buf, 2u);
          }

          [v23 setEventIntervals:v121];
          int v80 = [v23 updateType];
          v15 = v114;
          v81 = v114;
          if (v80 == 1 || (int v82 = [v23 updateType], v81 = v117, v82 == 2)) {
            [v81 addObject:v23];
          }
          uint64_t v83 = [v23 childBundleIDToWeight];
          if (v83)
          {
            v84 = (void *)v83;
            v85 = [v23 childBundleIDToWeight];
            uint64_t v86 = [v85 count];

            if (v86)
            {
              long long v125 = 0u;
              long long v126 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              v87 = [v23 childBundleIDToWeight];
              uint64_t v88 = [v87 countByEnumeratingWithState:&v123 objects:v144 count:16];
              if (v88)
              {
                uint64_t v89 = v88;
                uint64_t v90 = *(void *)v124;
                do
                {
                  for (uint64_t k = 0; k != v89; ++k)
                  {
                    if (*(void *)v124 != v90) {
                      objc_enumerationMutation(v87);
                    }
                    v92 = *(void **)(*((void *)&v123 + 1) + 8 * k);
                    v93 = objc_opt_new();
                    [v93 setBundleID:v92];
                    [v93 setProcessName:v92];
                    objc_msgSend(v93, "setUpdateType:", objc_msgSend(v23, "updateType"));
                    v94 = [v23 eventIntervals];
                    [v93 setEventIntervals:v94];

                    int v95 = [v93 updateType];
                    v96 = v114;
                    if (v95 == 1 || (int v97 = [v93 updateType], v96 = v117, v97 == 2)) {
                      [v96 addObject:v93];
                    }
                    v98 = PLLogCommon();
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v141 = (uint64_t)v92;
                      _os_log_debug_impl(&dword_1D2690000, v98, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ╸ PLDuetService didReceiveEventWithPayload childEvent for bundleID:%@", buf, 0xCu);
                    }
                  }
                  uint64_t v89 = [v87 countByEnumeratingWithState:&v123 objects:v144 count:16];
                }
                while (v89);
              }
            }
          }
          v99 = PLLogCommon();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D2690000, v99, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing event", buf, 2u);
          }

          uint64_t v21 = v116 + 1;
        }
        while (v116 + 1 != v115);
        uint64_t v115 = [obj countByEnumeratingWithState:&v135 objects:v147 count:16];
      }
      while (v115);
    }

    v100 = PLLogCommon();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v100, OS_LOG_TYPE_DEFAULT, "┃ ┗ PLDuetService didReceiveEventWithPayload processing events completed", buf, 2u);
    }

    v101 = [(PLDuetServiceWithAccounting *)self eventTransitionsWithEvents:v15];
    v102 = [(PLDuetServiceWithAccounting *)self eventTransitionsWithEvents:v117];
    [(PLDuetServiceWithAccounting *)self createQualificationEventsWithEventTransitions:v101 withQualificationID:11];
    v103 = PLLogCommon();
    id v4 = v111;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v104 = [v101 count];
      uint64_t v105 = [v15 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v141 = v104;
      __int16 v142 = 2048;
      uint64_t v143 = v105;
      _os_log_impl(&dword_1D2690000, v103, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu disc transitions from %lu events", buf, 0x16u);
    }

    [(PLDuetServiceWithAccounting *)self createQualificationEventsWithEventTransitions:v102 withQualificationID:12];
    v106 = PLLogCommon();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v107 = [v102 count];
      uint64_t v108 = [v117 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v141 = v107;
      __int16 v142 = 2048;
      uint64_t v143 = v108;
      _os_log_impl(&dword_1D2690000, v106, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu comp transitions from %lu events", buf, 0x16u);
    }

    v109 = PLLogCommon();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v109, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService didReceiveEventWithPayload end", buf, 2u);
    }
LABEL_91:

    goto LABEL_92;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D2690000, v18, OS_LOG_TYPE_ERROR, "┗ PLDuetService didReceiveEventWithPayload end: duetService not found", buf, 2u);
  }

LABEL_92:
}

uint64_t __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_59 = result;
  return result;
}

- (id)eventTransitionsWithEvents:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService eventTransitionsWithEvents start", buf, 2u);
  }

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v3;
  uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v57)
  {
    v54 = v61;
    uint64_t v56 = *(void *)v63;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v63 != v56) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v62 + 1) + 8 * v6);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v8 = objc_opt_class();
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v61[0] = __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke;
          v61[1] = &__block_descriptor_40_e5_v8__0lu32l8;
          v61[2] = v8;
          if (qword_1EBD5A868 != -1) {
            dispatch_once(&qword_1EBD5A868, v60);
          }
          if (byte_1EBD5A839)
          {
            v9 = [NSString stringWithFormat:@"event=%@", v7, v54];
            v10 = (void *)MEMORY[0x1E4F929B8];
            v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
            v12 = [v11 lastPathComponent];
            v13 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting eventTransitionsWithEvents:]"];
            [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:308];

            v14 = PLLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v67 = v9;
              _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v67 = v7;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing event: %@", buf, 0xCu);
        }

        v16 = [v7 eventIntervals];
        uint64_t v17 = [v16 count];

        if (v17)
        {
          uint64_t v58 = v6;
          uint64_t v18 = 0;
          v19 = 0;
          int v20 = 0;
          do
          {
            uint64_t v21 = v19;
            v22 = [v7 eventIntervals];
            v19 = [v22 objectAtIndex:v18];

            v23 = PLLogCommon();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v67 = v19;
              _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing interval: %@", buf, 0xCu);
            }

            LODWORD(v24) = v20 + 1;
            v25 = [v7 eventIntervals];
            if ([v25 count] <= (unint64_t)(v20 + 1))
            {
LABEL_28:
            }
            else
            {
              unint64_t v24 = (int)v24;
              while (1)
              {
                v26 = [v7 eventIntervals];
                v27 = [v26 objectAtIndex:v24];
                int v28 = [v19 intersects:v27];

                if (!v28) {
                  break;
                }
                v29 = [v7 eventIntervals];
                v30 = [v29 objectAtIndex:v24];
                uint64_t v31 = [v19 joinWithInterval:v30];

                v32 = PLLogCommon();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v67 = v20;
                  *(_WORD *)&v67[4] = 1024;
                  *(_DWORD *)&v67[6] = v24;
                  __int16 v68 = 2112;
                  uint64_t v69 = v31;
                  _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents Joining intervals %d-%d, active interval updated: %@", buf, 0x18u);
                }
                int v20 = v24;

                ++v24;
                v25 = [v7 eventIntervals];
                v19 = (void *)v31;
                if ([v25 count] <= v24)
                {
                  v19 = (void *)v31;
                  goto LABEL_28;
                }
              }
            }
            int v20 = v24;
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v33 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_171;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v33;
              if (qword_1EBD5A870 != -1) {
                dispatch_once(&qword_1EBD5A870, block);
              }
              if (byte_1EBD5A83A)
              {
                uint64_t v34 = [NSString stringWithFormat:@"eventInterval=%@", v19];
                v35 = (void *)MEMORY[0x1E4F929B8];
                int v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
                uint64_t v37 = [v36 lastPathComponent];
                v38 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting eventTransitionsWithEvents:]"];
                [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:325];

                v39 = PLLogCommon();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v67 = v34;
                  _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            uint64_t v40 = objc_opt_new();
            uint64_t v41 = [v19 startDate];
            [v40 setDate:v41];

            uint64_t v42 = [v7 bundleID];
            [v40 setBundleID:v42];

            [v40 setIsStart:1];
            [v5 addObject:v40];
            v43 = PLLogCommon();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v67 = v40;
              _os_log_impl(&dword_1D2690000, v43, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created start transition: %@", buf, 0xCu);
            }

            uint64_t v44 = objc_opt_new();
            v45 = [v19 endDate];
            [v44 setDate:v45];

            v46 = [v7 bundleID];
            [v44 setBundleID:v46];

            [v44 setIsStart:0];
            [v5 addObject:v44];
            v47 = PLLogCommon();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v67 = v44;
              _os_log_impl(&dword_1D2690000, v47, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created end transition: %@", buf, 0xCu);
            }

            v48 = PLLogCommon();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing interval", buf, 2u);
            }

            uint64_t v18 = v20;
            v49 = [v7 eventIntervals];
            unint64_t v50 = [v49 count];
          }
          while (v50 > v20);

          uint64_t v6 = v58;
        }
        uint64_t v51 = PLLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing event", buf, 2u);
        }

        ++v6;
      }
      while (v6 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v57);
  }

  [v5 sortUsingComparator:&__block_literal_global_47];
  uint64_t v52 = PLLogCommon();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v52, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService eventTransitionsWithEvents end", buf, 2u);
  }

  return v5;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A839 = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_171(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A83A = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 date];
  uint64_t v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)createQualificationEventsWithEventTransitions:(id)a3 withQualificationID:(int)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService createQualificationEventsWithEventTransitions start", buf, 2u);
  }

  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [v4 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v9;
    _os_log_impl(&dword_1D2690000, v8, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService createQualificationEventsWithEventTransitions processing %d transitions", buf, 8u);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v54 = *(void *)v57;
    double v13 = *MEMORY[0x1E4F92958];
    uint64_t v51 = v7;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v57 != v54) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v56 + 1) + 8 * v14);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v16 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __97__PLDuetServiceWithAccounting_createQualificationEventsWithEventTransitions_withQualificationID___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v16;
          if (qword_1EBD5A878 != -1) {
            dispatch_once(&qword_1EBD5A878, block);
          }
          if (byte_1EBD5A83B)
          {
            uint64_t v17 = v11;
            uint64_t v18 = v12;
            v19 = [NSString stringWithFormat:@"lastEventTransition=%@, eventTransition=%@", v6, v15];
            int v20 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
            v22 = [v21 lastPathComponent];
            v23 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting createQualificationEventsWithEventTransitions:withQualificationID:]"];
            [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:362];

            unint64_t v24 = PLLogCommon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v19;
              _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v12 = v18;
            uint64_t v11 = v17;
            uint64_t v7 = v51;
          }
        }
        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v15;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current transition:%@", buf, 0xCu);
        }

        v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v7;
          _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current eventElements:%@", buf, 0xCu);
        }

        v27 = [v15 date];
        int v28 = [v6 date];
        [v27 timeIntervalSinceDate:v28];
        double v30 = v29;

        if (v30 > v13)
        {
          uint64_t v31 = [MEMORY[0x1E4F92900] sharedInstance];
          v32 = [v7 allObjects];
          uint64_t v33 = [v6 date];
          uint64_t v34 = [v15 date];
          [v31 createQualificationEventIntervalWithQualificationID:a4 withChildNodeNames:v32 withStartDate:v33 withEndDate:v34];

          v35 = PLLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v39 = [v6 date];
            [v39 timeIntervalSince1970];
            uint64_t v41 = v40;
            uint64_t v42 = [v15 date];
            [v42 timeIntervalSince1970];
            uint64_t v44 = v43;
            v45 = [v15 date];
            [v6 date];
            uint64_t v46 = v11;
            uint64_t v12 = v47 = v12;
            [v45 timeIntervalSinceDate:v12];
            *(_DWORD *)buf = 134218496;
            v61 = v41;
            __int16 v62 = 2048;
            uint64_t v63 = v44;
            __int16 v64 = 2048;
            uint64_t v65 = v48;
            _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions created event with startDate:%f, endDate:%f, timeRange=%f seconds", buf, 0x20u);

            LODWORD(v12) = v47;
            uint64_t v11 = v46;
            uint64_t v7 = v51;
          }
          id v36 = v15;

          uint64_t v12 = (v12 + 1);
          uint64_t v6 = v36;
        }
        int v37 = [v15 isStart];
        v38 = [v15 bundleID];
        if (v37) {
          [v7 addObject:v38];
        }
        else {
          [v7 removeObject:v38];
        }

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v11);
  }
  else
  {
    LODWORD(v12) = 0;
  }

  v49 = PLLogCommon();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v12;
    _os_log_impl(&dword_1D2690000, v49, OS_LOG_TYPE_INFO, "┃ ┃ ┗ PLDuetService createQualificationEventsWithEventTransitions Created %d qualification events", buf, 8u);
  }

  unint64_t v50 = PLLogCommon();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v50, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService createQualificationEventsWithEventTransitions end", buf, 2u);
  }
}

uint64_t __97__PLDuetServiceWithAccounting_createQualificationEventsWithEventTransitions_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A83B = result;
  return result;
}

- (id)energyResponse
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService energyResponse start", buf, 2u);
  }

  id v4 = [(PLDuetServiceImpl *)self duetService];

  if (v4)
  {
    uint64_t v5 = [(PLDuetServiceWithAccounting *)self energyResponseWithQualificationID:11];
    uint64_t v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v5 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v7;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService discretionaryCumulativeEnergies count: %d", buf, 8u);
    }

    uint64_t v8 = [(PLDuetServiceWithAccounting *)self energyResponseWithQualificationID:12];
    int v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v8 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v10;
      _os_log_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService complicationCumulativeEnergies count: %d", buf, 8u);
    }

    uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
    [v11 addObjectsFromArray:v8];
    v37[0] = @"BLMEnergyForDuet";
    v37[1] = @"BLMUUIDForDuet";
    v38[0] = v11;
    uint64_t v12 = [(PLDuetServiceImpl *)self duetService];
    double v13 = [v12 storage];
    uint64_t v14 = [v13 uuid];
    v38[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];

    uint64_t v16 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v17 = [v16 getLastQualifiedEnergyEventDate];

    uint64_t v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v17;
      _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "lastQualifiedDate=%@", buf, 0xCu);
    }

    if (v17)
    {
      v19 = [v17 convertFromMonotonicToSystem];
      int v20 = PLLogCommon();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_25:

        v34[0] = v11;
        int v28 = [(PLDuetServiceImpl *)self duetService];
        double v29 = [v28 storage];
        double v30 = [v29 uuid];
        v33[2] = @"BLMEnergyResponseTimestamp";
        v34[1] = v30;
        v34[2] = v19;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

        uint64_t v31 = PLLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService energyResponse created", buf, 2u);
        }

        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      id v36 = v19;
      uint64_t v21 = "After converting to system time, energyResponseTimestamp=%@";
    }
    else
    {
      v23 = [MEMORY[0x1E4F92980] sharedInstance];
      unint64_t v24 = [v23 lastCompletedDateWithIdentifier:@"PLDuetService_duetEnergyAccumulator"];
      v25 = [v24 dateByAddingTimeInterval:-3600.0];

      v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v25;
        _os_log_impl(&dword_1D2690000, v26, OS_LOG_TYPE_INFO, "lastAccumulatedDate=%@", buf, 0xCu);
      }

      v19 = [v25 convertFromMonotonicToSystem];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v19;
        _os_log_impl(&dword_1D2690000, v27, OS_LOG_TYPE_INFO, "After converting to system time, lastAccumulatedDate=%@", buf, 0xCu);
      }

      if (!v19)
      {
        v19 = [MEMORY[0x1E4F1C9C8] distantPast];
      }
      int v20 = PLLogCommon();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412290;
      id v36 = v19;
      uint64_t v21 = "energyResponse timestamp is lastAccumulatedDate=%@";
    }
    _os_log_impl(&dword_1D2690000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    goto LABEL_25;
  }
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, "┗ PLDuetService energyResponse not created: duetService not found", buf, 2u);
  }
  v22 = (void *)MEMORY[0x1E4F1CC08];
LABEL_28:

  return v22;
}

- (id)energyResponseWithQualificationID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v164[1] = *MEMORY[0x1E4F143B8];
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService energyResponseWithQualificationID start", buf, 2u);
  }

  uint64_t v5 = [(PLDuetServiceImpl *)self duetService];

  if (!v5)
  {
    uint64_t v14 = PLLogCommon();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_78:
      id v135 = 0;
      goto LABEL_85;
    }
    *(_WORD *)buf = 0;
    v15 = "┃ ┗ PLDuetService energyResponseWithQualificationID: duetService not found";
    uint64_t v16 = v14;
    uint32_t v17 = 2;
LABEL_89:
    _os_log_error_impl(&dword_1D2690000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_78;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke;
    v151[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v151[4] = v6;
    if (qword_1EBD5A880 != -1) {
      dispatch_once(&qword_1EBD5A880, v151);
    }
    if (byte_1EBD5A83C)
    {
      int v7 = objc_msgSend(NSString, "stringWithFormat:", @"qualificationID=%i", v3);
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      int v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:444];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v153 = (uint64_t)v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v3 == 11)
  {
    int v13 = 1;
    goto LABEL_17;
  }
  if (v3 != 12)
  {
    uint64_t v14 = PLLogCommon();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_78;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v153) = 0;
    v15 = "┃ ┗ PLDuetService energyResponseWithQualificationID: unexpected updateType %d";
    uint64_t v16 = v14;
    uint32_t v17 = 8;
    goto LABEL_89;
  }
  int v13 = 2;
LABEL_17:
  unsigned int v132 = v13;
  uint64_t v18 = PLLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v153) = v132;
    _os_log_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEFAULT, "┃ ┃ PLDuetService energyResponseWithQualificationID: updateType %d", buf, 8u);
  }

  v19 = [(PLDuetServiceImpl *)self duetService];
  int v20 = objc_opt_class();
  uint64_t v21 = *MEMORY[0x1E4F92D20];
  uint64_t v22 = [v20 entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"DuetEnergyAccumulator"];

  id v23 = objc_alloc(MEMORY[0x1E4F92A90]);
  unint64_t v24 = [NSNumber numberWithInt:v3];
  uint64_t v25 = [v23 initWithKey:@"QualificationID" withValue:v24 withComparisonOperation:0];

  v26 = [(PLDuetServiceImpl *)self duetService];
  v27 = [v26 storage];
  id v133 = (id)v25;
  v164[0] = v25;
  int v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:1];
  long long v126 = v22;
  double v29 = [v27 entriesForKey:v22 withComparisons:v28];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v30 = objc_opt_class();
    v150[0] = MEMORY[0x1E4F143A8];
    v150[1] = 3221225472;
    v150[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_205;
    v150[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v150[4] = v30;
    if (qword_1EBD5A888 != -1) {
      dispatch_once(&qword_1EBD5A888, v150);
    }
    if (byte_1EBD5A83D)
    {
      uint64_t v31 = [NSString stringWithFormat:@"accumulatorEntries=%@", v29];
      v32 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      uint64_t v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
      [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:468];

      id v36 = PLLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v153 = (uint64_t)v31;
        _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v37 = PLLogCommon();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    int v38 = [v29 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v153) = v38;
    _os_log_impl(&dword_1D2690000, v37, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID accumulatorEntries count: %d", buf, 8u);
  }

  v39 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  obuint64_t j = v29;
  uint64_t v40 = [obj countByEnumeratingWithState:&v146 objects:v163 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v147 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        v45 = [v44 objectForKeyedSubscript:@"Energy"];
        uint64_t v46 = [v44 objectForKeyedSubscript:@"BundleID"];
        [v39 setObject:v45 forKeyedSubscript:v46];
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v146 objects:v163 count:16];
    }
    while (v41);
  }

  uint64_t v47 = [MEMORY[0x1E4F92968] entryKeyForType:v21 andName:*MEMORY[0x1E4F92B20]];
  uint64_t v48 = [MEMORY[0x1E4F92980] sharedInstance];
  v49 = [v48 lastCompletedDateWithIdentifier:@"PLDuetService_duetEnergyAccumulator"];
  unint64_t v50 = [v49 dateByAddingTimeInterval:-3600.0];

  if (!v50)
  {
    unint64_t v50 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v51 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v52 = NSNumber;
  long long v124 = v50;
  [v50 timeIntervalSince1970];
  uint64_t v53 = objc_msgSend(v52, "numberWithDouble:");
  uint64_t v54 = [v51 initWithKey:@"timestamp" withValue:v53 withComparisonOperation:2];

  id v55 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v56 = *MEMORY[0x1E4F92B38];
  long long v57 = [NSNumber numberWithInt:v3];
  uint64_t v58 = [v55 initWithKey:v56 withValue:v57 withComparisonOperation:0];

  id v59 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v127 = *MEMORY[0x1E4F92B30];
  uint64_t v60 = objc_msgSend(v59, "initWithKey:withValue:withComparisonOperation:");
  v61 = [(PLDuetServiceImpl *)self duetService];
  __int16 v62 = [v61 storage];
  v122 = (void *)v58;
  long long v123 = (void *)v54;
  v162[0] = v54;
  v162[1] = v58;
  v121 = (void *)v60;
  v162[2] = v60;
  uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:3];
  __int16 v64 = [v62 entriesForKey:v47 withComparisons:v63];

  unint64_t v65 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v66 = objc_opt_class();
    v145[0] = MEMORY[0x1E4F143A8];
    v145[1] = 3221225472;
    v145[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_221;
    v145[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v145[4] = v66;
    if (qword_1EBD5A890 != -1) {
      dispatch_once(&qword_1EBD5A890, v145);
    }
    if (byte_1EBD5A83E)
    {
      uint64_t v67 = [NSString stringWithFormat:@"aggregateQualificationEnergyEntries=%@", v64];
      __int16 v68 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      v70 = [v69 lastPathComponent];
      uint64_t v71 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
      [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:501];

      v72 = PLLogCommon();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v153 = (uint64_t)v67;
        _os_log_debug_impl(&dword_1D2690000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v65 = 0x1E4F92000uLL;
    }
  }
  long long v125 = (void *)v47;
  v73 = PLLogCommon();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    int v74 = [v64 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v153) = v74;
    _os_log_impl(&dword_1D2690000, v73, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID aggregateQualificationEnergyEntries count: %d", buf, 8u);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v129 = v64;
  uint64_t v75 = [v129 countByEnumeratingWithState:&v141 objects:v161 count:16];
  uint64_t v76 = v127;
  if (v75)
  {
    uint64_t v77 = v75;
    id v134 = *(id *)v142;
    uint64_t v131 = *MEMORY[0x1E4F92B28];
    do
    {
      uint64_t v78 = 0;
      do
      {
        if (*(id *)v142 != v134) {
          objc_enumerationMutation(v129);
        }
        v79 = *(void **)(*((void *)&v141 + 1) + 8 * v78);
        int v80 = [MEMORY[0x1E4F92910] sharedInstance];
        v81 = [v79 objectForKeyedSubscript:v76];
        int v82 = [v80 nodeNameForNodeID:v81];

        if ([*(id *)(v65 + 2496) debugEnabled])
        {
          uint64_t v83 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_228;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v83;
          if (qword_1EBD5A898 != -1) {
            dispatch_once(&qword_1EBD5A898, block);
          }
          if (byte_1EBD5A83F)
          {
            v84 = [NSString stringWithFormat:@"bundleID=%@", v82];
            v85 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v86 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
            v87 = [v86 lastPathComponent];
            uint64_t v88 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
            [v85 logMessage:v84 fromFile:v87 fromFunction:v88 fromLineNumber:508];

            uint64_t v89 = PLLogCommon();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v153 = (uint64_t)v84;
              _os_log_debug_impl(&dword_1D2690000, v89, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v65 = 0x1E4F92000;
            uint64_t v76 = v127;
          }
        }
        if (v82)
        {
          uint64_t v90 = [v79 objectForKeyedSubscript:v131];
          [v90 doubleValue];
          double v92 = v91 / 1000.0;

          double v93 = fmin(v92, 10000.0);
          v94 = [v39 objectForKeyedSubscript:v82];

          int v95 = NSNumber;
          if (v94)
          {
            v96 = [v39 objectForKeyedSubscript:v82];
            [v96 doubleValue];
            v98 = [v95 numberWithDouble:v93 + v97];
            [v39 setObject:v98 forKeyedSubscript:v82];
          }
          else
          {
            v96 = [NSNumber numberWithDouble:v93];
            [v39 setObject:v96 forKeyedSubscript:v82];
          }
        }
        ++v78;
      }
      while (v77 != v78);
      uint64_t v77 = [v129 countByEnumeratingWithState:&v141 objects:v161 count:16];
    }
    while (v77);
  }

  id v135 = [MEMORY[0x1E4F1CA48] array];
  v99 = PLLogCommon();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v99, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService energyResponseWithQualificationID cumulativeEnergies", buf, 2u);
  }

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v100 = v39;
  uint64_t v101 = [v100 countByEnumeratingWithState:&v136 objects:v160 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v137;
    double v104 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v102; ++j)
      {
        if (*(void *)v137 != v103) {
          objc_enumerationMutation(v100);
        }
        v159[0] = *(void *)(*((void *)&v136 + 1) + 8 * j);
        v106 = (void *)v159[0];
        v158[0] = @"bundleID";
        v158[1] = @"updateType";
        uint64_t v107 = [NSNumber numberWithUnsignedChar:v132];
        v159[1] = v107;
        v158[2] = @"energy";
        uint64_t v108 = [v100 objectForKeyedSubscript:v106];
        v159[2] = v108;
        v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:3];
        [v135 addObject:v109];

        v110 = [v100 objectForKeyedSubscript:v106];
        [v110 doubleValue];
        double v112 = v111;

        uint64_t v113 = PLLogCommon();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          v114 = [v100 objectForKeyedSubscript:v106];
          [v114 doubleValue];
          *(_DWORD *)buf = 138412546;
          uint64_t v153 = (uint64_t)v106;
          __int16 v154 = 2048;
          double v155 = v115;
          _os_log_impl(&dword_1D2690000, v113, OS_LOG_TYPE_INFO, "┃ ┃ ┃ PLDuetService energyResponseWithQualificationID cumulativeEnergies %@: %f", buf, 0x16u);
        }
        double v104 = v104 + v112;
      }
      uint64_t v102 = [v100 countByEnumeratingWithState:&v136 objects:v160 count:16];
    }
    while (v102);
  }
  else
  {
    double v104 = 0.0;
  }

  uint64_t v116 = PLLogCommon();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v117 = [v135 count];
    [v124 timeIntervalSince1970];
    *(_DWORD *)buf = 134218496;
    uint64_t v153 = v117;
    __int16 v154 = 2048;
    double v155 = v104;
    __int16 v156 = 2048;
    uint64_t v157 = v118;
    _os_log_impl(&dword_1D2690000, v116, OS_LOG_TYPE_DEFAULT, "┃ ┃ ┗ PLDuetService energyResponseWithQualificationID cumulativeEnergies %lu items with %f since %f", buf, 0x20u);
  }

  id v119 = PLLogCommon();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v119, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService energyResponseWithQualificationID created", buf, 2u);
  }

  uint64_t v14 = v126;
LABEL_85:

  return v135;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A83C = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_205(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A83D = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_221(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A83E = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_228(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A83F = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD5A8A0 != -1) {
      dispatch_once(&qword_1EBD5A8A0, block);
    }
    if (byte_1EBD5A840)
    {
      int v9 = [NSString stringWithFormat:@"lastCompletedDate=%@, now=%@", v6, v7];
      int v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      uint64_t v12 = [v11 lastPathComponent];
      int v13 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:541];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    [v6 timeIntervalSince1970];
    uint64_t v18 = v17;
    [v7 timeIntervalSince1970];
    *(_DWORD *)buf = 134218240;
    uint64_t v22 = v18;
    __int16 v23 = 2048;
    uint64_t v24 = v19;
    _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "┏ PLDuetService accumulateWithLastCompletedDate start, lastCompletedDate=%f, now=%f", buf, 0x16u);
  }

  [(PLDuetServiceWithAccounting *)self accumulateWithLastCompletedDate:v6 withNow:v7 withQualificationID:11];
  [(PLDuetServiceWithAccounting *)self accumulateWithLastCompletedDate:v6 withNow:v7 withQualificationID:12];
  uint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "┗ PLDuetService accumulateWithLastCompletedDate end", buf, 2u);
  }
}

uint64_t __71__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A840 = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4 withQualificationID:(int)a5
{
  v126[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v119) = a5;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "┃ ┏ PLDuetService accumulateWithLastCompletedDate start for qualificationID:%d", buf, 8u);
  }

  int v10 = [(PLDuetServiceImpl *)self duetService];

  if (v10)
  {
    double v97 = self;
    uint64_t v11 = *MEMORY[0x1E4F92D20];
    uint64_t v12 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B20]];
    int v13 = [v7 dateByAddingTimeInterval:-3600.0];
    if (!v13)
    {
      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate !lastBucketAlreadyAccumulated", buf, 2u);
      }

      int v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      [v13 timeIntervalSince1970];
      *(_DWORD *)buf = 134217984;
      double v119 = v85;
      _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketAlreadyAccumulated=%f", buf, 0xCu);
    }
    id v95 = v7;

    uint64_t v16 = [v8 dateByAddingTimeInterval:-3600.0];
    uint32_t v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      [v16 timeIntervalSince1970];
      *(_DWORD *)buf = 134217984;
      double v119 = v86;
      _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketToAccumulate=%f", buf, 0xCu);
    }

    id v18 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v19 = NSNumber;
    double v93 = v13;
    [v13 timeIntervalSince1970];
    int v20 = objc_msgSend(v19, "numberWithDouble:");
    uint64_t v21 = [v18 initWithKey:@"timestamp" withValue:v20 withComparisonOperation:2];

    id v22 = objc_alloc(MEMORY[0x1E4F92A90]);
    __int16 v23 = NSNumber;
    double v92 = v16;
    [v16 timeIntervalSince1970];
    uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
    uint64_t v25 = [v22 initWithKey:@"timestamp" withValue:v24 withComparisonOperation:4];

    id v26 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v27 = *MEMORY[0x1E4F92B38];
    int v28 = [NSNumber numberWithInt:a5];
    uint64_t v29 = [v26 initWithKey:v27 withValue:v28 withComparisonOperation:0];

    id v30 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v105 = *MEMORY[0x1E4F92B30];
    uint64_t v31 = objc_msgSend(v30, "initWithKey:withValue:withComparisonOperation:");
    v32 = [(PLDuetServiceImpl *)v97 duetService];
    uint64_t v33 = [v32 storage];
    uint64_t v90 = (void *)v25;
    double v91 = (void *)v21;
    v126[0] = v21;
    v126[1] = v25;
    uint64_t v88 = (void *)v31;
    uint64_t v89 = (void *)v29;
    v126[2] = v29;
    v126[3] = v31;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:4];
    v94 = (void *)v12;
    v35 = [v33 entriesForKey:v12 withComparisons:v34];

    id v96 = v8;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v36 = objc_opt_class();
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke;
      v115[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v115[4] = v36;
      if (qword_1EBD5A8A8 != -1) {
        dispatch_once(&qword_1EBD5A8A8, v115);
      }
      if (byte_1EBD5A841)
      {
        [NSString stringWithFormat:@"aggregateQualificationEnergyEntries=%@", v35];
        double v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        int v38 = (void *)MEMORY[0x1E4F929B8];
        v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        uint64_t v40 = [v39 lastPathComponent];
        uint64_t v41 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]"];
        [v38 logMessage:*(void *)&v37 fromFile:v40 fromFunction:v41 fromLineNumber:590];

        uint64_t v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v119 = v37;
          _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v43 = PLLogCommon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      int v87 = [v35 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v119) = v87;
      _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate %d aggregate entries found", buf, 8u);
    }

    uint64_t v44 = [(PLDuetServiceImpl *)v97 duetService];
    uint64_t v45 = [(id)objc_opt_class() entryKeyForType:v11 andName:@"DuetEnergyAccumulator"];

    uint64_t v46 = [(PLDuetServiceImpl *)v97 duetService];
    uint64_t v47 = [v46 storage];
    double v104 = (void *)v45;
    uint64_t v48 = [v47 entriesForKey:v45];

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    obuint64_t j = v48;
    uint64_t v49 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v112 != v51) {
            objc_enumerationMutation(obj);
          }
          double v53 = *(double *)(*((void *)&v111 + 1) + 8 * i);
          uint64_t v54 = PLLogCommon();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v119 = v53;
            _os_log_debug_impl(&dword_1D2690000, v54, OS_LOG_TYPE_DEBUG, "┃ ┃ ╸ PLDuetService accumulateWithLastCompletedDate existing entry:%@", buf, 0xCu);
          }
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
      }
      while (v50);
    }

    uint64_t v102 = [MEMORY[0x1E4F1CA48] array];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v98 = v35;
    uint64_t v55 = [v98 countByEnumeratingWithState:&v107 objects:v124 count:16];
    id v8 = v96;
    uint64_t v56 = v97;
    if (v55)
    {
      uint64_t v57 = v55;
      uint64_t v103 = *(void *)v108;
      uint64_t v100 = *MEMORY[0x1E4F92B28];
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v108 != v103) {
            objc_enumerationMutation(v98);
          }
          id v59 = *(void **)(*((void *)&v107 + 1) + 8 * v58);
          uint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v104 withDate:v8];
          v61 = [MEMORY[0x1E4F92910] sharedInstance];
          __int16 v62 = [v59 objectForKeyedSubscript:v105];
          uint64_t v63 = [v61 nodeNameForNodeID:v62];

          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v64 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_240;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v64;
            if (qword_1EBD5A8B0 != -1) {
              dispatch_once(&qword_1EBD5A8B0, block);
            }
            if (byte_1EBD5A842)
            {
              [NSString stringWithFormat:@"bundleID=%@", v63];
              double v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              uint64_t v66 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
              __int16 v68 = [v67 lastPathComponent];
              uint64_t v69 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]"];
              [v66 logMessage:*(void *)&v65 fromFile:v68 fromFunction:v69 fromLineNumber:607];

              v70 = PLLogCommon();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v119 = v65;
                _os_log_debug_impl(&dword_1D2690000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v8 = v96;
              uint64_t v56 = v97;
            }
          }
          uint64_t v71 = PLLogCommon();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            double v79 = [v59 objectForKeyedSubscript:v105];
            int v80 = [v59 objectForKeyedSubscript:@"timestamp"];
            *(_DWORD *)buf = 138412802;
            double v119 = v79;
            __int16 v120 = 2112;
            v121 = v63;
            __int16 v122 = 2112;
            long long v123 = v80;
            _os_log_debug_impl(&dword_1D2690000, v71, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService accumulateWithLastCompletedDate entry for nodeID:%@, bundleID:%@, timestamp:%@", buf, 0x20u);

            uint64_t v56 = v97;
          }

          if (v63)
          {
            [v60 setObject:v63 forKeyedSubscript:@"BundleID"];
            v72 = [NSNumber numberWithInt:a5];
            [v60 setObject:v72 forKeyedSubscript:@"QualificationID"];

            v73 = [v59 objectForKeyedSubscript:v100];
            [v73 doubleValue];
            double v75 = v74 / 1000.0;

            double v76 = fmin(v75, 10000.0);
            uint64_t v77 = [NSNumber numberWithDouble:v76];
            [v60 setObject:v77 forKeyedSubscript:@"Energy"];

            uint64_t v78 = PLLogCommon();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              double v119 = v76;
              _os_log_debug_impl(&dword_1D2690000, v78, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService accumulateWithLastCompletedDate entry energy:%fmWh", buf, 0xCu);
            }

            [v102 addObject:v60];
          }

          ++v58;
        }
        while (v57 != v58);
        uint64_t v57 = [v98 countByEnumeratingWithState:&v107 objects:v124 count:16];
      }
      while (v57);
    }

    if ([v102 count])
    {
      v81 = [(PLDuetServiceImpl *)v56 duetService];

      if (v81)
      {
        int v82 = [(PLDuetServiceImpl *)v56 duetService];
        uint64_t v116 = v104;
        uint64_t v117 = v102;
        uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        [v82 logEntries:v83 withGroupID:v104];
      }
    }
    v84 = PLLogCommon();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v84, OS_LOG_TYPE_DEBUG, "┃ ┗ PLDuetService accumulateWithLastCompletedDate end", buf, 2u);
    }

    id v7 = v95;
  }
}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A841 = result;
  return result;
}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_240(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A842 = result;
  return result;
}

+ (id)mapBundleID:(id)a3
{
  uint64_t v3 = qword_1EBD5A8B8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EBD5A8B8, &__block_literal_global_242);
  }
  uint64_t v5 = [(id)qword_1EBD5A8C0 objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5) {
    uint64_t v5 = v4;
  }
  id v7 = v5;

  return v7;
}

void __43__PLDuetServiceWithAccounting_mapBundleID___block_invoke()
{
  v0 = (void *)qword_1EBD5A8C0;
  qword_1EBD5A8C0 = (uint64_t)&unk_1F29EB818;
}

@end