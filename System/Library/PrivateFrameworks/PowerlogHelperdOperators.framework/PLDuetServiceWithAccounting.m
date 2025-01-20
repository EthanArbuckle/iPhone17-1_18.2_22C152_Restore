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
- (void)energyResponse;
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
  BOOL v5 = +[PLUtilities isPowerlogHelperd];
  if (v4 && !v5)
  {
    [(PLDuetServiceImpl *)self setDuetService:v4];
    id v6 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke;
    v20[3] = &unk_1E6E47740;
    v20[4] = self;
    v7 = (void *)[v6 initWithOperator:v4 withRegistration:&unk_1F400F4C0 withBlock:v20];
    [(PLDuetServiceImpl *)self setEventListener:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F92AA8]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_2;
    v19[3] = &unk_1E6E47958;
    v19[4] = self;
    v9 = (void *)[v8 initWithOperator:v4 withRegistration:&unk_1F400F4E8 withBlock:v19];
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
    v18[3] = &unk_1E6E48E48;
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
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveEventWithPayload__defaultOnce, block);
    }
    if (didReceiveEventWithPayload__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"payload=%@", v4];
      v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting didReceiveEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:181];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v12, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService didReceiveEventWithPayload start", buf, 2u);
  }

  if (!v4
    || ([v4 objectForKeyedSubscript:@"events"],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    v109 = PLLogCommon();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
      -[PLDuetServiceWithAccounting didReceiveEventWithPayload:]();
    }
    goto LABEL_91;
  }
  v14 = (void *)MEMORY[0x1E4E7EF70]();
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
      LODWORD(v143) = v20;
      _os_log_impl(&dword_1E4220000, v18, OS_LOG_TYPE_DEFAULT, "┃ ┏ PLDuetService didReceiveEventWithPayload processing %d events", buf, 8u);
    }
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v111 = v4;
    obuint64_t j = [v4 objectForKeyedSubscript:@"events"];
    uint64_t v115 = [obj countByEnumeratingWithState:&v137 objects:v149 count:16];
    if (v115)
    {
      uint64_t v113 = *(void *)v138;
      uint64_t v118 = *MEMORY[0x1E4F92D38];
      v122 = self;
      v114 = v15;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v138 != v113) {
            objc_enumerationMutation(obj);
          }
          uint64_t v116 = v21;
          v22 = *(void **)(*((void *)&v137 + 1) + 8 * v21);
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
            uint64_t v143 = (uint64_t)v23;
            _os_log_debug_impl(&dword_1E4220000, v30, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing event: %@", buf, 0xCu);
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
            long long v133 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            long long v136 = 0u;
            v39 = [v23 childBundleIDToWeight];
            uint64_t v40 = [v39 countByEnumeratingWithState:&v133 objects:v148 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v134;
              do
              {
                for (uint64_t i = 0; i != v41; ++i)
                {
                  if (*(void *)v134 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v44 = *(void *)(*((void *)&v133 + 1) + 8 * i);
                  v45 = [v23 childBundleIDToWeight];
                  v46 = [v45 objectForKeyedSubscript:v44];
                  v47 = [(id)objc_opt_class() mapBundleID:v44];
                  [v38 setObject:v46 forKeyedSubscript:v47];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v133 objects:v148 count:16];
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
            LODWORD(v143) = v50;
            _os_log_impl(&dword_1E4220000, v48, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing %d intervals", buf, 8u);
          }
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          id v119 = [v22 objectForKeyedSubscript:@"eventIntervals"];
          uint64_t v51 = [v119 countByEnumeratingWithState:&v129 objects:v147 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v130;
            do
            {
              for (uint64_t j = 0; j != v52; ++j)
              {
                if (*(void *)v130 != v53) {
                  objc_enumerationMutation(v119);
                }
                v55 = *(void **)(*((void *)&v129 + 1) + 8 * j);
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
                  uint64_t v143 = (uint64_t)v56;
                  _os_log_debug_impl(&dword_1E4220000, v61, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService didReceiveEventWithPayload new interval:%@", buf, 0xCu);
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

                    v74 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v23, "updateType"));
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
              uint64_t v52 = [v119 countByEnumeratingWithState:&v129 objects:v147 count:16];
            }
            while (v52);
          }

          v79 = PLLogCommon();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4220000, v79, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing intervals", buf, 2u);
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
              long long v127 = 0u;
              long long v128 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              v87 = [v23 childBundleIDToWeight];
              uint64_t v88 = [v87 countByEnumeratingWithState:&v125 objects:v146 count:16];
              if (v88)
              {
                uint64_t v89 = v88;
                uint64_t v90 = *(void *)v126;
                do
                {
                  for (uint64_t k = 0; k != v89; ++k)
                  {
                    if (*(void *)v126 != v90) {
                      objc_enumerationMutation(v87);
                    }
                    v92 = *(void **)(*((void *)&v125 + 1) + 8 * k);
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
                      uint64_t v143 = (uint64_t)v92;
                      _os_log_debug_impl(&dword_1E4220000, v98, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ╸ PLDuetService didReceiveEventWithPayload childEvent for bundleID:%@", buf, 0xCu);
                    }
                  }
                  uint64_t v89 = [v87 countByEnumeratingWithState:&v125 objects:v146 count:16];
                }
                while (v89);
              }
            }
          }
          v99 = PLLogCommon();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG)) {
            -[PLDuetServiceWithAccounting didReceiveEventWithPayload:](&v123, v124);
          }

          uint64_t v21 = v116 + 1;
        }
        while (v116 + 1 != v115);
        uint64_t v115 = [obj countByEnumeratingWithState:&v137 objects:v149 count:16];
      }
      while (v115);
    }

    v100 = PLLogCommon();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v100, OS_LOG_TYPE_DEFAULT, "┃ ┗ PLDuetService didReceiveEventWithPayload processing events completed", buf, 2u);
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
      uint64_t v143 = v104;
      __int16 v144 = 2048;
      uint64_t v145 = v105;
      _os_log_impl(&dword_1E4220000, v103, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu disc transitions from %lu events", buf, 0x16u);
    }

    [(PLDuetServiceWithAccounting *)self createQualificationEventsWithEventTransitions:v102 withQualificationID:12];
    v106 = PLLogCommon();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v107 = [v102 count];
      uint64_t v108 = [v117 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v143 = v107;
      __int16 v144 = 2048;
      uint64_t v145 = v108;
      _os_log_impl(&dword_1E4220000, v106, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu comp transitions from %lu events", buf, 0x16u);
    }

    v109 = PLLogCommon();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v109, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService didReceiveEventWithPayload end", buf, 2u);
    }
