@interface RTLocationSmoother
+ (int)_inferLocationType:(id)a3;
- (double)getRefAlt:(id)a3;
- (id)estimateLocationFromFallbackModelWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5;
- (id)estimateLocationWithLocations:(id)a3 timestamp:(double)a4;
- (id)estimateLocationWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5 meta:(id)a6;
- (id)estimateVehicleLocationWithLocations:(id)a3 parkingTimestamp:(double)a4;
- (id)inflateHorizontalAccuracyWithLocation:(id)a3 speed:(double)a4 timestamp:(double)a5;
- (id)interpolateLocation1:(id)a3 location2:(id)a4 weigth:(double)a5 speed:(double)a6 timestamp:(double)a7;
- (id)smoothLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5;
- (id)snapToBestLocationWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5;
@end

@implementation RTLocationSmoother

- (double)getRefAlt:(id)a3
{
  id v3 = a3;
  [v3 verticalAccuracy];
  double v4 = 0.0;
  if (v5 > 0.0)
  {
    [v3 altitude];
    double v4 = v6;
  }

  return v4;
}

- (id)estimateLocationWithLocations:(id)a3 timestamp:(double)a4
{
  return [(RTLocationSmoother *)self estimateLocationWithLocations:a3 timestamp:MEMORY[0x1E4F1CC08] parameters:0 meta:a4];
}

- (id)estimateLocationWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5 meta:(id)a6
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = MEMORY[0x1E4F1CC28];
  v14 = [v10 objectForKey:@"kRTLocationSmootherPreciseLocationOnlyMode" defaultObject:MEMORY[0x1E4F1CC28]];
  int v15 = [v14 BOOLValue];

  v16 = [v10 objectForKey:@"kRTLocationSmootherEnableFallbackModel" defaultObject:v13];
  int v72 = [v16 BOOLValue];

  v17 = [v10 objectForKey:@"kRTLocationSmootherInterpolateTime" defaultObject:MEMORY[0x1E4F1CC38]];
  int v18 = [v17 BOOLValue];

  v19 = [v10 objectForKey:@"kRTLocationSmootherAverageMovingSpeed" defaultObject:&unk_1F34536A8];
  [v19 doubleValue];
  double v21 = v20;

  uint64_t v70 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  v90[0] = v70;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
  v23 = [v12 sortedArrayUsingDescriptors:v22];

  v71 = v23;
  if (!v15)
  {
    id v26 = v23;
    v44 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
    v73 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", @"timestamp", v44];
    v46 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:];
    v29 = [v26 filteredArrayUsingPredicate:v46];

    v47 = [v29 lastObject];
    v48 = [v47 timestamp];
    [v48 timeIntervalSinceReferenceDate];
    double v50 = v49;

    v25 = [(RTLocationSmoother *)self smoothLocations:v26 timestamp:v10 parameters:v50 + -0.00000001];
    if (v25)
    {
      if (v18)
      {
        v51 = [v26 filteredArrayUsingPredicate:v73];
        v52 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          double v77 = *(double *)&v44;
          __int16 v78 = 2048;
          double v79 = COERCE_DOUBLE([v51 count]);
          _os_log_debug_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, interpolation, referenceDate, %@, post locations, %lu", buf, 0x16u);
        }

        if ([v51 count])
        {
          v69 = v44;
          v53 = [v51 firstObject];
          v54 = [v53 timestamp];
          [v54 timeIntervalSinceReferenceDate];
          double v56 = v55;

          v57 = [(RTLocationSmoother *)self smoothLocations:v26 timestamp:v10 parameters:v56];
          v58 = v57;
          if (v57 && v50 != v56)
          {
            *(double *)&v30 = [(RTLocationSmoother *)self interpolateLocation1:v25 location2:v57 weigth:1.0 - (a4 - v50) / (v56 - v50) speed:v21 timestamp:a4];
            v59 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134219522;
              double v77 = v50;
              __int16 v78 = 2048;
              double v79 = a4;
              __int16 v80 = 2048;
              double v81 = v56;
              __int16 v82 = 2048;
              double v83 = 1.0 - (a4 - v50) / (v56 - v50);
              __int16 v84 = 2112;
              v85 = v25;
              __int16 v86 = 2112;
              v87 = v58;
              __int16 v88 = 2112;
              v89 = v30;
              _os_log_debug_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, interpolation, t1, %.2f, timeofinterest, %.2f, t2, %.2f, weight, %.2f, location1, %@, location2, %@, interpolatedLocation, %@", buf, 0x48u);
            }

            v44 = v69;
            if (*(double *)&v30 == 0.0) {
              goto LABEL_32;
            }
LABEL_27:
            v45 = (void *)v70;
            goto LABEL_35;
          }

          v44 = v69;
        }
      }
