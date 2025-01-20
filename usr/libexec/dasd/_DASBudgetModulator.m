@interface _DASBudgetModulator
+ (id)modulatorForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7;
- (NSArray)budgets;
- (NSDate)lastModulationDate;
- (NSDate)lastStartOfADayPeriodForBudgetAllocation;
- (NSDate)lastUsageTimelineUpdate;
- (NSMutableDictionary)lastPredictionUpdateForWidgets;
- (NSMutableDictionary)predictedBudgetsForWidgets;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (_DASBudgetPersisting)persistence;
- (_DKKnowledgeStore)store;
- (_DKPredictionTimeline)usage;
- (double)areaUnderTrapeziodWithFirstValue:(double)a3 andSecondValue:(double)a4;
- (double)budgetProportionAtDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5;
- (double)gaussianKDEatDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5;
- (double)locked_budgetAllocationProportionAtDate:(id)a3 forWidgetBudgetID:(id)a4;
- (double)relativeUsageAtDate:(id)a3 withTimeline:(id)a4;
- (id)initForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7;
- (id)usageTimeline;
- (id)usageTimelineForWidgetBudgetID:(id)a3 withStartDate:(id)a4;
- (int)computeSlotForDate:(id)a3 relativeToDate:(id)a4;
- (int)numberOfModulationFromDate:(id)a3 toDate:(id)a4;
- (void)locked_addBudgetsToBeModulated:(id)a3;
- (void)locked_modulateBudgets;
- (void)locked_replaceBudgetsToBeModulated:(id)a3;
- (void)locked_updateBudgetsToBeModulatedAdditions:(id)a3 removals:(id)a4;
- (void)modulateBudgets:(id)a3 lastModulatedAt:(id)a4 forNumberOfModulationSlots:(int)a5 atDate:(id)a6;
- (void)registerForTrial;
- (void)setBudgets:(id)a3;
- (void)setLastModulationDate:(id)a3;
- (void)setLastPredictionUpdateForWidgets:(id)a3;
- (void)setLastStartOfADayPeriodForBudgetAllocation:(id)a3;
- (void)setLastUsageTimelineUpdate:(id)a3;
- (void)setLog:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setPredictedBudgetsForWidgets:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUsage:(id)a3;
- (void)updateCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)updateTrialParametersWithManager:(id)a3;
@end

@implementation _DASBudgetModulator

- (id)initForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v51.receiver = self;
  v51.super_class = (Class)_DASBudgetModulator;
  id v17 = [(_DASBudgetModulator *)&v51 init];
  if (v17)
  {
    if (v13)
    {
      id v18 = v13;
    }
    else
    {
      id v18 = +[NSMutableArray array];
    }
    v19 = (void *)*((void *)v17 + 5);
    *((void *)v17 + 5) = v18;

    objc_storeStrong((id *)v17 + 1, a5);
    objc_storeStrong((id *)v17 + 2, a6);
    id v46 = +[NSString stringWithFormat:@"budgetModulation%@", v12];
    os_log_t v20 = os_log_create("com.apple.duetactivityscheduler", (const char *)[v46 UTF8String]);
    v21 = (void *)*((void *)v17 + 12);
    *((void *)v17 + 12) = v20;

    dispatch_source_t v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v17 + 2));
    v23 = (void *)*((void *)v17 + 6);
    *((void *)v17 + 6) = v22;

    objc_storeStrong((id *)v17 + 7, a7);
    uint64_t v24 = +[NSDate distantPast];
    v25 = (void *)*((void *)v17 + 4);
    *((void *)v17 + 4) = v24;

    id v26 = objc_alloc_init((Class)NSMutableDictionary);
    v27 = (void *)*((void *)v17 + 11);
    *((void *)v17 + 11) = v26;

    id v28 = objc_alloc_init((Class)NSMutableDictionary);
    v29 = (void *)*((void *)v17 + 10);
    *((void *)v17 + 10) = v28;

    unsigned int v30 = [v12 isEqualToString:@"Widgets"];
    if (v30) {
      int v31 = 900;
    }
    else {
      int v31 = 1800;
    }
    dword_1001C3AB0 = v31;
    if (v30) {
      int v32 = 96;
    }
    else {
      int v32 = 48;
    }
    dword_1001C3AB4 = v32;
    [v17 registerForTrial];
    v33 = *((void *)v17 + 6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A5A0;
    block[3] = &unk_1001754F8;
    v34 = v17;
    id v50 = v34;
    dispatch_block_t v35 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v33, v35);

    uint64_t v36 = [v14 lastModulationDate];
    v37 = (void *)v34[3];
    v34[3] = v36;

    uint64_t v38 = dword_1001C3AB0;
    v39 = (void *)v34[3];
    if (v39)
    {
      [v39 timeIntervalSinceNow];
      uint64_t v38 = llround(fmax(v40 + (double)v38, 0.0));
    }
    v41 = *((void *)v17 + 12);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v53 = (double)v38 / 60.0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Setting timer to fire ~%2.0fm from now", buf, 0xCu);
    }
    v42 = *((void *)v17 + 6);
    dispatch_time_t v43 = dispatch_walltime(0, 1000000000 * v38 + 60000000000);
    dispatch_source_set_timer(v42, v43, 1000000000 * dword_1001C3AB0, 0xDBCAC8E00uLL);
    v44 = *((void *)v17 + 2);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10001A5E4;
    v47[3] = &unk_1001754F8;
    v48 = v34;
    dispatch_async(v44, v47);
    dispatch_activate(*((dispatch_object_t *)v17 + 6));
  }
  return v17;
}

