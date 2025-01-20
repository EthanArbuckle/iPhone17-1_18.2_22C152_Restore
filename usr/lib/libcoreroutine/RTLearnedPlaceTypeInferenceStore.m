@interface RTLearnedPlaceTypeInferenceStore
+ (id)fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:(id)a3 error:(id *)a4;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLearnedPlaceTypeInferenceStore)init;
- (RTLearnedPlaceTypeInferenceStore)initWithPersistenceManager:(id)a3 learnedLocationStore:(id)a4;
- (id)_getLearnedPlacesMapFromLearnedPlaceIdentifiers:(id)a3 error:(id *)a4;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_deletedLearnedPlaceTypeInferencesPredating:(id)a3 handler:(id)a4;
- (void)_fetchLearnedPlaceTypeInferencesCountWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchLearnedPlaceTypeInferencesWithOptions:(id)a3 handler:(id)a4;
- (void)_logCacheStoreWithReason:(id)a3 handler:(id)a4;
- (void)_storeLearnedPlaceTypeInferences:(id)a3 handler:(id)a4;
- (void)deletedLearnedPlaceTypeInferencesPredating:(id)a3 handler:(id)a4;
- (void)fetchLearnedPlaceTypeInferencesCountWithOptions:(id)a3 handler:(id)a4;
- (void)fetchLearnedPlaceTypeInferencesWithOptions:(id)a3 handler:(id)a4;
- (void)logCacheStoreWithReason:(id)a3 handler:(id)a4;
- (void)storeLearnedPlaceTypeInferences:(id)a3 handler:(id)a4;
@end

@implementation RTLearnedPlaceTypeInferenceStore

- (RTLearnedPlaceTypeInferenceStore)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_learnedLocationStore_);
}

- (RTLearnedPlaceTypeInferenceStore)initWithPersistenceManager:(id)a3 learnedLocationStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: persistenceManager";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTLearnedPlaceTypeInferenceStore;
  v9 = [(RTStore *)&v15 initWithPersistenceManager:v6];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_learnedLocationStore, a4);
  }
  self = v10;
  v11 = self;
LABEL_10:

  return v11;
}

- (void)storeLearnedPlaceTypeInferences:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__RTLearnedPlaceTypeInferenceStore_storeLearnedPlaceTypeInferences_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __76__RTLearnedPlaceTypeInferenceStore_storeLearnedPlaceTypeInferences_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeLearnedPlaceTypeInferences:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_storeLearnedPlaceTypeInferences:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    int v13 = 138412802;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = [v7 count];
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, %@, storing learnedPlaceTypeInferences with count, %lu", (uint8_t *)&v13, 0x20u);
  }
  [(RTStore *)self storeWritableObjects:v7 handler:v8];
}

