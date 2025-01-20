@interface REDateRelevanceProviderManager
+ (BOOL)_supportsHistoricProviders;
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_dependencyClasses;
+ (id)_features;
- (BOOL)_isHistoricProvider:(id)a3;
- (NSDate)lastDateUpdate;
- (NSDate)todayEnd;
- (NSDate)todayStart;
- (id)_valueForHistoricProvider:(id)a3 feature:(id)a4;
- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (void)_handleSignificantTimeChange;
- (void)_prepareForUpdate;
- (void)_scheduleUpdateForDate:(id)a3;
- (void)_scheduleUpdatesForDateProvider:(id)a3;
- (void)pause;
- (void)resume;
@end

@implementation REDateRelevanceProviderManager

+ (id)_features
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = +[REFeature dateFeature];
  v3 = +[REFeature dateInformationalFeature];
  v7[1] = v3;
  v4 = +[REFeature dateOccursTodayFeature];
  v7[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return v5;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)_dependencyClasses
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  return [(REDateRelevanceProviderManager *)self _valueForProvider:a3 context:0 feature:a4];
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  v11 = [a4 attributeForKey:@"RETrainingContextDateKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x263F08798]);
      v13 = REStartOfDayForDate(v11);
      v14 = REEndOfDayForDate(v11);
      v15 = (NSDateInterval *)[v12 initWithStartDate:v13 endDate:v14];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v11 = self->_lastDateUpdate;
  v15 = self->_todayInterval;
LABEL_6:
  v16 = +[REFeature dateOccursTodayFeature];
  int v17 = [v9 isEqual:v16];

  if (v17)
  {
    v18 = [v10 interval];
    v19 = [v18 intersectionWithDateInterval:v15];
    BOOL v20 = v19 != 0;

    uint64_t v21 = +[REFeatureValue featureValueWithBool:v20];
LABEL_15:
    v25 = (void *)v21;
    goto LABEL_24;
  }
  v22 = +[REFeature dateFeature];
  if ([v9 isEqual:v22] && objc_msgSend(v10, "priority") != 1)
  {

    goto LABEL_17;
  }
  v23 = +[REFeature dateInformationalFeature];
  if (([v9 isEqual:v23] & 1) == 0)
  {

    goto LABEL_14;
  }
  uint64_t v24 = [v10 priority];

  if (v24 != 1)
  {
LABEL_14:
    uint64_t v21 = +[REFeatureValue featureValueWithDouble:0.0];
    goto LABEL_15;
  }
LABEL_17:
  v26 = [v10 initialRelevanceDate];
  v27 = [v10 interval];
  v28 = [v27 endDate];

  float v29 = 0.0;
  if (v26)
  {
    if (v28)
    {
      v30 = [v26 laterDate:v28];

      if (v30 == v28)
      {
        v31 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v26 endDate:v28];
        if ([v31 containsDate:v11])
        {
          v32 = [v10 interval];
          v33 = [v32 startDate];
          float v29 = REPercentBetweenDates(v11, v33);
        }
      }
    }
  }
  v25 = +[REFeatureValue featureValueWithDouble:v29];

LABEL_24:
  return v25;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  v4 = [a3 irrelevantDate];
  LOBYTE(self) = [v4 compare:self->_lastDateUpdate] == -1;

  return (char)self;
}

- (id)_valueForHistoricProvider:(id)a3 feature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 irrelevantDate];
  id v10 = [v8 interval];
  v11 = [v10 endDate];

  [v8 recentDuration];
  v37 = v11;
  id v12 = objc_msgSend(v11, "dateByAddingTimeInterval:");
  v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v12];
  v14 = +[REFeature dateFeature];
  v15 = v7;
  if ([v7 isEqual:v14])
  {
  }
  else
  {
    +[REFeature dateInformationalFeature];
    int v17 = v16 = v9;
    int v18 = [v7 isEqual:v17];

    id v9 = v16;
    if (!v18)
    {
      v32 = [v13 intersectionWithDateInterval:self->_todayInterval];
      BOOL v33 = v32 != 0;

      uint64_t v31 = +[REFeatureValue featureValueWithBool:v33];
      goto LABEL_8;
    }
  }
  int v19 = [v13 containsDate:self->_lastDateUpdate];
  double v20 = 0.0;
  if (v19)
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF8F0], "currentCalendar", 0.0);
    [v8 interval];
    id v36 = v7;
    v23 = v22 = v9;
    uint64_t v24 = [v23 startDate];
    [v21 dateByAddingUnit:16 value:1 toDate:v24 options:0];
    v25 = v13;
    v26 = v12;
    v28 = v27 = self;

    id v9 = v22;
    v15 = v36;

    lastDateUpdate = v27->_lastDateUpdate;
    id v12 = v26;
    v13 = v25;
    float v30 = 1.0 - REPercentBetweenDates(lastDateUpdate, v28);

    double v20 = v30;
  }
  uint64_t v31 = +[REFeatureValue featureValueWithDouble:v20];
