@interface RTWorkoutDistanceStore
+ (id)fetchRequestForWorkoutDistanceEnumerationOptions:(id)a3 error:(id *)a4;
+ (id)predicateForObjectIDs:(id)a3;
+ (id)propertyDictionaryForIsVisited:(BOOL)a3;
- (id)_getCrossJoinPredicateForClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_deleteWorkoutDistanceWithWorkoutUUID:(id)a3 handler:(id)a4;
- (void)_fetchTotalWorkoutDistancesCountWithClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 handler:(id)a7;
- (void)_fetchTotalWorkoutDistancesCountWithHandler:(id)a3;
- (void)_fetchUniqueWorkoutUUIDsWithHandler:(id)a3;
- (void)_fetchWorkoutDistanceWithFirstWorkout:(id)a3 secondWorkout:(id)a4 handler:(id)a5;
- (void)_fetchWorkoutDistancesWithWorkout:(id)a3 handler:(id)a4;
- (void)_fetchWorkoutsWithOffset:(unint64_t)a3 limit:(unint64_t)a4 maxDistanceThreshold:(double)a5 includeVisitedRecords:(BOOL)a6 handler:(id)a7;
- (void)_updateWorkoutDistancesWithPredicate:(id)a3 propertiesDictionary:(id)a4 handler:(id)a5;
- (void)clearWithHandler:(id)a3;
- (void)deleteWorkoutDistanceWithWorkoutUUID:(id)a3 handler:(id)a4;
- (void)enumerateStoredWorkoutDistancesWithOptions:(id)a3 usingBlock:(id)a4;
- (void)fetchTotalWorkoutDistancesCountWithClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 handler:(id)a7;
- (void)fetchTotalWorkoutDistancesCountWithHandler:(id)a3;
- (void)fetchUniqueWorkoutUUIDsWithHandler:(id)a3;
- (void)fetchWorkoutDistanceWithFirstWorkout:(id)a3 secondWorkout:(id)a4 handler:(id)a5;
- (void)fetchWorkoutDistancesWithOffset:(unint64_t)a3 limit:(unint64_t)a4 maxDistanceThreshold:(double)a5 includeVisitedRecords:(BOOL)a6 handler:(id)a7;
- (void)fetchWorkoutDistancesWithWorkout:(id)a3 handler:(id)a4;
- (void)storeWorkoutDistances:(id)a3 handler:(id)a4;
- (void)updateWorkoutDistancesWithObjectIDs:(id)a3 isVisited:(BOOL)a4 handler:(id)a5;
@end

@implementation RTWorkoutDistanceStore

- (void)storeWorkoutDistances:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTWorkoutDistanceStore_storeWorkoutDistances_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __56__RTWorkoutDistanceStore_storeWorkoutDistances_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeWorkoutDistances:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

+ (id)predicateForObjectIDs:(id)a3
{
  if (a3)
  {
    v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", a3];
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: objectIDs", buf, 2u);
    }

    v3 = 0;
  }

  return v3;
}

+ (id)propertyDictionaryForIsVisited:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"isVisited";
  v3 = (void *)MEMORY[0x1E4F28C68];
  v4 = [NSNumber numberWithBool:a3];
  v5 = [v3 expressionForConstantValue:v4];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (void)updateWorkoutDistancesWithObjectIDs:(id)a3 isVisited:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__RTWorkoutDistanceStore_updateWorkoutDistancesWithObjectIDs_isVisited_handler___block_invoke;
  v13[3] = &unk_1E6B907A0;
  id v14 = v8;
  v15 = self;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __80__RTWorkoutDistanceStore_updateWorkoutDistancesWithObjectIDs_isVisited_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v5 = *(void **)(a1 + 40);
    id v7 = [(id)objc_opt_class() propertyDictionaryForIsVisited:*(unsigned __int8 *)(a1 + 56)];
    [v5 _updateWorkoutDistancesWithPredicate:0 propertiesDictionary:v7 handler:*(void *)(a1 + 48)];
    goto LABEL_5;
  }
  if ([v2 count])
  {
    v3 = *(void **)(a1 + 40);
    id v7 = [(id)objc_opt_class() predicateForObjectIDs:*(void *)(a1 + 32)];
    v4 = [(id)objc_opt_class() propertyDictionaryForIsVisited:*(unsigned __int8 *)(a1 + 56)];
    [v3 _updateWorkoutDistancesWithPredicate:v7 propertiesDictionary:v4 handler:*(void *)(a1 + 48)];

LABEL_5:

    return;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v6();
}

