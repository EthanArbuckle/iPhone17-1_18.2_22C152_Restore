@interface RTTripSegmentManager
+ (BOOL)isValidSynthesizedLocation:(id)a3;
+ (id)uuidForTripSegmentOfType:(int64_t)a3;
+ (int64_t)periodicPurgePolicy;
+ (int64_t)translateModeOfTransport:(int64_t)a3;
+ (int64_t)tripSegmentUUIDTypeFromUUID:(id)a3;
- (BOOL)_applyElevationAdjustmentToReconstructedRoute;
- (BOOL)_checkIsTripSegmentGenerationEnabled;
- (BOOL)_favorNewerLocationsOverOlderLocationsForTripSegmentUnderConstruction;
- (BOOL)isSpeedValidityCheckingEnabled;
- (BOOL)isTripSegmentGenerationEnabled;
- (BOOL)tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations;
- (BOOL)tryPrepareForAddTripSegmentdata:(id)a3;
- (NSDate)tripSegmentUnderConstructionLastLocationTimestamp;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTElevationAdjuster)elevationAdjuster;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTSynthesizedLocationStore)locationStore;
- (RTTripSegment)tripSegmentUnderConstruction;
- (RTTripSegmentManager)initWithTripSegmentStore:(id)a3 synthesizedLocationStore:(id)a4 defaultsManager:(id)a5 elevationAdjuster:(id)a6 learnedLocationStore:(id)a7 distanceCalculator:(id)a8;
- (RTTripSegmentStore)tripSegmentStore;
- (id)_getPurgePolicyOverrideDaysToPersistTripSegmentData:(id)a3;
- (id)fetchDownsamplingLevelAnnotationForLocations:(id)a3;
- (id)getPreferredNameForLocation:(id)a3 isStartOfTripSegment:(BOOL)a4;
- (void)_addTripSegmentDataWithIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7 locations:(id)a8 isEndOfSegment:(BOOL)a9 handler:(id)a10;
- (void)_deleteTripSegmentWithUUID:(id)a3 handler:(id)a4;
- (void)_fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4;
- (void)_purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4;
- (void)_sanitizeTripSegmentDatabaseSinceDate:(id)a3 handler:(id)a4;
- (void)_setup;
- (void)_tripSegmentExistsForDateInterval:(id)a3 ignoreTemporary:(BOOL)a4 handler:(id)a5;
- (void)addLocationsToStore:(id)a3 handler:(id)a4;
- (void)addTripSegmentData:(id)a3 isEndOfSegment:(BOOL)a4 handler:(id)a5;
- (void)addTripSegmentDataWithIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7 locations:(id)a8 isEndOfSegment:(BOOL)a9 handler:(id)a10;
- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4;
- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4;
- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4;
- (void)fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4;
- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4;
- (void)purgeTripSegmentsPredating:(id)a3 handler:(id)a4;
- (void)sanitizeTripSegmentDatabaseSinceDate:(id)a3 handler:(id)a4;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setElevationAdjuster:(id)a3;
- (void)setIsTripSegmentGenerationEnabled:(BOOL)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLocationStore:(id)a3;
- (void)setTripSegmentStore:(id)a3;
- (void)setTripSegmentUnderConstruction:(id)a3;
- (void)setTripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations:(BOOL)a3;
- (void)setTripSegmentUnderConstructionLastLocationTimestamp:(id)a3;
- (void)tripSegmentExistsForDateInterval:(id)a3 handler:(id)a4;
- (void)tripSegmentExistsForDateInterval:(id)a3 ignoreTemporary:(BOOL)a4 handler:(id)a5;
@end

@implementation RTTripSegmentManager

- (RTTripSegmentManager)initWithTripSegmentStore:(id)a3 synthesizedLocationStore:(id)a4 defaultsManager:(id)a5 elevationAdjuster:(id)a6 learnedLocationStore:(id)a7 distanceCalculator:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v32 = a6;
  id v33 = a7;
  id v18 = a8;
  if (!v15)
  {
    v26 = v18;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: tripSegmentStore";
LABEL_19:
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_20;
  }
  if (!v16)
  {
    v26 = v18;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: synthesizedLocationStore";
    goto LABEL_19;
  }
  if (!v17)
  {
    v26 = v18;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_19;
  }
  if (!v33)
  {
    v26 = v18;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_19;
    }
LABEL_20:

    v24 = 0;
    v25 = v32;
    goto LABEL_21;
  }
  id v31 = v18;
  if (v18)
  {
    v34.receiver = self;
    v34.super_class = (Class)RTTripSegmentManager;
    v19 = [(RTNotifier *)&v34 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_tripSegmentStore, a3);
      objc_storeStrong((id *)&v20->_locationStore, a4);
      objc_storeStrong((id *)&v20->_defaultsManager, a5);
      objc_storeStrong((id *)&v20->_elevationAdjuster, a6);
      objc_storeStrong((id *)&v20->_learnedLocationStore, a7);
      objc_storeStrong((id *)&v20->_distanceCalculator, a8);
      tripSegmentUnderConstruction = v20->_tripSegmentUnderConstruction;
      v20->_tripSegmentUnderConstruction = 0;

      tripSegmentUnderConstructionLastLocationTimestamp = v20->_tripSegmentUnderConstructionLastLocationTimestamp;
      v20->_tripSegmentUnderConstructionLastLocationTimestamp = 0;

      [(RTService *)v20 setup];
      v23 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager successfully initialized.", buf, 2u);
      }
    }
    self = v20;
    v24 = self;
    v25 = v32;
  }
  else
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = v32;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v24 = 0;
  }
  v26 = v31;
LABEL_21:

  return v24;
}

- (void)_setup
{
  self->_isTripSegmentGenerationEnabled = [(RTTripSegmentManager *)self _checkIsTripSegmentGenerationEnabled];
  self->_tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations = [(RTTripSegmentManager *)self _favorNewerLocationsOverOlderLocationsForTripSegmentUnderConstruction];
}

- (BOOL)_checkIsTripSegmentGenerationEnabled
{
  v2 = [(RTTripSegmentManager *)self defaultsManager];
  v3 = [v2 objectForKey:@"RTDefaultsTripSegmentGenerationEnabled"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_favorNewerLocationsOverOlderLocationsForTripSegmentUnderConstruction
{
  v2 = [(RTTripSegmentManager *)self defaultsManager];
  v3 = [v2 objectForKey:@"RTDefaultsTripSegmentFavorNewerLocationsOverOlderLocations"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)uuidForTripSegmentOfType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F29128]);
    v6 = [v5 UUIDString];
    v7 = [v6 substringFromIndex:[@"00000000" length]];
    v8 = [@"00000000" stringByAppendingString:v7];
    id v9 = (id)[v4 initWithUUIDString:v8];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F29128]);
  }
  v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = [v9 UUIDString];
    int v13 = 134218242;
    int64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:uuidForTripSegmentOfType, type, %lu, UUID, %@", (uint8_t *)&v13, 0x16u);
  }

  return v9;
}

+ (int64_t)tripSegmentUUIDTypeFromUUID:(id)a3
{
  v3 = [a3 UUIDString];
  id v4 = [[v3 substringToIndex:0];
  unsigned int v5 = [v4 isEqualToString:@"00000000"];

  return v5;
}

- (void)_fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: invoking tripSegmentStore _fetchTripSegmentsWithOptions", v10, 2u);
  }

  id v9 = [(RTTripSegmentManager *)self tripSegmentStore];
  [v9 fetchTripSegmentsWithOptions:v7 handler:v6];
}

- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[RTTripSegmentManager fetchTripSegmentsWithOptions:handler:]";
    __int16 v19 = 1024;
    int v20 = 164;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTTripSegmentManager fetchTripSegmentsWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 165;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTTripSegmentManager_fetchTripSegmentsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __61__RTTripSegmentManager_fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTripSegmentsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v16 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: invoking tripSegmentStore _fetchLocationsCountForTripSegmentWithOptions", v16, 2u);
  }

  id v9 = objc_alloc(MEMORY[0x1E4F5CF68]);
  v10 = [v7 dateInterval];
  uint64_t v11 = [v7 preferredDownsamplingLevel];
  uint64_t v12 = [v7 batchSize];
  id v13 = [v7 boundingBoxLocation];

  int64_t v14 = (void *)[v9 initWithDateInterval:v10 preferredDownsamplingLevel:v11 batchSize:v12 boundingBoxLocation:v13];
  id v15 = [(RTTripSegmentManager *)self locationStore];
  [v15 fetchStoredLocationsCountWithOptions:v14 handler:v6];
}

- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[RTTripSegmentManager fetchLocationsCountForTripSegmentWithOptions:handler:]";
    __int16 v19 = 1024;
    int v20 = 190;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTTripSegmentManager fetchLocationsCountForTripSegmentWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 191;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  uint64_t v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__RTTripSegmentManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __77__RTTripSegmentManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsCountForTripSegmentWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

+ (BOOL)isValidSynthesizedLocation:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_16;
  }
  [v3 coordinate];
  if (v5 == 0.0)
  {
    [v4 coordinate];
    if (v6 == 0.0) {
      goto LABEL_16;
    }
  }
  [v4 coordinate];
  if (fabs(v7) > 90.0) {
    goto LABEL_16;
  }
  [v4 coordinate];
  if (fabs(v8) > 360.0) {
    goto LABEL_16;
  }
  [v4 speed];
  if (v9 < 0.0) {
    goto LABEL_16;
  }
  [v4 speed];
  BOOL v10 = 0;
  if (fabs(v11) == INFINITY) {
    goto LABEL_17;
  }
  [v4 horizontalAccuracy];
  if (v12 <= 0.0) {
    goto LABEL_16;
  }
  [v4 horizontalAccuracy];
  BOOL v10 = 0;
  if (fabs(v13) == INFINITY) {
    goto LABEL_17;
  }
  [v4 verticalAccuracy];
  if (v14 <= 0.0) {
    goto LABEL_16;
  }
  [v4 verticalAccuracy];
  BOOL v10 = 0;
  if (fabs(v15) == INFINITY) {
    goto LABEL_17;
  }
  [v4 speedAccuracy];
  if (v16 <= 0.0)
  {
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  [v4 speedAccuracy];
  double v18 = fabs(v17);
  BOOL v10 = v18 > INFINITY || v18 < INFINITY;
LABEL_17:

  return v10;
}

- (void)_fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = (objc_class *)MEMORY[0x1E4F5CF68];
  id v8 = a3;
  id v9 = [v7 alloc];
  BOOL v10 = [v8 dateInterval];
  uint64_t v11 = [v8 preferredDownsamplingLevel];
  uint64_t v12 = [v8 batchSize];
  double v13 = [v8 boundingBoxLocation];
  double v14 = (void *)[v9 initWithDateInterval:v10 preferredDownsamplingLevel:v11 batchSize:v12 boundingBoxLocation:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F5CF60]);
  uint64_t v16 = [v8 offset];

  double v17 = (void *)[v15 initWithEnumerationOptions:v14 offset:v16];
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  __int16 v19 = [(RTTripSegmentManager *)self locationStore];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __73__RTTripSegmentManager__fetchLocationsForTripSegmentWithOptions_handler___block_invoke;
  v45[3] = &unk_1E6B90688;
  id v20 = v6;
  id v47 = v20;
  uint64_t v21 = v18;
  v46 = v21;
  [v19 fetchStoredLocationsWithContext:v17 handler:v45];

  v22 = v21;
  v23 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v24 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v22, v24))
  {
    id v42 = v20;
    v43 = v17;
    v44 = v14;
    v25 = [MEMORY[0x1E4F1C9C8] now];
    [v25 timeIntervalSinceDate:v23];
    double v27 = v26;
    v28 = objc_opt_new();
    v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    v30 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v31 = [v30 filteredArrayUsingPredicate:v29];
    id v32 = [v31 firstObject];

    [v28 submitToCoreAnalytics:v32 type:1 duration:v27];
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    objc_super v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F5CFE8];
    v49[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    char v36 = 1;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v49 count:1];
    v38 = [v34 errorWithDomain:v35 code:15 userInfo:v37];

    if (v38)
    {
      id v39 = v38;

      char v36 = 0;
    }
    else
    {
      id v39 = 0;
    }
    double v17 = v43;
    double v14 = v44;
    id v20 = v42;
  }
  else
  {
    id v39 = 0;
    char v36 = 1;
  }

  id v40 = v39;
  if ((v36 & 1) == 0)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_debug_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager fetchStoredLocationsWithOptions timeout %@", buf, 0xCu);
    }
  }
}

void __73__RTTripSegmentManager__fetchLocationsForTripSegmentWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [v13 coordinate];
        double v36 = v15;
        double v17 = v16;
        [v13 altitude];
        double v19 = v18;
        [v13 horizontalAccuracy];
        double v21 = v20;
        [v13 verticalAccuracy];
        double v23 = v22;
        [v13 course];
        double v25 = v24;
        [v13 courseAccuracy];
        double v27 = v26;
        [v13 speed];
        double v29 = v28;
        [v13 speedAccuracy];
        uint64_t v31 = v30;
        id v32 = [v13 timestamp];
        id v33 = [v14 initWithCoordinate:v32 altitude:v36 horizontalAccuracy:v17 verticalAccuracy:v19 course:v21 courseAccuracy:v23 speed:v25 speedAccuracy:v27 timestamp:v29];
        [v7 addObject:v33];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v10);
  }

  objc_super v34 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = [v7 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v42 = v35;
    _os_log_debug_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager converted %lu RTSynthesizedLocations to CLLocations", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    double v18 = "-[RTTripSegmentManager fetchLocationsForTripSegmentWithOptions:handler:]";
    __int16 v19 = 1024;
    int v20 = 278;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v18 = "-[RTTripSegmentManager fetchLocationsForTripSegmentWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 279;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  uint64_t v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTTripSegmentManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __72__RTTripSegmentManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsForTripSegmentWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)getPreferredNameForLocation:(id)a3 isStartOfTripSegment:(BOOL)a4
{
  BOOL v4 = a4;
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v6 coordinate];
    double v9 = v8;
    double v11 = v10;
    [v6 altitude];
    double v13 = v12;
    id v14 = [v6 timestamp];
    id v15 = [v7 initWithCoordinate:v14 altitude:v9 horizontalAccuracy:v11 verticalAccuracy:v13 timestamp:1.0];

    id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
    if (v4)
    {
      double v17 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v18 = v16;
      id v19 = [v17 alloc];
      int v20 = [v6 timestamp];
      id v21 = (id)[v19 initWithTimeInterval:v20 sinceDate:-86400.0];
      double v22 = (void *)[v18 initWithStartDate:v21 duration:86400.0];
    }
    else
    {
      id v21 = v16;
      int v20 = [v6 timestamp];
      double v22 = (void *)[v21 initWithStartDate:v20 duration:86400.0];
    }

    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__1;
    v59 = __Block_byref_object_dispose__1;
    id v60 = 0;
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    double v26 = [v22 startDate];
    double v27 = [v22 endDate];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __73__RTTripSegmentManager_getPreferredNameForLocation_isStartOfTripSegment___block_invoke;
    v50[3] = &unk_1E6B906B0;
    BOOL v54 = v4;
    id v49 = v15;
    id v51 = v49;
    v53 = &v55;
    double v28 = v24;
    v52 = v28;
    [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestVisitedBetweenStartDate:v26 endDate:v27 handler:v50];

    double v29 = v28;
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v31 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v29, v31)) {
      goto LABEL_11;
    }
    id v32 = [MEMORY[0x1E4F1C9C8] now];
    [v32 timeIntervalSinceDate:v30];
    double v34 = v33;
    uint64_t v35 = objc_opt_new();
    double v36 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    long long v37 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v38 = [v37 filteredArrayUsingPredicate:v36];
    long long v39 = [v38 firstObject];

    [v35 submitToCoreAnalytics:v39 type:1 duration:v34];
    long long v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v41 = (void *)MEMORY[0x1E4F28C58];
    v62[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v62 count:1];
    v43 = [v41 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v42];

    if (v43)
    {
      id v44 = v43;

      char v45 = 0;
    }
    else
    {
LABEL_11:
      id v44 = 0;
      char v45 = 1;
    }

    id v46 = v44;
    if ((v45 & 1) == 0)
    {
      id v47 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_debug_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager [_learnedLocationStore fetchLocationsOfInterestVisitedBetweenStartDate:endDate:]: timeout %@", buf, 0xCu);
      }
    }
    id v23 = (id)v56[5];

    _Block_object_dispose(&v55, 8);
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

