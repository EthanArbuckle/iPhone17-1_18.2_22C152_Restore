@interface RTAuthorizedLocationVisitLogStore
- (BOOL)setTrustedTimeRecentAvailability:(BOOL)a3;
- (BOOL)wasTrustedTimeRecentlyAvailable;
- (RTAuthorizedLocationVisitLogStore)initWithPersistenceManager:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (int64_t)getEraseInstallRetroRegistrationStatus;
- (void)_deleteVisitLogWithUUID:(id)a3 handler:(id)a4;
- (void)_fetchVisitLogWithUUID:(id)a3 handler:(id)a4;
- (void)_fetchVisitLogsWithOptions:(id)a3 handler:(id)a4;
- (void)_purgeVisitLogsOnDateInterval:(id)a3 handler:(id)a4;
- (void)_storeVisitLog:(id)a3 handler:(id)a4;
- (void)_updateVisitLogDistantFutureFlagWithStatus:(int64_t)a3 TrustedTimeAvailability:(BOOL)a4 isRetroRegistration:(BOOL)a5;
- (void)deleteVisitLogWithUUID:(id)a3 handler:(id)a4;
- (void)fetchVisitLogWithUUID:(id)a3 handler:(id)a4;
- (void)fetchVisitLogsWithOptions:(id)a3 handler:(id)a4;
- (void)purgeVisitLogsOnDateInterval:(id)a3 handler:(id)a4;
- (void)purgeVisitLogsPredating:(id)a3 handler:(id)a4;
- (void)setEraseInstallRetroRegistrationStatus:(int64_t)a3;
- (void)storeVisitLog:(id)a3 handler:(id)a4;
@end

@implementation RTAuthorizedLocationVisitLogStore

- (RTAuthorizedLocationVisitLogStore)initWithPersistenceManager:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)RTAuthorizedLocationVisitLogStore;
  v4 = [(RTStore *)&v10 initWithPersistenceManager:a3];
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
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

- (void)_fetchVisitLogsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
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
    v17[2] = __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke;
    v17[3] = &unk_1E6B91060;
    id v18 = v7;
    SEL v20 = a2;
    id v10 = v8;
    id v19 = v10;
    v11 = (void *)MEMORY[0x1E016DB00](v17);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke_20;
    v15[3] = &unk_1E6B90C18;
    id v16 = v10;
    [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v15];
  }
}

void __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTAuthorizedLocationVisitLogMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = [*(id *)(a1 + 32) dateInterval];

  unint64_t v6 = 0x1E4F1C000;
  id v36 = v3;
  if (v5)
  {
    v34 = (void *)MEMORY[0x1E4F28BA0];
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = [*(id *)(a1 + 32) dateInterval];
    v9 = [v8 startDate];
    id v10 = [v7 predicateWithFormat:@"%@ <= %K", v9, @"registrationDate"];
    v52[0] = v10;
    v11 = (void *)MEMORY[0x1E4F28F60];
    v12 = [*(id *)(a1 + 32) dateInterval];
    __int16 v13 = [v12 endDate];
    v14 = [v11 predicateWithFormat:@"%K <= %@", @"registrationDate", v13];
    v52[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    id v16 = [v34 andPredicateWithSubpredicates:v15];
    [v4 setPredicate:v16];

    id v3 = v36;
    unint64_t v6 = 0x1E4F1C000uLL;
  }
  unint64_t v17 = v6;
  id v18 = [*(id *)(a1 + 32) limit];

  if (v18)
  {
    id v19 = [*(id *)(a1 + 32) limit];
    [v4 setFetchLimit:[v19 unsignedIntegerValue]];
  }
  SEL v20 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"registrationDate" ascending:[*(id *)(a1 + 32) isAscending]];
  v51 = v20;
  v21 = [*(id *)(v17 + 2424) arrayWithObjects:&v51 count:1];
  [v4 setSortDescriptors:v21];

  [v4 setFetchBatchSize:10];
  id v41 = 0;
  v22 = [v3 executeFetchRequest:v4 error:&v41];
  id v23 = v41;
  v24 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v32 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v33 = [v22 count];
    *(_DWORD *)buf = 138413058;
    v44 = v32;
    __int16 v45 = 2112;
    v46 = v4;
    __int16 v47 = 2048;
    uint64_t v48 = v33;
    __int16 v49 = 2112;
    id v50 = v23;
    _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v23)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v22 count]];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v35 = v22;
    id v26 = v22;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v38;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = +[RTAuthorizedLocationVisitLog createWithManagedObject:*(void *)(*((void *)&v37 + 1) + 8 * v30)];
          if (v31) {
            [v25 addObject:v31];
          }

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v28);
    }

    v22 = v35;
    id v3 = v36;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVisitLogsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTAuthorizedLocationVisitLogStore_fetchVisitLogsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __71__RTAuthorizedLocationVisitLogStore_fetchVisitLogsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitLogsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchVisitLogWithUUID:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
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
    v17[2] = __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke;
    v17[3] = &unk_1E6B91060;
    id v18 = v7;
    SEL v20 = a2;
    id v10 = v8;
    id v19 = v10;
    v11 = (void *)MEMORY[0x1E016DB00](v17);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke_29;
    v15[3] = &unk_1E6B90C18;
    id v16 = v10;
    [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v15];
  }
}

