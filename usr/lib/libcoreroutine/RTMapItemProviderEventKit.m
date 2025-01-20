@interface RTMapItemProviderEventKit
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (RTEventManager)eventManager;
- (RTMapItemProviderEventKit)init;
- (RTMapItemProviderEventKit)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 mapServiceManager:(id)a6;
- (RTMapItemProviderEventKit)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 mapServiceManager:(id)a6 parameters:(id)a7;
- (RTMapItemProviderEventKitParameters)parameters;
- (RTMapServiceManager)mapServiceManager;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
- (void)setEventManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
@end

@implementation RTMapItemProviderEventKit

- (RTMapItemProviderEventKit)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_eventManager_mapServiceManager_);
}

- (RTMapItemProviderEventKit)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 mapServiceManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v14 = [v10 objectForKey:@"RTDefaultsMapItemProviderEventKitConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      double v16 = v15;
    }
    else
    {
      double v16 = 0.95;
    }
    v19 = [[RTMapItemProviderEventKitParameters alloc] initWithConfidence:v16];
    self = [(RTMapItemProviderEventKit *)self initWithDefaultsManager:v10 distanceCalculator:v11 eventManager:v12 mapServiceManager:v13 parameters:v19];

    v18 = self;
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v21, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (RTMapItemProviderEventKit)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 mapServiceManager:(id)a6 parameters:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  if (!v14)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: eventManager";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_16;
  }
  if (!v15)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_15;
  }
  if (!v16)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: parameters";
      goto LABEL_15;
    }
LABEL_16:

    v22 = 0;
    goto LABEL_17;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTMapItemProviderEventKit;
  v18 = [(RTMapItemProviderBase *)&v26 initWithDefaultsManager:v12 distanceCalculator:v13];
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventManager, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = p_isa[5];
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderEventKit with parameters, %@", buf, 0xCu);
    }
  }
  self = p_isa;
  v22 = self;
LABEL_17:

  return v22;
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 distance];
  double v6 = v5;
  v79 = v4;
  v68 = [v4 location];
  v7 = [v4 startDate];
  v8 = [v4 endDate];
  v70 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v7 sinceDate:-3600.0];

  v69 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v8 sinceDate:3600.0];

  v73 = [MEMORY[0x1E4F1CA48] array];
  v74 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__169;
  v105 = __Block_byref_object_dispose__169;
  id v106 = 0;
  uint64_t v95 = 0;
  v96 = (id *)&v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__169;
  v99 = __Block_byref_object_dispose__169;
  id v100 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(RTMapItemProviderEventKit *)self eventManager];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke;
  v91[3] = &unk_1E6B905F0;
  v93 = &v101;
  v94 = &v95;
  id v11 = v9;
  v92 = v11;
  [v10 fetchEventsBetweenStartDate:v70 endDate:v69 handler:v91];

  id v12 = v11;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  intptr_t v15 = dispatch_semaphore_wait(v12, v14);
  id v16 = (uint64_t *)MEMORY[0x1E4F5CFE8];
  v17 = (uint64_t *)MEMORY[0x1E4F28568];
  if (v15)
  {
    v18 = [MEMORY[0x1E4F1C9C8] now];
    [v18 timeIntervalSinceDate:v13];
    double v20 = v19;
    id v21 = objc_opt_new();
    v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_124];
    v23 = [MEMORY[0x1E4F29060] callStackSymbols];
    v24 = [v23 filteredArrayUsingPredicate:v22];
    v25 = [v24 firstObject];

    [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
    objc_super v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v113, 2u);
    }

    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v107 = *v17;
    *(void *)v113 = @"semaphore wait timeout";
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:&v107 count:1];
    id v29 = [v27 errorWithDomain:*v16 code:15 userInfo:v28];

    if (v29)
    {
      id v29 = v29;

      char v30 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v29 = 0;
  }
  char v30 = 1;
