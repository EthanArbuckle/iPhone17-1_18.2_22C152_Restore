@interface RTTripSegmentProvider
+ (BOOL)isLocationTypeSupported:(int)a3;
+ (BOOL)isTripSegmentGenerationSupportedOnPlatform:(id)a3;
+ (id)convertToTripSegmentLocations:(id)a3;
+ (int64_t)CLTripModeFromRTModeOfTransportation:(int64_t)a3;
- (BOOL)allowReprocessingOfTransitionsWithTripSegments;
- (BOOL)applyElevationAdjustmentToBreadcrumbs;
- (BOOL)isTripSegmentGenerationEnabled;
- (BOOL)sessionInProgress;
- (BOOL)usingLegacyInertialData;
- (CLLocation)transitionStartLocation;
- (CLLocation)transitionStopLocation;
- (CLTripSegmentProcessorManager)tripProcessorManager;
- (CLTripSegmentProcessorOptions)tripProcessorOptions;
- (NSMutableArray)transitionLocations;
- (OS_dispatch_queue)queue;
- (RTBackgroundInertialOdometryManager)inertialOdometryManager;
- (RTDefaultsManager)defaultsManager;
- (RTElevationAdjuster)elevationAdjuster;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTTripSegmentInertialDataManager)inertialDataManager;
- (RTTripSegmentManager)tripSegmentManager;
- (RTTripSegmentProvider)init;
- (RTTripSegmentProvider)initWithLearnedLocationManager:(id)a3 locationManager:(id)a4 motionActivityManager:(id)a5 tripSegmentInertialDataManager:(id)a6 inertialOdometryManager:(id)a7 vehicleStore:(id)a8 tripSegmentManager:(id)a9 elevationAdjuster:(id)a10 distanceCalculator:(id)a11 defaultsManager:(id)a12 visitManager:(id)a13;
- (RTTripSegmentTransitionPreprocessor)transitionPreprocessor;
- (RTVehicleStore)vehicleStore;
- (double)getProcessingChunkWidthSeconds;
- (double)processingChunkWidthSeconds;
- (id)buildTinySegmentArrayForTransitionWithIndex:(unint64_t)a3 withinDateInterval:(id)a4 fromActivity:(id)a5 uuidType:(int64_t)a6;
- (id)collectVehicleConnectionTimeIntervals:(id)a3;
- (id)getTransitionlocations;
- (id)trimTimeOfTripSegment:(id)a3 dateInterval:(id)a4 uuidType:(int64_t)a5;
- (void)_startReconstructTripSegmentWithTrainMode:(unint64_t)a3;
- (void)addToTransitionLocationsBuffer:(id)a3 forDateInterval:(id)a4;
- (void)addTripSegmentFeaturesItem:(id)a3 intoList:(id)a4 overlapDateInterval:(id)a5 uuidType:(int64_t)a6;
- (void)buildTripSegmentsForOneLearnedTransitionWithIndex:(unint64_t)a3 inTransitions:(id)a4 trainMode:(unint64_t)a5;
- (void)prepareTripProcessorOptions;
- (void)processChunkWithIndex:(unint64_t)a3 inChunks:(id)a4;
- (void)setDefaultsManager:(id)a3;
- (void)setElevationAdjuster:(id)a3;
- (void)setInertialDataManager:(id)a3;
- (void)setInertialOdometryManager:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setProcessingChunkWidthSeconds:(double)a3;
- (void)setQueue:(id)a3;
- (void)setSessionInProgress:(BOOL)a3;
- (void)setTransitionLocations:(id)a3;
- (void)setTransitionPreprocessor:(id)a3;
- (void)setTransitionStartLocation:(id)a3;
- (void)setTransitionStopLocation:(id)a3;
- (void)setTripProcessorManager:(id)a3;
- (void)setTripProcessorOptions:(id)a3;
- (void)setTripSegmentManager:(id)a3;
- (void)setUsingLegacyInertialData:(BOOL)a3;
- (void)setVehicleStore:(id)a3;
- (void)startReconstructTripSegmentWithTrainMode:(unint64_t)a3;
@end

@implementation RTTripSegmentProvider

- (RTTripSegmentProvider)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLearnedLocationManager_locationManager_motionActivityManager_tripSegmentInertialDataManager_inertialOdometryManager_vehicleStore_tripSegmentManager_elevationAdjuster_distanceCalculator_defaultsManager_visitManager_);
}

- (RTTripSegmentProvider)initWithLearnedLocationManager:(id)a3 locationManager:(id)a4 motionActivityManager:(id)a5 tripSegmentInertialDataManager:(id)a6 inertialOdometryManager:(id)a7 vehicleStore:(id)a8 tripSegmentManager:(id)a9 elevationAdjuster:(id)a10 distanceCalculator:(id)a11 defaultsManager:(id)a12 visitManager:(id)a13
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v61 = a4;
  id v19 = a4;
  id v62 = a5;
  id v20 = a5;
  id obj = a6;
  id v64 = a6;
  id v59 = a7;
  id v21 = a7;
  id v63 = a8;
  id v22 = a8;
  id v65 = a9;
  id v68 = a10;
  id v23 = v18;
  id v24 = a11;
  id v71 = a12;
  v66 = v23;
  id v67 = a13;
  if (v23)
  {
    v25 = v19;
    if (v19)
    {
      v26 = v24;
      if (v20)
      {
        v27 = v64;
        v28 = v22;
        if (v64)
        {
          v29 = v65;
          if (v21)
          {
            v30 = v68;
            if (v28)
            {
              if (v65)
              {
                if (v68)
                {
                  if (v24)
                  {
                    if (v71)
                    {
                      v72.receiver = self;
                      v72.super_class = (Class)RTTripSegmentProvider;
                      v31 = [(RTTripSegmentProvider *)&v72 init];
                      if (v31)
                      {
                        v70 = v31;
                        v32 = v31;
                        attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v33 = (const char *)[(RTTripSegmentProvider *)v32 UTF8String];
                        }
                        else
                        {
                          id v55 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v32];
                          uint64_t v42 = [v55 UTF8String];

                          v33 = (const char *)v42;
                        }
                        dispatch_queue_t v56 = dispatch_queue_create(v33, attr);

                        queue = v32->_queue;
                        v32->_queue = (OS_dispatch_queue *)v56;

                        objc_storeStrong((id *)&v32->_inertialDataManager, obj);
                        objc_storeStrong((id *)&v32->_inertialOdometryManager, v59);
                        objc_storeStrong((id *)&v32->_learnedLocationManager, a3);
                        objc_storeStrong((id *)&v32->_locationManager, v61);
                        objc_storeStrong((id *)&v32->_motionActivityManager, v62);
                        objc_storeStrong((id *)&v32->_vehicleStore, v63);
                        objc_storeStrong((id *)&v32->_tripSegmentManager, a9);
                        v44 = (CLTripSegmentProcessorManager *)objc_alloc_init(MEMORY[0x1E4F1E678]);
                        tripProcessorManager = v32->_tripProcessorManager;
                        v32->_tripProcessorManager = v44;

                        v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        transitionLocations = v32->_transitionLocations;
                        v32->_transitionLocations = v46;

                        objc_storeStrong((id *)&v32->_elevationAdjuster, a10);
                        objc_storeStrong((id *)&v32->_defaultsManager, a12);
                        [(RTTripSegmentProvider *)v32 getProcessingChunkWidthSeconds];
                        v32->_double processingChunkWidthSeconds = v48;
                        v49 = [[RTTripSegmentTransitionPreprocessor alloc] initWithMotionActivityManager:v20 locationManager:v25 learnedLocationManager:v66 vehicleStore:v28 distanceCalculator:v24 visitManager:v67 elevationAdjuster:v68 defaultsManager:v71];
                        transitionPreprocessor = v32->_transitionPreprocessor;
                        v32->_transitionPreprocessor = v49;

                        v32->_sessionInProgress = 0;
                        [(RTTripSegmentProvider *)v32 prepareTripProcessorOptions];
                        v32->_usingLegacyInertialData = 1;
                        v51 = [(RTTripSegmentProvider *)v32 defaultsManager];
                        v52 = [v51 objectForKey:@"RTDefaultsTripSegmentUseInertialOdometrySamples"];

                        if (v52) {
                          v32->_usingLegacyInertialData = [v52 BOOLValue] ^ 1;
                        }
                        v53 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                        {
                          double processingChunkWidthSeconds = v32->_processingChunkWidthSeconds;
                          *(_DWORD *)buf = 134217984;
                          double v74 = processingChunkWidthSeconds;
                          _os_log_debug_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider successfully initialized with the trip segment reconstruction length of %.1lf seconds.", buf, 0xCu);
                        }

                        v30 = v68;
                        v31 = v70;
                        v26 = v24;
                      }
                      v35 = v31;
                      self = v35;
                      goto LABEL_42;
                    }
                    v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v40 = "Invalid parameter not satisfying: defaultsManager";
                      goto LABEL_40;
                    }
LABEL_41:

                    v35 = 0;
                    goto LABEL_42;
                  }
                  v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_41;
                  }
                  *(_WORD *)buf = 0;
                  v40 = "Invalid parameter not satisfying: distanceCalculator";
                }
                else
                {
                  v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_41;
                  }
                  *(_WORD *)buf = 0;
                  v40 = "Invalid parameter not satisfying: elevationAdjuster";
                }
              }
              else
              {
                v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_41;
                }
                *(_WORD *)buf = 0;
                v40 = "Invalid parameter not satisfying: tripSegmentManager";
              }
            }
            else
            {
              v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                goto LABEL_41;
              }
              *(_WORD *)buf = 0;
              v40 = "Invalid parameter not satisfying: vehicleStore";
            }
          }
          else
          {
            v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v30 = v68;
            if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              goto LABEL_41;
            }
            *(_WORD *)buf = 0;
            v40 = "Invalid parameter not satisfying: inertialOdometryManager";
          }
LABEL_40:
          _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
          goto LABEL_41;
        }
        v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v29 = v65;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tripSegmentInertialDatamanager", buf, 2u);
        }

        v35 = 0;
LABEL_24:
        v30 = v68;
        goto LABEL_42;
      }
      v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v27 = v64;
      v28 = v22;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionActivityManager", buf, 2u);
      }

      v35 = 0;
    }
    else
    {
      v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = v24;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
      }

      v35 = 0;
      v27 = v64;
      v28 = v22;
    }
    v29 = v65;
    goto LABEL_24;
  }
  v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager", buf, 2u);
  }

  v35 = 0;
  v25 = v19;
  v28 = v22;
  v27 = v64;
  v29 = v65;
  v30 = v68;
  v26 = v24;
LABEL_42:

  return v35;
}

+ (int64_t)CLTripModeFromRTModeOfTransportation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1DA1009E0[a3 - 1];
  }
}

