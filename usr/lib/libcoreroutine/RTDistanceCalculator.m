@interface RTDistanceCalculator
+ (id)distanceMetricToString:(int64_t)a3;
- (BOOL)checkConsistencyBetweenLocation:(id)a3 otherLocation:(id)a4 error:(id *)a5;
- (BOOL)checkFractionAreaOverlapBetweenLocation:(id)a3 otherLocation:(id)a4 largerThanThreshold:(double)a5 error:(id *)a6;
- (CGRect)cgrectFromCoordinates:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5;
- (CLLocationCoordinate2D)_reduce_by_half:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 outputCount:(unint64_t *)a5 error:(id *)a6;
- (CLLocationCoordinate2D)computeCentroid:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5;
- (CLLocationCoordinate2D)rectVerticesFromCoordinates:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 ignoreNFirstAndLastLocations:(unint64_t)a5 error:(id *)a6;
- (RTLocationShifter)locationShifter;
- (double)_centroidDistanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 error:(id *)a7;
- (double)_computeAreaFromRect:(CGRect)a3;
- (double)_dtwDistanceEuclideanBetweenX:(CLLocationCoordinate2D *)a3 y:(CLLocationCoordinate2D *)a4 error:(id *)a5;
- (double)_dtwDistanceFirstNormBetweenX:(CLLocationCoordinate2D *)a3 y:(CLLocationCoordinate2D *)a4 error:(id *)a5;
- (double)_dtwDistanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 distanceMetric:(int64_t)a7 threshold:(double)a8 error:(id *)a9;
- (double)computeBoundingBoxArea:(CGRect)a3 locationsCount:(unint64_t)a4 error:(id *)a5;
- (double)computeCircleIntersectionAreaWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5;
- (double)computeCircleIntersectionPercentageOfMinRadiusCircleWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5;
- (double)computeIntersectionOverUnionUsingBoundingBoxBetweenLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 otherLocations:(CLLocationCoordinate2D *)a5 otherLocationsCount:(unint64_t)a6 error:(id *)a7;
- (double)distanceFromLocation:(id)a3 toLocation:(id)a4 error:(id *)a5;
- (double)distanceFromLocationCoordinate:(CLLocationCoordinate2D *)a3 toLocationCoordinate:(CLLocationCoordinate2D *)a4 error:(id *)a5;
- (double)distanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 distanceMetric:(int64_t)a7 threshold:(double)a8 error:(id *)a9;
- (double)fractionOfUncertaintyAreaOverlapOfTheSmalestUncertaintyAreaBetweenLocation:(id)a3 otherLocation:(id)a4 error:(id *)a5;
- (id)_convertToRTPairsFromLocations:(id)a3 error:(id *)a4;
- (id)_dtwForX:(CLLocationCoordinate2D *)a3 xCount:(unint64_t)a4 y:(CLLocationCoordinate2D *)a5 yCount:(unint64_t)a6 window:(id)a7 distanceMetric:(int64_t)a8 threshold:(double)a9 error:(id *)a10;
- (id)_expand_windowWithPath:(id)a3 len_x:(signed __int16)a4 len_y:(signed __int16)a5 radius:(signed __int16)a6 error:(id *)a7;
- (id)_fastDTWForX:(CLLocationCoordinate2D *)a3 xCount:(unint64_t)a4 y:(CLLocationCoordinate2D *)a5 yCount:(unint64_t)a6 radius:(double)a7 distanceMetric:(int64_t)a8 threshold:(double)a9 error:(id *)a10;
- (void)_shutdownWithHandler:(id)a3;
- (void)setLocationShifter:(id)a3;
@end

@implementation RTDistanceCalculator

void __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) locationShifter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke_2;
  v7[3] = &unk_1E6B95FE0;
  uint64_t v9 = *(void *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v6;
  long long v8 = v6;
  [v2 distanceFromLocation:v3 locationShifter:v4 handler:v7];
}

- (RTLocationShifter)locationShifter
{
  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    v4 = (RTLocationShifter *)objc_opt_new();
    id v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }

  return locationShifter;
}

- (void).cxx_destruct
{
}

void __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (double)distanceFromLocation:(id)a3 toLocation:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  uint64_t v49 = 0;
  v50 = (double *)&v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0x7FEFFFFFFFFFFFFFLL;
  double v11 = 1.79769313e308;
  if (v8 && v9)
  {
    v35 = a5;
    uint64_t v43 = 0;
    v44 = (id *)&v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__65;
    v47 = __Block_byref_object_dispose__65;
    id v48 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v13 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke;
    block[3] = &unk_1E6B96008;
    id v37 = v10;
    id v38 = v8;
    v39 = self;
    v41 = &v43;
    v42 = &v49;
    v14 = v12;
    v40 = v14;
    dispatch_async(v13, block);

    v15 = v14;
    v16 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v17)) {
      goto LABEL_8;
    }
    v18 = [MEMORY[0x1E4F1C9C8] now];
    [v18 timeIntervalSinceDate:v16];
    double v20 = v19;
    v21 = objc_opt_new();
    v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_49];
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
    uint64_t v53 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v53 count:1];
    v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

    if (v29)
    {
      id v30 = v29;

      char v31 = 0;
    }
    else
    {
LABEL_8:
      id v30 = 0;
      char v31 = 1;
    }

    id v32 = v30;
    if ((v31 & 1) == 0) {
      objc_storeStrong(v44 + 5, v30);
    }
    if (v35)
    {
      id v33 = v44[5];
      if (v33) {
        id *v35 = v33;
      }
    }
    double v11 = v50[3];

    _Block_object_dispose(&v43, 8);
  }
  _Block_object_dispose(&v49, 8);

  return v11;
}

+ (id)distanceMetricToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Centroid";
  }
  else {
    return off_1E6B96028[a3];
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (double)distanceFromLocationCoordinate:(CLLocationCoordinate2D *)a3 toLocationCoordinate:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  if (!a3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      return 1.79769313e308;
    }
    __int16 v10 = 0;
    v7 = "Invalid parameter not satisfying: fromLocationCoordinate";
    id v8 = (uint8_t *)&v10;
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    goto LABEL_9;
  }
  if (!a4)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    __int16 v9 = 0;
    v7 = "Invalid parameter not satisfying: toLocationCoordinate";
    id v8 = (uint8_t *)&v9;
    goto LABEL_11;
  }

  RTCommonCalculateDistanceHighPrecision();
  return result;
}

- (double)fractionOfUncertaintyAreaOverlapOfTheSmalestUncertaintyAreaBetweenLocation:(id)a3 otherLocation:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = v9;
  if (!v8)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    double v15 = 0.0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v25 = 0;
    v16 = "Invalid parameter not satisfying: location";
    dispatch_time_t v17 = (uint8_t *)&v25;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    double v15 = 0.0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: otherLocation";
    dispatch_time_t v17 = buf;
    goto LABEL_10;
  }
  id v23 = 0;
  [(RTDistanceCalculator *)self distanceFromLocation:v8 toLocation:v9 error:&v23];
  double v12 = v11;
  v13 = v23;
  v14 = v13;
  if (v13)
  {
    double v15 = 0.0;
    if (a5)
    {
      v14 = v13;
      *a5 = v14;
    }
  }
  else
  {
    [v8 horizontalUncertainty];
    double v19 = v18;
    [v10 horizontalUncertainty];
    [(RTDistanceCalculator *)self computeCircleIntersectionPercentageOfMinRadiusCircleWithDistance:v12 firstRadius:v19 secondRadius:v20];
    double v15 = v21;
  }
