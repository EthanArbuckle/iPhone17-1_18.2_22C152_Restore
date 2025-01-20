@interface RESessionRelevanceProviderManager
+ (BOOL)_supportsHistoricProviders;
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (BOOL)_isHistoricProvider:(id)a3;
- (NSDate)lastUpdateDate;
- (float)_relevanceForProvider:(id)a3;
- (void)_handleSignificantTimeChange;
- (void)_prepareForUpdate;
- (void)_scheduleUpdatesForSessionProvider:(id)a3;
- (void)pause;
- (void)resume;
@end

@implementation RESessionRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature sessionFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (float)_relevanceForProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 startDate];
  if (v5)
  {

    goto LABEL_4;
  }
  v6 = [v4 endDate];

  if (v6)
  {
LABEL_4:
    v7 = [v4 startDate];
    if (v7)
    {
    }
    else
    {
      v16 = [v4 endDate];

      if (v16)
      {
        v14 = [v4 endDate];
        v17 = [v14 earlierDate:self->_lastDateUpdate];
        goto LABEL_15;
      }
    }
    uint64_t v8 = [v4 startDate];
    if (!v8
      || (v9 = (void *)v8,
          [v4 endDate],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      id v11 = objc_alloc(MEMORY[0x263F08798]);
      v12 = [v4 startDate];
      v13 = [v4 endDate];
      v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];

      if ([v14 containsDate:self->_lastDateUpdate]) {
        float v15 = 1.0;
      }
      else {
        float v15 = 0.0;
      }
LABEL_19:

      goto LABEL_20;
    }
    v14 = [v4 startDate];
    v17 = [v14 laterDate:self->_lastDateUpdate];
LABEL_15:
    if (v17 == self->_lastDateUpdate) {
      float v15 = 1.0;
    }
    else {
      float v15 = 0.0;
    }

    goto LABEL_19;
  }
  float v15 = 1.0;
LABEL_20:

  return v15;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  return [a3 isHistoric];
}

- (void)_scheduleUpdatesForSessionProvider:(id)a3
{
  id v10 = a3;
  id v4 = [v10 startDate];

  if (v4)
  {
    v5 = [v10 startDate];
    v6 = +[RERelevanceProviderManagerUpdate scheduledUpdateForProvider:v10 atDate:v5];
    [(RERelevanceProviderManager *)self _scheduleUpdate:v6];
  }
  v7 = [v10 endDate];

  if (v7)
  {
    uint64_t v8 = [v10 endDate];
    v9 = +[RERelevanceProviderManagerUpdate scheduledUpdateForProvider:v10 atDate:v8];
    [(RERelevanceProviderManager *)self _scheduleUpdate:v9];
  }
}

- (void)_prepareForUpdate
{
  v3 = [MEMORY[0x263EFF910] date];
  lastDateUpdate = self->_lastDateUpdate;
  self->_lastDateUpdate = v3;
  MEMORY[0x270F9A758](v3, lastDateUpdate);
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
  v4[2] = __65__RESessionRelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  v4[3] = &unk_2644BC7D8;
  v4[4] = self;
  [(RERelevanceProviderManager *)self _enumerateProviders:v4];
  v3 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v3];
}

uint64_t __65__RESessionRelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleUpdatesForSessionProvider:a2];
}

- (NSDate)lastUpdateDate
{
  return self->_lastDateUpdate;
}

- (void).cxx_destruct
{
}

@end