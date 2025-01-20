@interface RTSignalGenerator
+ (CLLocationCoordinate2D)averageCoordinateOfCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4;
+ (CLLocationCoordinate2D)coordinateAtDisplacement:(double)a3 fromCenterCoordinate:(CLLocationCoordinate2D)a4 atAngle:(double)a5;
+ (double)angleOfLineBetweenCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4;
+ (double)anglePerpendicularToLineBetweenLocation1:(id)a3 location2:(id)a4;
+ (double)angleSweptFromStartAngle:(double)a3 ToEndAngle:(double)a4;
+ (double)arcDistanceForStartLocation:(id)a3 endLocation:(id)a4 centerLocation:(id)a5;
+ (double)latLongDisplacementBetweenCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4;
+ (double)minSpeedToFilterHyperParameter;
+ (double)perpendicularAngleForAngle:(double)a3;
+ (id)centerProducingArcBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 FromStartLocation:(id)a5 endLocation:(id)a6;
+ (id)centerProducingArcBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 fromStartLocation:(id)a5 endLocation:(id)a6 examiningLatLongDisplacement:(double)a7 fromIntersectingLocation:(id)a8 atAngle:(double)a9;
+ (id)locationBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 fromStartLocation:(id)a5 endLocation:(id)a6 betweenTargetLowLocation:(id)a7 targetHighLocation:(id)a8;
+ (id)necessaryCenterOfArcBetweenStartLocation:(id)a3 endLocation:(id)a4 minimumSpeed:(double)a5;
+ (void)injectSignalForSignalGeneratorOptions:(id)a3 locationManager:(id)a4 handler:(id)a5;
- (NSMutableArray)generatedLocations;
- (RTSignalGenerator)init;
- (RTSignalGenerator)initWithSignalGeneratorOptions:(id)a3 locationManager:(id)a4;
- (RTSignalGenerator)initWithSignalGeneratorOptions:(id)a3 locationManager:(id)a4 generatedLocations:(id)a5;
- (id)addGeneratedLocation:(id)a3 forceInject:(BOOL)a4;
- (id)generateLocations;
- (id)locationsForVisit:(id)a3;
- (id)transitionLocationsAlongArcBetweenStartLocation:(id)a3 endLocation:(id)a4 forCenterLocation:(id)a5;
- (id)transitionLocationsBetweenStartLocation:(id)a3 endLocation:(id)a4;
- (id)transitionLocationsBetweenStartLocation:(id)a3 endLocation:(id)a4 coordinateCalculationBlock:(id)a5;
- (unint64_t)locationCountInStoreWithError:(id *)a3;
- (void)setGeneratedLocations:(id)a3;
@end

@implementation RTSignalGenerator

- (RTSignalGenerator)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithSignalGeneratorOptions_locationManager_generatedLocations_);
}

- (RTSignalGenerator)initWithSignalGeneratorOptions:(id)a3 locationManager:(id)a4
{
  return [(RTSignalGenerator *)self initWithSignalGeneratorOptions:a3 locationManager:a4 generatedLocations:0];
}

- (RTSignalGenerator)initWithSignalGeneratorOptions:(id)a3 locationManager:(id)a4 generatedLocations:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v16 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: signalGeneratorOptions";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)RTSignalGenerator;
  v12 = [(RTSignalGenerator *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_signalGeneratorOptions, a3);
    objc_storeStrong((id *)&v13->_locationManager, a4);
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:v11];
    generatedLocations = v13->_generatedLocations;
    v13->_generatedLocations = (NSMutableArray *)v14;

    v13->_totalVisitLocationsGeneratedCount = 0;
    v13->_totalTransitionLocationsGeneratedCount = 0;
  }
  self = v13;
  v16 = self;
LABEL_10:

  return v16;
}

- (unint64_t)locationCountInStoreWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v39 = 136315394;
      *(void *)&v39[4] = "-[RTSignalGenerator locationCountInStoreWithError:]";
      *(_WORD *)&v39[12] = 1024;
      *(_DWORD *)&v39[14] = 74;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError (in %s:%d)", v39, 0x12u);
    }
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  *(void *)v39 = 0;
  *(void *)&v39[8] = v39;
  *(void *)&v39[16] = 0x3032000000;
  v40 = __Block_byref_object_copy__130;
  v41 = __Block_byref_object_dispose__130;
  id v42 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  locationManager = self->_locationManager;
  v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __51__RTSignalGenerator_locationCountInStoreWithError___block_invoke;
  v31[3] = &unk_1E6B908E0;
  v33 = &v35;
  v34 = v39;
  id v10 = v6;
  v32 = v10;
  [(RTLocationManager *)locationManager fetchStoredLocationsCountFromDate:v8 toDate:v9 uncertainty:-1 limit:v31 handler:1.79769313e308];

  id v11 = v10;
  v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13)) {
    goto LABEL_10;
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  v17 = objc_opt_new();
  v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_100];
  v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  objc_super v20 = [v19 filteredArrayUsingPredicate:v18];
  v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v43 count:1];
  v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;

    char v27 = 0;
  }
  else
  {
LABEL_10:
    id v26 = 0;
    char v27 = 1;
  }

  id v28 = v26;
  if ((v27 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)&v39[8] + 40), v26);
  }
  if (a3) {
    *a3 = *(id *)(*(void *)&v39[8] + 40);
  }
  unint64_t v29 = v36[3];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v35, 8);
  return v29;
}

