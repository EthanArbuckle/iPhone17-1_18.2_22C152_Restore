@interface RTMapItemProviderMapsSupport
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (RTMapItemProviderMapsSupport)init;
- (RTMapItemProviderMapsSupport)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapsSupportManager:(id)a5;
- (RTMapItemProviderMapsSupport)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapsSupportManager:(id)a5 parameters:(id)a6;
- (RTMapItemProviderMapsSupportParameters)parameters;
- (RTMapsSupportManager)mapsSupportManager;
- (double)confidenceFromMapItemSource:(unint64_t)a3;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
- (void)setMapsSupportManager:(id)a3;
@end

@implementation RTMapItemProviderMapsSupport

void __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 distance];
  double v6 = v5;
  v108 = v4;
  v104 = [v4 location];
  uint64_t v7 = [v4 startDate];
  v106 = [v4 endDate];
  v105 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v7 sinceDate:-16200.0];

  uint64_t v8 = 0;
  if (v105 && v106)
  {
    uint64_t v9 = [v105 earlierDate:v106];
    int v10 = [v9 isEqualToDate:v105];

    if (v10) {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v105 endDate:v106];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  v102 = (void *)v8;
  v107 = [[RTMapsSupportOptions alloc] initWithDateInterval:v8 location:v104 distance:v6];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__119;
  v144 = __Block_byref_object_dispose__119;
  id v145 = 0;
  uint64_t v134 = 0;
  v135 = (id *)&v134;
  uint64_t v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__119;
  v138 = __Block_byref_object_dispose__119;
  id v139 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v13 = [(RTMapItemProviderMapsSupport *)self mapsSupportManager];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke;
  v130[3] = &unk_1E6B905F0;
  v132 = &v140;
  v133 = &v134;
  v14 = v12;
  v131 = v14;
  [v13 fetchFavoritePlacesWithOptions:v107 handler:v130];

  v15 = v14;
  v16 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v15, v17)) {
    goto LABEL_11;
  }
  v18 = [MEMORY[0x1E4F1C9C8] now];
  [v18 timeIntervalSinceDate:v16];
  double v20 = v19;
  v21 = objc_opt_new();
  v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_88];
  v23 = [MEMORY[0x1E4F29060] callStackSymbols];
  v24 = [v23 filteredArrayUsingPredicate:v22];
  v25 = [v24 firstObject];

  [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
  v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v160 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v160 count:1];
  v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

  if (v29)
  {
    id v30 = v29;

    char v31 = 0;
  }
  else
  {
LABEL_11:
    id v30 = 0;
    char v31 = 1;
  }

  id v32 = v30;
  if ((v31 & 1) == 0) {
    objc_storeStrong(v135 + 5, v30);
  }
  id v33 = v135[5];
  if (v33)
  {
    if ([v33 isOnlyTimeoutError])
    {
      v34 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v34 = 0;
      if (a4) {
        *a4 = v135[5];
      }
    }
  }
  else
  {
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v35 = (id)v141[5];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v126 objects:v172 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v127;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v127 != v37) {
            objc_enumerationMutation(v35);
          }
          v39 = [*(id *)(*((void *)&v126 + 1) + 8 * i) mapItem];
          [v11 addObject:v39];
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v126 objects:v172 count:16];
      }
      while (v36);
    }

    *(void *)buf = 0;
    v167 = buf;
    uint64_t v168 = 0x3032000000;
    v169 = __Block_byref_object_copy__119;
    v170 = __Block_byref_object_dispose__119;
    id v171 = 0;
    uint64_t v160 = 0;
    v161 = (id *)&v160;
    uint64_t v162 = 0x3032000000;
    v163 = __Block_byref_object_copy__119;
    v164 = __Block_byref_object_dispose__119;
    id v165 = 0;
    dispatch_semaphore_t v40 = dispatch_semaphore_create(0);

    v41 = [(RTMapItemProviderMapsSupport *)self mapsSupportManager];
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_2;
    v122[3] = &unk_1E6B905F0;
    v124 = buf;
    v125 = &v160;
    v42 = v40;
    v123 = v42;
    [v41 fetchHistoryEntryPlaceDisplaysWithOptions:v107 handler:v122];

    v15 = v42;
    v43 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v44 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v44)) {
      goto LABEL_31;
    }
    v45 = [MEMORY[0x1E4F1C9C8] now];
    [v45 timeIntervalSinceDate:v43];
    double v47 = v46;
    v48 = objc_opt_new();
    v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_88];
    v50 = [MEMORY[0x1E4F29060] callStackSymbols];
    v51 = [v50 filteredArrayUsingPredicate:v49];
    v52 = [v51 firstObject];

    [v48 submitToCoreAnalytics:v52 type:1 duration:v47];
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v153 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v153, 2u);
    }

    v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v147 = *MEMORY[0x1E4F28568];
    *(void *)v153 = @"semaphore wait timeout";
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v153 forKeys:&v147 count:1];
    v56 = [v54 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v55];

    if (v56)
    {
      id v57 = v56;

      char v58 = 0;
    }
    else
    {
LABEL_31:
      char v58 = 1;
      id v57 = v32;
    }

    id v59 = v57;
    if ((v58 & 1) == 0) {
      objc_storeStrong(v161 + 5, v57);
    }
    id v60 = v161[5];
    if (v60)
    {
      if ([v60 isOnlyTimeoutError])
      {
        v34 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v34 = 0;
        if (a4) {
          *a4 = v161[5];
        }
      }
    }
    else
    {
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      id v61 = *((id *)v167 + 5);
      uint64_t v62 = [v61 countByEnumeratingWithState:&v118 objects:v159 count:16];
      if (v62)
      {
        uint64_t v63 = *(void *)v119;
        do
        {
          for (uint64_t j = 0; j != v62; ++j)
          {
            if (*(void *)v119 != v63) {
              objc_enumerationMutation(v61);
            }
            v65 = [*(id *)(*((void *)&v118 + 1) + 8 * j) mapItem];
            [v11 addObject:v65];
          }
          uint64_t v62 = [v61 countByEnumeratingWithState:&v118 objects:v159 count:16];
        }
        while (v62);
      }

      *(void *)v153 = 0;
      v154 = v153;
      uint64_t v155 = 0x3032000000;
      v156 = __Block_byref_object_copy__119;
      v157 = __Block_byref_object_dispose__119;
      id v158 = 0;
      uint64_t v147 = 0;
      v148 = (id *)&v147;
      uint64_t v149 = 0x3032000000;
      v150 = __Block_byref_object_copy__119;
      v151 = __Block_byref_object_dispose__119;
      id v152 = 0;
      dispatch_semaphore_t v66 = dispatch_semaphore_create(0);

      v67 = [(RTMapItemProviderMapsSupport *)self mapsSupportManager];
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_3;
      v114[3] = &unk_1E6B905F0;
      v116 = v153;
      v117 = &v147;
      v68 = v66;
      v115 = v68;
      [v67 fetchHistoryEntryRoutesWithOptions:v107 handler:v114];

      v15 = v68;
      v69 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v70 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v15, v70)) {
        goto LABEL_52;
      }
      v71 = [MEMORY[0x1E4F1C9C8] now];
      [v71 timeIntervalSinceDate:v69];
      double v73 = v72;
      v74 = objc_opt_new();
      v75 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_88];
      v76 = [MEMORY[0x1E4F29060] callStackSymbols];
      v77 = [v76 filteredArrayUsingPredicate:v75];
      v78 = [v77 firstObject];

      [v74 submitToCoreAnalytics:v78 type:1 duration:v73];
      v79 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v174 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v174, 2u);
      }

      v80 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v173 = *MEMORY[0x1E4F28568];
      *(void *)v174 = @"semaphore wait timeout";
      v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:&v173 count:1];
      v82 = [v80 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v81];

      if (v82)
      {
        id v83 = v82;

        char v84 = 0;
      }
      else
      {
LABEL_52:
        char v84 = 1;
        id v83 = v59;
      }

      id v85 = v83;
      if ((v84 & 1) == 0) {
        objc_storeStrong(v148 + 5, v83);
      }
      id v86 = v148[5];
      if (v86)
      {
        if ([v86 isOnlyTimeoutError])
        {
          v34 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v34 = 0;
          if (a4) {
            *a4 = v148[5];
          }
        }
      }
      else
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v87 = *((id *)v154 + 5);
        uint64_t v88 = [v87 countByEnumeratingWithState:&v110 objects:v146 count:16];
        if (v88)
        {
          uint64_t v89 = *(void *)v111;
          do
          {
            for (uint64_t k = 0; k != v88; ++k)
            {
              if (*(void *)v111 != v89) {
                objc_enumerationMutation(v87);
              }
              v91 = *(void **)(*((void *)&v110 + 1) + 8 * k);
              v92 = [v91 originMapItem];

              if (v92)
              {
                v93 = [v91 originMapItem];
                [v11 addObject:v93];
              }
              v94 = [v91 destinationMapItem];

              if (v94)
              {
                v95 = [v91 destinationMapItem];
                [v11 addObject:v95];
              }
            }
            uint64_t v88 = [v87 countByEnumeratingWithState:&v110 objects:v146 count:16];
          }
          while (v88);
        }

        v96 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_91];
        v97 = [v11 filteredArrayUsingPredicate:v96];

        v98 = [[_RTMap alloc] initWithInput:v97];
        v109[0] = MEMORY[0x1E4F143A8];
        v109[1] = 3221225472;
        v109[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_5;
        v109[3] = &unk_1E6B91C80;
        v109[4] = self;
        v99 = [(_RTMap *)v98 withBlock:v109];

        v34 = [(RTMapItemProviderBase *)self filterInferredMapItems:v99 byDistance:v104 fromLocation:a4 error:v6];
      }
      _Block_object_dispose(&v147, 8);

      _Block_object_dispose(v153, 8);
      id v59 = v85;
    }

    _Block_object_dispose(&v160, 8);
    _Block_object_dispose(buf, 8);

    id v32 = v59;
  }

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v140, 8);

  return v34;
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

