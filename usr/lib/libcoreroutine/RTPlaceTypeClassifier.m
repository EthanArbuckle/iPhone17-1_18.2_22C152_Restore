@interface RTPlaceTypeClassifier
- (BOOL)classifyWithError:(id *)a3;
- (BOOL)isRottedMeCard:(id)a3 inferredPlace:(id)a4;
- (BOOL)processExpertClassifications:(id)a3 error:(id *)a4;
- (BOOL)updatePlaces:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)queue;
- (RTBiomeManager)biomeManager;
- (RTContactsManager)contactsManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTMapsSupportManager)mapsSupportManager;
- (RTPlaceTypeClassifier)init;
- (RTPlaceTypeClassifier)initWithBiomeManager:(id)a3 contactsManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 mapsSupportManager:(id)a10 placeTypeClassifierMetricsCalculator:(id)a11 platform:(id)a12 queue:(id)a13 visitManager:(id)a14;
- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator;
- (RTPlatform)platform;
- (RTVisitManager)visitManager;
- (id)coalescePlacesFromExperts:(id)a3;
- (id)getClassificationsFromExperts:(id)a3 error:(id *)a4;
- (id)getExperts;
- (id)getStoredPlacesWithError:(id *)a3;
- (id)mergeExistingPlaces:(id)a3 intoUpdatedPlace:(id)a4 typesInMeCard:(id)a5;
- (id)replaceBusinessMapItemWithReverseGeocodedMapItemForHome:(id)a3;
- (void)donateInferredPlaces:(id)a3;
- (void)setBiomeManager:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMapsSupportManager:(id)a3;
- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVisitManager:(id)a3;
@end

@implementation RTPlaceTypeClassifier

- (RTPlaceTypeClassifier)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBiomeManager_contactsManager_defaultsManager_distanceCalculator_learnedLocationStore_locationManager_mapServiceManager_mapsSupportManager_placeTypeClassifierMetricsCalculator_platform_queue_visitManager_);
}

- (RTPlaceTypeClassifier)initWithBiomeManager:(id)a3 contactsManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 mapsSupportManager:(id)a10 placeTypeClassifierMetricsCalculator:(id)a11 platform:(id)a12 queue:(id)a13 visitManager:(id)a14
{
  id v50 = a3;
  id v39 = a4;
  id v19 = a4;
  id v41 = a5;
  id v49 = a5;
  id v42 = a6;
  id v45 = a6;
  id v44 = a7;
  id v40 = a8;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v46 = a12;
  id v48 = a13;
  id v24 = a14;
  if (!v50)
  {
    id v43 = v24;
    v25 = v19;
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: biomeManager", buf, 2u);
    }

    v31 = 0;
    v26 = v49;
    v28 = v44;
    v27 = v45;
    goto LABEL_42;
  }
  v25 = v19;
  if (v19)
  {
    v26 = v49;
    v28 = v44;
    v27 = v45;
    if (v49)
    {
      id v43 = v24;
      if (v45)
      {
        if (v44)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v48)
                  {
                    if (v24)
                    {
                      v51.receiver = self;
                      v51.super_class = (Class)RTPlaceTypeClassifier;
                      v29 = [(RTPlaceTypeClassifier *)&v51 init];
                      p_isa = (id *)&v29->super.isa;
                      if (v29)
                      {
                        objc_storeStrong((id *)&v29->_biomeManager, a3);
                        objc_storeStrong(p_isa + 2, v39);
                        objc_storeStrong(p_isa + 5, a7);
                        objc_storeStrong(p_isa + 6, v40);
                        objc_storeStrong(p_isa + 7, a9);
                        objc_storeStrong(p_isa + 8, a10);
                        objc_storeStrong(p_isa + 9, a11);
                        objc_storeStrong(p_isa + 10, a12);
                        objc_storeStrong(p_isa + 3, v41);
                        objc_storeStrong(p_isa + 4, v42);
                        objc_storeStrong(p_isa + 12, a13);
                        objc_storeStrong(p_isa + 11, a14);
                      }
                      v31 = p_isa;
                      self = v31;
                      goto LABEL_42;
                    }
                    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v36 = "Invalid parameter not satisfying: visitManager";
                      goto LABEL_40;
                    }
LABEL_41:

                    v31 = 0;
LABEL_42:
                    v33 = v43;
                    goto LABEL_43;
                  }
                  v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_41;
                  }
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: queue";
                }
                else
                {
                  v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_41;
                  }
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: placeTypeClassifierMetricsCalculator";
                }
              }
              else
              {
                v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_41;
                }
                *(_WORD *)buf = 0;
                v36 = "Invalid parameter not satisfying: mapsSupportManager";
              }
            }
            else
            {
              v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                goto LABEL_41;
              }
              *(_WORD *)buf = 0;
              v36 = "Invalid parameter not satisfying: mapServiceManager";
            }
          }
          else
          {
            v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              goto LABEL_41;
            }
            *(_WORD *)buf = 0;
            v36 = "Invalid parameter not satisfying: locationManager";
          }
        }
        else
        {
          v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          *(_WORD *)buf = 0;
          v36 = "Invalid parameter not satisfying: learnedLocationStore";
        }
      }
      else
      {
        v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        *(_WORD *)buf = 0;
        v36 = "Invalid parameter not satisfying: distanceCalculator";
      }
LABEL_40:
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
      goto LABEL_41;
    }
    v33 = v24;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }
  }
  else
  {
    v33 = v24;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = v44;
    v27 = v45;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactsManager", buf, 2u);
    }
  }

  v31 = 0;
  v26 = v49;
LABEL_43:

  return v31;
}

- (BOOL)isRottedMeCard:(id)a3 inferredPlace:(id)a4
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v51 = a4;
  id v50 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-3024000.0];
  v7 = [(RTPlaceTypeClassifier *)self distanceCalculator];
  v8 = [v51 mapItem];
  v9 = [v8 location];
  v10 = [v6 mapItem];
  v11 = [v10 location];
  id v68 = 0;
  [v7 distanceFromLocation:v9 toLocation:v11 error:&v68];
  double v13 = v12;
  id v14 = v68;

  BOOL v15 = 0;
  if (!v14 && v13 >= 1000.0)
  {
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__106;
    v66 = __Block_byref_object_dispose__106;
    id v67 = 0;
    uint64_t v56 = 0;
    v57 = (id *)&v56;
    uint64_t v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__106;
    v60 = __Block_byref_object_dispose__106;
    id v61 = 0;
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v17 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
    v18 = [v6 mapItem];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __54__RTPlaceTypeClassifier_isRottedMeCard_inferredPlace___block_invoke;
    v52[3] = &unk_1E6B90B28;
    v54 = &v62;
    v55 = &v56;
    id v19 = v16;
    v53 = v19;
    [v17 fetchLocationOfInterestWithMapItem:v18 handler:v52];

    id v20 = v19;
    id v21 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v22 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v20, v22)) {
      goto LABEL_8;
    }
    id v23 = [MEMORY[0x1E4F1C9C8] now];
    [v23 timeIntervalSinceDate:v21];
    double v25 = v24;
    v26 = objc_opt_new();
    v27 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
    v28 = [MEMORY[0x1E4F29060] callStackSymbols];
    v29 = [v28 filteredArrayUsingPredicate:v27];
    v30 = [v29 firstObject];

    [v26 submitToCoreAnalytics:v30 type:1 duration:v25];
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v32 = (void *)MEMORY[0x1E4F28C58];
    v78[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v78 count:1];
    v34 = [v32 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v33];

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
      objc_storeStrong(v57 + 5, v35);
    }
    v38 = [(id)v63[5] lastObject];
    id v39 = [v38 entryDate];
    id v40 = v39;
    if (v39)
    {
      id v41 = v39;
    }
    else
    {
      id v41 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v42 = v41;

    id v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v45 = [(id)v63[5] count];
      id v46 = [(id)v63[5] lastObject];
      id v47 = v57[5];
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v44;
      __int16 v70 = 2048;
      uint64_t v71 = v45;
      __int16 v72 = 2112;
      v73 = v46;
      __int16 v74 = 2112;
      id v75 = v6;
      __int16 v76 = 2112;
      id v77 = v47;
      _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, fetched %lu visits, most recent visit, %@, for place, %@, error, %@", buf, 0x34u);
    }
    if (v57[5]) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = [v42 compare:v50] == -1;
    }

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v62, 8);
  }
  return v15;
}

void __54__RTPlaceTypeClassifier_isRottedMeCard_inferredPlace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 visits];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getStoredPlacesWithError:(id *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v34 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  uint64_t v40 = [&unk_1F34531F8 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v40)
  {
    uint64_t v37 = *(void *)v53;
    uint64_t v35 = *MEMORY[0x1E4F5CFE8];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    while (2)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(&unk_1F34531F8);
        }
        id v5 = *(void **)(*((void *)&v52 + 1) + 8 * v4);
        dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
        *(void *)&long long v56 = 0;
        *((void *)&v56 + 1) = &v56;
        uint64_t v57 = 0x3032000000;
        uint64_t v58 = __Block_byref_object_copy__106;
        v59 = __Block_byref_object_dispose__106;
        id v60 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v46 = 0;
        id v47 = (id *)&v46;
        uint64_t v48 = 0x3032000000;
        id v49 = __Block_byref_object_copy__106;
        id v50 = __Block_byref_object_dispose__106;
        id v51 = 0;
        uint64_t v7 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
        uint64_t v8 = [v5 unsignedIntegerValue];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke;
        v41[3] = &unk_1E6B927A8;
        v41[4] = self;
        id v43 = &v56;
        id v44 = &v46;
        SEL v45 = a2;
        uint64_t v9 = v6;
        id v42 = v9;
        [v7 fetchLocationsOfInterestWithPlaceType:v8 handler:v41];

        v10 = v9;
        id v11 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v12 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v10, v12)) {
          goto LABEL_11;
        }
        double v13 = [MEMORY[0x1E4F1C9C8] now];
        [v13 timeIntervalSinceDate:v11];
        double v15 = v14;
        dispatch_semaphore_t v16 = objc_opt_new();
        v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
        v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v19 = [v18 filteredArrayUsingPredicate:v17];
        id v20 = [v19 firstObject];

        [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
        id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        dispatch_time_t v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v62 = v36;
        *(void *)buf = @"semaphore wait timeout";
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v62 count:1];
        double v24 = [v22 errorWithDomain:v35 code:15 userInfo:v23];

        if (v24)
        {
          id v25 = v24;

          char v26 = 0;
        }
        else
        {
LABEL_11:
          id v25 = 0;
          char v26 = 1;
        }

        id v27 = v25;
        if ((v26 & 1) == 0) {
          objc_storeStrong(v47 + 5, v25);
        }
        id v28 = v47[5];
        if (v28)
        {
          if (a3) {
            *a3 = v28;
          }
        }
        else if (*(void *)(*((void *)&v56 + 1) + 40))
        {
          [v34 addObjectsFromArray:];
        }

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v56, 8);

        if (v28)
        {
          id v32 = 0;
          v31 = v34;
          goto LABEL_26;
        }
        ++v4;
      }
      while (v40 != v4);
      uint64_t v40 = [&unk_1F34531F8 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }
  v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v34 count];
    LODWORD(v56) = 134217984;
    *(void *)((char *)&v56 + 4) = v30;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEFAULT, "%lu existing places with known type", (uint8_t *)&v56, 0xCu);
  }

  [v34 enumerateObjectsUsingBlock:&__block_literal_global_82];
  v31 = v34;
  id v32 = v34;
