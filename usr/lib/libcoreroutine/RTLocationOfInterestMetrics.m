@interface RTLocationOfInterestMetrics
- (BOOL)collectMetricsWithError:(id *)a3;
- (RTLocationOfInterestMetrics)init;
- (RTLocationOfInterestMetrics)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 locationStore:(id)a6;
- (id)_countNearbyLocationsOfInterestForLocationOfInterest:(id)a3 outError:(id *)a4;
- (id)_metricForLocationOfInterest:(id)a3;
- (id)_shuffledIndicesForArraySize:(unint64_t)a3;
- (int)_signalEnvironmentTypeForLocationOfInterest:(id)a3;
- (void)_submitMetric:(id)a3;
@end

@implementation RTLocationOfInterestMetrics

- (RTLocationOfInterestMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedLocationStore_locationStore_);
}

- (RTLocationOfInterestMetrics)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 locationStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: defaultsManager";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_14;
  }
  if (!v12)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_13;
  }
  if (!v13)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_13;
    }
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTLocationOfInterestMetrics;
  v15 = [(RTLocationOfInterestMetrics *)&v21 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_defaultsManager, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }
  self = p_isa;
  v17 = self;
LABEL_15:

  return v17;
}

- (BOOL)collectMetricsWithError:(id *)a3
{
  aSelector = a2;
  v69[1] = *MEMORY[0x1E4F143B8];
  v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(aSelector);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, collecting LOI metrics", (uint8_t *)&buf, 0xCu);
  }
  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-3628800.0];
  v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v47 = (void *)[v6 initWithStartDate:v7 endDate:v8];

  v46 = [[RTStoredLocationOfInterestEnumerationOptions alloc] initWithAscendingVisitEntryDate:1 batchSize:5 dateInterval:v47 singleVisit:0];
  v9 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__14;
  v67 = __Block_byref_object_dispose__14;
  id v68 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  int v59 = 0;
  learnedLocationStore = self->_learnedLocationStore;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __55__RTLocationOfInterestMetrics_collectMetricsWithError___block_invoke;
  v52[3] = &unk_1E6B91CD0;
  p_long long buf = &buf;
  id v12 = v10;
  v53 = v12;
  v57 = v58;
  id v13 = v9;
  id v54 = v13;
  v55 = self;
  [(RTLearnedLocationStore *)learnedLocationStore enumerateStoredLocationsOfInterestWithOptions:v46 enumerationBlock:v52];
  id v14 = v12;
  v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_8;
  }
  v17 = [MEMORY[0x1E4F1C9C8] now];
  [v17 timeIntervalSinceDate:v15];
  double v19 = v18;
  v20 = objc_opt_new();
  objc_super v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_10];
  v22 = [MEMORY[0x1E4F29060] callStackSymbols];
  v23 = [v22 filteredArrayUsingPredicate:v21];
  v24 = [v23 firstObject];

  [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v61 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v61, 2u);
  }

  v26 = (void *)MEMORY[0x1E4F28C58];
  v69[0] = *MEMORY[0x1E4F28568];
  *(void *)v61 = @"semaphore wait timeout";
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v69 count:1];
  v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

  if (v28)
  {
    id v29 = v28;

    char v30 = 0;
  }
  else
  {
LABEL_8:
    id v29 = 0;
    char v30 = 1;
  }

  id v31 = v29;
  if ((v30 & 1) == 0) {
    objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v29);
  }
  uint64_t v32 = *(void *)(*((void *)&buf + 1) + 40);
  if (v32)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v42 = NSStringFromSelector(aSelector);
      uint64_t v43 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v61 = 138412546;
      *(void *)&v61[4] = v42;
      __int16 v62 = 2112;
      uint64_t v63 = v43;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, error, %@", v61, 0x16u);
    }
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v34 = v13;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v49 != v36) {
            objc_enumerationMutation(v34);
          }
          -[RTLocationOfInterestMetrics _submitMetric:](self, "_submitMetric:", *(void *)(*((void *)&v48 + 1) + 8 * i), aSelector);
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v35);
    }

    v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(aSelector);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = [v34 count];
      *(_DWORD *)v61 = 138412546;
      *(void *)&v61[4] = v39;
      __int16 v62 = 2048;
      uint64_t v63 = v40;
      _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, submitted %lu LOI metrics", v61, 0x16u);
    }
    [(RTDefaultsManager *)self->_defaultsManager setObject:MEMORY[0x1E4F1CC38] forKey:@"RTDefaultsLearnedLocationEngineLocationOfInterestMetricsSubmitted"];
  }

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(&buf, 8);

  return v32 == 0;
}

