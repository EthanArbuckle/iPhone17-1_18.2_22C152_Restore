@interface RTTripSegmentStore
- (RTTripSegmentStore)initWithPersistenceManager:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_deleteTripSegmentWithUUID:(id)a3 handler:(id)a4;
- (void)_fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchTripSegmentsWithUUID:(id)a3 handler:(id)a4;
- (void)_purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4;
- (void)_purgeTripSegmentsPredating:(id)a3 handler:(id)a4;
- (void)_storeTripSegment:(id)a3 handler:(id)a4;
- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4;
- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchTripSegmentsWithUUID:(id)a3 handler:(id)a4;
- (void)purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4;
- (void)purgeTripSegmentsPredating:(id)a3 handler:(id)a4;
- (void)storeTripSegment:(id)a3 handler:(id)a4;
@end

@implementation RTTripSegmentStore

- (RTTripSegmentStore)initWithPersistenceManager:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)RTTripSegmentStore;
  v4 = [(RTStore *)&v10 initWithPersistenceManager:a3];
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@ %@ success.", buf, 0x16u);
    }
  }
  return v4;
}

- (void)_fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v22 = v13;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked.", buf, 0x16u);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke;
    v17[3] = &unk_1E6B91060;
    id v18 = v7;
    SEL v20 = a2;
    id v10 = v8;
    id v19 = v10;
    v11 = (void *)MEMORY[0x1E016DB00](v17);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke_17;
    v15[3] = &unk_1E6B90C18;
    id v16 = v10;
    [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v15];
  }
}

void __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  v67[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTTripSegmentMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = [*(id *)(a1 + 32) dateInterval];

  unint64_t v6 = 0x1E4F1C000;
  id v50 = v3;
  v51 = v4;
  if (v5)
  {
    v41 = (void *)MEMORY[0x1E4F28BA0];
    id v7 = (void *)MEMORY[0x1E4F28F60];
    v49 = [*(id *)(a1 + 32) dateInterval];
    v47 = [v49 startDate];
    v48 = [*(id *)(a1 + 32) dateInterval];
    v46 = [v48 endDate];
    v45 = [v7 predicateWithFormat:@"%@ <= %K AND %K <= %@", v47, @"startDate", @"endDate", v46];
    v67[0] = v45;
    id v8 = (void *)MEMORY[0x1E4F28F60];
    v44 = [*(id *)(a1 + 32) dateInterval];
    v42 = [v44 startDate];
    v43 = [*(id *)(a1 + 32) dateInterval];
    v40 = [v43 endDate];
    v39 = [v8 predicateWithFormat:@"%@ <= %K AND %K <= %@", v42, @"startDate", @"startDate", v40];
    v67[1] = v39;
    v9 = (void *)MEMORY[0x1E4F28F60];
    v38 = [*(id *)(a1 + 32) dateInterval];
    v36 = [v38 startDate];
    v37 = [*(id *)(a1 + 32) dateInterval];
    id v10 = [v37 endDate];
    v11 = [v9 predicateWithFormat:@"%@ <= %K AND %K <= %@", v36, @"endDate", @"endDate", v10];
    v67[2] = v11;
    v12 = (void *)MEMORY[0x1E4F28F60];
    __int16 v13 = [*(id *)(a1 + 32) dateInterval];
    v14 = [v13 startDate];
    uint64_t v15 = [*(id *)(a1 + 32) dateInterval];
    id v16 = [v15 endDate];
    v17 = [v12 predicateWithFormat:@"%K <= %@ AND %@ <= %K", @"startDate", v14, v16, @"endDate"];
    v67[3] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
    id v19 = [v41 orPredicateWithSubpredicates:v18];
    [v51 setPredicate:v19];

    v4 = v51;
    id v3 = v50;

    unint64_t v6 = 0x1E4F1C000uLL;
  }
  SEL v20 = [*(id *)(a1 + 32) limit];

  if (v20)
  {
    v21 = [*(id *)(a1 + 32) limit];
    [v4 setFetchLimit:[v21 unsignedIntegerValue]];
  }
  v22 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:[*(id *)(a1 + 32) isAscending]];
  v66 = v22;
  __int16 v23 = [*(id *)(v6 + 2424) arrayWithObjects:&v66 count:1];
  [v4 setSortDescriptors:v23];

  [v4 setFetchBatchSize:10];
  id v56 = 0;
  v24 = [v3 executeFetchRequest:v4 error:&v56];
  id v25 = v56;
  v26 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v34 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v35 = [v24 count];
    *(_DWORD *)buf = 138413058;
    v59 = v34;
    __int16 v60 = 2112;
    v61 = v4;
    __int16 v62 = 2048;
    uint64_t v63 = v35;
    __int16 v64 = 2112;
    id v65 = v25;
    _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v25)
  {
    v27 = 0;
  }
  else
  {
    v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v24 count]];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v28 = v24;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v53;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v53 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [MEMORY[0x1E4F5CF78] createWithManagedObject:*(void *)(*((void *)&v52 + 1) + 8 * v32)];
          if (v33) {
            [v27 addObject:v33];
          }

          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v30);
    }

    id v3 = v50;
    v4 = v51;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTTripSegmentStore_fetchTripSegmentsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__RTTripSegmentStore_fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTripSegmentsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchTripSegmentsWithUUID:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v22 = v13;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked.", buf, 0x16u);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke;
    v17[3] = &unk_1E6B91060;
    id v18 = v7;
    SEL v20 = a2;
    id v10 = v8;
    id v19 = v10;
    v11 = (void *)MEMORY[0x1E016DB00](v17);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke_26;
    v15[3] = &unk_1E6B90C18;
    id v16 = v10;
    [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v15];
  }
}

