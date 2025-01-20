@interface HDMHTypicalDayProvider
- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6;
- (HDMHTypicalDayProvider)initWithProfile:(id)a3;
- (HDMHTypicalDayProvider)initWithProfile:(id)a3 userDefaults:(id)a4 fitnessActivityModel:(id)a5;
- (id)_defaultEndOfDayDateComponents;
- (id)_defaultStartOfDayDateComponents;
- (id)_typicalDayIntervalFromToday;
- (id)clientProvidedDefaultEndOfDay;
- (id)currentCalendar;
- (id)currentDate;
- (id)firstOnWristDateToday;
- (id)userEndOfDay;
- (id)userStartOfDay;
- (void)_updateObservers;
- (void)_updateTypicalDayMarkers;
- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6;
- (void)rebuildTypicalDayProviderForCurrentDate;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setupCachedTypicalDayMarkers;
- (void)typicalDayActivityModelDidUpdate;
@end

@implementation HDMHTypicalDayProvider

- (HDMHTypicalDayProvider)initWithProfile:(id)a3
{
  return [(HDMHTypicalDayProvider *)self initWithProfile:a3 userDefaults:0 fitnessActivityModel:0];
}

- (HDMHTypicalDayProvider)initWithProfile:(id)a3 userDefaults:(id)a4 fitnessActivityModel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDMHTypicalDayProvider;
  v12 = [(HDMHTypicalDayProvider *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profile, a3);
    if (v10)
    {
      v14 = (NSUserDefaults *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x263EFFA40], "hkmh_mentalHealthDefaults");
      v14 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
    }
    userDefaults = v13->_userDefaults;
    v13->_userDefaults = v14;

    objc_storeStrong((id *)&v13->_lock_typicalDayModel, a5);
    [(HDMHTypicalDayProvider *)v13 setupCachedTypicalDayMarkers];
    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [objc_alloc(MEMORY[0x263F432D8]) initWithProfile:v13->_profile debugIdentifier:@"FITypicalDayActivityModelOperation" delegate:v13];
    operation = v13->_operation;
    v13->_operation = (HDProtectedDataOperation *)v16;

    id v18 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v19 = [v18 initWithName:@"HKMHTypicalDayProviderObservers" loggingCategory:*MEMORY[0x263F09938]];
    observers = v13->_observers;
    v13->_observers = (HKObserverSet *)v19;
  }
  return v13;
}

- (id)_typicalDayIntervalFromToday
{
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [(HDMHTypicalDayProvider *)self currentDate];
  v5 = [v3 startOfDayForDate:v4];

  v6 = objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", *MEMORY[0x263F3D158], v5);
  v7 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v6 endDate:v5];

  return v7;
}

