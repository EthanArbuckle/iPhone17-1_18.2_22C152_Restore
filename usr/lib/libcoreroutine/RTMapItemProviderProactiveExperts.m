@interface RTMapItemProviderProactiveExperts
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (RTMapItemProviderProactiveExperts)init;
- (RTMapItemProviderProactiveExperts)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapServiceManager:(id)a5 parameters:(id)a6 personalizationPortraitManager:(id)a7;
- (RTMapItemProviderProactiveExperts)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapServiceManager:(id)a5 personalizationPortraitManager:(id)a6;
- (RTMapItemProviderProactiveExpertsParameters)parameters;
- (RTMapServiceManager)mapServiceManager;
- (RTPersonalizationPortraitManager)personalizationPortraitManager;
- (id)_filterConnectionLocations:(id)a3 location:(id)a4 distance:(double)a5 error:(id *)a6;
- (id)_mapItemsWithConnectionsLocations:(id)a3 options:(id)a4;
- (id)_recentLocationsFrom:(id)a3 error:(id *)a4;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
- (void)setMapServiceManager:(id)a3;
- (void)setPersonalizationPortraitManager:(id)a3;
@end

@implementation RTMapItemProviderProactiveExperts

- (RTMapItemProviderProactiveExperts)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_mapServiceManager_personalizationPortraitManager_);
}

- (RTMapItemProviderProactiveExperts)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapServiceManager:(id)a5 personalizationPortraitManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v14 = [[RTMapItemProviderProactiveExpertsParameters alloc] initWithDefaultsManager:v10];
    self = [(RTMapItemProviderProactiveExperts *)self initWithDefaultsManager:v10 distanceCalculator:v11 mapServiceManager:v12 parameters:v14 personalizationPortraitManager:v13];

    v15 = self;
  }
  else
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v18, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (RTMapItemProviderProactiveExperts)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapServiceManager:(id)a5 parameters:(id)a6 personalizationPortraitManager:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: personalizationPortraitManager";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_16;
  }
  if (!v14)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_15;
  }
  if (!v15)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: parameters";
      goto LABEL_15;
    }
LABEL_16:

    v21 = 0;
    goto LABEL_17;
  }
  v25.receiver = self;
  v25.super_class = (Class)RTMapItemProviderProactiveExperts;
  v17 = [(RTMapItemProviderBase *)&v25 initWithDefaultsManager:v12 distanceCalculator:v13];
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_personalizationPortraitManager, a7);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    v19 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = p_isa[5];
      *(_DWORD *)buf = 138412290;
      id v27 = v20;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderProactiveExperts with parameters: %@", buf, 0xCu);
    }
  }
  self = p_isa;
  v21 = self;
LABEL_17:

  return v21;
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 distance];
  double v8 = v7;
  v9 = [v6 location];
  id v10 = [v6 startDate];
  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v10 sinceDate:-16200.0];

  id v31 = 0;
  id v12 = [(RTMapItemProviderProactiveExperts *)self _recentLocationsFrom:v11 error:&v31];
  id v13 = v31;
  if (v13)
  {
    id v14 = v13;
    if (a4)
    {
      id v14 = v13;
      id v15 = 0;
      *a4 = v14;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v30 = 0;
    id v16 = [(RTMapItemProviderProactiveExperts *)self _filterConnectionLocations:v12 location:v9 distance:&v30 error:v8];
    id v17 = v30;
    id v14 = v17;
    if (v17)
    {
      id v15 = 0;
      if (a4) {
        *a4 = v17;
      }
    }
    else
    {
      id v26 = objc_alloc(MEMORY[0x1E4F5CE48]);
      uint64_t v18 = [v6 useBackground];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = v28 = v16;
      v21 = [v6 clientIdentifier];
      id v27 = (void *)[v26 initWithUseBackgroundTraits:v18 analyticsIdentifier:v20 clientIdentifier:v21];

      v22 = [(RTMapItemProviderProactiveExperts *)self _mapItemsWithConnectionsLocations:v28 options:v27];
      v23 = [[_RTMap alloc] initWithInput:v22];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __63__RTMapItemProviderProactiveExperts_mapItemsWithOptions_error___block_invoke;
      v29[3] = &unk_1E6B91C80;
      v29[4] = self;
      v24 = [(_RTMap *)v23 withBlock:v29];

      id v16 = v28;
      id v15 = [(RTMapItemProviderBase *)self filterInferredMapItems:v24 byDistance:v9 fromLocation:2048 andAppendSource:a4 error:v8];
    }
  }

  return v15;
}