void __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTAuthorizedLocationVisitLogMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ == %K", *(void *)(a1 + 32), @"visitIdentifier"];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"registrationDate" ascending:1];
  v36[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v4 setSortDescriptors:v7];

  [v4 setFetchLimit:10];
  [v4 setFetchBatchSize:10];
  id v26 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v26];
  id v9 = v26;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v19 = [v8 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    v31 = v4;
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
          unint64_t v17 = +[RTAuthorizedLocationVisitLog createWithManagedObject:*(void *)(*((void *)&v22 + 1) + 8 * v16)];
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

uint64_t __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVisitLogWithUUID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTAuthorizedLocationVisitLogStore_fetchVisitLogWithUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __67__RTAuthorizedLocationVisitLogStore_fetchVisitLogWithUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitLogWithUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_storeVisitLog:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v7 description];
    *(_DWORD *)buf = 138412802;
    unint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@:%@,%@", buf, 0x20u);
  }
  id v15 = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [(RTStore *)self storeWritableObjects:v10 handler:v8];
}

- (void)storeVisitLog:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTAuthorizedLocationVisitLogStore_storeVisitLog_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__RTAuthorizedLocationVisitLogStore_storeVisitLog_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeVisitLog:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)purgeVisitLogsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTAuthorizedLocationVisitLogStore_purgeVisitLogsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__RTAuthorizedLocationVisitLogStore_purgeVisitLogsPredating_handler___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  v2 = [*(id *)(a1 + 32) laterDate:v5];
  id v3 = *(void **)(a1 + 40);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v2];
  [v3 _purgeVisitLogsOnDateInterval:v4 handler:*(void *)(a1 + 48)];
}

- (void)_purgeVisitLogsOnDateInterval:(id)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "-[RTAuthorizedLocationVisitLogStore _purgeVisitLogsOnDateInterval:handler:]";
      __int16 v28 = 1024;
      LODWORD(v29) = 210;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    __int16 v18 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    uint64_t v29 = v19;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
  }
  if (v7)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__RTAuthorizedLocationVisitLogStore__purgeVisitLogsOnDateInterval_handler___block_invoke;
    v20[3] = &unk_1E6B91088;
    id v21 = v7;
    uint64_t v22 = self;
    id v11 = v8;
    id v23 = v11;
    id v12 = (void *)MEMORY[0x1E016DB00](v20);
    [(RTStore *)self _performBlock:v12 contextType:0 errorHandler:v11];

    id v13 = v21;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    long long v25 = @"requires a non-nil dateInterval.";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v13 = [v14 errorWithDomain:v15 code:7 userInfo:v16];

    if (v8) {
      (*((void (**)(id, void *))v8 + 2))(v8, v13);
    }
  }
}

