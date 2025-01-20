@interface RTProximityEventStore
- (id)_getPredicateForEventIDs:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_deleteProximityEventWithUUID:(id)a3 handler:(id)a4;
- (void)_fetchProximityEventsFromDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchProximityEventsFromEventIDs:(id)a3 handler:(id)a4;
- (void)_purgeProximityEventsPredating:(id)a3 handler:(id)a4;
- (void)_storeProximityEvent:(id)a3 handler:(id)a4;
- (void)clearWithHandler:(id)a3;
- (void)deleteProximityEventWithUUID:(id)a3 handler:(id)a4;
- (void)fetchProximityEventsFromDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchProximityEventsFromEventIDs:(id)a3 handler:(id)a4;
- (void)purgeProximityEventsPredating:(id)a3 handler:(id)a4;
- (void)storeProximityEvent:(id)a3 handler:(id)a4;
@end

@implementation RTProximityEventStore

- (void)fetchProximityEventsFromDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__RTProximityEventStore_fetchProximityEventsFromDate_endDate_handler___block_invoke;
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

uint64_t __70__RTProximityEventStore_fetchProximityEventsFromDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchProximityEventsFromDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchProximityEventsFromDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void, void *))a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTProximityEventStore _fetchProximityEventsFromDate:endDate:handler:]";
      __int16 v38 = 1024;
      int v39 = 43;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
LABEL_3:
      if (v11) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[RTProximityEventStore _fetchProximityEventsFromDate:endDate:handler:]";
    __int16 v38 = 1024;
    int v39 = 44;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_11:
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTProximityEventStore _fetchProximityEventsFromDate:endDate:handler:]";
      __int16 v38 = 1024;
      int v39 = 45;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  if ([v9 compare:v10] == 1)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    id v17 = NSString;
    id v18 = [v9 getFormattedDateString];
    v19 = [v10 getFormattedDateString];
    v20 = [v17 stringWithFormat:@"startDate, %@, endDate, %@", v18, v19];
    v35 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v22 = [v15 errorWithDomain:v16 code:7 userInfo:v21];
    v11[2](v11, MEMORY[0x1E4F1CBF0], v22);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E016D870]();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke;
    v28[3] = &unk_1E6B963A0;
    id v29 = v10;
    id v30 = v9;
    v31 = self;
    SEL v33 = a2;
    v24 = v11;
    id v32 = v24;
    v25 = (void *)MEMORY[0x1E016DB00](v28);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke_18;
    v26[3] = &unk_1E6B90C18;
    v27 = v24;
    [(RTStore *)self _performBlock:v25 contextType:1 errorHandler:v26];
  }
}

void __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTProximityEventMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@ AND %K >= %@", @"startDate", *(void *)(a1 + 32), @"endDate", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v28 = 0;
  v6 = [v3 executeFetchRequest:v4 error:&v28];
  id v7 = v28;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v21 = [v6 count];
    *(_DWORD *)buf = 138413314;
    v31 = v19;
    __int16 v32 = 2112;
    SEL v33 = v20;
    __int16 v34 = 2112;
    v35 = v4;
    __int16 v36 = 2048;
    uint64_t v37 = v21;
    __int16 v38 = 2112;
    id v39 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
  }
  id v9 = objc_opt_new();
  if (!v7 && [v6 count])
  {
    uint64_t v22 = a1;
    id v23 = v3;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v16 = (void *)MEMORY[0x1E016D870]();
          id v17 = [MEMORY[0x1E4F5CEA8] createWithManagedObject:v15];
          [v9 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    a1 = v22;
    id v3 = v23;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchProximityEventsFromEventIDs:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTProximityEventStore_fetchProximityEventsFromEventIDs_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __66__RTProximityEventStore_fetchProximityEventsFromEventIDs_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchProximityEventsFromEventIDs:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchProximityEventsFromEventIDs:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[RTProximityEventStore _fetchProximityEventsFromEventIDs:handler:]";
    __int16 v29 = 1024;
    int v30 = 107;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventIDs (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "-[RTProximityEventStore _fetchProximityEventsFromEventIDs:handler:]";
      __int16 v29 = 1024;
      int v30 = 108;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  if ([v7 count])
  {
    id v12 = (void *)MEMORY[0x1E016D870]();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke;
    v21[3] = &unk_1E6B91018;
    v21[4] = self;
    id v22 = v7;
    SEL v24 = a2;
    id v13 = v9;
    id v23 = v13;
    id v14 = (void *)MEMORY[0x1E016DB00](v21);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke_23;
    v19[3] = &unk_1E6B90C18;
    v20 = v13;
    [(RTStore *)self _performBlock:v14 contextType:1 errorHandler:v19];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    long long v26 = @"eventIDs requires at least one element to fetch";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];
    ((void (**)(void, void, void *))v9)[2](v9, MEMORY[0x1E4F1CBF0], v18);
  }
}

void __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTProximityEventMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = [*(id *)(a1 + 32) _getPredicateForEventIDs:*(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v28 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v28];
  id v7 = v28;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v21 = [v6 count];
    *(_DWORD *)buf = 138413314;
    uint64_t v31 = v19;
    __int16 v32 = 2112;
    SEL v33 = v20;
    __int16 v34 = 2112;
    v35 = v4;
    __int16 v36 = 2048;
    uint64_t v37 = v21;
    __int16 v38 = 2112;
    id v39 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
  }
  id v9 = objc_opt_new();
  if (!v7 && [v6 count])
  {
    uint64_t v22 = a1;
    id v23 = v3;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v16 = (void *)MEMORY[0x1E016D870]();
          id v17 = [MEMORY[0x1E4F5CEA8] createWithManagedObject:v15];
          [v9 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    a1 = v22;
    id v3 = v23;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_getPredicateForEventIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1E016D870]();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1E016D870]();
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"eventID", v10];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v4];
  [v4 removeAllObjects];

  return v13;
}

- (void)storeProximityEvent:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTProximityEventStore_storeProximityEvent_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __53__RTProximityEventStore_storeProximityEvent_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeProximityEvent:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_storeProximityEvent:(id)a3 handler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v9, v7, v10, v11);
}

- (void)clearWithHandler:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)deleteProximityEventWithUUID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTProximityEventStore_deleteProximityEventWithUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __62__RTProximityEventStore_deleteProximityEventWithUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteProximityEventWithUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteProximityEventWithUUID:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      long long v16 = __63__RTProximityEventStore__deleteProximityEventWithUUID_handler___block_invoke;
      long long v17 = &unk_1E6B91088;
      id v18 = v6;
      long long v19 = self;
      id v8 = v7;
      id v20 = v8;
      id v9 = (void *)MEMORY[0x1E016DB00](&v14);
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8, v14, v15, v16, v17);

      id v10 = v18;
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires valid proximity event UUID.";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v13 = [v11 errorWithDomain:v12 code:0 userInfo:v10];
      (*((void (**)(id, void *))v7 + 2))(v7, v13);
    }
  }
}

void __63__RTProximityEventStore__deleteProximityEventWithUUID_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTProximityEventMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %@)", @"eventID", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (void)purgeProximityEventsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTProximityEventStore_purgeProximityEventsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__RTProximityEventStore_purgeProximityEventsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeProximityEventsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgeProximityEventsPredating:(id)a3 handler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = @"endDate";
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [(RTStore *)self purgePredating:v7 predicateMappings:v9 handler:v6];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"the proximity event store doesn't support enumeration";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:7 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return 0;
}

@end