intptr_t __73__RTTripSegmentManager_getPreferredNameForLocation_isStartOfTripSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:a2];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v38;
      double v4 = 600.0;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = v5;
          id v6 = *(void **)(*((void *)&v37 + 1) + 8 * v5);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v7 = [v6 visits];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v34 != v10) {
                  objc_enumerationMutation(v7);
                }
                double v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
                id v14 = [v6 location];
                [v14 latitude];
                double v16 = v15;
                double v17 = [v6 location];
                [v17 longitude];
                id v19 = (void *)[v13 initWithLatitude:v16 longitude:v18];

                LODWORD(v17) = *(unsigned __int8 *)(a1 + 56);
                int v20 = [*(id *)(a1 + 32) timestamp];
                if (v17) {
                  [v12 exitDate];
                }
                else {
                id v21 = [v12 entryDate];
                }
                [v20 timeIntervalSinceDate:v21];
                double v23 = fabs(v22);

                [*(id *)(a1 + 32) distanceFromLocation:v19];
                if (v23 < v4 && v24 < 250.0)
                {
                  uint64_t v25 = [v6 preferredName];
                  uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
                  double v27 = *(void **)(v26 + 40);
                  *(void *)(v26 + 40) = v25;

                  double v4 = v23;
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v9);
          }

          uint64_t v5 = v32 + 1;
        }
        while (v32 + 1 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v31);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F5CF68]);
  v216 = v5;
  uint64_t v8 = [v5 dateInterval];
  v180 = (void *)[v7 initWithDateInterval:v8 preferredDownsamplingLevel:0 batchSize:0 boundingBoxLocation:0];

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v224 = 0;
  v225 = &v224;
  uint64_t v226 = 0x2020000000;
  uint64_t v227 = 0;
  uint64_t v10 = [(RTTripSegmentManager *)self locationStore];
  v220[0] = MEMORY[0x1E4F143A8];
  v220[1] = 3221225472;
  v220[2] = __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke;
  v220[3] = &unk_1E6B906D8;
  id v175 = v6;
  id v222 = v175;
  v223 = &v224;
  double v11 = v9;
  v221 = v11;
  [v10 fetchStoredLocationsCountWithOptions:v180 handler:v220];

  dsema = v11;
  double v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  intptr_t v14 = dispatch_semaphore_wait(dsema, v13);
  double v15 = (uint64_t *)MEMORY[0x1E4F5CFE8];
  double v16 = (void *)MEMORY[0x1E4F28568];
  if (v14)
  {
    double v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:v12];
    double v19 = v18;
    int v20 = objc_opt_new();
    id v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    double v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v23 = [v22 filteredArrayUsingPredicate:v21];
    double v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v231 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v231, 2u);
    }

    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    *(void *)&long long buf = *v16;
    *(void *)v231 = @"semaphore wait timeout";
    double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v231 forKeys:&buf count:1];
    id v28 = [v26 errorWithDomain:*v15 code:15 userInfo:v27];

    if (v28)
    {
      id v28 = v28;

      char v29 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v28 = 0;
  }
  char v29 = 1;
LABEL_8:

  id v30 = v28;
  if ((v29 & 1) == 0)
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v231 = 138412290;
      *(void *)&v231[4] = v30;
      _os_log_debug_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager _fetchRoadClassForTripSegmentWithOptions timeout %@", v231, 0xCu);
    }
  }
  if ([v216 fetchRoadClass]) {
    id v198 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v198 = 0;
  }
  if ([v216 fetchFormOfWay]) {
    id v197 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v197 = 0;
  }
  if ([v216 fetchLocationType]) {
    id v196 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v196 = 0;
  }
  v181 = 0;
  long long v33 = 0;
  unint64_t v188 = 0;
  v177 = 0;
  uint64_t v178 = *v15;
  uint64_t v179 = *v16;
  double v34 = 0.0;
  *(void *)&long long v32 = 138412290;
  long long v174 = v32;
  do
  {
    v184 = (void *)[objc_alloc(MEMORY[0x1E4F5CF60]) initWithEnumerationOptions:v180 offset:v188];
    dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
    *(void *)v231 = 0;
    *(void *)&v231[8] = v231;
    *(void *)&v231[16] = 0x3032000000;
    v232 = __Block_byref_object_copy__1;
    v233 = __Block_byref_object_dispose__1;
    id v234 = 0;
    long long v36 = [(RTTripSegmentManager *)self locationStore];
    v217[0] = MEMORY[0x1E4F143A8];
    v217[1] = 3221225472;
    v217[2] = __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke_74;
    v217[3] = &unk_1E6B90700;
    v219 = v231;
    long long v37 = v35;
    v218 = v37;
    [v36 fetchStoredLocationsWithContext:v184 handler:v217];

    v192 = v37;
    long long v38 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v39 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v192, v39)) {
      goto LABEL_27;
    }
    long long v40 = [MEMORY[0x1E4F1C9C8] now];
    [v40 timeIntervalSinceDate:v38];
    double v42 = v41;
    uint64_t v43 = objc_opt_new();
    id v44 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    char v45 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v46 = [v45 filteredArrayUsingPredicate:v44];
    id v47 = [v46 firstObject];

    [v43 submitToCoreAnalytics:v47 type:1 duration:v42];
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
    }

    id v49 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v228 = v179;
    *(void *)&long long buf = @"semaphore wait timeout";
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v228 count:1];
    id v51 = [v49 errorWithDomain:v178 code:15 userInfo:v50];

    if (v51)
    {
      id v52 = v51;

      char v53 = 0;
    }
    else
    {
LABEL_27:
      char v53 = 1;
      id v52 = v30;
    }

    id v183 = v52;
    if ((v53 & 1) == 0)
    {
      BOOL v54 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = v174;
        *(void *)((char *)&buf + 4) = v183;
        _os_log_debug_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager _fetchRoadClassForTripSegmentWithOptions timeout %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (objc_msgSend(*(id *)(*(void *)&v231[8] + 40), "count", v174))
    {
      if (!v188)
      {
        uint64_t v55 = [*(id *)(*(void *)&v231[8] + 40) firstObject];

        uint64_t v56 = [*(id *)(*(void *)&v231[8] + 40) firstObject];

        v177 = (void *)v55;
        long long v33 = (void *)v56;
      }
      uint64_t v57 = [*(id *)(*(void *)&v231[8] + 40) lastObject];

      v181 = (void *)v57;
    }
    uint64_t v182 = [*(id *)(*(void *)&v231[8] + 40) count];
    uint64_t v58 = [*(id *)(*(void *)&v231[8] + 40) count];
    v59 = [*(id *)(*(void *)&v231[8] + 40) firstObject];
    v207 = [v59 timestamp];

    id v60 = [*(id *)(*(void *)&v231[8] + 40) firstObject];
    v203 = [v60 timestamp];

    v61 = [*(id *)(*(void *)&v231[8] + 40) firstObject];
    v199 = [v61 timestamp];

    v62 = [*(id *)(*(void *)&v231[8] + 40) firstObject];
    uint64_t v211 = [v62 geoRoadClass];

    v63 = [*(id *)(*(void *)&v231[8] + 40) firstObject];
    uint64_t v64 = [v63 geoFormOfWay];

    v65 = [*(id *)(*(void *)&v231[8] + 40) firstObject];
    uint64_t v66 = [v65 locationType];

    v188 += v58;
    double v67 = v34;
    double v68 = v34;
    double v69 = v34;
    for (unint64_t i = 1; i < [*(id *)(*(void *)&v231[8] + 40) count]; ++i)
    {
      long long buf = 0uLL;
      [v33 coordinate];
      *(void *)&long long buf = v71;
      *((void *)&buf + 1) = v72;
      uint64_t v228 = 0;
      uint64_t v229 = 0;
      v73 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
      [v73 coordinate];
      uint64_t v228 = v74;
      uint64_t v229 = v75;

      v76 = [(RTTripSegmentManager *)self distanceCalculator];
      [v76 distanceFromLocationCoordinate:&buf toLocationCoordinate:&v228 error:0];
      double v78 = v77;

      uint64_t v79 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];

      double v34 = v34 + v78;
      if ([v216 fetchRoadClass])
      {
        v80 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
        uint64_t v81 = [v80 geoRoadClass];

        if (i == [*(id *)(*(void *)&v231[8] + 40) count] - 1 || v211 != v81)
        {
          id v82 = objc_alloc(MEMORY[0x1E4F5CFB0]);
          id v83 = objc_alloc(MEMORY[0x1E4F28C18]);
          v84 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
          v85 = [v84 timestamp];
          v86 = (void *)[v83 initWithStartDate:v207 endDate:v85];
          v87 = (void *)[objc_alloc(MEMORY[0x1E4F5CDB8]) initWithStartDistance:v67 endDistance:v34];
          v88 = (void *)[v82 initWithDateInterval:v86 distanceInterval:v87 geoRoadClass:v211];
          [v198 addObject:v88];

          v89 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
          uint64_t v90 = [v89 timestamp];

          v207 = (void *)v90;
          uint64_t v211 = v81;
          double v67 = v34;
        }
      }
      if ([v216 fetchFormOfWay])
      {
        v91 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
        uint64_t v92 = [v91 geoFormOfWay];

        if (i == [*(id *)(*(void *)&v231[8] + 40) count] - 1 || v64 != v92)
        {
          id v93 = objc_alloc(MEMORY[0x1E4F5CF80]);
          id v94 = objc_alloc(MEMORY[0x1E4F28C18]);
          v95 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
          v96 = [v95 timestamp];
          v97 = (void *)[v94 initWithStartDate:v203 endDate:v96];
          v98 = (void *)[objc_alloc(MEMORY[0x1E4F5CDB8]) initWithStartDistance:v68 endDistance:v34];
          v99 = (void *)[v93 initWithDateInterval:v97 distanceInterval:v98 geoFormOfWay:v64];
          [v197 addObject:v99];

          v100 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
          uint64_t v101 = [v100 timestamp];

          v203 = (void *)v101;
          double v68 = v34;
          uint64_t v64 = v92;
        }
      }
      if ([v216 fetchLocationType])
      {
        v102 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
        uint64_t v103 = [v102 locationType];

        if (i == [*(id *)(*(void *)&v231[8] + 40) count] - 1 || v66 != v103)
        {
          id v104 = objc_alloc(MEMORY[0x1E4F5CF98]);
          id v105 = objc_alloc(MEMORY[0x1E4F28C18]);
          v106 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
          v107 = [v106 timestamp];
          v108 = (void *)[v105 initWithStartDate:v199 endDate:v107];
          v109 = (void *)[objc_alloc(MEMORY[0x1E4F5CDB8]) initWithStartDistance:v69 endDistance:v34];
          v110 = (void *)[v104 initWithDateInterval:v108 distanceInterval:v109 locationType:v66];
          [v196 addObject:v110];

          v111 = [*(id *)(*(void *)&v231[8] + 40) objectAtIndexedSubscript:i];
          uint64_t v112 = [v111 timestamp];

          v199 = (void *)v112;
          double v69 = v34;
          uint64_t v66 = v103;
        }
      }
      long long v33 = (void *)v79;
    }

    _Block_object_dispose(v231, 8);
    if (v188 >= v225[3]) {
      break;
    }
    id v30 = v183;
  }
  while (v182 > 0);
  if (v198 && (unint64_t)[v198 count] >= 2)
  {
    unint64_t v113 = 0;
LABEL_56:
    unint64_t v212 = v113;
    unint64_t v208 = v113 + 1;
    while (v212 < [v198 count] - 1)
    {
      v114 = [v198 objectAtIndexedSubscript:];
      uint64_t v115 = [v114 geoRoadClass];
      v116 = [v198 objectAtIndexedSubscript:v208];
      LODWORD(v115) = v115 == [v116 geoRoadClass];

      if (!v115)
      {
        unint64_t v113 = v208;
        goto LABEL_56;
      }
      id v117 = objc_alloc(MEMORY[0x1E4F5CFB0]);
      id v118 = objc_alloc(MEMORY[0x1E4F28C18]);
      v204 = [v198 objectAtIndexedSubscript:v212];
      v200 = [v204 dateInterval];
      v185 = [v200 startDate];
      dispatch_semaphore_t v193 = [v198 objectAtIndexedSubscript:v208];
      v189 = [v193 dateInterval];
      v119 = [v189 endDate];
      v120 = (void *)[v118 initWithStartDate:v185 endDate:v119];
      id v121 = objc_alloc(MEMORY[0x1E4F5CDB8]);
      v122 = [v198 objectAtIndexedSubscript:v212];
      v123 = [v122 distanceInterval];
      [v123 startDistance];
      double v125 = v124;
      v126 = [v198 objectAtIndexedSubscript:v208];
      v127 = [v126 distanceInterval];
      [v127 endDistance];
      v129 = (void *)[v121 initWithStartDistance:v125 endDistance:v128];
      v130 = [v198 objectAtIndexedSubscript:v212];
      v131 = [v117 initWithDateInterval:v120 distanceInterval:v129 geoRoadClass:[v130 geoRoadClass]];
      [v198 setObject:v131 atIndexedSubscript:v208];

      [v198 removeObjectAtIndex:v212];
    }
  }
  if (v197 && (unint64_t)[v197 count] >= 2)
  {
    unint64_t v132 = 0;
LABEL_64:
    unint64_t v213 = v132;
    unint64_t v209 = v132 + 1;
    while (v213 < [v197 count] - 1)
    {
      v133 = [v197 objectAtIndexedSubscript:];
      uint64_t v134 = [v133 geoFormOfWay];
      v135 = [v197 objectAtIndexedSubscript:v209];
      LODWORD(v134) = v134 == [v135 geoFormOfWay];

      if (!v134)
      {
        unint64_t v132 = v209;
        goto LABEL_64;
      }
      id v136 = objc_alloc(MEMORY[0x1E4F5CF80]);
      id v137 = objc_alloc(MEMORY[0x1E4F28C18]);
      v205 = [v197 objectAtIndexedSubscript:v213];
      v201 = [v205 dateInterval];
      v186 = [v201 startDate];
      dispatch_semaphore_t v194 = [v197 objectAtIndexedSubscript:v209];
      v190 = [v194 dateInterval];
      v138 = [v190 endDate];
      v139 = (void *)[v137 initWithStartDate:v186 endDate:v138];
      id v140 = objc_alloc(MEMORY[0x1E4F5CDB8]);
      v141 = [v197 objectAtIndexedSubscript:v213];
      v142 = [v141 distanceInterval];
      [v142 startDistance];
      double v144 = v143;
      v145 = [v197 objectAtIndexedSubscript:v209];
      v146 = [v145 distanceInterval];
      [v146 endDistance];
      v148 = (void *)[v140 initWithStartDistance:v144 endDistance:v147];
      v149 = [v197 objectAtIndexedSubscript:v213];
      v150 = [v136 initWithDateInterval:v139 distanceInterval:v148 geoFormOfWay:[v149 geoFormOfWay]];
      [v197 setObject:v150 atIndexedSubscript:v209];

      [v197 removeObjectAtIndex:v213];
    }
  }
  if (v196 && (unint64_t)[v196 count] >= 2)
  {
    unint64_t v151 = 0;
LABEL_72:
    unint64_t v214 = v151;
    unint64_t v210 = v151 + 1;
    while (v214 < [v196 count] - 1)
    {
      v152 = [v196 objectAtIndexedSubscript:];
      uint64_t v153 = [v152 locationType];
      v154 = [v196 objectAtIndexedSubscript:v210];
      LODWORD(v153) = v153 == [v154 locationType];

      if (!v153)
      {
        unint64_t v151 = v210;
        goto LABEL_72;
      }
      id v155 = objc_alloc(MEMORY[0x1E4F5CF98]);
      id v156 = objc_alloc(MEMORY[0x1E4F28C18]);
      v206 = [v196 objectAtIndexedSubscript:v214];
      v202 = [v206 dateInterval];
      v187 = [v202 startDate];
      dispatch_semaphore_t v195 = [v196 objectAtIndexedSubscript:v210];
      v191 = [v195 dateInterval];
      v157 = [v191 endDate];
      v158 = (void *)[v156 initWithStartDate:v187 endDate:v157];
      id v159 = objc_alloc(MEMORY[0x1E4F5CDB8]);
      v160 = [v196 objectAtIndexedSubscript:v214];
      v161 = [v160 distanceInterval];
      [v161 startDistance];
      double v163 = v162;
      v164 = [v196 objectAtIndexedSubscript:v210];
      v165 = [v164 distanceInterval];
      [v165 endDistance];
      v167 = (void *)[v159 initWithStartDistance:v163 endDistance:v166];
      v168 = [v196 objectAtIndexedSubscript:v214];
      v169 = [v155 initWithDateInterval:v158 distanceInterval:v167 locationType:[v168 locationType]];
      [v196 setObject:v169 atIndexedSubscript:v210];

      [v196 removeObjectAtIndex:v214];
    }
  }
  if ([v216 fetchPreferredNames])
  {
    v170 = [(RTTripSegmentManager *)self getPreferredNameForLocation:v177 isStartOfTripSegment:1];
    v171 = [(RTTripSegmentManager *)self getPreferredNameForLocation:v181 isStartOfTripSegment:0];
    v172 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v231 = 138412546;
      *(void *)&v231[4] = v170;
      *(_WORD *)&v231[12] = 2112;
      *(void *)&v231[14] = v171;
      _os_log_debug_impl(&dword_1D9BFA000, v172, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager startPreferredName %@, endPreferredName %@", v231, 0x16u);
    }
  }
  else
  {
    v170 = 0;
    v171 = 0;
  }
  v173 = (void *)[objc_alloc(MEMORY[0x1E4F5CFA0]) initWithRoadClass:v198 formOfWay:v197 locationType:v196 startLocationName:v170 endLocationName:v171];
  (*((void (**)(id, void *, void))v175 + 2))(v175, v173, 0);

  _Block_object_dispose(&v224, 8);
}

