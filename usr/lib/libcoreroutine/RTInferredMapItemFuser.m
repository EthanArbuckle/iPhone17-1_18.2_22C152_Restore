@interface RTInferredMapItemFuser
- (BOOL)initializeEntriesForNonAoiDedupedInferredMapItems:(id)a3 aoiDedupedInferredMapItems:(id)a4 nonAoiUUIDToLogProbMap:(id *)a5 aoiUUIDToProbArrayMap:(id *)a6 error:(id *)a7;
- (BOOL)partitionDedupedInferredMapItems:(id)a3 intoNonAoiDedupedInferredMapItems:(id *)a4 aoiDedupedInferredMapItems:(id *)a5 error:(id *)a6;
- (BOOL)updateAoiUUIDToProbArrayMap:(id)a3 aoiDedupedInferredMapItems:(id)a4 error:(id *)a5;
- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 bluePOIDedupedInferredMapItems:(id)a4 error:(id *)a5;
- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 nonAoiDedupedInferredMapItems:(id)a4 error:(id *)a5;
- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 nonBluePOIDedupedInferredMapItems:(id)a4 error:(id *)a5;
- (NSUUID)placeholderUUID;
- (RTDistanceCalculator)distanceCalculator;
- (RTInferredMapItemDeduper)deduper;
- (RTInferredMapItemFuser)init;
- (RTInferredMapItemFuser)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5;
- (RTInferredMapItemFuser)initWithDistanceCalculator:(id)a3 parameters:(id)a4 learnedLocationStore:(id)a5;
- (RTInferredMapItemFuserParameters)parameters;
- (RTLearnedLocationStore)learnedLocationStore;
- (double)logSumExpOfLogProbMap:(id)a3 error:(id *)a4;
- (id)bestFromFusedInferredMapItems:(id)a3;
- (id)filterCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5;
- (id)filterLearnedPlaceCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5;
- (id)filterUnknownLearnedPlaceCandidates:(id)a3;
- (id)fusedInferredMapItemsFromUUIDToProbMap:(id)a3 inferredMapItemDeduperState:(id)a4 uuidToFusedMapItemSourceMap:(id)a5 referenceLocation:(id)a6 error:(id *)a7;
- (id)fusedInferredMapItemsUsingCandidates:(id)a3 referenceLocation:(id)a4 snapToBestKnownPlaceAndAoi:(BOOL)a5 error:(id *)a6;
- (id)highestConfidenceAoiMapItemFromFusedInferredMapItems:(id)a3;
- (id)normalizeNonAoiUUIDToLogProbMap:(id)a3 aoiUUIDToProbArrayMap:(id)a4 error:(id *)a5;
- (id)populateMapItemSourceEntriesForDedupedInferredMapItems:(id)a3 error:(id *)a4;
- (id)preprocessCandidates:(id)a3 referenceLocation:(id)a4 snapToBestKnownPlaceAndAoi:(BOOL)a5 error:(id *)a6;
- (id)snapToBestAOICandidate:(id)a3 error:(id *)a4;
- (id)snapToBestKnownPlaceType:(id)a3 error:(id *)a4;
- (id)subtractMaxLogarithmFromLogProbMap:(id)a3 error:(id *)a4;
- (void)setDeduper:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation RTInferredMapItemFuser

- (RTInferredMapItemFuser)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedLocationStore_);
}

- (RTInferredMapItemFuser)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[RTInferredMapItemFuserParameters alloc] initWithDefaultsManager:v10];

  v12 = [(RTInferredMapItemFuser *)self initWithDistanceCalculator:v9 parameters:v11 learnedLocationStore:v8];
  return v12;
}

- (RTInferredMapItemFuser)initWithDistanceCalculator:(id)a3 parameters:(id)a4 learnedLocationStore:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v21 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_11;
  }
  if (!v10)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: parameters";
    goto LABEL_14;
  }
  v25.receiver = self;
  v25.super_class = (Class)RTInferredMapItemFuser;
  v12 = [(RTInferredMapItemFuser *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_distanceCalculator, a3);
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    placeholderUUID = v13->_placeholderUUID;
    v13->_placeholderUUID = (NSUUID *)v14;

    v16 = [RTInferredMapItemDeduper alloc];
    uint64_t v17 = [(RTInferredMapItemDeduper *)v16 initWithDeduperFunction:deduperFunctionGroupedLabelType];
    deduper = v13->_deduper;
    v13->_deduper = (RTInferredMapItemDeduper *)v17;

    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_learnedLocationStore, a5);
    v19 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      parameters = v13->_parameters;
      *(_DWORD *)buf = 138412290;
      v27 = parameters;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "created fuser with parameters, %@", buf, 0xCu);
    }
  }
  self = v13;
  v21 = self;
LABEL_12:

  return v21;
}

- (id)filterCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  v113[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v80 = v7;
  v83 = v8;
  if (!v7)
  {
    v68 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v98 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", v98, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"candidates");
      id v69 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:
      id v67 = 0;
      *a5 = v69;
      goto LABEL_59;
    }
LABEL_53:
    id v67 = 0;
    goto LABEL_59;
  }
  if (!v8)
  {
    v70 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v98 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", v98, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"referenceLocation");
      id v69 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  v84 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v7 count]];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v7;
  uint64_t v86 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
  if (v86)
  {
    uint64_t v85 = *(void *)v106;
    uint64_t v76 = *MEMORY[0x1E4F5CFE8];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    *(void *)&long long v9 = 138412546;
    long long v75 = v9;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v106 != v85) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v105 + 1) + 8 * v10);
        v12 = [v11 firstObject:v75];
        v13 = [v12 mapItem];
        uint64_t v14 = [v13 extendedAttributes];
        BOOL v15 = [v14 wifiFingerprintLabelType] == 2;

        if (v15)
        {
          [v84 addObject:v11];
          goto LABEL_17;
        }
        distanceCalculator = self->_distanceCalculator;
        uint64_t v17 = [v11 firstObject];
        v18 = [v17 mapItem];
        v19 = [v18 location];
        id v104 = 0;
        [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v19 toLocation:v83 error:&v104];
        double v21 = v20;
        id v22 = v104;

        if (v22)
        {
          v71 = (void *)MEMORY[0x1E4F28C58];
          v72 = [v22 userInfo];
          v73 = [v71 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:1 userInfo:v72];

          if (a5) {
            *a5 = v73;
          }

LABEL_57:
          id v67 = 0;
          v66 = v84;
          goto LABEL_58;
        }
        [(RTInferredMapItemFuserParameters *)self->_parameters distanceThreshold];
        if (v21 <= v23)
        {
          id v24 = 0;
LABEL_15:
          [v84 addObject:v11];
LABEL_16:

          goto LABEL_17;
        }
        id v24 = [v11 firstObject];
        objc_super v25 = [v24 mapItem];
        if (([v25 source] & 0x2000) == 0)
        {

          goto LABEL_16;
        }
        v26 = [(RTInferredMapItemFuser *)self learnedLocationStore];
        BOOL v27 = v26 == 0;

        if (!v27)
        {
          *(void *)v98 = 0;
          v99 = v98;
          uint64_t v100 = 0x3032000000;
          v101 = __Block_byref_object_copy__148;
          v102 = __Block_byref_object_dispose__148;
          id v103 = 0;
          uint64_t v92 = 0;
          v93 = (id *)&v92;
          uint64_t v94 = 0x3032000000;
          v95 = __Block_byref_object_copy__148;
          v96 = __Block_byref_object_dispose__148;
          id v97 = 0;
          dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
          v29 = [(RTInferredMapItemFuser *)self learnedLocationStore];
          v30 = [v11 firstObject];
          v31 = [v30 mapItem];
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = __67__RTInferredMapItemFuser_filterCandidates_referenceLocation_error___block_invoke;
          v88[3] = &unk_1E6B90B28;
          v90 = v98;
          v91 = &v92;
          v32 = v28;
          v89 = v32;
          [v29 fetchLocationOfInterestWithMapItem:v31 handler:v88];

          dsema = v32;
          v33 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v34 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v34)) {
            goto LABEL_25;
          }
          v35 = [MEMORY[0x1E4F1C9C8] now];
          [v35 timeIntervalSinceDate:v33];
          double v37 = v36;
          v38 = objc_opt_new();
          v39 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_210_0];
          v40 = [MEMORY[0x1E4F29060] callStackSymbols];
          v41 = [v40 filteredArrayUsingPredicate:v39];
          v42 = [v41 firstObject];

          [v38 submitToCoreAnalytics:v42 type:1 duration:v37];
          v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v44 = (void *)MEMORY[0x1E4F28C58];
          v113[0] = v77;
          *(void *)buf = @"semaphore wait timeout";
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v113 count:1];
          v46 = [v44 errorWithDomain:v76 code:15 userInfo:v45];

          if (v46)
          {
            id v47 = v46;

            char v48 = 0;
          }
          else
          {
LABEL_25:
            id v47 = 0;
            char v48 = 1;
          }

          id v49 = v47;
          if ((v48 & 1) == 0) {
            objc_storeStrong(v93 + 5, v47);
          }
          if (v93[5])
          {
            v50 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v62 = (id)objc_claimAutoreleasedReturnValue();
              v63 = [v11 firstObject];
              v64 = [v63 mapItem];
              *(_DWORD *)buf = v75;
              *(void *)&uint8_t buf[4] = v62;
              __int16 v110 = 2112;
              v111 = v64;
              _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "%@, Failed to fetch LOI with mapItem, %@", buf, 0x16u);
            }