- (void)_updateWorkoutDistancesWithPredicate:(id)a3 propertiesDictionary:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v10 && [v10 count])
    {
      id v12 = (void *)MEMORY[0x1E016D870]();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke;
      v17[3] = &unk_1E6B963A0;
      id v18 = v9;
      v19 = self;
      SEL v22 = a2;
      id v20 = v10;
      id v13 = v11;
      id v21 = v13;
      id v14 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke_17;
      v15[3] = &unk_1E6B90C18;
      id v16 = v13;
      [(RTStore *)self _performBlock:v14 contextType:2 errorHandler:v15];
    }
    else
    {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
}

void __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F1C038];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = +[RTWorkoutDistanceMO entity];
  id v7 = (void *)[v5 initWithEntity:v6];

  if (*(void *)(a1 + 32))
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      BOOL v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
      id v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      __int16 v32 = 2112;
      v33 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, predicate, %@", buf, 0x20u);
    }
    [v7 setPredicate:*(void *)(a1 + 32)];
  }
  [v7 setPropertiesToUpdate:*(void *)(a1 + 48)];
  [v7 setResultType:2];
  id v27 = 0;
  id v9 = [v4 executeRequest:v7 error:&v27];

  id v10 = v27;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12)
    {
      v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      id v21 = NSStringFromSelector(*(SEL *)(a1 + 64));
      SEL v22 = [v9 result];
      uint64_t v23 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      v29 = v20;
      __int16 v30 = 2112;
      v31 = v21;
      __int16 v32 = 2112;
      v33 = v22;
      __int16 v34 = 2112;
      uint64_t v35 = v23;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, batchupdate result, %@, properties dictionary, %@, error, %@", buf, 0x34u);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = [v9 result];
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, [v14 integerValue], v10);
  }
  else
  {
    if (v12)
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      v29 = v25;
      __int16 v30 = 2112;
      v31 = v26;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, batchupdate result is nil", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearWithHandler:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)deleteWorkoutDistanceWithWorkoutUUID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTWorkoutDistanceStore_deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __71__RTWorkoutDistanceStore_deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteWorkoutDistanceWithWorkoutUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteWorkoutDistanceWithWorkoutUUID:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __72__RTWorkoutDistanceStore__deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke;
      BOOL v17 = &unk_1E6B91088;
      id v18 = v6;
      v19 = self;
      id v8 = v7;
      id v20 = v8;
      id v9 = (void *)MEMORY[0x1E016DB00](&v14);
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8, v14, v15, v16, v17);

      id v10 = v18;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires valid workouts.";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v13 = [v11 errorWithDomain:v12 code:0 userInfo:v10];
      (*((void (**)(id, void *))v7 + 2))(v7, v13);
    }
  }
}

void __72__RTWorkoutDistanceStore__deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWorkoutDistanceMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %@) || (%K == %@)", @"firstWorkout", a1[4], @"secondWorkout", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (void)fetchUniqueWorkoutUUIDsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__RTWorkoutDistanceStore_fetchUniqueWorkoutUUIDsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__RTWorkoutDistanceStore_fetchUniqueWorkoutUUIDsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchUniqueWorkoutUUIDsWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchUniqueWorkoutUUIDsWithHandler:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke;
  v11[3] = &unk_1E6B91060;
  v11[4] = self;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  id v7 = (void *)MEMORY[0x1E016DB00](v11);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke_35;
  v9[3] = &unk_1E6B90C18;
  id v10 = v6;
  id v8 = v6;
  [(RTStore *)self _performBlock:v7 contextType:1 errorHandler:v9];
}

void __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWorkoutDistanceMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setReturnsDistinctResults:1];
  v29[0] = @"firstWorkout";
  v29[1] = @"secondWorkout";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v4 setPropertiesToFetch:v5];

  [v4 setResultType:2];
  id v18 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v18];

  id v7 = v18;
  id v8 = objc_opt_new();
  id v9 = [v6 valueForKey:@"firstWorkout"];
  id v10 = [v6 valueForKey:@"secondWorkout"];
  if (v9) {
    [v8 addObjectsFromArray:v9];
  }
  if (v10) {
    [v8 addObjectsFromArray:v10];
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v17 = [v6 count];
    *(_DWORD *)buf = 138413314;
    id v20 = v15;
    __int16 v21 = 2112;
    SEL v22 = v16;
    __int16 v23 = 2112;
    v24 = v4;
    __int16 v25 = 2048;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  SEL v13 = [v8 allObjects];
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v7);
}

