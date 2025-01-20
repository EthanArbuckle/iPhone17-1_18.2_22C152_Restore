@interface RTEventManager
- (BOOL)accessToEventsGranted;
- (RTEventManager)init;
- (RTEventManager)initWithEventStore:(id)a3;
- (RTInvocationDispatcher)invocationDispatcher;
- (id)calendars;
- (id)calendarsExcludingSuggested;
- (id)eventStore;
- (id)eventsBetweenStartDate:(id)a3 andEndDate:(id)a4;
- (id)eventsBetweenStartDate:(id)a3 andEndDate:(id)a4 calendars:(id)a5;
- (id)eventsSortedByEndDateBetweenStartDate:(id)a3 andEndDate:(id)a4;
- (id)eventsSortedByStartDateBetweenStartDate:(id)a3 andEndDate:(id)a4;
- (id)eventsSortedByStartDateBetweenStartDate:(id)a3 andEndDate:(id)a4 calendars:(id)a5;
- (void)_fetchCurrentlyInEventWithHandler:(id)a3;
- (void)_fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 includeSuggestions:(BOOL)a5 withHandler:(id)a6;
- (void)_fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchFreeDateIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 filterAllDayEvents:(BOOL)a5 filterFreeTimeEvents:(BOOL)a6 handler:(id)a7;
- (void)_fetchLastEventEndDateWithHandler:(id)a3;
- (void)_fetchNextFreeStartDateWithHandler:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)fetchCurrentlyInEventWithHandler:(id)a3;
- (void)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 includeSuggestions:(BOOL)a5 withHandler:(id)a6;
- (void)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withHandler:(id)a5;
- (void)fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchFreeDateIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 filterAllDayEvents:(BOOL)a5 filterFreeTimeEvents:(BOOL)a6 handler:(id)a7;
- (void)fetchLastEventEndDateWithHandler:(id)a3;
- (void)fetchNextFreeStartDateWithHandler:(id)a3;
- (void)setAccessToEventsGranted:(BOOL)a3;
- (void)setEventStore:(id)a3;
- (void)setInvocationDispatcher:(id)a3;
- (void)transientObjectDidCreateBackingObject:(id)a3;
- (void)transientObjectDidReleaseBackingObject:(id)a3;
@end

@implementation RTEventManager

uint64_t __88__RTEventManager_fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEventsBetweenStartDate:*(void *)(a1 + 40) andEndDate:*(void *)(a1 + 48) includeSuggestions:1 withHandler:*(void *)(a1 + 56)];
}

- (void)_fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 includeSuggestions:(BOOL)a5 withHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(id, void, void *))a6;
  if (v13)
  {
    id v14 = [v11 laterDate:v12];

    if (v14 == v11)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFE8];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      v36 = @"Requires start date to be before end date.";
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v20 = [v17 errorWithDomain:v18 code:7 userInfo:v19];
      v13[2](v13, 0, v20);
    }
    else if ([(RTEventManager *)self accessToEventsGranted])
    {
      if (a5)
      {
        v15 = 0;
      }
      else
      {
        v15 = [(RTEventManager *)self calendarsExcludingSuggested];
      }
      v26 = [(RTEventManager *)self eventsBetweenStartDate:v11 andEndDate:v12 calendars:v15];
      ((void (**)(id, void *, void *))v13)[2](v13, v26, 0);
    }
    else
    {
      v21 = [(RTEventManager *)self invocationDispatcher];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke;
      v30[3] = &unk_1E6B922F8;
      v30[4] = self;
      id v31 = v11;
      id v32 = v12;
      BOOL v34 = a5;
      v33 = v13;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke_2;
      v27[3] = &unk_1E6B921E0;
      v27[4] = self;
      SEL v29 = a2;
      v28 = v33;
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      v24 = NSStringFromSelector(a2);
      [v21 enqueueBlock:v30, v27, @"%@-%@", v23, v24 failureBlock description];

      v25 = [(RTEventManager *)self eventStore];
      [v25 touch];
    }
  }
  else
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTEventManager _fetchEventsBetweenStartDate:andEndDate:includeSuggestions:withHandler:]";
      __int16 v39 = 1024;
      int v40 = 556;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (id)eventsBetweenStartDate:(id)a3 andEndDate:(id)a4 calendars:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(RTEventManager *)self accessToEventsGranted])
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315394;
      v22 = "-[RTEventManager eventsBetweenStartDate:andEndDate:calendars:]";
      __int16 v23 = 1024;
      LODWORD(v24) = 189;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "no access to event store (in %s:%d)", (uint8_t *)&v21, 0x12u);
    }
  }
  id v12 = 0;
  if (v8 && v9)
  {
    v13 = [(RTEventManager *)self eventStore];
    id v14 = [v13 predicateForEventsWithStartDate:v8 endDate:v9 calendars:v10];

    v15 = [(RTEventManager *)self eventStore];
    id v12 = [v15 eventsMatchingPredicate:v14];

    v16 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [v12 count];
      v19 = [v8 stringFromDate];
      v20 = [v9 stringFromDate];
      int v21 = 134218498;
      v22 = (const char *)v18;
      __int16 v23 = 2112;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%lu events between start date, %@, and end date, %@", (uint8_t *)&v21, 0x20u);
    }
  }

  return v12;
}