LABEL_26:

  return v32;
}

void __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412802;
    v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = [v5 count];
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %lu learned location of interest from learned location store", buf, 0x20u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke_9;
  v16[3] = &unk_1E6B92780;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 48);
  v16[4] = *(void *)(a1 + 32);
  v16[5] = v12;
  v16[6] = v11;
  [v5 enumerateObjectsUsingBlock:v16];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  double v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
  id v15 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v12 = 138413058;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = a3 + 1;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, learned location of interest %lu, %@", (uint8_t *)&v12, 0x2Au);
  }
  v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v11 = [v5 place];
  [v10 addObject:v11];
}

void __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "existing place %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)donateInferredPlaces:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 typeSource] == 1)
        {
          if ([v9 type] == 1)
          {
            uint64_t v10 = 1;
          }
          else if ([v9 type] == 2)
          {
            uint64_t v10 = 2;
          }
          else if ([v9 type] == 3)
          {
            uint64_t v10 = 3;
          }
          else
          {
            uint64_t v10 = 0;
          }
          uint64_t v11 = [(RTPlaceTypeClassifier *)self contactsManager];
          int v12 = [v9 mapItem];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __46__RTPlaceTypeClassifier_donateInferredPlaces___block_invoke;
          v13[3] = &unk_1E6B99800;
          v13[4] = v9;
          [v11 donateAddressFromMapItem:v12 addressLabelType:v10 handler:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void __46__RTPlaceTypeClassifier_donateInferredPlaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  __int16 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = *(void **)(a1 + 32);
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "error, %@, while donating place, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void **)(a1 + 32);
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "successfully donated place, %@, postalAddress, %@", (uint8_t *)&v11, 0x16u);
  }
}

- (id)replaceBusinessMapItemWithReverseGeocodedMapItemForHome:(id)a3
{
  v144[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 mapItem];
  char v6 = [v5 validMUID];

  if (v6)
  {
    uint64_t v113 = 0;
    v114 = &v113;
    uint64_t v115 = 0x3032000000;
    v116 = __Block_byref_object_copy__106;
    v117 = __Block_byref_object_dispose__106;
    id v118 = 0;
    uint64_t v107 = 0;
    v108 = (id *)&v107;
    uint64_t v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__106;
    v111 = __Block_byref_object_dispose__106;
    id v112 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    id v9 = [v4 identifier];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke;
    v103[3] = &unk_1E6B920C8;
    v105 = &v113;
    v106 = &v107;
    uint64_t v10 = v7;
    v104 = v10;
    [(RTLearnedLocationStore *)learnedLocationStore fetchLastVisitToPlaceWithIdentifier:v9 handler:v103];

    int v11 = v10;
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13)) {
      goto LABEL_8;
    }
    id v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;
    long long v17 = objc_opt_new();
    __int16 v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
    uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v20 = [v19 filteredArrayUsingPredicate:v18];
    __int16 v21 = [v20 firstObject];

    [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v140 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v140, 2u);
    }

    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v134 = *MEMORY[0x1E4F28568];
    *(void *)v140 = @"semaphore wait timeout";
    double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:&v134 count:1];
    id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

    if (v25)
    {
      id v26 = v25;

      char v27 = 0;
    }
    else
    {
LABEL_8:
      id v26 = 0;
      char v27 = 1;
    }

    id v29 = v26;
    if ((v27 & 1) == 0) {
      objc_storeStrong(v108 + 5, v26);
    }
    if (v108[5])
    {
      uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v75 = v108[5];
        *(_DWORD *)v140 = 138412546;
        *(void *)&v140[4] = v4;
        *(_WORD *)&v140[12] = 2112;
        *(void *)&v140[14] = v75;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Failed to look up last visit for place, %@, error, %@", v140, 0x16u);
      }

      id v28 = (RTLearnedPlace *)v4;
    }
    else
    {
      v31 = [(id)v114[5] location];
      v94 = [v31 location];

      *(void *)v140 = 0;
      *(void *)&v140[8] = v140;
      *(void *)&v140[16] = 0x3032000000;
      v141 = __Block_byref_object_copy__106;
      v142 = __Block_byref_object_dispose__106;
      id v143 = 0;
      uint64_t v134 = 0;
      v135 = (id *)&v134;
      uint64_t v136 = 0x3032000000;
      v137 = __Block_byref_object_copy__106;
      v138 = __Block_byref_object_dispose__106;
      id v139 = 0;
      id v32 = self->_learnedLocationStore;
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_16;
      v99[3] = &unk_1E6B905F0;
      v101 = v140;
      v102 = &v134;
      v33 = v11;
      v100 = v33;
      [(RTLearnedLocationStore *)v32 fetchPlacesWithinDistance:v94 location:v99 handler:250.0];
      v34 = v33;
      v92 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v35 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v34, v35)) {
        goto LABEL_20;
      }
      v89 = [MEMORY[0x1E4F1C9C8] now];
      [v89 timeIntervalSinceDate:v92];
      double v37 = v36;
      v38 = objc_opt_new();
      id v39 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
      uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v41 = [v40 filteredArrayUsingPredicate:v39];
      id v42 = [v41 firstObject];

      [v38 submitToCoreAnalytics:v42 type:1 duration:v37];
      id v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      id v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v124 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      SEL v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v124 count:1];
      uint64_t v46 = [v44 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v45];

      if (v46)
      {
        id v47 = v46;

        char v48 = 0;
      }
      else
      {
LABEL_20:
        char v48 = 1;
        id v47 = v29;
      }

      id v49 = v47;
      if ((v48 & 1) == 0) {
        objc_storeStrong(v135 + 5, v47);
      }
      if (v135[5])
      {
        id v50 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          id v78 = v135[5];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v94;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v78;
          _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "Failed to look up for places nearby, %@, error, %@", buf, 0x16u);
        }

        id v28 = (RTLearnedPlace *)v4;
      }
      else
      {
        id v51 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_21];
        long long v52 = [*(id *)(*(void *)&v140[8] + 40) filteredArrayUsingPredicate:v51];
        BOOL v53 = [v52 count] == 0;

        if (v53)
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          v131 = __Block_byref_object_copy__106;
          v132 = __Block_byref_object_dispose__106;
          id v133 = 0;
          uint64_t v124 = 0;
          v125 = (id *)&v124;
          uint64_t v126 = 0x3032000000;
          v127 = __Block_byref_object_copy__106;
          v128 = __Block_byref_object_dispose__106;
          id v129 = 0;
          id v55 = objc_alloc(MEMORY[0x1E4F5CE48]);
          long long v56 = (objc_class *)objc_opt_class();
          uint64_t v57 = NSStringFromClass(v56);
          v93 = (void *)[v55 initWithUseBackgroundTraits:1 analyticsIdentifier:v57];

          mapServiceManager = self->_mapServiceManager;
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_23;
          v95[3] = &unk_1E6B905F0;
          v97 = buf;
          v98 = &v124;
          v59 = v34;
          v96 = v59;
          [(RTMapServiceManager *)mapServiceManager fetchMapItemsFromLocation:v94 options:v93 handler:v95];
          id v60 = v59;
          v90 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v61 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v60, v61)) {
            goto LABEL_36;
          }
          v87 = [MEMORY[0x1E4F1C9C8] now];
          [v87 timeIntervalSinceDate:v90];
          double v63 = v62;
          uint64_t v64 = objc_opt_new();
          v65 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
          v66 = [MEMORY[0x1E4F29060] callStackSymbols];
          id v67 = [v66 filteredArrayUsingPredicate:v65];
          id v68 = [v67 firstObject];

          [v64 submitToCoreAnalytics:v68 type:1 duration:v63];
          v69 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v119 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v119, 2u);
          }

          __int16 v70 = (void *)MEMORY[0x1E4F28C58];
          v144[0] = *MEMORY[0x1E4F28568];
          *(void *)v119 = @"semaphore wait timeout";
          uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v144 count:1];
          __int16 v72 = [v70 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v71];

          if (v72)
          {
            id v73 = v72;

            char v74 = 0;
          }
          else
          {
LABEL_36:
            char v74 = 1;
            id v73 = v49;
          }

          id v76 = v73;
          if ((v74 & 1) == 0) {
            objc_storeStrong(v125 + 5, v73);
          }
          if (*(void *)(*(void *)&buf[8] + 40) && !v125[5])
          {
            v88 = [RTLearnedPlace alloc];
            v91 = [v4 identifier];
            uint64_t v79 = [v4 type];
            uint64_t v80 = [v4 typeSource];
            uint64_t v81 = *(void *)(*(void *)&buf[8] + 40);
            v82 = [v4 customLabel];
            v83 = [v4 creationDate];
            v84 = [v4 expirationDate];
            id v28 = [(RTLearnedPlace *)v88 initWithIdentifier:v91 type:v79 typeSource:v80 mapItem:v81 customLabel:v82 creationDate:v83 expirationDate:v84];
          }
          else
          {
            id v77 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              id v86 = v108[5];
              *(_DWORD *)v119 = 138412802;
              *(void *)&v119[4] = v94;
              __int16 v120 = 2112;
              id v121 = v4;
              __int16 v122 = 2112;
              id v123 = v86;
              _os_log_error_impl(&dword_1D9BFA000, v77, OS_LOG_TYPE_ERROR, "Failed to reverse geocode last visit location, %@, for place, %@, error, %@", v119, 0x20u);
            }

            id v28 = (RTLearnedPlace *)v4;
          }

          _Block_object_dispose(&v124, 8);
          _Block_object_dispose(buf, 8);

          id v49 = v76;
        }
        else
        {
          long long v54 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v94;
            _os_log_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_INFO, "There exists another reverseGeocode LearnedPlace nearby this location %@", buf, 0xCu);
          }

          id v28 = (RTLearnedPlace *)v4;
        }
      }
      _Block_object_dispose(&v134, 8);

      _Block_object_dispose(v140, 8);
      id v29 = v49;
    }

    _Block_object_dispose(&v107, 8);
    _Block_object_dispose(&v113, 8);
  }
  else
  {
    id v28 = (RTLearnedPlace *)v4;
  }

  return v28;
}

