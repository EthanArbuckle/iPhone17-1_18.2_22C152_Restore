@interface RTLearnedLocationReconcilerPerVisit
+ (void)submitMetricsOnReconciledGraphDensity:(id)a3 algorithm:(unint64_t)a4 persistenceManager:(id)a5 managedObjectContext:(id)a6;
- (NSArray)reconciliationModels;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationReconcilerPerVisit)init;
- (RTLearnedLocationReconcilerPerVisit)initWithPersistenceManager:(id)a3 defaultsManager:(id)a4;
- (RTLearnedLocationReconcilerPerVisit)initWithPersistenceManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 reconciliationModels:(id)a6;
- (RTPersistenceManager)persistenceManager;
- (id)_currentModel;
- (id)_findWinner:(id)a3 currentVisit:(id)a4 model:(id)a5 modelContext:(id)a6;
- (id)_visitFollowingVisit:(id)a3 visits:(id)a4;
- (id)_visitsWithContext:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6;
- (void)_performReconciliationWithHandler:(id)a3;
- (void)_reconcileVisits:(id)a3 context:(id)a4 handler:(id)a5;
- (void)_reconcileVisits:(id)a3 handler:(id)a4;
- (void)_reconcileVisitsWithContext:(id)a3 handler:(id)a4;
- (void)collapseReconciledVisitsToLocationsOfInterest:(id)a3 context:(id)a4 handler:(id)a5;
- (void)collapseVisits:(id)a3 context:(id)a4;
- (void)performReconciliationWithHandler:(id)a3;
- (void)reconcileVisits:(id)a3 context:(id)a4 handler:(id)a5;
- (void)reconcileVisits:(id)a3 handler:(id)a4;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReconciliationModels:(id)a3;
@end

@implementation RTLearnedLocationReconcilerPerVisit

- (RTLearnedLocationReconcilerPerVisit)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_defaultsManager_distanceCalculator_reconciliationModels_);
}

- (RTLearnedLocationReconcilerPerVisit)initWithPersistenceManager:(id)a3 defaultsManager:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v13[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11 = [(RTLearnedLocationReconcilerPerVisit *)self initWithPersistenceManager:v7 defaultsManager:v6 distanceCalculator:v8 reconciliationModels:v10];

  return v11;
}

- (RTLearnedLocationReconcilerPerVisit)initWithPersistenceManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 reconciliationModels:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
      __int16 v37 = 1024;
      int v38 = 164;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager (in %s:%d)", buf, 0x12u);
    }

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
    __int16 v37 = 1024;
    int v38 = 165;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
  }

  if (!v13)
  {
LABEL_11:
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
      __int16 v37 = 1024;
      int v38 = 166;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  if (![v14 count])
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
      __int16 v37 = 1024;
      int v38 = 167;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "no reconcilation models available (in %s:%d)", buf, 0x12u);
    }
  }
  v19 = 0;
  if (v11 && v12 && v13)
  {
    if ([v14 count])
    {
      v34.receiver = self;
      v34.super_class = (Class)RTLearnedLocationReconcilerPerVisit;
      v20 = [(RTLearnedLocationReconcilerPerVisit *)&v34 init];
      v21 = v20;
      if (v20)
      {
        id obj = a3;
        v22 = v20;
        v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = (const char *)[(RTLearnedLocationReconcilerPerVisit *)v22 UTF8String];
        }
        else
        {
          [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v22];
          id v32 = a4;
          id v25 = a5;
          id v26 = objc_claimAutoreleasedReturnValue();
          v24 = (const char *)[v26 UTF8String];

          a5 = v25;
          a4 = v32;
        }
        dispatch_queue_t v27 = dispatch_queue_create(v24, v23);

        queue = v22->_queue;
        v22->_queue = (OS_dispatch_queue *)v27;

        objc_storeStrong((id *)&v22->_persistenceManager, obj);
        objc_storeStrong((id *)&v22->_defaultsManager, a4);
        objc_storeStrong((id *)&v22->_distanceCalculator, a5);
        uint64_t v29 = [v14 copy];
        reconciliationModels = v22->_reconciliationModels;
        v22->_reconciliationModels = (NSArray *)v29;
      }
      self = v21;
      v19 = self;
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (void)performReconciliationWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__RTLearnedLocationReconcilerPerVisit_performReconciliationWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __72__RTLearnedLocationReconcilerPerVisit_performReconciliationWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performReconciliationWithHandler:*(void *)(a1 + 40)];
}