LABEL_32:
      *(double *)&v30 = [(RTLocationSmoother *)self inflateHorizontalAccuracyWithLocation:v25 speed:v21 timestamp:a4];
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      *(double *)&v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v45 = (void *)v70;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        double v77 = *(double *)&v25;
        __int16 v78 = 2112;
        double v79 = *(double *)&v30;
        _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, allLocationMode, locationT1, %@, estimatedLocation, %@", buf, 0x16u);
      }
      goto LABEL_34;
    }
    *(double *)&v30 = 0.0;
    goto LABEL_27;
  }
  uint64_t v68 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type IN %@", &unk_1F3452AA8];
  v73 = [v23 filteredArrayUsingPredicate:];
  v24 = -[RTLocationSmoother smoothLocations:timestamp:parameters:](self, "smoothLocations:timestamp:parameters:", a4);
  v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type IN %@", &unk_1F3452AC0];
  id v26 = [v23 filteredArrayUsingPredicate:v25];
  v67 = self;
  *(double *)&v27 = [(RTLocationSmoother *)self snapToBestLocationWithLocations:v26 timestamp:v10 parameters:a4];
  v28 = v24;
  v29 = v28;
  v30 = v28;
  if (*(double *)&v27 != 0.0)
  {
    if (!v28)
    {
      *(double *)&v30 = COERCE_DOUBLE(v27);
      if (v11) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
    [v27 horizontalAccuracy];
    double v32 = v31 + v31;
    [v29 horizontalAccuracy];
    v30 = v29;
    if (v32 < v33)
    {
      *(double *)&v30 = COERCE_DOUBLE(v27);
    }
  }
  if (v11)
  {
LABEL_7:
    v66 = v11;
    v65 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
    v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", @"timestamp", v65];
    v35 = [v73 filteredArrayUsingPredicate:v34];
    v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v35 count]];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __78__RTLocationSmoother_estimateLocationWithLocations_timestamp_parameters_meta___block_invoke;
    v74[3] = &unk_1E6B93A18;
    id v37 = v36;
    id v75 = v37;
    [v35 enumerateObjectsUsingBlock:v74];
    if ([v37 count])
    {
      v38 = [v37 valueForKeyPath:@"@avg.self"];
      [v38 doubleValue];
      double v40 = v39;

      v41 = [NSNumber numberWithDouble:v40];
      [v66 setObject:v41 forKeyedSubscript:@"kRTLocationSmootherSpeedEstimationAfterDate"];

      v42 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v77 = v40;
        _os_log_debug_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, preciseLocationMode, speedAfterDate, %f", buf, 0xCu);
      }
    }
    id v11 = v66;
  }
LABEL_12:
  v43 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    double v77 = *(double *)&v29;
    __int16 v78 = 2112;
    double v79 = *(double *)&v27;
    __int16 v80 = 2112;
    double v81 = *(double *)&v30;
    _os_log_debug_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, preciseLocationMode, gpsEstimatedLocation, %@, wifiEstimatedLocation, %@, interpolatedLocation, %@", buf, 0x20u);
  }

  self = v67;
  v44 = (void *)v68;
  v45 = (void *)v70;
LABEL_34:

LABEL_35:
  int v60 = v72;
  if (*(double *)&v30 != 0.0) {
    int v60 = 0;
  }
  if (v60 == 1)
  {
    v61 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v62 = v71;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, fallback model is engaged", buf, 2u);
    }

    v63 = [(RTLocationSmoother *)self estimateLocationFromFallbackModelWithLocations:v71 timestamp:v10 parameters:a4];
  }
  else
  {
    v63 = v30;
    v62 = v71;
  }

  return v63;
}

void __78__RTLocationSmoother_estimateLocationWithLocations_timestamp_parameters_meta___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 speed];
  if (v3 > 0.0)
  {
    double v4 = *(void **)(a1 + 32);
    double v5 = NSNumber;
    [v7 speed];
    double v6 = [v5 numberWithDouble:];
    [v4 addObject:v6];
  }
}