LABEL_12:

  return v15;
}

- (BOOL)checkFractionAreaOverlapBetweenLocation:(id)a3 otherLocation:(id)a4 largerThanThreshold:(double)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v19 = 0;
  [(RTDistanceCalculator *)self fractionOfUncertaintyAreaOverlapOfTheSmalestUncertaintyAreaBetweenLocation:v10 otherLocation:v11 error:&v19];
  double v13 = v12;
  id v14 = v19;
  double v15 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    [(RTDistanceCalculator *)self distanceFromLocation:v10 toLocation:v11 error:0];
    *(_DWORD *)buf = 138413314;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2048;
    uint64_t v25 = v18;
    __int16 v26 = 2048;
    double v27 = v13;
    __int16 v28 = 2048;
    double v29 = a5;
    _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "check uncertainty overlap for reference location, %@, other location, %@, distance between locations, %f, overlap percentage, %f, overlap treshold, %f", buf, 0x34u);
  }

  if (v14)
  {
    BOOL v16 = 0;
    if (a6) {
      *a6 = v14;
    }
  }
  else
  {
    BOOL v16 = v13 > a5;
  }

  return v16;
}

- (BOOL)checkConsistencyBetweenLocation:(id)a3 otherLocation:(id)a4 error:(id *)a5
{
  return [(RTDistanceCalculator *)self checkFractionAreaOverlapBetweenLocation:a3 otherLocation:a4 largerThanThreshold:a5 error:0.1];
}

- (double)computeCircleIntersectionAreaWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5
{
  double v5 = a4;
  double result = 0.0;
  if (a4 + a5 > a3)
  {
    if (a4 >= a5) {
      a4 = a5;
    }
    if (a4 != 0.0)
    {
      if (v5 >= a5) {
        double v9 = v5;
      }
      else {
        double v9 = a5;
      }
      if (a4 + a3 <= v9)
      {
        return a4 * (a4 * 3.14159265);
      }
      else
      {
        long double v10 = v5 * v5 * acos((a3 * a3 + v5 * v5 - a5 * a5) / (a3 + a3) / v5);
        return v10
             + a5 * a5 * acos((a3 * a3 - v5 * v5 + a5 * a5) / (a3 + a3) / a5)
             + sqrt((a3 + v5 + a5) * ((a3 + v5 - a5) * ((v5 - a3 + a5) * (a3 - v5 + a5)))) * -0.5;
      }
    }
  }
  return result;
}

- (double)computeCircleIntersectionPercentageOfMinRadiusCircleWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5
{
  if (a4 >= a5) {
    double v5 = a5;
  }
  else {
    double v5 = a4;
  }
  if (v5 == 0.0)
  {
    if (a4 < a5) {
      a4 = a5;
    }
    BOOL v6 = a4 < a3;
    double result = 1.0;
    if (v6) {
      return 0.0;
    }
  }
  else
  {
    -[RTDistanceCalculator computeCircleIntersectionAreaWithDistance:firstRadius:secondRadius:](self, "computeCircleIntersectionAreaWithDistance:firstRadius:secondRadius:", a3);
    return v8 / (v5 * (v5 * 3.14159265));
  }
  return result;
}

- (double)distanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 distanceMetric:(int64_t)a7 threshold:(double)a8 error:(id *)a9
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v21 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromLocations", v21, 2u);
    }

    if (!a9) {
      return 1.79769313e308;
    }
    double v12 = @"fromLocations";
LABEL_17:
    _RTErrorInvalidParameterCreate((uint64_t)v12);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    return 1.79769313e308;
  }
  if (!a5)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v21 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toLocations", v21, 2u);
    }

    if (!a9) {
      return 1.79769313e308;
    }
    double v12 = @"toLocations";
    goto LABEL_17;
  }
  if (!a4 || !a6)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"locations count is zero";
    BOOL v16 = (void *)MEMORY[0x1E4F1C9E8];
    dispatch_time_t v17 = (__CFString **)v25;
    uint64_t v18 = &v24;
LABEL_19:
    id v19 = [v16 dictionaryWithObjects:v17, v18, 1, a6, a7, a8];
    double v20 = [v14 errorWithDomain:v15 code:7 userInfo:v19];

    if (a9) {
      *a9 = v20;
    }

    return 1.79769313e308;
  }
  if (a7 == 1)
  {
    -[RTDistanceCalculator _centroidDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:error:](self, "_centroidDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:error:", a8);
    return result;
  }
  if ((a7 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v23 = @"invalid distance metric";
    BOOL v16 = (void *)MEMORY[0x1E4F1C9E8];
    dispatch_time_t v17 = &v23;
    uint64_t v18 = &v22;
    goto LABEL_19;
  }

  -[RTDistanceCalculator _dtwDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:distanceMetric:threshold:error:](self, "_dtwDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:distanceMetric:threshold:error:", a8);
  return result;
}

- (double)_dtwDistanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 distanceMetric:(int64_t)a7 threshold:(double)a8 error:(id *)a9
{
  v61[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromLocations", buf, 2u);
    }

    if (!a9) {
      return 1.79769313e308;
    }
    double v27 = @"fromLocations";
    goto LABEL_21;
  }
  if (!a5)
  {
    __int16 v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toLocations", buf, 2u);
    }

    if (!a9) {
      return 1.79769313e308;
    }
    double v27 = @"toLocations";
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v27);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    return 1.79769313e308;
  }
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
  if (a4 && a6)
  {
    id v19 = (void *)MEMORY[0x1E016D870]();
    id v43 = 0;
    double v20 = [(RTDistanceCalculator *)self _fastDTWForX:a3 xCount:a4 y:a5 yCount:a6 radius:a7 distanceMetric:&v43 threshold:1.0 error:a8];
    id v21 = v43;
    double v22 = 1.79769313e308;
    if (!v21 && v20)
    {
      [v20 distance];
      double v22 = v23;

      double v20 = 0;
    }

    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    uint64_t v25 = v24;
    if (a9 && v21)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        v41 = NSStringFromClass(v40);
        v42 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v45 = v41;
        __int16 v46 = 2112;
        v47 = v42;
        __int16 v48 = 2112;
        unint64_t v49 = (unint64_t)v21;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v21 = v21;
      *a9 = v21;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v32 = (objc_class *)objc_opt_class();
        id v33 = NSStringFromClass(v32);
        v34 = NSStringFromSelector(a2);
        v35 = [MEMORY[0x1E4F1C9C8] date];
        [v35 timeIntervalSinceDate:v18];
        uint64_t v37 = v36;
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138414082;
        uint64_t v45 = v33;
        __int16 v46 = 2112;
        v47 = v34;
        __int16 v48 = 2048;
        unint64_t v49 = a4;
        __int16 v50 = 2048;
        unint64_t v51 = a6;
        __int16 v52 = 2048;
        double v53 = a8;
        __int16 v54 = 2048;
        double v55 = v22;
        __int16 v56 = 2048;
        uint64_t v57 = v37;
        __int16 v58 = 2048;
        uint64_t v59 = v38;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, fromLocations count, %lu, toLocations count, %lu, dtw threshold, %.5f, dtw distance, %.5f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);
      }
    }
  }
  else
  {
    double v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F5CFE8];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    v61[0] = @"locations count is zero";
    char v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    id v21 = [v29 errorWithDomain:v30 code:7 userInfo:v31];

    if (a9)
    {
      id v21 = v21;
      *a9 = v21;
    }
    double v22 = 1.79769313e308;
  }

  return v22;
}