LABEL_91:

    goto LABEL_92;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[PLDuetServiceWithAccounting didReceiveEventWithPayload:]();
  }

LABEL_92:
}

uint64_t __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveEventWithPayload__classDebugEnabled = result;
  return result;
}

- (id)eventTransitionsWithEvents:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService eventTransitionsWithEvents start", buf, 2u);
  }

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v3;
  uint64_t v56 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v65;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v65 != v55) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v64 + 1) + 8 * v6);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v8 = objc_opt_class();
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke;
          v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v63[4] = v8;
          if (eventTransitionsWithEvents__defaultOnce != -1) {
            dispatch_once(&eventTransitionsWithEvents__defaultOnce, v63);
          }
          if (eventTransitionsWithEvents__classDebugEnabled)
          {
            v9 = [NSString stringWithFormat:@"event=%@", v7];
            v10 = (void *)MEMORY[0x1E4F929B8];
            v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
            v12 = [v11 lastPathComponent];
            v13 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting eventTransitionsWithEvents:]"];
            [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:308];

            v14 = PLLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)int v69 = v9;
              _os_log_debug_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)int v69 = v7;
          _os_log_debug_impl(&dword_1E4220000, v15, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing event: %@", buf, 0xCu);
        }

        v16 = [v7 eventIntervals];
        uint64_t v17 = [v16 count];

        if (v17)
        {
          uint64_t v57 = v6;
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
              *(void *)int v69 = v19;
              _os_log_debug_impl(&dword_1E4220000, v23, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing interval: %@", buf, 0xCu);
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
                  *(_DWORD *)int v69 = v20;
                  *(_WORD *)&v69[4] = 1024;
                  *(_DWORD *)&v69[6] = v24;
                  __int16 v70 = 2112;
                  uint64_t v71 = v31;
                  _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents Joining intervals %d-%d, active interval updated: %@", buf, 0x18u);
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
              if (eventTransitionsWithEvents__defaultOnce_169 != -1) {
                dispatch_once(&eventTransitionsWithEvents__defaultOnce_169, block);
              }
              if (eventTransitionsWithEvents__classDebugEnabled_170)
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
                  *(void *)int v69 = v34;
                  _os_log_debug_impl(&dword_1E4220000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
              *(void *)int v69 = v40;
              _os_log_impl(&dword_1E4220000, v43, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created start transition: %@", buf, 0xCu);
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
              *(void *)int v69 = v44;
              _os_log_impl(&dword_1E4220000, v47, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created end transition: %@", buf, 0xCu);
            }

            v48 = PLLogCommon();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
              -[PLDuetServiceWithAccounting eventTransitionsWithEvents:](&v60, v61);
            }

            uint64_t v18 = v20;
            v49 = [v7 eventIntervals];
            unint64_t v50 = [v49 count];
          }
          while (v50 > v20);

          uint64_t v6 = v57;
        }
        uint64_t v51 = PLLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          -[PLDuetServiceWithAccounting eventTransitionsWithEvents:](&v58, v59);
        }

        ++v6;
      }
      while (v6 != v56);
      uint64_t v56 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v56);
  }

  [v5 sortUsingComparator:&__block_literal_global_14];
  uint64_t v52 = PLLogCommon();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v52, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService eventTransitionsWithEvents end", buf, 2u);
  }

  return v5;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  eventTransitionsWithEvents__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_171(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  eventTransitionsWithEvents__classDebugEnabled_170 = result;
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
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService createQualificationEventsWithEventTransitions start", buf, 2u);
  }

  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [v4 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v9;
    _os_log_impl(&dword_1E4220000, v8, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService createQualificationEventsWithEventTransitions processing %d transitions", buf, 8u);
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
          if (createQualificationEventsWithEventTransitions_withQualificationID__defaultOnce != -1) {
            dispatch_once(&createQualificationEventsWithEventTransitions_withQualificationID__defaultOnce, block);
          }
          if (createQualificationEventsWithEventTransitions_withQualificationID__classDebugEnabled)
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
              _os_log_debug_impl(&dword_1E4220000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
          _os_log_debug_impl(&dword_1E4220000, v25, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current transition:%@", buf, 0xCu);
        }

        v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v7;
          _os_log_debug_impl(&dword_1E4220000, v26, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current eventElements:%@", buf, 0xCu);
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
            _os_log_debug_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions created event with startDate:%f, endDate:%f, timeRange=%f seconds", buf, 0x20u);

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
    _os_log_impl(&dword_1E4220000, v49, OS_LOG_TYPE_INFO, "┃ ┃ ┗ PLDuetService createQualificationEventsWithEventTransitions Created %d qualification events", buf, 8u);
  }

  unint64_t v50 = PLLogCommon();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v50, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService createQualificationEventsWithEventTransitions end", buf, 2u);
  }
}

uint64_t __97__PLDuetServiceWithAccounting_createQualificationEventsWithEventTransitions_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  createQualificationEventsWithEventTransitions_withQualificationID__classDebugEnabled = result;
  return result;
}

