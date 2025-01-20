@interface RTPlaceTypeClassifierExpertContacts
- (RTContactsManager)contactsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTMapServiceManager)mapServiceManager;
- (RTMapsSupportManager)mapsSupportManager;
- (RTPlaceTypeClassifierExpertContacts)init;
- (RTPlaceTypeClassifierExpertContacts)initWithContactsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 mapServiceManager:(id)a6 mapsSupportManager:(id)a7 placeTypeClassifierMetricsCalculator:(id)a8;
- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator;
- (id)_correctedMapItemsFromUserWithError:(id *)a3;
- (id)_meCardContactWithError:(id *)a3;
- (id)_postalAddressMapItemsOfContact:(id)a3 error:(id *)a4;
- (id)classifyWithError:(id *)a3;
- (void)setContactsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMapsSupportManager:(id)a3;
- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3;
@end

@implementation RTPlaceTypeClassifierExpertContacts

- (RTPlaceTypeClassifierExpertContacts)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithContactsManager_distanceCalculator_learnedLocationStore_mapServiceManager_mapsSupportManager_placeTypeClassifierMetricsCalculator_);
}

- (RTPlaceTypeClassifierExpertContacts)initWithContactsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 mapServiceManager:(id)a6 mapsSupportManager:(id)a7 placeTypeClassifierMetricsCalculator:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v29 = a6;
  id v28 = a7;
  id v18 = a8;
  if (!v15)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: contactsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v17)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v29)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: mapServiceManager";
      goto LABEL_17;
    }
LABEL_18:

    v21 = 0;
    goto LABEL_19;
  }
  id v27 = v18;
  if (v28)
  {
    v30.receiver = self;
    v30.super_class = (Class)RTPlaceTypeClassifierExpertContacts;
    v19 = [(RTPlaceTypeClassifierExpertContacts *)&v30 init];
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_contactsManager, a3);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 6, a8);
    }
    self = p_isa;
    v21 = self;
  }
  else
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapsSupportManager", buf, 2u);
    }

    v21 = 0;
  }
  v22 = v27;
LABEL_19:

  return v21;
}

- (id)_meCardContactWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__57;
  v45 = __Block_byref_object_dispose__57;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__57;
  v39 = __Block_byref_object_dispose__57;
  id v40 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = [(RTPlaceTypeClassifierExpertContacts *)self contactsManager];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  objc_super v30 = __63__RTPlaceTypeClassifierExpertContacts__meCardContactWithError___block_invoke;
  v31 = &unk_1E6B959E0;
  v33 = &v41;
  v34 = &v35;
  v7 = v5;
  v32 = v7;
  [v6 fetchMeCardWithHandler:&v28];

  v8 = v7;
  v9 = [MEMORY[0x1E4F1C9C8] now:v28, v29, v30, v31];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  v14 = objc_opt_new();
  id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_135];
  id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v17 = [v16 filteredArrayUsingPredicate:v15];
  id v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v47 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v47 count:1];
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
    objc_storeStrong(v36 + 5, v23);
  }
  if (a3) {
    *a3 = v36[5];
  }
  id v26 = (id)v42[5];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v26;
}

void __63__RTPlaceTypeClassifierExpertContacts__meCardContactWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_correctedMapItemsFromUserWithError:(id *)a3
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  [v5 setObject:v6 forKeyedSubscript:&unk_1F3450F60];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  [v5 setObject:v7 forKeyedSubscript:&unk_1F3450F78];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__57;
  v55 = __Block_byref_object_dispose__57;
  id v56 = 0;
  uint64_t v45 = 0;
  id v46 = (id *)&v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__57;
  uint64_t v49 = __Block_byref_object_dispose__57;
  id v50 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [(RTPlaceTypeClassifierExpertContacts *)self mapsSupportManager];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke;
  v41[3] = &unk_1E6B905F0;
  uint64_t v43 = &v45;
  v44 = &v51;
  dispatch_time_t v10 = v8;
  v42 = v10;
  [v9 fetchPinnedPlacesWithHandler:v41];

  id v11 = v10;
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13)) {
    goto LABEL_6;
  }
  v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  id v17 = objc_opt_new();
  id v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_135];
  v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  v20 = [v19 filteredArrayUsingPredicate:v18];
  v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v23 = (void *)MEMORY[0x1E4F28C58];
  v60[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v60 count:1];
  id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;

    char v27 = 0;
  }
  else
  {
LABEL_6:
    id v26 = 0;
    char v27 = 1;
  }

  id v28 = v26;
  if ((v27 & 1) == 0) {
    objc_storeStrong(v46 + 5, v26);
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = [(id)v52[5] count];
    id v31 = v46[5];
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v30;
    __int16 v58 = 2112;
    id v59 = v31;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "fetched, %lu, pinnedPlaces, error, %@", buf, 0x16u);
  }

  id v32 = v46[5];
  if (v32)
  {
    id v33 = 0;
    if (a3) {
      *a3 = v32;
    }
  }
  else
  {
    v34 = (void *)v52[5];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke_12;
    v38[3] = &unk_1E6B95A08;
    id v40 = &v45;
    id v35 = v5;
    id v39 = v35;
    [v34 enumerateObjectsUsingBlock:v38];
    id v36 = v46[5];
    if (v36)
    {
      id v33 = 0;
      if (a3) {
        *a3 = v36;
      }
    }
    else
    {
      id v33 = v35;
    }
  }
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);

  return v33;
}