void __51__RTSignalGenerator_locationCountInStoreWithError___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (double)minSpeedToFilterHyperParameter
{
  uint64_t v2 = (void *)hyperParameter;
  if (!hyperParameter)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)hyperParameter;
    hyperParameter = v3;

    uint64_t v2 = (void *)hyperParameter;
  }

  [v2 minSpeedToFilter];
  return result;
}

+ (double)perpendicularAngleForAngle:(double)a3
{
  double result = a3 + 1.57079633;
  if (result > 6.28318531) {
    return result + -6.28318531;
  }
  return result;
}

+ (double)anglePerpendicularToLineBetweenLocation1:(id)a3 location2:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  [v6 coordinate];
  double v9 = v8;
  double v11 = v10;

  [v5 coordinate];
  double v13 = v12;
  double v15 = v14;

  [v7 angleOfLineBetweenCoordinate1:v9 coordinate2:v11];
  double v17 = v16;
  v18 = objc_opt_class();

  [v18 perpendicularAngleForAngle:v17];
  return result;
}

+ (double)angleOfLineBetweenCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4
{
  double v4 = a4.latitude - a3.latitude;
  double v5 = a4.longitude - a3.longitude;
  if (a4.longitude - a3.longitude == 0.0)
  {
    if (v4 <= 0.0)
    {
      double result = 4.71238898;
      if (v4 == 0.0) {
        return 0.0;
      }
    }
    else
    {
      return 1.57079633;
    }
  }
  else
  {
    if (v4 != 0.0)
    {
      double result = atan(v4 / v5);
      if ((v5 >= 0.0 || v4 >= 0.0) && v5 >= 0.0)
      {
        if (v4 >= 0.0) {
          return result;
        }
        double v7 = 6.28318531;
      }
      else
      {
        double v7 = 3.14159265;
      }
      return result + v7;
    }
    double result = 3.14159265;
    if (v5 >= 0.0) {
      return 0.0;
    }
  }
  return result;
}

+ (double)angleSweptFromStartAngle:(double)a3 ToEndAngle:(double)a4
{
  if (a4 <= a3) {
    a4 = a4 + 6.28318531;
  }
  return a4 - a3;
}

+ (double)arcDistanceForStartLocation:(id)a3 endLocation:(id)a4 centerLocation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = objc_opt_class();
  double v11 = objc_opt_class();
  [v7 coordinate];
  double v13 = v12;
  double v15 = v14;
  [v9 coordinate];
  [v11 angleOfLineBetweenCoordinate1:v13 coordinate2:v15];
  double v19 = v18;
  objc_super v20 = objc_opt_class();
  [v7 coordinate];
  double v22 = v21;
  double v24 = v23;
  [v8 coordinate];
  double v26 = v25;
  double v28 = v27;

  [v20 angleOfLineBetweenCoordinate1:v22 coordinate2:v24];
  [v10 angleSweptFromStartAngle:v19 ToEndAngle:v29];
  double v31 = v30;
  [v9 distanceFromLocation:v7];
  double v33 = v32;

  return fabs(v31 * v33);
}

+ (double)latLongDisplacementBetweenCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4
{
  return fabs(sqrt((a3.latitude - a4.latitude) * (a3.latitude - a4.latitude)+ (a3.longitude - a4.longitude) * (a3.longitude - a4.longitude)));
}

+ (CLLocationCoordinate2D)averageCoordinateOfCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4
{
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake((a3.latitude + a4.latitude) * 0.5, (a3.longitude + a4.longitude) * 0.5);
  double longitude = v6.longitude;
  double latitude = v6.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

+ (CLLocationCoordinate2D)coordinateAtDisplacement:(double)a3 fromCenterCoordinate:(CLLocationCoordinate2D)a4 atAngle:(double)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  __double2 v8 = __sincos_stret(a5);

  CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(latitude + a3 * v8.__sinval, longitude + a3 * v8.__cosval);
  double v10 = v11.longitude;
  double v9 = v11.latitude;
  result.double longitude = v10;
  result.double latitude = v9;
  return result;
}

+ (id)locationBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 fromStartLocation:(id)a5 endLocation:(id)a6 betweenTargetLowLocation:(id)a7 targetHighLocation:(id)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  double v15 = a7;
  double v16 = a8;
  double v17 = v16;
  if (a3 <= 0.0)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: lowerDistanceBound > 0";
LABEL_27:
    _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, v51, buf, 2u);
    goto LABEL_28;
  }
  if (a4 <= 0.0)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: upperDistanceBound > 0";
    goto LABEL_27;
  }
  if (!v13)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: startLocation";
    goto LABEL_27;
  }
  if (!v14)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_27;
  }
  if (!v15)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: targetLowLocation";
    goto LABEL_27;
  }
  if (!v16)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = "Invalid parameter not satisfying: targetHighLocation";
      goto LABEL_27;
    }
