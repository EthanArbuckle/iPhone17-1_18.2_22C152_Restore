@interface RTSynthesizedLocationStore
- (RTSynthesizedLocationStore)initWithPersistenceManager:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (id)fetchRequestFromStoredLocationOptions:(id)a3;
- (void)_fetchStoredLocationsCountWithContext:(id)a3 handler:(id)a4;
- (void)_fetchStoredLocationsCountWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)_removeLocationsOnDateInterval:(id)a3 handler:(id)a4;
- (void)_removeLocationsPredating:(id)a3 handler:(id)a4;
- (void)_storeLocations:(id)a3 handler:(id)a4;
- (void)fetchStoredLocationsCountWithOptions:(id)a3 handler:(id)a4;
- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)removeLocationsOnDateInterval:(id)a3 handler:(id)a4;
- (void)removeLocationsPredating:(id)a3 handler:(id)a4;
- (void)storeLocations:(id)a3 handler:(id)a4;
@end

@implementation RTSynthesizedLocationStore

- (RTSynthesizedLocationStore)initWithPersistenceManager:(id)a3
{
  v3 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTSynthesizedLocationStore;
    v5 = -[RTStore initWithPersistenceManager:](&v13, sel_initWithPersistenceManager_);
    if (v5)
    {
      v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v15 = v11;
        __int16 v16 = 2112;
        v17 = v12;
        _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ success.", buf, 0x16u);
      }
    }
    v3 = v5;
    v7 = v3;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        v12 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v11;
          _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "CRTSM,RTSynthesizedLocationStore,storeLocations,%@", buf, 0xCu);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__RTSynthesizedLocationStore__storeLocations_handler___block_invoke;
  v16[3] = &unk_1E6B90890;
  id v17 = v6;
  SEL v18 = a2;
  id v13 = v6;
  [(RTStore *)self storeWritableObjects:v5 handler:v16];
}

void __54__RTSynthesizedLocationStore__storeLocations_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "RTSynthesizedLocationStore,%@,error,%@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)storeLocations:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412546;
    SEL v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = [v6 count];
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@ storeLocations invoked with locationCount,%lu", buf, 0x16u);
  }
  __int16 v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTSynthesizedLocationStore_storeLocations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __53__RTSynthesizedLocationStore_storeLocations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeLocations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredLocationsCountWithContext:(id)a3 handler:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke;
    v21[3] = &unk_1E6B91088;
    id v22 = v6;
    v23 = self;
    id v8 = v7;
    id v24 = v8;
    __int16 v9 = (void *)MEMORY[0x1E016DB00](v21);
    id v10 = [(RTNotifier *)self queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_64;
    v18[3] = &unk_1E6B943D8;
    v18[4] = self;
    id v19 = v9;
    id v20 = v8;
    id v11 = v9;
    dispatch_async(v10, v18);

    v12 = v22;
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "-[RTSynthesizedLocationStore _fetchStoredLocationsCountWithContext:handler:]";
      __int16 v27 = 1024;
      LODWORD(v28) = 92;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"A handler is a required parameter.";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      id v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      v28 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@: A handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  id v7 = *(void **)(a1 + 40);
  id v8 = [v5 options];
  __int16 v9 = [v7 fetchRequestFromStoredLocationOptions:v8];

  [v9 setFetchLimit:604800];
  id v40 = 0;
  uint64_t v10 = [v3 countForFetchRequest:v9 error:&v40];
  id v11 = v40;
  v12 = [v6 options];
  uint64_t v13 = [v12 preferredDownsamplingLevel];

  uint64_t v37 = a1;
  if (v13 >= 1 && !v10)
  {
    do
    {
      v14 = v11;
      id v39 = v11;
      uint64_t v15 = [v3 countForFetchRequest:v9 error:&v39];
      id v11 = v39;

      if (!v15)
      {
        id v16 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v23 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v23);
          id v24 = [v6 options];
          uint64_t v33 = [v24 preferredDownsamplingLevel];
          v25 = (void *)MEMORY[0x1E4F5CF68];
          uint64_t v26 = [v6 options];
          uint64_t v27 = [v25 NextLessDecimatedDownsamplingPreference:[v26 preferredDownsamplingLevel]];
          *(_DWORD *)buf = 138412802;
          v42 = v34;
          __int16 v43 = 2048;
          uint64_t v44 = v33;
          __int16 v45 = 2048;
          uint64_t v46 = v27;
          _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@: No locations found at downsamplingLevel %ld, trying %ld", buf, 0x20u);
        }
        id v17 = (void *)MEMORY[0x1E4F5CF68];
        SEL v18 = [v6 options];
        uint64_t v19 = [v17 NextLessDecimatedDownsamplingPreference:[v18 preferredDownsamplingLevel]];
        id v20 = [v6 options];
        [v20 setPreferredDownsamplingLevel:v19];
      }
      uint64_t v21 = [v6 options];
      uint64_t v22 = [v21 preferredDownsamplingLevel];
    }
    while (!v15 && v22 > 0);
  }
  v28 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v29);
    v30 = [v6 options];
    uint64_t v31 = [v30 preferredDownsamplingLevel];
    id v38 = v11;
    uint64_t v32 = [v3 countForFetchRequest:v9 error:&v38];
    id v36 = v38;

    *(_DWORD *)buf = 138412802;
    v42 = v35;
    __int16 v43 = 2048;
    uint64_t v44 = v31;
    __int16 v45 = 2048;
    uint64_t v46 = v32;
    _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "%@: selected downsampling level is %ld, location count is %lu", buf, 0x20u);

    id v11 = v36;
  }

  (*(void (**)(void))(*(void *)(v37 + 48) + 16))();
}

