@interface RTBackgroundInertialOdometryStore
- (RTBackgroundInertialOdometryStore)initWithPersistenceManager:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (id)fetchRequestFromStoredBackgroundInertialOdometrySampleOptions:(id)a3;
- (void)_fetchStoredBackgroundInertialOdometrySamplesWithContext:(id)a3 handler:(id)a4;
- (void)_fetchStoredBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4;
- (void)_purgeBackgroundInertialOdometrySamplesPredating:(id)a3 handler:(id)a4;
- (void)fetchStoredBackgroundInertialOdometrySamplesWithContext:(id)a3 handler:(id)a4;
- (void)fetchStoredBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4;
- (void)purgeBackgroundInertialOdometrySamplesPredating:(id)a3 handler:(id)a4;
- (void)storeBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4;
@end

@implementation RTBackgroundInertialOdometryStore

- (RTBackgroundInertialOdometryStore)initWithPersistenceManager:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)RTBackgroundInertialOdometryStore;
  v4 = [(RTStore *)&v10 initWithPersistenceManager:a3];
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
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

- (void)storeBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__RTBackgroundInertialOdometryStore_storeBackgroundInertialOdometrySamples_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __84__RTBackgroundInertialOdometryStore_storeBackgroundInertialOdometrySamples_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeBackgroundInertialOdometrySamples:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredBackgroundInertialOdometrySamplesWithContext:(id)a3 handler:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
LABEL_3:
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __102__RTBackgroundInertialOdometryStore__fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke;
      v23[3] = &unk_1E6B910D8;
      id v24 = v6;
      id v9 = v8;
      id v25 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v23);
      v11 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__RTBackgroundInertialOdometryStore__fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke_2;
      block[3] = &unk_1E6B943D8;
      block[4] = self;
      id v21 = v10;
      id v22 = v9;
      id v12 = v10;
      dispatch_async(v11, block);

      id v13 = v24;
      goto LABEL_12;
    }
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTBackgroundInertialOdometryStore _fetchStoredBackgroundInertialOdometrySamplesWithContext:handler:]";
      __int16 v28 = 1024;
      LODWORD(v29) = 64;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[RTBackgroundInertialOdometryStore _fetchStoredBackgroundInertialOdometrySamplesWithContext:handler:]";
    __int16 v28 = 1024;
    LODWORD(v29) = 65;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  uint64_t v30 = *MEMORY[0x1E4F28568];
  v31[0] = @"A handler is a required parameter.";
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v13];
  v17 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v19;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@: A handler is a required parameter, %@", buf, 0x16u);
  }
LABEL_12:
}

void __102__RTBackgroundInertialOdometryStore__fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v37 = a2;
  v3 = +[RTBackgroundInertialOdometrySampleMO fetchRequest];
  [v3 setReturnsObjectsAsFaults:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"cfAbsTimestamp" ascending:1];
  v45[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v8 = a1;
  uint64_t v36 = a1;
  v34 = [*(id *)(a1 + 32) options];
  id v9 = [v34 dateInterval];
  id v10 = [v9 startDate];
  v11 = [v7 predicateWithFormat:@"%@ <= %K", v10, @"cfAbsTimestamp"];
  v44[0] = v11;
  id v12 = (void *)MEMORY[0x1E4F28F60];
  id v13 = [*(id *)(v8 + 32) options];
  v14 = [v13 dateInterval];
  uint64_t v15 = [v14 endDate];
  v16 = [v12 predicateWithFormat:@"%K <= %@", @"cfAbsTimestamp", v15];
  v44[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  v18 = [v6 andPredicateWithSubpredicates:v17];
  [v3 setPredicate:v18];

  v19 = v3;
  v20 = v37;

  id v42 = 0;
  id v21 = [v37 executeFetchRequest:v3 error:&v42];
  id v22 = v42;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v24 = v36;
  if (!v22)
  {
    v33 = v21;
    v35 = v19;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v25 = v21;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * v29);
          v31 = (void *)MEMORY[0x1E016D870]();
          v32 = [MEMORY[0x1E4F1E598] createWithManagedObject:v30];
          if (v32) {
            [v23 addObject:v32];
          }

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v27);
    }

    uint64_t v24 = v36;
    v20 = v37;
    id v21 = v33;
    v19 = v35;
  }
  (*(void (**)(void))(*(void *)(v24 + 40) + 16))();
}