LABEL_28:
    v50 = 0;
    goto LABEL_29;
  }
  double v18 = objc_opt_class();
  [v17 coordinate];
  double v20 = v19;
  double v22 = v21;
  [v15 coordinate];
  [v18 averageCoordinateOfCoordinate1:v20 coordinate2:v22];
  double v26 = v25;
  double v28 = v27;
  id v29 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [(id)objc_opt_class() minSpeedToFilterHyperParameter];
  double v31 = v30 * 1.5;
  double v32 = (void *)MEMORY[0x1E4F1C9C8];
  double v33 = [v13 timestamp];
  v34 = [v14 timestamp];
  uint64_t v35 = [v32 dateBisectingDate1:v33 date2:v34];
  v36 = [v29 initWithCoordinate:v35 altitude:v26 horizontalAccuracy:v28 verticalAccuracy:0.0 course:10.0 speed:10.0 timestamp:v31];

  [(id)objc_opt_class() arcDistanceForStartLocation:v13 endLocation:v14 centerLocation:v36];
  if (v37 <= a3)
  {
    v53 = objc_opt_class();
    double v54 = a3;
    double v55 = a4;
    id v56 = v13;
    id v57 = v14;
    v58 = v36;
    v59 = v17;
  }
  else
  {
    double v38 = v37;
    if (v37 < a4)
    {
      RTCommonIsCoordinateValid();
      if (v39 == 0.0)
      {
        v40 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          double v63 = v26;
          __int16 v64 = 2048;
          double v65 = v28;
          _os_log_debug_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_DEBUG, "Invalid Coords: %lf, %lf", buf, 0x16u);
        }
      }
      RTCommonIsCoordinateValid();
      if (v41 != 0.0)
      {
        id v42 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        v61 = [v14 timestamp];
        uint64_t v43 = [v13 timestamp];
        [v61 timeIntervalSinceDate:v43];
        v44 = (void *)MEMORY[0x1E4F1C9C8];
        double v46 = v38 / v45;
        v47 = [v13 timestamp];
        v48 = [v14 timestamp];
        v49 = [v44 dateBisectingDate1:v47 date2:v48];
        v50 = [v42 initWithCoordinate:v49 altitude:v26 horizontalAccuracy:v28 verticalAccuracy:0.0 course:10.0 speed:10.0 timestamp:v46];

        goto LABEL_29;
      }
      v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonIsCoordinateValid(midCoordinate.latitude, midCoordinate.longitude)", buf, 2u);
      }

      goto LABEL_28;
    }
    v53 = objc_opt_class();
    double v54 = a3;
    double v55 = a4;
    id v56 = v13;
    id v57 = v14;
    v58 = v15;
    v59 = v36;
  }
  v50 = [v53 locationBetweenLowerDistanceBound:v56 upperDistanceBound:v57 fromStartLocation:v58 endLocation:v59 betweenTargetLowLocation:v54 targetHighLocation:v55];
LABEL_29:

  return v50;
}