void __55__RTLocationOfInterestMetrics_collectMetricsWithError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && [v7 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v10) {
      goto LABEL_18;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count", (void)v18) > 9)
        {
          unsigned int v16 = RTCommonRandomInt();
          if (v16 > 9) {
            goto LABEL_16;
          }
          signed int v17 = v16;
          v15 = [*(id *)(a1 + 48) _metricForLocationOfInterest:v14];
          if (v15) {
            [*(id *)(a1 + 40) replaceObjectAtIndex:v17 withObject:v15];
          }
        }
        else
        {
          v15 = [*(id *)(a1 + 48) _metricForLocationOfInterest:v14];
          if (v15) {
            [*(id *)(a1 + 40) addObject:v15];
          }
        }

LABEL_16:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v11)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
  }
  *a4 = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_19:
}

- (int)_signalEnvironmentTypeForLocationOfInterest:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  if (v56)
  {
    os_log_t oslog = [MEMORY[0x1E4F1C9C8] distantPast];
    int v59 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v65 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:oslog endDate:v59];
    id v3 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    v4 = [v56 location];
    v5 = [v4 location];
    [v5 latitude];
    CLLocationDegrees v7 = v6;
    id v8 = [v56 location];
    id v9 = [v8 location];
    [v9 longitude];
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v7, v10);
    uint64_t v12 = [v56 location];
    uint64_t v13 = [v12 location];
    uint64_t v14 = [v13 date];
    v64 = [v3 initWithCoordinate:v14 altitude:v11.latitude horizontalAccuracy:v11.longitude verticalAccuracy:0.0 timestamp:250.0];

    v61 = objc_opt_new();
    v94[0] = 0;
    v94[1] = v94;
    v94[2] = 0x2020000000;
    v94[3] = 0;
    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x2020000000;
    uint64_t v93 = 0;
    *(void *)v84 = 0;
    v85 = v84;
    uint64_t v86 = 0x3032000000;
    v87 = __Block_byref_object_copy__14;
    v88 = __Block_byref_object_dispose__14;
    id v89 = 0;
    uint64_t v78 = 0;
    v79 = (id *)&v78;
    uint64_t v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__14;
    v82 = __Block_byref_object_dispose__14;
    id v83 = 0;
    uint64_t v57 = *MEMORY[0x1E4F5CFE8];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    do
    {
      v15 = (void *)MEMORY[0x1E016D870]();
      unsigned int v16 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v65 horizontalAccuracy:200 batchSize:v64 boundingBoxLocation:200.0];
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      locationStore = self->_locationStore;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke;
      v71[3] = &unk_1E6B91CF8;
      v74 = &v90;
      id v62 = v61;
      id v72 = v62;
      v75 = v94;
      v76 = v84;
      v77 = &v78;
      long long v19 = v17;
      v73 = v19;
      [(RTLocationStore *)locationStore fetchStoredLocationsWithOptions:v16 handler:v71];
      long long v20 = v19;
      long long v21 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v22 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v20, v22)) {
        goto LABEL_8;
      }
      uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
      [v23 timeIntervalSinceDate:v21];
      double v25 = v24;
      v26 = objc_opt_new();
      v27 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_10];
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v29 = [v28 filteredArrayUsingPredicate:v27];
      char v30 = [v29 firstObject];

      [v26 submitToCoreAnalytics:v30 type:1 duration:v25];
      id v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v95 = v58;
      *(void *)long long buf = @"semaphore wait timeout";
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v95 count:1];
      id v34 = [v32 errorWithDomain:v57 code:15 userInfo:v33];

      if (v34)
      {
        id v35 = v34;

        char v36 = 0;
      }
      else
      {
LABEL_8:
        id v35 = 0;
        char v36 = 1;
      }

      id v37 = v35;
      if ((v36 & 1) == 0) {
        objc_storeStrong(v79 + 5, v35);
      }
      if (v79[5])
      {
        v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v42 = NSStringFromSelector(a2);
          id v43 = v79[5];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v43;
          _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        int v39 = 1;
      }
      else
      {
        uint64_t v40 = [*((id *)v85 + 5) dateByAddingTimeInterval:1.0];

        v41 = [v65 endDate];

        if (v91[3] && ![v41 isBeforeDate:v40])
        {
          int v39 = 0;
          v38 = v65;
          uint64_t v65 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v40 endDate:v41];
        }
        else
        {
          v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v44 = NSStringFromSelector(a2);
            *(_DWORD *)long long buf = 138412290;
            *(void *)&buf[4] = v44;
            _os_log_debug_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEBUG, "%@, no more locations to fetch.", buf, 0xCu);
          }
          int v39 = 6;
        }
        int v59 = v41;
        os_log_t oslog = (os_log_t)v40;
      }
    }
    while (!v39);
    if (v39 == 6)
    {
      if (!v79[5])
      {
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        int v101 = 0;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke_27;
        v66[3] = &unk_1E6B91D20;
        SEL v70 = a2;
        id v48 = v56;
        id v67 = v48;
        id v68 = v94;
        v69 = buf;
        [v62 enumerateKeysAndObjectsUsingBlock:v66];
        long long v49 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          long long v51 = [v48 identifier];
          uint64_t v52 = *(unsigned int *)(*(void *)&buf[8] + 24);
          *(_DWORD *)v95 = 138412802;
          *(void *)&v95[4] = v50;
          __int16 v96 = 2112;
          v97 = v51;
          __int16 v98 = 2048;
          uint64_t v99 = v52;
          _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "%@, LOI identifier, %@, selected signal environment type, %lu", v95, 0x20u);
        }
        int v46 = *(_DWORD *)(*(void *)&buf[8] + 24);

        _Block_object_dispose(buf, 8);
        goto LABEL_29;
      }
      v45 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v53 = NSStringFromSelector(a2);
        id v54 = v79[5];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v54;
        _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
    }
    int v46 = 0;
