@interface RTMapItemProviderLearnedPlace
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTMapItemProviderLearnedPlace)init;
- (RTMapItemProviderLearnedPlace)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5;
- (RTMapItemProviderLearnedPlace)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 parameters:(id)a6;
- (RTMapItemProviderLearnedPlaceParameters)parameters;
- (double)confidenceForPlaceType:(unint64_t)a3;
- (id)adjustConfidenceAndCollectMetrics:(id)a3 learnedPlace:(id)a4 maxConfidence:(double)a5;
- (id)learnedPlaceForInferredMapItem:(id)a3 error:(id *)a4;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
- (unint64_t)coalescedMapItemSourceForPlace:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
@end

@implementation RTMapItemProviderLearnedPlace

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  v164[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 distance];
  double v7 = v6;
  v100 = v5;
  v107 = [v5 location];
  [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters maxDistanceThreshold];
  if (v8 < v7) {
    double v7 = v8;
  }
  [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters minDistanceThreshold];
  if (v7 < v9) {
    double v7 = v9;
  }
  [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters softDistanceThreshold];
  if (v10 >= v7) {
    double v11 = v10;
  }
  else {
    double v11 = v7;
  }
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__55;
  v144 = __Block_byref_object_dispose__55;
  id v145 = 0;
  uint64_t v134 = 0;
  v135 = (id *)&v134;
  uint64_t v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__55;
  v138 = __Block_byref_object_dispose__55;
  id v139 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v13 = [(RTMapItemProviderLearnedPlace *)self learnedLocationStore];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke;
  v130[3] = &unk_1E6B905F0;
  v132 = &v140;
  v133 = &v134;
  v14 = v12;
  v131 = v14;
  [v13 fetchLocationsOfInterestWithinDistance:v107 location:v130 handler:v11];

  dsema = v14;
  v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v16)) {
    goto LABEL_13;
  }
  v17 = [MEMORY[0x1E4F1C9C8] now];
  [v17 timeIntervalSinceDate:v15];
  double v19 = v18;
  v20 = objc_opt_new();
  v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
  v22 = [MEMORY[0x1E4F29060] callStackSymbols];
  v23 = [v22 filteredArrayUsingPredicate:v21];
  v24 = [v23 firstObject];

  [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v158 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v158, 2u);
  }

  v26 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v152 = *MEMORY[0x1E4F28568];
  *(void *)v158 = @"semaphore wait timeout";
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:&v152 count:1];
  v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

  if (v28)
  {
    id v29 = v28;

    char v30 = 0;
  }
  else
  {
LABEL_13:
    id v29 = 0;
    char v30 = 1;
  }

  id v99 = v29;
  if ((v30 & 1) == 0) {
    objc_storeStrong(v135 + 5, v29);
  }
  *(void *)v158 = 0;
  v159 = v158;
  uint64_t v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__55;
  v162 = __Block_byref_object_dispose__55;
  id v163 = 0;
  uint64_t v152 = 0;
  v153 = (id *)&v152;
  uint64_t v154 = 0x3032000000;
  v155 = __Block_byref_object_copy__55;
  v156 = __Block_byref_object_dispose__55;
  id v157 = 0;
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  v32 = [(RTMapItemProviderLearnedPlace *)self learnedLocationStore];
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2;
  v126[3] = &unk_1E6B905F0;
  v128 = v158;
  v129 = &v152;
  v33 = v31;
  v127 = v33;
  [v32 fetchPlacesWithinDistance:v107 location:v126 handler:v11];

  v108 = v33;
  v34 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v35 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v108, v35)) {
    goto LABEL_21;
  }
  v36 = [MEMORY[0x1E4F1C9C8] now];
  [v36 timeIntervalSinceDate:v34];
  double v38 = v37;
  v39 = objc_opt_new();
  v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
  v41 = [MEMORY[0x1E4F29060] callStackSymbols];
  v42 = [v41 filteredArrayUsingPredicate:v40];
  v43 = [v42 firstObject];

  [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
  v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v45 = (void *)MEMORY[0x1E4F28C58];
  v164[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v164 count:1];
  v47 = [v45 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v46];

  if (v47)
  {
    id v48 = v47;

    char v49 = 0;
  }
  else
  {
LABEL_21:
    id v48 = 0;
    char v49 = 1;
  }

  id v98 = v48;
  if ((v49 & 1) == 0) {
    objc_storeStrong(v153 + 5, v48);
  }
  if (!((unint64_t)v135[5] | (unint64_t)v153[5]))
  {
LABEL_30:
    v52 = [MEMORY[0x1E4F1CA48] array:v96, v97];
    v53 = (void *)v141[5];
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_3;
    v123[3] = &unk_1E6B95748;
    v123[4] = self;
    id v110 = v107;
    id v124 = v110;
    id v54 = v52;
    id v125 = v54;
    [v53 enumerateObjectsUsingBlock:v123];
    v55 = objc_opt_new();
    v56 = (void *)*((void *)v159 + 5);
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_25;
    v120[3] = &unk_1E6B95798;
    id v102 = v55;
    id v121 = v102;
    id v112 = v54;
    id v122 = v112;
    [v56 enumerateObjectsUsingBlock:v120];
    v104 = [MEMORY[0x1E4F1CA48] array];
    v106 = [MEMORY[0x1E4F1CA48] array];
    v111 = [MEMORY[0x1E4F1CA48] array];
    v103 = [MEMORY[0x1E4F1CA48] array];
    for (unint64_t i = 0; i < [v112 count]; ++i)
    {
      id v58 = [v112 objectAtIndexedSubscript:i];
      v59 = [v58 mapItem];
      BOOL v60 = v59 == 0;

      if (v60)
      {
        v64 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          v66 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v66;
          __int16 v150 = 2112;
          id v151 = v58;
          _os_log_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_INFO, "%@, found place with nil mapItem, %@", buf, 0x16u);
        }
      }
      else
      {
        *(void *)buf = 0;
        v164[0] = 0;
        v61 = [(RTMapItemProviderLearnedPlace *)self learnedLocationStore];
        v62 = [v58 mapItem];
        id v119 = 0;
        int v63 = [v61 placeTypeForMapItem:v62 placeType:buf placeTypeSource:v164 error:&v119];
        v64 = v119;

        if (v63)
        {
          uint64_t v65 = *(void *)buf;
        }
        else
        {
          uint64_t v65 = 0;
          *(void *)buf = 0;
          v164[0] = 0;
        }
        [(RTMapItemProviderLearnedPlace *)self confidenceForPlaceType:v65];
        double v68 = v67;
        v69 = [v58 mapItem];
        v70 = [v69 appendSource:0x2000];

        v71 = (void *)[objc_alloc(MEMORY[0x1E4F5CDF8]) initWithMapItem:v70 confidence:0x2000 source:v68];
        if (!v71)
        {
          v86 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v147 = *MEMORY[0x1E4F28568];
          v148 = @"inferredMapItem was nil";
          v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
          v88 = [v86 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v87];

          if (a4) {
            *a4 = v88;
          }

LABEL_55:
          id v51 = 0;
          goto LABEL_64;
        }
        if (*(void *)buf)
        {
          [v111 addObject:v71];
          v72 = [(RTMapItemProviderLearnedPlace *)self adjustConfidenceAndCollectMetrics:v110 learnedPlace:v58 maxConfidence:v68];
          id v73 = [NSString alloc];
          v74 = (void *)[v73 initWithCString:RTAnalyticsEventLearnedPlaceConfidence encoding:1];
          log_analytics_submission(v74, v72);
          v75 = [NSString stringWithFormat:@"com.apple.%@", v74];
          AnalyticsSendEvent();
        }
        else
        {
          unint64_t v76 = [(RTMapItemProviderLearnedPlace *)self coalescedMapItemSourceForPlace:v58];
          unint64_t v77 = [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters revGeoSourceMask];
          parameters = self->_parameters;
          if ((v76 & ~v77) != 0)
          {
            [(RTMapItemProviderLearnedPlaceParameters *)parameters nonRevGeoConfidence];
            v79 = [NSNumber numberWithDouble:];
            [v71 setValue:v79 forKey:@"confidence"];

            v80 = v106;
          }
          else
          {
            [(RTMapItemProviderLearnedPlaceParameters *)parameters revGeoConfidence];
            v81 = [NSNumber numberWithDouble:];
            [v71 setValue:v81 forKey:@"confidence"];

            v82 = [v71 mapItem];
            v83 = [v82 identifier];
            int v84 = [v102 containsObject:v83];

            if (v84) {
              v80 = v104;
            }
            else {
              v80 = v103;
            }
          }
          [v80 addObject:v71];
        }
      }
    }
    id v118 = 0;
    v64 = [(RTMapItemProviderBase *)self filterInferredMapItems:v104 byDistance:v110 fromLocation:0x2000 andAppendSource:&v118 error:v7];
    id v85 = v118;
    if (v85)
    {
      id v58 = v85;
      if (a4)
      {
        id v58 = v85;
        id v51 = 0;
        *a4 = v58;
        goto LABEL_64;
      }
      goto LABEL_55;
    }
    v89 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v106 count]+ [v111 count]+ [v103 count]+ -[NSObject count](v64, "count")];
    [v89 addObjectsFromArray:v111];
    [v89 addObjectsFromArray:v106];
    [v89 addObjectsFromArray:v64];
    [v89 addObjectsFromArray:v103];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v51 = v89;
    uint64_t v90 = [v51 countByEnumeratingWithState:&v114 objects:v146 count:16];
    if (v90)
    {
      uint64_t v91 = *(void *)v115;
      do
      {
        for (uint64_t j = 0; j != v90; ++j)
        {
          if (*(void *)v115 != v91) {
            objc_enumerationMutation(v51);
          }
          v93 = [*(id *)(*((void *)&v114 + 1) + 8 * j) mapItem];
          id v94 = [(id)[v93 removeSource:-[RTMapItemProviderLearnedPlaceParameters removeSourceMask](self->_parameters, "removeSourceMask")];
        }
        uint64_t v90 = [v51 countByEnumeratingWithState:&v114 objects:v146 count:16];
      }
      while (v90);
    }

    id v58 = 0;
LABEL_64:

    goto LABEL_65;
  }
  id v96 = v153[5];
  uint64_t v97 = 1;
  v50 = _RTSafeArray();
  _RTMultiErrorCreate();
  id v112 = (id)objc_claimAutoreleasedReturnValue();

  if (!v135[5] || !v153[5])
  {

    goto LABEL_30;
  }
  if (a4)
  {
    id v113 = v112;
    id v51 = 0;
    *a4 = v113;

    goto LABEL_66;
  }
  id v51 = 0;