void __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (![v5 type])
  {
LABEL_5:
    dispatch_time_t v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v17 = 134218242;
      id v18 = (id)(a3 + 1);
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "pinnedPlace %lu, %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_10;
  }
  if ([v5 type] == 1 || objc_msgSend(v5, "type") == 2)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:[v5 type]];
    id v8 = [v6 objectForKeyedSubscript:v7];
    id v9 = [v5 mapItem];
    [v8 addObject:v9];

    goto LABEL_5;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "pinnedPlace %@, has invalid type", (uint8_t *)&v17, 0xCu);
  }

  id v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F5CFE8];
  uint64_t v21 = *MEMORY[0x1E4F28568];
  v22[0] = @"RTPinnedPlace type is invalid.";
  dispatch_time_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v14 = [v12 errorWithDomain:v13 code:7 userInfo:v10];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  double v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

LABEL_10:
}

- (id)_postalAddressMapItemsOfContact:(id)a3 error:(id *)a4
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  if (v60)
  {
    os_log_t oslog = [MEMORY[0x1E4F1CA48] array];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id obj = [v60 postalAddresses];
    uint64_t v70 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
    if (!v70) {
      goto LABEL_48;
    }
    uint64_t v69 = *(void *)v89;
    uint64_t v64 = *MEMORY[0x1E4F5CFE8];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    *(void *)&long long v4 = 138412290;
    long long v59 = v4;
    while (1)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v89 != v69) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v88 + 1) + 8 * v5);
        *(void *)v82 = 0;
        v83 = v82;
        uint64_t v84 = 0x3032000000;
        v85 = __Block_byref_object_copy__57;
        v86 = __Block_byref_object_dispose__57;
        id v87 = 0;
        uint64_t v76 = 0;
        v77 = (id *)&v76;
        uint64_t v78 = 0x3032000000;
        v79 = __Block_byref_object_copy__57;
        v80 = __Block_byref_object_dispose__57;
        id v81 = 0;
        uint64_t v7 = [v6 mergedThoroughfare:v59];
        BOOL v8 = [v7 length] == 0;

        if (v8)
        {
          id v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            *(void *)&buf[4] = v6;
            v34 = v33;
            id v35 = "skipping postalAddress due to missing street, %@";
            goto LABEL_46;
          }
LABEL_31:
          int v54 = 7;
          goto LABEL_41;
        }
        if (![v6 labelType])
        {
          id v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            *(void *)&buf[4] = v6;
            v34 = v33;
            id v35 = "skipping postalAddress with type other, %@";
LABEL_46:
            _os_log_debug_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEBUG, v35, buf, 0xCu);
          }
          goto LABEL_31;
        }
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        id v10 = objc_alloc(MEMORY[0x1E4F5CE48]);
        id v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        v71 = (void *)[v10 initWithUseBackgroundTraits:1 analyticsIdentifier:v12];

        uint64_t v13 = [(RTPlaceTypeClassifierExpertContacts *)self mapServiceManager];
        uint64_t v14 = [v6 geoDictionaryRepresentation];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __77__RTPlaceTypeClassifierExpertContacts__postalAddressMapItemsOfContact_error___block_invoke;
        v72[3] = &unk_1E6B905F0;
        v74 = v82;
        v75 = &v76;
        uint64_t v15 = v9;
        v73 = v15;
        [v13 fetchMapItemsFromAddressDictionary:v14 options:v71 handler:v72];

        double v16 = v15;
        int v17 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v18 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v16, v18)) {
          goto LABEL_16;
        }
        __int16 v19 = [MEMORY[0x1E4F1C9C8] now];
        [v19 timeIntervalSinceDate:v17];
        double v21 = v20;
        v22 = objc_opt_new();
        id v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_135];
        char v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v25 = [v24 filteredArrayUsingPredicate:v23];
        id v26 = [v25 firstObject];

        [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
        char v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        id v28 = (void *)MEMORY[0x1E4F28C58];
        v98[0] = v65;
        *(void *)buf = @"semaphore wait timeout";
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v98 count:1];
        uint64_t v30 = [v28 errorWithDomain:v64 code:15 userInfo:v29];

        if (v30)
        {
          id v31 = v30;

          char v32 = 0;
        }
        else
        {
LABEL_16:
          id v31 = 0;
          char v32 = 1;
        }

        id v33 = v31;
        if ((v32 & 1) == 0) {
          objc_storeStrong(v77 + 5, v31);
        }
        id v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = [*((id *)v83 + 5) count];
          id v38 = v77[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v6;
          __int16 v93 = 2048;
          uint64_t v94 = v37;
          __int16 v95 = 2112;
          id v96 = v38;
          _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "geocoded postalAddress, %@, mapItems, %lu, error, %@", buf, 0x20u);
        }

        [*((id *)v83 + 5) enumerateObjectsUsingBlock:&__block_literal_global_42];
        id v39 = v77[5];
        if (v39 && [v39 code] != -8)
        {
          if (a4) {
            *a4 = v77[5];
          }
          int v54 = 1;
        }
        else
        {
          if ([*((id *)v83 + 5) count])
          {
            id v40 = [*((id *)v83 + 5) firstObject];
            uint64_t v41 = [v40 address];
            v42 = [v41 mergedThoroughfare];
            BOOL v43 = [v42 length] == 0;

            if (v43)
            {
              v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v59;
                *(void *)&buf[4] = v40;
                _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "skipping invalid mapItem, %@", buf, 0xCu);
              }

              v44 = v40;
            }
            else
            {
              v44 = [v40 appendSource:4];

              id v45 = objc_alloc(MEMORY[0x1E4F5CE40]);
              v66 = [v44 extendedAttributes];
              id v46 = [v66 identifier];
              uint64_t v47 = v46;
              if (!v46)
              {
                v61 = [MEMORY[0x1E4F29128] UUID];
                uint64_t v47 = v61;
              }
              v48 = [v6 contactsIdentifier];
              uint64_t v49 = [v44 extendedAttributes];
              [v49 wifiConfidence];
              double v51 = v50;
              v52 = [v44 extendedAttributes];
              uint64_t v53 = [v45 initWithIdentifier:v47 addressIdentifier:v48 isMe:1 wifiConfidence:[v52 wifiFingerprintLabelType] wifiFingerprintLabelType:v51];
              [v44 setExtendedAttributes:v53];

              if (!v46) {
              [oslog addObject:v44];
              }
            }
          }
          int v54 = 0;
        }