LABEL_29:
    _Block_object_dispose(&v78, 8);

    _Block_object_dispose(v84, 8);
    _Block_object_dispose(&v90, 8);
    _Block_object_dispose(v94, 8);

    goto LABEL_33;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v84 = 0;
    _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", v84, 2u);
  }
  int v46 = 0;
LABEL_33:

  return v46;
}

void __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v33 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 count];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v35 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v35) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        CLLocationDegrees v10 = *(void **)(a1 + 32);
        CLLocationCoordinate2D v11 = [NSNumber numberWithUnsignedInt:[v9 signalEnvironmentType]];
        uint64_t v12 = [v10 objectForKey:v11];

        uint64_t v13 = NSNumber;
        if (v12)
        {
          uint64_t v14 = *(void **)(a1 + 32);
          v15 = [NSNumber numberWithUnsignedInt:[v9 signalEnvironmentType]];
          unsigned int v16 = [v14 objectForKeyedSubscript:v15];
          dispatch_semaphore_t v17 = [v13 numberWithInt:[v16 unsignedIntValue] + 1];
          long long v18 = *(void **)(a1 + 32);
          long long v19 = [NSNumber numberWithUnsignedInt:[v9 signalEnvironmentType]];
          [v18 setObject:v17 forKeyedSubscript:v19];
        }
        else
        {
          v15 = [NSNumber numberWithInt:1];
          long long v20 = *(void **)(a1 + 32);
          unsigned int v16 = [NSNumber numberWithUnsignedInt:[v9 signalEnvironmentType]];
          [v20 setObject:v15 forKeyedSubscript:v16];
        }

        unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        dispatch_time_t v22 = *(void **)(a1 + 32);
        uint64_t v23 = [NSNumber numberWithUnsignedInt:[v9 signalEnvironmentType]];
        double v24 = [v22 objectForKeyedSubscript:v23];
        unsigned int v25 = [v24 unsignedIntValue];

        unint64_t v26 = v25;
        if (v21 > v25) {
          unint64_t v26 = v21;
        }
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v26;
        uint64_t v27 = [v9 timestamp];
        uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
        id v29 = *(void **)(v28 + 40);
        *(void *)(v28 + 40) = v27;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v7);
  }

  uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
  id v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v33;
  id v32 = v33;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v9 = [*(id *)(a1 + 32) identifier];
    int v10 = 138413058;
    CLLocationCoordinate2D v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v5 unsignedIntValue];
    __int16 v16 = 2048;
    uint64_t v17 = [v6 unsignedIntValue];
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, locationOfInterest identifier, %@, signal environment type, %lu, count, %lu", (uint8_t *)&v10, 0x2Au);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == [v6 unsignedIntValue]) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 unsignedIntValue];
  }
}