- (void)_performReconciliationWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[RTLearnedLocationReconcilerPerVisit _performReconciliationWithHandler:]";
      __int16 v12 = 1024;
      int v13 = 196;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  persistenceManager = self->_persistenceManager;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke;
  v8[3] = &unk_1E6B946F8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(RTPersistenceManager *)persistenceManager createManagedObjectContext:v8];
}

void __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke_2;
    v9[3] = &unk_1E6B90660;
    v9[4] = v5;
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v6, v9);
  }
  else if (*(void *)(a1 + 40))
  {
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"reconciliation requires a managed object context.";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcileVisitsWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_reconcileVisitsWithContext:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (v7)
    {
LABEL_11:
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __75__RTLearnedLocationReconcilerPerVisit__reconcileVisitsWithContext_handler___block_invoke;
      v13[3] = &unk_1E6B90660;
      v13[4] = self;
      id v14 = v6;
      v15 = v8;
      [v14 performBlock:v13];

      goto LABEL_12;
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTLearnedLocationReconcilerPerVisit _reconcileVisitsWithContext:handler:]";
      __int16 v20 = 1024;
      int v21 = 223;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

    if (v8)
    {
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17 = @"reconciliation requires a managed object context.";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v11);

      goto LABEL_12;
    }
  }
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[RTLearnedLocationReconcilerPerVisit _reconcileVisitsWithContext:handler:]";
    __int16 v20 = 1024;
    int v21 = 224;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  if (v6) {
    goto LABEL_11;
  }
LABEL_12:
}

void __75__RTLearnedLocationReconcilerPerVisit__reconcileVisitsWithContext_handler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL", @"place.mapItem"];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v10[0] = v2;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v9 = 0;
  id v7 = [v4 _visitsWithContext:v5 predicate:v3 sortDescriptors:v6 error:&v9];
  id v8 = v9;

  [*(id *)(a1 + 32) _reconcileVisits:v7 context:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)reconcileVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTLearnedLocationReconcilerPerVisit_reconcileVisits_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __63__RTLearnedLocationReconcilerPerVisit_reconcileVisits_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcileVisits:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_reconcileVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  persistenceManager = self->_persistenceManager;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke;
  v11[3] = &unk_1E6B94720;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(RTPersistenceManager *)persistenceManager createManagedObjectContext:v11];
}

void __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke_2;
    block[3] = &unk_1E6B91490;
    block[4] = v4;
    id v9 = *(id *)(a1 + 40);
    id v10 = v3;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v5, block);
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"reconciliation requires a managed object context.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcileVisits:*(void *)(a1 + 40) context:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)reconcileVisits:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__RTLearnedLocationReconcilerPerVisit_reconcileVisits_context_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __71__RTLearnedLocationReconcilerPerVisit_reconcileVisits_context_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcileVisits:*(void *)(a1 + 40) context:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_reconcileVisits:(id)a3 context:(id)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[RTLearnedLocationReconcilerPerVisit _reconcileVisits:context:handler:]";
      __int16 v22 = 1024;
      int v23 = 307;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v13 performBlock:v15];
}

void __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [*(id *)(a1 + 40) collapseVisits:v2 context:*(void *)(a1 + 48)];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__42;
  v5[4] = __Block_byref_object_dispose__42;
  id v6 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke_24;
  v4[3] = &unk_1E6B94748;
  v4[4] = v5;
  id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:v4];
  [v2 filterUsingPredicate:v3];
  [*(id *)(a1 + 40) collapseReconciledVisitsToLocationsOfInterest:v2 context:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];

  _Block_object_dispose(v5, 8);
}

uint64_t __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v8 + 40))
  {
    id v9 = [v6 entryDate];
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) exitDate];
    int v11 = [v9 isAfterDate:v10];

    if (!v11)
    {
      uint64_t v12 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v8 + 40), a2);
  uint64_t v12 = 1;
LABEL_6:

  return v12;
}

- (void)collapseReconciledVisitsToLocationsOfInterest:(id)a3 context:(id)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[RTLearnedLocationReconcilerPerVisit collapseReconciledVisitsToLocationsOfInterest:context:handler:]";
      __int16 v22 = 1024;
      int v23 = 336;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v13 performBlock:v15];
}