- (id)trimTimeOfTripSegment:(id)a3 dateInterval:(id)a4 uuidType:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = +[RTTripSegmentManager uuidForTripSegmentOfType:a5];
  v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v26 = [v9 UUIDString];
    int v27 = 134218242;
    int64_t v28 = a5;
    __int16 v29 = 2112;
    v30 = v26;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:trimTimeOfTripSegment, uuidType, %lu, UUID, %@", (uint8_t *)&v27, 0x16u);
  }
  [v8 setTripId:v9];
  v11 = [v8 dateInterval];
  v12 = [v11 startDate];
  v13 = [v7 startDate];
  v14 = [v12 laterDate:v13];

  v15 = [v8 dateInterval];
  v16 = [v15 endDate];
  v17 = [v7 endDate];

  id v18 = [v16 earlierDate:v17];

  id v19 = [RTTripSegmentFeatures alloc];
  uint64_t v20 = [v8 transitionIndex];
  id v21 = [v8 tripId];
  uint64_t v22 = [v8 mode];

  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v18];
  id v24 = [(RTTripSegmentFeatures *)v19 initWithTransitionIndex:v20 tripId:v21 mode:v22 dateInterval:v23];

  return v24;
}

- (void)addTripSegmentFeaturesItem:(id)a3 intoList:(id)a4 overlapDateInterval:(id)a5 uuidType:(int64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:]";
      __int16 v35 = 1024;
      int v36 = 251;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: itemToBeAdded (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_12:
      v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:]";
        __int16 v35 = 1024;
        int v36 = 253;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: overlapDateInterval (in %s:%d)", buf, 0x12u);
      }

      if (!v10) {
        goto LABEL_21;
      }
      goto LABEL_15;
    }
  }
  v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:]";
    __int16 v35 = 1024;
    int v36 = 252;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: targetList (in %s:%d)", buf, 0x12u);
  }

  if (!v12) {
    goto LABEL_12;
  }
LABEL_4:
  if (!v10) {
    goto LABEL_21;
  }
LABEL_15:
  v16 = [v10 dateInterval];
  v17 = [v16 startDate];
  id v18 = [v12 endDate];
  if (([v17 isBeforeDate:v18] & 1) == 0)
  {

LABEL_20:
    goto LABEL_21;
  }
  id v19 = [v10 dateInterval];
  uint64_t v20 = [v19 endDate];
  [v12 startDate];
  id v32 = v10;
  id v21 = v12;
  uint64_t v22 = self;
  id v23 = v11;
  v25 = int64_t v24 = a6;
  int v31 = [v20 isAfterDate:v25];

  int64_t v26 = v24;
  id v11 = v23;
  int v27 = v22;
  id v12 = v21;
  id v10 = v32;

  if (v31)
  {
    v16 = [(RTTripSegmentProvider *)v27 trimTimeOfTripSegment:v32 dateInterval:v12 uuidType:v26];
    int64_t v28 = [v16 dateInterval];
    [v28 duration];
    double v30 = v29;

    if (v30 > 5.0) {
      [v11 addObject:v16];
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (double)getProcessingChunkWidthSeconds
{
  uint64_t v2 = [(RTTripSegmentProvider *)self defaultsManager];
  v3 = [v2 objectForKey:@"RTDefaultsTripSegmentProcessingChunkWidth"];

  if (v3)
  {
    [v3 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 900.0;
  }

  return v5;
}

- (BOOL)allowReprocessingOfTransitionsWithTripSegments
{
  uint64_t v2 = [(RTTripSegmentProvider *)self defaultsManager];
  v3 = [v2 objectForKey:@"RTDefaultsTripSegmentAllowReprocessTransitions"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)prepareTripProcessorOptions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(RTTripSegmentProvider *)self defaultsManager];
  char v4 = [v3 objectForKey:@"RTDefaultsTripProcessorOptionRunLinearInterpolator"];

  if (v4) {
    uint64_t v5 = [v4 BOOLValue];
  }
  else {
    uint64_t v5 = 1;
  }
  v6 = [(RTTripSegmentProvider *)self defaultsManager];
  id v7 = [v6 objectForKey:@"RTDefaultsTripProcessorOptionRunInertialIntegrator"];

  if (v7) {
    uint64_t v8 = [v7 BOOLValue];
  }
  else {
    uint64_t v8 = 1;
  }
  id v21 = v4;
  v9 = [(RTTripSegmentProvider *)self defaultsManager];
  id v10 = [v9 objectForKey:@"RTDefaultsTripProcessorOptionRunMapIntegrator"];

  if (v10) {
    uint64_t v11 = [v10 BOOLValue];
  }
  else {
    uint64_t v11 = 1;
  }
  id v12 = [(RTTripSegmentProvider *)self defaultsManager];
  v13 = [v12 objectForKey:@"RTDefaultsTripProcessorOptionUseXPCServiceForMapQuery"];

  if (v13) {
    uint64_t v14 = [v13 BOOLValue];
  }
  else {
    uint64_t v14 = 1;
  }
  v15 = [(RTTripSegmentProvider *)self defaultsManager];
  v16 = [v15 objectForKey:@"RTDefaultsTripProcessorOptionRecordForReplay"];

  if (v16) {
    uint64_t v17 = [v16 BOOLValue];
  }
  else {
    uint64_t v17 = 1;
  }
  id v18 = (CLTripSegmentProcessorOptions *)objc_alloc_init(MEMORY[0x1E4F1E680]);
  tripProcessorOptions = self->_tripProcessorOptions;
  self->_tripProcessorOptions = v18;

  [(CLTripSegmentProcessorOptions *)self->_tripProcessorOptions setRunLinearInterpolator:v5];
  [(CLTripSegmentProcessorOptions *)self->_tripProcessorOptions setRunInertialIntegrator:v8];
  [(CLTripSegmentProcessorOptions *)self->_tripProcessorOptions setRunMapIntegrator:v11];
  [(CLTripSegmentProcessorOptions *)self->_tripProcessorOptions setUseXPCService:v14];
  [(CLTripSegmentProcessorOptions *)self->_tripProcessorOptions setshouldRecordDataInFileForReplay:v17];
  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110144;
    int v23 = v5;
    __int16 v24 = 1024;
    int v25 = v8;
    __int16 v26 = 1024;
    int v27 = v11;
    __int16 v28 = 1024;
    int v29 = v14;
    __int16 v30 = 1024;
    int v31 = v17;
    _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:prepareTripProcessorOptions: setRunLinearInterpolator,%d,setRunInertialIntegrator,%d,setRunMapIntegrator,%d,setUseXPCService,%d,setshouldRecordDataInFileForReplay,%d.", buf, 0x20u);
  }
}

- (void)_startReconstructTripSegmentWithTrainMode:(unint64_t)a3
{
  v100[1] = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v95) = 134217984;
    *(void *)((char *)&v95 + 4) = a3;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:_startReconstructTripSegmentWithTrainMode, mode, %lu", (uint8_t *)&v95, 0xCu);
  }

  [(RTTripSegmentProvider *)self prepareTripProcessorOptions];
  *(void *)&long long v95 = 0;
  *((void *)&v95 + 1) = &v95;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__175;
  v98 = __Block_byref_object_dispose__175;
  id v99 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__175;
  v88 = __Block_byref_object_dispose__175;
  id v89 = [MEMORY[0x1E4F1C978] array];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [(RTTripSegmentProvider *)self learnedLocationManager];
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-691200.0];
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke;
  v80[3] = &unk_1E6B905F0;
  v82 = &v95;
  v83 = &v84;
  uint64_t v8 = v4;
  v81 = v8;
  [v5 fetchTransitionsBetweenStartDate:v6 endDate:v7 handler:v80];

  dsema = v8;
  v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v10)) {
    goto LABEL_8;
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  uint64_t v14 = objc_opt_new();
  v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
  v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v17 = [v16 filteredArrayUsingPredicate:v15];
  id v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  *(void *)v90 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v90 count:1];
  uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;
  }
  else
  {
LABEL_8:
    id v23 = 0;
  }

  id v75 = v23;
  if (v75 || *(void *)(*((void *)&v95 + 1) + 40))
  {
    __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = *(void *)(*((void *)&v95 + 1) + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v75;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in transition fetching,fetchError,%@,semaError,%@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  int v25 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v67 = [(id)v85[5] count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v67;
    _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedTransitionSummary,transitionCount,%tu", buf, 0xCu);
  }

  __int16 v26 = (void *)v85[5];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_130;
  v79[3] = &unk_1E6B9D1F8;
  v79[4] = &v84;
  [v26 enumerateObjectsUsingBlock:v79];
  BOOL v69 = [(RTTripSegmentProvider *)self allowReprocessingOfTransitionsWithTripSegments];
  uint64_t v27 = [(RTTripSegmentTransitionPreprocessor *)self->_transitionPreprocessor processTransitions:v85[5]];
  __int16 v28 = (void *)v85[5];
  v85[5] = v27;

  unint64_t v29 = 0;
  id v75 = 0;
  uint64_t v70 = *MEMORY[0x1E4F5CFE8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  *(void *)&long long v30 = 134218242;
  long long v68 = v30;
  while (v29 < objc_msgSend((id)v85[5], "count", v68))
  {
    int v31 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v61 = [(id)v85[5] count];
      id v62 = [(id)v85[5] objectAtIndexedSubscript:v29];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v61;
      *(_WORD *)&buf[22] = 2112;
      v94 = v62;
      _os_log_debug_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: processingTransition,transitionIndex,%tu,transitionCount,%tu,thisTransition,%@", buf, 0x20u);
    }
    id v32 = objc_alloc(MEMORY[0x1E4F28C18]);
    v33 = [(id)v85[5] objectAtIndexedSubscript:v29];
    v34 = [v33 startDate];
    __int16 v35 = [(id)v85[5] objectAtIndexedSubscript:v29];
    int v36 = [v35 stopDate];
    uint64_t v37 = (void *)[v32 initWithStartDate:v34 endDate:v36];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v94) = 1;
    dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
    tripSegmentManager = self->_tripSegmentManager;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_132;
    v76[3] = &unk_1E6B979A8;
    v78 = buf;
    v40 = v38;
    v77 = v40;
    [(RTTripSegmentManager *)tripSegmentManager tripSegmentExistsForDateInterval:v37 ignoreTemporary:1 handler:v76];
    v41 = v40;
    uint64_t v42 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v43 = dispatch_time(0, 3600000000000);
    id v44 = v75;
    if (dispatch_semaphore_wait(v41, v43))
    {
      v45 = [MEMORY[0x1E4F1C9C8] now];
      [v45 timeIntervalSinceDate:v42];
      double v47 = v46;
      double v48 = objc_opt_new();
      v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
      v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      v51 = [v50 filteredArrayUsingPredicate:v49];
      v52 = [v51 firstObject];

      [v48 submitToCoreAnalytics:v52 type:1 duration:v47];
      v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v90 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v90, 2u);
      }

      v54 = (void *)MEMORY[0x1E4F28C58];
      v100[0] = v71;
      *(void *)v90 = @"semaphore wait timeout";
      id v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v100 count:1];
      dispatch_queue_t v56 = [v54 errorWithDomain:v70 code:15 userInfo:v55];

      id v44 = v75;
      if (v56)
      {
        id v44 = v56;
      }
    }

    id v57 = v44;
    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      goto LABEL_33;
    }
    if (v69)
    {
      v58 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        id v64 = [v37 description];
        *(_DWORD *)v90 = v68;
        *(void *)&v90[4] = v29;
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v64;
        _os_log_debug_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:TripSegment already exists in store for transitionIndex, %tu, date interval %@, and configuration set to reprocess trip segment data.", v90, 0x16u);
      }