- (id)_convertToRTPairsFromLocations:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v21 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v12 = (void *)MEMORY[0x1E016D870]();
          id v13 = objc_alloc(MEMORY[0x1E4F5CE58]);
          id v14 = NSNumber;
          [v11 latitude];
          uint64_t v15 = [v14 numberWithDouble:];
          BOOL v16 = NSNumber;
          [v11 longitude];
          dispatch_time_t v17 = [v16 numberWithDouble:x0];
          uint64_t v18 = (void *)[v13 initWithFirstObject:v15 secondObject:v17];

          [v6 addObject:v18];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }

    id v5 = v21;
  }
  else
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"locations");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v6 = [MEMORY[0x1E4F1C978] array];
  }

  return v6;
}

- (id)_fastDTWForX:(CLLocationCoordinate2D *)a3 xCount:(unint64_t)a4 y:(CLLocationCoordinate2D *)a5 yCount:(unint64_t)a6 radius:(double)a7 distanceMetric:(int64_t)a8 threshold:(double)a9 error:(id *)a10
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
    }

    if (a10)
    {
      uint64_t v30 = @"x";
LABEL_19:
      _RTErrorInvalidParameterCreate((uint64_t)v30);
      id v32 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    }
LABEL_20:
    id v32 = 0;
    goto LABEL_50;
  }
  if (!a5)
  {
    char v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", buf, 2u);
    }

    if (a10)
    {
      uint64_t v30 = @"y";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  double v20 = a7 + 2.0;
  if (v20 > (double)a4 || v20 > (double)a6)
  {
    double v22 = [MEMORY[0x1E4F1C978] array];
    id v55 = 0;
    id v23 = [(RTDistanceCalculator *)self _dtwForX:a3 xCount:a4 y:a5 yCount:a6 window:v22 distanceMetric:a8 threshold:a9 error:&v55];
    id v24 = v55;

    if (a10 && v24)
    {
      long long v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        long long v26 = (objc_class *)objc_opt_class();
        double v27 = NSStringFromClass(v26);
        __int16 v28 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v57 = 2112;
        __int16 v58 = v28;
        __int16 v59 = 2112;
        id v60 = v24;
LABEL_37:
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        goto LABEL_27;
      }
      goto LABEL_27;
    }
LABEL_48:
    id v23 = v23;
    id v32 = v23;
    goto LABEL_49;
  }
  id v33 = (void *)MEMORY[0x1E016D870]();
  *(void *)buf = 0;
  id v54 = 0;
  v34 = [(RTDistanceCalculator *)self _reduce_by_half:a3 count:a4 outputCount:buf error:&v54];
  id v35 = v54;
  if (v35
    || (__int16 v46 = v34,
        id v52 = 0,
        uint64_t v53 = 0,
        uint64_t v36 = [(RTDistanceCalculator *)self _reduce_by_half:a5 count:a6 outputCount:&v53 error:&v52], (v35 = v52) != 0))
  {
    id v24 = v35;
    id v23 = 0;
LABEL_24:
    uint64_t v37 = a2;
    goto LABEL_25;
  }
  context = v33;
  id v51 = 0;
  id v32 = [(RTDistanceCalculator *)self _fastDTWForX:v46 xCount:*(void *)buf y:v36 yCount:v53 radius:a8 distanceMetric:&v51 threshold:a7 error:a9];
  id v38 = v51;
  if (v38)
  {
    id v24 = v38;

    id v23 = 0;
    id v33 = context;
    goto LABEL_24;
  }
  v39 = v36;
  [v32 distance];
  if (v40 > a9)
  {
    if (v46) {
      free(v46);
    }
    if (v36) {
      free(v36);
    }
    id v23 = 0;
    id v24 = 0;
    goto LABEL_49;
  }
  if (v46) {
    free(v46);
  }
  uint64_t v37 = a2;
  if (v39) {
    free(v39);
  }
  v44 = [v32 cellIndices];
  id v50 = 0;
  v47 = [(RTDistanceCalculator *)self _expand_windowWithPath:v44 len_x:(__int16)a4 len_y:(__int16)a6 radius:(int)a7 error:&v50];
  id v24 = v50;

  if (v24)
  {
    id v23 = 0;
    v42 = v47;
  }
  else
  {

    id v49 = 0;
    id v23 = [(RTDistanceCalculator *)self _dtwForX:a3 xCount:a4 y:a5 yCount:a6 window:v47 distanceMetric:a8 threshold:a9 error:&v49];
    id v24 = v49;
    v42 = v47;
    if (!v24)
    {

      goto LABEL_48;
    }
    id v32 = 0;
  }

  id v33 = context;
LABEL_25:
  if (!a10) {
    goto LABEL_48;
  }
  long long v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v41 = (objc_class *)objc_opt_class();
    double v27 = NSStringFromClass(v41);
    __int16 v28 = NSStringFromSelector(v37);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v27;
    __int16 v57 = 2112;
    __int16 v58 = v28;
    __int16 v59 = 2112;
    id v60 = v24;
    goto LABEL_37;
  }
LABEL_27:

  id v24 = v24;
  id v32 = 0;
  *a10 = v24;
LABEL_49:

LABEL_50:

  return v32;
}

- (id)_dtwForX:(CLLocationCoordinate2D *)a3 xCount:(unint64_t)a4 y:(CLLocationCoordinate2D *)a5 yCount:(unint64_t)a6 window:(id)a7 distanceMetric:(int64_t)a8 threshold:(double)a9 error:(id *)a10
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  id v15 = a7;
  BOOL v16 = v15;
  v144 = a3;
  if (!a3)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
    }

    if (!a10) {
      goto LABEL_87;
    }
    double v20 = @"x";
    goto LABEL_14;
  }
  if (!a5)
  {
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", buf, 2u);
    }

    if (!a10) {
      goto LABEL_87;
    }
    double v20 = @"y";
