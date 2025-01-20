@interface RTHintStore
+ (BOOL)batchInsertHintsDictionary:(id)a3 context:(id)a4 error:(id *)a5;
+ (id)fetchRequestForHintEnumerationOptions:(id)a3 error:(id *)a4;
+ (id)predicateForSourceFilter:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_clearHintsForSourceFilter:(id)a3 handler:(id)a4;
- (void)_fetchHintStatsNearLocation:(id)a3 handler:(id)a4;
- (void)_purgeHintsPredating:(id)a3 handler:(id)a4;
- (void)_regenerateLOIHintsWithHandler:(id)a3;
- (void)clearHintsForSourceFilter:(id)a3 handler:(id)a4;
- (void)clearWithHandler:(id)a3;
- (void)enumerateStoredHintsWithOptions:(id)a3 usingBlock:(id)a4;
- (void)fetchHintStatsNearLocation:(id)a3 handler:(id)a4;
- (void)fetchIsHintNearLocation:(id)a3 withHandler:(id)a4;
- (void)purgeHintsPredating:(id)a3 handler:(id)a4;
- (void)regenerateLOIHintsWithHandler:(id)a3;
@end

@implementation RTHintStore

- (void)clearWithHandler:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)clearHintsForSourceFilter:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__RTHintStore_clearHintsForSourceFilter_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __49__RTHintStore_clearHintsForSourceFilter_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearHintsForSourceFilter:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_clearHintsForSourceFilter:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() predicateForSourceFilter:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__RTHintStore__clearHintsForSourceFilter_handler___block_invoke;
  v12[3] = &unk_1E6B91088;
  id v13 = v8;
  v14 = self;
  id v15 = v6;
  id v9 = v6;
  id v10 = v8;
  v11 = (void *)MEMORY[0x1E016DB00](v12);
  [(RTStore *)self _performBlock:v11 contextType:0 errorHandler:v9];
}

void __50__RTHintStore__clearHintsForSourceFilter_handler___block_invoke(void *a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTHintMO fetchRequest];
  [v4 setPredicate:a1[4]];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  id v6 = (void *)a1[5];
  v8[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 executeDeleteRequests:v7 context:v3 handler:a1[6]];
}

- (void)regenerateLOIHintsWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__RTHintStore_regenerateLOIHintsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__RTHintStore_regenerateLOIHintsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _regenerateLOIHintsWithHandler:*(void *)(a1 + 40)];
}