- (id)interpolateLocation1:(id)a3 location2:(id)a4 weigth:(double)a5 speed:(double)a6 timestamp:(double)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [v11 timestamp];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14;

  v16 = [v12 timestamp];
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;

  [v11 horizontalAccuracy];
  double v20 = v19;
  [v12 horizontalAccuracy];
  double v22 = v21;
  long long v43 = 0u;
  memset(v44, 0, 28);
  long long v42 = 0u;
  long long v40 = 0u;
  memset(v41, 0, sizeof(v41));
  long long v39 = 0u;
  memset(&v38[2], 0, 32);
  if (v11) {
    [v11 clientLocation];
  }
  double v23 = a7 - v15;
  if (a7 - v15 < 0.0) {
    double v23 = -(a7 - v15);
  }
  double v24 = v20 + a6 * v23;
  double v25 = v18 - a7;
  if (v18 - a7 < 0.0) {
    double v25 = -(v18 - a7);
  }
  double v26 = v22 + a6 * v25;
  if (v24 >= v26) {
    double v27 = v26;
  }
  else {
    double v27 = v24;
  }
  [v11 coordinate];
  double v29 = v28;
  [v12 coordinate];
  *(double *)((char *)&v38[2] + 4) = (1.0 - a5) * v30 + v29 * a5;
  [v11 coordinate];
  double v32 = v31;
  [v12 coordinate];
  *(double *)((char *)&v38[2] + 12) = (1.0 - a5) * v33 + v32 * a5;
  *(double *)((char *)&v38[3] + 4) = v27;
  *(double *)((char *)v41 + 12) = a7;
  id v34 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  v37[6] = v42;
  v37[7] = v43;
  v38[0] = v44[0];
  *(_OWORD *)((char *)v38 + 12) = *(_OWORD *)((char *)v44 + 12);
  v37[2] = v39;
  v37[3] = v40;
  v37[4] = v41[0];
  v37[5] = v41[1];
  v37[0] = v38[2];
  v37[1] = v38[3];
  v35 = (void *)[v34 initWithClientLocation:v37];

  return v35;
}

- (id)inflateHorizontalAccuracyWithLocation:(id)a3 speed:(double)a4 timestamp:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 timestamp];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = a5 - v9;

  if (v10 < 0.0) {
    double v10 = -v10;
  }
  [v7 horizontalAccuracy];
  double v12 = v11 + a4 * v10;
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    [v7 horizontalAccuracy];
    *(_DWORD *)buf = 134218496;
    *(double *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, interpolation, no follow-up locations, delta, %.2f, originalHorizontalAccuray, %.2f, newHorizontalAccuracy, %.2f", buf, 0x20u);
  }

  long long v25 = 0u;
  memset(v26, 0, 28);
  long long v24 = 0u;
  long long v22 = 0u;
  memset(v23, 0, sizeof(v23));
  long long v21 = 0u;
  memset(buf, 0, sizeof(buf));
  if (v7) {
    [v7 clientLocation];
  }
  *(double *)&buf[20] = v12;
  *(double *)((char *)v23 + 12) = a5;
  id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  v18[6] = v24;
  v18[7] = v25;
  v19[0] = v26[0];
  *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)v26 + 12);
  v18[2] = v21;
  v18[3] = v22;
  v18[4] = v23[0];
  v18[5] = v23[1];
  v18[0] = *(_OWORD *)buf;
  v18[1] = *(_OWORD *)&buf[16];
  double v15 = (void *)[v14 initWithClientLocation:v18];

  return v15;
}