LABEL_33:
      [(RTTripSegmentProvider *)self buildTripSegmentsForOneLearnedTransitionWithIndex:v29 inTransitions:v85[5] trainMode:a3];
      goto LABEL_34;
    }
    id v59 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      id v65 = [v37 description];
      *(_DWORD *)v90 = v68;
      *(void *)&v90[4] = v29;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v65;
      _os_log_debug_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:TripSegment already exists in store for transitionIndex, %tu, date interval %@, and configuration set to skip reprocessing trip segment data.", v90, 0x16u);
    }
    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      goto LABEL_33;
    }
LABEL_34:
    v60 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v63 = [(id)v85[5] count];
      *(_DWORD *)v90 = 134218240;
      *(void *)&v90[4] = v29;
      __int16 v91 = 2048;
      uint64_t v92 = v63;
      _os_log_debug_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:completedTransition,transitionIndex,%tu,transitionCount,%tu", v90, 0x16u);
    }

    _Block_object_dispose(buf, 8);
    ++v29;
    id v75 = v57;
  }
  __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:_startReconstructTripSegmentWithTrainMode, mode, %lu - finished. Exiting.", buf, 0xCu);
  }
LABEL_13:

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v95, 8);
}

void __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_130(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
    int v8 = 134218498;
    uint64_t v9 = a3;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedTransitions,transitionIndex,%tu,count,%tu,transition,%@", (uint8_t *)&v8, 0x20u);
  }
}

intptr_t __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_132(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isTripSegmentGenerationSupportedOnPlatform:(id)a3
{
  return [a3 iPhoneDevice];
}

- (BOOL)isTripSegmentGenerationEnabled
{
  uint64_t v2 = [(RTTripSegmentProvider *)self defaultsManager];
  v3 = [v2 objectForKey:@"RTDefaultsTripSegmentGenerationEnabled"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)startReconstructTripSegmentWithTrainMode:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(RTTripSegmentProvider *)self isTripSegmentGenerationEnabled];
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v8)
    {
      uint64_t v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:%@,trip segment generation is supported on this platform but is not enabled", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (v8)
  {
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:%@,trip segment generation is supported on this platform and is enabled", buf, 0xCu);
  }
  if (!self->_sessionInProgress)
  {
    uint64_t v7 = [(RTTripSegmentProvider *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__RTTripSegmentProvider_startReconstructTripSegmentWithTrainMode___block_invoke;
    block[3] = &unk_1E6B9D220;
    block[4] = self;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v7, block);
LABEL_11:

    return;
  }
  __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:startReconstructTripSegmentWithTrainMode: Session already in progress, ignoring request.", buf, 2u);
  }
}

void __66__RTTripSegmentProvider_startReconstructTripSegmentWithTrainMode___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:startReconstructTripSegmentWithTrainMode: Starting.", buf, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v3 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
  id v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];
  [v7 UTF8String];
  BOOL v8 = (void *)os_transaction_create();

  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _startReconstructTripSegmentWithTrainMode:*(void *)(a1 + 48)];

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:startReconstructTripSegmentWithTrainMode: Finished.", buf, 2u);
  }
}

- (id)buildTinySegmentArrayForTransitionWithIndex:(unint64_t)a3 withinDateInterval:(id)a4 fromActivity:(id)a5 uuidType:(int64_t)a6
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = v9;
  if (!v9 || ![v9 count])
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v100 = "-[RTTripSegmentProvider buildTinySegmentArrayForTransitionWithIndex:withinDateInterval:fromActivity:uuidType:]";
      __int16 v101 = 1024;
      int v102 = 468;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider:Activities cannot be nil or empty for a transition (in %s:%d)", buf, 0x12u);
    }
  }
  id v75 = self;
  id context = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __int16 v12 = [RTTripSegmentFeatures alloc];
  id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v16 = (void *)[v13 initWithStartDate:v14 endDate:v15];
  uint64_t v17 = [(RTTripSegmentFeatures *)v12 initWithTransitionIndex:a3 tripId:0 mode:0 dateInterval:v16];

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v10;
  uint64_t v70 = v8;
  objc_super v72 = v17;
  uint64_t v81 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
  if (v81)
  {
    uint64_t v18 = *(void *)v94;
    while (2)
    {
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v94 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        id v21 = (void *)MEMORY[0x1E016D870]();
        uint64_t v22 = [v20 startDate];
        id v23 = [v8 endDate];
        char v24 = [v22 isAfterDate:v23];

        if (v24)
        {
          goto LABEL_18;
        }
        uint64_t v25 = [MEMORY[0x1E4F5CE20] modeOfTransportationFromMotionActivityType:[v20 type]];
        if (v25 != [(RTTripSegmentFeatures *)v17 mode])
        {
          id v26 = objc_alloc(MEMORY[0x1E4F28C18]);
          uint64_t v27 = [(RTTripSegmentFeatures *)v17 dateInterval];
          __int16 v28 = [v27 startDate];
          unint64_t v29 = [v20 startDate];
          long long v30 = (void *)[v26 initWithStartDate:v28 endDate:v29];
          [(RTTripSegmentFeatures *)v72 setDateInterval:v30];

          id v8 = v70;
          [(RTTripSegmentProvider *)v75 addTripSegmentFeaturesItem:v72 intoList:context overlapDateInterval:v70 uuidType:a6];
          id v31 = objc_alloc(MEMORY[0x1E4F28C18]);
          id v32 = [v20 startDate];
          v33 = [MEMORY[0x1E4F1C9C8] date];
          v34 = (void *)[v31 initWithStartDate:v32 endDate:v33];
          [(RTTripSegmentFeatures *)v72 setDateInterval:v34];

          uint64_t v17 = v72;
          [(RTTripSegmentFeatures *)v72 setMode:v25];
        }
      }
      uint64_t v81 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
      if (v81) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  __int16 v35 = v75;
  [(RTTripSegmentProvider *)v75 addTripSegmentFeaturesItem:v17 intoList:context overlapDateInterval:v8 uuidType:a6];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke;
  v90[3] = &unk_1E6B9D248;
  unint64_t v92 = a3;
  id v36 = context;
  id v91 = v36;
  [v36 enumerateObjectsUsingBlock:v90];
  id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v73 = v36;
  uint64_t v76 = [v73 countByEnumeratingWithState:&v86 objects:v97 count:16];
  if (v76)
  {
    uint64_t v74 = *(void *)v87;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v87 != v74) {
          objc_enumerationMutation(v73);
        }
        dispatch_semaphore_t v38 = *(void **)(*((void *)&v86 + 1) + 8 * v37);
        contexta = (void *)MEMORY[0x1E016D870]();
        v39 = [v38 tripId];
        v40 = [v38 dateInterval];
        v41 = [v40 startDate];

        uint64_t v42 = [v38 dateInterval];
        dispatch_time_t v43 = [v42 startDate];
        id v44 = [v43 dateByAddingTimeInterval:v35->_processingChunkWidthSeconds];

        v45 = [v38 dateInterval];
        double v46 = [v45 endDate];
        double v47 = [v46 dateByAddingTimeInterval:v35->_processingChunkWidthSeconds * -0.5];

        double v48 = [v38 dateInterval];
        v49 = [v48 endDate];
        int v50 = [v44 isBeforeDate:v49];

        uint64_t v80 = v37;
        if (v50)
        {
          while (([v44 isAfterDate:v47] & 1) == 0)
          {
            v51 = [RTTripSegmentFeatures alloc];
            uint64_t v52 = [v38 transitionIndex];
            uint64_t v53 = [v38 mode];
            v54 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v41 endDate:v44];
            id v55 = [(RTTripSegmentFeatures *)v51 initWithTransitionIndex:v52 tripId:v39 mode:v53 dateInterval:v54];
            [v82 addObject:v55];

            id v56 = v44;
            id v44 = [v56 dateByAddingTimeInterval:v35->_processingChunkWidthSeconds];

            id v57 = [v38 dateInterval];
            v58 = [v57 endDate];
            LOBYTE(v52) = [v44 isBeforeDate:v58];

            v41 = v56;
            if ((v52 & 1) == 0) {
              goto LABEL_28;
            }
          }
        }
        id v56 = v41;
LABEL_28:
        id v59 = [RTTripSegmentFeatures alloc];
        uint64_t v60 = [v38 transitionIndex];
        uint64_t v61 = [v38 mode];
        id v62 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v63 = [v38 dateInterval];
        id v64 = [v63 endDate];
        id v65 = (void *)[v62 initWithStartDate:v56 endDate:v64];
        uint64_t v66 = [(RTTripSegmentFeatures *)v59 initWithTransitionIndex:v60 tripId:v39 mode:v61 dateInterval:v65];
        [v82 addObject:v66];

        __int16 v35 = v75;
        uint64_t v37 = v80 + 1;
      }
      while (v80 + 1 != v76);
      uint64_t v76 = [v73 countByEnumeratingWithState:&v86 objects:v97 count:16];
    }
    while (v76);
  }

  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke_143;
  v83[3] = &unk_1E6B9D248;
  unint64_t v85 = a3;
  id v67 = v82;
  id v84 = v67;
  [v67 enumerateObjectsUsingBlock:v83];

  return v67;
}

void __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v16 = [*(id *)(a1 + 32) count];
    uint64_t v15 = [v5 mode];
    id v7 = [v5 dateInterval];
    id v8 = [v7 startDate];
    id v9 = [v8 stringFromDate];
    __int16 v10 = [v5 dateInterval];
    uint64_t v11 = [v10 endDate];
    __int16 v12 = [v11 stringFromDate];
    id v13 = [v5 dateInterval];
    [v13 duration];
    *(_DWORD *)buf = 134219523;
    uint64_t v19 = v17;
    __int16 v20 = 2048;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = a3;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    unint64_t v29 = v12;
    __int16 v30 = 2049;
    uint64_t v31 = v14;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:tripSegmentGenerated,TransitionIndex,%tu,SegmentCount,%tu,SegmentIndex,%tu,mode,%zd,startTime,%@,endTime,%@,duration,%{private}.1f", buf, 0x48u);
  }
}