- (id)eventStore
{
  return self->_eventStore;
}

- (BOOL)accessToEventsGranted
{
  return self->_accessToEventsGranted;
}

- (void)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 includeSuggestions:(BOOL)a5 withHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(RTNotifier *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__RTEventManager_fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke;
  v16[3] = &unk_1E6B91490;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)transientObjectDidCreateBackingObject:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([v4 isEqual:self->_eventStore])
  {
    id eventStore = self->_eventStore;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke;
    v6[3] = &unk_1E6B9C430;
    objc_copyWeak(&v7, &location);
    [eventStore requestAccessToEntityType:0 completion:v6];
    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

- (RTEventManager)init
{
  v3 = [[RTTransientObject alloc] initWithCreationBlock:&__block_literal_global_115 timeout:60.0];
  id v4 = [(RTEventManager *)self initWithEventStore:v3];

  return v4;
}

id __22__RTEventManager_init__block_invoke()
{
  v0 = objc_opt_new();

  return v0;
}

- (RTEventManager)initWithEventStore:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)RTEventManager;
    v6 = [(RTNotifier *)&v16 init];
    id v7 = v6;
    if (v6)
    {
      objc_storeStrong(&v6->_eventStore, a3);
      uint64_t v8 = objc_opt_class();
      if (v8 == objc_opt_class()) {
        [v5 setTransientObjectDelegate:v7];
      }
      id v9 = [RTInvocationDispatcher alloc];
      id v10 = [(RTNotifier *)v7 queue];
      uint64_t v11 = [(RTInvocationDispatcher *)v9 initWithQueue:v10];
      invocationDispatcher = v7->_invocationDispatcher;
      v7->_invocationDispatcher = (RTInvocationDispatcher *)v11;
    }
    self = v7;
    id v13 = self;
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTEventManager initWithEventStore:]";
      __int16 v19 = 1024;
      int v20 = 123;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventStore (in %s:%d)", buf, 0x12u);
    }

    id v13 = 0;
  }

  return v13;
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

void __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke_2;
    block[3] = &unk_1E6B91328;
    char v12 = a2;
    id v10 = v5;
    uint64_t v11 = v7;
    dispatch_async(v8, block);
  }
}

void __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "access to event entity type granted, %@, error, %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 40) setAccessToEventsGranted:*(unsigned __int8 *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 40) invocationDispatcher];
  int v6 = [v5 invocationsPending];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) invocationDispatcher];
    [v7 dispatchPendingInvocations];
  }
}

- (void)transientObjectDidReleaseBackingObject:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTEventManager_transientObjectDidReleaseBackingObject___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__RTEventManager_transientObjectDidReleaseBackingObject___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 48)];
  if (result) {
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 0;
  }
  return result;
}

- (id)eventsBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  return [(RTEventManager *)self eventsBetweenStartDate:a3 andEndDate:a4 calendars:0];
}

- (id)eventsSortedByEndDateBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  id v4 = [(RTEventManager *)self eventsBetweenStartDate:a3 andEndDate:a4];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_68];

  return v5;
}

uint64_t __67__RTEventManager_eventsSortedByEndDateBetweenStartDate_andEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 endDate];
  id v6 = [v4 endDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)eventsSortedByStartDateBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  id v4 = [(RTEventManager *)self eventsBetweenStartDate:a3 andEndDate:a4];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_70];

  return v5;
}

