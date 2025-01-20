@interface RTMapItemProviderReverseGeocode
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (RTMapItemProviderReverseGeocode)init;
- (RTMapItemProviderReverseGeocode)initWithDefaultsManager:(id)a3 mapServiceManager:(id)a4;
- (RTMapItemProviderReverseGeocode)initWithMapServiceManager:(id)a3 parameters:(id)a4;
- (RTMapItemProviderReverseGeocodeParameters)parameters;
- (RTMapServiceManager)mapServiceManager;
- (double)_confidenceForSource:(unint64_t)a3;
- (id)_filterRelatedPlacesMapItems:(id)a3;
- (id)_selectMapItemsFromFetchedMapItems:(id)a3 relatedPlacesMapItems:(id)a4 options:(id)a5 error:(id *)a6;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
- (void)setMapServiceManager:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation RTMapItemProviderReverseGeocode

void __106__RTMapItemProviderReverseGeocode__selectMapItemsFromFetchedMapItems_relatedPlacesMapItems_options_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id obj = [*(id *)(a1 + 32) _filterRelatedPlacesMapItems:a2];
  if (!v5 && [obj count]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_filterRelatedPlacesMapItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v3 count]];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 address];
        v11 = [v10 geoAddressObject];
        v12 = [v11 address];
        v13 = [v12 structuredAddress];
        uint64_t v14 = [v13 subPremisesCount];

        if (!v14) {
          [v16 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v16;
}

id __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F5CDF8];
  id v4 = a2;
  id v5 = [v3 alloc];
  [*(id *)(a1 + 32) _confidenceForSource:[v4 source]];
  uint64_t v7 = [v5 initWithMapItem:v4 source:[v4 source] confidence:v6];

  return v7;
}

- (double)_confidenceForSource:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    parameters = self->_parameters;
    [(RTMapItemProviderReverseGeocodeParameters *)parameters confidence];
  }
  else if ((a3 & 0x40000) != 0)
  {
    id v8 = self->_parameters;
    [(RTMapItemProviderReverseGeocodeParameters *)v8 relatedPlacesConfidence];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = [MEMORY[0x1E4F5CE38] sourceToString:a3];
      int v10 = 138412290;
      v11 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid source %@, falling back to revgeo confidence.", (uint8_t *)&v10, 0xCu);
    }
    [(RTMapItemProviderReverseGeocodeParameters *)self->_parameters confidence];
  }
  return result;
}

- (id)_selectMapItemsFromFetchedMapItems:(id)a3 relatedPlacesMapItems:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__19;
  v50 = __Block_byref_object_dispose__19;
  id v13 = v10;
  id v51 = v13;
  uint64_t v40 = 0;
  v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__19;
  v44 = __Block_byref_object_dispose__19;
  id v45 = 0;
  if ([v13 count] != 1 || objc_msgSend(v11, "count") != 1) {
    goto LABEL_13;
  }
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v15 = [(RTMapItemProviderReverseGeocode *)self mapServiceManager];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __106__RTMapItemProviderReverseGeocode__selectMapItemsFromFetchedMapItems_relatedPlacesMapItems_options_error___block_invoke;
  v36[3] = &unk_1E6B928A8;
  v36[4] = self;
  v38 = &v46;
  v39 = &v40;
  id v16 = v14;
  v37 = v16;
  [v15 fetchMapItemsFromIdentifiers:v11 options:v12 source:0x40000 handler:v36];

  long long v17 = v16;
  v35 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v17, v18))
  {
    id v29 = 0;
LABEL_9:
    char v30 = 1;
    goto LABEL_10;
  }
  v34 = [MEMORY[0x1E4F1C9C8] now];
  [v34 timeIntervalSinceDate:v35];
  double v20 = v19;
  v21 = objc_opt_new();
  uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_15];
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
  uint64_t v52 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v52 count:1];
  id v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

  if (!v29) {
    goto LABEL_9;
  }
  id v29 = v29;

  char v30 = 0;
LABEL_10:

  id v31 = v29;
  if ((v30 & 1) == 0) {
    objc_storeStrong(v41 + 5, v29);
  }

