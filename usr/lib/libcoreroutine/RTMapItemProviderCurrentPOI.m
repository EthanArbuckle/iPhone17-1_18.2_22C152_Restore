@interface RTMapItemProviderCurrentPOI
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (RTMapItemProviderCurrentPOI)init;
- (RTMapItemProviderCurrentPOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 visitStore:(id)a6;
- (RTMapItemProviderCurrentPOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 visitStore:(id)a6 parameters:(id)a7;
- (RTMapItemProviderCurrentPOIParameters)parameters;
- (RTPlaceInferenceQueryStore)placeInferenceQueryStore;
- (RTVisitStore)visitStore;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
@end

@implementation RTMapItemProviderCurrentPOI

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v9 = [v5 count];
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, fetched place inference query count, %lu, interval, %@, error, %@", buf, 0x2Au);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_22;
    v11[3] = &unk_1E6B94B58;
    uint64_t v13 = *(void *)(a1 + 64);
    id v12 = *(id *)(a1 + 48);
    [v5 enumerateObjectsUsingBlock:v11];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a2 firstObject];
  v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v28 = v9;
    __int16 v29 = 2112;
    v30 = v7;
    __int16 v31 = 2112;
    uint64_t v32 = v10;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, fetched last visit, %@, options, %@, error, %@", buf, 0x2Au);
  }
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v12 = [v7 entry];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      v14 = [v7 exit];
      if (v14)
      {
      }
      else
      {
        v15 = [v7 entry];
        int v16 = [v15 isBeforeDate:v11];

        if (v16)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
          __int16 v18 = [v7 entry];
          uint64_t v19 = (void *)[v17 initWithStartDate:v18 endDate:v11];

          __int16 v20 = [*(id *)(a1 + 48) placeInferenceQueryStore];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_21;
          v22[3] = &unk_1E6B94B80;
          id v23 = v19;
          long long v26 = *(_OWORD *)(a1 + 64);
          id v24 = *(id *)(a1 + 40);
          id v25 = *(id *)(a1 + 56);
          id v21 = v19;
          [v20 fetchPlaceInferenceQueriesWithDateInterval:v21 ascending:0 handler:v22];

LABEL_11:
          goto LABEL_12;
        }
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_11;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_12:
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v9 = [v5 firstObject];
    uint64_t v10 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v35 = v8;
    __int16 v36 = 2112;
    v37 = v9;
    __int16 v38 = 2112;
    v39 = v10;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, fetched last instant POI visit, %@, options, %@, error, %@", buf, 0x2Au);
  }
  if (!v6)
  {
    v11 = [v5 firstObject];
    uint64_t v12 = [v11 placeInference];

    if (v12
      && ([v12 mapItem], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
    {
      id v23 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v30 = NSStringFromSelector(*(SEL *)(a1 + 64));
        __int16 v31 = [v5 firstObject];
        *(_DWORD *)buf = 138412802;
        uint64_t v35 = v30;
        __int16 v36 = 2112;
        v37 = v31;
        __int16 v38 = 2112;
        v39 = v12;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "%@, fetched visit, %@, has a placeInference, %@ but not a map item this should not happen", buf, 0x20u);
      }
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v25 = *MEMORY[0x1E4F5CFE8];
      v14 = [NSString stringWithFormat:@"placeInference has a nil mapItem", *MEMORY[0x1E4F28568]];
      __int16 v33 = v14;
      long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v27 = [v24 initWithDomain:v25 code:0 userInfo:v26];
      uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
      __int16 v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;
    }
    else
    {
      v14 = [v12 mapItem];
      if ([v14 validMUID])
      {
        v15 = [v12 mapItem];
        int v16 = [v15 address];
        id v17 = [v16 mergedThoroughfare];
        uint64_t v18 = [v17 length];

        if (!v18)
        {
LABEL_14:
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

          goto LABEL_15;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F5CDF8]);
        __int16 v20 = [v12 mapItem];
        [v12 confidence];
        uint64_t v21 = [v19 initWithMapItem:v20 confidence:0x10000 source:];

        uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
        v14 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;
      }
    }

    goto LABEL_14;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_15:
}

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_22(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 placeInference];
  uint64_t v7 = [v6 mapItem];
  if (!v7) {
    goto LABEL_10;
  }
  v8 = (void *)v7;
  uint64_t v9 = [v5 placeInference];
  uint64_t v10 = [v9 mapItem];
  if (![v10 validMUID])
  {

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  v11 = [v5 placeInference];
  uint64_t v12 = [v11 mapItem];
  uint64_t v13 = [v12 address];
  v14 = [v13 mergedThoroughfare];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = NSStringFromSelector(*(SEL *)(v24 + 40));
      *(_DWORD *)buf = 138412802;
      long long v26 = v22;
      __int16 v27 = 2048;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, place inference query, %@", buf, 0x20u);
    }
    id v17 = objc_alloc(MEMORY[0x1E4F5CDF8]);
    uint64_t v18 = [v5 placeInference];
    id v19 = [v18 mapItem];
    __int16 v20 = [v5 placeInference];
    [v20 confidence];
    uint64_t v21 = [v17 initWithMapItem:v19 confidence:0x10000 source:];

    if (v21) {
      [*(id *)(v24 + 32) addObject:v21];
    }
  }