void __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke(uint64_t a1)
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[*(id *)(a1 + 32) count]];
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  v121 = (void *)a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v137 = [obj countByEnumeratingWithState:&v157 objects:v163 count:16];
  id v3 = 0;
  if (v137)
  {
    uint64_t v136 = *(void *)v158;
    v138 = v2;
    do
    {
      for (uint64_t i = 0; i != v137; uint64_t i = v79 + 1)
      {
        v152 = v3;
        if (*(void *)v158 != v136) {
          objc_enumerationMutation(obj);
        }
        uint64_t v141 = i;
        uint64_t v5 = *(void **)(*((void *)&v157 + 1) + 8 * i);
        uint64_t v140 = MEMORY[0x1E016D870]();
        v156[0] = MEMORY[0x1E4F143A8];
        v156[1] = 3221225472;
        v156[2] = __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2;
        v156[3] = &unk_1E6B94770;
        v156[4] = v5;
        uint64_t v148 = [v2 indexOfObjectPassingTest:v156];
        id v6 = objc_alloc(MEMORY[0x1E4F5CE00]);
        id v7 = [v5 locationLatitude];
        [v7 doubleValue];
        double v9 = v8;
        id v10 = [v5 locationLongitude];
        [v10 doubleValue];
        double v12 = v11;
        id v13 = [v5 locationHorizontalUncertainty];
        [v13 doubleValue];
        double v15 = v14;
        id v16 = [v5 locationAltitude];
        [v16 doubleValue];
        double v18 = v17;
        id v19 = [v5 locationVerticalUncertainty];
        [v19 doubleValue];
        double v21 = v20;
        __int16 v22 = [v5 locationReferenceFrame];
        uint64_t v23 = [v22 intValue];
        uint64_t v24 = [v5 locationSourceAccuracy];
        uint64_t v25 = [v6 initWithLatitude:0 longitude:v23 horizontalUncertainty:(int)objc_msgSend(v24, "intValue") altitude:v9 verticalUncertainty:v12 date:v15 referenceFrame:v21 speed:0.0 sourceAccuracy:0.0];

        id v26 = [RTLearnedLocation alloc];
        dispatch_queue_t v27 = [v5 dataPointCount];
        uint64_t v28 = [v27 unsignedIntegerValue];
        uint64_t v29 = [v5 confidence];
        [v29 doubleValue];
        v146 = (void *)v25;
        uint64_t v30 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v26, "initWithLocation:dataPointCount:confidence:", v25, v28);

        v153 = [RTLearnedVisit alloc];
        v31 = [v5 identifier];
        id v32 = [v5 entryDate];
        v33 = [v5 exitDate];
        objc_super v34 = [v5 creationDate];
        uint64_t v35 = (uint64_t)v34;
        if (!v34)
        {
          uint64_t v35 = [MEMORY[0x1E4F1C9C8] distantPast];
          v128 = (void *)v35;
        }
        v36 = [v5 expirationDate];
        __int16 v37 = [v5 placeConfidence];
        [v37 doubleValue];
        double v39 = v38;
        v40 = [v5 placeSource];
        v139 = (void *)v30;
        uint64_t v41 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v153, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v31, v30, v32, v33, v35, v36, v39, [v40 unsignedIntegerValue]);

        if (!v34) {
        v147 = (void *)v41;
        }
        if (v148 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v42 = [v5 place];

          if (v42)
          {
            v43 = (void *)MEMORY[0x1E4F5CE38];
            v44 = [v5 place];
            v45 = [v44 mapItem];
            v154 = [v43 createWithManagedObject:v45];
          }
          else
          {
            v154 = 0;
          }
          v145 = [RTLearnedPlace alloc];
          v149 = [v5 place];
          uint64_t v82 = [v149 identifier];
          v83 = (void *)v82;
          if (!v82)
          {
            uint64_t v82 = [MEMORY[0x1E4F29128] UUID];
            v124 = (void *)v82;
          }
          uint64_t v129 = v82;
          v134 = [v5 place];
          v131 = [v134 type];
          uint64_t v84 = [v131 unsignedIntegerValue];
          v85 = [v5 place];
          v86 = [v85 typeSource];
          uint64_t v87 = [v86 unsignedIntegerValue];
          v88 = [v5 place];
          v89 = [v88 customLabel];
          v90 = [MEMORY[0x1E4F1C9C8] date];
          v91 = [v5 expirationDate];
          v144 = [(RTLearnedPlace *)v145 initWithIdentifier:v129 type:v84 typeSource:v87 mapItem:v154 customLabel:v89 creationDate:v90 expirationDate:v91];

          if (!v83) {
          v150 = [(RTLearnedTransition *)v152 device];
          }
          v92 = [v150 identifier];
          v132 = [v5 device];
          v93 = [v132 identifier];
          v94 = [(RTLearnedTransition *)v152 outbound];
          v95 = [v94 predominantMotionActivityType];
          uint64_t v96 = [v95 unsignedIntegerValue];
          v97 = [v5 inbound];
          v98 = [v97 predominantMotionActivityType];
          uint64_t v99 = [v98 unsignedIntegerValue];
          int v100 = [v92 isEqual:v93];
          if (v96 == v99) {
            int v101 = 1;
          }
          else {
            int v101 = v100;
          }
          if (v101) {
            uint64_t v102 = v99;
          }
          else {
            uint64_t v102 = 0;
          }
          uint64_t v135 = v102;

          v103 = [RTLearnedTransition alloc];
          v151 = [MEMORY[0x1E4F29128] UUID];
          v104 = [(RTLearnedTransition *)v152 exitDate];
          uint64_t v105 = (uint64_t)v104;
          if (!v104)
          {
            uint64_t v105 = [MEMORY[0x1E4F1C9C8] distantPast];
            v126 = (void *)v105;
          }
          v106 = [v5 entryDate];
          v107 = [(RTLearnedTransition *)v152 identifier];
          uint64_t v108 = (uint64_t)v107;
          if (!v107)
          {
            uint64_t v108 = [MEMORY[0x1E4F29128] nilUUID];
            v125 = (void *)v108;
          }
          v109 = [v5 identifier];
          v110 = [MEMORY[0x1E4F1C9C8] date];
          v111 = [v5 expirationDate];
          v68 = [(RTLearnedTransition *)v103 initWithIdentifier:v151 startDate:v105 stopDate:v106 visitIdentifierOrigin:v108 visitIdentifierDestination:v109 creationDate:v110 expirationDate:v111 predominantMotionActivityType:v135];

          if (!v107) {
          uint64_t v2 = v138;
          }
          v81 = v139;
          v78 = v154;
          if (!v104) {

          }
          v112 = v147;
          if (!v147 || !v68)
          {

            id v3 = v152;
            v80 = (void *)v140;
            uint64_t v79 = v141;
            goto LABEL_60;
          }
          v113 = [RTLearnedLocation alloc];
          v114 = [v5 locationSourceAccuracy];
          v71 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v113, "initWithLocation:dataPointCount:type:", v146, [v114 intValue] == 2, 2);

          v115 = [RTLearnedLocationOfInterest alloc];
          v116 = [(RTLearnedPlace *)v144 identifier];
          v162 = v147;
          v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v162 count:1];
          v161 = v68;
          v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v161 count:1];
          v77 = [(RTLearnedLocationOfInterest *)v115 initWithIdentifier:v116 location:v71 place:v144 visits:v117 transitions:v118];

          if (v77)
          {
            uint64_t v2 = v138;
            [v138 addObject:v77];
            v78 = v152;
            v80 = (void *)v140;
            uint64_t v79 = v141;
          }
          else
          {
            v78 = v152;
            v80 = (void *)v140;
            uint64_t v79 = v141;
            uint64_t v2 = v138;
          }
        }
        else
        {
          v142 = [(RTLearnedTransition *)v152 device];
          v130 = [v142 identifier];
          v133 = [v5 device];
          v46 = [v133 identifier];
          v47 = [(RTLearnedTransition *)v152 outbound];
          v48 = [v47 predominantMotionActivityType];
          uint64_t v49 = [v48 unsignedIntegerValue];
          v50 = [v5 inbound];
          v51 = [v50 predominantMotionActivityType];
          uint64_t v52 = [v51 unsignedIntegerValue];
          int v53 = [v130 isEqual:v46];
          if (v49 == v52) {
            int v54 = 1;
          }
          else {
            int v54 = v53;
          }
          if (v54) {
            uint64_t v55 = v52;
          }
          else {
            uint64_t v55 = 0;
          }
          uint64_t v155 = v55;

          v143 = [RTLearnedTransition alloc];
          v56 = [MEMORY[0x1E4F29128] UUID];
          v57 = [(RTLearnedTransition *)v152 exitDate];
          uint64_t v58 = (uint64_t)v57;
          if (!v57)
          {
            uint64_t v58 = [MEMORY[0x1E4F1C9C8] distantPast];
            v123 = (void *)v58;
          }
          v59 = [v5 entryDate];
          v60 = [(RTLearnedTransition *)v152 identifier];
          uint64_t v61 = (uint64_t)v60;
          if (!v60)
          {
            uint64_t v61 = [MEMORY[0x1E4F29128] nilUUID];
            v122 = (void *)v61;
          }
          v62 = [v5 identifier];
          v63 = [MEMORY[0x1E4F1C9C8] date];
          v64 = [v5 expirationDate];
          v154 = [(RTLearnedTransition *)v143 initWithIdentifier:v56 startDate:v58 stopDate:v59 visitIdentifierOrigin:v61 visitIdentifierDestination:v62 creationDate:v63 expirationDate:v64 predominantMotionActivityType:v155];

          if (!v60) {
          uint64_t v2 = v138;
          }
          if (!v57) {

          }
          v65 = [v138 objectAtIndex:v148];
          v66 = (void *)MEMORY[0x1E4F1CA48];
          v67 = [(RTLearnedPlace *)v65 visits];
          v68 = [v66 arrayWithArray:v67];

          if (v147) {
            -[RTLearnedTransition addObject:](v68, "addObject:");
          }
          v69 = (void *)MEMORY[0x1E4F1CA48];
          v70 = [(RTLearnedPlace *)v65 transitions];
          v71 = [v69 arrayWithArray:v70];

          if (v154) {
            -[RTLearnedLocation addObject:](v71, "addObject:");
          }
          v72 = [RTLearnedLocationOfInterest alloc];
          v73 = [(RTLearnedPlace *)v65 place];
          v74 = [v73 identifier];
          v75 = [(RTLearnedPlace *)v65 location];
          v144 = v65;
          v76 = [(RTLearnedPlace *)v65 place];
          v77 = [(RTLearnedLocationOfInterest *)v72 initWithIdentifier:v74 location:v75 place:v76 visits:v68 transitions:v71];

          if (v77) {
            [v138 setObject:v77 atIndexedSubscript:v148];
          }
          v78 = v152;
          v80 = (void *)v140;
          uint64_t v79 = v141;
          v81 = v139;
        }

        id v3 = v5;
        v112 = v147;
