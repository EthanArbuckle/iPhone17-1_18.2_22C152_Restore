@interface RTPeopleDensityStore
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_fetchPeopleDensityFromDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_purgePeopleDensityPredating:(id)a3 handler:(id)a4;
- (void)_storePeopleDensity:(id)a3 handler:(id)a4;
- (void)clearWithHandler:(id)a3;
- (void)fetchPeopleDensityFromDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)purgePeopleDensityPredating:(id)a3 handler:(id)a4;
- (void)storePeopleDensity:(id)a3 handler:(id)a4;
@end

@implementation RTPeopleDensityStore

- (void)fetchPeopleDensityFromDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__RTPeopleDensityStore_fetchPeopleDensityFromDate_endDate_handler___block_invoke;
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

uint64_t __67__RTPeopleDensityStore_fetchPeopleDensityFromDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPeopleDensityFromDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchPeopleDensityFromDate:(id)a3 endDate:(id)a4 handler:(id)a5
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
      v37 = "-[RTPeopleDensityStore _fetchPeopleDensityFromDate:endDate:handler:]";
      __int16 v38 = 1024;
      int v39 = 44;
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
    v37 = "-[RTPeopleDensityStore _fetchPeopleDensityFromDate:endDate:handler:]";
    __int16 v38 = 1024;
    int v39 = 45;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_11:
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTPeopleDensityStore _fetchPeopleDensityFromDate:endDate:handler:]";
      __int16 v38 = 1024;
      int v39 = 46;
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
    v28[2] = __68__RTPeopleDensityStore__fetchPeopleDensityFromDate_endDate_handler___block_invoke;
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
    v26[2] = __68__RTPeopleDensityStore__fetchPeopleDensityFromDate_endDate_handler___block_invoke_18;
    v26[3] = &unk_1E6B90C18;
    v27 = v24;
    [(RTStore *)self _performBlock:v25 contextType:1 errorHandler:v26];
  }
}

void __68__RTPeopleDensityStore__fetchPeopleDensityFromDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RTPeopleDensityMO fetchRequest];
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
          id v17 = [MEMORY[0x1E4F5CE60] createWithManagedObject:v15];
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

uint64_t __68__RTPeopleDensityStore__fetchPeopleDensityFromDate_endDate_handler___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storePeopleDensity:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTPeopleDensityStore_storePeopleDensity_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__RTPeopleDensityStore_storePeopleDensity_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storePeopleDensity:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_storePeopleDensity:(id)a3 handler:(id)a4
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
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)purgePeopleDensityPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTPeopleDensityStore_purgePeopleDensityPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __60__RTPeopleDensityStore_purgePeopleDensityPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgePeopleDensityPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgePeopleDensityPredating:(id)a3 handler:(id)a4
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
  v12[0] = @"the PeopleDensity event store doesn't support enumeration";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:7 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return 0;
}

@end