intptr_t __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  id v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

void __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke_74(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  dispatch_semaphore_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    double v18 = "-[RTTripSegmentManager fetchTripSegmentMetadataWithOptions:handler:]";
    __int16 v19 = 1024;
    int v20 = 582;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      double v18 = "-[RTTripSegmentManager fetchTripSegmentMetadataWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 583;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  double v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTTripSegmentManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __68__RTTripSegmentManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTripSegmentMetadataWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchDownsamplingLevelAnnotationForLocations:(id)a3
{
  id v3 = a3;
  id v47 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v3 count]];
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      id v52 = [v3 objectAtIndexedSubscript:v4];
      [v52 coordinate];
      double v48 = v6;
      id v51 = [v3 objectAtIndexedSubscript:v4];
      [v51 coordinate];
      double v8 = v7;
      v50 = [v3 objectAtIndexedSubscript:v4];
      [v50 altitude];
      double v10 = v9;
      id v49 = [v3 objectAtIndexedSubscript:v4];
      [v49 speed];
      double v12 = v11;
      id v13 = [v3 objectAtIndexedSubscript:v4];
      [v13 course];
      double v15 = v14;
      id v16 = [v3 objectAtIndexedSubscript:v4];
      [v16 horizontalAccuracy];
      double v18 = v17;
      __int16 v19 = [v3 objectAtIndexedSubscript:v4];
      [v19 verticalAccuracy];
      double v21 = v20;
      double v22 = [v3 objectAtIndexedSubscript:v4];
      [v22 speedAccuracy];
      double v24 = v23;
      uint64_t v25 = [v3 objectAtIndexedSubscript:v4];
      [v25 courseAccuracy];
      uint64_t v27 = v26;
      id v28 = [v3 objectAtIndexedSubscript:v4];
      char v29 = [v28 timestamp];
      id v30 = (void *)[v5 initWithLatitude:0 longitude:v29 altitude:v48 speed:v8 course:v10 horizontalAccuracy:v12 verticalAccuracy:v15 speedAccuracy:v18 courseAccuracy:v21 type:v24 timestamp:v27];
      [v47 setObject:v30 atIndexedSubscript:v4];

      ++v4;
    }
    while (v4 < [v3 count]);
  }
  uint64_t v31 = (void *)MEMORY[0x1E4F5CE08];
  long long v32 = [MEMORY[0x1E4F5CE08] createErrorFunctionWithAbsoluteCrosstrackDistance];
  long long v33 = [v31 downsampleLocations:v47 errorFunction:v32 errorThreshold:0 outputSize:1.0];

  double v34 = (void *)MEMORY[0x1E4F5CE08];
  dispatch_semaphore_t v35 = [MEMORY[0x1E4F5CE08] createErrorFunctionWithAbsoluteCrosstrackDistance];
  long long v36 = [v34 downsampleLocations:v47 errorFunction:v35 errorThreshold:0 outputSize:2.5];

  long long v37 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v3 count]];
  long long v38 = v47;
  if ([v3 count])
  {
    unint64_t v39 = 0;
    unint64_t v40 = 0;
    unint64_t v41 = 0;
    do
    {
      [v37 setObject:&unk_1F344F358 atIndexedSubscript:v41];
      double v42 = v38;
      uint64_t v43 = [v38 objectAtIndex:v41];
      if (v39 < [v33 count])
      {
        id v44 = [v33 objectAtIndex:v39];
        if ([v43 isEqual:v44])
        {
          [v37 setObject:&unk_1F344F370 atIndexedSubscript:v41];
          ++v39;
        }
      }
      if (v40 < [v36 count])
      {
        char v45 = [v36 objectAtIndex:v40];
        if ([v43 isEqual:v45])
        {
          [v37 setObject:&unk_1F344F388 atIndexedSubscript:v41];
          ++v40;
        }
      }
      ++v41;
      long long v38 = v42;
    }
    while (v41 < [v3 count]);
  }

  return v37;
}

- (void)addLocationsToStore:(id)a3 handler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      double v20 = "-[RTTripSegmentManager addLocationsToStore:handler:]";
      __int16 v21 = 1024;
      LODWORD(v22) = 653;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }
  }
  double v9 = [(RTTripSegmentManager *)self fetchDownsamplingLevelAnnotationForLocations:v6];
  uint64_t v10 = [v9 count];
  if (v10 != [v6 count])
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v9 count];
      uint64_t v18 = [v6 count];
      int v19 = 134218754;
      double v20 = (const char *)v17;
      __int16 v21 = 2048;
      uint64_t v22 = v18;
      __int16 v23 = 2080;
      double v24 = "-[RTTripSegmentManager addLocationsToStore:handler:]";
      __int16 v25 = 1024;
      int v26 = 667;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "downsampling annotation array length is not equal to locations array legnth, %tu != %tu (in %s:%d)", (uint8_t *)&v19, 0x26u);
    }
  }
  if ([v6 count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v9 objectAtIndexedSubscript:v12];
      uint64_t v14 = (int)[v13 intValue];
      double v15 = [v6 objectAtIndexedSubscript:v12];
      [v15 setDownsamplingLevel:v14];

      ++v12;
    }
    while (v12 < [v6 count]);
  }
  id v16 = [(RTTripSegmentManager *)self locationStore];
  [v16 storeLocations:v6 handler:v7];
}

+ (int64_t)translateModeOfTransport:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1DA0FF088[a3 - 1];
  }
}

- (BOOL)_applyElevationAdjustmentToReconstructedRoute
{
  v2 = [(RTTripSegmentManager *)self defaultsManager];
  id v3 = [v2 objectForKey:@"RTDefaultsTripSegmentAdjustElevationForReconstructedRoute"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)tryPrepareForAddTripSegmentdata:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5CF48]) initWithAscending:1 dateInterval:v4 limit:0];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke;
  v26[3] = &unk_1E6B90750;
  id v30 = &v31;
  id v7 = v4;
  id v27 = v7;
  id v28 = self;
  double v8 = v6;
  char v29 = v8;
  [(RTTripSegmentManager *)self _fetchTripSegmentsWithOptions:v5 handler:v26];
  double v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    unint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSinceDate:v10];
    double v14 = v13;
    double v15 = objc_opt_new();
    id v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v18 = [v17 filteredArrayUsingPredicate:v16];
    int v19 = [v18 firstObject];

    [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
    double v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    __int16 v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v35 count:1];
    __int16 v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

    if (v23) {
  }
    }

  BOOL v24 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v24;
}

void __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  dispatch_semaphore_t v6 = v5;
  if (!a3)
  {
    uint64_t v7 = [v5 count];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if (!v7)
    {
      __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v34 = v22;
        __int16 v35 = 1024;
        int v36 = v23;
        _os_log_debug_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager no trip segment data found for interval %@, okToAddTripSegmentData,%d", buf, 0x12u);
      }
      goto LABEL_18;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v24 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) identifier];
          int64_t v14 = +[RTTripSegmentManager tripSegmentUUIDTypeFromUUID:v13];

          if (!v14)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            double v15 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v16 = *(void *)(a1 + 32);
              int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
              *(_DWORD *)long long buf = 138412546;
              uint64_t v34 = v16;
              __int16 v35 = 1024;
              int v36 = v17;
              _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager trip segment of type FINAL found for interval %@, okToAddTripSegmentData,%d", buf, 0x12u);
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    uint64_t v18 = *(void *)(a1 + 56);
    dispatch_semaphore_t v6 = v24;
    if (*(unsigned char *)(*(void *)(v18 + 8) + 24))
    {
      int v19 = *(void **)(a1 + 32);
      double v20 = *(void **)(a1 + 40);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke_91;
      v25[3] = &unk_1E6B90728;
      uint64_t v27 = v18;
      int v26 = v19;
      [v20 _purgeTripSegmentsOnDateInterval:v26 handler:v25];
      __int16 v21 = v26;
LABEL_18:
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke_91(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 1024;
      int v9 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager purge of trip segments for date interval %@ failed, okToAddTripSegmentData,%d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (void)_tripSegmentExistsForDateInterval:(id)a3 ignoreTemporary:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CF48]) initWithAscending:1 dateInterval:v8 limit:0];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__RTTripSegmentManager__tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke;
  v12[3] = &unk_1E6B90778;
  BOOL v16 = a4;
  int64_t v14 = v17;
  double v15 = v19;
  id v11 = v9;
  id v13 = v11;
  [(RTTripSegmentManager *)self _fetchTripSegmentsWithOptions:v10 handler:v12];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __82__RTTripSegmentManager__tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    id v14 = v6;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) identifier];
          int64_t v13 = +[RTTripSegmentManager tripSegmentUUIDTypeFromUUID:v12];

          if (!v13) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    id v6 = v14;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 count] != 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tripSegmentExistsForDateInterval:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v18 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:handler:]";
    __int16 v19 = 1024;
    int v20 = 784;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v18 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:handler:]";
      __int16 v19 = 1024;
      int v20 = 785;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTTripSegmentManager_tripSegmentExistsForDateInterval_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __65__RTTripSegmentManager_tripSegmentExistsForDateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tripSegmentExistsForDateInterval:*(void *)(a1 + 40) ignoreTemporary:0 handler:*(void *)(a1 + 48)];
}