LABEL_32:
            id v24 = 0;
            char v51 = 0;
            int v52 = 1;
          }
          else
          {
            v53 = self->_distanceCalculator;
            v54 = [*((id *)v99 + 5) location];
            v55 = [v54 location];
            id v87 = 0;
            [(RTDistanceCalculator *)v53 distanceFromLocation:v55 toLocation:v83 error:&v87];
            double v57 = v56;
            id v24 = v87;

            if (v24)
            {
              v58 = (void *)MEMORY[0x1E4F28C58];
              v59 = [v24 userInfo];
              v60 = [v58 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:1 userInfo:v59];

              if (a5) {
                *a5 = v60;
              }

              char v51 = 0;
              int v52 = 0;
            }
            else
            {
              [(RTInferredMapItemFuserParameters *)self->_parameters distanceThreshold];
              if (v57 > v61) {
                goto LABEL_32;
              }
              id v24 = 0;
              int v52 = 0;
              char v51 = 1;
            }
          }

          _Block_object_dispose(&v92, 8);
          _Block_object_dispose(v98, 8);

          if (v51) {
            goto LABEL_15;
          }

          if (!v52) {
            goto LABEL_57;
          }
        }
LABEL_17:
        ++v10;
      }
      while (v86 != v10);
      uint64_t v65 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
      uint64_t v86 = v65;
    }
    while (v65);
  }

  v66 = v84;
  id v67 = v84;
LABEL_58:

LABEL_59:

  return v67;
}

void __67__RTInferredMapItemFuser_filterCandidates_referenceLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)snapToBestKnownPlaceType:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v26;
    double v11 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v13 secondObject];
        uint64_t v15 = [v14 unsignedIntegerValue];

        if (v15)
        {
          v16 = [v13 firstObject];
          [v16 confidence];
          double v18 = v17;

          if (v18 > v11)
          {
            v19 = [v13 firstObject];
            [v19 confidence];
            double v11 = v20;

            id v21 = v13;
            uint64_t v9 = v21;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v8);
    if (v9)
    {
      v30 = v9;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    }
    else
    {
LABEL_14:
      id v22 = v6;
    }
  }
  else
  {
    double v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"candidates");
      id v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
    }
  }

  return v22;
}

- (id)snapToBestAOICandidate:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v28;
    double v11 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = [v13 firstObject];
        uint64_t v15 = [v14 mapItem];
        v16 = [v15 extendedAttributes];
        uint64_t v17 = [v16 wifiFingerprintLabelType];

        if (v17 == 2)
        {
          double v18 = [v13 firstObject];
          [v18 confidence];
          double v20 = v19;

          if (v20 > v11)
          {
            id v21 = v13;

            id v22 = [v21 firstObject];
            [v22 confidence];
            double v11 = v23;

            uint64_t v9 = v21;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v8);
    if (v9)
    {
      uint64_t v32 = v9;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    }
    else
    {
LABEL_14:
      id v24 = v6;
    }
  }
  else
  {
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"candidates");
      id v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v24 = 0;
    }
  }

  return v24;
}

- (id)filterLearnedPlaceCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a5)
    {
      v39 = @"candidates";
LABEL_26:
      _RTErrorInvalidParameterCreate((uint64_t)v39);
      id v41 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_30:
    id v41 = 0;
    goto LABEL_37;
  }
  if (!v8)
  {
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a5)
    {
      v39 = @"referenceLocation";
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  v46 = a5;
  id v49 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v47 = v7;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v58 count:16];
  char v48 = v10;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v53;
    double v16 = -1.0;
    double v17 = 1.79769313e308;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v53 != v15) {
          objc_enumerationMutation(v11);
        }
        double v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        double v20 = [v19 firstObject];
        __int16 v21 = [v20 source];

        if ((v21 & 0x2000) != 0)
        {
          distanceCalculator = self->_distanceCalculator;
          double v23 = [v19 firstObject];
          id v24 = [v23 mapItem];
          long long v25 = [v24 location];
          id v51 = 0;
          [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v25 toLocation:v49 error:&v51];
          double v27 = v26;
          id v28 = v51;

          if (v28)
          {
            v42 = (void *)MEMORY[0x1E4F28C58];
            v43 = [v28 userInfo];
            v44 = [v42 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:1 userInfo:v43];

            if (v46) {
              id *v46 = v44;
            }

            id v41 = 0;
            goto LABEL_34;
          }
          long long v29 = [v19 firstObject];
          [v29 confidence];
          double v31 = v30;

          uint64_t v32 = [v19 firstObject];
          [v32 confidence];
          double v34 = v33;

          uint64_t v10 = v48;
          if (v31 > v16 || v34 == v16 && v27 < v17)
          {
            v35 = [v19 firstObject];
            [v35 confidence];
            double v16 = v36;

            id v37 = v19;
            double v17 = v27;
            uint64_t v14 = v37;
          }
        }
        else
        {
          [v10 addObject:v19];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  if ([v10 count])
  {
    id v41 = v10;
LABEL_34:
    id v7 = v47;
    uint64_t v9 = v49;
  }
  else
  {
    uint64_t v9 = v49;
    if (!v14)
    {
      id v41 = (id)MEMORY[0x1E4F1CBF0];
      id v7 = v47;
      goto LABEL_36;
    }
    double v57 = v14;
    id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    id v7 = v47;
  }

LABEL_36:
LABEL_37:

  return v41;
}

- (id)filterUnknownLearnedPlaceCandidates:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_114];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

BOOL __62__RTInferredMapItemFuser_filterUnknownLearnedPlaceCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 firstObject];
  if (([v3 source] & 0x2000) != 0)
  {
    id v5 = [v2 secondObject];
    BOOL v4 = [v5 unsignedIntegerValue] != 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)preprocessCandidates:(id)a3 referenceLocation:(id)a4 snapToBestKnownPlaceAndAoi:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = v12;
  if (!v11)
  {
    double v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"candidates");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = 0;
LABEL_15:
      id v18 = 0;
      *a6 = v20;
      goto LABEL_47;
    }
    id v11 = 0;
LABEL_22:
    id v18 = 0;
    goto LABEL_47;
  }
  if (!v12)
  {
    __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"referenceLocation");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  if ((unint64_t)[v11 count] > 1)
  {
    id v56 = 0;
    id v22 = [(RTInferredMapItemFuser *)self filterCandidates:v11 referenceLocation:v13 error:&v56];
    id v23 = v56;

    if (v23)
    {
      id v24 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v36 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v58 = v36;
        __int16 v59 = 2112;
        id v60 = v23;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, filter candidate error, %@", buf, 0x16u);
      }
      id v18 = 0;
      if (a6) {
        *a6 = v23;
      }
      goto LABEL_27;
    }
    if ((unint64_t)[v22 count] <= 1)
    {
      long long v25 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        double v26 = NSStringFromSelector(a2);
        double v27 = [v22 firstObject];
        id v28 = [v27 firstObject];
        *(_DWORD *)buf = 138412546;
        v58 = v26;
        __int16 v59 = 2112;
        id v60 = v28;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, exiting after filtering based on location, fused map item, %@", buf, 0x16u);
      }
      id v29 = v22;