void __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mapItem];
  uint64_t v3 = [v2 source] & 1;

  return v3;
}

void __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)coalescePlacesFromExperts:(id)a3
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v139 = objc_opt_new();
  id v5 = objc_opt_new();
  id v145 = (id)objc_opt_new();
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  v135 = v3;
  __int16 v8 = [v3 objectForKey:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v187 objects:v213 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v188;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v188 != v11) {
          objc_enumerationMutation(v8);
        }
        dispatch_time_t v13 = *(void **)(*((void *)&v187 + 1) + 8 * i);
        id v14 = [v13 identifier];
        double v15 = [v4 objectForKeyedSubscript:v14];

        if (!v15)
        {
          double v16 = [v13 identifier];
          [v4 setObject:v13 forKeyedSubscript:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v187 objects:v213 count:16];
    }
    while (v10);
  }

  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v17 = (objc_class *)objc_opt_class();
  __int16 v18 = NSStringFromClass(v17);
  uint64_t v19 = [v135 objectForKey:v18];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v183 objects:v212 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v184;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v184 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = *(void **)(*((void *)&v183 + 1) + 8 * j);
        id v25 = [v24 identifier];
        [v139 setObject:v24 forKeyedSubscript:v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v183 objects:v212 count:16];
    }
    while (v21);
  }

  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  obuint64_t j = [v139 allValues];
  uint64_t v140 = [obj countByEnumeratingWithState:&v179 objects:v211 count:16];
  v142 = v4;
  v146 = v5;
  if (v140)
  {
    uint64_t v138 = *(void *)v180;
    do
    {
      id v26 = 0;
      do
      {
        if (*(void *)v180 != v138) {
          objc_enumerationMutation(obj);
        }
        id v143 = v26;
        char v27 = *(void **)(*((void *)&v179 + 1) + 8 * (void)v26);
        long long v175 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        id v148 = [v4 allValues];
        uint64_t v152 = [v148 countByEnumeratingWithState:&v175 objects:v210 count:16];
        if (!v152)
        {
          id v28 = &unk_1F3454098;
          goto LABEL_43;
        }
        uint64_t v150 = *(void *)v176;
        id v28 = &unk_1F3454098;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v176 != v150) {
              objc_enumerationMutation(v148);
            }
            uint64_t v30 = *(void **)(*((void *)&v175 + 1) + 8 * v29);
            v31 = [v27 identifier];
            id v32 = [v30 identifier];
            char v33 = [v31 isEqual:v32];

            v34 = &unk_1F3451AB8;
            if ((v33 & 1) == 0)
            {
              dispatch_time_t v35 = NSNumber;
              double v36 = [(RTPlaceTypeClassifier *)self distanceCalculator];
              double v37 = [v27 mapItem];
              v38 = [v37 location];
              id v39 = [v30 mapItem];
              uint64_t v40 = [v39 location];
              [v36 distanceFromLocation:v38 toLocation:v40 error:0];
              v34 = [v35 numberWithDouble:];

              id v5 = v146;
            }
            id v41 = [v27 identifier];
            id v42 = [v5 objectForKeyedSubscript:v41];
            if (!v42 || ([v28 doubleValue], double v44 = v43, objc_msgSend(v34, "doubleValue"), v44 > v45))
            {

LABEL_32:
              id v46 = v34;

              id v41 = [v27 identifier];
              [v5 setObject:v30 forKeyedSubscript:v41];
              id v28 = v46;
LABEL_35:

              goto LABEL_36;
            }
            if (v28 != v34)
            {

              goto LABEL_35;
            }
            uint64_t v47 = [v27 type];
            uint64_t v48 = [v30 type];

            if (v47 == v48) {
              goto LABEL_32;
            }
LABEL_36:

            ++v29;
          }
          while (v152 != v29);
          uint64_t v49 = [v148 countByEnumeratingWithState:&v175 objects:v210 count:16];
          uint64_t v152 = v49;
        }
        while (v49);
LABEL_43:

        id v4 = v142;
        id v26 = v143 + 1;
      }
      while (v143 + 1 != (char *)v140);
      uint64_t v140 = [obj countByEnumeratingWithState:&v179 objects:v211 count:16];
    }
    while (v140);
  }

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v50 = [v4 allValues];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v171 objects:v209 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v172;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v172 != v53) {
          objc_enumerationMutation(v50);
        }
        id v55 = *(void **)(*((void *)&v171 + 1) + 8 * k);
        long long v56 = [v55 identifier];
        [v145 setObject:v55 forKeyedSubscript:v56];
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v171 objects:v209 count:16];
    }
    while (v52);
  }

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v144 = [v139 allValues];
  uint64_t v151 = [v144 countByEnumeratingWithState:&v167 objects:v208 count:16];
  if (v151)
  {
    id v149 = *(id *)v168;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(id *)v168 != v149) {
          objc_enumerationMutation(v144);
        }
        uint64_t v58 = *(void **)(*((void *)&v167 + 1) + 8 * v57);
        v59 = [v58 identifier];
        id v60 = [v5 objectForKeyedSubscript:v59];

        dispatch_time_t v61 = NSNumber;
        double v62 = [(RTPlaceTypeClassifier *)self distanceCalculator];
        double v63 = [v58 mapItem];
        uint64_t v64 = [v63 location];
        v65 = [v60 mapItem];
        v66 = [v65 location];
        [v62 distanceFromLocation:v64 toLocation:v66 error:0];
        id v67 = [v61 numberWithDouble:];

        [v67 doubleValue];
        if (v68 >= 250.0)
        {
          v153 = v67;
          v89 = v60;
          long long v165 = 0u;
          long long v166 = 0u;
          long long v163 = 0u;
          long long v164 = 0u;
          v90 = [v4 allValues];
          uint64_t v91 = [v90 countByEnumeratingWithState:&v163 objects:v193 count:16];
          if (v91)
          {
            uint64_t v92 = v91;
            uint64_t v93 = *(void *)v164;
LABEL_64:
            uint64_t v94 = 0;
            while (1)
            {
              if (*(void *)v164 != v93) {
                objc_enumerationMutation(v90);
              }
              v95 = *(void **)(*((void *)&v163 + 1) + 8 * v94);
              uint64_t v96 = [v95 type];
              if (v96 == [v58 type]
                && ![(RTPlaceTypeClassifier *)self isRottedMeCard:v95 inferredPlace:v58])
              {
                break;
              }
              if (v92 == ++v94)
              {
                uint64_t v92 = [v90 countByEnumeratingWithState:&v163 objects:v193 count:16];
                if (v92) {
                  goto LABEL_64;
                }
                goto LABEL_71;
              }
            }

            uint64_t v79 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (!os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_76;
            }
            v106 = (objc_class *)objc_opt_class();
            v99 = NSStringFromClass(v106);
            v100 = NSStringFromSelector(a2);
            v101 = v79;
            v102 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v58 type]);
            v103 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v58 type]);
            *(_DWORD *)buf = 138413314;
            v195 = v99;
            __int16 v196 = 2112;
            v197 = v100;
            __int16 v198 = 2112;
            v199 = v102;
            __int16 v200 = 2112;
            v201 = v103;
            __int16 v202 = 2112;
            v203 = v58;
            v104 = v101;
            v105 = "%@, %@, case 2.2, skipping inferred %@ because all meCard %@ are not rotten, %@";
LABEL_75:
            _os_log_impl(&dword_1D9BFA000, v104, OS_LOG_TYPE_DEFAULT, v105, buf, 0x34u);

            uint64_t v79 = v101;
          }
          else
          {
LABEL_71:

            v97 = [v58 identifier];
            [v145 setObject:v58 forKeyedSubscript:v97];

            uint64_t v79 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              v98 = (objc_class *)objc_opt_class();
              v99 = NSStringFromClass(v98);
              v100 = NSStringFromSelector(a2);
              v101 = v79;
              v102 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v58 type]);
              v103 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v58 type]);
              *(_DWORD *)buf = 138413314;
              v195 = v99;
              __int16 v196 = 2112;
              v197 = v100;
              __int16 v198 = 2112;
              v199 = v102;
              __int16 v200 = 2112;
              v201 = v103;
              __int16 v202 = 2112;
              v203 = v58;
              v104 = v101;
              v105 = "%@, %@, case 2.1, yielding inferred %@ since all meCard %@ are rotten, %@";
              goto LABEL_75;
            }
          }
LABEL_76:
          id v5 = v146;
          id v60 = v89;