uint64_t __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTotalWorkoutDistancesCountWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __69__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTotalWorkoutDistancesCountWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchTotalWorkoutDistancesCountWithHandler:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke;
  v11[3] = &unk_1E6B91060;
  v11[4] = self;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  id v7 = (void *)MEMORY[0x1E016DB00](v11);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke_36;
  v9[3] = &unk_1E6B90C18;
  id v10 = v6;
  id v8 = v6;
  [(RTStore *)self _performBlock:v7 contextType:1 errorHandler:v9];
}

void __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWorkoutDistanceMO fetchRequest];
  id v11 = 0;
  uint64_t v5 = [v3 countForFetchRequest:v4 error:&v11];

  id v6 = v11;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138413314;
    SEL v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total workout distances count, %lu, error, %@", buf, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTotalWorkoutDistancesCountWithClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = [(RTNotifier *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __134__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke;
  v19[3] = &unk_1E6B91418;
  v19[4] = self;
  id v20 = v12;
  id v22 = v14;
  int64_t v23 = a5;
  double v24 = a6;
  id v21 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, v19);
}

uint64_t __134__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTotalWorkoutDistancesCountWithClusterSet1:*(void *)(a1 + 40) clusterSet2:*(void *)(a1 + 48) workoutActivityType:*(void *)(a1 + 64) maxDistanceThreshold:*(void *)(a1 + 56) handler:*(double *)(a1 + 72)];
}

- (void)_fetchTotalWorkoutDistancesCountWithClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if ([v13 count] && objc_msgSend(v14, "count"))
  {
    id v16 = (void *)MEMORY[0x1E016D870]();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke;
    v21[3] = &unk_1E6B98690;
    v21[4] = self;
    id v22 = v13;
    id v23 = v14;
    int64_t v25 = a5;
    double v26 = a6;
    SEL v27 = a2;
    id v17 = v15;
    id v24 = v17;
    id v18 = (void *)MEMORY[0x1E016DB00](v21);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke_37;
    v19[3] = &unk_1E6B90C18;
    id v20 = v17;
    [(RTStore *)self _performBlock:v18 contextType:1 errorHandler:v19];
  }
  else
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
  }
}

void __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWorkoutDistanceMO fetchRequest];
  uint64_t v5 = [*(id *)(a1 + 32) _getCrossJoinPredicateForClusterSet1:*(void *)(a1 + 40) clusterSet2:*(void *)(a1 + 48) workoutActivityType:*(void *)(a1 + 64) maxDistanceThreshold:*(double *)(a1 + 72)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 80));
    id v13 = [v4 predicate];
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, predicate, %@", buf, 0x20u);
  }
  id v17 = 0;
  uint64_t v7 = [v3 countForFetchRequest:v4 error:&v17];

  id v8 = v17;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    id v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
    *(_DWORD *)buf = 138413314;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    id v21 = v16;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total workout distances count, %lu, error, %@", buf, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_getCrossJoinPredicateForClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v33 = a4;
  __int16 v30 = (void *)MEMORY[0x1E016D870]();
  v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %lu AND %K <= %f", @"workoutActivityType", a5, @"distance", *(void *)&a6];
  id v10 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v9;
  uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v11;
        id v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        context = (void *)MEMORY[0x1E016D870]();
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v13 = v33;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v38 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              uint64_t v19 = (void *)MEMORY[0x1E016D870]();
              id v20 = v12;
              id v21 = v18;
              if ([v20 compare:v21] == 1)
              {
                id v22 = v21;

                id v21 = v20;
                id v20 = v22;
              }
              id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ AND %K == %@", @"firstWorkout", v20, @"secondWorkout", v21];
              [v10 addObject:v23];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v36 + 1;
      }
      while (v36 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v34);
  }

  __int16 v24 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];
  uint64_t v25 = (void *)MEMORY[0x1E4F28BA0];
  v45[0] = v29;
  v45[1] = v24;
  __int16 v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  id v27 = [v25 andPredicateWithSubpredicates:v26];

  [v10 removeAllObjects];

  return v27;
}

- (void)fetchWorkoutDistancesWithOffset:(unint64_t)a3 limit:(unint64_t)a4 maxDistanceThreshold:(double)a5 includeVisitedRecords:(BOOL)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115__RTWorkoutDistanceStore_fetchWorkoutDistancesWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke;
  v15[3] = &unk_1E6B986B8;
  unint64_t v17 = a3;
  unint64_t v18 = a4;
  double v19 = a5;
  BOOL v20 = a6;
  void v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  dispatch_async(v13, v15);
}