- (void)rebuildTypicalDayProviderForCurrentDate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_255F2E000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error requesting protected data operation work: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)setupCachedTypicalDayMarkers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"TypicalDayProviderCacheLastUpdatedDate"];
  if (v3)
  {
    v4 = [MEMORY[0x263EFF910] now];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    if (v6 > 604800.0 || v6 < 0.0)
    {
      [(NSUserDefaults *)self->_userDefaults setObject:0 forKey:@"TypicalDayProviderUserStartOfDayCache"];
      [(NSUserDefaults *)self->_userDefaults setObject:0 forKey:@"TypicalDayProviderUserEndOfDayCache"];
      [(NSUserDefaults *)self->_userDefaults setObject:0 forKey:@"TypicalDayProviderCacheLastUpdatedDate"];
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      id v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"TypicalDayProviderUserStartOfDayCache"];
      lock_cachedTypicalStartOfDay = self->_lock_cachedTypicalStartOfDay;
      self->_lock_cachedTypicalStartOfDay = v7;

      uint64_t v9 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"TypicalDayProviderUserEndOfDayCache"];
      lock_cachedTypicalEndOfDay = self->_lock_cachedTypicalEndOfDay;
      self->_lock_cachedTypicalEndOfDay = v9;

      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v13 = v15;
      _os_log_impl(&dword_255F2E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got nil date from user defaults for _TypicalDayProviderCacheLastUpdatedDate. Not updating day markers.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_updateTypicalDayMarkers
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_typicalDayModel;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    _HKInitializeLogging();
    double v5 = (os_log_t *)MEMORY[0x263F09938];
    double v6 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)v31 = 138543362;
      *(void *)&v31[4] = objc_opt_class();
      id v8 = *(id *)&v31[4];
      _os_log_impl(&dword_255F2E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating cached start and end of day.", v31, 0xCu);
    }
    uint64_t v9 = [(HDMHActivityModelProviding *)v4 userStartOfDay];
    _HKInitializeLogging();
    os_log_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      v12 = objc_opt_class();
      id v13 = (void *)MEMORY[0x263EFF960];
      id v14 = v12;
      id v15 = [v13 currentLocale];
      uint64_t v16 = [(NSDate *)v9 descriptionWithLocale:v15];
      *(_DWORD *)v31 = 138543618;
      *(void *)&v31[4] = v12;
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = v16;
      _os_log_impl(&dword_255F2E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start of day :%@", v31, 0x16u);
    }
    v17 = [(HDMHActivityModelProviding *)v4 userEndOfDay];
    _HKInitializeLogging();
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v18;
      v20 = objc_opt_class();
      v21 = (void *)MEMORY[0x263EFF960];
      id v22 = v20;
      v23 = [v21 currentLocale];
      v24 = [(NSDate *)v17 descriptionWithLocale:v23];
      *(_DWORD *)v31 = 138543618;
      *(void *)&v31[4] = v20;
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = v24;
      _os_log_impl(&dword_255F2E000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] End of day :%@", v31, 0x16u);
    }
    os_unfair_lock_lock(p_lock);
    userDefaults = self->_userDefaults;
    v26 = [MEMORY[0x263EFF910] now];
    [(NSUserDefaults *)userDefaults setObject:v26 forKey:@"TypicalDayProviderCacheLastUpdatedDate"];

    lock_cachedTypicalStartOfDay = self->_lock_cachedTypicalStartOfDay;
    self->_lock_cachedTypicalStartOfDay = v9;
    v28 = v9;

    [(NSUserDefaults *)self->_userDefaults setObject:v28 forKey:@"TypicalDayProviderUserStartOfDayCache"];
    lock_cachedTypicalEndOfDay = self->_lock_cachedTypicalEndOfDay;
    self->_lock_cachedTypicalEndOfDay = v17;
    v30 = v17;

    [(NSUserDefaults *)self->_userDefaults setObject:v30 forKey:@"TypicalDayProviderUserEndOfDayCache"];
    os_unfair_lock_unlock(p_lock);
    [(HDMHTypicalDayProvider *)self _updateObservers];
  }
}

- (id)userStartOfDay
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_cachedTypicalStartOfDay;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    double v5 = v4;
  }
  else
  {
    double v6 = [(HDMHTypicalDayProvider *)self currentCalendar];
    id v7 = [(HDMHTypicalDayProvider *)self currentDate];
    id v8 = [v6 startOfDayForDate:v7];

    uint64_t v9 = [(HDMHTypicalDayProvider *)self currentCalendar];
    os_log_t v10 = [(HDMHTypicalDayProvider *)self _defaultStartOfDayDateComponents];
    double v5 = [v9 dateByAddingComponents:v10 toDate:v8 options:0];
  }
  return v5;
}

- (id)userEndOfDay
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_cachedTypicalEndOfDay;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    double v5 = v4;
  }
  else
  {
    double v6 = [(HDMHTypicalDayProvider *)self currentCalendar];
    id v7 = [(HDMHTypicalDayProvider *)self currentDate];
    id v8 = [v6 startOfDayForDate:v7];

    uint64_t v9 = [(HDMHTypicalDayProvider *)self currentCalendar];
    os_log_t v10 = [(HDMHTypicalDayProvider *)self _defaultEndOfDayDateComponents];
    double v5 = [v9 dateByAddingComponents:v10 toDate:v8 options:0];
  }
  return v5;
}

