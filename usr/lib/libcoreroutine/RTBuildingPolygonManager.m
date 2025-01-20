@interface RTBuildingPolygonManager
- (RTBuildingPolygonManager)init;
- (RTBuildingPolygonManager)initWithDistanceCalculator:(id)a3 MapServiceManager:(id)a4;
- (RTDistanceCalculator)distanceCalculator;
- (RTMapServiceManager)mapServiceManager;
- (id)_selectClosestPolygonsFromPolygons:(id)a3 locations:(id)a4 limit:(unint64_t)a5;
- (void)_fetchClosestBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6;
- (void)fetchClosestBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6;
- (void)setDistanceCalculator:(id)a3;
- (void)setMapServiceManager:(id)a3;
@end

@implementation RTBuildingPolygonManager

- (RTBuildingPolygonManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_MapServiceManager_);
}

- (RTBuildingPolygonManager)initWithDistanceCalculator:(id)a3 MapServiceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTBuildingPolygonManager;
  v10 = [(RTNotifier *)&v16 init];
  p_isa = (id *)&v10->super.super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_distanceCalculator, a3);
    objc_storeStrong(p_isa + 4, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (void)fetchClosestBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__RTBuildingPolygonManager_fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke;
  block[3] = &unk_1E6B93630;
  block[4] = self;
  id v16 = v10;
  double v18 = a4;
  unint64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

uint64_t __91__RTBuildingPolygonManager_fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchClosestBuildingPolygonsFromLocations:*(void *)(a1 + 40) radius:*(void *)(a1 + 64) limit:*(void *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

- (void)_fetchClosestBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = [v11 count];
    if (a4 > 0.0 && v13)
    {
      unint64_t v29 = a5;
      v30 = v12;
      id v14 = objc_opt_new();
      v15 = dispatch_group_create();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v11;
      uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v41 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            dispatch_group_enter(v15);
            v21 = [(RTBuildingPolygonManager *)self mapServiceManager];
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke;
            v37[3] = &unk_1E6B94E10;
            id v38 = v14;
            v39 = v15;
            [v21 fetchBuildingPolygonsFromLocation:v20 radius:v37 handler:a4];
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v17);
      }

      v22 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke_2;
      block[3] = &unk_1E6B90FA8;
      block[4] = self;
      id v33 = v14;
      id v34 = obj;
      id v12 = v30;
      unint64_t v36 = v29;
      id v35 = v30;
      id v23 = v14;
      dispatch_group_notify(v15, v22, block);
    }
    else
    {
      v24 = NSString;
      v25 = NSStringFromSelector(a2);
      v15 = [v24 stringWithFormat:@"invalid parameters passed to %@, locations.count, %lu, radius, %.2f, limit, %lu", v25, [v11 count], a4, a5];

      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F5CFE8];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46[0] = v15;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      v28 = [v26 errorWithDomain:v27 code:7 userInfo:v23];
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v28);
    }
  }
}

void __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = [v8 vertices];
        unint64_t v10 = [v9 count];

        if (v10 >= 3) {
          [*(id *)(a1 + 32) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) allObjects];
  id v4 = [v2 _selectClosestPolygonsFromPolygons:v3 locations:*(void *)(a1 + 48) limit:*(void *)(a1 + 64)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_selectClosestPolygonsFromPolygons:(id)a3 locations:(id)a4 limit:(unint64_t)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v46 = a4;
  if (a5)
  {
    SEL aSelector = a2;
    unint64_t v41 = a5;
    v9 = _rt_log_facility_get_os_log(RTLogFacilityMapService);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v42 count];
      *(_WORD *)&buf[22] = 2048;
      uint64_t v61 = [v46 count];
      __int16 v62 = 2048;
      unint64_t v63 = a5;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, polygon count, %lu, location count, %lu, limit, %lu", buf, 0x2Au);
    }
    if (![v42 count] || !objc_msgSend(v46, "count"))
    {
      id v38 = 0;
      goto LABEL_38;
    }
    os_log_t oslog = (os_log_t)objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v42;
    uint64_t v47 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v47)
    {
      uint64_t v45 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v55 != v45) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          id v13 = objc_alloc(MEMORY[0x1E4F5CE00]);
          long long v14 = [v12 centroid];
          [v14 latitude];
          double v16 = v15;
          uint64_t v17 = [v12 centroid];
          [v17 longitude];
          unint64_t v19 = (void *)[v13 initWithLatitude:0 longitude:v16 horizontalUncertainty:v18 date:-1.0];

          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v20 = v46;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v51;
            double v23 = 1.79769313e308;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v51 != v22) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = *(void *)(*((void *)&v50 + 1) + 8 * j);
                v26 = [(RTBuildingPolygonManager *)self distanceCalculator];
                uint64_t v49 = 0;
                [v26 distanceFromLocation:v19 toLocation:v25 error:&v49];
                double v28 = v27;
                uint64_t v29 = v49;

                if (v28 < v23 && v29 == 0) {
                  double v23 = v28;
                }
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }
            while (v21);
          }
          else
          {
            double v23 = 1.79769313e308;
          }

          id v31 = objc_alloc(MEMORY[0x1E4F5CE58]);
          v32 = [NSNumber numberWithDouble:v23];
          id v33 = (void *)[v31 initWithFirstObject:v32 secondObject:v12];

          if (v33) {
            [oslog addObject:v33];
          }
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v47);
    }

    id v34 = [oslog sortedArrayUsingComparator:&__block_literal_global_36];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v61 = 0;
    id v35 = [[_RTMap alloc] initWithInput:v34];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __79__RTBuildingPolygonManager__selectClosestPolygonsFromPolygons_locations_limit___block_invoke_2;
    v48[3] = &unk_1E6B94E58;
    v48[4] = buf;
    v48[5] = v41;
    v48[6] = aSelector;
    unint64_t v36 = [(_RTMap *)v35 withBlock:v48];

    if ([obj count] <= v41)
    {
      id v37 = v36;
    }
    else
    {
      id v37 = [v36 subarrayWithRange:0];
    }
    id v38 = v37;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: limit > 0", buf, 2u);
    }
    id v38 = 0;
  }

LABEL_38:

  return v38;
}

uint64_t __79__RTBuildingPolygonManager__selectClosestPolygonsFromPolygons_locations_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 firstObject];
  uint64_t v6 = [v4 firstObject];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __79__RTBuildingPolygonManager__selectClosestPolygonsFromPolygons_locations_limit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  if (v5 < *(void *)(a1 + 40))
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityMapService);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v8 = [v3 secondObject];
      v9 = [v3 firstObject];
      [v9 doubleValue];
      int v13 = 138412802;
      long long v14 = v7;
      __int16 v15 = 2112;
      double v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, sorted location, %@, distance, %.2f", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v5 = *(void *)(v4 + 24);
  }
  *(void *)(v4 + 24) = v5 + 1;
  long long v11 = [v3 secondObject];

  return v11;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_mapServiceManager, 0);
}

@end