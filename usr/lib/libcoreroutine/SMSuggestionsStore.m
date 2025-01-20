@interface SMSuggestionsStore
+ (id)fetchRequestForSuggestionEnumerationOptions:(id)a3 error:(id *)a4;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_clearSuggestionsWithHandler:(id)a3;
- (void)_deleteSuggestionsPredating:(id)a3 handler:(id)a4;
- (void)_fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchSuggestionsWithOptions:(id)a3 handler:(id)a4;
- (void)clearSuggestionsWithHandler:(id)a3;
- (void)deleteSuggestionsPredating:(id)a3 handler:(id)a4;
- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4;
- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4;
- (void)storeSuggestions:(id)a3 handler:(id)a4;
@end

@implementation SMSuggestionsStore

- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SMSuggestionsStore_fetchSuggestionsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__SMSuggestionsStore_fetchSuggestionsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSuggestionsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke;
    v19[3] = &unk_1E6B91018;
    v19[4] = self;
    id v20 = v7;
    id v9 = v8;
    id v21 = v9;
    SEL v22 = a2;
    id v10 = (void *)MEMORY[0x1E016DB00](v19);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke_9;
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
      v24 = "-[SMSuggestionsStore _fetchSuggestionsWithOptions:handler:]";
      __int16 v25 = 1024;
      LODWORD(v26) = 43;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"handler is a required parameter.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
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

void __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_class();
  uint64_t v34 = a1;
  uint64_t v5 = *(void *)(a1 + 40);
  id v40 = 0;
  id v6 = [v4 fetchRequestForSuggestionEnumerationOptions:v5 error:&v40];
  id v7 = v40;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    SEL v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    uint64_t v24 = [v6 fetchBatchSize];
    uint64_t v25 = [v6 fetchOffset];
    *(_DWORD *)buf = 138413058;
    v43 = v23;
    __int16 v44 = 2048;
    uint64_t v45 = v24;
    __int16 v46 = 2048;
    uint64_t v47 = v25;
    __int16 v48 = 2112;
    uint64_t v49 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);
  }
  if (v7)
  {
    (*(void (**)(void))(*(void *)(v34 + 48) + 16))();
  }
  else
  {
    id v39 = 0;
    id v9 = [v3 executeFetchRequest:v6 error:&v39];
    id v7 = v39;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      v28 = NSStringFromSelector(*(SEL *)(v34 + 56));
      uint64_t v29 = [v9 count];
      *(_DWORD *)buf = 138413314;
      v43 = v27;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v28;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v6;
      __int16 v48 = 2048;
      uint64_t v49 = v29;
      __int16 v50 = 2112;
      id v51 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@: %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
    }
    v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v6 fetchBatchSize]];
    if (!v7)
    {
      id v31 = v3;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v30 = v9;
      id v12 = v9;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v36;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
            id v18 = (void *)MEMORY[0x1E016D870]();
            v19 = [MEMORY[0x1E4F999B8] createWithManagedObject:v17];
            if (v19)
            {
              [v11 addObject:v19];
            }
            else
            {
              id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                id v21 = (objc_class *)objc_opt_class();
                v33 = NSStringFromClass(v21);
                v32 = NSStringFromSelector(*(SEL *)(v34 + 56));
                *(_DWORD *)buf = 138413058;
                v43 = v33;
                __int16 v44 = 2112;
                uint64_t v45 = (uint64_t)v32;
                __int16 v46 = 2112;
                uint64_t v47 = (uint64_t)v17;
                __int16 v48 = 2112;
                uint64_t v49 = 0;
                _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@: %@, suggestion MO, %@, suggestion, %@", buf, 0x2Au);
              }
            }

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v14);
      }

      id v3 = v31;
      id v9 = v30;
      id v7 = 0;
    }
    (*(void (**)(void))(*(void *)(v34 + 48) + 16))();
  }
}

uint64_t __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SMSuggestionsStore_fetchSuggestionsCountWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__SMSuggestionsStore_fetchSuggestionsCountWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSuggestionsCountWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[SMSuggestionsStore _fetchSuggestionsCountWithOptions:handler:]";
      __int16 v22 = 1024;
      int v23 = 120;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke;
  v16[3] = &unk_1E6B91018;
  v16[4] = self;
  id v17 = v7;
  id v10 = v8;
  id v18 = v10;
  SEL v19 = a2;
  id v11 = v7;
  id v12 = (void *)MEMORY[0x1E016DB00](v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke_11;
  v14[3] = &unk_1E6B90C18;
  id v15 = v10;
  id v13 = v10;
  [(RTStore *)self _performBlock:v12 contextType:1 errorHandler:v14];
}

void __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);
  id v21 = 0;
  id v6 = [v4 fetchRequestForSuggestionEnumerationOptions:v5 error:&v21];
  id v7 = v21;
  id v20 = 0;
  uint64_t v8 = [v3 countForFetchRequest:v6 error:&v20];

  id v9 = v20;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    uint64_t v15 = [v6 fetchBatchSize];
    uint64_t v16 = [v6 fetchOffset];
    *(_DWORD *)buf = 138413058;
    int v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2048;
    uint64_t v27 = v16;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);
  }
  if (v7)
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      SEL v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138413314;
      int v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v19;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v6;
      __int16 v28 = 2048;
      uint64_t v29 = v8;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total suggestions count, %lu, error, %@", buf, 0x34u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v11();
}

