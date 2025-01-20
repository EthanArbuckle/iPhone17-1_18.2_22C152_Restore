@interface RTPlaceTypeClassifierExpertFallback
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTPlaceTypeClassifierExpertFallback)init;
- (RTPlaceTypeClassifierExpertFallback)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 locationManager:(id)a5 mapServiceManager:(id)a6 visitManager:(id)a7;
- (RTVisitManager)visitManager;
- (id)classifyWithError:(id *)a3;
- (id)updatePlace:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setVisitManager:(id)a3;
@end

@implementation RTPlaceTypeClassifierExpertFallback

- (RTPlaceTypeClassifierExpertFallback)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_learnedLocationStore_locationManager_mapServiceManager_visitManager_);
}

- (RTPlaceTypeClassifierExpertFallback)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 locationManager:(id)a5 mapServiceManager:(id)a6 visitManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v15)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_17;
  }
  if (!v16)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: mapServiceManager";
      goto LABEL_17;
    }
LABEL_18:

    v20 = 0;
    goto LABEL_19;
  }
  id v26 = v17;
  if (v17)
  {
    v27.receiver = self;
    v27.super_class = (Class)RTPlaceTypeClassifierExpertFallback;
    v18 = [(RTPlaceTypeClassifierExpertFallback *)&v27 init];
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_distanceCalculator, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager", buf, 2u);
    }

    v20 = 0;
  }
  v21 = v26;
LABEL_19:

  return v20;
}