- (id)snapToBestLocationWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  double v9 = [v8 objectForKey:@"kRTLocationSmootherAverageMovingSpeed" defaultObject:&unk_1F34536A8];
  [v9 doubleValue];
  double v11 = v10;

  long long v45 = 0u;
  memset(v46, 0, 28);
  long long v44 = 0u;
  long long v42 = 0u;
  memset(v43, 0, sizeof(v43));
  long long v41 = 0u;
  memset(v40, 0, sizeof(v40));
  double v12 = objc_opt_new();
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 clientLocation];
  }
  else
  {
    long long v45 = 0u;
    memset(v46, 0, 28);
    long long v44 = 0u;
    long long v42 = 0u;
    memset(v43, 0, sizeof(v43));
    long long v41 = 0u;
    memset(v40, 0, sizeof(v40));
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v7;
  double v15 = (void *)[v14 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v15)
  {
    v16 = 0;
    uint64_t v17 = *(void *)v37;
    double v18 = -1.0;
    while (1)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        double v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (v16)
        {
          [*(id *)(*((void *)&v36 + 1) + 8 * i) horizontalAccuracy];
          double v22 = v21;
          double v23 = [v20 timestamp];
          [v23 timeIntervalSinceReferenceDate];
          double v25 = v22 + v11 * vabdd_f64(a4, v24);

          if (v25 >= v18) {
            continue;
          }
          id v26 = v20;
        }
        else
        {
          id v26 = v20;
          [v26 horizontalAccuracy];
          double v28 = v27;
          v16 = [v26 timestamp];
          [v16 timeIntervalSinceReferenceDate];
          double v25 = v28 + v11 * vabdd_f64(a4, v29);
        }

        double v18 = v25;
        v16 = v26;
      }
      double v15 = (void *)[v14 countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (!v15)
      {

        if (v16
          && (*(double *)((char *)v43 + 12) = a4,
              LODWORD(v44) = 4,
              *(double *)((char *)&v40[1] + 4) = v18,
              [v16 coordinate],
              *(void *)((char *)v40 + 4) = v30,
              [v16 coordinate],
              *(void *)((char *)v40 + 12) = v31,
              *(double *)((char *)&v40[1] + 4) > 0.0))
        {
          id v32 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          v34[6] = v44;
          v34[7] = v45;
          v35[0] = v46[0];
          *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v46 + 12);
          v34[2] = v41;
          v34[3] = v42;
          v34[4] = v43[0];
          v34[5] = v43[1];
          v34[0] = v40[0];
          v34[1] = v40[1];
          double v15 = (void *)[v32 initWithClientLocation:v34];
        }
        else
        {
          double v15 = 0;
        }
        goto LABEL_21;
      }
    }
  }

  v16 = 0;
LABEL_21:

  return v15;
}

+ (int)_inferLocationType:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type IN %@", &unk_1F3452AD8];
  double v5 = [v3 filteredArrayUsingPredicate:v4];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    int v7 = 1;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type IN %@", &unk_1F3452AF0];
    double v9 = [v3 filteredArrayUsingPredicate:v8];
    uint64_t v10 = [v9 count];

    if (v10) {
      int v7 = 4;
    }
    else {
      int v7 = 6;
    }
  }
  return v7;
}