void __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTTripSegmentMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ == %K", *(void *)(a1 + 32), @"identifier"];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:1];
  v36[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v4 setSortDescriptors:v7];

  [v4 setFetchLimit:10];
  [v4 setFetchBatchSize:10];
  id v26 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v26];
  id v9 = v26;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v19 = [v8 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v4;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    uint64_t v20 = a1;
    id v21 = v3;
    v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [MEMORY[0x1E4F5CF78] createWithManagedObject:*(void *)(*((void *)&v22 + 1) + 8 * v16)];
          if (v17) {
            [v11 addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    a1 = v20;
    id v3 = v21;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentsWithUUID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTTripSegmentStore_fetchTripSegmentsWithUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __56__RTTripSegmentStore_fetchTripSegmentsWithUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTripSegmentsWithUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_storeTripSegment:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v6 description];
    *(_DWORD *)buf = 138412290;
    id v13 = v10;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "CRTSM,RTTripSegmentStore,storeTripSegment,%@", buf, 0xCu);
  }
  id v11 = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [(RTStore *)self storeWritableObjects:v9 handler:v7];
}

- (void)storeTripSegment:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTTripSegmentStore_storeTripSegment_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __47__RTTripSegmentStore_storeTripSegment_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeTripSegment:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgeTripSegmentsPredating:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
  }
  uint64_t v16 = @"endDate";
  uint64_t v15 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v17 = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  [(RTStore *)self purgePredating:v8 predicateMappings:v11 purgeLimit:100 handler:v7];
}

- (void)purgeTripSegmentsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTTripSegmentStore_purgeTripSegmentsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __57__RTTripSegmentStore_purgeTripSegmentsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeTripSegmentsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    id v18 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v27 = v18;
    __int16 v28 = 2112;
    uint64_t v29 = v19;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
  }
  if (v7)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__RTTripSegmentStore__purgeTripSegmentsOnDateInterval_handler___block_invoke;
    v20[3] = &unk_1E6B91088;
    id v21 = v7;
    uint64_t v22 = self;
    id v10 = v8;
    id v23 = v10;
    id v11 = (void *)MEMORY[0x1E016DB00](v20);
    [(RTStore *)self _performBlock:v11 contextType:0 errorHandler:v10];

    id v12 = v21;
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTTripSegmentStore _purgeTripSegmentsOnDateInterval:handler:]";
      __int16 v28 = 1024;
      LODWORD(v29) = 244;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    long long v25 = @"requires a non-nil dateInterval.";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v12 = [v14 errorWithDomain:v15 code:7 userInfo:v16];

    if (v8) {
      (*((void (**)(id, void *))v8 + 2))(v8, v12);
    }
  }
}