void __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RTMapItemProviderMapsSupport)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_mapsSupportManager_);
}

- (RTMapItemProviderMapsSupport)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapsSupportManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [[RTMapItemProviderMapsSupportParameters alloc] initWithDefaultsManager:v8];
    self = [(RTMapItemProviderMapsSupport *)self initWithDefaultsManager:v8 distanceCalculator:v9 mapsSupportManager:v10 parameters:v11];

    id v12 = self;
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v15, 2u);
    }

    id v12 = 0;
  }

  return v12;
}

- (RTMapItemProviderMapsSupport)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapsSupportManager:(id)a5 parameters:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v12)
  {
    double v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      double v19 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: mapsSupportManager";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_11;
  }
  if (!v13)
  {
    double v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: parameters";
    goto LABEL_14;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTMapItemProviderMapsSupport;
  v15 = [(RTMapItemProviderBase *)&v23 initWithDefaultsManager:v10 distanceCalculator:v11];
  p_isa = (id *)&v15->super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mapsSupportManager, a5);
    objc_storeStrong(p_isa + 4, a6);
    dispatch_time_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = p_isa[4];
      *(_DWORD *)buf = 138412290;
      id v25 = v18;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderMapsSupport with parameters: %@", buf, 0xCu);
    }
  }
  self = p_isa;
  double v19 = self;