void __102__RTBackgroundInertialOdometryStore__fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __102__RTBackgroundInertialOdometryStore__fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke_3;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __102__RTBackgroundInertialOdometryStore__fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredBackgroundInertialOdometrySamplesWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__RTBackgroundInertialOdometryStore_fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __101__RTBackgroundInertialOdometryStore_fetchStoredBackgroundInertialOdometrySamplesWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredBackgroundInertialOdometrySamplesWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[RTBackgroundInertialOdometryStore _fetchStoredBackgroundInertialOdometrySamplesWithOptions:handler:]";
      __int16 v12 = 1024;
      int v13 = 130;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CD98]) initWithEnumerationOptions:v6];
  [(RTBackgroundInertialOdometryStore *)self _fetchStoredBackgroundInertialOdometrySamplesWithContext:v9 handler:v7];
}

- (void)fetchStoredBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__RTBackgroundInertialOdometryStore_fetchStoredBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __101__RTBackgroundInertialOdometryStore_fetchStoredBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredBackgroundInertialOdometrySamplesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgeBackgroundInertialOdometrySamplesPredating:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v15 = @"cfAbsTimestamp";
    id v7 = a4;
    uint64_t v14 = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v16 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    [(RTStore *)self purgePredating:v6 predicateMappings:v9 purgeLimit:7200 handler:v7];
  }
  else
  {
    id v10 = (void (**)(id, id))a4;
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTBackgroundInertialOdometryStore _purgeBackgroundInertialOdometrySamplesPredating:handler:]";
      __int16 v21 = 1024;
      int v22 = 151;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18 = @"requires a valid date.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v7 = [v12 errorWithDomain:v13 code:7 userInfo:v9];
    v10[2](v10, v7);
  }
}

- (void)purgeBackgroundInertialOdometrySamplesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__RTBackgroundInertialOdometryStore_purgeBackgroundInertialOdometrySamplesPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __93__RTBackgroundInertialOdometryStore_purgeBackgroundInertialOdometrySamplesPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeBackgroundInertialOdometrySamplesPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (!a5)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      v11 = NSString;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = [v11 stringWithFormat:@"error of type, %@, is not supported", v13];

      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = v14;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];

      id v19 = v18;
      *a5 = v19;

LABEL_8:
      __int16 v21 = 0;
      goto LABEL_13;
    }
    __int16 v21 = [(RTBackgroundInertialOdometryStore *)self fetchRequestFromStoredBackgroundInertialOdometrySampleOptions:v9];
    [v21 setFetchOffset:a4];
  }
  else
  {
    int v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"options");
    __int16 v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v21;
}

- (id)fetchRequestFromStoredBackgroundInertialOdometrySampleOptions:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[RTBackgroundInertialOdometrySampleMO fetchRequest];
    [v4 setReturnsObjectsAsFaults:0];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"cfAbsTimestamp" ascending:1];
    v27[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v4 setSortDescriptors:v6];

    id v7 = [v3 dateInterval];
    id v8 = [v7 startDate];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = v8;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v11 = v10;

    id v12 = [v3 dateInterval];
    id v13 = [v12 endDate];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    uint64_t v16 = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = (void *)MEMORY[0x1E4F28BA0];
    id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ <= %K", v11, @"cfAbsTimestamp"];
    v26[0] = v19;
    v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"cfAbsTimestamp", v16];
    v26[1] = v20;
    __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    int v22 = [v18 andPredicateWithSubpredicates:v21];

    [v17 addObject:v22];
    uint64_t v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
    [v4 setPredicate:v23];
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }
    id v4 = 0;
  }

  return v4;
}

@end