- (id)_countNearbyLocationsOfInterestForLocationOfInterest:(id)a3 outError:(id *)a4
{
  SEL aSelector = a2;
  v96[1] = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  uint64_t v63 = +[RTMetric binsFromStart:&unk_1F3453638 toEnd:&unk_1F3453648 gap:&unk_1F3453658];
  v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v63 count]];
  if ([v63 count])
  {
    unint64_t v5 = 0;
    do
      [v4 setObject:&unk_1F344F958 atIndexedSubscript:v5++];
    while (v5 < [v63 count]);
  }
  id v6 = [v67 location:aSelector];
  uint64_t v7 = [v6 location];

  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v86 = 0;
    v87 = &v86;
    uint64_t v88 = 0x3032000000;
    id v89 = __Block_byref_object_copy__14;
    uint64_t v90 = __Block_byref_object_dispose__14;
    id v91 = (id)objc_opt_new();
    uint64_t v80 = 0;
    v81 = (id *)&v80;
    uint64_t v82 = 0x3032000000;
    id v83 = __Block_byref_object_copy__14;
    v84 = __Block_byref_object_dispose__14;
    id v85 = 0;
    learnedLocationStore = self->_learnedLocationStore;
    int v10 = [v67 location];
    CLLocationCoordinate2D v11 = [v10 location];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke;
    v76[3] = &unk_1E6B905F0;
    uint64_t v78 = &v80;
    v79 = &v86;
    __int16 v12 = v8;
    v77 = v12;
    [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestWithinDistance:v11 location:v76 handler:1000.0];

    dsema = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v14)) {
      goto LABEL_10;
    }
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    uint64_t v18 = objc_opt_new();
    long long v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_10];
    long long v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    unint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    dispatch_time_t v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    double v24 = (void *)MEMORY[0x1E4F28C58];
    v96[0] = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    unsigned int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v96 count:1];
    unint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v27 = v26;

      char v28 = 0;
    }
    else
    {
LABEL_10:
      id v27 = 0;
      char v28 = 1;
    }

    id v60 = v27;
    if ((v28 & 1) == 0) {
      objc_storeStrong(v81 + 5, v27);
    }
    id v29 = v81[5];
    if (v29)
    {
      if (a4)
      {
        id v30 = 0;
        *a4 = v29;
      }
      else
      {
LABEL_36:
        id v30 = 0;
      }
    }
    else
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obja = (id)v87[5];
      uint64_t v33 = [obja countByEnumeratingWithState:&v72 objects:v93 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v73;
        while (2)
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v73 != v34) {
              objc_enumerationMutation(obja);
            }
            long long v36 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            long long v37 = [v36 identifier];
            long long v38 = [v67 identifier];
            BOOL v39 = v37 == v38;

            if (!v39)
            {
              distanceCalculator = self->_distanceCalculator;
              uint64_t v41 = [v67 location];
              v42 = [v41 location];
              id v43 = [v36 location];
              v44 = [v43 location];
              id v71 = 0;
              [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v42 toLocation:v44 error:&v71];
              double v46 = v45;
              id v47 = v71;

              if (!v47 && v46 > 0.0)
              {
                id v48 = NSNumber;
                long long v49 = [NSNumber numberWithDouble:v46];
                id v50 = +[RTMetric binForNumber:v49 bins:v63];
                long long v51 = [v48 numberWithUnsignedInt:[v50 unsignedIntValue] - 1];

                if (([v51 intValue] & 0x80000000) != 0)
                {
                  v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
                  {
                    uint64_t v57 = NSStringFromSelector(aSelectora);
                    *(_DWORD *)long long buf = 138412290;
                    *(void *)&buf[4] = v57;
                    _os_log_fault_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_FAULT, "%@, negative bin index!", buf, 0xCu);
                  }
                  goto LABEL_36;
                }
                uint64_t v52 = NSNumber;
                v53 = [v4 objectAtIndexedSubscript:[v51 unsignedIntValue]];
                id v54 = [v52 numberWithUnsignedInt:[v53 unsignedIntValue] + 1];
                [v4 setObject:v54 atIndexedSubscript:[v51 unsignedIntValue]];
              }
            }
          }
          uint64_t v33 = [obja countByEnumeratingWithState:&v72 objects:v93 count:16];
          if (v33) {
            continue;
          }
          break;
        }
      }

      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke_40;
      v68[3] = &unk_1E6B91D48;
      SEL v70 = aSelectora;
      id v69 = v63;
      [v4 enumerateObjectsUsingBlock:v68];
      id v30 = v4;
    }
    _Block_object_dispose(&v80, 8);

    _Block_object_dispose(&v86, 8);
  }
  else
  {
    id v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v94 = *MEMORY[0x1E4F28568];
    v95 = @"requires a LOI with non-nil location";
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    id v60 = [v31 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v32];

    if (a4)
    {
      id v61 = v60;
      id v30 = 0;
      *a4 = v61;

      goto LABEL_39;
    }
    id v30 = 0;
  }