+ (id)modulatorForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [objc_alloc((Class)objc_opt_class()) initForBudgetTypes:v15 withBudgets:v14 persistence:v13 withQueue:v12 withStore:v11];

  return v16;
}

- (void)registerForTrial
{
  id v3 = +[_DASTrialManager sharedInstance];
  [v3 addDelegate:self];
  [(_DASBudgetModulator *)self updateTrialParametersWithManager:v3];
}

- (void)updateTrialParametersWithManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 factorWithName:@"Budget_UsageModulationMaximumInitialAllotmentPercentage"];
  v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    qword_1001C28B0 = v7;
  }
  uint64_t v8 = qword_1001C28B8;
  uint64_t v9 = qword_1001C28C0;
  v10 = [v4 factorWithName:@"Budget_MinimumBatteryLevelForFullUsageInitialAllotment"];

  if (v10)
  {
    [v10 doubleValue];
    uint64_t v9 = v11;
  }
  id v12 = [v4 factorWithName:@"Budget_MinimumBatteryForUsageInitialAllotment"];

  if (v12)
  {
    [v12 doubleValue];
    uint64_t v8 = v13;
  }
  if (*(double *)&v8 <= *(double *)&v9)
  {
    qword_1001C28B8 = v8;
    qword_1001C28C0 = v9;
  }
  id v14 = [v4 factorWithName:@"Budget_MinimumUsageAllotmentSlotLookaheadDuration"];

  if (v14)
  {
    [v14 doubleValue];
    qword_1001C28C8 = v15;
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218752;
    uint64_t v18 = qword_1001C28B0;
    __int16 v19 = 2048;
    uint64_t v20 = qword_1001C28B8;
    __int16 v21 = 2048;
    uint64_t v22 = qword_1001C28C0;
    __int16 v23 = 2048;
    uint64_t v24 = qword_1001C28C8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Config: Initial Allotment: %.2f, Minimum Level: %.0f, Minimum Full Level: %.0f, Minimum Lookahead: %.0f", (uint8_t *)&v17, 0x2Au);
  }
}

- (void)locked_replaceBudgetsToBeModulated:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMutableDictionary *)self->_lastPredictionUpdateForWidgets removeAllObjects];
  [(NSMutableDictionary *)self->_predictedBudgetsForWidgets removeAllObjects];
  v6 = (NSArray *)[v5 copy];
  budgets = self->_budgets;
  self->_budgets = v6;

  uint64_t v8 = +[NSDate date];
  lastModulationDate = self->_lastModulationDate;
  self->_lastModulationDate = v8;

  [(_DASBudgetModulator *)self modulateBudgets:v5 lastModulatedAt:0 forNumberOfModulationSlots:1 atDate:self->_lastModulationDate];
  persistence = self->_persistence;
  uint64_t v11 = self->_budgets;

  [(_DASBudgetPersisting *)persistence saveBudgets:v11];
}

