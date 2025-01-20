@interface RTElevationAdjuster
- (RTElevationAdjuster)initWithElevationManager:(id)a3;
- (RTElevationManager)elevationManager;
- (id)adjustCLLocation:(id)a3 elevation:(double)a4;
- (id)performElevationInterpolationOn:(id)a3 referenceElevations:(id)a4;
- (void)adjustElevation:(id)a3 handler:(id)a4;
- (void)adjustElevationForLocations:(id)a3 handler:(id)a4;
- (void)adjustElevationForSynthesizedLocations:(id)a3 handler:(id)a4;
- (void)adjustElevationForTripSegmentLocations:(id)a3 handler:(id)a4;
- (void)respondWithCLLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6;
- (void)respondWithSynthesizedLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6;
- (void)respondWithTripSegmentLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6;
@end

@implementation RTElevationAdjuster

- (void)respondWithSynthesizedLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [v10 count];
    if (v14 == [v11 count])
    {
      aSelector = a2;
      id v71 = v13;
      id v72 = v12;
      v15 = [MEMORY[0x1E4F1CA48] array];
      if ([v10 count])
      {
        unint64_t v16 = 0;
        v74 = v15;
        do
        {
          v17 = [v10 objectAtIndexedSubscript:v16];
          uint64_t v18 = [v17 locationType];

          v19 = [v10 objectAtIndexedSubscript:v16];
          [v19 verticalAccuracy];
          double v21 = v20;

          v22 = [v11 objectAtIndexedSubscript:v16];
          [v22 elevation];
          double v24 = v23;
          v25 = [v10 objectAtIndexedSubscript:v16];
          [v25 altitude];
          double v27 = v26;

          if (v24 != v27)
          {
            v28 = [v10 objectAtIndexedSubscript:v16];
            uint64_t v18 = [v28 locationType] | 0x10;

            double v21 = 10.0;
          }
          double v82 = v21;
          uint64_t v83 = v18;
          v29 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v55 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v55);
            v57 = NSStringFromSelector(aSelector);
            v58 = [v10 objectAtIndexedSubscript:v16];
            v59 = [v58 description];
            v60 = [v10 objectAtIndexedSubscript:v16];
            [v60 altitude];
            uint64_t v62 = v61;
            v63 = [v11 objectAtIndexedSubscript:v16];
            [v63 elevation];
            *(_DWORD *)buf = 138413314;
            uint64_t v85 = (uint64_t)v56;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v57;
            __int16 v88 = 2112;
            uint64_t v89 = (uint64_t)v59;
            __int16 v90 = 2048;
            uint64_t v91 = v62;
            __int16 v92 = 2048;
            uint64_t v93 = v64;
            _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "%@ %@ CLLocation %@, elevation from %.2f to %.2f", buf, 0x34u);
          }
          v77 = [RTSynthesizedLocation alloc];
          v81 = [v10 objectAtIndexedSubscript:v16];
          [v81 coordinate];
          double v31 = v30;
          double v33 = v32;
          v80 = [v11 objectAtIndexedSubscript:v16];
          [v80 elevation];
          double v35 = v34;
          v79 = [v10 objectAtIndexedSubscript:v16];
          [v79 horizontalAccuracy];
          double v37 = v36;
          v78 = [v10 objectAtIndexedSubscript:v16];
          [v78 course];
          double v39 = v38;
          v76 = [v10 objectAtIndexedSubscript:v16];
          [v76 courseAccuracy];
          double v41 = v40;
          v75 = [v10 objectAtIndexedSubscript:v16];
          [v75 speed];
          double v43 = v42;
          v44 = [v10 objectAtIndexedSubscript:v16];
          [v44 speedAccuracy];
          uint64_t v46 = v45;
          v47 = [v10 objectAtIndexedSubscript:v16];
          uint64_t v48 = [v47 geoRoadClass];
          v49 = [v10 objectAtIndexedSubscript:v16];
          uint64_t v50 = [v49 geoFormOfWay];
          v51 = [v10 objectAtIndexedSubscript:v16];
          [v51 timestamp];
          v53 = id v52 = v11;
          v54 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:](v77, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:", v48, v50, v83, v53, v31, v33, v35, v37, v82, v39, v41, v43, v46);

          id v11 = v52;
          v15 = v74;
          [v74 addObject:v54];

          ++v16;
        }
        while (v16 < [v10 count]);
      }
      v65 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        v68 = id v67 = v11;
        v69 = NSStringFromSelector(aSelector);
        uint64_t v70 = [v10 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v85 = (uint64_t)v68;
        __int16 v86 = 2112;
        uint64_t v87 = (uint64_t)v69;
        __int16 v88 = 2048;
        uint64_t v89 = v70;
        _os_log_debug_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_DEBUG, "%@ %@, adjusted %tu locations", buf, 0x20u);

        id v11 = v67;
      }

      id v13 = v71;
      id v12 = v72;
      (*((void (**)(id, NSObject *, id))v71 + 2))(v71, v15, v72);
    }
    else
    {
      v15 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v85 = [v11 count];
        __int16 v86 = 2048;
        uint64_t v87 = [v10 count];
        _os_log_fault_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_FAULT, "Number of elements (%tu) in elevations is not equal to number of elements in locations (%tu)", buf, 0x16u);
      }
    }
  }
}