LABEL_13:
  if (a6) {
    *a6 = v41[5];
  }
  id v32 = (id)v47[5];
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);

  return v32;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  aSelector = a2;
  v90[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__19;
  v83 = __Block_byref_object_dispose__19;
  id v84 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__19;
  v77 = __Block_byref_object_dispose__19;
  id v78 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__19;
  v71 = __Block_byref_object_dispose__19;
  id v72 = 0;
  v57 = [v5 location];
  id v6 = objc_alloc(MEMORY[0x1E4F5CE48]);
  uint64_t v7 = [v5 useBackground];
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v10 = [v5 clientIdentifier];
  v59 = (void *)[v6 initWithUseBackgroundTraits:v7 analyticsIdentifier:v9 clientIdentifier:v10];

  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = [(RTMapItemProviderReverseGeocode *)self mapServiceManager];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke;
  v62[3] = &unk_1E6B92880;
  v64 = &v79;
  v65 = &v73;
  v66 = &v67;
  id v13 = v11;
  v63 = v13;
  [v12 fetchMapItemsRelatedPlacesFromLocation:v57 options:v59 handler:v62];

  dispatch_semaphore_t v14 = v13;
  v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_6;
  }
  long long v17 = [[MEMORY[0x1E4F1C9C8] now] aSelector];
  [v17 timeIntervalSinceDate:v15];
  double v19 = v18;
  double v20 = objc_opt_new();
  v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_15];
  uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
  v23 = [v22 filteredArrayUsingPredicate:v21];
  v24 = [v23 firstObject];

  [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v26 = (void *)MEMORY[0x1E4F28C58];
  v90[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v90 count:1];
  v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

  if (v28)
  {
    id v29 = v28;
  }
  else
  {
LABEL_6:
    id v29 = 0;
  }

  id v30 = v29;
  id v31 = v30;
  if (a4 && v30)
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v46;
      __int16 v86 = 2112;
      v87 = v47;
      __int16 v88 = 2112;
      id v89 = v31;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorLogAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v33 = v31;
LABEL_17:
    v35 = 0;
    *a4 = v33;
    goto LABEL_23;
  }
  if (a4 && v68[5])
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      id v49 = (id)objc_claimAutoreleasedReturnValue();
      v50 = NSStringFromSelector(aSelector);
      id v51 = (void *)v68[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v49;
      __int16 v86 = 2112;
      v87 = v50;
      __int16 v88 = 2112;
      id v89 = v51;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorLogAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v33 = (id) v68[5];
    goto LABEL_17;
  }
  uint64_t v36 = v80[5];
  uint64_t v37 = v74[5];
  id v61 = 0;
  uint64_t v38 = -[RTMapItemProviderReverseGeocode _selectMapItemsFromFetchedMapItems:relatedPlacesMapItems:options:error:](self, "_selectMapItemsFromFetchedMapItems:relatedPlacesMapItems:options:error:", v36, v37, v59, &v61, aSelector);
  id v39 = v61;
  uint64_t v40 = (void *)v80[5];
  v80[5] = v38;

  if (v39)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v54 = NSStringFromSelector(aSelectora);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v53;
      __int16 v86 = 2112;
      v87 = v54;
      __int16 v88 = 2112;
      id v89 = v39;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, %@, an error occurred when retrieving related places, %@.", buf, 0x20u);
    }
  }
  uint64_t v42 = [_RTMap alloc];
  v43 = [(_RTMap *)v42 initWithInput:v80[5]];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke_9;
  v60[3] = &unk_1E6B91C80;
  v60[4] = self;
  v35 = [(_RTMap *)v43 withBlock:v60];

LABEL_23:
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

  return v35;
}

void __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v18 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_time_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RTMapItemProviderReverseGeocode)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_mapServiceManager_);
}

- (RTMapItemProviderReverseGeocode)initWithDefaultsManager:(id)a3 mapServiceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [[RTMapItemProviderReverseGeocodeParameters alloc] initWithDefaultsManager:v6];
    self = [(RTMapItemProviderReverseGeocode *)self initWithMapServiceManager:v7 parameters:v8];

    id v9 = self;
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v12, 2u);
    }

    id v9 = 0;
  }

  return v9;
}

- (RTMapItemProviderReverseGeocode)initWithMapServiceManager:(id)a3 parameters:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      id v14 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    dispatch_time_t v16 = "Invalid parameter not satisfying: mapServiceManager";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_11;
  }
  if (!v8)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    dispatch_time_t v16 = "Invalid parameter not satisfying: parameters";
    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTMapItemProviderReverseGeocode;
  uint64_t v10 = [(RTMapItemProviderReverseGeocode *)&v18 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mapServiceManager, a3);
    objc_storeStrong(p_isa + 2, a4);
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = p_isa[2];
      *(_DWORD *)buf = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderReverseGeocode with parameters: %@", buf, 0xCu);
    }
  }
  self = p_isa;
  id v14 = self;
LABEL_12:

  return v14;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTMapItemProviderReverseGeocodeParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_mapServiceManager, 0);
}

@end