- (void)tripSegmentExistsForDateInterval:(id)a3 ignoreTemporary:(BOOL)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v21 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:ignoreTemporary:handler:]";
    __int16 v22 = 1024;
    int v23 = 798;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v21 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:ignoreTemporary:handler:]";
      __int16 v22 = 1024;
      int v23 = 799;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v13 = [(RTNotifier *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__RTTripSegmentManager_tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke;
  v16[3] = &unk_1E6B907A0;
  v16[4] = self;
  id v17 = v8;
  BOOL v19 = a4;
  id v18 = v10;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(v13, v16);
}

uint64_t __81__RTTripSegmentManager_tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tripSegmentExistsForDateInterval:*(void *)(a1 + 40) ignoreTemporary:*(unsigned __int8 *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_addTripSegmentDataWithIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7 locations:(id)a8 isEndOfSegment:(BOOL)a9 handler:(id)a10
{
  BOOL v186 = a9;
  uint64_t v243 = *MEMORY[0x1E4F143B8];
  id v189 = a3;
  id v16 = a4;
  id v197 = a8;
  v191 = (void (**)(id, void))a10;
  if (!v191)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v237 = 136315394;
      *(void *)&v237[4] = "-[RTTripSegmentManager _addTripSegmentDataWithIdentifier:dateInterval:tripDistance:tripDista"
                            "nceUncertainty:modeOfTransportation:locations:isEndOfSegment:handler:]";
      *(_WORD *)&v237[12] = 1024;
      *(_DWORD *)&v237[14] = 818;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v237, 0x12u);
    }
  }
  *(void *)v237 = 0;
  *(void *)&v237[8] = v237;
  *(void *)&v237[16] = 0x3032000000;
  v238 = __Block_byref_object_copy__1;
  v239 = __Block_byref_object_dispose__1;
  id v240 = 0;
  v190 = v16;
  [v16 duration];
  if (a6 <= 0.0 || a5 <= 0.0 || v18 <= 0.0)
  {
    long long v32 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      [v16 duration];
      *(_DWORD *)v230 = 134218752;
      *(void *)&v230[4] = v173;
      *(_WORD *)&v230[12] = 2048;
      *(double *)&v230[14] = a5;
      *(_WORD *)&v230[22] = 2048;
      double v231 = a6;
      LOWORD(v232) = 2048;
      *(void *)((char *)&v232 + 2) = [v197 count];
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "RTTripSegmentManager attempted to add invalid trip segment data: dateInterval.duration, %.3f, distance, %.3f, distanceUncertainty, %.3f, locations.count, %tu.", v230, 0x2Au);
    }

    uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v235 = *MEMORY[0x1E4F28568];
    v236 = @"RTTripSegmentManager attempted to add invalid trip segment data.";
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v236 forKeys:&v235 count:1];
    uint64_t v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v34];
    int v36 = *(void **)(*(void *)&v237[8] + 40);
    *(void *)(*(void *)&v237[8] + 40) = v35;

    v191[2](v191, *(void *)(*(void *)&v237[8] + 40));
  }
  else
  {
    if ([(RTTripSegmentManager *)self tryPrepareForAddTripSegmentdata:v16])
    {
      BOOL v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v174 = [v189 UUIDString];
        uint64_t v175 = [v174 UTF8String];
        uint64_t v176 = [v197 count];
        v177 = [v16 startDate];
        [v177 timeIntervalSinceReferenceDate];
        double v179 = v178;
        v180 = [v16 endDate];
        [v180 timeIntervalSinceReferenceDate];
        *(_DWORD *)v230 = 136315906;
        *(void *)&v230[4] = v175;
        *(_WORD *)&v230[12] = 2048;
        *(void *)&v230[14] = v176;
        *(_WORD *)&v230[22] = 2048;
        double v231 = v179;
        LOWORD(v232) = 2048;
        *(void *)((char *)&v232 + 2) = v181;
        _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager invoked addTripSegmentData with UUID %s, and %lu locations, from startTime, %.1f, to stopTime, %.1lf", v230, 0x2Au);
      }
      int v20 = [(RTTripSegmentManager *)self tripSegmentUnderConstruction];
      if (v20)
      {
        uint64_t v21 = [(RTTripSegmentManager *)self tripSegmentUnderConstruction];
        id v22 = [v21 identifier];
        BOOL v23 = v22 == v189;

        if (!v23)
        {
          uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v230 = 0;
            _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager _tripSegmentUnderConstruction has different UUID, setting to nil", v230, 2u);
          }

          [(RTTripSegmentManager *)self setTripSegmentUnderConstruction:0];
          [(RTTripSegmentManager *)self setTripSegmentUnderConstructionLastLocationTimestamp:0];
        }
      }
      __int16 v25 = [(RTTripSegmentManager *)self tripSegmentUnderConstruction];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        double v42 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v230 = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager addTripSegmentData created new RTTripSegment instance", v230, 2u);
        }

        uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F5CF78]) initWithTripSegmentIdentifier:v189 dateInterval:v190 tripDistance:a7 tripDistanceUncertainty:a5 modeOfTransportation:a6];
        [(RTTripSegmentManager *)self setTripSegmentUnderConstruction:v43];

        [(RTTripSegmentManager *)self setTripSegmentUnderConstructionLastLocationTimestamp:0];
      }
      else
      {
        uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v230 = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager addTripSegmentData appending to existing trip-segment", v230, 2u);
        }

        long long v28 = (void *)MEMORY[0x1E4F5CF78];
        long long v29 = [(RTTripSegmentManager *)self tripSegmentUnderConstruction];
        long long v30 = (void *)[objc_alloc(MEMORY[0x1E4F5CF78]) initWithTripSegmentIdentifier:v189 dateInterval:v190 tripDistance:a7 tripDistanceUncertainty:a5 modeOfTransportation:a6];
        long long v31 = [v28 mergeTripSegment:v29 other:v30];
        [(RTTripSegmentManager *)self setTripSegmentUnderConstruction:v31];
      }
      id obj = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v197 count]];
      for (unint64_t i = 0; i < [v197 count]; ++i)
      {
        char v45 = [RTSynthesizedLocation alloc];
        id v46 = [v197 objectAtIndexedSubscript:i];
        id v47 = [(RTSynthesizedLocation *)v45 initWithCLTripSegmentLocation:v46];

        [obj addObject:v47];
      }
      double v48 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v182 = [v197 count];
        *(_DWORD *)v230 = 134217984;
        *(void *)&v230[4] = v182;
        _os_log_debug_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager converted %lu CLTripSegmentLocations to RTSynthesizedLocations", v230, 0xCu);
      }

      *(void *)v230 = 0;
      *(void *)&v230[8] = v230;
      *(void *)&v230[16] = 0x3032000000;
      double v231 = COERCE_DOUBLE(__Block_byref_object_copy__1);
      *(void *)&long long v232 = __Block_byref_object_dispose__1;
      *((void *)&v232 + 1) = [MEMORY[0x1E4F1C978] array];
      dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
      if (self->_elevationAdjuster
        && [(RTTripSegmentManager *)self _applyElevationAdjustmentToReconstructedRoute])
      {
        v50 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)&uint8_t buf[4] = [v197 count];
          _os_log_debug_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager adjusted elevation for %lu locations", buf, 0xCu);
        }

        elevationAdjuster = self->_elevationAdjuster;
        v217[0] = MEMORY[0x1E4F143A8];
        v217[1] = 3221225472;
        v217[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke;
        v217[3] = &unk_1E6B905F0;
        v219 = v230;
        v220 = v237;
        v218 = v49;
        [(RTElevationAdjuster *)elevationAdjuster adjustElevationForSynthesizedLocations:obj handler:v217];
      }
      else
      {
        objc_storeStrong((id *)(*(void *)&v230[8] + 40), obj);
        dispatch_semaphore_signal(v49);
      }
      id v52 = (id *)(*(void *)&v237[8] + 40);
      id v53 = *(id *)(*(void *)&v237[8] + 40);
      dsema = v49;
      BOOL v54 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v55 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(dsema, v55))
      {
        uint64_t v56 = [MEMORY[0x1E4F1C9C8] now];
        [v56 timeIntervalSinceDate:v54];
        double v58 = v57;
        v59 = objc_opt_new();
        id v60 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
        v61 = [MEMORY[0x1E4F29060] callStackSymbols];
        v62 = [v61 filteredArrayUsingPredicate:v60];
        v63 = [v62 firstObject];

        [v59 submitToCoreAnalytics:v63 type:1 duration:v58];
        uint64_t v64 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v65 = (void *)MEMORY[0x1E4F28C58];
        *(void *)v221 = *MEMORY[0x1E4F28568];
        *(void *)long long buf = @"semaphore wait timeout";
        uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v221 count:1];
        double v67 = [v65 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v66];

        if (v67)
        {
          id v53 = v67;
        }
      }

      objc_storeStrong(v52, v53);
      id v198 = [MEMORY[0x1E4F1CA48] array];
      long long v215 = 0u;
      long long v216 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      id v68 = *(id *)(*(void *)&v230[8] + 40);
      uint64_t v69 = [v68 countByEnumeratingWithState:&v213 objects:v229 count:16];
      if (v69)
      {
        uint64_t v71 = *(void *)v214;
        *(void *)&long long v70 = 138412546;
        long long v185 = v70;
        do
        {
          for (uint64_t j = 0; j != v69; ++j)
          {
            if (*(void *)v214 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = *(void **)(*((void *)&v213 + 1) + 8 * j);
            if (!+[RTTripSegmentManager isValidSynthesizedLocation:](RTTripSegmentManager, "isValidSynthesizedLocation:", v73, v185))
            {
              uint64_t v79 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                *(void *)&uint8_t buf[4] = v73;
                _os_log_debug_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager invalid properties observed for location sample %@.", buf, 0xCu);
              }
              goto LABEL_58;
            }
            uint64_t v74 = [(RTTripSegmentManager *)self tripSegmentUnderConstructionLastLocationTimestamp];
            if (v74)
            {
              BOOL v75 = [(RTTripSegmentManager *)self tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations];

              if (!v75)
              {
                v76 = [v73 timestamp];
                double v77 = [(RTTripSegmentManager *)self tripSegmentUnderConstructionLastLocationTimestamp];
                int v78 = [v76 isOnOrBefore:v77];

                if (v78)
                {
                  uint64_t v79 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                  {
                    v80 = [(RTTripSegmentManager *)self tripSegmentUnderConstructionLastLocationTimestamp];
                    *(_DWORD *)long long buf = v185;
                    *(void *)&uint8_t buf[4] = v73;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v80;
                    _os_log_debug_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager skipping location %@ earlier than most recent location at %@.", buf, 0x16u);
                  }
LABEL_58:

                  continue;
                }
              }
            }
            uint64_t v81 = [v73 timestamp];
            [(RTTripSegmentManager *)self setTripSegmentUnderConstructionLastLocationTimestamp:v81];

            [v198 addObject:v73];
          }
          uint64_t v69 = [v68 countByEnumeratingWithState:&v213 objects:v229 count:16];
        }
        while (v69);
      }

      if ((unint64_t)[v198 count] >= 2)
      {
        id v82 = [v198 lastObject];
        id v83 = [v82 timestamp];
        v84 = [v198 firstObject];
        v85 = [v84 timestamp];
        int v86 = [v83 isAfterDate:v85];

        if (v86)
        {
          id v87 = objc_alloc(MEMORY[0x1E4F28C18]);
          v88 = [v198 firstObject];
          v89 = [v88 timestamp];
          uint64_t v90 = [v198 lastObject];
          v91 = [v90 timestamp];
          uint64_t v92 = (void *)[v87 initWithStartDate:v89 endDate:v91];

          dispatch_semaphore_t v93 = dispatch_semaphore_create(0);
          *(void *)long long buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          uint64_t v226 = __Block_byref_object_copy__1;
          uint64_t v227 = __Block_byref_object_dispose__1;
          id v228 = 0;
          id v94 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v184 = [v198 count];
            *(_DWORD *)v221 = 138412546;
            *(void *)&v221[4] = v92;
            *(_WORD *)&v221[12] = 2048;
            *(void *)&v221[14] = v184;
            _os_log_debug_impl(&dword_1D9BFA000, v94, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager cleaning location store on interval %@ prior to adding %ld locations", v221, 0x16u);
          }

          v210[0] = MEMORY[0x1E4F143A8];
          v210[1] = 3221225472;
          v210[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_104;
          v210[3] = &unk_1E6B90728;
          unint64_t v212 = buf;
          v95 = v93;
          uint64_t v211 = v95;
          [(RTTripSegmentManager *)self _purgeTripSegmentsOnDateInterval:v92 handler:v210];
          v97 = (id *)(*(void *)&buf[8] + 40);
          id v96 = *(id *)(*(void *)&buf[8] + 40);
          v98 = v95;
          v99 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v100 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(v98, v100))
          {
            v192 = [MEMORY[0x1E4F1C9C8] now];
            [v192 timeIntervalSinceDate:v99];
            double v102 = v101;
            uint64_t v103 = objc_opt_new();
            id v104 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
            id v105 = [MEMORY[0x1E4F29060] callStackSymbols];
            v106 = [v105 filteredArrayUsingPredicate:v104];
            v107 = [v106 firstObject];

            [v103 submitToCoreAnalytics:v107 type:1 duration:v102];
            v108 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v221 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v108, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v221, 2u);
            }

            v109 = (void *)MEMORY[0x1E4F28C58];
            *(void *)v242 = *MEMORY[0x1E4F28568];
            *(void *)v221 = @"semaphore wait timeout";
            v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v221 forKeys:v242 count:1];
            v111 = [v109 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v110];

            if (v111)
            {
              id v96 = v111;
            }
          }

          objc_storeStrong(v97, v96);
          _Block_object_dispose(buf, 8);
        }
      }
      dispatch_semaphore_t v112 = dispatch_semaphore_create(0);
      unint64_t v113 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v183 = [v198 count];
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v183;
        _os_log_debug_impl(&dword_1D9BFA000, v113, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager adding %lu locations to location store", buf, 0xCu);
      }

      v207[0] = MEMORY[0x1E4F143A8];
      v207[1] = 3221225472;
      v207[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_105;
      v207[3] = &unk_1E6B90728;
      unint64_t v209 = v237;
      v114 = v112;
      unint64_t v208 = v114;
      [(RTTripSegmentManager *)self addLocationsToStore:v198 handler:v207];
      v116 = (id *)(*(void *)&v237[8] + 40);
      id v115 = *(id *)(*(void *)&v237[8] + 40);
      id v117 = v114;
      id v118 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v119 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v117, v119))
      {
        dispatch_semaphore_t v193 = [MEMORY[0x1E4F1C9C8] now];
        [v193 timeIntervalSinceDate:v118];
        double v121 = v120;
        v122 = objc_opt_new();
        v123 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
        double v124 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v125 = [v124 filteredArrayUsingPredicate:v123];
        v126 = [v125 firstObject];

        [v122 submitToCoreAnalytics:v126 type:1 duration:v121];
        v127 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v127, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        double v128 = (void *)MEMORY[0x1E4F28C58];
        *(void *)v221 = *MEMORY[0x1E4F28568];
        *(void *)long long buf = @"semaphore wait timeout";
        v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v221 count:1];
        v130 = [v128 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v129];

        if (v130)
        {
          id v115 = v130;
        }
      }

      objc_storeStrong(v116, v115);
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      uint64_t v226 = __Block_byref_object_copy__1;
      uint64_t v227 = __Block_byref_object_dispose__1;
      id v228 = 0;
      if (v186)
      {
        v131 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v221 = 67109120;
          *(_DWORD *)&v221[4] = 1;
          _os_log_debug_impl(&dword_1D9BFA000, v131, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager inserting tripSegment in RTTripSegmentStore (isEndOfSegment == %d)", v221, 8u);
        }

        dispatch_semaphore_t v132 = dispatch_semaphore_create(0);
        v133 = [(RTTripSegmentManager *)self tripSegmentStore];
        tripSegmentUnderConstruction = self->_tripSegmentUnderConstruction;
        v204[0] = MEMORY[0x1E4F143A8];
        v204[1] = 3221225472;
        v204[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_106;
        v204[3] = &unk_1E6B907C8;
        v206 = buf;
        v204[4] = self;
        v135 = v132;
        v205 = v135;
        [v133 storeTripSegment:tripSegmentUnderConstruction handler:v204];

        id v137 = (id *)(*(void *)&buf[8] + 40);
        id v136 = *(id *)(*(void *)&buf[8] + 40);
        v138 = v135;
        dispatch_semaphore_t v194 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v139 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v138, v139))
        {
          v187 = [MEMORY[0x1E4F1C9C8] now];
          [v187 timeIntervalSinceDate:v194];
          double v141 = v140;
          v142 = objc_opt_new();
          double v143 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
          double v144 = [MEMORY[0x1E4F29060] callStackSymbols];
          v145 = [v144 filteredArrayUsingPredicate:v143];
          v146 = [v145 firstObject];

          [v142 submitToCoreAnalytics:v146 type:1 duration:v141];
          double v147 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v221 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v147, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v221, 2u);
          }

          v148 = (void *)MEMORY[0x1E4F28C58];
          *(void *)v242 = *MEMORY[0x1E4F28568];
          *(void *)v221 = @"semaphore wait timeout";
          v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v221 forKeys:v242 count:1];
          v150 = [v148 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v149];

          if (v150)
          {
            id v136 = v150;
          }
        }

        objc_storeStrong(v137, v136);
        id v151 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        v152 = [(RTTripSegment *)self->_tripSegmentUnderConstruction dateInterval];
        uint64_t v153 = [v152 startDate];
        v154 = (void *)[v151 initWithTimeInterval:v153 sinceDate:-60.0];

        [(RTTripSegmentManager *)self setTripSegmentUnderConstruction:0];
        [(RTTripSegmentManager *)self setTripSegmentUnderConstructionLastLocationTimestamp:0];

        if (!v154) {
          goto LABEL_100;
        }
        id v155 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v221 = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v155, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager performing post-storeTripSegment sanitization.", v221, 2u);
        }

        dispatch_semaphore_t v156 = dispatch_semaphore_create(0);
        *(void *)v221 = 0;
        *(void *)&v221[8] = v221;
        *(void *)&v221[16] = 0x3032000000;
        id v222 = __Block_byref_object_copy__1;
        v223 = __Block_byref_object_dispose__1;
        id v224 = 0;
        v201[0] = MEMORY[0x1E4F143A8];
        v201[1] = 3221225472;
        v201[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_107;
        v201[3] = &unk_1E6B90728;
        v203 = v221;
        v157 = v156;
        v202 = v157;
        [(RTTripSegmentManager *)self _sanitizeTripSegmentDatabaseSinceDate:v154 handler:v201];
        id v159 = (id *)(*(void *)&v221[8] + 40);
        id v158 = *(id *)(*(void *)&v221[8] + 40);
        v160 = v157;
        v200 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v161 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v160, v161))
        {
          dispatch_semaphore_t v195 = [MEMORY[0x1E4F1C9C8] now];
          [v195 timeIntervalSinceDate:v200];
          double v163 = v162;
          v164 = objc_opt_new();
          v165 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
          double v166 = [MEMORY[0x1E4F29060] callStackSymbols];
          v167 = [v166 filteredArrayUsingPredicate:v165];
          v168 = [v167 firstObject];

          [v164 submitToCoreAnalytics:v168 type:1 duration:v163];
          v169 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v169, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v242 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v169, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v242, 2u);
          }

          v170 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v241 = *MEMORY[0x1E4F28568];
          *(void *)v242 = @"semaphore wait timeout";
          v171 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v242 forKeys:&v241 count:1];
          v172 = [v170 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v171];

          if (v172)
          {
            id v158 = v172;
          }
        }

        objc_storeStrong(v159, v158);
        _Block_object_dispose(v221, 8);
      }
      else
      {
        v160 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v221 = 67109120;
          *(_DWORD *)&v221[4] = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v160, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager maintaining tripSegment under construction (isEndOfSegment == %d)", v221, 8u);
        }
        v154 = 0;
      }