- (void)adjustElevationForSynthesizedLocations:(id)a3 handler:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    double v24 = self;
    v8 = [MEMORY[0x1E4F1CA48] array];
    if ([v6 count])
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v11 = [v6 objectAtIndexedSubscript:v9];
        id v12 = [v11 timestamp];
        id v13 = [v6 objectAtIndexedSubscript:v9];
        uint64_t v14 = [v13 timestamp];
        v15 = (void *)[v10 initWithStartDate:v12 endDate:v14];

        id v16 = objc_alloc(MEMORY[0x1E4F5CDC0]);
        v17 = [v6 objectAtIndexedSubscript:v9];
        [v17 altitude];
        uint64_t v18 = [v16 initWithElevation:v15];
        [v8 addObject:v18];

        ++v9;
      }
      while (v9 < [v6 count]);
    }
    v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = [v6 count];
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "Invoked adjustElevationForLocations for %tu RTSynthesizedLocation values", buf, 0xCu);
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__RTElevationAdjuster_RTSynthesizedLocation__adjustElevationForSynthesizedLocations_handler___block_invoke;
    v25[3] = &unk_1E6B91508;
    id v26 = v6;
    double v27 = v24;
    id v28 = v7;
    [(RTElevationAdjuster *)v24 adjustElevation:v8 handler:v25];

    double v20 = v26;
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F5CFE8];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v8 = [NSString stringWithFormat:@"Received empty location array"];
    v32[0] = v8;
    double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    double v23 = (void *)[v21 initWithDomain:v22 code:7 userInfo:v20];
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v23);
  }
}

void __93__RTElevationAdjuster_RTSynthesizedLocation__adjustElevationForSynthesizedLocations_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5 || (uint64_t v6 = [v7 count], v6 != objc_msgSend(*(id *)(a1 + 32), "count"))) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [*(id *)(a1 + 40) respondWithSynthesizedLocation:*(void *)(a1 + 32) elevations:v7 error:0 handler:*(void *)(a1 + 48)];
  }
}