LABEL_41:
        _Block_object_dispose(&v76, 8);

        _Block_object_dispose(v82, 8);
        if (v54 != 7 && v54)
        {

          goto LABEL_52;
        }
        ++v5;
      }
      while (v70 != v5);
      uint64_t v56 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
      uint64_t v70 = v56;
      if (!v56)
      {
LABEL_48:

        v57 = oslog;
        goto LABEL_53;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v82 = 0;
    _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contact", v82, 2u);
  }
LABEL_52:
  v57 = 0;

LABEL_53:

  return v57;
}

void __77__RTPlaceTypeClassifierExpertContacts__postalAddressMapItemsOfContact_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __77__RTPlaceTypeClassifierExpertContacts__postalAddressMapItemsOfContact_error___block_invoke_21(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "postalAddress mapItem %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)classifyWithError:(id *)a3
{
  uint64_t v288 = *MEMORY[0x1E4F143B8];
  v199 = [MEMORY[0x1E4F1CA48] array];
  v174 = (void *)MEMORY[0x1E016D870]();
  id v274 = 0;
  v194 = [(RTPlaceTypeClassifierExpertContacts *)self _meCardContactWithError:&v274];
  v198 = (uint64_t (*)(uint64_t, uint64_t))v274;
  v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v4;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v194;
    *(_WORD *)&buf[22] = 2112;
    v285 = v198;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, meCard, %@, error, %@", buf, 0x20u);
  }
  if (v198 || !v194)
  {
    v211 = v198;
    goto LABEL_160;
  }
  id v273 = 0;
  id obj = [(RTPlaceTypeClassifierExpertContacts *)self _postalAddressMapItemsOfContact:v194 error:&v273];
  id v166 = v273;
  if (v166 || ![obj count])
  {
    v211 = (uint64_t (*)(uint64_t, uint64_t))v166;
    goto LABEL_159;
  }
  id v272 = 0;
  v186 = [(RTPlaceTypeClassifierExpertContacts *)self _correctedMapItemsFromUserWithError:&v272];
  id v156 = v272;
  if (v156)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v154 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v154;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v156;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, failed to fetch  correctedMapItemsFromUser due to error, %@", buf, 0x16u);
    }
  }
  v270[0] = MEMORY[0x1E4F143A8];
  v270[1] = 3221225472;
  v270[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke;
  v270[3] = &unk_1E6B95A58;
  id v271 = v194;
  v200 = (uint64_t (**)(void, void))MEMORY[0x1E016DB00](v270);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v285 = __Block_byref_object_copy__57;
  v286 = __Block_byref_object_dispose__57;
  id v287 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v264 = 0;
  v265 = (id *)&v264;
  uint64_t v266 = 0x3032000000;
  v267 = __Block_byref_object_copy__57;
  v268 = __Block_byref_object_dispose__57;
  id v269 = 0;
  v167 = [MEMORY[0x1E4F1CA60] dictionary];
  v189 = [MEMORY[0x1E4F1CA48] array];
  long long v262 = 0u;
  long long v263 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  id obj = obj;
  uint64_t v6 = [obj countByEnumeratingWithState:&v260 objects:v283 count:16];
  if (v6)
  {
    uint64_t v182 = *(void *)v261;
    uint64_t v175 = *MEMORY[0x1E4F5CFE8];
    id v177 = (id)*MEMORY[0x1E4F28568];
LABEL_15:
    uint64_t v7 = 0;
    uint64_t v184 = v6;
    while (1)
    {
      if (*(void *)v261 != v182) {
        objc_enumerationMutation(obj);
      }
      uint64_t v207 = v7;
      __int16 v8 = *(void **)(*((void *)&v260 + 1) + 8 * v7);
      context = (void *)MEMORY[0x1E016D870]();
      id v9 = [NSNumber numberWithUnsignedInteger:(((uint64_t (**)(void, void *))v200)[2](v200, v8)));
      uint64_t v10 = [v186 objectForKey:v9];

      long long v258 = 0u;
      long long v259 = 0u;
      long long v256 = 0u;
      long long v257 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v256 objects:v282 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v257;
LABEL_20:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v257 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v256 + 1) + 8 * v14);
          if ([v8 isEqualToMapItem:v15])
          {
            double v16 = [v8 location];
            int v17 = [v15 location];
            char v18 = [v16 isEqualToLocation:v17];

            if ((v18 & 1) == 0) {
              break;
            }
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v11 countByEnumeratingWithState:&v256 objects:v282 count:16];
            if (v12) {
              goto LABEL_20;
            }
            goto LABEL_27;
          }
        }
        id v212 = [v15 location];

        if (!v212) {
          goto LABEL_30;
        }
        id v172 = objc_alloc(MEMORY[0x1E4F5CE38]);
        v201 = [v8 identifier];
        v195 = [v8 name];
        v190 = [v8 category];
        v187 = [v8 address];
        uint64_t v170 = [v8 source];
        uint64_t v19 = [v8 mapItemPlaceType];
        uint64_t v20 = [v8 muid];
        uint64_t v21 = [v8 resultProviderID];
        v22 = [v8 geoMapItemHandle];
        id v23 = [v8 creationDate];
        char v24 = [v8 expirationDate];
        id v25 = [v8 extendedAttributes];
        id v26 = [v8 displayLanguage];
        LOBYTE(v155) = [v8 disputed];
        uint64_t v27 = [v172 initWithIdentifier:v201 name:v195 category:v190 address:v187 location:v212 source:v170 mapItemPlaceType:v19 muid:v20 resultProviderID:v21 geoMapItemHandle:v22 creationDate:v23 expirationDate:v24 extendedAttributes:v25 displayLanguage:v26 disputed:v155];

        [v167 setObject:&unk_1F3450F90 forKeyedSubscript:v27];
        int v196 = 0;
      }
      else
      {
LABEL_27:

LABEL_30:
        id v212 = 0;
        uint64_t v27 = 0;
        int v196 = 1;
      }
      v202 = (void *)v27;
      id v28 = v27 ? (void *)v27 : v8;
      [v189 addObject:v28];
      uint64_t v250 = 0;
      v251 = &v250;
      uint64_t v252 = 0x3032000000;
      v253 = __Block_byref_object_copy__57;
      v254 = __Block_byref_object_dispose__57;
      id v255 = 0;
      dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
      uint64_t v30 = [(RTPlaceTypeClassifierExpertContacts *)self learnedLocationStore];
      v246[0] = MEMORY[0x1E4F143A8];
      v246[1] = 3221225472;
      v246[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_31;
      v246[3] = &unk_1E6B90B28;
      v248 = &v250;
      v249 = &v264;
      id v31 = v29;
      v247 = v31;
      [v30 fetchLocationOfInterestWithMapItem:v8 handler:v246];

      char v32 = v31;
      id v33 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v34 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v32, v34)) {
        goto LABEL_39;
      }
      id v35 = [MEMORY[0x1E4F1C9C8] now];
      [v35 timeIntervalSinceDate:v33];
      double v37 = v36;
      id v38 = objc_opt_new();
      id v39 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_135];
      id v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v41 = [v40 filteredArrayUsingPredicate:v39];
      v42 = [v41 firstObject];

      [v38 submitToCoreAnalytics:v42 type:1 duration:v37];
      BOOL v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v277 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v277, 2u);
      }

      v44 = (void *)MEMORY[0x1E4F28C58];
      v280[0] = v177;
      *(void *)v277 = @"semaphore wait timeout";
      id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v277 forKeys:v280 count:1];
      id v46 = [v44 errorWithDomain:v175 code:15 userInfo:v45];

      if (v46)
      {
        id v47 = v46;

        char v48 = 0;
      }
      else
      {
LABEL_39:
        id v47 = 0;
        char v48 = 1;
      }

      id v49 = v47;
      if ((v48 & 1) == 0) {
        objc_storeStrong(v265 + 5, v47);
      }
      if (v265[5])
      {
        int v50 = 4;
      }
      else
      {
        if (v251[5])
        {
          double v51 = [(RTPlaceTypeClassifierExpertContacts *)self distanceCalculator];
          v52 = [(id)v251[5] location];
          uint64_t v53 = [v52 location];
          int v54 = [v8 location];
          id v245 = 0;
          [v51 distanceFromLocation:v53 toLocation:v54 error:&v245];
          double v56 = v55;
          id v57 = v245;

          if (!v57 && v56 > 250.0)
          {
            [*(id *)(*(void *)&buf[8] + 40) addObject:v251[5]];
            __int16 v58 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              id v59 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v60 = v251[5];
              *(_DWORD *)v277 = 138413058;
              *(void *)&v277[4] = v59;
              *(_WORD *)&v277[12] = 2112;
              *(void *)&v277[14] = v60;
              *(_WORD *)&v277[22] = 2112;
              v278 = (uint64_t (*)(uint64_t, uint64_t))v8;
              LOWORD(v279) = 2048;
              *(double *)((char *)&v279 + 2) = v56;
              _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, picked locationOfInterest, %@, with same mapItem as postalAddressMapItem, %@, with distance, %lf", v277, 0x2Au);
            }
          }
        }
        v61 = [v8 location];
        BOOL v62 = [v61 referenceFrame] == 2;

        if (v62) {
          double v63 = 1400.0;
        }
        else {
          double v63 = 400.0;
        }
        dispatch_semaphore_t v64 = dispatch_semaphore_create(0);

        uint64_t v65 = [(RTPlaceTypeClassifierExpertContacts *)self learnedLocationStore];
        id v66 = v212;
        if (v196)
        {
          v164 = [v8 location];
          id v66 = v164;
        }
        v241[0] = MEMORY[0x1E4F143A8];
        v241[1] = 3221225472;
        v241[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_33;
        v241[3] = &unk_1E6B905F0;
        v243 = buf;
        v244 = &v264;
        v67 = v64;
        v242 = v67;
        [v65 fetchLocationsOfInterestWithinDistance:v66 location:v241 handler:v63];
        if (v196) {

        }
        char v32 = v67;
        v68 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v69 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v32, v69)) {
          goto LABEL_63;
        }
        uint64_t v70 = [MEMORY[0x1E4F1C9C8] now];
        [v70 timeIntervalSinceDate:v68];
        double v72 = v71;
        v73 = objc_opt_new();
        v74 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_135];
        v75 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v76 = [v75 filteredArrayUsingPredicate:v74];
        v77 = [v76 firstObject];

        [v73 submitToCoreAnalytics:v77 type:1 duration:v72];
        uint64_t v78 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v277 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v277, 2u);
        }

        v79 = (void *)MEMORY[0x1E4F28C58];
        v280[0] = v177;
        *(void *)v277 = @"semaphore wait timeout";
        v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v277 forKeys:v280 count:1];
        id v81 = [v79 errorWithDomain:v175 code:15 userInfo:v80];

        if (v81)
        {
          id v82 = v81;

          char v83 = 0;
        }
        else
        {
LABEL_63:
          char v83 = 1;
          id v82 = v49;
        }

        id v84 = v82;
        if ((v83 & 1) == 0) {
          objc_storeStrong(v265 + 5, v82);
        }
        BOOL v85 = v265[5] != 0;

        int v50 = 4 * v85;
        id v49 = v84;
      }

      _Block_object_dispose(&v250, 8);
      if (v50) {
        break;
      }
      uint64_t v7 = v207 + 1;
      if (v207 + 1 == v184)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v260 objects:v283 count:16];
        if (v6) {
          goto LABEL_15;
        }
        break;
      }
    }
  }

  id v86 = v265[5];
  if (v86)
  {
    v211 = (uint64_t (*)(uint64_t, uint64_t))v86;
    goto LABEL_158;
  }
  v208 = [*(id *)(*(void *)&buf[8] + 40) allObjects];
  id v87 = v189;

  v188 = [MEMORY[0x1E4F1CA60] dictionary];
  v157 = [MEMORY[0x1E4F1CA48] array];
  v191 = [(RTPlaceTypeClassifierExpertContacts *)self distanceCalculator];
  uint64_t v250 = 0;
  v251 = &v250;
  uint64_t v252 = 0x3032000000;
  v253 = __Block_byref_object_copy__57;
  v254 = __Block_byref_object_dispose__57;
  id v255 = 0;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  id obj = v87;
  uint64_t v88 = [obj countByEnumeratingWithState:&v237 objects:v281 count:16];
  if (!v88)
  {
    v211 = 0;
    goto LABEL_91;
  }
  v211 = 0;
  contexta = *(void **)v238;
  do
  {
    uint64_t v89 = 0;
    do
    {
      if (*(void **)v238 != contexta) {
        objc_enumerationMutation(obj);
      }
      uint64_t v90 = *(void *)(*((void *)&v237 + 1) + 8 * v89);
      v280[0] = 0;
      v280[1] = v280;
      v280[2] = 0x2020000000;
      v280[3] = 0x7FF0000000000000;
      *(void *)v277 = 0;
      *(void *)&v277[8] = v277;
      *(void *)&v277[16] = 0x3032000000;
      v278 = __Block_byref_object_copy__57;
      *(void *)&long long v279 = __Block_byref_object_dispose__57;
      *((void *)&v279 + 1) = 0;
      v232[0] = MEMORY[0x1E4F143A8];
      v232[1] = 3221225472;
      v232[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2_34;
      v232[3] = &unk_1E6B95A80;
      v232[4] = v90;
      v234 = v277;
      id v233 = v191;
      v235 = &v250;
      v236 = v280;
      [v208 enumerateObjectsUsingBlock:v232];
      long long v91 = (void *)v251[5];
      if (v91)
      {
        v92 = v211;
        v211 = v91;
LABEL_83:

        goto LABEL_84;
      }
      __int16 v93 = *(void **)(*(void *)&v277[8] + 40);
      if (v93)
      {
        uint64_t v94 = [v93 identifier];
        __int16 v95 = [v188 objectForKey:v94];
        BOOL v96 = v95 == 0;

        if (v96)
        {
          v97 = [MEMORY[0x1E4F1CA48] array];
          v98 = [*(id *)(*(void *)&v277[8] + 40) identifier];
          [v188 setObject:v97 forKey:v98];
        }
        v92 = [*(id *)(*(void *)&v277[8] + 40) identifier];
        v99 = [v188 objectForKey:v92];
        [v99 addObject:v90];

        goto LABEL_83;
      }
      [v157 addObject:v90];
LABEL_84:

      _Block_object_dispose(v277, 8);
      _Block_object_dispose(v280, 8);
      if (v91) {
        goto LABEL_91;
      }
      ++v89;
    }
    while (v88 != v89);
    uint64_t v100 = [obj countByEnumeratingWithState:&v237 objects:v281 count:16];
    uint64_t v88 = v100;
  }
  while (v100);
LABEL_91:

  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  id v178 = v208;
  uint64_t v101 = [v178 countByEnumeratingWithState:&v228 objects:v276 count:16];
  if (!v101) {
    goto LABEL_155;
  }
  uint64_t v183 = *(void *)v229;
  while (2)
  {
    uint64_t v102 = 0;
    uint64_t v185 = v101;
    while (2)
    {
      if (*(void *)v229 != v183) {
        objc_enumerationMutation(v178);
      }
      v103 = [*(id *)(*((void *)&v228 + 1) + 8 * v102) place];
      v104 = [v103 mapItem];
      v105 = [v104 location];

      v106 = [v103 identifier];
      v107 = [v188 objectForKey:v106];
      v223[0] = MEMORY[0x1E4F143A8];
      v223[1] = 3221225472;
      v223[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_3;
      v223[3] = &unk_1E6B95AA8;
      v108 = v200;
      id v226 = v108;
      id v224 = v191;
      id v203 = v105;
      id v225 = v203;
      v227 = &v250;
      contextb = [v107 sortedArrayUsingComparator:v223];

      v109 = (void *)v251[5];
      if (v109)
      {
        v110 = v109;

        v111 = 0;
        int v112 = 10;
        v211 = v110;
        goto LABEL_151;
      }
      if (![contextb count])
      {
        v111 = 0;
        goto LABEL_150;
      }
      id v197 = [contextb firstObject];
      long long v221 = 0u;
      long long v222 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      id v113 = contextb;
      uint64_t v114 = [v113 countByEnumeratingWithState:&v219 objects:v275 count:16];
      if (v114)
      {
        uint64_t v115 = *(void *)v220;
        while (2)
        {
          for (uint64_t i = 0; i != v114; ++i)
          {
            if (*(void *)v220 != v115) {
              objc_enumerationMutation(v113);
            }
            v117 = *(void **)(*((void *)&v219 + 1) + 8 * i);
            v118 = [v103 mapItem];
            int v119 = RTMapItemsAddressIdentifiersSame(v118, v117);

            if (v119)
            {
              id v120 = v117;

              id v197 = v120;
              goto LABEL_109;
            }
          }
          uint64_t v114 = [v113 countByEnumeratingWithState:&v219 objects:v275 count:16];
          if (v114) {
            continue;
          }
          break;
        }
      }
LABEL_109:

      uint64_t v176 = ((uint64_t (**)(void, id))v200)[2](v108, v197);
      if (v176)
      {
        uint64_t v121 = 2;
        goto LABEL_117;
      }
      if (([v103 typeSource] & 2) != 0)
      {
        uint64_t v121 = 0;
LABEL_117:
        v123 = [v167 objectForKeyedSubscript:v197];

        uint64_t v124 = v121 | 4;
        if (!v123) {
          uint64_t v124 = v121;
        }
        uint64_t v160 = v124;
        v125 = [v103 mapItem];
        if ([v125 validMUID])
        {
          v126 = [v103 mapItem];
          int v127 = [v126 isEqualToMapItem:v197];

          if (v127)
          {
            id v209 = [v103 mapItem];
            id v179 = v197;
            char v128 = [v179 source];
LABEL_124:
            if ((v128 & 8) != 0
              || ([v179 source] & 4) != 0 && RTMapItemsAddressIdentifiersSame(v179, v209))
            {
              v181 = [v197 location];
              v129 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v277 = 138412546;
                *(void *)&v277[4] = v209;
                *(_WORD *)&v277[12] = 2112;
                *(void *)&v277[14] = v181;
                _os_log_impl(&dword_1D9BFA000, v129, OS_LOG_TYPE_INFO, "applying corrected coordinate to mapItem, original mapItem, %@, corrected coordinates, %@", v277, 0x16u);
              }
            }
            else
            {
              v181 = 0;
            }
            if (v209 == v197)
            {
              v180 = 0;
            }
            else
            {
              v180 = [v197 extendedAttributes];
            }
            id v163 = objc_alloc(MEMORY[0x1E4F5CE38]);
            v165 = [v209 identifier];
            v173 = [v209 name];
            v171 = [v209 category];
            aSelectora = [v209 address];
            v130 = v181;
            if (!v181)
            {
              v159 = [v209 location];
              v130 = v159;
            }
            v162 = v130;
            uint64_t v161 = [v209 source];
            uint64_t v131 = [v209 mapItemPlaceType];
            uint64_t v132 = [v209 muid];
            uint64_t v133 = [v209 resultProviderID];
            v134 = [v209 geoMapItemHandle];
            v135 = [v209 creationDate];
            v136 = [v209 expirationDate];
            v137 = v180;
            if (!v180)
            {
              v158 = [v209 extendedAttributes];
              v137 = v158;
            }
            v138 = [v209 displayLanguage];
            LOBYTE(v155) = [v209 disputed];
            v139 = (void *)[v163 initWithIdentifier:v165 name:v173 category:v171 address:aSelectora location:v162 source:v161 mapItemPlaceType:v131 muid:v132 resultProviderID:v133 geoMapItemHandle:v134 creationDate:v135 expirationDate:v136 extendedAttributes:v137 displayLanguage:v138 disputed:v155];

            if (!v180) {
            if (!v181)
            }

            if (v139)
            {
              v140 = [RTLearnedPlace alloc];
              v141 = [v103 identifier];
              v142 = [v103 customLabel];
              v143 = [v103 creationDate];
              v144 = [v103 expirationDate];
              v111 = [(RTLearnedPlace *)v140 initWithIdentifier:v141 type:v176 typeSource:v160 mapItem:v139 customLabel:v142 creationDate:v143 expirationDate:v144];

              v145 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v277 = 138412546;
                *(void *)&v277[4] = v103;
                *(_WORD *)&v277[12] = 2112;
                *(void *)&v277[14] = v111;
                _os_log_impl(&dword_1D9BFA000, v145, OS_LOG_TYPE_INFO, "disambiguated place using meCard, previous place, %@, updated place, %@", v277, 0x16u);
              }

              if (v111) {
                [v199 addObject:v111];
              }
              int v112 = 0;
            }
            else
            {
              v111 = 0;
              int v112 = 11;
            }

            if (!v139) {
              goto LABEL_151;
            }
LABEL_150:
            int v112 = 0;
            goto LABEL_151;
          }
        }
        else
        {
        }
        id v209 = v197;
        id v179 = [v103 mapItem];
        char v128 = [v179 source];
        goto LABEL_124;
      }
      v122 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v277 = 138412546;
        *(void *)&v277[4] = v197;
        *(_WORD *)&v277[12] = 2112;
        *(void *)&v277[14] = v103;
        _os_log_error_impl(&dword_1D9BFA000, v122, OS_LOG_TYPE_ERROR, "unable to find the type for postalAddress mapItem, %@, associated to place, %@", v277, 0x16u);
      }

      v111 = 0;
      int v112 = 11;
LABEL_151:

      if (v112 != 11 && v112) {
        goto LABEL_155;
      }
      if (++v102 != v185) {
        continue;
      }
      break;
    }
    uint64_t v101 = [v178 countByEnumeratingWithState:&v228 objects:v276 count:16];
    if (v101) {
      continue;
    }
    break;
  }
