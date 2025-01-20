@interface TPSAnalyticsHistoricTipsDataProcessor
- (BOOL)_shouldProceedWithCrunching;
- (TPSAnalyticsHistoricTipsDataProcessor)init;
- (id)_furthestLookbackDate;
- (unint64_t)_daysBetweenDate:(id)a3 andOtherDate:(id)a4;
- (void)processAnalytics:(id)a3;
- (void)resetAnalytics;
- (void)updateDisplayedCount:(int64_t *)a3 andFrequencyControlCount:(int64_t *)a4 forTipStatus:(id)a5 andLookbackDate:(id)a6;
@end

@implementation TPSAnalyticsHistoricTipsDataProcessor

- (TPSAnalyticsHistoricTipsDataProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsHistoricTipsDataProcessor;
  v2 = [(TPSAnalyticsProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    currentDate = v2->_currentDate;
    v2->_currentDate = (NSDate *)v3;
  }
  return v2;
}

- (void)processAnalytics:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  if (![(TPSAnalyticsHistoricTipsDataProcessor *)self _shouldProceedWithCrunching]) {
    goto LABEL_37;
  }
  [(TPSAnalyticsProcessor *)self setDateLastRun:self->_currentDate];
  v5 = [(TPSAnalyticsHistoricTipsDataProcessor *)self _furthestLookbackDate];
  objc_super v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  v7 = [(TPSAnalyticsProcessor *)self dataSource];
  v8 = [v7 allTipStatus];

  v55 = v8;
  if (![v8 count]) {
    goto LABEL_16;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v66;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v66 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      if ([v14 displayType] == 2)
      {
        v15 = &v72;
        v16 = &v71;
      }
      else
      {
        if ([v14 displayType] != 1) {
          continue;
        }
        v15 = &v70;
        v16 = &v69;
      }
      [(TPSAnalyticsHistoricTipsDataProcessor *)self updateDisplayedCount:v15 andFrequencyControlCount:v16 forTipStatus:v14 andLookbackDate:v5];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v65 objects:v79 count:16];
  }
  while (v11);
LABEL_15:

  id v17 = objc_alloc(MEMORY[0x1E4FAF388]);
  uint64_t v18 = *MEMORY[0x1E4FAF588];
  v19 = [NSNumber numberWithInteger:v72];
  v20 = [NSNumber numberWithInteger:v71];
  v21 = (void *)[v17 initWithDisplayType:v18 displayCount:v19 notDisplayedDueToFrequencyControlCount:v20];

  [v6 addObject:v21];
  id v22 = objc_alloc(MEMORY[0x1E4FAF388]);
  uint64_t v23 = *MEMORY[0x1E4FAF580];
  v24 = [NSNumber numberWithInteger:v70];
  [NSNumber numberWithInteger:v69];
  v26 = v25 = v6;
  v27 = (void *)[v22 initWithDisplayType:v23 displayCount:v24 notDisplayedDueToFrequencyControlCount:v26];

  objc_super v6 = v25;
  [v25 addObject:v27];

  v8 = v55;
LABEL_16:
  v28 = [MEMORY[0x1E4FAF480] analytics];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v76 = v72;
    __int16 v77 = 2048;
    uint64_t v78 = v70;
    _os_log_impl(&dword_1E4492000, v28, OS_LOG_TYPE_INFO, "countDisplayedEmbeeded: %ld countDisplayedOnLockScreen: %ld", buf, 0x16u);
  }

  if (!(v72 | v70))
  {
    v52 = v6;
    v29 = [MEMORY[0x1E4F1CA80] set];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v30 = [(TPSAnalyticsProcessor *)self dataSource];
    v31 = [v30 allContextualInfo];

    uint64_t v32 = [v31 countByEnumeratingWithState:&v61 objects:v74 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v62 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v61 + 1) + 8 * j);
          v37 = [v36 triggerEventIdentifiers];
          [v29 addObjectsFromArray:v37];

          v38 = [v36 desiredOutcomeEventIdentifiers];
          [v29 addObjectsFromArray:v38];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v61 objects:v74 count:16];
      }
      while (v33);
    }
    v39 = self;
    v53 = v5;
    v54 = v4;

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = v29;
    uint64_t v40 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v58;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = *(void *)(*((void *)&v57 + 1) + 8 * k);
          v45 = [(TPSAnalyticsProcessor *)v39 dataSource];
          v46 = [v45 contextualEventForIdentifier:v44];

          unsigned int v47 = [v46 currentObservationCount];
          v48 = (void *)MEMORY[0x1E4FAF3B0];
          v49 = [NSNumber numberWithUnsignedInteger:v47];
          v50 = [v48 eventWithEventID:v44 eventCount:v49];
          [v50 log];
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
      }
      while (v41);
    }

    v5 = v53;
    v4 = v54;
    objc_super v6 = v52;
    v8 = v55;
  }
  if ([v6 count])
  {
    v51 = [MEMORY[0x1E4FAF380] sharedInstance];
    [v51 logAnalyticsEvents:v6];
  }
LABEL_37:
  v4[2](v4);
}

- (void)resetAnalytics
{
  v3.receiver = self;
  v3.super_class = (Class)TPSAnalyticsHistoricTipsDataProcessor;
  [(TPSAnalyticsProcessor *)&v3 resetAnalytics];
  [(TPSAnalyticsProcessor *)self setDateLastRun:0];
}

- (void)updateDisplayedCount:(int64_t *)a3 andFrequencyControlCount:(int64_t *)a4 forTipStatus:(id)a5 andLookbackDate:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (([v9 overrideHoldout] & 1) == 0)
  {
    uint64_t v11 = [v9 hintDisplayedDates];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = [v12 compare:v10];

    if (v13 == 1) {
      ++*a3;
    }
    v14 = [v9 hintNotDisplayedDueToFrequencyControlDates];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v16 = objc_msgSend(v9, "hintNotDisplayedDueToFrequencyControlDates", 0);
      id v17 = [v16 reverseObjectEnumerator];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v23;
LABEL_7:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          if ([*(id *)(*((void *)&v22 + 1) + 8 * v21) compare:v10] != 1) {
            break;
          }
          ++*a4;
          if (v19 == ++v21)
          {
            uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v19) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
    }
  }
}

- (unint64_t)_daysBetweenDate:(id)a3 andOtherDate:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 currentCalendar];
  id v9 = [v8 components:120 fromDate:v7 toDate:v6 options:0];

  unint64_t v10 = [v9 day];
  return v10;
}

- (BOOL)_shouldProceedWithCrunching
{
  uint64_t v3 = [MEMORY[0x1E4FAF450] crunchingIntervalInDays];
  if (!v3) {
    return 1;
  }
  unint64_t v4 = v3;
  v5 = [(TPSAnalyticsProcessor *)self dateLastRun];
  if (v5)
  {
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v4 = 20;
    }
    BOOL v6 = [(TPSAnalyticsHistoricTipsDataProcessor *)self _daysBetweenDate:v5 andOtherDate:self->_currentDate] >= v4;
  }
  else
  {
    [(TPSAnalyticsProcessor *)self setDateLastRun:self->_currentDate];
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_furthestLookbackDate
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v3 setDay:-20];
  unint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [v4 dateByAddingComponents:v3 toDate:self->_currentDate options:0];

  return v5;
}

- (void).cxx_destruct
{
}

@end