void __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_64(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_2;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchStoredLocationsCountWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[RTSynthesizedLocationStore _fetchStoredLocationsCountWithOptions:handler:]";
      __int16 v12 = 1024;
      int v13 = 146;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CF60]) initWithEnumerationOptions:v6];
  [(RTSynthesizedLocationStore *)self _fetchStoredLocationsCountWithContext:v9 handler:v7];
}

- (void)fetchStoredLocationsCountWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTSynthesizedLocationStore_fetchStoredLocationsCountWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __75__RTSynthesizedLocationStore_fetchStoredLocationsCountWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsCountWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[RTSynthesizedLocationStore _fetchStoredLocationsWithOptions:handler:]";
      __int16 v12 = 1024;
      int v13 = 166;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CF60]) initWithEnumerationOptions:v6];
  [(RTSynthesizedLocationStore *)self _fetchStoredLocationsWithContext:v9 handler:v7];
}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTSynthesizedLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __70__RTSynthesizedLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke;
    v22[3] = &unk_1E6B91018;
    id v23 = v7;
    id v24 = self;
    SEL v26 = a2;
    id v9 = v8;
    id v25 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v22);
    id v11 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_67;
    block[3] = &unk_1E6B943D8;
    block[4] = self;
    id v20 = v10;
    id v21 = v9;
    id v12 = v10;
    dispatch_async(v11, block);

    id v13 = v23;
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTSynthesizedLocationStore _fetchStoredLocationsWithContext:handler:]";
      __int16 v29 = 1024;
      LODWORD(v30) = 187;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"A handler is a required parameter.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v13];
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      SEL v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@: A handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  id v7 = *(void **)(a1 + 40);
  id v8 = [v5 options];
  id v9 = [v7 fetchRequestFromStoredLocationOptions:v8];

  id v73 = 0;
  uint64_t v10 = [v3 countForFetchRequest:v9 error:&v73];
  id v11 = v73;
  id v12 = [v6 options];
  uint64_t v13 = [v12 preferredDownsamplingLevel];

  if (v13 < 1 || v10)
  {
    id v23 = v9;
  }
  else
  {
    do
    {
      uint64_t v14 = v11;
      id v72 = v11;
      uint64_t v15 = [v3 countForFetchRequest:v9 error:&v72];
      id v11 = v72;

      if (!v15)
      {
        id v16 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          SEL v26 = (objc_class *)objc_opt_class();
          uint64_t v27 = NSStringFromClass(v26);
          [v6 options];
          v28 = uint64_t v63 = a1;
          uint64_t v61 = [v28 preferredDownsamplingLevel];
          __int16 v29 = (void *)MEMORY[0x1E4F5CF68];
          v30 = [v6 options];
          uint64_t v31 = [v29 NextLessDecimatedDownsamplingPreference:[v30 preferredDownsamplingLevel]];
          *(_DWORD *)buf = 138412802;
          v76 = v27;
          __int16 v77 = 2048;
          uint64_t v78 = v61;
          __int16 v79 = 2048;
          uint64_t v80 = v31;
          _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@: No locations found at downsamplingLevel %lu, trying %lu", buf, 0x20u);

          a1 = v63;
        }

        id v17 = (void *)MEMORY[0x1E4F5CF68];
        SEL v18 = [v6 options];
        uint64_t v19 = [v17 NextLessDecimatedDownsamplingPreference:[v18 preferredDownsamplingLevel]];
        id v20 = [v6 options];
        [v20 setPreferredDownsamplingLevel:v19];
      }
      id v21 = *(void **)(a1 + 40);
      uint64_t v22 = [v6 options];
      id v23 = [v21 fetchRequestFromStoredLocationOptions:v22];

      id v24 = [v6 options];
      uint64_t v25 = [v24 preferredDownsamplingLevel];

      if (v15) {
        break;
      }
      id v9 = v23;
    }
    while (v25 > 0);
  }
  uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v46 = (objc_class *)objc_opt_class();
    uint64_t v47 = NSStringFromClass(v46);
    v48 = [v6 options];
    uint64_t v49 = a1;
    uint64_t v50 = [v48 preferredDownsamplingLevel];
    id v71 = v11;
    uint64_t v51 = [v3 countForFetchRequest:v23 error:&v71];
    id v65 = v71;

    *(_DWORD *)buf = 138412802;
    v76 = v47;
    __int16 v77 = 2048;
    uint64_t v78 = v50;
    a1 = v49;
    __int16 v79 = 2048;
    uint64_t v80 = v51;
    _os_log_debug_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEBUG, "%@: selected downsampling level is %ld, location count is %lu", buf, 0x20u);

    id v11 = v65;
  }

  [v23 setFetchOffset:[*(id *)(a1 + 32) offset]];
  uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v52 = (objc_class *)objc_opt_class();
    v53 = NSStringFromClass(v52);
    uint64_t v54 = [v23 fetchLimit];
    uint64_t v55 = [v23 fetchOffset];
    *(_DWORD *)buf = 138412802;
    v76 = v53;
    __int16 v77 = 2048;
    uint64_t v78 = v54;
    __int16 v79 = 2048;
    uint64_t v80 = v55;
    _os_log_debug_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEBUG, "%@: using options fetch limit, %lu, fetch offset, %lu", buf, 0x20u);
  }
  id v70 = v11;
  v34 = [v3 executeFetchRequest:v23 error:&v70];
  id v35 = v70;

  id v36 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v56 = (objc_class *)objc_opt_class();
    v57 = NSStringFromClass(v56);
    v58 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v59 = [v34 count];
    *(_DWORD *)buf = 138413314;
    v76 = v57;
    __int16 v77 = 2112;
    uint64_t v78 = (uint64_t)v58;
    __int16 v79 = 2112;
    uint64_t v80 = (uint64_t)v23;
    __int16 v81 = 2048;
    uint64_t v82 = v59;
    __int16 v83 = 2112;
    id v84 = v35;
    _os_log_debug_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_DEBUG, "%@: %@, request, %@, results count, %lu, error, %@", buf, 0x34u);
  }
  uint64_t v37 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v23 fetchLimit]];
  if (!v35)
  {
    id v62 = v3;
    uint64_t v64 = a1;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v60 = v34;
    id v38 = v34;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v67 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          uint64_t v44 = (void *)MEMORY[0x1E016D870]();
          __int16 v45 = +[RTSynthesizedLocation createWithManagedObject:v43];
          if (v45) {
            [v37 addObject:v45];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v66 objects:v74 count:16];
      }
      while (v40);
    }

    id v35 = 0;
    id v3 = v62;
    a1 = v64;
    v34 = v60;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_67(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTSynthesizedLocationStore_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __70__RTSynthesizedLocationStore_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeLocationsPredating:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v15 = @"timestamp";
    id v7 = a4;
    uint64_t v14 = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    id v16 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    [(RTStore *)self purgePredating:v6 predicateMappings:v9 handler:v7];
  }
  else
  {
    id v10 = (void (**)(id, id))a4;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[RTSynthesizedLocationStore _removeLocationsPredating:handler:]";
      __int16 v21 = 1024;
      int v22 = 276;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    SEL v18 = @"requires a valid date.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v7 = [v12 errorWithDomain:v13 code:7 userInfo:v9];
    v10[2](v10, v7);
  }
}