+ (id)centerProducingArcBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 fromStartLocation:(id)a5 endLocation:(id)a6 examiningLatLongDisplacement:(double)a7 fromIntersectingLocation:(id)a8 atAngle:(double)a9
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  double v17 = a8;
  double v18 = v17;
  if (a3 <= 0.0)
  {
    double v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v61) = 0;
    uint64_t v43 = "Invalid parameter not satisfying: lowerDistanceBound > 0";
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, v43, (uint8_t *)&v61, 2u);
    goto LABEL_21;
  }
  if (a4 <= 0.0)
  {
    double v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v61) = 0;
    uint64_t v43 = "Invalid parameter not satisfying: upperDistanceBound > 0";
    goto LABEL_20;
  }
  if (!v15)
  {
    double v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v61) = 0;
    uint64_t v43 = "Invalid parameter not satisfying: startLocation";
    goto LABEL_20;
  }
  if (!v16)
  {
    double v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v61) = 0;
    uint64_t v43 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_20;
  }
  if (!v17)
  {
    double v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v61) = 0;
    uint64_t v43 = "Invalid parameter not satisfying: intersectingLocation";
    goto LABEL_20;
  }
  double v19 = objc_opt_class();
  [v18 coordinate];
  [v19 coordinateAtDisplacement:a7 fromCenterCoordinate:v20 atAngle:v21];
  double v23 = v22;
  double v25 = v24;
  id v26 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [(id)objc_opt_class() minSpeedToFilterHyperParameter];
  double v28 = v27 * 1.5;
  id v29 = (void *)MEMORY[0x1E4F1C9C8];
  double v30 = [v15 timestamp];
  double v31 = [v16 timestamp];
  double v32 = [v29 dateBisectingDate1:v30 date2:v31];
  double v33 = [v26 initWithCoordinate:v32 altitude:v23 horizontalAccuracy:v25 verticalAccuracy:0.0 course:10.0 speed:10.0 timestamp:v28];

  [(id)objc_opt_class() arcDistanceForStartLocation:v15 endLocation:v16 centerLocation:v33];
  if (v34 > a3)
  {
    double v35 = v34;
    if (v34 > a4)
    {
      if (a7 < 0.0)
      {
        v36 = objc_opt_class();
        double v37 = a3;
        double v38 = a4;
        id v39 = v15;
        id v40 = v16;
        double v41 = v18;
        id v42 = v33;
LABEL_43:
        uint64_t v59 = [v36 locationBetweenLowerDistanceBound:v39 upperDistanceBound:v40 fromStartLocation:v41 endLocation:v42 betweenTargetLowLocation:v37 targetHighLocation:v38];
        goto LABEL_44;
      }
      v36 = objc_opt_class();
      if (a7 == 0.0)
      {
        double v46 = 0.1;
        goto LABEL_38;
      }
      goto LABEL_27;
    }
    RTCommonIsCoordinateValid();
    if (v47 == 0.0)
    {
      v48 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        int v61 = 134218240;
        double v62 = v23;
        __int16 v63 = 2048;
        double v64 = v25;
        _os_log_debug_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEBUG, "Invalid Coords: %lf, %lf", (uint8_t *)&v61, 0x16u);
      }
    }
    RTCommonIsCoordinateValid();
    if (v49 != 0.0)
    {
      id v50 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      v51 = [v16 timestamp];
      v52 = [v15 timestamp];
      [v51 timeIntervalSinceDate:v52];
      v53 = (void *)MEMORY[0x1E4F1C9C8];
      double v55 = v35 / v54;
      id v56 = [v15 timestamp];
      id v57 = [v16 timestamp];
      v58 = [v53 dateBisectingDate1:v56 date2:v57];
      v44 = [v50 initWithCoordinate:v58 altitude:v23 horizontalAccuracy:v25 verticalAccuracy:0.0 course:10.0 speed:10.0 timestamp:v55];

      goto LABEL_22;
    }
    v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v61) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonIsCoordinateValid(candidateTargetCoordinate.latitude, candidateTargetCoordinate.longitude)", (uint8_t *)&v61, 2u);
    }

LABEL_21:
    v44 = 0;
    goto LABEL_22;
  }
  if (a7 < 0.0)
  {
    v36 = objc_opt_class();
LABEL_27:
    double v46 = a7 + a7;
    goto LABEL_38;
  }
  v36 = objc_opt_class();
  if (a7 != 0.0)
  {
    double v37 = a3;
    double v38 = a4;
    id v39 = v15;
    id v40 = v16;
    double v41 = v33;
    id v42 = v18;
    goto LABEL_43;
  }
  double v46 = -0.1;
LABEL_38:
  uint64_t v59 = [v36 centerProducingArcBetweenLowerDistanceBound:v15 upperDistanceBound:v16 fromStartLocation:v18 endLocation:a3 examiningLatLongDisplacement:a4 fromIntersectingLocation:v46 atAngle:a9];
LABEL_44:
  v44 = (void *)v59;
LABEL_22:

  return v44;
}

+ (id)centerProducingArcBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 FromStartLocation:(id)a5 endLocation:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  CLLocationCoordinate2D v11 = v10;
  if (a3 <= 0.0)
  {
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    __int16 v33 = 0;
    id v26 = "Invalid parameter not satisfying: lowerDistanceBound > 0";
    double v27 = (uint8_t *)&v33;
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_18;
  }
  if (a4 <= a3)
  {
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    __int16 v32 = 0;
    id v26 = "Invalid parameter not satisfying: upperDistanceBound > lowerDistanceBound";
    double v27 = (uint8_t *)&v32;
    goto LABEL_17;
  }
  if (!v9)
  {
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    __int16 v31 = 0;
    id v26 = "Invalid parameter not satisfying: startLocation";
    double v27 = (uint8_t *)&v31;
    goto LABEL_17;
  }
  if (!v10)
  {
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    __int16 v30 = 0;
    id v26 = "Invalid parameter not satisfying: endLocation";
    double v27 = (uint8_t *)&v30;
    goto LABEL_17;
  }
  [v9 distanceFromLocation:v10];
  if (v12 < a3)
  {
    id v13 = objc_opt_class();
    [v9 coordinate];
    double v15 = v14;
    double v17 = v16;
    [v11 coordinate];
    [v13 averageCoordinateOfCoordinate1:v15 coordinate2:v17];
    double v22 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v20 longitude:v21];
    [(id)objc_opt_class() anglePerpendicularToLineBetweenLocation1:v9 location2:v11];
    double v24 = [(id)objc_opt_class() centerProducingArcBetweenLowerDistanceBound:v9 upperDistanceBound:v11 fromStartLocation:v22 endLocation:a3 examiningLatLongDisplacement:a4 fromIntersectingLocation:0.0 atAngle:v23];

    goto LABEL_19;
  }
  double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    __int16 v29 = 0;
    id v26 = "Invalid parameter not satisfying: lowerDistanceBound > distance";
    double v27 = (uint8_t *)&v29;
    goto LABEL_17;
  }