uint64_t __69__RTEventManager_eventsSortedByStartDateBetweenStartDate_andEndDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compareStartDateWithEvent:];
}

- (id)eventsSortedByStartDateBetweenStartDate:(id)a3 andEndDate:(id)a4 calendars:(id)a5
{
  id v5 = [(RTEventManager *)self eventsBetweenStartDate:a3 andEndDate:a4 calendars:a5];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_72];

  return v6;
}

uint64_t __79__RTEventManager_eventsSortedByStartDateBetweenStartDate_andEndDate_calendars___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compareStartDateWithEvent:];
}

- (id)calendars
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(RTEventManager *)self accessToEventsGranted])
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[RTEventManager calendars]";
      __int16 v9 = 1024;
      int v10 = 247;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "no access to event store (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  id v4 = [(RTEventManager *)self eventStore];
  id v5 = [v4 calendarsForEntityType:0];

  return v5;
}

- (id)calendarsExcludingSuggested
{
  v2 = [(RTEventManager *)self calendars];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_76];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __45__RTEventManager_calendarsExcludingSuggested__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggestedEventCalendar] ^ 1;
}

- (void)_fetchCurrentlyInEventWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if ([(RTEventManager *)self accessToEventsGranted])
    {
      *(void *)__int16 v25 = 0;
      *(void *)&v25[8] = v25;
      *(void *)&v25[16] = 0x2020000000;
      char v26 = 0;
      id v6 = [MEMORY[0x1E4F1C9C8] startOfDay];
      int v7 = [MEMORY[0x1E4F1C9C8] endOfDay];
      id v8 = [(RTEventManager *)self eventsSortedByStartDateBetweenStartDate:v6 andEndDate:v7];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_86;
      v17[3] = &unk_1E6B958B0;
      v17[4] = v25;
      [v8 enumerateObjectsUsingBlock:v17];

      __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (*(unsigned char *)(*(void *)&v25[8] + 24)) {
          int v10 = @"YES";
        }
        else {
          int v10 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Currently in event, %@", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v5 + 2))(v5, *(unsigned __int8 *)(*(void *)&v25[8] + 24), 0);
      _Block_object_dispose(v25, 8);
    }
    else
    {
      uint64_t v12 = [(RTEventManager *)self invocationDispatcher];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke;
      v21[3] = &unk_1E6B90CE0;
      v21[4] = self;
      id v22 = v5;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_2;
      v18[3] = &unk_1E6B921E0;
      v18[4] = self;
      SEL v20 = a2;
      id v19 = v22;
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      [v12 enqueueBlock:v21, v18, @"%@-%@", v14, v15 failureBlock description];

      objc_super v16 = [(RTEventManager *)self eventStore];
      [v16 touch];
    }
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v25 = 136315394;
      *(void *)&v25[4] = "-[RTEventManager _fetchCurrentlyInEventWithHandler:]";
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = 266;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v25, 0x12u);
    }
  }
}

uint64_t __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentlyInEventWithHandler:*(void *)(a1 + 40)];
}

void __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  int v7 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  id v14 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v12);
}

void __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_86(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  int v7 = [v13 startDate];
  uint64_t v8 = [v6 laterDate:v7];
  if ([v8 isEqual:v6])
  {
    __int16 v9 = [v13 endDate];
    uint64_t v10 = [v6 laterDate:v9];
    uint64_t v11 = [v13 endDate];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
  }
}

- (void)fetchCurrentlyInEventWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RTEventManager_fetchCurrentlyInEventWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__RTEventManager_fetchCurrentlyInEventWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentlyInEventWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchNextFreeStartDateWithHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if ([(RTEventManager *)self accessToEventsGranted])
    {
      *(void *)uint64_t v27 = 0;
      *(void *)&v27[8] = v27;
      *(void *)&v27[16] = 0x3032000000;
      v28 = __Block_byref_object_copy__156;
      SEL v29 = __Block_byref_object_dispose__156;
      id v30 = 0;
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
      int v7 = *(void **)(*(void *)&v27[8] + 40);
      *(void *)(*(void *)&v27[8] + 40) = v6;

      id v8 = [MEMORY[0x1E4F1C9C8] date];
      __int16 v9 = [MEMORY[0x1E4F1C9C8] endOfDay];
      uint64_t v10 = [(RTEventManager *)self eventsSortedByStartDateBetweenStartDate:v8 andEndDate:v9];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_88;
      v19[3] = &unk_1E6B9C498;
      v19[4] = v27;
      [v10 enumerateObjectsUsingBlock:v19];

      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = [*(id *)(*(void *)&v27[8] + 40) stringFromDate];
        *(_DWORD *)buf = 138412290;
        char v26 = v12;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "next free start date, %@", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v5 + 2))(v5, *(void *)(*(void *)&v27[8] + 40), 0);
      _Block_object_dispose(v27, 8);
    }
    else
    {
      id v14 = [(RTEventManager *)self invocationDispatcher];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke;
      v23[3] = &unk_1E6B90CE0;
      v23[4] = self;
      id v24 = v5;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_2;
      v20[3] = &unk_1E6B921E0;
      v20[4] = self;
      SEL v22 = a2;
      id v21 = v24;
      id v15 = (objc_class *)objc_opt_class();
      objc_super v16 = NSStringFromClass(v15);
      uint64_t v17 = NSStringFromSelector(a2);
      [v14 enqueueBlock:v23, v20, @"%@-%@", v16, v17 failureBlock description];

      id v18 = [(RTEventManager *)self eventStore];
      [v18 touch];
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v27 = 136315394;
      *(void *)&v27[4] = "-[RTEventManager _fetchNextFreeStartDateWithHandler:]";
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = 319;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v27, 0x12u);
    }
  }
}

uint64_t __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchNextFreeStartDateWithHandler:*(void *)(a1 + 40)];
}

void __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  uint64_t v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  int v7 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  id v14 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  int v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v12);
}

void __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_88(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    id v18 = v5;
LABEL_9:
    uint64_t v16 = [v5 endDate];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    int v7 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
    goto LABEL_10;
  }
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6) {
    goto LABEL_11;
  }
  id v18 = v5;
  int v7 = [v5 startDate];
  if (![v6 compare:v7])
  {

    id v5 = v18;
    goto LABEL_9;
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  __int16 v9 = [v18 startDate];
  uint64_t v10 = [v8 earlierDate:v9];
  uint64_t v11 = [v18 startDate];
  if (v10 == v11)
  {
    int v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v13 = [v18 endDate];
    id v14 = [v12 laterDate:v13];
    id v15 = [v18 endDate];

    id v5 = v18;
    if (v14 != v15) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

LABEL_10:
  id v5 = v18;
LABEL_11:
}

- (void)fetchNextFreeStartDateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTEventManager_fetchNextFreeStartDateWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__RTEventManager_fetchNextFreeStartDateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchNextFreeStartDateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchLastEventEndDateWithHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void))a3;
  if (v5)
  {
    if ([(RTEventManager *)self accessToEventsGranted])
    {
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      int v7 = [MEMORY[0x1E4F1C9C8] endOfDay];
      id v8 = [(RTEventManager *)self eventsSortedByEndDateBetweenStartDate:v6 andEndDate:v7];
      __int16 v9 = [v8 lastObject];

      uint64_t v10 = [v9 endDate];
      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = [v10 stringFromDate];
        *(_DWORD *)buf = 138412290;
        __int16 v25 = v12;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "last event end date, %@", buf, 0xCu);
      }
      v5[2](v5, v10, 0);
    }
    else
    {
      id v14 = [(RTEventManager *)self invocationDispatcher];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke;
      v22[3] = &unk_1E6B90CE0;
      v22[4] = self;
      __int16 v23 = v5;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke_2;
      v19[3] = &unk_1E6B921E0;
      v19[4] = self;
      SEL v21 = a2;
      SEL v20 = v23;
      id v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = NSStringFromSelector(a2);
      [v14 enqueueBlock:v22, v19, @"%@-%@", v16, v17 failureBlock description];

      id v18 = [(RTEventManager *)self eventStore];
      [v18 touch];
    }
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "-[RTEventManager _fetchLastEventEndDateWithHandler:]";
      __int16 v26 = 1024;
      int v27 = 372;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLastEventEndDateWithHandler:*(void *)(a1 + 40)];
}

void __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  int v7 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  id v14 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  int v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v12);
}