- (id)energyResponse
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService energyResponse start", buf, 2u);
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
      _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService discretionaryCumulativeEnergies count: %d", buf, 8u);
    }

    uint64_t v8 = [(PLDuetServiceWithAccounting *)self energyResponseWithQualificationID:12];
    int v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v8 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v10;
      _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService complicationCumulativeEnergies count: %d", buf, 8u);
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
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetServiceWithAccounting energyResponse]();
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
          _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService energyResponse created", buf, 2u);
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
        _os_log_impl(&dword_1E4220000, v26, OS_LOG_TYPE_INFO, "lastAccumulatedDate=%@", buf, 0xCu);
      }

      v19 = [v25 convertFromMonotonicToSystem];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v19;
        _os_log_impl(&dword_1E4220000, v27, OS_LOG_TYPE_INFO, "After converting to system time, lastAccumulatedDate=%@", buf, 0xCu);
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
    _os_log_impl(&dword_1E4220000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    goto LABEL_25;
  }
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[PLDuetServiceWithAccounting energyResponse]();
  }
  v22 = (void *)MEMORY[0x1E4F1CC08];
LABEL_28:

  return v22;
}

- (id)energyResponseWithQualificationID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v161[1] = *MEMORY[0x1E4F143B8];
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService energyResponseWithQualificationID start", buf, 2u);
  }

  uint64_t v5 = [(PLDuetServiceImpl *)self duetService];

  if (!v5)
  {
    uint64_t v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PLDuetServiceWithAccounting energyResponseWithQualificationID:]();
    }
    goto LABEL_79;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v148[0] = MEMORY[0x1E4F143A8];
    v148[1] = 3221225472;
    v148[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke;
    v148[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v148[4] = v6;
    if (energyResponseWithQualificationID__defaultOnce != -1) {
      dispatch_once(&energyResponseWithQualificationID__defaultOnce, v148);
    }
    if (energyResponseWithQualificationID__classDebugEnabled)
    {
      int v7 = objc_msgSend(NSString, "stringWithFormat:", @"qualificationID=%i", v3);
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      int v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:444];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
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
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PLDuetServiceWithAccounting energyResponseWithQualificationID:](v14);
    }