- (void)_regenerateLOIHintsWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTHintStore _regenerateLOIHintsWithHandler:]";
      __int16 v12 = 1024;
      int v13 = 85;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v6 = [NSNumber numberWithInt:8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke;
  v8[3] = &unk_1E6B91100;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(RTHintStore *)self clearHintsForSourceFilter:v6 handler:v8];
}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_2;
    v6[3] = &unk_1E6B90CE0;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    dispatch_async(v4, v6);
  }
}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_2(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_3;
  v7[3] = &unk_1E6B910D8;
  v2 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v2;
  id v3 = (void *)MEMORY[0x1E016DB00](v7);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_49;
  v5[3] = &unk_1E6B90C18;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 _performBlock:v3 contextType:2 errorHandler:v5];
}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v18 = objc_opt_new();
  id v3 = 0;
  uint64_t v4 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  id v33 = 0;
  while (1)
  {
    v5 = (void *)MEMORY[0x1E016D870]();
    id v6 = +[RTLearnedLocationOfInterestMO fetchRequest];
    v34[0] = @"locationLatitude";
    v34[1] = @"locationLongitude";
    v34[2] = @"locationHorizontalUncertainty";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    [v6 setPropertiesToFetch:v7];

    [v6 setResultType:2];
    [v6 setFetchLimit:512];
    [v6 setFetchOffset:v4];
    id v27 = 0;
    id v8 = [v2 executeFetchRequest:v6 error:&v27];
    id v9 = v27;

    uint64_t v10 = [v8 count];
    v11 = [MEMORY[0x1E4F1C9C8] now];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_30;
    v21[3] = &unk_1E6B910B0;
    id v12 = v11;
    id v22 = v12;
    id v13 = v18;
    uint64_t v14 = *(void *)(a1 + 32);
    id v23 = v13;
    uint64_t v24 = v14;
    id v15 = v2;
    id v25 = v15;
    v26 = &v28;
    [v8 enumerateObjectsUsingBlock:v21];

    if (v29[5]) {
      break;
    }
    v4 += v10;
    id v3 = v8;
    if (![v8 count])
    {
      if (!v29[5] && [v13 count])
      {
        v16 = objc_opt_class();
        v17 = (id *)(v29 + 5);
        id obj = (id)v29[5];
        [v16 batchInsertHintsDictionary:v13 context:v15 error:&obj];
        objc_storeStrong(v17, obj);
      }
      break;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(&v28, 8);
}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 objectForKeyedSubscript:@"locationLatitude"];
  id v7 = [v4 objectForKeyedSubscript:@"locationLongitude"];
  id v8 = [v4 objectForKeyedSubscript:@"locationHorizontalUncertainty"];

  id v9 = [v5 initWithObjectsAndKeys:v6, @"latitude", v7, @"longitude", v8, @"horizontalUncertainty", *(void *)(a1 + 32), @"date", &unk_1F344F8C8, @"source", 0];
  [*(id *)(a1 + 40) addObject:v9];
  if ([*(id *)(a1 + 40) count] == 1024)
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    id v14 = *(id *)(v13 + 40);
    [v10 batchInsertHintsDictionary:v11 context:v12 error:&v14];
    objc_storeStrong((id *)(v13 + 40), v14);
    [*(id *)(a1 + 40) removeAllObjects];
  }
}

uint64_t __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)batchInsertHintsDictionary:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__RTHintStore_batchInsertHintsDictionary_context_error___block_invoke;
  v13[3] = &unk_1E6B91128;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  v16 = &v17;
  [v10 performBlockAndWait:v13];
  if (a5) {
    *a5 = (id) v18[5];
  }
  BOOL v11 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __56__RTHintStore_batchInsertHintsDictionary_context_error___block_invoke(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C028]);
  id v3 = +[RTHintMO entity];
  id v4 = (void *)[v2 initWithEntity:v3 objects:a1[4]];

  id v5 = (void *)a1[5];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = (id)[v5 executeRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
}