LABEL_40:
      id v11 = v29;
      id v18 = v29;
      goto LABEL_46;
    }
    if (v7)
    {
      id v55 = 0;
      id v11 = [(RTInferredMapItemFuser *)self snapToBestKnownPlaceType:v22 error:&v55];
      id v30 = v55;

      if (v30)
      {
        double v31 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          char v48 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v58 = v48;
          __int16 v59 = 2112;
          id v60 = v30;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, snap to home work error, %@", buf, 0x16u);
        }
        id v18 = 0;
        if (a6) {
          *a6 = v30;
        }
LABEL_45:

        goto LABEL_46;
      }
      if ((unint64_t)[v11 count] <= 1)
      {
        id v37 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = NSStringFromSelector(a2);
          v39 = [v11 firstObject];
          v40 = [v39 firstObject];
          *(_DWORD *)buf = 138412546;
          v58 = v38;
          __int16 v59 = 2112;
          id v60 = v40;
          _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, fused early, fused map item, %@", buf, 0x16u);
        }
        id v18 = v11;
        goto LABEL_45;
      }
      id v54 = 0;
      id v22 = [(RTInferredMapItemFuser *)self snapToBestAOICandidate:v11 error:&v54];
      id v42 = v54;

      if (v42)
      {
        v43 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v51 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v58 = v51;
          __int16 v59 = 2112;
          id v60 = v42;
          _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        id v18 = 0;
        if (a6) {
          *a6 = v42;
        }
LABEL_61:

LABEL_27:
        id v11 = v22;
LABEL_46:

        goto LABEL_47;
      }
      if ((unint64_t)[v22 count] <= 1)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          v44 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            v45 = NSStringFromSelector(a2);
            v46 = [v22 firstObject];
            id v47 = [v46 firstObject];
            *(_DWORD *)buf = 138412546;
            v58 = v45;
            __int16 v59 = 2112;
            id v60 = v47;
            _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, fused early, fused map item, %@", buf, 0x16u);
          }
        }
        id v18 = v22;
        goto LABEL_61;
      }
      id v53 = 0;
      id v11 = [(RTInferredMapItemFuser *)self filterLearnedPlaceCandidates:v22 referenceLocation:v13 error:&v53];
      id v49 = v53;

      if (v49)
      {
        v50 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          long long v52 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v58 = v52;
          __int16 v59 = 2112;
          id v60 = v49;
          _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "%@, filter learned place error, %@", buf, 0x16u);
        }
        if (a6) {
          *a6 = v49;
        }

        id v18 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      id v11 = [(RTInferredMapItemFuser *)self filterUnknownLearnedPlaceCandidates:v22];
    }
    if ((unint64_t)[v11 count] <= 1)
    {
      uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        double v33 = NSStringFromSelector(a2);
        double v34 = [v11 firstObject];
        v35 = [v34 firstObject];
        *(_DWORD *)buf = 138412546;
        v58 = v33;
        __int16 v59 = 2112;
        id v60 = v35;
        _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, exiting after filtering learned place, fused map item, %@", buf, 0x16u);
      }
    }
    id v29 = v11;
    goto LABEL_40;
  }
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = NSStringFromSelector(a2);
    double v16 = [v11 firstObject];
    double v17 = [v16 firstObject];
    *(_DWORD *)buf = 138412546;
    v58 = v15;
    __int16 v59 = 2112;
    id v60 = v17;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, exiting before filtering based on location, fused map item, %@", buf, 0x16u);
  }
  id v11 = v11;
  id v18 = v11;
LABEL_47:

  return v18;
}

- (id)populateMapItemSourceEntriesForDedupedInferredMapItems:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    __int16 v21 = self;
    BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = [v12 mapItem];
          uint64_t v14 = [v13 identifier];

          uint64_t v15 = [v7 objectForKeyedSubscript:v14];

          if (!v15) {
            [v7 setObject:&unk_1F3452478 forKeyedSubscript:v14];
          }
          double v16 = NSNumber;
          double v17 = [v7 objectForKeyedSubscript:v14];
          id v18 = [v16 numberWithUnsignedInteger:objc_msgSend(v12, "source") | objc_msgSend(v17, "unsignedIntegerValue")];
          [v7 setObject:v18 forKeyedSubscript:v14];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    [v7 setObject:&unk_1F3452478 forKeyedSubscript:v21->_placeholderUUID];
    id v6 = v22;
  }
  else
  {
    double v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dedupedInferredMapItems", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"dedupedInferredMapItems");
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)partitionDedupedInferredMapItems:(id)a3 intoNonAoiDedupedInferredMapItems:(id *)a4 aoiDedupedInferredMapItems:(id *)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dedupedInferredMapItems", buf, 2u);
    }

    if (!a6) {
      goto LABEL_28;
    }
    long long v26 = @"dedupedInferredMapItems";
    goto LABEL_27;
  }
  if (!a4)
  {
    long long v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outNonAoiDedupedInferredMapItems", buf, 2u);
    }

    if (!a6) {
      goto LABEL_28;
    }
    long long v26 = @"outNonAoiDedupedInferredMapItems";
LABEL_27:
    _RTErrorInvalidParameterCreate((uint64_t)v26);
    BOOL v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (!a5)
  {
    id v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAoiDedupedInferredMapItems", buf, 2u);
    }

    if (a6)
    {
      long long v26 = @"outAoiDedupedInferredMapItems";
      goto LABEL_27;
    }
LABEL_28:
    BOOL v24 = 0;
    goto LABEL_29;
  }
  uint64_t v30 = a4;
  double v31 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v32 = v9;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v18 = [v17 mapItem];
        double v19 = [v18 extendedAttributes];
        uint64_t v20 = [v19 wifiFingerprintLabelType];

        if (v20 == 2) {
          __int16 v21 = v10;
        }
        else {
          __int16 v21 = v11;
        }
        [v21 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }

  id v22 = v11;
  id *v30 = v22;
  id v23 = v10;
  id *v31 = v23;

  BOOL v24 = 1;
  id v9 = v32;
LABEL_29:

  return v24;
}

- (BOOL)initializeEntriesForNonAoiDedupedInferredMapItems:(id)a3 aoiDedupedInferredMapItems:(id)a4 nonAoiUUIDToLogProbMap:(id *)a5 aoiUUIDToProbArrayMap:(id *)a6 error:(id *)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = v13;
  if (!v12)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiDedupedInferredMapItems", buf, 2u);
    }

    if (!a7) {
      goto LABEL_41;
    }
    v44 = @"nonAoiDedupedInferredMapItems";
    goto LABEL_40;
  }
  if (!v13)
  {
    v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiDedupedInferredMapItems", buf, 2u);
    }

    if (!a7) {
      goto LABEL_41;
    }
    v44 = @"aoiDedupedInferredMapItems";
    goto LABEL_40;
  }
  if (!a5)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outNonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (!a7) {
      goto LABEL_41;
    }
    v44 = @"outNonAoiUUIDToLogProbMap";
LABEL_40:
    _RTErrorInvalidParameterCreate((uint64_t)v44);
    BOOL v42 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if (!a6)
  {
    id v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAoiUUIDToProbArrayMap", buf, 2u);
    }

    if (a7)
    {
      v44 = @"outAoiUUIDToProbArrayMap";
      goto LABEL_40;
    }
LABEL_41:
    BOOL v42 = 0;
    goto LABEL_42;
  }
  id v49 = self;
  v50 = a5;
  id v51 = a6;
  id v53 = v13;
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v52 = v12;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(v16);
        }
        __int16 v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v22 = [v21 mapItem];
        id v23 = [v22 identifier];
        BOOL v24 = [v15 objectForKeyedSubscript:v23];

        if (!v24)
        {
          long long v25 = [v21 mapItem];
          long long v26 = [v25 identifier];
          [v15 setObject:&unk_1F3452490 forKeyedSubscript:v26];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v18);
  }

  [v15 setObject:&unk_1F3452490 forKeyedSubscript:v49->_placeholderUUID];
  long long v27 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v28 = v53;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v55 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        long long v34 = [v33 mapItem];
        long long v35 = [v34 identifier];
        long long v36 = [v27 objectForKeyedSubscript:v35];

        if (!v36)
        {
          id v37 = [MEMORY[0x1E4F1CA48] array];
          v38 = [v33 mapItem];
          uint64_t v39 = [v38 identifier];
          [v27 setObject:v37 forKeyedSubscript:v39];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v30);
  }

  id v40 = v15;
  id *v50 = v40;
  id v41 = v27;
  *id v51 = v41;

  BOOL v42 = 1;
  id v12 = v52;
  uint64_t v14 = v53;
LABEL_42:

  return v42;
}