LABEL_77:
          id v67 = v153;
          goto LABEL_78;
        }
        uint64_t v69 = [v60 type];
        if (v69 == [v58 type])
        {
          v153 = v67;
          v141 = [RTLearnedPlace alloc];
          __int16 v70 = [v60 identifier];
          uint64_t v71 = [v60 type];
          uint64_t v72 = [v60 typeSource];
          uint64_t v73 = [v58 typeSource] | v72;
          char v74 = [v60 mapItem];
          id v75 = [v60 customLabel];
          [v60 creationDate];
          v77 = id v76 = v60;
          id v78 = [v76 expirationDate];
          uint64_t v79 = [(RTLearnedPlace *)v141 initWithIdentifier:v70 type:v71 typeSource:v73 mapItem:v74 customLabel:v75 creationDate:v77 expirationDate:v78];

          id v60 = v76;
          uint64_t v80 = [v79 identifier];
          [v145 setObject:v79 forKeyedSubscript:v80];

          uint64_t v81 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v82 = (objc_class *)objc_opt_class();
            v83 = NSStringFromClass(v82);
            v84 = NSStringFromSelector(a2);
            v85 = v79;
            id v86 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v76 type]);
            v87 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v58 type]);
            [v153 doubleValue];
            *(_DWORD *)buf = 138413826;
            v195 = v83;
            __int16 v196 = 2112;
            v197 = v84;
            __int16 v198 = 2112;
            v199 = v86;
            __int16 v200 = 2112;
            v201 = v87;
            __int16 v202 = 2048;
            v203 = v88;
            __int16 v204 = 2112;
            v205 = v76;
            __int16 v206 = 2112;
            v207 = v58;
            _os_log_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_DEFAULT, "%@, %@, case 1.1, snapping inferred %@ to meCard %@ which are %f meters distance apart, meCard place, %@, inferred place, %@", buf, 0x48u);

            uint64_t v79 = v85;
          }

          id v4 = v142;
          id v5 = v146;
          goto LABEL_77;
        }
        uint64_t v79 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        id v5 = v146;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v107 = (objc_class *)objc_opt_class();
          v108 = NSStringFromClass(v107);
          NSStringFromSelector(a2);
          uint64_t v109 = v154 = v67;
          v110 = v79;
          v111 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v60 type]);
          id v112 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v58 type]);
          [v154 doubleValue];
          *(_DWORD *)buf = 138413826;
          v195 = v108;
          __int16 v196 = 2112;
          v197 = v109;
          __int16 v198 = 2112;
          v199 = v111;
          __int16 v200 = 2112;
          v201 = v112;
          __int16 v202 = 2048;
          v203 = v113;
          __int16 v204 = 2112;
          v205 = v60;
          __int16 v206 = 2112;
          v207 = v58;
          _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_DEFAULT, "%@, %@, case 1.2, skip snapping inferred %@ to meCard %@ which are at %f meters distance apart due to placeType mismatch, meCard place, %@, inferred place, %@", buf, 0x48u);

          uint64_t v79 = v110;
          id v67 = v154;
        }
LABEL_78:

        ++v57;
      }
      while (v57 != v151);
      uint64_t v114 = [v144 countByEnumeratingWithState:&v167 objects:v208 count:16];
      uint64_t v151 = v114;
    }
    while (v114);
  }

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  uint64_t v115 = [v145 allValues];
  uint64_t v116 = [v115 countByEnumeratingWithState:&v159 objects:v192 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v160;
    do
    {
      for (uint64_t m = 0; m != v117; ++m)
      {
        if (*(void *)v160 != v118) {
          objc_enumerationMutation(v115);
        }
        __int16 v120 = *(void **)(*((void *)&v159 + 1) + 8 * m);
        if ([v120 type] == 1 && objc_msgSend(v120, "typeSource") == 1)
        {
          id v121 = [(RTPlaceTypeClassifier *)self replaceBusinessMapItemWithReverseGeocodedMapItemForHome:v120];
          __int16 v122 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
          {
            id v123 = [v120 identifier];
            *(_DWORD *)buf = 138412802;
            v195 = v123;
            __int16 v196 = 2112;
            v197 = v120;
            __int16 v198 = 2112;
            v199 = v121;
            _os_log_impl(&dword_1D9BFA000, v122, OS_LOG_TYPE_INFO, "Replacing business map item with reverse geocoded map item for home loi, identifier, %@, original place, %@, updated place, %@,", buf, 0x20u);
          }
          uint64_t v124 = [v121 identifier];
          [v145 setObject:v121 forKeyedSubscript:v124];
        }
      }
      uint64_t v117 = [v115 countByEnumeratingWithState:&v159 objects:v192 count:16];
    }
    while (v117);
  }

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  v125 = (objc_class *)objc_opt_class();
  uint64_t v126 = NSStringFromClass(v125);
  v127 = [v135 objectForKey:v126];

  uint64_t v128 = [v127 countByEnumeratingWithState:&v155 objects:v191 count:16];
  if (v128)
  {
    uint64_t v129 = v128;
    uint64_t v130 = *(void *)v156;
    do
    {
      for (uint64_t n = 0; n != v129; ++n)
      {
        if (*(void *)v156 != v130) {
          objc_enumerationMutation(v127);
        }
        v132 = *(void **)(*((void *)&v155 + 1) + 8 * n);
        id v133 = [v132 identifier];
        [v145 setObject:v132 forKeyedSubscript:v133];
      }
      uint64_t v129 = [v127 countByEnumeratingWithState:&v155 objects:v191 count:16];
    }
    while (v129);
  }

  return v145;
}

- (id)mergeExistingPlaces:(id)a3 intoUpdatedPlace:(id)a4 typesInMeCard:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    uint64_t v46 = *(void *)v50;
    double v43 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v47 = v9;
      do
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
        dispatch_time_t v13 = [v12 identifier];
        id v14 = [v7 objectForKey:v13];

        if (!v14)
        {
          long long v17 = [v12 mapItem];
          if (([v17 source] & 4) != 0)
          {
            [v17 setExtendedAttributes:0];
            id v26 = [v12 mapItem];
            [v17 setSource:[v26 source] & 0xFFFFFFFFFFFFFFFBLL];
          }
          if (([v17 source] & 8) != 0)
          {
            char v27 = [v12 mapItem];
            [v17 setSource:[v27 source] & 0xFFFFFFFFFFFFFFF7];
          }
          if (([v17 source] & 0x20000) != 0)
          {
            id v28 = [v12 mapItem];
            [v17 setSource:[v28 source] & 0xFFFFFFFFFFFDFFFFLL];
          }
          uint64_t v29 = [RTLearnedPlace alloc];
          uint64_t v30 = [v12 identifier];
          v31 = [v12 customLabel];
          id v32 = [v12 creationDate];
          char v33 = [v12 expirationDate];
          id v14 = [(RTLearnedPlace *)v29 initWithIdentifier:v30 type:0 typeSource:0 mapItem:v17 customLabel:v31 creationDate:v32 expirationDate:v33];

          if (v14)
          {
            v34 = [(RTLearnedPlace *)v14 identifier];
            [v7 setObject:v14 forKey:v34];
          }
LABEL_21:
          uint64_t v10 = v46;
          uint64_t v9 = v47;
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v15 = [(RTLearnedPlace *)v14 type];
        if (v15 == [v12 type])
        {
          uint64_t v16 = [(RTLearnedPlace *)v14 typeSource];
          if (v16 == [v12 typeSource])
          {
            long long v17 = [(RTLearnedPlace *)v14 mapItem];
            uint64_t v18 = [v17 muid];
            uint64_t v19 = [v12 mapItem];
            if (v18 != [v19 muid])
            {

              goto LABEL_22;
            }
            double v45 = [(RTLearnedPlace *)v14 mapItem];
            uint64_t v20 = [v45 address];
            uint64_t v21 = [v12 mapItem];
            uint64_t v22 = [v21 address];
            double v44 = v20;
            if (![v20 isEqualToAddress:v22])
            {

              id v7 = v43;
              goto LABEL_22;
            }
            id v41 = [(RTLearnedPlace *)v14 mapItem];
            uint64_t v23 = [v41 location];
            double v24 = [v12 mapItem];
            id v25 = [v24 location];
            int v42 = [v23 isEqualToLocation:v25];

            if (v42)
            {
              long long v17 = [v12 identifier];
              id v7 = v43;
              [v43 removeObjectForKey:v17];
              goto LABEL_21;
            }
            id v7 = v43;
            uint64_t v10 = v46;
            uint64_t v9 = v47;
          }
        }
LABEL_23:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      uint64_t v9 = v35;
    }
    while (v35);
  }
  double v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = [v7 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = v37;
    _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "Finalized %lu places to be updated from merging the existing and coalesced places (from experts)", buf, 0xCu);
  }

  v38 = [v7 allValues];
  [v38 enumerateObjectsUsingBlock:&__block_literal_global_34];

  id v39 = [v7 allValues];

  return v39;
}

void __76__RTPlaceTypeClassifier_mergeExistingPlaces_intoUpdatedPlace_typesInMeCard___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "finalized place, %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getExperts
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = [RTPlaceTypeClassifierExpertContacts alloc];
  id v5 = [(RTPlaceTypeClassifier *)self contactsManager];
  uint64_t v6 = [(RTPlaceTypeClassifier *)self distanceCalculator];
  id v7 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
  uint64_t v8 = [(RTPlaceTypeClassifier *)self mapServiceManager];
  uint64_t v9 = [(RTPlaceTypeClassifier *)self mapsSupportManager];
  uint64_t v10 = [(RTPlaceTypeClassifier *)self placeTypeClassifierMetricsCalculator];
  uint64_t v11 = [(RTPlaceTypeClassifierExpertContacts *)v4 initWithContactsManager:v5 distanceCalculator:v6 learnedLocationStore:v7 mapServiceManager:v8 mapsSupportManager:v9 placeTypeClassifierMetricsCalculator:v10];

  [v3 addObject:v11];
  id v12 = [RTPlaceTypeClassifierExpertInferred alloc];
  dispatch_time_t v13 = [(RTPlaceTypeClassifier *)self biomeManager];
  id v14 = [(RTPlaceTypeClassifier *)self defaultsManager];
  uint64_t v15 = [(RTPlaceTypeClassifier *)self distanceCalculator];
  uint64_t v16 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
  long long v17 = [(RTPlaceTypeClassifier *)self placeTypeClassifierMetricsCalculator];
  uint64_t v18 = [(RTPlaceTypeClassifier *)self platform];
  uint64_t v19 = [(RTPlaceTypeClassifierExpertInferred *)v12 initWithBiomeManager:v13 defaultsManager:v14 distanceCalculator:v15 learnedLocationStore:v16 placeTypeClassifierMetricsCalculator:v17 platform:v18];

  [v3 addObject:v19];
  uint64_t v20 = [RTPlaceTypeClassifierExpertFallback alloc];
  uint64_t v21 = [(RTPlaceTypeClassifier *)self distanceCalculator];
  uint64_t v22 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
  uint64_t v23 = [(RTPlaceTypeClassifier *)self locationManager];
  double v24 = [(RTPlaceTypeClassifier *)self mapServiceManager];
  id v25 = [(RTPlaceTypeClassifier *)self visitManager];
  id v26 = [(RTPlaceTypeClassifierExpertFallback *)v20 initWithDistanceCalculator:v21 learnedLocationStore:v22 locationManager:v23 mapServiceManager:v24 visitManager:v25];

  [v3 addObject:v26];

  return v3;
}