- (void)fetchLearnedPlaceTypeInferencesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __87__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLearnedPlaceTypeInferencesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchLearnedPlaceTypeInferencesWithOptions:(id)a3 handler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke;
    v19[3] = &unk_1E6B91018;
    v19[4] = self;
    id v20 = v7;
    id v9 = v8;
    id v21 = v9;
    SEL v22 = a2;
    id v10 = (void *)MEMORY[0x1E016DB00](v19);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke_8;
    v17[3] = &unk_1E6B90C18;
    id v18 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v17];
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTLearnedPlaceTypeInferenceStore _fetchLearnedPlaceTypeInferencesWithOptions:handler:]";
      __int16 v25 = 1024;
      LODWORD(v26) = 86;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"handler is a required parameter.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];
    v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_class();
  uint64_t v37 = a1;
  uint64_t v5 = *(void *)(a1 + 40);
  id v43 = 0;
  id v6 = [v4 fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:v5 error:&v43];
  id v7 = v43;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __int16 v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    uint64_t v27 = [v6 fetchBatchSize];
    uint64_t v28 = [v6 fetchOffset];
    *(_DWORD *)buf = 138413058;
    v46 = v26;
    __int16 v47 = 2048;
    uint64_t v48 = v27;
    __int16 v49 = 2048;
    uint64_t v50 = v28;
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);
  }
  if (v7)
  {
    (*(void (**)(void))(*(void *)(v37 + 48) + 16))();
  }
  else
  {
    id v42 = 0;
    id v9 = [v3 executeFetchRequest:v6 error:&v42];
    id v7 = v42;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      v31 = NSStringFromSelector(*(SEL *)(v37 + 56));
      uint64_t v32 = [v9 count];
      *(_DWORD *)buf = 138413314;
      v46 = v30;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v31;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v6;
      __int16 v51 = 2048;
      uint64_t v52 = v32;
      __int16 v53 = 2112;
      id v54 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@: %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
    }
    v11 = objc_opt_new();
    if (v7)
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        __int16 v15 = NSStringFromSelector(*(SEL *)(v37 + 56));
        *(_DWORD *)buf = 138412802;
        v46 = v14;
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v15;
        __int16 v49 = 2112;
        uint64_t v50 = (uint64_t)v7;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@: %@, error, %@", buf, 0x20u);
      }
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v34 = v9;
      id v12 = v9;
      uint64_t v16 = [v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        id v33 = v3;
        uint64_t v18 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v12);
            }
            id v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            id v21 = (void *)MEMORY[0x1E016D870]();
            SEL v22 = +[RTLearnedPlaceTypeInference createWithManagedObject:v20];
            if (v22)
            {
              [v11 addObject:v22];
            }
            else
            {
              v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v24 = (objc_class *)objc_opt_class();
                v36 = NSStringFromClass(v24);
                v35 = NSStringFromSelector(*(SEL *)(v37 + 56));
                *(_DWORD *)buf = 138413058;
                v46 = v36;
                __int16 v47 = 2112;
                uint64_t v48 = (uint64_t)v35;
                __int16 v49 = 2112;
                uint64_t v50 = (uint64_t)v20;
                __int16 v51 = 2112;
                uint64_t v52 = 0;
                _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@: %@, learnedPlaceTypeInference MO, %@, learnedPlaceTypeInference, %@", buf, 0x2Au);
              }
            }
          }
          uint64_t v17 = [v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v17);
        id v3 = v33;
        id v7 = 0;
      }
      id v9 = v34;
    }

    (*(void (**)(void))(*(void *)(v37 + 48) + 16))();
  }
}

uint64_t __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLearnedPlaceTypeInferencesCountWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __92__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLearnedPlaceTypeInferencesCountWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchLearnedPlaceTypeInferencesCountWithOptions:(id)a3 handler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke;
    v19[3] = &unk_1E6B91018;
    v19[4] = self;
    id v20 = v7;
    id v9 = v8;
    id v21 = v9;
    SEL v22 = a2;
    id v10 = (void *)MEMORY[0x1E016DB00](v19);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke_10;
    v17[3] = &unk_1E6B90C18;
    id v18 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v17];
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTLearnedPlaceTypeInferenceStore _fetchLearnedPlaceTypeInferencesCountWithOptions:handler:]";
      __int16 v25 = 1024;
      LODWORD(v26) = 170;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"handler is a required parameter.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];
    v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      uint64_t v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);
  id v24 = 0;
  id v6 = [v4 fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:v5 error:&v24];
  id v7 = v24;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = [v6 fetchBatchSize];
    uint64_t v15 = [v6 fetchOffset];
    *(_DWORD *)buf = 138413058;
    v26 = v13;
    __int16 v27 = 2048;
    uint64_t v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v15;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);
  }
  if (v7) {
    goto LABEL_7;
  }
  id v23 = 0;
  uint64_t v9 = [v3 countForFetchRequest:v6 error:&v23];
  id v7 = v23;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v18 = [v6 fetchBatchSize];
    uint64_t v19 = [v6 fetchOffset];
    *(_DWORD *)buf = 138413058;
    v26 = v17;
    __int16 v27 = 2048;
    uint64_t v28 = v18;
    __int16 v29 = 2048;
    uint64_t v30 = v19;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);
  }
  if (v7)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      SEL v22 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138413314;
      v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v22;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v6;
      __int16 v31 = 2048;
      uint64_t v32 = v9;
      __int16 v33 = 2112;
      uint64_t v34 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total learnedPlaceTypeInferences count, %lu, error, %@", buf, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v7 = 0;
  }
}