LABEL_14:
    _RTErrorInvalidParameterCreate((uint64_t)v20);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    id v23 = 0;
    *a10 = v22;
    goto LABEL_88;
  }
  if (!v15)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: window", buf, 2u);
    }

    if (a10)
    {
      _RTErrorInvalidParameterCreate(@"window");
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v16 = 0;
      goto LABEL_15;
    }
    BOOL v16 = 0;
LABEL_87:
    id v23 = 0;
    goto LABEL_88;
  }
  v143 = a5;
  int64_t v152 = a8;
  aSelector = a2;
  dispatch_time_t v17 = &off_1E6B8E000;
  if ([v15 count])
  {
    uint64_t v18 = v16;
  }
  else
  {
    long long v25 = (void *)MEMORY[0x1E016D870]();
    uint64_t v18 = objc_opt_new();
    if (a4)
    {
      __int16 v26 = 0;
      do
      {
        double v27 = (void *)MEMORY[0x1E016D870]();
        if (a6)
        {
          int v28 = 0;
          do
          {
            uint64_t v29 = (void *)MEMORY[0x1E016D870]();
            uint64_t v30 = [[RTCellIndex alloc] initWithX:v26 Y:(__int16)v28];
            [v18 addObject:v30];

            ++v28;
          }
          while (a6 > (__int16)v28);
        }
        ++v26;
      }
      while (a4 > v26);
    }
  }
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v31 = v18;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v167 objects:v182 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v168;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v168 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void **)(*((void *)&v167 + 1) + 8 * i);
        uint64_t v37 = (void *)MEMORY[0x1E016D870]();
        [v36 setX:((__int16)(v36.x + 1)));
        [v36 setY:((__int16)(objc_msgSend(v36, "y") + 1))];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v167 objects:v182 count:16];
    }
    while (v33);
  }

  uint64_t v142 = MEMORY[0x1E016D870]();
  id v38 = objc_opt_new();
  v39 = [RTCostMatrixCell alloc];
  double v40 = [[RTCellIndex alloc] initWithX:0 Y:0];
  v41 = [(RTCostMatrixCell *)v39 initWithDistance:v40 cellIndex:0.0];
  v42 = [[RTCellIndex alloc] initWithX:0 Y:0];
  v153 = v38;
  [v38 setObject:v41 forKeyedSubscript:v42];

  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id obj = v31;
  uint64_t v151 = [obj countByEnumeratingWithState:&v163 objects:v181 count:16];
  if (!v151)
  {
    v155 = 0;
    goto LABEL_76;
  }
  v155 = 0;
  uint64_t v150 = *(void *)v164;
  uint64_t v148 = *MEMORY[0x1E4F5CFE8];
  unint64_t v146 = a6;
  uint64_t v147 = *MEMORY[0x1E4F28568];
  while (2)
  {
    for (uint64_t j = 0; j != v151; ++j)
    {
      if (*(void *)v164 != v150) {
        objc_enumerationMutation(obj);
      }
      v44 = *(void **)(*((void *)&v163 + 1) + 8 * j);
      context = (void *)MEMORY[0x1E016D870]();
      uint64_t v45 = [v44 x];
      v156 = v44;
      uint64_t v46 = [v44 y];
      unint64_t v47 = (int)v45 - 1;
      uint64_t v48 = (__int16)v47;
      uint64_t v49 = [objc_alloc((Class)v17[284]) initWithX:v48 Y:v46];
      unint64_t v50 = (int)v46 - 1;
      uint64_t v51 = (__int16)v50;
      v159 = (void *)[objc_alloc((Class)v17[284]) initWithX:v45 Y:v51];
      v160 = (void *)[objc_alloc((Class)v17[284]) initWithX:v48 Y:v51];
      v158 = (void *)v49;
      if (v152 == 3)
      {
        uint64_t v53 = v153;
        if (v47 < a4 && v50 < a6)
        {
          v67 = &v144[v47];
          v64 = v155;
          v161 = v155;
          v65 = (id *)&v161;
          [(RTDistanceCalculator *)self _dtwDistanceEuclideanBetweenX:v67 y:&v143[v50] error:&v161];
          goto LABEL_54;
        }
        id v55 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v177 = v147;
        v178 = @"index out of bounds";
        __int16 v56 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v57 = &v178;
        __int16 v58 = &v177;
LABEL_53:
        id v60 = [v56 dictionaryWithObjects:v57 forKeys:v58 count:1];
        [v55 errorWithDomain:v148 code:7 userInfo:v60];
        int v61 = 0;
        v62 = v155;
        v155 = (RTCellIndex *)objc_claimAutoreleasedReturnValue();
        goto LABEL_70;
      }
      double v52 = 0.0;
      uint64_t v53 = v153;
      if (v152 == 2)
      {
        if ((int)v47 < a4 && (int)v50 < a6)
        {
          v63 = &v144[(int)v47];
          v64 = v155;
          v162 = v155;
          v65 = (id *)&v162;
          [(RTDistanceCalculator *)self _dtwDistanceFirstNormBetweenX:v63 y:&v143[(int)v50] error:&v162];
LABEL_54:
          double v52 = v66;
          v68 = (RTCellIndex *)*v65;

          v155 = v68;
          uint64_t v49 = (uint64_t)v158;
          goto LABEL_55;
        }
        id v55 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v179 = v147;
        v180 = @"index out of bounds";
        __int16 v56 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v57 = &v180;
        __int16 v58 = &v179;
        goto LABEL_53;
      }
LABEL_55:
      v69 = [v53 objectForKeyedSubscript:v49];

      if (!v69)
      {
        v70 = [RTCostMatrixCell alloc];
        v71 = [[RTCellIndex alloc] initWithX:0xFFFFFFFFLL Y:0xFFFFFFFFLL];
        v72 = [(RTCostMatrixCell *)v70 initWithDistance:v71 cellIndex:1.79769313e308];
        [v53 setObject:v72 forKeyedSubscript:v49];
      }
      v73 = v159;
      v74 = [v53 objectForKeyedSubscript:v159];

      if (!v74)
      {
        v75 = [RTCostMatrixCell alloc];
        v76 = [[RTCellIndex alloc] initWithX:0xFFFFFFFFLL Y:0xFFFFFFFFLL];
        v77 = [(RTCostMatrixCell *)v75 initWithDistance:v76 cellIndex:1.79769313e308];
        [v53 setObject:v77 forKeyedSubscript:v159];

        v73 = v159;
      }
      v78 = [v53 objectForKeyedSubscript:v160];

      if (!v78)
      {
        v79 = [RTCostMatrixCell alloc];
        v80 = [[RTCellIndex alloc] initWithX:0xFFFFFFFFLL Y:0xFFFFFFFFLL];
        v81 = [(RTCostMatrixCell *)v79 initWithDistance:v80 cellIndex:1.79769313e308];
        [v53 setObject:v81 forKeyedSubscript:v160];

        v73 = v159;
      }
      v82 = [v53 objectForKeyedSubscript:v49];
      [v82 distance];
      double v84 = v83;
      v85 = [v53 objectForKeyedSubscript:v73];
      [v85 distance];
      double v87 = v86;

      if (v84 >= v87)
      {
        v100 = [v53 objectForKeyedSubscript:v73];
        [v100 distance];
        double v102 = v101;
        v103 = [v53 objectForKeyedSubscript:v160];
        [v103 distance];
        double v105 = v104;

        v106 = [RTCostMatrixCell alloc];
        if (v102 >= v105)
        {
          id v60 = [v53 objectForKeyedSubscript:v160];
          [v60 distance];
          double v108 = v52 + v113;
          v109 = [RTCellIndex alloc];
          uint64_t v110 = v48;
        }
        else
        {
          id v60 = [v53 objectForKeyedSubscript:v73];
          [v60 distance];
          double v108 = v52 + v107;
          v109 = [RTCellIndex alloc];
          uint64_t v110 = v45;
        }
        v62 = [(RTCellIndex *)v109 initWithX:v110 Y:v51];
        v114 = [(RTCostMatrixCell *)v106 initWithDistance:v62 cellIndex:v108];
        [v53 setObject:v114 forKeyedSubscript:v156];

        int v61 = 1;
        a6 = v146;
      }
      else
      {
        v88 = [v53 objectForKeyedSubscript:v49];
        [v88 distance];
        double v90 = v89;
        v91 = [v53 objectForKeyedSubscript:v160];
        [v91 distance];
        double v93 = v92;

        v94 = [RTCostMatrixCell alloc];
        a6 = v146;
        if (v90 >= v93)
        {
          id v60 = [v53 objectForKeyedSubscript:v160];
          [v60 distance];
          double v96 = v52 + v111;
          v97 = [RTCellIndex alloc];
          uint64_t v98 = v48;
          uint64_t v99 = v51;
        }
        else
        {
          id v60 = [v53 objectForKeyedSubscript:v49];
          [v60 distance];
          double v96 = v52 + v95;
          v97 = [RTCellIndex alloc];
          uint64_t v98 = v48;
          uint64_t v99 = v46;
        }
        v62 = [(RTCellIndex *)v97 initWithX:v98 Y:v99];
        v112 = [(RTCostMatrixCell *)v94 initWithDistance:v62 cellIndex:v96];
        [v53 setObject:v112 forKeyedSubscript:v156];

        int v61 = 1;
      }
LABEL_70:

      if (!v61)
      {
        dispatch_time_t v17 = &off_1E6B8E000;
        goto LABEL_76;
      }
      dispatch_time_t v17 = &off_1E6B8E000;
    }
    uint64_t v151 = [obj countByEnumeratingWithState:&v163 objects:v181 count:16];
    if (v151) {
      continue;
    }
    break;
  }