LABEL_11:
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__47;
  v63 = __Block_byref_object_dispose__47;
  id v64 = 0;
  uint64_t v32 = objc_opt_new();
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__47;
  v57 = __Block_byref_object_dispose__47;
  id v58 = 0;
  v8 = [(RTMapItemProviderCurrentPOI *)self visitStore];
  id v9 = objc_alloc(MEMORY[0x1E4F5CF58]);
  double v10 = *MEMORY[0x1E4F5D010];
  v11 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3450D08];
  uint64_t v13 = (void *)[v9 initWithAscending:0 confidence:v11 dateInterval:0 labelVisit:1 limit:&unk_1F3450CF0 sources:v12];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke;
  v47[3] = &unk_1E6B94B30;
  SEL v52 = a2;
  id v14 = v6;
  id v48 = v14;
  v50 = &v53;
  uint64_t v15 = v7;
  v49 = v15;
  v51 = &v59;
  [v8 fetchVisitsWithOptions:v13 handler:v47];

  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__47;
  v45 = __Block_byref_object_dispose__47;
  id v46 = 0;
  dispatch_group_enter(v15);
  int v16 = [(RTMapItemProviderCurrentPOI *)self visitStore];
  id v17 = objc_alloc(MEMORY[0x1E4F5CF58]);
  uint64_t v18 = [NSNumber numberWithDouble:v10];
  id v19 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3450D20];
  __int16 v20 = (void *)[v17 initWithAscending:0 confidence:v18 dateInterval:0 labelVisit:0 limit:&unk_1F3450CF0 sources:v19];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_18;
  v34[3] = &unk_1E6B94BA8;
  SEL v40 = a2;
  id v21 = v14;
  id v35 = v21;
  v39 = &v41;
  uint64_t v22 = v15;
  __int16 v36 = v22;
  v37 = self;
  id v23 = v32;
  id v38 = v23;
  [v16 fetchVisitsWithOptions:v20 handler:v34];

  dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  if (!v54[5] && !v42[5])
  {
    if (v60[5]) {
      [v23 addObject:];
    }
    uint64_t v24 = [v21 location];
    __int16 v29 = [(RTMapItemProviderCurrentPOI *)self parameters];
    [v29 distanceThreshold];
    double v31 = v30;

    __int16 v27 = a4;
    long long v26 = [(RTMapItemProviderBase *)self filterInferredMapItems:v23 byDistance:v24 fromLocation:a4 error:v31];
    if (!a4) {
      goto LABEL_6;
    }
    id v25 = 0;
LABEL_5:
    *__int16 v27 = v25;
LABEL_6:

    goto LABEL_8;
  }
  if (a4)
  {
    uint64_t v24 = _RTSafeArray();
    _RTMultiErrorCreate();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0;
    __int16 v27 = a4;
    goto LABEL_5;
  }
  long long v26 = 0;
LABEL_8:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);

  return v26;
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (RTMapItemProviderCurrentPOIParameters)parameters
{
  return self->_parameters;
}

- (RTMapItemProviderCurrentPOI)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_placeInferenceQueryStore_visitStore_parameters_);
}

- (RTMapItemProviderCurrentPOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 visitStore:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[RTMapItemProviderCurrentPOIParameters alloc] initWithDefaultsManager:v13];
  uint64_t v15 = [(RTMapItemProviderCurrentPOI *)self initWithDefaultsManager:v13 distanceCalculator:v12 placeInferenceQueryStore:v11 visitStore:v10 parameters:v14];

  return v15;
}

- (RTMapItemProviderCurrentPOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 visitStore:(id)a6 parameters:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (!v12)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Invalid parameter not satisfying: defaultsManager";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_22;
  }
  if (!v13)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_21;
  }
  if (!v14)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_21;
  }
  if (!v15)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Invalid parameter not satisfying: visitStore";
    goto LABEL_21;
  }
  if (!v16)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v24 = "Invalid parameter not satisfying: parameters";
      goto LABEL_21;
    }
LABEL_22:

    uint64_t v22 = 0;
    goto LABEL_23;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTMapItemProviderCurrentPOI;
  uint64_t v18 = [(RTMapItemProviderBase *)&v26 initWithDefaultsManager:v12 distanceCalculator:v13];
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_placeInferenceQueryStore, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = p_isa[5];
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderCurrentPOI with parameters, %@", buf, 0xCu);
    }
  }
  self = p_isa;
  uint64_t v22 = self;
LABEL_23:

  return v22;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);

  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
}

@end