@interface RTAppClipManager
- (ATXProactiveCDNDownloader)procativeCDNDownloader;
- (RTAppClipManager)init;
- (RTAppClipManager)initWithDistanceCalculator:(id)a3;
- (RTAppClipManager)initWithProactiveCDNDownloader:(id)a3 distanceCalculator:(id)a4;
- (RTDistanceCalculator)distanceCalculator;
- (id)_selectClosestLocationsFromLocations:(id)a3 toLocation:(id)a4 limit:(unint64_t)a5;
- (void)_fetchNearbyAppClipLocationsFromLocation:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6;
- (void)fetchNearbyAppClipLocationsFromLocation:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6;
- (void)setDistanceCalculator:(id)a3;
- (void)setProcativeCDNDownloader:(id)a3;
@end

@implementation RTAppClipManager

- (RTAppClipManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_);
}

- (RTAppClipManager)initWithDistanceCalculator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F93558]);
    self = [(RTAppClipManager *)self initWithProactiveCDNDownloader:v5 distanceCalculator:v4];

    v6 = self;
  }
  else
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (RTAppClipManager)initWithProactiveCDNDownloader:(id)a3 distanceCalculator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: procativeCDNDownloader";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTAppClipManager;
  v9 = [(RTNotifier *)&v15 init];
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_distanceCalculator, a4);
    objc_storeStrong(p_isa + 5, a3);
  }
  self = p_isa;
  v11 = self;
LABEL_10:

  return v11;
}

- (id)_selectClosestLocationsFromLocations:(id)a3 toLocation:(id)a4 limit:(unint64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v31 = a4;
  v29 = v9;
  if (v31)
  {
    SEL v28 = a2;
    os_log_t oslog = (os_log_t)objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          distanceCalculator = self->_distanceCalculator;
          id v37 = 0;
          [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v14 toLocation:v31 error:&v37];
          double v17 = v16;
          id v18 = v37;
          if (!v18)
          {
            id v19 = objc_alloc(MEMORY[0x1E4F5CE58]);
            v20 = [NSNumber numberWithDouble:v17];
            v21 = (void *)[v19 initWithFirstObject:v20 secondObject:v14];

            if (v21) {
              [oslog addObject:v21];
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v11);
    }

    v22 = [oslog sortedArrayUsingComparator:&__block_literal_global_39];
    *(void *)buf = 0;
    v34 = buf;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    v23 = [[_RTMap alloc] initWithInput:v22];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __74__RTAppClipManager__selectClosestLocationsFromLocations_toLocation_limit___block_invoke_2;
    v32[3] = &unk_1E6B95500;
    v32[4] = buf;
    v32[5] = v28;
    v24 = [(_RTMap *)v23 withBlock:v32];

    if ([v24 count] <= a5)
    {
      id v25 = v24;
    }
    else
    {
      id v25 = [v24 subarrayWithRange:0];
    }
    v26 = v25;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }
    v26 = 0;
  }

  return v26;
}

uint64_t __74__RTAppClipManager__selectClosestLocationsFromLocations_toLocation_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 firstObject];
  v6 = [v4 firstObject];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __74__RTAppClipManager__selectClosestLocationsFromLocations_toLocation_limit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityMapService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v7 = [v3 secondObject];
    id v8 = [v3 firstObject];
    [v8 doubleValue];
    int v12 = 138413058;
    v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, sorted location idx, %lu, location, %@, distance, %.2f", (uint8_t *)&v12, 0x2Au);
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v10 = [v3 secondObject];

  return v10;
}