uint64_t __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletedLearnedPlaceTypeInferencesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__RTLearnedPlaceTypeInferenceStore_deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __87__RTLearnedPlaceTypeInferenceStore_deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deletedLearnedPlaceTypeInferencesPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deletedLearnedPlaceTypeInferencesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__RTLearnedPlaceTypeInferenceStore__deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke;
    v10[3] = &unk_1E6B91088;
    id v11 = v6;
    id v12 = self;
    id v8 = v7;
    id v13 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v10);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];
  }
}

void __88__RTLearnedPlaceTypeInferenceStore__deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTLearnedPlaceTypeInferenceMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K < %@)", @"creationDate", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (void)logCacheStoreWithReason:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTLearnedPlaceTypeInferenceStore_logCacheStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __68__RTLearnedPlaceTypeInferenceStore_logCacheStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logCacheStoreWithReason:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_logCacheStoreWithReason:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke;
  v13[3] = &unk_1E6B91018;
  id v14 = v7;
  uint64_t v15 = self;
  SEL v17 = a2;
  id v16 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_25;
  v11[3] = &unk_1E6B90C18;
  id v12 = v16;
  id v9 = v16;
  id v10 = v7;
  [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v11];
}

void __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  __int16 v33 = (void *)a1;
  if (*(void *)(a1 + 32))
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "start logging cache store with reason, %@", buf, 0xCu);
    }
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __int16 v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);
    __int16 v29 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    v45 = v28;
    __int16 v46 = 2112;
    __int16 v47 = v29;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, calling the fetch request", buf, 0x16u);
  }
  id v42 = 0;
  __int16 v31 = objc_alloc_init(RTLearnedPlaceTypeInferenceEnumerationOptions);
  id v7 = [(id)objc_opt_class() fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:v31 error:&v42];
  id v8 = v42;
  [v7 setFetchLimit:5];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    v45 = v30;
    __int16 v46 = 2112;
    __int16 v47 = v7;
    __int16 v48 = 2112;
    id v49 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);
  }
  id v10 = 0;
  uint64_t v32 = v3;
  while (1)
  {
    id v11 = (void *)MEMORY[0x1E016D870]();
    id v41 = v8;
    id v12 = [v3 executeFetchRequest:v7 error:&v41];
    id v13 = v41;

    if (v13) {
      break;
    }
    id v14 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v10 = v12;
    uint64_t v15 = [v10 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v20 = [v19 learnedPlaceIdentifier];

          if (v20)
          {
            id v21 = [v19 learnedPlaceIdentifier];
            [v14 addObject:v21];
          }
        }
        uint64_t v16 = [v10 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v16);
    }

    SEL v22 = (void *)v33[5];
    id v36 = 0;
    id v23 = [v22 _getLearnedPlacesMapFromLearnedPlaceIdentifiers:v14 error:&v36];
    id v13 = v36;

    if (v13)
    {

      id v3 = v32;
      break;
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_23;
    v34[3] = &unk_1E6B9A3C0;
    id v35 = v23;
    [v10 enumerateObjectsUsingBlock:v34];
    [v7 setFetchOffset:[v7 fetchOffset] + [v10 count]];
    id v3 = v32;
    [v32 reset];

    id v8 = 0;
    if (![v10 count]) {
      goto LABEL_25;
    }
  }