- (void)removeLocationsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTSynthesizedLocationStore_removeLocationsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__RTSynthesizedLocationStore_removeLocationsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLocationsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeLocationsOnDateInterval:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v15 = @"timestamp";
    id v7 = a4;
    uint64_t v14 = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    id v16 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    [(RTStore *)self purgeDateInterval:v6 predicateMappings:v9 purgeLimit:3600 handler:v7];
  }
  else
  {
    id v10 = (void (**)(id, id))a4;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[RTSynthesizedLocationStore _removeLocationsOnDateInterval:handler:]";
      __int16 v21 = 1024;
      int v22 = 303;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    SEL v18 = @"requires a valid dateInterval.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v7 = [v12 errorWithDomain:v13 code:7 userInfo:v9];
    v10[2](v10, v7);
  }
}

- (void)removeLocationsOnDateInterval:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTSynthesizedLocationStore_removeLocationsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __68__RTSynthesizedLocationStore_removeLocationsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLocationsOnDateInterval:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (!a5)
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      id v11 = NSString;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = [v11 stringWithFormat:@"error of type, %@, is not supported", v13];

      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = v14;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      SEL v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];

      id v19 = v18;
      *a5 = v19;

LABEL_8:
      __int16 v21 = 0;
      goto LABEL_13;
    }
    __int16 v21 = [(RTSynthesizedLocationStore *)self fetchRequestFromStoredLocationOptions:v9];
    [v21 setFetchOffset:a4];
  }
  else
  {
    int v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"options");
    __int16 v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v21;
}