- (id)smoothLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (v7 && [v7 count])
  {
    double v9 = [v8 objectForKey:@"kRTLocationSmootherPk_pre" defaultObject:&unk_1F34536B8];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = [v8 objectForKey:@"kRTLocationSmootherDeltaQk" defaultObject:&unk_1F34536C8];
    int v13 = [v12 BOOLValue];

    id v14 = [v8 objectForKey:@"kRTLocationSmootherDynamicQk" defaultObject:&unk_1F34536D8];
    int v15 = [v14 BOOLValue];

    v16 = [v8 objectForKey:@"kRTLocationSmootherAverageMovingSpeed" defaultObject:&unk_1F34536A8];
    [v16 doubleValue];
    double v18 = v17;

    double v19 = 10.0;
    if (v15)
    {
      double v20 = [v8 objectForKey:@"kRTLocationSmootherQkCoefficient" defaultObject:&unk_1F34536E8];
      [v20 doubleValue];
      double v22 = v21;

      if (v18 * v22 * (v18 * v22) >= 10.0) {
        double v19 = v18 * v22 * (v18 * v22);
      }
      else {
        double v19 = 10.0;
      }
      double v23 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v121 = [v8 description];
        *(_DWORD *)buf = 134218498;
        *(double *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v121;
        _os_log_debug_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, speed, %.2f, qkFromSpeed, %.2f, parameters, %@", buf, 0x20u);
      }
    }
    double v24 = [NSNumber numberWithDouble:v19];
    double v25 = [v8 objectForKey:@"kRTLocationSmootherQk" defaultObject:v24];
    [v25 doubleValue];
    double v148 = v26;

    double v27 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v148;
      _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, q, %.2f", buf, 0xCu);
    }

    double v154 = 0.0;
    double v155 = 0.0;
    uint64_t v153 = 0;
    double v135 = a4;
    if ([v7 count])
    {
      double v127 = v18;
      id v128 = v8;
      uint64_t v28 = 0;
      unsigned int v29 = 1;
      double v140 = -1.0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      double v147 = v11;
      double v145 = 0.0;
      double v146 = 0.0;
      double v32 = v11;
      double v137 = 0.0;
      double v138 = 0.0;
      double v139 = -1.0;
      double v141 = 0.0;
      double v142 = 0.0;
      double v129 = 0.0;
      char v33 = 1;
      double v144 = sqrt(v148);
      double v136 = v11;
      while (1)
      {
        id v34 = [v7 objectAtIndexedSubscript:v28];
        v35 = v34;
        if (v29 == 1) {
          int v36 = 0;
        }
        else {
          int v36 = v13;
        }
        double v37 = v148;
        if (v36 == 1)
        {
          long long v38 = [v34 timestamp];
          long long v39 = [v7 objectAtIndexedSubscript:v29 - 2];
          long long v40 = [v39 timestamp];
          [v38 timeIntervalSinceDate:v40];
          double v42 = v41;

          if (v144 * v42 * (v144 * v42) >= 10.0) {
            double v37 = v144 * v42 * (v144 * v42);
          }
          else {
            double v37 = 10.0;
          }
        }
        long long v43 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v71 = NSString;
          [v35 coordinate];
          uint64_t v133 = v72;
          [v35 coordinate];
          uint64_t v74 = v73;
          [v35 horizontalAccuracy];
          uint64_t v76 = v75;
          [v35 speed];
          uint64_t v78 = v77;
          [v35 course];
          uint64_t v79 = v31;
          uint64_t v80 = v30;
          uint64_t v82 = v81;
          double v83 = [v35 timestamp];
          __int16 v84 = [v83 stringFromDate];
          uint64_t v123 = v82;
          uint64_t v30 = v80;
          uint64_t v31 = v79;
          uint64_t v122 = v76;
          a4 = v135;
          v85 = [v71 stringWithFormat:@"<%+.8f,%+.8f> +/- %.2fm (speed %.2f mps / course %.2f) @ %@,type %u", v133, v74, v122, v78, v123, v84, [v35 type]];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v85;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v37;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v29;
          _os_log_debug_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, Locations in vehicle estimator buffer, %@, qk, %.2f, number, %u", buf, 0x1Cu);
        }
        [v35 horizontalAccuracy];
        if (v44 <= 0.0)
        {
          double v56 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, horizontalAccuracy is not valid", buf, 2u);
          }
        }
        else
        {
          if (v29 == 1)
          {
            [v35 coordinate];
            uint64_t v31 = v45;
            [v35 coordinate];
            [(RTLocationSmoother *)self getRefAlt:v35];
            uint64_t v30 = v46;
          }
          [v35 coordinate];
          [v35 coordinate];
          RTCommonConvertGeodeticToLocalFrame();
          [v35 horizontalAccuracy];
          double v48 = v47;
          [v35 horizontalAccuracy];
          double v50 = v48 * v49 * 0.5;
          if (v29 == 1)
          {
            double v145 = v155;
            double v146 = v154;
            double v32 = v136 + v50;
            double v147 = v136 + v50;
          }
          else
          {
            v51 = [v35 timestamp];
            [v51 timeIntervalSinceReferenceDate];
            double v53 = v52;

            if (v53 < a4)
            {
              if (v147 + v50 == 0.0)
              {
                v119 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                {
LABEL_70:
                  id v8 = v128;

                  v101 = 0;
                  goto LABEL_63;
                }
                *(_WORD *)buf = 0;
                v120 = "fFilterPk_pre[0] + kFilterRk == 0.0\n";
LABEL_72:
                _os_log_error_impl(&dword_1D9BFA000, v119, OS_LOG_TYPE_ERROR, v120, buf, 2u);
                goto LABEL_70;
              }
              if (v32 + v50 == 0.0)
              {
                v119 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_70;
                }
                *(_WORD *)buf = 0;
                v120 = "fFilterPk_pre[1] + kFilterRk == 0.0\n";
                goto LABEL_72;
              }
              double v54 = v147 / (v147 + v50);
              double v55 = v32 / (v32 + v50);
              double v145 = v145 + v55 * (v155 - v145);
              double v146 = v146 + v54 * (v154 - v146);
              double v147 = v37 + v147 - v54 * v147;
              double v32 = v37 + v32 - v55 * v32;
              double v56 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                __int16 v86 = NSString;
                [v35 coordinate];
                uint64_t v134 = v87;
                [v35 coordinate];
                uint64_t v131 = v88;
                [v35 horizontalAccuracy];
                uint64_t v90 = v89;
                v91 = [v35 timestamp];
                v92 = [v91 stringFromDate];
                v93 = [v86 stringWithFormat:@"<%+.8f,%+.8f> +/- %.2f @ %@", v134, v131, v90, v92];
                *(_DWORD *)buf = 138415362;
                *(void *)&uint8_t buf[4] = v93;
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = v154;
                *(_WORD *)&buf[22] = 2048;
                *(double *)&buf[24] = v155;
                LOWORD(v157[0]) = 2048;
                *(double *)((char *)v157 + 2) = v37;
                WORD5(v157[0]) = 2048;
                *(double *)((char *)v157 + 12) = v146;
                WORD2(v157[1]) = 2048;
                *(double *)((char *)&v157[1] + 6) = v145;
                HIWORD(v157[1]) = 2048;
                *(double *)v158 = v147;
                WORD4(v158[0]) = 2048;
                *(double *)((char *)v158 + 10) = v32;
                WORD1(v158[1]) = 2048;
                *(double *)((char *)&v158[1] + 4) = v154;
                WORD6(v158[1]) = 2048;
                *(double *)((char *)&v158[1] + 14) = v155;
                WORD3(v158[2]) = 2048;
                *((double *)&v158[2] + 1) = v154 - v146;
                *(_WORD *)v159 = 2048;
                *(double *)&v159[2] = v155 - v145;
                *(_WORD *)&v159[10] = 1024;
                *(_DWORD *)&v159[12] = v29;
                _os_log_debug_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_DEBUG, "RTLocationSmoother (forward), %@, (E,N) (%.4f, %.4f), qk, %.2f, Xk (%.2f, %.2f), Pkpre, (%.2f, %.2f), Zk, (%.2f, %.2f), Zk-Xk, (%.2f, %.2f), number, %u,  ", buf, 0x80u);
              }
              goto LABEL_35;
            }
          }
          v57 = [v35 timestamp];
          [v57 timeIntervalSinceReferenceDate];
          double v59 = v58;

          if (v59 < a4) {
            goto LABEL_45;
          }
          if (v33)
          {
            int v60 = [v35 timestamp];
            [v60 timeIntervalSinceReferenceDate];
            double v129 = v61;

            double v141 = v146;
            double v142 = v145;
            double v139 = v147;
            double v140 = v32;
            double v137 = v32;
            double v138 = v147;
          }
          if (v29 == 1)
          {
            char v33 = 0;
            goto LABEL_45;
          }
          uint64_t v130 = v31;
          uint64_t v132 = v30;
          double v62 = v50 + v32;
          double v63 = v147 / (v50 + v147);
          double v64 = v138 / (v50 + v147);
          double v65 = v137 / v62;
          double v66 = v154 - v146;
          double v67 = v155 - v145;
          double v141 = v141 + v64 * (v154 - v146);
          double v142 = v142 + v137 / v62 * (v155 - v145);
          double v68 = v32 / v62;
          double v145 = v145 + v32 / v62 * (v155 - v145);
          double v146 = v146 + v63 * (v154 - v146);
          double v147 = v37 + v147 * (1.0 - v63);
          double v69 = 1.0 - v32 / v62;
          double v32 = v37 + v32 * v69;
          double v139 = v139 - v138 * v64;
          double v140 = v140 - v137 * v65;
          double v137 = v69 * v137;
          double v138 = (1.0 - v63) * v138;
          double v56 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v94 = NSString;
            [v35 coordinate];
            uint64_t v126 = v95;
            [v35 coordinate];
            uint64_t v125 = v96;
            [v35 horizontalAccuracy];
            uint64_t v124 = v97;
            v98 = [v35 timestamp];
            v99 = [v98 stringFromDate];
            v100 = [v94 stringWithFormat:@"<%+.8f,%+.8f> +/- %.2f @ %@", v126, v125, v124, v99];
            *(_DWORD *)buf = 138417410;
            *(void *)&uint8_t buf[4] = v100;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v154;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&buf[24] = v155;
            LOWORD(v157[0]) = 2048;
            *(double *)((char *)v157 + 2) = v37;
            WORD5(v157[0]) = 2048;
            *(double *)((char *)v157 + 12) = v141;
            WORD2(v157[1]) = 2048;
            *(double *)((char *)&v157[1] + 6) = v142;
            HIWORD(v157[1]) = 2048;
            *(double *)v158 = v147;
            WORD4(v158[0]) = 2048;
            *(double *)((char *)v158 + 10) = v32;
            WORD1(v158[1]) = 2048;
            *(double *)((char *)&v158[1] + 4) = v63;
            WORD6(v158[1]) = 2048;
            *(double *)((char *)&v158[1] + 14) = v68;
            WORD3(v158[2]) = 2048;
            *((double *)&v158[2] + 1) = v154;
            *(_WORD *)v159 = 2048;
            *(double *)&v159[2] = v155;
            *(_WORD *)&v159[10] = 2048;
            *(double *)&v159[12] = v154 - v146;
            *(_WORD *)&v159[20] = 2048;
            *(double *)&v159[22] = v155 - v145;
            *(_WORD *)&v159[30] = 2048;
            *(double *)&v159[32] = v64;
            *(_WORD *)&v159[40] = 2048;
            *(double *)&v159[42] = v65;
            __int16 v160 = 2048;
            double v161 = v66;
            __int16 v162 = 2048;
            double v163 = v67;
            __int16 v164 = 2048;
            double v165 = v138;
            __int16 v166 = 2048;
            double v167 = v137;
            __int16 v168 = 1024;
            unsigned int v169 = v29;
            _os_log_debug_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_DEBUG, "RTLocationSmoother (backward), %@, (E,N) (%.4f, %.4f), qk, %.2f, Xjj (%.2f, %.2f), Pkpre, (%.2f, %.2f), Lk, (%.2f, %.2f), Zk, (%.2f, %.2f), Zk-Xk, (%.2f, %.2f), lambda, (%.2f, %.2f), innovation, (%.2f, %.2f), sigma, (%2.f, %.2f), number, %u,  ", buf, 0xD0u);
          }
          char v33 = 0;
          uint64_t v30 = v132;
          a4 = v135;
          uint64_t v31 = v130;
        }