LABEL_8:
  v34 = (void *)v31;

  return v34;
}

- (void)_scheduleUpdatesForDateProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 interval];
  id v6 = [v5 startDate];
  [(REDateRelevanceProviderManager *)self _scheduleUpdateForDate:v6];

  id v7 = [v4 interval];
  id v8 = [v7 endDate];
  [(REDateRelevanceProviderManager *)self _scheduleUpdateForDate:v8];

  id v9 = [v4 irrelevantDate];
  [(REDateRelevanceProviderManager *)self _scheduleUpdateForDate:v9];

  id v10 = [v4 initialRelevanceDate];
  [(REDateRelevanceProviderManager *)self _scheduleUpdateForDate:v10];

  v11 = [v4 interval];
  id v12 = [v11 endDate];
  [v4 recentDuration];
  v13 = objc_msgSend(v12, "dateByAddingTimeInterval:");

  [(REDateRelevanceProviderManager *)self _scheduleUpdateForDate:v13];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__REDateRelevanceProviderManager__scheduleUpdatesForDateProvider___block_invoke;
  v15[3] = &unk_2644BC7B0;
  id v16 = v4;
  int v17 = self;
  id v14 = v4;
  [(RERelevanceProviderManager *)self enumerateInflectionFeatureValues:v15];
}

void __66__REDateRelevanceProviderManager__scheduleUpdatesForDateProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = a2;
  id v6 = +[REFeature dateFeature];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v12 type];

    if (v8 != 2) {
      goto LABEL_5;
    }
    id v9 = [*(id *)(a1 + 32) interval];
    id v10 = [v9 startDate];
    [v12 doubleValue];
    *(float *)&double v11 = v11;
    id v6 = REDateFromPercentFromDate(v10, *(float *)&v11);

    [*(id *)(a1 + 40) _scheduleUpdateForDate:v6];
  }

LABEL_5:
}

- (void)_scheduleUpdateForDate:(id)a3
{
  id v4 = +[RERelevanceProviderManagerUpdate scheduledUpdateForAllProvidersAtDate:a3];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v4];
}

- (void)_prepareForUpdate
{
  v3 = [MEMORY[0x263EFF910] date];
  lastDateUpdate = self->_lastDateUpdate;
  self->_lastDateUpdate = v3;

  id v5 = objc_alloc(MEMORY[0x263F08798]);
  REStartOfDayForDate(self->_lastDateUpdate);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = REEndOfDayForDate(self->_lastDateUpdate);
  int v7 = (NSDateInterval *)[v5 initWithStartDate:v9 endDate:v6];
  todayInterval = self->_todayInterval;
  self->_todayInterval = v7;
}

- (void)resume
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = RESignificantTimeChangeNotification();
  [v4 addObserver:self selector:sel__handleSignificantTimeChange name:v3 object:0];
}

- (void)pause
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = RESignificantTimeChangeNotification();
  [v4 removeObserver:self name:v3 object:0];
}

- (void)_handleSignificantTimeChange
{
  [(RERelevanceProviderManager *)self _removeAllPendingUpdates];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__REDateRelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  v4[3] = &unk_2644BC7D8;
  v4[4] = self;
  [(RERelevanceProviderManager *)self _enumerateProviders:v4];
  v3 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v3];
}

uint64_t __62__REDateRelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleUpdatesForDateProvider:a2];
}

- (NSDate)lastDateUpdate
{
  return self->_lastDateUpdate;
}

- (NSDate)todayStart
{
  return [(NSDateInterval *)self->_todayInterval startDate];
}

- (NSDate)todayEnd
{
  return [(NSDateInterval *)self->_todayInterval endDate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayInterval, 0);
  objc_storeStrong((id *)&self->_lastDateUpdate, 0);
}

@end