LABEL_18:

  double v24 = 0;
LABEL_19:

  return v24;
}

+ (id)necessaryCenterOfArcBetweenStartLocation:(id)a3 endLocation:(id)a4 minimumSpeed:(double)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    LOWORD(v21) = 0;
    double v19 = "Invalid parameter not satisfying: startLocation";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 2u);
    goto LABEL_17;
  }
  if (!v8)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    LOWORD(v21) = 0;
    double v19 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_16;
  }
  if (a5 <= 0.0)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      double v19 = "Invalid parameter not satisfying: minimumSpeed > 0";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  [v8 distanceFromLocation:v7];
  double v11 = v10;
  double v12 = [v9 timestamp];
  id v13 = [v7 timestamp];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 <= 0.0)
  {
    double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315394;
      double v22 = "+[RTSignalGenerator necessaryCenterOfArcBetweenStartLocation:endLocation:minimumSpeed:]";
      __int16 v23 = 1024;
      int v24 = 408;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "endLocation must be strictly after startLocaton (in %s:%d)", (uint8_t *)&v21, 0x12u);
    }
  }
  if (v11 / v15 < a5)
  {
    double v17 = [(id)objc_opt_class() centerProducingArcBetweenLowerDistanceBound:v7 upperDistanceBound:v9 FromStartLocation:v15 * a5 endLocation:a5 * 1.3 * v15];
    goto LABEL_19;
  }
LABEL_18:
  double v17 = 0;
LABEL_19:

  return v17;
}

- (id)addGeneratedLocation:(id)a3 forceInject:(BOOL)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 coordinate];
  [v6 coordinate];
  RTCommonIsCoordinateValid();
  if (v7 == 0.0)
  {
    __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonIsCoordinateValid(location.coordinate.latitude, location.coordinate.longitude)", buf, 2u);
    }

    id v31 = 0;
  }
  else
  {
    *(void *)buf = 0;
    double v45 = buf;
    uint64_t v46 = 0x3032000000;
    double v47 = __Block_byref_object_copy__130;
    v48 = __Block_byref_object_dispose__130;
    id v49 = 0;
    if (v6) {
      [(NSMutableArray *)self->_generatedLocations addObject:v6];
    }
    if (a4 || [(NSMutableArray *)self->_generatedLocations count] == 625)
    {
      id v8 = (id *)(v45 + 40);
      id obj = (id)*((void *)v45 + 5);
      unint64_t v9 = [(RTSignalGenerator *)self locationCountInStoreWithError:&obj];
      objc_storeStrong(v8, obj);
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      locationManager = self->_locationManager;
      generatedLocations = self->_generatedLocations;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __54__RTSignalGenerator_addGeneratedLocation_forceInject___block_invoke;
      v40[3] = &unk_1E6B90728;
      id v42 = buf;
      id v13 = v10;
      double v41 = v13;
      [(RTLocationManager *)locationManager injectLocations:generatedLocations handler:v40];
      double v14 = v13;
      double v15 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v16 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v14, v16)) {
        goto LABEL_14;
      }
      double v38 = [MEMORY[0x1E4F1C9C8] now];
      [v38 timeIntervalSinceDate:v15];
      double v18 = v17;
      double v19 = objc_opt_new();
      double v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_100];
      int v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v22 = [v21 filteredArrayUsingPredicate:v20];
      __int16 v23 = [v22 firstObject];

      [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
      int v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v51 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
      }

      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      *(void *)v51 = @"semaphore wait timeout";
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
      double v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

      if (v27)
      {
        id v28 = v27;

        int v29 = 0;
      }
      else
      {
LABEL_14:
        id v28 = 0;
        int v29 = 1;
      }

      id v32 = v28;
      if (!v29) {
        objc_storeStrong((id *)v45 + 5, v28);
      }
      uint64_t v33 = -10;
      do
      {
        double v34 = (id *)(v45 + 40);
        id v39 = (id)*((void *)v45 + 5);
        unint64_t v35 = [(RTSignalGenerator *)self locationCountInStoreWithError:&v39];
        objc_storeStrong(v34, v39);
        usleep(0x2710u);
        BOOL v36 = __CFADD__(v33++, 1);
      }
      while (!v36 && v35 < [(NSMutableArray *)self->_generatedLocations count] + v9);
      [(NSMutableArray *)self->_generatedLocations removeAllObjects];
    }
    id v31 = *((id *)v45 + 5);
    _Block_object_dispose(buf, 8);
  }

  return v31;
}