uint64_t __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSuggestions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SMSuggestionsStore_storeSuggestions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __47__SMSuggestionsStore_storeSuggestions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeSuggestions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)clearSuggestionsWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SMSuggestionsStore_clearSuggestionsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__SMSuggestionsStore_clearSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSuggestionsWithHandler:*(void *)(a1 + 40)];
}

- (void)_clearSuggestionsWithHandler:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)deleteSuggestionsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SMSuggestionsStore_deleteSuggestionsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __57__SMSuggestionsStore_deleteSuggestionsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSuggestionsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteSuggestionsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__SMSuggestionsStore__deleteSuggestionsPredating_handler___block_invoke;
    v10[3] = &unk_1E6B91088;
    id v11 = v6;
    id v12 = self;
    id v8 = v7;
    id v13 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v10);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];
  }
}

void __58__SMSuggestionsStore__deleteSuggestionsPredating_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMSuggestionMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K < %@)", @"endDate", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

+ (id)fetchRequestForSuggestionEnumerationOptions:(id)a3 error:(id *)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v81 = "+[SMSuggestionsStore fetchRequestForSuggestionEnumerationOptions:error:]";
    __int16 v82 = 2112;
    id v83 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  v63 = +[SMSuggestionMO fetchRequest];
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  if ([v4 sortByCreationDate])
  {
    id v8 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"creationDate" ascending:[v4 ascending]];
    [v6 addObject:v8];
  }
  if (([v4 includeSuppressed] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %ld)", @"suppressionReason", 1];
    [v7 addObject:v9];
  }
  v62 = v6;
  id v10 = [v4 dateInterval];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F28F60];
    id v12 = [v4 dateInterval];
    id v13 = [v12 startDate];
    uint64_t v14 = [v4 dateInterval];
    uint64_t v15 = [v14 endDate];
    uint64_t v16 = [v11 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"creationDate", v13, @"creationDate", v15];
    [v7 addObject:v16];
  }
  uint64_t v17 = [v4 filteredToSuggestionTriggers];
  unint64_t v18 = 0x1E4F28000;
  v64 = v7;
  if (v17)
  {
    SEL v19 = (void *)v17;
    id v20 = [v4 filteredToSuggestionTriggers];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      __int16 v22 = objc_opt_new();
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      int v23 = [v4 filteredToSuggestionTriggers];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v73 objects:v79 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v74 != v26) {
              objc_enumerationMutation(v23);
            }
            __int16 v28 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            uint64_t v29 = (void *)MEMORY[0x1E016D870]();
            __int16 v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %ld)", @"suggestionTrigger", [v28 unsignedIntegerValue]];
            [v22 addObject:v30];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v73 objects:v79 count:16];
        }
        while (v25);
      }

      unint64_t v18 = 0x1E4F28000uLL;
      id v31 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v22];
      id v7 = v64;
      [v64 addObject:v31];
    }
  }
  uint64_t v32 = [v4 filteredToSuggestionUserTypes];
  if (v32)
  {
    v33 = (void *)v32;
    uint64_t v34 = [v4 filteredToSuggestionUserTypes];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      long long v36 = objc_opt_new();
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v37 = [v4 filteredToSuggestionUserTypes];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v70 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v69 + 1) + 8 * j);
            v43 = (void *)MEMORY[0x1E016D870]();
            __int16 v44 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %ld)", @"suggestionUserType", [v42 unsignedIntegerValue]];
            [v36 addObject:v44];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v69 objects:v78 count:16];
        }
        while (v39);
      }

      unint64_t v18 = 0x1E4F28000uLL;
      uint64_t v45 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v36];
      id v7 = v64;
      [v64 addObject:v45];
    }
  }
  uint64_t v46 = [v4 filteredToSessionTypes];
  if (v46)
  {
    uint64_t v47 = (void *)v46;
    __int16 v48 = [v4 filteredToSessionTypes];
    uint64_t v49 = [v48 count];

    if (v49)
    {
      __int16 v50 = objc_opt_new();
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v51 = [v4 filteredToSessionTypes];
      uint64_t v52 = [v51 countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v66;
        do
        {
          for (uint64_t k = 0; k != v53; ++k)
          {
            if (*(void *)v66 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v65 + 1) + 8 * k);
            v57 = (void *)MEMORY[0x1E016D870]();
            v58 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %ld)", @"sessionType", [v56 unsignedIntegerValue]];
            [v50 addObject:v58];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v65 objects:v77 count:16];
        }
        while (v53);
      }

      unint64_t v18 = 0x1E4F28000uLL;
      v59 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v50];
      id v7 = v64;
      [v64 addObject:v59];
    }
  }
  v60 = [*(id *)(v18 + 2976) andPredicateWithSubpredicates:v7];
  [v63 setPredicate:v60];

  [v63 setSortDescriptors:v62];
  [v63 setFetchBatchSize:[v4 batchSize]];
  [v63 setFetchLimit:[v4 fetchLimit]];
  [v63 setFetchOffset:[v4 offset]];
  [v63 setReturnsObjectsAsFaults:0];

  return v63;
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
    id v9 = objc_opt_class();
    if (![v9 isEqual:objc_opt_class()])
    {
      uint64_t v15 = NSString;
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      unint64_t v18 = [v15 stringWithFormat:@"error of type, %@, is not supported", v17];

      SEL v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = v18;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      __int16 v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

      id v23 = v22;
      *a5 = v23;

      goto LABEL_13;
    }
    id v25 = 0;
    id v10 = [(id)objc_opt_class() fetchRequestForSuggestionEnumerationOptions:v8 error:&v25];
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
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
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

@end