LABEL_8:

  id v80 = v29;
  if ((v30 & 1) == 0) {
    objc_storeStrong(v96 + 5, v29);
  }
  if (v96[5]) {
    [v74 addObject:];
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = (id)v102[5];
  uint64_t v77 = [obj countByEnumeratingWithState:&v87 objects:v119 count:16];
  if (v77)
  {
    uint64_t v76 = *(void *)v88;
    uint64_t v71 = *v16;
    uint64_t v72 = *v17;
    do
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v88 != v76) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        v33 = [v32 locationMapItemHandle];

        if (v33)
        {
          *(void *)v113 = 0;
          v114 = v113;
          uint64_t v115 = 0x3032000000;
          v116 = __Block_byref_object_copy__169;
          v117 = __Block_byref_object_dispose__169;
          id v118 = 0;
          uint64_t v107 = 0;
          v108 = &v107;
          uint64_t v109 = 0x3032000000;
          v110 = __Block_byref_object_copy__169;
          v111 = __Block_byref_object_dispose__169;
          id v112 = 0;
          dispatch_semaphore_t v34 = dispatch_semaphore_create(0);

          id v35 = objc_alloc(MEMORY[0x1E4F5CE48]);
          uint64_t v36 = [v79 useBackground];
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          v39 = [v79 clientIdentifier];
          v40 = (void *)[v35 initWithUseBackgroundTraits:v36 analyticsIdentifier:v38 clientIdentifier:v39];

          v41 = [(RTMapItemProviderEventKit *)self mapServiceManager];
          v42 = [v32 locationMapItemHandle];
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_2;
          v83[3] = &unk_1E6B920F0;
          v85 = &v107;
          v86 = v113;
          v43 = v34;
          v84 = v43;
          [v41 fetchMapItemFromHandle:v42 options:v40 handler:v83];

          id v12 = v43;
          v44 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v45 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v12, v45)) {
            goto LABEL_23;
          }
          v46 = [MEMORY[0x1E4F1C9C8] now];
          [v46 timeIntervalSinceDate:v44];
          double v48 = v47;
          v49 = objc_opt_new();
          v50 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_124];
          v51 = [MEMORY[0x1E4F29060] callStackSymbols];
          v52 = [v51 filteredArrayUsingPredicate:v50];
          v53 = [v52 firstObject];

          [v49 submitToCoreAnalytics:v53 type:1 duration:v48];
          v54 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v55 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v120 = v72;
          *(void *)buf = @"semaphore wait timeout";
          v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v120 count:1];
          v57 = [v55 errorWithDomain:v71 code:15 userInfo:v56];

          if (v57)
          {
            id v58 = v57;

            char v59 = 0;
          }
          else
          {
LABEL_23:
            char v59 = 1;
            id v58 = v80;
          }

          id v60 = v58;
          if ((v59 & 1) == 0) {
            objc_storeStrong((id *)v114 + 5, v58);
          }
          if (*((void *)v114 + 5)) {
            [v74 addObject:];
          }
          if (v108[5]) {
            [v73 addObject:];
          }

          _Block_object_dispose(&v107, 8);
          _Block_object_dispose(v113, 8);

          id v80 = v60;
        }
      }
      uint64_t v77 = [obj countByEnumeratingWithState:&v87 objects:v119 count:16];
    }
    while (v77);
  }

  v61 = [[_RTMap alloc] initWithInput:v73];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_3;
  v82[3] = &unk_1E6B91C80;
  v82[4] = self;
  v62 = [(_RTMap *)v61 withBlock:v82];

  id v81 = 0;
  v63 = [(RTMapItemProviderBase *)self filterInferredMapItems:v62 byDistance:v68 fromLocation:256 andAppendSource:&v81 error:v6];
  id v64 = v81;

  if (v64) {
    [v74 addObject:v64];
  }
  if (a4 && [v74 count])
  {
    v65 = _RTSafeArray();
    _RTMultiErrorCreate();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);

  return v63;
}

void __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F5CDF8];
  id v4 = a2;
  id v5 = [v3 alloc];
  [*(id *)(*(void *)(a1 + 32) + 40) confidence];
  id v6 = [v5 initWithMapItem:v4 confidence:256 source:];

  return v6;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTMapItemProviderEventKitParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);

  objc_storeStrong((id *)&self->_eventManager, 0);
}

@end