void __75__RTAuthorizedLocationVisitLogStore__purgeVisitLogsOnDateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_new();
  id v5 = +[RTAuthorizedLocationVisitLogMO fetchRequest];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = [*(id *)(a1 + 32) startDate];
  id v9 = [v7 predicateWithFormat:@"%@ < %K", v8, @"registrationDate"];
  v16[0] = v9;
  id v10 = (void *)MEMORY[0x1E4F28F60];
  id v11 = [*(id *)(a1 + 32) endDate];
  id v12 = [v10 predicateWithFormat:@"%K < %@", @"registrationDate", v11];
  v16[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v14 = [v6 andPredicateWithSubpredicates:v13];
  [v5 setPredicate:v14];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v5];
  [v15 setResultType:2];
  [v4 addObject:v15];
  [*(id *)(a1 + 40) executeDeleteRequests:v4 context:v3 handler:*(void *)(a1 + 48)];
}

- (void)purgeVisitLogsOnDateInterval:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTAuthorizedLocationVisitLogStore_purgeVisitLogsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__RTAuthorizedLocationVisitLogStore_purgeVisitLogsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeVisitLogsOnDateInterval:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteVisitLogWithUUID:(id)a3 handler:(id)a4
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
      v42 = "-[RTAuthorizedLocationVisitLogStore _deleteVisitLogWithUUID:handler:]";
      __int16 v43 = 1024;
      LODWORD(v44) = 263;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
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
  long long v39 = @"visitIdentifier";
  uint64_t v38 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  long long v40 = v11;
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
        uint64_t v27 = __69__RTAuthorizedLocationVisitLogStore__deleteVisitLogWithUUID_handler___block_invoke;
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
    __int16 v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = &v35;
    __int16 v20 = &v34;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F5CFE8];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    long long v37 = @"requires a non-nil uuid.";
    __int16 v18 = (void *)MEMORY[0x1E4F1C9E8];
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

void __69__RTAuthorizedLocationVisitLogStore__deleteVisitLogWithUUID_handler___block_invoke(uint64_t a1, void *a2)
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

- (void)deleteVisitLogWithUUID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTAuthorizedLocationVisitLogStore_deleteVisitLogWithUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __68__RTAuthorizedLocationVisitLogStore_deleteVisitLogWithUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteVisitLogWithUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"the authorized location visit log store doesn't support enumeration";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:7 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return 0;
}

- (void)_updateVisitLogDistantFutureFlagWithStatus:(int64_t)a3 TrustedTimeAvailability:(BOOL)a4 isRetroRegistration:(BOOL)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    BOOL v54 = a4;
    BOOL v56 = a5;
    uint64_t v5 = @"00001111-2222-3333-4444-555566667777";
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    BOOL v54 = a4;
    BOOL v56 = a5;
    uint64_t v5 = @"11112222-3333-4444-5555-666677778888";