+ (id)predicateForSourceFilter:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_opt_new();
    for (uint64_t i = -1; i != 11; ++i)
    {
      uint64_t v6 = (void *)MEMORY[0x1E016D870]();
      if (([v3 integerValue] & (1 << (i + 1))) != 0)
      {
        id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = [v3 integerValue];
          *(_DWORD *)buf = 134218240;
          uint64_t v13 = i;
          __int16 v14 = 2048;
          uint64_t v15 = v9;
          _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "Setting up predicate for hintSource, %ld, sourceFilter, %ld", buf, 0x16u);
        }

        id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %lld", @"source", i];
        [v4 addObject:v8];
      }
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:2 subpredicates:v4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)fetchRequestForHintEnumerationOptions:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[RTHintMO fetchRequest];
  id v7 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:[v5 ascending]];
  v41[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  [v6 setSortDescriptors:v8];

  id v9 = [v5 referenceLocation];

  if (!v9) {
    goto LABEL_3;
  }
  id v10 = [v5 referenceLocation];
  BOOL v11 = [v5 distance];
  [v11 doubleValue];
  id v38 = 0;
  char v12 = [v6 setupBoundingBoxFetchRequestForLocation:v10 distance:0 entityCanBeLocationShifted:0 locationShifter:0 resultExpansionPredicates:0 resultFilteringPredicates:0 error:&v38];
  id v9 = v38;

  if ((v12 & 1) == 0)
  {
    if (a4)
    {
      id v9 = v9;
      id v22 = 0;
      *a4 = v9;
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
LABEL_3:
    uint64_t v13 = [v5 sourceFilter];

    if (v13)
    {
      __int16 v14 = objc_opt_class();
      uint64_t v15 = [v5 sourceFilter];
      uint64_t v16 = [v14 predicateForSourceFilter:v15];

      if (v16)
      {
        uint64_t v17 = [v6 predicate];

        if (v17)
        {
          v18 = (void *)MEMORY[0x1E4F28BA0];
          uint64_t v19 = [v6 predicate];
          v40[0] = v19;
          v40[1] = v16;
          v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
          v21 = [v18 andPredicateWithSubpredicates:v20];
          [v6 setPredicate:v21];
        }
        else
        {
          [v6 setPredicate:v16];
        }
      }
    }
    id v23 = [v5 dateInterval];

    if (v23)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28F60];
      id v25 = [v5 dateInterval];
      v26 = [v25 startDate];
      id v27 = [v5 dateInterval];
      uint64_t v28 = [v27 endDate];
      v29 = [v24 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"date", v26, @"date", v28];

      uint64_t v30 = [v6 predicate];

      if (v30)
      {
        v31 = (void *)MEMORY[0x1E4F28BA0];
        v32 = [v6 predicate];
        v39[0] = v32;
        v39[1] = v29;
        id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
        v34 = [v31 andPredicateWithSubpredicates:v33];
        [v6 setPredicate:v34];
      }
      else
      {
        [v6 setPredicate:v29];
      }
    }
    if ([v5 batchSize])
    {
      unint64_t v35 = [v5 batchSize];
      if (v35 >= 0x400) {
        uint64_t v36 = 1024;
      }
      else {
        uint64_t v36 = v35;
      }
    }
    else
    {
      uint64_t v36 = 1024;
    }
    [v6 setFetchLimit:v36];
    [v6 setFetchBatchSize:1024];
    id v22 = v6;
  }

  return v22;
}

- (void)enumerateStoredHintsWithOptions:(id)a3 usingBlock:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, id, char *))a4;
  if (v8)
  {
    char v22 = 0;
    if (v7)
    {
      id v21 = 0;
      id v9 = [(id)objc_opt_class() fetchRequestForHintEnumerationOptions:v7 error:&v21];
      id v10 = v21;
      if (v10) {
        v8[2](v8, 0, v10, &v22);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v24 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58__RTHintStore_enumerateStoredHintsWithOptions_usingBlock___block_invoke;
      v17[3] = &unk_1E6B91150;
      v20 = buf;
      id v18 = v7;
      uint64_t v19 = v8;
      BOOL v11 = (void *)MEMORY[0x1E016DB00](v17);
      [(RTStore *)self enumerateType:objc_opt_class() fetchRequest:v9 enumerationBlock:v11];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"requires non-nil options.";
      __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      id v10 = [v13 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v14];

      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      v8[2](v8, 0, v10, &v22);
    }
  }
  else
  {
    char v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }
}

void __58__RTHintStore_enumerateStoredHintsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v9 = [v13 count];
  if ([*(id *)(a1 + 32) limit])
  {
    unint64_t v10 = v9 + v8;
    if (v10 > [*(id *)(a1 + 32) limit])
    {
      uint64_t v11 = [v13 subarrayWithRange:0, v10 - [*(id *)(a1 + 32) limit]];

      id v13 = (id)v11;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v13 count];
  if ([*(id *)(a1 + 32) limit])
  {
    unint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v12 >= [*(id *)(a1 + 32) limit]) {
      *a4 = 1;
    }
  }
}

- (void)_purgeHintsPredating:(id)a3 handler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unint64_t v12 = @"date";
    uint64_t v11 = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    [(RTStore *)self purgePredating:v6 predicateMappings:v9 handler:v7];
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", v10, 2u);
    }
  }
}