- (void)fetchLastEventEndDateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RTEventManager_fetchLastEventEndDateWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__RTEventManager_fetchLastEventEndDateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLastEventEndDateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchFreeDateIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 filterAllDayEvents:(BOOL)a5 filterFreeTimeEvents:(BOOL)a6 handler:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = (void (**)(id, void, void *))a7;
  if (v15)
  {
    id v16 = [v13 laterDate:v14];

    if (v16 == v13)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49 = @"Requires start date to be before end date.";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      SEL v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];
      v15[2](v15, 0, v22);

LABEL_16:
      goto LABEL_17;
    }
    if ([(RTEventManager *)self accessToEventsGranted])
    {
      if (v13)
      {
        id v17 = v13;
      }
      else
      {
        id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
      }
      uint64_t v28 = v17;
      if (v14)
      {
        id v29 = v14;
      }
      else
      {
        id v29 = [MEMORY[0x1E4F1C9C8] distantFuture];
      }
      id v30 = v29;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_93;
      v33[3] = &unk_1E6B9C508;
      BOOL v37 = a5;
      BOOL v38 = a6;
      id v34 = v28;
      id v35 = v29;
      v36 = v15;
      id v31 = v30;
      id v21 = v28;
      id v32 = (void *)MEMORY[0x1E016DB00](v33);
      [(RTEventManager *)self _fetchEventsBetweenStartDate:v21 endDate:v31 handler:v32];

      goto LABEL_16;
    }
    __int16 v23 = [(RTEventManager *)self invocationDispatcher];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke;
    v42[3] = &unk_1E6B9C4C0;
    v42[4] = self;
    id v43 = v13;
    id v44 = v14;
    BOOL v46 = a5;
    BOOL v47 = a6;
    v45 = v15;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_2;
    v39[3] = &unk_1E6B921E0;
    v39[4] = self;
    SEL v41 = a2;
    int v40 = v45;
    id v24 = (objc_class *)objc_opt_class();
    __int16 v25 = NSStringFromClass(v24);
    __int16 v26 = NSStringFromSelector(a2);
    [v23 enqueueBlock:v42, v39, @"%@-%@", v25, v26 failureBlock description];

    int v27 = [(RTEventManager *)self eventStore];
    [v27 touch];
  }
  else
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[RTEventManager _fetchFreeDateIntervalsBetweenStartDate:endDate:filterAllDayEvents:filterFreeTimeEvents:handler:]";
      __int16 v52 = 1024;
      int v53 = 428;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_17:
}

uint64_t __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFreeDateIntervalsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) filterAllDayEvents:*(unsigned __int8 *)(a1 + 64) filterFreeTimeEvents:*(unsigned __int8 *)(a1 + 65) handler:*(void *)(a1 + 56)];
}

void __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  int v7 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  id v14 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  int v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v12);
}

void __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  uint64_t v8 = v7;
  if (*(unsigned char *)(a1 + 56))
  {
    __int16 v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_97_1];
    uint64_t v8 = [v7 filteredArrayUsingPredicate:v9];
  }
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_99];
    uint64_t v11 = [v8 filteredArrayUsingPredicate:v10];

    uint64_t v8 = (void *)v11;
  }
  int v12 = [MEMORY[0x1E4F28C18] dateIntervalFromEvents:v8];
  uint64_t v13 = [MEMORY[0x1E4F28C18] invertDateIntervals:v12];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*(void *)(a1 + 32) endDate:*(void *)(a1 + 40)];
  id v15 = [MEMORY[0x1E4F28C18] dateIntervals:v13 intersectingDateInterval:v14];
  id v16 = _rt_log_facility_get_os_log(RTLogFacilityAction);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v15;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "free date intervals, %@", (uint8_t *)&v17, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_2_94(uint64_t a1, void *a2)
{
  return [a2 isAllDay] ^ 1;
}

BOOL __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 availability] != -1 && [v2 availability] != 1;

  return v3;
}

- (void)fetchFreeDateIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 filterAllDayEvents:(BOOL)a5 filterFreeTimeEvents:(BOOL)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__RTEventManager_fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke;
  block[3] = &unk_1E6B9C4C0;
  void block[4] = self;
  id v20 = v12;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, block);
}