- (id)adjustCLLocation:(id)a3 elevation:(double)a4
{
  if (a3)
  {
    long long v17 = 0u;
    memset(v18, 0, 28);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    memset(v12, 0, sizeof(v12));
    *(_OWORD *)buf = 0u;
    [a3 clientLocation];
    *(double *)((char *)v12 + 12) = a4;
    id v5 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    v9[6] = v16;
    v9[7] = v17;
    v10[0] = v18[0];
    *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)v18 + 12);
    v9[2] = v12[1];
    v9[3] = v13;
    v9[4] = v14;
    v9[5] = v15;
    v9[0] = *(_OWORD *)buf;
    v9[1] = v12[0];
    uint64_t v6 = (void *)[v5 initWithClientLocation:v9];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (void)respondWithCLLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    uint64_t v15 = [v11 count];
    if (v15 == [v12 count])
    {
      id v36 = v13;
      aSelector = a2;
      id v35 = v14;
      long long v16 = [MEMORY[0x1E4F1CA48] array];
      if ([v11 count])
      {
        unint64_t v17 = 0;
        do
        {
          uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v22 = (objc_class *)objc_opt_class();
            double v23 = NSStringFromClass(v22);
            double v24 = NSStringFromSelector(aSelector);
            double v39 = [v11 objectAtIndexedSubscript:v17];
            v25 = [v39 description];
            double v38 = [v11 objectAtIndexedSubscript:v17];
            [v38 altitude];
            uint64_t v27 = v26;
            id v28 = [v12 objectAtIndexedSubscript:v17];
            [v28 elevation];
            *(_DWORD *)buf = 138413314;
            uint64_t v41 = (uint64_t)v23;
            __int16 v42 = 2112;
            uint64_t v43 = (uint64_t)v24;
            __int16 v44 = 2112;
            uint64_t v45 = (uint64_t)v25;
            __int16 v46 = 2048;
            uint64_t v47 = v27;
            __int16 v48 = 2048;
            uint64_t v49 = v29;
            _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "%@ %@ CLLocation %@, elevation from %.2f to %.2f", buf, 0x34u);
          }
          v19 = [v11 objectAtIndexedSubscript:v17];
          double v20 = [v12 objectAtIndexedSubscript:v17];
          [v20 elevation];
          id v21 = -[RTElevationAdjuster adjustCLLocation:elevation:](self, "adjustCLLocation:elevation:", v19);

          [v16 addObject:v21];
          ++v17;
        }
        while (v17 < [v11 count]);
      }
      uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = (objc_class *)objc_opt_class();
        double v32 = NSStringFromClass(v31);
        double v33 = NSStringFromSelector(aSelector);
        uint64_t v34 = [v11 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v41 = (uint64_t)v32;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v33;
        __int16 v44 = 2048;
        uint64_t v45 = v34;
        _os_log_debug_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEBUG, "%@ %@, adjusted %tu locations", buf, 0x20u);
      }
      id v14 = v35;
      id v13 = v36;
      (*((void (**)(id, NSObject *, id))v35 + 2))(v35, v16, v36);
    }
    else
    {
      long long v16 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v41 = [v12 count];
        __int16 v42 = 2048;
        uint64_t v43 = [v11 count];
        _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Number of elements (%tu) in elevations is not equal to number of elements in locations (%tu)", buf, 0x16u);
      }
    }
  }
}

- (void)adjustElevationForLocations:(id)a3 handler:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    uint64_t v27 = self;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke;
    v32[3] = &unk_1E6B93A18;
    id v8 = v6;
    id v33 = v8;
    [v8 enumerateObjectsUsingBlock:v32];
    unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    if ([v8 count])
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v12 = [v8 objectAtIndexedSubscript:v10];
        id v13 = [v12 timestamp];
        id v14 = [v8 objectAtIndexedSubscript:v10];
        uint64_t v15 = [v14 timestamp];
        long long v16 = (void *)[v11 initWithStartDate:v13 endDate:v15];

        id v17 = objc_alloc(MEMORY[0x1E4F5CDC0]);
        uint64_t v18 = [v8 objectAtIndexedSubscript:v10];
        [v18 altitude];
        v19 = [v17 initWithElevation:v16];
        [v9 addObject:v19];

        ++v10;
      }
      while (v10 < [v8 count]);
    }
    double v20 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v26;
      _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "Invoked adjustElevationForLocations for %tu CLLocation values", buf, 0xCu);
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke_8;
    v28[3] = &unk_1E6B91508;
    id v29 = v8;
    uint64_t v30 = v27;
    id v31 = v7;
    [(RTElevationAdjuster *)v27 adjustElevation:v9 handler:v28];

    id v21 = v33;
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = *MEMORY[0x1E4F5CFE8];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    id v21 = [NSString stringWithFormat:@"Received empty location array"];
    v37[0] = v21;
    double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    v25 = (void *)[v22 initWithDomain:v23 code:7 userInfo:v24];
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v25);
  }
}

void __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    id v6 = [v3 toString];
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    unint64_t v10 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "adjustElevationForLocations,locationCount,%tu,location,%@", (uint8_t *)&v7, 0x16u);
  }
}

void __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5 || (uint64_t v6 = [v7 count], v6 != objc_msgSend(*(id *)(a1 + 32), "count"))) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [*(id *)(a1 + 40) respondWithCLLocation:*(void *)(a1 + 32) elevations:v7 error:0 handler:*(void *)(a1 + 48)];
  }
}

