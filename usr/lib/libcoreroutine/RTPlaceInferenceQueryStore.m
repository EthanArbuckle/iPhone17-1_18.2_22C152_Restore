@interface RTPlaceInferenceQueryStore
- (void)_fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5;
- (void)_purgePlaceInferenceQueriesPredating:(id)a3 handler:(id)a4;
- (void)_storePlaceInferenceQuery:(id)a3 handler:(id)a4;
- (void)fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5;
- (void)purgePlaceInferenceQueriesPredating:(id)a3 handler:(id)a4;
- (void)storePlaceInferenceQuery:(id)a3 handler:(id)a4;
@end

@implementation RTPlaceInferenceQueryStore

void __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke(uint64_t a1, void *a2)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTPlaceInferenceQueryMO fetchRequest];
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28F60];
    v7 = [v5 startDate];
    v8 = [*(id *)(a1 + 32) endDate];
    v9 = [v6 predicateWithFormat:@"%K >= %@ && %K <= %@", @"date", v7, @"date", v8];
    [v4 setPredicate:v9];
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:*(unsigned __int8 *)(a1 + 56)];
  v40[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v4 setSortDescriptors:v11];

  id v30 = 0;
  v12 = [v3 executeFetchRequest:v4 error:&v30];
  id v13 = v30;
  v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v22 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v23 = [v12 count];
    *(_DWORD *)buf = 138413058;
    v33 = v22;
    __int16 v34 = 2112;
    v35 = v4;
    __int16 v36 = 2048;
    uint64_t v37 = v23;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v13)
  {
    v15 = 0;
  }
  else
  {
    id v25 = v3;
    v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v12 count]];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v24 = v12;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [MEMORY[0x1E4F5CE80] createWithManagedObject:*(void *)(*((void *)&v26 + 1) + 8 * v20)];
          if (v21) {
            [v15 addObject:v21];
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v18);
    }

    v12 = v24;
    id v3 = v25;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__RTPlaceInferenceQueryStore_fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke;
  v13[3] = &unk_1E6B907A0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __91__RTPlaceInferenceQueryStore_fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlaceInferenceQueriesWithDateInterval:*(void *)(a1 + 40) ascending:*(unsigned __int8 *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke;
    v15[3] = &unk_1E6B9CBD0;
    BOOL v19 = a4;
    id v16 = v9;
    SEL v18 = a2;
    id v11 = v10;
    id v17 = v11;
    id v12 = (void *)MEMORY[0x1E016DB00](v15);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke_10;
    v13[3] = &unk_1E6B90C18;
    id v14 = v11;
    [(RTStore *)self _performBlock:v12 contextType:1 errorHandler:v13];
  }
}

uint64_t __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_storePlaceInferenceQuery:(id)a3 handler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v9, v7, v10, v11);
}

- (void)storePlaceInferenceQuery:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTPlaceInferenceQueryStore_storePlaceInferenceQuery_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__RTPlaceInferenceQueryStore_storePlaceInferenceQuery_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storePlaceInferenceQuery:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgePlaceInferenceQueriesPredating:(id)a3 handler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = @"date";
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [(RTStore *)self purgePredating:v7 predicateMappings:v9 handler:v6];
}

- (void)purgePlaceInferenceQueriesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTPlaceInferenceQueryStore_purgePlaceInferenceQueriesPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__RTPlaceInferenceQueryStore_purgePlaceInferenceQueriesPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgePlaceInferenceQueriesPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

@end