- (BOOL)updatePlaces:(id)a3 error:(id *)a4
{
  v423[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v354 = [MEMORY[0x1E4F1CA48] array];
  v263 = [MEMORY[0x1E4F1CA48] array];
  v348 = [MEMORY[0x1E4F1CA48] array];
  v262 = [MEMORY[0x1E4F1CA48] array];
  v264 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
  v353 = [v5 predicateForObjectsFromCurrentDevice];

  uint64_t v6 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
  v352 = [v6 predicateForObjectsNotFromCurrentDevice];

  long long v405 = 0u;
  long long v406 = 0u;
  long long v403 = 0u;
  long long v404 = 0u;
  obuint64_t j = v4;
  uint64_t v355 = [obj countByEnumeratingWithState:&v403 objects:v422 count:16];
  if (v355)
  {
    uint64_t v351 = *(void *)v404;
    uint64_t v358 = *MEMORY[0x1E4F5CFE8];
    uint64_t v359 = *MEMORY[0x1E4F28568];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v404 != v351)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }
        uint64_t v360 = v7;
        uint64_t v9 = *(void **)(*((void *)&v403 + 1) + 8 * v7);
        context = (void *)MEMORY[0x1E016D870]();
        uint64_t v397 = 0;
        v398 = (id *)&v397;
        uint64_t v399 = 0x3032000000;
        v400 = __Block_byref_object_copy__106;
        v401 = __Block_byref_object_dispose__106;
        id v402 = 0;
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        uint64_t v11 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
        id v12 = [v9 mapItem];
        v392[0] = MEMORY[0x1E4F143A8];
        v392[1] = 3221225472;
        v392[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke;
        v392[3] = &unk_1E6B99828;
        id v13 = v354;
        v396 = &v397;
        id v393 = v13;
        v394 = v9;
        id v14 = v10;
        v395 = v14;
        [v11 fetchPlaceWithMapItem:v12 predicate:v353 handler:v392];

        uint64_t v15 = v14;
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v17 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v15, v17)) {
          goto LABEL_11;
        }
        uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
        [v18 timeIntervalSinceDate:v16];
        double v20 = v19;
        uint64_t v21 = objc_opt_new();
        uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
        uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v24 = [v23 filteredArrayUsingPredicate:v22];
        id v25 = [v24 firstObject];

        [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
        id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v418 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v418, 2u);
        }

        char v27 = (void *)MEMORY[0x1E4F28C58];
        *(void *)v414 = v359;
        *(void *)v418 = @"semaphore wait timeout";
        id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v418 forKeys:v414 count:1];
        uint64_t v29 = [v27 errorWithDomain:v358 code:15 userInfo:v28];

        if (v29)
        {
          id v30 = v29;
        }
        else
        {
LABEL_11:
          id v30 = 0;
        }

        id v31 = v30;
        *(void *)v418 = 0;
        *(void *)&v418[8] = v418;
        *(void *)&v418[16] = 0x3032000000;
        v419 = __Block_byref_object_copy__106;
        v420 = __Block_byref_object_dispose__106;
        id v421 = 0;
        dispatch_semaphore_t v32 = dispatch_semaphore_create(0);

        char v33 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
        v34 = [v9 mapItem];
        v387[0] = MEMORY[0x1E4F143A8];
        v387[1] = 3221225472;
        v387[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_36;
        v387[3] = &unk_1E6B99850;
        id v35 = v13;
        v391 = v418;
        id v356 = v35;
        id v388 = v35;
        v389 = v9;
        double v36 = v32;
        v390 = v36;
        [v33 fetchPlacesWithMapItem:v34 predicate:v352 handler:v387];

        dsema = v36;
        uint64_t v37 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v38 = dispatch_time(0, 3600000000000);
        id v39 = v31;
        if (dispatch_semaphore_wait(dsema, v38))
        {
          uint64_t v40 = [MEMORY[0x1E4F1C9C8] now];
          [v40 timeIntervalSinceDate:v37];
          double v42 = v41;
          double v43 = objc_opt_new();
          double v44 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
          double v45 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v46 = [v45 filteredArrayUsingPredicate:v44];
          uint64_t v47 = [v46 firstObject];

          [v43 submitToCoreAnalytics:v47 type:1 duration:v42];
          uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v414 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v414, 2u);
          }

          long long v49 = (void *)MEMORY[0x1E4F28C58];
          *(void *)v410 = v359;
          *(void *)v414 = @"semaphore wait timeout";
          long long v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v414 forKeys:v410 count:1];
          long long v51 = [v49 errorWithDomain:v358 code:15 userInfo:v50];

          id v39 = v31;
          if (v51)
          {
            id v39 = v51;
          }
        }

        id v362 = v39;
        if (v398[5])
        {
          if ([v9 typeSource] == 8)
          {
            long long v52 = [RTLearnedPlace alloc];
            uint64_t v53 = [v9 identifier];
            uint64_t v54 = [v9 mapItem];
            id v55 = [v9 customLabel];
            uint64_t v56 = [v9 creationDate];
            uint64_t v57 = [v9 expirationDate];
            dispatch_semaphore_t v364 = [(RTLearnedPlace *)v52 initWithIdentifier:v53 type:0 typeSource:0 mapItem:v54 customLabel:v55 creationDate:v56 expirationDate:v57];

            [v348 addObject:v364];
            uint64_t v58 = v398;
            id v59 = v9;
            id v60 = (RTLearnedPlace *)v58[5];
            v58[5] = v59;
            goto LABEL_34;
          }
          v83 = [v9 mapItem];
          v84 = [v83 address];
          v85 = [v398[5] mapItem];
          id v86 = [v85 address];
          if ([v84 isEqualToAddress:v86])
          {
            v87 = [v9 mapItem];
            v88 = [v87 location];
            v89 = [v398[5] mapItem];
            v90 = [v89 location];
            char v91 = [v88 isEqualToLocation:v90];

            if (v91)
            {
              dispatch_semaphore_t v364 = 0;
LABEL_28:
              if ([v398[5] type] || objc_msgSend(v398[5], "typeSource") || (dispatch_semaphore_t v103 = v364) != 0)
              {
                v97 = [RTLearnedPlace alloc];
                v98 = [v398[5] identifier];
                dispatch_semaphore_t v99 = v364;
                if (!v364)
                {
                  v265 = [v398[5] mapItem];
                  dispatch_semaphore_t v99 = v265;
                }
                v100 = [v398[5] customLabel];
                v101 = [v398[5] creationDate];
                v102 = [v398[5] expirationDate];
                id v60 = [(RTLearnedPlace *)v97 initWithIdentifier:v98 type:0 typeSource:0 mapItem:v99 customLabel:v100 creationDate:v101 expirationDate:v102];

                if (!v364) {
                [v348 addObject:v60];
                }
                objc_storeStrong(v398 + 5, v60);
LABEL_34:

                dispatch_semaphore_t v103 = v364;
              }

              goto LABEL_36;
            }
            dispatch_semaphore_t v365 = (dispatch_semaphore_t)objc_alloc(MEMORY[0x1E4F5CE38]);
            v83 = [v398[5] mapItem];
            v84 = [v83 identifier];
            v85 = [v398[5] mapItem];
            id v86 = [v85 name];
            v350 = [v398[5] mapItem];
            v313 = [v350 category];
            v346 = [v398[5] mapItem];
            v319 = [v346 address];
            v343 = [v9 mapItem];
            v316 = [v343 location];
            v340 = [v398[5] mapItem];
            uint64_t v302 = [v340 source];
            v337 = [v398[5] mapItem];
            uint64_t v300 = [v337 mapItemPlaceType];
            v334 = [v398[5] mapItem];
            uint64_t v298 = [v334 muid];
            v331 = [v398[5] mapItem];
            uint64_t v296 = [v331 resultProviderID];
            v328 = [v398[5] mapItem];
            v310 = [v328 geoMapItemHandle];
            v325 = [v398[5] mapItem];
            v304 = [v325 creationDate];
            v322 = [v398[5] mapItem];
            v307 = [v322 expirationDate];
            uint64_t v92 = [v398[5] mapItem];
            uint64_t v93 = [v92 extendedAttributes];
            uint64_t v94 = [v398[5] mapItem];
            v95 = [v94 displayLanguage];
            uint64_t v96 = [v398[5] mapItem];
            LOBYTE(v258) = [v96 disputed];
            dispatch_semaphore_t v364 = [v365 initWithIdentifier:v84 name:v86 category:v313 address:v319 location:v316 source:v302 mapItemPlaceType:v300 muid:v298 resultProviderID:v296 geoMapItemHandle:v310 creationDate:v304 expirationDate:v307 extendedAttributes:v93 displayLanguage:v95 disputed:v258];
          }
          else
          {
            dispatch_semaphore_t v364 = 0;
          }

          goto LABEL_28;
        }
        if (![*(id *)(*(void *)&v418[8] + 40) count])
        {
          dispatch_semaphore_t v364 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v349 = [v364 dateByAddingTimeInterval:4838400.0];
          id v266 = objc_alloc(MEMORY[0x1E4F5CD80]);
          v282 = [MEMORY[0x1E4F29128] UUID];
          v344 = [v9 mapItem];
          v341 = [v344 address];
          v281 = [v341 geoAddressData];
          v338 = [v9 mapItem];
          v335 = [v338 address];
          v280 = [v335 subPremises];
          v332 = [v9 mapItem];
          v329 = [v332 address];
          v279 = [v329 subThoroughfare];
          v326 = [v9 mapItem];
          v323 = [v326 address];
          v278 = [v323 thoroughfare];
          v320 = [v9 mapItem];
          v317 = [v320 address];
          v277 = [v317 subLocality];
          v314 = [v9 mapItem];
          v311 = [v314 address];
          v276 = [v311 locality];
          v308 = [v9 mapItem];
          v305 = [v308 address];
          v275 = [v305 subAdministrativeArea];
          v303 = [v9 mapItem];
          v301 = [v303 address];
          v274 = [v301 administrativeArea];
          v299 = [v9 mapItem];
          v297 = [v299 address];
          v273 = [v297 administrativeAreaCode];
          v295 = [v9 mapItem];
          v294 = [v295 address];
          v272 = [v294 postalCode];
          v293 = [v9 mapItem];
          v292 = [v293 address];
          v271 = [v292 country];
          v291 = [v9 mapItem];
          v290 = [v291 address];
          v270 = [v290 countryCode];
          v289 = [v9 mapItem];
          v288 = [v289 address];
          v283 = [v288 inlandWater];
          v287 = [v9 mapItem];
          v286 = [v287 address];
          v269 = [v286 ocean];
          v285 = [v9 mapItem];
          v284 = [v285 address];
          v268 = [v284 areasOfInterest];
          dispatch_time_t v61 = [v9 mapItem];
          double v62 = [v61 address];
          char v63 = [v62 isIsland];
          uint64_t v64 = [v9 mapItem];
          v65 = [v64 address];
          v66 = [v65 iso3166CountryCode];
          id v67 = [v9 mapItem];
          double v68 = [v67 address];
          uint64_t v69 = [v68 iso3166SubdivisionCode];
          LOBYTE(v260) = v63;
          v267 = objc_msgSend(v266, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v282, v281, v280, v279, v278, v277, v276, v275, v274, v273, v272, v271, v270, v283,
                           v269,
                           v268,
                           v260,
                           v364,
                           v349,
                           v66,
                           v69);

          id v312 = objc_alloc(MEMORY[0x1E4F5CE38]);
          v324 = [MEMORY[0x1E4F29128] UUID];
          v345 = [v9 mapItem];
          v321 = [v345 name];
          v342 = [v9 mapItem];
          v318 = [v342 category];
          v339 = [v9 mapItem];
          v315 = [v339 location];
          v336 = [v9 mapItem];
          uint64_t v309 = [v336 source];
          v333 = [v9 mapItem];
          uint64_t v306 = [v333 mapItemPlaceType];
          v330 = [v9 mapItem];
          uint64_t v70 = [v330 muid];
          v327 = [v9 mapItem];
          uint64_t v71 = [v327 resultProviderID];
          uint64_t v72 = [v9 mapItem];
          uint64_t v73 = [v72 geoMapItemHandle];
          char v74 = [v9 mapItem];
          id v75 = [v74 extendedAttributes];
          id v76 = [v9 mapItem];
          id v77 = [v76 displayLanguage];
          id v78 = [v9 mapItem];
          LOBYTE(v259) = [v78 disputed];
          uint64_t v79 = (void *)[v312 initWithIdentifier:v324 name:v321 category:v318 address:v267 location:v315 source:v309 mapItemPlaceType:v306 muid:v70 resultProviderID:v71 geoMapItemHandle:v73 creationDate:v364 expirationDate:v349 extendedAttributes:v75 displayLanguage:v77 disputed:v259];

          uint64_t v80 = [RTLearnedPlace alloc];
          uint64_t v81 = [MEMORY[0x1E4F29128] UUID];
          v82 = [(RTLearnedPlace *)v80 initWithIdentifier:v81 type:0 typeSource:0 mapItem:v79 customLabel:0 creationDate:v364 expirationDate:v349];

          [v263 addObject:v82];
          objc_storeStrong(v398 + 5, v82);

          id v60 = (RTLearnedPlace *)v349;
          goto LABEL_34;
        }