void __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke_143(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218754;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:chunkGenerated,TransitionIndex,%tu,ChunkCount,%tu,ChunkIndex,%tu,thisChunk,%@", (uint8_t *)&v9, 0x2Au);
  }
}

- (id)getTransitionlocations
{
  return self->_transitionLocations;
}

+ (BOOL)isLocationTypeSupported:(int)a3
{
  return (a3 < 0xE) & (0x2E1Au >> a3);
}

- (void)addToTransitionLocationsBuffer:(id)a3 forDateInterval:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 sortedArrayUsingComparator:&__block_literal_global_126];
  uint64_t v8 = v7;
  if (v6)
  {
    int v9 = [v7 firstObject];
    uint64_t v10 = [v9 timestamp];

    __int16 v11 = [v6 startDate];
    int v12 = [v10 isBeforeDate:v11];

    if (v12)
    {
      __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v33 = [v8 firstObject];
        *(_DWORD *)buf = 138412546;
        v39 = v33;
        __int16 v40 = 2112;
        id v41 = v6;
        _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:addToTransitionLocationsBuffer Fetched location, %@, before the desired chunk time interval, %@", buf, 0x16u);
      }
    }
    uint64_t v14 = [v8 lastObject];
    __int16 v15 = [v14 timestamp];

    id v16 = [v6 endDate];
    int v17 = [v15 isAfterDate:v16];

    if (v17)
    {
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v34 = [v8 lastObject];
        *(_DWORD *)buf = 138412546;
        v39 = v34;
        __int16 v40 = 2112;
        id v41 = v6;
        _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:addToTransitionLocationsBuffer Fetched location, %@, after the desired chunk time interval, %@", buf, 0x16u);
      }
    }
  }
  if ([(NSMutableArray *)self->_transitionLocations count])
  {
    uint64_t v19 = [(NSMutableArray *)self->_transitionLocations lastObject];
    __int16 v20 = [v19 timestamp];

    uint64_t v21 = (void *)MEMORY[0x1E4F28F60];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __72__RTTripSegmentProvider_addToTransitionLocationsBuffer_forDateInterval___block_invoke_146;
    v36[3] = &unk_1E6B9D290;
    id v37 = v20;
    transitionLocations = v20;
    uint64_t v23 = [v21 predicateWithBlock:v36];
    __int16 v24 = [v8 filteredArrayUsingPredicate:v23];

    [(NSMutableArray *)self->_transitionLocations addObjectsFromArray:v24];
  }
  else
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
    transitionLocations = self->_transitionLocations;
    self->_transitionLocations = v25;
  }

  if ([(NSMutableArray *)self->_transitionLocations count])
  {
    unint64_t v27 = 0;
    *(void *)&long long v26 = 138412290;
    long long v35 = v26;
    do
    {
      __int16 v28 = -[NSMutableArray objectAtIndexedSubscript:](self->_transitionLocations, "objectAtIndexedSubscript:", v27, v35);
      BOOL v29 = +[RTTripSegmentProvider isLocationTypeSupported:](RTTripSegmentProvider, "isLocationTypeSupported:", [v28 type]);

      if (!v29)
      {
        __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = [(NSMutableArray *)self->_transitionLocations objectAtIndexedSubscript:v27];
          uint64_t v32 = [v31 toString];
          *(_DWORD *)buf = v35;
          v39 = v32;
          _os_log_debug_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:addToTransitionLocationsBuffer Removing unsupported location %@", buf, 0xCu);
        }
        [(NSMutableArray *)self->_transitionLocations removeObjectAtIndex:v27--];
      }
      ++v27;
    }
    while (v27 < [(NSMutableArray *)self->_transitionLocations count]);
  }
}

uint64_t __72__RTTripSegmentProvider_addToTransitionLocationsBuffer_forDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 timestamp];
  id v6 = [v4 timestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __72__RTTripSegmentProvider_addToTransitionLocationsBuffer_forDateInterval___block_invoke_146(uint64_t a1, void *a2)
{
  v3 = [a2 timestamp];
  uint64_t v4 = [v3 isAfterDate:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)applyElevationAdjustmentToBreadcrumbs
{
  uint64_t v2 = [(RTTripSegmentProvider *)self defaultsManager];
  v3 = [v2 objectForKey:@"RTDefaultsTripSegmentAdjustElevationForBreadcrumbs"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)convertToTripSegmentLocations:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F1E670]);
        int v12 = [v11 initWithCLLocation:v10];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)processChunkWithIndex:(unint64_t)a3 inChunks:(id)a4
{
  v309[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 count] > a3)
  {
    v244 = v6;
    unint64_t v245 = a3;
    v246 = [v6 objectAtIndexedSubscript:a3];
    uint64_t v242 = [v6 count] - 1;
    if (v242 == a3)
    {
      BOOL v237 = 1;
    }
    else
    {
      uint64_t v7 = [v246 tripId];
      uint64_t v8 = [v244 objectAtIndexedSubscript:a3 + 1];
      int v9 = [v8 tripId];
      BOOL v237 = v7 != v9;
    }
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v90 = [v246 transitionIndex];
      uint64_t v91 = [v244 count];
      uint64_t v92 = [v246 mode];
      long long v93 = [v246 tripId];
      long long v94 = [v246 dateInterval];
      *(_DWORD *)buf = 134219778;
      *(void *)&uint8_t buf[4] = v90;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v245;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = v91;
      *(_WORD *)&buf[32] = 2048;
      *(void *)&buf[34] = v92;
      *(_WORD *)&buf[42] = 1024;
      *(_DWORD *)&buf[44] = v237;
      *(_WORD *)&buf[48] = 1024;
      *(_DWORD *)&buf[50] = v242 == v245;
      *(_WORD *)&buf[54] = 2112;
      *(void *)&buf[56] = v93;
      *(_WORD *)&buf[64] = 2112;
      *(void *)&buf[66] = v94;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: processChunk,inTransition,%tu,chunkIndex,%tu,chunkCount,%tu,mode,%zd,isFinalSegmentPart,%d,isLastChunk,%d,tripId,%@,timeInterval,%@", buf, 0x4Au);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F5CF40]);
    int v12 = [v246 dateInterval];
    v243 = (void *)[v11 initWithDateInterval:v12 horizontalAccuracy:0x7FFFFFFFFFFFFFFFLL batchSize:0 boundingBoxLocation:1.79769313e308];

    uint64_t v288 = 0;
    v289 = &v288;
    uint64_t v290 = 0x3032000000;
    v291 = __Block_byref_object_copy__175;
    v292 = __Block_byref_object_dispose__175;
    id v293 = 0;
    uint64_t v282 = 0;
    v283 = &v282;
    uint64_t v284 = 0x3032000000;
    v285 = __Block_byref_object_copy__175;
    v286 = __Block_byref_object_dispose__175;
    id v287 = [MEMORY[0x1E4F1C978] array];
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    long long v14 = [(RTTripSegmentProvider *)self locationManager];
    v278[0] = MEMORY[0x1E4F143A8];
    v278[1] = 3221225472;
    v278[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke;
    v278[3] = &unk_1E6B905F0;
    v280 = &v288;
    v281 = &v282;
    long long v15 = v13;
    v279 = v15;
    [v14 fetchStoredLocationsWithOptions:v243 handler:v278];

    dsema = v15;
    long long v16 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v17)) {
      goto LABEL_12;
    }
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
    [v18 timeIntervalSinceDate:v16];
    double v20 = v19;
    uint64_t v21 = objc_opt_new();
    __int16 v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
    uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v24 = [v23 filteredArrayUsingPredicate:v22];
    uint64_t v25 = [v24 firstObject];

    [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
    long long v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    unint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v303 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    __int16 v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v303 count:1];
    BOOL v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

    if (v29)
    {
      id v30 = v29;
    }
    else
    {
LABEL_12:
      id v30 = 0;
    }

    id v238 = v30;
    if (v238 || v289[5])
    {
      uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v125 = v289[5];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v125;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v238;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in clLocations fetching,fetchError,%@,semaError,%@", buf, 0x16u);
      }

      goto LABEL_18;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&unsigned char buf[24] = __Block_byref_object_copy__175;
    *(void *)&buf[32] = __Block_byref_object_dispose__175;
    *(void *)&buf[40] = 0;
    dispatch_semaphore_t v71 = dispatch_semaphore_create(0);
    if (v283[5]
      && [(RTTripSegmentProvider *)self applyElevationAdjustmentToBreadcrumbs])
    {
      objc_super v72 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v209 = [(id)v283[5] count];
        *(_DWORD *)v303 = 134217984;
        *(void *)&v303[4] = v209;
        _os_log_debug_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: adjusting the elevation for %lu CLLocation breadcrumb samples", v303, 0xCu);
      }

      elevationAdjuster = self->_elevationAdjuster;
      uint64_t v74 = v283[5];
      v276[0] = MEMORY[0x1E4F143A8];
      v276[1] = 3221225472;
      v276[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_154;
      v276[3] = &unk_1E6B905F0;
      v277[1] = buf;
      v277[2] = &v282;
      id v75 = v71;
      v277[0] = v75;
      [(RTElevationAdjuster *)elevationAdjuster adjustElevationForLocations:v74 handler:v276];
      uint64_t v76 = v75;
      v239 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v77 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v76, v77)) {
        goto LABEL_97;
      }
      v235 = [MEMORY[0x1E4F1C9C8] now];
      [v235 timeIntervalSinceDate:v239];
      double v79 = v78;
      uint64_t v80 = objc_opt_new();
      uint64_t v81 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
      id v82 = [MEMORY[0x1E4F29060] callStackSymbols];
      v83 = [v82 filteredArrayUsingPredicate:v81];
      id v84 = [v83 firstObject];

      [v80 submitToCoreAnalytics:v84 type:1 duration:v79];
      unint64_t v85 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v303 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v303, 2u);
      }

      long long v86 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v297 = *MEMORY[0x1E4F28568];
      *(void *)v303 = @"semaphore wait timeout";
      long long v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v303 forKeys:&v297 count:1];
      long long v88 = [v86 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v87];

      if (v88)
      {
        id v89 = v88;
      }
      else
      {
LABEL_97:
        id v89 = 0;
      }

      id v238 = v89;
      if (v238 || *(void *)(*(void *)&buf[8] + 40))
      {
        v168 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v169 = v277;
        if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
        {
          uint64_t v210 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v303 = 138412546;
          *(void *)&v303[4] = v210;
          *(_WORD *)&v303[12] = 2112;
          *(void *)&v303[14] = v238;
          _os_log_error_impl(&dword_1D9BFA000, v168, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in to adjust elevations for locations,adjustError,%@,semaError,%@", v303, 0x16u);
        }
        char v170 = 0;
        goto LABEL_126;
      }
    }
    v198 = (void *)v283[5];
    v274[0] = MEMORY[0x1E4F143A8];
    v274[1] = 3221225472;
    v274[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_155;
    v274[3] = &unk_1E6B9D2B8;
    id v199 = v246;
    v275[0] = v199;
    v275[1] = &v282;
    [v198 enumerateObjectsUsingBlock:v274];
    v169 = (id *)v275;
    if (![(id)v283[5] count])
    {
      id v238 = 0;
      char v170 = 1;
LABEL_128:

      _Block_object_dispose(buf, 8);
      if ((v170 & 1) == 0) {
        goto LABEL_93;
      }
LABEL_18:
      unint64_t v32 = v245;
      if (!v245)
      {
        transitionStartLocation = self->_transitionStartLocation;
        if (transitionStartLocation)
        {
          v34 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            v183 = [(CLLocation *)self->_transitionStartLocation toString];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v183;
            _os_log_debug_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: adding LOI start location, %@", buf, 0xCu);
          }
          v308 = self->_transitionStartLocation;
          long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v308 count:1];
          id v36 = [v246 dateInterval];
          [(RTTripSegmentProvider *)self addToTransitionLocationsBuffer:v35 forDateInterval:v36];

          transitionStartLocation = self->_transitionStartLocation;
        }
        self->_transitionStartLocation = 0;

        unint64_t v32 = 0;
      }
      if (v242 == v32)
      {
        transitionStopLocation = self->_transitionStopLocation;
        if (transitionStopLocation)
        {
          dispatch_semaphore_t v38 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v171 = [(CLLocation *)self->_transitionStopLocation toString];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v171;
            _os_log_debug_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: adding LOI stop location, %@", buf, 0xCu);
          }
          v307 = self->_transitionStopLocation;
          v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v307 count:1];
          __int16 v40 = [v246 dateInterval];
          [(RTTripSegmentProvider *)self addToTransitionLocationsBuffer:v39 forDateInterval:v40];

          transitionStopLocation = self->_transitionStopLocation;
        }
        self->_transitionStopLocation = 0;
      }
      if (![(NSMutableArray *)self->_transitionLocations count])
      {
        [(NSMutableArray *)self->_transitionLocations removeAllObjects];
        id v65 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
LABEL_92:

LABEL_93:
          _Block_object_dispose(&v282, 8);

          _Block_object_dispose(&v288, 8);
          id v6 = v244;
          goto LABEL_94;
        }
        *(_WORD *)buf = 0;
        uint64_t v66 = "RTTripSegmentProvider: No locations exist in current chunk, skip and move to the next one";
        id v67 = v65;
        uint32_t v68 = 2;