LABEL_25:
  if (v33[4])
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = (void *)v33[4];
      *(_DWORD *)buf = 138412290;
      v45 = v25;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEFAULT, "end logging cache store with reason, %@", buf, 0xCu);
    }
  }
  uint64_t v26 = v33[6];
  if (v26) {
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v13);
  }
}

void __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[RTLearnedPlaceTypeInference createWithManagedObject:a2];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    uint64_t v17 = (void *)(a3 + 1);
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "index, %lu, learned place type inference, %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v7 = [v5 learnedPlaceIdentifier];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = *(void **)(a1 + 32);
    id v10 = [v5 learnedPlaceIdentifier];
    id v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = *(void **)(a1 + 32);
        id v14 = [v5 learnedPlaceIdentifier];
        uint64_t v15 = [v13 objectForKeyedSubscript:v14];
        int v16 = 138412290;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "learned place, %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

uint64_t __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_25(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_getLearnedPlacesMapFromLearnedPlaceIdentifiers:(id)a3 error:(id *)a4
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceIdentifiers", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"learnedPlaceIdentifiers");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (![v6 count])
  {
LABEL_12:
    id v8 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_35;
  }
  aSelector = a2;
  *(void *)buf = 0;
  v66 = buf;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__115;
  v69 = __Block_byref_object_dispose__115;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__115;
  v63 = __Block_byref_object_dispose__115;
  id v64 = 0;
  id v8 = objc_opt_new();
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(RTLearnedPlaceTypeInferenceStore *)self learnedLocationStore];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __90__RTLearnedPlaceTypeInferenceStore__getLearnedPlacesMapFromLearnedPlaceIdentifiers_error___block_invoke;
  v55[3] = &unk_1E6B905F0;
  v57 = &v59;
  v58 = buf;
  id v11 = v9;
  v56 = v11;
  [v10 fetchPlacesWithIdentifiers:v7 handler:v55];

  id v12 = v11;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_13;
  }
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] now:aSelector];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  __int16 v18 = objc_opt_new();
  uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_88];
  uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v21 = [v20 filteredArrayUsingPredicate:v19];
  SEL v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v72 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: persistenceManager", v72, 2u);
  }

  id v24 = (void *)MEMORY[0x1E4F28C58];
  v77[0] = *MEMORY[0x1E4F28568];
  *(void *)v72 = @"semaphore wait timeout";
  __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v77 count:1];
  uint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;
  }
  else
  {
LABEL_13:
    id v27 = 0;
  }

  id v29 = v27;
  id v49 = v29;
  if (a4 && v29)
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      id v43 = NSStringFromSelector(aSelector);
      *(_DWORD *)v72 = 138412802;
      *(void *)&v72[4] = v42;
      __int16 v73 = 2112;
      v74 = v43;
      __int16 v75 = 2112;
      v76 = v49;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v72, 0x20u);
    }
    __int16 v31 = v49;
  }
  else
  {
    if (a4 && *((void *)v66 + 5))
    {
      uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v46 = NSStringFromSelector(aSelector);
        __int16 v47 = (void *)*((void *)v66 + 5);
        *(_DWORD *)v72 = 138412802;
        *(void *)&v72[4] = v45;
        __int16 v73 = 2112;
        v74 = v46;
        __int16 v75 = 2112;
        v76 = v47;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v72, 0x20u);
      }
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v33 = (id)v60[5];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v71 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v52 != v35) {
              objc_enumerationMutation(v33);
            }
            long long v37 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            long long v38 = (void *)MEMORY[0x1E016D870]();
            long long v39 = [v37 identifier];
            [v8 setObject:v37 forKeyedSubscript:v39];
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v71 count:16];
        }
        while (v34);
      }

      if (!a4) {
        goto LABEL_34;
      }
    }
    __int16 v31 = (void *)*((void *)v66 + 5);
  }
  *a4 = v31;