void __54__RTSignalGenerator_addGeneratedLocation_forceInject___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)transitionLocationsBetweenStartLocation:(id)a3 endLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      double v12 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v13 = "Invalid parameter not satisfying: startLocation";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    id v13 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_14;
  }
  [(id)objc_opt_class() minSpeedToFilterHyperParameter];
  uint64_t v10 = [(id)objc_opt_class() necessaryCenterOfArcBetweenStartLocation:v6 endLocation:v8 minimumSpeed:v9 * 1.5];
  if (v10)
  {
    double v11 = v10;
    double v12 = [(RTSignalGenerator *)self transitionLocationsAlongArcBetweenStartLocation:v6 endLocation:v8 forCenterLocation:v10];
  }
  else
  {
    double v15 = [v8 timestamp];
    dispatch_time_t v16 = [v6 timestamp];
    [v15 timeIntervalSinceDate:v16];
    double v18 = v17;

    double v19 = v18 / 60.0;
    [v8 coordinate];
    double v21 = v20;
    [v6 coordinate];
    double v23 = (double)(unint64_t)v19;
    double v24 = (v21 - v22) / v23;
    [v8 coordinate];
    double v26 = v25;
    [v6 coordinate];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __73__RTSignalGenerator_transitionLocationsBetweenStartLocation_endLocation___block_invoke;
    v29[3] = &__block_descriptor_48_e63__CLLocationCoordinate2D_dd_32__0_CLLocationCoordinate2D_dd_8Q24l;
    *(double *)&v29[4] = v24;
    *(double *)&v29[5] = (v26 - v27) / v23;
    id v28 = (void *)MEMORY[0x1E016DB00](v29);
    double v12 = [(RTSignalGenerator *)self transitionLocationsBetweenStartLocation:v6 endLocation:v8 coordinateCalculationBlock:v28];

    double v11 = 0;
  }
LABEL_9:

  return v12;
}

double __73__RTSignalGenerator_transitionLocationsBetweenStartLocation_endLocation___block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  *(void *)&double result = *(_OWORD *)&CLLocationCoordinate2DMake(a3 + (double)a2 * *(double *)(a1 + 32), a4 + (double)a2 * *(double *)(a1 + 40));
  return result;
}

- (id)transitionLocationsAlongArcBetweenStartLocation:(id)a3 endLocation:(id)a4 forCenterLocation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v9 timestamp];
  double v12 = [v10 timestamp];
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  double v15 = v14 / 60.0;
  dispatch_time_t v16 = objc_opt_class();
  [v8 coordinate];
  double v18 = v17;
  double v20 = v19;
  [v10 coordinate];
  [v16 angleOfLineBetweenCoordinate1:v18 coordinate2:v20];
  double v24 = v23;
  double v25 = objc_opt_class();
  [v8 coordinate];
  double v27 = v26;
  double v29 = v28;
  [v9 coordinate];
  [v25 angleOfLineBetweenCoordinate1:v27 coordinate2:v29];
  [(id)objc_opt_class() angleSweptFromStartAngle:v24 ToEndAngle:v32];
  double v34 = v33 / (double)(unint64_t)v15;
  unint64_t v35 = objc_opt_class();
  [v10 coordinate];
  double v37 = v36;
  double v39 = v38;
  [v8 coordinate];
  [v35 latLongDisplacementBetweenCoordinate1:v37 coordinate2:v39];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __99__RTSignalGenerator_transitionLocationsAlongArcBetweenStartLocation_endLocation_forCenterLocation___block_invoke;
  v47[3] = &unk_1E6B9AD50;
  v47[4] = self;
  id v48 = v8;
  uint64_t v49 = v42;
  double v50 = v24;
  double v51 = v34;
  id v43 = v8;
  v44 = (void *)MEMORY[0x1E016DB00](v47);
  double v45 = [(RTSignalGenerator *)self transitionLocationsBetweenStartLocation:v10 endLocation:v9 coordinateCalculationBlock:v44];

  return v45;
}

uint64_t __99__RTSignalGenerator_transitionLocationsAlongArcBetweenStartLocation_endLocation_forCenterLocation___block_invoke(uint64_t a1, unint64_t a2)
{
  id v4 = objc_opt_class();
  double v5 = *(double *)(a1 + 48);
  [*(id *)(a1 + 40) coordinate];
  double v8 = *(double *)(a1 + 56) + (double)a2 * *(double *)(a1 + 64);

  return [v4 coordinateAtDisplacement:v5 fromCenterCoordinate:v6 atAngle:v7];
}