- (void)locked_addBudgetsToBeModulated:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_lastModulationDate) {
    -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:](self, "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:", v6, 0, 1);
  }
  id v4 = [(NSArray *)self->_budgets arrayByAddingObjectsFromArray:v6];
  budgets = self->_budgets;
  self->_budgets = v4;

  [(_DASBudgetPersisting *)self->_persistence saveBudgets:self->_budgets];
}

- (void)locked_updateBudgetsToBeModulatedAdditions:(id)a3 removals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_lastModulationDate) {
    -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:](self, "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:", v6, 0, 1);
  }
  id v8 = [(NSArray *)self->_budgets mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 removeObject:*(void *)(*((void *)&v16 + 1) + 8 * (void)v13), (void)v16];
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v8 addObjectsFromArray:v6];
  id v14 = (NSArray *)[v8 copy];
  budgets = self->_budgets;
  self->_budgets = v14;

  [(_DASBudgetPersisting *)self->_persistence saveBudgets:self->_budgets];
}

- (int)numberOfModulationFromDate:(id)a3 toDate:(id)a4
{
  [a4 timeIntervalSinceDate:a3];
  return vcvtmd_s64_f64((v4 + 60.0) / (86400.0 / (double)dword_1001C3AB4));
}

- (double)relativeUsageAtDate:(id)a3 withTimeline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isUnavailable])
  {
    double v8 = 1.0 / (double)dword_1001C3AB4;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 138412290;
      id v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Modulation Timeline: %@", (uint8_t *)&v42, 0xCu);
    }
    id v11 = [v7 startDate];
    uint64_t v12 = [v7 valueAtDate:v11];
    [v12 doubleValue];
    double v14 = v13;

    uint64_t v15 = [v7 startDate];
    long long v16 = [v15 dateByAddingTimeInterval:(double)dword_1001C3AB0];

    long long v17 = [v7 endDate];
    [v16 timeIntervalSinceDate:v17];
    double v19 = v18;

    if (v19 >= 0.0)
    {
      uint64_t v22 = v16;
    }
    else
    {
      do
      {
        uint64_t v20 = [v7 valueAtDate:v16];
        [v20 doubleValue];
        double v14 = v14 + v21;

        uint64_t v22 = [v16 dateByAddingTimeInterval:(double)dword_1001C3AB0];

        __int16 v23 = [v7 endDate];
        [v22 timeIntervalSinceDate:v23];
        double v25 = v24;

        long long v16 = v22;
      }
      while (v25 < 0.0);
    }
    double v26 = *(double *)&qword_1001C28C8;
    if (*(double *)&qword_1001C28C8 > (double)dword_1001C3AB0) {
      double v26 = (double)dword_1001C3AB0;
    }
    v27 = [v6 dateByAddingTimeInterval:v26];
    id v28 = [v7 startDate];
    [v27 timeIntervalSinceDate:v28];
    double v30 = v29;

    if (v30 >= 0.0)
    {
      int v31 = v27;
    }
    else
    {
      do
      {
        int v31 = [v27 dateByAddingTimeInterval:86400.0];

        int v32 = [v7 startDate];
        [v31 timeIntervalSinceDate:v32];
        double v34 = v33;

        v27 = v31;
      }
      while (v34 < 0.0);
    }
    dispatch_block_t v35 = self->_log;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = v35;
      v37 = +[NSNumber numberWithDouble:v14];
      uint64_t v38 = [v7 valueAtDate:v31];
      int v42 = 138412802;
      id v43 = v37;
      __int16 v44 = 2112;
      v45 = v31;
      __int16 v46 = 2112;
      v47 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "All Likelihoods: %@, Value at %@: %@", (uint8_t *)&v42, 0x20u);
    }
    if (v14 == 0.0)
    {
      double v8 = 1.0 / (double)dword_1001C3AB4;
    }
    else
    {
      v39 = [v7 valueAtDate:v31];
      [v39 doubleValue];
      double v8 = v40 / v14;
    }
  }

  return v8;
}

