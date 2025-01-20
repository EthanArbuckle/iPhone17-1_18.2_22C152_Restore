@interface RTElevationManager
+ (int64_t)periodicPurgePolicy;
- (RTElevationManager)initWithElevationStore:(id)a3 elevationProvider:(id)a4;
- (RTElevationProvider)elevationProvider;
- (RTElevationStore)elevationStore;
- (void)_addElevations:(id)a3 handler:(id)a4;
- (void)_fetchElevationsWithOptions:(id)a3 handler:(id)a4;
- (void)_purgeElevationsPredating:(id)a3 handler:(id)a4;
- (void)addElevations:(id)a3 handler:(id)a4;
- (void)fetchElevationsWithOptions:(id)a3 handler:(id)a4;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)purgeElevationsPredating:(id)a3 handler:(id)a4;
- (void)setElevationProvider:(id)a3;
- (void)setElevationStore:(id)a3;
@end

@implementation RTElevationManager

- (RTElevationManager)initWithElevationStore:(id)a3 elevationProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTElevationManager;
    v9 = [(RTNotifier *)&v15 init];
    p_isa = (id *)&v9->super.super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_elevationStore, a3);
      objc_storeStrong(p_isa + 5, a4);
      v11 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "RTElevationManager successfully initialized.", buf, 2u);
      }
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: elevationStore", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)_fetchElevationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTElevationManager _fetchElevationsWithOptions:handler:]";
      __int16 v18 = 1024;
      int v19 = 42;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }
  }
  elevationStore = self->_elevationStore;
  if (elevationStore)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__RTElevationManager__fetchElevationsWithOptions_handler___block_invoke;
    v12[3] = &unk_1E6B91468;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    [(RTElevationStore *)elevationStore fetchStoredElevationsWithOptions:v13 handler:v12];
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "ElevationStore was nil.", buf, 2u);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __58__RTElevationManager__fetchElevationsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v9 = [v5 count];
    uint64_t v14 = *(void *)(a1 + 32);
    v10 = [v5 firstObject];
    v11 = [v10 startDate];
    v12 = [v5 lastObject];
    id v13 = [v12 endDate];
    *(_DWORD *)buf = 138413314;
    v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@ fetched %ld elevations, options, %@, first elevation start date, %@, last elevation end date, %@", buf, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchElevationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTElevationManager_fetchElevationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __57__RTElevationManager_fetchElevationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchElevationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_addElevations:(id)a3 handler:(id)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v43 = (void (**)(id, void))a4;
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    v40 = [v6 endDate];

    id v7 = [v5 lastObject];
    v39 = [v7 endDate];

    v41 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v40 endDate:v39];
    *(void *)&long long v53 = 0;
    *((void *)&v53 + 1) = &v53;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__109;
    v56 = __Block_byref_object_dispose__109;
    id v57 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v51 = 2112;
      v52 = v41;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@ Deleting overlapping elevations in range: %@", buf, 0x16u);
    }
    elevationStore = self->_elevationStore;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __45__RTElevationManager__addElevations_handler___block_invoke;
    v45[3] = &unk_1E6B94B08;
    v47 = &v53;
    SEL v48 = a2;
    id v12 = v8;
    v46 = v12;
    [(RTElevationStore *)elevationStore removeInterimElevations:v41 handler:v45];
    id v13 = (id *)(*((void *)&v53 + 1) + 40);
    id obj = *(id *)(*((void *)&v53 + 1) + 40);
    uint64_t v14 = v12;
    SEL v15 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v14, v16)) {
      goto LABEL_11;
    }
    __int16 v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:v15];
    double v19 = v18;
    uint64_t v20 = objc_opt_new();
    __int16 v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_85];
    v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v23 = [v22 filteredArrayUsingPredicate:v21];
    v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v49 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v49, 2u);
    }

    v26 = (void *)MEMORY[0x1E4F28C58];
    v58[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v58 count:1];
    v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

    if (v28)
    {
      id v29 = v28;

      objc_storeStrong(v13, v29);
      v30 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v35 = NSStringFromSelector(a2);
        v36 = *(void **)(*((void *)&v53 + 1) + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v35;
        __int16 v51 = 2112;
        v52 = v36;
        _os_log_debug_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEBUG, "%@ Elevation removeElevations timeout %@", buf, 0x16u);
      }
    }
    else
    {
LABEL_11:

      objc_storeStrong(v13, obj);
    }
    uint64_t v31 = *(void *)(*((void *)&v53 + 1) + 40);
    if (!v31)
    {
      v32 = self->_elevationStore;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __45__RTElevationManager__addElevations_handler___block_invoke_3;
      v44[3] = &unk_1E6B99EB8;
      v44[4] = &v53;
      v44[5] = a2;
      [(RTElevationStore *)v32 storeElevations:v5 handler:v44];
      uint64_t v31 = *(void *)(*((void *)&v53 + 1) + 40);
    }
    v43[2](v43, v31);

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v34 = NSStringFromSelector(a2);
      LODWORD(v53) = 138412290;
      *(void *)((char *)&v53 + 4) = v34;
      _os_log_debug_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEBUG, "%@ Adding empty elevation array", (uint8_t *)&v53, 0xCu);
    }
    v43[2](v43, 0);
  }
}

void __45__RTElevationManager__addElevations_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v7 = 138412546;
      dispatch_semaphore_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@ Error removing elevations: %@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __45__RTElevationManager__addElevations_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      dispatch_semaphore_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@ Store elevations error %@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)addElevations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__RTElevationManager_addElevations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __44__RTElevationManager_addElevations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addElevations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgeElevationsPredating:(id)a3 handler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    id v13 = "-[RTElevationManager _purgeElevationsPredating:handler:]";
    __int16 v14 = 1024;
    int v15 = 145;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v12, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[RTElevationManager _purgeElevationsPredating:handler:]";
      __int16 v14 = 1024;
      int v15 = 146;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }
  }
LABEL_10:
  uint64_t v11 = [(RTElevationManager *)self elevationStore];
  [v11 removeElevationsPredating:v6 handler:v8];
}

- (void)purgeElevationsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTElevationManager_purgeElevationsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __55__RTElevationManager_purgeElevationsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeElevationsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v17 = v10;
  int64_t v18 = a3;
  id v15 = v9;
  uint64_t v16 = self;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    v3 = v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v6[3] = &unk_1E6B90890;
    uint64_t v8 = *(void *)(a1 + 64);
    id v4 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v4 purgeElevationsPredating:v3 handler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, performPurgeOfType, error, %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RTElevationStore)elevationStore
{
  return self->_elevationStore;
}

- (void)setElevationStore:(id)a3
{
}

- (RTElevationProvider)elevationProvider
{
  return self->_elevationProvider;
}

- (void)setElevationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevationProvider, 0);

  objc_storeStrong((id *)&self->_elevationStore, 0);
}

@end