- (BOOL)updateAoiUUIDToProbArrayMap:(id)a3 aoiDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  id v41 = v8;
  if (!v8)
  {
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiUUIDToProbArrayMap", buf, 2u);
    }

    if (a5)
    {
      uint64_t v30 = @"aoiUUIDToProbArrayMap";
LABEL_20:
      _RTErrorInvalidParameterCreate((uint64_t)v30);
      char v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_21:
    char v17 = 0;
    goto LABEL_27;
  }
  if (!v9)
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      uint64_t v30 = @"aoiDedupedInferredMapItems";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v11 = [[_RTMap alloc] initWithInput:v9];
  id v12 = [(_RTMap *)v11 withBlock:&__block_literal_global_65];

  id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = [v8 allKeys];
  id v16 = [v14 setWithArray:v15];

  char v17 = [v13 isEqualToSet:v16];
  if (v17)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v37 = v16;
      v38 = v13;
      uint64_t v39 = v12;
      id v40 = v10;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          BOOL v24 = [v23 mapItem:v37, v38];
          long long v25 = [v24 identifier];
          long long v26 = [v41 objectForKeyedSubscript:v25];
          long long v27 = NSNumber;
          [v23 confidence];
          id v28 = [v27 numberWithDouble:];
          [v26 addObject:v28];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v20);
      id v12 = v39;
      uint64_t v10 = v40;
      id v16 = v37;
      id v13 = v38;
    }
  }
  else
  {
    id v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"uniqueAoiUUIDsFromArray != uniqueAoiUUIDsFromMap";
    long long v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    id v18 = [v32 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:7 userInfo:v33];

    long long v34 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      long long v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      char v48 = v36;
      __int16 v49 = 2112;
      id v50 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a5) {
      *a5 = v18;
    }
  }

LABEL_27:
  return v17;
}

id __87__RTInferredMapItemFuser_updateAoiUUIDToProbArrayMap_aoiDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mapItem];
  v3 = [v2 identifier];

  return v3;
}

- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 bluePOIDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10)
    {
      id v12 = [v9 objectForKeyedSubscript:self->_placeholderUUID];

      if (v12)
      {
        v93 = self;
        id v13 = [[_RTMap alloc] initWithInput:v11];
        uint64_t v14 = [(_RTMap *)v13 withBlock:&__block_literal_global_81_0];

        uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
        id v16 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v94 = v9;
        char v17 = [v9 allKeys];
        id v18 = [v16 setWithArray:v17];

        if ([v15 isSubsetOfSet:v18])
        {
          v91 = v15;
          uint64_t v92 = v18;
          v90 = v14;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v19 = v11;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v107 objects:v116 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v108;
            double v23 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v108 != v22) {
                  objc_enumerationMutation(v19);
                }
                [*(id *)(*((void *)&v107 + 1) + 8 * i) confidence];
                double v23 = v23 + v25;
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v107 objects:v116 count:16];
            }
            while (v21);

            if (v23 > 1.0)
            {
              long long v26 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v114 = *MEMORY[0x1E4F28568];
              v115 = @"Blue POI candidates total confidence is > 1.0";
              long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
              id v28 = [v26 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:6 userInfo:v27];

              uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                id v87 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                v120 = v87;
                __int16 v121 = 2112;
                id v122 = v28;
                _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
              }
              uint64_t v14 = v90;
              id v18 = v92;
              if (!a5)
              {
LABEL_16:
                BOOL v30 = 0;
LABEL_66:

                id v9 = v94;
                goto LABEL_67;
              }
LABEL_35:
              id v28 = v28;
              BOOL v30 = 0;
              *a5 = v28;
              goto LABEL_66;
            }
          }
          else
          {
          }
          id v28 = [MEMORY[0x1E4F1CA80] setWithSet:v92];
          [v28 minusSet:v15];
          if ([v19 count])
          {
            v88 = v28;
            v89 = v11;
            id v41 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v15 count]];
            long long v103 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v42 = v19;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v103 objects:v113 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v104;
              do
              {
                for (uint64_t j = 0; j != v44; ++j)
                {
                  if (*(void *)v104 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  id v47 = *(void **)(*((void *)&v103 + 1) + 8 * j);
                  char v48 = [v47 mapItem];
                  __int16 v49 = [v48 identifier];

                  id v50 = [v41 objectForKeyedSubscript:v49];

                  if (!v50) {
                    [v41 setObject:&unk_1F3453E68 forKeyedSubscript:v49];
                  }
                  uint64_t v51 = NSNumber;
                  id v52 = [v41 objectForKeyedSubscript:v49];
                  [v52 doubleValue];
                  double v54 = v53;
                  [v47 confidence];
                  long long v56 = [v51 numberWithDouble:v54 + v55];
                  [v41 setObject:v56 forKeyedSubscript:v49];
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v103 objects:v113 count:16];
              }
              while (v44);
            }

            long long v101 = 0u;
            long long v102 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            id v57 = v41;
            uint64_t v58 = [v57 countByEnumeratingWithState:&v99 objects:v112 count:16];
            if (v58)
            {
              uint64_t v59 = v58;
              uint64_t v60 = *(void *)v100;
              do
              {
                for (uint64_t k = 0; k != v59; ++k)
                {
                  if (*(void *)v100 != v60) {
                    objc_enumerationMutation(v57);
                  }
                  uint64_t v62 = *(void *)(*((void *)&v99 + 1) + 8 * k);
                  v63 = NSNumber;
                  v64 = [v94 objectForKeyedSubscript:v62];
                  [v64 doubleValue];
                  double v66 = v65;
                  id v67 = [v57 objectForKeyedSubscript:v62];
                  [v67 doubleValue];
                  RTCommonSafeLog();
                  id v69 = [v63 numberWithDouble:v66 + v68];
                  [v94 setObject:v69 forKeyedSubscript:v62];
                }
                uint64_t v59 = [v57 countByEnumeratingWithState:&v99 objects:v112 count:16];
              }
              while (v59);
            }

            [v88 count];
            [(RTInferredMapItemFuserParameters *)v93->_parameters placeholderMultiplier];
            long long v95 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            id v28 = v88;
            uint64_t v70 = [v28 countByEnumeratingWithState:&v95 objects:v111 count:16];
            if (v70)
            {
              uint64_t v71 = v70;
              uint64_t v72 = *(void *)v96;
              do
              {
                for (uint64_t m = 0; m != v71; ++m)
                {
                  if (*(void *)v96 != v72) {
                    objc_enumerationMutation(v28);
                  }
                  v74 = *(void **)(*((void *)&v95 + 1) + 8 * m);
                  int v75 = [v74 isEqual:v93->_placeholderUUID];
                  uint64_t v76 = NSNumber;
                  uint64_t v77 = [v94 objectForKeyedSubscript:v74];
                  [v77 doubleValue];
                  double v79 = v78;
                  RTCommonSafeLog();
                  double v81 = v79 + v80;
                  if (v75)
                  {
                    [(RTInferredMapItemFuserParameters *)v93->_parameters placeholderMultiplier];
                    RTCommonSafeLog();
                    double v81 = v81 + v82;
                  }
                  v83 = [v76 numberWithDouble:v81];
                  [v94 setObject:v83 forKeyedSubscript:v74];
                }
                uint64_t v71 = [v28 countByEnumeratingWithState:&v95 objects:v111 count:16];
              }
              while (v71);
            }

            BOOL v30 = 1;
            id v11 = v89;
            uint64_t v14 = v90;
            uint64_t v15 = v91;
          }
          else
          {
            BOOL v30 = 1;
            uint64_t v14 = v90;
          }
          id v18 = v92;
          goto LABEL_66;
        }
        v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v117 = *MEMORY[0x1E4F28568];
        v118 = @"uniqueBluePOIUUIDs is not a subset of uniqueNonAoiUUIDsFromMap";
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
        id v28 = [v38 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:8 userInfo:v39];

        id v40 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          uint64_t v86 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v120 = v86;
          __int16 v121 = 2112;
          id v122 = v28;
          _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        if (!a5) {
          goto LABEL_16;
        }
        goto LABEL_35;
      }
      long long v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v123 = *MEMORY[0x1E4F28568];
      v124[0] = @"nonAoiUUIDToLogProbMap must contain the placeholder UUID";
      long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:&v123 count:1];
      long long v36 = [v34 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:9 userInfo:v35];

      id v37 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v85 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v120 = v85;
        __int16 v121 = 2112;
        id v122 = v36;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      if (a5) {
        *a5 = v36;
      }

      goto LABEL_31;
    }
    long long v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bluePOIDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      id v32 = @"bluePOIDedupedInferredMapItems";
      goto LABEL_25;
    }
LABEL_31:
    BOOL v30 = 0;
    goto LABEL_67;
  }
  uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
  }

  if (!a5) {
    goto LABEL_31;
  }
  id v32 = @"nonAoiUUIDToLogProbMap";
LABEL_25:
  _RTErrorInvalidParameterCreate((uint64_t)v32);
  BOOL v30 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

  return v30;
}

id __92__RTInferredMapItemFuser_updateNonAoiUUIDToLogProbMap_bluePOIDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mapItem];
  v3 = [v2 identifier];

  return v3;
}

- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 nonBluePOIDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  v108[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v59 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (!a5) {
      goto LABEL_41;
    }
    uint64_t v60 = @"nonAoiUUIDToLogProbMap";
    goto LABEL_35;
  }
  if (!v10)
  {
    long long v61 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonBluePOIDedupedInferredMapItems", buf, 2u);
    }

    if (!a5) {
      goto LABEL_41;
    }
    uint64_t v60 = @"nonBluePOIDedupedInferredMapItems";
LABEL_35:
    _RTErrorInvalidParameterCreate((uint64_t)v60);
    BOOL v58 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  id v12 = [v9 objectForKeyedSubscript:self->_placeholderUUID];

  if (!v12)
  {
    uint64_t v62 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v107 = *MEMORY[0x1E4F28568];
    v108[0] = @"nonAoiUUIDToLogProbMap must contain the placeholder UUID";
    v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:&v107 count:1];
    v64 = [v62 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:9 userInfo:v63];

    double v65 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v74 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v104 = v74;
      __int16 v105 = 2112;
      id v106 = v64;
      _os_log_error_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a5) {
      *a5 = v64;
    }

LABEL_41:
    BOOL v58 = 0;
    goto LABEL_54;
  }
  id v13 = self;
  uint64_t v14 = [[_RTMap alloc] initWithInput:v11];
  uint64_t v15 = [(_RTMap *)v14 withBlock:&__block_literal_global_93];

  id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
  char v17 = (void *)MEMORY[0x1E4F1CAD0];
  id v18 = [v9 allKeys];
  id v19 = [v17 setWithArray:v18];

  if ([v16 isSubsetOfSet:v19])
  {
    uint64_t v20 = [v9 count];
    [(RTInferredMapItemFuserParameters *)v13->_parameters placeholderMultiplier];
    double v22 = v21;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id obj = v11;
    uint64_t v85 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
    if (v85)
    {
      double v79 = v19;
      double v80 = v16;
      aSelector = a2;
      double v78 = a5;
      double v81 = v15;
      double v82 = v11;
      uint64_t v84 = *(void *)v94;
      double v23 = v22 + (double)(unint64_t)(v20 - 1) + -1.0;
      unint64_t v24 = 0x1E4F28000uLL;
      double v25 = v13;
      while (2)
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v94 != v84) {
            objc_enumerationMutation(obj);
          }
          long long v27 = *(void **)(*((void *)&v93 + 1) + 8 * v26);
          id v28 = [v27 mapItem:aSelector];
          uint64_t v29 = [v28 identifier];

          [v27 confidence];
          if ((1.0 - v30) / v23 < 0.0)
          {
            id v69 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v98 = *MEMORY[0x1E4F28568];
            long long v99 = @"remainder < 0.0";
            uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
            uint64_t v71 = [v69 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:6 userInfo:v70];

            uint64_t v72 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              uint64_t v76 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412546;
              long long v104 = v76;
              __int16 v105 = 2112;
              id v106 = v71;
              _os_log_error_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
            }
            if (v78) {
              *double v78 = v71;
            }

            BOOL v58 = 0;
            goto LABEL_51;
          }
          uint64_t v86 = v26;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v88 = [v9 allKeys];
          uint64_t v31 = [v88 countByEnumeratingWithState:&v89 objects:v97 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v90;
            do
            {
              uint64_t v34 = 0;
              uint64_t v87 = v32;
              do
              {
                if (*(void *)v90 != v33) {
                  objc_enumerationMutation(v88);
                }
                long long v35 = *(void **)(*((void *)&v89 + 1) + 8 * v34);
                if ([v35 isEqual:v29])
                {
                  long long v36 = *(void **)(v24 + 3792);
                  id v37 = [v9 objectForKeyedSubscript:v35];
                  [v37 doubleValue];
                  double v39 = v38;
                  RTCommonSafeLog();
                  id v41 = [v36 numberWithDouble:v39 + v40];
                }
                else
                {
                  uint64_t v42 = v33;
                  uint64_t v43 = v29;
                  int v44 = [v35 isEqual:v25->_placeholderUUID];
                  uint64_t v45 = v9;
                  v46 = v25;
                  int v47 = v44;
                  unint64_t v48 = v24;
                  __int16 v49 = *(void **)(v24 + 3792);
                  id v50 = v45;
                  id v37 = [v45 objectForKeyedSubscript:v35];
                  [v37 doubleValue];
                  double v52 = v51;
                  RTCommonSafeLog();
                  double v54 = v52 + v53;
                  if (v47)
                  {
                    [(RTInferredMapItemFuserParameters *)v46->_parameters placeholderMultiplier];
                    RTCommonSafeLog();
                    double v56 = v54 + v55;
                    id v57 = v49;
                  }
                  else
                  {
                    id v57 = v49;
                    double v56 = v54;
                  }
                  id v41 = [v57 numberWithDouble:v56];
                  double v25 = v46;
                  id v9 = v50;
                  unint64_t v24 = v48;
                  uint64_t v29 = v43;
                  uint64_t v33 = v42;
                  uint64_t v32 = v87;
                }
                [v9 setObject:v41 forKeyedSubscript:v35];

                ++v34;
              }
              while (v32 != v34);
              uint64_t v32 = [v88 countByEnumeratingWithState:&v89 objects:v97 count:16];
            }
            while (v32);
          }

          uint64_t v26 = v86 + 1;
        }
        while (v86 + 1 != v85);
        BOOL v58 = 1;
        uint64_t v85 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
        if (v85) {
          continue;
        }
        break;
      }
LABEL_51:
      uint64_t v15 = v81;
      id v11 = v82;
      id v19 = v79;
      id v16 = v80;
    }
    else
    {
      BOOL v58 = 1;
    }
  }
  else
  {
    double v66 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v101 = *MEMORY[0x1E4F28568];
    long long v102 = @"uniqueNonBluePOIUUIDs is not a subset of uniqueNonAoiUUIDs";
    id v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    id obj = [v66 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:8 userInfo:v67];

    double v68 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      int v75 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v104 = v75;
      __int16 v105 = 2112;
      id v106 = obj;
      _os_log_error_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    BOOL v58 = 0;
    if (a5) {
      *a5 = obj;
    }
  }

LABEL_54:
  return v58;
}

id __95__RTInferredMapItemFuser_updateNonAoiUUIDToLogProbMap_nonBluePOIDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mapItem];
  v3 = [v2 identifier];

  return v3;
}

- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 nonAoiDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (a5)
    {
      uint64_t v20 = @"nonAoiUUIDToLogProbMap";
LABEL_13:
      _RTErrorInvalidParameterCreate((uint64_t)v20);
      BOOL v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_14:
    BOOL v22 = 0;
    goto LABEL_41;
  }
  if (!v10)
  {
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      uint64_t v20 = @"nonAoiDedupedInferredMapItems";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  context = (void *)MEMORY[0x1E016D870]();
  id v12 = [[_RTMap alloc] initWithInput:v11];
  id v13 = [(_RTMap *)v12 withBlock:&__block_literal_global_101_0];

  uint64_t v14 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
  [v14 addObject:self->_placeholderUUID];
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = [v9 allKeys];
  char v17 = [v15 setWithArray:v16];

  if ([v14 isEqualToSet:v17])
  {
    id v18 = 0;
  }
  else
  {
    double v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56[0] = @"uniqueNonAoiUUIDsFromArray is not equal to uniqueNonAoiUUIDsFromMap";
    unint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    id v18 = [v23 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:7 userInfo:v24];

    double v25 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v52 = v41;
      __int16 v53 = 2112;
      double v54 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }

  if (v18)
  {
    BOOL v22 = 0;
    if (a5) {
      *a5 = v18;
    }
  }
  else
  {
    contexta = self;
    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v28 = v11;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if ([v33 source] == 0x4000) {
            uint64_t v34 = v26;
          }
          else {
            uint64_t v34 = v27;
          }
          [v34 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v30);
    }

    id v45 = 0;
    BOOL v35 = [(RTInferredMapItemFuser *)contexta updateNonAoiUUIDToLogProbMap:v9 bluePOIDedupedInferredMapItems:v26 error:&v45];
    id v36 = v45;
    id v37 = v36;
    if (v35)
    {
      id v44 = 0;
      BOOL v22 = [(RTInferredMapItemFuser *)contexta updateNonAoiUUIDToLogProbMap:v9 nonBluePOIDedupedInferredMapItems:v27 error:&v44];
      id v38 = v44;
      double v39 = v38;
      if (a5 && !v22) {
        *a5 = v38;
      }
    }
    else
    {
      BOOL v22 = 0;
      if (a5) {
        *a5 = v36;
      }
    }
    id v18 = 0;
  }