LABEL_76:

  v115 = a10;
  if (a10 && v155)
  {
    v116 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v117 = v155;
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      v138 = (objc_class *)objc_opt_class();
      v139 = NSStringFromClass(v138);
      v140 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      v172 = v139;
      __int16 v173 = 2112;
      v174 = v140;
      v115 = a10;
      __int16 v175 = 2112;
      v176 = v155;
      _os_log_error_impl(&dword_1D9BFA000, v116, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v23 = 0;
    id *v115 = v155;
    v118 = (void *)v142;
    v119 = v153;
  }
  else
  {
    v120 = objc_opt_new();
    if ((unsigned __int16)a6 | (unsigned __int16)a4)
    {
      LOWORD(v121) = a6;
      LOWORD(v122) = a4;
      do
      {
        v123 = (void *)MEMORY[0x1E016D870]();
        v124 = (void *)[objc_alloc((Class)v17[284]) initWithX:(__int16)(v122 - 1) Y:(__int16)(v121 - 1)];
        [v120 addObject:v124];

        v125 = (void *)[objc_alloc((Class)v17[284]) initWithX:(__int16)v122 Y:(__int16)v121];
        v126 = [v153 objectForKeyedSubscript:v125];
        v127 = [v126 cellIndex];
        int v122 = [v127 x];

        v128 = [v153 objectForKeyedSubscript:v125];
        v129 = [v128 cellIndex];
        int v121 = [v129 y];
      }
      while (v121 | v122);
    }
    v130 = (void *)[objc_alloc((Class)v17[284]) initWithX:(__int16)a4 Y:(__int16)a6];
    v131 = [RTDTWResult alloc];
    v132 = [v153 objectForKeyedSubscript:v130];
    [v132 distance];
    double v134 = v133;
    v135 = [v120 reverseObjectEnumerator];
    v136 = [v135 allObjects];
    id v23 = [(RTDTWResult *)v131 initWithDistance:v136 cellIndices:v134];

    v119 = 0;
    v117 = v155;
    v118 = (void *)v142;
  }

  BOOL v16 = 0;
LABEL_88:

  return v23;
}

- (CLLocationCoordinate2D)_reduce_by_half:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 outputCount:(unint64_t *)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long double v10 = (char *)malloc_type_malloc(((8 * a4) & 0xFFFFFFFFFFFFFFF0) + 16, 0x1000040451B5BE8uLL);
    id v11 = v10;
    uint64_t v12 = 0;
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0)
    {
      unint64_t v13 = (((a4 & 0xFFFFFFFFFFFFFFFELL) - 1) >> 1) + 1;
      id v14 = v10 + 8;
      id v15 = a3 + 1;
      unint64_t v16 = 1;
      while (1)
      {
        dispatch_time_t v17 = (void *)MEMORY[0x1E016D870]();
        if (v16 >= a4) {
          break;
        }
        double latitude = v15[-1].latitude;
        double longitude = v15[-1].longitude;
        double v20 = v15->latitude;
        double v21 = v15->longitude;
        v15 += 2;
        ++v12;
        *(CLLocationCoordinate2D *)(v14 - 8) = CLLocationCoordinate2DMake((latitude + v20) * 0.5, (longitude + v21) * 0.5);
        v16 += 2;
        v14 += 16;
        if (v13 == v12)
        {
          id v22 = 0;
          LODWORD(v12) = v13;
          goto LABEL_13;
        }
      }
      long long v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"index out of bounds";
      double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      id v22 = [v25 errorWithDomain:v26 code:7 userInfo:v27];
    }
    else
    {
      id v22 = 0;
    }
LABEL_13:
    id v24 = (CLLocationCoordinate2D *)malloc_type_realloc(v11, 16 * v12, 0x1000040451B5BE8uLL);
    *a5 = v12;
    if (v22)
    {
      if (a6) {
        *a6 = v22;
      }
      if (v24)
      {
        free(v24);
        id v24 = 0;
      }
    }
  }
  else
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", (uint8_t *)&v29, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"x");
      id v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v24;
}