LABEL_65:

LABEL_66:
  _Block_object_dispose(&v152, 8);

  _Block_object_dispose(v158, 8);
  _Block_object_dispose(&v134, 8);

  _Block_object_dispose(&v140, 8);

  return v51;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTMapItemProviderLearnedPlace)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedLocationStore_);
}

- (RTMapItemProviderLearnedPlace)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    double v11 = [[RTMapItemProviderLearnedPlaceParameters alloc] initWithDefaultsManager:v8];
    self = [(RTMapItemProviderLearnedPlace *)self initWithDefaultsManager:v8 distanceCalculator:v9 learnedLocationStore:v10 parameters:v11];

    dispatch_semaphore_t v12 = self;
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v15, 2u);
    }

    dispatch_semaphore_t v12 = 0;
  }

  return v12;
}

- (RTMapItemProviderLearnedPlace)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 parameters:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v12)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      double v19 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: learnedLocationStore";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_11;
  }
  if (!v13)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: parameters";
    goto LABEL_14;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTMapItemProviderLearnedPlace;
  v15 = [(RTMapItemProviderBase *)&v23 initWithDefaultsManager:v10 distanceCalculator:v11];
  p_isa = (id *)&v15->super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_learnedLocationStore, a5);
    objc_storeStrong(p_isa + 4, a6);
    v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = p_isa[4];
      *(_DWORD *)buf = 138412290;
      id v25 = v18;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderLearnedPlace with parameters: %@", buf, 0xCu);
    }
  }
  self = p_isa;
  double v19 = self;