uint64_t __115__RTWorkoutDistanceStore_fetchWorkoutDistancesWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutsWithOffset:*(void *)(a1 + 48) limit:*(void *)(a1 + 56) maxDistanceThreshold:*(unsigned __int8 *)(a1 + 72) includeVisitedRecords:*(void *)(a1 + 40) handler:*(double *)(a1 + 64)];
}

- (void)_fetchWorkoutsWithOffset:(unint64_t)a3 limit:(unint64_t)a4 maxDistanceThreshold:(double)a5 includeVisitedRecords:(BOOL)a6 handler:(id)a7
{
  id v13 = a7;
  id v14 = (void *)MEMORY[0x1E016D870]();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke;
  v20[3] = &unk_1E6B986E0;
  double v22 = a5;
  BOOL v26 = a6;
  unint64_t v23 = a4;
  unint64_t v24 = a3;
  v20[4] = self;
  SEL v25 = a2;
  id v15 = v13;
  id v21 = v15;
  id v16 = (void *)MEMORY[0x1E016DB00](v20);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke_60;
  v18[3] = &unk_1E6B90C18;
  id v17 = v15;
  id v19 = v17;
  [(RTStore *)self _performBlock:v16 contextType:1 errorHandler:v18];
}

void __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke(uint64_t a1, void *a2)
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWorkoutDistanceMO fetchRequest];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"workoutActivityType" ascending:1];
  v45[0] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"distance" ascending:1];
  v45[1] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:1];
  void v45[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  [v4 setSortDescriptors:v8];

  id v9 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  id v12 = [v9 predicateWithFormat:@"(%K <= %f AND %K == %@)", @"distance", v10, @"isVisited", v11];
  [v4 setPredicate:v12];

  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:*(void *)(a1 + 56)];
  [v4 setFetchOffset:*(void *)(a1 + 64)];
  id v33 = 0;
  id v13 = [v3 executeFetchRequest:v4 error:&v33];
  id v14 = v33;
  id v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v23 = (objc_class *)objc_opt_class();
    unint64_t v24 = NSStringFromClass(v23);
    SEL v25 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v26 = [v13 count];
    *(_DWORD *)buf = 138413314;
    uint64_t v36 = v24;
    __int16 v37 = 2112;
    long long v38 = v25;
    __int16 v39 = 2112;
    long long v40 = v4;
    __int16 v41 = 2048;
    uint64_t v42 = v26;
    __int16 v43 = 2112;
    id v44 = v14;
    _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
  }
  id v16 = objc_opt_new();
  if (!v14 && [v13 count])
  {
    id v27 = v13;
    id v28 = v3;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = +[RTWorkoutDistance createWithManagedObject:*(void *)(*((void *)&v29 + 1) + 8 * v21)];
          [v16 addObject:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v19);
    }

    id v13 = v27;
    id v3 = v28;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutDistanceWithFirstWorkout:(id)a3 secondWorkout:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__RTWorkoutDistanceStore_fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __85__RTWorkoutDistanceStore_fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutDistanceWithFirstWorkout:*(void *)(a1 + 40) secondWorkout:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchWorkoutDistanceWithFirstWorkout:(id)a3 secondWorkout:(id)a4 handler:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9 && v10)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke;
      v20[3] = &unk_1E6B963A0;
      id v21 = v9;
      id v22 = v10;
      unint64_t v23 = self;
      SEL v25 = a2;
      id v12 = v11;
      id v24 = v12;
      id v13 = (void *)MEMORY[0x1E016DB00](v20);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke_64;
      v18[3] = &unk_1E6B90C18;
      id v19 = v12;
      [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v18];

      id v14 = v21;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"requires valid workouts.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      id v17 = [v15 errorWithDomain:v16 code:0 userInfo:v14];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v17);
    }
  }
}