LABEL_36:
        id v104 = v398[5];
        if (v104)
        {
          dispatch_semaphore_t v366 = (dispatch_semaphore_t)v104;
        }
        else
        {
          dispatch_semaphore_t v366 = [*(id *)(*(void *)&v418[8] + 40) firstObject];
        }
        *(void *)v414 = 0;
        *(void *)&v414[8] = v414;
        *(void *)&v414[16] = 0x3032000000;
        v415 = __Block_byref_object_copy__106;
        v416 = __Block_byref_object_dispose__106;
        id v417 = 0;
        *(void *)v410 = 0;
        *(void *)&v410[8] = v410;
        *(void *)&v410[16] = 0x3032000000;
        v411 = __Block_byref_object_copy__106;
        v412 = __Block_byref_object_dispose__106;
        id v413 = 0;
        dispatch_semaphore_t v105 = dispatch_semaphore_create(0);
        v106 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
        uint64_t v107 = [v9 identifier];
        v383[0] = MEMORY[0x1E4F143A8];
        v383[1] = 3221225472;
        v383[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_40;
        v383[3] = &unk_1E6B90B28;
        v385 = v410;
        v386 = v414;
        v108 = v105;
        v384 = v108;
        [v106 fetchLocationOfInterestWithIdentifier:v107 handler:v383];

        uint64_t v109 = v108;
        v110 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v111 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v109, v111)) {
          goto LABEL_44;
        }
        id v112 = [MEMORY[0x1E4F1C9C8] now];
        [v112 timeIntervalSinceDate:v110];
        double v114 = v113;
        uint64_t v115 = objc_opt_new();
        uint64_t v116 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
        uint64_t v117 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v118 = [v117 filteredArrayUsingPredicate:v116];
        v119 = [v118 firstObject];

        [v115 submitToCoreAnalytics:v119 type:1 duration:v114];
        __int16 v120 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v120, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        id v121 = (void *)MEMORY[0x1E4F28C58];
        v423[0] = v359;
        *(void *)buf = @"semaphore wait timeout";
        __int16 v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v423 count:1];
        id v123 = [v121 errorWithDomain:v358 code:15 userInfo:v122];

        if (v123)
        {
          id v124 = v123;

          char v125 = 0;
        }
        else
        {
LABEL_44:
          char v125 = 1;
          id v124 = v362;
        }

        id v126 = v124;
        if ((v125 & 1) == 0) {
          objc_storeStrong((id *)(*(void *)&v414[8] + 40), v124);
        }
        if (*(void *)(*(void *)&v414[8] + 40))
        {
          v127 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            uint64_t v128 = *(void *)(*(void *)&v414[8] + 40);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v9;
            __int16 v408 = 2112;
            uint64_t v409 = v128;
            _os_log_impl(&dword_1D9BFA000, v127, OS_LOG_TYPE_INFO, "failed to fetch locationofInterest, %@, error, %@", buf, 0x16u);
          }

          [v356 addObject:*(void *)(*(void *)&v414[8] + 40)];
        }
        else
        {
          if (*(void *)(*(void *)&v410[8] + 40))
          {
            uint64_t v129 = [RTLearnedPlace alloc];
            uint64_t v130 = [v9 identifier];
            uint64_t v131 = [v9 type];
            uint64_t v132 = [v9 typeSource];
            id v133 = [v366 mapItem];
            uint64_t v134 = [v9 customLabel];
            v135 = [v9 creationDate];
            uint64_t v136 = [v9 expirationDate];
            v137 = [(RTLearnedPlace *)v129 initWithIdentifier:v130 type:v131 typeSource:v132 mapItem:v133 customLabel:v134 creationDate:v135 expirationDate:v136];

            uint64_t v138 = [RTLearnedLocationOfInterest alloc];
            id v139 = [*(id *)(*(void *)&v410[8] + 40) identifier];
            uint64_t v140 = [*(id *)(*(void *)&v410[8] + 40) location];
            v141 = [*(id *)(*(void *)&v410[8] + 40) visits];
            v142 = [*(id *)(*(void *)&v410[8] + 40) transitions];
            uint64_t v143 = [(RTLearnedLocationOfInterest *)v138 initWithIdentifier:v139 location:v140 place:v137 visits:v141 transitions:v142];
            id v144 = *(void **)(*(void *)&v410[8] + 40);
            *(void *)(*(void *)&v410[8] + 40) = v143;

            if (*(void *)(*(void *)&v410[8] + 40)) {
              [v264 addObject:];
            }
          }
          else
          {
            id v145 = v398[5];
            if (v145) {
              [v145 mapItem];
            }
            else {
            v146 = [v9 mapItem];
            }
            v137 = [v146 location];

            v363 = [[RTLearnedLocation alloc] initWithLocation:v137 dataPointCount:0 confidence:0.0];
            if (v363)
            {
              v147 = [RTLearnedPlace alloc];
              v357 = [v366 identifier];
              uint64_t v148 = [v9 type];
              uint64_t v149 = [v9 typeSource];
              uint64_t v150 = [v366 mapItem];
              uint64_t v151 = [v366 customLabel];
              uint64_t v152 = [v366 creationDate];
              v153 = [v366 expirationDate];
              v154 = [(RTLearnedPlace *)v147 initWithIdentifier:v357 type:v148 typeSource:v149 mapItem:v150 customLabel:v151 creationDate:v152 expirationDate:v153];

              long long v155 = [RTLearnedLocationOfInterest alloc];
              long long v156 = [v154 identifier];
              uint64_t v157 = [(RTLearnedLocationOfInterest *)v155 initWithIdentifier:v156 location:v363 place:v154 visits:0 transitions:0];
              long long v158 = *(void **)(*(void *)&v410[8] + 40);
              *(void *)(*(void *)&v410[8] + 40) = v157;

              if (*(void *)(*(void *)&v410[8] + 40)) {
                [v262 addObject:];
              }
            }
            else
            {
              v154 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v9;
                __int16 v408 = 2048;
                uint64_t v409 = 0;
                _os_log_error_impl(&dword_1D9BFA000, v154, OS_LOG_TYPE_ERROR, "failed to create locationOfInterest for place, %@, with %lu visits", buf, 0x16u);
              }
            }
          }
        }

        _Block_object_dispose(v410, 8);
        _Block_object_dispose(v414, 8);

        _Block_object_dispose(v418, 8);
        _Block_object_dispose(&v397, 8);

        uint64_t v7 = v360 + 1;
      }
      while (v355 != v360 + 1);
      uint64_t v355 = [obj countByEnumeratingWithState:&v403 objects:v422 count:16];
    }
    while (v355);
  }

  if ([v354 count])
  {
    if (a4)
    {
      long long v159 = _RTSafeArray();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v160 = 0;
  }
  else
  {
    uint64_t v397 = 0;
    v398 = (id *)&v397;
    uint64_t v399 = 0x3032000000;
    v400 = __Block_byref_object_copy__106;
    v401 = __Block_byref_object_dispose__106;
    id v402 = 0;
    dispatch_semaphore_t v161 = dispatch_semaphore_create(0);
    long long v162 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
    v380[0] = MEMORY[0x1E4F143A8];
    v380[1] = 3221225472;
    v380[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_43;
    v380[3] = &unk_1E6B90728;
    v382 = &v397;
    long long v163 = v161;
    v381 = v163;
    [v162 storePlaces:v263 handler:v380];

    dsemaa = v163;
    long long v164 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v165 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsemaa, v165)) {
      goto LABEL_78;
    }
    long long v166 = [MEMORY[0x1E4F1C9C8] now];
    [v166 timeIntervalSinceDate:v164];
    double v168 = v167;
    long long v169 = objc_opt_new();
    long long v170 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
    long long v171 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v172 = [v171 filteredArrayUsingPredicate:v170];
    long long v173 = [v172 firstObject];

    [v169 submitToCoreAnalytics:v173 type:1 duration:v168];
    long long v174 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v174, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v418 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v174, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v418, 2u);
    }

    long long v175 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v414 = *MEMORY[0x1E4F28568];
    *(void *)v418 = @"semaphore wait timeout";
    long long v176 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v418 forKeys:v414 count:1];
    long long v177 = [v175 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v176];

    if (v177)
    {
      id v178 = v177;

      char v179 = 0;
    }
    else
    {
LABEL_78:
      id v178 = 0;
      char v179 = 1;
    }

    id v180 = v178;
    if ((v179 & 1) == 0) {
      objc_storeStrong(v398 + 5, v178);
    }
    if (v398[5]) {
      [v354 addObject:];
    }
    long long v181 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
    {
      uint64_t v182 = [v263 count];
      id v183 = v398[5];
      *(_DWORD *)v418 = 134218242;
      *(void *)&v418[4] = v182;
      *(_WORD *)&v418[12] = 2112;
      *(void *)&v418[14] = v183;
      _os_log_impl(&dword_1D9BFA000, v181, OS_LOG_TYPE_INFO, "added %lu placeholder places for meCard postalAddress mapItems, error, %@", v418, 0x16u);
    }

    [v263 enumerateObjectsUsingBlock:&__block_literal_global_47];
    *(void *)v418 = 0;
    *(void *)&v418[8] = v418;
    *(void *)&v418[16] = 0x3032000000;
    v419 = __Block_byref_object_copy__106;
    v420 = __Block_byref_object_dispose__106;
    id v421 = 0;
    dispatch_semaphore_t v184 = dispatch_semaphore_create(0);
    long long v185 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
    v377[0] = MEMORY[0x1E4F143A8];
    v377[1] = 3221225472;
    v377[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_48;
    v377[3] = &unk_1E6B90728;
    v379 = v418;
    long long v186 = v184;
    v378 = v186;
    [v185 updatePlaces:v348 handler:v377];

    v367 = v186;
    long long v187 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v188 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v367, v188)) {
      goto LABEL_90;
    }
    long long v189 = [MEMORY[0x1E4F1C9C8] now];
    [v189 timeIntervalSinceDate:v187];
    double v191 = v190;
    v192 = objc_opt_new();
    v193 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
    v194 = [MEMORY[0x1E4F29060] callStackSymbols];
    v195 = [v194 filteredArrayUsingPredicate:v193];
    __int16 v196 = [v195 firstObject];

    [v192 submitToCoreAnalytics:v196 type:1 duration:v191];
    v197 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v197, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v414 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v197, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v414, 2u);
    }

    __int16 v198 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v410 = *MEMORY[0x1E4F28568];
    *(void *)v414 = @"semaphore wait timeout";
    v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v414 forKeys:v410 count:1];
    __int16 v200 = [v198 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v199];

    if (v200)
    {
      id v201 = v200;

      char v202 = 0;
    }
    else
    {
LABEL_90:
      char v202 = 1;
      id v201 = v180;
    }

    id v203 = v201;
    if ((v202 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&v418[8] + 40), v201);
    }
    if (*(void *)(*(void *)&v418[8] + 40)) {
      [v354 addObject:];
    }
    __int16 v204 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
    {
      uint64_t v205 = [v348 count];
      uint64_t v206 = *(void *)(*(void *)&v418[8] + 40);
      *(_DWORD *)v414 = 134218242;
      *(void *)&v414[4] = v205;
      *(_WORD *)&v414[12] = 2112;
      *(void *)&v414[14] = v206;
      _os_log_impl(&dword_1D9BFA000, v204, OS_LOG_TYPE_INFO, "updated %lu places, error, %@", v414, 0x16u);
    }

    [v348 enumerateObjectsUsingBlock:&__block_literal_global_51];
    *(void *)v414 = 0;
    *(void *)&v414[8] = v414;
    *(void *)&v414[16] = 0x3032000000;
    v415 = __Block_byref_object_copy__106;
    v416 = __Block_byref_object_dispose__106;
    id v417 = 0;
    dispatch_semaphore_t v207 = dispatch_semaphore_create(0);
    v208 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
    v374[0] = MEMORY[0x1E4F143A8];
    v374[1] = 3221225472;
    v374[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_52;
    v374[3] = &unk_1E6B90728;
    v376 = v414;
    v209 = v207;
    v375 = v209;
    [v208 storeLocationsOfInterest:v262 handler:v374];

    v210 = v209;
    v211 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v212 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v210, v212)) {
      goto LABEL_102;
    }
    v213 = [MEMORY[0x1E4F1C9C8] now];
    [v213 timeIntervalSinceDate:v211];
    double v215 = v214;
    v216 = objc_opt_new();
    v217 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
    v218 = [MEMORY[0x1E4F29060] callStackSymbols];
    v219 = [v218 filteredArrayUsingPredicate:v217];
    v220 = [v219 firstObject];

    [v216 submitToCoreAnalytics:v220 type:1 duration:v215];
    v221 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v221, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v410 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v221, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v410, 2u);
    }

    v222 = (void *)MEMORY[0x1E4F28C58];
    *(void *)buf = *MEMORY[0x1E4F28568];
    *(void *)v410 = @"semaphore wait timeout";
    v223 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v410 forKeys:buf count:1];
    v224 = [v222 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v223];

    if (v224)
    {
      id v225 = v224;

      char v226 = 0;
    }
    else
    {
LABEL_102:
      char v226 = 1;
      id v225 = v203;
    }

    id v227 = v225;
    if ((v226 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&v414[8] + 40), v225);
    }
    if (*(void *)(*(void *)&v414[8] + 40)) {
      [v354 addObject:];
    }
    v228 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v228, OS_LOG_TYPE_INFO))
    {
      uint64_t v229 = [v262 count];
      uint64_t v230 = *(void *)(*(void *)&v414[8] + 40);
      *(_DWORD *)v410 = 134218242;
      *(void *)&v410[4] = v229;
      *(_WORD *)&v410[12] = 2112;
      *(void *)&v410[14] = v230;
      _os_log_impl(&dword_1D9BFA000, v228, OS_LOG_TYPE_INFO, "added %lu placeholder locations of interests for meCard postalAddress mapItems, error, %@", v410, 0x16u);
    }

    [v262 enumerateObjectsUsingBlock:&__block_literal_global_55];
    *(void *)v410 = 0;
    *(void *)&v410[8] = v410;
    *(void *)&v410[16] = 0x3032000000;
    v411 = __Block_byref_object_copy__106;
    v412 = __Block_byref_object_dispose__106;
    id v413 = 0;
    dispatch_semaphore_t v231 = dispatch_semaphore_create(0);
    v232 = [(RTPlaceTypeClassifier *)self learnedLocationStore];
    v371[0] = MEMORY[0x1E4F143A8];
    v371[1] = 3221225472;
    v371[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_56;
    v371[3] = &unk_1E6B90728;
    v373 = v410;
    v233 = v231;
    v372 = v233;
    [v232 updateLocationsOfInterest:v264 handler:v371];

    v234 = v233;
    v235 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v236 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v234, v236)) {
      goto LABEL_114;
    }
    v237 = [MEMORY[0x1E4F1C9C8] now];
    [v237 timeIntervalSinceDate:v235];
    double v239 = v238;
    v240 = objc_opt_new();
    v241 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_166];
    v242 = [MEMORY[0x1E4F29060] callStackSymbols];
    v243 = [v242 filteredArrayUsingPredicate:v241];
    v244 = [v243 firstObject];

    [v240 submitToCoreAnalytics:v244 type:1 duration:v239];
    v245 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v245, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v245, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v246 = (void *)MEMORY[0x1E4F28C58];
    v423[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v247 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v423 count:1];
    v248 = [v246 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v247];

    if (v248)
    {
      id v249 = v248;

      char v250 = 0;
    }
    else
    {
LABEL_114:
      char v250 = 1;
      id v249 = v227;
    }

    id v251 = v249;
    if ((v250 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&v410[8] + 40), v249);
    }
    if (*(void *)(*(void *)&v410[8] + 40)) {
      [v354 addObject:];
    }
    v252 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v252, OS_LOG_TYPE_INFO))
    {
      uint64_t v253 = [v264 count];
      uint64_t v254 = *(void *)(*(void *)&v410[8] + 40);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v253;
      __int16 v408 = 2112;
      uint64_t v409 = v254;
      _os_log_impl(&dword_1D9BFA000, v252, OS_LOG_TYPE_INFO, "updated %lu learnedLocationsOfInterest, error, %@", buf, 0x16u);
    }

    [v264 enumerateObjectsUsingBlock:&__block_literal_global_59];
    uint64_t v255 = [v354 count];
    BOOL v160 = v255 == 0;
    if (a4 && v255)
    {
      v256 = _RTSafeArray();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(v410, 8);

    _Block_object_dispose(v414, 8);
    _Block_object_dispose(v418, 8);

    _Block_object_dispose(&v397, 8);
  }

  return v160;
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7) {
    [*(id *)(a1 + 32) addObject:v7];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [*(id *)(a1 + 40) mapItem];
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "fetched place, %@, from current device with mapItem, %@, error, %@", (uint8_t *)&v10, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7) {
    [*(id *)(a1 + 32) addObject:v7];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 count];
    int v10 = [*(id *)(a1 + 40) mapItem];
    int v11 = 134218498;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "fetched %lu places, from other devices with mapItem, %@, error, %@", (uint8_t *)&v11, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_40(uint64_t a1, void *a2, void *a3)
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

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_43(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_45(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stored place %lu : %@", (uint8_t *)&v6, 0x16u);
  }
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_48(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_49(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "updated place %lu : %@", (uint8_t *)&v6, 0x16u);
  }
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_52(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_53(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stored location of interest %lu : %@", (uint8_t *)&v6, 0x16u);
  }
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_56(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_57(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "updated location of interest %lu : %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)getClassificationsFromExperts:(id)a3 error:(id *)a4
{
  id v35 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = v5;
  uint64_t v41 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v54;
    id v36 = v7;
    uint64_t v37 = v6;
    id v39 = self;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v54 != v40) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(void **)(*((void *)&v53 + 1) + 8 * v8);
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = objc_opt_class();
      if (v12 == objc_opt_class())
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v13 = v6;
        uint64_t v24 = [v13 countByEnumeratingWithState:&v49 objects:v64 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v50;
          uint64_t v38 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v50 != v26) {
                objc_enumerationMutation(v13);
              }
              uint64_t v28 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              [v13 objectForKeyedSubscript:v28, v35];
              id v23 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v29 = [v23 countByEnumeratingWithState:&v45 objects:v63 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v46;
                while (2)
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v46 != v31) {
                      objc_enumerationMutation(v23);
                    }
                    if ([*(id *)(*((void *)&v45 + 1) + 8 * j) type] == 1)
                    {
                      id v7 = v36;
                      int v6 = v37;
                      self = v39;
                      goto LABEL_35;
                    }
                  }
                  uint64_t v30 = [v23 countByEnumeratingWithState:&v45 objects:v63 count:16];
                  if (v30) {
                    continue;
                  }
                  break;
                }
              }

              self = v39;
              uint64_t v26 = v38;
            }
            uint64_t v25 = [v13 countByEnumeratingWithState:&v49 objects:v64 count:16];
            id v7 = v36;
            int v6 = v37;
          }
          while (v25);
        }
      }
      id v44 = 0;
      [v9 classifyWithError:&v44, v35];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = v44;
      __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [v13 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v58 = v11;
        __int16 v59 = 2048;
        uint64_t v60 = v16;
        __int16 v61 = 2112;
        id v62 = v14;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "expert, %@, classified places, %lu, error, %@", buf, 0x20u);
      }

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __61__RTPlaceTypeClassifier_getClassificationsFromExperts_error___block_invoke;
      v42[3] = &unk_1E6B99898;
      id v17 = v11;
      id v43 = v17;
      [v13 enumerateObjectsUsingBlock:v42];
      if (v14)
      {
        if (v35) {
          id *v35 = v14;
        }

        id v33 = 0;
        goto LABEL_41;
      }
      uint64_t v18 = objc_opt_class();
      if (v18 != objc_opt_class()) {
        goto LABEL_15;
      }
      double v19 = [(RTPlaceTypeClassifier *)self platform];
      if ([v19 watchPlatform])
      {
        double v20 = [(RTPlaceTypeClassifier *)self platform];
        int v21 = [v20 isTinkerPaired];

        if (!v21) {
          goto LABEL_15;
        }
        double v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_62];
        uint64_t v22 = [v13 filteredArrayUsingPredicate:v19];

        id v13 = (id)v22;
      }