- (void)respondWithTripSegmentLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [v10 count];
    if (v14 == [v11 count])
    {
      aSelector = a2;
      id v61 = v13;
      id v62 = v12;
      uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
      if ([v10 count])
      {
        unint64_t v16 = 0;
        uint64_t v64 = v15;
        do
        {
          id v17 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v45 = (objc_class *)objc_opt_class();
            __int16 v46 = NSStringFromClass(v45);
            uint64_t v47 = NSStringFromSelector(aSelector);
            __int16 v48 = [v10 objectAtIndexedSubscript:v16];
            uint64_t v49 = [v48 description];
            uint64_t v50 = [v10 objectAtIndexedSubscript:v16];
            [v50 altitude];
            uint64_t v52 = v51;
            v53 = [v11 objectAtIndexedSubscript:v16];
            [v53 elevation];
            *(_DWORD *)buf = 138413314;
            uint64_t v71 = (uint64_t)v46;
            __int16 v72 = 2112;
            uint64_t v73 = (uint64_t)v47;
            __int16 v74 = 2112;
            uint64_t v75 = (uint64_t)v49;
            __int16 v76 = 2048;
            uint64_t v77 = v52;
            __int16 v78 = 2048;
            uint64_t v79 = v54;
            _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@ %@ CLLocation %@, elevation from %.2f to %.2f", buf, 0x34u);
          }
          id v18 = objc_alloc(MEMORY[0x1E4F1E670]);
          v69 = [v10 objectAtIndexedSubscript:v16];
          v19 = [v69 timestamp];
          v68 = [v10 objectAtIndexedSubscript:v16];
          [v68 latitude];
          double v21 = v20;
          id v67 = [v10 objectAtIndexedSubscript:v16];
          [v67 longitude];
          double v23 = v22;
          v66 = [v10 objectAtIndexedSubscript:v16];
          [v66 horizontalAccuracy];
          double v25 = v24;
          v65 = [v10 objectAtIndexedSubscript:v16];
          [v65 course];
          double v27 = v26;
          id v28 = [v10 objectAtIndexedSubscript:v16];
          [v28 courseAccuracy];
          double v30 = v29;
          id v31 = [v10 objectAtIndexedSubscript:v16];
          [v31 speed];
          double v33 = v32;
          [v10 objectAtIndexedSubscript:v16];
          v35 = uint64_t v34 = v10;
          [v35 speedAccuracy];
          double v37 = v36;
          double v38 = [v11 objectAtIndexedSubscript:v16];
          [v38 elevation];
          double v40 = v39;
          uint64_t v41 = [v34 objectAtIndexedSubscript:v16];
          uint64_t v42 = [v18 initWithTime:v19 locType:objc_msgSend(v41, "locType") latitude:v21 longitude:v23 horizontalAccuracy:v25 course:v27 courseAccuracy:v30 speed:v33 speedAccuracy:v37 altitude:v40 altitudeAccuracy:0x4024000000000000];
          id v43 = v11;
          __int16 v44 = (void *)v42;

          id v10 = v34;
          uint64_t v15 = v64;
          [v64 addObject:v44];

          id v11 = v43;
          ++v16;
        }
        while (v16 < [v34 count]);
      }
      v55 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        v58 = id v57 = v11;
        v59 = NSStringFromSelector(aSelector);
        uint64_t v60 = [v10 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v71 = (uint64_t)v58;
        __int16 v72 = 2112;
        uint64_t v73 = (uint64_t)v59;
        __int16 v74 = 2048;
        uint64_t v75 = v60;
        _os_log_debug_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_DEBUG, "%@ %@, adjusted %tu locations", buf, 0x20u);

        id v11 = v57;
      }

      id v13 = v61;
      id v12 = v62;
      (*((void (**)(id, NSObject *, id))v61 + 2))(v61, v15, v62);
    }
    else
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v71 = [v11 count];
        __int16 v72 = 2048;
        uint64_t v73 = [v10 count];
        _os_log_fault_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_FAULT, "Number of elements (%tu) in elevations is not equal to number of elements in locations (%tu)", buf, 0x16u);
      }
    }
  }
}