LABEL_79:
    id v132 = 0;
    goto LABEL_86;
  }
  int v13 = 2;
LABEL_17:
  unsigned int v129 = v13;
  v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v150) = v129;
    _os_log_impl(&dword_1E4220000, v15, OS_LOG_TYPE_DEFAULT, "┃ ┃ PLDuetService energyResponseWithQualificationID: updateType %d", buf, 8u);
  }

  uint64_t v16 = [(PLDuetServiceImpl *)self duetService];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = *MEMORY[0x1E4F92D20];
  uint64_t v19 = [v17 entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"DuetEnergyAccumulator"];

  id v20 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  uint64_t v22 = [v20 initWithKey:@"QualificationID" withValue:v21 withComparisonOperation:0];

  v23 = [(PLDuetServiceImpl *)self duetService];
  unint64_t v24 = [v23 storage];
  id v130 = (id)v22;
  v161[0] = v22;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:1];
  char v123 = v19;
  v26 = [v24 entriesForKey:v19 withComparisons:v25];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v27 = objc_opt_class();
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_205;
    v147[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v147[4] = v27;
    if (energyResponseWithQualificationID__defaultOnce_203 != -1) {
      dispatch_once(&energyResponseWithQualificationID__defaultOnce_203, v147);
    }
    if (energyResponseWithQualificationID__classDebugEnabled_204)
    {
      int v28 = [NSString stringWithFormat:@"accumulatorEntries=%@", v26];
      double v29 = (void *)MEMORY[0x1E4F929B8];
      double v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      uint64_t v31 = [v30 lastPathComponent];
      v32 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:468];

      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v34 = PLLogCommon();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    int v35 = [v26 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v150) = v35;
    _os_log_impl(&dword_1E4220000, v34, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID accumulatorEntries count: %d", buf, 8u);
  }

  id v36 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  obuint64_t j = v26;
  uint64_t v37 = [obj countByEnumeratingWithState:&v143 objects:v160 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v144;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v144 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void **)(*((void *)&v143 + 1) + 8 * i);
        uint64_t v42 = [v41 objectForKeyedSubscript:@"Energy"];
        uint64_t v43 = [v41 objectForKeyedSubscript:@"BundleID"];
        [v36 setObject:v42 forKeyedSubscript:v43];
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v143 objects:v160 count:16];
    }
    while (v38);
  }

  uint64_t v44 = [MEMORY[0x1E4F92968] entryKeyForType:v18 andName:*MEMORY[0x1E4F92B20]];
  v45 = [MEMORY[0x1E4F92980] sharedInstance];
  uint64_t v46 = [v45 lastCompletedDateWithIdentifier:@"PLDuetService_duetEnergyAccumulator"];
  int v47 = [v46 dateByAddingTimeInterval:-3600.0];

  if (!v47)
  {
    int v47 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v48 = objc_alloc(MEMORY[0x1E4F92A90]);
  v49 = (void *)MEMORY[0x1E4F28ED0];
  v121 = v47;
  [v47 timeIntervalSince1970];
  unint64_t v50 = objc_msgSend(v49, "numberWithDouble:");
  uint64_t v51 = [v48 initWithKey:@"timestamp" withValue:v50 withComparisonOperation:2];

  id v52 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v53 = *MEMORY[0x1E4F92B38];
  uint64_t v54 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  uint64_t v55 = [v52 initWithKey:v53 withValue:v54 withComparisonOperation:0];

  id v56 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v124 = *MEMORY[0x1E4F92B30];
  uint64_t v57 = objc_msgSend(v56, "initWithKey:withValue:withComparisonOperation:");
  long long v58 = [(PLDuetServiceImpl *)self duetService];
  long long v59 = [v58 storage];
  id v119 = (void *)v55;
  v120 = (void *)v51;
  v159[0] = v51;
  v159[1] = v55;
  uint64_t v118 = (void *)v57;
  v159[2] = v57;
  char v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:3];
  v61 = [v59 entriesForKey:v44 withComparisons:v60];

  unint64_t v62 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v63 = objc_opt_class();
    v142[0] = MEMORY[0x1E4F143A8];
    v142[1] = 3221225472;
    v142[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_221;
    v142[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v142[4] = v63;
    if (energyResponseWithQualificationID__defaultOnce_219 != -1) {
      dispatch_once(&energyResponseWithQualificationID__defaultOnce_219, v142);
    }
    if (energyResponseWithQualificationID__classDebugEnabled_220)
    {
      __int16 v64 = [NSString stringWithFormat:@"aggregateQualificationEnergyEntries=%@", v61];
      uint64_t v65 = (void *)MEMORY[0x1E4F929B8];
      long long v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      uint64_t v67 = [v66 lastPathComponent];
      v68 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
      [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:501];

      int v69 = PLLogCommon();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      unint64_t v62 = 0x1E4F92000uLL;
    }
  }
  v122 = (void *)v44;
  __int16 v70 = PLLogCommon();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    int v71 = [v61 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v150) = v71;
    _os_log_impl(&dword_1E4220000, v70, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID aggregateQualificationEnergyEntries count: %d", buf, 8u);
  }

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v126 = v61;
  uint64_t v72 = [v126 countByEnumeratingWithState:&v138 objects:v158 count:16];
  uint64_t v73 = v124;
  if (v72)
  {
    uint64_t v74 = v72;
    id v131 = *(id *)v139;
    uint64_t v128 = *MEMORY[0x1E4F92B28];
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(id *)v139 != v131) {
          objc_enumerationMutation(v126);
        }
        v76 = *(void **)(*((void *)&v138 + 1) + 8 * v75);
        v77 = [MEMORY[0x1E4F92910] sharedInstance];
        v78 = [v76 objectForKeyedSubscript:v73];
        v79 = [v77 nodeNameForNodeID:v78];

        if ([*(id *)(v62 + 2496) debugEnabled])
        {
          uint64_t v80 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_228;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v80;
          if (energyResponseWithQualificationID__defaultOnce_226 != -1) {
            dispatch_once(&energyResponseWithQualificationID__defaultOnce_226, block);
          }
          if (energyResponseWithQualificationID__classDebugEnabled_227)
          {
            v81 = [NSString stringWithFormat:@"bundleID=%@", v79];
            int v82 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v83 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
            v84 = [v83 lastPathComponent];
            v85 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]"];
            [v82 logMessage:v81 fromFile:v84 fromFunction:v85 fromLineNumber:508];

            uint64_t v86 = PLLogCommon();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v150 = (uint64_t)v81;
              _os_log_debug_impl(&dword_1E4220000, v86, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v62 = 0x1E4F92000;
            uint64_t v73 = v124;
          }
        }
        if (v79)
        {
          v87 = [v76 objectForKeyedSubscript:v128];
          [v87 doubleValue];
          double v89 = v88 / 1000.0;

          double v90 = fmin(v89, 10000.0);
          v91 = [v36 objectForKeyedSubscript:v79];

          v92 = (void *)MEMORY[0x1E4F28ED0];
          if (v91)
          {
            v93 = [v36 objectForKeyedSubscript:v79];
            [v93 doubleValue];
            int v95 = [v92 numberWithDouble:v90 + v94];
            [v36 setObject:v95 forKeyedSubscript:v79];
          }
          else
          {
            v93 = [MEMORY[0x1E4F28ED0] numberWithDouble:v90];
            [v36 setObject:v93 forKeyedSubscript:v79];
          }
        }
        ++v75;
      }
      while (v74 != v75);
      uint64_t v74 = [v126 countByEnumeratingWithState:&v138 objects:v158 count:16];
    }
    while (v74);
  }

  id v132 = [MEMORY[0x1E4F1CA48] array];
  v96 = PLLogCommon();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v96, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService energyResponseWithQualificationID cumulativeEnergies", buf, 2u);
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v97 = v36;
  uint64_t v98 = [v97 countByEnumeratingWithState:&v133 objects:v157 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v134;
    double v101 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v99; ++j)
      {
        if (*(void *)v134 != v100) {
          objc_enumerationMutation(v97);
        }
        v156[0] = *(void *)(*((void *)&v133 + 1) + 8 * j);
        v103 = (void *)v156[0];
        v155[0] = @"bundleID";
        v155[1] = @"updateType";
        uint64_t v104 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v129];
        v156[1] = v104;
        v155[2] = @"energy";
        uint64_t v105 = [v97 objectForKeyedSubscript:v103];
        v156[2] = v105;
        v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:3];
        [v132 addObject:v106];

        uint64_t v107 = [v97 objectForKeyedSubscript:v103];
        [v107 doubleValue];
        double v109 = v108;

        v110 = PLLogCommon();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          id v111 = [v97 objectForKeyedSubscript:v103];
          [v111 doubleValue];
          *(_DWORD *)buf = 138412546;
          uint64_t v150 = (uint64_t)v103;
          __int16 v151 = 2048;
          double v152 = v112;
          _os_log_impl(&dword_1E4220000, v110, OS_LOG_TYPE_INFO, "┃ ┃ ┃ PLDuetService energyResponseWithQualificationID cumulativeEnergies %@: %f", buf, 0x16u);
        }
        double v101 = v101 + v109;
      }
      uint64_t v99 = [v97 countByEnumeratingWithState:&v133 objects:v157 count:16];
    }
    while (v99);
  }
  else
  {
    double v101 = 0.0;
  }

  uint64_t v113 = PLLogCommon();
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v114 = [v132 count];
    [v121 timeIntervalSince1970];
    *(_DWORD *)buf = 134218496;
    uint64_t v150 = v114;
    __int16 v151 = 2048;
    double v152 = v101;
    __int16 v153 = 2048;
    uint64_t v154 = v115;
    _os_log_impl(&dword_1E4220000, v113, OS_LOG_TYPE_DEFAULT, "┃ ┃ ┗ PLDuetService energyResponseWithQualificationID cumulativeEnergies %lu items with %f since %f", buf, 0x20u);
  }

  uint64_t v116 = PLLogCommon();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v116, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService energyResponseWithQualificationID created", buf, 2u);
  }

  uint64_t v14 = v123;