LABEL_39:

  return v30;
}

void __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v7 = obj;
  id v6 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v6];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke_40(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    dispatch_semaphore_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    [v8 doubleValue];
    uint64_t v10 = v9;
    unint64_t v11 = [*(id *)(a1 + 32) count] - 1;
    if (v11 <= a3)
    {
      uint64_t v13 = 0x408F400000000000;
    }
    else
    {
      a1 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
      [(id)a1 doubleValue];
      uint64_t v13 = v12;
    }
    int v14 = 138413314;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2048;
    uint64_t v23 = [v5 unsignedIntValue];
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, bin idx, %lu, min distance, %.2f, max distance, %.2f, nearby LOI count, %lu", (uint8_t *)&v14, 0x34u);
    if (v11 > a3) {
  }
    }
}

- (id)_metricForLocationOfInterest:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v106 = v5;
  if (v5)
  {
    id v6 = v5;
    id v107 = (id)objc_opt_new();
    id v7 = [v6 location];
    os_log_t oslog = [v7 location];

    dispatch_semaphore_t v8 = NSNumber;
    [oslog horizontalUncertainty];
    uint64_t v10 = [v8 numberWithInt:fmin(v9, 200.0)];
    [v107 setObject:v10 forKeyedSubscript:@"horizontalUncertainty"];

    unint64_t v11 = [NSNumber numberWithUnsignedInteger:-[NSObject sourceAccuracy](oslog, "sourceAccuracy")];
    [v107 setObject:v11 forKeyedSubscript:@"sourceAccuracy"];

    uint64_t v12 = NSNumber;
    uint64_t v13 = [v106 place];
    int v14 = [v12 numberWithUnsignedInteger:[v13 type]];
    [v107 setObject:v14 forKeyedSubscript:@"placeType"];

    uint64_t v15 = NSNumber;
    __int16 v16 = [v106 place];
    unint64_t v17 = [v16 mapItem];
    __int16 v18 = [v17 extendedAttributes];
    uint64_t v19 = [v15 numberWithBool:[v18 isMe]];
    [v107 setObject:v19 forKeyedSubscript:@"isMeCardAddress"];

    __int16 v20 = [[NSNumber numberWithUnsignedInt:-[RTLocationOfInterestMetrics _signalEnvironmentTypeForLocationOfInterest:](self, "_signalEnvironmentTypeForLocationOfInterest:", v106)];
    [v107 setObject:v20 forKeyedSubscript:@"signalEnvironment"];

    distanceCalculator = self->_distanceCalculator;
    __int16 v22 = [v106 place];
    uint64_t v23 = [v22 mapItem];
    uint64_t v24 = [v23 location];
    id v115 = 0;
    [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v24 toLocation:oslog error:&v115];
    double v26 = v25;
    id v102 = v115;

    id v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      char v28 = NSStringFromSelector(a2);
      id v29 = [v106 place];
      id v30 = [v29 mapItem];
      id v31 = [v30 location];
      *(_DWORD *)long long buf = 138413314;
      *(void *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = oslog;
      *(_WORD *)&buf[22] = 2112;
      v117 = v31;
      __int16 v118 = 2048;
      double v119 = v26;
      __int16 v120 = 2112;
      id v121 = v102;
      _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, LOI centroid, %@, mapItem centroid, %@, distance, %f, error, %@", buf, 0x34u);
    }
    if (!v102)
    {
      id v32 = [NSNumber numberWithInt:fmin(v26, 200.0)];
      [v107 setObject:v32 forKeyedSubscript:@"distanceFromMapItem"];

      [oslog horizontalUncertainty];
      if (v33 != 0.0)
      {
        uint64_t v34 = NSNumber;
        [oslog horizontalUncertainty];
        long long v36 = [v34 numberWithDouble:v26 / v35];
        [v107 setObject:v36 forKeyedSubscript:@"ratioBetweenDistanceAndHorizontalUncertainty"];
      }
    }
    long long v37 = [v106 place];
    long long v38 = [v37 mapItem];
    BOOL v39 = [v38 location];
    BOOL v40 = [v39 referenceFrame] == 2;

    if (!v40)
    {
      *(void *)long long buf = 0;
      uint64_t v109 = 0;
      uint64_t v114 = 0;
      [oslog latitude];
      [oslog longitude];
      uint64_t v41 = [v106 place];
      v42 = [v41 mapItem];
      id v43 = [v42 location];
      [v43 latitude];
      v44 = [v106 place];
      double v45 = [v44 mapItem];
      double v46 = [v45 location];
      [v46 longitude];
      int v47 = RTCommonConvertGeodeticToLocalFrame();

      if (v47)
      {
        id v48 = [NSString stringWithFormat:@"%.1f,%.1f", v109, *(void *)buf];
        [v107 setObject:v48 forKeyedSubscript:@"distanceFromMapItemIn2D"];
      }
    }
    id v113 = 0;
    v104 = [(RTLocationOfInterestMetrics *)self _countNearbyLocationsOfInterestForLocationOfInterest:v106 outError:&v113];
    id v101 = v113;
    if ([v104 count])
    {
      unint64_t v49 = 0;
      do
      {
        id v50 = [NSString stringWithFormat:@"%@%lu", @"nearbyLOICountInDistanceBucket", v49];
        long long v51 = [v104 objectAtIndex:v49];
        [v107 setObject:v51 forKeyedSubscript:v50];

        ++v49;
      }
      while (v49 < [v104 count]);
    }
    [v107 setObject:&unk_1F3453668 forKeyedSubscript:@"intervalBetweenFirstVisitAndLastVisit"];
    [v107 setObject:&unk_1F344F958 forKeyedSubscript:@"visitCount"];
    [v107 setObject:&unk_1F344F958 forKeyedSubscript:@"highAccuracyVisitCount"];
    [v107 setObject:&unk_1F344F958 forKeyedSubscript:@"lowAccuracyVisitCount"];
    uint64_t v52 = [v106 visits];
    BOOL v53 = [v52 count] == 0;

    if (!v53)
    {
      id v54 = [v106 visits];
      BOOL v55 = (unint64_t)[v54 count] > 1;

      if (v55)
      {
        id v56 = [v106 visits];
        uint64_t v57 = [v56 lastObject];
        uint64_t v58 = [v57 exitDate];
        int v59 = [v106 visits];
        id v60 = [v59 firstObject];
        id v61 = [v60 entryDate];
        [v58 timeIntervalSinceDate:v61];
        double v63 = v62;

        v64 = [NSNumber numberWithInt:(int)(v63 / 86400.0)];
        [v107 setObject:v64 forKeyedSubscript:@"intervalBetweenFirstVisitAndLastVisit"];
      }
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      v117 = 0;
      uint64_t v109 = 0;
      v110 = &v109;
      uint64_t v111 = 0x2020000000;
      uint64_t v112 = 0;
      uint64_t v65 = [v106 visits];
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __60__RTLocationOfInterestMetrics__metricForLocationOfInterest___block_invoke;
      v108[3] = &unk_1E6B91D70;
      v108[4] = buf;
      v108[5] = &v109;
      [v65 enumerateObjectsUsingBlock:v108];

      v66 = NSNumber;
      id v67 = [v106 visits];
      id v68 = [v66 numberWithUnsignedInteger:[v67 count]];
      [v107 setObject:v68 forKeyedSubscript:@"visitCount"];

      id v69 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)&buf[8] + 24)];
      [v107 setObject:v69 forKeyedSubscript:@"highAccuracyVisitCount"];

      SEL v70 = [NSNumber numberWithUnsignedInteger:v110[3]];
      [v107 setObject:v70 forKeyedSubscript:@"lowAccuracyVisitCount"];

      id v71 = [v106 visits];
      v103 = -[RTLocationOfInterestMetrics _shuffledIndicesForArraySize:](self, "_shuffledIndicesForArraySize:", [v71 count]);

      for (unint64_t i = 0; ; ++i)
      {
        long long v73 = [v106 visits];
        unint64_t v74 = [v73 count];

        unint64_t v75 = 20;
        if (v74 < 0x14) {
          unint64_t v75 = v74;
        }
        if (i >= v75) {
          break;
        }
        v76 = [NSString stringWithFormat:@"%@%lu", @"visit", i];
        v77 = [NSString stringWithFormat:@"%@%lu", @"dwellIntervalVisit", i];
        uint64_t v78 = [v106 visits];
        v79 = [v103 objectAtIndexedSubscript:i];
        uint64_t v80 = [v78 objectAtIndex:[v79 unsignedIntValue]];

        v81 = NSNumber;
        uint64_t v82 = [v80 exitDate];
        id v83 = [v80 entryDate];
        [v82 timeIntervalSinceDate:v83];
        id v85 = [v81 numberWithInt:(int)(v84 / 900.0)];
        [v107 setObject:v85 forKeyedSubscript:v77];

        uint64_t v114 = 0;
        [oslog latitude];
        [oslog longitude];
        uint64_t v86 = [v80 location];
        v87 = [v86 location];
        [v87 latitude];
        uint64_t v88 = [v80 location];
        id v89 = [v88 location];
        [v89 longitude];
        int v90 = RTCommonConvertGeodeticToLocalFrame();

        if (v90)
        {
          id v91 = NSString;
          uint64_t v92 = v114;
          uint64_t v93 = [v80 location];
          uint64_t v94 = [v93 location];
          [v94 horizontalUncertainty];
          uint64_t v96 = v95;
          v97 = [v80 location];
          __int16 v98 = [v97 location];
          uint64_t v99 = [v91 stringWithFormat:@"%.1f,%.1f,%.1f,%lu", 0, v92, v96, [v98 sourceAccuracy]];

          [v107 setObject:v99 forKeyedSubscript:v76];
        }
      }
      _Block_object_dispose(&v109, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", buf, 2u);
    }
    id v107 = 0;
  }

  return v107;
}

