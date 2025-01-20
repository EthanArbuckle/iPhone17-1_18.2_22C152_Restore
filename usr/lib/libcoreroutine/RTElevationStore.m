@interface RTElevationStore
+ (id)fetchRequestFromStoredElevationOptions:(id)a3;
- (RTElevationStore)initWithPersistenceManager:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_fetchStoredElevationsWithContext:(id)a3 handler:(id)a4;
- (void)_fetchStoredElevationsWithOptions:(id)a3 handler:(id)a4;
- (void)_removeElevations:(id)a3 handler:(id)a4;
- (void)_removeElevationsPredating:(id)a3 handler:(id)a4;
- (void)_removeInterimElevations:(id)a3 handler:(id)a4;
- (void)_storeElevations:(id)a3 handler:(id)a4;
- (void)fetchStoredElevationsWithContext:(id)a3 handler:(id)a4;
- (void)fetchStoredElevationsWithOptions:(id)a3 handler:(id)a4;
- (void)removeElevations:(id)a3 handler:(id)a4;
- (void)removeElevationsPredating:(id)a3 handler:(id)a4;
- (void)removeInterimElevations:(id)a3 handler:(id)a4;
- (void)storeElevations:(id)a3 handler:(id)a4;
@end

@implementation RTElevationStore

- (RTElevationStore)initWithPersistenceManager:(id)a3
{
  v3 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTElevationStore;
    v5 = -[RTStore initWithPersistenceManager:](&v13, sel_initWithPersistenceManager_);
    if (v5)
    {
      v6 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v15 = v11;
        __int16 v16 = 2112;
        v17 = v12;
        _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ success.", buf, 0x16u);
      }
    }
    v3 = v5;
    v7 = v3;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (void)_storeElevations:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_super v13 = NSStringFromSelector(a2);
    int v17 = 138412546;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", (uint8_t *)&v17, 0x16u);
  }
  [(RTStore *)self storeWritableObjects:v8 handler:v7];

  v10 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    __int16 v16 = NSStringFromSelector(a2);
    int v17 = 138412546;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ completed", (uint8_t *)&v17, 0x16u);
  }
}

- (void)storeElevations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__RTElevationStore_storeElevations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __44__RTElevationStore_storeElevations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeElevations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredElevationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[RTElevationStore _fetchStoredElevationsWithOptions:handler:]";
      __int16 v12 = 1024;
      int v13 = 65;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CF20]) initWithEnumerationOptions:v6];
  [(RTElevationStore *)self _fetchStoredElevationsWithContext:v9 handler:v7];
}