- (id)_expand_windowWithPath:(id)a3 len_x:(signed __int16)a4 len_y:(signed __int16)a5 radius:(signed __int16)a6 error:(id *)a7
{
  int v8 = a6;
  int v40 = a4;
  int v41 = a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    v39 = objc_opt_new();
    id v38 = (void *)MEMORY[0x1E016D870]();
    long double v10 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v9;
    uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v44)
    {
      uint64_t v43 = *(void *)v54;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v54 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = v11;
          uint64_t v12 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v11);
          context = (void *)MEMORY[0x1E016D870]();
          if ((__int16)-(__int16)v8 <= v8)
          {
            LOWORD(v13) = -(__int16)v8;
            do
            {
              id v14 = (void *)MEMORY[0x1E016D870]();
              LOWORD(v15) = -(__int16)v8;
              do
              {
                unint64_t v16 = (void *)MEMORY[0x1E016D870]();
                dispatch_time_t v17 = [[RTCellIndex alloc] initWithX:Y:((__int16)([v12 x] + v13), (__int16)(objc_msgSend(v12, "y") + v15));
                [v10 addObject:v17];

                int v15 = (__int16)(v15 + 1);
              }
              while (v15 <= v8);
              int v13 = (__int16)(v13 + 1);
            }
            while (v13 <= v8);
          }
          id v11 = v46 + 1;
        }
        while (v46 + 1 != (char *)v44);
        uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v44);
    }

    uint64_t v18 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v48 = v10;
    uint64_t v19 = [v48 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(v48);
          }
          id v23 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v24 = (void *)MEMORY[0x1E016D870]();
          long long v25 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)(2 * [v23 x]), (__int16)(2 * [v23 y]));
          [v18 addObject:v25];

          uint64_t v26 = [[RTCellIndex alloc] initWithX:2 * [v23 x] Y:2 * [v23 y] | 1];
          [v18 addObject:v26];

          double v27 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)((2 * [v23 x]) | 1), (__int16)(2 * [v23 y]));
          [v18 addObject:v27];

          int v28 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)((2 * [v23 x]) | 1), (__int16)((2 * objc_msgSend(v23, "y")) | 1));
          [v18 addObject:v28];
        }
        uint64_t v20 = [v48 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v20);
    }

    __int16 v29 = v39;
    if (v40 < 1) {
      goto LABEL_35;
    }
    LOWORD(v30) = 0;
    int v31 = 0;
    while (1)
    {
      unint64_t v47 = (void *)MEMORY[0x1E016D870]();
      if (v41 <= (__int16)v31)
      {
        int v35 = 0xFFFF;
        goto LABEL_34;
      }
      int v32 = 0xFFFF;
      while (1)
      {
        uint64_t v33 = (void *)MEMORY[0x1E016D870]();
        uint64_t v34 = [[RTCellIndex alloc] initWithX:(__int16)v30 Y:(__int16)v31];
        if ([v18 containsObject:v34])
        {
          [v39 addObject:v34];
          if ((_WORD)v32 == 0xFFFF) {
            int v35 = v31;
          }
          else {
            int v35 = v32;
          }
          goto LABEL_30;
        }
        int v35 = 0xFFFF;
        if ((_WORD)v32 != 0xFFFF) {
          break;
        }
LABEL_30:

        int v31 = (__int16)(v31 + 1);
        int v32 = v35;
        if (v31 >= v41) {
          goto LABEL_34;
        }
      }

      int v35 = v32;
LABEL_34:
      int v30 = (__int16)(v30 + 1);
      int v31 = v35;
      if (v30 >= v40)
      {
LABEL_35:

        goto LABEL_41;
      }
    }
  }
  uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: path", buf, 2u);
  }

  if (a7)
  {
    _RTErrorInvalidParameterCreate(@"path");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  __int16 v29 = [MEMORY[0x1E4F1C978] array];
LABEL_41:

  return v29;
}

- (double)_dtwDistanceFirstNormBetweenX:(CLLocationCoordinate2D *)a3 y:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  if (!a3)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
    }

    if (!a5) {
      return 1.79769313e308;
    }
    int v8 = @"x";
    goto LABEL_12;
  }
  if (a4) {
    return vaddvq_f64(vabdq_f64(*(float64x2_t *)a3, *(float64x2_t *)a4));
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long double v10 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", v10, 2u);
  }

  if (a5)
  {
    int v8 = @"y";
LABEL_12:
    _RTErrorInvalidParameterCreate((uint64_t)v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1.79769313e308;
}

- (double)_dtwDistanceEuclideanBetweenX:(CLLocationCoordinate2D *)a3 y:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  if (!a3)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
    }

    if (!a5) {
      return 1.79769313e308;
    }
    id v9 = @"x";
    goto LABEL_12;
  }
  if (a4)
  {
    float64x2_t v6 = vsubq_f64(*(float64x2_t *)a3, *(float64x2_t *)a4);
    return sqrt(vaddvq_f64(vmulq_f64(v6, v6)));
  }
  long double v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v11 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", v11, 2u);
  }

  if (a5)
  {
    id v9 = @"y";
LABEL_12:
    _RTErrorInvalidParameterCreate((uint64_t)v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1.79769313e308;
}

- (double)_centroidDistanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 error:(id *)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromLocations", buf, 2u);
    }

    if (!a7) {
      return 1.79769313e308;
    }
    int v28 = @"fromLocations";
    goto LABEL_21;
  }
  if (!a5)
  {
    __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toLocations", buf, 2u);
    }

    if (!a7) {
      return 1.79769313e308;
    }
    int v28 = @"toLocations";
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v28);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    return 1.79769313e308;
  }
  double v10 = 1.79769313e308;
  if (a4 && a6)
  {
    int v15 = (void *)MEMORY[0x1E016D870]();
    id v38 = 0;
    [(RTDistanceCalculator *)self computeCentroid:a3 locationsCount:a4 error:&v38];
    CLLocationDegrees v17 = v16;
    CLLocationDegrees v19 = v18;
    id v20 = v38;
    *(CLLocationDegrees *)buf = v17;
    *(CLLocationDegrees *)&buf[8] = v19;
    if (v20
      || (id v36 = 0,
          [(RTDistanceCalculator *)self computeCentroid:a5 locationsCount:a6 error:&v36], v22 = v21, v24 = v23, id v20 = v36, *(CLLocationDegrees *)v37 = v22, *(CLLocationDegrees *)&v37[1] = v24, v20))
    {
      id v25 = v20;
      double v10 = 1.79769313e308;
      goto LABEL_8;
    }
    v43.double latitude = v17;
    v43.double longitude = v19;
    if (CLLocationCoordinate2DIsValid(v43)
      && (v44.double latitude = v22, v44.longitude = v24, CLLocationCoordinate2DIsValid(v44)))
    {
      id v35 = 0;
      [(RTDistanceCalculator *)self distanceFromLocationCoordinate:buf toLocationCoordinate:v37 error:&v35];
      double v10 = v31;
      id v25 = v35;
      if (v25)
      {
LABEL_8:
        if (a7)
        {
          uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v32 = (objc_class *)objc_opt_class();
            uint64_t v33 = NSStringFromClass(v32);
            uint64_t v34 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v33;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v34;
            __int16 v40 = 2112;
            id v41 = v25;
            _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
          }
          id v25 = v25;
          *a7 = v25;
        }
        goto LABEL_12;
      }
    }
    else
    {
      double v10 = 1.79769313e308;
    }
    id v25 = 0;