LABEL_96:
        _os_log_debug_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_DEBUG, v66, buf, v68);
        goto LABEL_92;
      }
      id v41 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v126 = [v246 transitionIndex];
        v127 = [v246 tripId];
        id v128 = [v127 UUIDString];
        uint64_t v129 = [v246 mode];
        uint64_t v130 = [(NSMutableArray *)self->_transitionLocations count];
        if (v130)
        {
          v131 = [(NSMutableArray *)self->_transitionLocations objectAtIndexedSubscript:0];
        }
        else
        {
          v131 = &unk_1F34528C8;
        }
        uint64_t v181 = [(NSMutableArray *)self->_transitionLocations count];
        *(_DWORD *)buf = 134219266;
        *(void *)&uint8_t buf[4] = v126;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v245;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&unsigned char buf[24] = v128;
        *(_WORD *)&buf[32] = 2048;
        *(void *)&buf[34] = v129;
        *(_WORD *)&buf[42] = 2112;
        *(void *)&buf[44] = v131;
        *(_WORD *)&buf[52] = 2048;
        *(void *)&buf[54] = v181;
        _os_log_debug_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: bufferedCLLocations,transitionIndex,%tu,chunkIndex,%zu,segmentUUID,%@,mode,%zd,firstBuffedLoc,%@,bufferedLocCount,%tu", buf, 0x3Eu);
        if (v130) {
      }
        }
      if ((unint64_t)[(NSMutableArray *)self->_transitionLocations count] < 2)
      {
        if (!v237)
        {
LABEL_90:
          -[NSMutableArray removeObjectsInRange:](self->_transitionLocations, "removeObjectsInRange:", 0, [(NSMutableArray *)self->_transitionLocations count] - 1);
          int v69 = 0;
          goto LABEL_91;
        }
      }
      else
      {
        transitionLocations = self->_transitionLocations;
        v272[0] = MEMORY[0x1E4F143A8];
        v272[1] = 3221225472;
        v272[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_158;
        v272[3] = &unk_1E6B93A18;
        id v232 = v246;
        id v273 = v232;
        [(NSMutableArray *)transitionLocations enumerateObjectsUsingBlock:v272];
        dispatch_time_t v43 = [(NSMutableArray *)self->_transitionLocations firstObject];
        v234 = [v43 timestamp];

        id v44 = [(NSMutableArray *)self->_transitionLocations lastObject];
        v233 = [v44 timestamp];

        if ([v234 isBeforeDate:v233])
        {
          uint64_t v45 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v234 endDate:v233];
          v228 = (void *)v45;
          if (self->_usingLegacyInertialData)
          {
            v227 = [MEMORY[0x1E4F1C978] array];
            *(void *)v303 = 0;
            *(void *)&v303[8] = v303;
            *(void *)&v303[16] = 0x3032000000;
            v304 = __Block_byref_object_copy__175;
            v305 = __Block_byref_object_dispose__175;
            id v306 = 0;
            uint64_t v297 = 0;
            v298 = &v297;
            uint64_t v299 = 0x3032000000;
            v300 = __Block_byref_object_copy__175;
            v301 = __Block_byref_object_dispose__175;
            id v302 = [MEMORY[0x1E4F1C978] array];
            dispatch_semaphore_t v46 = dispatch_semaphore_create(0);
            uint64_t v47 = [objc_alloc(MEMORY[0x1E4F5CF90]) initWithDateInterval:v45];
            double v48 = [(RTTripSegmentInertialDataManager *)self->_inertialDataManager inertialDataStore];
            v268[0] = MEMORY[0x1E4F143A8];
            v268[1] = 3221225472;
            v268[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_160;
            v268[3] = &unk_1E6B905F0;
            v270 = v303;
            v271 = &v297;
            v49 = v46;
            v269 = v49;
            [v48 fetchStoredTripSegmentInertialDataWithOptions:v47 handler:v268];
            v223 = (void *)v47;

            v229 = v49;
            int v50 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v51 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v229, v51)) {
              goto LABEL_54;
            }
            uint64_t v52 = [MEMORY[0x1E4F1C9C8] now];
            [v52 timeIntervalSinceDate:v50];
            double v54 = v53;
            id v55 = objc_opt_new();
            id v56 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
            id v57 = [MEMORY[0x1E4F29060] callStackSymbols];
            v58 = [v57 filteredArrayUsingPredicate:v56];
            id v59 = [v58 firstObject];

            [v55 submitToCoreAnalytics:v59 type:1 duration:v54];
            uint64_t v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            uint64_t v61 = (void *)MEMORY[0x1E4F28C58];
            v309[0] = *MEMORY[0x1E4F28568];
            *(void *)buf = @"semaphore wait timeout";
            id v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v309 count:1];
            uint64_t v63 = [v61 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v62];

            if (v63)
            {
              id v64 = v63;
            }
            else
            {
LABEL_54:
              id v64 = 0;
            }

            id v225 = v64;
            if (v225 || *(void *)(*(void *)&v303[8] + 40))
            {
              long long v95 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v201 = [v232 transitionIndex];
                v202 = [v232 tripId];
                v203 = [v202 UUIDString];
                uint64_t v204 = *(void *)(*(void *)&v303[8] + 40);
                *(_DWORD *)buf = 134218755;
                *(void *)&uint8_t buf[4] = v201;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v203;
                *(_WORD *)&buf[22] = 2113;
                *(void *)&unsigned char buf[24] = v204;
                *(_WORD *)&buf[32] = 2113;
                *(void *)&buf[34] = v225;
                _os_log_debug_impl(&dword_1D9BFA000, v95, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: Failed in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,fetchError,%{private}@,semaError,%{private}@", buf, 0x2Au);
              }
            }
            else if ([(id)v298[5] count])
            {
              v184 = (void *)v298[5];
              v267[0] = MEMORY[0x1E4F143A8];
              v267[1] = 3221225472;
              v267[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_161;
              v267[3] = &unk_1E6B9D2E0;
              v267[4] = self;
              v185 = [MEMORY[0x1E4F28F60] predicateWithBlock:v267];
              v186 = [v184 filteredArrayUsingPredicate:v185];

              v266[0] = MEMORY[0x1E4F143A8];
              v266[1] = 3221225472;
              v266[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2;
              v266[3] = &unk_1E6B9D2E0;
              v266[4] = self;
              v187 = [MEMORY[0x1E4F28F60] predicateWithBlock:v266];
              v227 = [v186 filteredArrayUsingPredicate:v187];

              uint64_t v188 = [v227 count];
              if (v188 != [(id)v298[5] count])
              {
                v189 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_1D9BFA000, v189, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:inertial data fetched are out of location-based dateInterval", buf, 2u);
                }
              }
              v190 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              if (os_log_type_enabled(v190, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v211 = [v232 transitionIndex];
                v212 = [v232 tripId];
                id v213 = [v212 UUIDString];
                uint64_t v214 = [v232 mode];
                uint64_t v215 = [(id)v298[5] count];
                uint64_t v216 = [v227 count];
                *(_DWORD *)buf = 134219010;
                *(void *)&uint8_t buf[4] = v211;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v213;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&unsigned char buf[24] = v214;
                *(_WORD *)&buf[32] = 2048;
                *(void *)&buf[34] = v215;
                *(_WORD *)&buf[42] = 2048;
                *(void *)&buf[44] = v216;
                _os_log_debug_impl(&dword_1D9BFA000, v190, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:Succeeded in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,mode,%zd,count,%tu,inputInertialCount,%tu", buf, 0x34u);
              }
            }
            id v96 = objc_alloc(MEMORY[0x1E4F1E668]);
            v97 = [v232 tripId];
            int64_t v98 = +[RTTripSegmentProvider CLTripModeFromRTModeOfTransportation:](RTTripSegmentProvider, "CLTripModeFromRTModeOfTransportation:", [v232 mode]);
            id v99 = +[RTTripSegmentProvider convertToTripSegmentLocations:self->_transitionLocations];
            id v100 = objc_alloc(MEMORY[0x1E4F1E670]);
            __int16 v101 = [(NSMutableArray *)self->_transitionLocations firstObject];
            int v102 = (void *)[v100 initWithCLLocation:v101];
            id v103 = objc_alloc(MEMORY[0x1E4F1E670]);
            v104 = [(NSMutableArray *)self->_transitionLocations lastObject];
            v105 = (void *)[v103 initWithCLLocation:v104];
            uint64_t v70 = (void *)[v96 initWithTripSegmentID:v97 isFinalPart:v237 modeOfTransport:v98 tripLocations:v99 startTripLocation:v102 stopTripLocation:v105 inertialData:v227];

            _Block_object_dispose(&v297, 8);
            _Block_object_dispose(v303, 8);
          }
          else
          {
            v227 = [MEMORY[0x1E4F1C978] array];
            *(void *)v303 = 0;
            *(void *)&v303[8] = v303;
            *(void *)&v303[16] = 0x3032000000;
            v304 = __Block_byref_object_copy__175;
            v305 = __Block_byref_object_dispose__175;
            id v306 = 0;
            uint64_t v297 = 0;
            v298 = &v297;
            uint64_t v299 = 0x3032000000;
            v300 = __Block_byref_object_copy__175;
            v301 = __Block_byref_object_dispose__175;
            id v302 = [MEMORY[0x1E4F1C978] array];
            dispatch_semaphore_t v106 = dispatch_semaphore_create(0);
            uint64_t v107 = [objc_alloc(MEMORY[0x1E4F5CDA0]) initWithDateInterval:v45];
            inertialOdometryManager = self->_inertialOdometryManager;
            v262[0] = MEMORY[0x1E4F143A8];
            v262[1] = 3221225472;
            v262[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_165;
            v262[3] = &unk_1E6B905F0;
            v264 = v303;
            v265 = &v297;
            v109 = v106;
            v263 = v109;
            [(RTBackgroundInertialOdometryManager *)inertialOdometryManager fetchBackgroundInertialOdometrySamplesWithOptions:v107 handler:v262];
            v224 = (void *)v107;
            v230 = v109;
            v110 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v111 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v230, v111)) {
              goto LABEL_68;
            }
            v112 = [MEMORY[0x1E4F1C9C8] now];
            [v112 timeIntervalSinceDate:v110];
            double v114 = v113;
            v115 = objc_opt_new();
            v116 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
            v117 = [MEMORY[0x1E4F29060] callStackSymbols];
            v118 = [v117 filteredArrayUsingPredicate:v116];
            v119 = [v118 firstObject];

            [v115 submitToCoreAnalytics:v119 type:1 duration:v114];
            v120 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v120, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v121 = (void *)MEMORY[0x1E4F28C58];
            v309[0] = *MEMORY[0x1E4F28568];
            *(void *)buf = @"semaphore wait timeout";
            v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v309 count:1];
            v123 = [v121 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v122];

            if (v123)
            {
              id v124 = v123;
            }
            else
            {
LABEL_68:
              id v124 = 0;
            }

            id v226 = v124;
            if (v226 || *(void *)(*(void *)&v303[8] + 40))
            {
              v132 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v205 = [v232 transitionIndex];
                v206 = [v232 tripId];
                v207 = [v206 UUIDString];
                uint64_t v208 = *(void *)(*(void *)&v303[8] + 40);
                *(_DWORD *)buf = 134218755;
                *(void *)&uint8_t buf[4] = v205;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v207;
                *(_WORD *)&buf[22] = 2113;
                *(void *)&unsigned char buf[24] = v208;
                *(_WORD *)&buf[32] = 2113;
                *(void *)&buf[34] = v226;
                _os_log_debug_impl(&dword_1D9BFA000, v132, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: Failed in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,fetchError,%{private}@,semaError,%{private}@", buf, 0x2Au);
              }
            }
            else if ([(id)v298[5] count])
            {
              v191 = (void *)v298[5];
              v261[0] = MEMORY[0x1E4F143A8];
              v261[1] = 3221225472;
              v261[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_166;
              v261[3] = &unk_1E6B9D308;
              v261[4] = self;
              v192 = [MEMORY[0x1E4F28F60] predicateWithBlock:v261];
              v193 = [v191 filteredArrayUsingPredicate:v192];

              v260[0] = MEMORY[0x1E4F143A8];
              v260[1] = 3221225472;
              v260[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2_168;
              v260[3] = &unk_1E6B9D308;
              v260[4] = self;
              v194 = [MEMORY[0x1E4F28F60] predicateWithBlock:v260];
              v227 = [v193 filteredArrayUsingPredicate:v194];

              uint64_t v195 = [v227 count];
              if (v195 != [(id)v298[5] count])
              {
                v196 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_1D9BFA000, v196, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:inertial data fetched are out of location-based dateInterval", buf, 2u);
                }
              }
              v197 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              if (os_log_type_enabled(v197, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v217 = [v232 transitionIndex];
                v218 = [v232 tripId];
                id v219 = [v218 UUIDString];
                uint64_t v220 = [v232 mode];
                uint64_t v221 = [(id)v298[5] count];
                uint64_t v222 = [v227 count];
                *(_DWORD *)buf = 134219010;
                *(void *)&uint8_t buf[4] = v217;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v219;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&unsigned char buf[24] = v220;
                *(_WORD *)&buf[32] = 2048;
                *(void *)&buf[34] = v221;
                *(_WORD *)&buf[42] = 2048;
                *(void *)&buf[44] = v222;
                _os_log_debug_impl(&dword_1D9BFA000, v197, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:Succeeded in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,mode,%zd,count,%tu,inputInertialCount,%tu", buf, 0x34u);
              }
            }
            id v133 = objc_alloc(MEMORY[0x1E4F1E668]);
            v134 = [v232 tripId];
            int64_t v135 = +[RTTripSegmentProvider CLTripModeFromRTModeOfTransportation:](RTTripSegmentProvider, "CLTripModeFromRTModeOfTransportation:", [v232 mode]);
            v136 = +[RTTripSegmentProvider convertToTripSegmentLocations:self->_transitionLocations];
            id v137 = objc_alloc(MEMORY[0x1E4F1E670]);
            v138 = [(NSMutableArray *)self->_transitionLocations firstObject];
            v139 = (void *)[v137 initWithCLLocation:v138];
            id v140 = objc_alloc(MEMORY[0x1E4F1E670]);
            v141 = [(NSMutableArray *)self->_transitionLocations lastObject];
            v142 = (void *)[v140 initWithCLLocation:v141];
            uint64_t v70 = (void *)[v133 initWithTripSegmentID:v134 isFinalPart:v237 modeOfTransport:v135 tripLocations:v136 startTripLocation:v139 stopTripLocation:v142 inertialOdometryData:v227];

            _Block_object_dispose(&v297, 8);
            _Block_object_dispose(v303, 8);
          }
        }
        else
        {
          uint64_t v70 = 0;
          v228 = 0;
        }
        v255[0] = MEMORY[0x1E4F143A8];
        v255[1] = 3221225472;
        v255[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_169;
        v255[3] = &unk_1E6B9D358;
        dispatch_semaphore_t v231 = v234;
        dispatch_semaphore_t v256 = v231;
        id v236 = v233;
        id v257 = v236;
        v258 = self;
        SEL v259 = a2;
        v241 = (void *)MEMORY[0x1E016DB00](v255);
        v143 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
        {
          v172 = [v70 tripSegmentID];
          int v173 = [v70 isFinalPart];
          uint64_t v174 = [v70 modeOfTransport];
          v175 = [v70 tripLocations];
          uint64_t v176 = [v175 count];
          [v236 timeIntervalSinceDate:v231];
          uint64_t v178 = v177;
          v179 = [(NSMutableArray *)self->_transitionLocations firstObject];
          v180 = [(NSMutableArray *)self->_transitionLocations lastObject];
          *(_DWORD *)buf = 138414338;
          *(void *)&uint8_t buf[4] = v172;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v173;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v174;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v176;
          *(_WORD *)&buf[38] = 2112;
          *(void *)&buf[40] = v231;
          *(_WORD *)&buf[48] = 2112;
          *(void *)&buf[50] = v236;
          *(_WORD *)&buf[58] = 2048;
          *(void *)&buf[60] = v178;
          *(_WORD *)&buf[68] = 2112;
          *(void *)&buf[70] = v179;
          __int16 v295 = 2112;
          v296 = v180;
          _os_log_debug_impl(&dword_1D9BFA000, v143, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:tripInputData,ID,%@,isFinalPart,%d,mode,%zd,locationCount,%tu,startDate,%@,endDate,%@,Interval,%.3lf,firstBreadcrumb,%@,lastBreadcrumb,%@", buf, 0x58u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&unsigned char buf[24] = __Block_byref_object_copy__175;
        *(void *)&buf[32] = __Block_byref_object_dispose__175;
        *(void *)&buf[40] = 0;
        dispatch_semaphore_t v144 = dispatch_semaphore_create(0);
        v145 = [(RTTripSegmentProvider *)self tripProcessorManager];
        tripProcessorOptions = self->_tripProcessorOptions;
        v248[0] = MEMORY[0x1E4F143A8];
        v248[1] = 3221225472;
        v248[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_173;
        v248[3] = &unk_1E6B9D380;
        id v249 = v232;
        unint64_t v253 = v245;
        uint64_t v254 = v242;
        id v147 = v70;
        id v250 = v147;
        v252 = buf;
        v148 = v144;
        v251 = v148;
        [v145 processTripSegmentData:v147 withOptions:tripProcessorOptions outputHandler:v241 completionHandler:v248];

        v149 = v148;
        v150 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v151 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v149, v151)) {
          goto LABEL_83;
        }
        v152 = [MEMORY[0x1E4F1C9C8] now];
        [v152 timeIntervalSinceDate:v150];
        double v154 = v153;
        v155 = objc_opt_new();
        v156 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
        v157 = [MEMORY[0x1E4F29060] callStackSymbols];
        v158 = [v157 filteredArrayUsingPredicate:v156];
        v159 = [v158 firstObject];

        [v155 submitToCoreAnalytics:v159 type:1 duration:v154];
        v160 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v303 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v160, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v303, 2u);
        }

        v161 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v297 = *MEMORY[0x1E4F28568];
        *(void *)v303 = @"semaphore wait timeout";
        v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v303 forKeys:&v297 count:1];
        v163 = [v161 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v162];

        if (v163)
        {
          id v164 = v163;
        }
        else
        {
LABEL_83:
          id v164 = 0;
        }

        id v165 = v164;
        if (v165 || *(void *)(*(void *)&buf[8] + 40))
        {
          v166 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
          {
            uint64_t v182 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v303 = 138412546;
            *(void *)&v303[4] = v182;
            *(_WORD *)&v303[12] = 2112;
            *(void *)&v303[14] = v165;
            _os_log_error_impl(&dword_1D9BFA000, v166, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in processTripSegmentData,procError,%@,procSemaError,%@", v303, 0x16u);
          }
        }
        _Block_object_dispose(buf, 8);

        if (!v237) {
          goto LABEL_90;
        }
      }
      [(NSMutableArray *)self->_transitionLocations removeAllObjects];
      int v69 = 1;
LABEL_91:
      id v65 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_92;
      }
      uint64_t v167 = [v246 transitionIndex];
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = v167;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v245;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = v242;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v69;
      uint64_t v66 = "RTTripSegmentProvider: processTripSegmentData,compledOneChunk,transitionIndex,%tu,currentChunkIndex,%tu,last"
            "ChunkIndex,%tu,isFinalPart,%d";
      id v67 = v65;
      uint32_t v68 = 38;
      goto LABEL_96;
    }
    uint64_t v200 = v283[5];
    v168 = [v199 dateInterval];
    [(RTTripSegmentProvider *)self addToTransitionLocationsBuffer:v200 forDateInterval:v168];
    id v238 = 0;
    char v170 = 1;