LABEL_5:
    oslog = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v58 = (void *)[v6 initWithTimeInterval:v7 sinceDate:-120.0];

    v59 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v58 endDate:v59];
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    *(void *)v78 = 0;
    *(void *)&v78[8] = v78;
    *(void *)&v78[16] = 0x3032000000;
    v79 = __Block_byref_object_copy__28;
    v80 = __Block_byref_object_dispose__28;
    id v81 = 0;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke;
    v69[3] = &unk_1E6B90728;
    v71 = v78;
    id v10 = v9;
    v70 = v10;
    v53 = (void *)v8;
    [(RTAuthorizedLocationVisitLogStore *)self purgeVisitLogsOnDateInterval:v8 handler:v69];
    id v12 = (id *)(*(void *)&v78[8] + 40);
    id v11 = *(id *)(*(void *)&v78[8] + 40);
    dsema = v10;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v14))
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      uint64_t v18 = objc_opt_new();
      long long v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_23];
      long long v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v21 = [v20 filteredArrayUsingPredicate:v19];
      long long v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      long long v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      long long v24 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v83 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v83 count:1];
      long long v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v11 = v26;
      }
    }

    objc_storeStrong(v12, v11);
    id v27 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    __int16 v28 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v29 = (void *)[v27 initWithTimeInterval:v28 sinceDate:-60.0];

    v57 = +[RTAuthorizedLocationVisitLog encodeTimeSourceWithValue:v29 isTrusted:v54 isRetroRegistration:v56];

    id v30 = [[RTAuthorizedLocationVisitLog alloc] initWithVisitIdentifier:oslog registrationDate:v57 locationTechnologyAvailability:0];
    dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    v73 = buf;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__28;
    v76 = __Block_byref_object_dispose__28;
    id v77 = 0;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke_2;
    v64[3] = &unk_1E6B937E8;
    v67 = buf;
    v64[4] = self;
    SEL v68 = a2;
    __int16 v32 = v30;
    v65 = v32;
    id v33 = v31;
    v66 = v33;
    [(RTAuthorizedLocationVisitLogStore *)self storeVisitLog:v32 handler:v64];
    uint64_t v34 = (id *)(v73 + 40);
    id v35 = (id)*((void *)v73 + 5);
    uint64_t v36 = v33;
    long long v37 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v38 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v36, v38))
    {
      v61 = [MEMORY[0x1E4F1C9C8] now];
      [v61 timeIntervalSinceDate:v37];
      double v40 = v39;
      id v41 = objc_opt_new();
      v42 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_23];
      __int16 v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v43 filteredArrayUsingPredicate:v42];
      uint64_t v45 = [v44 firstObject];

      [v41 submitToCoreAnalytics:v45 type:1 duration:v40];
      v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v83 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v83, 2u);
      }

      __int16 v47 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28568];
      *(void *)v83 = @"semaphore wait timeout";
      uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:&v82 count:1];
      __int16 v49 = [v47 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v48];

      if (v49)
      {
        id v35 = v49;
      }
    }

    objc_storeStrong(v34, v35);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v78, 8);
    goto LABEL_18;
  }
  oslog = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    id v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    v52 = NSStringFromSelector(a2);
    *(_DWORD *)v78 = 138412546;
    *(void *)&v78[4] = v51;
    *(_WORD *)&v78[12] = 2112;
    *(void *)&v78[14] = v52;
    _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "%@ %@, cannot update VisitLogDistantFutureFlag to RTEraseInstallRetroRegistrationStatusHasNotRun", v78, 0x16u);
  }
LABEL_18:
}

void __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, registered visit retro registration event: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (int64_t)getEraseInstallRetroRegistrationStatus
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00001111-2222-3333-4444-555566667777"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"11112222-3333-4444-5555-666677778888"];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v34 = (void *)[v6 initWithTimeInterval:v7 sinceDate:-120.0];

  id v35 = [MEMORY[0x1E4F1C9C8] distantFuture];
  __int16 v32 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v34 endDate:v35];
  uint64_t v8 = [[RTAuthorizedLocationVisitLogFetchOptions alloc] initWithAscending:0 dateInterval:v32 limit:&unk_1F3450090];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  __int16 v47 = __Block_byref_object_copy__28;
  uint64_t v48 = __Block_byref_object_dispose__28;
  id v49 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __75__RTAuthorizedLocationVisitLogStore_getEraseInstallRetroRegistrationStatus__block_invoke;
  v36[3] = &unk_1E6B93810;
  id v41 = &v44;
  id v30 = v4;
  id v37 = v30;
  dispatch_time_t v38 = self;
  v42 = &v50;
  SEL v43 = a2;
  id v31 = v5;
  id v39 = v31;
  int v10 = v9;
  double v40 = v10;
  id v33 = v8;
  [(RTAuthorizedLocationVisitLogStore *)self fetchVisitLogsWithOptions:v8 handler:v36];
  __int16 v12 = (id *)(v45 + 5);
  id v11 = (id)v45[5];
  id v13 = v10;
  __int16 v14 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] now:v30, v31];
    [v16 timeIntervalSinceDate:v14];
    double v18 = v17;
    long long v19 = objc_opt_new();
    long long v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_23];
    long long v21 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v22 = [v21 filteredArrayUsingPredicate:v20];
    long long v23 = [v22 firstObject];

    [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
    long long v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    long long v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v54 count:1];
    id v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

    if (v27)
    {
      id v11 = v27;
    }
  }

  objc_storeStrong(v12, v11);
  int64_t v28 = v51[3];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v28;
}