- (void)fetchStoredElevationsWithOptions:(id)a3 handler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dateInterval];

  if (v8)
  {
    id v9 = [(RTNotifier *)self queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__RTElevationStore_fetchStoredElevationsWithOptions_handler___block_invoke;
    v14[3] = &unk_1E6B90660;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v9, v14);
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"requires valid dateInterval";
    __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    int v13 = [v10 errorWithDomain:v11 code:7 userInfo:v12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

uint64_t __61__RTElevationStore_fetchStoredElevationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredElevationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredElevationsWithContext:(id)a3 handler:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__RTElevationStore__fetchStoredElevationsWithContext_handler___block_invoke;
    v22[3] = &unk_1E6B91018;
    id v23 = v7;
    v24 = self;
    SEL v26 = a2;
    id v9 = v8;
    id v25 = v9;
    int v10 = (void *)MEMORY[0x1E016DB00](v22);
    uint64_t v11 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__RTElevationStore__fetchStoredElevationsWithContext_handler___block_invoke_10;
    block[3] = &unk_1E6B943D8;
    block[4] = self;
    id v20 = v10;
    id v21 = v9;
    id v12 = v10;
    dispatch_async(v11, block);

    int v13 = v23;
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTElevationStore _fetchStoredElevationsWithContext:handler:]";
      __int16 v29 = 1024;
      LODWORD(v30) = 92;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"A handler is a required parameter.";
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v13];
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      uint64_t v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@: A handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __62__RTElevationStore__fetchStoredElevationsWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  id v7 = objc_opt_class();
  id v8 = [v6 options];
  id v9 = [v7 fetchRequestFromStoredElevationOptions:v8];

  [v9 setFetchOffset:[*(id *)(a1 + 32) offset]];
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412802;
    v39 = v24;
    __int16 v40 = 2048;
    uint64_t v41 = [v9 fetchLimit];
    __int16 v42 = 2048;
    uint64_t v43 = [v9 fetchOffset];
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@: using options fetch limit, %lu, fetch offset, %lu", buf, 0x20u);
  }
  id v36 = 0;
  uint64_t v11 = [v3 executeFetchRequest:v9 error:&v36];
  id v12 = v36;
  int v13 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v25 = (objc_class *)objc_opt_class();
    SEL v26 = NSStringFromClass(v25);
    v27 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v28 = [v11 count];
    *(_DWORD *)buf = 138413314;
    v39 = v26;
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v27;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v9;
    __int16 v44 = 2048;
    uint64_t v45 = v28;
    __int16 v46 = 2112;
    id v47 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@: %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v9 fetchLimit]];
  if (!v12)
  {
    uint64_t v29 = a1;
    v30 = v6;
    id v31 = v3;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v21 = (void *)MEMORY[0x1E016D870]();
          v22 = [MEMORY[0x1E4F5CDC0] createWithManagedObject:v20];
          if (v22) {
            [v14 addObject:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v17);
    }

    id v6 = v30;
    id v3 = v31;
    a1 = v29;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __62__RTElevationStore__fetchStoredElevationsWithContext_handler___block_invoke_10(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__RTElevationStore__fetchStoredElevationsWithContext_handler___block_invoke_2;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __62__RTElevationStore__fetchStoredElevationsWithContext_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredElevationsWithContext:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 options];
  id v9 = [v8 dateInterval];

  if (!v9)
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"requires valid dateInterval";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    int v13 = [v10 errorWithDomain:v11 code:7 userInfo:v12];
    v7[2](v7, 0, v13);
  }
  uint64_t v14 = [(RTNotifier *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__RTElevationStore_fetchStoredElevationsWithContext_handler___block_invoke;
  v17[3] = &unk_1E6B90660;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(v14, v17);
}

uint64_t __61__RTElevationStore_fetchStoredElevationsWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredElevationsWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeElevationsPredating:(id)a3 handler:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue();
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
    }
    uint64_t v20 = @"endDate";
    uint64_t v19 = objc_opt_class();
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    id v21 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];

    [(RTStore *)self purgePredating:v7 predicateMappings:v11 purgeLimit:5760 handler:v8];
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[RTElevationStore _removeElevationsPredating:handler:]";
      __int16 v24 = 1024;
      LODWORD(v25) = 168;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    int v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"requires a valid date.";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v15 = [v13 errorWithDomain:v14 code:7 userInfo:v11];
    v8[2](v8, v15);

    id v8 = (void (**)(id, uint64_t))v15;
  }
}

- (void)removeElevationsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RTElevationStore_removeElevationsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __54__RTElevationStore_removeElevationsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeElevationsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeInterimElevations:(id)a3 handler:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v18 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__RTElevationStore__removeInterimElevations_handler___block_invoke;
    v20[3] = &unk_1E6B91088;
    id v21 = v7;
    v22 = self;
    id v10 = v8;
    id v23 = v10;
    uint64_t v11 = (void *)MEMORY[0x1E016DB00](v20);
    [(RTStore *)self _performBlock:v11 contextType:0 errorHandler:v10];

    id v12 = v21;
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[RTElevationStore _removeInterimElevations:handler:]";
      __int16 v26 = 1024;
      LODWORD(v27) = 199;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"requires a valid date interval.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v16 = [v14 errorWithDomain:v15 code:7 userInfo:v12];
    (*((void (**)(id, void *))v8 + 2))(v8, v16);
  }
}