LABEL_35:

LABEL_45:
        uint64_t v28 = v29;
        if ([v7 count] <= (unint64_t)v29++)
        {
          if (v33)
          {
            id v8 = v128;
            double v102 = v127;
            double v103 = v147;
            goto LABEL_51;
          }
          double v108 = v139 + v140;
          id v8 = v128;
          double v109 = v127;
          double v107 = v129;
          goto LABEL_53;
        }
      }
    }
    double v102 = v18;
    double v32 = v11;
    double v103 = v11;
LABEL_51:
    v104 = [v7 lastObject];
    v105 = [v104 timestamp];
    [v105 timeIntervalSinceReferenceDate];
    double v107 = v106;

    double v108 = v32 + v103;
    double v109 = v102;
    a4 = v135;
LABEL_53:
    double v110 = sqrt(v108);
    v35 = [v7 valueForKeyPath:@"@min.horizontalAccuracy"];
    [v35 doubleValue];
    if (v110 < v111)
    {
      [v35 doubleValue];
      double v110 = v112;
    }
    uint64_t v151 = 0;
    uint64_t v152 = 0;
    RTCommonConvertLocalFrameToGeodetic();
    double v113 = v110 + v109 * vabdd_f64(a4, v107);
    v114 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v113 - v110;
      _os_log_debug_impl(&dword_1D9BFA000, v114, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, additional uncertainty, %f", buf, 0xCu);
    }

    memset(v159, 0, 44);
    memset(v158, 0, sizeof(v158));
    memset(v157, 0, sizeof(v157));
    memset(buf, 0, sizeof(buf));
    v115 = objc_opt_new();
    v116 = v115;
    if (v115)
    {
      [v115 clientLocation];
    }
    else
    {
      memset(v159, 0, 44);
      memset(v158, 0, sizeof(v158));
      memset(v157, 0, sizeof(v157));
      memset(buf, 0, sizeof(buf));
    }

    *(double *)((char *)v158 + 12) = a4;
    v101 = 0;
    LODWORD(v158[2]) = +[RTLocationSmoother _inferLocationType:v7];
    *(double *)&buf[20] = v113;
    *(void *)&uint8_t buf[4] = v152;
    *(void *)&buf[12] = v151;
    if (v113 > 0.0 && v110 > 0.0)
    {
      id v117 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      v149[6] = v158[2];
      v149[7] = *(_OWORD *)v159;
      v150[0] = *(_OWORD *)&v159[16];
      *(_OWORD *)((char *)v150 + 12) = *(_OWORD *)&v159[28];
      v149[2] = v157[0];
      v149[3] = v157[1];
      v149[4] = v158[0];
      v149[5] = v158[1];
      v149[0] = *(_OWORD *)buf;
      v149[1] = *(_OWORD *)&buf[16];
      v101 = (void *)[v117 initWithClientLocation:v149];
    }
