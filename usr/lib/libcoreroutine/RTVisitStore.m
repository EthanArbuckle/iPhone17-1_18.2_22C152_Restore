@interface RTVisitStore
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_fetchVisitsWithOptions:(id)a3 handler:(id)a4;
- (void)_purgeVisitsPredating:(id)a3 handler:(id)a4;
- (void)_storeVisit:(id)a3 handler:(id)a4;
- (void)fetchVisitsWithOptions:(id)a3 handler:(id)a4;
- (void)purgeVisitsPredating:(id)a3 handler:(id)a4;
- (void)storeVisit:(id)a3 handler:(id)a4;
@end

@implementation RTVisitStore

uint64_t __47__RTVisitStore_fetchVisitsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  v78[2] = *MEMORY[0x1E4F143B8];
  id v55 = a2;
  v3 = +[RTVisitMO fetchRequest];
  [v3 setReturnsObjectsAsFaults:0];
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [*(id *)(a1 + 32) confidence];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28F60];
    v7 = [*(id *)(a1 + 32) confidence];
    v8 = [v6 predicateWithFormat:@"%K == %@", @"confidence", v7];
    [v4 addObject:v8];
  }
  v57 = v4;
  v9 = [*(id *)(a1 + 32) dateInterval];

  unint64_t v10 = 0x1E4F28000uLL;
  v56 = v3;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E4F28BA0];
    v12 = (void *)MEMORY[0x1E4F28F60];
    v54 = [*(id *)(a1 + 32) dateInterval];
    v52 = [v54 startDate];
    v53 = [*(id *)(a1 + 32) dateInterval];
    v51 = [v53 endDate];
    v50 = [v12 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"entryDate", v52, @"entryDate", v51];
    v78[0] = v50;
    v13 = (void *)MEMORY[0x1E4F28F60];
    v14 = [*(id *)(a1 + 32) dateInterval];
    v15 = [v14 startDate];
    v16 = [*(id *)(a1 + 32) dateInterval];
    v17 = [v16 endDate];
    v18 = [v13 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"exitDate", v15, @"exitDate", v17];
    v78[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
    v20 = [v11 orPredicateWithSubpredicates:v19];
    [v57 addObject:v20];

    unint64_t v10 = 0x1E4F28000;
    v3 = v56;
  }
  v21 = [*(id *)(a1 + 32) sources];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v23 = [MEMORY[0x1E4F1CA48] array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v24 = [*(id *)(a1 + 32) sources];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v77 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v64 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"source", *(void *)(*((void *)&v63 + 1) + 8 * i)];
          [v23 addObject:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v63 objects:v77 count:16];
      }
      while (v26);
    }

    unint64_t v10 = 0x1E4F28000uLL;
    v30 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v23];
    [v57 addObject:v30];

    v3 = v56;
  }
  v31 = v57;
  if ([v57 count])
  {
    v32 = [*(id *)(v10 + 2976) andPredicateWithSubpredicates:v57];
    [v3 setPredicate:v32];
  }
  v33 = [*(id *)(a1 + 32) limit];

  v34 = v55;
  if (v33)
  {
    v35 = [*(id *)(a1 + 32) limit];
    [v3 setFetchLimit:[v35 unsignedIntegerValue]];
  }
  v36 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"detectionDate" ascending:[*(id *)(a1 + 32) ascending]];
  v76 = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  [v3 setSortDescriptors:v37];

  [v3 setFetchBatchSize:10];
  id v62 = 0;
  v38 = [v55 executeFetchRequest:v3 error:&v62];
  id v39 = v62;
  v40 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    v48 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v49 = [v38 count];
    *(_DWORD *)buf = 138413058;
    v69 = v48;
    __int16 v70 = 2112;
    v71 = v3;
    __int16 v72 = 2048;
    uint64_t v73 = v49;
    __int16 v74 = 2112;
    id v75 = v39;
    _os_log_debug_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v39)
  {
    v41 = 0;
  }
  else
  {
    v41 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v38 count]];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v42 = v38;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v59 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [MEMORY[0x1E4F5CFC8] createWithManagedObject:*(void *)(*((void *)&v58 + 1) + 8 * j)];
          if (v47) {
            [v41 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v44);
    }

    v34 = v55;
    v3 = v56;
    v31 = v57;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchVisitsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTVisitStore_fetchVisitsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_fetchVisitsWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke;
    v13[3] = &unk_1E6B91060;
    id v14 = v7;
    SEL v16 = a2;
    id v9 = v8;
    id v15 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v13);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke_26;
    v11[3] = &unk_1E6B90C18;
    id v12 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v11];
  }
}

uint64_t __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_storeVisit:(id)a3 handler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v9, v7, v10, v11);
}

- (void)storeVisit:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RTVisitStore_storeVisit_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __35__RTVisitStore_storeVisit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeVisit:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_purgeVisitsPredating:(id)a3 handler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = @"detectionDate";
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [(RTStore *)self purgePredating:v7 predicateMappings:v9 handler:v6];
}

- (void)purgeVisitsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__RTVisitStore_purgeVisitsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __45__RTVisitStore_purgeVisitsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeVisitsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"the visit store doesn't support enumeration";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:7 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return 0;
}

@end