LABEL_12:
  }
  return v10;
}

- (CLLocationCoordinate2D)computeCentroid:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  if (!a3)
  {
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"locations");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
  if (!a4)
  {
LABEL_10:
    double latitude = *MEMORY[0x1E4F1E750];
    double longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
    goto LABEL_11;
  }
  uint64_t v7 = 0;
  float64x2_t v14 = 0u;
  do
  {
    int v8 = (void *)MEMORY[0x1E016D870](self, a2);
    float64x2_t v14 = vaddq_f64(v14, (float64x2_t)a3[v7]);
    ++v7;
  }
  while (a4 != v7);
  CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v14.f64[0] / (double)a4, v14.f64[1] / (double)a4);
  double longitude = v11.longitude;
  double latitude = v11.latitude;
LABEL_11:
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (double)computeBoundingBoxArea:(CGRect)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", a4, a5);
  double v12 = v11;
  int v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    float64x2_t v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    double v16 = NSStringFromSelector(a2);
    int v18 = 138414083;
    CLLocationDegrees v19 = v15;
    __int16 v20 = 2112;
    double v21 = v16;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 2049;
    CGFloat v25 = x;
    __int16 v26 = 2049;
    CGFloat v27 = y;
    __int16 v28 = 2049;
    CGFloat v29 = width;
    __int16 v30 = 2049;
    CGFloat v31 = height;
    __int16 v32 = 2049;
    double v33 = v12;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, locations count, %lu, rect x, %{private}f, rect y, %{private}f, rect width, %{private}f, rect height, %{private}f, rectArea, %{private}f", (uint8_t *)&v18, 0x52u);
  }
  return v12;
}

- (double)computeIntersectionOverUnionUsingBoundingBoxBetweenLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 otherLocations:(CLLocationCoordinate2D *)a5 otherLocationsCount:(unint64_t)a6 error:(id *)a7
{
  v101[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    CGFloat v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v26 = "Invalid parameter not satisfying: locations";
LABEL_14:
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    }
LABEL_24:
    double v39 = 2.22507386e-308;
    goto LABEL_25;
  }
  if (!a5)
  {
    CGFloat v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v26 = "Invalid parameter not satisfying: otherLocations";
      goto LABEL_14;
    }
    goto LABEL_24;
  }
  if (a4 < 4 || a6 <= 3)
  {
    CGFloat v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F5CFE8];
    uint64_t v100 = *MEMORY[0x1E4F28568];
    v101[0] = @"less number of locations than required";
    CGFloat v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101, &v100, 1, a6];
    CGFloat v25 = [v27 errorWithDomain:v28 code:7 userInfo:v29];

    if (!a7) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  v67[1] = 0;
  -[RTDistanceCalculator cgrectFromCoordinates:locationsCount:error:](self, "cgrectFromCoordinates:locationsCount:error:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CGFloat v20 = v19;
  double v21 = 0;
  __int16 v22 = v21;
  if (a7 && v21)
  {
    unint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v57 = (objc_class *)objc_opt_class();
      __int16 v58 = NSStringFromClass(v57);
      __int16 v59 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v69 = v58;
      __int16 v70 = 2112;
      v71 = v59;
      __int16 v72 = 2112;
      unint64_t v73 = (unint64_t)v22;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    __int16 v24 = v22;
    goto LABEL_23;
  }
  v67[0] = v21;
  [(RTDistanceCalculator *)self cgrectFromCoordinates:a5 locationsCount:a6 error:v67];
  double v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v25 = v67[0];

  if (a7 && v25)
  {
    id v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v60 = (objc_class *)objc_opt_class();
      int v61 = NSStringFromClass(v60);
      v62 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v69 = v61;
      __int16 v70 = 2112;
      v71 = v62;
      __int16 v72 = 2112;
      unint64_t v73 = (unint64_t)v25;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
LABEL_22:
    __int16 v24 = v25;
LABEL_23:
    CGFloat v25 = v24;
    *a7 = v25;
    goto LABEL_24;
  }
  v102.origin.CGFloat x = v14;
  v102.origin.CGFloat y = v16;
  v102.size.CGFloat width = v18;
  v102.size.CGFloat height = v20;
  v104.origin.CGFloat x = v31;
  v104.origin.CGFloat y = v33;
  v104.size.CGFloat width = v35;
  v104.size.CGFloat height = v37;
  CGRect v103 = CGRectIntersection(v102, v104);
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height);
  CGFloat v41 = v20;
  double v43 = v42;
  CGFloat v63 = v41;
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", v14, v16, v18);
  CGFloat v44 = v35;
  double v46 = v45;
  CGFloat v64 = v33;
  double v47 = v33;
  CGFloat v48 = v44;
  CGFloat v65 = v37;
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", v31, v47);
  double v66 = v49;
  double v50 = v46 + v49 - v43;
  long long v51 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    long long v52 = (objc_class *)objc_opt_class();
    long long v53 = NSStringFromClass(v52);
    long long v54 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138416131;
    v69 = v53;
    __int16 v70 = 2112;
    v71 = v54;
    __int16 v72 = 2048;
    unint64_t v73 = a4;
    __int16 v74 = 2048;
    unint64_t v75 = a6;
    __int16 v76 = 2049;
    double v77 = v14;
    __int16 v78 = 2049;
    double v79 = v16;
    __int16 v80 = 2049;
    double v81 = v18;
    __int16 v82 = 2049;
    CGFloat v83 = v63;
    __int16 v84 = 2049;
    double v85 = v31;
    __int16 v86 = 2049;
    CGFloat v87 = v64;
    __int16 v88 = 2049;
    CGFloat v89 = v48;
    __int16 v90 = 2049;
    CGFloat v91 = v65;
    __int16 v92 = 2049;
    double v93 = v46;
    __int16 v94 = 2049;
    double v95 = v66;
    __int16 v96 = 2049;
    double v97 = v43;
    __int16 v98 = 2049;
    double v99 = v50;
    _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_INFO, "%@, %@, locations count, %lu, otherLocations count, %lu, rect1 x, %{private}f, rect1 y, %{private}f, rect1 width, %{private}f, rect1 height, %{private}f, rect2 x, %{private}f, rect2 y, %{private}f, rect2 width, %{private}f, rect2 height, %{private}f, rect1Area, %{private}f, rect2Area, %{private}f, intersectionArea, %{private}f, unionArea, %{private}f,", buf, 0xA2u);
  }
  if (v66 == 0.0 || v46 == 0.0 || v50 == 0.0) {
    double v39 = 0.0;
  }
  else {
    double v39 = v43 / v50;
  }
LABEL_25:

  return v39;
}