LABEL_12:

  return v19;
}

BOOL __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 validMUID])
  {
    v3 = [v2 address];
    id v4 = [v3 mergedThoroughfare];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

id __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F5CDF8];
  id v4 = a2;
  id v5 = [v3 alloc];
  [*(id *)(a1 + 32) confidenceFromMapItemSource:[v4 source]];
  uint64_t v7 = [v5 initWithMapItem:v4 source:[v4 source] confidence:v6];

  return v7;
}

- (double)confidenceFromMapItemSource:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((uint64_t)a3 > 1023)
  {
    if ((uint64_t)a3 >= 0x8000)
    {
      if ((uint64_t)a3 < 0x20000)
      {
        if (a3 != 0x8000 && a3 != 0x10000) {
          return 0.0;
        }
      }
      else if (a3 != 0x20000 && a3 != 0x40000 && a3 != 0x80000)
      {
        return 0.0;
      }
    }
    else if ((uint64_t)a3 <= 4095)
    {
      if (a3 != 1024 && a3 != 2048) {
        return 0.0;
      }
    }
    else if (a3 != 4096 && a3 != 0x2000 && a3 != 0x4000)
    {
      return 0.0;
    }
    goto LABEL_33;
  }
  if ((uint64_t)a3 <= 15)
  {
    if (a3 >= 3 && a3 != 4 && a3 != 8) {
      return 0.0;
    }
LABEL_33:
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[RTMapItemProviderMapsSupport confidenceFromMapItemSource:]";
      __int16 v10 = 1024;
      int v11 = 245;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid source in RTMapItemProviderMapsSupport. (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }

    return 0.0;
  }
  if ((uint64_t)a3 <= 127)
  {
    if (a3 == 16)
    {
      parameters = self->_parameters;
      [(RTMapItemProviderMapsSupportParameters *)parameters favoriteConfidence];
    }
    else
    {
      if (a3 != 64) {
        return 0.0;
      }
      v3 = self->_parameters;
      [(RTMapItemProviderMapsSupportParameters *)v3 historyEntryRouteConfidence];
    }
  }
  else
  {
    if (a3 != 128)
    {
      if (a3 != 256 && a3 != 512) {
        return 0.0;
      }
      goto LABEL_33;
    }
    double v6 = self->_parameters;
    [(RTMapItemProviderMapsSupportParameters *)v6 historyEntryPlaceDisplayConfidence];
  }
  return result;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)setMapsSupportManager:(id)a3
{
}

- (RTMapItemProviderMapsSupportParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
}

@end