LABEL_41:

  return v22;
}

id __91__RTInferredMapItemFuser_updateNonAoiUUIDToLogProbMap_nonAoiDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mapItem];
  v3 = [v2 identifier];

  return v3;
}

- (id)subtractMaxLogarithmFromLogProbMap:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v5 count]];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      double v12 = -1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v15 = [v8 objectForKeyedSubscript:v14];
          [v15 doubleValue];
          double v17 = v16;

          if (v17 > v12)
          {
            id v18 = [v8 objectForKeyedSubscript:v14];
            [v18 doubleValue];
            double v12 = v19;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v10);
    }
    else
    {
      double v12 = -1.79769313e308;
    }
    uint64_t v32 = v6;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v21 = [v8 allKeys];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          long long v27 = NSNumber;
          id v28 = [v8 objectForKeyedSubscript:v26];
          [v28 doubleValue];
          uint64_t v30 = [v27 numberWithDouble:v29 - v12];
          [v7 setObject:v30 forKeyedSubscript:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v23);
    }

    id v6 = v32;
  }
  else
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: logProbMap", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"logProbMap");
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (double)logSumExpOfLogProbMap:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      long double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          double v12 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v12 doubleValue];
          long double v10 = v10 + exp(v13);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      long double v10 = 0.0;
    }
    double v15 = log(v10);
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: logProbMap", buf, 2u);
    }

    double v15 = 0.0;
    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"logProbMap");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v15;
}

- (id)normalizeNonAoiUUIDToLogProbMap:(id)a3 aoiUUIDToProbArrayMap:(id)a4 error:(id *)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10)
    {
      id v77 = 0;
      double v12 = [(RTInferredMapItemFuser *)self subtractMaxLogarithmFromLogProbMap:v9 error:&v77];
      id v13 = v77;

      if (v13)
      {
        uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          double v56 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v84 = v56;
          __int16 v85 = 2112;
          id v86 = v13;
          _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        id v15 = 0;
        if (a5) {
          *a5 = v13;
        }
      }
      else
      {
        id v76 = 0;
        [(RTInferredMapItemFuser *)self logSumExpOfLogProbMap:v12 error:&v76];
        double v19 = v18;
        id v20 = v76;
        if (v20)
        {
          double v21 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v57 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            uint64_t v84 = v57;
            __int16 v85 = 2112;
            id v86 = v20;
            _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          id v15 = 0;
          if (a5) {
            *a5 = v20;
          }
        }
        else
        {
          aSelector = a2;
          uint64_t v60 = a5;
          uint64_t v62 = v11;
          uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v11 count] + [v12 count]];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v61 = v12;
          id v23 = v12;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v82 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v73 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void *)(*((void *)&v72 + 1) + 8 * i);
                double v29 = NSNumber;
                uint64_t v30 = [v23 objectForKeyedSubscript:v28];
                [v30 doubleValue];
                uint64_t v32 = [v29 numberWithDouble:(double)exp(v31 - v19)];
                [v22 setObject:v32 forKeyedSubscript:v28];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v72 objects:v82 count:16];
            }
            while (v25);
          }

          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v33 = v62;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v81 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v63 = *(void *)v69;
            while (2)
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v69 != v63) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v37 = *(void *)(*((void *)&v68 + 1) + 8 * j);
                long long v38 = [v33 objectForKeyedSubscript:v37];
                uint64_t v39 = [v38 count];

                if (!v39)
                {
                  id v50 = [NSString stringWithFormat:@"entry %@ in aoiUUIDToProbArrayMap has count 0", v37];
                  double v51 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v79 = *MEMORY[0x1E4F28568];
                  double v80 = v50;
                  double v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
                  __int16 v53 = [v51 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:0 userInfo:v52];

                  double v54 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    BOOL v58 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138412546;
                    uint64_t v84 = v58;
                    __int16 v85 = 2112;
                    id v86 = v53;
                    _os_log_error_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
                  }
                  double v12 = v61;
                  uint64_t v11 = v62;
                  if (v60) {
                    id *v60 = v53;
                  }

                  id v15 = 0;
                  goto LABEL_56;
                }
                long long v66 = 0u;
                long long v67 = 0u;
                long long v64 = 0u;
                long long v65 = 0u;
                long long v40 = [v33 objectForKeyedSubscript:v37];
                uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:v78 count:16];
                if (v41)
                {
                  uint64_t v42 = v41;
                  uint64_t v43 = *(void *)v65;
                  double v44 = 0.0;
                  do
                  {
                    for (uint64_t k = 0; k != v42; ++k)
                    {
                      if (*(void *)v65 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      [*(id *)(*((void *)&v64 + 1) + 8 * k) doubleValue];
                      double v44 = v44 + v46;
                    }
                    uint64_t v42 = [v40 countByEnumeratingWithState:&v64 objects:v78 count:16];
                  }
                  while (v42);
                }
                else
                {
                  double v44 = 0.0;
                }

                long long v47 = NSNumber;
                long long v48 = [v33 objectForKeyedSubscript:v37];
                long long v49 = [v47 numberWithDouble:v44 / (double)(unint64_t)[v48 count]];
                [v22 setObject:v49 forKeyedSubscript:v37];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v68 objects:v81 count:16];
              if (v35) {
                continue;
              }
              break;
            }
          }

          id v15 = v22;
          double v12 = v61;
          uint64_t v11 = v62;
LABEL_56:
          id v20 = 0;
        }
      }
    }
    else
    {
      long long v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiUUIDToProbArrayMap", buf, 2u);
      }

      if (a5)
      {
        _RTErrorInvalidParameterCreate(@"aoiUUIDToProbArrayMap");
        id v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = 0;
      }
      double v12 = v9;
    }
  }
  else
  {
    double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"nonAoiUUIDToLogProbMap");
      double v12 = 0;
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v12 = 0;
      id v15 = 0;
    }
  }

  return v15;
}

- (id)fusedInferredMapItemsFromUUIDToProbMap:(id)a3 inferredMapItemDeduperState:(id)a4 uuidToFusedMapItemSourceMap:(id)a5 referenceLocation:(id)a6 error:(id *)a7
{
  v96[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  long long v17 = v16;
  if (!v13)
  {
    id v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuidToProbMap", buf, 2u);
    }

    if (!a7) {
      goto LABEL_41;
    }
    double v46 = @"uuidToProbMap";
    goto LABEL_35;
  }
  if (!v14)
  {
    long long v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }

    if (!a7) {
      goto LABEL_41;
    }
    double v46 = @"inferredMapItemDeduperState";
    goto LABEL_35;
  }
  if (!v15)
  {
    long long v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuidToFusedMapItemSourceMap", buf, 2u);
    }

    if (!a7) {
      goto LABEL_41;
    }
    double v46 = @"uuidToFusedMapItemSourceMap";
    goto LABEL_35;
  }
  if (!v16)
  {
    long long v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (!a7) {
      goto LABEL_41;
    }
    double v46 = @"referenceLocation";
LABEL_35:
    _RTErrorInvalidParameterCreate((uint64_t)v46);
    double v44 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  double v18 = [v13 objectForKeyedSubscript:self->_placeholderUUID];

  if (!v18)
  {
    id v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v95 = *MEMORY[0x1E4F28568];
    v96[0] = @"uuidToProbMap must contain the placeholder UUID";
    double v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:&v95 count:1];
    double v52 = [v50 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:9 userInfo:v51];

    __int16 v53 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      long long v68 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v92 = v68;
      __int16 v93 = 2112;
      id v94 = v52;
      _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a7) {
      *a7 = v52;
    }