LABEL_155:

  if ([v157 count])
  {
    v146 = [MEMORY[0x1E4F1C9C8] date];
    v147 = [v146 dateByAddingTimeInterval:4838400.0];
    v213[0] = MEMORY[0x1E4F143A8];
    v213[1] = 3221225472;
    v213[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_39;
    v213[3] = &unk_1E6B95AD0;
    id v214 = v167;
    v218 = v200;
    id v148 = v146;
    id v215 = v148;
    id v149 = v147;
    id v216 = v149;
    id v217 = v199;
    [v157 enumerateObjectsUsingBlock:v213];
  }
  _Block_object_dispose(&v250, 8);

LABEL_158:
  _Block_object_dispose(&v264, 8);

  _Block_object_dispose(buf, 8);
LABEL_159:

LABEL_160:
  if (a3) {
    *a3 = v211;
  }
  v150 = [(RTPlaceTypeClassifierExpertContacts *)self placeTypeClassifierMetricsCalculator];
  [v150 storeMetricsData:v199 source:2];

  if ([v199 count]) {
    v151 = v199;
  }
  else {
    v151 = 0;
  }
  id v152 = v151;

  return v152;
}

uint64_t __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v4 = [*(id *)(a1 + 32) postalAddresses];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2;
  v8[3] = &unk_1E6B95A30;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = &v11;
  [v4 enumerateObjectsUsingBlock:v8];

  uint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) extendedAttributes];
  uint64_t v7 = [v6 addressIdentifier];
  __int16 v8 = [v13 contactsIdentifier];
  int v9 = [v7 isEqualToString:v8];

  uint64_t v10 = v13;
  if (v9)
  {
    if ([v13 labelType] == 1)
    {
      uint64_t v11 = 1;
    }
    else
    {
      if ([v13 labelType] != 2)
      {
        BOOL v12 = [v13 labelType] == 3;
        uint64_t v10 = v13;
        if (!v12) {
          goto LABEL_8;
        }
        uint64_t v11 = 3;
LABEL_7:
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
LABEL_8:
        *a4 = 1;
        goto LABEL_9;
      }
      uint64_t v11 = 2;
    }
    uint64_t v10 = v13;
    goto LABEL_7;
  }
