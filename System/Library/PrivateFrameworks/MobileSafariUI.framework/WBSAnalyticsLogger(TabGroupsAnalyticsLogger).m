@interface WBSAnalyticsLogger(TabGroupsAnalyticsLogger)
- (void)_performSyncSuccessesCountReport;
- (void)_performTabGroupsReport;
- (void)_performTabsForNonTabGroupUserReport;
- (void)_tabGroupsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime;
- (void)schedulePeriodicTabGroupsReport;
@end

@implementation WBSAnalyticsLogger(TabGroupsAnalyticsLogger)

- (void)_tabGroupsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setDouble:@"LastPeriodicTabGroupsReportTime" forKey:CFAbsoluteTimeGetCurrent()];
}

- (void)_performTabGroupsReport
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v0 = +[Application sharedApplication];
  v1 = [v0 tabGroupManager];
  v2 = [v1 allNamedTabGroupsUnsorted];

  v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  uint64_t v4 = [v2 count];
  if (v4)
  {
    unint64_t v5 = v4;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v21 = v3;
      v22 = v2;
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "tabs", v21, v22, (void)v23);
          uint64_t v15 = [v14 count];

          v16 = [v13 tabs];
          if ([v16 count] > v10)
          {
            v17 = [v13 tabs];
            unint64_t v10 = [v17 count];
          }
          v9 += v15;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
      double v18 = (double)v9;
      v3 = v21;
      v2 = v22;
    }
    else
    {
      unint64_t v10 = 0;
      double v18 = 0.0;
    }

    [v3 reportAverageNumberOfTabsPerTabGroup:llround(v18 / (double)v5) andMaximum:v10];
    [v3 reportNumberOfTabGroups:v5];
  }
  else
  {
    v19 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v19 reportAverageNumberOfTabsPerTabGroup:0 andMaximum:0];

    v20 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v20 reportNumberOfTabGroups:0];
  }
}

- (void)_performTabsForNonTabGroupUserReport
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v0 = +[Application sharedApplication];
  v1 = [v0 tabGroupManager];
  v2 = [v1 allNamedTabGroupsUnsorted];

  if (![v2 count])
  {
    v3 = +[Application sharedApplication];
    uint64_t v4 = [v3 browserControllers];

    unint64_t v5 = [v4 count];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = v4;
    uint64_t v29 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v29)
    {
      unint64_t v25 = v5;
      long long v26 = v2;
      unint64_t v8 = 0;
      obuint64_t j = v7;
      uint64_t v28 = *(void *)v35;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = [*(id *)(*((void *)&v34 + 1) + 8 * i) tabController];
          v12 = [v11 currentTabs];

          uint64_t v13 = [v12 count];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v31 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = (void *)MEMORY[0x1E4F1C9C8];
                [*(id *)(*((void *)&v30 + 1) + 8 * j) lastActivationTime];
                v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
                [v6 timeIntervalSinceDate:v20];
                double v9 = v9 + v21;
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v16);
          }
          v8 += v13;
        }
        id v7 = obj;
        uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v29);

      if (v8)
      {
        double v22 = (double)v8;
        unint64_t v23 = llround(v9 / 60.0 / 60.0 / 24.0 / (double)v8);
      }
      else
      {
        unint64_t v23 = 0;
        double v22 = 0.0;
      }
      unint64_t v5 = v25;
      v2 = v26;
      if (!v25) {
        goto LABEL_23;
      }
    }
    else
    {

      unint64_t v23 = 0;
      double v22 = 0.0;
      if (!v5) {
        goto LABEL_23;
      }
    }
    double v22 = v22 / (double)v5;
    unint64_t v5 = llround(v22);
LABEL_23:
    long long v24 = objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", v22);
    [v24 reportTabsForNonTabGroupUser:v23 andAverageNumber:v5];
  }
}

- (void)_performSyncSuccessesCountReport
{
  id v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v1 = *MEMORY[0x1E4F99398];
  v2 = objc_msgSend(v0, "safari_numberForKey:", *MEMORY[0x1E4F99398]);
  id v5 = (id)[v2 copy];

  if (v5)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 setInteger:0 forKey:v1];

    uint64_t v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v4 reportTabGroupSyncSuccessesWithCount:v5];
  }
}

- (void)schedulePeriodicTabGroupsReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WBSAnalyticsLogger_TabGroupsAnalyticsLogger__schedulePeriodicTabGroupsReport__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E4F14428], block);
}

@end