- (CGRect)cgrectFromCoordinates:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  v54[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v6 = a4;
    if (a4 >= 4)
    {
      p_double longitude = &a3->longitude;
      double v20 = -1.79769313e308;
      double v13 = 1.79769313e308;
      double v14 = 1.79769313e308;
      double v21 = -1.79769313e308;
      do
      {
        __int16 v22 = (void *)MEMORY[0x1E016D870]();
        double v23 = *(p_longitude - 1);
        double v24 = *p_longitude;
        if (v23 < v13) {
          double v13 = *(p_longitude - 1);
        }
        if (v23 > v20) {
          double v20 = *(p_longitude - 1);
        }
        if (v24 < v14) {
          double v14 = *p_longitude;
        }
        if (v24 > v21) {
          double v21 = *p_longitude;
        }
        p_longitude += 2;
        --v6;
      }
      while (v6);
      CLLocationCoordinate2D v46 = CLLocationCoordinate2DMake(v13, v14);
      CLLocationCoordinate2D v45 = CLLocationCoordinate2DMake(v13, v21);
      CLLocationCoordinate2D v44 = CLLocationCoordinate2DMake(v20, v21);
      id v43 = 0;
      [(RTDistanceCalculator *)self distanceFromLocationCoordinate:&v46 toLocationCoordinate:&v45 error:&v43];
      double v15 = v25;
      id v26 = v43;
      CGFloat v27 = v26;
      if (a5 && v26)
      {
        uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          double v36 = (objc_class *)objc_opt_class();
          CGFloat v37 = NSStringFromClass(v36);
          id v38 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          CGFloat v48 = v37;
          __int16 v49 = 2112;
          double v50 = v38;
          __int16 v51 = 2112;
          id v52 = v27;
          _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        CGFloat v29 = v27;
      }
      else
      {
        id v42 = v26;
        [(RTDistanceCalculator *)self distanceFromLocationCoordinate:&v45 toLocationCoordinate:&v44 error:&v42];
        double v16 = v30;
        id v10 = v42;

        if (!a5 || !v10)
        {
          if (v15 < 0.00001) {
            double v15 = 0.00001;
          }
          if (v16 < 0.00001) {
            double v16 = 0.00001;
          }
          goto LABEL_31;
        }
        double v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          double v39 = (objc_class *)objc_opt_class();
          __int16 v40 = NSStringFromClass(v39);
          CGFloat v41 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          CGFloat v48 = v40;
          __int16 v49 = 2112;
          double v50 = v41;
          __int16 v51 = 2112;
          id v52 = v10;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        CGFloat v29 = v10;
      }
      id v11 = v29;
      id v10 = v11;
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F5CFE8];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      v54[0] = @"less number of locations than required";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
      id v10 = [v7 errorWithDomain:v8 code:7 userInfo:v9];

      if (!a5)
      {
LABEL_30:
        double v13 = *MEMORY[0x1E4F1DB20];
        double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_31:

        goto LABEL_32;
      }
      id v11 = v10;
    }
    *a5 = v11;
    goto LABEL_30;
  }
  double v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
  }

  double v13 = *MEMORY[0x1E4F1DB20];
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_32:
  double v32 = v13;
  double v33 = v14;
  double v34 = v15;
  double v35 = v16;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (CLLocationCoordinate2D)rectVerticesFromCoordinates:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 ignoreNFirstAndLastLocations:(unint64_t)a5 error:(id *)a6
{
  v56[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", (uint8_t *)&v35, 2u);
    }
    goto LABEL_7;
  }
  if (2 * a5 + 4 > a4)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F5CFE8];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56[0] = @"less number of locations than required";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    id v10 = [v7 errorWithDomain:v8 code:7 userInfo:v9];

    if (a6)
    {
      id v10 = v10;
      id v11 = 0;
      *a6 = v10;
      goto LABEL_24;
    }
LABEL_7:
    id v11 = 0;
    goto LABEL_24;
  }
  if (a4 - a5 <= a5)
  {
    double v17 = 1.79769313e308;
    double v18 = -1.79769313e308;
    double v15 = -1.79769313e308;
    double v16 = 1.79769313e308;
  }
  else
  {
    unint64_t v13 = a4 - 2 * a5;
    p_CLLocationDegrees longitude = &a3[a5].longitude;
    double v15 = -1.79769313e308;
    double v16 = 1.79769313e308;
    double v17 = 1.79769313e308;
    double v18 = -1.79769313e308;
    do
    {
      double v19 = (void *)MEMORY[0x1E016D870](self);
      double v20 = *(p_longitude - 1);
      double v21 = *p_longitude;
      if (v20 < v16) {
        double v16 = *(p_longitude - 1);
      }
      if (v20 > v15) {
        double v15 = *(p_longitude - 1);
      }
      if (v21 < v17) {
        double v17 = *p_longitude;
      }
      if (v21 > v18) {
        double v18 = *p_longitude;
      }
      p_longitude += 2;
      --v13;
    }
    while (v13);
  }
  id v11 = (CLLocationCoordinate2D *)malloc_type_malloc(0x40uLL, 0x1000040451B5BE8uLL);
  *id v11 = CLLocationCoordinate2DMake(v16, v17);
  v11[1] = CLLocationCoordinate2DMake(v16, v18);
  v11[2] = CLLocationCoordinate2DMake(v15, v17);
  v11[3] = CLLocationCoordinate2DMake(v15, v18);
  __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    double v24 = (objc_class *)objc_opt_class();
    double v25 = NSStringFromClass(v24);
    id v26 = NSStringFromSelector(a2);
    CLLocationDegrees latitude = v11->latitude;
    CLLocationDegrees longitude = v11->longitude;
    CLLocationDegrees v29 = v11[1].latitude;
    CLLocationDegrees v30 = v11[1].longitude;
    CLLocationDegrees v31 = v11[2].latitude;
    CLLocationDegrees v32 = v11[2].longitude;
    CLLocationDegrees v33 = v11[3].latitude;
    CLLocationDegrees v34 = v11[3].longitude;
    int v35 = 138414595;
    double v36 = v25;
    __int16 v37 = 2112;
    id v38 = v26;
    __int16 v39 = 2049;
    CLLocationDegrees v40 = latitude;
    __int16 v41 = 2049;
    CLLocationDegrees v42 = longitude;
    __int16 v43 = 2049;
    CLLocationDegrees v44 = v29;
    __int16 v45 = 2049;
    CLLocationDegrees v46 = v30;
    __int16 v47 = 2049;
    CLLocationDegrees v48 = v31;
    __int16 v49 = 2049;
    CLLocationDegrees v50 = v32;
    __int16 v51 = 2049;
    CLLocationDegrees v52 = v33;
    __int16 v53 = 2049;
    CLLocationDegrees v54 = v34;
    _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "%@, %@, rect vertices, 0, lat, %{private}f, lon, %{private}f, 1, lat, %{private}f, lon, %{private}f, 2, lat, %{private}f, lon, %{private}f, 3, lat, %{private}f, lon, %{private}f, ", (uint8_t *)&v35, 0x66u);
  }
  id v10 = 0;
LABEL_24:

  return v11;
}

- (double)_computeAreaFromRect:(CGRect)a3
{
  return a3.size.width * a3.size.height;
}

- (void)setLocationShifter:(id)a3
{
}

@end