LABEL_126:

    goto LABEL_128;
  }
LABEL_94:
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: _elevationAdjuster returned with %lu CLLocation breadcrumb samples", (uint8_t *)&v10, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_155(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) transitionIndex];
    id v6 = [*(id *)(a1 + 32) tripId];
    id v7 = [v6 UUIDString];
    uint64_t v8 = [*(id *)(a1 + 32) mode];
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    int v10 = [v3 toString];
    int v11 = 134219010;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    long long v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    double v20 = v10;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedCLLocations,transitionIndex,%tu,segmentUUID,%@,mode,%zd,locCount,%tu,location,%@", (uint8_t *)&v11, 0x34u);
  }
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_158(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) transitionIndex];
    id v6 = [*(id *)(a1 + 32) tripId];
    id v7 = [v6 UUIDString];
    uint64_t v8 = [*(id *)(a1 + 32) mode];
    uint64_t v9 = [v3 toString];
    int v10 = 134218754;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:breadcrumbLocations,transitionIndex,%tu,tripSegmentUUID,%@,mode,%zd,location,%@", (uint8_t *)&v10, 0x2Au);
  }
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_161(uint64_t a1, void *a2)
{
  id v3 = [a2 timestamp];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 128) firstObject];
  id v5 = [v4 timestamp];
  uint64_t v6 = [v3 isAfterDate:v5];

  return v6;
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 timestamp];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 128) lastObject];
  id v5 = [v4 timestamp];
  uint64_t v6 = [v3 isBeforeDate:v5];

  return v6;
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_166(uint64_t a1, void *a2)
{
  id v3 = [a2 cfAbsTimestamp];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 128) firstObject];
  id v5 = [v4 timestamp];
  uint64_t v6 = [v3 isAfterDate:v5];

  return v6;
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2_168(uint64_t a1, void *a2)
{
  id v3 = [a2 cfAbsTimestamp];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 128) lastObject];
  id v5 = [v4 timestamp];
  uint64_t v6 = [v3 isBeforeDate:v5];

  return v6;
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_169(void *a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = v3;
  if (!v3) {
    goto LABEL_14;
  }
  id v5 = [v3 tripLocations];
  uint64_t v6 = [v5 firstObject];
  id v7 = [v6 timestamp];
  if ([v7 isBeforeDate:a1[4]])
  {

LABEL_5:
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v33 = [v4 tripLocations];
      v34 = [v33 firstObject];
      long long v35 = [v34 timestamp];
      uint64_t v36 = a1[4];
      id v37 = [v4 tripLocations];
      dispatch_semaphore_t v38 = [v37 lastObject];
      v39 = [v38 timestamp];
      uint64_t v40 = a1[5];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2112;
      double v48 = v39;
      LOWORD(v49) = 2112;
      *(void *)((char *)&v49 + 2) = v40;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider:reconstructed location beyond desired time interval,%@,%@,%@,%@", buf, 0x2Au);
    }
    goto LABEL_8;
  }
  id v8 = [v4 tripLocations];
  id v9 = [v8 lastObject];
  int v10 = [v9 timestamp];
  int v11 = [v10 isAfterDate:a1[5]];

  if (v11) {
    goto LABEL_5;
  }
LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v48 = __Block_byref_object_copy__175;
  *(void *)&long long v49 = __Block_byref_object_dispose__175;
  *((void *)&v49 + 1) = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  __int16 v14 = *(void **)(a1[6] + 40);
  uint64_t v15 = [v4 isFinalPart];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_170;
  v42[3] = &unk_1E6B9D330;
  uint64_t v46 = a1[7];
  id v43 = v4;
  uint64_t v45 = buf;
  __int16 v16 = v13;
  id v44 = v16;
  [v14 addTripSegmentData:v43 isEndOfSegment:v15 handler:v42];
  __int16 v17 = (id *)(*(void *)&buf[8] + 40);
  id v18 = *(id *)(*(void *)&buf[8] + 40);
  __int16 v19 = v16;
  double v20 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v21 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v19, v21))
  {
    id v41 = [MEMORY[0x1E4F1C9C8] now];
    [v41 timeIntervalSinceDate:v20];
    double v23 = v22;
    __int16 v24 = objc_opt_new();
    uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
    long long v26 = [MEMORY[0x1E4F29060] callStackSymbols];
    unint64_t v27 = [v26 filteredArrayUsingPredicate:v25];
    __int16 v28 = [v27 firstObject];

    [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
    BOOL v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)dispatch_time_t v51 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
    }

    id v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    *(void *)dispatch_time_t v51 = @"semaphore wait timeout";
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    unint64_t v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v31];

    if (v32)
    {
      id v18 = v32;
    }
  }

  objc_storeStrong(v17, v18);
  _Block_object_dispose(buf, 8);

LABEL_14:
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_170(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v9 = *(void **)(a1 + 32);
    int v10 = [v9 tripSegmentID];
    int v11 = [*(id *)(a1 + 32) isFinalPart];
    int v12 = 138413314;
    dispatch_semaphore_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    __int16 v18 = 1024;
    int v19 = v11;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:%@, addedTripSegment, %@, tripId,%@, isFinalPart, %d, error, %@", (uint8_t *)&v12, 0x30u);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_173(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(a1 + 32) transitionIndex];
      uint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = *(void *)(a1 + 72);
      int v9 = [*(id *)(a1 + 40) isFinalPart];
      int v10 = [*(id *)(a1 + 40) tripSegmentID];
      *(_DWORD *)buf = 134219266;
      uint64_t v23 = v6;
      __int16 v24 = 2048;
      uint64_t v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      __int16 v28 = 1024;
      int v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v10;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v3;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: processTripSegmentData,fail,transitionIndex,%tu,chunkIndex,%tu,lastIndex,%tu,isFinalPart,%d,tripId,%@,receivedError,%@,completionHandler", buf, 0x3Au);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [*(id *)(a1 + 32) transitionIndex];
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 72);
    int v16 = [*(id *)(a1 + 40) isFinalPart];
    __int16 v17 = [*(id *)(a1 + 40) tripLocations];
    uint64_t v18 = [v17 count];
    uint64_t v19 = [*(id *)(a1 + 40) modeOfTransport];
    __int16 v20 = [*(id *)(a1 + 40) tripSegmentID];
    *(_DWORD *)buf = 134219522;
    uint64_t v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2048;
    uint64_t v27 = v21;
    __int16 v28 = 1024;
    int v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = v18;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    long long v35 = v20;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: processTripSegmentData,success,transitionIndex,%tu,currentChunkIndex,%tu,lastChunkIndex,%tu,isFinalPart,%d,locationCount,%tu,mode,%zd,tripId,%@", buf, 0x44u);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
  id v13 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)collectVehicleConnectionTimeIntervals:(id)a3
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F5CF50]) initWithDateInterval:v42 limit:0];
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  uint64_t v61 = __Block_byref_object_copy__175;
  id v62 = __Block_byref_object_dispose__175;
  id v63 = 0;
  uint64_t v52 = 0;
  double v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__175;
  id v56 = __Block_byref_object_dispose__175;
  id v57 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  vehicleStore = self->_vehicleStore;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __63__RTTripSegmentProvider_collectVehicleConnectionTimeIntervals___block_invoke;
  v48[3] = &unk_1E6B905F0;
  uint64_t v50 = &v52;
  dispatch_time_t v51 = &v58;
  uint64_t v7 = v5;
  long long v49 = v7;
  id v41 = (void *)v4;
  [(RTVehicleStore *)vehicleStore fetchVehiclesWithOptions:v4 handler:v48];
  uint64_t v8 = v7;
  int v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v9];
    double v13 = v12;
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
    int v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v17 = [v16 filteredArrayUsingPredicate:v15];
    uint64_t v18 = [v17 firstObject];

    [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    __int16 v20 = (void *)MEMORY[0x1E4F28C58];
    v70[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v70 count:1];
    id v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

    if (v22)
    {
      id v22 = v22;
    }
  }
  else
  {
    id v22 = 0;
  }

  id v23 = v22;
  __int16 v24 = [MEMORY[0x1E4F1CA48] array];
  if (v23 || v59[5])
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = v59[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v40;
      __int16 v65 = 2112;
      id v66 = v23;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: failed in vehicle connection fetching,fetchError,%@,semaError,%@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v27 = (void *)v53[5];
    if (v27 && [v27 count])
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v25 = (id)v53[5];
      uint64_t v28 = [v25 countByEnumeratingWithState:&v44 objects:v69 count:16];
      if (v28)
      {
        uint64_t v43 = 0;
        uint64_t v29 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            __int16 v32 = [v31 dateInterval];
            [v24 addObject:v32];

            uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              __int16 v34 = v24;
              long long v35 = v25;
              id v36 = v23;
              id v37 = v8;
              uint64_t v38 = [(id)v53[5] count];
              v39 = [v31 dateInterval];
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v38;
              __int16 v65 = 2048;
              id v66 = (id)(v43 + i);
              __int16 v67 = 2112;
              uint32_t v68 = v39;
              _os_log_debug_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: VehicleConnectionTimeIntervals,count,%tu,index,%tu,dateInterval,%@", buf, 0x20u);

              uint64_t v8 = v37;
              id v23 = v36;
              uint64_t v25 = v35;
              __int16 v24 = v34;
            }
          }
          uint64_t v28 = [v25 countByEnumeratingWithState:&v44 objects:v69 count:16];
          v43 += i;
        }
        while (v28);
      }
    }
    else
    {
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v42;
        _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: collectVehicleConnectionTimeIntervals, no vehicles found for transitionInterval,%@", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v24;
}