LABEL_63:
  }
  else
  {
    v101 = 0;
  }

  return v101;
}

- (id)estimateLocationFromFallbackModelWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  double v9 = [v8 objectForKey:@"kRTLocationSmootherAverageMovingSpeed" defaultObject:&unk_1F34536A8];
  [v9 doubleValue];
  double v11 = v10;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v7;
  int v13 = (void *)[v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v13)
  {
    id v14 = v12;
    goto LABEL_15;
  }
  id v14 = 0;
  uint64_t v15 = *(void *)v37;
  double v16 = 1.79769313e308;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(v12);
      }
      double v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      double v19 = [v18 timestamp];
      [v19 timeIntervalSinceReferenceDate];
      double v21 = v20 - a4;

      if (v21 < 0.0) {
        double v21 = -v21;
      }
      if (v16 > v21)
      {
        id v22 = v18;

        id v14 = v22;
        double v16 = v21;
      }
    }
    int v13 = (void *)[v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v13);

  if (v14)
  {
    long long v34 = 0u;
    memset(v35, 0, 28);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    [v14 clientLocation];
    *(double *)((char *)&v28 + 4) = *(double *)((char *)&v28 + 4) + v11 * v16;
    id v23 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    v25[6] = v33;
    v25[7] = v34;
    v26[0] = v35[0];
    *(_OWORD *)((char *)v26 + 12) = *(_OWORD *)((char *)v35 + 12);
    v25[2] = v29;
    v25[3] = v30;
    v25[4] = v31;
    v25[5] = v32;
    v25[0] = v27;
    v25[1] = v28;
    int v13 = (void *)[v23 initWithClientLocation:v25];
LABEL_15:

    goto LABEL_17;
  }
  int v13 = 0;
