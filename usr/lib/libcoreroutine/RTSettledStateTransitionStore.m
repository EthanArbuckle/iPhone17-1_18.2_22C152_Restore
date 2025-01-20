@interface RTSettledStateTransitionStore
- (void)_purgeSettledStateTransitionsPredating:(id)a3 handler:(id)a4;
- (void)clearWithHandler:(id)a3;
- (void)enumerateStoredSettledStateTransitionsWithOptions:(id)a3 enumerationBlock:(id)a4;
- (void)purgeSettledStateTransitionsPredating:(id)a3 handler:(id)a4;
@end

@implementation RTSettledStateTransitionStore

- (void)enumerateStoredSettledStateTransitionsWithOptions:(id)a3 enumerationBlock:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    char v35 = 1;
    if (v7)
    {
      v9 = +[RTSettledStateTransitionMO fetchRequest];
      v10 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:[v7 ascending]];
      v37 = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      [v9 setSortDescriptors:v11];

      v12 = [v7 dateInterval];

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E4F28BA0];
        v14 = (void *)MEMORY[0x1E4F28F60];
        v15 = [v7 dateInterval];
        v16 = [v15 startDate];
        [v7 dateInterval];
        v17 = v32 = self;
        v18 = [v17 endDate];
        v19 = [v14 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"date", v16, @"date", v18];
        v36 = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        v21 = [v13 orPredicateWithSubpredicates:v20];
        [v9 setPredicate:v21];

        self = v32;
      }
      v22 = [v7 limit];

      if (v22)
      {
        v23 = [v7 limit];
        -[NSObject setFetchLimit:](v9, "setFetchLimit:", [v23 unsignedIntegerValue]);
      }
      if ([v7 batchSize])
      {
        unint64_t v24 = [v7 batchSize];
        if (v24 >= 0x400) {
          uint64_t v25 = 1024;
        }
        else {
          uint64_t v25 = v24;
        }
      }
      else
      {
        uint64_t v25 = 1024;
      }
      [v9 setFetchBatchSize:1024];
      [v9 setFetchLimit:v25];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __100__RTSettledStateTransitionStore_enumerateStoredSettledStateTransitionsWithOptions_enumerationBlock___block_invoke;
      v33[3] = &unk_1E6B97940;
      id v34 = v8;
      v30 = (void *)MEMORY[0x1E016DB00](v33);
      [(RTStore *)self enumerateType:objc_opt_class() fetchRequest:v9 enumerationBlock:v30];
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F5CFE8];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43[0] = @"requires non-nil options.";
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
      v9 = [v26 errorWithDomain:v27 code:7 userInfo:v28];

      v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v39 = v31;
        __int16 v40 = 2112;
        v41 = v9;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      (*((void (**)(id, void, NSObject *, char *))v8 + 2))(v8, 0, v9, &v35);
    }
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }
}

uint64_t __100__RTSettledStateTransitionStore_enumerateStoredSettledStateTransitionsWithOptions_enumerationBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearWithHandler:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)_purgeSettledStateTransitionsPredating:(id)a3 handler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12 = @"date";
    uint64_t v11 = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    [(RTStore *)self purgePredating:v6 predicateMappings:v9 handler:v7];
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", v10, 2u);
    }
  }
}

- (void)purgeSettledStateTransitionsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTSettledStateTransitionStore_purgeSettledStateTransitionsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __79__RTSettledStateTransitionStore_purgeSettledStateTransitionsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeSettledStateTransitionsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

@end