LABEL_100:
      v191[2](v191, *(void *)(*(void *)&v237[8] + 40));
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v230, 8);
      goto LABEL_101;
    }
    uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v230 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager Possible duplication of trip segment, date interval overlaps with previous entry. Not adding new data.", v230, 2u);
    }

    long long v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v233 = *MEMORY[0x1E4F28568];
    id v234 = @"TripSegment already exists with this dateInterval.";
    unint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v234 forKeys:&v233 count:1];
    uint64_t v40 = [v38 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v39];
    unint64_t v41 = *(void **)(*(void *)&v237[8] + 40);
    *(void *)(*(void *)&v237[8] + 40) = v40;

    v191[2](v191, *(void *)(*(void *)&v237[8] + 40));
  }
LABEL_101:
  _Block_object_dispose(v237, 8);
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    int v10 = 134218242;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager adjustElevationForLocations, location count, %lu, error, %@", (uint8_t *)&v10, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager clean location store for new batch, error, %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager addLocationsToStore, error, %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [*(id *)(a1 + 32) tripSegmentUnderConstruction];
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager stored trip segment, %@, error, %@", (uint8_t *)&v7, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_107(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addTripSegmentData:(id)a3 isEndOfSegment:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      BOOL v23 = "-[RTTripSegmentManager addTripSegmentData:isEndOfSegment:handler:]";
      __int16 v24 = 1024;
      int v25 = 1023;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clTripSegmentData (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }
  }
  if (self->_isTripSegmentGenerationEnabled)
  {
    uint64_t v11 = [v8 tripSegmentID];
    id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v13 = [v8 startDate];
    uint64_t v14 = [v8 endDate];
    id v15 = (void *)[v12 initWithStartDate:v13 endDate:v14];
    [v8 distance_m];
    double v17 = v16;
    [v8 distanceUnc_m];
    double v19 = v18;
    int64_t v20 = +[RTTripSegmentManager translateModeOfTransport:](RTTripSegmentManager, "translateModeOfTransport:", [v8 modeOfTransport]);
    uint64_t v21 = [v8 tripLocations];
    [(RTTripSegmentManager *)self addTripSegmentDataWithIdentifier:v11 dateInterval:v15 tripDistance:v20 tripDistanceUncertainty:v21 modeOfTransportation:v6 locations:v9 isEndOfSegment:v17 handler:v19];
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: trip segment generation is disabled on device.", (uint8_t *)&v22, 2u);
    }
  }
}

- (void)addTripSegmentDataWithIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7 locations:(id)a8 isEndOfSegment:(BOOL)a9 handler:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a8;
  id v21 = a10;
  int v22 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __161__RTTripSegmentManager_addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke;
  block[3] = &unk_1E6B907F0;
  block[4] = self;
  id v28 = v18;
  double v32 = a5;
  double v33 = a6;
  int64_t v34 = a7;
  id v29 = v19;
  id v30 = v20;
  BOOL v35 = a9;
  id v31 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  dispatch_async(v22, block);
}

uint64_t __161__RTTripSegmentManager_addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addTripSegmentDataWithIdentifier:*(void *)(a1 + 40) dateInterval:*(void *)(a1 + 48) tripDistance:*(void *)(a1 + 88) tripDistanceUncertainty:*(void *)(a1 + 56) modeOfTransportation:*(unsigned __int8 *)(a1 + 96) locations:*(void *)(a1 + 64) isEndOfSegment:*(double *)(a1 + 72) handler:*(double *)(a1 + 80)];
}

- (void)_deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v79 = (void (**)(void))a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  dispatch_time_t v100 = __Block_byref_object_copy__1;
  double v101 = __Block_byref_object_dispose__1;
  id v102 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = &v91;
  uint64_t v93 = 0x3032000000;
  id v94 = __Block_byref_object_copy__1;
  v95 = __Block_byref_object_dispose__1;
  id v96 = 0;
  BOOL v75 = self;
  id v8 = [(RTTripSegmentManager *)self tripSegmentStore];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke;
  v86[3] = &unk_1E6B90818;
  v89 = &v91;
  id v87 = v6;
  uint64_t v90 = &v97;
  id v9 = v7;
  v88 = v9;
  id v77 = v87;
  [v8 fetchTripSegmentsWithUUID:v87 handler:v86];

  id v10 = (id *)(v98 + 5);
  id v11 = (id)v98[5];
  id v12 = v9;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    id v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    id v18 = objc_opt_new();
    id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v21 = [v20 filteredArrayUsingPredicate:v19];
    int v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    *(void *)uint64_t v103 = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v103 count:1];
    id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v11 = v26;
    }
  }

  objc_storeStrong(v10, v11);
  if (v98[5])
  {
    v79[2]();
  }
  else
  {
    *(void *)long long buf = 0;
    v110 = buf;
    uint64_t v111 = 0x3032000000;
    dispatch_semaphore_t v112 = __Block_byref_object_copy__1;
    unint64_t v113 = __Block_byref_object_dispose__1;
    id v114 = 0;
    id v27 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v28 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    id v29 = [(id)v92[5] startDate];
    id v30 = (void *)[v28 initWithTimeInterval:v29 sinceDate:-0.001];
    id v31 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    double v32 = [(id)v92[5] endDate];
    double v33 = (void *)[v31 initWithTimeInterval:v32 sinceDate:0.001];
    uint64_t v34 = [v27 initWithStartDate:v30 endDate:v33];
    BOOL v35 = (void *)v92[5];
    v92[5] = v34;

    dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
    uint64_t v37 = [(RTTripSegmentManager *)v75 locationStore];
    uint64_t v38 = v92[5];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_108;
    v83[3] = &unk_1E6B90728;
    v85 = buf;
    unint64_t v39 = v36;
    v84 = v39;
    [v37 removeLocationsOnDateInterval:v38 handler:v83];

    uint64_t v40 = (id *)(v98 + 5);
    id v41 = (id)v98[5];
    dsema = v39;
    double v42 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v43 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v43))
    {
      id v44 = [MEMORY[0x1E4F1C9C8] now];
      [v44 timeIntervalSinceDate:v42];
      double v46 = v45;
      id v47 = objc_opt_new();
      double v48 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
      dispatch_semaphore_t v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 filteredArrayUsingPredicate:v48];
      id v51 = [v50 firstObject];

      [v47 submitToCoreAnalytics:v51 type:1 duration:v46];
      id v52 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v103 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v103, 2u);
      }

      id v53 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v116 = *MEMORY[0x1E4F28568];
      *(void *)uint64_t v103 = @"semaphore wait timeout";
      BOOL v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v116 count:1];
      dispatch_time_t v55 = [v53 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v54];

      if (v55)
      {
        id v41 = v55;
      }
    }

    objc_storeStrong(v40, v41);
    if (*((void *)v110 + 5))
    {
      v79[2]();
    }
    else
    {
      *(void *)uint64_t v103 = 0;
      id v104 = v103;
      uint64_t v105 = 0x3032000000;
      v106 = __Block_byref_object_copy__1;
      v107 = __Block_byref_object_dispose__1;
      id v108 = 0;
      dispatch_semaphore_t v56 = dispatch_semaphore_create(0);
      double v57 = [(RTTripSegmentManager *)v75 tripSegmentStore];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_2;
      v80[3] = &unk_1E6B90728;
      id v82 = v103;
      double v58 = v56;
      uint64_t v81 = v58;
      [v57 deleteTripSegmentWithUUID:v77 handler:v80];

      v59 = (id *)(v104 + 40);
      id v60 = (id)*((void *)v104 + 5);
      v61 = v58;
      v62 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v63 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v61, v63))
      {
        v76 = [MEMORY[0x1E4F1C9C8] now];
        [v76 timeIntervalSinceDate:v62];
        double v65 = v64;
        uint64_t v66 = objc_opt_new();
        double v67 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
        id v68 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v69 = [v68 filteredArrayUsingPredicate:v67];
        long long v70 = [v69 firstObject];

        [v66 submitToCoreAnalytics:v70 type:1 duration:v65];
        uint64_t v71 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v116 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v116, 2u);
        }

        uint64_t v72 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v115 = *MEMORY[0x1E4F28568];
        *(void *)v116 = @"semaphore wait timeout";
        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:&v115 count:1];
        uint64_t v74 = [v72 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v73];

        if (v74)
        {
          id v60 = v74;
        }
      }

      objc_storeStrong(v59, v60);
      ((void (*)(void (**)(void), void))v79[2])(v79, *((void *)v104 + 5));

      _Block_object_dispose(v103, 8);
    }

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v97, 8);
}