- (void)adjustElevationForTripSegmentLocations:(id)a3 handler:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    double v24 = self;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    if ([v6 count])
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v11 = [v6 objectAtIndexedSubscript:v9];
        id v12 = [v11 timestamp];
        id v13 = [v6 objectAtIndexedSubscript:v9];
        uint64_t v14 = [v13 timestamp];
        uint64_t v15 = (void *)[v10 initWithStartDate:v12 endDate:v14];

        id v16 = objc_alloc(MEMORY[0x1E4F5CDC0]);
        id v17 = [v6 objectAtIndexedSubscript:v9];
        [v17 altitude];
        id v18 = [v16 initWithElevation:v15];
        [v8 addObject:v18];

        ++v9;
      }
      while (v9 < [v6 count]);
    }
    v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = [v6 count];
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "Invoked adjustElevationForLocations for %tu CLLocation values", buf, 0xCu);
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__RTElevationAdjuster_CLTripSegmentLocation__adjustElevationForTripSegmentLocations_handler___block_invoke;
    v25[3] = &unk_1E6B91508;
    id v26 = v6;
    double v27 = v24;
    id v28 = v7;
    [(RTElevationAdjuster *)v24 adjustElevation:v8 handler:v25];

    double v20 = v26;
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F5CFE8];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v8 = [NSString stringWithFormat:@"Received empty location array"];
    v32[0] = v8;
    double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    double v23 = (void *)[v21 initWithDomain:v22 code:7 userInfo:v20];
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v23);
  }
}

void __93__RTElevationAdjuster_CLTripSegmentLocation__adjustElevationForTripSegmentLocations_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5 || (uint64_t v6 = [v7 count], v6 != objc_msgSend(*(id *)(a1 + 32), "count"))) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [*(id *)(a1 + 40) respondWithTripSegmentLocation:*(void *)(a1 + 32) elevations:v7 error:0 handler:*(void *)(a1 + 48)];
  }
}

- (RTElevationAdjuster)initWithElevationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTElevationAdjuster;
  uint64_t v6 = [(RTElevationAdjuster *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_elevationManager, a3);
  }

  return v7;
}

- (id)performElevationInterpolationOn:(id)a3 referenceElevations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5 || ![v5 count])
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      id v33 = v5;
      goto LABEL_21;
    }
    __int16 v87 = 0;
    uint64_t v31 = "Attempting adjustElevationForLocationsWithElevations with no input elevation data";
    double v32 = (uint8_t *)&v87;
LABEL_46:
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, v31, v32, 2u);
    goto LABEL_20;
  }
  if (!v6 || ![v6 count])
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    uint64_t v31 = "Attempting adjustElevationForLocationsWithElevations with no reference elevation data";
    double v32 = buf;
    goto LABEL_46;
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v7 = 1;
    while (1)
    {
      uint64_t v8 = [v6 objectAtIndexedSubscript:v7 - 1];
      objc_super v9 = [v8 endDate];
      id v10 = [v6 objectAtIndexedSubscript:v7];
      id v11 = [v10 endDate];
      int v12 = [v9 isOnOrAfter:v11];

      if (v12) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_9;
      }
    }
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    __int16 v85 = 0;
    uint64_t v31 = "Reference elevation data not in chronological order";
    double v32 = (uint8_t *)&v85;
    goto LABEL_46;
  }
LABEL_9:
  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v13 = 1;
    while (1)
    {
      uint64_t v14 = [v5 objectAtIndexedSubscript:v13 - 1];
      uint64_t v15 = [v14 endDate];
      id v16 = [v5 objectAtIndexedSubscript:v13];
      id v17 = [v16 endDate];
      int v18 = [v15 isOnOrAfter:v17];

      if (v18) {
        break;
      }
      if (++v13 >= (unint64_t)[v5 count]) {
        goto LABEL_13;
      }
    }
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    __int16 v84 = 0;
    uint64_t v31 = "Input elevation data not in chronological order";
    double v32 = (uint8_t *)&v84;
    goto LABEL_46;
  }