- (id)transitionLocationsBetweenStartLocation:(id)a3 endLocation:(id)a4 coordinateCalculationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (double (**)(id, uint64_t, double, double))a5;
  if (!v8)
  {
    double v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      double v25 = 0;
      goto LABEL_13;
    }
    __int16 v36 = 0;
    double v30 = "Invalid parameter not satisfying: startLocation";
    double v31 = (uint8_t *)&v36;
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_10;
  }
  if (!v9)
  {
    double v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    double v30 = "Invalid parameter not satisfying: endLocation";
    double v31 = buf;
    goto LABEL_17;
  }
  [v8 coordinate];
  CLLocationDegrees v12 = v11;
  [v8 coordinate];
  CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v12, v13);
  double v15 = [v8 timestamp];
  dispatch_time_t v16 = [v15 dateByAddingTimeInterval:60.0];

  id v34 = v8;
  id v17 = v8;
  uint64_t v18 = 1;
  while (1)
  {
    double v19 = v10[2](v10, v18, v14.latitude, v14.longitude);
    double v21 = v20;
    double v22 = [[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithCoordinate:v16 altitude:v19 horizontalAccuracy:v20 verticalAccuracy:0.0 course:10.0 speed:10.0 timestamp:0.0];
    [v22 distanceFromLocation:v17];
    double v24 = [[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithCoordinate:v16 altitude:v19 horizontalAccuracy:v21 verticalAccuracy:0.0 course:10.0 speed:10.0 timestamp:v23 / 60.0];
    double v25 = [(RTSignalGenerator *)self addGeneratedLocation:v24 forceInject:0];

    ++self->_totalTransitionLocationsGeneratedCount;
    if (v25) {
      break;
    }

    ++v18;
    double v26 = [v16 dateByAddingTimeInterval:60.0];

    double v27 = [v9 timestamp];
    char v28 = [v26 isBeforeDate:v27];

    dispatch_time_t v16 = v26;
    id v17 = v22;
    if ((v28 & 1) == 0) {
      goto LABEL_12;
    }
  }
  id v32 = v25;

  double v22 = v17;
  double v26 = v16;
LABEL_12:

  id v8 = v34;
LABEL_13:

  return v25;
}

- (id)locationsForVisit:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    double v5 = [v3 exit];
    double v6 = [v4 entry];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7 / 100.0;

    if (v8 < 30.0) {
      double v8 = 30.0;
    }
    double v47 = [v4 entry];
    while (1)
    {
      id v9 = [v4 location];
      [v9 horizontalUncertainty];
      double v11 = (double)arc4random_uniform((v10 * 0.5));
      double v12 = v11 * 0.000009;

      if ((arc4random() & 1) == 0) {
        double v12 = -(v11 * 0.000009);
      }
      id v13 = objc_alloc(MEMORY[0x1E4F5CE00]);
      uint64_t v46 = [v4 location];
      [v46 latitude];
      double v15 = v12 + v14;
      dispatch_time_t v16 = [v4 location];
      [v16 longitude];
      double v18 = v12 + v17;
      double v19 = [v4 location];
      [v19 horizontalUncertainty];
      double v21 = v20;
      double v22 = [v4 location];
      [v22 altitude];
      double v24 = v23;
      double v25 = [v4 location];
      [v25 verticalUncertainty];
      double v27 = v26;
      char v28 = [v4 location];
      uint64_t v29 = [v28 referenceFrame];
      double v30 = [v4 location];
      [v30 speed];
      double v32 = v31;
      double v33 = [v4 location];
      id v34 = [v13 initWithLatitude:v47 longitude:v29 horizontalUncertainty:objc_msgSend(v33, "sourceAccuracy") altitude:v15 verticalUncertainty:v18 date:v21 referenceFrame:v24 speed:v27 sourceAccuracy:v32];

      unint64_t v35 = [v4 location];
      BOOL v36 = [v35 sourceAccuracy] == 2;

      double v37 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTLocation:v34 speed:v36 type:0.0];
      double v38 = [(RTSignalGenerator *)self addGeneratedLocation:v37 forceInject:0];

      ++self->_totalVisitLocationsGeneratedCount;
      if (v38) {
        break;
      }
      double v39 = [v47 dateByAddingTimeInterval:v8];

      double v40 = [v4 exit];
      char v41 = [v39 isOnOrBefore:v40];

      double v47 = v39;
      if ((v41 & 1) == 0) {
        goto LABEL_14;
      }
    }
    id v43 = v38;

    double v39 = v47;
LABEL_14:
  }
  else
  {
    uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    double v38 = 0;
  }

  return v38;
}

+ (void)injectSignalForSignalGeneratorOptions:(id)a3 locationManager:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    double v10 = [[RTSignalGenerator alloc] initWithSignalGeneratorOptions:v7 locationManager:v8];
    double v11 = [(RTSignalGenerator *)v10 generateLocations];
    v9[2](v9, v11);
  }
  else
  {
    double v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v13, 2u);
    }
  }
}