LABEL_86:

  return v132;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  energyResponseWithQualificationID__classDebugEnabled = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_205(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  energyResponseWithQualificationID__classDebugEnabled_204 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_221(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  energyResponseWithQualificationID__classDebugEnabled_220 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_228(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  energyResponseWithQualificationID__classDebugEnabled_227 = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4
{
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
    if (accumulateWithLastCompletedDate_withNow__defaultOnce != -1) {
      dispatch_once(&accumulateWithLastCompletedDate_withNow__defaultOnce, block);
    }
    if (accumulateWithLastCompletedDate_withNow__classDebugEnabled)
    {
      int v9 = [NSString stringWithFormat:@"lastCompletedDate=%@, now=%@", v6, v7];
      int v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      uint64_t v12 = [v11 lastPathComponent];
      int v13 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:541];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:](v6, v7, v15);
  }

  [(PLDuetServiceWithAccounting *)self accumulateWithLastCompletedDate:v6 withNow:v7 withQualificationID:11];
  [(PLDuetServiceWithAccounting *)self accumulateWithLastCompletedDate:v6 withNow:v7 withQualificationID:12];
  uint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:]();
  }
}

uint64_t __71__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  accumulateWithLastCompletedDate_withNow__classDebugEnabled = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4 withQualificationID:(int)a5
{
  v123[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.7(a5, v9);
  }

  int v10 = [(PLDuetServiceImpl *)self duetService];

  if (v10)
  {
    double v94 = self;
    uint64_t v11 = *MEMORY[0x1E4F92D20];
    uint64_t v12 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B20]];
    int v13 = [v7 dateByAddingTimeInterval:-3600.0];
    if (!v13)
    {
      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.6();
      }

      int v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.5(v13);
    }
    id v92 = v7;

    uint64_t v16 = [v8 dateByAddingTimeInterval:-3600.0];
    uint64_t v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.4(v16);
    }

    id v18 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v19 = (void *)MEMORY[0x1E4F28ED0];
    double v90 = v13;
    [v13 timeIntervalSince1970];
    id v20 = objc_msgSend(v19, "numberWithDouble:");
    uint64_t v21 = [v18 initWithKey:@"timestamp" withValue:v20 withComparisonOperation:2];

    id v22 = objc_alloc(MEMORY[0x1E4F92A90]);
    v23 = (void *)MEMORY[0x1E4F28ED0];
    double v89 = v16;
    [v16 timeIntervalSince1970];
    unint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
    uint64_t v25 = [v22 initWithKey:@"timestamp" withValue:v24 withComparisonOperation:4];

    id v26 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v27 = *MEMORY[0x1E4F92B38];
    int v28 = [MEMORY[0x1E4F28ED0] numberWithInt:a5];
    uint64_t v29 = [v26 initWithKey:v27 withValue:v28 withComparisonOperation:0];

    id v30 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v102 = *MEMORY[0x1E4F92B30];
    uint64_t v31 = objc_msgSend(v30, "initWithKey:withValue:withComparisonOperation:");
    v32 = [(PLDuetServiceImpl *)v94 duetService];
    uint64_t v33 = [v32 storage];
    v87 = (void *)v25;
    double v88 = (void *)v21;
    v123[0] = v21;
    v123[1] = v25;
    v85 = (void *)v31;
    uint64_t v86 = (void *)v29;
    v123[2] = v29;
    v123[3] = v31;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:4];
    v91 = (void *)v12;
    int v35 = [v33 entriesForKey:v12 withComparisons:v34];

    id v93 = v8;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v36 = objc_opt_class();
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke;
      v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v112[4] = v36;
      if (accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce != -1) {
        dispatch_once(&accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce, v112);
      }
      if (accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled)
      {
        uint64_t v37 = [NSString stringWithFormat:@"aggregateQualificationEnergyEntries=%@", v35];
        uint64_t v38 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        uint64_t v40 = [v39 lastPathComponent];
        uint64_t v41 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]"];
        [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:590];

        uint64_t v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    uint64_t v43 = PLLogCommon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:](v35, v43);
    }

    uint64_t v44 = [(PLDuetServiceImpl *)v94 duetService];
    uint64_t v45 = [(id)objc_opt_class() entryKeyForType:v11 andName:@"DuetEnergyAccumulator"];

    uint64_t v46 = [(PLDuetServiceImpl *)v94 duetService];
    int v47 = [v46 storage];
    double v101 = (void *)v45;
    id v48 = [v47 entriesForKey:v45];

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    obuint64_t j = v48;
    uint64_t v49 = [obj countByEnumeratingWithState:&v108 objects:v122 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v109 != v51) {
            objc_enumerationMutation(obj);
          }
          double v53 = *(double *)(*((void *)&v108 + 1) + 8 * i);
          uint64_t v54 = PLLogCommon();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v116 = v53;
            _os_log_debug_impl(&dword_1E4220000, v54, OS_LOG_TYPE_DEBUG, "┃ ┃ ╸ PLDuetService accumulateWithLastCompletedDate existing entry:%@", buf, 0xCu);
          }
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v108 objects:v122 count:16];
      }
      while (v50);
    }

    uint64_t v99 = [MEMORY[0x1E4F1CA48] array];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v95 = v35;
    uint64_t v55 = [v95 countByEnumeratingWithState:&v104 objects:v121 count:16];
    id v8 = v93;
    id v56 = v94;
    if (v55)
    {
      uint64_t v57 = v55;
      uint64_t v100 = *(void *)v105;
      uint64_t v97 = *MEMORY[0x1E4F92B28];
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v105 != v100) {
            objc_enumerationMutation(v95);
          }
          long long v59 = *(void **)(*((void *)&v104 + 1) + 8 * v58);
          char v60 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v101 withDate:v8];
          v61 = [MEMORY[0x1E4F92910] sharedInstance];
          unint64_t v62 = [v59 objectForKeyedSubscript:v102];
          uint64_t v63 = [v61 nodeNameForNodeID:v62];

          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v64 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_240;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v64;
            if (accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce_238 != -1) {
              dispatch_once(&accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce_238, block);
            }
            if (accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled_239)
            {
              [NSString stringWithFormat:@"bundleID=%@", v63];
              double v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              long long v66 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
              v68 = [v67 lastPathComponent];
              int v69 = [NSString stringWithUTF8String:"-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]"];
              [v66 logMessage:*(void *)&v65 fromFile:v68 fromFunction:v69 fromLineNumber:607];

              __int16 v70 = PLLogCommon();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v116 = v65;
                _os_log_debug_impl(&dword_1E4220000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v8 = v93;
              id v56 = v94;
            }
          }
          int v71 = PLLogCommon();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            double v79 = [v59 objectForKeyedSubscript:v102];
            uint64_t v80 = [v59 objectForKeyedSubscript:@"timestamp"];
            *(_DWORD *)buf = 138412802;
            double v116 = v79;
            __int16 v117 = 2112;
            uint64_t v118 = v63;
            __int16 v119 = 2112;
            v120 = v80;
            _os_log_debug_impl(&dword_1E4220000, v71, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService accumulateWithLastCompletedDate entry for nodeID:%@, bundleID:%@, timestamp:%@", buf, 0x20u);

            id v56 = v94;
          }

          if (v63)
          {
            [v60 setObject:v63 forKeyedSubscript:@"BundleID"];
            uint64_t v72 = [MEMORY[0x1E4F28ED0] numberWithInt:a5];
            [v60 setObject:v72 forKeyedSubscript:@"QualificationID"];

            uint64_t v73 = [v59 objectForKeyedSubscript:v97];
            [v73 doubleValue];
            double v75 = v74 / 1000.0;

            double v76 = fmin(v75, 10000.0);
            v77 = [MEMORY[0x1E4F28ED0] numberWithDouble:v76];
            [v60 setObject:v77 forKeyedSubscript:@"Energy"];

            v78 = PLLogCommon();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              double v116 = v76;
              _os_log_debug_impl(&dword_1E4220000, v78, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService accumulateWithLastCompletedDate entry energy:%fmWh", buf, 0xCu);
            }

            [v99 addObject:v60];
          }

          ++v58;
        }
        while (v57 != v58);
        uint64_t v57 = [v95 countByEnumeratingWithState:&v104 objects:v121 count:16];
      }
      while (v57);
    }

    if ([v99 count])
    {
      v81 = [(PLDuetServiceImpl *)v56 duetService];

      if (v81)
      {
        int v82 = [(PLDuetServiceImpl *)v56 duetService];
        uint64_t v113 = v101;
        uint64_t v114 = v99;
        uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        [v82 logEntries:v83 withGroupID:v101];
      }
    }
    v84 = PLLogCommon();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]();
    }

    id v7 = v92;
  }
}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled = result;
  return result;
}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_240(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled_239 = result;
  return result;
}