void __75__RTAuthorizedLocationVisitLogStore_getEraseInstallRetroRegistrationStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  if (!v6)
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = [v7 visitIdentifier];
    int v9 = [v8 isEqual:*(void *)(a1 + 32)];

    if (v9)
    {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      int v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (objc_class *)objc_opt_class();
        __int16 v12 = NSStringFromClass(v11);
        id v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
        __int16 v14 = [v5 firstObject];
        dispatch_time_t v15 = [v14 visitIdentifier];
        int v23 = 138412802;
        long long v24 = v12;
        __int16 v25 = 2112;
        long long v26 = v13;
        __int16 v27 = 2112;
        int64_t v28 = v15;
        uint64_t v16 = "%@:%@, successfully fetched retro-registration flag, %@, indicating that it is running.";
LABEL_8:
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, 0x20u);

LABEL_11:
      }
    }
    else
    {
      double v17 = [v5 firstObject];
      double v18 = [v17 visitIdentifier];
      int v19 = [v18 isEqual:*(void *)(a1 + 48)];

      uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v19)
      {
        *(void *)(v20 + 24) = 2;
        int v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = (objc_class *)objc_opt_class();
          __int16 v12 = NSStringFromClass(v21);
          id v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
          __int16 v14 = [v5 firstObject];
          dispatch_time_t v15 = [v14 visitIdentifier];
          int v23 = 138412802;
          long long v24 = v12;
          __int16 v25 = 2112;
          long long v26 = v13;
          __int16 v27 = 2112;
          int64_t v28 = v15;
          uint64_t v16 = "%@:%@, successfully fetched retro-registration flag, %@, indicating that it has already run.";
          goto LABEL_8;
        }
      }
      else
      {
        *(void *)(v20 + 24) = 0;
        int v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          long long v22 = (objc_class *)objc_opt_class();
          __int16 v12 = NSStringFromClass(v22);
          id v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
          int v23 = 138412546;
          long long v24 = v12;
          __int16 v25 = 2112;
          long long v26 = v13;
          _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully fetched zero retro-registration flags, indicating that we have not already run.", (uint8_t *)&v23, 0x16u);
          goto LABEL_11;
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)setEraseInstallRetroRegistrationStatus:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, setting status, %d.", (uint8_t *)&v10, 0x1Cu);
  }
  [(RTAuthorizedLocationVisitLogStore *)self _updateVisitLogDistantFutureFlagWithStatus:a3 TrustedTimeAvailability:0 isRetroRegistration:1];
}