LABEL_9:
}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_31(uint64_t a1, void *a2, void *a3)
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

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2_34(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 place];
  uint64_t v7 = [v6 mapItem];
  id v8 = [v7 location];

  if (v8)
  {
    uint64_t v9 = [v6 mapItem];
    int v10 = [v9 isEqualToMapItem:*(void *)(a1 + 32)];

    if (v10) {
      goto LABEL_3;
    }
    id v11 = *(void **)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) location];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v13 + 40);
    [v11 distanceFromLocation:v8 toLocation:v12 error:&obj];
    double v15 = v14;
    objc_storeStrong((id *)(v13 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      goto LABEL_5;
    }
    if (v15 > 250.0) {
      goto LABEL_6;
    }
    double v16 = [v6 mapItem];
    int v17 = RTMapItemsAddressIdentifiersSame(v16, *(void **)(a1 + 32));

    if (v17)
    {
LABEL_3:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
LABEL_5:
      *a4 = 1;
      goto LABEL_6;
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v15 < *(double *)(v18 + 24))
    {
      *(double *)(v18 + 24) = v15;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
    }
  }
LABEL_6:
}

uint64_t __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(a1[6] + 16))();
  uint64_t v8 = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (v7 == v8) {
    goto LABEL_2;
  }
  if (v7 == 1) {
    goto LABEL_12;
  }
  if (v8 == 1) {
    goto LABEL_14;
  }
  if (v7 == 2) {
    goto LABEL_12;
  }
  if (v8 == 2) {
    goto LABEL_14;
  }
  if (v7 == 3)
  {
LABEL_12:
    uint64_t v21 = -1;
    goto LABEL_15;
  }
  if (v8 == 3) {
    goto LABEL_14;
  }
  if (v7 == 4) {
    goto LABEL_12;
  }
  if (v8 == 4)
  {
LABEL_14:
    uint64_t v21 = 1;
    goto LABEL_15;
  }