- (id)usageTimeline
{
  id v3 = +[NSDate date];
  double v4 = v3;
  if (self->_usage && ([v3 timeIntervalSinceDate:self->_lastUsageTimelineUpdate], v5 < 21600.0))
  {
    id v6 = self->_usage;
  }
  else
  {
    double v8 = +[_DKPredictor predictorWithKnowledgeStore:self->_store];
    id v6 = [v8 deviceActivityLikelihood];
    objc_storeStrong((id *)&self->_usage, v6);
    objc_storeStrong((id *)&self->_lastUsageTimelineUpdate, v4);
  }

  return v6;
}

- (void)locked_modulateBudgets
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = +[NSDate date];
  lastModulationDate = self->_lastModulationDate;
  if (lastModulationDate)
  {
    uint64_t v5 = [(_DASBudgetModulator *)self numberOfModulationFromDate:lastModulationDate toDate:v3];
    if (!v5)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Last updated budgets too recently. Exiting.", (uint8_t *)&v13, 2u);
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v7 = +[NSDate now];
  double v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    budgets = self->_budgets;
    id v10 = self->_lastModulationDate;
    int v13 = 138412802;
    double v14 = budgets;
    __int16 v15 = 2112;
    long long v16 = v10;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Last modulated budgets %@ at %@, modulating for %d slots from then to now", (uint8_t *)&v13, 0x1Cu);
  }
  [(_DASBudgetModulator *)self modulateBudgets:self->_budgets lastModulatedAt:self->_lastModulationDate forNumberOfModulationSlots:v5 atDate:v7];
  id v11 = self->_lastModulationDate;
  self->_lastModulationDate = v7;
  uint64_t v12 = v7;

  [(_DASBudgetPersisting *)self->_persistence saveBudgets:self->_budgets];
  [(_DASBudgetPersisting *)self->_persistence saveModulationDate:v12];

LABEL_9:
}

- (void)modulateBudgets:(id)a3 lastModulatedAt:(id)a4 forNumberOfModulationSlots:(int)a5 atDate:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v74;
    double v16 = -1.0;
    double v17 = 0.0;
    *(void *)&long long v13 = 134218242;
    long long v68 = v13;
    uint64_t v72 = *(void *)v74;
    id v69 = v11;
LABEL_3:
    uint64_t v18 = 0;
    id v71 = v14;
    while (2)
    {
      if (*(void *)v74 != v15) {
        objc_enumerationMutation(v11);
      }
      double v19 = *(void **)(*((void *)&v73 + 1) + 8 * v18);
      switch(objc_msgSend(v19, "allocationType", v68))
      {
        case 0u:
          double v17 = 0.0;
          goto LABEL_29;
        case 1u:
          [v19 capacity];
          double v17 = v28 * (double)a5 / (double)dword_1001C3AB4;
          goto LABEL_29;
        case 2u:
          if (a4)
          {
            if (v16 < 0.0)
            {
              double v29 = [(_DASBudgetModulator *)self usageTimeline];
              [(_DASBudgetModulator *)self relativeUsageAtDate:v10 withTimeline:v29];
              double v16 = v30;
            }
            log = self->_log;
            if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              double v78 = v16 * 100.0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Allocating %2.2f%% of budget based on usage", buf, 0xCu);
            }
            [v19 capacity];
            double v17 = v16 * v32;
            if ([v19 allocationType])
            {
LABEL_31:
              if (v17 != 0.0)
              {
                uint64_t v38 = self->_log;
                if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  double v78 = *(double *)&v19;
                  __int16 v79 = 2048;
                  double v80 = v17;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v38, OS_LOG_TYPE_DEFAULT, "Increment budget %@ by %10.2lf", buf, 0x16u);
                }
                [v19 incrementBy:v17];
              }
              goto LABEL_53;
            }
          }
          else
          {
            v39 = +[_CDClientContext userContext];
            double v40 = +[_CDContextQueries keyPathForBatteryLevel];
            v41 = [v39 objectForKeyedSubscript:v40];
            [v41 doubleValue];
            double v43 = v42;

            double v44 = 0.0;
            if (v43 >= *(double *)&qword_1001C28B8)
            {
              double v44 = *(double *)&qword_1001C28B0;
              if (v43 < *(double *)&qword_1001C28C0) {
                double v44 = (v43 - *(double *)&qword_1001C28B8)
              }
                    * *(double *)&qword_1001C28B0
                    / (*(double *)&qword_1001C28C0 - *(double *)&qword_1001C28B8);
            }
            [v19 capacity];
            double v17 = v44 * v45;
            __int16 v46 = self->_log;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              v47 = v46;
              v48 = [v19 name];
              *(_DWORD *)buf = v68;
              double v78 = v17;
              __int16 v79 = 2112;
              double v80 = *(double *)&v48;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Allocating %.0f budget on start for %@", buf, 0x16u);
            }
            uint64_t v15 = v72;
            if ([v19 allocationType])
            {
LABEL_41:
              v49 = self->_log;
              if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                double v78 = *(double *)&v19;
                __int16 v79 = 2048;
                double v80 = v17;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)v49, OS_LOG_TYPE_DEFAULT, "Set budget balance for %@ to %10.2lf", buf, 0x16u);
              }
              id v50 = v19;
              double v51 = v17;