LABEL_12:

  return v19;
}

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) distanceCalculator];
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = [v3 location];
  double v7 = [v6 location];
  int v8 = [v4 checkConsistencyBetweenLocation:v5 otherLocation:v7 error:0];

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = @"NO";
    int v14 = 138412802;
    if (v8) {
      id v13 = @"YES";
    }
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    double v19 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "Processing LOI, %@, near entry location, %@, consistent, %@", (uint8_t *)&v14, 0x20u);
  }

  if (v8)
  {
    id v10 = *(void **)(a1 + 48);
    id v11 = [v3 place];
    [v10 addObject:v11];
  }
}

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 mapItem];
  uint64_t v5 = [v4 identifier];

  if (v5)
  {
    double v6 = *(void **)(a1 + 32);
    double v7 = [v3 mapItem];
    int v8 = [v7 identifier];
    [v6 addObject:v8];
  }
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v9 = *(void **)(a1 + 40);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2_26;
  int v14 = &unk_1E6B95770;
  id v10 = v3;
  id v15 = v10;
  __int16 v16 = &v17;
  [v9 enumerateObjectsUsingBlock:&v11];
  if (!*((unsigned char *)v18 + 24)) {
    [*(id *)(a1 + 40) addObject:v10, v11, v12, v13, v14];
  }

  _Block_object_dispose(&v17, 8);
}

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2_26(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  double v6 = [*(id *)(a1 + 32) identifier];
  double v7 = [v11 identifier];
  if ([v6 isEqual:v7])
  {
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) mapItem];
    id v9 = [v11 mapItem];
    int v10 = [v8 isEqualToMapItem:v9];

    if (!v10) {
      goto LABEL_5;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  *a4 = 1;
LABEL_5:
}

