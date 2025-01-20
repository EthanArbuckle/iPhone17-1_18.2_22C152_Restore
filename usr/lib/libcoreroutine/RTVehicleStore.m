@interface RTVehicleStore
+ (int64_t)periodicPurgePolicy;
- (RTVehicleStore)initWithPersistenceManager:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_fetchVehiclesWithOptions:(id)a3 handler:(id)a4;
- (void)_purgeVehiclesPredating:(id)a3 handler:(id)a4;
- (void)_storeVehicle:(id)a3 handler:(id)a4;
- (void)fetchVehiclesWithOptions:(id)a3 handler:(id)a4;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)purgeVehiclesPredating:(id)a3 handler:(id)a4;
- (void)storeVehicle:(id)a3 handler:(id)a4;
@end

@implementation RTVehicleStore

- (RTVehicleStore)initWithPersistenceManager:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)RTVehicleStore;
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

- (void)_fetchVehiclesWithOptions:(id)a3 handler:(id)a4
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
    v17[2] = __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke;
    v17[3] = &unk_1E6B91060;
    id v18 = v7;
    SEL v20 = a2;
    id v10 = v8;
    id v19 = v10;
    v11 = (void *)MEMORY[0x1E016DB00](v17);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke_16;
    v15[3] = &unk_1E6B90C18;
    id v16 = v10;
    [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v15];
  }
}

void __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  v63[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTVehicleMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = [*(id *)(a1 + 32) dateInterval];

  id v47 = v3;
  v48 = v4;
  if (v5)
  {
    v38 = (void *)MEMORY[0x1E4F28BA0];
    v6 = (void *)MEMORY[0x1E4F28F60];
    v46 = [*(id *)(a1 + 32) dateInterval];
    v44 = [v46 startDate];
    v45 = [*(id *)(a1 + 32) dateInterval];
    v43 = [v45 endDate];
    v42 = [v6 predicateWithFormat:@"%@ <= %K AND %K <= %@", v44, @"startDate", @"endDate", v43];
    v63[0] = v42;
    id v7 = (void *)MEMORY[0x1E4F28F60];
    v41 = [*(id *)(a1 + 32) dateInterval];
    v39 = [v41 startDate];
    v40 = [*(id *)(a1 + 32) dateInterval];
    v37 = [v40 endDate];
    v36 = [v7 predicateWithFormat:@"%@ <= %K AND %K <= %@", v39, @"startDate", @"startDate", v37];
    v63[1] = v36;
    id v8 = (void *)MEMORY[0x1E4F28F60];
    v35 = [*(id *)(a1 + 32) dateInterval];
    v33 = [v35 startDate];
    v34 = [*(id *)(a1 + 32) dateInterval];
    v9 = [v34 endDate];
    id v10 = [v8 predicateWithFormat:@"%@ <= %K AND %K <= %@", v33, @"endDate", @"endDate", v9];
    v63[2] = v10;
    v11 = (void *)MEMORY[0x1E4F28F60];
    v12 = [*(id *)(a1 + 32) dateInterval];
    __int16 v13 = [v12 startDate];
    v14 = [*(id *)(a1 + 32) dateInterval];
    uint64_t v15 = [v14 endDate];
    id v16 = [v11 predicateWithFormat:@"%K <= %@ AND %@ <= %K", @"startDate", v13, v15, @"endDate"];
    v63[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
    id v18 = [v38 orPredicateWithSubpredicates:v17];
    [v48 setPredicate:v18];

    v4 = v48;
    id v3 = v47;
  }
  id v19 = [*(id *)(a1 + 32) limit];

  if (v19)
  {
    SEL v20 = [*(id *)(a1 + 32) limit];
    [v4 setFetchLimit:[v20 unsignedIntegerValue]];
  }
  [v4 setFetchBatchSize:100];
  id v53 = 0;
  v21 = [v3 executeFetchRequest:v4 error:&v53];
  id v22 = v53;
  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v31 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v32 = [v21 count];
    *(_DWORD *)buf = 138413058;
    v56 = v31;
    __int16 v57 = 2112;
    v58 = v4;
    __int16 v59 = 2048;
    uint64_t v60 = v32;
    __int16 v61 = 2112;
    id v62 = v22;
    _os_log_debug_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v22)
  {
    v24 = 0;
  }
  else
  {
    v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v21 count]];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v25 = v21;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v50;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [MEMORY[0x1E4F5CFB8] createWithManagedObject:*(void *)(*((void *)&v49 + 1) + 8 * v29)];
          if (v30) {
            [v24 addObject:v30];
          }

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v27);
    }

    id v3 = v47;
    v4 = v48;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVehiclesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTVehicleStore_fetchVehiclesWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__RTVehicleStore_fetchVehiclesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVehiclesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_storeVehicle:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      id v16 = [v7 description];
      *(_DWORD *)buf = 138412802;
      id v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      __int16 v23 = v16;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ invoked on Vehicle %@", buf, 0x20u);
    }
    id v17 = v7;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [(RTStore *)self storeWritableObjects:v11 handler:v8];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "RTVehicleStore::storeVehicle invoked with nil vehicle, not storing nil vehicle.", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    v11 = (void *)[v12 initWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:0];
    v8[2](v8, v11);
  }
}

- (void)storeVehicle:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__RTVehicleStore_storeVehicle_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __39__RTVehicleStore_storeVehicle_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeVehicle:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgeVehiclesPredating:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
  }
  id v16 = @"endDate";
  uint64_t v15 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v17 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  [(RTStore *)self purgePredating:v8 predicateMappings:v11 handler:v7];
}

- (void)purgeVehiclesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__RTVehicleStore_purgeVehiclesPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __49__RTVehicleStore_purgeVehiclesPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeVehiclesPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v17 = v10;
  int64_t v18 = a3;
  id v15 = v9;
  id v16 = self;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    id v3 = v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v6[3] = &unk_1E6B90890;
    uint64_t v8 = *(void *)(a1 + 64);
    v4 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v4 purgeVehiclesPredating:v3 handler:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, performPurgeOfType, error, %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  int v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"The vehicle store doesn't support enumeration";
  __int16 v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:7 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return 0;
}

@end