LABEL_60:
      }
      uint64_t v137 = [obj countByEnumeratingWithState:&v157 objects:v163 count:16];
    }
    while (v137);
  }

  logReconciledGraph(v2, 0);
  [(id)objc_opt_class() submitMetricsOnReconciledGraphDensity:v121[4] algorithm:0 persistenceManager:*(void *)(v121[5] + 16) managedObjectContext:v121[6]];
  uint64_t v119 = v121[7];
  if (v119)
  {
    v120 = (void *)[v2 copy];
    (*(void (**)(uint64_t, void *, void))(v119 + 16))(v119, v120, 0);
  }
}

uint64_t __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5CE38];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 place];
  id v6 = [v5 mapItem];
  id v7 = [v2 createWithManagedObject:v6];

  double v8 = [v4 place];

  double v9 = [v8 mapItem];
  uint64_t v10 = [v9 isEqualToMapItem:v7];

  return v10;
}

- (void)collapseVisits:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[RTLearnedLocationReconcilerPerVisit collapseVisits:context:]";
      __int16 v17 = 1024;
      int v18 = 473;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke;
  v11[3] = &unk_1E6B92F80;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v9 performBlockAndWait:v11];
}

unint64_t __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke(id *a1)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  unint64_t result = [a1[4] count];
  if (result)
  {
    unint64_t result = [a1[4] count];
    if (result)
    {
      for (unint64_t i = 0; i < result; ++i)
      {
        id v4 = (void *)MEMORY[0x1E016D870]();
        uint64_t v5 = [a1[4] objectAtIndexedSubscript:i];
        id v6 = a1[4];
        id v7 = (void *)MEMORY[0x1E4F28F60];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_2;
        v36[3] = &unk_1E6B94798;
        id v8 = v5;
        id v37 = v8;
        id v9 = [v7 predicateWithBlock:v36];
        id v10 = [v6 filteredArrayUsingPredicate:v9];

        double v11 = (void *)MEMORY[0x1E4F28F60];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_3;
        v33[3] = &unk_1E6B947C0;
        id v12 = v8;
        id v13 = a1[5];
        id v34 = v12;
        id v35 = v13;
        id v14 = [v11 predicateWithBlock:v33];
        double v15 = [v10 filteredArrayUsingPredicate:v14];

        if ([v15 count])
        {
          v31 = v10;
          id v32 = v4;
          id v16 = objc_opt_new();
          uint64_t v30 = +[RTDeviceMO fetchRequest];
          __int16 v17 = [a1[6] executeFetchRequest:error:];
          id v29 = 0;
          [v16 setDevices:v17];

          [v16 setOverlappingVisits:v15];
          id v18 = a1[5];
          uint64_t v19 = [v18 _currentModel];
          id v20 = [v18 _findWinner:v15 currentVisit:v12 model:v19 modelContext:v16];

          id v21 = v20;
          __int16 v22 = objc_opt_new();
          uint64_t v23 = [a1[5] _visitFollowingVisit:v12 visits:a1[4]];
          if (v23)
          {
            uint64_t v24 = (void *)v23;
            while (([v24 overlapsWithVisit:v21] & 1) != 0)
            {
              [v22 addObject:v24];
              uint64_t v25 = [a1[5] _visitFollowingVisit:v24 visits:a1[4]];

              uint64_t v24 = (void *)v25;
              if (!v25) {
                goto LABEL_12;
              }
            }
          }
LABEL_12:
          [v22 removeObject:v21];
          if (v20 != v12) {
            [v22 addObject:v12];
          }
          [a1[4] removeObjectsInArray:v22];
          id v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
          id v27 = a1[4];
          v38[0] = v26;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
          [v27 sortUsingDescriptors:v28];

          id v10 = v31;
          id v4 = v32;
        }
        else
        {
          [a1[4] removeObjectsInArray:v10];
        }

        unint64_t result = [a1[4] count];
      }
    }
  }
  return result;
}