- (id)learnedPlaceForInferredMapItem:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  char v49 = __Block_byref_object_copy__55;
  v50 = __Block_byref_object_dispose__55;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__55;
  v44 = __Block_byref_object_dispose__55;
  id v45 = 0;
  int v8 = (void *)MEMORY[0x1E016D870]();
  id v9 = [(RTMapItemProviderLearnedPlace *)self learnedLocationStore];
  int v10 = [v6 mapItem];
  id v11 = [v10 identifier];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  dispatch_time_t v35 = __70__RTMapItemProviderLearnedPlace_learnedPlaceForInferredMapItem_error___block_invoke;
  v36 = &unk_1E6B93E60;
  double v38 = &v40;
  v39 = &v46;
  uint64_t v12 = v7;
  double v37 = v12;
  [v9 fetchPlaceWithMapItemIdentifier:v11 handler:&v33];

  id v13 = v12;
  int v14 = [MEMORY[0x1E4F1C9C8] now:v33, v34, v35, v36];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v15)) {
    goto LABEL_6;
  }
  __int16 v16 = [MEMORY[0x1E4F1C9C8] now];
  [v16 timeIntervalSinceDate:v14];
  double v18 = v17;
  uint64_t v19 = objc_opt_new();
  char v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
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
  uint64_t v52 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v52 count:1];
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
    objc_storeStrong(v41 + 5, v28);
  }
  if (a4) {
    *a4 = v41[5];
  }
  id v31 = (id)v47[5];
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);

  return v31;
}

void __70__RTMapItemProviderLearnedPlace_learnedPlaceForInferredMapItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)coalescedMapItemSourceForPlace:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    *(void *)v32 = 0;
    uint64_t v33 = v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [(RTMapItemProviderLearnedPlace *)self learnedLocationStore];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __64__RTMapItemProviderLearnedPlace_coalescedMapItemSourceForPlace___block_invoke;
    char v29 = &unk_1E6B92348;
    id v31 = v32;
    dispatch_semaphore_t v7 = v5;
    id v30 = v7;
    [v6 fetchLocationOfInterestWithPlace:v4 handler:&v26];

    id v8 = v7;
    id v9 = [MEMORY[0x1E4F1C9C8] now:v26, v27, v28, v29];
    dispatch_time_t v10 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v8, v10))
    {
      id v11 = [MEMORY[0x1E4F1C9C8] now];
      [v11 timeIntervalSinceDate:v9];
      double v13 = v12;
      int v14 = objc_opt_new();
      dispatch_time_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
      __int16 v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v17 = [v16 filteredArrayUsingPredicate:v15];
      double v18 = [v17 firstObject];

      [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
      uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      char v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v36 count:1];
      v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

      if (v22) {
    }
      }

    unint64_t v23 = *((void *)v33 + 3);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v32 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v32, 2u);
    }

    unint64_t v23 = 0x2000;
  }

  return v23;
}