LABEL_34:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(buf, 8);

LABEL_35:

  return v8;
}

void __90__RTLearnedPlaceTypeInferenceStore__getLearnedPlacesMapFromLearnedPlaceIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:(id)a3 error:(id *)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v109 = "+[RTLearnedPlaceTypeInferenceStore fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:error:]";
    __int16 v110 = 2112;
    id v111 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  if (v5)
  {
    v81 = +[RTLearnedPlaceTypeInferenceMO fetchRequest];
    uint64_t v7 = objc_opt_new();
    id v8 = objc_opt_new();
    if ([v5 sortByCreationDate])
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"creationDate" ascending:[v5 ascending]];
      [v7 addObject:v9];
    }
    v80 = v7;
    id v10 = [v5 dateInterval];

    if (v10)
    {
      id v11 = (void *)MEMORY[0x1E4F28F60];
      id v12 = [v5 dateInterval];
      id v13 = [v12 startDate];
      dispatch_time_t v14 = [v5 dateInterval];
      uint64_t v15 = [v14 endDate];
      double v16 = [v11 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"creationDate", v13, @"creationDate", v15];
      [v8 addObject:v16];
    }
    uint64_t v17 = [v5 filteredToPlaceTypes];
    unint64_t v18 = 0x1E4F28000;
    v82 = v8;
    id v83 = v5;
    if (v17)
    {
      uint64_t v19 = (void *)v17;
      uint64_t v20 = [v5 filteredToPlaceTypes];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        SEL v22 = objc_opt_new();
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        obuint64_t j = [v5 filteredToPlaceTypes];
        uint64_t v23 = [obj countByEnumeratingWithState:&v100 objects:v107 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v101;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v101 != v25) {
                objc_enumerationMutation(obj);
              }
              id v27 = *(void **)(*((void *)&v100 + 1) + 8 * i);
              uint64_t v28 = (void *)MEMORY[0x1E016D870]();
              id v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %ld)", @"placeType", [v27 unsignedIntegerValue]];
              [v22 addObject:v29];
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v100 objects:v107 count:16];
          }
          while (v24);
        }

        unint64_t v18 = 0x1E4F28000uLL;
        uint64_t v30 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v22];
        [v8 addObject:v30];

        id v5 = v83;
      }
    }
    uint64_t v31 = [v5 filteredToIdentifiers];
    if (v31)
    {
      uint64_t v32 = (void *)v31;
      id v33 = [v5 filteredToIdentifiers];
      uint64_t v34 = [v33 count];

      if (v34)
      {
        uint64_t v35 = objc_opt_new();
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id obja = [v5 filteredToIdentifiers];
        uint64_t v36 = [obja countByEnumeratingWithState:&v96 objects:v106 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v97;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v97 != v38) {
                objc_enumerationMutation(obja);
              }
              long long v40 = *(void **)(*((void *)&v96 + 1) + 8 * j);
              id v41 = (void *)MEMORY[0x1E016D870]();
              id v42 = (void *)MEMORY[0x1E4F28F60];
              id v43 = [v40 UUIDString];
              v44 = [v42 predicateWithFormat:@"(%K == %@)", @"identifier", v43];
              [v35 addObject:v44];
            }
            uint64_t v37 = [obja countByEnumeratingWithState:&v96 objects:v106 count:16];
          }
          while (v37);
        }

        unint64_t v18 = 0x1E4F28000uLL;
        id v45 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v35];
        id v8 = v82;
        [v82 addObject:v45];

        id v5 = v83;
      }
    }
    uint64_t v46 = [v5 filteredToSessionIds];
    if (v46)
    {
      __int16 v47 = (void *)v46;
      __int16 v48 = [v5 filteredToSessionIds];
      uint64_t v49 = [v48 count];

      if (v49)
      {
        uint64_t v50 = objc_opt_new();
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id objb = [v5 filteredToSessionIds];
        uint64_t v51 = [objb countByEnumeratingWithState:&v92 objects:v105 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v93;
          do
          {
            for (uint64_t k = 0; k != v52; ++k)
            {
              if (*(void *)v93 != v53) {
                objc_enumerationMutation(objb);
              }
              uint64_t v55 = *(void **)(*((void *)&v92 + 1) + 8 * k);
              v56 = (void *)MEMORY[0x1E016D870]();
              v57 = (void *)MEMORY[0x1E4F28F60];
              v58 = [v55 UUIDString];
              uint64_t v59 = [v57 predicateWithFormat:@"(%K == %@)", @"sessionId", v58];
              [v50 addObject:v59];
            }
            uint64_t v52 = [objb countByEnumeratingWithState:&v92 objects:v105 count:16];
          }
          while (v52);
        }

        unint64_t v18 = 0x1E4F28000uLL;
        v60 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v50];
        id v8 = v82;
        [v82 addObject:v60];

        id v5 = v83;
      }
    }
    uint64_t v61 = [v5 filteredToLearnedPlaceIdentifiers];
    if (v61)
    {
      v62 = (void *)v61;
      v63 = [v5 filteredToLearnedPlaceIdentifiers];
      uint64_t v64 = [v63 count];

      if (v64)
      {
        v65 = objc_opt_new();
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id objc = [v5 filteredToLearnedPlaceIdentifiers];
        uint64_t v66 = [objc countByEnumeratingWithState:&v88 objects:v104 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          uint64_t v68 = *(void *)v89;
          do
          {
            for (uint64_t m = 0; m != v67; ++m)
            {
              if (*(void *)v89 != v68) {
                objc_enumerationMutation(objc);
              }
              id v70 = *(void **)(*((void *)&v88 + 1) + 8 * m);
              v71 = (void *)MEMORY[0x1E016D870]();
              v72 = (void *)MEMORY[0x1E4F28F60];
              __int16 v73 = [v70 UUIDString];
              v74 = [v72 predicateWithFormat:@"(%K == %@)", @"learnedPlaceIdentifier", v73];
              [v65 addObject:v74];
            }
            uint64_t v67 = [objc countByEnumeratingWithState:&v88 objects:v104 count:16];
          }
          while (v67);
        }

        unint64_t v18 = 0x1E4F28000uLL;
        __int16 v75 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v65];
        id v8 = v82;
        [v82 addObject:v75];

        id v5 = v83;
      }
    }
    v76 = [*(id *)(v18 + 2976) andPredicateWithSubpredicates:v8];
    v77 = v81;
    [v81 setPredicate:v76];

    [v81 setSortDescriptors:v80];
    [v81 setFetchBatchSize:[v5 batchSize]];
    [v81 setFetchLimit:[v5 fetchLimit]];
    [v81 setFetchOffset:[v5 offset]];
    [v81 setReturnsObjectsAsFaults:0];
  }
  else
  {
    v78 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"options");
      v77 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v77 = 0;
    }
  }

  return v77;
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!a5)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_13;
  }
  if (v7)
  {
    uint64_t v9 = objc_opt_class();
    if (![v9 isEqual:objc_opt_class()])
    {
      uint64_t v15 = NSString;
      double v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      unint64_t v18 = [v15 stringWithFormat:@"error of type, %@, is not supported", v17];

      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = v18;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      SEL v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

      id v23 = v22;
      *a5 = v23;

      goto LABEL_13;
    }
    id v25 = 0;
    id v10 = [(id)objc_opt_class() fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:v8 error:&v25];
    id v11 = v25;
    if (v11)
    {
      id v12 = v11;
      *a5 = v12;

LABEL_13:
      id v10 = 0;
      goto LABEL_14;
    }
    [v10 setFetchOffset:a4];
  }
  else
  {
    dispatch_time_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"options");
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v10;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void).cxx_destruct
{
}

@end