LABEL_52:
              [v50 setBalance:v51];
              goto LABEL_53;
            }
          }
LABEL_44:
          [v19 balance];
          double v53 = v52;
          [v19 capacity];
          if (v53 != v54)
          {
            uint64_t v55 = [v19 lastModulatedDate];
            if (!v55
              || (v56 = (void *)v55,
                  [v19 lastModulatedDate],
                  v57 = objc_claimAutoreleasedReturnValue(),
                  [v10 timeIntervalSinceDate:v57],
                  double v59 = v58,
                  v57,
                  v56,
                  v59 >= 86400.0))
            {
              v65 = self->_log;
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                v66 = v65;
                double v67 = [v19 name];
                *(_DWORD *)buf = 138412546;
                double v78 = v67;
                __int16 v79 = 2048;
                double v80 = v17;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Set %@ balance to %10.2lf", buf, 0x16u);
              }
              [v19 capacity];
              id v50 = v19;
              goto LABEL_52;
            }
          }
          v60 = self->_log;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            v61 = v60;
            double v62 = [v19 name];
            v63 = [v19 lastModulatedDate];
            v64 = [v63 dateByAddingTimeInterval:86400.0];
            *(_DWORD *)buf = 138412546;
            double v78 = v62;
            __int16 v79 = 2112;
            double v80 = *(double *)&v64;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "%@ next refresh at %@", buf, 0x16u);

            uint64_t v15 = v72;
          }
LABEL_53:
          if ((id)++v18 != v14) {
            continue;
          }
          id v14 = [v11 countByEnumeratingWithState:&v73 objects:v83 count:16];
          if (!v14) {
            goto LABEL_55;
          }
          goto LABEL_3;
        case 3u:
          if (v16 < 0.0)
          {
            double v33 = [(_DASBudgetModulator *)self usageTimeline];
            [(_DASBudgetModulator *)self relativeUsageAtDate:v10 withTimeline:v33];
            double v16 = v34;
          }
          [v19 capacity];
          double v17 = v35 * (1.0 - v16);
          goto LABEL_29;
        case 4u:
          if (a4)
          {
            id v20 = a4;
            double v21 = [v19 widgetBudgetID];
            double v22 = 0.0;
            if (a5 >= 1)
            {
              int v24 = 1 - a5;
              int v23 = a5 + 1;
              do
              {
                double v25 = [v10 dateByAddingTimeInterval:(double)(dword_1001C3AB0 * v24)];
                [(_DASBudgetModulator *)self locked_budgetAllocationProportionAtDate:*(void *)&v25 forWidgetBudgetID:v21];
                double v16 = v26;
                double v22 = v22 + v26;
                v27 = self->_log;
                if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  double v78 = v25;
                  __int16 v79 = 2048;
                  double v80 = v16;
                  __int16 v81 = 2048;
                  double v82 = v22;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_INFO, "Relative usage at slot date %@ is %5.5f, total proportion until now is %5.5f", buf, 0x20u);
                }

                --v23;
                ++v24;
              }
              while (v23 > 1);
            }

            a4 = v20;
            id v11 = v69;
            id v14 = v71;
            uint64_t v15 = v72;
          }
          else
          {
            double v22 = 0.05;
          }
          [v19 capacity];
          double v17 = v22 * v36;
          v37 = self->_log;
          if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            double v78 = v22 * 100.0;
            __int16 v79 = 2048;
            double v80 = v17;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v37, OS_LOG_TYPE_INFO, "Allocating %5.5f%% of widget budget based on usage, resulting in a adjustment of %5.5f", buf, 0x16u);
          }
          goto LABEL_29;
        default:
LABEL_29:
          if (![v19 allocationType]) {
            goto LABEL_44;
          }
          if (a4) {
            goto LABEL_31;
          }
          goto LABEL_41;
      }
    }
  }
LABEL_55:
}

- (void)updateCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_budgets;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v13 = [v12 name:v15];
        unsigned int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          [v12 setCapacity:a3];
          goto LABEL_11;
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(_DASBudgetPersisting *)self->_persistence saveBudgets:self->_budgets];
}

- (int)computeSlotForDate:(id)a3 relativeToDate:(id)a4
{
  [a3 timeIntervalSinceDate:a4];
  if (v4 < 0.0) {
    double v4 = v4 + ceil(v4 / -86400.0) * 86400.0;
  }
  return (uint64_t)v4 / dword_1001C3AB0 % dword_1001C3AB4;
}

- (double)locked_budgetAllocationProportionAtDate:(id)a3 forWidgetBudgetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(NSMutableDictionary *)self->_predictedBudgetsForWidgets objectForKeyedSubscript:v7];

  if (!v8)
  {
LABEL_6:
    lastStartOfADayPeriodForBudgetAllocation = self->_lastStartOfADayPeriodForBudgetAllocation;
    if (lastStartOfADayPeriodForBudgetAllocation)
    {
      long long v13 = lastStartOfADayPeriodForBudgetAllocation;
      [(NSDate *)v13 timeIntervalSinceDate:v6];
      if (v14 >= -86400.0)
      {
        id v9 = v13;
      }
      else
      {
        do
        {
          id v9 = [(NSDate *)v13 dateByAddingTimeInterval:86400.0];

          [(NSDate *)v9 timeIntervalSinceDate:v6];
          long long v13 = v9;
        }
        while (v15 < -86400.0);
      }
      int v24 = [(NSMutableDictionary *)self->_lastPredictionUpdateForWidgets objectForKeyedSubscript:v7];

      if (v24) {
        [(NSMutableDictionary *)self->_lastPredictionUpdateForWidgets objectForKeyedSubscript:v7];
      }
      else {
      double v25 = [(NSDate *)v9 dateByAddingTimeInterval:0.0];
      }
      [v25 timeIntervalSinceDate:v6];
      if (-v26 <= (double)(24 * dword_1001C3AB0))
      {
        int v23 = v25;
      }
      else
      {
        do
        {
          int v23 = [v25 dateByAddingTimeInterval:];

          [v23 timeIntervalSinceDate:v6];
          double v25 = v23;
        }
        while (-v27 > (double)(24 * dword_1001C3AB0));
      }
      while (1)
      {
        [v23 timeIntervalSinceDate:v6];
        if (v29 <= 0.0) {
          break;
        }
        double v28 = v23;
        int v23 = [v23 dateByAddingTimeInterval:(double)(-24 * dword_1001C3AB0)];
      }
    }
    else
    {
      double v22 = +[NSDate now];
      id v9 = +[NSDate dateWithTimeInterval:v22 sinceDate:-5.0];

      int v23 = [(NSDate *)v9 dateByAddingTimeInterval:0.0];
    }
    double v30 = [(_DASBudgetModulator *)self usageTimelineForWidgetBudgetID:v7 withStartDate:v9];
    if ([v30 isUnavailable])
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)double v67 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Budget allocation predictions unavailable for widget %@, returning even modulation", buf, 0xCu);
      }
      double v20 = 1.0 / (double)dword_1001C3AB4;
    }
    else
    {
      double v32 = [v30 startDate];
      double v33 = [v30 valueAtDate:v32];
      [v33 doubleValue];
      double v35 = v34;

      double v36 = [v30 startDate];
      v37 = [v36 dateByAddingTimeInterval:(double)dword_1001C3AB0];

      uint64_t v38 = [v30 endDate];
      [v37 timeIntervalSinceDate:v38];
      double v40 = v39;

      id v65 = v7;
      if (v40 >= 0.0)
      {
        double v43 = v37;
      }
      else
      {
        do
        {
          v41 = [v30 valueAtDate:v37];
          [v41 doubleValue];
          double v35 = v35 + v42;

          double v43 = [v37 dateByAddingTimeInterval:(double)dword_1001C3AB0];

          double v44 = [v30 endDate];
          [v43 timeIntervalSinceDate:v44];
          double v46 = v45;

          v37 = v43;
        }
        while (v46 < 0.0);
      }
      id v47 = objc_alloc_init((Class)NSMutableArray);
      for (int i = 0; i != 24; ++i)
      {
        v49 = [v23 dateByAddingTimeInterval:(double)(dword_1001C3AB0 * i)];
        [(_DASBudgetModulator *)self budgetProportionAtDate:v49 withTimeline:v30 withNormalizer:v35];
        double v51 = v50;

        double v52 = +[NSNumber numberWithDouble:v51];
        [v47 addObject:v52];
      }
      id v7 = v65;
      [(NSMutableDictionary *)self->_predictedBudgetsForWidgets setObject:v47 forKeyedSubscript:v65];
      [(NSMutableDictionary *)self->_lastPredictionUpdateForWidgets setObject:v23 forKeyedSubscript:v65];
      objc_storeStrong((id *)&self->_lastStartOfADayPeriodForBudgetAllocation, v9);
      double v53 = self->_log;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        double v54 = (double)(24 * dword_1001C3AB0);
        uint64_t v55 = v53;
        v56 = [v23 dateByAddingTimeInterval:v54];
        *(_DWORD *)buf = 138413314;
        *(void *)double v67 = v65;
        *(_WORD *)&v67[8] = 2112;
        *(void *)&v67[10] = v23;
        *(_WORD *)&v67[18] = 2112;
        *(void *)&v67[20] = v56;
        __int16 v68 = 2112;
        id v69 = v9;
        __int16 v70 = 2112;
        id v71 = v47;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Computed fresh budget allocation predictions cache for widget %@, START: %@, END: %@, TIMELINE START: %@, PREDICTIONS: %@", buf, 0x34u);

        id v7 = v65;
      }
      unsigned int v57 = [(_DASBudgetModulator *)self computeSlotForDate:v6 relativeToDate:v23];
      unsigned int v58 = v57;
      if (v57 < 0x18)
      {
        v60 = [v47 objectAtIndexedSubscript:v57];
        [v60 doubleValue];
        double v20 = v61;
      }
      else
      {
        double v59 = self->_log;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v63 = v59;
          id v64 = [v47 count];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)double v67 = v58;
          *(_WORD *)&v67[4] = 2112;
          *(void *)&v67[6] = v6;
          *(_WORD *)&v67[14] = 2048;
          *(void *)&v67[16] = v64;
          _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "PLEASE FILE A RADAR - Requested out of bounds slot index - requestedSlot: %d, requestedDate: %@, size of predicted proportions array: %lu", buf, 0x1Cu);
        }
        double v20 = 1.0 / (double)dword_1001C3AB4;
      }
    }
    goto LABEL_42;
  }
  id v9 = [(NSMutableDictionary *)self->_lastPredictionUpdateForWidgets objectForKeyedSubscript:v7];
  int v10 = [(_DASBudgetModulator *)self computeSlotForDate:v6 relativeToDate:v9];
  if (v10 > 23)
  {
    id v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)double v67 = v7;
      *(_WORD *)&v67[8] = 2112;
      *(void *)&v67[10] = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "Cached budget allocation prediction for widget %@ too old, start at %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  int v16 = v10;
  long long v17 = [(NSMutableDictionary *)self->_predictedBudgetsForWidgets objectForKeyedSubscript:v7];
  long long v18 = [v17 objectAtIndex:v16];
  [v18 doubleValue];
  double v20 = v19;

  double v21 = self->_log;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)double v67 = v7;
    *(_WORD *)&v67[8] = 2112;
    *(void *)&v67[10] = v9;
    *(_WORD *)&v67[18] = 2048;
    *(double *)&v67[20] = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_INFO, "Cached budget allocation prediction for widget %@ available from %@ : budget proportion %f", buf, 0x20u);
  }