void __63__RTTripSegmentProvider_collectVehicleConnectionTimeIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)buildTripSegmentsForOneLearnedTransitionWithIndex:(unint64_t)a3 inTransitions:(id)a4 trainMode:(unint64_t)a5
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a5;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: buildTripSegmentsForOneLearnedTransitionWithIndex, trainMode, %lu", (uint8_t *)&buf, 0xCu);
  }

  if ([v7 count] && objc_msgSend(v7, "count") - 1 >= a3)
  {
    id v73 = [v7 objectAtIndexedSubscript:a3];
    id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
    dispatch_time_t v10 = [v73 startDate];
    id v11 = [v73 stopDate];
    int v69 = (void *)[v9 initWithStartDate:v10 endDate:v11];

    uint32_t v68 = [(RTTripSegmentProvider *)self collectVehicleConnectionTimeIntervals:v69];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v98 = 0x3032000000;
    id v99 = __Block_byref_object_copy__175;
    id v100 = __Block_byref_object_dispose__175;
    id v101 = 0;
    uint64_t v86 = 0;
    long long v87 = &v86;
    uint64_t v88 = 0x3032000000;
    id v89 = __Block_byref_object_copy__175;
    uint64_t v90 = __Block_byref_object_dispose__175;
    id v91 = [MEMORY[0x1E4F1C978] array];
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    double v13 = [(RTTripSegmentProvider *)self motionActivityManager];
    uint64_t v14 = [v73 startDate];
    uint64_t v15 = [v73 stopDate];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke;
    v82[3] = &unk_1E6B905F0;
    p_long long buf = &buf;
    unint64_t v85 = &v86;
    int v16 = v12;
    v83 = v16;
    [v13 fetchMotionActivitiesFromStartDate:v14 endDate:v15 handler:v82];

    dsema = v16;
    __int16 v17 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v18)) {
      goto LABEL_10;
    }
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
    [v19 timeIntervalSinceDate:v17];
    double v21 = v20;
    id v22 = objc_opt_new();
    id v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337_0];
    __int16 v24 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v25 = [v24 filteredArrayUsingPredicate:v23];
    __int16 v26 = [v25 firstObject];

    [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v92 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
    }

    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    v102[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v92 = @"semaphore wait timeout";
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v102 count:1];
    __int16 v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

    if (v30)
    {
      id v31 = v30;
    }
    else
    {
LABEL_10:
      id v31 = 0;
    }

    id v32 = v31;
    if (v32 || *(void *)(*((void *)&buf + 1) + 40))
    {
      uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)uint64_t v92 = 138412546;
        *(void *)&v92[4] = v42;
        __int16 v93 = 2112;
        uint64_t v94 = (uint64_t)v32;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: failed in motion activity fetching,fetchError,%@,semaError,%@", v92, 0x16u);
      }
    }
    else
    {
      __int16 v34 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v62 = [(id)v87[5] count];
        *(_DWORD *)uint64_t v92 = 134218240;
        *(void *)&v92[4] = a3;
        __int16 v93 = 2048;
        uint64_t v94 = v62;
        _os_log_debug_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedMotionActivitySummary,transitionIndex,%tu,countOfFetchedActivities,%tu", v92, 0x16u);
      }

      long long v35 = (void *)v87[5];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_175;
      v81[3] = &unk_1E6B9D3A8;
      v81[4] = &v86;
      v81[5] = a3;
      [v35 enumerateObjectsUsingBlock:v81];
      uint64_t v33 = objc_opt_new();
      __int16 v67 = -[NSObject removeNonTransportationModeActivities:dateInterval:vehicleIntervals:predominantActivityType:](v33, "removeNonTransportationModeActivities:dateInterval:vehicleIntervals:predominantActivityType:", v87[5], v69, v68, [v73 predominantMotionActivityType]);
      if ([v67 count])
      {
        id v36 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v63 = [v67 count];
          *(_DWORD *)uint64_t v92 = 134218240;
          *(void *)&v92[4] = a3;
          __int16 v93 = 2048;
          uint64_t v94 = v63;
          _os_log_debug_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: filteredMotionActivitySummary,transitionIndex,%tu,activityCount,%tu", v92, 0x16u);
        }

        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_178;
        v78[3] = &unk_1E6B9D3D0;
        unint64_t v80 = a3;
        id v37 = v67;
        double v79 = v37;
        [v37 enumerateObjectsUsingBlock:v78];
        if (a5 == 1)
        {
          uint64_t v38 = [v73 identifier];
          BOOL v39 = +[RTTripSegmentManager tripSegmentUUIDTypeFromUUID:v38] != 0;
        }
        else
        {
          BOOL v39 = 1;
        }
        uint64_t v43 = -[RTTripSegmentProvider buildTinySegmentArrayForTransitionWithIndex:withinDateInterval:fromActivity:uuidType:](self, "buildTinySegmentArrayForTransitionWithIndex:withinDateInterval:fromActivity:uuidType:", a3, v69, v37, v39, v67);
        long long v44 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v64 = [v43 count];
          *(_DWORD *)uint64_t v92 = 134218240;
          *(void *)&v92[4] = a3;
          __int16 v93 = 2048;
          uint64_t v94 = v64;
          _os_log_debug_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:generatedChunksSummary,transitionIndex,%tu,chunkCount,%tu", v92, 0x16u);
        }

        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_179;
        v74[3] = &unk_1E6B9D3F8;
        unint64_t v77 = a3;
        id v75 = v37;
        id v45 = v43;
        id v76 = v45;
        [v45 enumerateObjectsUsingBlock:v74];
        long long v46 = [(RTTripSegmentTransitionPreprocessor *)self->_transitionPreprocessor transitionStartStopLocations];
        long long v47 = [v7 objectAtIndexedSubscript:a3];
        double v48 = [v47 identifier];
        long long v49 = [v48 UUIDString];
        dispatch_semaphore_t v71 = [v46 objectForKeyedSubscript:v49];

        if (v71)
        {
          uint64_t v50 = [v71 startLocation];
          transitionStartLocation = self->_transitionStartLocation;
          self->_transitionStartLocation = v50;

          uint64_t v52 = [v71 stopLocation];
          transitionStopLocation = self->_transitionStopLocation;
          self->_transitionStopLocation = v52;

          uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            id v55 = [v7 objectAtIndexedSubscript:a3];
            id v56 = [v55 identifier];
            id v57 = self->_transitionStartLocation;
            uint64_t v58 = self->_transitionStopLocation;
            *(_DWORD *)uint64_t v92 = 138412802;
            *(void *)&v92[4] = v56;
            __int16 v93 = 2112;
            uint64_t v94 = (uint64_t)v57;
            __int16 v95 = 2112;
            id v96 = v58;
            _os_log_debug_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetch endpoints for transition identifier, %@, _transitionStartLocation, %@, _transitionStopLocation, %@", v92, 0x20u);
          }
        }
        else
        {
          id v59 = self->_transitionStartLocation;
          self->_transitionStartLocation = 0;

          uint64_t v60 = self->_transitionStopLocation;
          self->_transitionStopLocation = 0;

          uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            __int16 v65 = [v7 objectAtIndexedSubscript:a3];
            id v66 = [v65 identifier];
            *(_DWORD *)uint64_t v92 = 138412290;
            *(void *)&v92[4] = v66;
            _os_log_error_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: unable to fetch endpoints for transition identifier, %@", v92, 0xCu);
          }
        }

        [(NSMutableArray *)self->_transitionLocations removeAllObjects];
        for (unint64_t i = 0; i < [v45 count]; ++i)
          [(RTTripSegmentProvider *)self processChunkWithIndex:i inChunks:v45];

        uint64_t v40 = v79;
      }
      else
      {
        uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v41 = [v73 predominantMotionActivityType];
          *(_DWORD *)uint64_t v92 = 134218240;
          *(void *)&v92[4] = a3;
          __int16 v93 = 2048;
          uint64_t v94 = v41;
          _os_log_debug_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: skipThisTransition,%tu,lack of real mode of transportation,predominantType,%tu", v92, 0x16u);
        }
      }
    }
    _Block_object_dispose(&v86, 8);

    _Block_object_dispose(&buf, 8);
  }
}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_175(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
    int v9 = 134218754;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedMotionActivity,transitionIndex,%tu,rawActivityCount,%tu,rawActivityIndex,%tu,thisRawActivity,%@", (uint8_t *)&v9, 0x2Au);
  }
}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_178(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218754;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: filteredMotionActivity,transitionIndex,%tu,activityCount,%tu,activityIndex,%tu,thisFilteredActivity,%@", (uint8_t *)&v9, 0x2Au);
  }
}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_179(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 32) count];
    uint64_t v9 = [*(id *)(a1 + 40) count];
    int v10 = 134219010;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:generatedChunks,transitionIndex,%tu,activityCount,%tu,chunkIndex,%tu,chunkCount,%tu,thisChunk,%@", (uint8_t *)&v10, 0x34u);
  }
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTTripSegmentManager)tripSegmentManager
{
  return self->_tripSegmentManager;
}

- (void)setTripSegmentManager:(id)a3
{
}

- (CLTripSegmentProcessorManager)tripProcessorManager
{
  return self->_tripProcessorManager;
}

- (void)setTripProcessorManager:(id)a3
{
}

- (CLTripSegmentProcessorOptions)tripProcessorOptions
{
  return self->_tripProcessorOptions;
}

- (void)setTripProcessorOptions:(id)a3
{
}

- (RTTripSegmentInertialDataManager)inertialDataManager
{
  return self->_inertialDataManager;
}

- (void)setInertialDataManager:(id)a3
{
}

- (RTBackgroundInertialOdometryManager)inertialOdometryManager
{
  return self->_inertialOdometryManager;
}

- (void)setInertialOdometryManager:(id)a3
{
}

- (RTElevationAdjuster)elevationAdjuster
{
  return self->_elevationAdjuster;
}

- (void)setElevationAdjuster:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
}

- (RTTripSegmentTransitionPreprocessor)transitionPreprocessor
{
  return self->_transitionPreprocessor;
}

- (void)setTransitionPreprocessor:(id)a3
{
}

- (CLLocation)transitionStartLocation
{
  return self->_transitionStartLocation;
}

- (void)setTransitionStartLocation:(id)a3
{
}

- (CLLocation)transitionStopLocation
{
  return self->_transitionStopLocation;
}

- (void)setTransitionStopLocation:(id)a3
{
}

- (NSMutableArray)transitionLocations
{
  return self->_transitionLocations;
}

- (void)setTransitionLocations:(id)a3
{
}

- (double)processingChunkWidthSeconds
{
  return self->_processingChunkWidthSeconds;
}

- (void)setProcessingChunkWidthSeconds:(double)a3
{
  self->_double processingChunkWidthSeconds = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)sessionInProgress
{
  return self->_sessionInProgress;
}

- (void)setSessionInProgress:(BOOL)a3
{
  self->_sessionInProgress = a3;
}

- (BOOL)usingLegacyInertialData
{
  return self->_usingLegacyInertialData;
}

- (void)setUsingLegacyInertialData:(BOOL)a3
{
  self->_usingLegacyInertialData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transitionLocations, 0);
  objc_storeStrong((id *)&self->_transitionStopLocation, 0);
  objc_storeStrong((id *)&self->_transitionStartLocation, 0);
  objc_storeStrong((id *)&self->_transitionPreprocessor, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_elevationAdjuster, 0);
  objc_storeStrong((id *)&self->_inertialOdometryManager, 0);
  objc_storeStrong((id *)&self->_inertialDataManager, 0);
  objc_storeStrong((id *)&self->_tripProcessorOptions, 0);
  objc_storeStrong((id *)&self->_tripProcessorManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
}

@end