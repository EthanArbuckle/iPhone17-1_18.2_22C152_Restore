@interface RERecentActionRelevanceProviderManager
+ (BOOL)_supportsHistoricProviders;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (BOOL)_isHistoricProvider:(id)a3;
- (RERecentActionRelevanceProviderManager)initWithQueue:(id)a3;
- (float)_relevanceForHistoricProvider:(id)a3;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (void)_addedProvider:(id)a3;
- (void)_handleActionPerformedNotifiction:(id)a3;
- (void)_handleSignificantTimeChange;
- (void)_prepareForUpdate;
- (void)_removeProvider:(id)a3;
- (void)_scheduleUpdatesForActionProvider:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)resume;
@end

@implementation RERecentActionRelevanceProviderManager

+ (id)_features
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = +[REFeature recentSiriActionFeature];
  v6[0] = v2;
  v3 = +[REFeature siriActionPerformedCountFeature];
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (RERecentActionRelevanceProviderManager)initWithQueue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RERecentActionRelevanceProviderManager;
  v3 = [(RERelevanceProviderManager *)&v8 initWithQueue:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__handleActionPerformedNotifiction_ name:@"RERecentActionManagerDidUpdateAction" object:0];

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    relevanceProviderMap = v3->_relevanceProviderMap;
    v3->_relevanceProviderMap = (NSMutableDictionary *)v5;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RERecentActionRelevanceProviderManager;
  [(RERelevanceProviderManager *)&v4 dealloc];
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[REFeature recentSiriActionFeature];
  int v8 = [v6 isEqual:v7];

  v9 = +[RESingleton sharedInstance];
  v10 = [v5 recentAction];
  if (v8)
  {
    v11 = [v9 lastPerformedDateForAction:v10];

    if (v11)
    {
      v12 = [MEMORY[0x263EFF910] date];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;
      [v11 timeIntervalSinceReferenceDate];
      double v16 = v15;
      [v11 timeIntervalSinceReferenceDate];
      *(float *)&double v14 = REPercentThroughRange(v14, v16, v17 + 21600.0);

      double v18 = *(float *)&v14;
    }
    else
    {
      double v18 = 0.0;
    }
    v20 = +[REFeatureValue featureValueWithDouble:v18];
  }
  else
  {
    uint64_t v19 = [v9 actionNumberOfTimesPeformedToday:v10];

    v20 = +[REFeatureValue featureValueWithInt64:v19];
  }

  return v20;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[RESingleton sharedInstance];
  id v5 = [v3 recentAction];
  int v6 = [v4 actionWasPerformedLocally:v5];

  if (v6)
  {
    v7 = +[RESingleton sharedInstance];
    int v8 = [v3 recentAction];
    v9 = [v7 lastPerformedDateForAction:v8];

    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 duration:900.0];
      v11 = [MEMORY[0x263EFF910] date];
      char v12 = [v10 containsDate:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (float)_relevanceForHistoricProvider:(id)a3
{
  id v4 = a3;
  id v5 = +[RESingleton sharedInstance];
  int v6 = [v4 recentAction];

  v7 = [v5 lastPerformedDateForAction:v6];

  if (v7)
  {
    int v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    v9 = [v8 dateByAddingUnit:16 value:1 toDate:v7 options:0];

    float v10 = 1.0 - REPercentBetweenDates(self->_lastDateUpdate, v9);
  }
  else
  {
    float v10 = 1.0;
  }

  return v10;
}

- (void)_handleActionPerformedNotifiction:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"RERecentActionManagerUpdatedActionKey"];

  id v5 = (void *)v8;
  if (v8)
  {
    int v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_relevanceProviderMap, "objectForKeyedSubscript:");
    if (v6)
    {
      v7 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
      [(RERelevanceProviderManager *)self _scheduleUpdate:v7];

      [(RERecentActionRelevanceProviderManager *)self _scheduleUpdatesForActionProvider:v6];
    }

    id v5 = (void *)v8;
  }
}

- (void)_addedProvider:(id)a3
{
  id v4 = a3;
  [(RERecentActionRelevanceProviderManager *)self _scheduleUpdatesForActionProvider:v4];
  relevanceProviderMap = self->_relevanceProviderMap;
  id v6 = [v4 recentAction];
  [(NSMutableDictionary *)relevanceProviderMap setObject:v4 forKeyedSubscript:v6];
}

- (void)_removeProvider:(id)a3
{
  relevanceProviderMap = self->_relevanceProviderMap;
  id v4 = [a3 recentAction];
  [(NSMutableDictionary *)relevanceProviderMap setObject:0 forKeyedSubscript:v4];
}

- (void)_scheduleUpdatesForActionProvider:(id)a3
{
  id v15 = a3;
  id v4 = +[RESingleton sharedInstance];
  id v5 = [v15 recentAction];
  id v6 = [v4 lastPerformedDateForAction:v5];

  if (v6)
  {
    v7 = [v6 dateByAddingTimeInterval:900.0];
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    v9 = [v8 laterDate:v7];
    char v10 = [v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      v11 = +[RERelevanceProviderManagerUpdate scheduledUpdateForAllProvidersAtDate:v7];
      [(RERelevanceProviderManager *)self _scheduleUpdate:v11];

      for (unint64_t i = 1; i != 13; ++i)
      {
        double v13 = [v6 dateByAddingTimeInterval:(double)i * 1800.0];
        double v14 = +[RERelevanceProviderManagerUpdate scheduledUpdateForProvider:v15 atDate:v13];
        [(RERelevanceProviderManager *)self _scheduleUpdate:v14];
      }
    }
  }
}

- (void)resume
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id v3 = RESignificantTimeChangeNotification();
  [v4 addObserver:self selector:sel__handleSignificantTimeChange name:v3 object:0];
}

- (void)pause
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id v3 = RESignificantTimeChangeNotification();
  [v4 removeObserver:self name:v3 object:0];
}

- (void)_handleSignificantTimeChange
{
  [(RERelevanceProviderManager *)self _removeAllPendingUpdates];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__RERecentActionRelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  v4[3] = &unk_2644BC7D8;
  v4[4] = self;
  [(RERelevanceProviderManager *)self _enumerateProviders:v4];
  id v3 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v3];
}

uint64_t __70__RERecentActionRelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleUpdatesForActionProvider:a2];
}

- (void)_prepareForUpdate
{
  id v3 = [MEMORY[0x263EFF910] date];
  lastDateUpdate = self->_lastDateUpdate;
  self->_lastDateUpdate = v3;
  MEMORY[0x270F9A758](v3, lastDateUpdate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDateUpdate, 0);
  objc_storeStrong((id *)&self->_relevanceProviderMap, 0);
}

@end