- (void)_fetchNearbyAppClipLocationsFromLocation:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (!v11)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTAppClipManager _fetchNearbyAppClipLocationsFromLocation:radius:limit:handler:]";
      __int16 v27 = 1024;
      LODWORD(v28) = 114;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }
  }
  if (a4 < 0.0)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTAppClipManager _fetchNearbyAppClipLocationsFromLocation:radius:limit:handler:]";
      __int16 v27 = 1024;
      LODWORD(v28) = 115;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: radius >= 0 (in %s:%d)", buf, 0x12u);
    }
  }
  if (v12)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityMapService);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      __int16 v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v16;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2048;
      double v30 = a4;
      __int16 v31 = 2048;
      unint64_t v32 = a5;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, fetch nearby app clips, location, %@, radius, %.2f, limit, %lu", buf, 0x2Au);
    }
    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTLocation:v11];
    procativeCDNDownloader = self->_procativeCDNDownloader;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke;
    v19[3] = &unk_1E6B95550;
    v19[4] = self;
    SEL v22 = a2;
    id v21 = v12;
    id v20 = v11;
    double v23 = a4;
    unint64_t v24 = a5;
    [(ATXProactiveCDNDownloader *)procativeCDNDownloader heroDatasForLocation:v17 completion:v19];
  }
}

void __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke_2;
  block[3] = &unk_1E6B95528;
  id v15 = v6;
  long long v13 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v13;
  long long v19 = v13;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v16 = v5;
  uint64_t v17 = v9;
  id v18 = v10;
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, block);
}

void __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityMapService);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v32 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      long long v41 = v31;
      __int16 v42 = 2112;
      uint64_t v43 = v32;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v6 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 138412546;
      long long v41 = v5;
      __int16 v42 = 2048;
      uint64_t v43 = v6;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, fetched app clip count, %lu", buf, 0x16u);
    }
    uint64_t v7 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      uint64_t v33 = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v13 = (void *)MEMORY[0x1E016D870]();
          __int16 v14 = [v12 urlHash];

          if (v14)
          {
            id v15 = objc_alloc(MEMORY[0x1E4F5CE00]);
            [v12 latitude];
            double v17 = v16;
            [v12 longitude];
            double v19 = v18;
            uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
            uint64_t v21 = (void *)[v15 initWithLatitude:v20 longitude:v17 horizontalUncertainty:v19 date:-1.0];

            uint64_t v22 = *(void *)(a1 + 56);
            double v23 = *(void **)(*(void *)(a1 + 48) + 32);
            id v35 = 0;
            [v23 distanceFromLocation:v22 toLocation:v21 error:&v35];
            double v25 = v24;
            id v26 = v35;
            if (!v26 && v25 < *(double *)(a1 + 80))
            {
              __int16 v27 = _rt_log_facility_get_os_log(RTLogFacilityMapService);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                id v28 = NSStringFromSelector(*(SEL *)(a1 + 72));
                __int16 v29 = [v12 urlHash];
                *(_DWORD *)buf = 138413058;
                long long v41 = v28;
                __int16 v42 = 2112;
                uint64_t v43 = (uint64_t)v21;
                __int16 v44 = 2048;
                double v45 = v25;
                __int16 v46 = 2112;
                v47 = v29;
                _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, fetched app clip location, %@, distance, %f, urlHash, %@", buf, 0x2Au);

                uint64_t v7 = v33;
              }

              [v7 addObject:v21];
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v9);
    }

    double v30 = [*(id *)(a1 + 48) _selectClosestLocationsFromLocations:v7 toLocation:*(void *)(a1 + 56) limit:*(void *)(a1 + 88)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)fetchNearbyAppClipLocationsFromLocation:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTAppClipManager_fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke;
  block[3] = &unk_1E6B93630;
  void block[4] = self;
  id v16 = v10;
  double v18 = a4;
  unint64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

uint64_t __81__RTAppClipManager_fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchNearbyAppClipLocationsFromLocation:*(void *)(a1 + 40) radius:*(void *)(a1 + 64) limit:*(void *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (ATXProactiveCDNDownloader)procativeCDNDownloader
{
  return self->_procativeCDNDownloader;
}

- (void)setProcativeCDNDownloader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procativeCDNDownloader, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end