void __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      if ([v5 count])
      {
        id v8 = [v5 objectAtIndexedSubscript:0];
        uint64_t v9 = [v8 dateInterval];
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        if ((unint64_t)[v5 count] >= 2)
        {
          id v12 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = [v5 count];
            uint64_t v17 = *(void *)(a1 + 32);
            int v18 = 134218242;
            uint64_t v19 = v16;
            __int16 v20 = 2112;
            uint64_t v21 = v17;
            _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:deleteTripSegmentWithUUID multiple (%tu) trip segments found with UUID %@", (uint8_t *)&v18, 0x16u);
          }
        }
      }
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_time_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v7;
  id v15 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_108(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    int v18 = "-[RTTripSegmentManager deleteTripSegmentWithUUID:handler:]";
    __int16 v19 = 1024;
    int v20 = 1122;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      int v18 = "-[RTTripSegmentManager deleteTripSegmentWithUUID:handler:]";
      __int16 v19 = 1024;
      int v20 = 1123;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTTripSegmentManager_deleteTripSegmentWithUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __58__RTTripSegmentManager_deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteTripSegmentWithUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)_getPurgePolicyOverrideDaysToPersistTripSegmentData:(id)a3
{
  id v4 = a3;
  id v5 = [(RTTripSegmentManager *)self defaultsManager];
  id v6 = [v5 objectForKey:@"RTDefaultsTripSegmentOverrideDaysToPersistTripSegmentData"];

  if (v6)
  {
    [v6 floatValue];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v7 * -86400.0];
    id v9 = [v8 earlierDate:v4];
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)purgeTripSegmentsPredating:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    int v18 = "-[RTTripSegmentManager purgeTripSegmentsPredating:handler:]";
    __int16 v19 = 1024;
    int v20 = 1148;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      int v18 = "-[RTTripSegmentManager purgeTripSegmentsPredating:handler:]";
      __int16 v19 = 1024;
      int v20 = 1149;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

void __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _getPurgePolicyOverrideDaysToPersistTripSegmentData:*(void *)(a1 + 40)];
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = [*(id *)(a1 + 32) tripSegmentStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_2;
  v13[3] = &unk_1E6B90840;
  id v5 = v3;
  dispatch_time_t v14 = v5;
  [v4 purgeTripSegmentsPredating:v2 handler:v13];

  dispatch_group_enter(v5);
  id v6 = [*(id *)(a1 + 32) locationStore];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_3;
  v11[3] = &unk_1E6B90840;
  id v12 = v5;
  id v7 = v5;
  [v6 removeLocationsPredating:v2 handler:v11];

  id v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_4;
  block[3] = &unk_1E6B90868;
  id v10 = *(id *)(a1 + 48);
  dispatch_group_notify(v7, v8, block);
}

void __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_2(uint64_t a1)
{
}

void __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_3(uint64_t a1)
{
}

uint64_t __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  double v48 = (void (**)(id, void))a4;
  if (!v48)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)dispatch_semaphore_t v56 = 136315394;
      *(void *)&v56[4] = "-[RTTripSegmentManager _purgeTripSegmentsOnDateInterval:handler:]";
      *(_WORD *)&v56[12] = 1024;
      *(_DWORD *)&v56[14] = 1185;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v56, 0x12u);
    }
  }
  *(void *)dispatch_semaphore_t v56 = 0;
  *(void *)&v56[8] = v56;
  *(void *)&v56[16] = 0x3032000000;
  double v57 = __Block_byref_object_copy__1;
  double v58 = __Block_byref_object_dispose__1;
  id v59 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  double v46 = self;
  id v8 = [(RTTripSegmentManager *)self tripSegmentStore];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke;
  v53[3] = &unk_1E6B90728;
  dispatch_time_t v55 = v56;
  id v9 = v7;
  BOOL v54 = v9;
  [v8 purgeTripSegmentsOnDateInterval:v49 handler:v53];

  id v10 = (id *)(*(void *)&v56[8] + 40);
  id v11 = *(id *)(*(void *)&v56[8] + 40);
  id v12 = v9;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    id v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    int v18 = objc_opt_new();
    __int16 v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    int v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    uint64_t v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v60 count:1];
    id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v11 = v26;
    }
  }

  objc_storeStrong(v10, v11);
  if (*(void *)(*(void *)&v56[8] + 40))
  {
    v48[2](v48, 0);
  }
  else
  {
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    id v28 = [(RTTripSegmentManager *)v46 locationStore];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke_2;
    v50[3] = &unk_1E6B90728;
    id v52 = v56;
    id v29 = v27;
    id v51 = v29;
    [v28 removeLocationsOnDateInterval:v49 handler:v50];

    id v30 = (id *)(*(void *)&v56[8] + 40);
    id v31 = *(id *)(*(void *)&v56[8] + 40);
    double v32 = v29;
    double v33 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v34 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v32, v34))
    {
      id v47 = [MEMORY[0x1E4F1C9C8] now];
      [v47 timeIntervalSinceDate:v33];
      double v36 = v35;
      uint64_t v37 = objc_opt_new();
      uint64_t v38 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
      unint64_t v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v40 = [v39 filteredArrayUsingPredicate:v38];
      id v41 = [v40 firstObject];

      [v37 submitToCoreAnalytics:v41 type:1 duration:v36];
      double v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      dispatch_time_t v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v60 = *MEMORY[0x1E4F28568];
      *(void *)long long buf = @"semaphore wait timeout";
      id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v60 count:1];
      double v45 = [v43 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v44];

      if (v45)
      {
        id v31 = v45;
      }
    }

    objc_storeStrong(v30, v31);
    v48[2](v48, 0);
  }
  _Block_object_dispose(v56, 8);
}

void __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    int v18 = "-[RTTripSegmentManager purgeTripSegmentsOnDateInterval:handler:]";
    __int16 v19 = 1024;
    int v20 = 1216;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      int v18 = "-[RTTripSegmentManager purgeTripSegmentsOnDateInterval:handler:]";
      __int16 v19 = 1024;
      int v20 = 1217;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTTripSegmentManager_purgeTripSegmentsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __64__RTTripSegmentManager_purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeTripSegmentsOnDateInterval:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