- (id)generateLocations
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  id v4 = [(RTSignalGeneratorOptions *)self->_signalGeneratorOptions startLocation];
  [(id)objc_opt_class() minSpeedToFilterHyperParameter];
  double v6 = (void *)[v3 initWithRTLocation:v4 speed:v5 * 1.5];

  id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  id v8 = [(RTSignalGeneratorOptions *)self->_signalGeneratorOptions endLocation];
  [(id)objc_opt_class() minSpeedToFilterHyperParameter];
  double v10 = (void *)[v7 initWithRTLocation:v8 speed:v9 * 1.5];

  double v11 = [(RTSignalGeneratorOptions *)self->_signalGeneratorOptions expectedVisits];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v87 = "-[RTSignalGenerator generateLocations]";
      __int16 v88 = 1024;
      LODWORD(v89) = 625;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _signalGeneratorOptions.expectedVisits.count (in %s:%d)", buf, 0x12u);
    }
  }
  id v14 = v6;
  double v15 = [(RTSignalGenerator *)self addGeneratedLocation:v14 forceInject:0];
  ++self->_totalTransitionLocationsGeneratedCount;
  if (v15)
  {
    id v16 = v15;
    double v17 = v14;
  }
  else
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    double v18 = [(RTSignalGeneratorOptions *)self->_signalGeneratorOptions expectedVisits];
    uint64_t v19 = (uint64_t)v14;
    uint64_t v78 = [v18 countByEnumeratingWithState:&v82 objects:v90 count:16];
    if (v78)
    {
      v76 = v18;
      v77 = self;
      double v20 = 0;
      v74 = v10;
      uint64_t v75 = *(void *)v83;
      id v73 = v14;
      uint64_t v19 = (uint64_t)v14;
      double v21 = self;
      while (2)
      {
        uint64_t v22 = 0;
        double v23 = v20;
        v81 = (void *)v19;
        do
        {
          if (*(void *)v83 != v75) {
            objc_enumerationMutation(v18);
          }
          double v24 = *(void **)(*((void *)&v82 + 1) + 8 * v22);
          id v25 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          v79 = [v24 location];
          [v79 latitude];
          CLLocationDegrees v27 = v26;
          char v28 = [v24 location];
          [v28 longitude];
          CLLocationCoordinate2D v30 = CLLocationCoordinate2DMake(v27, v29);
          double v31 = [v24 location];
          [v31 altitude];
          double v33 = v32;
          id v34 = [v24 location];
          [v34 horizontalUncertainty];
          double v36 = v35;
          double v37 = [v24 location];
          [v37 verticalUncertainty];
          double v39 = v38;
          [(id)objc_opt_class() minSpeedToFilterHyperParameter];
          double v41 = v40 * 1.5;
          uint64_t v42 = [v24 entry];
          id v43 = [v25 initWithCoordinate:v42 altitude:v30.latitude horizontalAccuracy:v30.longitude verticalAccuracy:v33 course:v36 speed:v39 timestamp:0.0];

          v80 = v43;
          v44 = [(RTSignalGenerator *)v21 transitionLocationsBetweenStartLocation:v81 endLocation:v43];
          if (v44
            || ([(RTSignalGenerator *)v21 locationsForVisit:v24],
                (v44 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v16 = v44;

            id v14 = v73;
            double v10 = v74;
            double v17 = v81;
            goto LABEL_24;
          }
          id v45 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          uint64_t v46 = [v24 location];
          [v46 latitude];
          CLLocationDegrees v48 = v47;
          uint64_t v49 = [v24 location];
          [v49 longitude];
          CLLocationCoordinate2D v51 = CLLocationCoordinate2DMake(v48, v50);
          uint64_t v52 = [v24 location];
          [v52 altitude];
          double v54 = v53;
          double v55 = [v24 location];
          [v55 horizontalUncertainty];
          double v57 = v56;
          v58 = [v24 location];
          [v58 verticalUncertainty];
          double v60 = v59;
          [(id)objc_opt_class() minSpeedToFilterHyperParameter];
          double v62 = v61 * 1.5;
          __int16 v63 = [v24 exit];
          uint64_t v19 = [v45 initWithCoordinate:v63 altitude:v51.latitude horizontalAccuracy:v51.longitude verticalAccuracy:v54 course:v57 speed:v60 timestamp:0.0];

          ++v22;
          double v20 = v80;
          double v23 = v80;
          v81 = (void *)v19;
          double v18 = v76;
        }
        while (v78 != v22);
        uint64_t v78 = [v76 countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (v78) {
          continue;
        }
        break;
      }

      id v14 = v73;
      double v10 = v74;
      self = v77;
    }

    id v64 = v10;
    uint64_t v65 = (void *)v19;
    uint64_t v66 = [(RTSignalGenerator *)self transitionLocationsBetweenStartLocation:v19 endLocation:v64];
    if (v66)
    {
      id v67 = v66;
    }
    else
    {
      v68 = [(RTSignalGenerator *)self addGeneratedLocation:v64 forceInject:1];
      ++self->_totalTransitionLocationsGeneratedCount;
      v69 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        unint64_t totalVisitLocationsGeneratedCount = self->_totalVisitLocationsGeneratedCount;
        unint64_t totalTransitionLocationsGeneratedCount = self->_totalTransitionLocationsGeneratedCount;
        *(_DWORD *)buf = 134218240;
        v87 = (const char *)totalVisitLocationsGeneratedCount;
        __int16 v88 = 2048;
        unint64_t v89 = totalTransitionLocationsGeneratedCount;
        _os_log_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_INFO, "RTSignalGenerator Produced %lu visit locations && %lu transition locations", buf, 0x16u);
      }

      id v67 = v68;
    }
    id v16 = v67;

    double v17 = v65;
  }
LABEL_24:

  return v16;
}

- (NSMutableArray)generatedLocations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGeneratedLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedLocations, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_signalGeneratorOptions, 0);
}

@end