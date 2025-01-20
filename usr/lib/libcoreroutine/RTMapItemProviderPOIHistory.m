@interface RTMapItemProviderPOIHistory
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (RTMapItemProviderPOIHistory)init;
- (RTMapItemProviderPOIHistory)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5;
- (RTMapItemProviderPOIHistory)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 parameters:(id)a6;
- (RTMapItemProviderPOIHistoryParameters)parameters;
- (RTPlaceInferenceQueryStore)placeInferenceQueryStore;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
- (void)setPlaceInferenceQueryStore:(id)a3;
@end

@implementation RTMapItemProviderPOIHistory

- (RTMapItemProviderPOIHistory)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_placeInferenceQueryStore_);
}

- (RTMapItemProviderPOIHistory)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[RTMapItemProviderPOIHistoryParameters alloc] initWithDefaultsManager:v10];
  v12 = [(RTMapItemProviderPOIHistory *)self initWithDefaultsManager:v10 distanceCalculator:v9 placeInferenceQueryStore:v8 parameters:v11];

  return v12;
}

- (RTMapItemProviderPOIHistory)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 parameters:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v10)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: defaultsManager";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_19;
  }
  if (!v11)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_18;
  }
  if (!v12)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_18;
  }
  if (!v13)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: parameters";
      goto LABEL_18;
    }
LABEL_19:

    v19 = 0;
    goto LABEL_20;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTMapItemProviderPOIHistory;
  v15 = [(RTMapItemProviderBase *)&v23 initWithDefaultsManager:v10 distanceCalculator:v11];
  p_isa = (id *)&v15->super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_placeInferenceQueryStore, a5);
    objc_storeStrong(p_isa + 4, a6);
    v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = p_isa[4];
      *(_DWORD *)buf = 138412290;
      id v25 = v18;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderPOIHistory with parameters, %@", buf, 0xCu);
    }
  }
  self = p_isa;
  v19 = self;
LABEL_20:

  return v19;
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  v6 = [v4 startDate];
  v7 = [v4 endDate];
  id v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  uint64_t v59 = 0;
  v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__116;
  v63 = __Block_byref_object_dispose__116;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__116;
  v57 = __Block_byref_object_dispose__116;
  id v58 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(RTMapItemProviderPOIHistory *)self placeInferenceQueryStore];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke;
  v47[3] = &unk_1E6B927A8;
  SEL v52 = a2;
  id v11 = v8;
  id v48 = v11;
  v50 = &v53;
  v51 = &v59;
  id v12 = v9;
  v49 = v12;
  [v10 fetchPlaceInferenceQueriesWithDateInterval:v11 ascending:0 handler:v47];

  id v13 = v12;
  v14 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v15)) {
    goto LABEL_6;
  }
  v16 = [MEMORY[0x1E4F1C9C8] now];
  [v16 timeIntervalSinceDate:v14];
  double v18 = v17;
  v19 = objc_opt_new();
  v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_89];
  v21 = [MEMORY[0x1E4F29060] callStackSymbols];
  v22 = [v21 filteredArrayUsingPredicate:v20];
  objc_super v23 = [v22 firstObject];

  [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
  v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v65 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v65 count:1];
  v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

  if (v27)
  {
    id v28 = v27;

    char v29 = 0;
  }
  else
  {
LABEL_6:
    id v28 = 0;
    char v29 = 1;
  }

  id v30 = v28;
  if ((v29 & 1) == 0) {
    objc_storeStrong(v60 + 5, v28);
  }
  id v31 = v60[5];
  if (v31)
  {
    v32 = 0;
    if (a4) {
      *a4 = v31;
    }
  }
  else
  {
    v33 = objc_opt_new();
    v34 = (void *)v54[5];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke_5;
    v44[3] = &unk_1E6B94B58;
    SEL v46 = a2;
    id v35 = v33;
    id v45 = v35;
    [v34 enumerateObjectsUsingBlock:v44];
    v36 = [(RTMapItemProviderPOIHistory *)self parameters];
    [v36 distanceThreshold];
    double v38 = v37;
    v39 = [v4 location];
    v32 = [(RTMapItemProviderBase *)self filterInferredMapItems:v35 byDistance:v39 fromLocation:a4 error:v38];

    if (a4) {
      *a4 = 0;
    }
  }
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);

  return v32;
}

void __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v9 = [v5 count];
    uint64_t v10 = *(void *)(a1 + 32);
    int v17 = 138413058;
    double v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, fetched place inference query count, %lu, interval, %@, error, %@", (uint8_t *)&v17, 0x2Au);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_time_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v6;
  id v16 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 placeInference];
  uint64_t v7 = [v6 mapItem];
  if (!v7) {
    goto LABEL_10;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [v5 placeInference];
  uint64_t v10 = [v9 mapItem];
  if (![v10 validMUID])
  {

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v11 = [v5 placeInference];
  id v12 = [v11 mapItem];
  id v13 = [v12 address];
  uint64_t v14 = [v13 mergedThoroughfare];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = NSStringFromSelector(*(SEL *)(v24 + 40));
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v22;
      __int16 v27 = 2048;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, place inference query, %@", buf, 0x20u);
    }
    id v17 = objc_alloc(MEMORY[0x1E4F5CDF8]);
    double v18 = [v5 placeInference];
    __int16 v19 = [v18 mapItem];
    uint64_t v20 = [v5 placeInference];
    [v20 confidence];
    __int16 v21 = [v17 initWithMapItem:v19 confidence:0x80000 source:];

    if (v21) {
      [*(id *)(v24 + 32) addObject:v21];
    }
  }
LABEL_11:
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void)setPlaceInferenceQueryStore:(id)a3
{
}

- (RTMapItemProviderPOIHistoryParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
}

@end