- (id)classifyWithError:(id *)a3
{
  v169[1] = *MEMORY[0x1E4F143B8];
  uint64_t v145 = 0;
  v146 = &v145;
  uint64_t v147 = 0x3032000000;
  v148 = __Block_byref_object_copy__68;
  v149 = __Block_byref_object_dispose__68;
  id v150 = 0;
  uint64_t v139 = 0;
  v140 = (id *)&v139;
  uint64_t v141 = 0x3032000000;
  v142 = __Block_byref_object_copy__68;
  v143 = __Block_byref_object_dispose__68;
  id v144 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = [(RTPlaceTypeClassifierExpertFallback *)self learnedLocationStore];
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke;
  v135[3] = &unk_1E6B90B28;
  v137 = &v145;
  v138 = &v139;
  v7 = v5;
  v136 = v7;
  [v6 fetchLocationOfInterestVisitedLastWithHandler:v135];

  v8 = v7;
  v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  id v14 = objc_opt_new();
  id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_52];
  id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v17 = [v16 filteredArrayUsingPredicate:v15];
  v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v163 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v163 count:1];
  v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;

    char v24 = 0;
  }
  else
  {
LABEL_6:
    id v23 = 0;
    char v24 = 1;
  }

  id v25 = v23;
  if ((v24 & 1) == 0) {
    objc_storeStrong(v140 + 5, v23);
  }
  id v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_super v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = NSStringFromSelector(a2);
    v30 = (void *)v146[5];
    id v31 = v140[5];
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v28;
    __int16 v153 = 2112;
    v154 = v29;
    __int16 v155 = 2112;
    id v156 = v30;
    __int16 v157 = 2112;
    double v158 = *(double *)&v31;
    _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, %@, locationsOfInterestVisitedLast, %@, error, %@", buf, 0x2Au);
  }
  id v32 = v140[5];
  if (!v32 && !v146[5])
  {
    v34 = dispatch_group_create();
    uint64_t v163 = 0;
    v164 = &v163;
    uint64_t v165 = 0x3032000000;
    v166 = __Block_byref_object_copy__68;
    v167 = __Block_byref_object_dispose__68;
    id v168 = 0;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x3032000000;
    v132 = __Block_byref_object_copy__68;
    v133 = __Block_byref_object_dispose__68;
    id v134 = 0;
    uint64_t v123 = 0;
    v124 = (double *)&v123;
    uint64_t v125 = 0x3032000000;
    v126 = __Block_byref_object_copy__68;
    v127 = __Block_byref_object_dispose__68;
    id v128 = 0;
    uint64_t v117 = 0;
    v118 = &v117;
    uint64_t v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__68;
    v121 = __Block_byref_object_dispose__68;
    id v122 = 0;
    dispatch_group_enter(v34);
    v35 = [(RTPlaceTypeClassifierExpertFallback *)self locationManager];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_3;
    v113[3] = &unk_1E6B93B48;
    v115 = &v123;
    v116 = &v163;
    v36 = v34;
    v114 = v36;
    [v35 fetchCurrentLocationWithHandler:v113];

    dispatch_group_enter(v36);
    v37 = [(RTPlaceTypeClassifierExpertFallback *)self visitManager];
    id v38 = objc_alloc(MEMORY[0x1E4F5CF58]);
    v39 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
    v40 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F34512D8];
    v41 = (void *)[v38 initWithAscending:0 confidence:v39 dateInterval:0 labelVisit:0 limit:&unk_1F34512C0 sources:v40];
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_12;
    v109[3] = &unk_1E6B905F0;
    v111 = &v117;
    v112 = &v129;
    v42 = v36;
    v110 = v42;
    [v37 fetchStoredVisitsWithOptions:v41 handler:v109];

    dispatch_group_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
    v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      v46 = NSStringFromSelector(a2);
      v47 = (void *)v164[5];
      double v48 = v124[5];
      v49 = (void *)v130[5];
      uint64_t v50 = v118[5];
      *(_DWORD *)buf = 138413570;
      *(void *)&buf[4] = v45;
      __int16 v153 = 2112;
      v154 = v46;
      __int16 v155 = 2112;
      id v156 = v47;
      __int16 v157 = 2112;
      double v158 = v48;
      __int16 v159 = 2112;
      id v160 = v49;
      __int16 v161 = 2112;
      uint64_t v162 = v50;
      _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, %@, fetched current location, %@, fetchLocationError, %@, fetched current visit, %@, fetchVisitError, %@", buf, 0x3Eu);
    }
    v51 = (void *)*((void *)v124 + 5);
    if (v51 || (v52 = (void *)v164[5]) == 0)
    {
      if (a3)
      {
        v33 = 0;
        *a3 = v51;
LABEL_51:

        _Block_object_dispose(&v117, 8);
        _Block_object_dispose(&v123, 8);

        _Block_object_dispose(&v129, 8);
        _Block_object_dispose(&v163, 8);

        goto LABEL_52;
      }
    }
    else
    {
      id v53 = v52;
      if (v118[5]) {
        goto LABEL_23;
      }
      v79 = [(id)v130[5] location];
      if (!v79) {
        goto LABEL_23;
      }
      v80 = [(id)v130[5] exit];
      BOOL v81 = v80 == 0;

      if (!v81) {
        goto LABEL_23;
      }
      v82 = [(RTPlaceTypeClassifierExpertFallback *)self distanceCalculator];
      uint64_t v83 = v164[5];
      v84 = [(id)v130[5] location];
      id v108 = 0;
      [v82 distanceFromLocation:v83 toLocation:v84 error:&v108];
      double v86 = v85;
      id v98 = v108;

      if (v86 < 250.0)
      {
        uint64_t v87 = [(id)v130[5] location];

        id v53 = (id)v87;
      }
      v88 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
      {
        v89 = (objc_class *)objc_opt_class();
        NSStringFromClass(v89);
        id v90 = (id)objc_claimAutoreleasedReturnValue();
        v91 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413314;
        *(void *)&buf[4] = v90;
        __int16 v153 = 2112;
        v154 = v91;
        __int16 v155 = 2112;
        id v156 = v53;
        __int16 v157 = 2048;
        double v158 = v86;
        __int16 v159 = 2112;
        id v160 = v98;
        _os_log_impl(&dword_1D9BFA000, v88, OS_LOG_TYPE_INFO, "%@, %@, selected current location, %@, distance, %.1f, error, %@", buf, 0x34u);
      }
      if (v53)
      {
LABEL_23:
        v54 = [(RTPlaceTypeClassifierExpertFallback *)self learnedLocationStore];
        v97 = [v54 predicateForObjectsFromCurrentDevice];

        dispatch_semaphore_t v55 = dispatch_semaphore_create(0);
        uint64_t v102 = 0;
        v103 = &v102;
        uint64_t v104 = 0x3032000000;
        v105 = __Block_byref_object_copy__68;
        v106 = __Block_byref_object_dispose__68;
        id v107 = 0;
        v56 = [(RTPlaceTypeClassifierExpertFallback *)self learnedLocationStore];
        v100 = v55;
        double v101 = COERCE_DOUBLE(v53);
        [v56 fetchPlacesWithinDistance:250.0 location:x0 predicate:x1 handler:x2];

        v8 = v100;
        v96 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v57 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v8, v57)) {
          goto LABEL_28;
        }
        v95 = [MEMORY[0x1E4F1C9C8] now];
        [v95 timeIntervalSinceDate:v96];
        double v59 = v58;
        v60 = objc_opt_new();
        v61 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_52];
        v62 = [MEMORY[0x1E4F29060] callStackSymbols];
        v63 = [v62 filteredArrayUsingPredicate:v61];
        v64 = [v63 firstObject];

        [v60 submitToCoreAnalytics:v64 type:1 duration:v59];
        v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v66 = (void *)MEMORY[0x1E4F28C58];
        v169[0] = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v169 count:1];
        v68 = [v66 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v67];

        if (v68)
        {
          id v69 = v68;

          char v70 = 0;
        }
        else
        {
LABEL_28:
          char v70 = 1;
          id v69 = v25;
        }

        id v71 = v69;
        if ((v70 & 1) == 0) {
          objc_storeStrong(v140 + 5, v69);
        }
        v72 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v73 = (objc_class *)objc_opt_class();
          NSStringFromClass(v73);
          id v74 = (id)objc_claimAutoreleasedReturnValue();
          v75 = NSStringFromSelector(a2);
          v76 = (void *)v103[5];
          id v77 = v140[5];
          *(_DWORD *)buf = 138413314;
          *(void *)&buf[4] = v74;
          __int16 v153 = 2112;
          v154 = v75;
          __int16 v155 = 2112;
          id v156 = v76;
          __int16 v157 = 2112;
          double v158 = v101;
          __int16 v159 = 2112;
          id v160 = v77;
          _os_log_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_INFO, "%@, %@, current place, %@, current location, %@, error, %@", buf, 0x34u);
        }
        id v78 = v140[5];
        if (v78 || (v92 = v103, (uint64_t v93 = v103[5]) == 0))
        {
          v33 = 0;
          if (a3) {
            *a3 = v78;
          }
        }
        else
        {
          if (a3)
          {
            *a3 = 0;
            uint64_t v93 = v92[5];
          }
          uint64_t v151 = v93;
          v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
        }

        _Block_object_dispose(&v102, 8);
        id v25 = v71;
        goto LABEL_51;
      }
      if (a3)
      {
        v33 = 0;
        *a3 = 0;
        goto LABEL_51;
      }
    }
    v33 = 0;
    goto LABEL_51;
  }
  v33 = 0;
  if (a3) {
    *a3 = v32;
  }