intptr_t __64__RTMapItemProviderLearnedPlace_coalescedMapItemSourceForPlace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = [a2 visits];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [*(id *)(*((void *)&v9 + 1) + 8 * v7++) placeSource];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (double)confidenceForPlaceType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters homeConfidence];
      break;
    case 2uLL:
      [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters workConfidence];
      break;
    case 3uLL:
      [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters schoolConfidence];
      break;
    case 4uLL:
      [(RTMapItemProviderLearnedPlaceParameters *)self->_parameters gymConfidence];
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (id)adjustConfidenceAndCollectMetrics:(id)a3 learnedPlace:(id)a4 maxConfidence:(double)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v8 = a4;
  long long v9 = objc_opt_new();
  long long v10 = [NSNumber numberWithUnsignedInteger:[v8 type]];
  [v9 setObject:v10 forKeyedSubscript:@"type"];

  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  double v67 = __Block_byref_object_copy__55;
  double v68 = __Block_byref_object_dispose__55;
  id v69 = 0;
  uint64_t v58 = 0;
  v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__55;
  v62 = __Block_byref_object_dispose__55;
  id v63 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  double v13 = [v8 mapItem];
  uint64_t v50 = MEMORY[0x1E4F143A8];
  uint64_t v51 = 3221225472;
  uint64_t v52 = __94__RTMapItemProviderLearnedPlace_adjustConfidenceAndCollectMetrics_learnedPlace_maxConfidence___block_invoke;
  v53 = &unk_1E6B957C0;
  id v14 = v8;
  id v54 = v14;
  v56 = &v58;
  v57 = &v64;
  dispatch_time_t v15 = v11;
  v55 = v15;
  [(RTLearnedLocationStore *)learnedLocationStore fetchLocationOfInterestWithMapItem:v13 handler:&v50];

  __int16 v16 = v15;
  double v17 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18)) {
    goto LABEL_6;
  }
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
  [v19 timeIntervalSinceDate:v17];
  double v21 = v20;
  v22 = objc_opt_new();
  unint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
  v24 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v25 = [v24 filteredArrayUsingPredicate:v23];
  uint64_t v26 = [v25 firstObject];

  [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
  uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v70 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  char v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v70 count:1];
  id v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

  if (v30)
  {
    id v31 = v30;

    char v32 = 0;
  }
  else
  {
LABEL_6:
    id v31 = 0;
    char v32 = 1;
  }

  id v33 = v31;
  if ((v32 & 1) == 0) {
    objc_storeStrong(v59 + 5, v31);
  }
  if (!v59[5] && v65[5])
  {
    [v49 latitude];
    [v49 longitude];
    uint64_t v34 = [(id)v65[5] location];
    uint64_t v35 = [v34 location];
    [v35 latitude];
    uint64_t v36 = [(id)v65[5] location];
    double v37 = [v36 location];
    [v37 longitude];
    RTCommonCalculateDistanceHighPrecision();
    double v39 = v38;

    uint64_t v40 = [NSNumber numberWithDouble:v39];
    [v9 setObject:v40 forKeyedSubscript:@"distance"];

    v41 = [(id)v65[5] location];
    uint64_t v42 = [v41 location];
    [v42 horizontalUncertainty];
    double v44 = v43;

    id v45 = [NSNumber numberWithDouble:v44];
    [v9 setObject:v45 forKeyedSubscript:@"uncertainty"];

    double v46 = 0.0;
    if (v44 > 0.0 && v39 < v44 + v44) {
      double v46 = (a5 + -0.55) * (dbl_1DA0FF780[vcvtmd_s64_f64(v39 / v44 * 4.0)] + -0.0346) / 0.1628 + 0.55;
    }
    v47 = [NSNumber numberWithDouble:v46, v49, v50, v51, v52, v53, v54];
    [v9 setObject:v47 forKeyedSubscript:@"confidence"];
  }
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);

  return v9;
}

void __94__RTMapItemProviderLearnedPlace_adjustConfidenceAndCollectMetrics_learnedPlace_maxConfidence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v13 = 138412802;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "fetched LOI, %@, with learnedPlace, %@, error, %@", (uint8_t *)&v13, 0x20u);
  }

  if (v6)
  {
    long long v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v10 = v6;
LABEL_7:
    id v11 = v10;
    long long v12 = *v9;
    *long long v9 = v11;

    goto LABEL_8;
  }
  if (v5)
  {
    long long v9 = (void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    long long v10 = v5;
    goto LABEL_7;
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTMapItemProviderLearnedPlaceParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
}

@end