void __63__RTTripSegmentStore__purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  uint64_t v24 = objc_opt_new();
  __int16 v20 = +[RTTripSegmentMO fetchRequest];
  v17 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v22 = [*(id *)(a1 + 32) startDate];
  id v23 = [*(id *)(a1 + 32) endDate];
  id v21 = [v3 predicateWithFormat:@"%@ <= %K AND %K <= %@", v22, @"startDate", @"endDate", v23];
  v26[0] = v21;
  v4 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v19 = [*(id *)(a1 + 32) startDate];
  id v18 = [*(id *)(a1 + 32) endDate];
  uint64_t v16 = [v4 predicateWithFormat:@"%@ <= %K AND %K <= %@", v19, @"startDate", @"startDate", v18];
  v26[1] = v16;
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) startDate];
  id v7 = [*(id *)(a1 + 32) endDate];
  id v8 = [v5 predicateWithFormat:@"%@ <= %K AND %K <= %@", v6, @"endDate", @"endDate", v7];
  v26[2] = v8;
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [*(id *)(a1 + 32) startDate];
  id v11 = [*(id *)(a1 + 32) endDate];
  id v12 = [v9 predicateWithFormat:@"%K <= %@ AND %@ <= %K", @"startDate", v10, v11, @"endDate"];
  v26[3] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  uint64_t v14 = [v17 orPredicateWithSubpredicates:v13];
  [v20 setPredicate:v14];

  [v20 setFetchLimit:100];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v20];
  [v15 setResultType:2];
  [v24 addObject:v15];
  [*(id *)(a1 + 40) executeDeleteRequests:v24 context:v25 handler:*(void *)(a1 + 48)];
}

- (void)purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTTripSegmentStore_purgeTripSegmentsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __62__RTTripSegmentStore_purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeTripSegmentsOnDateInterval:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[RTTripSegmentStore _deleteTripSegmentWithUUID:handler:]";
      __int16 v43 = 1024;
      LODWORD(v44) = 309;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    id v23 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v42 = v23;
    __int16 v43 = 2112;
    v44 = v24;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
  }
  v39 = @"identifier";
  uint64_t v38 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v40 = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  if (v7)
  {
    if (v12)
    {
      id v13 = [v12 allKeys];
      if ([v13 count])
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        v27 = __57__RTTripSegmentStore__deleteTripSegmentWithUUID_handler___block_invoke;
        __int16 v28 = &unk_1E6B937C0;
        id v13 = v13;
        id v29 = v13;
        id v30 = v12;
        id v31 = v7;
        __int16 v32 = self;
        id v14 = v8;
        id v33 = v14;
        uint64_t v15 = (void *)MEMORY[0x1E016DB00](&v25);
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v15, 0, v14, v25, v26, v27, v28);
      }
      goto LABEL_15;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    id v35 = @"requires a non-nil mappings.";
    id v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = &v35;
    __int16 v20 = &v34;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F5CFE8];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37 = @"requires a non-nil uuid.";
    id v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = &v37;
    __int16 v20 = &v36;
  }
  id v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
  id v13 = [v16 errorWithDomain:v17 code:7 userInfo:v21];

  if (v8) {
    (*((void (**)(id, id))v8 + 2))(v8, v13);
  }
LABEL_15:
}

void __57__RTTripSegmentStore__deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v4;
        uint64_t v5 = *(void *)(*((void *)&v23 + 1) + 8 * v4);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * v10) fetchRequest];
              id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", v5, *(void *)(a1 + 48)];
              [v11 setPredicate:v12];

              id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v11];
              [v13 setResultType:2];
              [v3 addObject:v13];

              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }

  [*(id *)(a1 + 56) executeDeleteRequests:v3 context:v14 handler:*(void *)(a1 + 64)];
}

- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTTripSegmentStore_deleteTripSegmentWithUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __56__RTTripSegmentStore_deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteTripSegmentWithUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"the trip segment store doesn't support enumeration";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:7 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return 0;
}

@end