- (void)purgeHintsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__RTHintStore_purgeHintsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __43__RTHintStore_purgeHintsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeHintsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchHintStatsNearLocation:(id)a3 handler:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      *(void *)buf = 0;
      v29 = buf;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__6;
      v32 = __Block_byref_object_dispose__6;
      id v33 = 0;
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke;
      v22[3] = &unk_1E6B91178;
      id v23 = v7;
      id v10 = v8;
      id v25 = v10;
      v26 = buf;
      SEL v27 = a2;
      id v11 = v9;
      id v24 = v11;
      id v12 = (void *)MEMORY[0x1E016DB00](v22);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke_80;
      v20[3] = &unk_1E6B90C18;
      id v21 = v10;
      [(RTStore *)self _performBlock:v12 contextType:1 errorHandler:v20];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      __int16 v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      uint64_t v15 = NSString;
      uint64_t v16 = NSStringFromSelector(a2);
      uint64_t v17 = [v15 stringWithFormat:@"%@ requires a valid location.", v16];
      v35[0] = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v19 = [v14 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v18];

      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v19);
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke(uint64_t a1, void *a2)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTHintMO fetchRequest];
  uint64_t v5 = *(void *)(a1 + 32);
  id v38 = 0;
  char v6 = [v4 setupBoundingBoxFetchRequestForLocation:v5 distance:0 entityCanBeLocationShifted:0 locationShifter:0 resultExpansionPredicates:0 resultFilteringPredicates:&v38 error:130.0];
  id v7 = v38;
  id v8 = v7;
  if (v6)
  {
    id v31 = v7;
    id v9 = objc_opt_new();
    [v9 setName:@"count"];
    id v10 = (void *)MEMORY[0x1E4F28C68];
    id v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"source"];
    v50[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    id v13 = [v10 expressionForFunction:@"count:" arguments:v12];
    [v9 setExpression:v13];

    [v9 setExpressionResultType:300];
    v49[0] = @"source";
    v49[1] = v9;
    uint64_t v30 = v9;
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    [v4 setPropertiesToFetch:v14];

    v48 = @"source";
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v4 setPropertiesToGroupBy:v15];

    [v4 setResultType:2];
    [v4 setFetchBatchSize:1024];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v16 + 40);
    id v32 = v3;
    uint64_t v17 = [v3 executeFetchRequest:v4 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityHint);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      SEL v27 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v28 = [v17 count];
      uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138413058;
      v41 = v27;
      __int16 v42 = 2112;
      v43 = v4;
      __int16 v44 = 2048;
      uint64_t v45 = v28;
      __int16 v46 = 2112;
      uint64_t v47 = v29;
      _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v25 = [v24 objectForKeyedSubscript:@"source"];
          v26 = [v24 objectForKeyedSubscript:@"count"];
          [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v8 = v31;
    id v3 = v32;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchHintStatsNearLocation:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    id v10 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__RTHintStore_fetchHintStatsNearLocation_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    block[4] = self;
    id v19 = v7;
    uint64_t v20 = v9;
    dispatch_async(v10, block);
  }
  else if (v8)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v13 = NSString;
    __int16 v14 = NSStringFromSelector(a2);
    uint64_t v15 = [v13 stringWithFormat:@"%@ requires a valid location.", v14];
    v22[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = [v11 errorWithDomain:v12 code:7 userInfo:v16];

    ((void (**)(void, void, void *))v9)[2](v9, 0, v17);
  }
}

uint64_t __50__RTHintStore_fetchHintStatsNearLocation_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchHintStatsNearLocation:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchIsHintNearLocation:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__RTHintStore_fetchIsHintNearLocation_withHandler___block_invoke;
  v8[3] = &unk_1E6B911A0;
  id v9 = v6;
  id v7 = v6;
  [(RTHintStore *)self fetchHintStatsNearLocation:a3 handler:v8];
}

void __51__RTHintStore_fetchIsHintNearLocation_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v7 = [a2 allValues];
  id v6 = [v7 valueForKeyPath:@"@sum.self"];
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, [v6 integerValue] > 0, v5);
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
      id v18 = [v15 stringWithFormat:@"error of type, %@, is not supported", v17];

      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = v18;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      uint64_t v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

      id v23 = v22;
      *a5 = v23;

      goto LABEL_13;
    }
    id v25 = 0;
    id v10 = [(id)objc_opt_class() fetchRequestForHintEnumerationOptions:v8 error:&v25];
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
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
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