+ (int64_t)periodicPurgePolicy
{
  return 3;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v17 = v10;
  int64_t v18 = a3;
  id v15 = v9;
  id v16 = self;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    id v3 = v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v6[3] = &unk_1E6B90890;
    uint64_t v8 = *(void *)(a1 + 64);
    id v4 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v4 purgeTripSegmentsPredating:v3 handler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, performPurgeOfType, error, %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isSpeedValidityCheckingEnabled
{
  id v2 = [(RTTripSegmentManager *)self defaultsManager];
  id v3 = [v2 objectForKey:@"RTDefaultsTripSegmentEnableSpeedValidityChecks"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_sanitizeTripSegmentDatabaseSinceDate:(id)a3 handler:(id)a4
{
  v486[1] = *MEMORY[0x1E4F143B8];
  id v375 = a3;
  v376 = (void (**)(id, void))a4;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler invoked", buf, 2u);
  }

  int v6 = [(RTTripSegmentManager *)self defaultsManager];
  v377 = [v6 objectForKey:@"RTDefaultsTripSegmentEnableDatabaseSanitization"];

  if (v377 && ([v377 BOOLValue] & 1) == 0)
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler database sanitization has been disabled via defaults/profile (RTDefaultsTripSegmentEnableDatabaseSanitization == false).", buf, 2u);
    }
    goto LABEL_183;
  }
  if (v375)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
    __int16 v8 = [MEMORY[0x1E4F1C9C8] now];
    oslog = (id)[v7 initWithStartDate:v375 endDate:v8];
  }
  else
  {
    oslog = 0;
  }
  v374 = (void *)[objc_alloc(MEMORY[0x1E4F5CF48]) initWithAscending:1 dateInterval:oslog limit:0];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v453 = 0;
  v454 = &v453;
  uint64_t v455 = 0x3032000000;
  v456 = __Block_byref_object_copy__1;
  v457 = __Block_byref_object_dispose__1;
  id v458 = 0;
  uint64_t v447 = 0;
  v448 = &v447;
  uint64_t v449 = 0x3032000000;
  v450 = __Block_byref_object_copy__1;
  v451 = __Block_byref_object_dispose__1;
  id v452 = 0;
  v443[0] = MEMORY[0x1E4F143A8];
  v443[1] = 3221225472;
  v443[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke;
  v443[3] = &unk_1E6B905F0;
  v445 = &v447;
  v446 = &v453;
  uint64_t v10 = v9;
  v444 = v10;
  [(RTTripSegmentManager *)self _fetchTripSegmentsWithOptions:v374 handler:v443];
  id v11 = (id *)(v448 + 5);
  id v12 = (id)v448[5];
  dsema = v10;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  intptr_t v15 = dispatch_semaphore_wait(dsema, v14);
  id v16 = (uint64_t *)MEMORY[0x1E4F5CFE8];
  if (v15)
  {
    id v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:v13];
    double v19 = v18;
    int v20 = objc_opt_new();
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v23 = [v22 filteredArrayUsingPredicate:v21];
    id v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    id v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v480 = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    dispatch_semaphore_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v480 count:1];
    id v28 = [v26 errorWithDomain:*v16 code:15 userInfo:v27];

    if (v28)
    {
      id v12 = v28;
    }
  }

  objc_storeStrong(v11, v12);
  id v29 = (void *)v454[5];
  if (!v29 || ![v29 count])
  {
    double v58 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler no stored trip segments, returning early.", buf, 2u);
    }

    v376[2](v376, v448[5]);
    goto LABEL_182;
  }
  v398 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v30 = 0;
  while (v30 < [(id)v454[5] count])
  {
    if (!v30 && !oslog)
    {
      id v31 = objc_alloc(MEMORY[0x1E4F28C18]);
      double v32 = [MEMORY[0x1E4F1C9C8] distantPast];
      id v33 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      dispatch_time_t v34 = [(id)v454[5] objectAtIndexedSubscript:0];
      double v35 = [v34 dateInterval];
      double v36 = [v35 startDate];
      uint64_t v37 = (void *)[v33 initWithTimeInterval:v36 sinceDate:-0.001];
      uint64_t v38 = (void *)[v31 initWithStartDate:v32 endDate:v37];
      [v398 addObject:v38];
    }
    if (v30 == [(id)v454[5] count] - 1)
    {
      id v39 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v40 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      id v41 = [(id)v454[5] objectAtIndexedSubscript:v30];
      double v42 = [v41 dateInterval];
      dispatch_time_t v43 = [v42 endDate];
      id v44 = (void *)[v40 initWithTimeInterval:v43 sinceDate:0.001];
      double v45 = [MEMORY[0x1E4F1C9C8] distantFuture];
      double v46 = (void *)[v39 initWithStartDate:v44 endDate:v45];
      [v398 addObject:v46];

      ++v30;
    }
    else
    {
      id v47 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      double v48 = [(id)v454[5] objectAtIndexedSubscript:v30];
      id v49 = [v48 dateInterval];
      v50 = [v49 endDate];
      id v51 = (void *)[v47 initWithTimeInterval:v50 sinceDate:0.001];

      id v52 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      id v53 = [(id)v454[5] objectAtIndexedSubscript:++v30];
      BOOL v54 = [v53 dateInterval];
      dispatch_time_t v55 = [v54 startDate];
      dispatch_semaphore_t v56 = (void *)[v52 initWithTimeInterval:v55 sinceDate:-0.001];

      if ([v51 isBeforeDate:v56])
      {
        double v57 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v51 endDate:v56];
        [v398 addObject:v57];
      }
    }
  }
  id v59 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v355 = [(id)v454[5] count];
    uint64_t v356 = [v398 count];
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = v355;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v356;
    _os_log_debug_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, tripSegments.count, %zu, dateIntervalsBetween.count, %zu", buf, 0x16u);
  }

  unint64_t v60 = 0;
  uint64_t v480 = 0;
  v481 = &v480;
  uint64_t v482 = 0x3032000000;
  v483 = __Block_byref_object_copy__1;
  v484 = __Block_byref_object_dispose__1;
  id v485 = 0;
  uint64_t v395 = *v16;
  uint64_t v396 = *MEMORY[0x1E4F28568];
  do
  {
    if (v60 >= [v398 count]) {
      break;
    }
    v61 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      id v83 = [v398 objectAtIndexedSubscript:v60];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v83;
      _os_log_debug_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, Purging orphan trip segment locations on interval: %@", buf, 0xCu);
    }
    dispatch_semaphore_t v62 = dispatch_semaphore_create(0);
    dispatch_time_t v63 = [(RTTripSegmentManager *)self locationStore];
    double v64 = [v398 objectAtIndexedSubscript:v60];
    v440[0] = MEMORY[0x1E4F143A8];
    v440[1] = 3221225472;
    v440[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_118;
    v440[3] = &unk_1E6B90728;
    v442 = &v480;
    double v65 = v62;
    v441 = v65;
    [v63 removeLocationsOnDateInterval:v64 handler:v440];

    double v67 = (id *)(v481 + 5);
    id v66 = (id)v481[5];
    id v68 = v65;
    uint64_t v69 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v70 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v68, v70))
    {
      v402 = [MEMORY[0x1E4F1C9C8] now];
      [v402 timeIntervalSinceDate:v69];
      double v72 = v71;
      v73 = objc_opt_new();
      uint64_t v74 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
      BOOL v75 = [MEMORY[0x1E4F29060] callStackSymbols];
      v76 = [v75 filteredArrayUsingPredicate:v74];
      id v77 = [v76 firstObject];

      [v73 submitToCoreAnalytics:v77 type:1 duration:v72];
      int v78 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v79 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v474 = v396;
      *(void *)long long buf = @"semaphore wait timeout";
      v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v474 count:1];
      uint64_t v81 = [v79 errorWithDomain:v395 code:15 userInfo:v80];

      if (v81)
      {
        id v66 = v81;
      }
    }

    objc_storeStrong(v67, v66);
    BOOL v82 = v481[5] == 0;

    ++v60;
  }
  while (v82);
  if (v481[5])
  {
    v84 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      uint64_t v357 = v481[5];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v357;
      _os_log_error_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing removeLocationsOnDateInterval for dateIntervalsBetween %@", buf, 0xCu);
    }

    v376[2](v376, v481[5]);
    goto LABEL_181;
  }
  v85 = [(id)v454[5] firstObject];
  int v86 = [v85 dateInterval];
  v367 = [v86 startDate];

  id v87 = [(id)v454[5] lastObject];
  v88 = [v87 dateInterval];
  v365 = [v88 endDate];

  id v89 = objc_alloc(MEMORY[0x1E4F5CF68]);
  uint64_t v90 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v367 endDate:v365];
  v362 = (void *)[v89 initWithDateInterval:v90 preferredDownsamplingLevel:0 batchSize:0 boundingBoxLocation:0];

  uint64_t v436 = 0;
  v437 = &v436;
  uint64_t v438 = 0x2020000000;
  uint64_t v439 = 0;
  uint64_t v474 = 0;
  v475 = &v474;
  uint64_t v476 = 0x3032000000;
  v477 = __Block_byref_object_copy__1;
  v478 = __Block_byref_object_dispose__1;
  id v479 = 0;
  dispatch_semaphore_t v91 = dispatch_semaphore_create(0);
  uint64_t v92 = [(RTTripSegmentManager *)self locationStore];
  v432[0] = MEMORY[0x1E4F143A8];
  v432[1] = 3221225472;
  v432[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_119;
  v432[3] = &unk_1E6B908E0;
  v434 = &v436;
  v435 = &v474;
  uint64_t v93 = v91;
  v433 = v93;
  [v92 fetchStoredLocationsCountWithOptions:v362 handler:v432];

  id v94 = (id *)(v475 + 5);
  id v95 = (id)v475[5];
  v363 = v93;
  id v96 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v97 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v363, v97))
  {
    v98 = [MEMORY[0x1E4F1C9C8] now];
    [v98 timeIntervalSinceDate:v96];
    double v100 = v99;
    double v101 = objc_opt_new();
    id v102 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    uint64_t v103 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v104 = [v103 filteredArrayUsingPredicate:v102];
    uint64_t v105 = [v104 firstObject];

    [v101 submitToCoreAnalytics:v105 type:1 duration:v100];
    v106 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v106, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v107 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v468 = v396;
    *(void *)long long buf = @"semaphore wait timeout";
    id v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v468 count:1];
    v109 = [v107 errorWithDomain:v395 code:15 userInfo:v108];

    if (v109)
    {
      id v95 = v109;
    }
  }

  objc_storeStrong(v94, v95);
  if (v475[5])
  {
    v110 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      v358 = [v362 dateInterval];
      uint64_t v359 = v475[5];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v358;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v359;
      _os_log_error_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing fetchStoredLocationsCountWithOptions, dateInterval, %@, error, %@", buf, 0x16u);
    }
    v376[2](v376, v475[5]);
    goto LABEL_180;
  }
  uint64_t v111 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
  {
    v360 = [v362 dateInterval];
    uint64_t v361 = v437[3];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v360;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v361;
    _os_log_debug_impl(&dword_1D9BFA000, v111, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: fetchStoredLocationsCountWithOptions, dateInterval, %@, expecting %tu locations", buf, 0x16u);
  }
  uint64_t v364 = 0;
  unint64_t v366 = 0;
  uint64_t v428 = 0;
  v429 = &v428;
  uint64_t v430 = 0x2020000000;
  uint64_t v431 = 0;
  do
  {
    v429[3] = 0;
    dispatch_semaphore_t v112 = dispatch_semaphore_create(0);
    *(void *)v468 = 0;
    v469 = v468;
    uint64_t v470 = 0x3032000000;
    v471 = __Block_byref_object_copy__1;
    v472 = __Block_byref_object_dispose__1;
    id v473 = 0;
    v370 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v367 endDate:v365];
    v369 = (void *)[objc_alloc(MEMORY[0x1E4F5CF68]) initWithDateInterval:v370];
    unint64_t v113 = [(RTTripSegmentManager *)self locationStore];
    v423[0] = MEMORY[0x1E4F143A8];
    v423[1] = 3221225472;
    v423[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_120;
    v423[3] = &unk_1E6B90908;
    v425 = &v447;
    v426 = v468;
    v427 = &v428;
    id v114 = v112;
    v424 = v114;
    [v113 fetchStoredLocationsWithOptions:v369 handler:v423];

    uint64_t v115 = (id *)(v448 + 5);
    id v116 = (id)v448[5];
    v378 = v114;
    uint64_t v117 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v118 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v378, v118))
    {
      dispatch_time_t v119 = [MEMORY[0x1E4F1C9C8] now];
      [v119 timeIntervalSinceDate:v117];
      double v121 = v120;
      v122 = objc_opt_new();
      v123 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
      double v124 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v125 = [v124 filteredArrayUsingPredicate:v123];
      v126 = [v125 firstObject];

      [v122 submitToCoreAnalytics:v126 type:1 duration:v121];
      v127 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v127, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      double v128 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v459 = v396;
      *(void *)long long buf = @"semaphore wait timeout";
      v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v459 count:1];
      v130 = [v128 errorWithDomain:v395 code:15 userInfo:v129];

      if (v130)
      {
        id v116 = v130;
      }
    }

    objc_storeStrong(v115, v116);
    if (v448[5])
    {
      v131 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        uint64_t v280 = v448[5];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v370;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v280;
        _os_log_error_impl(&dword_1D9BFA000, v131, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing fetchStoredLocationsWithOptions for fetchInterval %@, error %@", buf, 0x16u);
      }

      v376[2](v376, v448[5]);
      int v132 = 1;
      goto LABEL_140;
    }
    v133 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v285 = v429[3];
      id v286 = [v367 stringFromDate];
      v287 = [v365 stringFromDate];
      *(_DWORD *)long long buf = 134218498;
      *(void *)&uint8_t buf[4] = v285;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v286;
      *(_WORD *)&buf[22] = 2112;
      v466 = v287;
      _os_log_debug_impl(&dword_1D9BFA000, v133, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, loaded samples this iteration, %tu for interval %@ to %@", buf, 0x20u);
    }
    v403 = [MEMORY[0x1E4F1CA48] array];
    for (unint64_t i = 0; i < [*((id *)v469 + 5) count]; ++i)
    {
      if (i)
      {
        v135 = [*((id *)v469 + 5) objectAtIndexedSubscript:i];
        id v136 = [v135 timestamp];
        id v137 = [*((id *)v469 + 5) objectAtIndexedSubscript:i - 1];
        v138 = [v137 timestamp];
        [v136 timeIntervalSinceDate:v138];
        BOOL v140 = v139 >= 0.1;
      }
      else
      {
        BOOL v140 = 1;
      }
      double v141 = [*((id *)v469 + 5) objectAtIndexedSubscript:i];
      BOOL v142 = +[RTTripSegmentManager isValidSynthesizedLocation:v141];

      if (v140)
      {
        if (v142)
        {
          double v143 = [*((id *)v469 + 5) objectAtIndexedSubscript:i];
          [v403 addObject:v143];
        }
        else
        {
LABEL_80:
          double v143 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
          {
            v152 = [*((id *)v469 + 5) objectAtIndexedSubscript:i];
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v152;
            _os_log_debug_impl(&dword_1D9BFA000, v143, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler: invalid properties detected, deleting location %@", buf, 0xCu);
          }
        }

        continue;
      }
      double v144 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
      {
        v145 = [*((id *)v469 + 5) objectAtIndexedSubscript:i];
        v146 = [v145 timestamp];
        double v147 = [*((id *)v469 + 5) objectAtIndexedSubscript:i - 1];
        v148 = [v147 timestamp];
        [v146 timeIntervalSinceDate:v148];
        uint64_t v150 = v149;
        id v151 = [*((id *)v469 + 5) objectAtIndexedSubscript:i];
        *(_DWORD *)long long buf = 134218242;
        *(void *)&uint8_t buf[4] = v150;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v151;
        _os_log_debug_impl(&dword_1D9BFA000, v144, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler: invalid date interval %f, deleting location %@", buf, 0x16u);
      }
      if (!v142) {
        goto LABEL_80;
      }
    }
    if (![(RTTripSegmentManager *)self isSpeedValidityCheckingEnabled])
    {
      int v225 = 0;
      goto LABEL_103;
    }
    char v372 = 0;
    double v392 = 0.0;
    unint64_t v153 = 1;
    while (2)
    {
      if (v153 < [v403 count])
      {
        unint64_t v400 = v153;
        v154 = [v403 objectAtIndexedSubscript:v153];
        id v155 = [v154 timestamp];
        unint64_t v156 = v400 - 1;
        v157 = [v403 objectAtIndexedSubscript:v400 - 1];
        id v158 = [v157 timestamp];
        [v155 timeIntervalSinceDate:v158];
        double v160 = v159;

        if (v160 > 2.1 || v160 < 0.0001)
        {
          double v195 = v392;
        }
        else
        {
          distanceCalculator = self->_distanceCalculator;
          id v161 = objc_alloc(MEMORY[0x1E4F5CE00]);
          v388 = [v403 objectAtIndexedSubscript:v400];
          [v388 coordinate];
          double v163 = v162;
          id obja = [v403 objectAtIndexedSubscript:v400];
          [obja coordinate];
          double v165 = v164;
          v382 = [v403 objectAtIndexedSubscript:v400];
          [v382 horizontalAccuracy];
          double v167 = v166;
          v168 = [v403 objectAtIndexedSubscript:v400];
          v169 = [v168 timestamp];
          v170 = (void *)[v161 initWithLatitude:v169 longitude:v163 horizontalUncertainty:v165 date:v167];
          id v171 = objc_alloc(MEMORY[0x1E4F5CE00]);
          v172 = [v403 objectAtIndexedSubscript:v156];
          [v172 coordinate];
          double v174 = v173;
          uint64_t v175 = [v403 objectAtIndexedSubscript:v156];
          [v175 coordinate];
          double v177 = v176;
          double v178 = [v403 objectAtIndexedSubscript:v156];
          [v178 horizontalAccuracy];
          double v180 = v179;
          uint64_t v181 = [v403 objectAtIndexedSubscript:v156];
          uint64_t v182 = [v181 timestamp];
          uint64_t v183 = (void *)[v171 initWithLatitude:v182 longitude:v174 horizontalUncertainty:v177 date:v180];
          id v422 = 0;
          [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v170 toLocation:v183 error:&v422];
          double v185 = v184;
          id v381 = v422;

          BOOL v186 = [v403 objectAtIndexedSubscript:v400];
          [v186 speed];
          double v188 = v187;
          id v189 = [v403 objectAtIndexedSubscript:v156];
          [v189 speed];
          double v191 = v190;

          if (!v381)
          {
            double v192 = v185 / v160;
            if (v192 < 0.1)
            {
              dispatch_semaphore_t v193 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
              {
                dispatch_semaphore_t v194 = [v403 objectAtIndexedSubscript:v400];
                *(_DWORD *)long long buf = 134218498;
                *(double *)&uint8_t buf[4] = v192;
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = v192;
                *(_WORD *)&buf[22] = 2112;
                v466 = v194;
                _os_log_error_impl(&dword_1D9BFA000, v193, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, found location with speed inconsistent with delta position, (delta pos. %f), updating to new speed, %f mps, in location sample, %@.", buf, 0x20u);
              }
              goto LABEL_97;
            }
          }
          double v196 = vabdd_f64(v188, v191) / v160;
          double v195 = 0.0;
          if (v196 > v392 * 0.1 + 10.0)
          {
            id v197 = [v403 objectAtIndexedSubscript:v156];
            [v197 speed];
            double v192 = v198;

            dispatch_semaphore_t v193 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            double v392 = v392 + v160;
            if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
            {
              id v224 = [v403 objectAtIndexedSubscript:v400];
              *(_DWORD *)long long buf = 134218754;
              *(double *)&uint8_t buf[4] = v196;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = 0x4024000000000000;
              *(_WORD *)&buf[22] = 2048;
              v466 = *(uint64_t (**)(uint64_t, uint64_t))&v192;
              *(_WORD *)v467 = 2112;
              *(void *)&v467[2] = v224;
              _os_log_error_impl(&dword_1D9BFA000, v193, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, found location with large discontinuity in speed (%f > %f), updating to new speed, %f mps, in location sample, %@.", buf, 0x2Au);
            }
LABEL_97:

            double v195 = 0.0;
            if (v192 >= 0.0)
            {
              v368 = [RTSynthesizedLocation alloc];
              v389 = [v403 objectAtIndexedSubscript:v400];
              [v389 coordinate];
              double v200 = v199;
              double v202 = v201;
              id objb = [v403 objectAtIndexedSubscript:v400];
              [objb altitude];
              double v204 = v203;
              v383 = [v403 objectAtIndexedSubscript:v400];
              [v383 horizontalAccuracy];
              double v206 = v205;
              v373 = [v403 objectAtIndexedSubscript:v400];
              [v373 verticalAccuracy];
              double v208 = v207;
              v371 = [v403 objectAtIndexedSubscript:v400];
              [v371 course];
              double v210 = v209;
              uint64_t v211 = [v403 objectAtIndexedSubscript:v400];
              [v211 courseAccuracy];
              double v213 = v212;
              long long v214 = [v403 objectAtIndexedSubscript:v400];
              uint64_t v215 = [v214 geoRoadClass];
              long long v216 = [v403 objectAtIndexedSubscript:v400];
              uint64_t v217 = [v216 geoFormOfWay];
              v218 = [v403 objectAtIndexedSubscript:v400];
              uint64_t v219 = [v218 locationType];
              v220 = [v403 objectAtIndexedSubscript:v400];
              v221 = [v220 timestamp];
              id v222 = [v403 objectAtIndexedSubscript:v400];
              v223 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v368, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v215, v217, v219, v221, [v222 downsamplingLevel], v200, v202, v204, v206, v208, v210, v213, v192, 0x4024000000000000);
              [v403 setObject:v223 atIndexedSubscript:v400];

              char v372 = 1;
              double v195 = v392;
            }
          }
        }
        unint64_t v153 = v400 + 1;
        double v392 = v195;
        continue;
      }
      break;
    }
    int v225 = v372 & 1;
LABEL_103:
    unint64_t v226 = [v403 count];
    if (v226 < [*((id *)v469 + 5) count]) {
      int v227 = 1;
    }
    else {
      int v227 = v225;
    }
    if (v227 == 1)
    {
      id v228 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v228, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v291 = [*((id *)v469 + 5) count];
        uint64_t v292 = [v403 count];
        uint64_t v293 = [*((id *)v469 + 5) count];
        v294 = [v367 stringFromDate];
        [v365 stringFromDate];
        uint64_t v295 = v291 - v292;
        id v296 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 134218754;
        *(void *)&uint8_t buf[4] = v295;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v293;
        *(_WORD *)&buf[22] = 2112;
        v466 = v294;
        *(_WORD *)v467 = 2112;
        *(void *)&v467[2] = v296;
        _os_log_debug_impl(&dword_1D9BFA000, v228, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, %ld invalid locations found in the %ld fetched locations for interval %@ to %@", buf, 0x2Au);
      }
      dispatch_semaphore_t v229 = dispatch_semaphore_create(0);
      id v230 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v231 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      long long v232 = [v370 startDate];
      uint64_t v233 = (void *)[v231 initWithTimeInterval:v232 sinceDate:-0.001];
      id v234 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      uint64_t v235 = [*((id *)v469 + 5) lastObject];
      v236 = [v235 timestamp];
      v237 = (void *)[v234 initWithTimeInterval:v236 sinceDate:0.001];
      v401 = (void *)[v230 initWithStartDate:v233 endDate:v237];

      v238 = [(RTTripSegmentManager *)self locationStore];
      v419[0] = MEMORY[0x1E4F143A8];
      v419[1] = 3221225472;
      v419[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_122;
      v419[3] = &unk_1E6B90728;
      v421 = &v480;
      v239 = v229;
      v420 = v239;
      [v238 removeLocationsOnDateInterval:v401 handler:v419];

      id v240 = (id *)(v481 + 5);
      id v241 = (id)v481[5];
      v242 = v239;
      uint64_t v243 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v244 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v242, v244))
      {
        v245 = [MEMORY[0x1E4F1C9C8] now];
        [v245 timeIntervalSinceDate:v243];
        double v247 = v246;
        v248 = objc_opt_new();
        v249 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
        v250 = [MEMORY[0x1E4F29060] callStackSymbols];
        v251 = [v250 filteredArrayUsingPredicate:v249];
        v252 = [v251 firstObject];

        [v248 submitToCoreAnalytics:v252 type:1 duration:v247];
        v253 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v253, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v253, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v254 = (void *)MEMORY[0x1E4F28C58];
        *(void *)v459 = v396;
        *(void *)long long buf = @"semaphore wait timeout";
        v255 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v459 count:1];
        v256 = [v254 errorWithDomain:v395 code:15 userInfo:v255];

        if (v256)
        {
          id v241 = v256;
        }
      }

      objc_storeStrong(v240, v241);
      if (v481[5])
      {
        v257 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v257, OS_LOG_TYPE_ERROR))
        {
          uint64_t v299 = v481[5];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v401;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v299;
          _os_log_error_impl(&dword_1D9BFA000, v257, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing removeLocationsOnDateInterval for dateInterval %@, error %@", buf, 0x16u);
        }

        v376[2](v376, v481[5]);
        int v258 = 1;
      }
      else
      {
        dispatch_semaphore_t v260 = dispatch_semaphore_create(0);
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v466 = __Block_byref_object_copy__1;
        *(void *)v467 = __Block_byref_object_dispose__1;
        *(void *)&v467[8] = 0;
        v261 = [(RTTripSegmentManager *)self locationStore];
        v416[0] = MEMORY[0x1E4F143A8];
        v416[1] = 3221225472;
        v416[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_123;
        v416[3] = &unk_1E6B90728;
        v418 = buf;
        v262 = v260;
        v417 = v262;
        [v261 storeLocations:v403 handler:v416];

        v263 = (id *)(*(void *)&buf[8] + 40);
        id v264 = *(id *)(*(void *)&buf[8] + 40);
        v265 = v262;
        v266 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v267 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v265, v267))
        {
          v393 = [MEMORY[0x1E4F1C9C8] now];
          [v393 timeIntervalSinceDate:v266];
          double v269 = v268;
          v270 = objc_opt_new();
          v271 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
          v272 = [MEMORY[0x1E4F29060] callStackSymbols];
          v273 = [v272 filteredArrayUsingPredicate:v271];
          v274 = [v273 firstObject];

          [v270 submitToCoreAnalytics:v274 type:1 duration:v269];
          v275 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v275, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v459 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v275, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v459, 2u);
          }

          v276 = (void *)MEMORY[0x1E4F28C58];
          v486[0] = v396;
          *(void *)v459 = @"semaphore wait timeout";
          v277 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v459 forKeys:v486 count:1];
          v278 = [v276 errorWithDomain:v395 code:15 userInfo:v277];

          if (v278)
          {
            id v264 = v278;
          }
        }

        objc_storeStrong(v263, v264);
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          v279 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
          {
            uint64_t v300 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v459 = 138412546;
            *(void *)&v459[4] = v401;
            __int16 v460 = 2112;
            uint64_t v461 = v300;
            _os_log_error_impl(&dword_1D9BFA000, v279, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing [self.locationStore storeLocations:sanitizedLocations for , dateInterval %@, error %@", v459, 0x16u);
          }

          v376[2](v376, *(void *)(*(void *)&buf[8] + 40));
          int v258 = 1;
        }
        else
        {
          int v258 = 0;
        }

        _Block_object_dispose(buf, 8);
      }

      if (v258)
      {
        int v132 = 1;
        goto LABEL_139;
      }
    }
    else
    {
      v259 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v259, OS_LOG_TYPE_DEBUG))
      {
        id v297 = [v367 stringFromDate];
        v298 = [v365 stringFromDate];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v297;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v298;
        _os_log_debug_impl(&dword_1D9BFA000, v259, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, no invalid locations found for interval %@ to %@", buf, 0x16u);
      }
    }
    if ([v403 count])
    {
      v281 = [v403 lastObject];
      uint64_t v282 = [v281 timestamp];

      v367 = (void *)v282;
    }
    uint64_t v283 = v429[3];
    v284 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    uint64_t v364 = v283 - (v366 != 0);
    v366 += v364;
    if (os_log_type_enabled(v284, OS_LOG_TYPE_DEBUG))
    {
      v288 = (uint64_t (*)(uint64_t, uint64_t))v437[3];
      id v289 = [v367 stringFromDate];
      id v290 = [v365 stringFromDate];
      *(_DWORD *)long long buf = 134219010;
      *(void *)&uint8_t buf[4] = v364;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v366;
      *(_WORD *)&buf[22] = 2048;
      v466 = v288;
      *(_WORD *)v467 = 2112;
      *(void *)&v467[2] = v289;
      *(_WORD *)&v467[10] = 2112;
      *(void *)&v467[12] = v290;
      _os_log_debug_impl(&dword_1D9BFA000, v284, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, iteration loaded, %tu, total loaded samples, %tu, of expected %tu, next interval from %@ to %@", buf, 0x34u);
    }
    int v132 = 0;
LABEL_139:

LABEL_140:
    _Block_object_dispose(v468, 8);

    if (v132) {
      goto LABEL_179;
    }
  }
  while (v366 < v437[3] && v364);
  long long v414 = 0u;
  long long v415 = 0u;
  long long v412 = 0u;
  long long v413 = 0u;
  id obj = (id)v454[5];
  uint64_t v301 = [obj countByEnumeratingWithState:&v412 objects:v464 count:16];
  if (!v301) {
    goto LABEL_178;
  }
  uint64_t v394 = *(void *)v413;
  while (2)
  {
    uint64_t v302 = 0;
    uint64_t v397 = v301;
    while (2)
    {
      if (*(void *)v413 != v394) {
        objc_enumerationMutation(obj);
      }
      uint64_t v404 = v302;
      v303 = *(void **)(*((void *)&v412 + 1) + 8 * v302);
      [v303 tripDistance];
      if (v304 >= 500.0)
      {
        v305 = [v303 dateInterval];
        [v305 duration];
        BOOL v307 = v306 < 60.0;

        if (!v307)
        {
          dispatch_semaphore_t v329 = dispatch_semaphore_create(0);
          *(void *)v468 = 0;
          v469 = v468;
          uint64_t v470 = 0x2020000000;
          v471 = 0;
          *(void *)long long buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          v466 = __Block_byref_object_copy__1;
          *(void *)v467 = __Block_byref_object_dispose__1;
          *(void *)&v467[8] = 0;
          v390 = (void *)[objc_alloc(MEMORY[0x1E4F5CE30]) initWithTripSegment:v303];
          v408[0] = MEMORY[0x1E4F143A8];
          v408[1] = 3221225472;
          v408[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_125;
          v408[3] = &unk_1E6B908E0;
          v410 = buf;
          v411 = v468;
          v330 = v329;
          v409 = v330;
          [(RTTripSegmentManager *)self _fetchLocationsCountForTripSegmentWithOptions:v390 handler:v408];
          v332 = (id *)(*(void *)&buf[8] + 40);
          id v331 = *(id *)(*(void *)&buf[8] + 40);
          v333 = v330;
          v334 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v335 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(v333, v335))
          {
            v384 = [MEMORY[0x1E4F1C9C8] now];
            [v384 timeIntervalSinceDate:v334];
            double v337 = v336;
            v338 = objc_opt_new();
            v339 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
            v340 = [MEMORY[0x1E4F29060] callStackSymbols];
            v341 = [v340 filteredArrayUsingPredicate:v339];
            v342 = [v341 firstObject];

            [v338 submitToCoreAnalytics:v342 type:1 duration:v337];
            v343 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v343, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v459 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v343, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v459, 2u);
            }

            v344 = (void *)MEMORY[0x1E4F28C58];
            v486[0] = v396;
            *(void *)v459 = @"semaphore wait timeout";
            v345 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v459 forKeys:v486 count:1];
            v346 = [v344 errorWithDomain:v395 code:15 userInfo:v345];

            if (v346)
            {
              id v331 = v346;
            }
          }

          objc_storeStrong(v332, v331);
          uint64_t v347 = *(void *)(*(void *)&buf[8] + 40);
          BOOL v348 = v347 != 0;
          if (v347)
          {
            v349 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
            {
              uint64_t v350 = v448[5];
              *(_DWORD *)v459 = 138412546;
              *(void *)&v459[4] = v303;
              __int16 v460 = 2112;
              uint64_t v461 = v350;
              v351 = v349;
              v352 = "RTTripSegmentManager:Error executing fetchLocationsCountForTripSegmentWithOptions for tripSegment %@, error, %@";
              uint32_t v353 = 22;
LABEL_172:
              _os_log_error_impl(&dword_1D9BFA000, v351, OS_LOG_TYPE_ERROR, v352, v459, v353);
            }
          }
          else
          {
            if (*((void *)v469 + 3) > 2uLL)
            {
              BOOL v348 = 1;
LABEL_174:

              _Block_object_dispose(buf, 8);
              _Block_object_dispose(v468, 8);

              if (v347 == 0 && !v348) {
                goto LABEL_153;
              }
              goto LABEL_159;
            }
            v349 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
            {
              uint64_t v354 = *((void *)v469 + 3);
              *(_DWORD *)v459 = 134218498;
              *(void *)&v459[4] = v354;
              __int16 v460 = 2048;
              uint64_t v461 = 3;
              __int16 v462 = 2112;
              v463 = v303;
              v351 = v349;
              v352 = "RTTripSegmentManager: found %ld locations for tripSegment, which is fewer than the minimum requirem"
                     "ent of %ld, deleting trip segment, %@.";
              uint32_t v353 = 32;
              goto LABEL_172;
            }
          }

          goto LABEL_174;
        }
      }
      v308 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134218498;
        *(void *)&uint8_t buf[4] = 0x404E000000000000;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 0x407F400000000000;
        *(_WORD *)&buf[22] = 2112;
        v466 = (uint64_t (*)(uint64_t, uint64_t))v303;
        _os_log_error_impl(&dword_1D9BFA000, v308, OS_LOG_TYPE_ERROR, "RTTripSegmentManager: tripSegment has duration lower than threshold %f s, or distance lower than threshold %f m, deleting trip segment, %@.", buf, 0x20u);
      }