LABEL_42:

  return v20;
}

- (id)usageTimelineForWidgetBudgetID:(id)a3 withStartDate:(id)a4
{
  id v6 = a4;
  id v7 = +[_DKQuery predicateForEventsWithStringValue:a3];
  id v8 = +[_DKEventStream eventStreamWithName:kDASWidgetViewStreamName];
  id v9 = +[_DKPredictionQuery predictionQueryForStream:v8 withPredicate:v7 withPredictionType:0];

  [v9 setAsOfDate:v6];
  [v9 setSlotDuration:dword_1001C3AB0];
  store = self->_store;
  id v15 = 0;
  id v11 = [(_DKKnowledgeStore *)store executeQuery:v9 error:&v15];
  id v12 = v15;
  log = self->_log;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000F2F8C((uint64_t)v9, (uint64_t)v12, (os_log_t)log);
    }
  }
  else if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F2F14((uint64_t)v11, log);
  }

  return v11;
}

- (double)budgetProportionAtDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  [(_DASBudgetModulator *)self gaussianKDEatDate:v9 withTimeline:v8 withNormalizer:a5];
  double v11 = v10;
  id v12 = [v9 dateByAddingTimeInterval:(double)dword_1001C3AB0];

  [(_DASBudgetModulator *)self gaussianKDEatDate:v12 withTimeline:v8 withNormalizer:a5];
  double v14 = v13;

  [(_DASBudgetModulator *)self areaUnderTrapeziodWithFirstValue:v11 andSecondValue:v14];
  return result;
}