LABEL_41:
    double v44 = 0;
    goto LABEL_58;
  }
  aSelector = a2;
  double v19 = (void *)MEMORY[0x1E4F1CAD0];
  id v20 = [v13 allKeys];
  double v21 = [v19 setWithArray:v20];

  uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
  id v23 = [v15 allKeys];
  uint64_t v24 = [v22 setWithArray:v23];

  if (([v21 isEqualToSet:v24] & 1) == 0)
  {
    double v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v89 = *MEMORY[0x1E4F28568];
    long long v90 = @"probMapUUIDs != sourceMapUUIDs";
    uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    double v56 = [v54 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:7 userInfo:v55];

    id v57 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      long long v69 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412546;
      long long v92 = v69;
      __int16 v93 = 2112;
      id v94 = v56;
      _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a7)
    {
      id v58 = v56;
      double v44 = 0;
      *a7 = v58;
      id v25 = v58;
    }
    else
    {
      double v44 = 0;
      id v25 = v56;
    }
    goto LABEL_57;
  }
  id v76 = v24;
  long long v72 = a7;
  long long v73 = v21;
  long long v74 = v17;
  double v80 = v15;
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v13 count]];
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v75 = v13;
  id v26 = v13;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (!v27) {
    goto LABEL_18;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v83;
  double v78 = v26;
  uint64_t v79 = v25;
  while (2)
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v83 != v29) {
        objc_enumerationMutation(v26);
      }
      double v31 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      if (([v31 isEqual:self->_placeholderUUID] & 1) == 0)
      {
        id v81 = 0;
        uint64_t v32 = [v14 mapItemForDedupedUUID:v31 error:&v81];
        id v33 = v81;
        uint64_t v34 = v33;
        if (v33)
        {
          uint64_t v59 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v60 = [v33 userInfo];
          id v61 = [v59 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:5 userInfo:v60];

          uint64_t v62 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            long long v70 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            long long v92 = v70;
            __int16 v93 = 2112;
            id v94 = v61;
            _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          long long v17 = v74;
          id v13 = v75;
          id v15 = v80;
          uint64_t v63 = v72;
          double v21 = v73;
          if (!v72) {
            goto LABEL_56;
          }
        }
        else
        {
          uint64_t v35 = v28;
          id v36 = v14;
          uint64_t v37 = [RTFusedInferredMapItem alloc];
          long long v38 = [v26 objectForKeyedSubscript:v31];
          [v38 doubleValue];
          double v40 = v39;
          uint64_t v41 = [v80 objectForKeyedSubscript:v31];
          uint64_t v42 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v37, "initWithMapItem:confidence:source:", v32, [v41 unsignedIntegerValue], v40);

          uint64_t v43 = v32;
          if (v42)
          {
            id v25 = v79;
            [v79 addObject:v42];

            id v14 = v36;
            id v26 = v78;
            uint64_t v28 = v35;
            continue;
          }
          long long v64 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v86 = *MEMORY[0x1E4F28568];
          uint64_t v87 = @"fusedInferredMapItem was nil";
          long long v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          id v61 = [v64 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:4 userInfo:v65];

          long long v66 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            long long v71 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            long long v92 = v71;
            __int16 v93 = 2112;
            id v94 = v61;
            _os_log_error_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          long long v17 = v74;
          id v13 = v75;
          id v14 = v36;
          id v15 = v80;
          uint64_t v63 = v72;
          double v21 = v73;
          uint64_t v34 = 0;
          if (!v72)
          {
            uint64_t v34 = 0;
            goto LABEL_56;
          }
        }
        id v61 = v61;
        id *v63 = v61;
LABEL_56:

        double v44 = 0;
        uint64_t v24 = v76;
        id v25 = v79;
        goto LABEL_57;
      }
    }
    uint64_t v28 = [v26 countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_18:

  [(RTInferredMapItemFuserParameters *)self->_parameters confidenceEqualityEpsilon];
  long long v17 = v74;
  double v44 = +[RTFusedInferredMapItem sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:](RTFusedInferredMapItem, "sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:", v25, v74, self->_distanceCalculator, 0);
  id v13 = v75;
  uint64_t v24 = v76;
  id v15 = v80;
  double v21 = v73;
LABEL_57:

LABEL_58:

  return v44;
}