+ (id)mapBundleID:(id)a3
{
  uint64_t v3 = mapBundleID__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&mapBundleID__onceToken, &__block_literal_global_242);
  }
  uint64_t v5 = [(id)mapBundleID__daemonBundleIDToName objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5) {
    uint64_t v5 = v4;
  }
  id v7 = v5;

  return v7;
}

void __43__PLDuetServiceWithAccounting_mapBundleID___block_invoke()
{
  v0 = (void *)mapBundleID__daemonBundleIDToName;
  mapBundleID__daemonBundleIDToName = (uint64_t)&unk_1F400F510;
}

- (void)didReceiveEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "┗ PLDuetService didReceiveEventWithPayload end: Invalid payload", v2, v3, v4, v5, v6);
}

- (void)didReceiveEventWithPayload:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "┗ PLDuetService didReceiveEventWithPayload end: duetService not found", v2, v3, v4, v5, v6);
}

- (void)didReceiveEventWithPayload:(unsigned char *)a1 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_4_2(&dword_1E4220000, v2, (uint64_t)v2, "┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing event", v3);
}

- (void)eventTransitionsWithEvents:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_4_2(&dword_1E4220000, v2, (uint64_t)v2, "┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing event", v3);
}

- (void)eventTransitionsWithEvents:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_4_2(&dword_1E4220000, v2, (uint64_t)v2, "┃ ┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing interval", v3);
}