BOOL __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 entryDate];
  uint64_t v5 = [*(id *)(a1 + 32) exitDate];
  char v6 = [v4 isAfterDate:v5];

  BOOL v7 = (v6 & 1) == 0
    && ([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0
    && ([*(id *)(a1 + 32) overlapsWithVisit:v3] & 1) != 0;

  return v7;
}

uint64_t __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 intersectsWithVisit:*(void *)(a1 + 32) distanceCalculator:*(void *)(*(void *)(a1 + 40) + 32)];
}

- (id)_currentModel
{
  uint64_t v2 = [(RTLearnedLocationReconcilerPerVisit *)self reconciliationModels];
  id v3 = [v2 firstObject];

  return v3;
}

- (id)_findWinner:(id)a3 currentVisit:(id)a4 model:(id)a5 modelContext:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  [v11 weightForVisit:v13 modelContext:v12];
  double v15 = v14;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  id v18 = v13;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v28;
    id v18 = v13;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v16);
        }
        __int16 v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v11 weightForVisit:v22 modelContext:v12];
        if (v23 > v15)
        {
          double v24 = v23;
          id v25 = v22;

          double v15 = v24;
          id v18 = v25;
        }
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  return v18;
}

- (id)_visitFollowingVisit:(id)a3 visits:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (!v5 || ![v6 count]) {
    goto LABEL_9;
  }
  uint64_t v8 = [v7 indexOfObjectIdenticalTo:v5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      double v14 = "-[RTLearnedLocationReconcilerPerVisit _visitFollowingVisit:visits:]";
      __int16 v15 = 1024;
      int v16 = 593;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "current visit is not found in the array! (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }
  }
  unint64_t v10 = v8 + 1;
  if (v10 < [v7 count])
  {
    id v11 = [v7 objectAtIndexedSubscript:v10];
  }
  else
  {
LABEL_9:
    id v11 = 0;
  }

  return v11;
}