LABEL_17:

  return v13;
}

- (id)estimateVehicleLocationWithLocations:(id)a3 parkingTimestamp:(double)a4
{
  v24[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 dictionary];
  v23[0] = @"kRTLocationSmootherQk";
  v23[1] = @"kRTLocationSmootherPk_pre";
  v24[0] = &unk_1F3453E78;
  v24[1] = &unk_1F3453E88;
  _OWORD v23[2] = @"kRTLocationSmootherAverageMovingSpeed";
  v23[3] = @"kRTLocationSmootherPreciseLocationOnlyMode";
  v24[2] = &unk_1F3453E98;
  v24[3] = MEMORY[0x1E4F1CC38];
  v23[4] = @"kRTLocationSmootherInterpolateTime";
  v24[4] = MEMORY[0x1E4F1CC28];
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__RTLocationSmoother_VehicleLocationEstimator__estimateVehicleLocationWithLocations_parkingTimestamp___block_invoke;
  v20[3] = &__block_descriptor_40_e37_B24__0__CLLocation_8__NSDictionary_16l;
  *(double *)&v20[4] = a4;
  double v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:v20];
  double v11 = [v7 filteredArrayUsingPredicate:v10];

  id v12 = [(RTLocationSmoother *)self estimateLocationWithLocations:v11 timestamp:v9 parameters:v8 meta:a4];
  int v13 = [v8 objectForKeyedSubscript:@"kRTLocationSmootherSpeedEstimationAfterDate"];

  if (v13
    && ([v8 objectForKeyedSubscript:@"kRTLocationSmootherSpeedEstimationAfterDate"],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 doubleValue],
        double v16 = v15,
        v14,
        v16 > 9.0))
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134283521;
      double v22 = v16;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "invalidating parked event due to large average speed of %{private}f m/s", buf, 0xCu);
    }

    id v17 = 0;
  }
  else
  {
    id v17 = v12;
  }

  return v17;
}

BOOL __102__RTLocationSmoother_VehicleLocationEstimator__estimateVehicleLocationWithLocations_parkingTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(a1 + 32);
  double v5 = [v3 timestamp];
  [v5 timeIntervalSinceReferenceDate];
  if (v4 - v6 > 10.0)
  {
    BOOL v9 = 0;
  }
  else
  {
    id v7 = [v3 timestamp];
    [v7 timeIntervalSinceReferenceDate];
    BOOL v9 = v8 - *(double *)(a1 + 32) <= 16.0;
  }
  return v9;
}

@end