LABEL_52:

  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v145, 8);

  return v33;
}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v9)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_12(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [v6 firstObject];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          double v13 = [v12 mapItem];

          if (v13)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v12);
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v55 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      v46 = v16;
      __int16 v47 = 2112;
      double v48 = v17;
      __int16 v49 = 2112;
      uint64_t v50 = v18;
      __int16 v51 = 2112;
      uint64_t v52 = v19;
      __int16 v53 = 2112;
      id v54 = v6;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, fetched place, %@, current location, %@, error, %@", buf, 0x34u);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v23 = objc_alloc(MEMORY[0x1E4F5CE48]);
      char v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      id v26 = (void *)[v23 initWithUseBackgroundTraits:1 analyticsIdentifier:v25 clientIdentifier:0];

      objc_super v27 = [*(id *)(a1 + 40) mapServiceManager];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_16;
      v34[3] = &unk_1E6B96338;
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v38 = *(void *)(a1 + 56);
      id v29 = *(id *)(a1 + 32);
      uint64_t v30 = *(void *)(a1 + 40);
      id v31 = *(void **)(a1 + 48);
      id v35 = v29;
      uint64_t v36 = v30;
      uint64_t v40 = *(void *)(a1 + 72);
      id v32 = v31;
      uint64_t v33 = *(void *)(a1 + 64);
      id v37 = v32;
      uint64_t v39 = v33;
      [v27 fetchMapItemsFromLocation:v28 options:v26 handler:v34];

      goto LABEL_17;
    }
    uint64_t v20 = [*(id *)(a1 + 40) updatePlace:];
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_17:
}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (v6)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    id v7 = [v5 firstObject];
    [v7 setSource:0x20000];
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, created mapItem, %@, current location, %@, error, %@", buf, 0x34u);
    }
    double v13 = [RTLearnedPlace alloc];
    id v14 = [MEMORY[0x1E4F29128] UUID];
    id v15 = [v7 creationDate];
    id v16 = [v7 expirationDate];
    uint64_t v17 = [(RTLearnedPlace *)v13 initWithIdentifier:v14 type:1 typeSource:8 mapItem:v7 customLabel:0 creationDate:v15 expirationDate:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)updatePlace:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v95 = [MEMORY[0x1E4F1C9C8] date];
    v94 = [v95 dateByAddingTimeInterval:4838400.0];
    id v92 = objc_alloc(MEMORY[0x1E4F5CD80]);
    v65 = [v3 mapItem];
    v63 = [v65 address];
    id v90 = [v63 identifier];
    v62 = [v3 mapItem];
    v61 = [v62 address];
    v88 = [v61 geoAddressData];
    v60 = [v3 mapItem];
    double v59 = [v60 address];
    double v86 = [v59 subPremises];
    double v58 = [v3 mapItem];
    dispatch_time_t v57 = [v58 address];
    v84 = [v57 subThoroughfare];
    uint64_t v56 = [v3 mapItem];
    dispatch_semaphore_t v55 = [v56 address];
    v82 = [v55 thoroughfare];
    id v54 = [v3 mapItem];
    __int16 v53 = [v54 address];
    id v78 = [v53 subLocality];
    uint64_t v52 = [v3 mapItem];
    __int16 v51 = [v52 address];
    v80 = [v51 locality];
    uint64_t v50 = [v3 mapItem];
    __int16 v49 = [v50 address];
    v75 = [v49 subAdministrativeArea];
    double v48 = [v3 mapItem];
    __int16 v47 = [v48 address];
    v73 = [v47 administrativeArea];
    v46 = [v3 mapItem];
    id v45 = [v46 address];
    id v71 = [v45 administrativeAreaCode];
    long long v44 = [v3 mapItem];
    long long v43 = [v44 address];
    id v69 = [v43 postalCode];
    long long v42 = [v3 mapItem];
    long long v41 = [v42 address];
    v67 = [v41 country];
    uint64_t v40 = [v3 mapItem];
    uint64_t v39 = [v40 address];
    id v32 = [v39 countryCode];
    uint64_t v38 = [v3 mapItem];
    id v37 = [v38 address];
    uint64_t v29 = [v37 inlandWater];
    uint64_t v36 = [v3 mapItem];
    id v35 = [v36 address];
    __int16 v28 = [v35 ocean];
    v34 = [v3 mapItem];
    uint64_t v33 = [v34 address];
    v4 = [v33 areasOfInterest];
    id v31 = [v3 mapItem];
    uint64_t v30 = [v31 address];
    char v5 = [v30 isIsland];
    id v6 = [v3 mapItem];
    id v7 = [v6 address];
    uint64_t v8 = [v7 iso3166CountryCode];
    uint64_t v9 = [v3 mapItem];
    uint64_t v10 = [v9 address];
    id v11 = [v10 iso3166SubdivisionCode];
    LOBYTE(v27) = v5;
    uint64_t v93 = objc_msgSend(v92, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v90, v88, v86, v84, v82, v78, v80, v75, v73, v71, v69, v67, v32, v29, v28,
                    v4,
                    v27,
                    v95,
                    v94,
                    v8,
                    v11);

    id v76 = objc_alloc(MEMORY[0x1E4F5CE38]);
    v89 = [v3 mapItem];
    v91 = [v89 identifier];
    uint64_t v87 = [v3 mapItem];
    uint64_t v12 = [v87 name];
    double v85 = [v3 mapItem];
    id v74 = [v85 category];
    uint64_t v83 = [v3 mapItem];
    char v70 = [v83 location];
    BOOL v81 = [v3 mapItem];
    uint64_t v66 = [v81 mapItemPlaceType];
    v79 = [v3 mapItem];
    uint64_t v64 = [v79 muid];
    v72 = [v3 mapItem];
    uint64_t v13 = [v72 resultProviderID];
    v68 = [v3 mapItem];
    id v14 = [v68 geoMapItemHandle];
    id v15 = [v3 mapItem];
    id v16 = [v15 extendedAttributes];
    uint64_t v17 = [v3 mapItem];
    uint64_t v18 = [v17 displayLanguage];
    uint64_t v19 = [v3 mapItem];
    LOBYTE(v26) = [v19 disputed];
    id v77 = (void *)[v76 initWithIdentifier:v91 name:v12 category:v74 address:v93 location:v70 source:0x20000 mapItemPlaceType:v66 muid:v64 resultProviderID:v13 geoMapItemHandle:v14 creationDate:v95 expirationDate:v94 extendedAttributes:v16 displayLanguage:v18 disputed:v26];

    uint64_t v20 = [RTLearnedPlace alloc];
    uint64_t v21 = [v3 identifier];
    __int16 v22 = [v3 customLabel];
    id v23 = [(RTLearnedPlace *)v20 initWithIdentifier:v21 type:1 typeSource:8 mapItem:v77 customLabel:v22 creationDate:v95 expirationDate:v94];
  }
  else
  {
    __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", buf, 2u);
    }

    id v23 = 0;
  }

  return v23;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end