- (void)energyResponse
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "lastQualifiedDate=%@", v2, v3, v4, v5, v6);
}

- (void)energyResponseWithQualificationID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "┃ ┗ PLDuetService energyResponseWithQualificationID: duetService not found", v2, v3, v4, v5, v6);
}

- (void)energyResponseWithQualificationID:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "┃ ┗ PLDuetService energyResponseWithQualificationID: unexpected updateType %d", (uint8_t *)v1, 8u);
}

- (void)accumulateWithLastCompletedDate:withNow:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_2(&dword_1E4220000, v0, v1, "┗ PLDuetService accumulateWithLastCompletedDate end", v2);
}

- (void)accumulateWithLastCompletedDate:(NSObject *)a3 withNow:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a1 timeIntervalSince1970];
  uint64_t v6 = v5;
  [a2 timeIntervalSince1970];
  int v8 = 134218240;
  uint64_t v9 = v6;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "┏ PLDuetService accumulateWithLastCompletedDate start, lastCompletedDate=%f, now=%f", (uint8_t *)&v8, 0x16u);
}

- (void)accumulateWithLastCompletedDate:withNow:withQualificationID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_2(&dword_1E4220000, v0, v1, "┃ ┗ PLDuetService accumulateWithLastCompletedDate end", v2);
}