LABEL_15:
      if ([v13 count]) {
        [v6 setObject:v13 forKey:v17];
      }
      id v23 = v43;
LABEL_35:

      if (++v8 == v41)
      {
        uint64_t v41 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v41) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v33 = v6;
LABEL_41:

  return v33;
}

void __61__RTPlaceTypeClassifier_getClassificationsFromExperts_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "expert, %@, classified place %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

BOOL __61__RTPlaceTypeClassifier_getClassificationsFromExperts_error___block_invoke_60(uint64_t a1, void *a2)
{
  return [a2 type] != 2;
}

- (BOOL)processExpertClassifications:(id)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v72 = [MEMORY[0x1E4F1CA60] dictionary];
  int v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    __int16 v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v92 = v10;
    __int16 v93 = 2112;
    uint64_t v94 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%@, %@, fetching stored places before classification", buf, 0x16u);
  }
  id v87 = 0;
  __int16 v12 = [(RTPlaceTypeClassifier *)self getStoredPlacesWithError:&v87];
  id v13 = v87;
  if (v13)
  {
    id v14 = v13;
    if (a4)
    {
      id v14 = v13;
      BOOL v15 = 0;
      *a4 = v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    aSelector = a2;
    uint64_t v73 = self;
    uint64_t v16 = [(RTPlaceTypeClassifier *)self placeTypeClassifierMetricsCalculator];
    uint64_t v71 = v12;
    [v16 storeMetricsData:v12 source:3];

    id v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    double v19 = [v7 objectForKey:v18];

    double v20 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v83 objects:v90 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v84 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          char v27 = [NSNumber numberWithUnsignedInteger:[v26 type]];
          [v20 setObject:v26 forKeyedSubscript:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v83 objects:v90 count:16];
      }
      while (v23);
    }
    id v67 = a4;
    uint64_t v70 = v21;

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    uint64_t v30 = [v7 objectForKey:v29];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v79 objects:v89 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v80 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = *(void **)(*((void *)&v79 + 1) + 8 * j);
          id v36 = [NSNumber numberWithUnsignedInteger:[v35 type]];
          int v37 = [&unk_1F3453210 containsObject:v36];

          if (v37)
          {
            uint64_t v38 = [NSNumber numberWithUnsignedInteger:[v35 type]];
            [v72 setObject:&unk_1F3451AD0 forKey:v38];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v79 objects:v89 count:16];
      }
      while (v32);
    }

    id v39 = (objc_class *)objc_opt_class();
    uint64_t v40 = NSStringFromClass(v39);
    uint64_t v41 = [v7 objectForKey:v40];

    double v42 = [MEMORY[0x1E4F1CA48] array];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v43 = v41;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v75 objects:v88 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v76;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v76 != v46) {
            objc_enumerationMutation(v43);
          }
          long long v48 = *(void **)(*((void *)&v75 + 1) + 8 * k);
          long long v49 = [NSNumber numberWithUnsignedInteger:[v48 type]];
          long long v50 = [v20 objectForKey:v49];

          if (v50
            && [(RTPlaceTypeClassifier *)v73 isRottedMeCard:v48 inferredPlace:v50])
          {
            [v42 addObject:v48];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v75 objects:v88 count:16];
      }
      while (v45);
    }

    long long v51 = [(RTPlaceTypeClassifier *)v73 placeTypeClassifierMetricsCalculator];
    [v51 storeMetricsData:v42 source:10];

    long long v52 = [(RTPlaceTypeClassifier *)v73 coalescePlacesFromExperts:v7];
    long long v53 = [v52 allValues];
    [(RTPlaceTypeClassifier *)v73 donateInferredPlaces:v53];

    long long v54 = [(RTPlaceTypeClassifier *)v73 placeTypeClassifierMetricsCalculator];
    long long v55 = [v52 allValues];
    [v54 storeMetricsData:v55 source:1];

    __int16 v12 = v71;
    [(RTPlaceTypeClassifier *)v73 mergeExistingPlaces:v71 intoUpdatedPlace:v52 typesInMeCard:v72];
    uint64_t v69 = v74[1] = 0;
    BOOL v15 = -[RTPlaceTypeClassifier updatePlaces:error:](v73, "updatePlaces:error:");
    id v56 = 0;
    if (v15)
    {
      id v68 = v56;
      uint64_t v57 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v58 = (objc_class *)objc_opt_class();
        __int16 v59 = NSStringFromClass(v58);
        uint64_t v60 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        uint64_t v92 = v59;
        __int16 v93 = 2112;
        uint64_t v94 = v60;
        _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_DEFAULT, "%@, %@, fetching stored places after classification", buf, 0x16u);
      }
      v74[0] = 0;
      __int16 v61 = [(RTPlaceTypeClassifier *)v73 getStoredPlacesWithError:v74];
      id v14 = v74[0];
      id v62 = [(RTPlaceTypeClassifier *)v73 placeTypeClassifierMetricsCalculator];
      [v62 storeMetricsData:v61 source:14];

      char v63 = [(RTPlaceTypeClassifier *)v73 placeTypeClassifierMetricsCalculator];
      [v63 submitMetrics];

      __int16 v12 = v71;
      id v56 = v68;
    }
    else if (v67)
    {
      id v64 = v56;
      id v14 = 0;
      *id v67 = v56;
      id v56 = v64;
    }
    else
    {
      id v14 = 0;
    }
  }
  return v15;
}

- (BOOL)classifyWithError:(id *)a3
{
  id v5 = [(RTPlaceTypeClassifier *)self getExperts];
  id v12 = 0;
  int v6 = [(RTPlaceTypeClassifier *)self getClassificationsFromExperts:v5 error:&v12];
  id v7 = v12;

  if (v7)
  {
    if (!a3)
    {
      BOOL v9 = 0;
      goto LABEL_8;
    }
    id v8 = v7;
    goto LABEL_6;
  }
  uint64_t v11 = 0;
  [(RTPlaceTypeClassifier *)self processExpertClassifications:v6 error:&v11];
  BOOL v9 = v11 == 0;
  if (a3 && v11)
  {
LABEL_6:
    BOOL v9 = 0;
    *a3 = v7;
  }
LABEL_8:

  return v9;
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
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

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

- (void)setMapsSupportManager:(id)a3
{
}

- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator
{
  return self->_placeTypeClassifierMetricsCalculator;
}

- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);

  objc_storeStrong((id *)&self->_biomeManager, 0);
}

@end