LABEL_13:
  uint64_t v83 = v6;
  uint64_t v19 = [v6 count];
  uint64_t v20 = [v5 count];
  id v21 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v22 = 0;
  uint64_t v81 = v20;
  uint64_t v23 = v20 - 1;
  while (1)
  {
    double v24 = [v5 objectAtIndexedSubscript:v22];
    double v25 = [v24 endDate];
    id v26 = [v83 objectAtIndexedSubscript:0];
    double v27 = [v26 endDate];
    uint64_t v28 = [v25 compare:v27];

    if (v28 != -1 || v22 >= v23) {
      break;
    }
    double v29 = [v5 objectAtIndexedSubscript:v22];
    [v21 addObject:v29];

    ++v22;
  }
  uint64_t v35 = v81;
  uint64_t v80 = v21;
  if (v22 >= v81 || v19 < 2)
  {
    id v6 = v83;
  }
  else
  {
    uint64_t v36 = 0;
    uint64_t v79 = v19 - 1;
    id v6 = v83;
    do
    {
      id v37 = objc_alloc(MEMORY[0x1E4F28C18]);
      double v38 = [v6 objectAtIndexedSubscript:v36];
      double v39 = [v38 endDate];
      uint64_t v82 = v36 + 1;
      double v40 = [v6 objectAtIndexedSubscript:];
      uint64_t v41 = [v40 endDate];
      uint64_t v42 = (void *)[v37 initWithStartDate:v39 endDate:v41];

      do
      {
        id v43 = [v5 objectAtIndexedSubscript:v22];
        __int16 v44 = [v43 endDate];
        int v45 = [v42 containsDate:v44];

        if (!v45) {
          break;
        }
        __int16 v46 = [v5 objectAtIndexedSubscript:v22];
        uint64_t v47 = [v46 endDate];
        __int16 v48 = [v6 objectAtIndexedSubscript:v36];
        uint64_t v49 = [v48 endDate];
        [v47 timeIntervalSinceDate:v49];
        double v51 = v50;

        uint64_t v52 = [v6 objectAtIndexedSubscript:v82];
        [v52 elevation];
        double v54 = v53;
        v55 = [v6 objectAtIndexedSubscript:v36];
        [v55 elevation];
        double v57 = v56;

        v58 = [v5 objectAtIndexedSubscript:v22];
        [v58 elevation];
        double v60 = v59;

        [v42 duration];
        if (v61 > 0.0)
        {
          id v62 = [v6 objectAtIndexedSubscript:v36];
          [v62 elevation];
          double v64 = v63;
          [v42 duration];
          double v60 = v64 + v51 / v65 * (v54 - v57);
        }
        id v66 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v67 = [v5 objectAtIndexedSubscript:v22];
        v68 = [v67 startDate];
        v69 = [v5 objectAtIndexedSubscript:v22];
        uint64_t v70 = [v69 endDate];
        uint64_t v71 = (void *)[v66 initWithStartDate:v68 endDate:v70];

        id v72 = objc_alloc(MEMORY[0x1E4F5CDC0]);
        uint64_t v73 = [v5 objectAtIndexedSubscript:v22];
        [v73 elevationUncertainty];
        double v75 = v74;
        __int16 v76 = [v5 objectAtIndexedSubscript:v22];
        uint64_t v77 = [v72 initWithElevation:v71 dateInterval:objc_msgSend(v76, "estimationStatus") elevationUncertainty:v60 estimationStatus:v75];
        [v80 addObject:v77];

        ++v22;
        uint64_t v35 = v81;
        id v6 = v83;
      }
      while (v22 < v81);

      if (v22 >= v35) {
        break;
      }
      ++v36;
    }
    while (v82 < v79);
  }
  if (v22 >= v35)
  {
    id v33 = v80;
  }
  else
  {
    id v33 = v80;
    do
    {
      __int16 v78 = [v5 objectAtIndexedSubscript:v22];
      [v80 addObject:v78];

      ++v22;
    }
    while (v35 != v22);
    id v6 = v83;
  }
LABEL_21:

  return v33;
}

- (void)adjustElevation:(id)a3 handler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    id v10 = [v6 firstObject];
    id v11 = [v10 endDate];
    int v12 = (void *)[v9 initWithTimeInterval:v11 sinceDate:-10.0];
    id v13 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v14 = [v6 lastObject];
    uint64_t v15 = [v14 endDate];
    id v16 = (void *)[v13 initWithTimeInterval:v15 sinceDate:10.0];
    id v17 = (void *)[v8 initWithStartDate:v12 endDate:v16];

    int v18 = (void *)[objc_alloc(MEMORY[0x1E4F5CF28]) initWithDateInterval:v17 batchSize:0];
    elevationManager = self->_elevationManager;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__RTElevationAdjuster_adjustElevation_handler___block_invoke;
    v23[3] = &unk_1E6B92320;
    id v26 = v7;
    id v24 = v6;
    double v25 = self;
    [(RTElevationManager *)elevationManager fetchElevationsWithOptions:v18 handler:v23];

    uint64_t v20 = v26;
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F5CFE8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    id v17 = [NSString stringWithFormat:@"Received empty input elevation array"];
    v28[0] = v17;
    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v20 = (void *)[v21 initWithDomain:v22 code:7 userInfo:v18];
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v20);
  }
}

void __47__RTElevationAdjuster_adjustElevation_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v5 = [*(id *)(a1 + 40) performElevationInterpolationOn:*(void *)(a1 + 32) referenceElevations:v6];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (void).cxx_destruct
{
}

@end