- (void)accumulateWithLastCompletedDate:(void *)a1 withNow:(NSObject *)a2 withQualificationID:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate %d aggregate entries found", (uint8_t *)v3, 8u);
}

- (void)accumulateWithLastCompletedDate:(void *)a1 withNow:withQualificationID:.cold.4(void *a1)
{
  [a1 timeIntervalSince1970];
  OUTLINED_FUNCTION_2(&dword_1E4220000, v1, v2, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketToAccumulate=%f", v3, v4, v5, v6, 0);
}

- (void)accumulateWithLastCompletedDate:(void *)a1 withNow:withQualificationID:.cold.5(void *a1)
{
  [a1 timeIntervalSince1970];
  OUTLINED_FUNCTION_2(&dword_1E4220000, v1, v2, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketAlreadyAccumulated=%f", v3, v4, v5, v6, 0);
}

- (void)accumulateWithLastCompletedDate:withNow:withQualificationID:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_2(&dword_1E4220000, v0, v1, "┃ ┃ PLDuetService accumulateWithLastCompletedDate !lastBucketAlreadyAccumulated", v2);
}

- (void)accumulateWithLastCompletedDate:(int)a1 withNow:(NSObject *)a2 withQualificationID:.cold.7(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "┃ ┏ PLDuetService accumulateWithLastCompletedDate start for qualificationID:%d", (uint8_t *)v2, 8u);
}

@end