id __63__RTMapItemProviderProactiveExperts_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F5CDF8];
  id v4 = a2;
  id v5 = [v3 alloc];
  [*(id *)(*(void *)(a1 + 32) + 40) confidence];
  id v6 = [v5 initWithMapItem:v4 confidence:2048 source:];

  return v6;
}

- (id)_recentLocationsFrom:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v44 = 0;
  v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__11;
  v48 = __Block_byref_object_dispose__11;
  id v49 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__11;
  v42 = __Block_byref_object_dispose__11;
  id v43 = 0;
  double v8 = [(RTMapItemProviderProactiveExperts *)self personalizationPortraitManager];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __64__RTMapItemProviderProactiveExperts__recentLocationsFrom_error___block_invoke;
  v34 = &unk_1E6B905F0;
  v36 = &v44;
  v37 = &v38;
  v9 = v7;
  v35 = v9;
  [v8 fetchRecentLocationDonationsSince:v6 handler:&v31];

  id v10 = v9;
  id v11 = [MEMORY[0x1E4F1C9C8] now:v31, v32, v33, v34];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_6;
  }
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  id v16 = objc_opt_new();
  id v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_9];
  uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  v19 = [v18 filteredArrayUsingPredicate:v17];
  id v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v50 count:1];
  v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;

    char v26 = 0;
  }
  else
  {
LABEL_6:
    id v25 = 0;
    char v26 = 1;
  }

  id v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong(v45 + 5, v25);
  }
  if (a4)
  {
    id v28 = v45[5];
    if (v28) {
      *a4 = v28;
    }
  }
  id v29 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v29;
}

void __64__RTMapItemProviderProactiveExperts__recentLocationsFrom_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_filterConnectionLocations:(id)a3 location:(id)a4 distance:(double)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v33 = a4;
  if (!v8)
  {
    id v34 = 0;
    goto LABEL_27;
  }
  id v34 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA80] set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = v8;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v11)
  {
    id v13 = 0;
    goto LABEL_26;
  }
  uint64_t v12 = v11;
  id v13 = 0;
  uint64_t v14 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v37 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      id v17 = [v16 name];
      if ([v17 length])
      {
        uint64_t v18 = [v16 name];
        char v19 = [v9 containsObject:v18];

        if (v19) {
          continue;
        }
      }
      else
      {
      }
      id v20 = [v16 location];

      if (!v20) {
        goto LABEL_19;
      }
      v21 = [(RTMapItemProviderBase *)self distanceCalculator];
      v22 = [v16 location];
      id v35 = v13;
      [v21 distanceFromLocation:v33 toLocation:v22 error:&v35];
      double v24 = v23;
      id v25 = v35;

      if (v24 <= a5) {
        int v26 = 0;
      }
      else {
        int v26 = 3;
      }
      if (v25) {
        int v26 = 2;
      }
      id v13 = v25;
      if (v26 != 3)
      {
        if (v26) {
          goto LABEL_26;
        }
LABEL_19:
        [v34 addObject:v16];
        id v27 = [v16 name];
        uint64_t v28 = [v27 length];

        if (v28)
        {
          id v29 = [v16 name];
          [v9 addObject:v29];
        }
        continue;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v12);
LABEL_26:

  id v8 = v31;
LABEL_27:

  return v34;
}

- (id)_mapItemsWithConnectionsLocations:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v6 count]];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v15 = [(RTMapItemProviderProactiveExperts *)self mapServiceManager];
          id v16 = [v14 mapItemUsingMapServiceManager:v15 options:v7];

          if (v16) {
            [v8 addObjectsFromArray:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [v4 endDate];
  id v6 = [v4 startDate];

  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  return v8 <= 900.0;
}

- (RTPersonalizationPortraitManager)personalizationPortraitManager
{
  return self->_personalizationPortraitManager;
}

- (void)setPersonalizationPortraitManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTMapItemProviderProactiveExpertsParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);

  objc_storeStrong((id *)&self->_personalizationPortraitManager, 0);
}

@end