uint64_t __113__RTEventManager_fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFreeDateIntervalsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) filterAllDayEvents:*(unsigned __int8 *)(a1 + 64) filterFreeTimeEvents:*(unsigned __int8 *)(a1 + 65) handler:*(void *)(a1 + 56)];
}

- (void)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withHandler:(id)a5
{
}

uint64_t __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEventsBetweenStartDate:*(void *)(a1 + 40) andEndDate:*(void *)(a1 + 48) includeSuggestions:*(unsigned __int8 *)(a1 + 64) withHandler:*(void *)(a1 + 56)];
}

void __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  id v14 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v12);
}

- (void)_fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void, void *))a5;
  if (!v11) {
    goto LABEL_19;
  }
  if (!v9)
  {
    int v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F5CFE8];
    uint64_t v64 = *MEMORY[0x1E4F28568];
    v65[0] = @"requires a valid startDate.";
    id v29 = (void *)MEMORY[0x1E4F1C9E8];
    id v30 = (__CFString **)v65;
    id v31 = &v64;
LABEL_17:
    id v32 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];
    v33 = [v27 errorWithDomain:v28 code:0 userInfo:v32];
    v11[2](v11, 0, v33);

    goto LABEL_19;
  }
  if (!v10)
  {
    int v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F5CFE8];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    v63 = @"requires a valid endDate.";
    id v29 = (void *)MEMORY[0x1E4F1C9E8];
    id v30 = &v63;
    id v31 = &v62;
    goto LABEL_17;
  }
  if ([(RTEventManager *)self accessToEventsGranted])
  {
    __int16 v39 = v11;
    id v40 = v10;
    id v41 = v9;
    id v12 = [(RTEventManager *)self eventsBetweenStartDate:v9 andEndDate:v10];
    id v43 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v12 count]];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v12;
    uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v51;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v51 != v44) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
          id v15 = objc_alloc(MEMORY[0x1E4F5CE00]);
          id v16 = [v14 structuredLocation];
          uint64_t v17 = [v16 geoLocation];
          v49 = (void *)[v15 initWithCLLocation:v17];

          uint64_t v48 = [RTCalendarEvent alloc];
          id v18 = [v14 eventIdentifier];
          unsigned int v47 = [v14 isAllDay];
          uint64_t v19 = [v14 startDate];
          id v20 = [v14 endDate];
          uint64_t v46 = [v14 participantStatus];
          uint64_t v21 = [v14 availability];
          id v22 = [v14 structuredLocation];
          BOOL v23 = [v22 title];
          BOOL v24 = [v14 structuredLocation];
          __int16 v25 = [v24 mapKitHandle];
          __int16 v26 = [(RTCalendarEvent *)v48 initWithEventIdentifier:v18 allDay:v47 startDate:v19 endDate:v20 participantStatus:v46 availability:v21 location:v49 locationTitle:v23 locationMapItemHandle:v25];

          if (v26) {
            [v43 addObject:v26];
          }

          ++v13;
        }
        while (v45 != v13);
        uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
      }
      while (v45);
    }

    uint64_t v11 = v39;
    ((void (**)(id, void *, void *))v39)[2](v39, v43, 0);

    id v10 = v40;
    id v9 = v41;
  }
  else
  {
    id v34 = [(RTEventManager *)self invocationDispatcher];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke;
    v57[3] = &unk_1E6B91490;
    v57[4] = self;
    id v58 = v9;
    id v59 = v10;
    v60 = v11;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke_2;
    v54[3] = &unk_1E6B921E0;
    v54[4] = self;
    SEL v56 = a2;
    v55 = v60;
    id v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    BOOL v37 = NSStringFromSelector(a2);
    [v34 enqueueBlock:v57, v54, @"%@-%@", v36, v37 failureBlock description];

    BOOL v38 = [(RTEventManager *)self eventStore];
    [v38 touch];
  }
LABEL_19:
}

uint64_t __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

void __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  id v14 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v12);
}

- (void)fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__RTEventManager_fetchEventsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __62__RTEventManager_fetchEventsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (RTInvocationDispatcher)invocationDispatcher
{
  return self->_invocationDispatcher;
}

- (void)setInvocationDispatcher:(id)a3
{
}

- (void)setEventStore:(id)a3
{
}

- (void)setAccessToEventsGranted:(BOOL)a3
{
  self->_accessToEventsGranted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_invocationDispatcher, 0);
}

@end