- (id)_defaultStartOfDayDateComponents
{
  if (_defaultStartOfDayDateComponents_onceToken[0] != -1) {
    dispatch_once(_defaultStartOfDayDateComponents_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_defaultStartOfDayDateComponents_middayDateComponents;
  return v2;
}

uint64_t __58__HDMHTypicalDayProvider__defaultStartOfDayDateComponents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  v1 = (void *)_defaultStartOfDayDateComponents_middayDateComponents;
  _defaultStartOfDayDateComponents_middayDateComponents = (uint64_t)v0;

  [(id)_defaultStartOfDayDateComponents_middayDateComponents setHour:8];
  v2 = (void *)_defaultStartOfDayDateComponents_middayDateComponents;
  return [v2 setMinute:0];
}

- (id)_defaultEndOfDayDateComponents
{
  if (_defaultEndOfDayDateComponents_onceToken != -1) {
    dispatch_once(&_defaultEndOfDayDateComponents_onceToken, &__block_literal_global_304);
  }
  v2 = (void *)_defaultEndOfDayDateComponents_middayDateComponents;
  return v2;
}

uint64_t __56__HDMHTypicalDayProvider__defaultEndOfDayDateComponents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  v1 = (void *)_defaultEndOfDayDateComponents_middayDateComponents;
  _defaultEndOfDayDateComponents_middayDateComponents = (uint64_t)v0;

  [(id)_defaultEndOfDayDateComponents_middayDateComponents setHour:22];
  v2 = (void *)_defaultEndOfDayDateComponents_middayDateComponents;
  return [v2 setMinute:30];
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__HDMHTypicalDayProvider_registerObserver_queue___block_invoke;
  v5[3] = &unk_2653F03B0;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

uint64_t __49__HDMHTypicalDayProvider_registerObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) requestWorkWithPriority:2 error:0];
}

- (void)removeObserver:(id)a3
{
}

- (void)_updateObservers
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__HDMHTypicalDayProvider__updateObservers__block_invoke;
  v3[3] = &unk_2653F0688;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

uint64_t __42__HDMHTypicalDayProvider__updateObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 typicalDayDidUpdate:*(void *)(a1 + 32)];
}

- (id)currentCalendar
{
  return (id)[MEMORY[0x263EFF8F0] currentCalendar];
}

- (id)currentDate
{
  return (id)[MEMORY[0x263EFF910] now];
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = (objc_class *)MEMORY[0x263F43140];
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[[v11 alloc] initWithProfile:self->_profile];
  [v14 setShouldIncludePrivateProperties:1];
  [v14 setShouldIncludeStatistics:1];
  id v15 = HDActivityCacheEntityPredicateForCachesInDateComponentsRange();

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __102__HDMHTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke;
  v18[3] = &unk_2653F06B0;
  id v19 = v10;
  id v16 = v10;
  LOBYTE(a5) = [v14 enumerateActivitySummariesWithPredicate:v15 error:a5 handler:v18];

  return (char)a5;
}

uint64_t __102__HDMHTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)firstOnWristDateToday
{
  return 0;
}

- (void)typicalDayActivityModelDidUpdate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)double v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_255F2E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Typical Day Model did update; notifying observers.",
      v6,
      0xCu);
  }
  [(HDMHTypicalDayProvider *)self _updateTypicalDayMarkers];
  [(HDMHTypicalDayProvider *)self _updateObservers];
}

- (id)clientProvidedDefaultEndOfDay
{
  v3 = [(HDMHTypicalDayProvider *)self currentCalendar];
  v4 = [(HDMHTypicalDayProvider *)self currentDate];
  id v5 = [v3 startOfDayForDate:v4];

  double v6 = [(HDMHTypicalDayProvider *)self currentCalendar];
  uint64_t v7 = [(HDMHTypicalDayProvider *)self _defaultEndOfDayDateComponents];
  id v8 = [v6 dateByAddingComponents:v7 toDate:v5 options:0];

  return v8;
}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  p_lock = &self->_lock;
  id v13 = (void (**)(void))a6;
  os_unfair_lock_lock(p_lock);
  id v8 = self->_lock_typicalDayModel;
  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    uint64_t v9 = [(HDMHTypicalDayProvider *)self _typicalDayIntervalFromToday];
    [(HDMHActivityModelProviding *)v8 rebuildWithInterval:v9];
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x263F3D170]);
    uint64_t v9 = [(HDMHTypicalDayProvider *)self _typicalDayIntervalFromToday];
    id v8 = (HDMHActivityModelProviding *)[v10 initForDateInterval:v9 delegate:self];
  }

  os_unfair_lock_lock(p_lock);
  lock_typicalDayModel = self->_lock_typicalDayModel;
  self->_lock_typicalDayModel = v8;
  id v12 = v8;

  os_unfair_lock_unlock(p_lock);
  [(HDMHTypicalDayProvider *)self _updateTypicalDayMarkers];

  v13[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_lock_cachedTypicalEndOfDay, 0);
  objc_storeStrong((id *)&self->_lock_cachedTypicalStartOfDay, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_lock_typicalDayModel, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end