LABEL_153:
      dispatch_semaphore_t v309 = dispatch_semaphore_create(0);
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v466 = __Block_byref_object_copy__1;
      *(void *)v467 = __Block_byref_object_dispose__1;
      *(void *)&v467[8] = 0;
      v310 = [v303 identifier];
      v405[0] = MEMORY[0x1E4F143A8];
      v405[1] = 3221225472;
      v405[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_126;
      v405[3] = &unk_1E6B90728;
      v407 = buf;
      v311 = v309;
      v406 = v311;
      [(RTTripSegmentManager *)self _deleteTripSegmentWithUUID:v310 handler:v405];

      v312 = (id *)(*(void *)&buf[8] + 40);
      id v313 = *(id *)(*(void *)&buf[8] + 40);
      v314 = v311;
      v315 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v316 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v314, v316))
      {
        v317 = [MEMORY[0x1E4F1C9C8] now];
        [v317 timeIntervalSinceDate:v315];
        double v319 = v318;
        v320 = objc_opt_new();
        v321 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
        v322 = [MEMORY[0x1E4F29060] callStackSymbols];
        v323 = [v322 filteredArrayUsingPredicate:v321];
        v324 = [v323 firstObject];

        [v320 submitToCoreAnalytics:v324 type:1 duration:v319];
        v325 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v325, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v468 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v325, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v468, 2u);
        }

        v326 = (void *)MEMORY[0x1E4F28C58];
        *(void *)v459 = v396;
        *(void *)v468 = @"semaphore wait timeout";
        v327 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v468 forKeys:v459 count:1];
        v328 = [v326 errorWithDomain:v395 code:15 userInfo:v327];

        if (v328)
        {
          id v313 = v328;
        }
      }

      objc_storeStrong(v312, v313);
      _Block_object_dispose(buf, 8);

LABEL_159:
      uint64_t v302 = v404 + 1;
      if (v397 != v404 + 1) {
        continue;
      }
      break;
    }
    uint64_t v301 = [obj countByEnumeratingWithState:&v412 objects:v464 count:16];
    if (v301) {
      continue;
    }
    break;
  }
LABEL_178:

  v376[2](v376, 0);
LABEL_179:
  _Block_object_dispose(&v428, 8);
LABEL_180:

  _Block_object_dispose(&v474, 8);
  _Block_object_dispose(&v436, 8);

LABEL_181:
  _Block_object_dispose(&v480, 8);

LABEL_182:
  _Block_object_dispose(&v447, 8);

  _Block_object_dispose(&v453, 8);
LABEL_183:
}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_118(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_119(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_122(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_123(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_125(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_126(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)sanitizeTripSegmentDatabaseSinceDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTTripSegmentManager_sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __69__RTTripSegmentManager_sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sanitizeTripSegmentDatabaseSinceDate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (RTTripSegmentStore)tripSegmentStore
{
  return self->_tripSegmentStore;
}

- (void)setTripSegmentStore:(id)a3
{
}

- (RTSynthesizedLocationStore)locationStore
{
  return self->_locationStore;
}

- (void)setLocationStore:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTElevationAdjuster)elevationAdjuster
{
  return self->_elevationAdjuster;
}

- (void)setElevationAdjuster:(id)a3
{
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTTripSegment)tripSegmentUnderConstruction
{
  return self->_tripSegmentUnderConstruction;
}

- (void)setTripSegmentUnderConstruction:(id)a3
{
}

- (NSDate)tripSegmentUnderConstructionLastLocationTimestamp
{
  return self->_tripSegmentUnderConstructionLastLocationTimestamp;
}

- (void)setTripSegmentUnderConstructionLastLocationTimestamp:(id)a3
{
}

- (BOOL)tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations
{
  return self->_tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations;
}

- (void)setTripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations:(BOOL)a3
{
  self->_tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations = a3;
}

- (BOOL)isTripSegmentGenerationEnabled
{
  return self->_isTripSegmentGenerationEnabled;
}

- (void)setIsTripSegmentGenerationEnabled:(BOOL)a3
{
  self->_isTripSegmentGenerationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripSegmentUnderConstructionLastLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_tripSegmentUnderConstruction, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_elevationAdjuster, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);

  objc_storeStrong((id *)&self->_tripSegmentStore, 0);
}

@end