- (id)fusedInferredMapItemsUsingCandidates:(id)a3 referenceLocation:(id)a4 snapToBestKnownPlaceAndAoi:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (v12)
  {
    if (v11)
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v119 = v14;
        __int16 v120 = 2048;
        uint64_t v121 = [v11 count];
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, original candidates count, %lu", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v116[2] = __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke;
        v116[3] = &__block_descriptor_40_e23_v32__0__RTPair_8Q16_B24l;
        v116[4] = a2;
        [v11 enumerateObjectsUsingBlock:v116];
      }
      id v115 = 0;
      id v15 = [(RTInferredMapItemFuser *)self preprocessCandidates:v11 referenceLocation:v12 snapToBestKnownPlaceAndAoi:v7 error:&v115];
      id v16 = v115;

      if (v16)
      {
        id v17 = 0;
        if (a6) {
          *a6 = v16;
        }
      }
      else
      {
        id v20 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          double v21 = NSStringFromSelector(a2);
          uint64_t v22 = [v15 count];
          *(_DWORD *)buf = 138412546;
          v119 = v21;
          __int16 v120 = 2048;
          uint64_t v121 = v22;
          _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, preprocessed candidates count, %lu", buf, 0x16u);
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          v114[0] = MEMORY[0x1E4F143A8];
          v114[1] = 3221225472;
          v114[2] = __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_132;
          v114[3] = &__block_descriptor_40_e23_v32__0__RTPair_8Q16_B24l;
          v114[4] = a2;
          [v15 enumerateObjectsUsingBlock:v114];
        }
        unint64_t v23 = [v15 count];
        uint64_t v24 = [[_RTMap alloc] initWithInput:v15];
        id v25 = v24;
        if (v23 > 1)
        {
          id v26 = [(_RTMap *)v24 withBlock:&__block_literal_global_139];

          uint64_t v27 = objc_alloc_init(RTInferredMapItemDeduperState);
          deduper = self->_deduper;
          id v113 = 0;
          uint64_t v29 = [(RTInferredMapItemDeduper *)deduper dedupeInferredMapItems:v26 state:v27 error:&v113];
          id v30 = v113;
          long long v97 = v30;
          if (v30)
          {
            uint64_t v95 = v26;
            double v31 = v29;
            uint64_t v32 = v27;
            id v33 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v34 = [v30 userInfo];
            id v35 = [v33 errorWithDomain:@"RTInferredMapItemFuserErrorDomain" code:5 userInfo:v34];

            id v36 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              long long v49 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              v119 = v49;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v35;
              _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, deduping error, %@", buf, 0x16u);
            }
            if (a6)
            {
              id v35 = v35;
              id v17 = 0;
              *a6 = v35;
            }
            else
            {
              id v17 = 0;
            }
            uint64_t v27 = v32;
            uint64_t v29 = v31;
            id v26 = v95;
          }
          else
          {
            id v112 = 0;
            __int16 v93 = [(RTInferredMapItemFuser *)self populateMapItemSourceEntriesForDedupedInferredMapItems:v29 error:&v112];
            id v94 = v112;
            if (v94)
            {
              uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                __int16 v53 = v26;
                double v54 = v29;
                double v56 = v55 = v27;
                *(_DWORD *)buf = 138412546;
                v119 = v56;
                __int16 v120 = 2112;
                uint64_t v121 = (uint64_t)v94;
                _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, populate error, %@", buf, 0x16u);

                uint64_t v27 = v55;
                uint64_t v29 = v54;
                id v26 = v53;
              }

              if (a6)
              {
                id v35 = v94;
                id v17 = 0;
                *a6 = v94;
              }
              else
              {
                id v17 = 0;
                id v35 = v94;
              }
            }
            else
            {
              uint64_t v89 = v29;
              long long v90 = v27;
              id v110 = 0;
              id v111 = 0;
              id v109 = 0;
              BOOL v38 = [(RTInferredMapItemFuser *)self partitionDedupedInferredMapItems:v29 intoNonAoiDedupedInferredMapItems:&v111 aoiDedupedInferredMapItems:&v110 error:&v109];
              id v39 = v111;
              id v40 = v110;
              id v91 = v109;
              id v92 = v39;
              id v88 = v40;
              if (v38)
              {
                id v107 = 0;
                id v108 = 0;
                id v106 = 0;
                BOOL v41 = [(RTInferredMapItemFuser *)self initializeEntriesForNonAoiDedupedInferredMapItems:v39 aoiDedupedInferredMapItems:v40 nonAoiUUIDToLogProbMap:&v108 aoiUUIDToProbArrayMap:&v107 error:&v106];
                id v84 = v108;
                id v42 = v107;
                id v85 = v106;
                long long v83 = v42;
                if (v41)
                {
                  id v105 = 0;
                  BOOL v43 = [(RTInferredMapItemFuser *)self updateAoiUUIDToProbArrayMap:v42 aoiDedupedInferredMapItems:v40 error:&v105];
                  id v82 = v105;
                  uint64_t v29 = v89;
                  if (v43)
                  {
                    id v104 = 0;
                    BOOL v44 = [(RTInferredMapItemFuser *)self updateNonAoiUUIDToLogProbMap:v84 nonAoiDedupedInferredMapItems:v92 error:&v104];
                    id v81 = v104;
                    if (v44)
                    {
                      id v103 = 0;
                      uint64_t v45 = [(RTInferredMapItemFuser *)self normalizeNonAoiUUIDToLogProbMap:v84 aoiUUIDToProbArrayMap:v42 error:&v103];
                      uint64_t v79 = (void *)v45;
                      id v80 = v103;
                      if (v80)
                      {
                        double v46 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
                        uint64_t v27 = v90;
                        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                        {
                          id v75 = NSStringFromSelector(a2);
                          *(_DWORD *)buf = 138412546;
                          v119 = v75;
                          __int16 v120 = 2112;
                          uint64_t v121 = (uint64_t)v80;
                          _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "%@, normalize error, %@", buf, 0x16u);

                          uint64_t v27 = v90;
                        }

                        id v17 = 0;
                        if (a6) {
                          *a6 = v80;
                        }
                        id v35 = 0;
                        long long v48 = v91;
                        double v51 = v92;
                      }
                      else
                      {
                        id v102 = 0;
                        uint64_t v27 = v90;
                        uint64_t v59 = [(RTInferredMapItemFuser *)self fusedInferredMapItemsFromUUIDToProbMap:v45 inferredMapItemDeduperState:v90 uuidToFusedMapItemSourceMap:v93 referenceLocation:v12 error:&v102];
                        id v77 = v59;
                        id v78 = v102;
                        if (v78)
                        {
                          uint64_t v60 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
                          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                          {
                            id v76 = NSStringFromSelector(a2);
                            *(_DWORD *)buf = 138412546;
                            v119 = v76;
                            __int16 v120 = 2112;
                            uint64_t v121 = (uint64_t)v78;
                            _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "%@, generate error, %@", buf, 0x16u);

                            uint64_t v27 = v90;
                          }

                          id v17 = 0;
                          if (a6) {
                            *a6 = v78;
                          }
                        }
                        else
                        {
                          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                          {
                            long long v96 = v26;
                            long long v100 = 0u;
                            long long v101 = 0u;
                            long long v98 = 0u;
                            long long v99 = 0u;
                            id obj = v59;
                            uint64_t v62 = [obj countByEnumeratingWithState:&v98 objects:v117 count:16];
                            if (v62)
                            {
                              uint64_t v63 = v62;
                              uint64_t v64 = *(void *)v99;
                              long long v65 = RTLogFacilityFusion;
                              do
                              {
                                uint64_t v66 = 0;
                                uint64_t v86 = v63;
                                do
                                {
                                  if (*(void *)v99 != v64) {
                                    objc_enumerationMutation(obj);
                                  }
                                  uint64_t v67 = *(void *)(*((void *)&v98 + 1) + 8 * v66);
                                  long long v68 = _rt_log_facility_get_os_log(v65);
                                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                                  {
                                    NSStringFromSelector(a2);
                                    long long v69 = v65;
                                    v71 = uint64_t v70 = v64;
                                    *(_DWORD *)buf = 138412546;
                                    v119 = v71;
                                    __int16 v120 = 2112;
                                    uint64_t v121 = v67;
                                    _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "%@, fused map item, %@", buf, 0x16u);

                                    uint64_t v64 = v70;
                                    long long v65 = v69;
                                    uint64_t v63 = v86;
                                  }

                                  ++v66;
                                }
                                while (v63 != v66);
                                uint64_t v63 = [obj countByEnumeratingWithState:&v98 objects:v117 count:16];
                              }
                              while (v63);
                            }

                            id v26 = v96;
                            uint64_t v29 = v89;
                            uint64_t v27 = v90;
                            uint64_t v59 = v77;
                          }
                          id v17 = v59;
                        }
                        id v35 = 0;
                        long long v48 = v91;
                        double v51 = v92;
                      }
                    }
                    else
                    {
                      id v57 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      {
                        long long v74 = NSStringFromSelector(a2);
                        *(_DWORD *)buf = 138412546;
                        v119 = v74;
                        __int16 v120 = 2112;
                        uint64_t v121 = (uint64_t)v81;
                        _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "%@, update non aoi error, %@", buf, 0x16u);
                      }
                      id v17 = 0;
                      if (a6) {
                        *a6 = v81;
                      }
                      uint64_t v27 = v90;
                      long long v48 = v91;
                      id v35 = 0;
                      double v51 = v92;
                    }
                  }
                  else
                  {
                    double v52 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                    {
                      long long v72 = NSStringFromSelector(a2);
                      *(_DWORD *)buf = 138412546;
                      v119 = v72;
                      __int16 v120 = 2112;
                      uint64_t v121 = (uint64_t)v82;
                      _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "%@, update aoi error, %@", buf, 0x16u);
                    }
                    id v17 = 0;
                    if (a6) {
                      *a6 = v82;
                    }
                    uint64_t v27 = v90;
                    long long v48 = v91;
                    id v35 = 0;
                    double v51 = v92;
                  }
                }
                else
                {
                  id v50 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
                  uint64_t v29 = v89;
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    id v61 = NSStringFromSelector(a2);
                    *(_DWORD *)buf = 138412546;
                    v119 = v61;
                    __int16 v120 = 2112;
                    uint64_t v121 = (uint64_t)v85;
                    _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "%@, initialize error, %@", buf, 0x16u);
                  }
                  id v17 = 0;
                  if (a6) {
                    *a6 = v85;
                  }
                  uint64_t v27 = v90;
                  long long v48 = v91;
                  id v35 = 0;
                  double v51 = v92;
                }
              }
              else
              {
                long long v47 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  id v58 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412546;
                  v119 = v58;
                  __int16 v120 = 2112;
                  uint64_t v121 = (uint64_t)v91;
                  _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "%@, partition error, %@", buf, 0x16u);
                }
                uint64_t v29 = v89;
                if (a6)
                {
                  long long v48 = v91;
                  id v17 = 0;
                  *a6 = v91;
                  uint64_t v27 = v90;
                }
                else
                {
                  id v17 = 0;
                  uint64_t v27 = v90;
                  long long v48 = v91;
                }
                id v35 = 0;
                double v51 = v92;
              }
            }
          }
        }
        else
        {
          id v17 = [(_RTMap *)v24 withBlock:&__block_literal_global_136];
        }
      }
    }
    else
    {
      double v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
      }

      if (a6)
      {
        _RTErrorInvalidParameterCreate(@"candidates");
        id v15 = 0;
        id v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = 0;
        id v17 = 0;
      }
    }
  }
  else
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"referenceLocation");
      id v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = 0;
    }
    id v15 = v11;
  }

  return v17;
}

void __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, original candidate, %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_132(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, input candidate, %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

RTFusedInferredMapItem *__114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_133(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [RTFusedInferredMapItem alloc];
  BOOL v4 = [v2 firstObject];

  id v5 = [(RTFusedInferredMapItem *)v3 initWithInferredMapItem:v4];

  return v5;
}

uint64_t __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 firstObject];
}

- (id)highestConfidenceAoiMapItemFromFusedInferredMapItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v4);
          }
          __int16 v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = [v10 mapItem:v18];
          __int16 v12 = [v11 extendedAttributes];

          if (v12 && [v12 wifiFingerprintLabelType] == 2)
          {
            if (v7)
            {
              [v10 confidence];
              double v14 = v13;
              [v7 confidence];
              if (v14 > v15)
              {
                id v16 = v10;

                id v7 = v16;
              }
            }
            else
            {
              id v7 = v10;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)bestFromFusedInferredMapItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    double v14 = 0;
    goto LABEL_12;
  }
  id v7 = [v5 firstObject];

  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = [v6 firstObject];
  [v8 confidence];
  double v10 = v9;
  [(RTInferredMapItemFuserParameters *)self->_parameters aoiConsiderThreshold];
  double v12 = v11;

  if (v10 >= v12) {
    goto LABEL_11;
  }
  double v13 = [(RTInferredMapItemFuser *)self highestConfidenceAoiMapItemFromFusedInferredMapItems:v6];
  double v14 = v13;
  if (!v13
    || ([v13 confidence],
        double v16 = v15,
        [(RTInferredMapItemFuserParameters *)self->_parameters aoiUseThreshold],
        v16 <= v17))
  {

LABEL_11:
    double v14 = [v6 firstObject];
    goto LABEL_12;
  }
  long long v18 = _rt_log_facility_get_os_log(RTLogFacilityFusion);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    long long v19 = NSStringFromSelector(a2);
    int v21 = 138412546;
    uint64_t v22 = v19;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, using AOI fusedInferredMapItem, %@", (uint8_t *)&v21, 0x16u);
  }
LABEL_12:

  return v14;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTInferredMapItemFuserParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTInferredMapItemDeduper)deduper
{
  return self->_deduper;
}

- (void)setDeduper:(id)a3
{
}

- (NSUUID)placeholderUUID
{
  return self->_placeholderUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderUUID, 0);
  objc_storeStrong((id *)&self->_deduper, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end