- (BOOL)wasTrustedTimeRecentlyAvailable
{
  v66[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"11112222-3333-4444-5555-666677778888"];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v39 = (void *)[v3 initWithTimeInterval:v4 sinceDate:-120.0];

  double v40 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v35 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v39 endDate:v40];
  id v5 = [[RTAuthorizedLocationVisitLogFetchOptions alloc] initWithAscending:0 dateInterval:v35 limit:&unk_1F3450090];
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__28;
  v59 = __Block_byref_object_dispose__28;
  id v60 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__28;
  uint64_t v53 = __Block_byref_object_dispose__28;
  id v54 = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __68__RTAuthorizedLocationVisitLogStore_wasTrustedTimeRecentlyAvailable__block_invoke;
  v42[3] = &unk_1E6B93838;
  uint64_t v46 = &v49;
  id v34 = v2;
  id v43 = v34;
  uint64_t v44 = self;
  __int16 v47 = &v55;
  SEL v48 = a2;
  uint64_t v7 = v6;
  uint64_t v45 = v7;
  uint64_t v36 = v5;
  [(RTAuthorizedLocationVisitLogStore *)self fetchVisitLogsWithOptions:v5 handler:v42];
  uint64_t v8 = (id *)(v50 + 5);
  id v9 = (id)v50[5];
  int v10 = v7;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v10, v12))
  {
    id v13 = [MEMORY[0x1E4F1C9C8] now:v34];
    [v13 timeIntervalSinceDate:v11];
    double v15 = v14;
    uint64_t v16 = objc_opt_new();
    double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_23];
    double v18 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v19 = [v18 filteredArrayUsingPredicate:v17];
    uint64_t v20 = [v19 firstObject];

    [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
    long long v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    long long v22 = (void *)MEMORY[0x1E4F28C58];
    v66[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v66 count:1];
    long long v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

    if (v24)
    {
      id v9 = v24;
    }
  }

  objc_storeStrong(v8, v9);
  __int16 v25 = (void *)v56[5];
  if (v25)
  {
    LOBYTE(v66[0]) = 0;
    char v41 = 0;
    long long v26 = [v25 registrationDate];
    BOOL v27 = +[RTAuthorizedLocationVisitLog decodeTimeSourceWithValue:v26 isRetroRegistration:v66 isTrusted:&v41];

    if (v41) {
      BOOL v28 = v27;
    }
    else {
      BOOL v28 = 0;
    }
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v62 = 2112;
      v63 = v33;
      __int16 v64 = 1024;
      BOOL v65 = v28;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@:%@, decoded  trusted-time availability flag. trustedTimeWasAvailable, %d.", buf, 0x1Cu);
    }
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v28;
}

void __68__RTAuthorizedLocationVisitLogStore_wasTrustedTimeRecentlyAvailable__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (!v6)
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = [v7 visitIdentifier];
    int v9 = [v8 isEqual:*(void *)(a1 + 32)];

    if (v9)
    {
      uint64_t v10 = [v5 firstObject];
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      dispatch_time_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      id v13 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = (objc_class *)objc_opt_class();
        double v15 = NSStringFromClass(v14);
        uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 72));
        double v17 = [v5 firstObject];
        double v18 = [v17 visitIdentifier];
        int v20 = 138412802;
        long long v21 = v15;
        __int16 v22 = 2112;
        int v23 = v16;
        __int16 v24 = 2112;
        __int16 v25 = v18;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully fetched trusted-time availability flag, %@.", (uint8_t *)&v20, 0x20u);

LABEL_7:
      }
    }
    else
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = (objc_class *)objc_opt_class();
        double v15 = NSStringFromClass(v19);
        uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 72));
        int v20 = 138412546;
        long long v21 = v15;
        __int16 v22 = 2112;
        int v23 = v16;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully fetched zero trusted-time availability flags.", (uint8_t *)&v20, 0x16u);
        goto LABEL_7;
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)setTrustedTimeRecentAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(RTAuthorizedLocationVisitLogStore *)self getEraseInstallRetroRegistrationStatus];
  if (v5 == 2) {
    [(RTAuthorizedLocationVisitLogStore *)self _updateVisitLogDistantFutureFlagWithStatus:2 TrustedTimeAvailability:v3 isRetroRegistration:0];
  }
  return v5 == 2;
}

@end