void __53__RTElevationStore__removeInterimElevations_handler___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTElevationMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) startDate];
  id v7 = [*(id *)(a1 + 32) endDate];
  id v8 = [v5 predicateWithFormat:@"%@ =< %K AND %K =< %@ AND %K != %@", v6, @"endDate", @"endDate", v7, @"estimationStatus", &unk_1F3450318];
  [v4 setPredicate:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v9 setResultType:2];
  id v10 = *(void **)(a1 + 40);
  v12[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v10 executeDeleteRequests:v11 context:v3 handler:*(void *)(a1 + 48)];
}

- (void)removeInterimElevations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RTElevationStore_removeInterimElevations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__RTElevationStore_removeInterimElevations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeInterimElevations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeElevations:(id)a3 handler:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v18 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__RTElevationStore__removeElevations_handler___block_invoke;
    v20[3] = &unk_1E6B91088;
    id v21 = v7;
    v22 = self;
    id v10 = v8;
    id v23 = v10;
    uint64_t v11 = (void *)MEMORY[0x1E016DB00](v20);
    [(RTStore *)self _performBlock:v11 contextType:0 errorHandler:v10];

    id v12 = v21;
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[RTElevationStore _removeElevations:handler:]";
      __int16 v26 = 1024;
      LODWORD(v27) = 249;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"requires a valid date interval.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v16 = [v14 errorWithDomain:v15 code:7 userInfo:v12];
    (*((void (**)(id, void *))v8 + 2))(v8, v16);
  }
}

void __46__RTElevationStore__removeElevations_handler___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTElevationMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) startDate];
  id v7 = [*(id *)(a1 + 32) endDate];
  id v8 = [v5 predicateWithFormat:@"%@ =< %K AND %K =< %@", v6, @"endDate", @"endDate", v7];
  [v4 setPredicate:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v9 setResultType:2];
  id v10 = *(void **)(a1 + 40);
  v12[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v10 executeDeleteRequests:v11 context:v3 handler:*(void *)(a1 + 48)];
}

- (void)removeElevations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__RTElevationStore_removeElevations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __45__RTElevationStore_removeElevations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeElevations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!a5)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

LABEL_12:
    id v10 = 0;
    goto LABEL_13;
  }
  if (v7)
  {
    id v9 = objc_opt_class();
    if ([v9 isEqual:objc_opt_class()])
    {
      id v10 = [(id)objc_opt_class() fetchRequestFromStoredElevationOptions:v8];
      [v10 setFetchOffset:a4];
      goto LABEL_13;
    }
    id v13 = NSString;
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = [v13 stringWithFormat:@"error of type, %@, is not supported", v15];

    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = v16;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v20 = [v17 errorWithDomain:v18 code:7 userInfo:v19];

    id v21 = v20;
    *a5 = v21;

    goto LABEL_12;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
  }

  _RTErrorInvalidParameterCreate(@"options");
  id v10 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v10;
}

+ (id)fetchRequestFromStoredElevationOptions:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[RTElevationMO fetchRequest];
    [v4 setReturnsObjectsAsFaults:0];
    id v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [v3 dateInterval];
    id v7 = [v6 startDate];
    id v8 = [v3 dateInterval];
    id v9 = [v8 endDate];
    id v10 = [v5 predicateWithFormat:@"%@ =< %K AND %K =< %@", v7, @"endDate", @"endDate", v9];
    [v4 setPredicate:v10];

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"endDate" ascending:1];
    v18[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v4 setSortDescriptors:v12];

    [v4 setFetchBatchSize:100];
    if ([v3 batchSize])
    {
      unint64_t v13 = [v3 batchSize];
      if (v13 >= 0xE10) {
        uint64_t v14 = 3600;
      }
      else {
        uint64_t v14 = v13;
      }
    }
    else
    {
      uint64_t v14 = 3600;
    }
    [v4 setFetchLimit:v14];
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

@end