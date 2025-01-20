@interface RTWorkoutRouteManager
+ (id)curveOrientationTypeToString:(unint64_t)a3;
- (BOOL)_areWorkoutsSimilarBetweenClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 error:(id *)a7;
- (BOOL)_clearDistanceMatrixWithError:(id *)a3;
- (BOOL)_clearInMemoryClusters;
- (BOOL)_computeAndSaveDistanceMatrixForWorkoutUUIDs:(id)a3 distanceMetric:(int64_t)a4 error:(id *)a5;
- (BOOL)_deleteAllClustersFromHealthKitError:(id *)a3;
- (BOOL)_initProcessWorkoutMetrics:(id *)a3;
- (BOOL)_initProcessWorkoutMetricsForClusteringWithError:(id *)a3;
- (BOOL)_initProcessWorkoutMetricsForDistanceMatrixWithError:(id *)a3;
- (BOOL)_initProcessWorkoutMetricsForSyncFromHealthKitWithError:(id *)a3;
- (BOOL)_initProcessWorkoutMetricsForSyncToHealthKitWithError:(id *)a3;
- (BOOL)_initProcessWorkoutMetricsForSyncToWatchKitWithError:(id *)a3;
- (BOOL)_isBoundingBoxAreaLessThanThresholdSubPrefilter:(CGRect)a3 verticesCount:(unint64_t)a4 stimulationDate:(id)a5 error:(id *)a6;
- (BOOL)_isBoundingBoxDimensionsWithinTrackThresholdsSubPrefilter:(CGRect)a3;
- (BOOL)_isEligibleForCurveOrientation:(CLLocationCoordinate2D *)a3 lastLocation:(CLLocationCoordinate2D *)a4 error:(id *)a5;
- (BOOL)_isPreFilteredCentroidBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8;
- (BOOL)_isPreFilteredCurveOrientationBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 error:(id *)a7;
- (BOOL)_isPreFilteredForWorkout:(id)a3 firstFewLocations:(CLLocationCoordinate2D *)a4 firstFewLocationsCount:(unint64_t)a5 cachedDictionary:(id)a6 otherWorkout:(id)a7 firstFewOtherLocations:(CLLocationCoordinate2D *)a8 firstFewOtherLocationsCount:(unint64_t)a9 cachedOtherDictionary:(id)a10 preFilteringResults:(id)a11 error:(id *)a12;
- (BOOL)_isPreFilteredForWorkout:(id)a3 otherWorkout:(id)a4 preFilteringResults:(id)a5 error:(id *)a6;
- (BOOL)_isPreFilteredIOUBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8;
- (BOOL)_isPreFilteredLastLocationBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8;
- (BOOL)_isPreFilteredLocationCountBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8;
- (BOOL)_isPreFilteredRunningTrackBasedForWorkout:(id)a3 cachedDictionary:(id)a4 error:(id *)a5;
- (BOOL)_preComputeCacheForWorkout:(id)a3 locations:(CLLocationCoordinate2D *)a4 locationsCount:(unint64_t)a5 decimatedLocations:(CLLocationCoordinate2D *)a6 decimatedLocationsCount:(unint64_t)a7 cachedDictionary:(id)a8 error:(id *)a9;
- (BOOL)_processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:(id)a3 error:(id *)a4;
- (BOOL)_refreshWorkoutsCache:(id)a3 workoutUUIDs:(id)a4 startingIndex:(unint64_t)a5 error:(id *)a6;
- (BOOL)_saveToHealthKitClustersForCreation:(id)a3 remoteClustersForUpdationNewWorkouts:(id)a4 remoteClustersForUpdationWorkoutsToRemove:(id)a5 remoteClustersForDeletion:(id)a6 error:(id *)a7;
- (BOOL)_shouldDecimateWorkout:(id)a3;
- (BOOL)_storeWorkoutDistances:(id)a3 error:(id *)a4;
- (BOOL)_syncClustersToHealthKit:(id)a3 error:(id *)a4;
- (BOOL)_syncClustersToWatchWithLimit:(unint64_t)a3 error:(id *)a4;
- (BOOL)_syncWithRemoteClustersUsingLocalClusters:(id)a3 distanceMetric:(int64_t)a4 outLocalClustersForCreation:(id)a5 outRemoteClustersForUpdationNewWorkouts:(id)a6 outRemoteClustersForUpdationWorkoutsToRemove:(id)a7 outRemoteClustersForDeletion:(id)a8 error:(id *)a9;
- (BOOL)_updateMetricsForCurrentTime:(id)a3 distanceMatrixKey:(unint64_t)a4 error:(id *)a5;
- (BOOL)_updateMetricsForCurrentTime:(id)a3 minTimeKey:(id)a4 maxTimeKey:(id)a5 averageTimeKey:(id)a6 countKey:(id)a7 error:(id *)a8;
- (BOOL)_updateMetricsForCurrentTime:(id)a3 syncToHealthKitKey:(unint64_t)a4 error:(id *)a5;
- (BOOL)_updateWorkoutDistanceRecordsWithObjectIDs:(id)a3 isVisited:(BOOL)a4 error:(id *)a5;
- (BOOL)_validateWorkout:(id)a3 otherWorkout:(id)a4 error:(id *)a5;
- (BOOL)isSchedulerTriggered;
- (CGRect)_getCGRectFromCoordinates:(CLLocationCoordinate2D *)a3 verticesCount:(unint64_t)a4 outError:(id *)a5;
- (CLLocationCoordinate2D)_getCoordinatesFromRTPairs:(id)a3;
- (NSDate)lastTimeRouteLabelFailed;
- (NSMutableDictionary)processWorkoutMetrics;
- (NSMutableDictionary)workoutActivityTypeToclustersSet;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTHealthKitManager)healthKitManager;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTPlatform)platform;
- (RTWorkoutDistanceStore)workoutDistanceStore;
- (RTWorkoutMetricsManager)workoutMetricsManager;
- (RTWorkoutRouteManager)init;
- (RTWorkoutRouteManager)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 platform:(id)a8 workoutDistanceStore:(id)a9 workoutMetricsManager:(id)a10;
- (RTXPCActivityManager)xpcActivityManager;
- (double)_getConstantValueForString:(id)a3 isDecimated:(BOOL)a4 workoutActivityType:(unint64_t)a5 error:(id *)a6;
- (double)_getMaxDistanceThresholdForMetric:(int64_t)a3 error:(id *)a4;
- (double)_relevanceScoreForWorkoutUUIDs:(id)a3 representativeWorkout:(id)a4 latestWorkoutAcrossAllWorkouts:(id)a5 countOfAllWorkouts:(unint64_t)a6 currentLocation:(id)a7 error:(id *)a8;
- (double)similarityDistanceUsingPreFilteringResults:(id)a3 error:(id *)a4;
- (id)_bestWorkoutFromWorkouts:(id)a3 error:(id *)a4;
- (id)_clusterizeWorkoutsWithError:(id *)a3;
- (id)_colorFromHexString:(id)a3;
- (id)_getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold:(double)a3 topN:(unint64_t)a4 error:(id *)a5;
- (id)_getConstantValueForDistanceThresholdUsingDistanceMetric:(int64_t)a3 isDecimated:(BOOL)a4 workoutActivityType:(unint64_t)a5 error:(id *)a6;
- (id)_getRTLocationUsingCLLocationCoordinate2D:(CLLocationCoordinate2D *)a3;
- (id)_getRTLocationUsingRTPair:(id)a3;
- (id)_getRTPairUsingCLLocationCoordinate2D:(CLLocationCoordinate2D *)a3;
- (id)_getRTPairsFromCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4;
- (id)_getRelevanceLocationWithError:(id *)a3;
- (id)_getRemoteWorkoutClustersForWorkoutUUIDs:(id)a3 error:(id *)a4;
- (id)_getWorkoutFromWorkouts:(id)a3 UUID:(id)a4 error:(id *)a5;
- (id)_getWorkoutRouteLabelForWorkout:(id)a3 error:(id *)a4;
- (id)_getWorkoutRouteSnapshotForWorkout:(id)a3 error:(id *)a4;
- (id)_getWorkoutUUIDsForCluster:(id)a3 error:(id *)a4;
- (id)_lastWorkoutFromWorkouts:(id)a3 error:(id *)a4;
- (id)_latestWorkoutUUIDAcrossWorkouts:(id)a3;
- (id)_mapWorkoutsToUUIDs:(id)a3 error:(id *)a4;
- (id)_paceFromWorkout:(id)a3 error:(id *)a4;
- (id)_readClustersFromHealthKitWithError:(id *)a3;
- (id)_retrieveUUIDsToPruneWithError:(id *)a3;
- (id)_sortWorkoutUUIDs:(id)a3 key:(id)a4 ascending:(BOOL)a5 error:(id *)a6;
- (id)_sortWorkoutUUIDsByDistance:(id)a3 error:(id *)a4;
- (id)_sortWorkouts:(id)a3 key:(id)a4 ascending:(BOOL)a5 error:(id *)a6;
- (int64_t)distanceMetric;
- (unint64_t)_getCurveOrientationTypeForLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5;
- (void)_deleteWorkout:(id)a3 handler:(id)a4;
- (void)_getLocationsForWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(int64_t)a5 handler:(id)a6;
- (void)_logClusters:(id)a3 className:(id)a4 selectorName:(id)a5;
- (void)_processNewlyAddedWorkout:(id)a3 handler:(id)a4;
- (void)_processWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 handler:(id)a11;
- (void)_pruneDistanceMatrixWithHandler:(id)a3;
- (void)_stepCallerWithName:(id)a3 counter:(int64_t)a4 totalCount:(int64_t)a5;
- (void)_updateRelevanceScoresWithHandler:(id)a3;
- (void)deleteWorkout:(id)a3 handler:(id)a4;
- (void)displayWorkoutDistanceRecordsWithHandler:(id)a3;
- (void)processNewlyAddedWorkout:(id)a3 handler:(id)a4;
- (void)processWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 handler:(id)a11;
- (void)pruneDistanceMatrixWithHandler:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setDistanceMetric:(int64_t)a3;
- (void)setHealthKitManager:(id)a3;
- (void)setIsSchedulerTriggered:(BOOL)a3;
- (void)setLastTimeRouteLabelFailed:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setProcessWorkoutMetrics:(id)a3;
- (void)setWorkoutActivityTypeToclustersSet:(id)a3;
- (void)setWorkoutDistanceStore:(id)a3;
- (void)setWorkoutMetricsManager:(id)a3;
- (void)setXpcActivityManager:(id)a3;
- (void)updateRelevanceScoresWithHandler:(id)a3;
@end

@implementation RTWorkoutRouteManager

+ (id)curveOrientationTypeToString:(unint64_t)a3
{
  v3 = @"curveOrientationUnknown";
  if (a3 == 1) {
    v3 = @"curveOrientationClockwise";
  }
  if (a3 == 2) {
    return @"curveOrientationCounterClockwise";
  }
  else {
    return v3;
  }
}

- (RTWorkoutRouteManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_healthKitManager_locationManager_mapServiceManager_platform_workoutDistanceStore_workoutMetricsManager_);
}

- (RTWorkoutRouteManager)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 platform:(id)a8 workoutDistanceStore:(id)a9 workoutMetricsManager:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v36 = a5;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v32 = a9;
  id v18 = a10;
  if (!v16)
  {
    v24 = v18;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: defaultsManager";
LABEL_26:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_27;
  }
  if (!v17)
  {
    v24 = v18;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_26;
  }
  if (!v36)
  {
    v24 = v18;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_26;
  }
  if (!v35)
  {
    v24 = v18;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_26;
  }
  if (!v34)
  {
    v24 = v18;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_26;
  }
  if (!v33)
  {
    v24 = v18;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: platform";
    goto LABEL_26;
  }
  if (!v32)
  {
    v24 = v18;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: workoutDistanceStore";
      goto LABEL_26;
    }
LABEL_27:

    v23 = 0;
    v22 = self;
    goto LABEL_28;
  }
  id v29 = v18;
  if (v18)
  {
    v37.receiver = self;
    v37.super_class = (Class)RTWorkoutRouteManager;
    v19 = [(RTNotifier *)&v37 init];
    if (v19)
    {
      v31 = v19;
      objc_storeStrong((id *)&v19->_defaultsManager, a3);
      objc_storeStrong((id *)&v31->_distanceCalculator, a4);
      objc_storeStrong((id *)&v31->_healthKitManager, a5);
      objc_storeStrong((id *)&v31->_locationManager, a6);
      objc_storeStrong((id *)&v31->_mapServiceManager, a7);
      objc_storeStrong((id *)&v31->_platform, a8);
      objc_storeStrong((id *)&v31->_workoutDistanceStore, a9);
      objc_storeStrong((id *)&v31->_workoutMetricsManager, a10);
      v31->_distanceMetric = 2;
      uint64_t v20 = objc_opt_new();
      workoutActivityTypeToclustersSet = v31->_workoutActivityTypeToclustersSet;
      v31->_workoutActivityTypeToclustersSet = (NSMutableDictionary *)v20;

      v31->_isSchedulerTriggered = 1;
      [(RTService *)v31 setup];
      v19 = v31;
    }
    v22 = v19;
    v23 = v22;
    v24 = v29;
  }
  else
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutMetricsManager", buf, 2u);
    }

    v23 = 0;
    v24 = 0;
    v22 = self;
  }
LABEL_28:

  return v23;
}

- (void)processWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 handler:(id)a11
{
  BOOL v18 = a10;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v19 = a11;
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
  v21 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = unint64_t v31 = a9;
    NSStringFromSelector(a2);
    BOOL v24 = a5;
    v26 = BOOL v25 = a7;
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    v47 = v23;
    __int16 v48 = 2112;
    v49 = v26;
    __int16 v50 = 2048;
    uint64_t v51 = v27;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "--------->%@, %@, start processing workouts, footprint, %.4f MB<---------", buf, 0x20u);

    a7 = v25;
    a5 = v24;
    BOOL v18 = a10;

    a9 = v31;
  }

  v28 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke;
  block[3] = &unk_1E6B9AF38;
  BOOL v40 = a3;
  BOOL v41 = a4;
  BOOL v42 = a5;
  BOOL v43 = a6;
  BOOL v44 = a7;
  double v37 = a8;
  BOOL v45 = v18;
  id v35 = v20;
  id v36 = v19;
  unint64_t v38 = a9;
  SEL v39 = a2;
  block[4] = self;
  id v29 = v20;
  id v30 = v19;
  dispatch_async(v28, block);
}

void __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 81);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 82);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 83);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 84);
  double v7 = *(double *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  char v9 = *(unsigned char *)(a1 + 85);
  v14 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke_2;
  v15[3] = &unk_1E6B9AF10;
  objc_copyWeak(v18, &location);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  id v17 = v10;
  v15[4] = v11;
  v18[1] = *(id *)(a1 + 72);
  id v16 = v12;
  LOBYTE(v13) = v9;
  [v14 _processWorkoutsClearClusters:v2 clearExistingDistanceMatrix:v3 buildDistanceMatrix:v4 syncClustersToHealhtKit:v5 syncClustersToWatch:v6 filteringDistanceThreshold:v8 topNWorkouts:v7 isSchedulerTriggered:v13 handler:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_11;
  }
  if (v3)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      BOOL v18 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v19 = 138412802;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      v22 = v18;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@, %@, %@", (uint8_t *)&v19, 0x20u);
    }
  }
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    char v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    +[RTRuntime footprint];
    uint64_t v11 = v10;
    v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v19 = 138413314;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v3;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = v13;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "--------->%@, %@, finished processing workouts, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v19, 0x34u);
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14)
  {
    v15 = *(void (**)(void))(v14 + 16);
LABEL_11:
    v15();
  }
}

- (void)processNewlyAddedWorkout:(id)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = NSStringFromSelector(a2);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    __int16 v25 = v12;
    __int16 v26 = 2112;
    __int16 v27 = v13;
    __int16 v28 = 2048;
    uint64_t v29 = v14;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "--------->%@, %@, start processing newly added workout, footprint, %.4f MB<---------", buf, 0x20u);
  }
  v15 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke;
  block[3] = &unk_1E6B91C48;
  block[4] = self;
  id v20 = v7;
  id v22 = v8;
  SEL v23 = a2;
  id v21 = v9;
  id v16 = v9;
  id v17 = v8;
  id v18 = v7;
  dispatch_async(v15, block);
}

void __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke_2;
  v6[3] = &unk_1E6B9AF10;
  objc_copyWeak(v9, &location);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  v6[4] = v5;
  v9[1] = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  [v2 _processNewlyAddedWorkout:v3 handler:v6];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    +[RTRuntime footprint];
    uint64_t v10 = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v15 = 138413314;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "--------->%@, %@, finished processing newly added workout, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v15, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    uint64_t v14 = *(void (**)(void))(v13 + 16);
LABEL_7:
    v14();
  }
}

- (void)updateRelevanceScoresWithHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    id v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "--------->%@, %@, start update relevance scores, footprint, %.4f MB<---------", buf, 0x20u);
  }
  uint64_t v12 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke;
  v15[3] = &unk_1E6B927F8;
  id v17 = v5;
  SEL v18 = a2;
  v15[4] = self;
  id v16 = v6;
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v12, v15);
}

void __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke_2;
  v6[3] = &unk_1E6B9AF10;
  objc_copyWeak(v9, &location);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  v6[4] = v4;
  v9[1] = *(id *)(a1 + 56);
  id v7 = v5;
  [v2 _updateRelevanceScoresWithHandler:v6];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    +[RTRuntime footprint];
    uint64_t v10 = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v15 = 138413314;
    id v16 = v7;
    __int16 v17 = 2112;
    SEL v18 = v8;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "--------->%@, %@, finished update relevance scores, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v15, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    id v14 = *(void (**)(void))(v13 + 16);
LABEL_7:
    v14();
  }
}

- (void)deleteWorkout:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412546;
    __int16 v23 = v11;
    __int16 v24 = 2048;
    uint64_t v25 = v12;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "--------->%@, start deleting workout, footprint, %.4f MB<---------", buf, 0x16u);
  }
  uint64_t v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke;
  block[3] = &unk_1E6B91C48;
  block[4] = self;
  id v18 = v7;
  id v20 = v8;
  SEL v21 = a2;
  id v19 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v13, block);
}

void __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke_2;
  v6[3] = &unk_1E6B9AF60;
  objc_copyWeak(v9, &location);
  id v4 = *(id *)(a1 + 56);
  id v5 = *(void **)(a1 + 64);
  id v8 = v4;
  v9[1] = v5;
  id v7 = *(id *)(a1 + 48);
  [v2 _deleteWorkout:v3 handler:v6];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
    +[RTRuntime footprint];
    uint64_t v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v13 = 138413058;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "--------->%@, finished deleting workout, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    uint64_t v12 = *(void (**)(void))(v11 + 16);
LABEL_7:
    v12();
  }
}

- (void)pruneDistanceMatrixWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "--------->%@, start pruning distance matrix, footprint, %.4f MB<---------", buf, 0x16u);
  }
  uint64_t v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke;
  v13[3] = &unk_1E6B927F8;
  id v15 = v5;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v6;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v10, v13);
}

void __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke_2;
  v5[3] = &unk_1E6B9AF60;
  objc_copyWeak(v8, &location);
  id v3 = *(id *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v7 = v3;
  v8[1] = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _pruneDistanceMatrixWithHandler:v5];

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
    +[RTRuntime footprint];
    uint64_t v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v13 = 138413058;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "--------->%@, finished pruning distance matrix, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    id v12 = *(void (**)(void))(v11 + 16);
LABEL_7:
    v12();
  }
}

- (void)displayWorkoutDistanceRecordsWithHandler:(id)a3
{
  v113[1] = *MEMORY[0x1E4F143B8];
  v67 = (void (**)(id, id))a3;
  v63 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke;
  v88[3] = &unk_1E6B938D8;
  v90 = &v91;
  id v5 = v3;
  v89 = v5;
  [v4 fetchTotalWorkoutDistancesCountWithHandler:v88];

  dsema = v5;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v7 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v7)) {
    goto LABEL_6;
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;
  uint64_t v11 = objc_opt_new();
  id v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  int v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v14 = [v13 filteredArrayUsingPredicate:v12];
  __int16 v15 = [v14 firstObject];

  [v11 submitToCoreAnalytics:v15 type:1 duration:v10];
  id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  __int16 v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v107 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v107 count:1];
  __int16 v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v18];

  if (v19)
  {
    id v20 = v19;
  }
  else
  {
LABEL_6:
    id v20 = 0;
  }

  id v21 = v20;
  if (v21)
  {
    uint64_t v22 = v21;
    v67[2](v67, v21);
  }
  else
  {
    unint64_t v23 = 0;
    __int16 v24 = 0;
    uint64_t v64 = *MEMORY[0x1E4F5CFE8];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    do
    {
      context = (void *)MEMORY[0x1E016D870]();
      dispatch_semaphore_t v25 = dispatch_semaphore_create(0);

      uint64_t v107 = 0;
      v108 = &v107;
      uint64_t v109 = 0x3032000000;
      v110 = __Block_byref_object_copy__133;
      v111 = __Block_byref_object_dispose__133;
      id v112 = 0;
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__133;
      v86 = __Block_byref_object_dispose__133;
      id v87 = 0;
      uint64_t v26 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke_128;
      v78[3] = &unk_1E6B905F0;
      v80 = &v107;
      v81 = &v82;
      __int16 v27 = v25;
      v79 = v27;
      [v26 fetchWorkoutDistancesWithOffset:v23 limit:5000 maxDistanceThreshold:0 includeVisitedRecords:v78 handler:1.79769313e308];

      dsema = v27;
      __int16 v28 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v29 = dispatch_time(0, 3600000000000);
      id v30 = v24;
      if (dispatch_semaphore_wait(dsema, v29))
      {
        unint64_t v31 = [MEMORY[0x1E4F1C9C8] now];
        [v31 timeIntervalSinceDate:v28];
        double v33 = v32;
        id v34 = objc_opt_new();
        id v35 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
        id v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v37 = [v36 filteredArrayUsingPredicate:v35];
        unint64_t v38 = [v37 firstObject];

        [v34 submitToCoreAnalytics:v38 type:1 duration:v33];
        SEL v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        BOOL v40 = (void *)MEMORY[0x1E4F28C58];
        v113[0] = v65;
        *(void *)buf = @"semaphore wait timeout";
        BOOL v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v113 count:1];
        BOOL v42 = [v40 errorWithDomain:v64 code:15 userInfo:v41];

        id v30 = v24;
        if (v42)
        {
          id v30 = v42;
        }
      }

      id v69 = v30;
      id v43 = v69;
      if (v69 || (id v43 = (id)v83[5]) != 0)
      {
        v67[2](v67, v43);
        int v44 = 0;
      }
      else
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id obj = (id)v108[5];
        uint64_t v45 = [obj countByEnumeratingWithState:&v74 objects:v106 count:16];
        if (v45)
        {
          uint64_t v72 = *(void *)v75;
          do
          {
            uint64_t v46 = 0;
            uint64_t v73 = v45;
            do
            {
              if (*(void *)v75 != v72) {
                objc_enumerationMutation(obj);
              }
              v47 = *(void **)(*((void *)&v74 + 1) + 8 * v46);
              __int16 v48 = (void *)MEMORY[0x1E016D870]();
              v49 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                unint64_t v50 = v23;
                uint64_t v51 = [v47 firstWorkout];
                uint64_t v52 = [v47 secondWorkout];
                [v47 distance];
                uint64_t v54 = v53;
                +[RTHealthKitManager stringFromRTHealthKitWorkoutActivityType:](RTHealthKitManager, "stringFromRTHealthKitWorkoutActivityType:", [v47 workoutActivityType]);
                id v55 = (id)objc_claimAutoreleasedReturnValue();
                if ([v47 areBothWorkoutsDecimated]) {
                  v56 = @"YES";
                }
                else {
                  v56 = @"NO";
                }
                v57 = [RTDistanceCalculator distanceMetricToString:[v47 distanceMetric]];
                *(_DWORD *)buf = 138413570;
                *(void *)&uint8_t buf[4] = v51;
                __int16 v96 = 2112;
                v97 = v52;
                __int16 v98 = 2048;
                uint64_t v99 = v54;
                __int16 v100 = 2112;
                id v101 = v55;
                __int16 v102 = 2112;
                v103 = v56;
                __int16 v104 = 2112;
                v105 = v57;
                _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "%@, %@, %.8f, %@, %@, %@", buf, 0x3Eu);

                unint64_t v23 = v50;
              }

              ++v46;
            }
            while (v73 != v46);
            uint64_t v45 = [obj countByEnumeratingWithState:&v74 objects:v106 count:16];
          }
          while (v45);
        }

        v58 = (void *)v108[5];
        v108[5] = 0;

        v23 += 5000;
        int v44 = 1;
      }

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v107, 8);

      if (!v44)
      {
        uint64_t v22 = v69;
        goto LABEL_39;
      }
      if (!v23) {
        break;
      }
      __int16 v24 = v69;
    }
    while (v23 < v92[3]);
    v59 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      uint64_t v60 = v92[3];
      v61 = [MEMORY[0x1E4F1C9C8] date];
      [v61 timeIntervalSinceDate:v63];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v60;
      __int16 v96 = 2048;
      v97 = v62;
      _os_log_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_INFO, "totalWorkoutDistancesCount, %lu, latency, %.4f", buf, 0x16u);
    }
    v67[2](v67, 0);
    uint64_t v22 = v69;
  }
LABEL_39:

  _Block_object_dispose(&v91, 8);
}

intptr_t __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_processWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 handler:(id)a11
{
  BOOL v256 = a7;
  BOOL v257 = a6;
  BOOL v262 = a5;
  BOOL v13 = a4;
  BOOL v14 = a3;
  uint64_t v315 = *MEMORY[0x1E4F143B8];
  id v16 = (void (**)(id, id))a11;
  __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v18);
    id v20 = NSStringFromSelector(a2);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    v296 = v19;
    __int16 v297 = 2112;
    uint64_t v298 = (uint64_t)v20;
    __int16 v299 = 2048;
    uint64_t v300 = v21;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "--------->%@, %@, before autoreleasepool, footprint, %.4f MB<---------", buf, 0x20u);
  }
  uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v250 = v16;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    unint64_t v23 = (objc_class *)objc_opt_class();
    __int16 v24 = NSStringFromClass(v23);
    uint64_t v25 = NSStringFromSelector(a2);
    uint64_t v26 = (void *)v25;
    __int16 v27 = @"NO";
    *(_DWORD *)buf = 138414594;
    v296 = v24;
    __int16 v297 = 2112;
    if (v14) {
      __int16 v28 = @"YES";
    }
    else {
      __int16 v28 = @"NO";
    }
    uint64_t v298 = v25;
    if (v13) {
      *(double *)&dispatch_time_t v29 = COERCE_DOUBLE(@"YES");
    }
    else {
      *(double *)&dispatch_time_t v29 = COERCE_DOUBLE(@"NO");
    }
    __int16 v299 = 2112;
    if (v262) {
      *(double *)&id v30 = COERCE_DOUBLE(@"YES");
    }
    else {
      *(double *)&id v30 = COERCE_DOUBLE(@"NO");
    }
    uint64_t v300 = (uint64_t)v28;
    if (v257) {
      *(double *)&unint64_t v31 = COERCE_DOUBLE(@"YES");
    }
    else {
      *(double *)&unint64_t v31 = COERCE_DOUBLE(@"NO");
    }
    __int16 v301 = 2112;
    if (v256) {
      double v32 = @"YES";
    }
    else {
      double v32 = @"NO";
    }
    double v302 = *(double *)&v29;
    if (a10) {
      __int16 v27 = @"YES";
    }
    __int16 v303 = 2112;
    double v304 = *(double *)&v30;
    __int16 v305 = 2112;
    double v306 = *(double *)&v31;
    __int16 v307 = 2112;
    v308 = v32;
    __int16 v309 = 2048;
    double v310 = a8;
    __int16 v311 = 2048;
    unint64_t v312 = a9;
    __int16 v313 = 2112;
    v314 = v27;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, clearClusters, %@, clearExistingDistanceMatrix, %@, buildDistanceMatrix, %@, syncClustersToHealhtKit, %@, syncClustersToWatch, %@, filteringDistanceThreshold, %.3f, topNWorkouts, %lu, isSchedulerTriggered, %@", buf, 0x66u);

    id v16 = v250;
  }
  unint64_t v259 = a9;

  double v33 = [MEMORY[0x1E4F1C9C8] date];
  context = (void *)MEMORY[0x1E016D870]([(RTWorkoutRouteManager *)self setIsSchedulerTriggered:a10]);
  id v34 = objc_opt_new();
  [(RTWorkoutRouteManager *)self setProcessWorkoutMetrics:v34];

  id v35 = [NSNumber numberWithDouble:a8];
  id v36 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v36 setObject:v35 forKeyedSubscript:@"parameter_filter_size"];

  double v37 = [NSNumber numberWithBool:v14];
  unint64_t v38 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v38 setObject:v37 forKeyedSubscript:@"parameter_clearClusters"];

  SEL v39 = [NSNumber numberWithDouble:a8];
  BOOL v40 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v40 setObject:v39 forKeyedSubscript:@"parameter_distance_threshold"];

  BOOL v41 = [NSNumber numberWithBool:v256];
  BOOL v42 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v42 setObject:v41 forKeyedSubscript:@"parameter_syncClustersToWatch"];

  id v43 = [NSNumber numberWithBool:v262];
  int v44 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v44 setObject:v43 forKeyedSubscript:@"parameter_buildDistanceMatrix"];

  uint64_t v45 = [NSNumber numberWithBool:v257];
  uint64_t v46 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v46 setObject:v45 forKeyedSubscript:@"parameter_syncClustersToHealhtKit"];

  v47 = [NSNumber numberWithBool:v13];
  __int16 v48 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v48 setObject:v47 forKeyedSubscript:@"parameter_clearExistingDistanceMatrix"];

  v49 = [NSNumber numberWithBool:a10];
  unint64_t v50 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v50 setObject:v49 forKeyedSubscript:@"is_scheduler_triggered"];

  v265 = self;
  if (v14)
  {
    uint64_t v51 = [MEMORY[0x1E4F1C9C8] date];

    id v290 = 0;
    BOOL v52 = [(RTWorkoutRouteManager *)self _deleteAllClustersFromHealthKitError:&v290];
    id v53 = v290;
    uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    unint64_t v55 = 0x1E4F1C000uLL;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v56 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v56);
      v58 = NSStringFromSelector(a2);
      if (v52) {
        v59 = @"YES";
      }
      else {
        v59 = @"NO";
      }
      uint64_t v60 = [MEMORY[0x1E4F1C9C8] date];
      [v60 timeIntervalSinceDate:v51];
      double v62 = v61;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413314;
      v296 = v57;
      __int16 v297 = 2112;
      uint64_t v298 = (uint64_t)v58;
      __int16 v299 = 2112;
      uint64_t v300 = (uint64_t)v59;
      self = v265;
      __int16 v301 = 2048;
      double v302 = v62;
      __int16 v303 = 2048;
      double v304 = v63;
      _os_log_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_INFO, "%@, %@, clear clusters in HealthKit, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

      unint64_t v55 = 0x1E4F1C000;
      id v16 = v250;
    }

    if (v16 && v53)
    {
      id v64 = v53;
LABEL_47:
      v16[2](v16, v64);
      long long v77 = 0;
      goto LABEL_48;
    }
    id v289 = v53;
    [(RTWorkoutRouteManager *)self _updateWorkoutDistanceRecordsWithObjectIDs:0 isVisited:0 error:&v289];
    id v64 = v289;

    if (v16 && v64) {
      goto LABEL_47;
    }
  }
  else
  {
    id v64 = 0;
    uint64_t v51 = v33;
    unint64_t v55 = 0x1E4F1C000uLL;
  }
  if (v13)
  {
    uint64_t v65 = [*(id *)(v55 + 2504) date];

    id v288 = v64;
    BOOL v66 = [(RTWorkoutRouteManager *)self _clearDistanceMatrixWithError:&v288];
    id v67 = v288;

    v68 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      id v69 = (objc_class *)objc_opt_class();
      v70 = NSStringFromClass(v69);
      v71 = NSStringFromSelector(a2);
      if (v66) {
        uint64_t v72 = @"YES";
      }
      else {
        uint64_t v72 = @"NO";
      }
      uint64_t v73 = [MEMORY[0x1E4F1C9C8] date];
      [v73 timeIntervalSinceDate:v65];
      double v75 = v74;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413314;
      v296 = v70;
      __int16 v297 = 2112;
      uint64_t v298 = (uint64_t)v71;
      __int16 v299 = 2112;
      uint64_t v300 = (uint64_t)v72;
      self = v265;
      __int16 v301 = 2048;
      double v302 = v75;
      __int16 v303 = 2048;
      double v304 = v76;
      _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "%@, %@, clear distance matrix, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

      unint64_t v55 = 0x1E4F1C000;
    }

    if (v16)
    {
      id v64 = v67;
      uint64_t v51 = v65;
      if (v67) {
        goto LABEL_47;
      }
    }
  }
  else
  {
    uint64_t v65 = v51;
    id v67 = v64;
  }
  id v287 = v67;
  [(RTWorkoutRouteManager *)self _initProcessWorkoutMetrics:&v287];
  id v64 = v287;

  if (v16 && v64)
  {
    uint64_t v51 = v65;
    goto LABEL_47;
  }
  v78 = objc_opt_new();
  if (v262)
  {
    uint64_t v263 = [*(id *)(v55 + 2504) date];

    +[RTRuntime footprint];
    double v80 = v79;
    id v286 = v64;
    v81 = [(RTWorkoutRouteManager *)self _getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold:v259 topN:&v286 error:a8];
    id v82 = v286;

    if (v16 && v82) {
      v16[2](v16, v82);
    }
    long long v284 = 0u;
    long long v285 = 0u;
    long long v282 = 0u;
    long long v283 = 0u;
    v252 = v81;
    v83 = [v81 allValues];
    uint64_t v84 = [v83 countByEnumeratingWithState:&v282 objects:v294 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v283;
      do
      {
        for (uint64_t i = 0; i != v85; ++i)
        {
          if (*(void *)v283 != v86) {
            objc_enumerationMutation(v83);
          }
          uint64_t v88 = *(void *)(*((void *)&v282 + 1) + 8 * i);
          v89 = (void *)MEMORY[0x1E016D870]();
          [v78 addObjectsFromArray:v88];
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v282 objects:v294 count:16];
      }
      while (v85);
    }

    id v281 = v82;
    BOOL v90 = [(RTWorkoutRouteManager *)self _processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:v252 error:&v281];
    id v64 = v281;

    +[RTRuntime footprint];
    double v92 = v91;
    uint64_t v93 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      uint64_t v94 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v94);
      __int16 v96 = NSStringFromSelector(a2);
      if (v90) {
        v97 = @"YES";
      }
      else {
        v97 = @"NO";
      }
      __int16 v98 = [MEMORY[0x1E4F1C9C8] date];
      [v98 timeIntervalSinceDate:v263];
      *(_DWORD *)buf = 138413314;
      v296 = v95;
      __int16 v297 = 2112;
      uint64_t v298 = (uint64_t)v96;
      __int16 v299 = 2112;
      uint64_t v300 = (uint64_t)v97;
      self = v265;
      __int16 v301 = 2048;
      double v302 = v99;
      __int16 v303 = 2048;
      double v304 = v92;
      _os_log_impl(&dword_1D9BFA000, v93, OS_LOG_TYPE_INFO, "%@, %@, process workouts using activity type to workout UUIDs map, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);
    }
    __int16 v100 = [NSNumber numberWithBool:v90];
    id v101 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v101 setObject:v100 forKeyedSubscript:@"distance_matrix_is_success"];

    __int16 v102 = [NSNumber numberWithDouble:v92 - v80];
    v103 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v103 setObject:v102 forKeyedSubscript:@"distance_matrix_footprint_delta"];

    __int16 v104 = NSNumber;
    v105 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v65 = (void *)v263;
    [v105 timeIntervalSinceDate:v263];
    v106 = [v104 numberWithDouble:x0];
    uint64_t v107 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v107 setObject:v106 forKeyedSubscript:@"distance_matrix_time_elapsed"];

    id v16 = v250;
    if (v64)
    {
      v108 = [NSString stringWithFormat:@"%lu", [v64 code]];
      uint64_t v109 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      [v109 setObject:v108 forKeyedSubscript:@"distance_matrix_errorcode"];

      v110 = [v64 domain];
      v111 = [v110 description];
      id v112 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      [v112 setObject:v111 forKeyedSubscript:@"distance_matrix_errordomain"];

      if (v250) {
        v250[2](v250, v64);
      }

      long long v77 = v252;
      uint64_t v51 = (void *)v263;
      goto LABEL_48;
    }
    id v260 = 0;
    unint64_t v55 = 0x1E4F1C000uLL;
    v113 = v252;
  }
  else
  {
    id v260 = v64;
    v113 = 0;
  }
  v114 = 0;
  uint64_t v248 = *MEMORY[0x1E4F5CFE8];
  while (1)
  {
    uint64_t v115 = MEMORY[0x1E016D870]();
    v253 = (void *)v115;
    if (!v257)
    {
      v121 = (void *)v115;
      goto LABEL_106;
    }
    v251 = [*(id *)(v55 + 2504) date];

    +[RTRuntime footprint];
    double v117 = v116;
    v118 = [(RTWorkoutRouteManager *)self workoutActivityTypeToclustersSet];
    uint64_t v119 = [v118 count];

    if (v119)
    {
      id v120 = v260;
    }
    else
    {
      v122 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
      {
        v123 = (objc_class *)objc_opt_class();
        v124 = NSStringFromClass(v123);
        v125 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v296 = v124;
        __int16 v297 = 2112;
        uint64_t v298 = (uint64_t)v125;
        _os_log_impl(&dword_1D9BFA000, v122, OS_LOG_TYPE_INFO, "%@, %@, No clusters in memory. Reading clusters from HealthKit", buf, 0x16u);
      }
      id v280 = v260;
      v126 = [(RTWorkoutRouteManager *)self _readClustersFromHealthKitWithError:&v280];
      id v120 = v280;

      [(RTWorkoutRouteManager *)self setWorkoutActivityTypeToclustersSet:v126];
    }
    id v260 = v120;
    if (!v120)
    {
      id v279 = 0;
      uint64_t v127 = [(RTWorkoutRouteManager *)self _clusterizeWorkoutsWithError:&v279];
      id v260 = v279;

      v114 = (void *)v127;
    }
    v128 = [v114 objectIDs];
    uint64_t v129 = [v128 count];

    if (!v129) {
      break;
    }
    v130 = objc_opt_new();
    long long v275 = 0u;
    long long v276 = 0u;
    long long v277 = 0u;
    long long v278 = 0u;
    v131 = [v114 clusters];
    uint64_t v132 = [v131 countByEnumeratingWithState:&v275 objects:v293 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v276;
      do
      {
        for (uint64_t j = 0; j != v133; ++j)
        {
          if (*(void *)v276 != v134) {
            objc_enumerationMutation(v131);
          }
          uint64_t v136 = *(void *)(*((void *)&v275 + 1) + 8 * j);
          v137 = (void *)MEMORY[0x1E016D870]();
          [v130 addObjectsFromArray:v136];
        }
        uint64_t v133 = [v131 countByEnumeratingWithState:&v275 objects:v293 count:16];
      }
      while (v133);
    }

    self = v265;
    if ([v78 count])
    {
      v138 = [NSNumber numberWithDouble:((double)(unint64_t)objc_msgSend(v130, "count")* 100.0/ (double)(unint64_t)objc_msgSend(v78, "count"))];
      v139 = [(RTWorkoutRouteManager *)v265 processWorkoutMetrics];
      [v139 setObject:v138 forKeyedSubscript:@"clustering_percentage_workouts_clustered"];
    }
    +[RTRuntime footprint];
    double v141 = v140;
    id v142 = v260;
    v143 = [NSNumber numberWithInt:v260 == 0];
    v144 = [(RTWorkoutRouteManager *)v265 processWorkoutMetrics];
    [v144 setObject:v143 forKeyedSubscript:@"clustering_is_success"];

    v145 = [NSNumber numberWithDouble:v141 - v117];
    v146 = [(RTWorkoutRouteManager *)v265 processWorkoutMetrics];
    [v146 setObject:v145 forKeyedSubscript:@"clustering_footprint_delta"];

    v147 = NSNumber;
    unint64_t v55 = 0x1E4F1C000uLL;
    v148 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v65 = v251;
    [v148 timeIntervalSinceDate:v251];
    v149 = [v147 numberWithDouble:];
    v150 = [(RTWorkoutRouteManager *)v265 processWorkoutMetrics];
    [v150 setObject:v149 forKeyedSubscript:@"clustering_time_elapsed"];

    id v16 = v250;
    if (v260)
    {
      v151 = [NSString stringWithFormat:@"%lu", [v260 code]];
      v152 = [(RTWorkoutRouteManager *)v265 processWorkoutMetrics];
      [v152 setObject:v151 forKeyedSubscript:@"clustering_errorcode"];

      v153 = [v260 domain];
      v154 = [v153 description];
      v155 = [(RTWorkoutRouteManager *)v265 processWorkoutMetrics];
      [v155 setObject:v154 forKeyedSubscript:@"clustering_errordomain"];

      v156 = [v260 domain];
      if (![v156 isEqualToString:v248])
      {

        goto LABEL_146;
      }
      uint64_t v157 = [v260 code];

      if (v157 != 15) {
        goto LABEL_146;
      }
    }
    v158 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
    {
      v159 = (objc_class *)objc_opt_class();
      v160 = NSStringFromClass(v159);
      v161 = NSStringFromSelector(a2);
      v162 = [MEMORY[0x1E4F1C9C8] date];
      [v162 timeIntervalSinceDate:v251];
      *(_DWORD *)buf = 138413058;
      v296 = v160;
      __int16 v297 = 2112;
      uint64_t v298 = (uint64_t)v161;
      __int16 v299 = 2048;
      uint64_t v300 = v163;
      __int16 v301 = 2048;
      double v302 = v141;
      _os_log_impl(&dword_1D9BFA000, v158, OS_LOG_TYPE_INFO, "%@, %@, clustering workouts status, done, latency, %.4f, footprint, %.4f MB", buf, 0x2Au);
    }
    uint64_t v65 = [MEMORY[0x1E4F1C9C8] date];

    v164 = [v114 clusters];
    id v274 = v260;
    BOOL v165 = [(RTWorkoutRouteManager *)v265 _syncClustersToHealthKit:v164 error:&v274];
    id v166 = v274;

    v167 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
    {
      v168 = (objc_class *)objc_opt_class();
      v169 = NSStringFromClass(v168);
      v170 = NSStringFromSelector(a2);
      if (v165) {
        v171 = @"YES";
      }
      else {
        v171 = @"NO";
      }
      v172 = [MEMORY[0x1E4F1C9C8] date];
      [v172 timeIntervalSinceDate:v65];
      double v174 = v173;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413314;
      v296 = v169;
      __int16 v297 = 2112;
      uint64_t v298 = (uint64_t)v170;
      __int16 v299 = 2112;
      uint64_t v300 = (uint64_t)v171;
      self = v265;
      __int16 v301 = 2048;
      double v302 = v174;
      __int16 v303 = 2048;
      double v304 = v175;
      _os_log_impl(&dword_1D9BFA000, v167, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to HealthKit, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

      unint64_t v55 = 0x1E4F1C000uLL;
    }

    if (v166)
    {
      id v142 = v166;
      goto LABEL_146;
    }
    v176 = [v114 objectIDs];
    uint64_t v177 = [v176 count];

    if (v177)
    {
      v178 = [v114 objectIDs];
      id v273 = 0;
      [(RTWorkoutRouteManager *)self _updateWorkoutDistanceRecordsWithObjectIDs:v178 isVisited:1 error:&v273];
      id v260 = v273;

      v78 = 0;
    }
    else
    {
      v78 = 0;
      id v260 = 0;
    }
    v121 = v253;
LABEL_106:

    if (!v256)
    {
      v251 = v65;
      goto LABEL_115;
    }
    uint64_t v179 = [*(id *)(v55 + 2504) date];

    uint64_t v65 = (void *)v179;
    +[RTRuntime footprint];
    double v181 = v180;
    id v272 = v260;
    BOOL v182 = [(RTWorkoutRouteManager *)self _syncClustersToWatchWithLimit:100 error:&v272];
    id v183 = v272;

    +[RTRuntime footprint];
    double v185 = v184;
    v186 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
    {
      v187 = (objc_class *)objc_opt_class();
      v188 = NSStringFromClass(v187);
      v189 = NSStringFromSelector(a2);
      if (v182) {
        *(double *)&v190 = COERCE_DOUBLE(@"YES");
      }
      else {
        *(double *)&v190 = COERCE_DOUBLE(@"NO");
      }
      v191 = [*(id *)(v55 + 2504) date];
      [v191 timeIntervalSinceDate:v65];
      *(_DWORD *)buf = 138413570;
      v296 = v188;
      __int16 v297 = 2112;
      uint64_t v298 = (uint64_t)v189;
      __int16 v299 = 2048;
      uint64_t v300 = 100;
      __int16 v301 = 2112;
      double v302 = *(double *)&v190;
      self = v265;
      __int16 v303 = 2048;
      double v304 = v192;
      __int16 v305 = 2048;
      double v306 = v185;
      _os_log_impl(&dword_1D9BFA000, v186, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x3Eu);

      unint64_t v55 = 0x1E4F1C000uLL;
    }

    v193 = [NSNumber numberWithUnsignedInteger:100];
    v194 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v194 setObject:v193 forKeyedSubscript:@"sync_to_watch_count_clusters"];

    v195 = [NSNumber numberWithBool:v182];
    v196 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v196 setObject:v195 forKeyedSubscript:@"sync_to_watch_is_success"];

    v197 = [NSNumber numberWithDouble:v185 - v181];
    v198 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v198 setObject:v197 forKeyedSubscript:@"sync_to_watch_footprint_delta"];

    v199 = NSNumber;
    v200 = [*(id *)(v55 + 2504) date];
    [v200 timeIntervalSinceDate:v65];
    v201 = [v199 numberWithDouble:];
    v202 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v202 setObject:v201 forKeyedSubscript:@"sync_to_watch_time_elapsed"];

    if (v183)
    {
      v238 = [NSString stringWithFormat:@"%lu", [v183 code]];
      v239 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      [v239 setObject:v238 forKeyedSubscript:@"sync_to_watch_errorcode"];

      v240 = [v183 domain];
      v241 = [v240 description];
      v242 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      [v242 setObject:v241 forKeyedSubscript:@"sync_to_watch_errordomain"];

      v113 = 0;
      id v142 = v183;
LABEL_146:
      v236 = context;
      if (v16) {
        v16[2](v16, v142);
      }

      v237 = 0;
      v254 = v113;
      id v225 = v142;
      goto LABEL_149;
    }
    id v260 = 0;
    v251 = v65;
    v121 = v253;
LABEL_115:
    v203 = [v114 objectIDs];
    uint64_t v204 = [v203 count];

    v78 = 0;
    v113 = 0;
    v205 = 0;
    v206 = 0;
    if (!v204) {
      goto LABEL_118;
    }
  }
  v205 = v113;
  v206 = v78;
LABEL_118:
  v258 = v206;
  v254 = v205;

  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  v207 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  v208 = [v207 allKeys];

  uint64_t v209 = [v208 countByEnumeratingWithState:&v268 objects:v292 count:16];
  if (v209)
  {
    uint64_t v210 = v209;
    uint64_t v211 = *(void *)v269;
    do
    {
      for (uint64_t k = 0; k != v210; ++k)
      {
        if (*(void *)v269 != v211) {
          objc_enumerationMutation(v208);
        }
        v213 = *(void **)(*((void *)&v268 + 1) + 8 * k);
        v214 = (void *)MEMORY[0x1E016D870]();
        v215 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v215, OS_LOG_TYPE_INFO))
        {
          v216 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
          v217 = [v216 objectForKeyedSubscript:v213];
          *(_DWORD *)buf = 138412546;
          v296 = v213;
          __int16 v297 = 2112;
          uint64_t v298 = (uint64_t)v217;
          _os_log_impl(&dword_1D9BFA000, v215, OS_LOG_TYPE_INFO, "key, %@, value, %@", buf, 0x16u);

          self = v265;
        }
      }
      uint64_t v210 = [v208 countByEnumeratingWithState:&v268 objects:v292 count:16];
    }
    while (v210);
  }

  v218 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  v219 = self;
  uint64_t v220 = [v218 count];

  if (v220)
  {
    uint64_t v65 = [MEMORY[0x1E4F1C9C8] date];

    v221 = [(RTWorkoutRouteManager *)v219 workoutMetricsManager];
    v222 = [(RTWorkoutRouteManager *)v219 processWorkoutMetrics];
    v291 = v222;
    v223 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v291 count:1];
    id v267 = v260;
    int v224 = [v221 submitMetricsForEvent:3 data:v223 error:&v267];
    id v225 = v267;

    v226 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    id v16 = v250;
    if (os_log_type_enabled(v226, OS_LOG_TYPE_INFO))
    {
      v227 = (objc_class *)objc_opt_class();
      v228 = NSStringFromClass(v227);
      v264 = NSStringFromSelector(a2);
      v229 = +[RTWorkoutMetricsManager stringFromWorkoutMetricsEvent:3];
      v266 = [(RTWorkoutRouteManager *)v219 processWorkoutMetrics];
      *(double *)&uint64_t v230 = COERCE_DOUBLE([v266 count]);
      *(double *)&v231 = COERCE_DOUBLE(@"NO");
      if (v224) {
        *(double *)&v231 = COERCE_DOUBLE(@"YES");
      }
      v261 = v231;
      v232 = [MEMORY[0x1E4F1C9C8] date];
      [v232 timeIntervalSinceDate:v65];
      double v234 = v233;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413826;
      v296 = v228;
      __int16 v297 = 2112;
      uint64_t v298 = (uint64_t)v264;
      __int16 v299 = 2112;
      uint64_t v300 = (uint64_t)v229;
      __int16 v301 = 2048;
      double v302 = *(double *)&v230;
      __int16 v303 = 2112;
      double v304 = *(double *)&v261;
      __int16 v305 = 2048;
      double v306 = v234;
      __int16 v307 = 2048;
      v308 = v235;
      _os_log_impl(&dword_1D9BFA000, v226, OS_LOG_TYPE_INFO, "%@, %@, submitted metrics for event, %@, metrics count, %lu, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x48u);
    }
    [(RTWorkoutRouteManager *)v219 setProcessWorkoutMetrics:0];
    if (v225)
    {
      v236 = context;
      if (v250) {
        v250[2](v250, v225);
      }
      v237 = v258;
LABEL_149:

      id v64 = v225;
      goto LABEL_150;
    }
    id v260 = 0;
  }
  else
  {
    id v16 = v250;
    uint64_t v65 = v251;
  }

  v243 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
  {
    v244 = (objc_class *)objc_opt_class();
    v245 = NSStringFromClass(v244);
    v246 = NSStringFromSelector(a2);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    v296 = v245;
    __int16 v297 = 2112;
    uint64_t v298 = (uint64_t)v246;
    __int16 v299 = 2048;
    uint64_t v300 = v247;
    _os_log_impl(&dword_1D9BFA000, v243, OS_LOG_TYPE_INFO, "--------->%@, %@, after autoreleasepool, footprint, %.4f MB<---------", buf, 0x20u);
  }
  id v64 = v260;
  if (v16) {
    v16[2](v16, v260);
  }
LABEL_150:
  long long v77 = v254;
  uint64_t v51 = v65;
LABEL_48:
}

- (BOOL)_processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:(id)a3 error:(id *)a4
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v129 = a3;
  if (v129)
  {
    uint64_t v152 = 0;
    v153 = &v152;
    uint64_t v154 = 0x3032000000;
    v155 = __Block_byref_object_copy__133;
    v156 = __Block_byref_object_dispose__133;
    id v157 = 0;
    v130 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = (void *)MEMORY[0x1E016D870]();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    id v159 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
    v148[0] = MEMORY[0x1E4F143A8];
    v148[1] = 3221225472;
    v148[2] = __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke;
    v148[3] = &unk_1E6B908E0;
    v150 = buf;
    v151 = &v152;
    uint64_t v7 = v5;
    v149 = v7;
    [v6 fetchTotalWorkoutDistancesCountWithHandler:v148];

    uint64_t v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v10 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v8, v10)) {
      goto LABEL_7;
    }
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v9];
    double v13 = v12;
    BOOL v14 = objc_opt_new();
    __int16 v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
    id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v17 = [v16 filteredArrayUsingPredicate:v15];
    uint64_t v18 = [v17 firstObject];

    [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v169 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v169, 2u);
    }

    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v168 = *MEMORY[0x1E4F28568];
    *(void *)v169 = @"semaphore wait timeout";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:&v168 count:1];
    uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

    if (v22)
    {
      id v23 = v22;
    }
    else
    {
LABEL_7:
      id v23 = 0;
    }

    id v122 = v23;
    __int16 v24 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)&buf[8] + 24)];
    uint64_t v25 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v25 setObject:v24 forKeyedSubscript:@"distance_matrix_initial_size"];

    _Block_object_dispose(buf, 8);
    if (a4 && v122)
    {
      uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v104 = (objc_class *)objc_opt_class();
        NSStringFromClass(v104);
        id v105 = (id)objc_claimAutoreleasedReturnValue();
        v106 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v105;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v106;
        *(_WORD *)&buf[22] = 2112;
        id v159 = v122;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v27 = v122;
      goto LABEL_13;
    }
    if (a4 && v153[5])
    {
      id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v107 = (objc_class *)objc_opt_class();
        NSStringFromClass(v107);
        id v108 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v109 = NSStringFromSelector(a2);
        v110 = (void *)v153[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v108;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v109;
        *(_WORD *)&buf[22] = 2112;
        id v159 = v110;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v27 = (id) v153[5];
      goto LABEL_64;
    }
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    unint64_t v31 = [v129 allKeys];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v144 objects:v167 count:16];
    id obj = v31;
    if (!v32)
    {
      char v127 = 1;
LABEL_59:

      if (!a4 || !v153[5])
      {
        double v80 = (void *)MEMORY[0x1E016D870]();
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        id v159 = 0;
        dispatch_semaphore_t v81 = dispatch_semaphore_create(0);
        id v82 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
        v135[0] = MEMORY[0x1E4F143A8];
        v135[1] = 3221225472;
        v135[2] = __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke_149;
        v135[3] = &unk_1E6B908E0;
        v137 = buf;
        v138 = &v152;
        v83 = v81;
        uint64_t v136 = v83;
        [v82 fetchTotalWorkoutDistancesCountWithHandler:v135];

        uint64_t v84 = v83;
        uint64_t v85 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v86 = dispatch_time(0, 3600000000000);
        id v87 = v122;
        if (dispatch_semaphore_wait(v84, v86))
        {
          uint64_t v88 = [MEMORY[0x1E4F1C9C8] now];
          [v88 timeIntervalSinceDate:v85];
          double v90 = v89;
          double v91 = objc_opt_new();
          double v92 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
          uint64_t v93 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v94 = [v93 filteredArrayUsingPredicate:v92];
          v95 = [v94 firstObject];

          [v91 submitToCoreAnalytics:v95 type:1 duration:v90];
          __int16 v96 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v169 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v169, 2u);
          }

          v97 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v168 = *MEMORY[0x1E4F28568];
          *(void *)v169 = @"semaphore wait timeout";
          __int16 v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:&v168 count:1];
          double v99 = [v97 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v98];

          id v87 = v122;
          if (v99)
          {
            id v87 = v99;
          }
        }

        id v28 = v87;
        __int16 v100 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)&buf[8] + 24)];
        id v101 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v101 setObject:v100 forKeyedSubscript:@"distance_matrix_final_size"];

        _Block_object_dispose(buf, 8);
        if (!a4 || !v28)
        {
          if (!a4 || !v153[5]) {
            goto LABEL_66;
          }
          v103 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            v118 = (objc_class *)objc_opt_class();
            NSStringFromClass(v118);
            id v119 = (id)objc_claimAutoreleasedReturnValue();
            id v120 = NSStringFromSelector(a2);
            v121 = (void *)v153[5];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v119;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v120;
            *(_WORD *)&buf[22] = 2112;
            id v159 = v121;
            _os_log_error_impl(&dword_1D9BFA000, v103, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
          }
          id v27 = (id) v153[5];
LABEL_65:
          char v127 = 0;
          *a4 = v27;
LABEL_66:

          _Block_object_dispose(&v152, 8);
          goto LABEL_67;
        }
        __int16 v102 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          uint64_t v115 = (objc_class *)objc_opt_class();
          NSStringFromClass(v115);
          id v116 = (id)objc_claimAutoreleasedReturnValue();
          double v117 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v116;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v117;
          *(_WORD *)&buf[22] = 2112;
          id v159 = v28;
          _os_log_error_impl(&dword_1D9BFA000, v102, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        id v27 = v28;
LABEL_13:
        id v28 = v27;
        goto LABEL_65;
      }
      v78 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        v111 = (objc_class *)objc_opt_class();
        NSStringFromClass(v111);
        id v112 = (id)objc_claimAutoreleasedReturnValue();
        v113 = NSStringFromSelector(a2);
        v114 = (void *)v153[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v112;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v113;
        *(_WORD *)&buf[22] = 2112;
        id v159 = v114;
        _os_log_error_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v27 = (id) v153[5];
LABEL_64:
      id v28 = v122;
      goto LABEL_65;
    }
    uint64_t v125 = *(void *)v145;
    char v127 = 1;
LABEL_25:
    uint64_t v131 = 0;
    double v33 = v130;
    uint64_t v124 = v32;
    while (1)
    {
      if (*(void *)v145 != v125) {
        objc_enumerationMutation(obj);
      }
      uint64_t v132 = *(void **)(*((void *)&v144 + 1) + 8 * v131);
      context = (void *)MEMORY[0x1E016D870]();
      v130 = [MEMORY[0x1E4F1C9C8] date];

      id v34 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v38 = [v129 objectForKeyedSubscript:v132];
        uint64_t v39 = [v38 count];
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v37;
        *(_WORD *)&buf[22] = 2112;
        id v159 = v132;
        __int16 v160 = 2048;
        uint64_t v161 = v39;
        __int16 v162 = 2048;
        uint64_t v163 = v40;
        _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, %@, activity type, %@, workout UUIDs count, %lu, footprint, %.4f MB", buf, 0x34u);
      }
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v41 = v129;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v140 objects:v166 count:16];
      if (v42)
      {
        id v43 = 0;
        uint64_t v44 = *(void *)v141;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v141 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void *)(*((void *)&v140 + 1) + 8 * i);
            v47 = (void *)MEMORY[0x1E016D870]();
            __int16 v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              id v50 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v51 = NSStringFromSelector(a2);
              ++v43;
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v50;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v51;
              *(_WORD *)&buf[22] = 2048;
              id v159 = v43;
              __int16 v160 = 2112;
              uint64_t v161 = v46;
              _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, %@, %lu, workout UUID: %@", buf, 0x2Au);
            }
            ++v43;
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v140 objects:v166 count:16];
        }
        while (v42);
      }

      BOOL v52 = [v41 objectForKeyedSubscript:v132];
      int64_t v53 = [(RTWorkoutRouteManager *)self distanceMetric];
      uint64_t v54 = (id *)(v153 + 5);
      id v139 = (id)v153[5];
      BOOL v55 = [(RTWorkoutRouteManager *)self _computeAndSaveDistanceMatrixForWorkoutUUIDs:v52 distanceMetric:v53 error:&v139];
      objc_storeStrong(v54, v139);

      uint64_t v56 = v153[5];
      if (v56) {
        goto LABEL_53;
      }
      v57 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        if (v55) {
          double v61 = @"YES";
        }
        else {
          double v61 = @"NO";
        }
        double v62 = [MEMORY[0x1E4F1C9C8] date];
        [v62 timeIntervalSinceDate:v130];
        uint64_t v64 = v63;
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v60;
        *(_WORD *)&buf[22] = 2112;
        id v159 = v132;
        __int16 v160 = 2112;
        uint64_t v161 = (uint64_t)v61;
        __int16 v162 = 2048;
        uint64_t v163 = v64;
        __int16 v164 = 2048;
        uint64_t v165 = v65;
        _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "%@, %@, updating distance matrix for activity type, %@, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x3Eu);
      }
      BOOL v66 = +[RTHealthKitManager stringFromWorkoutActivityType:37];
      int v67 = [v132 isEqualToString:v66];

      if (v67) {
        break;
      }
      uint64_t v72 = +[RTHealthKitManager stringFromWorkoutActivityType:13];
      int v73 = [v132 isEqualToString:v72];

      if (v73)
      {
        double v74 = NSNumber;
        id v69 = [v41 objectForKeyedSubscript:v132];
        v70 = [v74 numberWithUnsignedInteger:[v69 count]];
        v71 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v71 setObject:v70 forKeyedSubscript:@"number_of_workouts_cycling"];
        goto LABEL_51;
      }
      double v75 = +[RTHealthKitManager stringFromWorkoutActivityType:71];
      int v76 = [v132 isEqualToString:v75];

      if (v76)
      {
        long long v77 = NSNumber;
        id v69 = [v41 objectForKeyedSubscript:v132];
        v70 = [v77 numberWithUnsignedInteger:[v69 count]];
        v71 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v71 setObject:v70 forKeyedSubscript:@"number_of_workouts_wheel_chair_run_pace"];
        goto LABEL_51;
      }
LABEL_52:
      [v41 removeObjectForKey:v132];
      v127 &= v55;
LABEL_53:
      if (v56) {
        goto LABEL_59;
      }
      double v33 = v130;
      if (++v131 == v124)
      {
        uint64_t v32 = [obj countByEnumeratingWithState:&v144 objects:v167 count:16];
        if (!v32) {
          goto LABEL_59;
        }
        goto LABEL_25;
      }
    }
    v68 = NSNumber;
    id v69 = [v41 objectForKeyedSubscript:v132];
    v70 = [v68 numberWithUnsignedInteger:[v69 count]];
    v71 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v71 setObject:v70 forKeyedSubscript:@"number_of_workouts_running"];
LABEL_51:

    goto LABEL_52;
  }
  dispatch_time_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: activityTypeToWorkoutUUIDsMap", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"activityTypeToWorkoutUUIDsMap");
    char v127 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v127 = 0;
  }
LABEL_67:

  return v127 & 1;
}

void __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke_149(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_processNewlyAddedWorkout:(id)a3 handler:(id)a4
{
  v521[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (v6)
  {
    aSelector = a2;
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v507 = 2112;
      uint64_t v508 = (uint64_t)v11;
      __int16 v509 = 2112;
      uint64_t v510 = (uint64_t)v6;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, newly added workout uuid, %@", buf, 0x20u);
    }
    uint64_t v473 = 0;
    v474 = &v473;
    uint64_t v475 = 0x3032000000;
    v476 = __Block_byref_object_copy__133;
    v477 = __Block_byref_object_dispose__133;
    id v478 = 0;
    context = (void *)MEMORY[0x1E016D870]();
    v420 = objc_opt_new();
    v419 = [MEMORY[0x1E4F1C9C8] date];
    +[RTRuntime footprint];
    double v13 = v12;
    v421 = [MEMORY[0x1E4F1C9C8] date];
    id v520 = v6;
    BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v520 count:1];
    __int16 v15 = (id *)(v474 + 5);
    id obj = (id)v474[5];
    v422 = [(RTWorkoutRouteManager *)self _getRemoteWorkoutClustersForWorkoutUUIDs:v14 error:&obj];
    objc_storeStrong(v15, obj);

    if (v474[5])
    {
      if (v7) {
        v7[2](v7);
      }
      goto LABEL_35;
    }
    if ([v422 count])
    {
      __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v422 count];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v19;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v20;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v6;
        __int16 v511 = 2048;
        uint64_t v512 = v21;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, existing cluster exists for newly added workout uuid, %@, count, %lu, further processing, skipped", buf, 0x2Au);
      }
      if (v7) {
        ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
      }

      goto LABEL_36;
    }
    uint64_t v466 = 0;
    v467 = &v466;
    uint64_t v468 = 0x3032000000;
    v469 = __Block_byref_object_copy__133;
    v470 = __Block_byref_object_dispose__133;
    id v471 = 0;
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    id v23 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
    v462[0] = MEMORY[0x1E4F143A8];
    v462[1] = 3221225472;
    v462[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke;
    v462[3] = &unk_1E6B905F0;
    v464 = &v466;
    v465 = &v473;
    __int16 v24 = v22;
    v463 = v24;
    [v23 fetchWorkoutDistancesWithWorkout:v6 handler:v462];

    dsema = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v26 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v26)) {
      goto LABEL_21;
    }
    id v27 = [MEMORY[0x1E4F1C9C8] now];
    [v27 timeIntervalSinceDate:v25];
    double v29 = v28;
    id v30 = objc_opt_new();
    unint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
    uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v33 = [v32 filteredArrayUsingPredicate:v31];
    id v34 = [v33 firstObject];

    [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v488 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v488 count:1];
    unint64_t v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

    if (v38)
    {
      id v39 = v38;
    }
    else
    {
LABEL_21:
      id v39 = 0;
    }

    id v40 = v39;
    if (v40)
    {
      id v41 = v40;
      if (v7) {
        ((void (*)(void (**)(void), id))v7[2])(v7, v40);
      }
      goto LABEL_34;
    }
    if (v474[5])
    {
      if (v7) {
        v7[2](v7);
      }
LABEL_33:
      id v41 = 0;
LABEL_34:

      _Block_object_dispose(&v466, 8);
LABEL_35:

LABEL_36:
      _Block_object_dispose(&v473, 8);

      goto LABEL_37;
    }
    if ([(id)v467[5] count])
    {
      uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v46 = [(id)v467[5] count];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v44;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v45;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v6;
        __int16 v511 = 2048;
        uint64_t v512 = v46;
        _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "%@, %@, distance matrix records exists for newly added workout uuid, %@, count, %lu, further processing, skipped", buf, 0x2Au);
      }
      v47 = (void *)v467[5];
      v467[5] = 0;

      if (v7) {
        ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
      }
      goto LABEL_33;
    }
    __int16 v48 = [(RTWorkoutRouteManager *)self healthKitManager];
    id v519 = v6;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v519 count:1];
    id v50 = (id *)(v474 + 5);
    id v461 = (id)v474[5];
    uint64_t v51 = [v48 getWorkoutsWithUUIDs:v49 error:&v461];
    objc_storeStrong(v50, v461);

    if (v474[5])
    {
      if (v7) {
        v7[2](v7);
      }
LABEL_48:
      id v41 = 0;
LABEL_49:

      goto LABEL_34;
    }
    if ([v51 count] != 1)
    {
      uint64_t v56 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v517 = *MEMORY[0x1E4F28568];
      v57 = [NSString stringWithFormat:@"newlyAddedWorkoutUUID cannot be found in healthKit, %lu", [v51 count]];
      v518 = v57;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v518 forKeys:&v517 count:1];
      uint64_t v59 = [v56 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v58];
      id v60 = (void *)v474[5];
      v474[5] = v59;

      if (v7) {
        ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
      }
      goto LABEL_48;
    }
    v415 = [v51 firstObject];

    int64_t v52 = [(RTWorkoutRouteManager *)self distanceMetric];
    BOOL v53 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v415];
    uint64_t v54 = [v415 workoutActivityType];
    BOOL v55 = (id *)(v474 + 5);
    id v460 = (id)v474[5];
    v409 = [(RTWorkoutRouteManager *)self _getConstantValueForDistanceThresholdUsingDistanceMetric:v52 isDecimated:v53 workoutActivityType:v54 error:&v460];
    objc_storeStrong(v55, v460);
    if (v474[5])
    {
      if (v7) {
        v7[2](v7);
      }
      v413 = 0;
      id v41 = 0;
      goto LABEL_163;
    }
    double v61 = [v415 metadata];
    v404 = [v61 valueForKey:*MEMORY[0x1E4F2BB90]];

    if (v404) {
      v408 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v404];
    }
    else {
      v408 = 0;
    }
    double v62 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      uint64_t v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      id v64 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v66 = [MEMORY[0x1E4F1C9C8] date];
      [v66 timeIntervalSinceDate:v421];
      uint64_t v68 = v67;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v64;
      __int16 v507 = 2112;
      uint64_t v508 = (uint64_t)v65;
      __int16 v509 = 2112;
      uint64_t v510 = (uint64_t)v6;
      __int16 v511 = 2112;
      uint64_t v512 = (uint64_t)v408;
      __int16 v513 = 2048;
      uint64_t v514 = v68;
      __int16 v515 = 2048;
      uint64_t v516 = v69;
      _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "%@, %@, workout uuid, %@, reference workout uuid, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);
    }
    if (v408)
    {
      v70 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = (objc_class *)objc_opt_class();
        NSStringFromClass(v71);
        id v72 = (id)objc_claimAutoreleasedReturnValue();
        int v73 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v72;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v73;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v6;
        __int16 v511 = 2112;
        uint64_t v512 = (uint64_t)v408;
        _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_INFO, "%@, %@, case 1/2, matching workout uuid, %@, with its reference workout uuid, %@,", buf, 0x2Au);
      }
      double v74 = [(RTWorkoutRouteManager *)self healthKitManager];
      v505 = v408;
      double v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v505 count:1];
      int v76 = (id *)(v474 + 5);
      id v459 = (id)v474[5];
      v413 = [v74 getWorkoutsWithUUIDs:v75 error:&v459];
      objc_storeStrong(v76, v459);

      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
        id v41 = 0;
        goto LABEL_162;
      }
      v410 = [v413 firstObject];

      uint64_t v103 = [v410 workoutActivityType];
      if (v103 != [v415 workoutActivityType])
      {
        id v108 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v503 = *MEMORY[0x1E4F28568];
        uint64_t v109 = NSString;
        v110 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v410 workoutActivityType]);
        v111 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v415 workoutActivityType]);
        id v112 = [v109 stringWithFormat:@"mismatched workout activity types, refrence workout UUID, %@, reference workout activity type, %@, refrence workout UUID, %@, newly added workout activity type, %@, ", v408, v110, v6, v111];
        v504 = v112;
        v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v504 forKeys:&v503 count:1];
        uint64_t v114 = [v108 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v113];
        uint64_t v115 = (void *)v474[5];
        v474[5] = v114;

        if (v7) {
          ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
        }
        id v41 = 0;
        goto LABEL_131;
      }
      v502 = v408;
      __int16 v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v502 count:1];
      id v105 = (id *)(v474 + 5);
      id v458 = (id)v474[5];
      v106 = [(RTWorkoutRouteManager *)self _getRemoteWorkoutClustersForWorkoutUUIDs:v104 error:&v458];
      objc_storeStrong(v105, v458);

      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
LABEL_129:
        id v41 = 0;
LABEL_130:

LABEL_131:
        v413 = 0;
LABEL_162:

LABEL_163:
        uint64_t v51 = v413;
        goto LABEL_49;
      }
      long long v140 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
      {
        long long v141 = (objc_class *)objc_opt_class();
        NSStringFromClass(v141);
        id v142 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v143 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v144 = [v106 count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v142;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v143;
        __int16 v509 = 2048;
        uint64_t v510 = v144;
        _os_log_impl(&dword_1D9BFA000, v140, OS_LOG_TYPE_INFO, "%@, %@, reference clusters count, %lu", buf, 0x20u);
      }
      if ([v106 count] != 1)
      {
        id v157 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v500 = *MEMORY[0x1E4F28568];
        v158 = [NSString stringWithFormat:@"reference cluster count is invalid, %lu, should be 1", [v106 count]];
        v501 = v158;
        id v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v501 forKeys:&v500 count:1];
        uint64_t v160 = [v157 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v159];
        uint64_t v161 = (void *)v474[5];
        v474[5] = v160;

        if (v7) {
          ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
        }
        goto LABEL_129;
      }
      uint64_t v145 = MEMORY[0x1E4F1CC38];
      [v420 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"does_reference_route_exist"];
      long long v146 = [v106 firstObject];
      long long v147 = [v146 bestWorkoutUUID];
      int v148 = [v147 isEqual:v408];

      uint64_t v149 = MEMORY[0x1E4F1CC28];
      if (v148) {
        uint64_t v150 = v145;
      }
      else {
        uint64_t v150 = MEMORY[0x1E4F1CC28];
      }
      [v420 setObject:v150 forKeyedSubscript:@"is_reference_route_best_route"];
      v151 = [v106 firstObject];
      uint64_t v152 = [v151 lastWorkoutUUID];
      int v153 = [v152 isEqual:v408];

      if (v153) {
        uint64_t v154 = v145;
      }
      else {
        uint64_t v154 = v149;
      }
      [v420 setObject:v154 forKeyedSubscript:@"is_reference_route_last_route"];
      v155 = [v106 firstObject];
      v156 = (id *)(v474 + 5);
      id v457 = (id)v474[5];
      v414 = [(RTWorkoutRouteManager *)self _getWorkoutUUIDsForCluster:v155 error:&v457];
      objc_storeStrong(v156, v457);

      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
LABEL_147:
        id v41 = 0;
LABEL_148:

        goto LABEL_130;
      }
      double v174 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
      {
        double v175 = (objc_class *)objc_opt_class();
        NSStringFromClass(v175);
        id v176 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v177 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v178 = [v414 count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v176;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v177;
        __int16 v509 = 2048;
        uint64_t v510 = v178;
        _os_log_impl(&dword_1D9BFA000, v174, OS_LOG_TYPE_INFO, "%@, %@, reference cluster workout UUIDs count, %lu", buf, 0x20u);
      }
      if ((unint64_t)[v414 count] <= 1)
      {
        uint64_t v179 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v498 = *MEMORY[0x1E4F28568];
        double v180 = NSString;
        double v181 = [v106 firstObject];
        BOOL v182 = [v181 clusterUUID];
        id v183 = [v180 stringWithFormat:@"reference clusters with cluster uuid, %@, has %lu reference workout uuid, less than threshold, %lu", v182, [v414 count], 2];
        v499 = v183;
        double v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v499 forKeys:&v498 count:1];
        uint64_t v185 = [v179 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v184];
        v186 = (void *)v474[5];
        v474[5] = v185;

        if (v7) {
          ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
        }
        goto LABEL_147;
      }

      v187 = objc_opt_new();
      [v187 addObjectsFromArray:v414];
      v188 = [v415 UUID];
      [v187 addObject:v188];

      v189 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
      {
        v190 = (objc_class *)objc_opt_class();
        NSStringFromClass(v190);
        id v191 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v192 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v193 = [v187 count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v191;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v192;
        __int16 v509 = 2048;
        uint64_t v510 = v193;
        _os_log_impl(&dword_1D9BFA000, v189, OS_LOG_TYPE_INFO, "%@, %@, workout UUIDs for processing count, %lu", buf, 0x20u);
      }
      v194 = (id *)(v474 + 5);
      id v456 = (id)v474[5];
      v406 = [(RTWorkoutRouteManager *)self _sortWorkoutUUIDsByDistance:v187 error:&v456];
      objc_storeStrong(v194, v456);
      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
        goto LABEL_228;
      }

      v199 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v415 workoutActivityType]);
      v496 = v199;
      v497 = v406;
      v200 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v497 forKeys:&v496 count:1];
      v201 = (void *)[v200 mutableCopy];
      v202 = (id *)(v474 + 5);
      id v455 = (id)v474[5];
      [(RTWorkoutRouteManager *)self _processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:v201 error:&v455];
      objc_storeStrong(v202, v455);

      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
LABEL_227:
        v187 = 0;
LABEL_228:
        id v41 = 0;
LABEL_229:

        v106 = 0;
        goto LABEL_148;
      }
      v229 = [MEMORY[0x1E4F1CA80] setWithObject:v408];
      uint64_t v230 = (void *)MEMORY[0x1E4F1CA80];
      v231 = [v415 UUID];
      v232 = [v230 setWithObject:v231];
      int64_t v233 = +[RTHealthKitManager RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:](RTHealthKitManager, "RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:", [v415 workoutActivityType]);
      [v409 doubleValue];
      double v234 = (id *)(v474 + 5);
      id v454 = (id)v474[5];
      BOOL v235 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](self, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v229, v232, v233, &v454);
      objc_storeStrong(v234, v454);

      v236 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v236, OS_LOG_TYPE_INFO))
      {
        v237 = (objc_class *)objc_opt_class();
        NSStringFromClass(v237);
        id v238 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v239 = NSStringFromSelector(aSelector);
        v240 = (void *)v239;
        v241 = @"NO";
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v238;
        __int16 v507 = 2112;
        if (v235) {
          v241 = @"YES";
        }
        uint64_t v508 = v239;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v241;
        _os_log_impl(&dword_1D9BFA000, v236, OS_LOG_TYPE_INFO, "%@, %@, isNewlyAddedWorkoutSimilarToReferenceWorkout, %@", buf, 0x20u);
      }
      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
        goto LABEL_227;
      }
      id v287 = [MEMORY[0x1E4F1CA80] setWithArray:v414];
      id v288 = (void *)MEMORY[0x1E4F1CA80];
      id v289 = [v415 UUID];
      id v290 = [v288 setWithObject:v289];
      int64_t v291 = +[RTHealthKitManager RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:](RTHealthKitManager, "RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:", [v415 workoutActivityType]);
      [v409 doubleValue];
      v292 = (id *)(v474 + 5);
      id v453 = (id)v474[5];
      BOOL v293 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](self, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v287, v290, v291, &v453);
      objc_storeStrong(v292, v453);

      v294 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v294, OS_LOG_TYPE_INFO))
      {
        v295 = (objc_class *)objc_opt_class();
        NSStringFromClass(v295);
        id v296 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v297 = NSStringFromSelector(aSelector);
        uint64_t v298 = (void *)v297;
        __int16 v299 = @"NO";
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v296;
        __int16 v507 = 2112;
        if (v293) {
          __int16 v299 = @"YES";
        }
        uint64_t v508 = v297;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v299;
        _os_log_impl(&dword_1D9BFA000, v294, OS_LOG_TYPE_INFO, "%@, %@, isNewlyAddedWorkoutSimilarToReferenceWorkoutAndItsCluster, %@", buf, 0x20u);
      }
      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
        goto LABEL_227;
      }

      double v302 = [NSNumber numberWithBool:v235];
      [v420 setObject:v302 forKeyedSubscript:@"is_new_workout_similar_to_reference_route"];

      __int16 v303 = [NSNumber numberWithBool:v293];
      [v420 setObject:v303 forKeyedSubscript:@"is_new_workout_clustered_reference_route"];

      if (v293)
      {
        double v304 = [MEMORY[0x1E4F1C9C8] date];

        v495 = v406;
        __int16 v305 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v495 count:1];
        double v306 = (id *)(v474 + 5);
        id v452 = (id)v474[5];
        BOOL v307 = [(RTWorkoutRouteManager *)self _syncClustersToHealthKit:v305 error:&v452];
        objc_storeStrong(v306, v452);

        if (v474[5])
        {
          if (v7) {
            v7[2](v7);
          }
          v187 = 0;
          v414 = 0;
          id v41 = 0;
          v421 = v304;
          goto LABEL_229;
        }
        v345 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v345, OS_LOG_TYPE_INFO))
        {
          v346 = (objc_class *)objc_opt_class();
          NSStringFromClass(v346);
          id v347 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          id v348 = (id)objc_claimAutoreleasedReturnValue();
          if (v307) {
            v349 = @"YES";
          }
          else {
            v349 = @"NO";
          }
          v350 = [MEMORY[0x1E4F1C9C8] date];
          [v350 timeIntervalSinceDate:v304];
          uint64_t v352 = v351;
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v347;
          __int16 v507 = 2112;
          uint64_t v508 = (uint64_t)v348;
          __int16 v509 = 2112;
          uint64_t v510 = (uint64_t)v349;
          __int16 v511 = 2048;
          uint64_t v512 = v352;
          __int16 v513 = 2048;
          uint64_t v514 = v353;
          _os_log_impl(&dword_1D9BFA000, v345, OS_LOG_TYPE_INFO, "%@, %@, syncing clusters to HealthKit status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
        }
        v421 = [MEMORY[0x1E4F1C9C8] date];

        dispatch_semaphore_t v354 = dispatch_semaphore_create(0);
        v449[0] = MEMORY[0x1E4F143A8];
        v449[1] = 3221225472;
        v449[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_169;
        v449[3] = &unk_1E6B90728;
        v451 = &v473;
        v355 = v354;
        v450 = v355;
        [(RTWorkoutRouteManager *)self _updateRelevanceScoresWithHandler:v449];
        dsema = v355;
        v356 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v357 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(dsema, v357)) {
          goto LABEL_269;
        }
        v358 = [MEMORY[0x1E4F1C9C8] now];
        [v358 timeIntervalSinceDate:v356];
        double v360 = v359;
        v361 = objc_opt_new();
        v362 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
        v363 = [MEMORY[0x1E4F29060] callStackSymbols];
        v364 = [v363 filteredArrayUsingPredicate:v362];
        v365 = [v364 firstObject];

        [v361 submitToCoreAnalytics:v365 type:1 duration:v360];
        v366 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v366, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v366, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v367 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v488 = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        v368 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v488 count:1];
        v369 = [v367 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v368];

        if (v369)
        {
          id v370 = v369;
        }
        else
        {
LABEL_269:
          id v370 = 0;
        }

        id v371 = v370;
        id v41 = v371;
        if (v371)
        {
          uint64_t v372 = (uint64_t)v371;
LABEL_273:
          if (v7) {
            ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v372);
          }

          v187 = 0;
          v414 = 0;
          goto LABEL_229;
        }
        uint64_t v372 = v474[5];
        if (v372) {
          goto LABEL_273;
        }
        v378 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v378, OS_LOG_TYPE_INFO))
        {
          v379 = (objc_class *)objc_opt_class();
          NSStringFromClass(v379);
          id v380 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          id v381 = (id)objc_claimAutoreleasedReturnValue();
          v382 = [MEMORY[0x1E4F1C9C8] date];
          [v382 timeIntervalSinceDate:v421];
          uint64_t v384 = v383;
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v380;
          __int16 v507 = 2112;
          uint64_t v508 = (uint64_t)v381;
          __int16 v509 = 2048;
          uint64_t v510 = v384;
          __int16 v511 = 2048;
          uint64_t v512 = v385;
          _os_log_impl(&dword_1D9BFA000, v378, OS_LOG_TYPE_INFO, "%@, %@, updateing relevance scores, status, done, latency, %.4f sec, footprint, %.4f MB", buf, 0x2Au);
        }
        uint64_t v308 = [MEMORY[0x1E4F1C9C8] date];

        v386 = (id *)(v474 + 5);
        id v448 = (id)v474[5];
        BOOL v387 = [(RTWorkoutRouteManager *)self _syncClustersToWatchWithLimit:100 error:&v448];
        objc_storeStrong(v386, v448);
        v388 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v388, OS_LOG_TYPE_INFO))
        {
          v389 = (objc_class *)objc_opt_class();
          NSStringFromClass(v389);
          id v390 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          id v391 = (id)objc_claimAutoreleasedReturnValue();
          if (v387) {
            v392 = @"YES";
          }
          else {
            v392 = @"NO";
          }
          v393 = [MEMORY[0x1E4F1C9C8] date];
          [v393 timeIntervalSinceDate:v308];
          uint64_t v395 = v394;
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = v390;
          __int16 v507 = 2112;
          uint64_t v508 = (uint64_t)v391;
          __int16 v509 = 2048;
          uint64_t v510 = 100;
          __int16 v511 = 2112;
          uint64_t v512 = (uint64_t)v392;
          __int16 v513 = 2048;
          uint64_t v514 = v395;
          __int16 v515 = 2048;
          uint64_t v516 = v396;
          _os_log_impl(&dword_1D9BFA000, v388, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);
        }
      }
      else
      {
        uint64_t v308 = (uint64_t)v421;
      }
      __int16 v309 = NSNumber;
      +[RTRuntime footprint];
      __int16 v311 = [v309 numberWithDouble:v310 - v13];
      [v420 setObject:v311 forKeyedSubscript:@"footprint_delta"];

      unint64_t v312 = NSNumber;
      __int16 v313 = [MEMORY[0x1E4F1C9C8] date];
      [v313 timeIntervalSinceDate:v419];
      v314 = [v312 numberWithDouble:x0];
      [v420 setObject:v314 forKeyedSubscript:@"time_elapsed_reference_route_cluster_check"];

      uint64_t v315 = [(RTWorkoutRouteManager *)self workoutMetricsManager];
      v494 = v420;
      v316 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v494 count:1];
      v317 = (id *)(v474 + 5);
      id v447 = (id)v474[5];
      int v318 = [v315 submitMetricsForEvent:2 data:v316 error:&v447];
      objc_storeStrong(v317, v447);

      v319 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v319, OS_LOG_TYPE_ERROR))
      {
        v373 = (objc_class *)objc_opt_class();
        NSStringFromClass(v373);
        id v374 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v375 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v376 = [v420 count];
        v377 = @"NO";
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v374;
        __int16 v507 = 2112;
        if (v318) {
          v377 = @"YES";
        }
        uint64_t v508 = (uint64_t)v375;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v377;
        __int16 v511 = 2048;
        uint64_t v512 = v376;
        _os_log_error_impl(&dword_1D9BFA000, v319, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);
      }
      if (v7) {
        ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
      }
      v187 = 0;
      v414 = 0;
      id v41 = 0;
      v420 = 0;
      v421 = (void *)v308;
      goto LABEL_229;
    }
    long long v77 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      v78 = (objc_class *)objc_opt_class();
      NSStringFromClass(v78);
      id v79 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v80 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v79;
      __int16 v507 = 2112;
      uint64_t v508 = (uint64_t)v80;
      __int16 v509 = 2112;
      uint64_t v510 = (uint64_t)v6;
      _os_log_impl(&dword_1D9BFA000, v77, OS_LOG_TYPE_INFO, "%@, %@, case  2/2, reference workout UUID does not exist. Finding the next best cluster for workout uuid, %@", buf, 0x20u);
    }
    uint64_t v488 = 0;
    v489 = &v488;
    uint64_t v490 = 0x3032000000;
    v491 = __Block_byref_object_copy__133;
    v492 = __Block_byref_object_dispose__133;
    id v493 = [MEMORY[0x1E4F1C978] array];
    dispatch_semaphore_t v81 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      id v82 = (objc_class *)objc_opt_class();
      NSStringFromClass(v82);
      id v83 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v84 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v83;
      __int16 v507 = 2112;
      uint64_t v508 = (uint64_t)v84;
      _os_log_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_INFO, "%@, %@, fetching all clusters", buf, 0x16u);
    }
    dispatch_semaphore_t v85 = dispatch_semaphore_create(0);

    dispatch_time_t v86 = [(RTWorkoutRouteManager *)self healthKitManager];
    v443[0] = MEMORY[0x1E4F143A8];
    v443[1] = 3221225472;
    v443[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_170;
    v443[3] = &unk_1E6B905F0;
    v445 = &v488;
    v446 = &v473;
    id v87 = v85;
    v444 = v87;
    [v86 fetchWorkoutClustersWithHandler:v443];

    dsema = v87;
    uint64_t v88 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v89 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v89)) {
      goto LABEL_75;
    }
    double v90 = [MEMORY[0x1E4F1C9C8] now];
    [v90 timeIntervalSinceDate:v88];
    double v92 = v91;
    uint64_t v93 = objc_opt_new();
    uint64_t v94 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
    v95 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v96 = [v95 filteredArrayUsingPredicate:v94];
    v97 = [v96 firstObject];

    [v93 submitToCoreAnalytics:v97 type:1 duration:v92];
    __int16 v98 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v98, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    double v99 = (void *)MEMORY[0x1E4F28C58];
    v521[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    __int16 v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v521 count:1];
    id v101 = [v99 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v100];

    if (v101)
    {
      id v102 = v101;
    }
    else
    {
LABEL_75:
      id v102 = 0;
    }

    id v107 = v102;
    if (v107)
    {
      id v41 = v107;
      if (v7) {
        ((void (*)(void (**)(void), id))v7[2])(v7, v107);
      }
      v413 = 0;
      goto LABEL_161;
    }
    if (v474[5])
    {
      if (v7) {
        v7[2](v7);
      }
      v413 = 0;
      id v41 = 0;
      goto LABEL_161;
    }
    id v116 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      double v117 = (objc_class *)objc_opt_class();
      NSStringFromClass(v117);
      id v118 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v119 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v120 = [(id)v489[5] count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v118;
      __int16 v507 = 2112;
      uint64_t v508 = (uint64_t)v119;
      __int16 v509 = 2048;
      uint64_t v510 = v120;
      _os_log_impl(&dword_1D9BFA000, v116, OS_LOG_TYPE_INFO, "%@, %@, all clusters count, %lu", buf, 0x20u);
    }
    v398 = objc_opt_new();
    v397 = objc_opt_new();
    long long v441 = 0u;
    long long v442 = 0u;
    long long v439 = 0u;
    long long v440 = 0u;
    id v401 = (id)v489[5];
    uint64_t v402 = [v401 countByEnumeratingWithState:&v439 objects:v487 count:16];
    if (v402)
    {
      v413 = 0;
      uint64_t v121 = *(void *)v440;
LABEL_91:
      uint64_t v122 = 0;
      while (1)
      {
        if (*(void *)v440 != v121) {
          objc_enumerationMutation(v401);
        }
        v123 = *(void **)(*((void *)&v439 + 1) + 8 * v122);
        v405 = (void *)MEMORY[0x1E016D870]();
        uint64_t v124 = (id *)(v474 + 5);
        id v438 = (id)v474[5];
        v411 = [(RTWorkoutRouteManager *)self _getWorkoutUUIDsForCluster:v123 error:&v438];
        objc_storeStrong(v124, v438);
        if (v474[5])
        {
          if (v7) {
            v7[2](v7);
          }
          int v125 = 1;
        }
        else
        {
          v126 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
          {
            char v127 = (objc_class *)objc_opt_class();
            NSStringFromClass(v127);
            id v128 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            id v129 = (id)objc_claimAutoreleasedReturnValue();
            v130 = [v123 clusterUUID];
            uint64_t v131 = [v411 count];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v128;
            __int16 v507 = 2112;
            uint64_t v508 = (uint64_t)v129;
            __int16 v509 = 2112;
            uint64_t v510 = (uint64_t)v130;
            __int16 v511 = 2048;
            uint64_t v512 = v131;
            _os_log_impl(&dword_1D9BFA000, v126, OS_LOG_TYPE_INFO, "%@, %@, cluster with cluster uuid, %@, count of workouts in the cluster, %lu", buf, 0x2Au);
          }
          if ([v411 count])
          {
            uint64_t v132 = [(RTWorkoutRouteManager *)self healthKitManager];
            uint64_t v133 = [v411 firstObject];
            v486 = v133;
            uint64_t v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v486 count:1];
            v135 = (id *)(v474 + 5);
            id v437 = (id)v474[5];
            uint64_t v136 = [v132 getWorkoutsWithUUIDs:v134 error:&v437];
            objc_storeStrong(v135, v437);

            if (v474[5])
            {
              if (v7) {
                v7[2](v7);
              }
              int v125 = 1;
            }
            else
            {
              v137 = [v136 firstObject];
              uint64_t v138 = [v137 workoutActivityType];
              LODWORD(v138) = v138 == [v415 workoutActivityType];

              if (v138)
              {
                [v398 addObjectsFromArray:v411];
                id v139 = [v123 clusterUUID];
                [v397 setObject:v411 forKeyedSubscript:v139];
              }
              int v125 = 0;
            }
            v413 = v136;
          }
          else
          {
            int v125 = 7;
          }
        }

        if (v125 != 7)
        {
          if (v125) {
            goto LABEL_158;
          }
        }
        if (v402 == ++v122)
        {
          uint64_t v402 = [v401 countByEnumeratingWithState:&v439 objects:v487 count:16];
          if (v402) {
            goto LABEL_91;
          }
          goto LABEL_133;
        }
      }
    }
    v413 = 0;
LABEL_133:

    if ((unint64_t)[v398 count] <= 1)
    {
      __int16 v162 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v484 = *MEMORY[0x1E4F28568];
      uint64_t v163 = [NSString stringWithFormat:@"workout uuids from cluster, %lu, is less than threshold, %lu", [v398 count], 2];
      v485 = v163;
      __int16 v164 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v485 forKeys:&v484 count:1];
      uint64_t v165 = [v162 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v164];
      id v166 = (void *)v474[5];
      v474[5] = v165;

      if (v7) {
        ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
      }
      id v41 = 0;
      goto LABEL_160;
    }
    v167 = [v415 UUID];
    [v398 addObject:v167];

    uint64_t v168 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
    {
      v169 = (objc_class *)objc_opt_class();
      NSStringFromClass(v169);
      id v170 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v171 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v172 = [v398 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v170;
      __int16 v507 = 2112;
      uint64_t v508 = (uint64_t)v171;
      __int16 v509 = 2048;
      uint64_t v510 = v172;
      _os_log_impl(&dword_1D9BFA000, v168, OS_LOG_TYPE_INFO, "%@, %@, processing workout UUIDs from clusters plus newlyAddedWorkout count, %lu", buf, 0x20u);
    }
    double v173 = (id *)(v474 + 5);
    id v436 = (id)v474[5];
    id v401 = [(RTWorkoutRouteManager *)self _sortWorkoutUUIDsByDistance:v398 error:&v436];
    objc_storeStrong(v173, v436);
    if (v474[5])
    {
      if (v7) {
        v7[2](v7);
      }
LABEL_158:
      id v41 = 0;
LABEL_159:

LABEL_160:
LABEL_161:

      _Block_object_dispose(&v488, 8);
      goto LABEL_162;
    }

    v195 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v415 workoutActivityType]);
    v482 = v195;
    id v483 = v401;
    v196 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v483 forKeys:&v482 count:1];
    v197 = (void *)[v196 mutableCopy];
    v198 = (id *)(v474 + 5);
    id v435 = (id)v474[5];
    [(RTWorkoutRouteManager *)self _processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:v197 error:&v435];
    objc_storeStrong(v198, v435);

    if (v474[5])
    {
      if (v7) {
        v7[2](v7);
      }
      v398 = 0;
      goto LABEL_158;
    }
    v203 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
    {
      uint64_t v204 = (objc_class *)objc_opt_class();
      NSStringFromClass(v204);
      id v205 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v206 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v205;
      __int16 v507 = 2112;
      uint64_t v508 = (uint64_t)v206;
      _os_log_impl(&dword_1D9BFA000, v203, OS_LOG_TYPE_INFO, "%@, %@, checking similarity", buf, 0x16u);
    }
    v399 = objc_opt_new();
    long long v433 = 0u;
    long long v434 = 0u;
    long long v431 = 0u;
    long long v432 = 0u;
    id v400 = [v397 allValues];
    v407 = (void *)[v400 countByEnumeratingWithState:&v431 objects:v481 count:16];
    if (v407)
    {
      uint64_t v403 = *(void *)v432;
LABEL_171:
      uint64_t v207 = 0;
      while (1)
      {
        if (*(void *)v432 != v403) {
          objc_enumerationMutation(v400);
        }
        uint64_t v208 = *(void *)(*((void *)&v431 + 1) + 8 * v207);
        v412 = (void *)MEMORY[0x1E016D870]();
        uint64_t v209 = [MEMORY[0x1E4F1CA80] setWithArray:v208];
        uint64_t v210 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v211 = [v415 UUID];
        v212 = [v210 setWithObject:v211];
        int64_t v213 = +[RTHealthKitManager RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:](RTHealthKitManager, "RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:", [v415 workoutActivityType]);
        [v409 doubleValue];
        v214 = (id *)(v474 + 5);
        id v430 = (id)v474[5];
        BOOL v215 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](self, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v209, v212, v213, &v430);
        objc_storeStrong(v214, v430);

        if (v474[5])
        {
          if (v7) {
            v7[2](v7);
          }
          int v216 = 0;
          int v217 = 1;
        }
        else
        {
          v218 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
          {
            v219 = (objc_class *)objc_opt_class();
            NSStringFromClass(v219);
            id v220 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            id v221 = (id)objc_claimAutoreleasedReturnValue();
            v222 = v221;
            *(_DWORD *)buf = 138412802;
            v223 = @"NO";
            if (v215) {
              v223 = @"YES";
            }
            *(void *)&uint8_t buf[4] = v220;
            __int16 v507 = 2112;
            uint64_t v508 = (uint64_t)v221;
            __int16 v509 = 2112;
            uint64_t v510 = (uint64_t)v223;
            _os_log_impl(&dword_1D9BFA000, v218, OS_LOG_TYPE_INFO, "%@, %@, isNewlyAddedWorkoutSimilarToCluster,  %@", buf, 0x20u);
          }
          if (v215)
          {
            int v224 = [MEMORY[0x1E4F1CA48] arrayWithArray:v208];

            [v224 addObject:v6];
            int v216 = 0;
            int v217 = 8;
            v399 = v224;
          }
          else
          {
            int v217 = 0;
            int v216 = 1;
          }
        }
        if (!v216) {
          break;
        }
        if (v407 == (void *)++v207)
        {
          v407 = (void *)[v400 countByEnumeratingWithState:&v431 objects:v481 count:16];
          if (v407) {
            goto LABEL_171;
          }
          goto LABEL_188;
        }
      }

      if ((v217 | 8) == 8) {
        goto LABEL_190;
      }
      id v41 = 0;
      goto LABEL_237;
    }
LABEL_188:

LABEL_190:
    if ([v399 count])
    {
      id v225 = [MEMORY[0x1E4F1C9C8] date];

      v480 = v399;
      v226 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v480 count:1];
      v227 = (id *)(v474 + 5);
      id v429 = (id)v474[5];
      BOOL v228 = [(RTWorkoutRouteManager *)self _syncClustersToHealthKit:v226 error:&v429];
      objc_storeStrong(v227, v429);

      if (v474[5])
      {
        if (v7) {
          v7[2](v7);
        }
        id v41 = 0;
        v421 = v225;
LABEL_237:

        v398 = 0;
        goto LABEL_159;
      }

      v261 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v261, OS_LOG_TYPE_INFO))
      {
        BOOL v262 = (objc_class *)objc_opt_class();
        NSStringFromClass(v262);
        id v263 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v264 = (id)objc_claimAutoreleasedReturnValue();
        if (v228) {
          v265 = @"YES";
        }
        else {
          v265 = @"NO";
        }
        v266 = [MEMORY[0x1E4F1C9C8] date];
        [v266 timeIntervalSinceDate:v225];
        uint64_t v268 = v267;
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v263;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v264;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v265;
        __int16 v511 = 2048;
        uint64_t v512 = v268;
        __int16 v513 = 2048;
        uint64_t v514 = v269;
        _os_log_impl(&dword_1D9BFA000, v261, OS_LOG_TYPE_INFO, "%@, %@, syncing clusters to HealthKit status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
      }
      v421 = [MEMORY[0x1E4F1C9C8] date];

      dispatch_semaphore_t v270 = dispatch_semaphore_create(0);
      v426[0] = MEMORY[0x1E4F143A8];
      v426[1] = 3221225472;
      v426[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_174;
      v426[3] = &unk_1E6B90728;
      v428 = &v473;
      long long v271 = v270;
      v427 = v271;
      [(RTWorkoutRouteManager *)self _updateRelevanceScoresWithHandler:v426];
      dsema = v271;
      id v272 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v273 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v273)) {
        goto LABEL_230;
      }
      id v274 = [MEMORY[0x1E4F1C9C8] now];
      [v274 timeIntervalSinceDate:v272];
      double v276 = v275;
      long long v277 = objc_opt_new();
      long long v278 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      id v279 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v280 = [v279 filteredArrayUsingPredicate:v278];
      id v281 = [v280 firstObject];

      [v277 submitToCoreAnalytics:v281 type:1 duration:v276];
      long long v282 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v282, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v282, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      long long v283 = (void *)MEMORY[0x1E4F28C58];
      v521[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      long long v284 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v521 count:1];
      long long v285 = [v283 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v284];

      if (v285)
      {
        id v286 = v285;
      }
      else
      {
LABEL_230:
        id v286 = 0;
      }

      id v300 = v286;
      id v41 = v300;
      if (v300)
      {
        uint64_t v301 = (uint64_t)v300;
LABEL_234:
        if (v7) {
          ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v301);
        }

        v399 = 0;
        goto LABEL_237;
      }
      uint64_t v301 = v474[5];
      if (v301) {
        goto LABEL_234;
      }
      v320 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v320, OS_LOG_TYPE_INFO))
      {
        v321 = (objc_class *)objc_opt_class();
        NSStringFromClass(v321);
        id v322 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v323 = (id)objc_claimAutoreleasedReturnValue();
        v324 = [MEMORY[0x1E4F1C9C8] date];
        [v324 timeIntervalSinceDate:v421];
        uint64_t v326 = v325;
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v322;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v323;
        __int16 v509 = 2048;
        uint64_t v510 = v326;
        __int16 v511 = 2048;
        uint64_t v512 = v327;
        _os_log_impl(&dword_1D9BFA000, v320, OS_LOG_TYPE_INFO, "%@, %@, updating relevance scores, status, done, latency, %.4f sec, footprint, %.4f MB", buf, 0x2Au);
      }
      uint64_t v328 = [MEMORY[0x1E4F1C9C8] date];

      v329 = (id *)(v474 + 5);
      id v425 = (id)v474[5];
      BOOL v330 = [(RTWorkoutRouteManager *)self _syncClustersToWatchWithLimit:100 error:&v425];
      objc_storeStrong(v329, v425);
      v331 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v331, OS_LOG_TYPE_INFO))
      {
        v332 = (objc_class *)objc_opt_class();
        NSStringFromClass(v332);
        id v333 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v334 = (id)objc_claimAutoreleasedReturnValue();
        if (v330) {
          v335 = @"YES";
        }
        else {
          v335 = @"NO";
        }
        v336 = [MEMORY[0x1E4F1C9C8] date];
        [v336 timeIntervalSinceDate:v328];
        uint64_t v338 = v337;
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v333;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v334;
        __int16 v509 = 2048;
        uint64_t v510 = 100;
        __int16 v511 = 2112;
        uint64_t v512 = (uint64_t)v335;
        __int16 v513 = 2048;
        uint64_t v514 = v338;
        __int16 v515 = 2048;
        uint64_t v516 = v339;
        _os_log_impl(&dword_1D9BFA000, v331, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);
      }
      [v420 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"is_new_workout_clustered_other"];

      v399 = 0;
      v421 = (void *)v328;
    }
    else
    {
      v242 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v242, OS_LOG_TYPE_INFO))
      {
        v243 = (objc_class *)objc_opt_class();
        NSStringFromClass(v243);
        id v244 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v245 = (id)objc_claimAutoreleasedReturnValue();
        v246 = [MEMORY[0x1E4F1C9C8] date];
        [v246 timeIntervalSinceDate:v421];
        uint64_t v248 = v247;
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v244;
        __int16 v507 = 2112;
        uint64_t v508 = (uint64_t)v245;
        __int16 v509 = 2112;
        uint64_t v510 = (uint64_t)v6;
        __int16 v511 = 2048;
        uint64_t v512 = v248;
        __int16 v513 = 2048;
        uint64_t v514 = v249;
        _os_log_impl(&dword_1D9BFA000, v242, OS_LOG_TYPE_INFO, "%@, %@, couldn't find best cluster for the new workout, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
      }
      [v420 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"is_new_workout_clustered_other"];
    }
    v250 = NSNumber;
    +[RTRuntime footprint];
    v252 = [v250 numberWithDouble:v251 - v13];
    [v420 setObject:v252 forKeyedSubscript:@"footprint_delta"];

    v253 = NSNumber;
    v254 = [MEMORY[0x1E4F1C9C8] date];
    [v254 timeIntervalSinceDate:v419];
    v255 = [v253 numberWithDouble:x0];
    [v420 setObject:v255 forKeyedSubscript:@"time_elapsed_mini_worldbuild_check"];

    BOOL v256 = [(RTWorkoutRouteManager *)self workoutMetricsManager];
    v479 = v420;
    BOOL v257 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v479 count:1];
    v258 = (id *)(v474 + 5);
    id v424 = (id)v474[5];
    int v259 = [v256 submitMetricsForEvent:2 data:v257 error:&v424];
    objc_storeStrong(v258, v424);

    id v260 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
    {
      v340 = (objc_class *)objc_opt_class();
      NSStringFromClass(v340);
      id v341 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v342 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v343 = [v420 count];
      v344 = @"NO";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v341;
      __int16 v507 = 2112;
      if (v259) {
        v344 = @"YES";
      }
      uint64_t v508 = (uint64_t)v342;
      __int16 v509 = 2112;
      uint64_t v510 = (uint64_t)v344;
      __int16 v511 = 2048;
      uint64_t v512 = v343;
      _os_log_error_impl(&dword_1D9BFA000, v260, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);
    }
    if (v7) {
      ((void (*)(void (**)(void), uint64_t))v7[2])(v7, v474[5]);
    }
    id v41 = 0;
    v420 = 0;
    goto LABEL_237;
  }
  id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: newlyAddedWorkoutUUID", buf, 2u);
  }

LABEL_37:
}

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_169(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_174(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_updateRelevanceScoresWithHandler:(id)a3
{
  v309[1] = *MEMORY[0x1E4F143B8];
  double v251 = (void (**)(void))a3;
  context = (void *)MEMORY[0x1E016D870]();
  v246 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v248 = [MEMORY[0x1E4F1C9C8] date];
  +[RTRuntime footprint];
  double v4 = v3;
  v253 = objc_opt_new();
  uint64_t v283 = 0;
  long long v284 = &v283;
  uint64_t v285 = 0x3032000000;
  id v286 = __Block_byref_object_copy__133;
  id v287 = __Block_byref_object_dispose__133;
  id v288 = (id)objc_opt_new();
  uint64_t v277 = 0;
  long long v278 = &v277;
  uint64_t v279 = 0x3032000000;
  id v280 = __Block_byref_object_copy__133;
  id v281 = __Block_byref_object_dispose__133;
  id v282 = 0;
  v255 = objc_opt_new();
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v291 = 2112;
    id v292 = v8;
    __int16 v293 = 2048;
    uint64_t v294 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, fetching workout clusters, footprint, %.4f MB", buf, 0x20u);
  }
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = [(RTWorkoutRouteManager *)self healthKitManager];
  v273[0] = MEMORY[0x1E4F143A8];
  v273[1] = 3221225472;
  v273[2] = __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke;
  v273[3] = &unk_1E6B9AF88;
  double v275 = &v277;
  id v12 = v10;
  id v274 = v12;
  double v276 = &v283;
  [v11 fetchWorkoutClustersWithHandler:v273];

  dsema = v12;
  double v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v14)) {
    goto LABEL_8;
  }
  __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  uint64_t v18 = objc_opt_new();
  id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
  dispatch_semaphore_t v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  __int16 v24 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v302 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v302 count:1];
  dispatch_time_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;
  }
  else
  {
LABEL_8:
    id v27 = 0;
  }

  id v28 = v27;
  if (v28)
  {
    id v29 = v28;
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v46;
      __int16 v291 = 2112;
      id v292 = v47;
      __int16 v293 = 2112;
      uint64_t v294 = (uint64_t)v29;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
    }
    if (v251) {
      v251[2]();
    }
    goto LABEL_48;
  }
  if (v278[5])
  {
    unint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      double v61 = NSStringFromSelector(a2);
      uint64_t v62 = v278[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v60;
      __int16 v291 = 2112;
      id v292 = v61;
      __int16 v293 = 2112;
      uint64_t v294 = v62;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
    }
    uint64_t v32 = v251;
    if (!v251) {
      goto LABEL_32;
    }
    uint64_t v33 = v278[5];
LABEL_31:
    ((void (*)(void (**)(void), uint64_t))v32[2])(v32, v33);
LABEL_32:
    id v29 = 0;
    goto LABEL_48;
  }
  id v34 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    id v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [(id)v284[5] count];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v36;
    __int16 v291 = 2112;
    id v292 = v37;
    __int16 v293 = 2048;
    uint64_t v294 = v38;
    _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, %@, clusters count, %lu", buf, 0x20u);
  }
  if (![(id)v284[5] count])
  {
    uint64_t v33 = 0;
    uint64_t v32 = v251;
    goto LABEL_31;
  }
  id v39 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    id v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v41;
    __int16 v291 = 2112;
    id v292 = v42;
    _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%@, %@, getting current location", buf, 0x16u);
  }
  id v43 = (id *)(v278 + 5);
  id obj = (id)v278[5];
  v241 = [(RTWorkoutRouteManager *)self _getRelevanceLocationWithError:&obj];
  objc_storeStrong(v43, obj);
  if (v278[5])
  {
    id v44 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      double v174 = (objc_class *)objc_opt_class();
      NSStringFromClass(v174);
      id v175 = (id)objc_claimAutoreleasedReturnValue();
      id v176 = NSStringFromSelector(a2);
      uint64_t v177 = v278[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v175;
      __int16 v291 = 2112;
      id v292 = v176;
      __int16 v293 = 2112;
      uint64_t v294 = v177;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
    }
    if (v251) {
      v251[2]();
    }
    id v29 = 0;
    goto LABEL_47;
  }
  __int16 v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v50;
    __int16 v291 = 2112;
    id v292 = v51;
    __int16 v293 = 2112;
    uint64_t v294 = (uint64_t)v241;
    _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, %@, current location, %@", buf, 0x20u);
  }
  int64_t v52 = [(RTWorkoutRouteManager *)self healthKitManager];
  BOOL v53 = [(RTWorkoutRouteManager *)self healthKitManager];
  uint64_t v54 = [v53 _getWorkoutDefaultStartDateForRaceRoute];
  BOOL v55 = [(RTWorkoutRouteManager *)self healthKitManager];
  uint64_t v56 = [v55 _getRTWorkoutDefaultTypesForRaceRoute];
  v57 = (id *)(v278 + 5);
  id v271 = (id)v278[5];
  v240 = [v52 getLatestWorkoutWithStartDate:v54 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:v56 workoutTypes:&v271 error:1.79769313e308];
  objc_storeStrong(v57, v271);

  if (v278[5])
  {
    v58 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      int v216 = (objc_class *)objc_opt_class();
      NSStringFromClass(v216);
      id v217 = (id)objc_claimAutoreleasedReturnValue();
      v218 = NSStringFromSelector(a2);
      uint64_t v219 = v278[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v217;
      __int16 v291 = 2112;
      id v292 = v218;
      __int16 v293 = 2112;
      uint64_t v294 = v219;
      _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
    }
    if (v251) {
      v251[2]();
    }
LABEL_45:
    id v29 = 0;
    uint64_t v68 = (uint64_t)v248;
    goto LABEL_46;
  }
  uint64_t v63 = [(RTWorkoutRouteManager *)self healthKitManager];
  id v64 = [(RTWorkoutRouteManager *)self healthKitManager];
  id v65 = [v64 _getWorkoutDefaultStartDateForRaceRoute];
  BOOL v66 = (id *)(v278 + 5);
  id v270 = (id)v278[5];
  uint64_t v239 = [v63 getWorkoutsCountWithStartDate:v65 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:&v270 error:1.79769313e308];
  objc_storeStrong(v66, v270);

  if (v278[5])
  {
    uint64_t v67 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      id v220 = (objc_class *)objc_opt_class();
      NSStringFromClass(v220);
      id v221 = (id)objc_claimAutoreleasedReturnValue();
      v222 = NSStringFromSelector(a2);
      uint64_t v223 = v278[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v221;
      __int16 v291 = 2112;
      id v292 = v222;
      __int16 v293 = 2112;
      uint64_t v294 = v223;
      _os_log_error_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
    }
    if (v251) {
      v251[2]();
    }
    goto LABEL_45;
  }
  uint64_t v69 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    v70 = (objc_class *)objc_opt_class();
    NSStringFromClass(v70);
    id v71 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v72 = (id)objc_claimAutoreleasedReturnValue();
    int v73 = [v240 UUID];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v71;
    __int16 v291 = 2112;
    id v292 = v72;
    __int16 v293 = 2112;
    uint64_t v294 = (uint64_t)v73;
    _os_log_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_INFO, "%@, %@, latest workout across all workouts, %@", buf, 0x20u);
  }
  double v74 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    double v75 = (objc_class *)objc_opt_class();
    NSStringFromClass(v75);
    id v76 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v77 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v76;
    __int16 v291 = 2112;
    id v292 = v77;
    __int16 v293 = 2048;
    uint64_t v294 = v239;
    _os_log_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_INFO, "%@, %@, count of all workouts, %lu", buf, 0x20u);
  }
  v78 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    id v79 = (objc_class *)objc_opt_class();
    NSStringFromClass(v79);
    id v80 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v81 = (id)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v80;
    __int16 v291 = 2112;
    id v292 = v81;
    __int16 v293 = 2048;
    uint64_t v294 = v82;
    _os_log_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_INFO, "%@, %@, updating relevance score, footprint, %.4f MB", buf, 0x20u);
  }
  id v83 = [NSNumber numberWithUnsignedInteger:[v284[5] count]];
  [v253 setObject:v83 forKeyedSubscript:@"count_clusters_existing"];

  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:@""];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  [v253 setObject:&unk_1F34520D0 forKeyedSubscript:];
  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  id v242 = (id)v284[5];
  uint64_t v84 = [v242 countByEnumeratingWithState:&v266 objects:v308 count:16];
  if (!v84)
  {
    char v237 = 0;
    uint64_t v238 = 0;
    id v29 = 0;
    goto LABEL_112;
  }
  char v237 = 0;
  uint64_t v238 = 0;
  id v29 = 0;
  uint64_t v249 = *(void *)v267;
  uint64_t v243 = *MEMORY[0x1E4F5CFE8];
  uint64_t v244 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v85 = 0;
    dispatch_time_t v86 = v29;
    uint64_t v250 = v84;
    do
    {
      if (*(void *)v267 != v249) {
        objc_enumerationMutation(v242);
      }
      id v87 = *(void **)(*((void *)&v266 + 1) + 8 * v85);
      v252 = (void *)MEMORY[0x1E016D870]();
      uint64_t v302 = 0;
      __int16 v303 = &v302;
      uint64_t v304 = 0x3032000000;
      __int16 v305 = __Block_byref_object_copy__133;
      double v306 = __Block_byref_object_dispose__133;
      id v307 = [MEMORY[0x1E4F1C978] array];
      dispatch_semaphore_t v88 = dispatch_semaphore_create(0);

      dispatch_time_t v89 = [(RTWorkoutRouteManager *)self healthKitManager];
      double v90 = [v87 clusterUUID];
      v262[0] = MEMORY[0x1E4F143A8];
      v262[1] = 3221225472;
      v262[2] = __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke_176;
      v262[3] = &unk_1E6B905F0;
      id v264 = &v277;
      v265 = &v302;
      double v91 = v88;
      id v263 = v91;
      [v89 fetchWorkoutUUIDsForClusterUUID:v90 handler:v262];

      dsema = v91;
      double v92 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v93 = dispatch_time(0, 3600000000000);
      id v94 = v86;
      if (dispatch_semaphore_wait(dsema, v93))
      {
        v95 = [MEMORY[0x1E4F1C9C8] now];
        [v95 timeIntervalSinceDate:v92];
        double v97 = v96;
        __int16 v98 = objc_opt_new();
        double v99 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
        __int16 v100 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v101 = [v100 filteredArrayUsingPredicate:v99];
        id v102 = [v101 firstObject];

        [v98 submitToCoreAnalytics:v102 type:1 duration:v97];
        uint64_t v103 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v103, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        __int16 v104 = (void *)MEMORY[0x1E4F28C58];
        v309[0] = v244;
        *(void *)buf = @"semaphore wait timeout";
        id v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v309 count:1];
        v106 = [v104 errorWithDomain:v243 code:15 userInfo:v105];

        id v94 = v86;
        if (v106)
        {
          id v94 = v106;
        }
      }

      id v29 = v94;
      if (!v255 || !v278[5])
      {
        uint64_t v109 = [(RTWorkoutRouteManager *)self healthKitManager];
        v110 = [v87 lastWorkoutUUID];
        uint64_t v301 = v110;
        v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v301 count:1];
        id v112 = (id *)(v278 + 5);
        id v261 = (id)v278[5];
        id v108 = [v109 getWorkoutsWithUUIDs:v111 error:&v261];
        objc_storeStrong(v112, v261);

        if (v255 && v278[5])
        {
          v113 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
            __int16 v162 = (objc_class *)objc_opt_class();
            NSStringFromClass(v162);
            id v163 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v164 = NSStringFromSelector(a2);
            uint64_t v165 = v278[5];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v163;
            __int16 v291 = 2112;
            id v292 = v164;
            __int16 v293 = 2112;
            uint64_t v294 = v165;
            _os_log_error_impl(&dword_1D9BFA000, v113, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
          }
          [v255 addObject:v278[5]];
          uint64_t v114 = (void *)v278[5];
          v278[5] = 0;
        }
        else
        {
          uint64_t v114 = [v108 firstObject];
          uint64_t v115 = v303[5];
          id v116 = (id *)(v278 + 5);
          id v260 = (id)v278[5];
          [(RTWorkoutRouteManager *)self _relevanceScoreForWorkoutUUIDs:v115 representativeWorkout:v114 latestWorkoutAcrossAllWorkouts:v240 countOfAllWorkouts:v239 currentLocation:v241 error:&v260];
          double v118 = v117;
          objc_storeStrong(v116, v260);
          if (v255 && v278[5])
          {
            id v119 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            {
              id v166 = (objc_class *)objc_opt_class();
              NSStringFromClass(v166);
              id v167 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v168 = NSStringFromSelector(a2);
              uint64_t v169 = v278[5];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v167;
              __int16 v291 = 2112;
              id v292 = v168;
              __int16 v293 = 2112;
              uint64_t v294 = v169;
              _os_log_error_impl(&dword_1D9BFA000, v119, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
            }
          }
          else
          {
            [v87 relevanceValue];
            uint64_t v120 = NSNumber;
            if (v121 == 0.0)
            {
              uint64_t v122 = [v253 objectForKeyedSubscript:@"count_clusters_existing_zero_relevance"];
              v123 = [v120 numberWithUnsignedInteger:[v122 unsignedIntegerValue] + 1];
              [v253 setObject:v123 forKeyedSubscript:@"count_clusters_existing_zero_relevance"];
            }
            else
            {
              uint64_t v122 = [v253 objectForKeyedSubscript:@"count_clusters_existing_greaterthanzero_relevance"];
              v123 = [v120 numberWithUnsignedInteger:[v122 unsignedIntegerValue] + 1];
              [v253 setObject:v123 forKeyedSubscript:@"count_clusters_existing_greaterthanzero_relevance"];
            }

            [v87 relevanceValue];
            if (v124 == v118)
            {
              int v125 = NSNumber;
              v126 = [v253 objectForKeyedSubscript:@"count_clusters_relevance_score_not_updated"];
              char v127 = [v125 numberWithUnsignedInteger:objc_msgSend(v126, "unsignedIntegerValue") + 1];
              [v253 setObject:v127 forKeyedSubscript:@"count_clusters_relevance_score_not_updated"];
            }
            else
            {
              [v87 relevanceValue];
              id v128 = NSNumber;
              if (v129 >= v118)
              {
                v130 = [v253 objectForKeyedSubscript:@"count_clusters_relevance_decreased"];
                uint64_t v131 = [v128 numberWithUnsignedInteger:[v130 unsignedIntegerValue] + 1];
                [v253 setObject:v131 forKeyedSubscript:@"count_clusters_relevance_decreased"];
              }
              else
              {
                v130 = [v253 objectForKeyedSubscript:@"count_clusters_relevance_increased"];
                uint64_t v131 = [v128 numberWithUnsignedInteger:[v130 unsignedIntegerValue] + 1];
                [v253 setObject:v131 forKeyedSubscript:@"count_clusters_relevance_increased"];
              }

              uint64_t v132 = NSNumber;
              v126 = [v253 objectForKeyedSubscript:@"count_clusters_relevance_score_updated"];
              char v127 = [v132 numberWithUnsignedInteger:[v126 unsignedIntegerValue] + 1];
              [v253 setObject:v127 forKeyedSubscript:@"count_clusters_relevance_score_updated"];
            }

            uint64_t v133 = NSNumber;
            if (v118 == 0.0)
            {
              uint64_t v134 = [v253 objectForKeyedSubscript:@"count_clusters_new_zero_relevance"];
              v135 = [v133 numberWithUnsignedInteger:[v134 unsignedIntegerValue] + 1];
              [v253 setObject:v135 forKeyedSubscript:@"count_clusters_new_zero_relevance"];
            }
            else
            {
              uint64_t v134 = [v253 objectForKeyedSubscript:@"count_clusters_new_greaterthanzero_relevance"];
              v135 = [v133 numberWithUnsignedInteger:[v134 unsignedIntegerValue] + 1];
              [v253 setObject:v135 forKeyedSubscript:@"count_clusters_new_greaterthanzero_relevance"];
            }

            [v87 relevanceValue];
            if (v136 == 0.0 && v118 > 0.0)
            {
              v137 = NSNumber;
              uint64_t v138 = [v253 objectForKeyedSubscript:@"count_clusters_zero_to_relevance"];
              id v139 = [v137 numberWithUnsignedInteger:[v138 unsignedIntegerValue] + 1];
              [v253 setObject:v139 forKeyedSubscript:@"count_clusters_zero_to_relevance"];
            }
            [v87 relevanceValue];
            if (v118 == 0.0 && v140 > 0.0)
            {
              long long v141 = NSNumber;
              id v142 = [v253 objectForKeyedSubscript:@"count_clusters_relevance_to_zero"];
              id v143 = [v141 numberWithUnsignedInteger:[v142 unsignedIntegerValue] + 1];
              [v253 setObject:v143 forKeyedSubscript:@"count_clusters_relevance_to_zero"];
            }
            [v87 relevanceValue];
            if (v118 != v144)
            {
              uint64_t v145 = [(RTWorkoutRouteManager *)self healthKitManager];
              long long v146 = [v87 clusterUUID];
              long long v147 = [NSNumber numberWithDouble:v118];
              int v148 = (id *)(v278 + 5);
              id v259 = (id)v278[5];
              [v145 updateWorkoutClusterWithUUID:v146 newBestWorkoutUUID:0 newLastWorkoutUUID:0 newRelevance:v147 newWorkoutAssociations:0 workoutAssociationsToRemove:0 error:&v259];
              objc_storeStrong(v148, v259);

              uint64_t v149 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v149, OS_LOG_TYPE_INFO))
              {
                uint64_t v150 = (objc_class *)objc_opt_class();
                NSStringFromClass(v150);
                id v151 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v152 = (id)objc_claimAutoreleasedReturnValue();
                int v153 = [v87 clusterUUID];
                [v87 relevanceValue];
                uint64_t v155 = v154;
                +[RTRuntime footprint];
                *(_DWORD *)buf = 138413570;
                *(void *)&uint8_t buf[4] = v151;
                __int16 v291 = 2112;
                id v292 = v152;
                __int16 v293 = 2112;
                uint64_t v294 = (uint64_t)v153;
                __int16 v295 = 2048;
                uint64_t v296 = v155;
                __int16 v297 = 2048;
                double v298 = v118;
                __int16 v299 = 2048;
                uint64_t v300 = v156;
                _os_log_impl(&dword_1D9BFA000, v149, OS_LOG_TYPE_INFO, "%@, %@, relevance score updated for cluster with clusterUUID, %@, old relevance score, %.3f, new relevance score, %.3f, footprint, %.4f MB", buf, 0x3Eu);
              }
              ++v238;
              char v237 = 1;
            }
            if (!v255 || !v278[5]) {
              goto LABEL_107;
            }
            id v119 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            {
              id v170 = (objc_class *)objc_opt_class();
              NSStringFromClass(v170);
              id v171 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v172 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v173 = v278[5];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v171;
              __int16 v291 = 2112;
              id v292 = v172;
              __int16 v293 = 2112;
              uint64_t v294 = v173;
              _os_log_error_impl(&dword_1D9BFA000, v119, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
            }
          }

          [v255 addObject:v278[5]];
          id v157 = (void *)v278[5];
          v278[5] = 0;
        }
LABEL_107:

        goto LABEL_108;
      }
      id v107 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        v158 = (objc_class *)objc_opt_class();
        NSStringFromClass(v158);
        id v159 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v160 = NSStringFromSelector(a2);
        uint64_t v161 = v278[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v159;
        __int16 v291 = 2112;
        id v292 = v160;
        __int16 v293 = 2112;
        uint64_t v294 = v161;
        _os_log_error_impl(&dword_1D9BFA000, v107, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
      }
      [v255 addObject:v278[5]];
      id v108 = (void *)v278[5];
      v278[5] = 0;
LABEL_108:

      _Block_object_dispose(&v302, 8);
      ++v85;
      dispatch_time_t v86 = v29;
    }
    while (v250 != v85);
    uint64_t v84 = [v242 countByEnumeratingWithState:&v266 objects:v308 count:16];
  }
  while (v84);
LABEL_112:

  uint64_t v178 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
  {
    uint64_t v179 = (objc_class *)objc_opt_class();
    NSStringFromClass(v179);
    id v180 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v181 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v182 = [MEMORY[0x1E4F1C9C8] date];
    [v182 timeIntervalSinceDate:v248];
    uint64_t v184 = v183;
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v180;
    __int16 v291 = 2112;
    id v292 = v181;
    __int16 v293 = 2048;
    uint64_t v294 = v238;
    __int16 v295 = 2048;
    uint64_t v296 = v184;
    __int16 v297 = 2048;
    double v298 = v185;
    _os_log_impl(&dword_1D9BFA000, v178, OS_LOG_TYPE_INFO, "%@, %@, updated relevance score for %lu clusters, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
  }
  v186 = (void *)v284[5];
  v284[5] = 0;

  if (v237)
  {
    v187 = (void *)MEMORY[0x1E016D870]();
    uint64_t v68 = [MEMORY[0x1E4F1C9C8] date];

    v188 = (id *)(v278 + 5);
    id v258 = (id)v278[5];
    BOOL v189 = [(RTWorkoutRouteManager *)self _syncClustersToWatchWithLimit:100 error:&v258];
    objc_storeStrong(v188, v258);
    if (v255 && v278[5])
    {
      v190 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
      {
        int64_t v233 = (objc_class *)objc_opt_class();
        NSStringFromClass(v233);
        id v234 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v235 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v236 = v278[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v234;
        __int16 v291 = 2112;
        id v292 = v235;
        __int16 v293 = 2112;
        uint64_t v294 = v236;
        _os_log_error_impl(&dword_1D9BFA000, v190, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
      }
      [v255 addObject:v278[5]];
      id v191 = (void *)v278[5];
      v278[5] = 0;
    }
    id v192 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
    {
      uint64_t v193 = (objc_class *)objc_opt_class();
      NSStringFromClass(v193);
      id v194 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v195 = (id)objc_claimAutoreleasedReturnValue();
      if (v189) {
        v196 = @"YES";
      }
      else {
        v196 = @"NO";
      }
      v197 = [MEMORY[0x1E4F1C9C8] date];
      [v197 timeIntervalSinceDate:v68];
      double v199 = v198;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v194;
      __int16 v291 = 2112;
      id v292 = v195;
      __int16 v293 = 2048;
      uint64_t v294 = 100;
      __int16 v295 = 2112;
      uint64_t v296 = (uint64_t)v196;
      __int16 v297 = 2048;
      double v298 = v199;
      __int16 v299 = 2048;
      uint64_t v300 = v200;
      _os_log_impl(&dword_1D9BFA000, v192, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);
    }
  }
  else
  {
    uint64_t v68 = (uint64_t)v248;
  }
  if ([v255 count])
  {
    v201 = _RTSafeArray();
    uint64_t v202 = _RTMultiErrorCreate();
    v203 = (void *)v278[5];
    v278[5] = v202;

    uint64_t v204 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
    {
      int v224 = (objc_class *)objc_opt_class();
      NSStringFromClass(v224);
      id v225 = (id)objc_claimAutoreleasedReturnValue();
      v226 = NSStringFromSelector(a2);
      uint64_t v227 = v278[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v225;
      __int16 v291 = 2112;
      id v292 = v226;
      __int16 v293 = 2112;
      uint64_t v294 = v227;
      _os_log_error_impl(&dword_1D9BFA000, v204, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
    }
    if (v251) {
      ((void (*)(void (**)(void)))v251[2])(v251);
    }
  }
  else
  {
    id v205 = NSNumber;
    +[RTRuntime footprint];
    uint64_t v207 = [v205 numberWithDouble:v206 - v4];
    [v253 setObject:v207 forKeyedSubscript:@"footprint_delta"];

    uint64_t v208 = NSNumber;
    uint64_t v209 = [MEMORY[0x1E4F1C9C8] date];
    [v209 timeIntervalSinceDate:v246];
    uint64_t v210 = [v208 numberWithDouble:];
    [v253 setObject:v210 forKeyedSubscript:@"time_elapsed"];

    uint64_t v211 = [(RTWorkoutRouteManager *)self workoutMetricsManager];
    id v289 = v253;
    v212 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v289 count:1];
    int64_t v213 = (id *)(v278 + 5);
    id v257 = (id)v278[5];
    int v214 = [v211 submitMetricsForEvent:4 data:v212 error:&v257];
    objc_storeStrong(v213, v257);

    BOOL v215 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
    {
      BOOL v228 = (objc_class *)objc_opt_class();
      NSStringFromClass(v228);
      id v229 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v230 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v231 = [v253 count];
      v232 = @"NO";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v229;
      __int16 v291 = 2112;
      if (v214) {
        v232 = @"YES";
      }
      id v292 = v230;
      __int16 v293 = 2112;
      uint64_t v294 = (uint64_t)v232;
      __int16 v295 = 2048;
      uint64_t v296 = v231;
      _os_log_error_impl(&dword_1D9BFA000, v215, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);
    }
    if (v251) {
      v251[2]();
    }
    v253 = 0;
  }
LABEL_46:

  uint64_t v248 = (void *)v68;
LABEL_47:

LABEL_48:
  _Block_object_dispose(&v277, 8);

  _Block_object_dispose(&v283, 8);
}

void __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  dispatch_semaphore_t v10 = *v7;
  *id v7 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_deleteWorkout:(id)a3 handler:(id)a4
{
  v192[1] = *MEMORY[0x1E4F143B8];
  id v144 = a3;
  id v142 = (void (**)(void))a4;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  if (v144)
  {
    uint64_t v162 = 0;
    id v163 = (id *)&v162;
    uint64_t v164 = 0x3032000000;
    uint64_t v165 = __Block_byref_object_copy__133;
    id v166 = __Block_byref_object_dispose__133;
    id v167 = 0;
    [(RTWorkoutRouteManager *)self _clearInMemoryClusters];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
    v159[0] = MEMORY[0x1E4F143A8];
    v159[1] = 3221225472;
    v159[2] = __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke;
    v159[3] = &unk_1E6B90728;
    uint64_t v161 = &v162;
    id v8 = v6;
    uint64_t v160 = v8;
    [v7 deleteWorkoutDistanceWithWorkoutUUID:v144 handler:v159];

    id v9 = v8;
    dispatch_semaphore_t v10 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v11 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v9, v11))
    {
      id v12 = [MEMORY[0x1E4F1C9C8] now];
      [v12 timeIntervalSinceDate:v10];
      double v14 = v13;
      __int16 v15 = objc_opt_new();
      double v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      double v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 filteredArrayUsingPredicate:v16];
      id v19 = [v18 firstObject];

      [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
      id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v182 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      dispatch_semaphore_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v182 count:1];
      id v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

      if (v23)
      {
        id v23 = v23;
      }
    }
    else
    {
      id v23 = 0;
    }

    id v27 = v23;
    if (v27) {
      objc_storeStrong(v163 + 5, v23);
    }
    if (v163[5])
    {
      v142[2]();
LABEL_70:

      _Block_object_dispose(&v162, 8);
      goto LABEL_71;
    }
    id v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [MEMORY[0x1E4F1C9C8] date];
      [v32 timeIntervalSinceDate:v5];
      uint64_t v34 = v33;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v30;
      __int16 v169 = 2112;
      id v170 = v31;
      __int16 v171 = 2112;
      uint64_t v172 = (uint64_t)v144;
      __int16 v173 = 2048;
      uint64_t v174 = v34;
      __int16 v175 = 2048;
      uint64_t v176 = v35;
      _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, deleted rows in distance matrix that has the workout UUID %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
    }
    uint64_t v132 = [MEMORY[0x1E4F1C9C8] date];

    id v189 = v144;
    id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
    id v37 = v163 + 5;
    id obj = v163[5];
    double v136 = [(RTWorkoutRouteManager *)self _getRemoteWorkoutClustersForWorkoutUUIDs:v36 error:&obj];
    objc_storeStrong(v37, obj);

    uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v42 = [v136 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v40;
      __int16 v169 = 2112;
      id v170 = v41;
      __int16 v171 = 2048;
      uint64_t v172 = v42;
      _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, deletion clusters count, %lu", buf, 0x20u);
    }
    if (v163[5] || ![v136 count])
    {
      if (v142) {
        v142[2]();
      }
    }
    else
    {
      long long v156 = 0u;
      long long v157 = 0u;
      long long v155 = 0u;
      long long v154 = 0u;
      id v133 = v136;
      uint64_t v43 = [v133 countByEnumeratingWithState:&v154 objects:v188 count:16];
      if (v43)
      {
        uint64_t v138 = *(void *)v155;
        uint64_t v134 = *MEMORY[0x1E4F5CFE8];
        uint64_t v135 = *MEMORY[0x1E4F28568];
        do
        {
          uint64_t v44 = 0;
          id v45 = v27;
          uint64_t v137 = v43;
          do
          {
            if (*(void *)v155 != v138) {
              objc_enumerationMutation(v133);
            }
            long long v141 = *(void **)(*((void *)&v154 + 1) + 8 * v44);
            context = (void *)MEMORY[0x1E016D870]();
            uint64_t v182 = 0;
            uint64_t v183 = &v182;
            uint64_t v184 = 0x3032000000;
            double v185 = __Block_byref_object_copy__133;
            v186 = __Block_byref_object_dispose__133;
            id v187 = [MEMORY[0x1E4F1C978] array];
            dispatch_semaphore_t v46 = dispatch_semaphore_create(0);

            v47 = [(RTWorkoutRouteManager *)self healthKitManager];
            __int16 v48 = [v141 clusterUUID];
            v150[0] = MEMORY[0x1E4F143A8];
            v150[1] = 3221225472;
            v150[2] = __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_177;
            v150[3] = &unk_1E6B905F0;
            id v152 = &v162;
            int v153 = &v182;
            v49 = v46;
            id v151 = v49;
            [v47 fetchWorkoutUUIDsForClusterUUID:v48 handler:v150];

            id v9 = v49;
            id v50 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v51 = dispatch_time(0, 3600000000000);
            id v52 = v45;
            if (dispatch_semaphore_wait(v9, v51))
            {
              BOOL v53 = [MEMORY[0x1E4F1C9C8] now];
              [v53 timeIntervalSinceDate:v50];
              double v55 = v54;
              uint64_t v56 = objc_opt_new();
              v57 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
              v58 = [MEMORY[0x1E4F29060] callStackSymbols];
              uint64_t v59 = [v58 filteredArrayUsingPredicate:v57];
              id v60 = [v59 firstObject];

              [v56 submitToCoreAnalytics:v60 type:1 duration:v55];
              double v61 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
              }

              uint64_t v62 = (void *)MEMORY[0x1E4F28C58];
              v192[0] = v135;
              *(void *)buf = @"semaphore wait timeout";
              uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v192 count:1];
              id v64 = [v62 errorWithDomain:v134 code:15 userInfo:v63];

              id v52 = v45;
              if (v64)
              {
                id v52 = v64;
              }
            }

            id v27 = v52;
            id v65 = v163;
            if (v27)
            {
              id v66 = v27;
              int v67 = 0;
              uint64_t v68 = v65[5];
              v65[5] = v66;
LABEL_33:

              goto LABEL_36;
            }
            if (!v163[5])
            {
              uint64_t v69 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                v70 = (objc_class *)objc_opt_class();
                NSStringFromClass(v70);
                id v71 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v72 = (id)objc_claimAutoreleasedReturnValue();
                int v73 = [v141 clusterUUID];
                uint64_t v74 = [(id)v183[5] count];
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v71;
                __int16 v169 = 2112;
                id v170 = v72;
                __int16 v171 = 2112;
                uint64_t v172 = (uint64_t)v73;
                __int16 v173 = 2048;
                uint64_t v174 = v74;
                _os_log_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_INFO, "%@, %@, cluster, %@, number of workouts, %lu", buf, 0x2Au);
              }
              if ((unint64_t)[(id)v183[5] count] > 2)
              {
                double v92 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                {
                  dispatch_time_t v93 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v93);
                  id v94 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v95 = (id)objc_claimAutoreleasedReturnValue();
                  double v96 = [v141 clusterUUID];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v94;
                  __int16 v169 = 2112;
                  id v170 = v95;
                  __int16 v171 = 2112;
                  uint64_t v172 = (uint64_t)v96;
                  _os_log_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_INFO, "%@, %@, case 2/2, updating the cluster with cluster UUID, %@", buf, 0x20u);
                }
                double v97 = (void *)v183[5];
                __int16 v98 = (void *)MEMORY[0x1E4F28F60];
                v147[0] = MEMORY[0x1E4F143A8];
                v147[1] = 3221225472;
                v147[2] = __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_182;
                v147[3] = &unk_1E6B94858;
                int v148 = v144;
                double v99 = [v98 predicateWithBlock:v147];
                __int16 v100 = [v97 filteredArrayUsingPredicate:v99];

                uint64_t v179 = v100;
                uint64_t v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v179 count:1];
                id v102 = v163 + 5;
                id v146 = v163[5];
                BOOL v103 = [(RTWorkoutRouteManager *)self _syncClustersToHealthKit:v101 error:&v146];
                objc_storeStrong(v102, v146);

                LOBYTE(v101) = v163[5] == 0;
                if (v101)
                {
                  __int16 v104 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                  {
                    id v105 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v105);
                    id v106 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    id v107 = (id)objc_claimAutoreleasedReturnValue();
                    if (v103) {
                      id v108 = @"YES";
                    }
                    else {
                      id v108 = @"NO";
                    }
                    uint64_t v109 = [MEMORY[0x1E4F1C9C8] date];
                    [v109 timeIntervalSinceDate:v132];
                    uint64_t v111 = v110;
                    +[RTRuntime footprint];
                    *(_DWORD *)buf = 138413314;
                    *(void *)&uint8_t buf[4] = v106;
                    __int16 v169 = 2112;
                    id v170 = v107;
                    __int16 v171 = 2112;
                    uint64_t v172 = (uint64_t)v108;
                    __int16 v173 = 2048;
                    uint64_t v174 = v111;
                    __int16 v175 = 2048;
                    uint64_t v176 = v112;
                    _os_log_impl(&dword_1D9BFA000, v104, OS_LOG_TYPE_INFO, "%@, %@, updated clusters to healthkit status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
                  }
                  int v67 = 1;
                }
                else
                {
                  int v67 = 0;
                }
                uint64_t v68 = v148;
                goto LABEL_33;
              }
              double v75 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                id v76 = (objc_class *)objc_opt_class();
                NSStringFromClass(v76);
                id v77 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v78 = (id)objc_claimAutoreleasedReturnValue();
                id v79 = [v141 clusterUUID];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v77;
                __int16 v169 = 2112;
                id v170 = v78;
                __int16 v171 = 2112;
                uint64_t v172 = (uint64_t)v79;
                _os_log_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_INFO, "%@, %@, case 1/2, deleting the entire cluster with cluster UUID, %@", buf, 0x20u);
              }
              id v80 = [(RTWorkoutRouteManager *)self healthKitManager];
              id v81 = [v141 clusterUUID];
              uint64_t v82 = v163 + 5;
              id v149 = v163[5];
              char v83 = [v80 deleteWorkoutCluster:v81 error:&v149];
              objc_storeStrong(v82, v149);

              if (!v163[5])
              {
                if (v83)
                {
                  uint64_t v68 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  int v67 = 1;
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v84 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v84);
                    id v85 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    id v86 = (id)objc_claimAutoreleasedReturnValue();
                    id v87 = [v141 clusterUUID];
                    dispatch_semaphore_t v88 = [MEMORY[0x1E4F1C9C8] date];
                    [v88 timeIntervalSinceDate:v132];
                    uint64_t v90 = v89;
                    +[RTRuntime footprint];
                    *(_DWORD *)buf = 138413314;
                    *(void *)&uint8_t buf[4] = v85;
                    __int16 v169 = 2112;
                    id v170 = v86;
                    __int16 v171 = 2112;
                    uint64_t v172 = (uint64_t)v87;
                    __int16 v173 = 2048;
                    uint64_t v174 = v90;
                    __int16 v175 = 2048;
                    uint64_t v176 = v91;
                    _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "%@, %@, deleted the entire cluster with cluster UUID, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

                    int v67 = 1;
                  }
                }
                else
                {
                  v113 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v180 = v135;
                  uint64_t v114 = NSString;
                  uint64_t v68 = [v141 clusterUUID];
                  uint64_t v115 = [v114 stringWithFormat:@"workout cluster with clusterUUID, %@, not deleted", v68];
                  id v181 = v115;
                  id v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
                  uint64_t v117 = [v113 errorWithDomain:v134 code:0 userInfo:v116];
                  id v118 = v163[5];
                  v163[5] = (id)v117;

                  int v67 = 0;
                }
                goto LABEL_33;
              }
            }
            int v67 = 0;
LABEL_36:

            _Block_object_dispose(&v182, 8);
            if (!v67) {
              goto LABEL_61;
            }
            ++v44;
            id v45 = v27;
          }
          while (v137 != v44);
          uint64_t v43 = [v133 countByEnumeratingWithState:&v154 objects:v188 count:16];
        }
        while (v43);
      }
LABEL_61:

      if (v163[5])
      {
        v142[2]();
      }
      else
      {
        id v119 = (void *)MEMORY[0x1E016D870]();
        uint64_t v120 = [MEMORY[0x1E4F1C9C8] date];

        double v121 = v163 + 5;
        id v145 = v163[5];
        BOOL v122 = [(RTWorkoutRouteManager *)self _syncClustersToWatchWithLimit:100 error:&v145];
        objc_storeStrong(v121, v145);
        v123 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          double v124 = (objc_class *)objc_opt_class();
          NSStringFromClass(v124);
          id v125 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v126 = (id)objc_claimAutoreleasedReturnValue();
          if (v122) {
            char v127 = @"YES";
          }
          else {
            char v127 = @"NO";
          }
          id v128 = [MEMORY[0x1E4F1C9C8] date];
          [v128 timeIntervalSinceDate:v120];
          uint64_t v130 = v129;
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = v125;
          __int16 v169 = 2112;
          id v170 = v126;
          __int16 v171 = 2048;
          uint64_t v172 = 100;
          __int16 v173 = 2112;
          uint64_t v174 = (uint64_t)v127;
          __int16 v175 = 2048;
          uint64_t v176 = v130;
          __int16 v177 = 2048;
          uint64_t v178 = v131;
          _os_log_impl(&dword_1D9BFA000, v123, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);
        }
        ((void (*)(void (**)(void), id))v142[2])(v142, v163[5]);
        uint64_t v132 = (void *)v120;
      }
    }

    id v5 = v132;
    goto LABEL_70;
  }
  __int16 v24 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v190 = *MEMORY[0x1E4F28568];
  id v191 = @"requires valid UUID.";
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
  dispatch_time_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v25];
  ((void (*)(void (**)(void), void *))v142[2])(v142, v26);

LABEL_71:
}

void __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_182(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (BOOL)_computeAndSaveDistanceMatrixForWorkoutUUIDs:(id)a3 distanceMetric:(int64_t)a4 error:(id *)a5
{
  v756[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v611 = v6;
  if (v6)
  {
    id v7 = v6;
    int64_t v542 = a4;
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = objc_opt_new();
    uint64_t v718 = 0;
    v719 = &v718;
    uint64_t v720 = 0x3032000000;
    v721 = __Block_byref_object_copy__133;
    v722 = __Block_byref_object_dispose__133;
    id v723 = 0;
    id v599 = (id)v8;
    if ((unint64_t)[v7 count] < 2)
    {
      dispatch_semaphore_t v10 = (void *)v9;
      BOOL v11 = 1;
      goto LABEL_366;
    }
    v543 = (void *)v9;
    v541 = (void *)MEMORY[0x1E016D870]();
    v598 = [MEMORY[0x1E4F1C9C8] date];
    [MEMORY[0x1E4F1C9C8] date];
    v15 = double v14 = v611;
    [v15 timeIntervalSinceDate:v598];
    double v17 = v16;
    v586 = objc_opt_new();
    v582 = objc_opt_new();
    v593 = objc_opt_new();
    unint64_t v609 = 0;
    uint64_t v714 = 0;
    v715 = &v714;
    uint64_t v716 = 0x2020000000;
    uint64_t v717 = 0;
    uint64_t v710 = 0;
    v711 = &v710;
    uint64_t v712 = 0x2020000000;
    uint64_t v713 = 0;
    uint64_t v708 = 0x2020000000;
    uint64_t v704 = 0x2020000000;
    uint64_t v700 = 0x2020000000;
    uint64_t v696 = 0x2020000000;
    uint64_t v692 = 0x2020000000;
    uint64_t v688 = 0x2020000000;
    uint64_t v684 = 0x2020000000;
    uint64_t v680 = 0x2020000000;
    uint64_t v676 = 0x2020000000;
    double v18 = 10000.0;
    uint64_t v672 = 0x2020000000;
    uint64_t v706 = 0;
    v707 = &v706;
    uint64_t v709 = 0;
    uint64_t v702 = 0;
    v703 = &v702;
    uint64_t v705 = 0;
    uint64_t v698 = 0;
    v699 = &v698;
    uint64_t v701 = 0;
    uint64_t v694 = 0;
    v695 = &v694;
    uint64_t v697 = 0;
    uint64_t v690 = 0;
    v691 = &v690;
    uint64_t v693 = 0;
    uint64_t v686 = 0;
    v687 = &v686;
    uint64_t v689 = 0;
    uint64_t v682 = 0;
    v683 = &v682;
    uint64_t v685 = 0;
    uint64_t v678 = 0;
    v679 = &v678;
    uint64_t v681 = 0;
    uint64_t v674 = 0;
    v675 = &v674;
    uint64_t v677 = 0;
    uint64_t v670 = 0;
    v671 = &v670;
    uint64_t v673 = 0;
    uint64_t v545 = *MEMORY[0x1E4F5CFE8];
    uint64_t v546 = *MEMORY[0x1E4F28568];
    uint64_t v19 = 1;
LABEL_10:
    unint64_t v591 = v19;
    if (v609 < [v14 count])
    {
      v589 = (void *)MEMORY[0x1E016D870]();
      id v20 = v715;
      uint64_t v21 = (void *)v715[3];
      if (v21)
      {
        free(v21);
        id v20 = v715;
      }
      v20[3] = 0;
      dispatch_semaphore_t v22 = v707;
      id v23 = (void *)v707[3];
      if (v23)
      {
        free(v23);
        dispatch_semaphore_t v22 = v707;
      }
      v22[3] = 0;
      __int16 v24 = v699;
      uint64_t v25 = (void *)v699[3];
      if (v25)
      {
        free(v25);
        __int16 v24 = v699;
      }
      v24[3] = 0;
      v711[3] = 0;
      v695[3] = 0;
      dispatch_time_t v26 = [v611 objectAtIndexedSubscript:v609];
      int v27 = [v593 containsObject:v26];

      if (v27)
      {
        id v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = [v611 objectAtIndexedSubscript:v609];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v30;
          __int16 v727 = 2112;
          id v728 = v31;
          __int16 v729 = 2048;
          unint64_t v730 = v609;
          __int16 v731 = 2112;
          uint64_t v732 = (uint64_t)v32;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, skip comparisons for i, %lu, workout UUID, %@; i is marked as contained in a small bounding box",
            buf,
            0x2Au);
        }
        int v33 = 8;
        goto LABEL_338;
      }
      uint64_t v34 = [v611 objectAtIndexedSubscript:v609];
      uint64_t v35 = [v586 objectForKeyedSubscript:v34];
      BOOL v36 = v35 == 0;

      if (v36)
      {
        id v37 = objc_opt_new();
        uint64_t v38 = [v611 objectAtIndexedSubscript:v609];
        [v586 setObject:v37 forKeyedSubscript:v38];
      }
      uint64_t v664 = 0;
      v665 = &v664;
      uint64_t v666 = 0x3032000000;
      v667 = __Block_byref_object_copy__133;
      v668 = __Block_byref_object_dispose__133;
      id v669 = 0;
      dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
      id v40 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
      id v41 = [v611 objectAtIndexedSubscript:v609];
      v660[0] = MEMORY[0x1E4F143A8];
      v660[1] = 3221225472;
      v660[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke;
      v660[3] = &unk_1E6B905F0;
      v662 = &v664;
      v663 = &v718;
      uint64_t v42 = v39;
      v661 = v42;
      [v40 fetchWorkoutDistancesWithWorkout:v41 handler:v660];

      dsema = v42;
      uint64_t v43 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v44 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v44)) {
        goto LABEL_28;
      }
      id v45 = [MEMORY[0x1E4F1C9C8] now];
      [v45 timeIntervalSinceDate:v43];
      double v47 = v46;
      __int16 v48 = objc_opt_new();
      v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      id v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      dispatch_time_t v51 = [v50 filteredArrayUsingPredicate:v49];
      id v52 = [v51 firstObject];

      [v48 submitToCoreAnalytics:v52 type:1 duration:v47];
      BOOL v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      double v54 = (void *)MEMORY[0x1E4F28C58];
      v756[0] = v546;
      *(void *)buf = @"semaphore wait timeout";
      double v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v756 count:1];
      uint64_t v56 = [v54 errorWithDomain:v545 code:15 userInfo:v55];

      if (v56)
      {
        id v57 = v56;
      }
      else
      {
LABEL_28:
        id v57 = 0;
      }

      id v584 = v57;
      if (v584) {
        BOOL v58 = v599 != 0;
      }
      else {
        BOOL v58 = 0;
      }
      if (v58)
      {
        uint64_t v59 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          id v493 = (objc_class *)objc_opt_class();
          NSStringFromClass(v493);
          id v494 = (id)objc_claimAutoreleasedReturnValue();
          v495 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v494;
          __int16 v727 = 2112;
          id v728 = v495;
          __int16 v729 = 2112;
          unint64_t v730 = (unint64_t)v584;
          _os_log_error_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
        }
        id v60 = v584;
        [v599 addObject:v584];
        v600 = 0;
        int v33 = 8;
        id v584 = 0;
        goto LABEL_335;
      }
      if (v599 && v719[5])
      {
        double v61 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v496 = (objc_class *)objc_opt_class();
          NSStringFromClass(v496);
          id v497 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v498 = NSStringFromSelector(a2);
          unint64_t v499 = v719[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v497;
          __int16 v727 = 2112;
          id v728 = v498;
          __int16 v729 = 2112;
          unint64_t v730 = v499;
          _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
        }
        [v599 addObject:v719[5]];
        v600 = 0;
        id v60 = (void *)v719[5];
        v719[5] = 0;
        int v33 = 8;
        goto LABEL_335;
      }
      uint64_t v62 = objc_opt_new();
      long long v659 = 0u;
      long long v658 = 0u;
      long long v657 = 0u;
      long long v656 = 0u;
      id v63 = (id)v665[5];
      uint64_t v64 = [v63 countByEnumeratingWithState:&v656 objects:v755 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v657;
        do
        {
          for (uint64_t i = 0; i != v64; ++i)
          {
            if (*(void *)v657 != v65) {
              objc_enumerationMutation(v63);
            }
            int v67 = *(void **)(*((void *)&v656 + 1) + 8 * i);
            uint64_t v68 = (void *)MEMORY[0x1E016D870]();
            uint64_t v69 = [v67 firstWorkout];
            [v62 addObject:v69];

            v70 = [v67 secondWorkout];
            [v62 addObject:v70];
          }
          uint64_t v64 = [v63 countByEnumeratingWithState:&v656 objects:v755 count:16];
        }
        while (v64);
      }

      id v71 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        id v72 = (objc_class *)objc_opt_class();
        NSStringFromClass(v72);
        id v73 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v74 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v75 = [v62 count];
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v73;
        __int16 v727 = 2112;
        id v728 = v74;
        __int16 v729 = 2048;
        unint64_t v730 = v609;
        __int16 v731 = 2048;
        uint64_t v732 = v75;
        __int16 v733 = 2048;
        uint64_t v734 = v76;
        _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, "%@, %@, i, %lu, computedDistanceMatrixUUIDs count, %lu, footprint, %.4f MB", buf, 0x34u);
      }
      id v77 = (void *)v665[5];
      v665[5] = 0;

      v600 = 0;
      for (unint64_t j = v591; ; unint64_t j = v612 + 1)
      {
        unint64_t v612 = j;
        if (j >= [v611 count])
        {
LABEL_328:
          uint64_t v484 = [v611 objectAtIndexedSubscript:v609];
          v485 = [v586 objectForKeyedSubscript:v484];

          if (v485)
          {
            v486 = [v611 objectAtIndexedSubscript:v609];
            [v586 removeObjectForKey:v486];
          }
          if (v17 > (double)(unint64_t)kRTMaxTimeIntervalPerFunction
            && [(RTWorkoutRouteManager *)self isSchedulerTriggered])
          {
            v487 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v724 = v546;
            v725 = @"max time for function exceeded";
            uint64_t v488 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v725 forKeys:&v724 count:1];
            id v60 = [v487 errorWithDomain:v545 code:15 userInfo:v488];

            [v599 addObject:v60];
            v489 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v489, OS_LOG_TYPE_INFO))
            {
              uint64_t v490 = (objc_class *)objc_opt_class();
              NSStringFromClass(v490);
              id v491 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v492 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v491;
              __int16 v727 = 2112;
              id v728 = v492;
              __int16 v729 = 2048;
              unint64_t v730 = (unint64_t)v17;
              __int16 v731 = 2048;
              uint64_t v732 = kRTMaxTimeIntervalPerFunction;
              _os_log_impl(&dword_1D9BFA000, v489, OS_LOG_TYPE_INFO, "%@, %@, max time for function exceeded, current time taken by function, %lu, time threshold, %lu", buf, 0x2Au);
            }
            int v33 = 6;
LABEL_335:
          }
          else
          {
            int v33 = 0;
          }

          _Block_object_dispose(&v664, 8);
          id v28 = v600;
LABEL_338:

          double v14 = v611;
          if ((v33 | 8) != 8) {
            goto LABEL_340;
          }
          ++v609;
          uint64_t v19 = v591 + 1;
          goto LABEL_10;
        }
        context = (void *)MEMORY[0x1E016D870]();
        id v79 = v691;
        id v80 = (void *)v691[3];
        if (v80)
        {
          free(v80);
          id v79 = v691;
        }
        v79[3] = 0;
        id v81 = v683;
        uint64_t v82 = (void *)v683[3];
        if (v82)
        {
          free(v82);
          id v81 = v683;
        }
        v81[3] = 0;
        char v83 = v675;
        uint64_t v84 = (void *)v675[3];
        if (v84)
        {
          free(v84);
          char v83 = v675;
        }
        v83[3] = 0;
        id v85 = [MEMORY[0x1E4F1C9C8] date];
        [v85 timeIntervalSinceDate:v598];
        double v17 = v86;

        if (v17 <= (double)(unint64_t)kRTMaxTimeIntervalPerFunction
          || ![(RTWorkoutRouteManager *)self isSchedulerTriggered])
        {
          break;
        }
        int v87 = 17;
LABEL_96:
        if (v87 != 19 && v87) {
          goto LABEL_328;
        }
      }
      dispatch_semaphore_t v88 = [MEMORY[0x1E4F1C9C8] date];

      v602 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v89 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        uint64_t v90 = (objc_class *)objc_opt_class();
        NSStringFromClass(v90);
        id v91 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v92 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_time_t v93 = [v611 objectAtIndexedSubscript:v609];
        id v94 = [v611 objectAtIndexedSubscript:v612];
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v91;
        __int16 v727 = 2112;
        id v728 = v92;
        __int16 v729 = 2048;
        unint64_t v730 = v609;
        __int16 v731 = 2048;
        uint64_t v732 = v612;
        __int16 v733 = 2112;
        uint64_t v734 = (uint64_t)v93;
        __int16 v735 = 2112;
        uint64_t v736 = (uint64_t)v94;
        _os_log_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_INFO, "%@, %@, comparing i, %lu, j, %lu, workout UUID, %@, other workout UUID, %@,", buf, 0x3Eu);
      }
      id v95 = [v611 objectAtIndexedSubscript:v612];
      int v96 = [v62 containsObject:v95];

      if (v96)
      {
        double v97 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          __int16 v98 = (objc_class *)objc_opt_class();
          NSStringFromClass(v98);
          id v99 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v100 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v101 = [MEMORY[0x1E4F1C9C8] date];
          [v101 timeIntervalSinceDate:v602];
          uint64_t v103 = v102;
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = v99;
          __int16 v727 = 2112;
          id v728 = v100;
          __int16 v729 = 2048;
          unint64_t v730 = v609;
          __int16 v731 = 2048;
          uint64_t v732 = v612;
          __int16 v733 = 2048;
          uint64_t v734 = v103;
          __int16 v735 = 2048;
          uint64_t v736 = v104;
          _os_log_impl(&dword_1D9BFA000, v97, OS_LOG_TYPE_INFO, "%@, %@, workout exists, comparison skipped between i, %lu, j, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);
        }
        id v105 = [v611 objectAtIndexedSubscript:v612];
        [v62 removeObject:v105];

        id v106 = NSNumber;
        os_log_t log = [MEMORY[0x1E4F1C9C8] date];
        [log timeIntervalSinceDate:v88];
        id v107 = [v106 numberWithDouble:];
        id v108 = (id *)(v719 + 5);
        id obj = (id)v719[5];
        [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v107 distanceMatrixKey:1 error:&obj];
        objc_storeStrong(v108, obj);

        goto LABEL_94;
      }
      uint64_t v109 = [v611 objectAtIndexedSubscript:v612];
      int v110 = [v593 containsObject:v109];

      if (v110)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          uint64_t v111 = (objc_class *)objc_opt_class();
          NSStringFromClass(v111);
          id v112 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v113 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v114 = [v611 objectAtIndexedSubscript:v612];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v112;
          __int16 v727 = 2112;
          id v728 = v113;
          __int16 v729 = 2048;
          unint64_t v730 = v609;
          __int16 v731 = 2112;
          uint64_t v732 = (uint64_t)v114;
          _os_log_impl(&dword_1D9BFA000, log, OS_LOG_TYPE_INFO, "%@, %@, skip comparison for j, %lu, workout UUID, %@; j is marked as contained in small bounding box",
            buf,
            0x2Au);
        }
        goto LABEL_94;
      }
      if (v600)
      {
LABEL_72:
        uint64_t v115 = [v611 objectAtIndexedSubscript:v612];
        id v116 = (id *)(v719 + 5);
        id v652 = (id)v719[5];
        os_log_t log = [(RTWorkoutRouteManager *)self _getWorkoutFromWorkouts:v582 UUID:v115 error:&v652];
        objc_storeStrong(v116, v652);

        uint64_t v117 = (void *)v719[5];
        if (v117)
        {
          v719[5] = 0;

          id v118 = (id *)(v719 + 5);
          id v651 = (id)v719[5];
          [(RTWorkoutRouteManager *)self _refreshWorkoutsCache:v582 workoutUUIDs:v611 startingIndex:v612 error:&v651];
          objc_storeStrong(v118, v651);
          if (v599 && v719[5])
          {
            id v119 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            {
              uint64_t v190 = (objc_class *)objc_opt_class();
              NSStringFromClass(v190);
              id v191 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v192 = (id)objc_claimAutoreleasedReturnValue();
              unint64_t v193 = v719[5];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v191;
              __int16 v727 = 2112;
              id v728 = v192;
              __int16 v729 = 2112;
              unint64_t v730 = v193;
              _os_log_error_impl(&dword_1D9BFA000, v119, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
            }
            [v599 addObject:v719[5]];
            uint64_t v120 = (void *)v719[5];
            v719[5] = 0;
            int v87 = 19;
            goto LABEL_132;
          }
          v123 = [v611 objectAtIndexedSubscript:v612];
          double v124 = (id *)(v719 + 5);
          id v650 = (id)v719[5];
          uint64_t v125 = [(RTWorkoutRouteManager *)self _getWorkoutFromWorkouts:v582 UUID:v123 error:&v650];
          objc_storeStrong(v124, v650);

          if (v599 && v719[5])
          {
            id v126 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            {
              uint64_t v202 = (objc_class *)objc_opt_class();
              NSStringFromClass(v202);
              id v203 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v204 = (id)objc_claimAutoreleasedReturnValue();
              unint64_t v205 = v719[5];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v203;
              __int16 v727 = 2112;
              id v728 = v204;
              __int16 v729 = 2112;
              unint64_t v730 = v205;
              _os_log_error_impl(&dword_1D9BFA000, v126, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
            }
            [v599 addObject:v719[5]];
            uint64_t v120 = (void *)v719[5];
            v719[5] = 0;
            int v87 = 19;
            os_log_t log = (os_log_t)v125;
            goto LABEL_132;
          }
          os_log_t log = (os_log_t)v125;
        }
        [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v600];
        [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:log];
        v687[3] = 0;
        v671[3] = 0;
        uint64_t v130 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
        {
          uint64_t v131 = (objc_class *)objc_opt_class();
          NSStringFromClass(v131);
          id v567 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v579 = (id)objc_claimAutoreleasedReturnValue();
          v551 = [v600 UUID];
          [objc_opt_class() stringFromWorkoutActivityType:-[NSObject workoutActivityType](v600, "workoutActivityType")];
          id v563 = (id)objc_claimAutoreleasedReturnValue();
          v560 = [v600 startDate];
          id v571 = [v560 stringFromDate];
          v557 = [v600 sourceRevision];
          v554 = [v557 source];
          v548 = [v554 name];
          uint64_t v132 = [log UUID];
          [objc_opt_class() stringFromWorkoutActivityType:-[NSObject workoutActivityType](log, "workoutActivityType")];
          id v133 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v134 = [log startDate];
          id v135 = [v134 stringFromDate];
          double v136 = [log sourceRevision];
          uint64_t v137 = [v136 source];
          uint64_t v138 = [v137 name];
          *(_DWORD *)buf = 138414594;
          *(void *)&uint8_t buf[4] = v567;
          __int16 v727 = 2112;
          id v728 = v579;
          __int16 v729 = 2112;
          unint64_t v730 = (unint64_t)v551;
          __int16 v731 = 2112;
          uint64_t v732 = (uint64_t)v563;
          __int16 v733 = 2112;
          uint64_t v734 = (uint64_t)v571;
          __int16 v735 = 2112;
          uint64_t v736 = (uint64_t)v548;
          __int16 v737 = 2112;
          uint64_t v738 = (uint64_t)v132;
          __int16 v739 = 2112;
          uint64_t v740 = (uint64_t)v133;
          __int16 v741 = 2112;
          uint64_t v742 = (uint64_t)v135;
          __int16 v743 = 2112;
          uint64_t v744 = (uint64_t)v138;
          _os_log_impl(&dword_1D9BFA000, v130, OS_LOG_TYPE_INFO, "%@, %@, workout UUID, %@, activityType, %@, startDate, %@, source, %@, other workout UUID, %@, other activityType, %@, other startDate, %@, other source, %@,", buf, 0x66u);
        }
        if ([(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v600]) {
          BOOL v572 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:log];
        }
        else {
          BOOL v572 = 0;
        }
        v580 = objc_opt_new();
        id v139 = [MEMORY[0x1E4F1C9C8] date];

        double v140 = (id *)(v719 + 5);
        id v649 = (id)v719[5];
        BOOL v141 = [(RTWorkoutRouteManager *)self _isPreFilteredForWorkout:v600 otherWorkout:log preFilteringResults:v580 error:&v649];
        objc_storeStrong(v140, v649);
        if (v599 && v719[5])
        {
          id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
          {
            id v194 = (objc_class *)objc_opt_class();
            NSStringFromClass(v194);
            id v195 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v196 = (id)objc_claimAutoreleasedReturnValue();
            unint64_t v197 = v719[5];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v195;
            __int16 v727 = 2112;
            id v728 = v196;
            __int16 v729 = 2112;
            unint64_t v730 = v197;
            _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
          }
LABEL_115:

          [v599 addObject:v719[5]];
          long long v147 = v719[5];
          v719[5] = 0;
LABEL_116:
          int v87 = 19;
LABEL_131:

          dispatch_semaphore_t v88 = v139;
          uint64_t v120 = v580;
LABEL_132:

          goto LABEL_95;
        }
        if (v141)
        {
          id v143 = NSNumber;
          id v144 = [MEMORY[0x1E4F1C9C8] date];
          [v144 timeIntervalSinceDate:v139];
          id v145 = [v143 numberWithDouble:];
          id v146 = (id *)(v719 + 5);
          id v648 = (id)v719[5];
          [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v145 distanceMatrixKey:2 error:&v648];
          objc_storeStrong(v146, v648);

          if (!v599 || !v719[5])
          {
            long long v147 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
            {
              __int16 v171 = (objc_class *)objc_opt_class();
              NSStringFromClass(v171);
              id v172 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v173 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v174 = [MEMORY[0x1E4F1C9C8] date];
              [v174 timeIntervalSinceDate:v602];
              uint64_t v176 = v175;
              +[RTRuntime footprint];
              *(_DWORD *)buf = 138413570;
              *(void *)&uint8_t buf[4] = v172;
              __int16 v727 = 2112;
              id v728 = v173;
              __int16 v729 = 2048;
              unint64_t v730 = v609;
              __int16 v731 = 2048;
              uint64_t v732 = v612;
              __int16 v733 = 2048;
              uint64_t v734 = v176;
              __int16 v735 = 2048;
              uint64_t v736 = v177;
              _os_log_impl(&dword_1D9BFA000, v147, OS_LOG_TYPE_INFO, "%@, %@, comparison done between i, %lu, j, %lu, breaking the inner loop after prefiltered by metadata, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);
            }
            int v87 = 17;
            goto LABEL_131;
          }
          id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
          {
            uint64_t v227 = (objc_class *)objc_opt_class();
            NSStringFromClass(v227);
            id v228 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v229 = (id)objc_claimAutoreleasedReturnValue();
            unint64_t v230 = v719[5];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v228;
            __int16 v727 = 2112;
            id v728 = v229;
            __int16 v729 = 2112;
            unint64_t v730 = v230;
            _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
          }
          goto LABEL_115;
        }
        int v148 = [v611 objectAtIndexedSubscript:v612];
        id v149 = [v586 objectForKeyedSubscript:v148];
        BOOL v150 = v149 == 0;

        if (v150)
        {
          id v151 = objc_opt_new();
          id v152 = [v611 objectAtIndexedSubscript:v612];
          [v586 setObject:v151 forKeyedSubscript:v152];
        }
        v568 = [MEMORY[0x1E4F1C9C8] date];

        if (!v699[3])
        {
          int v153 = [v611 objectAtIndexedSubscript:v609];
          long long v154 = [v586 objectForKeyedSubscript:v153];
          long long v155 = [v154 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];
          BOOL v156 = v155 == 0;

          if (v156)
          {
            v647[0] = MEMORY[0x1E4F143A8];
            v647[1] = 3221225472;
            v647[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_187;
            v647[3] = &unk_1E6B9B0C0;
            v647[4] = &v698;
            v647[5] = &v694;
            v647[6] = &v718;
            [(RTWorkoutRouteManager *)self _getLocationsForWorkout:v600 decimationLevel:3 limit:1 handler:v647];
            if (v599)
            {
              if (v719[5])
              {
                id v170 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
                {
                  v399 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v399);
                  id v400 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v401 = (id)objc_claimAutoreleasedReturnValue();
                  unint64_t v402 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v400;
                  __int16 v727 = 2112;
                  id v728 = v401;
                  __int16 v729 = 2112;
                  unint64_t v730 = v402;
                  _os_log_error_impl(&dword_1D9BFA000, v170, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                }
LABEL_127:

                [v599 addObject:v719[5]];
                long long v147 = v719[5];
                v719[5] = 0;
                int v87 = 19;
                id v139 = v568;
                goto LABEL_131;
              }
            }
          }
        }
        if (!v675[3])
        {
          long long v157 = [v611 objectAtIndexedSubscript:v612];
          v158 = [v586 objectForKeyedSubscript:v157];
          id v159 = [v158 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];
          BOOL v160 = v159 == 0;

          if (v160)
          {
            v646[0] = MEMORY[0x1E4F143A8];
            v646[1] = 3221225472;
            v646[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_189;
            v646[3] = &unk_1E6B9B0C0;
            v646[4] = &v674;
            v646[5] = &v670;
            v646[6] = &v718;
            [(RTWorkoutRouteManager *)self _getLocationsForWorkout:log decimationLevel:3 limit:1 handler:v646];
            if (v599)
            {
              if (v719[5])
              {
                id v170 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v403 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v403);
                  id v404 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v405 = (id)objc_claimAutoreleasedReturnValue();
                  unint64_t v406 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v404;
                  __int16 v727 = 2112;
                  id v728 = v405;
                  __int16 v729 = 2112;
                  unint64_t v730 = v406;
                  _os_log_error_impl(&dword_1D9BFA000, v170, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                }
                goto LABEL_127;
              }
            }
          }
        }
        uint64_t v161 = v699[3];
        uint64_t v162 = v695[3];
        id v163 = [v611 objectAtIndexedSubscript:v609];
        uint64_t v164 = [v586 objectForKeyedSubscript:v163];
        uint64_t v165 = v675[3];
        uint64_t v166 = v671[3];
        id v167 = [v611 objectAtIndexedSubscript:v612];
        uint64_t v168 = [v586 objectForKeyedSubscript:v167];
        __int16 v169 = (id *)(v719 + 5);
        id v645 = (id)v719[5];
        BOOL v564 = [(RTWorkoutRouteManager *)self _isPreFilteredForWorkout:v600 firstFewLocations:v161 firstFewLocationsCount:v162 cachedDictionary:v164 otherWorkout:log firstFewOtherLocations:v165 firstFewOtherLocationsCount:v166 cachedOtherDictionary:v168 preFilteringResults:v580 error:&v645];
        objc_storeStrong(v169, v645);

        if (v599 && v719[5])
        {
          id v170 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
          {
            dispatch_time_t v357 = (objc_class *)objc_opt_class();
            NSStringFromClass(v357);
            id v358 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v359 = (id)objc_claimAutoreleasedReturnValue();
            unint64_t v360 = v719[5];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v358;
            __int16 v727 = 2112;
            id v728 = v359;
            __int16 v729 = 2112;
            unint64_t v730 = v360;
            _os_log_error_impl(&dword_1D9BFA000, v170, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
          }
          goto LABEL_127;
        }
        uint64_t v178 = v675;
        uint64_t v179 = (void *)v675[3];
        if (v179)
        {
          free(v179);
          uint64_t v178 = v675;
        }
        v178[3] = 0;
        if (v564)
        {
          uint64_t v180 = NSNumber;
          id v181 = [MEMORY[0x1E4F1C9C8] date];
          [v181 timeIntervalSinceDate:v568];
          uint64_t v182 = [v180 numberWithDouble:x0];
          uint64_t v183 = (void **)(v719 + 5);
          v644 = (void *)v719[5];
          [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v182 distanceMatrixKey:3 error:&v644];
          uint64_t v184 = v644;
        }
        else
        {
          id v139 = [MEMORY[0x1E4F1C9C8] date];

          if (!v715[3])
          {
            double v185 = [v611 objectAtIndexedSubscript:v609];
            v186 = [v586 objectForKeyedSubscript:v185];
            BOOL v187 = (unint64_t)[v186 count] < 2;

            if (v187)
            {
              BOOL v188 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v600];
              v643[0] = MEMORY[0x1E4F143A8];
              if (v188) {
                uint64_t v189 = 1;
              }
              else {
                uint64_t v189 = 3;
              }
              v643[1] = 3221225472;
              v643[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_190;
              v643[3] = &unk_1E6B9B0C0;
              v643[4] = &v714;
              v643[5] = &v710;
              v643[6] = &v718;
              [(RTWorkoutRouteManager *)self _getLocationsForWorkout:v600 decimationLevel:v189 limit:0 handler:v643];
              if (v599 && v719[5])
              {
                id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                {
                  long long v440 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v440);
                  id v441 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v442 = (id)objc_claimAutoreleasedReturnValue();
                  unint64_t v443 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v441;
                  __int16 v727 = 2112;
                  id v728 = v442;
                  __int16 v729 = 2112;
                  unint64_t v730 = v443;
                  _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                }
                goto LABEL_115;
              }
              v642[0] = MEMORY[0x1E4F143A8];
              v642[1] = 3221225472;
              v642[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_191;
              v642[3] = &unk_1E6B9B0C0;
              v642[4] = &v706;
              v642[5] = &v702;
              v642[6] = &v718;
              [(RTWorkoutRouteManager *)self _getLocationsForWorkout:v600 decimationLevel:2 limit:0 handler:v642];
              if (v599 && v719[5])
              {
                id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                {
                  id v452 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v452);
                  id v453 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v454 = (id)objc_claimAutoreleasedReturnValue();
                  unint64_t v455 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v453;
                  __int16 v727 = 2112;
                  id v728 = v454;
                  __int16 v729 = 2112;
                  unint64_t v730 = v455;
                  _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                }
                goto LABEL_115;
              }
            }
          }
          uint64_t v210 = [v611 objectAtIndexedSubscript:v609];
          uint64_t v211 = [v586 objectForKeyedSubscript:v210];
          BOOL v212 = (unint64_t)[v211 count] < 2;

          if (v212)
          {
            uint64_t v213 = v715[3];
            uint64_t v214 = v711[3];
            uint64_t v215 = v707[3];
            uint64_t v216 = v703[3];
            id v217 = [v611 objectAtIndexedSubscript:v609];
            v218 = [v586 objectForKeyedSubscript:v217];
            uint64_t v219 = (id *)(v719 + 5);
            id v641 = (id)v719[5];
            [(RTWorkoutRouteManager *)self _preComputeCacheForWorkout:v600 locations:v213 locationsCount:v214 decimatedLocations:v215 decimatedLocationsCount:v216 cachedDictionary:v218 error:&v641];
            objc_storeStrong(v219, v641);

            if (v599 && v719[5])
            {
              id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
              {
                v411 = (objc_class *)objc_opt_class();
                NSStringFromClass(v411);
                id v412 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v413 = (id)objc_claimAutoreleasedReturnValue();
                unint64_t v414 = v719[5];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v412;
                __int16 v727 = 2112;
                id v728 = v413;
                __int16 v729 = 2112;
                unint64_t v730 = v414;
                _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
              }
              goto LABEL_115;
            }
            id v220 = v707;
            id v221 = (void *)v707[3];
            if (v221)
            {
              free(v221);
              id v220 = v707;
            }
            v220[3] = 0;
            v703[3] = 0;
          }
          if (!v691[3])
          {
            v222 = [v611 objectAtIndexedSubscript:v612];
            uint64_t v223 = [v586 objectForKeyedSubscript:v222];
            BOOL v224 = (unint64_t)[v223 count] < 2;

            if (v224)
            {
              BOOL v225 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:log];
              v640[0] = MEMORY[0x1E4F143A8];
              if (v225) {
                uint64_t v226 = 1;
              }
              else {
                uint64_t v226 = 3;
              }
              v640[1] = 3221225472;
              v640[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_192;
              v640[3] = &unk_1E6B9B0C0;
              v640[4] = &v690;
              v640[5] = &v686;
              v640[6] = &v718;
              [(RTWorkoutRouteManager *)self _getLocationsForWorkout:log decimationLevel:v226 limit:0 handler:v640];
              if (v599 && v719[5])
              {
                id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                {
                  v444 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v444);
                  id v445 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v446 = (id)objc_claimAutoreleasedReturnValue();
                  unint64_t v447 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v445;
                  __int16 v727 = 2112;
                  id v728 = v446;
                  __int16 v729 = 2112;
                  unint64_t v730 = v447;
                  _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                }
                goto LABEL_115;
              }
              v639[0] = MEMORY[0x1E4F143A8];
              v639[1] = 3221225472;
              v639[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_193;
              v639[3] = &unk_1E6B9B0C0;
              v639[4] = &v682;
              v639[5] = &v678;
              v639[6] = &v718;
              [(RTWorkoutRouteManager *)self _getLocationsForWorkout:log decimationLevel:2 limit:0 handler:v639];
              if (v599 && v719[5])
              {
                id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                {
                  id v456 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v456);
                  id v457 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v458 = (id)objc_claimAutoreleasedReturnValue();
                  unint64_t v459 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v457;
                  __int16 v727 = 2112;
                  id v728 = v458;
                  __int16 v729 = 2112;
                  unint64_t v730 = v459;
                  _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                }
                goto LABEL_115;
              }
            }
          }
          uint64_t v231 = [v611 objectAtIndexedSubscript:v612];
          v232 = [v586 objectForKeyedSubscript:v231];
          BOOL v233 = (unint64_t)[v232 count] < 2;

          if (v233)
          {
            uint64_t v234 = v691[3];
            uint64_t v235 = v687[3];
            uint64_t v236 = v683[3];
            uint64_t v237 = v679[3];
            uint64_t v238 = [v611 objectAtIndexedSubscript:v612];
            uint64_t v239 = [v586 objectForKeyedSubscript:v238];
            v240 = (id *)(v719 + 5);
            id v638 = (id)v719[5];
            [(RTWorkoutRouteManager *)self _preComputeCacheForWorkout:log locations:v234 locationsCount:v235 decimatedLocations:v236 decimatedLocationsCount:v237 cachedDictionary:v239 error:&v638];
            objc_storeStrong(v240, v638);

            if (v599 && v719[5])
            {
              id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
              {
                id v425 = (objc_class *)objc_opt_class();
                NSStringFromClass(v425);
                id v426 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v427 = (id)objc_claimAutoreleasedReturnValue();
                unint64_t v428 = v719[5];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v426;
                __int16 v727 = 2112;
                id v728 = v427;
                __int16 v729 = 2112;
                unint64_t v730 = v428;
                _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
              }
              goto LABEL_115;
            }
            v241 = v683;
            id v242 = (void *)v683[3];
            if (v242)
            {
              free(v242);
              v241 = v683;
            }
            v241[3] = 0;
            v679[3] = 0;
          }
          uint64_t v243 = NSNumber;
          id v181 = [MEMORY[0x1E4F1C9C8] date];
          [v181 timeIntervalSinceDate:v139];
          uint64_t v182 = [v243 numberWithDouble:];
          uint64_t v183 = (void **)(v719 + 5);
          v637 = (void *)v719[5];
          [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v182 distanceMatrixKey:5 error:&v637];
          uint64_t v184 = v637;
          v568 = v139;
        }
        id v244 = v184;
        id v245 = *v183;
        *uint64_t v183 = v244;

        id v139 = [MEMORY[0x1E4F1C9C8] date];

        if (!v564)
        {
          v246 = [v611 objectAtIndexedSubscript:v609];
          uint64_t v247 = [v586 objectForKeyedSubscript:v246];
          uint64_t v248 = [v611 objectAtIndexedSubscript:v612];
          uint64_t v249 = [v586 objectForKeyedSubscript:v248];
          uint64_t v250 = (id *)(v719 + 5);
          id v636 = (id)v719[5];
          BOOL v251 = [(RTWorkoutRouteManager *)self _isPreFilteredLocationCountBasedForWorkout:v600 cachedDictionary:v247 otherWorkout:log cachedOtherDictionary:v249 preFilteringResults:v580 error:&v636];
          objc_storeStrong(v250, v636);

          if (v599 && v719[5])
          {
            id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
            {
              id v391 = (objc_class *)objc_opt_class();
              NSStringFromClass(v391);
              id v392 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v393 = (id)objc_claimAutoreleasedReturnValue();
              unint64_t v394 = v719[5];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v392;
              __int16 v727 = 2112;
              id v728 = v393;
              __int16 v729 = 2112;
              unint64_t v730 = v394;
              _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
            }
            goto LABEL_115;
          }
          if (!v251)
          {
            char v258 = 0;
LABEL_207:
            id v259 = [MEMORY[0x1E4F1C9C8] date];

            if ((v258 & 1) == 0)
            {
              id v260 = [v611 objectAtIndexedSubscript:v609];
              id v261 = [v586 objectForKeyedSubscript:v260];
              BOOL v262 = [v611 objectAtIndexedSubscript:v612];
              id v263 = [v586 objectForKeyedSubscript:v262];
              id v264 = (id *)(v719 + 5);
              id v634 = (id)v719[5];
              BOOL v265 = [(RTWorkoutRouteManager *)self _isPreFilteredLastLocationBasedForWorkout:v600 cachedDictionary:v261 otherWorkout:log cachedOtherDictionary:v263 preFilteringResults:v580 error:&v634];
              objc_storeStrong(v264, v634);

              if (v599 && v719[5])
              {
                long long v266 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v395 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v395);
                  id v396 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v397 = (id)objc_claimAutoreleasedReturnValue();
                  unint64_t v398 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v396;
                  __int16 v727 = 2112;
                  id v728 = v397;
                  __int16 v729 = 2112;
                  unint64_t v730 = v398;
                  _os_log_error_impl(&dword_1D9BFA000, v266, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                }
                [v599 addObject:v719[5]];
                long long v147 = v719[5];
                v719[5] = 0;
                int v87 = 19;
                id v139 = v259;
                goto LABEL_131;
              }
              if (!v265)
              {
                char v273 = 0;
LABEL_218:
                id v139 = [MEMORY[0x1E4F1C9C8] date];

                if ((v273 & 1) == 0)
                {
                  id v274 = [v611 objectAtIndexedSubscript:v609];
                  double v275 = [v586 objectForKeyedSubscript:v274];
                  double v276 = [v611 objectAtIndexedSubscript:v612];
                  uint64_t v277 = [v586 objectForKeyedSubscript:v276];
                  long long v278 = (id *)(v719 + 5);
                  id v632 = (id)v719[5];
                  BOOL v279 = [(RTWorkoutRouteManager *)self _isPreFilteredCentroidBasedForWorkout:v600 cachedDictionary:v275 otherWorkout:log cachedOtherDictionary:v277 preFilteringResults:v580 error:&v632];
                  objc_storeStrong(v278, v632);

                  if (v599 && v719[5])
                  {
                    id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                    {
                      v407 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v407);
                      id v408 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      id v409 = (id)objc_claimAutoreleasedReturnValue();
                      unint64_t v410 = v719[5];
                      *(_DWORD *)buf = 138412802;
                      *(void *)&uint8_t buf[4] = v408;
                      __int16 v727 = 2112;
                      id v728 = v409;
                      __int16 v729 = 2112;
                      unint64_t v730 = v410;
                      _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                    }
                    goto LABEL_115;
                  }
                  if (!v279)
                  {
                    char v286 = 0;
LABEL_229:
                    id v287 = [MEMORY[0x1E4F1C9C8] date];

                    if ((v286 & 1) == 0)
                    {
                      id v288 = [v611 objectAtIndexedSubscript:v609];
                      id v289 = [v586 objectForKeyedSubscript:v288];
                      id v290 = [v611 objectAtIndexedSubscript:v612];
                      __int16 v291 = [v586 objectForKeyedSubscript:v290];
                      id v292 = (id *)(v719 + 5);
                      id v630 = (id)v719[5];
                      BOOL v293 = [(RTWorkoutRouteManager *)self _isPreFilteredIOUBasedForWorkout:v600 cachedDictionary:v289 otherWorkout:log cachedOtherDictionary:v291 preFilteringResults:v580 error:&v630];
                      objc_storeStrong(v292, v630);

                      if (v599 && v719[5])
                      {
                        uint64_t v294 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                        if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                        {
                          v415 = (objc_class *)objc_opt_class();
                          NSStringFromClass(v415);
                          id v416 = (id)objc_claimAutoreleasedReturnValue();
                          NSStringFromSelector(a2);
                          id v417 = (id)objc_claimAutoreleasedReturnValue();
                          unint64_t v418 = v719[5];
                          *(_DWORD *)buf = 138412802;
                          *(void *)&uint8_t buf[4] = v416;
                          __int16 v727 = 2112;
                          id v728 = v417;
                          __int16 v729 = 2112;
                          unint64_t v730 = v418;
                          _os_log_error_impl(&dword_1D9BFA000, v294, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                        }
LABEL_293:

                        [v599 addObject:v719[5]];
                        long long v147 = v719[5];
                        v719[5] = 0;
                        int v87 = 19;
                        id v139 = v287;
                        goto LABEL_131;
                      }
                      if (v293)
                      {
                        __int16 v295 = NSNumber;
                        uint64_t v296 = [MEMORY[0x1E4F1C9C8] date];
                        [v296 timeIntervalSinceDate:v287];
                        __int16 v297 = [v295 numberWithDouble:];
                        double v298 = (id *)(v719 + 5);
                        id v629 = (id)v719[5];
                        [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v297 distanceMatrixKey:8 error:&v629];
                        objc_storeStrong(v298, v629);
                      }
                      else
                      {
                        uint64_t v325 = [v611 objectAtIndexedSubscript:v609];
                        uint64_t v326 = [v586 objectForKeyedSubscript:v325];
                        uint64_t v327 = (id *)(v719 + 5);
                        id v628 = (id)v719[5];
                        BOOL v328 = [(RTWorkoutRouteManager *)self _isPreFilteredRunningTrackBasedForWorkout:v600 cachedDictionary:v326 error:&v628];
                        objc_storeStrong(v327, v628);

                        if (v599 && v719[5])
                        {
                          uint64_t v294 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                          if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                          {
                            id v448 = (objc_class *)objc_opt_class();
                            NSStringFromClass(v448);
                            id v449 = (id)objc_claimAutoreleasedReturnValue();
                            NSStringFromSelector(a2);
                            id v450 = (id)objc_claimAutoreleasedReturnValue();
                            unint64_t v451 = v719[5];
                            *(_DWORD *)buf = 138412802;
                            *(void *)&uint8_t buf[4] = v449;
                            __int16 v727 = 2112;
                            id v728 = v450;
                            __int16 v729 = 2112;
                            unint64_t v730 = v451;
                            _os_log_error_impl(&dword_1D9BFA000, v294, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                          }
                          goto LABEL_293;
                        }
                        if (v328)
                        {
                          v361 = [v600 UUID];
                          char v362 = [v593 containsObject:v361];

                          if ((v362 & 1) == 0)
                          {
                            v363 = [v600 UUID];
                            [v593 addObject:v363];
                          }
                        }
                        else
                        {
                          v368 = [v611 objectAtIndexedSubscript:v612];
                          v369 = [v586 objectForKeyedSubscript:v368];
                          id v370 = (id *)(v719 + 5);
                          id v627 = (id)v719[5];
                          BOOL v371 = [(RTWorkoutRouteManager *)self _isPreFilteredRunningTrackBasedForWorkout:log cachedDictionary:v369 error:&v627];
                          objc_storeStrong(v370, v627);

                          if (v599 && v719[5])
                          {
                            uint64_t v294 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                            if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                            {
                              uint64_t v468 = (objc_class *)objc_opt_class();
                              NSStringFromClass(v468);
                              id v469 = (id)objc_claimAutoreleasedReturnValue();
                              NSStringFromSelector(a2);
                              id v470 = (id)objc_claimAutoreleasedReturnValue();
                              unint64_t v471 = v719[5];
                              *(_DWORD *)buf = 138412802;
                              *(void *)&uint8_t buf[4] = v469;
                              __int16 v727 = 2112;
                              id v728 = v470;
                              __int16 v729 = 2112;
                              unint64_t v730 = v471;
                              _os_log_error_impl(&dword_1D9BFA000, v294, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                            }
                            goto LABEL_293;
                          }
                          if (!v371)
                          {
                            char v301 = 0;
LABEL_241:
                            id v139 = [MEMORY[0x1E4F1C9C8] date];

                            if (v301)
                            {
LABEL_253:
                              long long v147 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
                              {
                                v314 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v314);
                                id v315 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                id v316 = (id)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138412546;
                                *(void *)&uint8_t buf[4] = v315;
                                __int16 v727 = 2112;
                                id v728 = v316;
                                _os_log_impl(&dword_1D9BFA000, v147, OS_LOG_TYPE_INFO, "%@, %@, final pre-filtered, YES", buf, 0x16u);
                              }
                              double v317 = v18;
                              goto LABEL_256;
                            }
                            uint64_t v302 = [v611 objectAtIndexedSubscript:v609];
                            __int16 v303 = [v586 objectForKeyedSubscript:v302];
                            uint64_t v304 = [v611 objectAtIndexedSubscript:v612];
                            __int16 v305 = [v586 objectForKeyedSubscript:v304];
                            double v306 = (id *)(v719 + 5);
                            id v626 = (id)v719[5];
                            BOOL v307 = [(RTWorkoutRouteManager *)self _isPreFilteredCurveOrientationBasedForWorkout:v600 cachedDictionary:v303 otherWorkout:log cachedOtherDictionary:v305 error:&v626];
                            objc_storeStrong(v306, v626);

                            if (v599 && v719[5])
                            {
                              id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                              {
                                id v429 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v429);
                                id v430 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                id v431 = (id)objc_claimAutoreleasedReturnValue();
                                unint64_t v432 = v719[5];
                                *(_DWORD *)buf = 138412802;
                                *(void *)&uint8_t buf[4] = v430;
                                __int16 v727 = 2112;
                                id v728 = v431;
                                __int16 v729 = 2112;
                                unint64_t v730 = v432;
                                _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                              }
                              goto LABEL_115;
                            }
                            if (v307)
                            {
                              uint64_t v308 = NSNumber;
                              __int16 v309 = [MEMORY[0x1E4F1C9C8] date];
                              [v309 timeIntervalSinceDate:v139];
                              double v310 = [v308 numberWithDouble:];
                              __int16 v311 = (id *)(v719 + 5);
                              id v625 = (id)v719[5];
                              [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v310 distanceMatrixKey:13 error:&v625];
                              objc_storeStrong(v311, v625);

                              unint64_t v312 = v691;
                              __int16 v313 = (void *)v691[3];
                              if (v313)
                              {
                                free(v313);
                                unint64_t v312 = v691;
                              }
                              v312[3] = 0;
                              v687[3] = 0;
                              goto LABEL_253;
                            }
                            v350 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                            if (os_log_type_enabled(v350, OS_LOG_TYPE_INFO))
                            {
                              uint64_t v351 = (objc_class *)objc_opt_class();
                              NSStringFromClass(v351);
                              id v352 = (id)objc_claimAutoreleasedReturnValue();
                              NSStringFromSelector(a2);
                              id v353 = (id)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412546;
                              *(void *)&uint8_t buf[4] = v352;
                              __int16 v727 = 2112;
                              id v728 = v353;
                              _os_log_impl(&dword_1D9BFA000, v350, OS_LOG_TYPE_INFO, "%@, %@, final pre-filtered, NO", buf, 0x16u);
                            }
                            if (!v715[3])
                            {
                              BOOL v372 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v600];
                              v624[0] = MEMORY[0x1E4F143A8];
                              uint64_t v373 = v372 ? 1 : 3;
                              v624[1] = 3221225472;
                              v624[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_194;
                              v624[3] = &unk_1E6B9B0C0;
                              v624[4] = &v714;
                              v624[5] = &v710;
                              v624[6] = &v718;
                              [(RTWorkoutRouteManager *)self _getLocationsForWorkout:v600 decimationLevel:v373 limit:0 handler:v624];
                              if (v599)
                              {
                                if (v719[5])
                                {
                                  id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                  if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                                  {
                                    v472 = (objc_class *)objc_opt_class();
                                    NSStringFromClass(v472);
                                    id v473 = (id)objc_claimAutoreleasedReturnValue();
                                    NSStringFromSelector(a2);
                                    id v474 = (id)objc_claimAutoreleasedReturnValue();
                                    unint64_t v475 = v719[5];
                                    *(_DWORD *)buf = 138412802;
                                    *(void *)&uint8_t buf[4] = v473;
                                    __int16 v727 = 2112;
                                    id v728 = v474;
                                    __int16 v729 = 2112;
                                    unint64_t v730 = v475;
                                    _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                                  }
                                  goto LABEL_115;
                                }
                              }
                            }
                            if (!v691[3])
                            {
                              BOOL v374 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:log];
                              v623[0] = MEMORY[0x1E4F143A8];
                              uint64_t v375 = v374 ? 1 : 3;
                              v623[1] = 3221225472;
                              v623[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_195;
                              v623[3] = &unk_1E6B9B0C0;
                              v623[4] = &v690;
                              v623[5] = &v686;
                              v623[6] = &v718;
                              [(RTWorkoutRouteManager *)self _getLocationsForWorkout:log decimationLevel:v375 limit:0 handler:v623];
                              if (v599)
                              {
                                if (v719[5])
                                {
                                  id v142 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                  if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
                                  {
                                    v476 = (objc_class *)objc_opt_class();
                                    NSStringFromClass(v476);
                                    id v477 = (id)objc_claimAutoreleasedReturnValue();
                                    NSStringFromSelector(a2);
                                    id v478 = (id)objc_claimAutoreleasedReturnValue();
                                    unint64_t v479 = v719[5];
                                    *(_DWORD *)buf = 138412802;
                                    *(void *)&uint8_t buf[4] = v477;
                                    __int16 v727 = 2112;
                                    id v728 = v478;
                                    __int16 v729 = 2112;
                                    unint64_t v730 = v479;
                                    _os_log_error_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                                  }
                                  goto LABEL_115;
                                }
                              }
                            }
                            uint64_t v354 = [v600 workoutActivityType];
                            v355 = (id *)(v719 + 5);
                            id v622 = (id)v719[5];
                            long long v147 = [(RTWorkoutRouteManager *)self _getConstantValueForDistanceThresholdUsingDistanceMetric:v542 isDecimated:v572 workoutActivityType:v354 error:&v622];
                            objc_storeStrong(v355, v622);
                            if (v599 && v719[5])
                            {
                              v356 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              if (os_log_type_enabled(v356, OS_LOG_TYPE_ERROR))
                              {
                                id v460 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v460);
                                id v461 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                id v462 = (id)objc_claimAutoreleasedReturnValue();
                                unint64_t v463 = v719[5];
                                *(_DWORD *)buf = 138412802;
                                *(void *)&uint8_t buf[4] = v461;
                                __int16 v727 = 2112;
                                id v728 = v462;
                                __int16 v729 = 2112;
                                unint64_t v730 = v463;
                                _os_log_error_impl(&dword_1D9BFA000, v356, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                              }
LABEL_315:

                              [v599 addObject:v719[5]];
LABEL_316:
                              BOOL v387 = (void *)v719[5];
                              v719[5] = 0;

                              goto LABEL_116;
                            }
                            v364 = [MEMORY[0x1E4F1C9C8] date];

                            v365 = (id *)(v719 + 5);
                            id v621 = (id)v719[5];
                            [(RTWorkoutRouteManager *)self similarityDistanceUsingPreFilteringResults:v580 error:&v621];
                            double v317 = v366;
                            objc_storeStrong(v365, v621);
                            if (v599 && v719[5])
                            {
                              v367 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              if (os_log_type_enabled(v367, OS_LOG_TYPE_ERROR))
                              {
                                v464 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v464);
                                id v465 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                id v466 = (id)objc_claimAutoreleasedReturnValue();
                                unint64_t v467 = v719[5];
                                *(_DWORD *)buf = 138412802;
                                *(void *)&uint8_t buf[4] = v465;
                                __int16 v727 = 2112;
                                id v728 = v466;
                                __int16 v729 = 2112;
                                unint64_t v730 = v467;
                                _os_log_error_impl(&dword_1D9BFA000, v367, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                              }
                              [v599 addObject:v719[5]];
                              id v139 = v364;
                              goto LABEL_316;
                            }
                            uint64_t v376 = NSNumber;
                            if (v317 == v18)
                            {
                              v377 = [MEMORY[0x1E4F1C9C8] date];
                              [v377 timeIntervalSinceDate:v364];
                              v378 = [v376 numberWithDouble:x0];
                              v379 = (id *)(v719 + 5);
                              id v620 = (id)v719[5];
                              [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v378 distanceMatrixKey:10 error:&v620];
                              objc_storeStrong(v379, v620);

                              id v139 = [MEMORY[0x1E4F1C9C8] date];

                              id v380 = [(RTWorkoutRouteManager *)self distanceCalculator];
                              uint64_t v381 = v715[3];
                              uint64_t v382 = v711[3];
                              uint64_t v383 = v691[3];
                              uint64_t v384 = v687[3];
                              [v147 doubleValue];
                              uint64_t v385 = (id *)(v719 + 5);
                              id v619 = (id)v719[5];
                              [v380 distanceFromLocations:v381 countOfFromLocations:v382 toLocations:v383 countOfToLocations:v384 distanceMetric:v542 threshold:&v619];
                              double v317 = v386;
                              objc_storeStrong(v385, v619);

                              if (v599 && v719[5])
                              {
                                v356 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                if (os_log_type_enabled(v356, OS_LOG_TYPE_ERROR))
                                {
                                  v480 = (objc_class *)objc_opt_class();
                                  NSStringFromClass(v480);
                                  id v481 = (id)objc_claimAutoreleasedReturnValue();
                                  NSStringFromSelector(a2);
                                  id v482 = (id)objc_claimAutoreleasedReturnValue();
                                  unint64_t v483 = v719[5];
                                  *(_DWORD *)buf = 138412802;
                                  *(void *)&uint8_t buf[4] = v481;
                                  __int16 v727 = 2112;
                                  id v728 = v482;
                                  __int16 v729 = 2112;
                                  unint64_t v730 = v483;
                                  _os_log_error_impl(&dword_1D9BFA000, v356, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                                }
                                goto LABEL_315;
                              }
                              [v147 doubleValue];
                              v419 = NSNumber;
                              if (v317 <= v420)
                              {
                                v421 = [MEMORY[0x1E4F1C9C8] date];
                                [v421 timeIntervalSinceDate:v139];
                                v422 = [v419 numberWithDouble:];
                                v423 = (void **)(v719 + 5);
                                v617 = (void *)v719[5];
                                [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v422 distanceMatrixKey:11 error:&v617];
                                id v424 = v617;
                              }
                              else
                              {
                                v421 = [MEMORY[0x1E4F1C9C8] date];
                                [v421 timeIntervalSinceDate:v139];
                                v422 = [v419 numberWithDouble:];
                                v423 = (void **)(v719 + 5);
                                v618 = (void *)v719[5];
                                [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v422 distanceMatrixKey:9 error:&v618];
                                id v424 = v618;
                              }
                            }
                            else
                            {
                              v421 = [MEMORY[0x1E4F1C9C8] date];
                              [v421 timeIntervalSinceDate:v364];
                              v422 = [v376 numberWithDouble:];
                              v423 = (void **)(v719 + 5);
                              v616 = (void *)v719[5];
                              [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v422 distanceMatrixKey:12 error:&v616];
                              id v424 = v616;
                              id v139 = v364;
                            }
                            id v436 = v424;
                            id v437 = *v423;
                            *v423 = v436;

                            id v438 = v691;
                            long long v439 = (void *)v691[3];
                            if (v439)
                            {
                              free(v439);
                              id v438 = v691;
                            }
                            v438[3] = 0;
                            v687[3] = 0;
LABEL_256:

                            int v318 = [RTWorkoutDistance alloc];
                            v319 = [v600 UUID];
                            v320 = [log UUID];
                            uint64_t v321 = [objc_opt_class() RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:-[NSObject workoutActivityType](v600, "workoutActivityType")];
                            id v322 = [MEMORY[0x1E4F1C9C8] now];
                            LOBYTE(v538) = 0;
                            long long v147 = [(RTWorkoutDistance *)v318 initWithObjectID:0 firstWorkout:v319 secondWorkout:v320 distanceMetric:v542 workoutActivityType:v321 areBothWorkoutsDecimated:v572 distance:v317 isVisited:v538 date:v322];

                            [v543 addObject:v147];
                            if ((unint64_t)[v543 count] >= 0x64)
                            {
                              id v615 = 0;
                              [(RTWorkoutRouteManager *)self _storeWorkoutDistances:v543 error:&v615];
                              id v323 = v615;
                              [v543 removeAllObjects];
                              if (v599 && v323)
                              {
                                v324 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                if (os_log_type_enabled(v324, OS_LOG_TYPE_ERROR))
                                {
                                  long long v433 = (objc_class *)objc_opt_class();
                                  NSStringFromClass(v433);
                                  id v434 = (id)objc_claimAutoreleasedReturnValue();
                                  NSStringFromSelector(a2);
                                  id v435 = (id)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138412802;
                                  *(void *)&uint8_t buf[4] = v434;
                                  __int16 v727 = 2112;
                                  id v728 = v435;
                                  __int16 v729 = 2112;
                                  unint64_t v730 = (unint64_t)v323;
                                  _os_log_error_impl(&dword_1D9BFA000, v324, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
                                }
                                [v599 addObject:v323];

                                goto LABEL_116;
                              }
                            }
                            v329 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                            if (os_log_type_enabled(v329, OS_LOG_TYPE_INFO))
                            {
                              v539 = v147;
                              v540 = v139;
                              double v549 = v18;
                              BOOL v330 = (objc_class *)objc_opt_class();
                              NSStringFromClass(v330);
                              id v569 = (id)objc_claimAutoreleasedReturnValue();
                              NSStringFromSelector(a2);
                              id v573 = (id)objc_claimAutoreleasedReturnValue();
                              v555 = [v600 UUID];
                              v552 = [log UUID];
                              v565 = [(RTWorkoutRouteManager *)self healthKitManager];
                              v561 = [v565 _getTotalDistanceForWorkout:v600];
                              v558 = [MEMORY[0x1E4F2B618] meterUnit];
                              [v561 doubleValueForUnit:v558];
                              uint64_t v332 = v331;
                              id v333 = [(RTWorkoutRouteManager *)self healthKitManager];
                              [v333 _getDurationForWorkout:v600];
                              uint64_t v335 = v334;
                              uint64_t v336 = v711[3];
                              uint64_t v337 = [(RTWorkoutRouteManager *)self healthKitManager];
                              uint64_t v338 = [v337 _getTotalDistanceForWorkout:log];
                              uint64_t v339 = [MEMORY[0x1E4F2B618] meterUnit];
                              [v338 doubleValueForUnit:v339];
                              uint64_t v341 = v340;
                              id v342 = [(RTWorkoutRouteManager *)self healthKitManager];
                              [v342 _getDurationForWorkout:log];
                              uint64_t v344 = v343;
                              uint64_t v345 = v687[3];
                              v346 = [MEMORY[0x1E4F1C9C8] date];
                              [v346 timeIntervalSinceDate:v602];
                              id v348 = v347;
                              +[RTRuntime footprint];
                              *(_DWORD *)buf = 138415874;
                              *(void *)&uint8_t buf[4] = v569;
                              __int16 v727 = 2112;
                              id v728 = v573;
                              __int16 v729 = 2048;
                              unint64_t v730 = v609;
                              __int16 v731 = 2048;
                              uint64_t v732 = v612;
                              __int16 v733 = 2112;
                              uint64_t v734 = (uint64_t)v555;
                              __int16 v735 = 2112;
                              uint64_t v736 = (uint64_t)v552;
                              __int16 v737 = 2112;
                              uint64_t v738 = (uint64_t)v539;
                              __int16 v739 = 2048;
                              uint64_t v740 = v332;
                              __int16 v741 = 2048;
                              uint64_t v742 = v335;
                              __int16 v743 = 2048;
                              uint64_t v744 = v336;
                              long long v147 = v539;
                              __int16 v745 = 2048;
                              uint64_t v746 = v341;
                              __int16 v747 = 2048;
                              uint64_t v748 = v344;
                              __int16 v749 = 2048;
                              uint64_t v750 = v345;
                              __int16 v751 = 2048;
                              id v752 = v348;
                              __int16 v753 = 2048;
                              uint64_t v754 = v349;
                              _os_log_impl(&dword_1D9BFA000, v329, OS_LOG_TYPE_INFO, "%@, %@, comparison done between i, %lu, j, %lu, workout, %@, other workout, %@, workout distance record, %@, workout distance, %.3f meters, workout duration, %.3f sec, locations count, %lu, other workout distance, %.3f meters, other workout duration, %.3f sec, other locations count, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x98u);

                              double v18 = v549;
                              id v139 = v540;
                            }
                            [v580 removeAllObjects];
                            int v87 = 0;
                            goto LABEL_131;
                          }
                          v388 = [log UUID];
                          char v389 = [v593 containsObject:v388];

                          if ((v389 & 1) == 0)
                          {
                            id v390 = [log UUID];
                            [v593 addObject:v390];
                          }
                        }
                      }
                      __int16 v299 = v691;
                      uint64_t v300 = (void *)v691[3];
                      if (v300)
                      {
                        free(v300);
                        __int16 v299 = v691;
                      }
                      v299[3] = 0;
                      v687[3] = 0;
                    }
                    char v301 = 1;
                    goto LABEL_241;
                  }
                  id v280 = NSNumber;
                  id v281 = [MEMORY[0x1E4F1C9C8] date];
                  [v281 timeIntervalSinceDate:v139];
                  id v282 = [v280 numberWithDouble:];
                  uint64_t v283 = (id *)(v719 + 5);
                  id v631 = (id)v719[5];
                  [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v282 distanceMatrixKey:6 error:&v631];
                  objc_storeStrong(v283, v631);

                  long long v284 = v691;
                  uint64_t v285 = (void *)v691[3];
                  if (v285)
                  {
                    free(v285);
                    long long v284 = v691;
                  }
                  v284[3] = 0;
                  v687[3] = 0;
                }
                char v286 = 1;
                goto LABEL_229;
              }
              long long v267 = NSNumber;
              long long v268 = [MEMORY[0x1E4F1C9C8] date];
              [v268 timeIntervalSinceDate:v259];
              long long v269 = [v267 numberWithDouble:];
              id v270 = (id *)(v719 + 5);
              id v633 = (id)v719[5];
              [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v269 distanceMatrixKey:4 error:&v633];
              objc_storeStrong(v270, v633);

              id v271 = v691;
              id v272 = (void *)v691[3];
              if (v272)
              {
                free(v272);
                id v271 = v691;
              }
              v271[3] = 0;
              v687[3] = 0;
            }
            char v273 = 1;
            goto LABEL_218;
          }
          v252 = NSNumber;
          v253 = [MEMORY[0x1E4F1C9C8] date];
          [v253 timeIntervalSinceDate:v139];
          v254 = [v252 numberWithDouble:x0];
          v255 = (id *)(v719 + 5);
          id v635 = (id)v719[5];
          [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v254 distanceMatrixKey:7 error:&v635];
          objc_storeStrong(v255, v635);

          BOOL v256 = v691;
          id v257 = (void *)v691[3];
          if (v257)
          {
            free(v257);
            BOOL v256 = v691;
          }
          v256[3] = 0;
          v687[3] = 0;
        }
        char v258 = 1;
        goto LABEL_207;
      }
      double v121 = (id *)(v719 + 5);
      id v654 = (id)v719[5];
      [(RTWorkoutRouteManager *)self _refreshWorkoutsCache:v582 workoutUUIDs:v611 startingIndex:v609 error:&v654];
      objc_storeStrong(v121, v654);
      if (v599 && v719[5])
      {
        BOOL v122 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        {
          double v198 = (objc_class *)objc_opt_class();
          NSStringFromClass(v198);
          id v199 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v200 = NSStringFromSelector(a2);
          unint64_t v201 = v719[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v199;
          __int16 v727 = 2112;
          id v728 = v200;
          __int16 v729 = 2112;
          unint64_t v730 = v201;
          _os_log_error_impl(&dword_1D9BFA000, v122, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
        }
        [v599 addObject:v719[5]];
        v600 = 0;
      }
      else
      {
        char v127 = [v611 objectAtIndexedSubscript:v609];
        id v128 = (id *)(v719 + 5);
        id v653 = (id)v719[5];
        v600 = [(RTWorkoutRouteManager *)self _getWorkoutFromWorkouts:v582 UUID:v127 error:&v653];
        objc_storeStrong(v128, v653);

        if (!v599 || !v719[5]) {
          goto LABEL_72;
        }
        uint64_t v129 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          double v206 = (objc_class *)objc_opt_class();
          NSStringFromClass(v206);
          id v207 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v208 = NSStringFromSelector(a2);
          unint64_t v209 = v719[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v207;
          __int16 v727 = 2112;
          id v728 = v208;
          __int16 v729 = 2112;
          unint64_t v730 = v209;
          _os_log_error_impl(&dword_1D9BFA000, v129, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
        }
        [v599 addObject:v719[5]];
      }
      os_log_t log = (os_log_t)v719[5];
      v719[5] = 0;
LABEL_94:
      int v87 = 19;
LABEL_95:

      __int16 v15 = v88;
      goto LABEL_96;
    }
LABEL_340:

    uint64_t v500 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v500, OS_LOG_TYPE_INFO))
    {
      v576 = v500;
      v501 = (objc_class *)objc_opt_class();
      NSStringFromClass(v501);
      id v610 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v613 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v575 = [v611 count];
      uint64_t v574 = [v611 count];
      os_log_t loga = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      contexta = [loga objectForKeyedSubscript:@"distance_matrix_count_prefiltered_metadata"];
      uint64_t v570 = [contexta unsignedIntegerValue];
      v603 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v601 = [v603 objectForKeyedSubscript:@"distance_matrix_count_prefiltered_firstlocation"];
      uint64_t v566 = [v601 unsignedIntegerValue];
      dispatch_semaphore_t dsemaa = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v594 = [dsemaa objectForKeyedSubscript:@"distance_matrix_count_prefiltered_locationscount"];
      uint64_t v562 = [v594 unsignedIntegerValue];
      v592 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v590 = [v592 objectForKeyedSubscript:@"distance_matrix_count_prefiltered_lastlocation"];
      uint64_t v559 = [v590 unsignedIntegerValue];
      v588 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v587 = [v588 objectForKeyedSubscript:@"distance_matrix_count_prefiltered_centroid"];
      uint64_t v556 = [v587 unsignedIntegerValue];
      v585 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v583 = [v585 objectForKeyedSubscript:@"distance_matrix_count_prefiltered_iou"];
      uint64_t v553 = [v583 unsignedIntegerValue];
      v581 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v578 = [v581 objectForKeyedSubscript:@"distance_matrix_count_lessthan_orequal_quicksimilarity"];
      uint64_t v550 = [v578 unsignedIntegerValue];
      v577 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v502 = [v577 objectForKeyedSubscript:@"distance_matrix_count_exceeded_quicksimilarity"];
      uint64_t v547 = [v502 unsignedIntegerValue];
      uint64_t v503 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      v504 = [v503 objectForKeyedSubscript:@"distance_matrix_count_lessthan_orequal_dtw"];
      uint64_t v505 = [v504 unsignedIntegerValue];
      v506 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
      __int16 v507 = [v506 objectForKeyedSubscript:@"distance_matrix_count_exceeded_dtw"];
      uint64_t v508 = [v507 unsignedIntegerValue];
      __int16 v509 = _RTSafeArray();
      _RTMultiErrorCreate();
      id v510 = (id)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138415874;
      *(void *)&uint8_t buf[4] = v610;
      __int16 v727 = 2112;
      id v728 = v613;
      __int16 v729 = 2048;
      unint64_t v730 = (unint64_t)(v574 * (v575 - 1)) >> 1;
      __int16 v731 = 2048;
      uint64_t v732 = v570;
      __int16 v733 = 2048;
      uint64_t v734 = v566;
      __int16 v735 = 2048;
      uint64_t v736 = v562;
      __int16 v737 = 2048;
      uint64_t v738 = v559;
      __int16 v739 = 2048;
      uint64_t v740 = v556;
      __int16 v741 = 2048;
      uint64_t v742 = v553;
      __int16 v743 = 2048;
      uint64_t v744 = v550;
      __int16 v745 = 2048;
      uint64_t v746 = v547;
      __int16 v747 = 2048;
      uint64_t v748 = v505;
      __int16 v749 = 2048;
      uint64_t v750 = v508;
      __int16 v751 = 2112;
      id v752 = v510;
      __int16 v753 = 2048;
      uint64_t v754 = v511;
      uint64_t v500 = v576;
      _os_log_impl(&dword_1D9BFA000, v576, OS_LOG_TYPE_INFO, "%@, %@, summary statistics, total comparisons done, %lu, prefiltered by metadata, %lu, prefiltered by first location, %lu, prefiltered by locations count, %lu, prefiltered by last location, %lu, prefiltered by centroid, %lu, prefiltered by IOU, %lu, quick similarity, %lu, exceeded quick similarity, %lu, less than or equal to DTW threshold, %lu, exceeded DTW threshold, %lu, error, %@, footprint, %.4f MB", buf, 0x98u);
    }
    uint64_t v512 = NSNumber;
    __int16 v513 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    uint64_t v514 = [v513 objectForKeyedSubscript:@"distance_matrix_total_number_of_comparisons"];
    __int16 v515 = [v512 numberWithUnsignedInteger:objc_msgSend(v514, "unsignedIntegerValue")+ ((unint64_t)(objc_msgSend(v611, "count") * (objc_msgSend(v611, "count") - 1)) >> 1)];
    uint64_t v516 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v516 setObject:v515 forKeyedSubscript:@"distance_matrix_total_number_of_comparisons"];

    uint64_t v517 = v715;
    v518 = (void *)v715[3];
    if (v518)
    {
      free(v518);
      uint64_t v517 = v715;
    }
    v517[3] = 0;
    id v519 = v707;
    id v520 = (void *)v707[3];
    if (v520)
    {
      free(v520);
      id v519 = v707;
    }
    v519[3] = 0;
    v521 = v699;
    v522 = (void *)v699[3];
    if (v522)
    {
      free(v522);
      v521 = v699;
    }
    v521[3] = 0;
    v523 = v691;
    v524 = (void *)v691[3];
    if (v524)
    {
      free(v524);
      v523 = v691;
    }
    v523[3] = 0;
    v525 = v683;
    v526 = (void *)v683[3];
    if (v526)
    {
      free(v526);
      v525 = v683;
    }
    v525[3] = 0;
    v527 = v675;
    v528 = (void *)v675[3];
    if (v528)
    {
      free(v528);
      v527 = v675;
    }
    v527[3] = 0;
    _Block_object_dispose(&v670, 8);
    _Block_object_dispose(&v674, 8);
    _Block_object_dispose(&v678, 8);
    _Block_object_dispose(&v682, 8);
    _Block_object_dispose(&v686, 8);
    _Block_object_dispose(&v690, 8);
    _Block_object_dispose(&v694, 8);
    _Block_object_dispose(&v698, 8);
    _Block_object_dispose(&v702, 8);
    _Block_object_dispose(&v706, 8);
    _Block_object_dispose(&v710, 8);
    _Block_object_dispose(&v714, 8);

    v529 = v599;
    dispatch_semaphore_t v10 = v543;
    if ([v543 count])
    {
      id v614 = 0;
      [(RTWorkoutRouteManager *)self _storeWorkoutDistances:v543 error:&v614];
      id v530 = v614;

      if (v530) {
        BOOL v531 = v599 != 0;
      }
      else {
        BOOL v531 = 0;
      }
      if (v531)
      {
        v532 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v532, OS_LOG_TYPE_ERROR))
        {
          v535 = (objc_class *)objc_opt_class();
          NSStringFromClass(v535);
          id v536 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v537 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v536;
          __int16 v727 = 2112;
          id v728 = v537;
          __int16 v729 = 2112;
          unint64_t v730 = (unint64_t)v530;
          _os_log_error_impl(&dword_1D9BFA000, v532, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
        }
        [v599 addObject:v530];

        id v530 = 0;
      }

      dispatch_semaphore_t v10 = 0;
      v529 = v599;
    }
    if (a5)
    {
      uint64_t v538 = 1;
      v533 = _RTSafeArray();
      _RTMultiErrorCreate();
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v529 = v599;
    }
    BOOL v11 = [v529 count] == 0;
LABEL_366:
    _Block_object_dispose(&v718, 8);

    double v13 = v599;
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"workoutUUIDs");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v13 = [MEMORY[0x1E4F1C9E8] dictionary];
    BOOL v11 = v13 != 0;
  }

  return v11;
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_187(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_189(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_190(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_191(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_192(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_193(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_194(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_195(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

- (BOOL)_clearDistanceMatrixWithError:(id *)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  [(RTWorkoutRouteManager *)self _clearInMemoryClusters];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__133;
  double v46 = __Block_byref_object_dispose__133;
  id v47 = 0;
  id v6 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __55__RTWorkoutRouteManager__clearDistanceMatrixWithError___block_invoke;
  v39[3] = &unk_1E6B90728;
  id v41 = &v42;
  uint64_t v7 = v5;
  id v40 = v7;
  [v6 clearWithHandler:v39];

  uint64_t v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  double v14 = objc_opt_new();
  __int16 v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  double v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v17 = [v16 filteredArrayUsingPredicate:v15];
  double v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v20 = (void *)MEMORY[0x1E4F28C58];
  v53[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v53 count:1];
  dispatch_semaphore_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;
  }
  else
  {
LABEL_6:
    id v23 = 0;
  }

  id v24 = v23;
  uint64_t v25 = v24;
  if (a3 && v24)
  {
    dispatch_time_t v26 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      int v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v49 = 2112;
      id v50 = v33;
      __int16 v51 = 2112;
      id v52 = v25;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    int v27 = v25;
  }
  else
  {
    if (!a3 || !v43[5])
    {
      BOOL v29 = 1;
      goto LABEL_19;
    }
    id v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v36 = NSStringFromSelector(a2);
      id v37 = (void *)v43[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v49 = 2112;
      id v50 = v36;
      __int16 v51 = 2112;
      id v52 = v37;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    int v27 = (void *)v43[5];
  }
  BOOL v29 = 0;
  *a3 = v27;
LABEL_19:

  _Block_object_dispose(&v42, 8);
  return v29;
}

void __55__RTWorkoutRouteManager__clearDistanceMatrixWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_clearInMemoryClusters
{
  double v3 = [(RTWorkoutRouteManager *)self workoutActivityTypeToclustersSet];

  if (v3)
  {
    id v4 = [(RTWorkoutRouteManager *)self workoutActivityTypeToclustersSet];
    [v4 removeAllObjects];
  }
  else
  {
    id v4 = objc_opt_new();
    [(RTWorkoutRouteManager *)self setWorkoutActivityTypeToclustersSet:v4];
  }

  return 1;
}

- (BOOL)_preComputeCacheForWorkout:(id)a3 locations:(CLLocationCoordinate2D *)a4 locationsCount:(unint64_t)a5 decimatedLocations:(CLLocationCoordinate2D *)a6 decimatedLocationsCount:(unint64_t)a7 cachedDictionary:(id)a8 error:(id *)a9
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a8;
  double v18 = v17;
  if (v16)
  {
    int v67 = self;
    if (v17 && 2 * kRTSmoothingNumberOfLocations + 4 <= a5)
    {
      aSelector = a2;
      uint64_t v19 = MEMORY[0x1E016D870]();
      uint64_t v65 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      *uint64_t v65 = a4[a5 - 1];
      id v20 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      uint64_t v21 = [(RTWorkoutRouteManager *)v67 distanceCalculator];
      id v70 = 0;
      [v21 computeCentroid:a6 locationsCount:a7 error:&v70];
      uint64_t v23 = v22;
      uint64_t v25 = v24;
      id v26 = v70;
      *id v20 = v23;
      v20[1] = v25;
      id v66 = v20;

      if (v26)
      {
        int v27 = 0;
      }
      else
      {
        BOOL v36 = [(RTWorkoutRouteManager *)v67 distanceCalculator];
        id v69 = 0;
        int v27 = (void *)[v36 rectVerticesFromCoordinates:a4 locationsCount:a5 ignoreNFirstAndLastLocations:kRTSmoothingNumberOfLocations error:&v69];
        id v26 = v69;

        if (!v26)
        {
          id v68 = 0;
          uint64_t v43 = [(RTWorkoutRouteManager *)v67 _getCurveOrientationTypeForLocations:a4 locationsCount:a5 error:&v68];
          id v44 = v68;
          id v37 = (void *)v19;
          dispatch_semaphore_t v39 = a9;
          if (v44)
          {
            id v26 = v44;
            uint64_t v38 = v65;
          }
          else
          {
            uint64_t v63 = v43;
            id v45 = objc_alloc(MEMORY[0x1E4F5CE58]);
            double v46 = [NSNumber numberWithUnsignedInteger:a5];
            id v47 = [NSNumber numberWithUnsignedInteger:a5];
            __int16 v48 = (void *)[v45 initWithFirstObject:v46 secondObject:v47];
            id v74 = v48;
            __int16 v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
            [v18 setObject:v49 forKeyedSubscript:@"kRTCacheKeyLocationsCount"];

            uint64_t v38 = v65;
            id v50 = [(RTWorkoutRouteManager *)v67 _getRTPairUsingCLLocationCoordinate2D:v65];
            id v73 = v50;
            __int16 v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
            [v18 setObject:v51 forKeyedSubscript:@"kRTCacheKeyLastLocation"];

            id v52 = [(RTWorkoutRouteManager *)v67 _getRTPairUsingCLLocationCoordinate2D:v66];
            id v72 = v52;
            BOOL v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
            [v18 setObject:v53 forKeyedSubscript:@"kRTCacheKeyCentroid"];

            double v54 = [(RTWorkoutRouteManager *)v67 _getRTPairsFromCoordinates:v27 count:4];
            [v18 setObject:v54 forKeyedSubscript:@"kRTCacheKeyBoundingBoxVertices"];

            id v55 = objc_alloc(MEMORY[0x1E4F5CE58]);
            uint64_t v56 = [NSNumber numberWithInteger:v63];
            id v57 = [NSNumber numberWithInteger:v63];
            BOOL v58 = (void *)[v55 initWithFirstObject:v56 secondObject:v57];
            id v71 = v58;
            uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
            [v18 setObject:v59 forKeyedSubscript:@"kRTCacheKeyCurveOrientation"];

            id v26 = 0;
          }
          goto LABEL_16;
        }
      }
      id v37 = (void *)v19;
      uint64_t v38 = v65;
      dispatch_semaphore_t v39 = a9;
LABEL_16:
      free(v38);
      free(v66);
      if (v27) {
        free(v27);
      }
      if (v39) {
        BOOL v40 = v26 == 0;
      }
      else {
        BOOL v40 = 1;
      }
      BOOL v29 = v40;
      if (!v40)
      {
        id v41 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          id v60 = (objc_class *)objc_opt_class();
          double v61 = NSStringFromClass(v60);
          uint64_t v62 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          uint64_t v76 = v61;
          __int16 v77 = 2112;
          id v78 = v62;
          __int16 v79 = 2112;
          unint64_t v80 = (unint64_t)v26;
          _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        *dispatch_semaphore_t v39 = v26;
      }

      goto LABEL_29;
    }
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = (objc_class *)objc_opt_class();
      uint64_t v32 = NSStringFromClass(v31);
      int v33 = a2;
      uint64_t v34 = (void *)v32;
      id v35 = NSStringFromSelector(v33);
      *(_DWORD *)buf = 138413314;
      uint64_t v76 = v34;
      __int16 v77 = 2112;
      id v78 = v35;
      __int16 v79 = 2048;
      unint64_t v80 = a5;
      __int16 v81 = 2048;
      uint64_t v82 = 2 * kRTSmoothingNumberOfLocations + 4;
      __int16 v83 = 2048;
      uint64_t v84 = [v18 count];
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, %@, preComputing cache failed, locations count, %lu, expected count, %lu, cachedDictionary count, %lu, ", buf, 0x34u);
    }
    BOOL v29 = 0;
  }
  else
  {
    id v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"workout");
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v29 = 1;
  }
LABEL_29:

  return v29;
}

- (BOOL)_isPreFilteredForWorkout:(id)a3 otherWorkout:(id)a4 preFilteringResults:(id)a5 error:(id *)a6
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  double v14 = v13;
  if (!v11)
  {
    __int16 v51 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a6) {
      goto LABEL_25;
    }
    id v52 = @"workout";
    goto LABEL_24;
  }
  if (!v12)
  {
    BOOL v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
    }

    if (!a6) {
      goto LABEL_25;
    }
    id v52 = @"otherWorkout";
LABEL_24:
    _RTErrorInvalidParameterCreate((uint64_t)v52);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    BOOL v54 = 1;
    goto LABEL_52;
  }
  double v86 = v13;
  int v87 = self;
  uint64_t v84 = a6;
  __int16 v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [v11 workoutActivityType];
  uint64_t v17 = [v12 workoutActivityType];
  double v18 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  aSelector = a2;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    uint64_t v21 = NSStringFromSelector(a2);
    uint64_t v22 = @"NO";
    if (v16 != v17) {
      uint64_t v22 = @"YES";
    }
    __int16 v81 = v22;
    uint64_t v82 = (void *)v21;
    [objc_opt_class() stringFromWorkoutActivityType:[v11 workoutActivityType]];
    double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    [objc_opt_class() stringFromWorkoutActivityType:[v12 workoutActivityType]];
    double v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    [MEMORY[0x1E4F1C9C8] date];
    v26 = id v25 = v12;
    [v26 timeIntervalSinceDate:v15];
    *(_DWORD *)buf = 138413570;
    uint64_t v90 = v20;
    __int16 v91 = 2112;
    id v92 = v82;
    __int16 v93 = 2112;
    id v94 = v81;
    __int16 v95 = 2112;
    double v96 = v23;
    __int16 v97 = 2112;
    double v98 = v24;
    __int16 v99 = 2048;
    double v100 = v27;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, activityType mismatch, pre-filtered, %@, workout activityType, %@, other workout activityType, %@, latency, %.4f sec,", buf, 0x3Eu);

    id v12 = v25;
  }

  if (v16 == v17)
  {
    id v28 = [MEMORY[0x1E4F1C9C8] date];

    BOOL v29 = @"YES";
    if (+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", [v11 workoutActivityType]))
    {
      if (+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", [v12 workoutActivityType]))
      {
        BOOL v29 = @"NO";
      }
      else
      {
        BOOL v29 = @"YES";
      }
    }
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    id v31 = v87;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = (objc_class *)objc_opt_class();
      int v33 = NSStringFromClass(v32);
      uint64_t v34 = NSStringFromSelector(aSelector);
      [objc_opt_class() stringFromWorkoutActivityType:[v11 workoutActivityType]];
      double v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      [objc_opt_class() stringFromWorkoutActivityType:[v12 workoutActivityType]];
      double v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      [MEMORY[0x1E4F1C9C8] date];
      v38 = id v37 = v12;
      [v38 timeIntervalSinceDate:v28];
      *(_DWORD *)buf = 138413570;
      uint64_t v90 = v33;
      __int16 v91 = 2112;
      id v92 = v34;
      __int16 v93 = 2112;
      id v94 = v29;
      __int16 v95 = 2112;
      double v96 = v35;
      __int16 v97 = 2112;
      double v98 = v36;
      __int16 v99 = 2048;
      double v100 = v39;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, unsupported activity type, pre-filtered, %@, workout activityType, %@, other workout activityType, %@, latency, %.4f sec,", buf, 0x3Eu);

      id v12 = v37;
      id v31 = v87;
    }
    uint64_t v83 = [MEMORY[0x1E4F1C9C8] date];

    BOOL v40 = [(RTWorkoutRouteManager *)v31 healthKitManager];
    id v41 = [v40 _getTotalDistanceForWorkout:v11];
    uint64_t v42 = [MEMORY[0x1E4F2B618] meterUnit];
    [v41 doubleValueForUnit:v42];
    double v44 = v43;

    id v45 = [(RTWorkoutRouteManager *)v31 healthKitManager];
    double v46 = [v45 _getTotalDistanceForWorkout:v12];
    id v47 = [MEMORY[0x1E4F2B618] meterUnit];
    [v46 doubleValueForUnit:v47];
    double v49 = v48;

    if ([(RTWorkoutRouteManager *)v31 _shouldDecimateWorkout:v11]) {
      uint64_t v50 = [(RTWorkoutRouteManager *)v31 _shouldDecimateWorkout:v12];
    }
    else {
      uint64_t v50 = 0;
    }
    double v14 = v86;
    id v88 = 0;
    -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v31, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTPreFilterTotalDistanceDifferenceThreshold", v50, [v11 workoutActivityType:v81, v82], &v88);
    double v56 = v55;
    id v57 = (__CFString *)v88;
    BOOL v58 = v57;
    if (v84 && v57)
    {
      uint64_t v59 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        id v78 = (objc_class *)objc_opt_class();
        __int16 v79 = NSStringFromClass(v78);
        unint64_t v80 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        uint64_t v90 = v79;
        __int16 v91 = 2112;
        id v92 = v80;
        __int16 v93 = 2112;
        id v94 = v58;
        _os_log_error_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      *uint64_t v84 = v58;
      BOOL v54 = 1;
    }
    else
    {
      if (v44 >= v49) {
        double v60 = v44;
      }
      else {
        double v60 = v49;
      }
      double v61 = v60 * v56;
      if (v61 > v56 * 1000.0) {
        double v62 = v61;
      }
      else {
        double v62 = v56 * 1000.0;
      }
      double v63 = vabdd_f64(v44, v49);
      BOOL v54 = v63 > v62;
      if (v86)
      {
        if (v44 >= v49) {
          double v64 = v49;
        }
        else {
          double v64 = v44;
        }
        uint64_t v65 = [NSNumber numberWithInt:v64 > 15000.0];
        [v86 setObject:v65 forKeyedSubscript:@"kRTSimilarityIsLongWorkout"];

        id v66 = [NSNumber numberWithDouble:v63];
        [v86 setObject:v66 forKeyedSubscript:@"kRTSimilarityDifferenceInTotalDistance"];
      }
      int v67 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        id v68 = (objc_class *)objc_opt_class();
        id v69 = NSStringFromClass(v68);
        id v70 = NSStringFromSelector(aSelector);
        if (v63 <= v62) {
          id v71 = @"NO";
        }
        else {
          id v71 = @"YES";
        }
        [MEMORY[0x1E4F1C9C8] date];
        v73 = id v72 = v12;
        [v73 timeIntervalSinceDate:v83];
        uint64_t v75 = v74;
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138414594;
        uint64_t v90 = v69;
        __int16 v91 = 2112;
        id v92 = v70;
        __int16 v93 = 2112;
        id v94 = v71;
        __int16 v95 = 2048;
        double v96 = v44;
        __int16 v97 = 2048;
        double v98 = v49;
        __int16 v99 = 2048;
        double v100 = v63;
        __int16 v101 = 2048;
        double v102 = v56;
        __int16 v103 = 2048;
        double v104 = v62;
        __int16 v105 = 2048;
        uint64_t v106 = v75;
        __int16 v107 = 2048;
        uint64_t v108 = v76;
        _os_log_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, difference in totalDistance is greater than threshold, pre-filtered, %@, workout total distance (in meters), %.3f, other workout total distance (in meters), %.3f, total distance difference, %.3f, total distance difference threshold percentage, %.2f %%, total distance difference threshold, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x66u);

        id v12 = v72;
      }
    }
    __int16 v15 = (void *)v83;
  }
  else
  {
    BOOL v54 = 1;
    double v14 = v86;
  }

LABEL_52:
  return v54;
}

- (BOOL)_isPreFilteredForWorkout:(id)a3 firstFewLocations:(CLLocationCoordinate2D *)a4 firstFewLocationsCount:(unint64_t)a5 cachedDictionary:(id)a6 otherWorkout:(id)a7 firstFewOtherLocations:(CLLocationCoordinate2D *)a8 firstFewOtherLocationsCount:(unint64_t)a9 cachedOtherDictionary:(id)a10 preFilteringResults:(id)a11 error:(id *)a12
{
  uint64_t v17 = a12;
  v122[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  id v22 = a11;
  double v23 = v22;
  if (!v18)
  {
    double v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a12) {
      goto LABEL_15;
    }
    id v25 = @"workout";
    goto LABEL_14;
  }
  if (v20)
  {
    double v100 = v22;
    id v98 = v20;
    __int16 v97 = [MEMORY[0x1E4F1C9C8] date];
    if (a5)
    {
      if (a9) {
        goto LABEL_22;
      }
    }
    else
    {
      id v28 = [v19 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];
      if (!v28) {
        goto LABEL_29;
      }
      double v23 = v28;
      if (a9)
      {

        goto LABEL_22;
      }
    }
    BOOL v29 = [v21 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];

    if (!a5) {
    if (v29)
    }
    {
LABEL_22:
      id v30 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      id v31 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      context = (void *)MEMORY[0x1E016D870]();
      __int16 v99 = v30;
      if (v19)
      {
        uint64_t v32 = [v19 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];

        if (!v32)
        {
          *id v30 = *a4;
          double v55 = v30;
          id v41 = self;
          double v56 = [(RTWorkoutRouteManager *)self _getRTPairUsingCLLocationCoordinate2D:v55];
          v122[0] = v56;
          id v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:1];
          [v19 setObject:v57 forKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];

          if (v21)
          {
LABEL_27:
            uint64_t v42 = [v21 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];

            if (v42)
            {
              double v43 = [v21 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];
              double v44 = [v43 firstObject];

              id v45 = [v44 firstObject];
              [v45 doubleValue];
              CLLocationDegrees v47 = v46;
              double v48 = [v44 secondObject];
              [v48 doubleValue];
              CLLocationCoordinate2D *v31 = CLLocationCoordinate2DMake(v47, v49);
            }
            else
            {
              CLLocationCoordinate2D *v31 = *a8;
              BOOL v58 = [(RTWorkoutRouteManager *)v41 _getRTPairUsingCLLocationCoordinate2D:v31];
              double v121 = v58;
              uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
              [v21 setObject:v59 forKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];
            }
LABEL_35:
            double v60 = [(RTWorkoutRouteManager *)v41 distanceCalculator];
            id v104 = 0;
            [v60 distanceFromLocationCoordinate:v99 toLocationCoordinate:v31 error:&v104];
            double v62 = v61;
            BOOL v54 = (__CFString *)v104;

            if (!v54)
            {
              if (v100)
              {
                double v63 = [NSNumber numberWithDouble:v62];
                [v100 setObject:v63 forKeyedSubscript:@"kRTSimilarityDistanceBetweenFirstLocations"];
              }
              if ([(RTWorkoutRouteManager *)v41 _shouldDecimateWorkout:v18]) {
                uint64_t v64 = [(RTWorkoutRouteManager *)v41 _shouldDecimateWorkout:v20];
              }
              else {
                uint64_t v64 = 0;
              }
              id v103 = 0;
              -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v41, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTPreFilterFirstLocationsDistanceThreshold", v64, [v18 workoutActivityType], &v103);
              double v66 = v65;
              int v67 = (__CFString *)v103;
              if (!v67)
              {
                id v70 = [(RTWorkoutRouteManager *)v41 healthKitManager];
                id v71 = [v70 _getTotalDistanceForWorkout:v18];
                id v72 = [MEMORY[0x1E4F2B618] meterUnit];
                [v71 doubleValueForUnit:v72];
                double v74 = v73;

                uint64_t v75 = [(RTWorkoutRouteManager *)self healthKitManager];
                uint64_t v76 = [v75 _getTotalDistanceForWorkout:v20];
                __int16 v77 = [MEMORY[0x1E4F2B618] meterUnit];
                [v76 doubleValueForUnit:v77];
                double v79 = v78;

                if (v74 >= v79) {
                  double v80 = v74;
                }
                else {
                  double v80 = v79;
                }
                double v81 = fmin(v66 * v80, 350.0);
                if (v81 >= 50.0) {
                  double v82 = v81;
                }
                else {
                  double v82 = 50.0;
                }
                uint64_t v83 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                {
                  uint64_t v84 = (objc_class *)objc_opt_class();
                  uint64_t v85 = NSStringFromClass(v84);
                  double v86 = NSStringFromSelector(a2);
                  int v87 = @"NO";
                  if (v62 > v82) {
                    int v87 = @"YES";
                  }
                  id v88 = [MEMORY[0x1E4F1C9C8] date:v87 context:context];
                  [v88 timeIntervalSinceDate:v97];
                  uint64_t v90 = v89;
                  +[RTRuntime footprint];
                  *(_DWORD *)buf = 138414082;
                  uint64_t v106 = v85;
                  __int16 v107 = 2112;
                  uint64_t v108 = v86;
                  __int16 v109 = 2112;
                  int v110 = v95;
                  __int16 v111 = 2048;
                  unint64_t v112 = *(void *)&v62;
                  __int16 v113 = 2048;
                  unint64_t v114 = *(void *)&v66;
                  __int16 v115 = 2048;
                  uint64_t v116 = *(void *)&v82;
                  __int16 v117 = 2048;
                  uint64_t v118 = v90;
                  __int16 v119 = 2048;
                  uint64_t v120 = v91;
                  _os_log_impl(&dword_1D9BFA000, v83, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenFirstLocations is greater than distance threshold, pre-filtered, %@, distanceBetweenFirstLocations (in meters), %.3f, distance threshold percentage, %.3f, distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);
                }
                BOOL v54 = 0;
                BOOL v27 = v62 > v82;
                id v20 = v98;
                goto LABEL_44;
              }
              BOOL v54 = v67;
            }
            BOOL v27 = 0;
LABEL_44:
            free(v99);
            free(v31);
            if (v17)
            {
              double v23 = v100;
              if (v54)
              {
                id v68 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  id v92 = (objc_class *)objc_opt_class();
                  __int16 v93 = NSStringFromClass(v92);
                  id v94 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412802;
                  uint64_t v106 = v93;
                  __int16 v107 = 2112;
                  uint64_t v108 = v94;
                  __int16 v109 = 2112;
                  int v110 = v54;
                  _os_log_error_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
                }
                BOOL v54 = v54;
                *uint64_t v17 = v54;
                BOOL v27 = 1;
              }
            }
            else
            {
              double v23 = v100;
            }
LABEL_50:

            goto LABEL_51;
          }
LABEL_33:
          CLLocationCoordinate2D *v31 = *a8;
          goto LABEL_35;
        }
        int v33 = [v19 objectForKeyedSubscript:@"kRTCacheKeyFirstFewLocations"];
        uint64_t v34 = [v33 firstObject];

        double v35 = [v34 firstObject];
        [v35 doubleValue];
        CLLocationDegrees v37 = v36;
        [v34 secondObject];
        v39 = uint64_t v38 = v31;
        [v39 doubleValue];
        *id v30 = CLLocationCoordinate2DMake(v37, v40);

        id v31 = v38;
        uint64_t v17 = a12;
      }
      else
      {
        *id v30 = *a4;
      }
      id v41 = self;
      if (v21) {
        goto LABEL_27;
      }
      goto LABEL_33;
    }
LABEL_29:
    uint64_t v50 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    double v23 = v100;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      __int16 v51 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v51);
      BOOL v53 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413826;
      uint64_t v106 = v52;
      __int16 v107 = 2112;
      uint64_t v108 = v53;
      __int16 v109 = 2112;
      int v110 = @"YES";
      __int16 v111 = 2048;
      unint64_t v112 = a5;
      __int16 v113 = 2048;
      unint64_t v114 = a9;
      __int16 v115 = 2048;
      uint64_t v116 = [v19 count];
      __int16 v117 = 2048;
      uint64_t v118 = [v21 count];
      _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, locations count is zero, pre-filtered, %@, firstFewLocations count, %lu, firstFewOtherLocations count, %lu, cachedDictionary count, %lu, cachedOtherDictionary count, %lu", buf, 0x48u);
    }
    BOOL v54 = 0;
    BOOL v27 = 1;
    goto LABEL_50;
  }
  id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a12)
  {
    id v25 = @"otherWorkout";
LABEL_14:
    _RTErrorInvalidParameterCreate((uint64_t)v25);
    *a12 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:
  BOOL v27 = 1;
LABEL_51:

  return v27;
}

- (BOOL)_isPreFilteredLocationCountBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v140 = a4;
  id v15 = a5;
  id v139 = a6;
  id v16 = a7;
  uint64_t v17 = v16;
  if (!v14)
  {
    id v103 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v103, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8) {
      goto LABEL_62;
    }
    id v104 = @"workout";
    goto LABEL_61;
  }
  if (!v15)
  {
    __int16 v105 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v105, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
    }

    if (!a8) {
      goto LABEL_62;
    }
    id v104 = @"otherWorkout";
LABEL_61:
    _RTErrorInvalidParameterCreate((uint64_t)v104);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:
    LOBYTE(v23) = 1;
    goto LABEL_69;
  }
  id v132 = v16;
  if (!v140) {
    goto LABEL_64;
  }
  id v18 = [v140 objectForKeyedSubscript:@"kRTCacheKeyLocationsCount"];
  id v19 = v18;
  if (!v139 || !v18)
  {

LABEL_64:
    uint64_t v106 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      __int16 v107 = (objc_class *)objc_opt_class();
      uint64_t v108 = NSStringFromClass(v107);
      __int16 v109 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      uint64_t v144 = (uint64_t)v108;
      __int16 v145 = 2112;
      id v146 = v109;
      __int16 v147 = 2112;
      int v148 = @"YES";
      __int16 v149 = 2048;
      uint64_t v150 = [v140 count];
      __int16 v151 = 2048;
      uint64_t v152 = [v139 count];
      _os_log_impl(&dword_1D9BFA000, v106, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyLocationsCount doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);
    }
    id v21 = 0;
    double v102 = 0;
LABEL_67:
    LOBYTE(v23) = 1;
    goto LABEL_68;
  }
  id v20 = [v139 objectForKeyedSubscript:@"kRTCacheKeyLocationsCount"];

  if (!v20) {
    goto LABEL_64;
  }
  aSelector = a2;
  id v21 = 0;
  char v22 = 1;
  id v127 = v15;
  id v126 = v14;
  while (1)
  {
    LOBYTE(v23) = v22;
    if ((v22 & 1) == 0)
    {
      double v102 = 0;
      goto LABEL_68;
    }
    char v128 = v22;
    context = (void *)MEMORY[0x1E016D870]();
    uint64_t v134 = [MEMORY[0x1E4F1C9C8] date];

    double v24 = [v140 objectForKeyedSubscript:@"kRTCacheKeyLocationsCount"];
    id v25 = [v24 firstObject];

    uint64_t v130 = v25;
    id v26 = [v25 firstObject];
    unint64_t v136 = [v26 unsignedIntegerValue];

    BOOL v27 = [v139 objectForKeyedSubscript:@"kRTCacheKeyLocationsCount"];
    id v28 = [v27 firstObject];

    uint64_t v129 = v28;
    BOOL v29 = [v28 firstObject];
    unint64_t v30 = [v29 unsignedIntegerValue];

    if ([(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v14]) {
      BOOL v31 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v15];
    }
    else {
      BOOL v31 = 0;
    }
    uint64_t v32 = [v14 workoutActivityType];
    id v142 = 0;
    [(RTWorkoutRouteManager *)self _getConstantValueForString:@"kRTPreFilterDifferenceBetweenLocationsThreshold" isDecimated:v31 workoutActivityType:v32 error:&v142];
    double v34 = v33;
    double v35 = (__CFString *)v142;
    double v36 = aSelector;
    if (v35)
    {
      double v102 = v35;
      id v21 = v134;
      goto LABEL_83;
    }
    uint64_t v23 = [(RTWorkoutRouteManager *)self healthKitManager];
    [(id)v23 _getDurationForWorkout:v14];
    if (v37 == 0.0)
    {

      double v41 = 0.0;
      LODWORD(v23) = 1;
LABEL_20:
      double v43 = 0.0;
LABEL_23:
      unint64_t v42 = v136;
      goto LABEL_24;
    }
    uint64_t v38 = [(RTWorkoutRouteManager *)self healthKitManager];
    [v38 _getDurationForWorkout:v15];
    double v40 = v39;

    double v41 = 0.0;
    LODWORD(v23) = 1;
    if (v40 == 0.0) {
      goto LABEL_20;
    }
    unint64_t v42 = v136;
    if (v136)
    {
      double v43 = 0.0;
      if (!v30) {
        goto LABEL_24;
      }
      double v44 = [(RTWorkoutRouteManager *)self healthKitManager];
      uint64_t v23 = (uint64_t)v44;
      if (v136 >= v30)
      {
        double v41 = (double)v30 / (double)v136;
        [v44 _getDurationForWorkout:v15];
        double v46 = v50;
        CLLocationDegrees v47 = [(RTWorkoutRouteManager *)self healthKitManager];
        double v48 = v47;
        id v49 = v14;
      }
      else
      {
        double v41 = (double)v136 / (double)v30;
        [v44 _getDurationForWorkout:v14];
        double v46 = v45;
        CLLocationDegrees v47 = [(RTWorkoutRouteManager *)self healthKitManager];
        double v48 = v47;
        id v49 = v15;
      }
      [v47 _getDurationForWorkout:v49];
      double v43 = v46 / v51;

      LODWORD(v23) = v41 - v43 > v34;
      goto LABEL_23;
    }
    double v43 = 0.0;
LABEL_24:
    id v52 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      BOOL v53 = (objc_class *)objc_opt_class();
      BOOL v54 = NSStringFromClass(v53);
      double v55 = NSStringFromSelector(aSelector);
      double v56 = @"NO";
      if (v23) {
        double v56 = @"YES";
      }
      double v121 = v56;
      id v57 = [(RTWorkoutRouteManager *)self healthKitManager];
      [v57 _getDurationForWorkout:v14];
      unint64_t v59 = (unint64_t)v58;
      [(RTWorkoutRouteManager *)self healthKitManager];
      uint64_t v23 = v123 = v23;
      [(id)v23 _getDurationForWorkout:v15];
      unint64_t v61 = (unint64_t)v60;
      double v62 = [MEMORY[0x1E4F1C9C8] date];
      [v62 timeIntervalSinceDate:v134];
      uint64_t v64 = v63;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138415106;
      uint64_t v144 = (uint64_t)v54;
      __int16 v145 = 2112;
      id v146 = v55;
      __int16 v147 = 2112;
      int v148 = v121;
      __int16 v149 = 2048;
      uint64_t v150 = v136;
      __int16 v151 = 2048;
      uint64_t v152 = v30;
      __int16 v153 = 2048;
      double v154 = *(double *)&v59;
      id v14 = v126;
      __int16 v155 = 2048;
      unint64_t v156 = v61;
      double v36 = aSelector;
      __int16 v157 = 2048;
      double v158 = v41;
      __int16 v159 = 2048;
      double v160 = v43;
      __int16 v161 = 2048;
      double v162 = v34;
      __int16 v163 = 2048;
      uint64_t v164 = v64;
      __int16 v165 = 2048;
      uint64_t v166 = v65;
      _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, difference in number of locations is greater than threshold, pre-filtered, %@, locations count, %lu, other locations count, %lu, workout duration, %lu, other workout duration, %lu, difference in number of locations percentage, %.3f, difference in duration percentage, %.3f, difference in number of locations percentage threshold, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x7Au);

      id v15 = v127;
      LOBYTE(v23) = v123;

      unint64_t v42 = v136;
    }

    if (v23) {
      goto LABEL_79;
    }
    if ([(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v14]
      || [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v15])
    {
      __int16 v111 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
      {
        unint64_t v112 = (objc_class *)objc_opt_class();
        NSStringFromClass(v112);
        uint64_t v23 = v125 = v23;
        __int16 v113 = NSStringFromSelector(v36);
        if ([(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v14]) {
          unint64_t v114 = @"YES";
        }
        else {
          unint64_t v114 = @"NO";
        }
        BOOL v115 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v15];
        *(_DWORD *)buf = 138413314;
        if (v115) {
          uint64_t v116 = @"YES";
        }
        else {
          uint64_t v116 = @"NO";
        }
        uint64_t v144 = v23;
        __int16 v145 = 2112;
        id v146 = v113;
        __int16 v147 = 2112;
        int v148 = @"NO";
        __int16 v149 = 2112;
        uint64_t v150 = (uint64_t)v114;
        __int16 v151 = 2112;
        uint64_t v152 = (uint64_t)v116;
        _os_log_impl(&dword_1D9BFA000, v111, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, decimated workouts for rate check, pre-filtered, %@, workout decimated, %@, other workout decimated, %@", buf, 0x34u);

        LOBYTE(v23) = v125;
      }

LABEL_79:
      double v102 = 0;
      id v21 = v134;
      goto LABEL_68;
    }
    uint64_t v137 = [MEMORY[0x1E4F1C9C8] date];

    double v66 = [(RTWorkoutRouteManager *)self healthKitManager];
    [v66 _getDurationForWorkout:v14];
    double v68 = v67;
    double v69 = (double)v42;

    id v70 = [(RTWorkoutRouteManager *)self healthKitManager];
    [v70 _getDurationForWorkout:v14];
    double v72 = v71;

    if (!v42) {
      goto LABEL_34;
    }
    if (v68 < v69) {
      double v73 = v72 / v69;
    }
    else {
LABEL_34:
    }
      double v73 = v69 / v72;
    double v74 = [(RTWorkoutRouteManager *)self healthKitManager];
    [v74 _getDurationForWorkout:v15];
    double v76 = v75;
    double v77 = (double)v30;

    double v78 = [(RTWorkoutRouteManager *)self healthKitManager];
    [v78 _getDurationForWorkout:v15];
    double v80 = v79;

    if (!v30) {
      goto LABEL_38;
    }
    if (v76 < v77) {
      double v81 = v80 / v77;
    }
    else {
LABEL_38:
    }
      double v81 = v77 / v80;
    BOOL v82 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v14]
       && [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v15];
    uint64_t v83 = [v14 workoutActivityType];
    id v141 = 0;
    [(RTWorkoutRouteManager *)self _getConstantValueForString:@"kRTPreFilterLocationsRateThreshold" isDecimated:v82 workoutActivityType:v83 error:&v141];
    double v85 = v84;
    double v86 = (__CFString *)v141;
    if (v86) {
      break;
    }
    LODWORD(v87) = v81 < v85 || v73 < v85;
    id v88 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      uint64_t v89 = (objc_class *)objc_opt_class();
      uint64_t v90 = NSStringFromClass(v89);
      uint64_t v91 = NSStringFromSelector(aSelector);
      id v92 = @"NO";
      if (v87) {
        id v92 = @"YES";
      }
      BOOL v122 = v92;
      double v124 = [(RTWorkoutRouteManager *)self healthKitManager];
      [v124 _getDurationForWorkout:v14];
      char v135 = v87;
      unint64_t v87 = (unint64_t)v93;
      id v94 = [(RTWorkoutRouteManager *)self healthKitManager];
      [v94 _getDurationForWorkout:v127];
      unint64_t v95 = v30;
      unint64_t v97 = (unint64_t)v96;
      id v98 = [MEMORY[0x1E4F1C9C8] date];
      [v98 timeIntervalSinceDate:v137];
      uint64_t v100 = v99;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138415106;
      uint64_t v144 = (uint64_t)v90;
      __int16 v145 = 2112;
      id v146 = v91;
      __int16 v147 = 2112;
      int v148 = v122;
      __int16 v149 = 2048;
      uint64_t v150 = *(void *)&v73;
      __int16 v151 = 2048;
      uint64_t v152 = *(void *)&v81;
      __int16 v153 = 2048;
      double v154 = v85;
      __int16 v155 = 2048;
      unint64_t v156 = v42;
      __int16 v157 = 2048;
      double v158 = *(double *)&v87;
      LOBYTE(v87) = v135;
      __int16 v159 = 2048;
      double v160 = *(double *)&v95;
      id v14 = v126;
      __int16 v161 = 2048;
      double v162 = *(double *)&v97;
      __int16 v163 = 2048;
      uint64_t v164 = v100;
      __int16 v165 = 2048;
      uint64_t v166 = v101;
      _os_log_impl(&dword_1D9BFA000, v88, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, are workouts not 1 hertz, pre-filtered, %@, workout rate, %.3f, other workout rate, %.3f, 1 hertz threshold, %.3f, locations count, %lu, workout duration, %lu, other locations count, %lu, other workout duration, %lu latency, %.4f sec, footprint, %.4f MB", buf, 0x7Au);

      id v15 = v127;
    }

    char v22 = 0;
    double v102 = 0;
    LOBYTE(v23) = v128;
    id v21 = (void *)v137;
    if (v87) {
      goto LABEL_68;
    }
  }
  double v102 = v86;
  id v21 = (void *)v137;
LABEL_83:

  if (a8)
  {
    __int16 v117 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      uint64_t v118 = (objc_class *)objc_opt_class();
      __int16 v119 = NSStringFromClass(v118);
      uint64_t v120 = NSStringFromSelector(v36);
      *(_DWORD *)buf = 138412802;
      uint64_t v144 = (uint64_t)v119;
      __int16 v145 = 2112;
      id v146 = v120;
      __int16 v147 = 2112;
      int v148 = v102;
      _os_log_error_impl(&dword_1D9BFA000, v117, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    double v102 = v102;
    *a8 = v102;
    goto LABEL_67;
  }
  LOBYTE(v23) = 0;
LABEL_68:

  uint64_t v17 = v132;
LABEL_69:

  return v23 & 1;
}

- (BOOL)_isPreFilteredLastLocationBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (!v15)
  {
    BOOL v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8) {
      goto LABEL_20;
    }
    BOOL v54 = @"workout";
    goto LABEL_19;
  }
  if (v17)
  {
    if (v16)
    {
      id v20 = [v16 objectForKeyedSubscript:@"kRTCacheKeyLastLocation"];
      id v21 = v20;
      if (v18 && v20)
      {
        char v22 = [v18 objectForKeyedSubscript:@"kRTCacheKeyLastLocation"];

        if (v22)
        {
          double v96 = v19;
          aSelector = a2;
          id v98 = self;
          uint64_t v23 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          double v24 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          context = (void *)MEMORY[0x1E016D870]();
          uint64_t v97 = [MEMORY[0x1E4F1C9C8] date];
          id v25 = [v16 objectForKeyedSubscript:@"kRTCacheKeyLastLocation"];
          id v26 = [v25 firstObject];

          BOOL v27 = [v26 firstObject];
          [v27 doubleValue];
          CLLocationDegrees v29 = v28;
          unint64_t v30 = [v26 secondObject];
          [v30 doubleValue];
          CLLocationCoordinate2D *v23 = CLLocationCoordinate2DMake(v29, v31);
          uint64_t v99 = v23;

          uint64_t v32 = [v18 objectForKeyedSubscript:@"kRTCacheKeyLastLocation"];
          double v33 = [v32 firstObject];

          double v34 = [v33 firstObject];
          [v34 doubleValue];
          CLLocationDegrees v36 = v35;
          double v37 = [v33 secondObject];
          [v37 doubleValue];
          CLLocationCoordinate2D *v24 = CLLocationCoordinate2DMake(v36, v38);
          uint64_t v100 = v24;

          double v39 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            double v40 = (objc_class *)objc_opt_class();
            double v41 = NSStringFromClass(v40);
            unint64_t v42 = NSStringFromSelector(aSelector);
            double v43 = *(__CFString **)&v23->latitude;
            uint64_t v44 = *(void *)&v23->longitude;
            uint64_t v45 = *(void *)&v24->latitude;
            double longitude = v24->longitude;
            *(_DWORD *)buf = 138413571;
            id v104 = v41;
            __int16 v105 = 2112;
            uint64_t v106 = v42;
            __int16 v107 = 2049;
            uint64_t v108 = v43;
            __int16 v109 = 2049;
            uint64_t v110 = v44;
            __int16 v111 = 2049;
            uint64_t v112 = v45;
            __int16 v113 = 2049;
            double v114 = longitude;
            _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%@, %@, lastLocation, <%{private}f, %{private}f>, otherLastLocation, <%{private}f, %{private}f>,", buf, 0x3Eu);
          }
          CLLocationDegrees v47 = [(RTWorkoutRouteManager *)v98 distanceCalculator];
          id v102 = 0;
          [v47 distanceFromLocationCoordinate:v23 toLocationCoordinate:v24 error:&v102];
          double v49 = v48;
          double v50 = (__CFString *)v102;

          id v19 = v96;
          if (v50)
          {
            BOOL v51 = 0;
            id v52 = v100;
          }
          else
          {
            if (v96)
            {
              double v62 = [NSNumber numberWithDouble:v49];
              [v96 setObject:v62 forKeyedSubscript:@"kRTSimilarityDistanceBetweenLastLocations"];
            }
            if ([(RTWorkoutRouteManager *)v98 _shouldDecimateWorkout:v15]) {
              uint64_t v63 = [(RTWorkoutRouteManager *)v98 _shouldDecimateWorkout:v17];
            }
            else {
              uint64_t v63 = 0;
            }
            id v52 = v100;
            id v101 = 0;
            -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v98, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTPreFilterLastLocationsDistanceThreshold", v63, [v15 workoutActivityType], &v101);
            double v65 = v64;
            double v66 = (__CFString *)v101;
            if (v66)
            {
              double v50 = v66;
              BOOL v51 = 0;
            }
            else
            {
              double v67 = [(RTWorkoutRouteManager *)v98 healthKitManager];
              double v68 = [v67 _getTotalDistanceForWorkout:v15];
              double v69 = [MEMORY[0x1E4F2B618] meterUnit];
              [v68 doubleValueForUnit:v69];
              double v71 = v70;

              double v72 = [(RTWorkoutRouteManager *)v98 healthKitManager];
              double v73 = [v72 _getTotalDistanceForWorkout:v17];
              double v74 = [MEMORY[0x1E4F2B618] meterUnit];
              [v73 doubleValueForUnit:v74];
              double v76 = v75;

              if (v71 >= v76) {
                double v77 = v71;
              }
              else {
                double v77 = v76;
              }
              double v78 = fmin(v65 * v77, 350.0);
              if (v78 >= 50.0) {
                double v79 = v78;
              }
              else {
                double v79 = 50.0;
              }
              double v80 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
              {
                double v81 = (objc_class *)objc_opt_class();
                BOOL v82 = NSStringFromClass(v81);
                uint64_t v83 = NSStringFromSelector(aSelector);
                double v84 = @"NO";
                if (v49 > v79) {
                  double v84 = @"YES";
                }
                double v85 = [[MEMORY[0x1E4F1C9C8] date:v84];
                [v85 timeIntervalSinceDate:v97];
                uint64_t v87 = v86;
                +[RTRuntime footprint];
                *(_DWORD *)buf = 138414082;
                id v104 = v82;
                __int16 v105 = 2112;
                uint64_t v106 = v83;
                __int16 v107 = 2112;
                uint64_t v108 = v93;
                __int16 v109 = 2048;
                uint64_t v110 = *(void *)&v49;
                __int16 v111 = 2048;
                uint64_t v112 = *(void *)&v65;
                __int16 v113 = 2048;
                double v114 = v79;
                __int16 v115 = 2048;
                uint64_t v116 = v87;
                __int16 v117 = 2048;
                uint64_t v118 = v88;
                _os_log_impl(&dword_1D9BFA000, v80, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenLastLocations is greater than distance threshold, pre-filtered, %@, distanceBetweenLastLocations (in meters), %.3f, distance threshold percentage, %.3f, distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);
              }
              id v52 = v100;
              if (v49 <= v79)
              {
                BOOL v51 = 0;
                double v50 = 0;
              }
              else
              {
                double v50 = 0;
                BOOL v51 = 1;
              }
            }
          }
          free(v99);
          free(v52);
          if (a8 && v50)
          {
            uint64_t v89 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              uint64_t v90 = (objc_class *)objc_opt_class();
              uint64_t v91 = NSStringFromClass(v90);
              id v92 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              id v104 = v91;
              __int16 v105 = 2112;
              uint64_t v106 = v92;
              __int16 v107 = 2112;
              uint64_t v108 = v50;
              _os_log_error_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
            }
            double v50 = v50;
            *a8 = v50;
            BOOL v51 = 1;
          }
          double v60 = (void *)v97;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    double v56 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      id v57 = (objc_class *)objc_opt_class();
      double v58 = NSStringFromClass(v57);
      unint64_t v59 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      id v104 = v58;
      __int16 v105 = 2112;
      uint64_t v106 = v59;
      __int16 v107 = 2112;
      uint64_t v108 = @"YES";
      __int16 v109 = 2048;
      uint64_t v110 = [v16 count];
      __int16 v111 = 2048;
      uint64_t v112 = [v18 count];
      _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyLastLocation doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);
    }
    double v60 = 0;
    double v50 = 0;
    BOOL v51 = 1;
    goto LABEL_25;
  }
  double v55 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a8)
  {
    BOOL v54 = @"otherWorkout";
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v54);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:
  BOOL v51 = 1;
LABEL_26:

  return v51;
}

- (BOOL)_isPreFilteredCentroidBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (!v15)
  {
    id v52 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8) {
      goto LABEL_22;
    }
    BOOL v53 = @"workout";
    goto LABEL_21;
  }
  if (v17)
  {
    if (v16)
    {
      id v20 = [v16 objectForKeyedSubscript:@"kRTCacheKeyCentroid"];
      id v21 = v20;
      if (v18 && v20)
      {
        char v22 = [v18 objectForKeyedSubscript:@"kRTCacheKeyCentroid"];

        if (v22)
        {
          aSelector = a2;
          uint64_t v97 = self;
          uint64_t v23 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          uint64_t v99 = (uint64_t *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          context = (void *)MEMORY[0x1E016D870]();
          uint64_t v96 = [MEMORY[0x1E4F1C9C8] date];
          double v24 = [v16 objectForKeyedSubscript:@"kRTCacheKeyCentroid"];
          id v25 = [v24 firstObject];

          id v26 = [v25 firstObject];
          [v26 doubleValue];
          CLLocationDegrees v28 = v27;
          CLLocationDegrees v29 = [v25 secondObject];
          [v29 doubleValue];
          CLLocationCoordinate2D *v23 = CLLocationCoordinate2DMake(v28, v30);
          id v98 = v23;

          CLLocationDegrees v31 = [v18 objectForKeyedSubscript:@"kRTCacheKeyCentroid"];
          uint64_t v32 = [v31 firstObject];

          double v33 = [v32 firstObject];
          [v33 doubleValue];
          CLLocationDegrees v35 = v34;
          CLLocationDegrees v36 = [v32 secondObject];
          [v36 doubleValue];
          *(CLLocationCoordinate2D *)uint64_t v99 = CLLocationCoordinate2DMake(v35, v37);

          CLLocationDegrees v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            double v39 = (objc_class *)objc_opt_class();
            double v40 = NSStringFromClass(v39);
            double v41 = NSStringFromSelector(aSelector);
            unint64_t v42 = *(__CFString **)&v23->latitude;
            uint64_t v43 = *(void *)&v23->longitude;
            uint64_t v44 = *v99;
            double v45 = *((double *)v99 + 1);
            *(_DWORD *)buf = 138413571;
            id v103 = v40;
            __int16 v104 = 2112;
            __int16 v105 = v41;
            __int16 v106 = 2049;
            __int16 v107 = v42;
            __int16 v108 = 2049;
            uint64_t v109 = v43;
            __int16 v110 = 2049;
            uint64_t v111 = v44;
            __int16 v112 = 2049;
            double v113 = v45;
            _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, locationCentroid, <%{private}f, %{private}f>, otherLocationCentroid, <%{private}f, %{private}f>,", buf, 0x3Eu);
          }
          double v46 = [(RTWorkoutRouteManager *)v97 distanceCalculator];
          id v101 = 0;
          [v46 distanceFromLocationCoordinate:v23 toLocationCoordinate:v99 error:&v101];
          double v48 = v47;
          id v49 = v101;

          if (v19)
          {
            double v50 = [NSNumber numberWithDouble:v48];
            [v19 setObject:v50 forKeyedSubscript:@"kRTSimilarityDistanceBetweenCentroids"];
          }
          if ([(RTWorkoutRouteManager *)v97 _shouldDecimateWorkout:v15]) {
            uint64_t v51 = [(RTWorkoutRouteManager *)v97 _shouldDecimateWorkout:v17];
          }
          else {
            uint64_t v51 = 0;
          }
          uint64_t v63 = v99;
          id v100 = v49;
          -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v97, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTPreFilterCentroidDistanceThreshold", v51, [v15 workoutActivityType], &v100);
          double v65 = v64;
          unint64_t v61 = (__CFString *)v100;

          if (v61) {
            goto LABEL_43;
          }
          double v66 = [(RTWorkoutRouteManager *)v97 healthKitManager];
          double v67 = [v66 _getTotalDistanceForWorkout:v15];
          double v68 = [MEMORY[0x1E4F2B618] meterUnit];
          [v67 doubleValueForUnit:v68];
          double v70 = v69;

          id v92 = [(RTWorkoutRouteManager *)v97 healthKitManager];
          double v71 = [v92 _getTotalDistanceForWorkout:v17];
          double v72 = [MEMORY[0x1E4F2B618] meterUnit];
          [v71 doubleValueForUnit:v72];
          double v74 = v73;

          if (v70 >= v74) {
            double v75 = v70;
          }
          else {
            double v75 = v74;
          }
          double v76 = fmin(v65 * v75, 1000.0);
          if (v76 >= 100.0) {
            double v77 = v76;
          }
          else {
            double v77 = 100.0;
          }
          double v78 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            double v79 = (objc_class *)objc_opt_class();
            double v80 = NSStringFromClass(v79);
            uint64_t v81 = NSStringFromSelector(aSelector);
            BOOL v82 = @"NO";
            if (v48 > v77) {
              BOOL v82 = @"YES";
            }
            double v93 = [MEMORY[0x1E4F1C9C8] date:v82, v81];
            [v93 timeIntervalSinceDate:v96];
            uint64_t v84 = v83;
            +[RTRuntime footprint];
            *(_DWORD *)buf = 138414082;
            id v103 = v80;
            __int16 v104 = 2112;
            __int16 v105 = v91;
            __int16 v106 = 2112;
            __int16 v107 = v90;
            __int16 v108 = 2048;
            uint64_t v109 = *(void *)&v48;
            __int16 v110 = 2048;
            uint64_t v111 = *(void *)&v65;
            __int16 v112 = 2048;
            double v113 = v77;
            __int16 v114 = 2048;
            uint64_t v115 = v84;
            __int16 v116 = 2048;
            uint64_t v117 = v85;
            _os_log_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenCentroids is greater than threshold, pre-filtered, %@, distance between centroids (in meters), %.3f, centroid distance threshold percentage, %.3f, centroid distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);
          }
          uint64_t v63 = v99;
          if (v48 <= v77) {
LABEL_43:
          }
            BOOL v55 = 0;
          else {
            BOOL v55 = 1;
          }
          free(v98);
          free(v63);
          if (a8 && v61)
          {
            uint64_t v86 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              uint64_t v87 = (objc_class *)objc_opt_class();
              uint64_t v88 = NSStringFromClass(v87);
              uint64_t v89 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              id v103 = v88;
              __int16 v104 = 2112;
              __int16 v105 = v89;
              __int16 v106 = 2112;
              __int16 v107 = v61;
              _os_log_error_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
            }
            unint64_t v61 = v61;
            *a8 = v61;
            BOOL v55 = 1;
          }
          double v60 = (void *)v96;
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    double v56 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      id v57 = (objc_class *)objc_opt_class();
      double v58 = NSStringFromClass(v57);
      unint64_t v59 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      id v103 = v58;
      __int16 v104 = 2112;
      __int16 v105 = v59;
      __int16 v106 = 2112;
      __int16 v107 = @"YES";
      __int16 v108 = 2048;
      uint64_t v109 = [v16 count];
      __int16 v110 = 2048;
      uint64_t v111 = [v18 count];
      _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyCentroid doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);
    }
    double v60 = 0;
    unint64_t v61 = 0;
    BOOL v55 = 1;
    goto LABEL_27;
  }
  BOOL v54 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a8)
  {
    BOOL v53 = @"otherWorkout";
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v53);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:
  BOOL v55 = 1;
LABEL_28:

  return v55;
}

- (BOOL)_isPreFilteredRunningTrackBasedForWorkout:(id)a3 cachedDictionary:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10
      && ([v10 objectForKeyedSubscript:@"kRTCacheKeyBoundingBoxVertices"],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      context = (void *)MEMORY[0x1E016D870]();
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      id v14 = [v11 objectForKeyedSubscript:@"kRTCacheKeyBoundingBoxVertices"];
      id v15 = [(RTWorkoutRouteManager *)self _getCoordinatesFromRTPairs:v14];

      id v40 = 0;
      [(RTWorkoutRouteManager *)self _getCGRectFromCoordinates:v15 verticesCount:4 outError:&v40];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v24 = (__CFString *)v40;
      if (v24)
      {
        id v25 = v24;
        BOOL v26 = 0;
      }
      else
      {
        id v39 = 0;
        BOOL v32 = -[RTWorkoutRouteManager _isBoundingBoxAreaLessThanThresholdSubPrefilter:verticesCount:stimulationDate:error:](self, "_isBoundingBoxAreaLessThanThresholdSubPrefilter:verticesCount:stimulationDate:error:", 4, v13, &v39, v17, v19, v21, v23);
        id v25 = (__CFString *)v39;
        BOOL v26 = 0;
        if (!v25 && v32)
        {
          BOOL v26 = -[RTWorkoutRouteManager _isBoundingBoxDimensionsWithinTrackThresholdsSubPrefilter:](self, "_isBoundingBoxDimensionsWithinTrackThresholdsSubPrefilter:", v17, v19, v21, v23);
          id v25 = 0;
        }
      }
      if (v15) {
        free(v15);
      }
      if (!a5 || !v25) {
        goto LABEL_25;
      }
      double v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        CLLocationDegrees v35 = (objc_class *)objc_opt_class();
        CLLocationDegrees v36 = NSStringFromClass(v35);
        CLLocationDegrees v37 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        unint64_t v42 = v36;
        __int16 v43 = 2112;
        uint64_t v44 = v37;
        __int16 v45 = 2112;
        double v46 = v25;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v25 = v25;
      *a5 = v25;
    }
    else
    {
      double v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        CLLocationDegrees v28 = (objc_class *)objc_opt_class();
        CLLocationDegrees v29 = NSStringFromClass(v28);
        CLLocationDegrees v30 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        unint64_t v42 = v29;
        __int16 v43 = 2112;
        uint64_t v44 = v30;
        __int16 v45 = 2112;
        double v46 = @"YES";
        __int16 v47 = 2048;
        uint64_t v48 = [v11 count];
        _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyBoundingBoxVertices doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu,", buf, 0x2Au);
      }
      id v13 = 0;
      id v25 = 0;
    }
    BOOL v26 = 1;
LABEL_25:

    goto LABEL_26;
  }
  CLLocationDegrees v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"workout");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v26 = 1;
LABEL_26:

  return v26;
}

- (BOOL)_isBoundingBoxAreaLessThanThresholdSubPrefilter:(CGRect)a3 verticesCount:(unint64_t)a4 stimulationDate:(id)a5 error:(id *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = [(RTWorkoutRouteManager *)self distanceCalculator];
  id v34 = 0;
  [v15 computeBoundingBoxArea:a4 locationsCount:&v34 error:x, y, width, height];
  double v17 = v16;
  double v18 = (__CFString *)v34;

  if (a6 && v18)
  {
    double v19 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CLLocationDegrees v31 = (objc_class *)objc_opt_class();
      BOOL v32 = NSStringFromClass(v31);
      double v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      CLLocationDegrees v36 = v32;
      __int16 v37 = 2112;
      CLLocationDegrees v38 = v33;
      __int16 v39 = 2112;
      id v40 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    BOOL v20 = 0;
    *a6 = v18;
  }
  else
  {
    BOOL v20 = v17 < 40000.0;
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      double v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      double v24 = NSStringFromSelector(a2);
      if (v17 >= 40000.0) {
        id v25 = @"NO";
      }
      else {
        id v25 = @"YES";
      }
      BOOL v26 = [MEMORY[0x1E4F1C9C8] date];
      [v26 timeIntervalSinceDate:v14];
      uint64_t v28 = v27;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413826;
      CLLocationDegrees v36 = v23;
      __int16 v37 = 2112;
      CLLocationDegrees v38 = v24;
      __int16 v39 = 2112;
      id v40 = v25;
      __int16 v41 = 2048;
      double v42 = v17;
      __int16 v43 = 2048;
      uint64_t v44 = 0x40E3880000000000;
      __int16 v45 = 2048;
      uint64_t v46 = v28;
      __int16 v47 = 2048;
      uint64_t v48 = v29;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, area is less than threshold, pre-filtered, %@, area, %.3f, threshold, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);
    }
  }

  return v20;
}

- (BOOL)_isBoundingBoxDimensionsWithinTrackThresholdsSubPrefilter:(CGRect)a3
{
  return a3.size.height < 200.0 && a3.size.width < 200.0;
}

- (BOOL)_isEligibleForCurveOrientation:(CLLocationCoordinate2D *)a3 lastLocation:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: firstLocation", buf, 2u);
    }

    if (a5)
    {
      double v18 = @"firstLocation";
LABEL_16:
      _RTErrorInvalidParameterCreate((uint64_t)v18);
      BOOL v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v16;
    }
    return 0;
  }
  if (!a4)
  {
    double v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lastLocation", buf, 2u);
    }

    if (a5)
    {
      double v18 = @"lastLocation";
      goto LABEL_16;
    }
    return 0;
  }
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [(RTWorkoutRouteManager *)self distanceCalculator];
  id v33 = 0;
  [v11 distanceFromLocationCoordinate:a3 toLocationCoordinate:a4 error:&v33];
  double v13 = v12;
  id v14 = (__CFString *)v33;

  if (a5 && v14)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      CLLocationDegrees v30 = (objc_class *)objc_opt_class();
      CLLocationDegrees v31 = NSStringFromClass(v30);
      BOOL v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      CLLocationDegrees v35 = v31;
      __int16 v36 = 2112;
      __int16 v37 = v32;
      __int16 v38 = 2112;
      __int16 v39 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    BOOL v16 = 0;
    *a5 = v14;
  }
  else
  {
    BOOL v16 = v13 < 350.0;
    BOOL v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      double v21 = (objc_class *)objc_opt_class();
      double v22 = NSStringFromClass(v21);
      double v23 = NSStringFromSelector(a2);
      if (v13 >= 350.0) {
        double v24 = @"NO";
      }
      else {
        double v24 = @"YES";
      }
      id v25 = [MEMORY[0x1E4F1C9C8] date];
      [v25 timeIntervalSinceDate:v10];
      uint64_t v27 = v26;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413826;
      CLLocationDegrees v35 = v22;
      __int16 v36 = 2112;
      __int16 v37 = v23;
      __int16 v38 = 2112;
      __int16 v39 = v24;
      __int16 v40 = 2048;
      double v41 = v13;
      __int16 v42 = 2048;
      uint64_t v43 = 0x4075E00000000000;
      __int16 v44 = 2048;
      uint64_t v45 = v27;
      __int16 v46 = 2048;
      uint64_t v47 = v28;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenFirstAndLastLocations is greater than distance threshold, %@, distanceBetweenFirstLocationAndLastLocations (in meters), %.3f, distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);
    }
  }

  return v16;
}

- (BOOL)_isPreFilteredCurveOrientationBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 error:(id *)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    __int16 v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a7) {
      goto LABEL_31;
    }
    __int16 v39 = @"workout";
    goto LABEL_30;
  }
  if (v14)
  {
    if (v13)
    {
      BOOL v16 = [v13 objectForKeyedSubscript:@"kRTCacheKeyCurveOrientation"];
      double v17 = v16;
      if (v15 && v16)
      {
        double v18 = [v15 objectForKeyedSubscript:@"kRTCacheKeyCurveOrientation"];

        if (v18)
        {
          context = (void *)MEMORY[0x1E016D870]();
          uint64_t v53 = [MEMORY[0x1E4F1C9C8] date];
          double v19 = [v13 objectForKeyedSubscript:@"kRTCacheKeyCurveOrientation"];
          BOOL v20 = [v19 firstObject];
          double v21 = [v20 firstObject];
          uint64_t v51 = [v21 unsignedIntegerValue];

          double v22 = [v15 objectForKeyedSubscript:@"kRTCacheKeyCurveOrientation"];
          double v23 = [v22 firstObject];
          double v24 = [v23 firstObject];
          uint64_t v25 = [v24 unsignedIntegerValue];

          if (v51) {
            BOOL v26 = v25 == 0;
          }
          else {
            BOOL v26 = 1;
          }
          uint64_t v50 = v25;
          BOOL v27 = v26 || v51 == v25;
          uint64_t v28 = v53;
          LODWORD(v29) = v27;
          CLLocationDegrees v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            CLLocationDegrees v31 = (objc_class *)objc_opt_class();
            uint64_t v49 = NSStringFromClass(v31);
            uint64_t v48 = NSStringFromSelector(a2);
            if (v29) {
              BOOL v32 = @"NO";
            }
            else {
              BOOL v32 = @"YES";
            }
            __int16 v46 = [v12 UUID];
            char v47 = v29;
            id v33 = +[RTWorkoutRouteManager curveOrientationTypeToString:v51];
            uint64_t v45 = [v14 UUID];
            uint64_t v29 = +[RTWorkoutRouteManager curveOrientationTypeToString:v50];
            id v52 = [MEMORY[0x1E4F1C9C8] date];
            [v52 timeIntervalSinceDate:v53];
            uint64_t v35 = v34;
            +[RTRuntime footprint];
            *(_DWORD *)buf = 138414338;
            double v56 = v49;
            __int16 v57 = 2112;
            double v58 = v48;
            __int16 v59 = 2112;
            double v60 = v32;
            __int16 v61 = 2112;
            uint64_t v62 = (uint64_t)v46;
            __int16 v63 = 2112;
            uint64_t v64 = (uint64_t)v33;
            __int16 v65 = 2112;
            double v66 = v45;
            __int16 v67 = 2112;
            uint64_t v68 = v29;
            __int16 v69 = 2048;
            uint64_t v70 = v35;
            __int16 v71 = 2048;
            uint64_t v72 = v36;
            _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, equal curve orientation, pre-filtered, %@, workout.UUID, %@, curveOrientation %@,  otherWorkout.UUID, %@, otherCurveOrientation, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x5Cu);

            LOBYTE(v29) = v47;
          }

          char v37 = v29 ^ 1;
LABEL_35:

          goto LABEL_36;
        }
      }
      else
      {
      }
    }
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    char v37 = 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      double v41 = (objc_class *)objc_opt_class();
      __int16 v42 = NSStringFromClass(v41);
      uint64_t v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      double v56 = v42;
      __int16 v57 = 2112;
      double v58 = v43;
      __int16 v59 = 2112;
      double v60 = @"YES";
      __int16 v61 = 2048;
      uint64_t v62 = [v13 count];
      __int16 v63 = 2048;
      uint64_t v64 = [v15 count];
      char v37 = 1;
      _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyCurveOrientation doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);
    }
    goto LABEL_35;
  }
  __int16 v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a7)
  {
    __int16 v39 = @"otherWorkout";
LABEL_30:
    _RTErrorInvalidParameterCreate((uint64_t)v39);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_31:
  char v37 = 1;
LABEL_36:

  return v37;
}

- (BOOL)_isPreFilteredIOUBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (!v15)
  {
    uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8) {
      goto LABEL_21;
    }
    uint64_t v36 = @"workout";
    goto LABEL_20;
  }
  if (v17)
  {
    if (v16)
    {
      BOOL v20 = [v16 objectForKeyedSubscript:@"kRTCacheKeyBoundingBoxVertices"];
      double v21 = v20;
      if (v18 && v20)
      {
        double v22 = [v18 objectForKeyedSubscript:@"kRTCacheKeyBoundingBoxVertices"];

        if (v22)
        {
          aSelector = a2;
          context = (void *)MEMORY[0x1E016D870]();
          uint64_t v66 = [MEMORY[0x1E4F1C9C8] date];
          double v23 = [v16 objectForKeyedSubscript:@"kRTCacheKeyBoundingBoxVertices"];
          double v24 = [(RTWorkoutRouteManager *)self _getCoordinatesFromRTPairs:v23];

          uint64_t v25 = [v18 objectForKeyedSubscript:@"kRTCacheKeyBoundingBoxVertices"];
          BOOL v26 = [(RTWorkoutRouteManager *)self _getCoordinatesFromRTPairs:v25];

          BOOL v27 = [(RTWorkoutRouteManager *)self distanceCalculator];
          id v68 = 0;
          __int16 v65 = v24;
          uint64_t v28 = v24;
          uint64_t v29 = v26;
          [v27 computeIntersectionOverUnionUsingBoundingBoxBetweenLocations:v28 locationsCount:4 otherLocations:v26 otherLocationsCount:4 error:&v68];
          double v31 = v30;
          BOOL v32 = (__CFString *)v68;

          if (!v32)
          {
            if (v19)
            {
              id v33 = [NSNumber numberWithDouble:v31];
              [v19 setObject:v33 forKeyedSubscript:@"kRTSimilarityIOU"];
            }
            if ([(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v15]) {
              BOOL v34 = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v17];
            }
            else {
              BOOL v34 = 0;
            }
            id v67 = 0;
            -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTPreFilterIntersectionOverUnionThreshold", v34, [v15 workoutActivityType], &v67);
            double v46 = v45;
            char v47 = (__CFString *)v67;
            if (v47)
            {
              BOOL v32 = v47;
            }
            else
            {
              uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                uint64_t v49 = (objc_class *)objc_opt_class();
                uint64_t v50 = NSStringFromClass(v49);
                uint64_t v51 = NSStringFromSelector(aSelector);
                id v52 = @"NO";
                if (v31 < v46) {
                  id v52 = @"YES";
                }
                uint64_t v62 = [MEMORY[0x1E4F1C9C8] date:v52 with:v51];
                [v62 timeIntervalSinceDate:v66];
                uint64_t v54 = v53;
                +[RTRuntime footprint];
                *(_DWORD *)buf = 138413826;
                uint64_t v70 = v50;
                __int16 v71 = 2112;
                uint64_t v72 = v61;
                __int16 v73 = 2112;
                double v74 = v60;
                __int16 v75 = 2048;
                uint64_t v76 = *(void *)&v31;
                __int16 v77 = 2048;
                uint64_t v78 = *(void *)&v46;
                __int16 v79 = 2048;
                uint64_t v80 = v54;
                __int16 v81 = 2048;
                uint64_t v82 = v55;
                _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, IOU is less than threshold, pre-filtered, %@, IOU, %.3f, Intersection Over Union Threshold percentage, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);
              }
              BOOL v32 = 0;
              if (v31 < v46)
              {
                BOOL v38 = 1;
LABEL_38:
                if (v65) {
                  free(v65);
                }
                if (v29) {
                  free(v29);
                }
                if (a8 && v32)
                {
                  double v56 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    __int16 v57 = (objc_class *)objc_opt_class();
                    double v58 = NSStringFromClass(v57);
                    __int16 v59 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138412802;
                    uint64_t v70 = v58;
                    __int16 v71 = 2112;
                    uint64_t v72 = v59;
                    __int16 v73 = 2112;
                    double v74 = v32;
                    _os_log_error_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
                  }
                  BOOL v32 = v32;
                  *a8 = v32;
                  BOOL v38 = 1;
                }
                uint64_t v43 = (void *)v66;
LABEL_26:

                goto LABEL_27;
              }
            }
          }
          BOOL v38 = 0;
          goto LABEL_38;
        }
      }
      else
      {
      }
    }
    __int16 v39 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      __int16 v40 = (objc_class *)objc_opt_class();
      double v41 = NSStringFromClass(v40);
      __int16 v42 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      uint64_t v70 = v41;
      __int16 v71 = 2112;
      uint64_t v72 = v42;
      __int16 v73 = 2112;
      double v74 = @"YES";
      __int16 v75 = 2048;
      uint64_t v76 = [v16 count];
      __int16 v77 = 2048;
      uint64_t v78 = [v18 count];
      _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyBoundingBoxVertices doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);
    }
    uint64_t v43 = 0;
    BOOL v32 = 0;
    BOOL v38 = 1;
    goto LABEL_26;
  }
  char v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a8)
  {
    uint64_t v36 = @"otherWorkout";
LABEL_20:
    _RTErrorInvalidParameterCreate((uint64_t)v36);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:
  BOOL v38 = 1;
LABEL_27:

  return v38;
}

- (double)similarityDistanceUsingPreFilteringResults:(id)a3 error:(id *)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v66 = v7;
    __int16 v63 = self;
    aSelector = a2;
    id v9 = 0;
    LOBYTE(v10) = 0;
    char v11 = 1;
    double v12 = 10000.0;
    id v13 = @"kRTSimilarityDifferenceInTotalDistance";
    id v14 = @"kRTSimilarityDistanceBetweenFirstLocations";
    double v15 = 10000.0;
    double v16 = 10000.0;
    double v17 = 10000.0;
    double v18 = 10000.0;
    double v19 = 0.0;
    while (1)
    {
      if ((v11 & 1) == 0)
      {
        int v48 = 0;
        int v49 = 0;
        double v21 = v9;
        double v19 = 10000.0;
        goto LABEL_42;
      }
      char v65 = v10;
      BOOL v20 = (void *)MEMORY[0x1E016D870]();
      double v21 = [MEMORY[0x1E4F1C9C8] date];

      uint64_t v22 = [v66 objectForKeyedSubscript:v13];
      if (!v22) {
        break;
      }
      double v23 = (void *)v22;
      double v24 = v20;
      uint64_t v25 = [v66 objectForKeyedSubscript:v14];
      if (!v25) {
        goto LABEL_40;
      }
      BOOL v26 = (void *)v25;
      BOOL v27 = v21;
      uint64_t v28 = v13;
      uint64_t v29 = v14;
      uint64_t v30 = [v66 objectForKeyedSubscript:@"kRTSimilarityDistanceBetweenLastLocations"];
      if (!v30) {
        goto LABEL_39;
      }
      double v31 = (void *)v30;
      uint64_t v32 = [v66 objectForKeyedSubscript:@"kRTSimilarityDistanceBetweenCentroids"];
      if (!v32)
      {

LABEL_39:
        double v21 = v27;
LABEL_40:

        BOOL v20 = v24;
        break;
      }
      id v33 = (void *)v32;
      BOOL v34 = [v66 objectForKeyedSubscript:@"kRTSimilarityIOU"];

      id v14 = v29;
      id v13 = v28;
      double v21 = v27;
      BOOL v20 = v24;
      if (!v34) {
        break;
      }
      uint64_t v35 = [v66 objectForKeyedSubscript:@"kRTSimilarityIsLongWorkout"];
      int v10 = [v35 BOOLValue];

      uint64_t v36 = [v66 objectForKeyedSubscript:v13];
      [v36 doubleValue];
      double v15 = v37;

      BOOL v38 = [v66 objectForKeyedSubscript:v14];
      [v38 doubleValue];
      double v16 = v39;

      __int16 v40 = [v66 objectForKeyedSubscript:@"kRTSimilarityDistanceBetweenLastLocations"];
      [v40 doubleValue];
      double v17 = v41;

      __int16 v42 = [v66 objectForKeyedSubscript:@"kRTSimilarityDistanceBetweenCentroids"];
      [v42 doubleValue];
      double v18 = v43;

      __int16 v44 = [v66 objectForKeyedSubscript:@"kRTSimilarityIOU"];
      [v44 doubleValue];
      double v12 = v45;

      int v46 = (v15 <= 150.0) & ~v10;
      if (v16 > 150.0) {
        int v46 = 0;
      }
      if (v17 > 150.0) {
        int v46 = 0;
      }
      if (v18 > 150.0) {
        int v46 = 0;
      }
      if (v15 <= 250.0) {
        int v47 = v10;
      }
      else {
        int v47 = 0;
      }
      if (v16 > 250.0) {
        int v47 = 0;
      }
      if (v17 > 250.0) {
        int v47 = 0;
      }
      if (v18 > 250.0) {
        int v47 = 0;
      }
      if (v12 >= 0.97) {
        int v48 = v46;
      }
      else {
        int v48 = 0;
      }
      if (v12 >= 0.97) {
        int v49 = v47;
      }
      else {
        int v49 = 0;
      }
      if ((v48 & 1) == 0)
      {
        char v11 = 0;
        id v9 = v21;
        if (!v49) {
          continue;
        }
      }
      goto LABEL_42;
    }
    int v48 = 0;
    int v49 = 0;
    double v19 = 10000.0;
    LOBYTE(v10) = v65;
LABEL_42:
    uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      id v52 = (objc_class *)objc_opt_class();
      uint64_t v53 = NSStringFromClass(v52);
      uint64_t v54 = NSStringFromSelector(aSelector);
      if (v10) {
        uint64_t v55 = @"YES";
      }
      else {
        uint64_t v55 = @"NO";
      }
      if (v48) {
        double v56 = @"YES";
      }
      else {
        double v56 = @"NO";
      }
      if (v49) {
        __int16 v57 = @"YES";
      }
      else {
        __int16 v57 = @"NO";
      }
      double v58 = [[MEMORY[0x1E4F1C9C8] date:v63];
      [v58 timeIntervalSinceDate:v21];
      uint64_t v60 = v59;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138416642;
      id v68 = v53;
      __int16 v69 = 2112;
      uint64_t v70 = v54;
      __int16 v71 = 2048;
      double v72 = v19;
      __int16 v73 = 2112;
      double v74 = v55;
      __int16 v75 = 2112;
      uint64_t v76 = v56;
      __int16 v77 = 2112;
      uint64_t v78 = v57;
      __int16 v79 = 2048;
      double v80 = v15;
      __int16 v81 = 2048;
      uint64_t v82 = 0x4062C00000000000;
      __int16 v83 = 2048;
      double v84 = v16;
      __int16 v85 = 2048;
      uint64_t v86 = 0x4062C00000000000;
      __int16 v87 = 2048;
      double v88 = v17;
      __int16 v89 = 2048;
      uint64_t v90 = 0x4062C00000000000;
      __int16 v91 = 2048;
      double v92 = v18;
      __int16 v93 = 2048;
      uint64_t v94 = 0x4062C00000000000;
      __int16 v95 = 2048;
      double v96 = v12;
      __int16 v97 = 2048;
      uint64_t v98 = 0x3FEF0A3D70A3D70ALL;
      __int16 v99 = 2048;
      uint64_t v100 = v60;
      __int16 v101 = 2048;
      uint64_t v102 = v61;
      _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_INFO, "%@, %@, similarity distance, %.3f, isLongWorkout, %@, metShortWorkoutThresholds, %@, metLongWorkoutThresholds, %@, differenceInTotalDistance (in meters), %.4f, differenceInTotalDistance threshold (in meters), %.4f,  distanceBetweenFirstLocations (in meters), %.4f, distanceBetweenFirstLocations threshold (in meters), %.4f, distanceBetweenLastLocations (in meters), %.4f, distanceBetweenLastLocations threshold (in meters), %.4f, distanceBetweenCentroids (in meters), %.4f, distanceBetweenCentroids threshold (in meters), %.4f, iou (in percentage), %.4f, iou threshold (in percentage), %.4f, latency, %.4f sec, footprint, %.4f MB", buf, 0xB6u);
    }
    uint64_t v8 = v66;
  }
  else
  {
    uint64_t v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: preFilteringResults", buf, 2u);
    }

    double v19 = 1.0;
    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"preFilteringResults");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v19;
}

- (unint64_t)_getCurveOrientationTypeForLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v7 = a4 - 1;
    if (a4 > 1)
    {
      double v16 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      *double v16 = *a3;
      double v17 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      *double v17 = a3[a4 - 1];
      id v27 = 0;
      BOOL v18 = [(RTWorkoutRouteManager *)self _isEligibleForCurveOrientation:v16 lastLocation:v17 error:&v27];
      id v11 = v27;
      if (v18)
      {
        uint64_t v19 = 0;
        p_double longitude = &a3->longitude;
        double v21 = 0.0;
        do
        {
          if (v7 == v19) {
            uint64_t v22 = 0;
          }
          else {
            uint64_t v22 = v19 + 1;
          }
          double v21 = v21 + *p_longitude * a3[v22].latitude - a3[v22].longitude * *(p_longitude - 1);
          p_longitude += 2;
          ++v19;
        }
        while (a4 != v19);
        if (v16) {
          free(v16);
        }
        double v23 = v21 * 0.5;
        if (v17) {
          free(v17);
        }
        double v24 = fabs(v23);
        uint64_t v25 = 2;
        if (v23 < 0.0) {
          uint64_t v25 = 1;
        }
        if (v24 >= 0.000005) {
          unint64_t v12 = v25;
        }
        else {
          unint64_t v12 = 0;
        }
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F5CFE8];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"less number of locations than required";
      int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      id v11 = [v8 errorWithDomain:v9 code:7 userInfo:v10];

      if (a5)
      {
        id v11 = v11;
        unint64_t v12 = 0;
        *a5 = v11;
LABEL_25:

        return v12;
      }
    }
    unint64_t v12 = 0;
    goto LABEL_25;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
  }

  if (!a5) {
    return 0;
  }
  _RTErrorInvalidParameterCreate(@"locations");
  unint64_t v12 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (id)_readClustersFromHealthKitWithError:(id *)a3
{
  __int16 v99 = a3;
  v155[1] = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  id v109 = 0;
  uint64_t v104 = *MEMORY[0x1E4F5CFE8];
  uint64_t v105 = *MEMORY[0x1E4F28568];
  char v4 = 1;
  double v113 = v3;
  do
  {
    if ((v4 & 1) == 0) {
      goto LABEL_59;
    }
    uint64_t v103 = (void *)MEMORY[0x1E016D870]();
    dispatch_semaphore_t v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, Fetching clusters from healthKit.", buf, 0x16u);
    }
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v153 = __Block_byref_object_copy__133;
    *(void *)&long long v154 = __Block_byref_object_dispose__133;
    *((void *)&v154 + 1) = 0;
    uint64_t v132 = 0;
    id v133 = &v132;
    uint64_t v134 = 0x3032000000;
    char v135 = __Block_byref_object_copy__133;
    unint64_t v136 = __Block_byref_object_dispose__133;
    id v137 = 0;
    int v10 = [(RTWorkoutRouteManager *)self healthKitManager];
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke;
    v128[3] = &unk_1E6B905F0;
    uint64_t v130 = buf;
    uint64_t v131 = &v132;
    id v11 = v9;
    uint64_t v129 = v11;
    [v10 fetchWorkoutClustersWithHandler:v128];

    unint64_t v12 = v11;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      double v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      BOOL v18 = objc_opt_new();
      uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v21 = [v20 filteredArrayUsingPredicate:v19];
      uint64_t v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      double v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)__int16 v147 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v147, 2u);
      }

      double v24 = (void *)MEMORY[0x1E4F28C58];
      *(void *)id v139 = v105;
      *(void *)__int16 v147 = @"semaphore wait timeout";
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v139 count:1];
      id v26 = [v24 errorWithDomain:v104 code:15 userInfo:v25];

      if (v26)
      {
        id v26 = v26;
      }
    }
    else
    {
      id v26 = 0;
    }

    id v27 = v26;
    uint64_t v28 = v27;
    uint64_t v29 = (void *)v133[5];
    if (v29)
    {
      id v30 = v29;

      char v31 = 0;
      int v32 = 1;
      id v109 = v30;
      goto LABEL_57;
    }
    if (v27)
    {
      id v33 = v27;

      char v31 = 0;
      int v32 = 1;
      id v109 = v33;
      goto LABEL_57;
    }
    BOOL v34 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = [*(id *)(*(void *)&buf[8] + 40) count];
      *(_DWORD *)__int16 v147 = 138412802;
      *(void *)&void v147[4] = v36;
      *(_WORD *)&v147[12] = 2112;
      *(void *)&v147[14] = v37;
      *(_WORD *)&v147[22] = 2048;
      int v148 = (uint64_t (*)(uint64_t, uint64_t))v38;
      _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, %@, fetched clusters from healthkit, fetchedClusters count, %lu", v147, 0x20u);
    }
    if (![*(id *)(*(void *)&buf[8] + 40) count])
    {
      id v101 = v113;
      char v31 = 0;
      int v32 = 0;
      goto LABEL_57;
    }
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id obj = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v39 = [obj countByEnumeratingWithState:&v124 objects:v151 count:16];
    if (!v39)
    {
      id v111 = 0;
      goto LABEL_56;
    }
    id v111 = 0;
    uint64_t v106 = *(void *)v125;
    do
    {
      uint64_t v40 = 0;
      uint64_t v107 = v39;
      do
      {
        if (*(void *)v125 != v106) {
          objc_enumerationMutation(obj);
        }
        double v41 = *(void **)(*((void *)&v124 + 1) + 8 * v40);
        context = (void *)MEMORY[0x1E016D870]();
        dispatch_semaphore_t v42 = dispatch_semaphore_create(0);

        *(void *)__int16 v147 = 0;
        *(void *)&v147[8] = v147;
        *(void *)&v147[16] = 0x3032000000;
        int v148 = __Block_byref_object_copy__133;
        __int16 v149 = __Block_byref_object_dispose__133;
        id v150 = (id)objc_opt_new();
        double v43 = [(RTWorkoutRouteManager *)self healthKitManager];
        __int16 v44 = [v41 clusterUUID];
        v120[0] = MEMORY[0x1E4F143A8];
        v120[1] = 3221225472;
        v120[2] = __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke_224;
        v120[3] = &unk_1E6B905F0;
        BOOL v122 = v147;
        char v123 = &v132;
        double v45 = v42;
        double v121 = v45;
        [v43 fetchWorkoutUUIDsForClusterUUID:v44 handler:v120];

        unint64_t v12 = v45;
        int v46 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v47 = dispatch_time(0, 3600000000000);
        id v48 = v111;
        if (dispatch_semaphore_wait(v12, v47))
        {
          int v49 = [MEMORY[0x1E4F1C9C8] now];
          [v49 timeIntervalSinceDate:v46];
          double v51 = v50;
          id v52 = objc_opt_new();
          uint64_t v53 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
          uint64_t v54 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v55 = [v54 filteredArrayUsingPredicate:v53];
          double v56 = [v55 firstObject];

          [v52 submitToCoreAnalytics:v56 type:1 duration:v51];
          __int16 v57 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)id v139 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v139, 2u);
          }

          double v58 = (void *)MEMORY[0x1E4F28C58];
          v155[0] = v105;
          *(void *)id v139 = @"semaphore wait timeout";
          uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v155 count:1];
          uint64_t v60 = [v58 errorWithDomain:v104 code:15 userInfo:v59];

          id v48 = v111;
          if (v60)
          {
            id v48 = v60;
          }
        }

        id v61 = v48;
        uint64_t v62 = (void *)v133[5];
        id v111 = v61;
        if (v62)
        {
          id v63 = v62;
LABEL_32:
          uint64_t v64 = v109;
          int v65 = 5;
          id v109 = v63;
          goto LABEL_33;
        }
        if (v61)
        {
          id v63 = v61;
          goto LABEL_32;
        }
        uint64_t v66 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          id v67 = (objc_class *)objc_opt_class();
          NSStringFromClass(v67);
          id v68 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v69 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v70 = [*(id *)(*(void *)&v147[8] + 40) count];
          *(_DWORD *)id v139 = 138412802;
          *(void *)&v139[4] = v68;
          __int16 v140 = 2112;
          id v141 = v69;
          __int16 v142 = 2048;
          uint64_t v143 = v70;
          _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "%@, %@, fetched cluster's uuids, uuids count, %lu", v139, 0x20u);
        }
        if (![*(id *)(*(void *)&v147[8] + 40) count])
        {
          int v65 = 6;
          goto LABEL_34;
        }
        __int16 v71 = [(RTWorkoutRouteManager *)self healthKitManager];
        double v72 = [*(id *)(*(void *)&v147[8] + 40) anyObject];
        id v146 = v72;
        __int16 v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
        double v74 = (id *)(v133 + 5);
        id v119 = (id)v133[5];
        uint64_t v64 = [v71 getWorkoutsWithUUIDs:v73 error:&v119];
        objc_storeStrong(v74, v119);

        __int16 v75 = (void *)v133[5];
        if (v75)
        {
          uint64_t v76 = v109;
          int v65 = 5;
          id v109 = v75;
        }
        else
        {
          if (![v64 count])
          {
            int v65 = 6;
            goto LABEL_33;
          }
          __int16 v77 = [v64 firstObject];
          uint64_t v76 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v77 workoutActivityType]);

          uint64_t v78 = [v113 objectForKeyedSubscript:v76];
          LODWORD(v77) = v78 == 0;

          if (v77)
          {
            __int16 v79 = objc_opt_new();
            [v113 setObject:v79 forKeyedSubscript:v76];
          }
          double v80 = [v113 objectForKeyedSubscript:v76, v99];
          [v80 addObject:*(void *)(*(void *)&v147[8] + 40)];

          __int16 v81 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            uint64_t v82 = (objc_class *)objc_opt_class();
            NSStringFromClass(v82);
            id v83 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v84 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v85 = [*(id *)(*(void *)&v147[8] + 40) count];
            *(_DWORD *)id v139 = 138413058;
            *(void *)&v139[4] = v83;
            __int16 v140 = 2112;
            id v141 = v84;
            __int16 v142 = 2112;
            uint64_t v143 = (uint64_t)v76;
            __int16 v144 = 2048;
            uint64_t v145 = v85;
            _os_log_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_INFO, "%@, %@, added new cluster of activity type, %@, uuids count, %lu", v139, 0x2Au);
          }
          int v65 = 0;
        }

LABEL_33:
LABEL_34:

        _Block_object_dispose(v147, 8);
        if (v65 != 6 && v65) {
          goto LABEL_56;
        }
        ++v40;
      }
      while (v107 != v40);
      uint64_t v39 = [obj countByEnumeratingWithState:&v124 objects:v151 count:16];
    }
    while (v39);
LABEL_56:

    uint64_t v86 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = 0;

    int v32 = 0;
    char v31 = 1;
LABEL_57:

    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(buf, 8);

    char v4 = 0;
    double v3 = v113;
  }
  while ((v31 & 1) != 0);
  if (v32)
  {
LABEL_59:
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    [v3 allKeys];
    id v112 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v87 = [v112 countByEnumeratingWithState:&v115 objects:v138 count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v116;
      do
      {
        for (uint64_t i = 0; i != v87; ++i)
        {
          if (*(void *)v116 != v88) {
            objc_enumerationMutation(v112);
          }
          uint64_t v90 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v115 + 1) + 8 * i);
          __int16 v91 = (void *)MEMORY[0x1E016D870]();
          double v92 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            __int16 v93 = (objc_class *)objc_opt_class();
            uint64_t v94 = NSStringFromClass(v93);
            __int16 v95 = NSStringFromSelector(a2);
            double v96 = [v113 objectForKeyedSubscript:v90];
            uint64_t v97 = [v96 count];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v94;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v95;
            *(_WORD *)&buf[22] = 2112;
            __int16 v153 = v90;
            LOWORD(v154) = 2048;
            *(void *)((char *)&v154 + 2) = v97;
            _os_log_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_INFO, "%@, %@, workout activity type, %@, cluster count, %lu", buf, 0x2Au);
          }
        }
        uint64_t v87 = [v112 countByEnumeratingWithState:&v115 objects:v138 count:16];
      }
      while (v87);
    }

    if (v100) {
      *uint64_t v100 = v109;
    }
    double v3 = v113;
    id v101 = v113;
  }

  return v101;
}

void __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke_224(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v12 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithArray:v12];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_clusterizeWorkoutsWithError:(id *)a3
{
  v289[1] = *MEMORY[0x1E4F143B8];
  double v206 = objc_opt_new();
  char v4 = objc_opt_new();
  uint64_t v210 = objc_opt_new();
  uint64_t v200 = [[RTClusterizeResults alloc] initWithClusters:v4 objectIDs:v210];
  id v264 = 0;
  uint64_t v216 = self;
  [(RTWorkoutRouteManager *)self _getMaxDistanceThresholdForMetric:[(RTWorkoutRouteManager *)self distanceMetric] error:&v264];
  double v6 = v5;
  id v7 = v264;
  id v201 = v7;
  if (a3 && v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v181 = (objc_class *)objc_opt_class();
      uint64_t v182 = NSStringFromClass(v181);
      uint64_t v183 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v182;
      __int16 v270 = 2112;
      id v271 = v183;
      __int16 v272 = 2112;
      uint64_t v273 = (uint64_t)v201;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    *a3 = v201;
    goto LABEL_143;
  }
  double v198 = (void *)MEMORY[0x1E016D870]();
  uint64_t v260 = 0;
  id v261 = &v260;
  uint64_t v262 = 0x2020000000;
  uint64_t v263 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  int v10 = [(RTWorkoutRouteManager *)v216 workoutDistanceStore];
  v257[0] = MEMORY[0x1E4F143A8];
  v257[1] = 3221225472;
  v257[2] = __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke;
  v257[3] = &unk_1E6B938D8;
  id v259 = &v260;
  id v11 = v9;
  char v258 = v11;
  [v10 fetchTotalWorkoutDistancesCountWithHandler:v257];

  id v12 = v11;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_11;
  }
  double v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  BOOL v18 = objc_opt_new();
  uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v21 = [v20 filteredArrayUsingPredicate:v19];
  uint64_t v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  double v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  double v24 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v283 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v283 count:1];
  id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;
  }
  else
  {
LABEL_11:
    id v27 = 0;
  }

  id v28 = v27;
  if (v28) {
    [v206 addObject:v28];
  }
  uint64_t v253 = 0;
  v254 = &v253;
  uint64_t v255 = 0x2020000000;
  uint64_t v256 = 0;
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    id v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    int v32 = NSStringFromSelector(a2);
    uint64_t v33 = v261[3];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v31;
    __int16 v270 = 2112;
    id v271 = v32;
    __int16 v272 = 2048;
    uint64_t v273 = 5000;
    __int16 v274 = 2048;
    uint64_t v275 = v33;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, limit, %lu, totalWorkoutDistancesCount, %lu,", buf, 0x2Au);
  }
  dispatch_semaphore_t v34 = dispatch_semaphore_create(0);

  uint64_t v283 = 0;
  long long v284 = &v283;
  uint64_t v285 = 0x3032000000;
  char v286 = __Block_byref_object_copy__133;
  id v287 = __Block_byref_object_dispose__133;
  id v288 = 0;
  v251[0] = 0;
  v251[1] = v251;
  v251[2] = 0x3032000000;
  v251[3] = __Block_byref_object_copy__133;
  v251[4] = __Block_byref_object_dispose__133;
  id v252 = 0;
  uint64_t v35 = [(RTWorkoutRouteManager *)v216 workoutDistanceStore];
  v246[0] = MEMORY[0x1E4F143A8];
  v246[1] = 3221225472;
  v246[2] = __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke_226;
  v246[3] = &unk_1E6B90908;
  uint64_t v248 = &v283;
  uint64_t v249 = &v253;
  uint64_t v250 = v251;
  id v36 = v34;
  uint64_t v247 = v36;
  [v35 fetchWorkoutDistancesWithOffset:0 limit:5000 maxDistanceThreshold:0 includeVisitedRecords:v246 handler:v6];

  dsema = v36;
  id v37 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v38 = dispatch_time(0, 3600000000000);
  id v39 = v28;
  if (dispatch_semaphore_wait(dsema, v38))
  {
    uint64_t v40 = [MEMORY[0x1E4F1C9C8] now];
    [v40 timeIntervalSinceDate:v37];
    double v42 = v41;
    double v43 = objc_opt_new();
    __int16 v44 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
    double v45 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v46 = [v45 filteredArrayUsingPredicate:v44];
    dispatch_time_t v47 = [v46 firstObject];

    [v43 submitToCoreAnalytics:v47 type:1 duration:v42];
    id v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    int v49 = (void *)MEMORY[0x1E4F28C58];
    v289[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v289 count:1];
    double v51 = [v49 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v50];

    id v39 = v28;
    if (v51)
    {
      id v39 = v51;
    }
  }

  id v199 = v39;
  if (!v199)
  {
    id v52 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      uint64_t v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v56 = v254[3];
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v54;
      __int16 v270 = 2112;
      id v271 = v55;
      __int16 v272 = 2048;
      uint64_t v273 = v56;
      __int16 v274 = 2048;
      uint64_t v275 = v57;
      _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, workoutDistances count, %lu, footprint, %.4f MB", buf, 0x2Au);
    }
    long long v244 = 0u;
    long long v245 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    id obj = (id)v284[5];
    uint64_t v58 = [obj countByEnumeratingWithState:&v242 objects:v282 count:16];
    id v59 = 0;
    if (!v58)
    {
LABEL_101:

      uint64_t v152 = (void *)v284[5];
      v284[5] = 0;

      if ([v206 count])
      {
        [(RTWorkoutRouteManager *)v216 setWorkoutActivityTypeToclustersSet:0];
      }
      else
      {
        long long v232 = 0u;
        long long v233 = 0u;
        long long v230 = 0u;
        long long v231 = 0u;
        __int16 v153 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
        id v215 = [v153 allValues];

        uint64_t v154 = [v215 countByEnumeratingWithState:&v230 objects:v267 count:16];
        if (v154)
        {
          uint64_t v218 = *(void *)v231;
          do
          {
            uint64_t v155 = 0;
            uint64_t v220 = v154;
            do
            {
              if (*(void *)v231 != v218) {
                objc_enumerationMutation(v215);
              }
              unint64_t v156 = *(void **)(*((void *)&v230 + 1) + 8 * v155);
              __int16 v157 = (void *)MEMORY[0x1E016D870]();
              long long v228 = 0u;
              long long v229 = 0u;
              long long v226 = 0u;
              long long v227 = 0u;
              id v158 = v156;
              uint64_t v159 = [v158 countByEnumeratingWithState:&v226 objects:v266 count:16];
              if (v159)
              {
                uint64_t v160 = *(void *)v227;
                do
                {
                  for (uint64_t i = 0; i != v159; ++i)
                  {
                    if (*(void *)v227 != v160) {
                      objc_enumerationMutation(v158);
                    }
                    double v162 = *(void **)(*((void *)&v226 + 1) + 8 * i);
                    __int16 v163 = (void *)MEMORY[0x1E016D870]();
                    uint64_t v164 = [v162 allObjects];
                    [v4 addObject:v164];
                  }
                  uint64_t v159 = [v158 countByEnumeratingWithState:&v226 objects:v266 count:16];
                }
                while (v159);
              }

              ++v155;
            }
            while (v155 != v220);
            uint64_t v154 = [v215 countByEnumeratingWithState:&v230 objects:v267 count:16];
          }
          while (v154);
        }

        __int16 v165 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
        {
          uint64_t v166 = (objc_class *)objc_opt_class();
          NSStringFromClass(v166);
          id v167 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v168 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v169 = [v4 count];
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v167;
          __int16 v270 = 2112;
          id v271 = v168;
          __int16 v272 = 2048;
          uint64_t v273 = v169;
          __int16 v274 = 2048;
          uint64_t v275 = v170;
          _os_log_impl(&dword_1D9BFA000, v165, OS_LOG_TYPE_INFO, "%@, %@, out clusters count, %lu, footprint, %.4f MB", buf, 0x2Au);
        }
        long long v224 = 0u;
        long long v225 = 0u;
        long long v222 = 0u;
        long long v223 = 0u;
        id v221 = v4;
        uint64_t v171 = [v221 countByEnumeratingWithState:&v222 objects:v265 count:16];
        if (v171)
        {
          uint64_t v172 = 0;
          uint64_t v173 = *(void *)v223;
          unint64_t v174 = -1;
          unint64_t v175 = -1;
          double v176 = -1.0;
          do
          {
            uint64_t v177 = 0;
            uint64_t v219 = v171 + v172;
            do
            {
              if (*(void *)v223 != v173) {
                objc_enumerationMutation(v221);
              }
              uint64_t v178 = *(void **)(*((void *)&v222 + 1) + 8 * v177);
              uint64_t v179 = (void *)MEMORY[0x1E016D870]();
              if (v174 == -1 || [v178 count] < v174) {
                unint64_t v174 = [v178 count];
              }
              if (v175 == -1 || [v178 count] > v175) {
                unint64_t v175 = [v178 count];
              }
              if (v176 == -1.0) {
                double v176 = (double)(unint64_t)[v178 count];
              }
              else {
                double v176 = ((double)(unint64_t)[v178 count]
              }
                      + v176 * (double)(unint64_t)(v172 + v177 + 1))
                     / (double)(unint64_t)(v172 + v177 + 2);
              ++v177;
            }
            while (v171 != v177);
            uint64_t v171 = [v221 countByEnumeratingWithState:&v222 objects:v265 count:16];
            uint64_t v180 = v219;
            uint64_t v172 = v219;
          }
          while (v171);
        }
        else
        {
          uint64_t v180 = 0;
          double v176 = -1.0;
          unint64_t v174 = -1;
          unint64_t v175 = -1;
        }

        uint64_t v184 = [NSNumber numberWithUnsignedInteger:v180];
        double v185 = [(RTWorkoutRouteManager *)v216 processWorkoutMetrics];
        [v185 setObject:v184 forKeyedSubscript:@"clustering_count_clusters"];

        v186 = [NSNumber numberWithUnsignedInteger:v174];
        BOOL v187 = [(RTWorkoutRouteManager *)v216 processWorkoutMetrics];
        [v187 setObject:v186 forKeyedSubscript:@"clustering_min_cluster_size"];

        BOOL v188 = [NSNumber numberWithUnsignedInteger:v175];
        uint64_t v189 = [(RTWorkoutRouteManager *)v216 processWorkoutMetrics];
        [v189 setObject:v188 forKeyedSubscript:@"clustering_max_cluster_size"];

        uint64_t v190 = [NSNumber numberWithDouble:v176];
        id v191 = [(RTWorkoutRouteManager *)v216 processWorkoutMetrics];
        [v191 setObject:v190 forKeyedSubscript:@"clustering_average_cluster_size"];
      }
      goto LABEL_139;
    }
    uint64_t v208 = 0;
    uint64_t v209 = *(void *)v243;
LABEL_27:
    id v211 = (id)v58;
    id v214 = 0;
    uint64_t v60 = v59;
    while (1)
    {
      if (*(void *)v243 != v209) {
        objc_enumerationMutation(obj);
      }
      id v61 = *(void **)(*((void *)&v242 + 1) + 8 * (void)v214);
      context = (void *)MEMORY[0x1E016D870]();
      uint64_t v62 = [v61 objectID];
      [v210 addObject:v62];

      uint64_t v63 = [(RTWorkoutRouteManager *)v216 distanceMetric];
      uint64_t v64 = [v61 areBothWorkoutsDecimated];
      uint64_t v65 = [v61 workoutActivityType];
      id v241 = v60;
      uint64_t v213 = [(RTWorkoutRouteManager *)v216 _getConstantValueForDistanceThresholdUsingDistanceMetric:v63 isDecimated:v64 workoutActivityType:v65 error:&v241];
      id v59 = v241;

      if (!v59) {
        break;
      }
      [v206 addObject:v59];
LABEL_81:

      uint64_t v60 = v59;
      id v214 = (char *)v214 + 1;
      if (v214 == v211)
      {
        uint64_t v58 = [obj countByEnumeratingWithState:&v242 objects:v282 count:16];
        if (!v58) {
          goto LABEL_101;
        }
        goto LABEL_27;
      }
    }
    uint64_t v66 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    ++v208;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      id v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v69 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v70 = v254[3];
      [v213 doubleValue];
      uint64_t v72 = v71;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413826;
      *(void *)&uint8_t buf[4] = v68;
      __int16 v270 = 2112;
      id v271 = v69;
      __int16 v272 = 2048;
      uint64_t v273 = v208;
      __int16 v274 = 2048;
      uint64_t v275 = v70;
      __int16 v276 = 2112;
      uint64_t v277 = v61;
      __int16 v278 = 2048;
      uint64_t v279 = v72;
      __int16 v280 = 2048;
      uint64_t v281 = v73;
      _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "%@, %@, record num, %lu, total count, %lu, workout distance record, %@, distanceThreshold, %.4f, footprint, %.4f MB", buf, 0x48u);
    }
    [v61 distance];
    double v75 = v74;
    [v213 doubleValue];
    if (v75 > v76)
    {
      __int16 v77 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v77, OS_LOG_TYPE_INFO, "skipping distance record as it is beyond threshold value", buf, 2u);
      }
      id v59 = 0;
      goto LABEL_80;
    }
    id v207 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", +[RTHealthKitManager HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:](RTHealthKitManager, "HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:", [v61 workoutActivityType]));
    uint64_t v78 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
    BOOL v79 = v78 == 0;

    if (v79)
    {
      double v80 = objc_opt_new();
      [(RTWorkoutRouteManager *)v216 setWorkoutActivityTypeToclustersSet:v80];
    }
    __int16 v81 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
    uint64_t v82 = [v81 objectForKeyedSubscript:v207];
    BOOL v83 = v82 == 0;

    if (v83)
    {
      id v84 = objc_opt_new();
      uint64_t v85 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
      [v85 setObject:v84 forKeyedSubscript:v207];
    }
    long long v239 = 0u;
    long long v240 = 0u;
    long long v237 = 0u;
    long long v238 = 0u;
    uint64_t v86 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
    uint64_t v87 = [v86 objectForKeyedSubscript:v207];

    uint64_t v88 = [v87 countByEnumeratingWithState:&v237 objects:v268 count:16];
    if (v88)
    {
      long long v217 = 0uLL;
      uint64_t v89 = *(void *)v238;
      while (2)
      {
        for (uint64_t j = 0; j != v88; ++j)
        {
          if (*(void *)v238 != v89) {
            objc_enumerationMutation(v87);
          }
          __int16 v91 = *(void **)(*((void *)&v237 + 1) + 8 * j);
          double v92 = (void *)MEMORY[0x1E016D870]();
          __int16 v93 = [v61 firstWorkout];
          int v94 = [v91 containsObject:v93];

          if (v94)
          {
            id v95 = v91;

            *((void *)&v217 + 1) = v95;
          }
          double v96 = [v61 secondWorkout];
          int v97 = [v91 containsObject:v96];

          if (v97)
          {
            id v98 = v91;

            *(void *)&long long v217 = v98;
          }
          if (*((void *)&v217 + 1) && (void)v217)
          {

            __int16 v99 = (void *)*((void *)&v217 + 1);
            goto LABEL_57;
          }
        }
        uint64_t v88 = [v87 countByEnumeratingWithState:&v237 objects:v268 count:16];
        if (v88) {
          continue;
        }
        break;
      }
    }
    else
    {
      long long v217 = 0uLL;
    }

    __int16 v99 = (void *)*((void *)&v217 + 1);
    if (v217 == 0)
    {
      uint64_t v107 = (void *)MEMORY[0x1E4F1CA80];
      __int16 v108 = [v61 firstWorkout];
      id v109 = [v61 secondWorkout];
      __int16 v110 = [v107 setWithObjects:v108, v109, 0, v198];

      id v111 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
      id v112 = [v111 objectForKeyedSubscript:v207];
      [v112 addObject:v110];

      double v113 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        __int16 v114 = (objc_class *)objc_opt_class();
        NSStringFromClass(v114);
        id v115 = (id)objc_claimAutoreleasedReturnValue();
        long long v116 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v115;
        __int16 v270 = 2112;
        id v271 = v116;
        __int16 v272 = 2112;
        uint64_t v273 = (uint64_t)v110;
        _os_log_impl(&dword_1D9BFA000, v113, OS_LOG_TYPE_INFO, "%@, %@, case 1/4, new cluster is created, %@", buf, 0x20u);
      }
      *((void *)&v217 + 1) = 0;
    }
    else
    {
      if (!*((void *)&v217 + 1) || (void)v217)
      {
        if (!*((void *)&v217 + 1) && (void)v217)
        {
          long long v126 = (void *)MEMORY[0x1E4F1CA80];
          long long v127 = [v61 firstWorkout];
          char v128 = [v126 setWithObject:v127];
          uint64_t v129 = [v61 workoutActivityType];
          [v213 doubleValue];
          id v235 = 0;
          BOOL v130 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](v216, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v128, (void)v217, v129, &v235);
          id v59 = v235;

          if (v59)
          {
            [v206 addObject:v59];
            *((void *)&v217 + 1) = 0;
            goto LABEL_79;
          }
          if (v130)
          {
            __int16 v140 = [v61 firstWorkout];
            [(id)v217 addObject:v140];

            __int16 v110 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              id v141 = (objc_class *)objc_opt_class();
              NSStringFromClass(v141);
              id v142 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v143 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v142;
              __int16 v270 = 2112;
              id v271 = v143;
              __int16 v272 = 2112;
              uint64_t v273 = v217;
              _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 3/4, added to clusterSetForUUID2, %@", buf, 0x20u);
            }
          }
          else
          {
            __int16 v110 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              int v148 = (objc_class *)objc_opt_class();
              NSStringFromClass(v148);
              id v149 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v150 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v151 = [v61 firstWorkout];
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v149;
              __int16 v270 = 2112;
              id v271 = v150;
              __int16 v272 = 2112;
              uint64_t v273 = (uint64_t)v151;
              __int16 v274 = 2112;
              uint64_t v275 = v217;
              _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_INFO, "%@, %@, workoutUUID, %@, not added to the cluster, %@, reason, not similar to entire cluster", buf, 0x2Au);
            }
          }
          *((void *)&v217 + 1) = 0;
          goto LABEL_71;
        }
LABEL_57:
        *((void *)&v217 + 1) = v99;
        if (v99 == (void *)v217)
        {
          id v59 = 0;
          *(void *)&long long v217 = v99;
          goto LABEL_79;
        }
        uint64_t v100 = [v61 workoutActivityType];
        [v213 doubleValue];
        id v234 = 0;
        BOOL v101 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](v216, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v99, (void)v217, v100, &v234);
        id v59 = v234;
        if (v59)
        {
          [v206 addObject:v59];
        }
        else if (v101)
        {
          unint64_t v117 = [v99 count];
          if (v117 <= [(id)v217 count])
          {
            [(id)v217 unionSet:v99];
            uint64_t v131 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
            uint64_t v132 = [v131 objectForKeyedSubscript:v207];
            [v132 removeObject:v99];

            __int16 v110 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              id v133 = (objc_class *)objc_opt_class();
              NSStringFromClass(v133);
              id v134 = (id)objc_claimAutoreleasedReturnValue();
              char v135 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v134;
              __int16 v270 = 2112;
              id v271 = v135;
              __int16 v272 = 2112;
              uint64_t v273 = v217;
              _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 4.2/4, clusterSetForUUID1 and clusterSetForUUID2 merged, clusterSetForUUID2, %@, clusterSetForUUID1, removed", buf, 0x20u);
            }
          }
          else
          {
            [v99 unionSet:(void)v217];
            long long v118 = [(RTWorkoutRouteManager *)v216 workoutActivityTypeToclustersSet];
            id v119 = [v118 objectForKeyedSubscript:v207];
            [v119 removeObject:(void)v217];

            __int16 v110 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              uint64_t v120 = (objc_class *)objc_opt_class();
              NSStringFromClass(v120);
              id v121 = (id)objc_claimAutoreleasedReturnValue();
              BOOL v122 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v121;
              __int16 v270 = 2112;
              id v271 = v122;
              __int16 v272 = 2112;
              uint64_t v273 = (uint64_t)v99;
              _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 4.1/4, clusterSetForUUID1 and clusterSetForUUID2 merged, clusterSetForUUID1, %@, clusterSetForUUID2, removed", buf, 0x20u);
            }
          }
          goto LABEL_71;
        }
        __int16 v110 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          char v123 = (objc_class *)objc_opt_class();
          NSStringFromClass(v123);
          id v124 = (id)objc_claimAutoreleasedReturnValue();
          long long v125 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v124;
          __int16 v270 = 2112;
          id v271 = v125;
          __int16 v272 = 2112;
          uint64_t v273 = (uint64_t)v99;
          __int16 v274 = 2112;
          uint64_t v275 = v217;
          _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_INFO, "%@, %@, cluster1, %@, cluster2, %@, not merged", buf, 0x2Au);
        }
        goto LABEL_78;
      }
      uint64_t v102 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v103 = [v61 secondWorkout];
      uint64_t v104 = [v102 setWithObject:v103];
      uint64_t v105 = [v61 workoutActivityType];
      [v213 doubleValue];
      id v236 = 0;
      BOOL v106 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](v216, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", *((void *)&v217 + 1), v104, v105, &v236);
      id v59 = v236;

      if (v59)
      {
        [v206 addObject:v59];
        *(void *)&long long v217 = 0;
LABEL_79:

        __int16 v77 = *((void *)&v217 + 1);
LABEL_80:

        goto LABEL_81;
      }
      if (v106)
      {
        unint64_t v136 = [v61 secondWorkout];
        [*((id *)&v217 + 1) addObject:v136];

        __int16 v110 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          id v137 = (objc_class *)objc_opt_class();
          NSStringFromClass(v137);
          id v138 = (id)objc_claimAutoreleasedReturnValue();
          id v139 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v138;
          __int16 v270 = 2112;
          id v271 = v139;
          __int16 v272 = 2112;
          uint64_t v273 = *((void *)&v217 + 1);
          _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 2/4, added to clusterSetForUUID1, %@", buf, 0x20u);
        }
      }
      else
      {
        __int16 v110 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          __int16 v144 = (objc_class *)objc_opt_class();
          NSStringFromClass(v144);
          id v145 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v146 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v147 = [v61 secondWorkout];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v145;
          __int16 v270 = 2112;
          id v271 = v146;
          __int16 v272 = 2112;
          uint64_t v273 = (uint64_t)v147;
          __int16 v274 = 2112;
          uint64_t v275 = *((void *)&v217 + 1);
          _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_INFO, "%@, %@, workoutUUID, %@, not added to the cluster, %@, reason, not similar to entire cluster", buf, 0x2Au);
        }
      }
    }
    *(void *)&long long v217 = 0;
LABEL_71:
    id v59 = 0;
LABEL_78:

    goto LABEL_79;
  }
  [v206 addObject:];
LABEL_139:

  _Block_object_dispose(v251, 8);
  _Block_object_dispose(&v283, 8);

  _Block_object_dispose(&v253, 8);
  _Block_object_dispose(&v260, 8);
  id v192 = (objc_class *)objc_opt_class();
  unint64_t v193 = NSStringFromClass(v192);
  id v194 = NSStringFromSelector(a2);
  [(RTWorkoutRouteManager *)v216 _logClusters:v4 className:v193 selectorName:v194];

  if (a3)
  {
    if ([v206 count])
    {
      id v195 = _RTSafeArray();
      _RTMultiErrorCreate();
      id v196 = objc_claimAutoreleasedReturnValue();
      *a3 = v196;
    }
    else
    {
      *a3 = 0;
    }
  }
LABEL_143:

  return v200;
}

intptr_t __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 count];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_syncClustersToHealthKit:(id)a3 error:(id *)a4
{
  v141[1] = *MEMORY[0x1E4F143B8];
  id v106 = a3;
  if (v106)
  {
    aSelector = a2;
    uint64_t v126 = 0;
    long long v127 = (id *)&v126;
    uint64_t v128 = 0x3032000000;
    uint64_t v129 = __Block_byref_object_copy__133;
    BOOL v130 = __Block_byref_object_dispose__133;
    id v131 = 0;
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v107 = *MEMORY[0x1E4F5CFE8];
    uint64_t v108 = *MEMORY[0x1E4F28568];
    char v7 = 1;
    do
    {
      if ((v7 & 1) == 0) {
        break;
      }
      context = (void *)MEMORY[0x1E016D870]();
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];

      +[RTRuntime footprint];
      double v10 = v9;
      double v113 = objc_opt_new();
      id v112 = objc_opt_new();
      id v111 = objc_opt_new();
      __int16 v110 = objc_opt_new();
      uint64_t v120 = 0;
      id v121 = &v120;
      uint64_t v122 = 0x3032000000;
      char v123 = __Block_byref_object_copy__133;
      id v124 = __Block_byref_object_dispose__133;
      id v125 = 0;
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      id v12 = [(RTWorkoutRouteManager *)self healthKitManager];
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __56__RTWorkoutRouteManager__syncClustersToHealthKit_error___block_invoke;
      v116[3] = &unk_1E6B905F0;
      long long v118 = &v120;
      id v119 = &v126;
      id v13 = v11;
      unint64_t v117 = v13;
      [v12 fetchWorkoutClustersWithHandler:v116];

      dispatch_time_t v14 = v13;
      double v15 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v16 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v14, v16)) {
        goto LABEL_9;
      }
      double v17 = [MEMORY[0x1E4F1C9C8] now];
      [v17 timeIntervalSinceDate:v15];
      double v19 = v18;
      BOOL v20 = objc_opt_new();
      double v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v23 = [v22 filteredArrayUsingPredicate:v21];
      double v24 = [v23 firstObject];

      [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      id v26 = (void *)MEMORY[0x1E4F28C58];
      v141[0] = v108;
      *(void *)buf = @"semaphore wait timeout";
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v141 count:1];
      id v28 = [v26 errorWithDomain:v107 code:15 userInfo:v27];

      if (v28)
      {
        id v29 = v28;
      }
      else
      {
LABEL_9:
        id v29 = 0;
      }

      id v30 = v29;
      if (v30 || v127[5])
      {
        int v31 = 6;
      }
      else
      {
        int v32 = [NSNumber numberWithUnsignedInteger:[v106 count]];
        uint64_t v33 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v33 setObject:v32 forKeyedSubscript:@"sync_from_healthkit_count_local_clusters"];

        dispatch_semaphore_t v34 = [NSNumber numberWithUnsignedInteger:[v121[5] count]];
        uint64_t v35 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v35 setObject:v34 forKeyedSubscript:@"sync_from_healthkit_count_remote_clusters"];

        id v36 = (void *)v121[5];
        v121[5] = 0;

        int64_t v37 = [(RTWorkoutRouteManager *)self distanceMetric];
        dispatch_time_t v38 = v127;
        id obj = v127[5];
        BOOL v39 = [(RTWorkoutRouteManager *)self _syncWithRemoteClustersUsingLocalClusters:v106 distanceMetric:v37 outLocalClustersForCreation:v113 outRemoteClustersForUpdationNewWorkouts:v112 outRemoteClustersForUpdationWorkoutsToRemove:v111 outRemoteClustersForDeletion:v110 error:&obj];
        objc_storeStrong(v38 + 5, obj);
        +[RTRuntime footprint];
        double v41 = v40;
        double v42 = [NSNumber numberWithUnsignedInteger:[v113 count]];
        double v43 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v43 setObject:v42 forKeyedSubscript:@"sync_from_healthkit_count_final_local_clusters"];

        __int16 v44 = (void *)MEMORY[0x1E4F1CA80];
        double v45 = [v112 allKeys];
        int v46 = [v44 setWithArray:v45];

        dispatch_time_t v47 = [v111 allKeys];
        [v46 addObjectsFromArray:v47];

        id v48 = [NSNumber numberWithUnsignedInteger:[v46 count]];
        int v49 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v49 setObject:v48 forKeyedSubscript:@"sync_from_healthkit_count_final_remote_clusters"];

        double v50 = [NSNumber numberWithBool:v39];
        double v51 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v51 setObject:v50 forKeyedSubscript:@"sync_from_healthkit_is_success"];

        id v52 = [NSNumber numberWithDouble:v41 - v10];
        uint64_t v53 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v53 setObject:v52 forKeyedSubscript:@"sync_from_healthkit_footprint_delta"];

        id v54 = NSNumber;
        id v55 = [MEMORY[0x1E4F1C9C8] date];
        [v55 timeIntervalSinceDate:v8];
        uint64_t v56 = [v54 numberWithDouble:];
        uint64_t v57 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
        [v57 setObject:v56 forKeyedSubscript:@"sync_from_healthkit_time_elapsed"];

        id v58 = v127[5];
        if (v58)
        {
          id v59 = [NSString stringWithFormat:@"%lu", [v58 code]];
          uint64_t v60 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
          [v60 setObject:v59 forKeyedSubscript:@"sync_from_healthkit_errorcode"];

          id v61 = [v127[5] domain];
          uint64_t v62 = [v61 description];
          uint64_t v63 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
          [v63 setObject:v62 forKeyedSubscript:@"sync_from_healthkit_errordomain"];
          int v31 = 6;
        }
        else
        {
          uint64_t v64 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            uint64_t v65 = (objc_class *)objc_opt_class();
            NSStringFromClass(v65);
            id v66 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            id v67 = (id)objc_claimAutoreleasedReturnValue();
            if (v39) {
              id v68 = @"YES";
            }
            else {
              id v68 = @"NO";
            }
            id v69 = [MEMORY[0x1E4F1C9C8] date];
            [v69 timeIntervalSinceDate:v8];
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v66;
            __int16 v133 = 2112;
            id v134 = v67;
            __int16 v135 = 2112;
            unint64_t v136 = v68;
            __int16 v137 = 2048;
            uint64_t v138 = v70;
            __int16 v139 = 2048;
            double v140 = v41;
            _os_log_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_INFO, "%@, %@, syncing clusters with remote clusters in HealthKit status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);
          }
          uint64_t v71 = [MEMORY[0x1E4F1C9C8] date];

          +[RTRuntime footprint];
          double v73 = v72;
          double v74 = v127;
          id v114 = v127[5];
          BOOL v75 = [(RTWorkoutRouteManager *)self _saveToHealthKitClustersForCreation:v113 remoteClustersForUpdationNewWorkouts:v112 remoteClustersForUpdationWorkoutsToRemove:v111 remoteClustersForDeletion:v110 error:&v114];
          objc_storeStrong(v74 + 5, v114);
          +[RTRuntime footprint];
          double v77 = v76;
          uint64_t v78 = [NSNumber numberWithBool:v75];
          BOOL v79 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
          [v79 setObject:v78 forKeyedSubscript:@"sync_to_healthkit_is_success"];

          double v80 = [NSNumber numberWithDouble:v77 - v73];
          __int16 v81 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
          [v81 setObject:v80 forKeyedSubscript:@"sync_to_healthkit_footprint_delta"];

          uint64_t v82 = NSNumber;
          BOOL v83 = [MEMORY[0x1E4F1C9C8] date];
          [v83 timeIntervalSinceDate:v71];
          id v84 = [v82 numberWithDouble:];
          uint64_t v85 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
          [v85 setObject:v84 forKeyedSubscript:@"sync_to_healthkit_time_elapsed"];

          id v86 = v127[5];
          if (v86)
          {
            uint64_t v87 = [NSString stringWithFormat:@"%lu", [v86 code]];
            uint64_t v88 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
            [v88 setObject:v87 forKeyedSubscript:@"sync_to_healthkit_errorcode"];

            id v61 = [v127[5] domain];
            uint64_t v62 = [v61 description];
            uint64_t v63 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
            [v63 setObject:v62 forKeyedSubscript:@"sync_to_healthkit_errordomain"];
            id v106 = 0;
            int v31 = 6;
            uint64_t v8 = (void *)v71;
          }
          else
          {
            uint64_t v89 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
            {
              uint64_t v90 = (objc_class *)objc_opt_class();
              NSStringFromClass(v90);
              id v91 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              id v92 = (id)objc_claimAutoreleasedReturnValue();
              if (v75) {
                __int16 v93 = @"YES";
              }
              else {
                __int16 v93 = @"NO";
              }
              int v94 = [MEMORY[0x1E4F1C9C8] date];
              [v94 timeIntervalSinceDate:v71];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v91;
              __int16 v133 = 2112;
              id v134 = v92;
              __int16 v135 = 2112;
              unint64_t v136 = v93;
              __int16 v137 = 2048;
              uint64_t v138 = v95;
              __int16 v139 = 2048;
              double v140 = v77;
              _os_log_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_INFO, "%@, %@, saving clusters to HealthKit status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);
            }
            int v31 = 0;
            id v106 = 0;
            uint64_t v62 = v111;
            uint64_t v63 = v112;
            id v61 = v110;
            uint64_t v8 = (void *)v71;
            id v112 = 0;
            double v113 = 0;
            __int16 v110 = 0;
            id v111 = 0;
          }
        }
      }
      id v6 = v8;

      _Block_object_dispose(&v120, 8);
      char v7 = 0;
    }
    while (!v31);
    if (a4 && v127[5])
    {
      double v96 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        uint64_t v100 = (objc_class *)objc_opt_class();
        NSStringFromClass(v100);
        id v101 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v102 = NSStringFromSelector(aSelector);
        uint64_t v103 = (__CFString *)v127[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v101;
        __int16 v133 = 2112;
        id v134 = v102;
        __int16 v135 = 2112;
        unint64_t v136 = v103;
        _os_log_error_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      BOOL v97 = 0;
      *a4 = v127[5];
    }
    else
    {
      BOOL v97 = 1;
    }

    _Block_object_dispose(&v126, 8);
  }
  else
  {
    id v98 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v98, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusters", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"clusters");
      BOOL v97 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v97;
}

void __56__RTWorkoutRouteManager__syncClustersToHealthKit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_syncWithRemoteClustersUsingLocalClusters:(id)a3 distanceMetric:(int64_t)a4 outLocalClustersForCreation:(id)a5 outRemoteClustersForUpdationNewWorkouts:(id)a6 outRemoteClustersForUpdationWorkoutsToRemove:(id)a7 outRemoteClustersForDeletion:(id)a8 error:(id *)a9
{
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v174 = a6;
  id v168 = a7;
  id v15 = a8;
  id v167 = v13;
  uint64_t v169 = v14;
  uint64_t v177 = v15;
  if (!v13)
  {
    id v91 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v91, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localClusters", buf, 2u);
    }

    if (!a9) {
      goto LABEL_82;
    }
    _RTErrorInvalidParameterCreate(@"localClusters");
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_81;
  }
  if (!v14)
  {
    __int16 v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v93, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outLocalClustersForCreation", buf, 2u);
    }

    if (!a9) {
      goto LABEL_82;
    }
    _RTErrorInvalidParameterCreate(@"outLocalClustersForCreation");
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_81;
  }
  if (!v174)
  {
    int v94 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v94, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRemoteClustersForUpdationNewWorkouts", buf, 2u);
    }

    if (!a9) {
      goto LABEL_82;
    }
    _RTErrorInvalidParameterCreate(@"outRemoteClustersForUpdationNewWorkouts");
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_81;
  }
  if (!v168)
  {
    uint64_t v95 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v95, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRemoteClustersForUpdationWorkoutsToRemove", buf, 2u);
    }

    if (!a9) {
      goto LABEL_82;
    }
    _RTErrorInvalidParameterCreate(@"outRemoteClustersForUpdationWorkoutsToRemove");
    id v92 = (id)objc_claimAutoreleasedReturnValue();
LABEL_81:
    char v97 = 0;
    *a9 = v92;
    goto LABEL_124;
  }
  dispatch_time_t v16 = v15;
  if (!v15)
  {
    double v96 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRemoteClustersForDeletion", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"outRemoteClustersForDeletion");
      id v92 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_81;
    }
LABEL_82:
    char v97 = 0;
    goto LABEL_124;
  }
  [v14 removeAllObjects];
  [v174 removeAllObjects];
  [v168 removeAllObjects];
  [v16 removeAllObjects];
  uint64_t v207 = 0;
  uint64_t v208 = &v207;
  uint64_t v209 = 0x3032000000;
  uint64_t v210 = __Block_byref_object_copy__133;
  id v211 = __Block_byref_object_dispose__133;
  id v212 = 0;
  __int16 v161 = [MEMORY[0x1E4F1C9C8] date];
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  id obj = v13;
  uint64_t v17 = [obj countByEnumeratingWithState:&v203 objects:v233 count:16];
  if (!v17)
  {
    double v162 = 0;
    goto LABEL_84;
  }
  uint64_t v164 = 0;
  double v162 = 0;
  uint64_t v165 = *(void *)v204;
  uint64_t v159 = *MEMORY[0x1E4F5CFE8];
  uint64_t v160 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v172 = 0;
    uint64_t v163 = v17;
    do
    {
      if (*(void *)v204 != v165) {
        objc_enumerationMutation(obj);
      }
      uint64_t v173 = *(void **)(*((void *)&v203 + 1) + 8 * v172);
      context = (void *)MEMORY[0x1E016D870]();
      double v18 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        double v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [obj count];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v218 = (uint64_t (*)(uint64_t, uint64_t))++v164;
        *(_WORD *)uint64_t v219 = 2048;
        *(void *)&v219[2] = v22;
        *(_WORD *)&v219[10] = 2112;
        *(void *)&v219[12] = v173;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, %@, %lu / %lu localCluster, %@", buf, 0x34u);
      }
      double v23 = (id *)(v208 + 5);
      id v202 = (id)v208[5];
      uint64_t v171 = [(RTWorkoutRouteManager *)self _getRemoteWorkoutClustersForWorkoutUUIDs:v173 error:&v202];
      objc_storeStrong(v23, v202);
      if (v208[5])
      {
        int v24 = 22;
        goto LABEL_37;
      }
      double v162 = (uint64_t (*)(uint64_t, uint64_t))((char *)v162 + [v173 count]);
      if (![v171 count])
      {
        id v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          dispatch_semaphore_t v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          id v35 = (id)objc_claimAutoreleasedReturnValue();
          id v36 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v35;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v36;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, case 1/4: no corresponding remote cluster, adding to outLocalClusters", buf, 0x16u);
        }
        goto LABEL_35;
      }
      if ([v171 count] != 1)
      {
        int64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          dispatch_time_t v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          double v40 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v39;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v40;
          _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, %@, case 4/4: multiple remote clusters for the given local Cluster (merge remote clusters case), marking remote clusters for deletion and creating new local cluster", buf, 0x16u);
        }
        long long v196 = 0u;
        long long v197 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v28 = v171;
        uint64_t v41 = [v28 countByEnumeratingWithState:&v194 objects:v232 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v195;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v195 != v42) {
                objc_enumerationMutation(v28);
              }
              __int16 v44 = *(void **)(*((void *)&v194 + 1) + 8 * i);
              double v45 = (void *)MEMORY[0x1E016D870]();
              [v177 addObject:v44];
              int v46 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                dispatch_time_t v47 = (objc_class *)objc_opt_class();
                NSStringFromClass(v47);
                id v48 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v49 = (id)objc_claimAutoreleasedReturnValue();
                double v50 = [v44 clusterUUID];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v48;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v49;
                *(_WORD *)&buf[22] = 2112;
                uint64_t v218 = v50;
                _os_log_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_INFO, "%@, %@, cluster uuid marked for deletion, %@", buf, 0x20u);
              }
            }
            uint64_t v41 = [v28 countByEnumeratingWithState:&v194 objects:v232 count:16];
          }
          while (v41);
        }
        goto LABEL_35;
      }
      uint64_t v25 = [v171 firstObject];
      id v26 = [v174 objectForKeyedSubscript:v25];
      BOOL v27 = v26 == 0;

      if (!v27)
      {
        id v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          int v32 = [v171 firstObject];
          uint64_t v33 = [v32 clusterUUID];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v218 = v33;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, case 3/4: one remote cluster & it has been already visited (split remote cluster case), cluster uuid, %@, adding to outLocalClusters", buf, 0x20u);
        }
LABEL_35:

        double v51 = [MEMORY[0x1E4F1CA48] arrayWithArray:v173];
        [v169 addObject:v51];

LABEL_36:
        int v24 = 0;
        goto LABEL_37;
      }
      id v52 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        uint64_t v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        id v54 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v55 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v56 = [v171 firstObject];
        uint64_t v57 = [v56 clusterUUID];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v54;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v55;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v218 = v57;
        _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, case 2/4: one remote cluster & it hasn't been visited, cluster uuid, %@, setting uuids to outRemoteClustersForUpdation", buf, 0x20u);
      }
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      uint64_t v218 = __Block_byref_object_copy__133;
      *(void *)uint64_t v219 = __Block_byref_object_dispose__133;
      *(void *)&v219[8] = objc_opt_new();
      dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
      id v59 = [(RTWorkoutRouteManager *)self healthKitManager];
      uint64_t v60 = [v171 firstObject];
      id v61 = [v60 clusterUUID];
      v198[0] = MEMORY[0x1E4F143A8];
      v198[1] = 3221225472;
      v198[2] = __230__RTWorkoutRouteManager__syncWithRemoteClustersUsingLocalClusters_distanceMetric_outLocalClustersForCreation_outRemoteClustersForUpdationNewWorkouts_outRemoteClustersForUpdationWorkoutsToRemove_outRemoteClustersForDeletion_error___block_invoke;
      v198[3] = &unk_1E6B9AF88;
      uint64_t v200 = &v207;
      uint64_t v62 = v58;
      id v199 = v62;
      id v201 = buf;
      [v59 fetchWorkoutUUIDsForClusterUUID:v61 handler:v198];

      uint64_t v63 = v62;
      uint64_t v64 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v65 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v63, v65))
      {
        id v66 = [MEMORY[0x1E4F1C9C8] now];
        [v66 timeIntervalSinceDate:v64];
        double v68 = v67;
        id v69 = objc_opt_new();
        uint64_t v70 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
        uint64_t v71 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v72 = [v71 filteredArrayUsingPredicate:v70];
        double v73 = [v72 firstObject];

        [v69 submitToCoreAnalytics:v73 type:1 duration:v68];
        double v74 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v235 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v235, 2u);
        }

        BOOL v75 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v234 = v160;
        *(void *)id v235 = @"semaphore wait timeout";
        double v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v235 forKeys:&v234 count:1];
        id v77 = [v75 errorWithDomain:v159 code:15 userInfo:v76];

        if (v77)
        {
          id v77 = v77;
        }
      }
      else
      {
        id v77 = 0;
      }

      id v78 = v77;
      BOOL v79 = v78;
      BOOL v80 = v78 == 0;
      __int16 v81 = v208;
      if (v78)
      {
        id v82 = v78;
        BOOL v83 = (void *)v81[5];
        v81[5] = (uint64_t)v82;
        int v24 = 22;
LABEL_50:

        goto LABEL_53;
      }
      if (!v208[5])
      {
        BOOL v83 = [MEMORY[0x1E4F1CA80] setWithArray:v173];
        if (![*(id *)(*(void *)&buf[8] + 40) isEqualToSet:v83]
          || ([v171 firstObject],
              id v84 = objc_claimAutoreleasedReturnValue(),
              [v84 workoutRouteLabel],
              uint64_t v85 = objc_claimAutoreleasedReturnValue(),
              int v86 = [v85 isEqualToString:&stru_1F33EAD88],
              v85,
              v84,
              v86))
        {
          uint64_t v87 = [v171 firstObject];
          [v174 setObject:v83 forKeyedSubscript:v87];

          [*(id *)(*(void *)&buf[8] + 40) minusSet:v83];
          uint64_t v88 = *(void *)(*(void *)&buf[8] + 40);
          uint64_t v89 = [v171 firstObject];
          [v168 setObject:v88 forKeyedSubscript:v89];

          uint64_t v90 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = 0;
        }
        int v24 = 0;
        goto LABEL_50;
      }
      BOOL v80 = 0;
      int v24 = 22;
LABEL_53:

      _Block_object_dispose(buf, 8);
      if (v80) {
        goto LABEL_36;
      }
LABEL_37:

      if (v24) {
        goto LABEL_84;
      }
      ++v172;
    }
    while (v172 != v163);
    uint64_t v17 = [obj countByEnumeratingWithState:&v203 objects:v233 count:16];
  }
  while (v17);
LABEL_84:

  if (a9 && v208[5])
  {
    id v98 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      uint64_t v155 = (objc_class *)objc_opt_class();
      NSStringFromClass(v155);
      id v156 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v157 = NSStringFromSelector(a2);
      id v158 = (uint64_t (*)(uint64_t, uint64_t))v208[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v156;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v157;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v218 = v158;
      _os_log_error_impl(&dword_1D9BFA000, v98, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    char v97 = 0;
    goto LABEL_122;
  }
  __int16 v99 = (void *)MEMORY[0x1E016D870]();
  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  id v100 = v169;
  uint64_t v101 = 0;
  uint64_t v102 = [v100 countByEnumeratingWithState:&v190 objects:v231 count:16];
  if (v102)
  {
    uint64_t v103 = *(void *)v191;
    do
    {
      for (uint64_t j = 0; j != v102; ++j)
      {
        if (*(void *)v191 != v103) {
          objc_enumerationMutation(v100);
        }
        uint64_t v105 = *(void *)(*((void *)&v190 + 1) + 8 * j);
        id v106 = (void *)MEMORY[0x1E016D870]();
        uint64_t v107 = [MEMORY[0x1E4F1CAD0] setWithArray:v105];
        uint64_t v108 = [v107 count];

        v101 += v108;
      }
      uint64_t v102 = [v100 countByEnumeratingWithState:&v190 objects:v231 count:16];
    }
    while (v102);
  }

  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  id v109 = [v174 allKeys];
  uint64_t v110 = [v109 countByEnumeratingWithState:&v186 objects:v230 count:16];
  if (v110)
  {
    uint64_t v111 = *(void *)v187;
    do
    {
      for (uint64_t k = 0; k != v110; ++k)
      {
        if (*(void *)v187 != v111) {
          objc_enumerationMutation(v109);
        }
        uint64_t v113 = *(void *)(*((void *)&v186 + 1) + 8 * k);
        id v114 = (void *)MEMORY[0x1E016D870]();
        id v115 = [v174 objectForKeyedSubscript:v113];
        uint64_t v116 = [v115 count];

        v101 += v116;
      }
      uint64_t v110 = [v109 countByEnumeratingWithState:&v186 objects:v230 count:16];
    }
    while (v110);
  }

  unint64_t v117 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
  {
    long long v118 = (objc_class *)objc_opt_class();
    NSStringFromClass(v118);
    id v119 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v120 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v121 = [v100 count];
    uint64_t v122 = [v174 count];
    uint64_t v123 = [v168 count];
    uint64_t v124 = [v177 count];
    id v125 = [MEMORY[0x1E4F1C9C8] date];
    [v125 timeIntervalSinceDate:v161];
    uint64_t v127 = v126;
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138414594;
    *(void *)&uint8_t buf[4] = v119;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v120;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v218 = v162;
    *(_WORD *)uint64_t v219 = 2048;
    *(void *)&v219[2] = v101;
    *(_WORD *)&v219[10] = 2048;
    *(void *)&v219[12] = v121;
    __int16 v220 = 2048;
    uint64_t v221 = v122;
    __int16 v222 = 2048;
    uint64_t v223 = v123;
    __int16 v224 = 2048;
    uint64_t v225 = v124;
    __int16 v226 = 2048;
    uint64_t v227 = v127;
    __int16 v228 = 2048;
    uint64_t v229 = v128;
    _os_log_impl(&dword_1D9BFA000, v117, OS_LOG_TYPE_INFO, "%@, %@, after syncing remote and local clusters, totalInputUUIDsCount, %lu, totalOutputUUIDsCount, %lu, outLocalClustersForCreation, %lu, outRemoteClustersForUpdationNewWorkouts, %lu, outRemoteClustersForUpdationWorkoutsToRemove, %lu, outRemoteClustersForDeletion, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x66u);
  }
  uint64_t v129 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v130 = [v174 allKeys];
  id v131 = [v129 setWithArray:v130];
  int v132 = [v131 intersectsSet:v177];

  if (v132)
  {
    __int16 v133 = objc_opt_new();
    id v134 = objc_opt_new();
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    __int16 v135 = [v174 allKeys];
    uint64_t v136 = [v135 countByEnumeratingWithState:&v182 objects:v216 count:16];
    if (v136)
    {
      uint64_t v137 = *(void *)v183;
      do
      {
        for (uint64_t m = 0; m != v136; ++m)
        {
          if (*(void *)v183 != v137) {
            objc_enumerationMutation(v135);
          }
          __int16 v139 = *(void **)(*((void *)&v182 + 1) + 8 * m);
          double v140 = (void *)MEMORY[0x1E016D870]();
          id v141 = [v139 clusterUUID];
          [v133 addObject:v141];
        }
        uint64_t v136 = [v135 countByEnumeratingWithState:&v182 objects:v216 count:16];
      }
      while (v136);
    }

    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    id v142 = v177;
    uint64_t v143 = [v142 countByEnumeratingWithState:&v178 objects:v215 count:16];
    if (v143)
    {
      uint64_t v144 = *(void *)v179;
      do
      {
        for (uint64_t n = 0; n != v143; ++n)
        {
          if (*(void *)v179 != v144) {
            objc_enumerationMutation(v142);
          }
          id v146 = *(void **)(*((void *)&v178 + 1) + 8 * n);
          __int16 v147 = (void *)MEMORY[0x1E016D870]();
          int v148 = [v146 clusterUUID];
          [v134 addObject:v148];
        }
        uint64_t v143 = [v142 countByEnumeratingWithState:&v178 objects:v215 count:16];
      }
      while (v143);
    }

    id v149 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v213 = *MEMORY[0x1E4F28568];
    id v150 = [NSString stringWithFormat:@"updation and deletion remote clusters overlapped, updation cluster uuids, %@, deletion cluster uuids, %@", v133, v134];
    id v214 = v150;
    __int16 v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v214 forKeys:&v213 count:1];
    uint64_t v152 = [v149 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v151];
    __int16 v153 = (void *)v208[5];
    v208[5] = v152;
  }
  char v97 = v132 ^ 1;
  if (a9) {
LABEL_122:
  }
    *a9 = (id) v208[5];

  _Block_object_dispose(&v207, 8);
LABEL_124:

  return v97;
}

void __230__RTWorkoutRouteManager__syncWithRemoteClustersUsingLocalClusters_distanceMetric_outLocalClustersForCreation_outRemoteClustersForUpdationNewWorkouts_outRemoteClustersForUpdationWorkoutsToRemove_outRemoteClustersForDeletion_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v5;
    uint64_t v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] setWithArray:a2];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_saveToHealthKitClustersForCreation:(id)a3 remoteClustersForUpdationNewWorkouts:(id)a4 remoteClustersForUpdationWorkoutsToRemove:(id)a5 remoteClustersForDeletion:(id)a6 error:(id *)a7
{
  uint64_t v352 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = v16;
  if (v13)
  {
    if (v14)
    {
      if (v15)
      {
        if (v16)
        {
          id v289 = self;
          id location = 0;
          long long v284 = [MEMORY[0x1E4F1C9C8] date];
          double v18 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          aSelector = a2;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            double v19 = (objc_class *)objc_opt_class();
            id v20 = NSStringFromClass(v19);
            NSStringFromSelector(a2);
            id v21 = v282 = v15;
            *(_DWORD *)buf = 138413570;
            uint64_t v335 = v20;
            __int16 v336 = 2112;
            uint64_t v337 = v21;
            __int16 v338 = 2048;
            uint64_t v339 = [v13 count];
            __int16 v340 = 2048;
            uint64_t v341 = [v14 count];
            __int16 v342 = 2048;
            uint64_t v343 = [v282 count];
            __int16 v344 = 2048;
            uint64_t v345 = [v17 count];
            _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, %@, clusters to be created, %lu, clusters to be updated with new workouts, %lu, clusters to be updated with workouts to remove, %lu, clusters to be deleted, %lu", buf, 0x3Eu);

            id v15 = v282;
          }

          if (![v13 count]
            && ![v14 count]
            && ![v15 count]
            && ![v17 count])
          {
            uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            BOOL v24 = 1;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              long long v185 = (objc_class *)objc_opt_class();
              NSStringFromClass(v185);
              id v186 = v14;
              v188 = long long v187 = v17;
              long long v189 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412546;
              uint64_t v335 = v188;
              __int16 v336 = 2112;
              uint64_t v337 = v189;
              _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, no clusters to save", buf, 0x16u);

              uint64_t v17 = v187;
              id v14 = v186;
            }
            goto LABEL_44;
          }
          id obj = location;
          uint64_t v22 = [(RTWorkoutRouteManager *)v289 _getRelevanceLocationWithError:&obj];
          objc_storeStrong(&location, obj);
          if (a7 && location)
          {
            double v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              long long v180 = (objc_class *)objc_opt_class();
              NSStringFromClass(v180);
              id v181 = v14;
              v183 = long long v182 = v17;
              long long v184 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              uint64_t v335 = v183;
              __int16 v336 = 2112;
              uint64_t v337 = v184;
              __int16 v338 = 2112;
              uint64_t v339 = (uint64_t)location;
              _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

              uint64_t v17 = v182;
              id v14 = v181;
            }

            BOOL v24 = 0;
            *a7 = location;
            goto LABEL_44;
          }
          id v30 = v15;
          uint64_t v281 = v14;
          __int16 v278 = v17;
          id v31 = [(RTWorkoutRouteManager *)v289 healthKitManager];
          int v32 = [(RTWorkoutRouteManager *)v289 healthKitManager];
          uint64_t v33 = [v32 _getWorkoutDefaultStartDateForRaceRoute];
          dispatch_semaphore_t v34 = [(RTWorkoutRouteManager *)v289 healthKitManager];
          id v35 = [v34 _getRTWorkoutDefaultTypesForRaceRoute];
          id v329 = location;
          uint64_t v277 = [v31 getLatestWorkoutWithStartDate:v33 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:v35 workoutTypes:&v329 error:1.79769313e308];
          objc_storeStrong(&location, v329);

          if (a7 && location)
          {
            id v36 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            id v15 = v30;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              int64_t v37 = (objc_class *)objc_opt_class();
              dispatch_time_t v38 = NSStringFromClass(v37);
              id v39 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              uint64_t v335 = v38;
              __int16 v336 = 2112;
              uint64_t v337 = v39;
              __int16 v338 = 2112;
              uint64_t v339 = (uint64_t)location;
LABEL_178:
              _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

              goto LABEL_41;
            }
            goto LABEL_41;
          }
          double v40 = [(RTWorkoutRouteManager *)v289 healthKitManager];
          uint64_t v41 = [(RTWorkoutRouteManager *)v289 healthKitManager];
          uint64_t v42 = [v41 _getWorkoutDefaultStartDateForRaceRoute];
          id v328 = location;
          uint64_t v43 = [v40 getWorkoutsCountWithStartDate:v42 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:&v328 error:1.79769313e308];
          objc_storeStrong(&location, v328);

          id v44 = location;
          double v45 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          id v36 = v45;
          id v15 = v30;
          if (a7 && v44)
          {
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              uint64_t v216 = (objc_class *)objc_opt_class();
              dispatch_time_t v38 = NSStringFromClass(v216);
              id v39 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              uint64_t v335 = v38;
              __int16 v336 = 2112;
              uint64_t v337 = v39;
              __int16 v338 = 2112;
              uint64_t v339 = (uint64_t)location;
              goto LABEL_178;
            }
LABEL_41:
            uint64_t v17 = v278;
            goto LABEL_42;
          }
          uint64_t v266 = v43;
          uint64_t v283 = v30;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            dispatch_time_t v47 = (objc_class *)objc_opt_class();
            id v48 = NSStringFromClass(v47);
            id v49 = NSStringFromSelector(aSelector);
            [v22 latitude];
            uint64_t v51 = v50;
            [v22 longitude];
            *(_DWORD *)buf = 138413059;
            uint64_t v335 = v48;
            __int16 v336 = 2112;
            uint64_t v337 = v49;
            __int16 v338 = 2049;
            uint64_t v339 = v51;
            __int16 v340 = 2049;
            uint64_t v341 = v52;
            _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "%@, %@, currentLocation latitude, %{private}f, longitude, %{private}f", buf, 0x2Au);
          }
          __int16 v270 = v22;

          context = (void *)MEMORY[0x1E016D870]();
          long long v269 = objc_opt_new();
          long long v324 = 0u;
          long long v325 = 0u;
          long long v326 = 0u;
          long long v327 = 0u;
          id v280 = v13;
          uint64_t v53 = [v280 countByEnumeratingWithState:&v324 objects:v351 count:16];
          id v54 = v289;
          if (v53)
          {
            uint64_t v55 = v53;
            uint64_t v286 = *(void *)v325;
            do
            {
              uint64_t v56 = 0;
              do
              {
                if (*(void *)v325 != v286) {
                  objc_enumerationMutation(v280);
                }
                uint64_t v57 = *(void *)(*((void *)&v324 + 1) + 8 * v56);
                dispatch_semaphore_t v58 = (void *)MEMORY[0x1E016D870]();
                id v59 = objc_opt_new();
                uint64_t v60 = [MEMORY[0x1E4F1C9C8] date];
                id v61 = [(RTWorkoutRouteManager *)v54 healthKitManager];
                id v323 = location;
                [v61 getWorkoutsWithUUIDs:v57 error:&v323];
                v63 = uint64_t v62 = v54;
                objc_storeStrong(&location, v323);

                if (location)
                {
                  int v64 = 21;
                  goto LABEL_69;
                }
                id v322 = 0;
                dispatch_time_t v65 = [(RTWorkoutRouteManager *)v62 _sortWorkouts:v63 key:@"startDate" ascending:0 error:&v322];
                objc_storeStrong(&location, v322);

                if (!location)
                {
                  id v321 = 0;
                  id v66 = [(RTWorkoutRouteManager *)v62 _bestWorkoutFromWorkouts:v65 error:&v321];
                  objc_storeStrong(&location, v321);
                  if (location)
                  {
                    int v64 = 21;
LABEL_67:

                    goto LABEL_68;
                  }
                  id v320 = 0;
                  id v274 = [(RTWorkoutRouteManager *)v62 _lastWorkoutFromWorkouts:v65 error:&v320];
                  objc_storeStrong(&location, v320);
                  if (location)
                  {
                    int v64 = 21;
LABEL_66:

                    goto LABEL_67;
                  }
                  id v319 = 0;
                  __int16 v272 = [(RTWorkoutRouteManager *)v62 _mapWorkoutsToUUIDs:v65 error:&v319];
                  objc_storeStrong(&location, v319);
                  if (location)
                  {
LABEL_64:
                    int v64 = 21;
                  }
                  else
                  {

                    id v318 = location;
                    [(RTWorkoutRouteManager *)v62 _relevanceScoreForWorkoutUUIDs:v272 representativeWorkout:v274 latestWorkoutAcrossAllWorkouts:v277 countOfAllWorkouts:v266 currentLocation:v270 error:&v318];
                    double v68 = v67;
                    objc_storeStrong(&location, v318);
                    if (location)
                    {
                      dispatch_time_t v65 = 0;
                      goto LABEL_64;
                    }
                    id v264 = [MEMORY[0x1E4F1C9C8] date];
                    id v69 = [(RTWorkoutRouteManager *)v62 _getWorkoutRouteSnapshotForWorkout:v274 error:&location];
                    if (location)
                    {
                      int v64 = 21;
                    }
                    else
                    {
                      uint64_t v260 = v66;
                      uint64_t v262 = v69;
                      uint64_t v70 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                      {
                        uint64_t v71 = (objc_class *)objc_opt_class();
                        double v72 = NSStringFromClass(v71);
                        double v73 = NSStringFromSelector(aSelector);
                        uint64_t v74 = [v262 length];
                        *(_DWORD *)buf = 138412802;
                        uint64_t v335 = v72;
                        __int16 v336 = 2112;
                        uint64_t v337 = v73;
                        __int16 v338 = 2048;
                        uint64_t v339 = v74;
                        _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_INFO, "%@, %@, snapshot length, %lu", buf, 0x20u);
                      }
                      BOOL v75 = NSNumber;
                      double v76 = [MEMORY[0x1E4F1C9C8] date];
                      [v76 timeIntervalSinceDate:v264];
                      id v77 = [v75 numberWithDouble:];
                      id v317 = location;
                      [(RTWorkoutRouteManager *)v289 _updateMetricsForCurrentTime:v77 syncToHealthKitKey:1 error:&v317];
                      objc_storeStrong(&location, v317);

                      if (location)
                      {
                        int v64 = 21;
                      }
                      else
                      {
                        id v316 = 0;
                        id v259 = [(RTWorkoutRouteManager *)v289 _getWorkoutRouteLabelForWorkout:v274 error:&v316];
                        objc_storeStrong(&location, v316);
                        if (location)
                        {
                          int v64 = 21;
                        }
                        else
                        {
                          uint64_t v250 = a7;
                          id v252 = v13;
                          id v78 = [(RTWorkoutRouteManager *)v289 healthKitManager];
                          BOOL v79 = [v260 UUID];
                          BOOL v80 = [v274 UUID];
                          id v315 = location;
                          int v81 = [v78 createWorkoutClusterWithWorkoutUUIDs:v272 bestWorkoutUUID:v79 lastWorkoutUUID:v80 relevanceValue:v262 workoutRouteSnapshot:v259 workoutRouteLabel:&v315 error:v68];
                          objc_storeStrong(&location, v315);

                          if (location) {
                            goto LABEL_86;
                          }
                          id v82 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                          {
                            BOOL v83 = (objc_class *)objc_opt_class();
                            id v84 = NSStringFromClass(v83);
                            uint64_t v85 = NSStringFromSelector(aSelector);
                            int v86 = @"NO";
                            if (v81) {
                              int v86 = @"YES";
                            }
                            char v258 = v86;
                            uint64_t v256 = [v272 count];
                            uint64_t v87 = [v260 UUID];
                            uint64_t v88 = [v274 UUID];
                            *(_DWORD *)buf = 138413826;
                            uint64_t v335 = v84;
                            __int16 v336 = 2112;
                            uint64_t v337 = v85;
                            __int16 v338 = 2112;
                            uint64_t v339 = (uint64_t)v258;
                            __int16 v340 = 2048;
                            uint64_t v341 = v256;
                            __int16 v342 = 2112;
                            uint64_t v343 = (uint64_t)v87;
                            __int16 v344 = 2112;
                            uint64_t v345 = (uint64_t)v88;
                            __int16 v346 = 2048;
                            double v347 = v68;
                            _os_log_impl(&dword_1D9BFA000, v82, OS_LOG_TYPE_INFO, "%@, %@, created cluster, status, %@, cluster size, %lu, bestWorkoutUUID, %@, lastWorkoutUUID, %@, relevance score, %.3f", buf, 0x48u);
                          }
                          uint64_t v89 = NSNumber;
                          uint64_t v90 = [MEMORY[0x1E4F1C9C8] date];
                          [v90 timeIntervalSinceDate:v60];
                          id v91 = [v89 numberWithDouble:];
                          id v314 = location;
                          [(RTWorkoutRouteManager *)v289 _updateMetricsForCurrentTime:v91 syncToHealthKitKey:3 error:&v314];
                          objc_storeStrong(&location, v314);

                          if (location)
                          {
LABEL_86:
                            int v64 = 21;
                          }
                          else
                          {
                            id v92 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v260 workoutActivityType]);
                            [v59 setObject:v92 forKeyedSubscript:@"activity_type"];

                            __int16 v93 = [[NSNumber numberWithBool:-[RTWorkoutRouteManager _shouldDecimateWorkout:](v289, "_shouldDecimateWorkout:", v260)];
                            [v59 setObject:v93 forKeyedSubscript:@"is_decimated"];

                            [v59 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"is_new_cluster"];
                            int v94 = NSNumber;
                            uint64_t v95 = [v260 UUID];
                            double v96 = [v274 UUID];
                            char v97 = [v94 numberWithBool:[v95 isEqual:v96]];
                            [v59 setObject:v97 forKeyedSubscript:@"is_best_also_last_workout"];

                            id v98 = [NSNumber numberWithUnsignedInteger:[v272 count]];
                            [v59 setObject:v98 forKeyedSubscript:@"count_workouts"];

                            __int16 v99 = NSNumber;
                            id v100 = [(RTWorkoutRouteManager *)v289 healthKitManager];
                            [v100 _getDurationForWorkout:v260];
                            uint64_t v101 = [v99 numberWithDouble:];
                            [v59 setObject:v101 forKeyedSubscript:@"duration"];

                            uint64_t v102 = NSNumber;
                            uint64_t v103 = [(RTWorkoutRouteManager *)v289 healthKitManager];
                            uint64_t v104 = [v103 _getTotalDistanceForWorkout:v260];
                            uint64_t v105 = [MEMORY[0x1E4F2B618] meterUnit];
                            [v104 doubleValueForUnit:v105];
                            id v106 = [v102 numberWithDouble:];
                            [v59 setObject:v106 forKeyedSubscript:@"total_distance"];

                            [v269 addObject:v59];
                            int v64 = 0;
                          }
                          a7 = v250;
                          id v13 = v252;
                        }
                      }
                      id v66 = v260;
                      id v69 = v262;
                    }

                    dispatch_time_t v65 = 0;
                  }

                  goto LABEL_66;
                }
                int v64 = 21;
LABEL_68:
                uint64_t v63 = v65;
LABEL_69:

                id v54 = v289;
                if (v64) {
                  goto LABEL_93;
                }
                ++v56;
              }
              while (v55 != v56);
              uint64_t v107 = [v280 countByEnumeratingWithState:&v324 objects:v351 count:16];
              uint64_t v55 = v107;
            }
            while (v107);
          }
LABEL_93:

          if (location)
          {
            id v15 = v283;
            uint64_t v17 = v278;
            goto LABEL_95;
          }
          uint64_t v108 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
          {
            id v109 = (objc_class *)objc_opt_class();
            uint64_t v110 = NSStringFromClass(v109);
            uint64_t v111 = NSStringFromSelector(aSelector);
            uint64_t v112 = [v280 count];
            uint64_t v113 = [MEMORY[0x1E4F1C9C8] date];
            [v113 timeIntervalSinceDate:v284];
            uint64_t v115 = v114;
            +[RTRuntime footprint];
            *(_DWORD *)buf = 138413314;
            uint64_t v335 = v110;
            __int16 v336 = 2112;
            uint64_t v337 = v111;
            __int16 v338 = 2048;
            uint64_t v339 = v112;
            __int16 v340 = 2048;
            uint64_t v341 = v115;
            __int16 v342 = 2048;
            uint64_t v343 = v116;
            _os_log_impl(&dword_1D9BFA000, v108, OS_LOG_TYPE_INFO, "%@, %@, created %lu new clusters to healthKit, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
          }
          uint64_t v263 = [MEMORY[0x1E4F1C9C8] date];

          long long v312 = 0u;
          long long v313 = 0u;
          long long v310 = 0u;
          long long v311 = 0u;
          id v271 = [v281 allKeys];
          uint64_t v22 = v270;
          unint64_t v117 = v289;
          id v275 = (id)[v271 countByEnumeratingWithState:&v310 objects:v350 count:16];
          if (!v275)
          {
LABEL_149:

            if (location)
            {
              long long v284 = v263;
              uint64_t v17 = v278;
              id v15 = v283;
              goto LABEL_151;
            }
            long long v190 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
            {
              long long v191 = (objc_class *)objc_opt_class();
              long long v192 = NSStringFromClass(v191);
              long long v193 = NSStringFromSelector(aSelector);
              uint64_t v194 = [v281 count];
              long long v195 = [MEMORY[0x1E4F1C9C8] date];
              [v195 timeIntervalSinceDate:v263];
              uint64_t v197 = v196;
              +[RTRuntime footprint];
              *(_DWORD *)buf = 138413314;
              uint64_t v335 = v192;
              __int16 v336 = 2112;
              uint64_t v337 = v193;
              __int16 v338 = 2048;
              uint64_t v339 = v194;
              __int16 v340 = 2048;
              uint64_t v341 = v197;
              __int16 v342 = 2048;
              uint64_t v343 = v198;
              _os_log_impl(&dword_1D9BFA000, v190, OS_LOG_TYPE_INFO, "%@, %@, updated %lu clusters to healthKit, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);
            }
            long long v284 = [MEMORY[0x1E4F1C9C8] date];

            long long v299 = 0u;
            long long v297 = 0u;
            long long v298 = 0u;
            long long v296 = 0u;
            uint64_t v17 = v278;
            id v199 = v278;
            uint64_t v200 = [v199 countByEnumeratingWithState:&v296 objects:v333 count:16];
            id v201 = v289;
            if (v200)
            {
              uint64_t v202 = v200;
              uint64_t v288 = *(void *)v297;
              id v276 = v199;
              while (2)
              {
                for (uint64_t i = 0; i != v202; ++i)
                {
                  if (*(void *)v297 != v288) {
                    objc_enumerationMutation(v276);
                  }
                  long long v204 = *(void **)(*((void *)&v296 + 1) + 8 * i);
                  long long v205 = (void *)MEMORY[0x1E016D870]();
                  long long v206 = [(RTWorkoutRouteManager *)v201 healthKitManager];
                  uint64_t v207 = [v204 clusterUUID];
                  id v295 = location;
                  int v208 = [v206 deleteWorkoutCluster:v207 error:&v295];
                  objc_storeStrong(&location, v295);

                  if (location)
                  {
                    uint64_t v17 = v278;
                    id v199 = v276;
                    goto LABEL_175;
                  }
                  uint64_t v209 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v210 = (objc_class *)objc_opt_class();
                    id v211 = NSStringFromClass(v210);
                    id v212 = NSStringFromSelector(aSelector);
                    uint64_t v213 = [v204 clusterUUID];
                    id v214 = (void *)v213;
                    *(_DWORD *)buf = 138413058;
                    id v215 = @"NO";
                    if (v208) {
                      id v215 = @"YES";
                    }
                    uint64_t v335 = v211;
                    __int16 v336 = 2112;
                    uint64_t v337 = v212;
                    __int16 v338 = 2112;
                    uint64_t v339 = v213;
                    __int16 v340 = 2112;
                    uint64_t v341 = (uint64_t)v215;
                    _os_log_impl(&dword_1D9BFA000, v209, OS_LOG_TYPE_INFO, "%@, %@, deleted cluster with cluster uuid, %@, status, %@", buf, 0x2Au);
                  }
                  uint64_t v17 = v278;
                  id v201 = v289;
                }
                id v199 = v276;
                uint64_t v202 = [v276 countByEnumeratingWithState:&v296 objects:v333 count:16];
                if (v202) {
                  continue;
                }
                break;
              }
            }
LABEL_175:

            if (!location)
            {
              long long v217 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
              {
                uint64_t v218 = (objc_class *)objc_opt_class();
                uint64_t v219 = NSStringFromClass(v218);
                __int16 v220 = NSStringFromSelector(aSelector);
                uint64_t v221 = [v199 count];
                __int16 v222 = [MEMORY[0x1E4F1C9C8] date];
                [v222 timeIntervalSinceDate:v284];
                uint64_t v224 = v223;
                +[RTRuntime footprint];
                *(_DWORD *)buf = 138413314;
                uint64_t v335 = v219;
                __int16 v336 = 2112;
                uint64_t v337 = v220;
                __int16 v338 = 2048;
                uint64_t v339 = v221;
                __int16 v340 = 2048;
                uint64_t v341 = v224;
                __int16 v342 = 2048;
                uint64_t v343 = v225;
                _os_log_impl(&dword_1D9BFA000, v217, OS_LOG_TYPE_INFO, "%@, %@, deleted %lu clusters from healthKit, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

                id v201 = v289;
              }

              __int16 v226 = (objc_class *)objc_opt_class();
              uint64_t v227 = NSStringFromClass(v226);
              __int16 v228 = NSStringFromSelector(aSelector);
              [(RTWorkoutRouteManager *)v201 _logClusters:v280 className:v227 selectorName:v228];

              uint64_t v229 = objc_opt_new();
              long long v291 = 0u;
              long long v292 = 0u;
              long long v293 = 0u;
              long long v294 = 0u;
              long long v230 = [v281 allValues];
              uint64_t v231 = [v230 countByEnumeratingWithState:&v291 objects:v332 count:16];
              if (v231)
              {
                uint64_t v232 = v231;
                uint64_t v233 = *(void *)v292;
                do
                {
                  for (uint64_t j = 0; j != v232; ++j)
                  {
                    if (*(void *)v292 != v233) {
                      objc_enumerationMutation(v230);
                    }
                    uint64_t v235 = *(void *)(*((void *)&v291 + 1) + 8 * j);
                    uint64_t v236 = (void *)MEMORY[0x1E016D870]();
                    [v229 addObject:v235];
                  }
                  uint64_t v232 = [v230 countByEnumeratingWithState:&v291 objects:v332 count:16];
                }
                while (v232);
              }

              long long v237 = (objc_class *)objc_opt_class();
              long long v238 = NSStringFromClass(v237);
              long long v239 = NSStringFromSelector(aSelector);
              [(RTWorkoutRouteManager *)v289 _logClusters:v229 className:v238 selectorName:v239];

              long long v240 = [(RTWorkoutRouteManager *)v289 workoutMetricsManager];
              id v290 = location;
              int v241 = [v240 submitMetricsForEvent:1 data:v269 error:&v290];
              objc_storeStrong(&location, v290);

              long long v242 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
              {
                long long v244 = (objc_class *)objc_opt_class();
                long long v245 = NSStringFromClass(v244);
                v246 = NSStringFromSelector(aSelector);
                if (v241) {
                  uint64_t v247 = @"YES";
                }
                else {
                  uint64_t v247 = @"NO";
                }
                uint64_t v248 = [v269 count];
                *(_DWORD *)buf = 138413058;
                uint64_t v335 = v245;
                __int16 v336 = 2112;
                uint64_t v337 = v246;
                __int16 v338 = 2112;
                uint64_t v339 = (uint64_t)v247;
                __int16 v340 = 2048;
                uint64_t v341 = v248;
                _os_log_error_impl(&dword_1D9BFA000, v242, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);
              }
              id v243 = location;

              id v15 = v283;
              uint64_t v22 = v270;
              if (v243)
              {
                uint64_t v17 = v278;
              }
              else
              {
                uint64_t v17 = v278;
              }
              goto LABEL_152;
            }
            id v15 = v283;
LABEL_95:
            uint64_t v22 = v270;
LABEL_151:

LABEL_152:
            BOOL v24 = 1;
            if (!a7 || !location)
            {
              id v14 = v281;
              goto LABEL_43;
            }
            id v36 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
LABEL_42:
              id v14 = v281;

              BOOL v24 = 0;
              *a7 = location;
LABEL_43:

LABEL_44:
              goto LABEL_45;
            }
            long long v179 = (objc_class *)objc_opt_class();
            dispatch_time_t v38 = NSStringFromClass(v179);
            id v39 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            uint64_t v335 = v38;
            __int16 v336 = 2112;
            uint64_t v337 = v39;
            __int16 v338 = 2112;
            uint64_t v339 = (uint64_t)location;
            goto LABEL_178;
          }
          uint64_t v273 = *(void *)v311;
LABEL_100:
          uint64_t v118 = 0;
          while (1)
          {
            if (*(void *)v311 != v273) {
              objc_enumerationMutation(v271);
            }
            id v119 = *(void **)(*((void *)&v310 + 1) + 8 * v118);
            id v120 = (void *)MEMORY[0x1E016D870]();
            uint64_t v285 = objc_opt_new();
            id v287 = [MEMORY[0x1E4F1C9C8] date];
            uint64_t v121 = [(RTWorkoutRouteManager *)v117 healthKitManager];
            uint64_t v122 = [v281 objectForKeyedSubscript:v119];
            uint64_t v123 = [v122 allObjects];
            id v309 = location;
            uint64_t v124 = [v121 getWorkoutsWithUUIDs:v123 error:&v309];
            objc_storeStrong(&location, v309);

            if (!location) {
              break;
            }
            int v125 = 23;
LABEL_122:

            unint64_t v117 = v289;
            if (v125) {
              goto LABEL_149;
            }
            if (v275 == (id)++v118)
            {
              uint64_t v178 = [v271 countByEnumeratingWithState:&v310 objects:v350 count:16];
              id v275 = (id)v178;
              if (!v178) {
                goto LABEL_149;
              }
              goto LABEL_100;
            }
          }
          uint64_t v126 = [v283 objectForKeyedSubscript:v119];

          if (v126)
          {
            uint64_t v127 = [v283 objectForKeyedSubscript:v119];
            uint64_t v128 = [v127 allObjects];
          }
          else
          {
            uint64_t v128 = 0;
          }
          id v308 = location;
          uint64_t v129 = [(RTWorkoutRouteManager *)v289 _sortWorkouts:v124 key:@"startDate" ascending:0 error:&v308];
          objc_storeStrong(&location, v308);

          if (location)
          {
            int v125 = 23;
LABEL_121:

            uint64_t v124 = v129;
            goto LABEL_122;
          }
          id v307 = 0;
          long long v268 = [(RTWorkoutRouteManager *)v289 _bestWorkoutFromWorkouts:v129 error:&v307];
          objc_storeStrong(&location, v307);
          if (location)
          {
            int v125 = 23;
LABEL_120:

            goto LABEL_121;
          }
          BOOL v130 = v289;
          id v306 = 0;
          uint64_t v131 = [(RTWorkoutRouteManager *)v289 _lastWorkoutFromWorkouts:v129 error:&v306];
          objc_storeStrong(&location, v306);
          BOOL v265 = (void *)v131;
          if (location)
          {
            int v125 = 23;
LABEL_119:

            goto LABEL_120;
          }
          id v305 = 0;
          id v261 = [(RTWorkoutRouteManager *)v289 _mapWorkoutsToUUIDs:v129 error:&v305];
          objc_storeStrong(&location, v305);
          if (location) {
            goto LABEL_117;
          }

          id v304 = location;
          [(RTWorkoutRouteManager *)v289 _relevanceScoreForWorkoutUUIDs:v261 representativeWorkout:v131 latestWorkoutAcrossAllWorkouts:v277 countOfAllWorkouts:v266 currentLocation:v22 error:&v304];
          double v133 = v132;
          objc_storeStrong(&location, v304);
          if (location)
          {
            uint64_t v129 = 0;
LABEL_117:
            int v125 = 23;
LABEL_118:

            goto LABEL_119;
          }
          id v257 = v128;
          id v134 = [v119 workoutRouteLabel];
          int v135 = [v134 isEqualToString:&stru_1F33EAD88];

          if (v135)
          {
            id v303 = location;
            uint64_t v136 = [(RTWorkoutRouteManager *)v289 _getWorkoutRouteLabelForWorkout:v265 error:&v303];
            objc_storeStrong(&location, v303);
            if (location)
            {
LABEL_127:

              goto LABEL_137;
            }
            if (([v136 isEqualToString:&stru_1F33EAD88] & 1) == 0)
            {
              uint64_t v137 = [(RTWorkoutRouteManager *)v289 healthKitManager];
              uint64_t v138 = [v119 clusterUUID];
              id v302 = location;
              int v139 = [v137 updateWorkoutClusterWithUUID:v138 workoutRouteLabel:v136 error:&v302];
              objc_storeStrong(&location, v302);

              if (location) {
                goto LABEL_127;
              }
              id v253 = v13;
              double v140 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
              {
                id v141 = (objc_class *)objc_opt_class();
                id v142 = NSStringFromClass(v141);
                uint64_t v143 = NSStringFromSelector(aSelector);
                uint64_t v144 = [v119 clusterUUID];
                id v145 = (void *)v144;
                *(_DWORD *)buf = 138413314;
                id v146 = @"NO";
                if (v139) {
                  id v146 = @"YES";
                }
                uint64_t v335 = v142;
                __int16 v336 = 2112;
                uint64_t v337 = v143;
                __int16 v338 = 2112;
                uint64_t v339 = v144;
                __int16 v340 = 2112;
                uint64_t v341 = (uint64_t)v146;
                __int16 v342 = 2112;
                uint64_t v343 = (uint64_t)v136;
                _os_log_impl(&dword_1D9BFA000, v140, OS_LOG_TYPE_INFO, "%@, %@, updated cluster with cluster uuid, %@, status, %@, new route label, %@,", buf, 0x34u);
              }
              id v13 = v253;
              uint64_t v22 = v270;
            }

            BOOL v130 = v289;
          }
          v254 = [(RTWorkoutRouteManager *)v130 healthKitManager];
          __int16 v147 = [v119 clusterUUID];
          int v148 = [v268 UUID];
          id v149 = [v265 UUID];
          id v150 = [NSNumber numberWithDouble:v133];
          id v301 = location;
          int v249 = [v254 updateWorkoutClusterWithUUID:v147 newBestWorkoutUUID:v148 newLastWorkoutUUID:v149 newRelevance:v150 newWorkoutAssociations:v261 workoutAssociationsToRemove:v257 error:&v301];
          objc_storeStrong(&location, v301);

          if (!location)
          {
            BOOL v251 = a7;
            id v255 = v13;
            __int16 v151 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
            {
              uint64_t v152 = (objc_class *)objc_opt_class();
              __int16 v153 = NSStringFromClass(v152);
              uint64_t v154 = NSStringFromSelector(aSelector);
              uint64_t v155 = [v119 clusterUUID];
              if (v249) {
                id v156 = @"YES";
              }
              else {
                id v156 = @"NO";
              }
              uint64_t v157 = [v261 count];
              id v158 = [v268 UUID];
              uint64_t v159 = [v265 UUID];
              *(_DWORD *)buf = 138414082;
              uint64_t v335 = v153;
              __int16 v336 = 2112;
              uint64_t v337 = v154;
              __int16 v338 = 2112;
              uint64_t v339 = (uint64_t)v155;
              __int16 v340 = 2112;
              uint64_t v341 = (uint64_t)v156;
              __int16 v342 = 2048;
              uint64_t v343 = v157;
              __int16 v344 = 2112;
              uint64_t v345 = (uint64_t)v158;
              __int16 v346 = 2112;
              double v347 = *(double *)&v159;
              __int16 v348 = 2048;
              double v349 = v133;
              _os_log_impl(&dword_1D9BFA000, v151, OS_LOG_TYPE_INFO, "%@, %@, updated cluster with cluster uuid, %@, status, %@, cluster size, %lu, bestWorkoutUUID, %@, lastWorkoutUUID, %@, relevance score, %.3f", buf, 0x52u);
            }
            uint64_t v160 = NSNumber;
            __int16 v161 = [MEMORY[0x1E4F1C9C8] date];
            [v161 timeIntervalSinceDate:v287];
            double v162 = [v160 numberWithDouble:];
            id v300 = location;
            [(RTWorkoutRouteManager *)v289 _updateMetricsForCurrentTime:v162 syncToHealthKitKey:2 error:&v300];
            objc_storeStrong(&location, v300);

            if (location)
            {
              uint64_t v129 = 0;
              int v125 = 23;
            }
            else
            {
              uint64_t v163 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v268 workoutActivityType]);
              [v285 setObject:v163 forKeyedSubscript:@"activity_type"];

              uint64_t v164 = [NSNumber numberWithBool:-[RTWorkoutRouteManager _shouldDecimateWorkout:](v289, "_shouldDecimateWorkout:", v268)];
              [v285 setObject:v164 forKeyedSubscript:@"is_decimated"];

              [v285 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"is_new_cluster"];
              uint64_t v165 = NSNumber;
              uint64_t v166 = [v268 UUID];
              id v167 = [v265 UUID];
              id v168 = [v165 numberWithBool:[v166 isEqual:v167]];
              [v285 setObject:v168 forKeyedSubscript:@"is_best_also_last_workout"];

              uint64_t v169 = [NSNumber numberWithUnsignedInteger:[v261 count]];
              [v285 setObject:v169 forKeyedSubscript:@"count_workouts"];

              uint64_t v170 = NSNumber;
              uint64_t v171 = [(RTWorkoutRouteManager *)v289 healthKitManager];
              [v171 _getDurationForWorkout:v268];
              uint64_t v172 = [v170 numberWithDouble:];
              [v285 setObject:v172 forKeyedSubscript:@"duration"];

              uint64_t v173 = NSNumber;
              id v174 = [(RTWorkoutRouteManager *)v289 healthKitManager];
              unint64_t v175 = [v174 _getTotalDistanceForWorkout:v268];
              double v176 = [MEMORY[0x1E4F2B618] meterUnit];
              [v175 doubleValueForUnit:v176];
              uint64_t v177 = [v173 numberWithDouble:];
              [v285 setObject:v177 forKeyedSubscript:@"total_distance"];

              [v269 addObject:v285];
              uint64_t v129 = 0;
              int v125 = 0;
            }
            a7 = v251;
            id v13 = v255;
            uint64_t v22 = v270;
            goto LABEL_147;
          }
LABEL_137:
          uint64_t v129 = 0;
          int v125 = 23;
LABEL_147:
          uint64_t v128 = v257;
          goto LABEL_118;
        }
        id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: remoteClustersForDeletion", buf, 2u);
        }

        if (a7)
        {
          id v26 = @"remoteClustersForDeletion";
          goto LABEL_32;
        }
LABEL_33:
        BOOL v24 = 0;
        goto LABEL_45;
      }
      id v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: remoteClustersForUpdationWorkoutsToRemove", buf, 2u);
      }

      if (!a7) {
        goto LABEL_33;
      }
      id v26 = @"remoteClustersForUpdationWorkoutsToRemove";
    }
    else
    {
      BOOL v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: remoteClustersForUpdationNewWorkouts", buf, 2u);
      }

      if (!a7) {
        goto LABEL_33;
      }
      id v26 = @"remoteClustersForUpdationNewWorkouts";
    }
  }
  else
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localClustersForCreation", buf, 2u);
    }

    if (!a7) {
      goto LABEL_33;
    }
    id v26 = @"localClustersForCreation";
  }
LABEL_32:
  _RTErrorInvalidParameterCreate((uint64_t)v26);
  BOOL v24 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

  return v24;
}

- (BOOL)_syncClustersToWatchWithLimit:(unint64_t)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 1;
  uint64_t v45 = 0;
  int v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__133;
  id v49 = __Block_byref_object_dispose__133;
  id v50 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [(RTWorkoutRouteManager *)self healthKitManager];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __61__RTWorkoutRouteManager__syncClustersToWatchWithLimit_error___block_invoke;
  v40[3] = &unk_1E6B9AFB0;
  uint64_t v42 = v51;
  uint64_t v43 = &v45;
  v40[4] = self;
  SEL v44 = a2;
  uint64_t v8 = v6;
  uint64_t v41 = v8;
  [v7 generateRaceRouteClustersWithLimit:100 handler:v40];

  uint64_t v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v9, v11)) {
    goto LABEL_6;
  }
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceDate:v10];
  double v14 = v13;
  id v15 = objc_opt_new();
  id v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v18 = [v17 filteredArrayUsingPredicate:v16];
  double v19 = [v18 firstObject];

  [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
  id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v21 = (void *)MEMORY[0x1E4F28C58];
  v58[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v58 count:1];
  double v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
LABEL_6:
    id v24 = 0;
  }

  id v25 = v24;
  id v26 = v25;
  if (a4 && v25)
  {
    BOOL v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_t v34 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v33;
      __int16 v54 = 2112;
      uint64_t v55 = v34;
      __int16 v56 = 2112;
      uint64_t v57 = v26;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v28 = v26;
  }
  else
  {
    if (!a4 || !v46[5])
    {
      BOOL v30 = 1;
      goto LABEL_19;
    }
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      int64_t v37 = NSStringFromSelector(a2);
      dispatch_time_t v38 = (void *)v46[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v36;
      __int16 v54 = 2112;
      uint64_t v55 = v37;
      __int16 v56 = 2112;
      uint64_t v57 = v38;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v28 = (void *)v46[5];
  }
  BOOL v30 = 0;
  *a4 = v28;
LABEL_19:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v51, 8);
  return v30;
}

void __61__RTWorkoutRouteManager__syncClustersToWatchWithLimit_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    dispatch_time_t v11 = (void *)v10;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    int v13 = 138413058;
    double v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = 100;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, synced clusters with limit, %lu, status, %@", (uint8_t *)&v13, 0x2Au);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_deleteAllClustersFromHealthKitError:(id *)a3
{
  v73[1] = *MEMORY[0x1E4F143B8];
  [(RTWorkoutRouteManager *)self _clearInMemoryClusters];
  char v4 = objc_opt_new();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  int v64 = __Block_byref_object_copy__133;
  dispatch_time_t v65 = __Block_byref_object_dispose__133;
  id v66 = 0;
  id v6 = [(RTWorkoutRouteManager *)self healthKitManager];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __62__RTWorkoutRouteManager__deleteAllClustersFromHealthKitError___block_invoke;
  v57[3] = &unk_1E6B9AFD8;
  id v51 = v4;
  id v58 = v51;
  id v7 = v5;
  id v59 = v7;
  uint64_t v60 = &v61;
  [v6 fetchWorkoutClustersWithHandler:v57];

  dsema = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v9)) {
    goto LABEL_6;
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  int v13 = objc_opt_new();
  double v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  __int16 v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v16 = [v15 filteredArrayUsingPredicate:v14];
  __int16 v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  __int16 v19 = (void *)MEMORY[0x1E4F28C58];
  v73[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v73 count:1];
  uint64_t v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;
  }
  else
  {
LABEL_6:
    id v22 = 0;
  }

  id v23 = v22;
  id v24 = v23;
  if (v51 && v23)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v42;
      __int16 v69 = 2112;
      uint64_t v70 = v43;
      __int16 v71 = 2112;
      id v72 = v24;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
    }
    [v51 addObject:v24];

    id v24 = 0;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v26 = (id)v62[5];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v54;
    do
    {
      uint64_t v29 = 0;
      BOOL v30 = v24;
      do
      {
        if (*(void *)v54 != v28) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v53 + 1) + 8 * v29);
        int v32 = (void *)MEMORY[0x1E016D870]();
        id v33 = [(RTWorkoutRouteManager *)self healthKitManager];
        dispatch_semaphore_t v34 = [v31 clusterUUID];
        id v52 = v30;
        [v33 deleteWorkoutCluster:v34 error:&v52];
        id v24 = v52;

        ++v29;
        BOOL v30 = v24;
      }
      while (v27 != v29);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v27);
  }

  if (v24) {
    BOOL v35 = v51 != 0;
  }
  else {
    BOOL v35 = 0;
  }
  if (v35)
  {
    id v36 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      SEL v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      int v46 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v45;
      __int16 v69 = 2112;
      uint64_t v70 = v46;
      __int16 v71 = 2112;
      id v72 = v24;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
    }
    [v51 addObject:v24];

    id v24 = 0;
  }
  if (a3)
  {
    if ([v51 count])
    {
      uint64_t v47 = 1;
      int64_t v37 = _RTSafeArray();
      _RTMultiErrorCreate();
      id v38 = objc_claimAutoreleasedReturnValue();
      *a3 = v38;
    }
    else
    {
      *a3 = 0;
    }
  }
  BOOL v39 = [v51 count] == 0;

  _Block_object_dispose(&v61, 8);
  return v39;
}

void __62__RTWorkoutRouteManager__deleteAllClustersFromHealthKitError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) addObject:a3];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_storeWorkoutDistances:(id)a3 error:(id *)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = __Block_byref_object_copy__133;
  id v50 = __Block_byref_object_dispose__133;
  id v51 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __54__RTWorkoutRouteManager__storeWorkoutDistances_error___block_invoke;
  v42[3] = &unk_1E6B907C8;
  id v45 = &v46;
  id v9 = v6;
  id v43 = v9;
  uint64_t v10 = v7;
  SEL v44 = v10;
  [v8 storeWorkoutDistances:v9 handler:v42];

  double v11 = v10;
  double v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13)) {
    goto LABEL_6;
  }
  double v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  __int16 v17 = objc_opt_new();
  uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  __int16 v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v20 = [v19 filteredArrayUsingPredicate:v18];
  uint64_t v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v23 = (void *)MEMORY[0x1E4F28C58];
  v57[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v57 count:1];
  id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;
  }
  else
  {
LABEL_6:
    id v26 = 0;
  }

  id v27 = v26;
  uint64_t v28 = v27;
  if (a4 && v27)
  {
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      dispatch_semaphore_t v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      id v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v53 = 2112;
      long long v54 = v36;
      __int16 v55 = 2112;
      long long v56 = v28;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    BOOL v30 = v28;
  }
  else
  {
    if (!a4 || !v47[5])
    {
      BOOL v32 = 1;
      goto LABEL_19;
    }
    id v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int64_t v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v39 = NSStringFromSelector(a2);
      double v40 = (void *)v47[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v53 = 2112;
      long long v54 = v39;
      __int16 v55 = 2112;
      long long v56 = v40;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    BOOL v30 = (void *)v47[5];
  }
  BOOL v32 = 0;
  *a4 = v30;
LABEL_19:

  _Block_object_dispose(&v46, 8);
  return v32;
}

void __54__RTWorkoutRouteManager__storeWorkoutDistances_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Stored Distance Records, count, %lu, error, %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_updateWorkoutDistanceRecordsWithObjectIDs:(id)a3 isVisited:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v61[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  __int16 v53 = __Block_byref_object_copy__133;
  long long v54 = __Block_byref_object_dispose__133;
  id v55 = 0;
  int v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v7 count];
    __int16 v10 = @"NO";
    if (v6) {
      __int16 v10 = @"YES";
    }
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v57 = 2112;
    id v58 = v10;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "updating distance records with count, %lu, isVisited, %@", buf, 0x16u);
  }

  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v12 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __84__RTWorkoutRouteManager__updateWorkoutDistanceRecordsWithObjectIDs_isVisited_error___block_invoke;
  v46[3] = &unk_1E6B938B0;
  uint64_t v48 = &v50;
  BOOL v49 = v6;
  dispatch_time_t v13 = v11;
  uint64_t v47 = v13;
  [v12 updateWorkoutDistancesWithObjectIDs:v7 isVisited:v6 handler:v46];

  double v14 = v13;
  double v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_10;
  }
  __int16 v17 = [MEMORY[0x1E4F1C9C8] now];
  [v17 timeIntervalSinceDate:v15];
  double v19 = v18;
  id v20 = objc_opt_new();
  uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  id v22 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v23 = [v22 filteredArrayUsingPredicate:v21];
  id v24 = [v23 firstObject];

  [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
  id v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v26 = (void *)MEMORY[0x1E4F28C58];
  v61[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v61 count:1];
  uint64_t v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

  if (v28)
  {
    id v29 = v28;
  }
  else
  {
LABEL_10:
    id v29 = 0;
  }

  id v30 = v29;
  id v31 = v30;
  if (a5 && v30)
  {
    BOOL v32 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int64_t v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      BOOL v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v57 = 2112;
      id v58 = v39;
      __int16 v59 = 2112;
      uint64_t v60 = v31;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v33 = v31;
  }
  else
  {
    if (!a5 || !v51[5])
    {
      BOOL v35 = 1;
      goto LABEL_23;
    }
    dispatch_semaphore_t v34 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      double v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v43 = (void *)v51[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v41;
      __int16 v57 = 2112;
      id v58 = v42;
      __int16 v59 = 2112;
      uint64_t v60 = v43;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v33 = (void *)v51[5];
  }
  BOOL v35 = 0;
  *a5 = v33;
LABEL_23:

  _Block_object_dispose(&v50, 8);
  return v35;
}

void __84__RTWorkoutRouteManager__updateWorkoutDistanceRecordsWithObjectIDs_isVisited_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 48)) {
      int v8 = @"YES";
    }
    else {
      int v8 = @"NO";
    }
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v10 = 134218498;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    dispatch_time_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "updated distance records, count, %lu, isVisited, %@, error, %@", (uint8_t *)&v10, 0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_bestWorkoutFromWorkouts:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v42 = "-[RTWorkoutRouteManager _bestWorkoutFromWorkouts:error:]";
      __int16 v43 = 1024;
      LODWORD(v44) = 5594;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts (in %s:%d)", buf, 0x12u);
    }
  }
  id v31 = a4;
  int v8 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (!v9)
  {
    uint64_t v11 = 0;
    id v34 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  id v34 = 0;
  uint64_t v12 = *(void *)v38;
  double v13 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v38 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      uint64_t v16 = (void *)MEMORY[0x1E016D870]();
      id v36 = v11;
      __int16 v17 = [(RTWorkoutRouteManager *)self _paceFromWorkout:v15 error:&v36];
      id v18 = v36;

      if (v8 && v18)
      {
        double v19 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          id v33 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          id v42 = v33;
          __int16 v43 = 2112;
          uint64_t v44 = v25;
          id v26 = (void *)v25;
          __int16 v45 = 2112;
          id v46 = v18;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
        }
        [v8 addObject:v18];
        id v20 = v18;
        id v18 = 0;
      }
      else
      {
        [v17 doubleValue];
        if (v21 >= v13) {
          goto LABEL_18;
        }
        [v17 doubleValue];
        double v13 = v22;
        id v23 = v15;
        id v20 = v34;
        id v34 = v23;
      }

LABEL_18:
      uint64_t v11 = v18;
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  }
  while (v10);
LABEL_22:

  if ([v8 count])
  {
    if (v31)
    {
      id v27 = _RTSafeArray();
      _RTMultiErrorCreate();
      id *v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v28 = 0;
    id v29 = v34;
  }
  else
  {
    id v29 = v34;
    id v28 = v34;
  }

  return v28;
}

- (id)_lastWorkoutFromWorkouts:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = "-[RTWorkoutRouteManager _lastWorkoutFromWorkouts:error:]";
      __int16 v31 = 1024;
      int v32 = 5624;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts (in %s:%d)", buf, 0x12u);
    }
  }
  double v22 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v23 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        __int16 v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1E016D870]();
        uint64_t v16 = [v14 endDate];
        if ([v16 compare:v7] == 1)
        {
          id v17 = v16;

          id v18 = v14;
          uint64_t v11 = v18;
          id v7 = v17;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  if ([v23 count])
  {
    double v19 = v22;
    if (v22)
    {
      id v20 = _RTSafeArray();
      _RTMultiErrorCreate();
      id *v22 = (id)objc_claimAutoreleasedReturnValue();

      double v19 = 0;
    }
  }
  else
  {
    double v19 = v11;
  }

  return v19;
}

- (id)_getRelevanceLocationWithError:(id *)a3
{
  v87[1] = *MEMORY[0x1E4F143B8];
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  BOOL v79 = __Block_byref_object_copy__133;
  char v3 = 1;
  BOOL v80 = __Block_byref_object_dispose__133;
  id v81 = 0;
  uint64_t v58 = *MEMORY[0x1E4F5CFE8];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  while ((v3 & 1) != 0)
  {
    context = (void *)MEMORY[0x1E016D870]();
    uint64_t v70 = 0;
    __int16 v71 = &v70;
    uint64_t v72 = 0x3032000000;
    double v73 = __Block_byref_object_copy__133;
    uint64_t v74 = __Block_byref_object_dispose__133;
    id v75 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = [(RTWorkoutRouteManager *)self locationManager];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke;
    v66[3] = &unk_1E6B93B48;
    double v68 = &v76;
    __int16 v69 = &v70;
    id v6 = v4;
    double v67 = v6;
    [v5 fetchCurrentLocationWithHandler:v66];

    id v8 = (id *)(v77 + 5);
    id v7 = (id)v77[5];
    uint64_t v9 = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v11 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v9, v11))
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
      [v12 timeIntervalSinceDate:v10];
      double v14 = v13;
      uint64_t v15 = objc_opt_new();
      uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 filteredArrayUsingPredicate:v16];
      double v19 = [v18 firstObject];

      [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
      id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      double v21 = (void *)MEMORY[0x1E4F28C58];
      v87[0] = v59;
      *(void *)buf = @"semaphore wait timeout";
      double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v87 count:1];
      id v23 = [v21 errorWithDomain:v58 code:15 userInfo:v22];

      if (v23)
      {
        id v7 = v23;
      }
    }

    objc_storeStrong(v8, v7);
    if (v77[5])
    {
      int v24 = 2;
    }
    else if (v71[5])
    {
      long long v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        long long v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = NSStringFromSelector(a2);
        uint64_t v29 = v71[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v83 = 2112;
        id v84 = v28;
        __int16 v85 = 2112;
        uint64_t v86 = v29;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, current location, %@", buf, 0x20u);
      }
      id v57 = (id)v71[5];
      int v24 = 1;
    }
    else
    {
      dispatch_semaphore_t v30 = dispatch_semaphore_create(0);

      __int16 v31 = [(RTWorkoutRouteManager *)self locationManager];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke_267;
      v62[3] = &unk_1E6B93B48;
      int v64 = &v76;
      dispatch_time_t v65 = &v70;
      int v32 = v30;
      uint64_t v63 = v32;
      [v31 fetchLastLocationWithHandler:v62];

      id v34 = (id *)(v77 + 5);
      id v33 = (id)v77[5];
      uint64_t v9 = v32;
      BOOL v35 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v36 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v9, v36))
      {
        long long v56 = [MEMORY[0x1E4F1C9C8] now];
        [v56 timeIntervalSinceDate:v35];
        double v38 = v37;
        long long v39 = objc_opt_new();
        long long v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
        id v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v42 = [v41 filteredArrayUsingPredicate:v40];
        __int16 v43 = [v42 firstObject];

        [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
        uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        __int16 v45 = (void *)MEMORY[0x1E4F28C58];
        v87[0] = v59;
        *(void *)buf = @"semaphore wait timeout";
        id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v87 count:1];
        uint64_t v47 = [v45 errorWithDomain:v58 code:15 userInfo:v46];

        if (v47)
        {
          id v33 = v47;
        }
      }

      objc_storeStrong(v34, v33);
      if (v77[5])
      {
        int v24 = 2;
      }
      else if (v71[5])
      {
        uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          BOOL v49 = (objc_class *)objc_opt_class();
          NSStringFromClass(v49);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          id v51 = NSStringFromSelector(a2);
          uint64_t v52 = v71[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v50;
          __int16 v83 = 2112;
          id v84 = v51;
          __int16 v85 = 2112;
          uint64_t v86 = v52;
          _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, %@, current location, %@", buf, 0x20u);
        }
        id v57 = (id)v71[5];
        int v24 = 1;
      }
      else
      {
        int v24 = 0;
      }
    }
    _Block_object_dispose(&v70, 8);

    char v3 = 0;
    if (v24)
    {
      if (v24 != 2) {
        goto LABEL_31;
      }
      break;
    }
  }
  id v57 = 0;
  if (a3) {
    *a3 = (id) v77[5];
  }
LABEL_31:
  _Block_object_dispose(&v76, 8);

  return v57;
}

void __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke_267(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (double)_relevanceScoreForWorkoutUUIDs:(id)a3 representativeWorkout:(id)a4 latestWorkoutAcrossAllWorkouts:(id)a5 countOfAllWorkouts:(unint64_t)a6 currentLocation:(id)a7 error:(id *)a8
{
  v140[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  __int16 v99 = v17;
  id v100 = a7;
  if (!v15)
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    double v35 = 0.0;
    if (!a8) {
      goto LABEL_61;
    }
    _RTErrorInvalidParameterCreate(@"workoutUUIDs");
    id v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
    *a8 = v36;
    goto LABEL_61;
  }
  if (!v16)
  {
    double v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: representativeWorkout", buf, 2u);
    }

    double v35 = 0.0;
    if (!a8) {
      goto LABEL_61;
    }
    _RTErrorInvalidParameterCreate(@"representativeWorkout");
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (!v17)
  {
    double v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: latestWorkoutAcrossAllWorkouts", buf, 2u);
    }

    double v35 = 0.0;
    if (!a8) {
      goto LABEL_61;
    }
    _RTErrorInvalidParameterCreate(@"latestWorkoutAcrossAllWorkouts");
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (a6)
  {
    aSelector = a2;
    uint64_t v115 = 0;
    uint64_t v116 = (double *)&v115;
    uint64_t v117 = 0x3032000000;
    uint64_t v118 = __Block_byref_object_copy__133;
    id v119 = __Block_byref_object_dispose__133;
    id v120 = 0;
    uint64_t v111 = 0;
    uint64_t v112 = &v111;
    uint64_t v113 = 0x2020000000;
    uint64_t v114 = 0;
    uint64_t v107 = 0;
    uint64_t v108 = &v107;
    uint64_t v109 = 0x2020000000;
    uint64_t v110 = 0;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    double v19 = [(RTWorkoutRouteManager *)self healthKitManager];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __150__RTWorkoutRouteManager__relevanceScoreForWorkoutUUIDs_representativeWorkout_latestWorkoutAcrossAllWorkouts_countOfAllWorkouts_currentLocation_error___block_invoke;
    v102[3] = &unk_1E6B9B000;
    uint64_t v104 = &v111;
    uint64_t v105 = &v107;
    id v106 = &v115;
    id v20 = v18;
    uint64_t v103 = v20;
    [v19 fetchRouteLocationsUsingWorkout:v16 decimationLevel:3 limit:1 shift:0 handler:v102];

    dsema = v20;
    double v96 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v21 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v21)) {
      goto LABEL_22;
    }
    uint64_t v95 = [MEMORY[0x1E4F1C9C8] now];
    [v95 timeIntervalSinceDate:v96];
    double v23 = v22;
    int v24 = objc_opt_new();
    long long v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
    long long v26 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v27 = [v26 filteredArrayUsingPredicate:v25];
    id v28 = [v27 firstObject];

    [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    dispatch_semaphore_t v30 = (void *)MEMORY[0x1E4F28C58];
    v140[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    __int16 v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v140 count:1];
    int v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v31];

    if (v32)
    {
      id v33 = v32;
    }
    else
    {
LABEL_22:
      id v33 = 0;
    }

    id v39 = v33;
    long long v40 = v39;
    if (a8 && v39)
    {
      id v41 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        __int16 v83 = (objc_class *)objc_opt_class();
        NSStringFromClass(v83);
        id v84 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v85 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v84;
        __int16 v122 = 2112;
        uint64_t v123 = v85;
        __int16 v124 = 2112;
        double v125 = *(double *)&v40;
        _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v42 = v40;
LABEL_38:
      *a8 = v42;
      double v35 = 0.0;
LABEL_60:

      _Block_object_dispose(&v107, 8);
      _Block_object_dispose(&v111, 8);
      _Block_object_dispose(&v115, 8);

      goto LABEL_61;
    }
    if (a8 && *((void *)v116 + 5))
    {
      uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v86 = (objc_class *)objc_opt_class();
        NSStringFromClass(v86);
        id v87 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v88 = NSStringFromSelector(aSelector);
        double v89 = v116[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v87;
        __int16 v122 = 2112;
        uint64_t v123 = v88;
        __int16 v124 = 2112;
        double v125 = v89;
        _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v42 = *((id *)v116 + 5);
      goto LABEL_38;
    }
    if (!v108[3])
    {
      id v57 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v138 = *MEMORY[0x1E4F28568];
      uint64_t v58 = NSString;
      uint64_t v59 = [v16 UUID];
      uint64_t v60 = [v58 stringWithFormat:@"no locations returned for workout UUID, %@", v59, aSelector];
      int v139 = v60;
      uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
      uint64_t v62 = [v57 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v61];
      uint64_t v63 = (void *)*((void *)v116 + 5);
      *((void *)v116 + 5) = v62;

      int v64 = v112;
      dispatch_time_t v65 = (void *)v112[3];
      if (v65)
      {
        free(v65);
        int v64 = v112;
      }
      v64[3] = 0;
      double v35 = 0.0;
      if (a8) {
        *a8 = *((id *)v116 + 5);
      }
      goto LABEL_60;
    }
    uint64_t v45 = [(RTWorkoutRouteManager *)self _getRTLocationUsingCLLocationCoordinate2D:v112[3]];
    id v46 = [(RTWorkoutRouteManager *)self distanceCalculator];
    uint64_t v47 = (id *)(v116 + 5);
    id obj = (id)*((void *)v116 + 5);
    [v46 distanceFromLocation:v100 toLocation:v45 error:&obj];
    double v49 = v48;
    char v97 = (void *)v45;
    objc_storeStrong(v47, obj);

    id v50 = v112;
    id v51 = (void *)v112[3];
    if (v51)
    {
      free(v51);
      id v50 = v112;
    }
    v50[3] = 0;
    if (a8 && *((void *)v116 + 5))
    {
      uint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        uint64_t v90 = (objc_class *)objc_opt_class();
        NSStringFromClass(v90);
        id v91 = (id)objc_claimAutoreleasedReturnValue();
        id v92 = NSStringFromSelector(aSelector);
        double v93 = v116[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v91;
        __int16 v122 = 2112;
        uint64_t v123 = v92;
        __int16 v124 = 2112;
        double v125 = v93;
        _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      *a8 = *((id *)v116 + 5);
    }
    else
    {
      if (v49 <= 80467.0)
      {
        unint64_t v66 = [v15 count];
        double v67 = [MEMORY[0x1E4F1C9C8] date];
        double v68 = [v16 endDate];
        [v67 timeIntervalSinceDate:v68];
        double v70 = v69;

        __int16 v71 = [v99 endDate];
        [v67 timeIntervalSinceDate:v71];
        double v73 = v72;

        uint64_t v74 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        double v75 = (double)v66 / (double)a6 * 50.0;
        double v76 = v70 / 86400.0;
        double v77 = v73 / 86400.0;
        double v78 = v77 / (v70 / 86400.0) * 50.0;
        double v35 = v75 + v78;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          BOOL v79 = (objc_class *)objc_opt_class();
          NSStringFromClass(v79);
          id v80 = (id)objc_claimAutoreleasedReturnValue();
          id v81 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138414338;
          *(void *)&uint8_t buf[4] = v80;
          __int16 v122 = 2112;
          uint64_t v123 = v81;
          __int16 v124 = 2048;
          double v125 = v49;
          __int16 v126 = 2048;
          uint64_t v127 = 0x40F3A53000000000;
          __int16 v128 = 2048;
          double v129 = v75 + v78;
          __int16 v130 = 2048;
          double v131 = v75;
          __int16 v132 = 2048;
          double v133 = v78;
          __int16 v134 = 2048;
          double v135 = v76;
          __int16 v136 = 2048;
          double v137 = v77;
          _os_log_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_INFO, "%@, %@, distanceFromCurrentLocationToCluster, %.5f, distance threshold, %.5f, relevanceScore, %.5f, clusterSizeScore, %.5f, daysSinceLastRunScore, %.5f, secondsSinceLastWorkout, %.5f, secondsSinceLatestWorkoutAcrossAllWorkouts, %.5f", buf, 0x5Cu);
        }
        goto LABEL_59;
      }
      __int16 v53 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        long long v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        id v55 = (id)objc_claimAutoreleasedReturnValue();
        long long v56 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v55;
        __int16 v122 = 2112;
        uint64_t v123 = v56;
        __int16 v124 = 2048;
        double v125 = v49;
        __int16 v126 = 2048;
        uint64_t v127 = 0x40F3A53000000000;
        __int16 v128 = 2048;
        double v129 = 0.0;
        _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%@, %@, distanceFromCurrentLocationToCluster, %.5f, cluster is outside the distance threshold, %.5f, relevanceScore, %.5f", buf, 0x34u);
      }
    }
    double v35 = 0.0;
LABEL_59:

    goto LABEL_60;
  }
  __int16 v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: countOfAllWorkouts", buf, 2u);
  }

  double v35 = 0.0;
  if (a8)
  {
    _RTErrorInvalidParameterCreate(@"countOfAllWorkouts");
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
LABEL_61:

  return v35;
}

void __150__RTWorkoutRouteManager__relevanceScoreForWorkoutUUIDs_representativeWorkout_latestWorkoutAcrossAllWorkouts_countOfAllWorkouts_currentLocation_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  id v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getWorkoutRouteSnapshotForWorkout:(id)a3 error:(id *)a4
{
  v157[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v115 = (void *)MEMORY[0x1E016D870]();
  uint64_t v136 = 0;
  double v137 = &v136;
  uint64_t v138 = 0x3032000000;
  int v139 = __Block_byref_object_copy__133;
  double v140 = __Block_byref_object_dispose__133;
  id v141 = 0;
  uint64_t v132 = 0;
  double v133 = &v132;
  uint64_t v134 = 0x2020000000;
  uint64_t v135 = 0;
  uint64_t v128 = 0;
  double v129 = &v128;
  uint64_t v130 = 0x2020000000;
  uint64_t v131 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v116 = v6;
  LODWORD(v6) = [(RTWorkoutRouteManager *)self _shouldDecimateWorkout:v6];
  uint64_t v8 = [(RTWorkoutRouteManager *)self healthKitManager];
  if (v6) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke;
  v123[3] = &unk_1E6B9B000;
  double v125 = &v132;
  __int16 v126 = &v128;
  uint64_t v127 = &v136;
  id v10 = v7;
  __int16 v124 = v10;
  [v8 fetchRouteLocationsUsingWorkout:v116 decimationLevel:v9 limit:0 shift:1 handler:v123];

  dispatch_time_t v11 = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13)) {
    goto LABEL_9;
  }
  double v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  id v17 = objc_opt_new();
  dispatch_semaphore_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v20 = [v19 filteredArrayUsingPredicate:v18];
  dispatch_time_t v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  double v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  double v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v147 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v147 count:1];
  long long v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;
  }
  else
  {
LABEL_9:
    id v26 = 0;
  }

  id v27 = (uint64_t (*)(uint64_t, uint64_t))v26;
  id v28 = v27;
  if (!a4 || !v27)
  {
    if (a4 && v137[5])
    {
      __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        char v97 = (objc_class *)objc_opt_class();
        NSStringFromClass(v97);
        id v98 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v99 = NSStringFromSelector(a2);
        id v100 = (uint64_t (*)(uint64_t, uint64_t))v137[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v98;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v99;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v154 = v100;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      dispatch_semaphore_t v30 = (uint64_t (*)(uint64_t, uint64_t))(id)v137[5];
      goto LABEL_20;
    }
    if (!v129[3])
    {
      int v32 = 0;
      goto LABEL_56;
    }
    uint64_t v110 = [MEMORY[0x1E4F30FF0] polylineWithCoordinates:v133[3]];
    id v34 = objc_opt_new();
    [v34 _setUseSnapshotService:1];
    [v110 boundingMapRect];
    MKCoordinateRegion v163 = MKCoordinateRegionForMapRect(v162);
    double latitude = v163.center.latitude;
    double longitude = v163.center.longitude;
    if (v163.span.latitudeDelta >= v163.span.longitudeDelta) {
      double latitudeDelta = v163.span.latitudeDelta;
    }
    else {
      double latitudeDelta = v163.span.longitudeDelta;
    }
    double v38 = latitudeDelta * 0.5;
    CLLocationCoordinate2D v159 = CLLocationCoordinate2DMake(latitude + latitudeDelta * 0.5, v163.center.longitude - latitudeDelta * 0.5);
    MKMapPointForCoordinate(v159);
    CLLocationCoordinate2D v160 = CLLocationCoordinate2DMake(latitude - v38, longitude + v38);
    MKMapPointForCoordinate(v160);
    _MKMapRectThatFits();
    [v34 setMapRect:CGRectMake(0, 0, 0, 0)];
    [v34 setSize:157.0, 157.0];
    [v34 setShowsBuildings:0];
    id v39 = [MEMORY[0x1E4F30FE0] filterExcludingAllCategories];
    [v34 setPointOfInterestFilter:v39];
    uint64_t v111 = v34;

    [v34 setMapType:5];
    long long v40 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
    [v34 setTraitCollection:v40];

    id v41 = (void *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:v34];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v154 = __Block_byref_object_copy__133;
    uint64_t v155 = __Block_byref_object_dispose__133;
    id v156 = 0;
    uint64_t v147 = 0;
    int v148 = &v147;
    uint64_t v149 = 0x3032000000;
    id v150 = __Block_byref_object_copy__133;
    __int16 v151 = __Block_byref_object_dispose__133;
    id v152 = 0;
    dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_285;
    v119[3] = &unk_1E6B9B028;
    uint64_t v121 = &v147;
    __int16 v122 = buf;
    __int16 v43 = v42;
    id v120 = v43;
    uint64_t v109 = v41;
    [v41 startWithCompletionHandler:v119];
    dsema = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v45 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v45))
    {
      uint64_t v108 = [MEMORY[0x1E4F1C9C8] now];
      [v108 timeIntervalSinceDate:v44];
      double v47 = v46;
      double v48 = objc_opt_new();
      double v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      id v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v51 = [v50 filteredArrayUsingPredicate:v49];
      uint64_t v52 = [v51 firstObject];

      [v48 submitToCoreAnalytics:v52 type:1 duration:v47];
      __int16 v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v142 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v142, 2u);
      }

      long long v54 = (void *)MEMORY[0x1E4F28C58];
      v157[0] = *MEMORY[0x1E4F28568];
      *(void *)id v142 = @"semaphore wait timeout";
      id v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v157 count:1];
      id v56 = [v54 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v55];

      if (v56)
      {
        id v56 = v56;
      }
    }
    else
    {
      id v56 = 0;
    }

    id v57 = v56;
    if (v57) {
      BOOL v58 = a4 != 0;
    }
    else {
      BOOL v58 = 0;
    }
    if (v58)
    {
      uint64_t v59 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        uint64_t v101 = (objc_class *)objc_opt_class();
        NSStringFromClass(v101);
        id v102 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v103 = NSStringFromSelector(a2);
        *(_DWORD *)id v142 = 138412802;
        *(void *)&v142[4] = v102;
        __int16 v143 = 2112;
        uint64_t v144 = v103;
        __int16 v145 = 2112;
        id v146 = v57;
        _os_log_error_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v142, 0x20u);
      }
      uint64_t v60 = v57;
    }
    else
    {
      if (!a4 || !*(void *)(*(void *)&buf[8] + 40))
      {
        contexta = (void *)MEMORY[0x1E016D870]();
        int v64 = [(id)v148[5] image];
        [v64 size];
        CGFloat v66 = v65;
        CGFloat v68 = v67;
        [v64 scale];
        CGFloat v70 = v69;
        v161.double width = v66;
        v161.double height = v68;
        UIGraphicsBeginImageContextWithOptions(v161, 1, v70);
        [v64 drawAtPoint:x0];
        CurrentContext = UIGraphicsGetCurrentContext();
        id v72 = [(RTWorkoutRouteManager *)self _colorFromHexString:@"00FFA8"];
        double v73 = (CGColor *)[v72 CGColor];

        CGContextSetStrokeColorWithColor(CurrentContext, v73);
        CGContextSetLineWidth(CurrentContext, 2.0);
        CGContextSetLineCap(CurrentContext, kCGLineCapRound);
        CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
        CGContextBeginPath(CurrentContext);
        if (v129[3])
        {
          uint64_t v74 = 0;
          unint64_t v75 = 0;
          do
          {
            double v76 = (void *)MEMORY[0x1E016D870]();
            [v148[5] pointForCoordinate:*(double *)(v133[3] + v74) *(double *)(v133[3] + v74 + 8)];
            if (v75) {
              CGContextAddLineToPoint(CurrentContext, v77, v78);
            }
            else {
              CGContextMoveToPoint(CurrentContext, v77, v78);
            }
            ++v75;
            v74 += 16;
          }
          while (v75 < v129[3]);
        }
        CGContextStrokePath(CurrentContext);
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_287;
        v117[3] = &__block_descriptor_48_e47_v40__0__CGContext__8_CGPoint_dd_16__CGColor__32l;
        long long v118 = xmmword_1DA100310;
        BOOL v79 = (void (**)(void, void, void, double, double))MEMORY[0x1E016DB00](v117);
        uint64_t v80 = v133[3] + 16 * v129[3];
        [v148[5] pointForCoordinate:*(double *)(v80 - 16) *(double *)(v80 - 8)];
        double v82 = v81;
        double v84 = v83;
        [v148[5] pointForCoordinate:*(double *)v133[3] *(double *)(v133[3] + 8)];
        double v86 = v85;
        double v88 = v87;
        id v89 = [MEMORY[0x1E4F428B8] systemRedColor];
        ((void (**)(void, CGContext *, uint64_t, double, double))v79)[2](v79, CurrentContext, [v89 CGColor], v82, v84);

        ((void (**)(void, CGContext *, CGColor *, double, double))v79)[2](v79, CurrentContext, v73, v86, v88);
        uint64_t v90 = v133;
        id v91 = (void *)v133[3];
        if (v91)
        {
          free(v91);
          uint64_t v90 = v133;
        }
        v90[3] = 0;
        UIGraphicsGetImageFromCurrentImageContext();
        id v92 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        int v32 = UIImagePNGRepresentation(v92);

        goto LABEL_54;
      }
      uint64_t v61 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        uint64_t v104 = (objc_class *)objc_opt_class();
        NSStringFromClass(v104);
        id v105 = (id)objc_claimAutoreleasedReturnValue();
        id v106 = NSStringFromSelector(a2);
        uint64_t v107 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v142 = 138412802;
        *(void *)&v142[4] = v105;
        __int16 v143 = 2112;
        uint64_t v144 = v106;
        __int16 v145 = 2112;
        id v146 = v107;
        _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v142, 0x20u);
      }
      uint64_t v60 = *(void **)(*(void *)&buf[8] + 40);
    }
    id v62 = v60;
    id v63 = *a4;
    *a4 = v62;

    int v32 = 0;
LABEL_54:

    _Block_object_dispose(&v147, 8);
    _Block_object_dispose(buf, 8);

    id v33 = v110;
    goto LABEL_55;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    int v94 = (objc_class *)objc_opt_class();
    NSStringFromClass(v94);
    id v95 = (id)objc_claimAutoreleasedReturnValue();
    double v96 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v95;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v96;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v154 = v28;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
  }
  dispatch_semaphore_t v30 = v28;
LABEL_20:
  int v32 = 0;
  id v33 = *a4;
  *a4 = v30;
LABEL_55:

LABEL_56:
  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v132, 8);
  _Block_object_dispose(&v136, 8);

  return v32;
}

void __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  id v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_285(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_287(uint64_t a1, CGContext *a2, CGColor *a3, double a4, double a5)
{
  id v10 = [MEMORY[0x1E4F428B8] whiteColor];
  CGContextSetFillColorWithColor(a2, (CGColorRef)[v10 CGColor]);

  v16.size.double width = *(CGFloat *)(a1 + 32);
  v16.origin.double x = a4 - v16.size.width * 0.5;
  v16.origin.double y = a5 - v16.size.width * 0.5;
  v16.size.double height = v16.size.width;
  CGContextFillEllipseInRect(a2, v16);
  CGContextSetFillColorWithColor(a2, a3);
  double v11 = *(double *)(a1 + 40);
  double v14 = v11;

  double v12 = a4 - v11 * 0.5;
  double v13 = a5 - v11 * 0.5;
  CGContextFillEllipseInRect(a2, *(CGRect *)(&v11 - 2));
}

- (id)_getWorkoutRouteLabelForWorkout:(id)a3 error:(id *)a4
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workout");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_17;
  }
  uint64_t v7 = [(RTWorkoutRouteManager *)self lastTimeRouteLabelFailed];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [(RTWorkoutRouteManager *)self lastTimeRouteLabelFailed];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;
    double v12 = (double)(unint64_t)kRTWorkoutRouteLabelBackOffDuration;

    if (v11 < v12)
    {
LABEL_17:
      CGRect v16 = &stru_1F33EAD88;
      goto LABEL_41;
    }
  }
  uint64_t v91 = 0;
  id v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v85 = 0;
  double v86 = &v85;
  uint64_t v87 = 0x3032000000;
  double v88 = __Block_byref_object_copy__133;
  id v89 = __Block_byref_object_dispose__133;
  id v90 = 0;
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke;
  v84[3] = &unk_1E6B9B070;
  v84[4] = &v91;
  v84[5] = &v85;
  [(RTWorkoutRouteManager *)self _getLocationsForWorkout:v6 decimationLevel:3 limit:1 handler:v84];
  if (v86[5])
  {
    double v13 = v92;
    double v14 = (void *)v92[3];
    if (v14)
    {
      free(v14);
      double v13 = v92;
    }
    v13[3] = 0;
  }
  if (a4 && v86[5])
  {
    double v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      long long v54 = NSStringFromSelector(a2);
      id v55 = (void *)v86[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v53;
      __int16 v96 = 2112;
      char v97 = v54;
      __int16 v98 = 2112;
      id v99 = v55;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    *a4 = (id) v86[5];
    CGRect v16 = &stru_1F33EAD88;
    goto LABEL_40;
  }
  CGFloat v66 = [(RTWorkoutRouteManager *)self _getRTLocationUsingCLLocationCoordinate2D:v92[3]];
  dispatch_semaphore_t v18 = v92;
  double v19 = (void *)v92[3];
  if (v19)
  {
    free(v19);
    dispatch_semaphore_t v18 = v92;
  }
  v18[3] = 0;
  uint64_t v78 = 0;
  BOOL v79 = &v78;
  uint64_t v80 = 0x3032000000;
  double v81 = __Block_byref_object_copy__133;
  double v82 = __Block_byref_object_dispose__133;
  id v83 = 0;
  uint64_t v72 = 0;
  double v73 = &v72;
  uint64_t v74 = 0x3032000000;
  unint64_t v75 = __Block_byref_object_copy__133;
  double v76 = __Block_byref_object_dispose__133;
  id v77 = 0;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  id v21 = objc_alloc(MEMORY[0x1E4F5CE48]);
  double v22 = (objc_class *)objc_opt_class();
  double v23 = NSStringFromClass(v22);
  double v65 = (void *)[v21 initWithUseBackgroundTraits:1 analyticsIdentifier:v23 clientIdentifier:@"com.apple.CoreRoutine.workoutRoute"];

  mapServiceManager = self->_mapServiceManager;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke_292;
  v68[3] = &unk_1E6B905F0;
  CGFloat v70 = &v78;
  __int16 v71 = &v72;
  long long v25 = v20;
  double v69 = v25;
  [(RTMapServiceManager *)mapServiceManager fetchMapItemsFromLocation:v66 options:v65 handler:v68];
  id v26 = v25;
  id v27 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v28 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v26, v28)) {
    goto LABEL_25;
  }
  int v64 = [MEMORY[0x1E4F1C9C8] now];
  [v64 timeIntervalSinceDate:v27];
  double v30 = v29;
  __int16 v31 = objc_opt_new();
  int v32 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
  id v33 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v34 = [v33 filteredArrayUsingPredicate:v32];
  double v35 = [v34 firstObject];

  [v31 submitToCoreAnalytics:v35 type:1 duration:v30];
  id v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  double v37 = (void *)MEMORY[0x1E4F28C58];
  v104[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  double v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v104 count:1];
  id v39 = [v37 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v38];

  if (v39)
  {
    id v40 = v39;
  }
  else
  {
LABEL_25:
    id v40 = 0;
  }

  id v41 = v40;
  if (v41) {
    BOOL v42 = a4 != 0;
  }
  else {
    BOOL v42 = 0;
  }
  if (v42)
  {
    __int16 v43 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      id v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v58 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v57;
      __int16 v96 = 2112;
      char v97 = v58;
      __int16 v98 = 2112;
      id v99 = v41;
      _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    *a4 = v41;
  }
  else
  {
    uint64_t v44 = (void *)v79[5];
    if (v44 && !v73[5])
    {
      double v48 = [v44 address];
      uint64_t v49 = [v48 locality];
      id v50 = (void *)v49;
      id v51 = &stru_1F33EAD88;
      if (v49) {
        id v51 = (__CFString *)v49;
      }
      CGRect v16 = v51;

      goto LABEL_39;
    }
    dispatch_time_t v45 = [MEMORY[0x1E4F1C9C8] date];
    [(RTWorkoutRouteManager *)self setLastTimeRouteLabelFailed:v45];

    double v46 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v61 = NSStringFromSelector(a2);
      uint64_t v62 = v79[5];
      uint64_t v63 = v73[5];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v60;
      __int16 v96 = 2112;
      char v97 = v61;
      __int16 v98 = 2112;
      id v99 = v66;
      __int16 v100 = 2112;
      uint64_t v101 = v62;
      __int16 v102 = 2112;
      uint64_t v103 = v63;
      _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "%@, %@, Failed to reverse geocode start location of the workout, %@, reverseGeocodedMapItem, %@, reverseGeocodeError, %@", buf, 0x34u);
    }
  }
  CGRect v16 = &stru_1F33EAD88;
LABEL_39:

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);

LABEL_40:
  _Block_object_dispose(&v85, 8);

  _Block_object_dispose(&v91, 8);
LABEL_41:

  return v16;
}

void __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke(uint64_t a1, uint64_t a2, int a3, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke_292(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_areWorkoutsSimilarBetweenClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 error:(id *)a7
{
  v147[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v116 = v10;
  uint64_t v117 = v9;
  if (!v9)
  {
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inputClusterSet1", buf, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate(@"inputClusterSet1");
      id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
      BOOL v25 = 0;
      *a7 = v28;
      goto LABEL_73;
    }
LABEL_21:
    BOOL v25 = 0;
    goto LABEL_73;
  }
  if (!v10)
  {
    double v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inputClusterSet2", buf, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate(@"inputClusterSet2");
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  uint64_t v130 = 0;
  uint64_t v131 = (id *)&v130;
  uint64_t v132 = 0x3032000000;
  double v133 = __Block_byref_object_copy__133;
  uint64_t v134 = __Block_byref_object_dispose__133;
  id v135 = 0;
  uint64_t v109 = (void *)MEMORY[0x1E016D870]();
  uint64_t v126 = 0;
  uint64_t v127 = &v126;
  uint64_t v128 = 0x2020000000;
  uint64_t v129 = 0;
  if ([v9 count] || objc_msgSend(v116, "count"))
  {
    if ([v9 count] && objc_msgSend(v116, "count"))
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        double v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v117 count];
        uint64_t v16 = [v116 count];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v137 = 2112;
        id v138 = v14;
        __int16 v139 = 2048;
        uint64_t v140 = v15;
        __int16 v141 = 2048;
        uint64_t v142 = v16;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, clusterSet1 count, %lu, clusterSet2 count, %lu", buf, 0x2Au);
      }
      id v17 = (void *)[v117 mutableCopy];
      uint64_t v110 = (void *)[v116 mutableCopy];
      uint64_t v18 = [v17 count];
      uint64_t v19 = [v110 count];
      uint64_t v20 = [v17 count];
      id v21 = (void *)[v17 mutableCopy];
      [v17 minusSet:v110];
      [v110 minusSet:v21];
      uint64_t v107 = v17;
      uint64_t v22 = [v17 count];
      unint64_t v23 = [v17 count];
      if (v23 <= kRTSQLQueryMaxPredicatesCount
        && (unint64_t v24 = [v110 count], v24 <= kRTSQLQueryMaxPredicatesCount))
      {
        uint64_t v30 = [v17 count];
        unint64_t v31 = [v110 count] * v30;
        __int16 v98 = v21;
        uint64_t v99 = v22;
        uint64_t v101 = v19;
        uint64_t v102 = v18;
        uint64_t v100 = v20;
        if (v31 <= kRTSQLQueryMaxPredicatesCount)
        {
          dispatch_semaphore_t v68 = dispatch_semaphore_create(0);
          double v69 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
          v118[0] = MEMORY[0x1E4F143A8];
          v118[1] = 3221225472;
          v118[2] = __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke_2;
          v118[3] = &unk_1E6B908E0;
          id v120 = &v126;
          uint64_t v121 = &v130;
          CGFloat v70 = v68;
          id v119 = v70;
          [v69 fetchTotalWorkoutDistancesCountWithClusterSet1:v107 clusterSet2:v110 workoutActivityType:a5 maxDistanceThreshold:v118 handler:a6];

          dsema = v70;
          __int16 v71 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v72 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v72)) {
            goto LABEL_55;
          }
          double v73 = [MEMORY[0x1E4F1C9C8] now];
          [v73 timeIntervalSinceDate:v71];
          double v75 = v74;
          double v76 = objc_opt_new();
          id v77 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
          uint64_t v78 = [MEMORY[0x1E4F29060] callStackSymbols];
          BOOL v79 = [v78 filteredArrayUsingPredicate:v77];
          uint64_t v80 = [v79 firstObject];

          [v76 submitToCoreAnalytics:v80 type:1 duration:v75];
          double v81 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          double v82 = (void *)MEMORY[0x1E4F28C58];
          v147[0] = *MEMORY[0x1E4F28568];
          *(void *)buf = @"semaphore wait timeout";
          id v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v147 count:1];
          double v84 = [v82 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v83];

          if (v84)
          {
            id v85 = v84;
          }
          else
          {
LABEL_55:
            id v85 = 0;
          }

          id v87 = v85;
          if (v87) {
            objc_storeStrong(v131 + 5, v85);
          }

          double v86 = v119;
        }
        else
        {
          unint64_t v32 = [v107 count];
          unint64_t v33 = [v110 count];
          if (v32 >= v33) {
            id v34 = v110;
          }
          else {
            id v34 = v107;
          }
          if (v32 >= v33) {
            double v35 = v107;
          }
          else {
            double v35 = v110;
          }
          id v36 = v34;
          double v37 = v35;
          dsema = v36;
          uint64_t v111 = [v36 allObjects];
          unint64_t v38 = kRTSQLQueryMaxPredicatesCount;
          id v106 = v37;
          unint64_t v39 = [v37 count];
          unint64_t v40 = 0;
          if (v39 > v38) {
            unint64_t v41 = 1;
          }
          else {
            unint64_t v41 = v38 / v39;
          }
          uint64_t v104 = *MEMORY[0x1E4F5CFE8];
          uint64_t v105 = *MEMORY[0x1E4F28568];
          do
          {
            if (v40 >= [v111 count]) {
              break;
            }
            context = (void *)MEMORY[0x1E016D870]();
            uint64_t v42 = [v111 count];
            if (v42 - v40 < v41) {
              unint64_t v41 = v42 - v40;
            }
            dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
            uint64_t v44 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
            dispatch_time_t v45 = (void *)MEMORY[0x1E4F1CAD0];
            double v46 = [v111 subarrayWithRange:v40, v41];
            double v47 = [v45 setWithArray:v46];
            v122[0] = MEMORY[0x1E4F143A8];
            v122[1] = 3221225472;
            v122[2] = __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke;
            void v122[3] = &unk_1E6B908E0;
            __int16 v124 = &v126;
            double v125 = &v130;
            double v48 = v43;
            uint64_t v123 = v48;
            [v44 fetchTotalWorkoutDistancesCountWithClusterSet1:v47 clusterSet2:v106 workoutActivityType:a5 maxDistanceThreshold:v122 handler:a6];

            uint64_t v49 = v48;
            id v50 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v51 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v49, v51)) {
              goto LABEL_43;
            }
            uint64_t v52 = [MEMORY[0x1E4F1C9C8] now];
            [v52 timeIntervalSinceDate:v50];
            double v54 = v53;
            id v55 = objc_opt_new();
            id v56 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
            id v57 = [MEMORY[0x1E4F29060] callStackSymbols];
            BOOL v58 = [v57 filteredArrayUsingPredicate:v56];
            uint64_t v59 = [v58 firstObject];

            [v55 submitToCoreAnalytics:v59 type:1 duration:v54];
            id v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            uint64_t v61 = (void *)MEMORY[0x1E4F28C58];
            v147[0] = v105;
            *(void *)buf = @"semaphore wait timeout";
            uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v147 count:1];
            uint64_t v63 = [v61 errorWithDomain:v104 code:15 userInfo:v62];

            if (v63)
            {
              id v64 = v63;
            }
            else
            {
LABEL_43:
              id v64 = 0;
            }

            id v65 = v64;
            CGFloat v66 = v131 + 5;
            if (v65)
            {
              objc_storeStrong(v66, v64);
              BOOL v67 = 0;
            }
            else
            {
              BOOL v67 = *v66 == 0;
            }

            v40 += v41;
          }
          while (v67);

          double v86 = v106;
        }

        if (v131[5])
        {
          BOOL v25 = 0;
          int v26 = 11;
        }
        else
        {
          uint64_t v88 = v127[3];
          uint64_t v89 = [v107 count];
          unint64_t v90 = v88 + (v89 + v100 - v99 + [v110 count]) * (v100 - v99);
          v127[3] = v90;
          if (v101 * v102) {
            double v91 = (double)v90 / (double)(unint64_t)(v101 * v102);
          }
          else {
            double v91 = 1.0;
          }
          id v92 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            uint64_t v93 = (objc_class *)objc_opt_class();
            NSStringFromClass(v93);
            id v94 = (id)objc_claimAutoreleasedReturnValue();
            id v95 = NSStringFromSelector(a2);
            uint64_t v96 = v127[3];
            *(_DWORD *)buf = 138413570;
            *(void *)&uint8_t buf[4] = v94;
            __int16 v137 = 2112;
            id v138 = v95;
            __int16 v139 = 2048;
            uint64_t v140 = v96;
            __int16 v141 = 2048;
            uint64_t v142 = v101 * v102;
            __int16 v143 = 2048;
            double v144 = v91;
            __int16 v145 = 2048;
            uint64_t v146 = 0x3FE0000000000000;
            _os_log_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_INFO, "%@, %@, totalCount, %lu, idealCount, %lu, percentage overlap, %.5f, cluster overlap threshold, %.5f", buf, 0x3Eu);
          }
          BOOL v25 = v91 >= 0.5;
          int v26 = 1;
        }
        id v21 = v98;
      }
      else
      {
        BOOL v25 = 0;
        int v26 = 1;
      }
    }
    else
    {
      BOOL v25 = 0;
      int v26 = 1;
    }
  }
  else
  {
    int v26 = 1;
    BOOL v25 = 1;
  }
  _Block_object_dispose(&v126, 8);
  if (v26 == 11)
  {
    BOOL v25 = 0;
    if (a7) {
      *a7 = v131[5];
    }
  }
  _Block_object_dispose(&v130, 8);

LABEL_73:
  return v25;
}

void __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getWorkoutUUIDsForCluster:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    aSelector = a2;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    *(void *)uint64_t v49 = 0;
    id v50 = v49;
    uint64_t v51 = 0x3032000000;
    uint64_t v52 = __Block_byref_object_copy__133;
    double v53 = __Block_byref_object_dispose__133;
    id v54 = 0;
    uint64_t v43 = 0;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x3032000000;
    double v46 = __Block_byref_object_copy__133;
    double v47 = __Block_byref_object_dispose__133;
    id v48 = 0;
    id v9 = [(RTWorkoutRouteManager *)self healthKitManager];
    id v10 = [v7 clusterUUID];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58__RTWorkoutRouteManager__getWorkoutUUIDsForCluster_error___block_invoke;
    v39[3] = &unk_1E6B9AF88;
    unint64_t v41 = v49;
    id v11 = v8;
    unint64_t v40 = v11;
    uint64_t v42 = &v43;
    [v9 fetchWorkoutUUIDsForClusterUUID:v10 handler:v39];

    double v12 = v11;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14)) {
      goto LABEL_7;
    }
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    uint64_t v18 = objc_opt_new();
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
    uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v21 = [v20 filteredArrayUsingPredicate:v19];
    uint64_t v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    unint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    unint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    v60[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v60 count:1];
    int v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v27 = v26;
    }
    else
    {
LABEL_7:
      id v27 = 0;
    }

    id v28 = v27;
    double v29 = v28;
    if (a4 && v28)
    {
      uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        double v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        double v37 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v56 = 2112;
        id v57 = v37;
        __int16 v58 = 2112;
        uint64_t v59 = v29;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      *a4 = v29;
      id v31 = (id)objc_opt_new();
    }
    else
    {
      if (a4) {
        *a4 = *((id *)v50 + 5);
      }
      id v31 = (id)v44[5];
    }
    unint64_t v33 = v31;

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(v49, 8);
  }
  else
  {
    unint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v49 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster", v49, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"cluster");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v33 = objc_opt_new();
  }

  return v33;
}

void __58__RTWorkoutRouteManager__getWorkoutUUIDsForCluster_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    dispatch_semaphore_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    dispatch_semaphore_t v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getRemoteWorkoutClustersForWorkoutUUIDs:(id)a3 error:(id *)a4
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    aSelector = a2;
    *(void *)uint64_t v88 = 0;
    uint64_t v89 = v88;
    uint64_t v90 = 0x3032000000;
    double v91 = __Block_byref_object_copy__133;
    id v92 = __Block_byref_object_dispose__133;
    id v93 = (id)objc_opt_new();
    uint64_t v82 = 0;
    id v83 = &v82;
    uint64_t v84 = 0x3032000000;
    id v85 = __Block_byref_object_copy__133;
    double v86 = __Block_byref_object_dispose__133;
    id v87 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    dispatch_semaphore_t v8 = [(RTWorkoutRouteManager *)self healthKitManager];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke;
    v78[3] = &unk_1E6B9AF88;
    uint64_t v80 = &v82;
    id v9 = v7;
    BOOL v79 = v9;
    double v81 = v88;
    [v8 fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:v6 handler:v78];

    id v10 = v9;
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v12 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v10, v12))
    {
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      [v13 timeIntervalSinceDate:v11];
      double v15 = v14;
      double v16 = objc_opt_new();
      double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
      uint64_t v20 = [v19 firstObject];

      [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
      id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      *(void *)id v94 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      unint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v94 count:1];
      id v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

      if (v24)
      {
        id v24 = v24;
      }
    }
    else
    {
      id v24 = 0;
    }

    id v27 = (uint64_t (*)(uint64_t, uint64_t))v24;
    id v28 = v27;
    if (a4 && v27)
    {
      double v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        __int16 v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        id v57 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v58 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v58;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v100 = v28;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      uint64_t v30 = v28;
LABEL_23:
      *a4 = v30;
      int v26 = objc_opt_new();
LABEL_45:

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(v88, 8);

      goto LABEL_46;
    }
    if (a4 && v83[5])
    {
      id v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v61 = NSStringFromSelector(aSelector);
        uint64_t v62 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v60;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v61;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v100 = v62;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
      goto LABEL_23;
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v100 = __Block_byref_object_copy__133;
    uint64_t v101 = __Block_byref_object_dispose__133;
    id v102 = (id)objc_opt_new();
    dispatch_semaphore_t v32 = dispatch_semaphore_create(0);

    unint64_t v33 = [(RTWorkoutRouteManager *)self healthKitManager];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke_302;
    v73[3] = &unk_1E6B9B098;
    double v75 = &v82;
    id v34 = v32;
    double v74 = v34;
    double v76 = v88;
    id v77 = buf;
    [v33 fetchWorkoutClustersWithHandler:v73];

    id v10 = v34;
    double v35 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v36 = dispatch_time(0, 3600000000000);
    double v37 = v28;
    if (dispatch_semaphore_wait(v10, v36))
    {
      CGFloat v70 = [MEMORY[0x1E4F1C9C8] now];
      [v70 timeIntervalSinceDate:v35];
      double v39 = v38;
      unint64_t v40 = objc_opt_new();
      unint64_t v41 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v43 = [v42 filteredArrayUsingPredicate:v41];
      uint64_t v44 = [v43 firstObject];

      [v40 submitToCoreAnalytics:v44 type:1 duration:v39];
      uint64_t v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v94 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v94, 2u);
      }

      double v46 = (void *)MEMORY[0x1E4F28C58];
      v103[0] = *MEMORY[0x1E4F28568];
      *(void *)id v94 = @"semaphore wait timeout";
      double v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v103 count:1];
      id v48 = [v46 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v47];

      double v37 = v28;
      if (v48)
      {
        double v37 = v48;
      }
    }

    uint64_t v49 = v37;
    if (v49) {
      BOOL v50 = a4 != 0;
    }
    else {
      BOOL v50 = 0;
    }
    if (v50)
    {
      uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        uint64_t v63 = (objc_class *)objc_opt_class();
        NSStringFromClass(v63);
        id v64 = (id)objc_claimAutoreleasedReturnValue();
        id v65 = NSStringFromSelector(aSelector);
        *(_DWORD *)id v94 = 138412802;
        *(void *)&v94[4] = v64;
        __int16 v95 = 2112;
        uint64_t v96 = v65;
        __int16 v97 = 2112;
        __int16 v98 = v49;
        _os_log_error_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v94, 0x20u);
      }
      uint64_t v52 = v49;
LABEL_41:
      *a4 = v52;
      id v54 = (id)objc_opt_new();
LABEL_44:
      int v26 = v54;

      _Block_object_dispose(buf, 8);
      id v28 = v49;
      goto LABEL_45;
    }
    if (a4)
    {
      if (v83[5])
      {
        double v53 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          CGFloat v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          id v67 = (id)objc_claimAutoreleasedReturnValue();
          dispatch_semaphore_t v68 = NSStringFromSelector(aSelector);
          double v69 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
          *(_DWORD *)id v94 = 138412802;
          *(void *)&v94[4] = v67;
          __int16 v95 = 2112;
          uint64_t v96 = v68;
          __int16 v97 = 2112;
          __int16 v98 = v69;
          _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v94, 0x20u);
        }
        uint64_t v52 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
        goto LABEL_41;
      }
      *a4 = 0;
    }
    id v54 = *(id *)(*(void *)&buf[8] + 40);
    goto LABEL_44;
  }
  BOOL v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v88 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", v88, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"workoutUUIDs");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v26 = objc_opt_new();
LABEL_46:

  return v26;
}

void __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v5;
    dispatch_semaphore_t v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:a2];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    dispatch_semaphore_t v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v16 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          dispatch_time_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v13 = (void *)MEMORY[0x1E016D870]();
          double v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          double v15 = [v12 clusterUUID];
          LODWORD(v14) = [v14 containsObject:v15];

          if (v14) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v5 = v16;
  }
}

- (id)_sortWorkoutUUIDsByDistance:(id)a3 error:(id *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v60 = (id)objc_opt_new();
    double v53 = (void *)MEMORY[0x1E016D870]();
    id v7 = objc_opt_new();
    unint64_t v8 = [v6 count];
    uint64_t v63 = v7;
    id v55 = v6;
    if (v8)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      do
      {
        __int16 v56 = (void *)MEMORY[0x1E016D870](v8);
        uint64_t v11 = [v6 count:v53];
        if ((unint64_t)(v11 - v10) >= 0x32) {
          uint64_t v12 = 50;
        }
        else {
          uint64_t v12 = v11 - v10;
        }
        id v13 = [(RTWorkoutRouteManager *)self healthKitManager];
        uint64_t v57 = v10;
        double v14 = [v6 subarrayWithRange:v10, v12];
        id v75 = v9;
        double v15 = [v13 getWorkoutsWithUUIDs:v14 error:&v75];
        id v58 = v75;

        id v7 = v63;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id obj = v15;
        uint64_t v16 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v72;
          uint64_t v61 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v72 != v18) {
                objc_enumerationMutation(obj);
              }
              long long v20 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              context = (void *)MEMORY[0x1E016D870]();
              id v21 = [(RTWorkoutRouteManager *)self healthKitManager];
              uint64_t v22 = [v21 _getTotalDistanceForWorkout:v20];
              unint64_t v23 = [v20 UUID];
              [v7 setObject:v22 forKeyedSubscript:v23];

              id v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                BOOL v25 = (objc_class *)objc_opt_class();
                int v26 = NSStringFromClass(v25);
                id v27 = NSStringFromSelector(a2);
                [v20 UUID];
                double v29 = v28 = self;
                uint64_t v30 = [v20 UUID];
                id v31 = [v7 objectForKeyedSubscript:v30];
                [MEMORY[0x1E4F2B618] meterUnit];
                v33 = uint64_t v32 = v17;
                [v31 doubleValueForUnit:v33];
                *(_DWORD *)buf = 138413058;
                uint64_t v78 = v26;
                __int16 v79 = 2112;
                uint64_t v80 = v27;
                __int16 v81 = 2112;
                uint64_t v82 = v29;
                __int16 v83 = 2048;
                uint64_t v84 = v34;
                _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, before sorting, uuid, %@, distance, %.5f", buf, 0x2Au);

                uint64_t v17 = v32;
                id v7 = v63;

                self = v28;
                uint64_t v18 = v61;
              }
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
          }
          while (v17);
        }

        uint64_t v10 = v57 + 50;
        id v6 = v55;
        unint64_t v8 = [v55 count];
        double v35 = v58;
        uint64_t v9 = v58;
      }
      while (v57 + 50 < v8);
    }
    else
    {
      double v35 = 0;
    }
    if (objc_msgSend(v7, "count", v53))
    {
      uint64_t v59 = v35;
      double v37 = [v7 keysSortedByValueUsingComparator:&__block_literal_global_103];

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v60 = v37;
      uint64_t v38 = [v60 countByEnumeratingWithState:&v67 objects:v76 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v68;
        do
        {
          uint64_t v41 = 0;
          contexta = (void *)v39;
          do
          {
            if (*(void *)v68 != v40) {
              objc_enumerationMutation(v60);
            }
            uint64_t v42 = *(void **)(*((void *)&v67 + 1) + 8 * v41);
            uint64_t v43 = (void *)MEMORY[0x1E016D870]();
            uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              uint64_t v45 = (objc_class *)objc_opt_class();
              double v46 = NSStringFromClass(v45);
              NSStringFromSelector(a2);
              id v48 = v47 = v40;
              uint64_t v49 = [v63 objectForKeyedSubscript:v42];
              BOOL v50 = [MEMORY[0x1E4F2B618] meterUnit];
              [v49 doubleValueForUnit:v50];
              *(_DWORD *)buf = 138413058;
              uint64_t v78 = v46;
              __int16 v79 = 2112;
              uint64_t v80 = v48;
              __int16 v81 = 2112;
              uint64_t v82 = v42;
              __int16 v83 = 2048;
              uint64_t v84 = v51;
              _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, %@, after sorting, uuid, %@, distance, %.5f", buf, 0x2Au);

              uint64_t v40 = v47;
              uint64_t v39 = (uint64_t)contexta;
            }
            ++v41;
          }
          while (v39 != v41);
          uint64_t v39 = [v60 countByEnumeratingWithState:&v67 objects:v76 count:16];
        }
        while (v39);
      }

      id v6 = v55;
      id v7 = v63;
      double v35 = v59;
    }
  }
  else
  {
    dispatch_time_t v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workoutUUIDs");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v60 = (id)objc_opt_new();
  }

  return v60;
}

uint64_t __59__RTWorkoutRouteManager__sortWorkoutUUIDsByDistance_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compare:];
}

- (void)_pruneDistanceMatrixWithHandler:(id)a3
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v54 = (void (**)(id, id))a3;
  id v72 = 0;
  uint64_t v63 = self;
  id v55 = [(RTWorkoutRouteManager *)self _retrieveUUIDsToPruneWithError:&v72];
  dispatch_semaphore_t v4 = (uint64_t (*)(uint64_t, uint64_t))v72;
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v55 == 0;
  }
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v48 = (objc_class *)objc_opt_class();
      uint64_t v49 = NSStringFromClass(v48);
      BOOL v50 = NSStringFromSelector(a2);
      *(_DWORD *)__int16 v79 = 138412802;
      *(void *)&v79[4] = v49;
      *(_WORD *)&v79[12] = 2112;
      *(void *)&v79[14] = v50;
      *(_WORD *)&v79[22] = 2112;
      uint64_t v80 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, %@, %@, Error fetching prune UUIDs", v79, 0x20u);
    }
    v54[2](v54, v4);
  }
  else
  {
    if ([v55 count])
    {
      dispatch_semaphore_t v61 = dispatch_semaphore_create(0);
      id v64 = objc_opt_new();
      *(void *)__int16 v79 = 0;
      *(void *)&v79[8] = v79;
      *(void *)&v79[16] = 0x3032000000;
      uint64_t v80 = __Block_byref_object_copy__133;
      __int16 v81 = __Block_byref_object_dispose__133;
      id v82 = 0;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id obj = v55;
      uint64_t v7 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
      unint64_t v8 = 0;
      if (!v7) {
        goto LABEL_35;
      }
      uint64_t v60 = *(void *)v69;
      uint64_t v58 = *MEMORY[0x1E4F5CFE8];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      while (1)
      {
        uint64_t v62 = v7;
        for (uint64_t i = 0; i != v62; ++i)
        {
          if (*(void *)v69 != v60) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          uint64_t v11 = [(RTWorkoutRouteManager *)v63 workoutDistanceStore];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __57__RTWorkoutRouteManager__pruneDistanceMatrixWithHandler___block_invoke;
          v65[3] = &unk_1E6B90728;
          long long v67 = v79;
          uint64_t v12 = v61;
          CGFloat v66 = v12;
          [v11 deleteWorkoutDistanceWithWorkoutUUID:v10 handler:v65];

          id v13 = v12;
          double v14 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v15 = dispatch_time(0, 3600000000000);
          id v16 = v8;
          if (dispatch_semaphore_wait(v13, v15))
          {
            uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
            [v17 timeIntervalSinceDate:v14];
            double v19 = v18;
            long long v20 = objc_opt_new();
            id v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
            uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
            unint64_t v23 = [v22 filteredArrayUsingPredicate:v21];
            id v24 = [v23 firstObject];

            [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
            BOOL v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            int v26 = (void *)MEMORY[0x1E4F28C58];
            v83[0] = v59;
            *(void *)buf = @"semaphore wait timeout";
            id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v83 count:1];
            id v28 = [v26 errorWithDomain:v58 code:15 userInfo:v27];

            id v16 = v8;
            if (v28)
            {
              id v16 = v28;
            }
          }

          id v29 = v16;
          if (v29) {
            BOOL v30 = v64 == 0;
          }
          else {
            BOOL v30 = 1;
          }
          if (!v30)
          {
            unint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              uint64_t v34 = (objc_class *)objc_opt_class();
              NSStringFromClass(v34);
              id v35 = (id)objc_claimAutoreleasedReturnValue();
              dispatch_time_t v36 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v35;
              __int16 v74 = 2112;
              id v75 = v36;
              __int16 v76 = 2112;
              id v77 = v29;
              _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
            }
            [v64 addObject:v29];
            uint64_t v32 = v29;
            id v29 = 0;
            goto LABEL_32;
          }
          if (v64 && *(void *)(*(void *)&v79[8] + 40))
          {
            id v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              double v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              id v38 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v39 = NSStringFromSelector(a2);
              uint64_t v40 = *(void **)(*(void *)&v79[8] + 40);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v38;
              __int16 v74 = 2112;
              id v75 = v39;
              __int16 v76 = 2112;
              id v77 = v40;
              _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
            }
            [v64 addObject:*(void *)(*(void *)&v79[8] + 40)];
            uint64_t v32 = *(void **)(*(void *)&v79[8] + 40);
            *(void *)(*(void *)&v79[8] + 40) = 0;
LABEL_32:
          }
          unint64_t v8 = v29;
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
        if (!v7)
        {
LABEL_35:

          [(RTWorkoutRouteManager *)v63 _clearInMemoryClusters];
          if ([v64 count])
          {
            uint64_t v41 = _RTSafeArray();
            uint64_t v42 = _RTMultiErrorCreate();

            uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              uint64_t v51 = (objc_class *)objc_opt_class();
              NSStringFromClass(v51);
              id v52 = (id)objc_claimAutoreleasedReturnValue();
              double v53 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v52;
              __int16 v74 = 2112;
              id v75 = v53;
              __int16 v76 = 2112;
              id v77 = v42;
              _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v42 = 0;
          }
          v54[2](v54, v42);
          _Block_object_dispose(v79, 8);

          goto LABEL_44;
        }
      }
    }
    uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      uint64_t v45 = (objc_class *)objc_opt_class();
      double v46 = NSStringFromClass(v45);
      uint64_t v47 = NSStringFromSelector(a2);
      *(_DWORD *)__int16 v79 = 138412546;
      *(void *)&v79[4] = v46;
      *(_WORD *)&v79[12] = 2112;
      *(void *)&v79[14] = v47;
      _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, %@, No UUIDS to prune", v79, 0x16u);
    }
    v54[2](v54, 0);
  }
LABEL_44:
}

void __57__RTWorkoutRouteManager__pruneDistanceMatrixWithHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_retrieveUUIDsToPruneWithError:(id *)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(RTWorkoutRouteManager *)self healthKitManager];
  BOOL v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v6 = [(RTWorkoutRouteManager *)self healthKitManager];
  uint64_t v7 = [v6 getWorkoutDefaultSortDescriptors];
  unint64_t v8 = [(RTWorkoutRouteManager *)self healthKitManager];
  uint64_t v9 = [v8 _getRTWorkoutDefaultTypesForRaceRoute];
  id v62 = 0;
  uint64_t v10 = [v4 getWorkoutsWithStartDate:v5 limit:0 sortDescriptors:v7 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:1.79769313e308 workoutTypes:v9 error:&v62];
  __int16 v56 = (uint64_t (*)(uint64_t, uint64_t))v62;

  if (!v56) {
    goto LABEL_8;
  }
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v40 = (objc_class *)objc_opt_class();
    uint64_t v41 = NSStringFromClass(v40);
    uint64_t v42 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v41;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    long long v69 = v56;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);
  }
  if (a3)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = (objc_class *)objc_opt_class();
      uint64_t v44 = NSStringFromClass(v43);
      uint64_t v45 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      long long v69 = v56;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v13 = 0;
    *a3 = v56;
  }
  else
  {
LABEL_8:
    double v14 = objc_opt_new();
    if ([v10 count])
    {
      unint64_t v15 = 0;
      do
      {
        id v16 = [v10 objectAtIndexedSubscript:v15];
        uint64_t v17 = [v16 UUID];
        [v14 addObject:v17];

        ++v15;
      }
      while ([v10 count] > v15);
    }
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    long long v69 = __Block_byref_object_copy__133;
    long long v70 = __Block_byref_object_dispose__133;
    id v71 = (id)objc_opt_new();
    double v19 = [(RTWorkoutRouteManager *)self workoutDistanceStore];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __56__RTWorkoutRouteManager__retrieveUUIDsToPruneWithError___block_invoke;
    void v57[3] = &unk_1E6B95148;
    void v57[4] = self;
    SEL v61 = a2;
    id v52 = v56;
    uint64_t v58 = v52;
    uint64_t v60 = buf;
    long long v20 = v18;
    uint64_t v59 = v20;
    [v19 fetchUniqueWorkoutUUIDsWithHandler:v57];

    id v21 = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v23 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v21, v23)) {
      goto LABEL_16;
    }
    double v53 = [MEMORY[0x1E4F1C9C8] now];
    [v53 timeIntervalSinceDate:v22];
    double v25 = v24;
    int v26 = objc_opt_new();
    id v27 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
    id v28 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v29 = [v28 filteredArrayUsingPredicate:v27];
    BOOL v30 = [v29 firstObject];

    [v26 submitToCoreAnalytics:v30 type:1 duration:v25];
    id v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v63 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v63, 2u);
    }

    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    v72[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v63 = @"semaphore wait timeout";
    unint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v72 count:1];
    uint64_t v34 = [v32 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v33];

    if (v34)
    {
      id v35 = v34;
    }
    else
    {
LABEL_16:
      id v35 = 0;
    }

    dispatch_time_t v36 = (uint64_t (*)(uint64_t, uint64_t))v35;
    if (!v36) {
      goto LABEL_24;
    }
    double v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      double v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      id v48 = NSStringFromSelector(a2);
      *(_DWORD *)uint64_t v63 = 138412802;
      *(void *)&v63[4] = v47;
      __int16 v64 = 2112;
      id v65 = v48;
      __int16 v66 = 2112;
      long long v67 = v52;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, %@", v63, 0x20u);
    }
    if (a3)
    {
      id v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        id v50 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v51 = NSStringFromSelector(a2);
        *(_DWORD *)uint64_t v63 = 138412802;
        *(void *)&v63[4] = v50;
        __int16 v64 = 2112;
        id v65 = v51;
        __int16 v66 = 2112;
        long long v67 = v36;
        _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v63, 0x20u);
      }
      id v13 = 0;
      *a3 = v36;
    }
    else
    {
LABEL_24:
      [*(id *)(*(void *)&buf[8] + 40) removeObjectsInArray:v14];
      id v13 = *(id *)(*(void *)&buf[8] + 40);
    }

    _Block_object_dispose(buf, 8);
  }

  return v13;
}

void __56__RTWorkoutRouteManager__retrieveUUIDsToPruneWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138412802;
      double v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, %@, %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    uint64_t v5 = [a2 mutableCopy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    unint64_t v8 = *(NSObject **)(a1 + 48);
    dispatch_semaphore_signal(v8);
  }
}

- (BOOL)_initProcessWorkoutMetrics:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  [(RTWorkoutRouteManager *)self _initProcessWorkoutMetricsForDistanceMatrixWithError:&v31];
  id v6 = v31;
  id v7 = v6;
  if (a3 && v6)
  {
    unint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

      uint64_t v9 = v7;
LABEL_9:
      id v10 = v9;
      BOOL v12 = 0;
      *a3 = v10;
      goto LABEL_10;
    }
    uint64_t v22 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v22);
    id v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    unint64_t v33 = v15;
    __int16 v34 = 2112;
    id v35 = v16;
    __int16 v36 = 2112;
    id v37 = v7;
LABEL_28:
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    goto LABEL_4;
  }
  id v30 = v6;
  [(RTWorkoutRouteManager *)self _initProcessWorkoutMetricsForClusteringWithError:&v30];
  id v10 = v30;

  if (a3 && v10)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      uint64_t v9 = v10;
      goto LABEL_9;
    }
    dispatch_time_t v23 = (objc_class *)objc_opt_class();
    long long v20 = NSStringFromClass(v23);
    id v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    unint64_t v33 = v20;
    __int16 v34 = 2112;
    id v35 = v21;
    __int16 v36 = 2112;
    id v37 = v10;
LABEL_30:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    goto LABEL_8;
  }
  id v29 = v10;
  [(RTWorkoutRouteManager *)self _initProcessWorkoutMetricsForSyncFromHealthKitWithError:&v29];
  id v7 = v29;

  if (a3 && v7)
  {
    unint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    double v14 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v14);
    id v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    unint64_t v33 = v15;
    __int16 v34 = 2112;
    id v35 = v16;
    __int16 v36 = 2112;
    id v37 = v7;
    goto LABEL_28;
  }
  id v28 = v7;
  [(RTWorkoutRouteManager *)self _initProcessWorkoutMetricsForSyncToHealthKitWithError:&v28];
  id v17 = v28;

  if (a3 && v17)
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v24 = (objc_class *)objc_opt_class();
      double v25 = NSStringFromClass(v24);
      int v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      unint64_t v33 = v25;
      __int16 v34 = 2112;
      id v35 = v26;
      __int16 v36 = 2112;
      id v37 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    uint64_t v9 = v17;
    goto LABEL_9;
  }
  id v27 = v17;
  [(RTWorkoutRouteManager *)self _initProcessWorkoutMetricsForSyncToWatchKitWithError:&v27];
  id v10 = v27;

  if (a3 && v10)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    uint64_t v19 = (objc_class *)objc_opt_class();
    long long v20 = NSStringFromClass(v19);
    id v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    unint64_t v33 = v20;
    __int16 v34 = 2112;
    id v35 = v21;
    __int16 v36 = 2112;
    id v37 = v10;
    goto LABEL_30;
  }
  if (a3) {
    *a3 = v10;
  }
  BOOL v12 = v10 == 0;
LABEL_10:

  return v12;
}

- (BOOL)_initProcessWorkoutMetricsForDistanceMatrixWithError:(id *)a3
{
  id v4 = [NSNumber numberWithInteger:-1];
  uint64_t v5 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v5 setObject:v4 forKeyedSubscript:@"distance_matrix_initial_size"];

  id v6 = [NSNumber numberWithInteger:-1];
  id v7 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v7 setObject:v6 forKeyedSubscript:@"distance_matrix_final_size"];

  unint64_t v8 = [NSNumber numberWithInteger:-1];
  uint64_t v9 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v9 setObject:v8 forKeyedSubscript:@"distance_matrix_min_time_prefiltered_metadata"];

  id v10 = [NSNumber numberWithInteger:-1];
  uint64_t v11 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v11 setObject:v10 forKeyedSubscript:@"distance_matrix_min_time_prefiltered_firstlocation"];

  BOOL v12 = [NSNumber numberWithInteger:-1];
  int v13 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v13 setObject:v12 forKeyedSubscript:@"distance_matrix_min_time_prefiltered_locationscount"];

  double v14 = [NSNumber numberWithInteger:-1];
  __int16 v15 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v15 setObject:v14 forKeyedSubscript:@"distance_matrix_min_time_prefiltered_lastlocation"];

  id v16 = [NSNumber numberWithInteger:-1];
  id v17 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v17 setObject:v16 forKeyedSubscript:@"distance_matrix_min_time_prefiltered_cache"];

  uint64_t v18 = [NSNumber numberWithInteger:-1];
  uint64_t v19 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v19 setObject:v18 forKeyedSubscript:@"distance_matrix_min_time_prefiltered_centroid"];

  long long v20 = [NSNumber numberWithInteger:-1];
  id v21 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v21 setObject:v20 forKeyedSubscript:@"distance_matrix_min_time_prefiltered_iou"];

  uint64_t v22 = [NSNumber numberWithInteger:-1];
  dispatch_time_t v23 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v23 setObject:v22 forKeyedSubscript:@"distance_matrix_min_time_lessthan_orequal_quicksimilarity"];

  double v24 = [NSNumber numberWithInteger:-1];
  double v25 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v25 setObject:v24 forKeyedSubscript:@"distance_matrix_min_time_exceeded_quicksimilarity"];

  int v26 = [NSNumber numberWithInteger:-1];
  id v27 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v27 setObject:v26 forKeyedSubscript:@"distance_matrix_min_time_exceeded_dtw"];

  id v28 = [NSNumber numberWithInteger:-1];
  id v29 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v29 setObject:v28 forKeyedSubscript:@"distance_matrix_min_time_lessthan_orequal_dtw"];

  id v30 = [NSNumber numberWithInteger:-1];
  id v31 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v31 setObject:v30 forKeyedSubscript:@"distance_matrix_min_time_already_computed"];

  uint64_t v32 = [NSNumber numberWithInteger:-1];
  unint64_t v33 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v33 setObject:v32 forKeyedSubscript:@"distance_matrix_max_time_prefiltered_metadata"];

  __int16 v34 = [NSNumber numberWithInteger:-1];
  id v35 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v35 setObject:v34 forKeyedSubscript:@"distance_matrix_max_time_prefiltered_firstlocation"];

  __int16 v36 = [NSNumber numberWithInteger:-1];
  id v37 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v37 setObject:v36 forKeyedSubscript:@"distance_matrix_max_time_prefiltered_locationscount"];

  uint64_t v38 = [NSNumber numberWithInteger:-1];
  uint64_t v39 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v39 setObject:v38 forKeyedSubscript:@"distance_matrix_max_time_prefiltered_lastlocation"];

  uint64_t v40 = [NSNumber numberWithInteger:-1];
  uint64_t v41 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v41 setObject:v40 forKeyedSubscript:@"distance_matrix_max_time_prefiltered_cache"];

  uint64_t v42 = [NSNumber numberWithInteger:-1];
  uint64_t v43 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v43 setObject:v42 forKeyedSubscript:@"distance_matrix_max_time_prefiltered_centroid"];

  uint64_t v44 = [NSNumber numberWithInteger:-1];
  uint64_t v45 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v45 setObject:v44 forKeyedSubscript:@"distance_matrix_max_time_prefiltered_iou"];

  double v46 = [NSNumber numberWithInteger:-1];
  id v47 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v47 setObject:v46 forKeyedSubscript:@"distance_matrix_max_time_lessthan_orequal_quicksimilarity"];

  id v48 = [NSNumber numberWithInteger:-1];
  uint64_t v49 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v49 setObject:v48 forKeyedSubscript:@"distance_matrix_max_time_exceeded_quicksimilarity"];

  id v50 = [NSNumber numberWithInteger:-1];
  uint64_t v51 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v51 setObject:v50 forKeyedSubscript:@"distance_matrix_max_time_exceeded_dtw"];

  id v52 = [NSNumber numberWithInteger:-1];
  double v53 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v53 setObject:v52 forKeyedSubscript:@"distance_matrix_max_time_lessthan_orequal_dtw"];

  id v54 = [NSNumber numberWithInteger:-1];
  id v55 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v55 setObject:v54 forKeyedSubscript:@"distance_matrix_max_time_already_computed"];

  __int16 v56 = [NSNumber numberWithInteger:-1];
  uint64_t v57 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v57 setObject:v56 forKeyedSubscript:@"distance_matrix_average_time_prefiltered_metadata"];

  uint64_t v58 = [NSNumber numberWithInteger:-1];
  uint64_t v59 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v59 setObject:v58 forKeyedSubscript:@"distance_matrix_average_time_prefiltered_firstlocation"];

  uint64_t v60 = [NSNumber numberWithInteger:-1];
  SEL v61 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v61 setObject:v60 forKeyedSubscript:@"distance_matrix_average_time_prefiltered_locationscount"];

  id v62 = [NSNumber numberWithInteger:-1];
  uint64_t v63 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v63 setObject:v62 forKeyedSubscript:@"distance_matrix_average_time_prefiltered_lastlocation"];

  __int16 v64 = [NSNumber numberWithInteger:-1];
  id v65 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v65 setObject:v64 forKeyedSubscript:@"distance_matrix_average_time_prefiltered_cache"];

  __int16 v66 = [NSNumber numberWithInteger:-1];
  long long v67 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v67 setObject:v66 forKeyedSubscript:@"distance_matrix_average_time_prefiltered_centroid"];

  long long v68 = [NSNumber numberWithInteger:-1];
  long long v69 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v69 setObject:v68 forKeyedSubscript:@"distance_matrix_average_time_prefiltered_iou"];

  long long v70 = [NSNumber numberWithInteger:-1];
  id v71 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v71 setObject:v70 forKeyedSubscript:@"distance_matrix_average_time_lessthan_orequal_quicksimilarity"];

  id v72 = [NSNumber numberWithInteger:-1];
  long long v73 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v73 setObject:v72 forKeyedSubscript:@"distance_matrix_average_time_exceeded_quicksimilarity"];

  __int16 v74 = [NSNumber numberWithInteger:-1];
  id v75 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v75 setObject:v74 forKeyedSubscript:@"distance_matrix_average_time_exceeded_dtw"];

  __int16 v76 = [NSNumber numberWithInteger:-1];
  id v77 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v77 setObject:v76 forKeyedSubscript:@"distance_matrix_average_time_lessthan_orequal_dtw"];

  uint64_t v78 = [NSNumber numberWithInteger:-1];
  __int16 v79 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v79 setObject:v78 forKeyedSubscript:@"distance_matrix_average_time_already_computed"];

  uint64_t v80 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v80 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_prefiltered_metadata"];

  __int16 v81 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v81 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_prefiltered_firstlocation"];

  id v82 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v82 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_prefiltered_locationscount"];

  __int16 v83 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v83 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_prefiltered_lastlocation"];

  uint64_t v84 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v84 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matric_count_prefiltercache"];

  id v85 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v85 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_prefiltered_centroid"];

  uint64_t v86 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v86 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_prefiltered_iou"];

  id v87 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v87 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_lessthan_orequal_quicksimilarity"];

  uint64_t v88 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v88 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_exceeded_quicksimilarity"];

  uint64_t v89 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v89 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_exceeded_dtw"];

  uint64_t v90 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v90 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_lessthan_orequal_dtw"];

  double v91 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v91 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_already_computed"];

  id v92 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v92 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_no_workout_decimated"];

  id v93 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v93 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_single_workout_decimated"];

  id v94 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v94 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_count_both_workouts_decimated"];

  __int16 v95 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v95 setObject:&unk_1F34520D0 forKeyedSubscript:@"distance_matrix_total_number_of_comparisons"];

  uint64_t v96 = [NSNumber numberWithInteger:-1];
  __int16 v97 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v97 setObject:v96 forKeyedSubscript:@"distance_matrix_is_success"];

  __int16 v98 = [NSNumber numberWithInteger:-1];
  uint64_t v99 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v99 setObject:v98 forKeyedSubscript:@"distance_matrix_footprint_delta"];

  uint64_t v100 = [NSNumber numberWithInteger:-1];
  uint64_t v101 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v101 setObject:v100 forKeyedSubscript:@"distance_matrix_time_elapsed"];

  id v102 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v102 setObject:&unk_1F34520D0 forKeyedSubscript:@"number_of_workouts_running"];

  uint64_t v103 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v103 setObject:&unk_1F34520D0 forKeyedSubscript:@"number_of_workouts_cycling"];

  uint64_t v104 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v104 setObject:&unk_1F34520D0 forKeyedSubscript:@"number_of_workouts_wheel_chair_run_pace"];

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForClusteringWithError:(id *)a3
{
  id v4 = [NSNumber numberWithInteger:-1];
  uint64_t v5 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v5 setObject:v4 forKeyedSubscript:@"clustering_percentage_workouts_clustered"];

  id v6 = [NSNumber numberWithInteger:-1];
  id v7 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v7 setObject:v6 forKeyedSubscript:@"clustering_count_clusters"];

  unint64_t v8 = [NSNumber numberWithInteger:-1];
  uint64_t v9 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v9 setObject:v8 forKeyedSubscript:@"clustering_min_cluster_size"];

  id v10 = [NSNumber numberWithInteger:-1];
  uint64_t v11 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v11 setObject:v10 forKeyedSubscript:@"clustering_max_cluster_size"];

  BOOL v12 = [NSNumber numberWithInteger:-1];
  int v13 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v13 setObject:v12 forKeyedSubscript:@"clustering_average_cluster_size"];

  double v14 = [NSNumber numberWithInteger:-1];
  __int16 v15 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v15 setObject:v14 forKeyedSubscript:@"clustering_is_success"];

  id v16 = [NSNumber numberWithInteger:-1];
  id v17 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v17 setObject:v16 forKeyedSubscript:@"clustering_footprint_delta"];

  uint64_t v18 = [NSNumber numberWithInteger:-1];
  uint64_t v19 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v19 setObject:v18 forKeyedSubscript:@"clustering_time_elapsed"];

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForSyncFromHealthKitWithError:(id *)a3
{
  id v4 = [NSNumber numberWithInteger:-1];
  uint64_t v5 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v5 setObject:v4 forKeyedSubscript:@"sync_from_healthkit_count_local_clusters"];

  id v6 = [NSNumber numberWithInteger:-1];
  id v7 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v7 setObject:v6 forKeyedSubscript:@"sync_from_healthkit_count_remote_clusters"];

  unint64_t v8 = [NSNumber numberWithInteger:-1];
  uint64_t v9 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v9 setObject:v8 forKeyedSubscript:@"sync_from_healthkit_count_final_local_clusters"];

  id v10 = [NSNumber numberWithInteger:-1];
  uint64_t v11 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v11 setObject:v10 forKeyedSubscript:@"sync_from_healthkit_count_final_remote_clusters"];

  BOOL v12 = [NSNumber numberWithInteger:-1];
  int v13 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v13 setObject:v12 forKeyedSubscript:@"sync_from_healthkit_is_success"];

  double v14 = [NSNumber numberWithInteger:-1];
  __int16 v15 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v15 setObject:v14 forKeyedSubscript:@"sync_from_healthkit_footprint_delta"];

  id v16 = [NSNumber numberWithInteger:-1];
  id v17 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v17 setObject:v16 forKeyedSubscript:@"sync_from_healthkit_time_elapsed"];

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForSyncToHealthKitWithError:(id *)a3
{
  id v4 = [NSNumber numberWithInteger:-1];
  uint64_t v5 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v5 setObject:v4 forKeyedSubscript:@"sync_to_healthkit_min_time_snapshot"];

  id v6 = [NSNumber numberWithInteger:-1];
  id v7 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v7 setObject:v6 forKeyedSubscript:@"sync_to_healthkit_min_time_update_cluster"];

  unint64_t v8 = [NSNumber numberWithInteger:-1];
  uint64_t v9 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v9 setObject:v8 forKeyedSubscript:@"sync_to_healthkit_min_time_save_new_cluster"];

  id v10 = [NSNumber numberWithInteger:-1];
  uint64_t v11 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v11 setObject:v10 forKeyedSubscript:@"sync_to_healthkit_max_time_snapshot"];

  BOOL v12 = [NSNumber numberWithInteger:-1];
  int v13 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v13 setObject:v12 forKeyedSubscript:@"sync_to_healthkit_max_time_update_cluster"];

  double v14 = [NSNumber numberWithInteger:-1];
  __int16 v15 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v15 setObject:v14 forKeyedSubscript:@"sync_to_healthkit_max_time_save_new_cluster"];

  id v16 = [NSNumber numberWithInteger:-1];
  id v17 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v17 setObject:v16 forKeyedSubscript:@"sync_to_healthkit_average_time_snapshot"];

  uint64_t v18 = [NSNumber numberWithInteger:-1];
  uint64_t v19 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v19 setObject:v18 forKeyedSubscript:@"sync_to_healthkit_average_time_update_cluster"];

  long long v20 = [NSNumber numberWithInteger:-1];
  id v21 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v21 setObject:v20 forKeyedSubscript:@"sync_to_healthkit_average_time_save_new_cluster"];

  uint64_t v22 = [NSNumber numberWithInteger:-1];
  dispatch_time_t v23 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v23 setObject:v22 forKeyedSubscript:@"sync_to_healthkit_is_success"];

  double v24 = [NSNumber numberWithInteger:-1];
  double v25 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v25 setObject:v24 forKeyedSubscript:@"sync_to_healthkit_footprint_delta"];

  int v26 = [NSNumber numberWithInteger:-1];
  id v27 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v27 setObject:v26 forKeyedSubscript:@"sync_to_healthkit_time_elapsed"];

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForSyncToWatchKitWithError:(id *)a3
{
  id v4 = [NSNumber numberWithInteger:-1];
  uint64_t v5 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v5 setObject:v4 forKeyedSubscript:@"sync_to_watch_count_clusters"];

  id v6 = [NSNumber numberWithInteger:-1];
  id v7 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v7 setObject:v6 forKeyedSubscript:@"sync_to_watch_is_success"];

  unint64_t v8 = [NSNumber numberWithInteger:-1];
  uint64_t v9 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v9 setObject:v8 forKeyedSubscript:@"sync_to_watch_footprint_delta"];

  id v10 = [NSNumber numberWithInteger:-1];
  uint64_t v11 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v11 setObject:v10 forKeyedSubscript:@"sync_to_watch_time_elapsed"];

  return 1;
}

- (BOOL)_updateMetricsForCurrentTime:(id)a3 distanceMatrixKey:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E016D870]();
    id v10 = v9;
    switch(a4)
    {
      case 1uLL:
        uint64_t v11 = @"distance_matrix_min_time_already_computed";
        BOOL v12 = @"distance_matrix_max_time_already_computed";
        int v13 = @"distance_matrix_average_time_already_computed";
        double v14 = @"distance_matrix_count_already_computed";
        uint64_t v32 = 0;
        __int16 v15 = (id *)&v32;
        id v16 = &v32;
        break;
      case 2uLL:
        uint64_t v11 = @"distance_matrix_min_time_prefiltered_metadata";
        BOOL v12 = @"distance_matrix_max_time_prefiltered_metadata";
        int v13 = @"distance_matrix_average_time_prefiltered_metadata";
        double v14 = @"distance_matrix_count_prefiltered_metadata";
        uint64_t v31 = 0;
        __int16 v15 = (id *)&v31;
        id v16 = &v31;
        break;
      case 3uLL:
        uint64_t v11 = @"distance_matrix_min_time_prefiltered_firstlocation";
        BOOL v12 = @"distance_matrix_max_time_prefiltered_firstlocation";
        int v13 = @"distance_matrix_average_time_prefiltered_firstlocation";
        double v14 = @"distance_matrix_count_prefiltered_firstlocation";
        uint64_t v29 = 0;
        __int16 v15 = (id *)&v29;
        id v16 = &v29;
        break;
      case 4uLL:
        uint64_t v11 = @"distance_matrix_min_time_prefiltered_lastlocation";
        BOOL v12 = @"distance_matrix_max_time_prefiltered_lastlocation";
        int v13 = @"distance_matrix_average_time_prefiltered_lastlocation";
        double v14 = @"distance_matrix_count_prefiltered_lastlocation";
        uint64_t v26 = 0;
        __int16 v15 = (id *)&v26;
        id v16 = &v26;
        break;
      case 5uLL:
        uint64_t v11 = @"distance_matrix_min_time_prefiltered_cache";
        BOOL v12 = @"distance_matrix_max_time_prefiltered_cache";
        int v13 = @"distance_matrix_average_time_prefiltered_cache";
        double v14 = @"distance_matric_count_prefiltercache";
        uint64_t v28 = 0;
        __int16 v15 = (id *)&v28;
        id v16 = &v28;
        break;
      case 6uLL:
        uint64_t v11 = @"distance_matrix_min_time_prefiltered_centroid";
        BOOL v12 = @"distance_matrix_max_time_prefiltered_centroid";
        int v13 = @"distance_matrix_average_time_prefiltered_centroid";
        double v14 = @"distance_matrix_count_prefiltered_centroid";
        uint64_t v27 = 0;
        __int16 v15 = (id *)&v27;
        id v16 = &v27;
        break;
      case 7uLL:
        uint64_t v11 = @"distance_matrix_min_time_prefiltered_locationscount";
        BOOL v12 = @"distance_matrix_max_time_prefiltered_locationscount";
        int v13 = @"distance_matrix_average_time_prefiltered_locationscount";
        double v14 = @"distance_matrix_count_prefiltered_locationscount";
        uint64_t v30 = 0;
        __int16 v15 = (id *)&v30;
        id v16 = &v30;
        break;
      case 8uLL:
        uint64_t v11 = @"distance_matrix_min_time_prefiltered_iou";
        BOOL v12 = @"distance_matrix_max_time_prefiltered_iou";
        int v13 = @"distance_matrix_average_time_prefiltered_iou";
        double v14 = @"distance_matrix_count_prefiltered_iou";
        uint64_t v25 = 0;
        __int16 v15 = (id *)&v25;
        id v16 = &v25;
        break;
      case 9uLL:
        uint64_t v11 = @"distance_matrix_min_time_exceeded_dtw";
        BOOL v12 = @"distance_matrix_max_time_exceeded_dtw";
        int v13 = @"distance_matrix_average_time_exceeded_dtw";
        double v14 = @"distance_matrix_count_exceeded_dtw";
        uint64_t v24 = 0;
        __int16 v15 = (id *)&v24;
        id v16 = &v24;
        break;
      case 0xAuLL:
        uint64_t v11 = @"distance_matrix_min_time_exceeded_quicksimilarity";
        BOOL v12 = @"distance_matrix_max_time_exceeded_quicksimilarity";
        int v13 = @"distance_matrix_average_time_exceeded_quicksimilarity";
        double v14 = @"distance_matrix_count_exceeded_quicksimilarity";
        uint64_t v22 = 0;
        __int16 v15 = (id *)&v22;
        id v16 = &v22;
        break;
      case 0xBuLL:
        uint64_t v11 = @"distance_matrix_min_time_lessthan_orequal_dtw";
        BOOL v12 = @"distance_matrix_max_time_lessthan_orequal_dtw";
        int v13 = @"distance_matrix_average_time_lessthan_orequal_dtw";
        double v14 = @"distance_matrix_count_lessthan_orequal_dtw";
        uint64_t v23 = 0;
        __int16 v15 = (id *)&v23;
        id v16 = &v23;
        break;
      case 0xCuLL:
        uint64_t v11 = @"distance_matrix_min_time_lessthan_orequal_quicksimilarity";
        BOOL v12 = @"distance_matrix_max_time_lessthan_orequal_quicksimilarity";
        int v13 = @"distance_matrix_average_time_lessthan_orequal_quicksimilarity";
        double v14 = @"distance_matrix_count_lessthan_orequal_quicksimilarity";
        uint64_t v21 = 0;
        __int16 v15 = (id *)&v21;
        id v16 = &v21;
        break;
      default:
        goto LABEL_9;
    }
    -[RTWorkoutRouteManager _updateMetricsForCurrentTime:minTimeKey:maxTimeKey:averageTimeKey:countKey:error:](self, "_updateMetricsForCurrentTime:minTimeKey:maxTimeKey:averageTimeKey:countKey:error:", v8, v11, v12, v13, v14, v16, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
      v32);
    id v19 = *v15;
    if (a5) {
      *a5 = v19;
    }
    BOOL v18 = v19 != 0;
  }
  else
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: currentTime", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"currentTime");
      BOOL v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (BOOL)_updateMetricsForCurrentTime:(id)a3 syncToHealthKitKey:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E016D870]();
    switch(a4)
    {
      case 3uLL:
        id v10 = @"sync_to_healthkit_min_time_save_new_cluster";
        uint64_t v11 = @"sync_to_healthkit_max_time_save_new_cluster";
        BOOL v12 = @"sync_to_healthkit_average_time_save_new_cluster";
        uint64_t v19 = 0;
        int v13 = (id *)&v19;
        double v14 = &v19;
        break;
      case 2uLL:
        id v10 = @"sync_to_healthkit_min_time_update_cluster";
        uint64_t v11 = @"sync_to_healthkit_max_time_update_cluster";
        BOOL v12 = @"sync_to_healthkit_average_time_update_cluster";
        uint64_t v18 = 0;
        int v13 = (id *)&v18;
        double v14 = &v18;
        break;
      case 1uLL:
        id v10 = @"sync_to_healthkit_min_time_snapshot";
        uint64_t v11 = @"sync_to_healthkit_max_time_snapshot";
        BOOL v12 = @"sync_to_healthkit_average_time_snapshot";
        uint64_t v20 = 0;
        int v13 = (id *)&v20;
        double v14 = &v20;
        break;
      default:
        BOOL v16 = 0;
        goto LABEL_14;
    }
    [(RTWorkoutRouteManager *)self _updateMetricsForCurrentTime:v8 minTimeKey:v10 maxTimeKey:v11 averageTimeKey:v12 countKey:0 error:v14];

    BOOL v16 = 1;
LABEL_14:
    goto LABEL_15;
  }
  __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: currentTime", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"currentTime");
    BOOL v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_15:

  return v16;
}

- (BOOL)_updateMetricsForCurrentTime:(id)a3 minTimeKey:(id)a4 maxTimeKey:(id)a5 averageTimeKey:(id)a6 countKey:(id)a7 error:(id *)a8
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = v19;
  if (!v15)
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: currentTime", buf, 2u);
    }

    if (!a8) {
      goto LABEL_31;
    }
    uint64_t v26 = @"currentTime";
    goto LABEL_30;
  }
  if (!v16)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: minTimeKey", buf, 2u);
    }

    if (!a8) {
      goto LABEL_31;
    }
    uint64_t v26 = @"minTimeKey";
    goto LABEL_30;
  }
  if (!v17)
  {
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: maxTimeKey", buf, 2u);
    }

    if (!a8) {
      goto LABEL_31;
    }
    uint64_t v26 = @"maxTimeKey";
    goto LABEL_30;
  }
  if (!v18)
  {
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: averageTimeKey", buf, 2u);
    }

    if (!a8) {
      goto LABEL_31;
    }
    uint64_t v26 = @"averageTimeKey";
LABEL_30:
    _RTErrorInvalidParameterCreate((uint64_t)v26);
    BOOL v31 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if (!v19)
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: countKey", buf, 2u);
    }

    if (a8)
    {
      uint64_t v26 = @"countKey";
      goto LABEL_30;
    }
LABEL_31:
    BOOL v31 = 0;
    goto LABEL_42;
  }
  id v69 = v19;
  context = (void *)MEMORY[0x1E016D870]();
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v63 = (objc_class *)objc_opt_class();
    __int16 v64 = NSStringFromClass(v63);
    id v65 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    id v71 = v64;
    __int16 v72 = 2112;
    long long v73 = v65;
    __int16 v74 = 2112;
    id v75 = v16;
    __int16 v76 = 2112;
    id v77 = v17;
    __int16 v78 = 2112;
    id v79 = v18;
    __int16 v80 = 2112;
    id v81 = v69;
    _os_log_debug_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEBUG, "%@, %@, updating metrics for minTimeKey, %@, maxTimeKey, %@, averageTimeKey, %@, countKey, %@", buf, 0x3Eu);
  }
  uint64_t v22 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  uint64_t v23 = [v22 objectForKeyedSubscript:v16];
  uint64_t v24 = [NSNumber numberWithInteger:-1];
  if ([v23 isEqualToNumber:v24])
  {
  }
  else
  {
    uint64_t v32 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    unint64_t v33 = [v32 objectForKeyedSubscript:v16];
    uint64_t v66 = [v33 compare:v15];

    if (v66 != 1) {
      goto LABEL_34;
    }
  }
  __int16 v34 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v34 setObject:v15 forKeyedSubscript:v16];

LABEL_34:
  id v35 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  __int16 v36 = [v35 objectForKeyedSubscript:v17];
  id v37 = [NSNumber numberWithInteger:-1];
  if ([v36 isEqualToNumber:v37])
  {

LABEL_37:
    uint64_t v40 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v40 setObject:v15 forKeyedSubscript:v17];

    goto LABEL_38;
  }
  uint64_t v38 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  uint64_t v39 = [v38 objectForKeyedSubscript:v17];
  uint64_t v67 = [v39 compare:v15];

  if (v67 == -1) {
    goto LABEL_37;
  }
LABEL_38:
  uint64_t v41 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  uint64_t v42 = [v41 objectForKeyedSubscript:v18];
  uint64_t v43 = [NSNumber numberWithInteger:-1];
  int v44 = [v42 isEqualToNumber:v43];

  uint64_t v45 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  double v46 = v45;
  if (v44)
  {
    [v45 setObject:v15 forKeyedSubscript:v18];
    uint64_t v20 = v69;
  }
  else
  {
    id v47 = [v45 objectForKeyedSubscript:v18];
    [v47 doubleValue];
    double v49 = v48;

    id v50 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    uint64_t v20 = v69;
    uint64_t v51 = [v50 objectForKeyedSubscript:v69];
    [v51 doubleValue];
    double v53 = v52;

    id v54 = NSNumber;
    [v15 doubleValue];
    double v46 = [v54 numberWithDouble:(v55 + v49 * v53) / (v53 + 1.0)];
    __int16 v56 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
    [v56 setObject:v46 forKeyedSubscript:v18];
  }
  uint64_t v57 = NSNumber;
  uint64_t v58 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  uint64_t v59 = [v58 objectForKeyedSubscript:v20];
  uint64_t v60 = [v57 numberWithUnsignedInteger:[v59 unsignedIntegerValue] + 1];
  SEL v61 = [(RTWorkoutRouteManager *)self processWorkoutMetrics];
  [v61 setObject:v60 forKeyedSubscript:v20];

  BOOL v31 = 1;
LABEL_42:

  return v31;
}

- (double)_getMaxDistanceThresholdForMetric:(int64_t)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v7 = [&unk_1F3453330 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (!v7)
  {
    uint64_t v23 = 0;
    double v10 = -1.79769313e308;
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v34;
  double v10 = -1.79769313e308;
  uint64_t v30 = a4;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(&unk_1F3453330);
      }
      BOOL v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      int v13 = (void *)MEMORY[0x1E016D870]();
      uint64_t v14 = [v12 integerValue];
      id v32 = 0;
      id v15 = [(RTWorkoutRouteManager *)self _getConstantValueForDistanceThresholdUsingDistanceMetric:a3 isDecimated:1 workoutActivityType:v14 error:&v32];
      id v16 = v32;
      if (v16)
      {
        uint64_t v23 = v16;
LABEL_18:

        a4 = v30;
        goto LABEL_19;
      }
      uint64_t v17 = [v12 integerValue];
      id v31 = 0;
      id v18 = [(RTWorkoutRouteManager *)self _getConstantValueForDistanceThresholdUsingDistanceMetric:a3 isDecimated:0 workoutActivityType:v17 error:&v31];
      id v19 = v31;
      if (v19)
      {
        uint64_t v23 = v19;

        goto LABEL_18;
      }
      [v15 doubleValue];
      double v21 = v20;
      [v18 doubleValue];
      if (v21 >= v22) {
        double v22 = v21;
      }
      if (v10 < v22) {
        double v10 = v22;
      }
    }
    uint64_t v8 = [&unk_1F3453330 countByEnumeratingWithState:&v33 objects:v43 count:16];
    uint64_t v23 = 0;
    a4 = v30;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_19:
  uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    uint64_t v27 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v38 = v26;
    __int16 v39 = 2112;
    uint64_t v40 = v27;
    __int16 v41 = 2048;
    double v42 = v10;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, max distance threshold, %.5f", buf, 0x20u);
  }
  if (a4) {
    *a4 = v23;
  }

  return v10;
}

- (id)_getRTPairsFromCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4
{
  for (uint64_t i = objc_opt_new(); a4; --a4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E016D870]();
    uint64_t v9 = [(RTWorkoutRouteManager *)self _getRTPairUsingCLLocationCoordinate2D:a3];
    [i addObject:v9];

    ++a3;
  }

  return i;
}

- (CGRect)_getCGRectFromCoordinates:(CLLocationCoordinate2D *)a3 verticesCount:(unint64_t)a4 outError:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4 > 3)
    {
      id v19 = [(RTWorkoutRouteManager *)self distanceCalculator];
      id v32 = 0;
      [v19 cgrectFromCoordinates:a3 locationsCount:a4 error:&v32];
      double v13 = v20;
      double v14 = v21;
      double v15 = v22;
      double v16 = v23;
      id v10 = v32;

      if (!a5 || !v10) {
        goto LABEL_15;
      }
      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = (objc_class *)objc_opt_class();
        uint64_t v30 = NSStringFromClass(v29);
        id v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        long long v34 = v30;
        __int16 v35 = 2112;
        long long v36 = v31;
        __int16 v37 = 2112;
        id v38 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v11 = v10;
      id v10 = v11;
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F5CFE8];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v40[0] = @"less number of locations than required";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      id v10 = [v7 errorWithDomain:v8 code:7 userInfo:v9];

      if (!a5)
      {
LABEL_14:
        double v13 = *MEMORY[0x1E4F1DB20];
        double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_15:

        goto LABEL_16;
      }
      id v11 = v10;
    }
    *a5 = v11;
    goto LABEL_14;
  }
  BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: verticesCoordinates", buf, 2u);
  }

  double v13 = *MEMORY[0x1E4F1DB20];
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_16:
  double v25 = v13;
  double v26 = v14;
  double v27 = v15;
  double v28 = v16;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CLLocationCoordinate2D)_getCoordinatesFromRTPairs:(id)a3
{
  id v3 = a3;
  id v4 = (CLLocationCoordinate2D *)malloc_type_malloc(16 * [v3 count], 0x1000040451B5BE8uLL);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    p_double longitude = &v4->longitude;
    do
    {
      uint64_t v7 = (void *)MEMORY[0x1E016D870]();
      uint64_t v8 = [v3 objectAtIndexedSubscript:v5];
      uint64_t v9 = [v8 firstObject];
      [v9 doubleValue];
      CLLocationDegrees v11 = v10;
      BOOL v12 = [v3 objectAtIndexedSubscript:v5];
      double v13 = [v12 secondObject];
      [v13 doubleValue];
      *(CLLocationCoordinate2D *)(p_longitude - 1) = CLLocationCoordinate2DMake(v11, v14);

      ++v5;
      p_longitude += 2;
    }
    while (v5 < [v3 count]);
  }

  return v4;
}

- (BOOL)_refreshWorkoutsCache:(id)a3 workoutUUIDs:(id)a4 startingIndex:(unint64_t)a5 error:(id *)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  double v13 = v12;
  if (!v11)
  {
    __int16 v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutsCache", buf, 2u);
    }

    if (a6)
    {
      id v38 = @"workoutsCache";
LABEL_26:
      _RTErrorInvalidParameterCreate((uint64_t)v38);
      BOOL v36 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_27:
    BOOL v36 = 0;
    goto LABEL_28;
  }
  if (!v12)
  {
    uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a6)
    {
      id v38 = @"workoutUUIDs";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  aSelector = a2;
  double v46 = a6;
  context = (void *)MEMORY[0x1E016D870]();
  uint64_t v44 = [MEMORY[0x1E4F1C9C8] date];
  [v11 removeAllObjects];
  uint64_t v14 = [v13 count];
  if (v14 - a5 >= 0x32) {
    uint64_t v15 = 50;
  }
  else {
    uint64_t v15 = v14 - a5;
  }
  double v16 = [(RTWorkoutRouteManager *)self healthKitManager];
  NSUInteger range = v15;
  uint64_t v17 = [v13 subarrayWithRange:a5, v15];
  id v51 = 0;
  id v18 = [v16 getWorkoutsWithUUIDs:v17 error:&v51];
  id v43 = v51;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        double v25 = (void *)MEMORY[0x1E016D870]();
        double v26 = [v24 UUID];
        [v11 setObject:v24 forKeyedSubscript:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v21);
  }

  double v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    double v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    uint64_t v30 = NSStringFromSelector(aSelector);
    v64.id location = a5;
    v64.length = range;
    id v31 = NSStringFromRange(v64);
    id v32 = [MEMORY[0x1E4F1C9C8] date];
    [v32 timeIntervalSinceDate:v44];
    uint64_t v34 = v33;
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138413314;
    double v53 = v29;
    __int16 v54 = 2112;
    double v55 = v30;
    __int16 v56 = 2112;
    uint64_t v57 = v31;
    __int16 v58 = 2048;
    uint64_t v59 = v34;
    __int16 v60 = 2048;
    uint64_t v61 = v35;
    _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, %@, refreshed workouts cache in the range %@, latency, %.4f, footprint, %.4f", buf, 0x34u);
  }
  if (v46) {
    *double v46 = v43;
  }

  BOOL v36 = 1;
LABEL_28:

  return v36;
}

- (id)_getWorkoutFromWorkouts:(id)a3 UUID:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8)
    {
      double v10 = [v7 objectForKeyedSubscript:v8];

      if (v10)
      {
        id v11 = [v7 objectForKeyedSubscript:v9];
        goto LABEL_18;
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      uint64_t v17 = [NSString stringWithFormat:@"workout UUID %@ not found in the workouts", v9];
      v23[0] = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v19 = [v15 errorWithDomain:v16 code:7 userInfo:v18];

      if (a5) {
        *a5 = v19;
      }

      goto LABEL_17;
    }
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUID", buf, 2u);
    }

    if (a5)
    {
      double v13 = @"workoutUUID";
      goto LABEL_13;
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutsCache", buf, 2u);
    }

    if (a5)
    {
      double v13 = @"workoutsCache";
LABEL_13:
      _RTErrorInvalidParameterCreate((uint64_t)v13);
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
LABEL_17:
  id v11 = 0;
LABEL_18:

  return v11;
}

- (void)_getLocationsForWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(int64_t)a5 handler:(id)a6
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v50 = a6;
  uint64_t v67 = 0;
  long long v68 = &v67;
  uint64_t v69 = 0x3032000000;
  long long v70 = __Block_byref_object_copy__133;
  id v71 = __Block_byref_object_dispose__133;
  id v72 = 0;
  uint64_t v46 = *MEMORY[0x1E4F5CFE8];
  uint64_t v47 = *MEMORY[0x1E4F28568];
  id v51 = v7;
  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v82 = *MEMORY[0x1E4F28568];
    __int16 v83 = @"workout is nil";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    uint64_t v10 = [v8 errorWithDomain:v46 code:7 userInfo:v9];
    id v11 = (void *)v68[5];
    v68[5] = v10;

    (*((void (**)(id, void, void, uint64_t))v50 + 2))(v50, 0, 0, v68[5]);
  }
  id v12 = 0;
  uint64_t v63 = 0;
  NSRange v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v13 = 1;
  uint64_t v66 = 0;
  uint64_t v59 = 0;
  __int16 v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  while ((v13 & 1) != 0)
  {
    context = (void *)MEMORY[0x1E016D870]();
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v16 = [(RTWorkoutRouteManager *)self healthKitManager];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __79__RTWorkoutRouteManager__getLocationsForWorkout_decimationLevel_limit_handler___block_invoke;
    v54[3] = &unk_1E6B9B000;
    __int16 v56 = &v63;
    uint64_t v57 = &v59;
    __int16 v58 = &v67;
    uint64_t v17 = v14;
    double v55 = v17;
    [v16 fetchRouteLocationsUsingWorkout:v51 decimationLevel:a4 limit:a5 shift:0 handler:v54];

    id v18 = v17;
    id v19 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v20 = dispatch_time(0, 3600000000000);
    id v21 = v12;
    if (dispatch_semaphore_wait(v18, v20))
    {
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
      [v22 timeIntervalSinceDate:v19];
      double v24 = v23;
      double v25 = objc_opt_new();
      double v26 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_599];
      double v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v28 = [v27 filteredArrayUsingPredicate:v26];
      uint64_t v29 = [v28 firstObject];

      [v25 submitToCoreAnalytics:v29 type:1 duration:v24];
      uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      id v31 = (void *)MEMORY[0x1E4F28C58];
      v84[0] = v47;
      *(void *)buf = @"semaphore wait timeout";
      id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v84 count:1];
      uint64_t v33 = [v31 errorWithDomain:v46 code:15 userInfo:v32];

      id v21 = v12;
      if (v33)
      {
        id v21 = v33;
      }
    }

    id v34 = v21;
    uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      BOOL v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = v60[3];
      uint64_t v40 = v68[5];
      __int16 v41 = [MEMORY[0x1E4F1C9C8] date];
      [v41 timeIntervalSinceDate:v15];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v37;
      __int16 v74 = 2112;
      id v75 = v38;
      __int16 v76 = 2048;
      uint64_t v77 = v39;
      __int16 v78 = 2112;
      uint64_t v79 = v40;
      __int16 v80 = 2048;
      uint64_t v81 = v42;
      _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "%@, %@, locations count, %lu, error, %@, latency, %.4f sec", buf, 0x34u);
    }
    id v43 = v34;
    if (v34 || (id v43 = (id)v68[5]) != 0)
    {
      (*((void (**)(id, void, void, id))v50 + 2))(v50, 0, 0, v43);
      char v44 = 0;
    }
    else
    {
      char v44 = 1;
    }

    char v13 = 0;
    id v12 = v34;
    if ((v44 & 1) == 0) {
      goto LABEL_19;
    }
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t))v50 + 2))(v50, v64[3], v60[3], v68[5]);
  id v34 = v12;
LABEL_19:
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
}

void __79__RTWorkoutRouteManager__getLocationsForWorkout_decimationLevel_limit_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold:(double)a3 topN:(unint64_t)a4 error:(id *)a5
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  uint64_t v123 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v141 = objc_opt_new();
  unint64_t v124 = a4;
  if (a4 == 0x7FFFFFFF)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v177 = v10;
      __int16 v178 = 2112;
      id v179 = v11;
      __int16 v180 = 2048;
      uint64_t v181 = 5000;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, top N is passed as Infinity. Manually reducing it to maximum count of %lu", buf, 0x20u);
    }
    unint64_t v124 = 5000;
  }
  id v12 = [(RTWorkoutRouteManager *)self healthKitManager];
  char v13 = [v12 _getWorkoutDefaultStartDateForRaceRoute];

  id v168 = 0;
  uint64_t v121 = [(RTWorkoutRouteManager *)self _getRelevanceLocationWithError:&v168];
  id v14 = v168;
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  uint64_t v16 = v15;
  if (a5 && v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v112 = (objc_class *)objc_opt_class();
      uint64_t v113 = NSStringFromClass(v112);
      uint64_t v114 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v177 = v113;
      __int16 v178 = 2112;
      id v179 = v114;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v14;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v17 = v14;
    *a5 = v17;
    id v144 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    uint64_t v130 = a5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      dispatch_time_t v20 = NSStringFromSelector(a2);
      id v21 = [v13 stringFromDate];
      if (a3 == 1.79769313e308)
      {
        uint64_t v22 = @"infinity";
      }
      else
      {
        uint64_t v22 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
      }
      double v23 = [[NSString stringWithFormat:@"%lu", v124];
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138414082;
      id v177 = v19;
      __int16 v178 = 2112;
      id v179 = v20;
      __int16 v180 = 2048;
      uint64_t v181 = 50;
      __int16 v182 = 2112;
      uint64_t v183 = (uint64_t)v21;
      __int16 v184 = 2112;
      uint64_t v185 = (uint64_t)v121;
      __int16 v186 = 2112;
      long long v187 = v22;
      __int16 v188 = 2112;
      long long v189 = v23;
      __int16 v190 = 2048;
      uint64_t v191 = v24;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, %@, before beginning, batch size, %lu, startDate, %@, location, %@, distance threshold, %@, top N, %@, footprint, %.4f MB", buf, 0x52u);

      if (a3 != 1.79769313e308) {
    }
      }

    __int16 v139 = objc_opt_new();
    id v25 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x1E016D870]();
      double v26 = [(RTWorkoutRouteManager *)self healthKitManager];
      double v27 = [(RTWorkoutRouteManager *)self healthKitManager];
      double v28 = [v27 getWorkoutDefaultSortDescriptors];
      uint64_t v29 = [(RTWorkoutRouteManager *)self healthKitManager];
      uint64_t v30 = [v29 _getRTWorkoutDefaultTypesForRaceRoute];
      id v167 = v14;
      id v135 = v13;
      id v31 = [v26 getWorkoutsWithStartDate:v13 limit:50 sortDescriptors:v28 nearLocation:v121 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:a3 workoutTypes:v30 error:&v167];
      id v122 = v167;

      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id v25 = v31;
      id v145 = (id)[v25 countByEnumeratingWithState:&v163 objects:v175 count:16];
      id v32 = 0;
      if (v145)
      {
        uint64_t v137 = *(void *)v164;
        do
        {
          for (uint64_t i = 0; i != v145; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v164 != v137) {
              objc_enumerationMutation(v25);
            }
            id v34 = *(void **)(*((void *)&v163 + 1) + 8 * i);
            uint64_t v35 = (void *)MEMORY[0x1E016D870]();
            BOOL v36 = v25;
            uint64_t v37 = [v25 count];
            id v38 = [v34 UUID];
            uint64_t v173 = v38;
            uint64_t v39 = [(RTWorkoutRouteManager *)self healthKitManager];
            uint64_t v40 = [v39 _getTotalDistanceForWorkout:v34];
            id v174 = v40;
            __int16 v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
            [v141 addObject:v41];

            uint64_t v42 = [objc_opt_class() stringFromWorkoutActivityType:[v34 workoutActivityType]];
            id v43 = [v139 objectForKeyedSubscript:v42];

            if (!v43)
            {
              char v44 = objc_opt_new();
              uint64_t v45 = [objc_opt_class() stringFromWorkoutActivityType:[v34 workoutActivityType]];
              [v139 setObject:v44 forKeyedSubscript:v45];
            }
            v32 += v37;
            uint64_t v46 = [objc_opt_class() stringFromWorkoutActivityType:[v34 workoutActivityType]];
            uint64_t v47 = [v139 objectForKeyedSubscript:v46];
            long long v48 = [v34 UUID];
            [v47 addObject:v48];

            id v25 = v36;
          }
          id v145 = (id)[v36 countByEnumeratingWithState:&v163 objects:v175 count:16];
        }
        while (v145);
      }

      long long v49 = (void *)MEMORY[0x1E4F1C9C8];
      id v50 = [v25 lastObject];
      id v51 = [v50 startDate];
      uint64_t v52 = [v49 dateWithTimeInterval:v51 sinceDate:0.001];

      id v17 = v122;
      if (v122) {
        break;
      }
      double v53 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        __int16 v54 = (objc_class *)objc_opt_class();
        double v55 = NSStringFromClass(v54);
        __int16 v56 = NSStringFromSelector(a2);
        uint64_t v57 = [v25 count];
        __int16 v58 = (void *)v52;
        uint64_t v59 = [v141 count];
        __int16 v60 = [v58 stringFromDate];
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413826;
        id v177 = v55;
        __int16 v178 = 2112;
        id v179 = v56;
        __int16 v180 = 2048;
        uint64_t v181 = v57;
        __int16 v182 = 2048;
        uint64_t v183 = (uint64_t)v32;
        __int16 v184 = 2048;
        uint64_t v185 = v59;
        uint64_t v52 = (uint64_t)v58;
        __int16 v186 = 2112;
        long long v187 = v60;
        __int16 v188 = 2048;
        long long v189 = v61;
        _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%@, %@, workouts count, %lu, valid Workouts count, %lu, total workout UUIDs count, %lu, next startDate, %@, footprint, %.4f MB", buf, 0x48u);
      }
      id v14 = 0;
      char v13 = (void *)v52;
      if (![v25 count]) {
        goto LABEL_36;
      }
    }
    if (!v130)
    {
LABEL_36:
      uint64_t v119 = v52;
      id v120 = v25;
      long long v118 = (void *)MEMORY[0x1E016D870]();
      uint64_t v63 = [v141 reverseObjectEnumerator];
      NSRange v64 = [v63 allObjects];

      unint64_t v65 = [v64 count];
      if (v124 >= v65) {
        unint64_t v66 = v65;
      }
      else {
        unint64_t v66 = v124;
      }
      uint64_t v67 = [v64 subarrayWithRange:0, v66];

      long long v68 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        uint64_t v69 = (objc_class *)objc_opt_class();
        long long v70 = NSStringFromClass(v69);
        NSStringFromSelector(a2);
        id v71 = (id)objc_claimAutoreleasedReturnValue();
        id v72 = [NSString stringWithFormat:@"%lu", v124];
        uint64_t v73 = [v67 count];
        +[RTRuntime footprint];
        *(_DWORD *)buf = 138413314;
        id v177 = v70;
        __int16 v178 = 2112;
        id v179 = v71;
        __int16 v180 = 2112;
        uint64_t v181 = (uint64_t)v72;
        __int16 v182 = 2048;
        uint64_t v183 = v73;
        __int16 v184 = 2048;
        uint64_t v185 = v74;
        _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "%@, %@, after filtering top N, %@, workout UUIDs count, %lu, footprint, %.4f MB", buf, 0x34u);
      }
      id v75 = [v67 sortedArrayUsingComparator:&__block_literal_global_348_0];

      __int16 v76 = objc_opt_new();
      long long v159 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      id obj = v75;
      uint64_t v77 = v139;
      uint64_t v128 = [obj countByEnumeratingWithState:&v159 objects:v172 count:16];
      if (v128)
      {
        uint64_t v127 = *(void *)v160;
        do
        {
          uint64_t v78 = 0;
          do
          {
            if (*(void *)v160 != v127) {
              objc_enumerationMutation(obj);
            }
            uint64_t v131 = v78;
            uint64_t v79 = *(void **)(*((void *)&v159 + 1) + 8 * v78);
            uint64_t v129 = (void *)MEMORY[0x1E016D870]();
            long long v155 = 0u;
            long long v156 = 0u;
            long long v157 = 0u;
            long long v158 = 0u;
            contexta = [v79 allKeys];
            uint64_t v138 = [contexta countByEnumeratingWithState:&v155 objects:v171 count:16];
            if (v138)
            {
              uint64_t v136 = *(void *)v156;
              do
              {
                __int16 v80 = 0;
                do
                {
                  if (*(void *)v156 != v136) {
                    objc_enumerationMutation(contexta);
                  }
                  uint64_t v146 = v80;
                  uint64_t v81 = *(void *)(*((void *)&v155 + 1) + 8 * (void)v80);
                  uint64_t v142 = (void *)MEMORY[0x1E016D870]();
                  long long v151 = 0u;
                  long long v152 = 0u;
                  long long v153 = 0u;
                  long long v154 = 0u;
                  id v82 = v77;
                  uint64_t v83 = [v82 countByEnumeratingWithState:&v151 objects:v170 count:16];
                  if (v83)
                  {
                    uint64_t v84 = v83;
                    uint64_t v85 = *(void *)v152;
                    do
                    {
                      for (uint64_t j = 0; j != v84; ++j)
                      {
                        if (*(void *)v152 != v85) {
                          objc_enumerationMutation(v82);
                        }
                        uint64_t v87 = *(void *)(*((void *)&v151 + 1) + 8 * j);
                        uint64_t v88 = (void *)MEMORY[0x1E016D870]();
                        uint64_t v89 = [v82 objectForKeyedSubscript:v87];
                        int v90 = [v89 containsObject:v81];

                        if (v90)
                        {
                          double v91 = [v76 objectForKeyedSubscript:v87];

                          if (!v91)
                          {
                            id v92 = objc_opt_new();
                            [v76 setObject:v92 forKeyedSubscript:v87];
                          }
                          id v93 = [v76 objectForKeyedSubscript:v87];
                          [v93 addObject:v81];
                        }
                      }
                      uint64_t v84 = [v82 countByEnumeratingWithState:&v151 objects:v170 count:16];
                    }
                    while (v84);
                  }

                  __int16 v80 = v146 + 1;
                  uint64_t v77 = v139;
                }
                while (v146 + 1 != (char *)v138);
                uint64_t v138 = [contexta countByEnumeratingWithState:&v155 objects:v171 count:16];
              }
              while (v138);
            }

            uint64_t v78 = v131 + 1;
          }
          while (v131 + 1 != v128);
          uint64_t v128 = [obj countByEnumeratingWithState:&v159 objects:v172 count:16];
        }
        while (v128);
      }

      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v144 = v76;
      uint64_t v94 = [v144 countByEnumeratingWithState:&v147 objects:v169 count:16];
      if (v94)
      {
        uint64_t v95 = v94;
        uint64_t v96 = *(void *)v148;
        uint64_t v140 = *(void *)v148;
        do
        {
          uint64_t v97 = 0;
          __int16 v143 = (void *)v95;
          do
          {
            if (*(void *)v148 != v96) {
              objc_enumerationMutation(v144);
            }
            uint64_t v98 = *(void *)(*((void *)&v147 + 1) + 8 * v97);
            uint64_t v99 = (void *)MEMORY[0x1E016D870]();
            uint64_t v100 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
            {
              uint64_t v101 = (objc_class *)objc_opt_class();
              NSStringFromClass(v101);
              id v102 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v103 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v104 = [v144 objectForKeyedSubscript:v98];
              uint64_t v105 = [v104 count];
              id v106 = [NSString stringWithFormat:@"%lu", v124];
              +[RTRuntime footprint];
              uint64_t v108 = v107;
              uint64_t v109 = [MEMORY[0x1E4F1C9C8] date];
              [v109 timeIntervalSinceDate:v123];
              *(_DWORD *)buf = 138413826;
              id v177 = v102;
              __int16 v178 = 2112;
              id v179 = v103;
              __int16 v180 = 2112;
              uint64_t v181 = v98;
              __int16 v182 = 2048;
              uint64_t v183 = v105;
              uint64_t v95 = (uint64_t)v143;
              __int16 v184 = 2112;
              uint64_t v185 = (uint64_t)v106;
              __int16 v186 = 2048;
              long long v187 = v108;
              __int16 v188 = 2048;
              long long v189 = v110;
              _os_log_impl(&dword_1D9BFA000, v100, OS_LOG_TYPE_INFO, "%@, %@, activity type, %@, workout UUIDs count, %lu, top N, %@, footprint, %.4f MB, latency, %.4f sec", buf, 0x48u);

              uint64_t v96 = v140;
            }

            ++v97;
          }
          while (v95 != v97);
          uint64_t v95 = [v144 countByEnumeratingWithState:&v147 objects:v169 count:16];
        }
        while (v95);
      }

      __int16 v141 = 0;
      uint64_t v52 = v119;
      id v25 = v120;
      id v17 = v122;
      goto LABEL_76;
    }
    uint64_t v62 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      uint64_t v115 = (objc_class *)objc_opt_class();
      uint64_t v116 = NSStringFromClass(v115);
      uint64_t v117 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v177 = v116;
      __int16 v178 = 2112;
      id v179 = v117;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v122;
      _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id *v130 = v122;
    id v144 = (id)objc_opt_new();

LABEL_76:
    char v13 = (void *)v52;
  }

  return v144;
}

uint64_t __100__RTWorkoutRouteManager__getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold_topN_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 allValues];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v4 allValues];

  id v8 = [v7 objectAtIndexedSubscript:0];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)_getRTLocationUsingRTPair:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithRTPair:v3];
  }
  else
  {
    unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pair", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_getRTLocationUsingCLLocationCoordinate2D:(CLLocationCoordinate2D *)a3
{
  if (a3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CE00]);
    double latitude = a3->latitude;
    double longitude = a3->longitude;
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = (void *)[v4 initWithLatitude:v7 longitude:latitude horizontalUncertainty:longitude date:0.0];
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinate", v11, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)_getRTPairUsingCLLocationCoordinate2D:(CLLocationCoordinate2D *)a3
{
  if (a3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CE58]);
    unint64_t v5 = [NSNumber numberWithDouble:a3->latitude];
    id v6 = [NSNumber numberWithDouble:a3->longitude];
    id v7 = (void *)[v4 initWithFirstObject:v5 secondObject:v6];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinate", v10, 2u);
    }

    id v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldDecimateWorkout:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTWorkoutRouteManager *)self healthKitManager];
    [v6 _getDurationForWorkout:v5];
    double v8 = v7 / 60.0;
    BOOL v9 = v7 / 60.0 > 90.0;

    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      char v13 = NSStringFromSelector(a2);
      uint64_t v14 = [v5 UUID];
      uint64_t v15 = (void *)v14;
      int v18 = 138413314;
      uint64_t v16 = @"NO";
      id v19 = v12;
      if (v8 > 90.0) {
        uint64_t v16 = @"YES";
      }
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      id v25 = v16;
      __int16 v26 = 2112;
      double v27 = v16;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, %@, workout UUID, %@, should decimate, %@, duration threshold exceeded, %@", (uint8_t *)&v18, 0x34u);
    }
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", (uint8_t *)&v18, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_mapWorkoutsToUUIDs:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          char v13 = (void *)MEMORY[0x1E016D870](v8);
          uint64_t v14 = [v12 UUID:v17];
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workouts");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v6 = [MEMORY[0x1E4F1C978] array];
  }

  return v6;
}

- (id)_sortWorkoutUUIDs:(id)a3 key:(id)a4 ascending:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  char v13 = v12;
  if (!v11)
  {
    long long v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (!a6) {
      goto LABEL_17;
    }
    id v21 = @"workoutUUIDs";
    goto LABEL_16;
  }
  if (!v12)
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", buf, 2u);
    }

    if (!a6) {
      goto LABEL_17;
    }
    id v21 = @"key";
LABEL_16:
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    long long v19 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_32;
  }
  uint64_t v14 = [(RTWorkoutRouteManager *)self healthKitManager];
  id v41 = 0;
  uint64_t v15 = [v14 getWorkoutsWithUUIDs:v11 error:&v41];
  id v16 = v41;

  if (a6 && v16)
  {
    long long v17 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = (objc_class *)objc_opt_class();
      id v31 = NSStringFromClass(v30);
      id v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v43 = v31;
      __int16 v44 = 2112;
      uint64_t v45 = v32;
      __int16 v46 = 2112;
      id v47 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v18 = v16;
    *a6 = v18;
    long long v19 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    id v40 = v16;
    uint64_t v23 = [(RTWorkoutRouteManager *)self _sortWorkouts:v15 key:v13 ascending:v7 error:&v40];
    id v24 = v40;

    if (a6 && v24)
    {
      id v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = (objc_class *)objc_opt_class();
        id v34 = NSStringFromClass(v33);
        uint64_t v35 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v43 = v34;
        __int16 v44 = 2112;
        uint64_t v45 = v35;
        __int16 v46 = 2112;
        id v47 = v24;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v18 = v24;
      *a6 = v18;
      long long v19 = [MEMORY[0x1E4F1C978] array];
    }
    else
    {
      id v39 = v24;
      __int16 v26 = [(RTWorkoutRouteManager *)self _mapWorkoutsToUUIDs:v23 error:&v39];
      id v18 = v39;

      if (a6 && v18)
      {
        double v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          BOOL v36 = (objc_class *)objc_opt_class();
          uint64_t v37 = NSStringFromClass(v36);
          id v38 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          id v43 = v37;
          __int16 v44 = 2112;
          uint64_t v45 = v38;
          __int16 v46 = 2112;
          id v47 = v18;
          _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        *a6 = v18;
        id v28 = [MEMORY[0x1E4F1C978] array];
      }
      else
      {
        id v28 = v26;
      }
      long long v19 = v28;
    }
  }

LABEL_32:

  return v19;
}

- (id)_sortWorkouts:(id)a3 key:(id)a4 ascending:(BOOL)a5 error:(id *)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts", v19, 2u);
    }

    if (!a6) {
      goto LABEL_13;
    }
    id v16 = @"workouts";
    goto LABEL_12;
  }
  if (v9)
  {
    id v11 = (void *)MEMORY[0x1E016D870]();
    id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v10 ascending:0];
    v20[0] = v12;
    char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v14 = [v8 sortedArrayUsingDescriptors:v13];

    goto LABEL_14;
  }
  long long v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v19 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", v19, 2u);
  }

  if (a6)
  {
    id v16 = @"key";
LABEL_12:
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  uint64_t v14 = [MEMORY[0x1E4F1C978] array];
LABEL_14:

  return v14;
}

- (id)_paceFromWorkout:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = [(RTWorkoutRouteManager *)self healthKitManager];
    id v8 = [v7 _getTotalDistanceForWorkout:v6];
    id v9 = [MEMORY[0x1E4F2B618] meterUnit];
    [v8 doubleValueForUnit:v9];
    double v11 = v10;

    id v12 = [(RTWorkoutRouteManager *)self healthKitManager];
    [v12 _getDurationForWorkout:v6];
    double v14 = v13;

    if (v11 == 0.0)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      long long v17 = NSString;
      id v18 = [v6 UUID];
      long long v19 = [v17 stringWithFormat:@"total distance for workout is 0, workout UUID, %@", v18];
      v37[0] = v19;
      long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      id v21 = [v15 errorWithDomain:v16 code:7 userInfo:v20];

      if (a4)
      {
        id v21 = v21;
        __int16 v22 = 0;
        *a4 = v21;
      }
      else
      {
        __int16 v22 = 0;
      }
    }
    else
    {
      id v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v6 UUID];
        __int16 v26 = [v25 UUIDString];
        *(_DWORD *)buf = 138413058;
        uint64_t v29 = v26;
        __int16 v30 = 2048;
        double v31 = v14;
        __int16 v32 = 2048;
        double v33 = v11;
        __int16 v34 = 2048;
        double v35 = v14 / v11;
        _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "workout UUID, %@, totalSeconds, %.5f, totalDistance, %.5f, pace, %.5f", buf, 0x2Au);
      }
      __int16 v22 = [NSNumber numberWithDouble:v14 / v11];
      id v21 = 0;
    }
  }
  else
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workout");
      __int16 v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v22 = 0;
    }
  }

  return v22;
}

- (void)_logClusters:(id)a3 className:(id)a4 selectorName:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v29 = a5;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v42 = v30;
    __int16 v43 = 2112;
    id v44 = v29;
    __int16 v45 = 2048;
    uint64_t v46 = [v7 count];
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, clusters count, %lu", buf, 0x20u);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v51 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v37;
    uint64_t v31 = 1;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v9;
        double v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        context = (void *)MEMORY[0x1E016D870]();
        double v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v10 count];
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413314;
          id v42 = v30;
          __int16 v43 = 2112;
          id v44 = v29;
          __int16 v45 = 2048;
          uint64_t v46 = v31;
          __int16 v47 = 2048;
          uint64_t v48 = v12;
          __int16 v49 = 2048;
          id v50 = v13;
          _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, cluster, %lu, workouts, %lu, footprint, %.4f MB", buf, 0x34u);
        }

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v14 = v10;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v33;
          uint64_t v18 = 1;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              id v21 = (void *)MEMORY[0x1E016D870]();
              __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                uint64_t v23 = [v20 UUIDString];
                *(_DWORD *)buf = 138413314;
                id v42 = v30;
                __int16 v43 = 2112;
                id v44 = v29;
                __int16 v45 = 2048;
                uint64_t v46 = v31;
                __int16 v47 = 2048;
                uint64_t v48 = v18 + i;
                __int16 v49 = 2112;
                id v50 = v23;
                _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, cluster, %lu, workout, %lu, uuid, %@", buf, 0x34u);
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
            v18 += i;
          }
          while (v16);
        }

        ++v31;
        uint64_t v9 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v51 count:16];
    }
    while (v26);
  }
}

- (id)_latestWorkoutUUIDAcrossWorkouts:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1E016D870](v6);
        double v13 = [v11 endDate:v19];
        uint64_t v14 = [v4 compare:v13];

        if (v14 == -1)
        {
          uint64_t v15 = [v11 endDate];

          id v16 = v11;
          id v8 = v16;
          id v4 = (void *)v15;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v17 = [v8 UUID];

  return v17;
}

- (void)_stepCallerWithName:(id)a3 counter:(int64_t)a4 totalCount:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    +[RTRuntime footprint];
    int v10 = 134218754;
    int64_t v11 = a4;
    __int16 v12 = 2048;
    int64_t v13 = a5;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Step %lu/%lu %@ done, footprint, %.4f MB", (uint8_t *)&v10, 0x2Au);
  }
}

- (double)_getConstantValueForString:(id)a3 isDecimated:(BOOL)a4 workoutActivityType:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (__CFString *)a3;
  int v10 = v9;
  if (!a5)
  {
    int64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutActivityType", buf, 2u);
    }

    if (!a6) {
      goto LABEL_26;
    }
    __int16 v14 = @"workoutActivityType";
    goto LABEL_25;
  }
  if (v9)
  {
    if ([(id)objc_opt_class() isPermittedWorkoutActivityType:a5])
    {
      if (v10 == @"kRTClusteringCentroidDistanceThreshold")
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          id v11 = 0;
          double v12 = 500.0;
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTClusteringDTWDistanceEuclideanThreshold" {
             || v10 == @"kRTClusteringDTWDistanceFirstNormThreshold")
      }
      {
        if (a5 == 13 || a5 == 71 || a5 == 37)
        {
          id v11 = 0;
          if (v8) {
            double v12 = 0.6;
          }
          else {
            double v12 = 0.5;
          }
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTPreFilterCentroidDistanceThreshold")
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          id v11 = 0;
          double v12 = 0.06;
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTPreFilterIntersectionOverUnionThreshold")
      {
        if (a5 == 13 || a5 == 71 || a5 == 37)
        {
          id v11 = 0;
          if (v8) {
            double v12 = 0.4;
          }
          else {
            double v12 = 0.8;
          }
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTPreFilterTotalDistanceDifferenceThreshold")
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          id v11 = 0;
          double v12 = 0.1;
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTPreFilterFirstLocationsDistanceThreshold")
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          id v11 = 0;
          double v12 = 0.04;
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTPreFilterLastLocationsDistanceThreshold")
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          id v11 = 0;
          double v12 = 0.03;
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTPreFilterDifferenceBetweenLocationsThreshold")
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          id v11 = 0;
          double v12 = 0.4;
          goto LABEL_62;
        }
      }
      else if (v10 == @"kRTPreFilterLocationsRateThreshold" {
             && a5 - 13 <= 0x3A
      }
             && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
      {
        id v11 = 0;
        double v12 = 0.85;
LABEL_62:

        goto LABEL_63;
      }
      long long v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      uint64_t v18 = [NSString stringWithFormat:@"invalid constant string, %@", v10];
      uint64_t v25 = v18;
      long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v11 = [v19 errorWithDomain:v20 code:7 userInfo:v21];
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"invalid workout activity type";
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      id v11 = [v16 errorWithDomain:v17 code:7 userInfo:v18];
    }

    if (a6)
    {
      id v11 = v11;
      *a6 = v11;
    }
    double v12 = 1.79769313e308;
    goto LABEL_62;
  }
  id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: constantString", buf, 2u);
  }

  if (a6)
  {
    __int16 v14 = @"constantString";
LABEL_25:
    _RTErrorInvalidParameterCreate((uint64_t)v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_26:
  double v12 = 1.79769313e308;
LABEL_63:

  return v12;
}

- (id)_getConstantValueForDistanceThresholdUsingDistanceMetric:(int64_t)a3 isDecimated:(BOOL)a4 workoutActivityType:(unint64_t)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    switch(a3)
    {
      case 3:
        -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTClusteringDTWDistanceEuclideanThreshold", a4);
        double v9 = v12;
        break;
      case 2:
        -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTClusteringDTWDistanceFirstNormThreshold", a4);
        double v9 = v13;
        break;
      case 1:
        -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", @"kRTClusteringCentroidDistanceThreshold", a4);
        double v9 = v8;
        break;
      default:
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F5CFE8];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        uint64_t v17 = [NSString stringWithFormat:@"invalid distance metric", a4];
        v31[0] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        id v14 = [v15 errorWithDomain:v16 code:7 userInfo:v18];

        double v9 = 1.79769313e308;
        if (!a6) {
          goto LABEL_19;
        }
        goto LABEL_15;
    }
    id v14 = 0;
    if (!a6) {
      goto LABEL_19;
    }
LABEL_15:
    if (v14)
    {
      long long v19 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v21 = (objc_class *)objc_opt_class();
        long long v22 = NSStringFromClass(v21);
        uint64_t v23 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v25 = v22;
        __int16 v26 = 2112;
        double v27 = v23;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v11 = 0;
      *a6 = v14;
      goto LABEL_20;
    }
LABEL_19:
    id v11 = [NSNumber numberWithDouble:v9];
LABEL_20:

    goto LABEL_21;
  }
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutActivityType", buf, 2u);
  }

  if (a6)
  {
    _RTErrorInvalidParameterCreate(@"workoutActivityType");
    id v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)_colorFromHexString:(id)a3
{
  int v6 = 0;
  id v3 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  [v3 setScanLocation:0];
  [v3 scanHexInt:&v6];
  id v4 = [MEMORY[0x1E4F428B8] colorWithRed:(double)BYTE2(v6) / 255.0 green:(double)BYTE1(v6) / 255.0 blue:(double)v6 / 255.0 alpha:1.0];

  return v4;
}

- (BOOL)_validateWorkout:(id)a3 otherWorkout:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 workoutActivityType];
  if (v9 != [v8 workoutActivityType])
  {
    double v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      double v13 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v7 workoutActivityType]);
      id v14 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v8 workoutActivityType]);
      *(_DWORD *)buf = 138412546;
      long long v34 = v13;
      __int16 v35 = 2112;
      long long v36 = v14;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "workout workoutActivityType, %@, otherWorkout workoutActivityType, %@", buf, 0x16u);
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v17 = NSString;
    uint64_t v18 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v7 workoutActivityType]);
    long long v19 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v8 workoutActivityType]);
    uint64_t v20 = [v17 stringWithFormat:@"workout activity type mismatch, workout workoutActivityType, %@, otherWorkout workoutActivityType, %@", v18, v19];
    long long v32 = v20;
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v10 = [v15 errorWithDomain:v16 code:7 userInfo:v21];

    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (!+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", [v7 workoutActivityType])|| !+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", objc_msgSend(v8, "workoutActivityType")))
  {
    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v7 workoutActivityType]);
      uint64_t v24 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v8 workoutActivityType]);
      *(_DWORD *)buf = 138412546;
      long long v34 = v23;
      __int16 v35 = 2112;
      long long v36 = v24;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "workout workoutActivityType, %@, otherWorkout workoutActivityType, %@", buf, 0x16u);
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v30 = @"workout activity type not permitted";
    double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v10 = [v25 errorWithDomain:v26 code:7 userInfo:v27];

    if (!a5)
    {
LABEL_12:
      BOOL v11 = 0;
      goto LABEL_13;
    }
LABEL_8:
    id v10 = v10;
    BOOL v11 = 0;
    *a5 = v10;
    goto LABEL_13;
  }
  id v10 = 0;
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)isSchedulerTriggered
{
  return self->_isSchedulerTriggered;
}

- (void)setIsSchedulerTriggered:(BOOL)a3
{
  self->_isSchedulerTriggered = a3;
}

- (NSDate)lastTimeRouteLabelFailed
{
  return self->_lastTimeRouteLabelFailed;
}

- (void)setLastTimeRouteLabelFailed:(id)a3
{
}

- (int64_t)distanceMetric
{
  return self->_distanceMetric;
}

- (void)setDistanceMetric:(int64_t)a3
{
  self->_distanceMetric = a3;
}

- (NSMutableDictionary)processWorkoutMetrics
{
  return self->_processWorkoutMetrics;
}

- (void)setProcessWorkoutMetrics:(id)a3
{
}

- (NSMutableDictionary)workoutActivityTypeToclustersSet
{
  return self->_workoutActivityTypeToclustersSet;
}

- (void)setWorkoutActivityTypeToclustersSet:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (RTWorkoutDistanceStore)workoutDistanceStore
{
  return self->_workoutDistanceStore;
}

- (void)setWorkoutDistanceStore:(id)a3
{
}

- (RTWorkoutMetricsManager)workoutMetricsManager
{
  return self->_workoutMetricsManager;
}

- (void)setWorkoutMetricsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutMetricsManager, 0);
  objc_storeStrong((id *)&self->_workoutDistanceStore, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_workoutActivityTypeToclustersSet, 0);
  objc_storeStrong((id *)&self->_processWorkoutMetrics, 0);

  objc_storeStrong((id *)&self->_lastTimeRouteLabelFailed, 0);
}

@end