- (id)_visitsWithContext:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  id v34 = 0;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__42;
  long long v27 = __Block_byref_object_dispose__42;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__RTLearnedLocationReconcilerPerVisit__visitsWithContext_predicate_sortDescriptors_error___block_invoke;
  v17[3] = &unk_1E6B947E8;
  id v12 = v10;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  id v21 = &v29;
  id v14 = v9;
  id v20 = v14;
  __int16 v22 = &v23;
  [v14 performBlockAndWait:v17];
  if (a6) {
    *a6 = (id) v24[5];
  }
  id v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __90__RTLearnedLocationReconcilerPerVisit__visitsWithContext_predicate_sortDescriptors_error___block_invoke(void *a1)
{
  uint64_t v2 = +[RTLearnedVisitMO fetchRequest];
  [v2 setPredicate:a1[4]];
  [v2 setSortDescriptors:a1[5]];
  [v2 setFetchBatchSize:100];
  id v3 = (void *)a1[6];
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (NSArray)reconciliationModels
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReconciliationModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconciliationModels, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)submitMetricsOnReconciledGraphDensity:(id)a3 algorithm:(unint64_t)a4 persistenceManager:(id)a5 managedObjectContext:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __136__RTLearnedLocationReconcilerPerVisit_Metrics__submitMetricsOnReconciledGraphDensity_algorithm_persistenceManager_managedObjectContext___block_invoke;
    v14[3] = &unk_1E6B917F0;
    id v15 = v11;
    id v16 = v9;
    id v17 = v10;
    unint64_t v18 = a4;
    [v15 performBlockAndWait:v14];

    id v13 = v15;
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }
  }
}