void __60__RTLocationOfInterestMetrics__metricForLocationOfInterest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 location];
  v4 = [v3 location];
  uint64_t v5 = [v4 sourceAccuracy];

  if (v5 == 2) {
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v6 = *(void *)(a1 + 40);
  }
  ++*(void *)(*(void *)(v6 + 8) + 24);
}

- (id)_shuffledIndicesForArraySize:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3;
    v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:];
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:i];
      [v4 addObject:v6];
    }
    uint64_t v7 = 0;
    do
    {
      [v4 exchangeObjectAtIndex:v7 withObjectAtIndex:v7 + (int)RTCommonRandomInt()];
      ++v7;
      --v3;
    }
    while (v3);
    dispatch_semaphore_t v8 = (void *)[v4 copy];
  }
  else
  {
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: arraySize > 0", v11, 2u);
    }

    dispatch_semaphore_t v8 = 0;
  }

  return v8;
}

- (void)_submitMetric:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [NSString alloc];
    uint64_t v5 = [v4 initWithCString:RTAnalyticsEventLocationOfInterestMetrics encoding:1];
    log_analytics_submission(v5, v3);
    uint64_t v6 = [NSString stringWithFormat:@"com.apple.%@", v5];
    AnalyticsSendEvent();
  }
  else
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metric", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end