- (double)gaussianKDEatDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [v9 startDate];
  unsigned int v11 = [(_DASBudgetModulator *)self computeSlotForDate:v8 relativeToDate:v10];

  unsigned int v12 = dword_1001C3AB4;
  double v13 = 0.0;
  if (dword_1001C3AB4 >= 2)
  {
    signed int v14 = -(dword_1001C3AB4 >> 1);
    double v15 = 0.0;
    do
    {
      unsigned int v16 = (v11 + v14) % v12;
      unsigned int v17 = v11 + v12 + v14;
      if ((int)(v11 + v14) >= 0) {
        unsigned int v17 = v16;
      }
      double v18 = (double)(int)(dword_1001C3AB0 * v17);
      double v19 = [v9 startDate];
      double v20 = +[NSDate dateWithTimeInterval:v19 sinceDate:v18];

      double v21 = [v9 valueAtDate:v20];
      [v21 doubleValue];
      double v23 = v22 / a5;

      double v15 = v15 + v23 * pow(0.980198673, (double)(v14 * v14));
      ++v14;
      unsigned int v12 = dword_1001C3AB4;
    }
    while (v14 < (int)(dword_1001C3AB4 >> 1));
    double v13 = v15 * 0.0797884561;
  }

  return v13;
}

- (double)areaUnderTrapeziodWithFirstValue:(double)a3 andSecondValue:(double)a4
{
  if (a3 >= a4) {
    double v4 = a4;
  }
  else {
    double v4 = a3;
  }
  double v5 = a4 - a3;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  return v4 + v5 * 0.5;
}

- (_DASBudgetPersisting)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)lastModulationDate
{
  return self->_lastModulationDate;
}

- (void)setLastModulationDate:(id)a3
{
}

- (NSDate)lastUsageTimelineUpdate
{
  return self->_lastUsageTimelineUpdate;
}

- (void)setLastUsageTimelineUpdate:(id)a3
{
}

- (NSArray)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (_DKKnowledgeStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (_DKPredictionTimeline)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
}

- (NSDate)lastStartOfADayPeriodForBudgetAllocation
{
  return self->_lastStartOfADayPeriodForBudgetAllocation;
}

- (void)setLastStartOfADayPeriodForBudgetAllocation:(id)a3
{
}

- (NSMutableDictionary)lastPredictionUpdateForWidgets
{
  return self->_lastPredictionUpdateForWidgets;
}

- (void)setLastPredictionUpdateForWidgets:(id)a3
{
}

- (NSMutableDictionary)predictedBudgetsForWidgets
{
  return self->_predictedBudgetsForWidgets;
}

- (void)setPredictedBudgetsForWidgets:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_predictedBudgetsForWidgets, 0);
  objc_storeStrong((id *)&self->_lastPredictionUpdateForWidgets, 0);
  objc_storeStrong((id *)&self->_lastStartOfADayPeriodForBudgetAllocation, 0);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_budgets, 0);
  objc_storeStrong((id *)&self->_lastUsageTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_lastModulationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_persistence, 0);
}

@end