void __136__RTLearnedLocationReconcilerPerVisit_Metrics__submitMetricsOnReconciledGraphDensity_algorithm_persistenceManager_managedObjectContext___block_invoke(uint64_t a1)
{
  v111[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
  uint64_t v4 = +[RTLearnedVisitMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == $RT_CURRENT_DEVICE", @"device"];
  [v4 setPredicate:v5];

  v111[0] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:1];
  [v4 setSortDescriptors:v6];

  BOOL v7 = *(void **)(a1 + 32);
  id v103 = 0;
  uint64_t v8 = [v7 executeFetchRequest:v4 error:&v103];
  id v9 = v103;
  if (!v9)
  {
    uint64_t v89 = a1;
    uint64_t v84 = v4;
    v85 = v3;
    v92 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-4838400.0];
    uint64_t v82 = [v8 count];
    v83 = v8;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v99 objects:v110 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v100;
      do
      {
        id v15 = v10;
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v100 != v14) {
            objc_enumerationMutation(v15);
          }
          id v17 = [*(id *)(*((void *)&v99 + 1) + 8 * i) entryDate];
          unsigned int v18 = [v17 isOnOrAfter:v92];

          v13 += v18;
        }
        id v10 = v15;
        uint64_t v12 = [v15 countByEnumeratingWithState:&v99 objects:v110 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != $RT_CURRENT_DEVICE", @"device"];
    id v20 = +[RTLearnedVisitMO fetchRequest];
    id v3 = v85;
    v109 = v85;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
    [v20 setSortDescriptors:v21];

    [v20 setPredicate:v19];
    __int16 v22 = *(void **)(v89 + 32);
    id v98 = 0;
    uint64_t v23 = [v22 executeFetchRequest:v20 error:&v98];
    id v9 = v98;
    if (!v9)
    {
      id v77 = v10;
      uint64_t v79 = v2;
      v80 = v23;
      v78 = v20;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id obj = *(id *)(v89 + 40);
      uint64_t v90 = [obj countByEnumeratingWithState:&v94 objects:v108 count:16];
      v81 = v19;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      if (v90)
      {
        uint64_t v87 = *(void *)v95;
        do
        {
          for (uint64_t j = 0; j != v90; ++j)
          {
            if (*(void *)v95 != v87) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void **)(*((void *)&v94 + 1) + 8 * j);
            long long v30 = [v29 device];
            uint64_t v31 = [*(id *)(v89 + 32) currentDevice];
            int v32 = [v30 isEqual:v31];

            v33 = [v29 entryDate];
            unsigned int v34 = [v33 isOnOrAfter:v92];

            if (v32) {
              v25 += v34;
            }
            else {
              v24 += v34;
            }
            if (v32) {
              ++v27;
            }
            else {
              ++v26;
            }
          }
          uint64_t v90 = [obj countByEnumeratingWithState:&v94 objects:v108 count:16];
        }
        while (v90);
      }

      id v35 = [MEMORY[0x1E4F1CA48] arrayWithArray:v77];
      [v35 addObjectsFromArray:v80];
      id v3 = v85;
      v107 = v85;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
      [v35 sortUsingDescriptors:v36];

      v91 = v35;
      id v37 = [v35 firstObject];
      double v38 = [v37 creationDate];

      v88 = v38;
      [v38 timeIntervalSinceReferenceDate];
      double v40 = v39;
      uint64_t v105 = @"RT_CURRENT_DEVICE";
      uint64_t v41 = [*(id *)(v89 + 32) currentDevice];
      v106 = v41;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      v43 = [v81 predicateWithSubstitutionVariables:v42];

      v44 = [*(id *)(v89 + 40) filteredArrayUsingPredicate:v43];
      v104 = v85;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
      v46 = [v44 sortedArrayUsingDescriptors:v45];

      v47 = [v46 firstObject];
      v48 = [v47 creationDate];

      v76 = v48;
      [v48 timeIntervalSinceReferenceDate];
      uint64_t v50 = v27 + v26;
      double v51 = 0.0;
      if (v82 < 1)
      {
        double v52 = INFINITY;
        double v53 = 0.0;
      }
      else
      {
        double v52 = (double)((double)(v50 - v82) / (double)v82 * 100.0);
        double v53 = (double)((double)(v82 - v27) / (double)v82 * 100.0);
      }
      double v54 = v40 - v49;
      if (v13 >= 1) {
        double v55 = (double)(v25 + v24) / (double)v13;
      }
      else {
        double v55 = 1.0;
      }
      double v56 = 0.0;
      if (v50 >= 1)
      {
        double v57 = (double)v27 / (double)v50;
        double v51 = (double)(v57 * 100.0);
        double v56 = (double)((1.0 - v57) * 100.0);
      }
      uint64_t v58 = +[RTDeviceMO fetchRequest];
      v59 = *(void **)(v89 + 32);
      id v93 = 0;
      uint64_t v60 = [v59 countForFetchRequest:v58 error:&v93];
      id v61 = v93;
      BOOL v62 = [*(id *)(v89 + 48) mirroringDelegateStateForStoreType:1] == 1;
      v63 = [NSNumber numberWithDouble:v52];
      [v79 setObject:v63 forKeyedSubscript:@"reconciledGraphVisitCountImprovement"];

      v64 = [NSNumber numberWithDouble:v51];
      [v79 setObject:v64 forKeyedSubscript:@"reconciledGraphVisitContributionThisDevice"];

      v65 = [NSNumber numberWithDouble:v56];
      [v79 setObject:v65 forKeyedSubscript:@"reconciledGraphVisitContributionOtherDevices"];

      v66 = [NSNumber numberWithDouble:v53];
      [v79 setObject:v66 forKeyedSubscript:@"reconciledGraphVisitLoss"];

      v67 = [NSNumber numberWithDouble:v55];
      [v79 setObject:v67 forKeyedSubscript:@"reconciledGraphDensity"];

      v68 = [NSNumber numberWithDouble:v40];
      [v79 setObject:v68 forKeyedSubscript:@"ageOfOldestVisit"];

      v69 = [NSNumber numberWithUnsignedInteger:*(void *)(v89 + 56)];
      [v79 setObject:v69 forKeyedSubscript:@"algorithmType"];

      v70 = [NSNumber numberWithDouble:v54];
      [v79 setObject:v70 forKeyedSubscript:@"ageDifferenceOldestVisit"];

      v71 = [NSNumber numberWithBool:v62];
      [v79 setObject:v71 forKeyedSubscript:@"syncEnabled"];

      if (v60 == 1) {
        uint64_t v72 = MEMORY[0x1E4F1CC28];
      }
      else {
        uint64_t v72 = MEMORY[0x1E4F1CC38];
      }
      [v79 setObject:v72 forKeyedSubscript:@"multiDevice"];
      id v73 = [NSString alloc];
      v74 = (void *)[v73 initWithCString:RTAnalyticsEventReconciliationGraphDensity encoding:1];
      log_analytics_submission(v74, v79);
      v75 = [NSString stringWithFormat:@"com.apple.%@", v74];
      AnalyticsSendEvent();

      uint64_t v2 = v79;
      uint64_t v23 = v80;
      id v19 = v81;
      id v9 = 0;
      id v20 = v78;
    }

    uint64_t v8 = v83;
    uint64_t v4 = v84;
  }
}

@end