LABEL_2:
  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = a1[5];
  id v11 = [v5 location];
  uint64_t v12 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v12 + 40);
  [v9 distanceFromLocation:v10 toLocation:v11 error:&obj];
  double v14 = v13;
  objc_storeStrong((id *)(v12 + 40), obj);

  double v15 = (void *)a1[4];
  uint64_t v16 = a1[5];
  int v17 = [v6 location];
  uint64_t v18 = *(void *)(a1[7] + 8);
  id v23 = *(id *)(v18 + 40);
  [v15 distanceFromLocation:v16 toLocation:v17 error:&v23];
  double v20 = v19;
  objc_storeStrong((id *)(v18 + 40), v23);

  if (v14 < v20) {
    uint64_t v21 = -1;
  }
  else {
    uint64_t v21 = v14 > v20;
  }
LABEL_15:

  return v21;
}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5) {
    uint64_t v6 = 6;
  }
  else {
    uint64_t v6 = 2;
  }
  uint64_t v7 = [RTLearnedPlace alloc];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [(RTLearnedPlace *)v7 initWithIdentifier:v8 type:(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() typeSource:v6 mapItem:v4 customLabel:0 creationDate:*(void *)(a1 + 40) expirationDate:*(void *)(a1 + 48)];

  if (v9)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "created a placeholder place for meCard postalAdress mapItem that was not associated to any existing place, %@", buf, 0xCu);
    }

    [*(id *)(a1 + 56) addObject:v9];
  }
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end