void __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWorkoutDistanceMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  if ([v5 compare:v6] == 1)
  {
    id v7 = v6;

    id v6 = v5;
    id v5 = v7;
  }
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %@ AND %K == %@)", @"firstWorkout", v5, @"secondWorkout", v6];
  [v4 setPredicate:v8];

  id v19 = 0;
  id v9 = [v3 executeFetchRequest:v4 error:&v19];

  id v10 = v19;
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v18 = [v9 count];
    *(_DWORD *)buf = 138413314;
    id v21 = v16;
    __int16 v22 = 2112;
    unint64_t v23 = v17;
    __int16 v24 = 2112;
    SEL v25 = v4;
    __int16 v26 = 2048;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
  }
  id v12 = objc_opt_new();
  if (!v10 && [v9 count])
  {
    id v13 = [v9 firstObject];
    id v14 = +[RTWorkoutDistance createWithManagedObject:v13];
    [v12 addObject:v14];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutDistancesWithWorkout:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTWorkoutDistanceStore_fetchWorkoutDistancesWithWorkout_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __67__RTWorkoutDistanceStore_fetchWorkoutDistancesWithWorkout_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutDistancesWithWorkout:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchWorkoutDistancesWithWorkout:(id)a3 handler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke;
      v17[3] = &unk_1E6B91018;
      id v18 = v7;
      id v19 = self;
      SEL v21 = a2;
      id v9 = v8;
      id v20 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke_65;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      id v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"requires valid workouts.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v14 = [v12 errorWithDomain:v13 code:0 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
}

void __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWorkoutDistanceMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %@) || (%K == %@)", @"firstWorkout", *(void *)(a1 + 32), @"secondWorkout", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v28 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v28];
  id v7 = v28;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v21 = [v6 count];
    *(_DWORD *)buf = 138413314;
    long long v31 = v19;
    __int16 v32 = 2112;
    id v33 = v20;
    __int16 v34 = 2112;
    uint64_t v35 = v4;
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
          id v16 = (void *)MEMORY[0x1E016D870]();
          id v17 = +[RTWorkoutDistance createWithManagedObject:v15];
          [v9 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    a1 = v22;
    id v3 = v23;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateStoredWorkoutDistancesWithOptions:(id)a3 usingBlock:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, id, char *))a4;
  if (v8)
  {
    char v26 = 0;
    if (v7)
    {
      id v25 = 0;
      id v9 = [(id)objc_opt_class() fetchRequestForWorkoutDistanceEnumerationOptions:v7 error:&v25];
      id v10 = v25;
      if (v10) {
        v8[2](v8, 0, v10, &v26);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      id v28 = 0;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __80__RTWorkoutDistanceStore_enumerateStoredWorkoutDistancesWithOptions_usingBlock___block_invoke;
      uint64_t v22 = &unk_1E6B98708;
      long long v24 = buf;
      id v23 = v8;
      uint64_t v11 = (void *)MEMORY[0x1E016DB00](&v19);
      -[RTStore enumerateType:fetchRequest:enumerationBlock:](self, "enumerateType:fetchRequest:enumerationBlock:", objc_opt_class(), v9, v11, v19, v20, v21, v22);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"requires non-nil options.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      id v10 = [v13 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v14];

      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        id v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        id v28 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, error, %@", buf, 0x20u);
      }
      v8[2](v8, 0, v10, &v26);
    }
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }
}

void __80__RTWorkoutDistanceStore_enumerateStoredWorkoutDistancesWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 count];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  uint64_t v7 = [v6 count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
}

+ (id)fetchRequestForWorkoutDistanceEnumerationOptions:(id)a3 error:(id *)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[RTWorkoutDistanceMO fetchRequest];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"workoutActivityType" ascending:1];
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"distance" ascending:1, v6];
  v14[1] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:1];
  v14[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  [v5 setSortDescriptors:v9];

  if ([v4 batchSize]) {
    uint64_t v10 = [v4 batchSize];
  }
  else {
    uint64_t v10 = 200;
  }
  [v5 setFetchBatchSize:v10];
  if ([v4 batchSize])
  {
    unint64_t v11 = [v4 batchSize];
    if (v11 >= 0xC8) {
      uint64_t v12 = 200;
    }
    else {
      uint64_t v12 = v11;
    }
  }
  else
  {
    uint64_t v12 = 200;
  }
  [v5 setFetchLimit:v12];

  return v5;
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!a5)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
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
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      id v18 = [v15 stringWithFormat:@"error of type, %@, is not supported", v17];

      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
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
    uint64_t v10 = [(id)objc_opt_class() fetchRequestForWorkoutDistanceEnumerationOptions:v8 error:&v25];
    id v11 = v25;
    if (v11)
    {
      id v12 = v11;
      *a5 = v12;

LABEL_13:
      uint64_t v10 = 0;
      goto LABEL_14;
    }
    [v10 setFetchOffset:a4];
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"options");
    uint64_t v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v10;
}

@end