- (id)fetchRequestFromStoredLocationOptions:(id)a3
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[RTSynthesizedLocationMO fetchRequest];
    [v4 setReturnsObjectsAsFaults:0];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:1];
    v79[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
    id v72 = v4;
    [v4 setSortDescriptors:v6];

    id v7 = [v3 dateInterval];
    id v8 = [v7 startDate];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = v8;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v13 = v10;

    uint64_t v14 = [v3 dateInterval];
    uint64_t v15 = [v14 endDate];
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    id v18 = v17;

    uint64_t v19 = [v3 preferredDownsamplingLevel];
    if ([v3 batchSize])
    {
      unint64_t v20 = [v3 batchSize];
      uint64_t v21 = 3600;
      if (v20 < 0xE10) {
        uint64_t v21 = v20;
      }
    }
    else
    {
      uint64_t v21 = 3600;
    }
    uint64_t v69 = v21;
    int v22 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v23 = (void *)MEMORY[0x1E4F28BA0];
    id v71 = v13;
    id v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ <= %K", v13, @"timestamp"];
    v78[0] = v24;
    id v70 = v18;
    uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"timestamp", v18];
    v78[1] = v25;
    SEL v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
    uint64_t v27 = [v23 andPredicateWithSubpredicates:v26];

    long long v68 = (void *)v27;
    [v22 addObject:v27];
    v28 = (void *)MEMORY[0x1E4F28F60];
    __int16 v29 = [NSNumber numberWithUnsignedInteger:v19];
    uint64_t v30 = [v28 predicateWithFormat:@"%K >= %@", @"downsamplingLevel", v29];

    v74 = v22;
    long long v67 = (void *)v30;
    [v22 addObject:v30];
    uint64_t v31 = [v3 boundingBoxLocation];

    id v73 = v3;
    if (v31)
    {
      *(void *)buf = 0;
      uint64_t v32 = [v3 boundingBoxLocation];
      [v32 coordinate];
      uint64_t v33 = [v3 boundingBoxLocation];
      [v33 coordinate];
      v34 = [v3 boundingBoxLocation];
      [v34 horizontalAccuracy];
      RTCommonCalculateBoundingBox();

      uint64_t v64 = (void *)MEMORY[0x1E4F28BA0];
      id v35 = (void *)MEMORY[0x1E4F28F60];
      id v65 = [NSNumber numberWithDouble:0.0];
      id v36 = [v35 predicateWithFormat:@"%@ <= %K", v65, @"longitude"];
      v77[0] = v36;
      uint64_t v37 = (void *)MEMORY[0x1E4F28F60];
      id v38 = [NSNumber numberWithDouble:0.0];
      uint64_t v39 = [v37 predicateWithFormat:@"%K <= %@", @"longitude", v38];
      v77[1] = v39;
      uint64_t v40 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v41 = [NSNumber numberWithDouble:0.0];
      v42 = [v40 predicateWithFormat:@"%@ <= %K", v41, @"latitude"];
      v77[2] = v42;
      uint64_t v43 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v44 = [NSNumber numberWithDouble:0.0];
      __int16 v45 = [v43 predicateWithFormat:@"%K <= %@", @"latitude", v44];
      v77[3] = v45;
      uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
      uint64_t v47 = [v64 andPredicateWithSubpredicates:v46];

      [v74 addObject:v47];
    }
    v48 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v49 = (void *)MEMORY[0x1E4F28F60];
    long long v66 = [NSNumber numberWithDouble:0.0];
    uint64_t v50 = [v49 predicateWithFormat:@"%K >= %@", @"speed", v66];
    v76[0] = v50;
    uint64_t v51 = (void *)MEMORY[0x1E4F28F60];
    v52 = [NSNumber numberWithDouble:0.0];
    v53 = [v51 predicateWithFormat:@"%K > %@", @"speedAccuracy", v52];
    v76[1] = v53;
    uint64_t v54 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v55 = [NSNumber numberWithDouble:0.0];
    v56 = [v54 predicateWithFormat:@"%K > %@", @"horizontalAccuracy", v55];
    v76[2] = v56;
    v57 = (void *)MEMORY[0x1E4F28F60];
    v58 = [NSNumber numberWithDouble:0.0];
    uint64_t v59 = [v57 predicateWithFormat:@"%K > %@", @"verticalAccuracy", v58];
    v76[3] = v59;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
    uint64_t v61 = [v48 andPredicateWithSubpredicates:v60];

    [v74 addObject:v61];
    id v62 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v74];
    id v12 = v72;
    [v72 setPredicate:v62];

    [v72 setFetchBatchSize:100];
    [v72 setFetchLimit:v69];

    id v3 = v73;
    id v11 = v71;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }
    id v12 = 0;
  }

  return v12;
}

@end