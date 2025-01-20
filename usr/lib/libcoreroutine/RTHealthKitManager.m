@interface RTHealthKitManager
+ (BOOL)isFakeRunningUpdate:(id)a3;
+ (BOOL)isPermittedWorkoutActivityType:(unint64_t)a3;
+ (id)stringFromDate:(id)a3 dateFormat:(id)a4;
+ (id)stringFromHealthKitDecimationLevel:(unint64_t)a3;
+ (id)stringFromRTHealthKitWorkoutActivityType:(int64_t)a3;
+ (id)stringFromRTWorkoutEndReminderAlertDismissedReason:(unint64_t)a3;
+ (id)stringFromTimeInterval:(double)a3;
+ (id)stringFromWorkoutActivityType:(unint64_t)a3;
+ (id)workoutSessionStateToString:(unint64_t)a3;
+ (int64_t)RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:(unint64_t)a3;
+ (unint64_t)HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:(int64_t)a3;
+ (unint64_t)RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:(int64_t)a3;
- (BOOL)_createWorkoutClusterWithWorkoutUUIDs:(id)a3 bestWorkoutUUID:(id)a4 lastWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8 error:(id *)a9;
- (BOOL)_deleteWorkoutCluster:(id)a3 error:(id *)a4;
- (BOOL)_doesWorkoutHaveSubsetRoute:(id)a3;
- (BOOL)_dumpHealthKitMetaData:(id)a3 dir:(id)a4 stats:(id)a5 error:(id *)a6;
- (BOOL)_dumpWorkoutClusterAtDir:(id)a3 stats:(id)a4 error:(id *)a5;
- (BOOL)_dumpWorkoutLocationsUsingData:(id)a3 dir:(id)a4 stats:(id)a5 error:(id *)a6;
- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4;
- (BOOL)_isWorkoutFiltered:(id)a3 currentLocation:(id)a4 distanceThreshold:(double)a5 error:(id *)a6;
- (BOOL)_saveEntireHealthKitDataToURL:(id)a3 outAbsoluteURL:(id *)a4 includeWorkoutData:(BOOL)a5 includeLocations:(BOOL)a6 includeOdometerReadings:(BOOL)a7 odometerSamplingIntervalComponents:(id)a8 includeClustersData:(BOOL)a9 error:(id *)a10;
- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 newBestWorkoutUUID:(id)a4 newLastWorkoutUUID:(id)a5 newRelevance:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9;
- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 workoutRouteLabel:(id)a4 error:(id *)a5;
- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 workoutRouteSnapshot:(id)a4 error:(id *)a5;
- (BOOL)_writeLocations:(id)a3 csvFileURL:(id)a4 error:(id *)a5;
- (BOOL)_writeToFileAtURL:(id)a3 contentString:(id)a4 error:(id *)a5;
- (BOOL)_writeToJSONAtURL:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)createWorkoutClusterWithWorkoutUUIDs:(id)a3 bestWorkoutUUID:(id)a4 lastWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8 error:(id *)a9;
- (BOOL)currentWorkoutIsFirstPartyWorkout;
- (BOOL)deleteWorkoutCluster:(id)a3 error:(id *)a4;
- (BOOL)isWorkoutActivityType:(unint64_t)a3 inTypes:(id)a4;
- (BOOL)listenForNewWorkoutsForRaceRouteEnabled;
- (BOOL)listenForNewWorkoutsForSMSuggestionsEnabled;
- (BOOL)listenForWorkoutOngoingChangedEnabled;
- (BOOL)listenForWorkoutSnapshotUpdatesEnabled;
- (BOOL)receivedInitialNewWorkoutsQueryResponse;
- (BOOL)saveEntireHealthKitDataToURL:(id)a3 outAbsoluteURL:(id *)a4 includeWorkoutData:(BOOL)a5 includeLocations:(BOOL)a6 includeOdometerReadings:(BOOL)a7 odometerSamplingIntervalComponents:(id)a8 includeClustersData:(BOOL)a9 error:(id *)a10;
- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newBestWorkoutUUID:(id)a4 newLastWorkoutUUID:(id)a5 newRelevance:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9;
- (BOOL)updateWorkoutClusterWithUUID:(id)a3 workoutRouteLabel:(id)a4 error:(id *)a5;
- (BOOL)updateWorkoutClusterWithUUID:(id)a3 workoutRouteSnapshot:(id)a4 error:(id *)a5;
- (HKHealthStore)healthStore;
- (HKMedicalIDStore)medicalIDStore;
- (HKObserverQuery)theNewWorkoutsForRaceRouteQuery;
- (HKObserverQuery)theNewWorkoutsForSMSuggestionsQuery;
- (HKWorkoutClusterStore)workoutClusterStore;
- (NSDate)mostRecentWorkoutStartDate;
- (NSUUID)currentWorkoutSessionIdentifier;
- (RTContactsManager)contactsManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTHealthKitManager)initWithContactsManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 healthKitStore:(id)a6 platform:(id)a7 workoutClusterStore:(id)a8;
- (RTHealthKitManager)initWithContactsManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 platform:(id)a6;
- (RTPlatform)platform;
- (_HKWorkoutObserver)workoutObserver;
- (double)_getDurationForWorkout:(id)a3;
- (id)_convertHealthKitDataToJSONCompatibleType:(id)a3 stats:(id)a4;
- (id)_getEndDateForWorkout:(id)a3;
- (id)_getHealthKitDataWithStartDate:(id)a3 limit:(int64_t)a4 includeLocations:(BOOL)a5 includeOdometerReadings:(BOOL)a6 odometerSamplingIntervalComponents:(id)a7 error:(id *)a8;
- (id)_getLatestWorkoutDateIntervalWithStartDate:(id)a3 error:(id *)a4;
- (id)_getLatestWorkoutWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 workoutTypes:(id)a8 error:(id *)a9;
- (id)_getOdometerReadingUsingWorkout:(id)a3 samplingIntervalComponents:(id)a4 error:(id *)a5;
- (id)_getPredicatesFromRTWorkoutDefaultTypes:(id)a3;
- (id)_getRTContactsFromHKEmergencyContacts:(id)a3 error:(id *)a4;
- (id)_getRTWorkoutDefaultTypesForRaceRoute;
- (id)_getRTWorkoutDefaultTypesForSMSuggestions;
- (id)_getStartDateForWorkout:(id)a3;
- (id)_getTotalDistanceForWorkout:(id)a3;
- (id)_getWorkoutAllTypes;
- (id)_getWorkoutDefaultEndDateForRaceRoute;
- (id)_getWorkoutDefaultStartDateForRaceRoute;
- (id)_getWorkoutRouteUsingWorkout:(id)a3 error:(id *)a4;
- (id)_getWorkoutsWithStartDate:(id)a3 limit:(int64_t)a4 sortDescriptors:(id)a5 nearLocation:(id)a6 distanceThreshold:(double)a7 onlySourcedFromFitnessApp:(BOOL)a8 includePastureModeRoutes:(BOOL)a9 workoutTypes:(id)a10 error:(id *)a11;
- (id)_getWorkoutsWithUUIDs:(id)a3 error:(id *)a4;
- (id)errorFunction;
- (id)getHealthKitDataWithStartDate:(id)a3 limit:(int64_t)a4 includeLocations:(BOOL)a5 includeOdometerReadings:(BOOL)a6 odometerSamplingIntervalComponents:(id)a7 error:(id *)a8;
- (id)getLatestWorkoutDateIntervalWithStartDate:(id)a3 error:(id *)a4;
- (id)getLatestWorkoutWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 workoutTypes:(id)a8 error:(id *)a9;
- (id)getOdometerReadingUsingWorkout:(id)a3 samplingIntervalComponents:(id)a4 error:(id *)a5;
- (id)getWorkoutDefaultSortDescriptors;
- (id)getWorkoutRouteUsingWorkout:(id)a3 error:(id *)a4;
- (id)getWorkoutsWithStartDate:(id)a3 limit:(int64_t)a4 sortDescriptors:(id)a5 nearLocation:(id)a6 distanceThreshold:(double)a7 onlySourcedFromFitnessApp:(BOOL)a8 includePastureModeRoutes:(BOOL)a9 workoutTypes:(id)a10 error:(id *)a11;
- (id)getWorkoutsWithUUIDs:(id)a3 error:(id *)a4;
- (int64_t)_getWorkoutsCountWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 error:(id *)a8;
- (int64_t)getWorkoutsCountWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 error:(id *)a8;
- (unint64_t)_getDecimationSkipAheadFactorForDuration:(double)a3;
- (unint64_t)workoutMinDistance;
- (unint64_t)workoutMinDistanceCycling;
- (void)_createNewWorkoutClusterStore;
- (void)_decimateLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 totalDuration:(double)a5 decimationLevel:(unint64_t)a6 handler:(id)a7;
- (void)_fetchCurrentWorkoutSnapshotWithHandler:(id)a3;
- (void)_fetchEmergencyContactsWithHandler:(id)a3;
- (void)_fetchWorkoutClusterContainingWorkoutUUID:(id)a3 handler:(id)a4;
- (void)_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:(id)a3 handler:(id)a4;
- (void)_fetchWorkoutClustersWithHandler:(id)a3;
- (void)_fetchWorkoutRouteLocationsUsingWorkoutRoute:(id)a3 batchSize:(unint64_t)a4 fetchOnlyFirstFew:(BOOL)a5 handler:(id)a6;
- (void)_fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 handler:(id)a4;
- (void)_fetchWorkoutUUIDsForClusterUUID:(id)a3 handler:(id)a4;
- (void)_generateRaceRouteClustersWithLimit:(unint64_t)a3 handler:(id)a4;
- (void)_getRouteLocationsUsingWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(unint64_t)a5 shift:(BOOL)a6 handler:(id)a7;
- (void)_listenForNewWorkoutsForRaceRoute;
- (void)_onNewWorkoutForRaceRouteNotification;
- (void)_onNewWorkoutForSMSuggestionsNotification;
- (void)_onWorkoutOngoingChangedNotification:(id)a3;
- (void)_onWorkoutSnapshotUpdateNotification:(id)a3;
- (void)_postWorkoutOngoingChangedNotificationIfNecessary:(BOOL)a3;
- (void)_setup;
- (void)_setupEvalMode;
- (void)_shiftLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)_updateHealthKitStartDatesUsingData:(id)a3 currentStartDate:(id *)a4 nextStartDate:(id *)a5;
- (void)_updateWorkoutStateWithSnapshot:(id)a3;
- (void)createNewWorkoutClusterStore;
- (void)didUpdateWorkoutSnapshot:(id)a3;
- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3;
- (void)fetchEmergencyContactsWithHandler:(id)a3;
- (void)fetchMostRecentWorkoutActivityTypeWithHandler:(id)a3;
- (void)fetchMostRecentWorkoutLocationTypeWithHandler:(id)a3;
- (void)fetchRouteLocationsUsingWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(unint64_t)a5 shift:(BOOL)a6 handler:(id)a7;
- (void)fetchWorkoutClusterContainingWorkoutUUID:(id)a3 handler:(id)a4;
- (void)fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:(id)a3 handler:(id)a4;
- (void)fetchWorkoutClustersWithHandler:(id)a3;
- (void)fetchWorkoutRouteLocationsUsingWorkoutRoute:(id)a3 batchSize:(unint64_t)a4 fetchOnlyFirstFew:(BOOL)a5 handler:(id)a6;
- (void)fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 handler:(id)a4;
- (void)fetchWorkoutUUIDsForClusterUUID:(id)a3 handler:(id)a4;
- (void)generateRaceRouteClustersWithLimit:(unint64_t)a3 handler:(id)a4;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onNewWorkoutForRaceRouteNotification;
- (void)onNewWorkoutForSMSuggestionsNotification;
- (void)onWorkoutOngoingChangedNotification:(id)a3;
- (void)onWorkoutSnapshotUpdateNotification:(id)a3;
- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setContactsManager:(id)a3;
- (void)setCurrentWorkoutIsFirstPartyWorkout:(BOOL)a3;
- (void)setCurrentWorkoutSessionIdentifier:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setErrorFunction:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setListenForNewWorkoutsForRaceRouteEnabled:(BOOL)a3;
- (void)setListenForNewWorkoutsForSMSuggestionsEnabled:(BOOL)a3;
- (void)setListenForWorkoutOngoingChangedEnabled:(BOOL)a3;
- (void)setListenForWorkoutSnapshotUpdatesEnabled:(BOOL)a3;
- (void)setMedicalIDStore:(id)a3;
- (void)setMostRecentWorkoutStartDate:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setReceivedInitialNewWorkoutsQueryResponse:(BOOL)a3;
- (void)setTheNewWorkoutsForRaceRouteQuery:(id)a3;
- (void)setTheNewWorkoutsForSMSuggestionsQuery:(id)a3;
- (void)setWorkoutClusterStore:(id)a3;
- (void)setWorkoutMinDistance:(unint64_t)a3;
- (void)setWorkoutMinDistanceCycling:(unint64_t)a3;
- (void)setWorkoutObserver:(id)a3;
@end

@implementation RTHealthKitManager

+ (id)stringFromRTHealthKitWorkoutActivityType:(int64_t)a3
{
  if (a3 <= 36)
  {
    if (a3 == 13) {
      return @"Cycling";
    }
    if (a3 == 24) {
      return @"Hiking";
    }
  }
  else
  {
    switch(a3)
    {
      case 'G':
        return @"Wheelchair Run";
      case '4':
        return @"Walking";
      case '%':
        return @"Running";
    }
  }
  return @"Unknown";
}

+ (id)stringFromRTWorkoutEndReminderAlertDismissedReason:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E6B9BEA0[a3 - 1];
  }
}

+ (id)workoutSessionStateToString:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"RTHealthKitWorkoutSessionStateUnknown";
  }
  else {
    return off_1E6B9BEC8[a3 - 1];
  }
}

- (RTHealthKitManager)initWithContactsManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 platform:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v10)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v25 = 0;
    v19 = "Invalid parameter not satisfying: contactsManager";
    v20 = (uint8_t *)&v25;
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_15;
  }
  if (!v11)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v24 = 0;
    v19 = "Invalid parameter not satisfying: defaultsManager";
    v20 = (uint8_t *)&v24;
    goto LABEL_14;
  }
  if (!v12)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v23 = 0;
    v19 = "Invalid parameter not satisfying: distanceCalculator";
    v20 = (uint8_t *)&v23;
    goto LABEL_14;
  }
  if (!v13)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = 0;
      v19 = "Invalid parameter not satisfying: platform";
      v20 = (uint8_t *)&v22;
      goto LABEL_14;
    }
LABEL_15:

    v17 = 0;
    goto LABEL_16;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F2B758]) initWithHealthStore:v15];
  self = [(RTHealthKitManager *)self initWithContactsManager:v10 defaultsManager:v11 distanceCalculator:v12 healthKitStore:v15 platform:v14 workoutClusterStore:v16];

  v17 = self;
LABEL_16:

  return v17;
}

- (RTHealthKitManager)initWithContactsManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 healthKitStore:(id)a6 platform:(id)a7 workoutClusterStore:(id)a8
{
  id v34 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v35 = a7;
  id v18 = a8;
  if (!v15)
  {
    v28 = v18;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: defaultsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v28 = v18;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v17)
  {
    v28 = v18;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: healthStore";
    goto LABEL_17;
  }
  if (!v35)
  {
    v28 = v18;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: platform";
      goto LABEL_17;
    }
LABEL_18:

    v26 = 0;
    v27 = v34;
    goto LABEL_19;
  }
  id v33 = v18;
  if (v18)
  {
    v36.receiver = self;
    v36.super_class = (Class)RTHealthKitManager;
    v19 = [(RTNotifier *)&v36 init];
    if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F5CE08] createErrorFunctionWithPerpendicularDistance];
      id errorFunction = v19->_errorFunction;
      v19->_id errorFunction = (id)v20;

      objc_storeStrong((id *)&v19->_contactsManager, a3);
      objc_storeStrong((id *)&v19->_defaultsManager, a4);
      objc_storeStrong((id *)&v19->_distanceCalculator, a5);
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F2B9A0]) initWithHealthStore:v17];
      workoutObserver = v19->_workoutObserver;
      v19->_workoutObserver = (_HKWorkoutObserver *)v22;

      [(_HKWorkoutObserver *)v19->_workoutObserver setDelegate:v19];
      objc_storeStrong((id *)&v19->_healthStore, a6);
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F2B190]) initWithHealthStore:v17];
      medicalIDStore = v19->_medicalIDStore;
      v19->_medicalIDStore = (HKMedicalIDStore *)v24;

      objc_storeStrong((id *)&v19->_platform, a7);
      objc_storeStrong((id *)&v19->_workoutClusterStore, a8);
      v19->_listenForNewWorkoutsForRaceRouteEnabled = 0;
      v19->_listenForNewWorkoutsForSMSuggestionsEnabled = 0;
      v19->_listenForWorkoutSnapshotUpdatesEnabled = 0;
      v19->_listenForWorkoutOngoingChangedEnabled = 0;
      [(RTService *)v19 setup];
    }
    self = v19;
    v26 = self;
    v27 = v34;
  }
  else
  {
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = v34;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutClusterStore", buf, 2u);
    }

    v26 = 0;
  }
  v28 = v33;
LABEL_19:

  return v26;
}

- (void)_setup
{
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    objc_initWeak(&location, self);
    int out_token = 0;
    v3 = (const char *)[@"RTHealthKitManagerObservedNewWorkoutForRaceRoute" UTF8String];
    v4 = [(RTNotifier *)self queue];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __28__RTHealthKitManager__setup__block_invoke;
    handler[3] = &unk_1E6B954B0;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v3, &out_token, v4, handler);

    v5 = (const char *)[@"RTHealthKitManagerObservedNewWorkoutForSMSuggestions" UTF8String];
    v6 = [(RTNotifier *)self queue];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __28__RTHealthKitManager__setup__block_invoke_592;
    id v18 = &unk_1E6B954B0;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch(v5, &out_token, v6, &v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  v7 = [(RTHealthKitManager *)self defaultsManager];
  v8 = [v7 objectForKey:@"RTDefaultsWorkoutMinDistance"];

  if (v8)
  {
    v9 = [(RTHealthKitManager *)self defaultsManager];
    id v10 = [v9 objectForKey:@"RTDefaultsWorkoutMinDistance"];
    self->_workoutMinDistance = [v10 unsignedIntegerValue];
  }
  else
  {
    self->_workoutMinDistance = 1000;
  }
  id v11 = [(RTHealthKitManager *)self defaultsManager];
  id v12 = [v11 objectForKey:@"RTDefaultsWorkoutMinDistanceCycling"];

  if (v12)
  {
    id v13 = [(RTHealthKitManager *)self defaultsManager];
    v14 = [v13 objectForKey:@"RTDefaultsWorkoutMinDistanceCycling"];
    self->_workoutMinDistanceCycling = [v14 unsignedIntegerValue];
  }
  else
  {
    self->_workoutMinDistanceCycling = 5000;
  }
  [(RTHealthKitManager *)self _setupEvalMode];
}

void __28__RTHealthKitManager__setup__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onNewWorkoutForRaceRouteNotification];

  v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    v4 = @"RTHealthKitManagerObservedNewWorkoutForRaceRoute";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Registering for %@", (uint8_t *)&v3, 0xCu);
  }
}

void __28__RTHealthKitManager__setup__block_invoke_592(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onNewWorkoutForSMSuggestionsNotification];

  v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    v4 = @"RTHealthKitManagerObservedNewWorkoutForSMSuggestions";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Registering for %@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  healthStore = self->_healthStore;
  theNewWorkoutsForRaceRouteQuery = self->_theNewWorkoutsForRaceRouteQuery;
  v6 = (void (**)(id, void))a3;
  [(HKHealthStore *)healthStore stopQuery:theNewWorkoutsForRaceRouteQuery];
  [(HKHealthStore *)self->_healthStore stopQuery:self->_theNewWorkoutsForSMSuggestionsQuery];
  v6[2](v6, 0);
}

+ (id)stringFromWorkoutActivityType:(unint64_t)a3
{
  int v3 = @"WheelChairRunPace";
  v4 = @"Unknown";
  if (a3 == 37) {
    v4 = @"Running";
  }
  if (a3 != 71) {
    int v3 = v4;
  }
  if (a3 == 13) {
    return @"Cycling";
  }
  else {
    return v3;
  }
}

+ (id)stringFromHealthKitDecimationLevel:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B9BEF8[a3 - 1];
  }
}

+ (id)stringFromTimeInterval:(double)a3
{
  if (qword_1EBE388F0 != -1) {
    dispatch_once(&qword_1EBE388F0, &__block_literal_global_113);
  }
  v4 = (void *)_MergedGlobals_1_0;

  return (id)[v4 stringFromTimeInterval:a3];
}

uint64_t __45__RTHealthKitManager_stringFromTimeInterval___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = v0;

  [(id)_MergedGlobals_1_0 setAllowedUnits:224];
  v2 = (void *)_MergedGlobals_1_0;

  return [v2 setZeroFormattingBehavior:0x10000];
}

+ (id)stringFromDate:(id)a3 dateFormat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1EBE38908 != -1) {
    dispatch_once(&qword_1EBE38908, &__block_literal_global_614);
  }
  int v7 = [v6 isEqualToString:@"yyyy-MM-dd HH:mm:ss.SSS"];
  uint64_t v8 = 2;
  if (v7) {
    uint64_t v8 = 3;
  }
  id v9 = (id)_MergedGlobals_1_0[v8];
  id v10 = [v9 stringFromDate:v5];

  return v10;
}

uint64_t __48__RTHealthKitManager_stringFromDate_dateFormat___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EBE388F8;
  qword_1EBE388F8 = v0;

  v2 = (void *)qword_1EBE388F8;
  int v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v2 setTimeZone:v3];

  [(id)qword_1EBE388F8 setDateFormat:@"yyyy-MM-dd-HH-mm-ss-SSS"];
  uint64_t v4 = objc_opt_new();
  id v5 = (void *)qword_1EBE38900;
  qword_1EBE38900 = v4;

  id v6 = (void *)qword_1EBE38900;
  int v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v6 setTimeZone:v7];

  uint64_t v8 = (void *)qword_1EBE38900;

  return [v8 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

+ (BOOL)isPermittedWorkoutActivityType:(unint64_t)a3
{
  return (a3 - 13 < 0x3B) & (0x400000001000001uLL >> (a3 - 13));
}

+ (int64_t)RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:(unint64_t)a3
{
  if (a3 - 13 > 0x3A || ((1 << (a3 - 13)) & 0x400008001000001) == 0) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (unint64_t)RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (unint64_t)HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 13) > 0x3A || ((1 << (a3 - 13)) & 0x400008001000801) == 0) {
    return 3000;
  }
  else {
    return a3;
  }
}

- (void)createNewWorkoutClusterStore
{
  int v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTHealthKitManager_createNewWorkoutClusterStore__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__RTHealthKitManager_createNewWorkoutClusterStore__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createNewWorkoutClusterStore];
}

- (void)_createNewWorkoutClusterStore
{
  int v3 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "Creating new HKWorkoutClusterStore", v7, 2u);
  }

  [(RTHealthKitManager *)self setWorkoutClusterStore:0];
  id v4 = objc_alloc(MEMORY[0x1E4F2B758]);
  id v5 = [(RTHealthKitManager *)self healthStore];
  id v6 = (void *)[v4 initWithHealthStore:v5];
  [(RTHealthKitManager *)self setWorkoutClusterStore:v6];
}

+ (BOOL)isFakeRunningUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 internalState] - 10;
  if (v5 <= 2)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(a2);
      id v10 = [v4 sessionIdentifier];
      int v12 = 138412802;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, ignore fake WorkoutSessionRunning Update for workout with UUID, %@", (uint8_t *)&v12, 0x20u);
    }
  }

  return v5 < 3;
}

- (void)didUpdateWorkoutSnapshot:(id)a3
{
  id v5 = a3;
  id v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTHealthKitManager_didUpdateWorkoutSnapshot___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __47__RTHealthKitManager_didUpdateWorkoutSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v38 = (objc_class *)objc_opt_class();
    v1 = NSStringFromClass(v38);
    v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v39 = [*(id *)(a1 + 40) configuration];
    int v40 = [v39 activityType];
    v41 = [*(id *)(a1 + 40) configuration];
    int v42 = [v41 locationType];
    int v43 = [*(id *)(a1 + 40) sessionState];
    *(_DWORD *)buf = 138413314;
    v45 = v1;
    __int16 v46 = 2112;
    v47 = v2;
    __int16 v48 = 1024;
    *(_DWORD *)v49 = v40;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v42;
    __int16 v50 = 1024;
    int v51 = v43;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, incoming workout snapshot, activityType, %d, locationType, %d, sessionState, %d", buf, 0x28u);
  }
  if ([*(id *)(a1 + 40) sessionState] == 2)
  {
    if (([(id)objc_opt_class() isFakeRunningUpdate:*(void *)(a1 + 40)] & 1) == 0)
    {
      id v5 = [*(id *)(a1 + 32) currentWorkoutSessionIdentifier];
      if (!v5
        || ([*(id *)(a1 + 32) currentWorkoutSessionIdentifier],
            v1 = objc_claimAutoreleasedReturnValue(),
            [*(id *)(a1 + 40) sessionIdentifier],
            v2 = objc_claimAutoreleasedReturnValue(),
            ![v1 isEqual:v2]))
      {
        id v6 = *(void **)(a1 + 32);
        id v7 = [*(id *)(a1 + 40) configuration];
        uint64_t v8 = [v7 activityType];
        id v9 = [*(id *)(a1 + 32) _getRTWorkoutDefaultTypesForSMSuggestions];
        int v10 = [v6 isWorkoutActivityType:v8 inTypes:v9];

        if (v5)
        {

          if ((v10 & 1) == 0) {
            goto LABEL_15;
          }
        }
        else if (!v10)
        {
          goto LABEL_15;
        }
        id v11 = [*(id *)(a1 + 40) sessionIdentifier];
        [*(id *)(a1 + 32) setCurrentWorkoutSessionIdentifier:v11];

        [*(id *)(a1 + 32) setCurrentWorkoutIsFirstPartyWorkout:[*(id *)(a1 + 40) isFirstPartyWorkout]];
        int v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = (objc_class *)objc_opt_class();
          __int16 v14 = NSStringFromClass(v13);
          uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
          __int16 v16 = [*(id *)(a1 + 40) sessionIdentifier];
          *(_DWORD *)buf = 138412802;
          v45 = v14;
          __int16 v46 = 2112;
          v47 = v15;
          __int16 v48 = 2112;
          *(void *)v49 = v16;
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, new workout started with uuid, %@", buf, 0x20u);
        }
        [*(id *)(a1 + 32) onNewWorkoutForSMSuggestionsNotification];
        goto LABEL_15;
      }
    }
LABEL_15:
    id v17 = [*(id *)(a1 + 40) configuration];
    uint64_t v18 = [v17 locationType];

    id v19 = [*(id *)(a1 + 32) defaultsManager];
    uint64_t v20 = [NSNumber numberWithInteger:v18];
    [v19 setObject:v20 forKey:@"RTDefaultsMostRecentWorkoutLocationType"];

    id v21 = [*(id *)(a1 + 40) configuration];
    uint64_t v22 = [v21 activityType];

    __int16 v23 = [*(id *)(a1 + 32) defaultsManager];
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:v22];
    [v23 setObject:v24 forKey:@"RTDefaultsMostRecentWorkoutActivityType"];
  }
  if (*(void *)(a1 + 40)
    && (__int16 v25 = [[RTCurrentWorkoutSnapshot alloc] initWithHKCurrentWorkoutSnapshot:*(void *)(a1 + 40)]) != 0)
  {
    v26 = v25;
  }
  else
  {
    v27 = [RTCurrentWorkoutSnapshot alloc];
    v28 = [*(id *)(a1 + 32) currentWorkoutSessionIdentifier];
    uint64_t v29 = [*(id *)(a1 + 32) currentWorkoutIsFirstPartyWorkout];
    v30 = [*(id *)(a1 + 40) builderStartDate];
    v31 = [*(id *)(a1 + 40) snapshotDate];
    v26 = [(RTCurrentWorkoutSnapshot *)v27 initWithSessionIdentifier:v28 activityType:0 locationType:1 swimmingLocationType:0 isFirstPartyWorkout:v29 sessionState:3 workoutStartDate:v30 snapshotDate:v31];
  }
  v32 = [[RTHealthKitManagerWorkoutSnapshotUpdateNotification alloc] initWithWorkoutSnapshot:v26];
  [*(id *)(a1 + 32) onWorkoutSnapshotUpdateNotification:v32];
  id v33 = *(void **)(a1 + 40);
  if (!v33 || [v33 sessionState] == 3)
  {
    [*(id *)(a1 + 32) setCurrentWorkoutSessionIdentifier:0];
    [*(id *)(a1 + 32) setCurrentWorkoutIsFirstPartyWorkout:0];
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = (objc_class *)objc_opt_class();
      objc_super v36 = NSStringFromClass(v35);
      v37 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      v45 = v36;
      __int16 v46 = 2112;
      v47 = v37;
      _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, %@, setting current workout session to nil", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 32) _updateWorkoutStateWithSnapshot:*(void *)(a1 + 40)];
}

- (void)_updateWorkoutStateWithSnapshot:(id)a3
{
  id v15 = a3;
  id v4 = [(RTHealthKitManager *)self defaultsManager];
  id v5 = [v4 objectForKey:@"RTDefaultsWorkoutOngoing"];
  uint64_t v6 = [v5 BOOLValue];

  if (v15)
  {
    unint64_t v7 = [v15 sessionState];
    if (v7 <= 6 && ((1 << v7) & 0x4A) != 0)
    {
      uint64_t v8 = [(RTHealthKitManager *)self defaultsManager];
      id v9 = v8;
      uint64_t v10 = MEMORY[0x1E4F1CC28];
    }
    else
    {
      uint64_t v8 = [(RTHealthKitManager *)self defaultsManager];
      id v9 = v8;
      uint64_t v10 = MEMORY[0x1E4F1CC38];
    }
    [v8 setObject:v10 forKey:@"RTDefaultsWorkoutOngoing"];

    uint64_t v13 = [objc_opt_class() RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:[v15 sessionState]];
    int v12 = [(RTHealthKitManager *)self defaultsManager];
    __int16 v14 = [NSNumber numberWithUnsignedInteger:v13];
    [v12 setObject:v14 forKey:@"RTDefaultsMostRecentWorkoutState"];
  }
  else
  {
    id v11 = [(RTHealthKitManager *)self defaultsManager];
    [v11 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsWorkoutOngoing"];

    int v12 = [(RTHealthKitManager *)self defaultsManager];
    [v12 setObject:&unk_1F34523D0 forKey:@"RTDefaultsMostRecentWorkoutState"];
  }

  [(RTHealthKitManager *)self _postWorkoutOngoingChangedNotificationIfNecessary:v6];
}

- (void)_postWorkoutOngoingChangedNotificationIfNecessary:(BOOL)a3
{
  int v3 = a3;
  id v5 = [(RTHealthKitManager *)self defaultsManager];
  uint64_t v6 = [v5 objectForKey:@"RTDefaultsWorkoutOngoing"];
  int v7 = [v6 BOOLValue];

  if (v7 != v3)
  {
    uint64_t v8 = objc_alloc_init(RTHealthKitManagerWorkoutOngoingChangedNotification);
    [(RTHealthKitManager *)self onWorkoutOngoingChangedNotification:v8];
  }
}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__RTHealthKitManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__RTHealthKitManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentWorkoutSnapshotWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__146;
  v13[4] = __Block_byref_object_dispose__146;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__146;
  v11[4] = __Block_byref_object_dispose__146;
  id v12 = 0;
  id v5 = [(RTHealthKitManager *)self workoutObserver];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v7[3] = &unk_1E6B9BAE8;
  v7[4] = self;
  id v9 = v11;
  uint64_t v10 = v13;
  id v6 = v4;
  id v8 = v6;
  [v5 currentWorkoutSnapshotWithCompletion:v7];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2;
  block[3] = &unk_1E6B9BAC0;
  uint64_t v16 = *(void *)(a1 + 56);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  int v3 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) builderStartDate];
      int v7 = 136315394;
      id v8 = "-[RTHealthKitManager _fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke_2";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, Current workout, start date: %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [[RTCurrentWorkoutSnapshot alloc] initWithHKCurrentWorkoutSnapshot:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  else
  {
    if (v4)
    {
      int v7 = 136315138;
      id v8 = "-[RTHealthKitManager _fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, Current workout snapshot is nil", (uint8_t *)&v7, 0xCu);
    }

    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setListenForNewWorkoutsForRaceRouteEnabled:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_listenForNewWorkoutsForRaceRouteEnabled != a3)
  {
    self->_listenForNewWorkoutsForRaceRouteEnabled = a3;
    BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_listenForNewWorkoutsForRaceRouteEnabled) {
        id v5 = @"YES";
      }
      else {
        id v5 = @"NO";
      }
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "listening for new workouts for Race Route enabled, %@", (uint8_t *)&v6, 0xCu);
    }

    if (self->_listenForNewWorkoutsForRaceRouteEnabled) {
      [(RTHealthKitManager *)self _listenForNewWorkoutsForRaceRoute];
    }
    else {
      [(HKHealthStore *)self->_healthStore stopQuery:self->_theNewWorkoutsForRaceRouteQuery];
    }
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [(RTNotifier *)self getNumberOfObservers:v5];
  int v7 = +[RTNotification notificationName];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(RTHealthKitManager *)self setListenForNewWorkoutsForRaceRouteEnabled:v6 != 0];
  }
  else
  {
    __int16 v9 = +[RTNotification notificationName];
    int v10 = [v5 isEqualToString:v9];

    if (v10)
    {
      [(RTHealthKitManager *)self setListenForNewWorkoutsForSMSuggestionsEnabled:v6 != 0];
    }
    else
    {
      uint64_t v11 = +[RTNotification notificationName];
      int v12 = [v5 isEqualToString:v11];

      if (v12)
      {
        [(RTHealthKitManager *)self setListenForWorkoutSnapshotUpdatesEnabled:v6 != 0];
      }
      else
      {
        id v13 = +[RTNotification notificationName];
        int v14 = [v5 isEqualToString:v13];

        if (v14)
        {
          [(RTHealthKitManager *)self setListenForWorkoutOngoingChangedEnabled:v6 != 0];
        }
        else
        {
          long long v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v16 = 138412290;
            id v17 = v5;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v16, 0xCu);
          }
        }
      }
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [(RTNotifier *)self getNumberOfObservers:v5];
  int v7 = +[RTNotification notificationName];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(RTHealthKitManager *)self setListenForNewWorkoutsForRaceRouteEnabled:v6 != 0];
  }
  else
  {
    __int16 v9 = +[RTNotification notificationName];
    int v10 = [v5 isEqualToString:v9];

    if (v10)
    {
      [(RTHealthKitManager *)self setListenForNewWorkoutsForSMSuggestionsEnabled:v6 != 0];
    }
    else
    {
      uint64_t v11 = +[RTNotification notificationName];
      int v12 = [v5 isEqualToString:v11];

      if (v12)
      {
        [(RTHealthKitManager *)self setListenForWorkoutSnapshotUpdatesEnabled:v6 != 0];
      }
      else
      {
        id v13 = +[RTNotification notificationName];
        int v14 = [v5 isEqualToString:v13];

        if (v14)
        {
          [(RTHealthKitManager *)self setListenForWorkoutOngoingChangedEnabled:v6 != 0];
        }
        else
        {
          long long v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v16 = 138412290;
            id v17 = v5;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v16, 0xCu);
          }
        }
      }
    }
  }
}

- (void)_listenForNewWorkoutsForRaceRoute
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (!self->_theNewWorkoutsForRaceRouteQuery)
  {
    int v3 = (void *)MEMORY[0x1E4F28BA0];
    BOOL v4 = [(RTHealthKitManager *)self _getRTWorkoutDefaultTypesForRaceRoute];
    id v5 = [(RTHealthKitManager *)self _getPredicatesFromRTWorkoutDefaultTypes:v4];
    unint64_t v6 = [v3 orPredicateWithSubpredicates:v5];

    int v7 = (void *)MEMORY[0x1E4F28BA0];
    v16[0] = v6;
    int v8 = [MEMORY[0x1E4F2B3C0] _predicateForObjectsFromAppleWatches];
    v16[1] = v8;
    __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    int v10 = [v7 andPredicateWithSubpredicates:v9];

    id v11 = objc_alloc(MEMORY[0x1E4F2B2C8]);
    int v12 = [MEMORY[0x1E4F2B448] workoutType];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__RTHealthKitManager__listenForNewWorkoutsForRaceRoute__block_invoke;
    v15[3] = &unk_1E6B9BB10;
    v15[4] = self;
    id v13 = (HKObserverQuery *)[v11 initWithSampleType:v12 predicate:v10 updateHandler:v15];
    theNewWorkoutsForRaceRouteQuery = self->_theNewWorkoutsForRaceRouteQuery;
    self->_theNewWorkoutsForRaceRouteQuery = v13;

    [(HKHealthStore *)self->_healthStore executeQuery:self->_theNewWorkoutsForRaceRouteQuery];
  }
}

void __55__RTHealthKitManager__listenForNewWorkoutsForRaceRoute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(void **)(a1 + 32);
  BOOL v4 = a3;
  [v3 onNewWorkoutForRaceRouteNotification];
  v4[2]();
}

- (void)onNewWorkoutForRaceRouteNotification
{
  int v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTHealthKitManager_onNewWorkoutForRaceRouteNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __58__RTHealthKitManager_onNewWorkoutForRaceRouteNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNewWorkoutForRaceRouteNotification];
}

- (void)_onNewWorkoutForRaceRouteNotification
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(RTHealthKitManager *)self receivedInitialNewWorkoutsQueryResponse])
  {
    BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      unint64_t v6 = NSStringFromClass(v5);
      int v7 = NSStringFromSelector(a2);
      int v9 = 138412546;
      int v10 = v6;
      __int16 v11 = 2112;
      int v12 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, posting New Workout Notification", (uint8_t *)&v9, 0x16u);
    }
    int v8 = objc_opt_new();
    [(RTNotifier *)self postNotification:v8];
  }
  else
  {
    [(RTHealthKitManager *)self setReceivedInitialNewWorkoutsQueryResponse:1];
  }
}

- (void)onNewWorkoutForSMSuggestionsNotification
{
  int v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTHealthKitManager_onNewWorkoutForSMSuggestionsNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __62__RTHealthKitManager_onNewWorkoutForSMSuggestionsNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNewWorkoutForSMSuggestionsNotification];
}

- (void)_onNewWorkoutForSMSuggestionsNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(RTHealthKitManager *)self listenForNewWorkoutsForSMSuggestionsEnabled];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      int v9 = NSStringFromSelector(a2);
      int v13 = 138412546;
      int v14 = v8;
      __int16 v15 = 2112;
      int v16 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, Posting New Workout Notification For SM Suggestions", (uint8_t *)&v13, 0x16u);
    }
    id v5 = objc_opt_new();
    [(RTNotifier *)self postNotification:v5];
  }
  else if (v6)
  {
    int v10 = (objc_class *)objc_opt_class();
    __int16 v11 = NSStringFromClass(v10);
    int v12 = NSStringFromSelector(a2);
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    int v16 = v12;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, No active listeners for Workout Notification For SM Suggestions. Hence skipping the notification", (uint8_t *)&v13, 0x16u);
  }
}

- (void)onWorkoutSnapshotUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTHealthKitManager_onWorkoutSnapshotUpdateNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__RTHealthKitManager_onWorkoutSnapshotUpdateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWorkoutSnapshotUpdateNotification:*(void *)(a1 + 40)];
}

- (void)_onWorkoutSnapshotUpdateNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(RTHealthKitManager *)self listenForWorkoutSnapshotUpdatesEnabled];
  int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      int v13 = "-[RTHealthKitManager _onWorkoutSnapshotUpdateNotification:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%s, Posting New Workout Snapshot Update Notification, %@", (uint8_t *)&v12, 0x16u);
    }

    [(RTNotifier *)self postNotification:v5];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      int v10 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v11 = NSStringFromSelector(a2);
      int v12 = 138412546;
      int v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, No active listeners for Workout Snapshot Update Notification. Hence skipping the notification", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)onWorkoutOngoingChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTHealthKitManager_onWorkoutOngoingChangedNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__RTHealthKitManager_onWorkoutOngoingChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWorkoutOngoingChangedNotification:*(void *)(a1 + 40)];
}

- (void)_onWorkoutOngoingChangedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(RTHealthKitManager *)self listenForWorkoutOngoingChangedEnabled];
  int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      int v13 = "-[RTHealthKitManager _onWorkoutOngoingChangedNotification:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%s, Posting WorkoutOnGoingChanged Notification, %@", (uint8_t *)&v12, 0x16u);
    }

    [(RTNotifier *)self postNotification:v5];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      int v10 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v11 = NSStringFromSelector(a2);
      int v12 = 138412546;
      int v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, No active listeners for WorkoutOnGoingChanged Notification. Hence skipping the notification", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (BOOL)_doesWorkoutHaveSubsetRoute:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 metadata];
    BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BB98]];
    if (v6)
    {
      int v7 = [v4 metadata];
      id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2BBA0]];
      if (v8)
      {
        int v9 = [v4 metadata];
        int v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2BBA8]];
        if (v10)
        {
          __int16 v11 = [v4 metadata];
          int v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2BB78]];
          if (v12)
          {
            id v21 = v11;
            int v13 = [v4 metadata];
            __int16 v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2BB80]];
            uint64_t v20 = v13;
            if (v14)
            {
              id v19 = [v4 metadata];
              id v15 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F2BB88]];
              BOOL v16 = v15 != 0;
            }
            else
            {
              BOOL v16 = 0;
            }

            __int16 v11 = v21;
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (id)_getTotalDistanceForWorkout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(RTHealthKitManager *)self _doesWorkoutHaveSubsetRoute:v4])
    {
      id v5 = [v4 metadata];
      BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BB80]];
      [v6 doubleValue];
      double v8 = v7;
      int v9 = [v4 metadata];
      int v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2BBA0]];
      [v10 doubleValue];
      double v12 = v8 - v11;

      int v13 = (void *)MEMORY[0x1E4F2B370];
      __int16 v14 = [MEMORY[0x1E4F2B618] meterUnit];
      id v15 = [v13 quantityWithUnit:v14 doubleValue:v12];
    }
    else
    {
      id v15 = [v4 totalDistance];
    }
  }
  else
  {
    BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v18, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

- (double)_getDurationForWorkout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(RTHealthKitManager *)self _doesWorkoutHaveSubsetRoute:v4])
    {
      id v5 = [v4 metadata];
      BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BB88]];
      [v6 doubleValue];
      double v8 = v7;
      int v9 = [v4 metadata];
      int v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2BBA8]];
      [v10 doubleValue];
      double v12 = v8 - v11;
    }
    else
    {
      [v4 duration];
      double v12 = v14;
    }
  }
  else
  {
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v16 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v16, 2u);
    }

    double v12 = 0.0;
  }

  return v12;
}

- (id)_getStartDateForWorkout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(RTHealthKitManager *)self _doesWorkoutHaveSubsetRoute:v4])
    {
      id v5 = [v4 metadata];
      BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BB98]];
    }
    else
    {
      BOOL v6 = [v4 startDate];
    }
  }
  else
  {
    double v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v9, 2u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (id)_getEndDateForWorkout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(RTHealthKitManager *)self _doesWorkoutHaveSubsetRoute:v4])
    {
      id v5 = [v4 metadata];
      BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BB78]];
    }
    else
    {
      BOOL v6 = [v4 endDate];
    }
  }
  else
  {
    double v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v9, 2u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (id)getWorkoutsWithStartDate:(id)a3 limit:(int64_t)a4 sortDescriptors:(id)a5 nearLocation:(id)a6 distanceThreshold:(double)a7 onlySourcedFromFitnessApp:(BOOL)a8 includePastureModeRoutes:(BOOL)a9 workoutTypes:(id)a10 error:(id *)a11
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a10;
  id v22 = v21;
  if (!v18)
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  if (!v21)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate(@"workoutTypes");
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_19:
    id v25 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_20;
  }
  if (a4 < 0)
  {
    __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThre"
                           "shold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1124;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v48 = __Block_byref_object_copy__146;
  v49 = __Block_byref_object_dispose__146;
  id v50 = 0;
  uint64_t v41 = 0;
  int v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__146;
  v45 = __Block_byref_object_dispose__146;
  id v46 = 0;
  uint64_t v24 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __170__RTHealthKitManager_getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke;
  block[3] = &unk_1E6B9BB38;
  id v35 = buf;
  void block[4] = self;
  id v31 = v18;
  int64_t v37 = a4;
  id v32 = v19;
  id v33 = v20;
  double v38 = a7;
  BOOL v39 = a8;
  BOOL v40 = a9;
  id v34 = v29;
  objc_super v36 = &v41;
  id v22 = v29;
  dispatch_sync(v24, block);

  if (a11) {
    *a11 = (id) v42[5];
  }
  id v25 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

LABEL_20:

  return v25;
}

void __170__RTHealthKitManager_getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  double v7 = *(double *)(a1 + 96);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 105);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
  id obj = *(id *)(v11 + 40);
  uint64_t v12 = [v2 _getWorkoutsWithStartDate:v3 limit:v10 sortDescriptors:v4 nearLocation:v5 distanceThreshold:v8 onlySourcedFromFitnessApp:v9 includePastureModeRoutes:v7 workoutTypes:v6 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  double v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)_getWorkoutsWithStartDate:(id)a3 limit:(int64_t)a4 sortDescriptors:(id)a5 nearLocation:(id)a6 distanceThreshold:(double)a7 onlySourcedFromFitnessApp:(BOOL)a8 includePastureModeRoutes:(BOOL)a9 workoutTypes:(id)a10 error:(id *)a11
{
  BOOL v105 = a8;
  v147[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v91 = a5;
  id v102 = a6;
  id v15 = a10;
  v88 = v14;
  v92 = v15;
  if (!v14)
  {
    v83 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v83, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_74;
  }
  if (!v15)
  {
    v85 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate(@"workoutTypes");
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_74:
    id v106 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_75;
  }
  if (![v15 count])
  {
    BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThr"
                           "eshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:]";
      __int16 v134 = 1024;
      LODWORD(v135) = 1157;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "workout types cannot be zero (in %s:%d)", buf, 0x12u);
    }
  }
  if (a4 < 0)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThr"
                           "eshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:]";
      __int16 v134 = 1024;
      LODWORD(v135) = 1158;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v91)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F29008]);
    id v19 = (void *)[v18 initWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
    v146 = v19;
    id v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
  }
  if ((unint64_t)a4 >= 0x1389)
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      __int16 v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v22;
      __int16 v134 = 2112;
      id v135 = v23;
      __int16 v136 = 2048;
      int64_t v137 = a4;
      __int16 v138 = 2048;
      uint64_t v139 = 5000;
      __int16 v140 = 2048;
      uint64_t v141 = 5000;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, limit, %lu, excedded maximum value, %lu. Reducing limit to max of %lu", buf, 0x34u);
    }
  }
  id v106 = (id)objc_opt_new();
  v100 = objc_opt_new();
  id v97 = v14;
  uint64_t v89 = *MEMORY[0x1E4F5CFE8];
  uint64_t v90 = *MEMORY[0x1E4F28568];
  uint64_t v101 = *MEMORY[0x1E4F2BC20];
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    v98 = objc_opt_new();
    if (v105)
    {
      uint64_t v24 = [MEMORY[0x1E4F2B3C0] _predicateForObjectsFromAppleWatches];
      [v98 addObject:v24];
    }
    v96 = [MEMORY[0x1E4F2B3C0] predicateForSamplesWithStartDate:v97 endDate:0 options:1];
    [v98 addObject:v96];
    if ([v92 count])
    {
      id v25 = objc_opt_new();
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v26 = v92;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v129 objects:v145 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v130;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v130 != v28) {
              objc_enumerationMutation(v26);
            }
            unint64_t v30 = +[RTHealthKitManager HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:](RTHealthKitManager, "HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:", [*(id *)(*((void *)&v129 + 1) + 8 * i) unsignedIntegerValue]);
            id v31 = [MEMORY[0x1E4F2B3C0] predicateForWorkoutsWithWorkoutActivityType:v30];
            [v25 addObject:v31];
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v129 objects:v145 count:16];
        }
        while (v27);
      }

      v95 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:2 subpredicates:v25];
    }
    else
    {
      id v32 = (void *)MEMORY[0x1E4F28BA0];
      id v25 = [(RTHealthKitManager *)self _getRTWorkoutDefaultTypesForRaceRoute];
      id v33 = [(RTHealthKitManager *)self _getPredicatesFromRTWorkoutDefaultTypes:v25];
      v95 = [v32 orPredicateWithSubpredicates:v33];
    }
    [v98 addObject:v95];
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x3032000000;
    v126 = __Block_byref_object_copy__146;
    v127 = __Block_byref_object_dispose__146;
    id v128 = 0;
    uint64_t v117 = 0;
    v118 = &v117;
    uint64_t v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__146;
    v121 = __Block_byref_object_dispose__146;
    id v122 = 0;
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    id v35 = [(RTHealthKitManager *)self workoutClusterStore];
    objc_super v36 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v98];
    int64_t v37 = a4 - [v106 count];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __171__RTHealthKitManager__getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke;
    v113[3] = &unk_1E6B905F0;
    v115 = &v123;
    v116 = &v117;
    double v38 = v34;
    v114 = v38;
    [v35 fetchWorkoutsWithPredicate:v36 limit:v37 sortDescriptors:v91 completion:v113];

    dsema = v38;
    BOOL v39 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v40 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v40)) {
      goto LABEL_35;
    }
    uint64_t v41 = [MEMORY[0x1E4F1C9C8] now];
    [v41 timeIntervalSinceDate:v39];
    double v43 = v42;
    v44 = objc_opt_new();
    v45 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    id v46 = [MEMORY[0x1E4F29060] callStackSymbols];
    v47 = [v46 filteredArrayUsingPredicate:v45];
    __int16 v48 = [v47 firstObject];

    [v44 submitToCoreAnalytics:v48 type:1 duration:v43];
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v50 = (void *)MEMORY[0x1E4F28C58];
    v147[0] = v90;
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v147 count:1];
    uint64_t v52 = [v50 errorWithDomain:v89 code:15 userInfo:v51];

    if (v52)
    {
      id v53 = v52;
    }
    else
    {
LABEL_35:
      id v53 = 0;
    }

    id v94 = v53;
    if (v94) {
      [v100 addObject:v94];
    }
    if (v118[5]) {
      [v100 addObject:];
    }
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v54 = (id)v124[5];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v109 objects:v144 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v110;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v110 != v56) {
            objc_enumerationMutation(v54);
          }
          v58 = *(void **)(*((void *)&v109 + 1) + 8 * j);
          v59 = (void *)MEMORY[0x1E016D870]();
          if (!a4 || [v106 count] != a4)
          {
            if (!v105) {
              goto LABEL_80;
            }
            v60 = [v58 sourceRevision];
            v61 = [v60 source];
            v62 = [v61 bundleIdentifier];
            BOOL v63 = [v62 rangeOfString:@"com.apple.health"] == 0x7FFFFFFFFFFFFFFFLL;

            if (!v63)
            {
LABEL_80:
              if (a9
                || ([v58 metadata],
                    v64 = objc_claimAutoreleasedReturnValue(),
                    [v64 valueForKey:v101],
                    v65 = objc_claimAutoreleasedReturnValue(),
                    char v66 = [v65 BOOLValue],
                    v65,
                    v64,
                    (v66 & 1) == 0))
              {
                v67 = (id *)(v118 + 5);
                id obj = (id)v118[5];
                BOOL v68 = [(RTHealthKitManager *)self _isWorkoutFiltered:v58 currentLocation:v102 distanceThreshold:&obj error:a7];
                objc_storeStrong(v67, obj);
                if (v118[5])
                {
                  [v100 addObject:];
                  v69 = (void *)v118[5];
                  v118[5] = 0;
                }
                else if (!v68)
                {
                  [v106 addObject:v58];
                }
              }
            }
          }
        }
        uint64_t v55 = [v54 countByEnumeratingWithState:&v109 objects:v144 count:16];
      }
      while (v55);
    }

    uint64_t v70 = [(id)v124[5] count];
    v71 = (void *)MEMORY[0x1E4F1C9C8];
    v72 = [(id)v124[5] lastObject];
    v73 = [v72 startDate];
    v74 = [v71 dateWithTimeInterval:v73 sinceDate:0.001];

    v75 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      v77 = (objc_class *)objc_opt_class();
      NSStringFromClass(v77);
      id v78 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v79 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v80 = [v106 count];
      id v81 = [v74 stringFromDate];
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v78;
      __int16 v134 = 2112;
      id v135 = v79;
      __int16 v136 = 2048;
      int64_t v137 = v80;
      __int16 v138 = 2048;
      uint64_t v139 = v70;
      __int16 v140 = 2112;
      uint64_t v141 = (uint64_t)v81;
      __int16 v142 = 2048;
      uint64_t v143 = v82;
      _os_log_debug_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_DEBUG, "%@, %@, workouts count, %lu, batchedWorkoutsCount, %lu, next startDate, %@, footprint, %.2f MB", buf, 0x3Eu);
    }
    v76 = (void *)v124[5];
    v124[5] = 0;

    _Block_object_dispose(&v117, 8);
    _Block_object_dispose(&v123, 8);

    if (!v70) {
      break;
    }
    id v97 = v74;
  }
  while ([v106 count] < (unint64_t)a4);
  if (a11)
  {
    v84 = _RTSafeArray();
    _RTMultiErrorCreate();
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_75:

  return v106;
}

void __171__RTHealthKitManager__getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isWorkoutFiltered:(id)a3 currentLocation:(id)a4 distanceThreshold:(double)a5 error:(id *)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (v11)
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__146;
    v45[4] = __Block_byref_object_dispose__146;
    id v46 = 0;
    uint64_t v13 = [(RTHealthKitManager *)self _getTotalDistanceForWorkout:v11];
    id v14 = [MEMORY[0x1E4F2B618] meterUnit];
    [v13 doubleValueForUnit:v14];
    double v16 = v15;

    [(RTHealthKitManager *)self _getDurationForWorkout:v11];
    double v18 = v17;
    if (([v11 workoutActivityType] == 37 || objc_msgSend(v11, "workoutActivityType") == 71)
      && (v16 >= (double)[(RTHealthKitManager *)self workoutMinDistance]
        ? (BOOL v19 = v18 < 60.0)
        : (BOOL v19 = 1),
          v19))
    {
      id v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [v11 UUID];
        unint64_t v25 = [(RTHealthKitManager *)self workoutMinDistance];
        *(_DWORD *)buf = 138413826;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2112;
        __int16 v48 = v24;
        __int16 v49 = 2048;
        double v50 = v16;
        __int16 v51 = 2048;
        uint64_t v52 = v25;
        __int16 v53 = 2048;
        unint64_t v54 = (unint64_t)v18;
        __int16 v55 = 2048;
        uint64_t v56 = 60;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, short workout, workout distance, %.4f, min distance threshold, %lu, workout duration, %lu, min duration threshold, %lu", buf, 0x48u);
      }
    }
    else if ([v11 workoutActivityType] == 13 {
           && (v16 < (double)[(RTHealthKitManager *)self workoutMinDistanceCycling]
    }
            || v18 < 60.0))
    {
      id v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        id v35 = [v11 UUID];
        unint64_t v36 = [(RTHealthKitManager *)self workoutMinDistanceCycling];
        *(_DWORD *)buf = 138413826;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        __int16 v48 = v35;
        __int16 v49 = 2048;
        double v50 = v16;
        __int16 v51 = 2048;
        uint64_t v52 = v36;
        __int16 v53 = 2048;
        unint64_t v54 = (unint64_t)v18;
        __int16 v55 = 2048;
        uint64_t v56 = 60;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, short workout, workout distance, %.4f, min distance threshold, %lu, workout duration, %lu, min duration threshold, %lu", buf, 0x48u);
      }
    }
    else
    {
      if (v16 <= 250000.0 && v18 <= 72000.0)
      {
        BOOL v26 = 0;
        if (v12 && a5 != 1.79769313e308)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x2020000000;
          LOBYTE(v48) = 0;
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __81__RTHealthKitManager__isWorkoutFiltered_currentLocation_distanceThreshold_error___block_invoke;
          v38[3] = &unk_1E6B9BB60;
          uint64_t v41 = v45;
          v38[4] = self;
          id v39 = v12;
          double v43 = a5;
          SEL v44 = a2;
          id v40 = v11;
          double v42 = buf;
          [(RTHealthKitManager *)self _getRouteLocationsUsingWorkout:v40 decimationLevel:3 limit:1 shift:0 handler:v38];
          BOOL v26 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

          _Block_object_dispose(buf, 8);
        }
        goto LABEL_31;
      }
      id v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        id v31 = [v11 UUID];
        *(_DWORD *)buf = 138413826;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        __int16 v48 = v31;
        __int16 v49 = 2048;
        double v50 = v16;
        __int16 v51 = 2048;
        uint64_t v52 = 250000;
        __int16 v53 = 2048;
        unint64_t v54 = (unint64_t)v18;
        __int16 v55 = 2048;
        uint64_t v56 = 72000;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, long workout, workout distance, %.4f, max distance threshold, %lu, workout duration, %lu, max duration threshold, %lu", buf, 0x48u);
      }
    }

    BOOL v26 = 1;
LABEL_31:
    _Block_object_dispose(v45, 8);

    goto LABEL_32;
  }
  uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
  }

  if (a6)
  {
    _RTErrorInvalidParameterCreate(@"workout");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v26 = 1;
LABEL_32:

  return v26;
}

void __81__RTHealthKitManager__isWorkoutFiltered_currentLocation_distanceThreshold_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E016D870]();
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  }
  else if (a3)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocationCoordinate2D:a2];
    id v11 = [*(id *)(a1 + 32) distanceCalculator];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v13 + 40);
    [v11 distanceFromLocation:v10 toLocation:v12 error:&obj];
    double v15 = v14;
    objc_storeStrong((id *)(v13 + 40), obj);

    if (v15 > *(double *)(a1 + 72))
    {
      double v16 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        double v17 = (objc_class *)objc_opt_class();
        double v18 = NSStringFromClass(v17);
        BOOL v19 = NSStringFromSelector(*(SEL *)(a1 + 80));
        id v20 = [*(id *)(a1 + 48) UUID];
        uint64_t v21 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138413314;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        BOOL v26 = v19;
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        __int16 v29 = 2048;
        double v30 = v15;
        __int16 v31 = 2048;
        uint64_t v32 = v21;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, distance to the location exceeds distance threshold, distance, %.2f, distance threshold, %.2f,", buf, 0x34u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
}

- (int64_t)getWorkoutsCountWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  if (v14)
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    *(void *)buf = 0;
    __int16 v29 = buf;
    uint64_t v30 = 0x3032000000;
    __int16 v31 = __Block_byref_object_copy__146;
    uint64_t v32 = __Block_byref_object_dispose__146;
    id v33 = 0;
    double v16 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __140__RTHealthKitManager_getWorkoutsCountWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_error___block_invoke;
    block[3] = &unk_1E6B9BB88;
    id v23 = &v34;
    void block[4] = self;
    id v21 = v14;
    double v25 = a5;
    BOOL v26 = a6;
    BOOL v27 = a7;
    id v22 = v15;
    uint64_t v24 = buf;
    dispatch_sync(v16, block);

    if (a8) {
      *a8 = *((id *)v29 + 5);
    }
    int64_t v17 = v35[3];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      int64_t v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v17 = 0;
    }
  }

  return v17;
}

void __140__RTHealthKitManager_getWorkoutsCountWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  double v5 = *(double *)(a1 + 72);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 81);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v2 _getWorkoutsCountWithStartDate:v3 nearLocation:v4 distanceThreshold:v6 onlySourcedFromFitnessApp:v7 includePastureModeRoutes:&obj error:v5];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
}

- (int64_t)_getWorkoutsCountWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 error:(id *)a8
{
  BOOL v27 = a6;
  BOOL v28 = a7;
  id v12 = a3;
  id v29 = a4;
  if (v12)
  {
    BOOL v26 = a8;
    uint64_t v13 = 0;
    int64_t v14 = 0;
    while (1)
    {
      id v15 = v13;
      double v16 = (void *)MEMORY[0x1E016D870]();
      int64_t v17 = [(RTHealthKitManager *)self getWorkoutDefaultSortDescriptors];
      double v18 = [(RTHealthKitManager *)self _getRTWorkoutDefaultTypesForRaceRoute];
      id v30 = 0;
      uint64_t v13 = [(RTHealthKitManager *)self _getWorkoutsWithStartDate:v12 limit:50 sortDescriptors:v17 nearLocation:v29 distanceThreshold:v27 onlySourcedFromFitnessApp:v28 includePastureModeRoutes:a5 workoutTypes:v18 error:&v30];
      id v19 = v30;

      if (v19) {
        break;
      }
      v14 += [v13 count];
      id v20 = (void *)MEMORY[0x1E4F1C9C8];
      id v21 = [v13 lastObject];
      id v22 = [v21 startDate];
      id v23 = [v20 dateWithTimeInterval:v22 sinceDate:0.001];

      id v12 = v23;
      if (![v13 count]) {
        goto LABEL_11;
      }
    }
    id v23 = v12;
LABEL_11:
    if (v26) {
      id *v26 = v19;
    }
  }
  else
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      int64_t v14 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v14 = 0;
    }
  }

  return v14;
}

- (id)getLatestWorkoutWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 workoutTypes:(id)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = v18;
  if (!v16)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a9)
    {
      id v23 = @"startDate";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      id v21 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    id v21 = 0;
    goto LABEL_16;
  }
  if (!v18)
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a9)
    {
      id v23 = @"workoutTypes";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(void *)buf = 0;
  double v42 = buf;
  uint64_t v43 = 0x3032000000;
  SEL v44 = __Block_byref_object_copy__146;
  v45 = __Block_byref_object_dispose__146;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  double v38 = __Block_byref_object_copy__146;
  id v39 = __Block_byref_object_dispose__146;
  id v40 = 0;
  id v20 = [(RTNotifier *)self queue];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __153__RTHealthKitManager_getLatestWorkoutWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke;
  v26[3] = &unk_1E6B9BBB0;
  id v30 = buf;
  v26[4] = self;
  id v27 = v16;
  id v28 = v17;
  double v32 = a5;
  BOOL v33 = a6;
  BOOL v34 = a7;
  id v29 = v19;
  __int16 v31 = &v35;
  dispatch_sync(v20, v26);

  if (a9) {
    *a9 = (id) v36[5];
  }
  id v21 = *((id *)v42 + 5);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:

  return v21;
}

void __153__RTHealthKitManager_getLatestWorkoutWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  double v5 = *(double *)(a1 + 80);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 89);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v2 _getLatestWorkoutWithStartDate:v3 nearLocation:v4 distanceThreshold:v6 onlySourcedFromFitnessApp:v7 includePastureModeRoutes:v8 workoutTypes:&obj error:v5];
  objc_storeStrong((id *)(v9 + 40), obj);
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)_getLatestWorkoutWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 workoutTypes:(id)a8 error:(id *)a9
{
  BOOL v49 = a7;
  BOOL v11 = a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v50 = a4;
  id v17 = a8;
  id v18 = v17;
  if (!v16)
  {
    double v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = 0;
LABEL_24:
      uint64_t v41 = 0;
      *a9 = v39;
      goto LABEL_32;
    }
    id v16 = 0;
LABEL_29:
    uint64_t v41 = 0;
    goto LABEL_32;
  }
  if (!v17)
  {
    id v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"workoutTypes");
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_29;
  }
  aSelector = a2;
  v47 = a9;
  id v19 = 0;
  id v20 = 0;
  id v48 = v17;
  while (1)
  {
    id v21 = v19;
    id v22 = (void *)MEMORY[0x1E016D870]();
    id v23 = [(RTHealthKitManager *)self getWorkoutDefaultSortDescriptors];
    id v51 = 0;
    id v19 = [(RTHealthKitManager *)self _getWorkoutsWithStartDate:v16 limit:50 sortDescriptors:v23 nearLocation:v50 distanceThreshold:v11 onlySourcedFromFitnessApp:v49 includePastureModeRoutes:a5 workoutTypes:v18 error:&v51];
    id v24 = v51;

    if (v24) {
      break;
    }
    if ([v19 count])
    {
      uint64_t v25 = [v19 lastObject];

      id v20 = (id)v25;
    }
    BOOL v26 = (void *)MEMORY[0x1E4F1C9C8];
    id v27 = [v19 lastObject];
    id v28 = [v27 startDate];
    uint64_t v29 = [v26 dateWithTimeInterval:v28 sinceDate:0.001];

    id v16 = (id)v29;
    id v18 = v48;
    if (![v19 count])
    {
      BOOL v30 = v47 != 0;
      id v16 = (id)v29;
      if (!v20) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  uint64_t v36 = v47;
  if (v47)
  {
    uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    goto LABEL_37;
  }
  BOOL v30 = 0;
  if (!v20)
  {
LABEL_9:
    __int16 v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F5CFE8];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    __int16 v53 = @"workouts count is zero";
    BOOL v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v34 = [v31 errorWithDomain:v32 code:7 userInfo:v33];

    id v24 = (id)v34;
  }
LABEL_10:
  if (v24) {
    BOOL v35 = v30;
  }
  else {
    BOOL v35 = 0;
  }
  uint64_t v36 = v47;
  if (v35)
  {
    uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    id v18 = v48;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      id v24 = v24;
      uint64_t v41 = 0;
      *uint64_t v36 = v24;
      goto LABEL_31;
    }
LABEL_37:
    uint64_t v43 = (objc_class *)objc_opt_class();
    SEL v44 = NSStringFromClass(v43);
    v45 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138412802;
    __int16 v55 = v44;
    __int16 v56 = 2112;
    uint64_t v57 = v45;
    __int16 v58 = 2112;
    id v59 = v24;
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    uint64_t v36 = v47;
    goto LABEL_27;
  }
  id v20 = v20;
  uint64_t v41 = v20;
  id v18 = v48;
LABEL_31:

LABEL_32:

  return v41;
}

- (id)getLatestWorkoutDateIntervalWithStartDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    *(void *)buf = 0;
    id v22 = buf;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__146;
    uint64_t v25 = __Block_byref_object_dispose__146;
    id v26 = 0;
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__146;
    id v19 = __Block_byref_object_dispose__146;
    id v20 = 0;
    uint64_t v7 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__RTHealthKitManager_getLatestWorkoutDateIntervalWithStartDate_error___block_invoke;
    v11[3] = &unk_1E6B9BBD8;
    uint64_t v13 = buf;
    v11[4] = self;
    id v12 = v6;
    int64_t v14 = &v15;
    dispatch_sync(v7, v11);

    if (a4) {
      *a4 = (id) v16[5];
    }
    id v8 = *((id *)v22 + 5);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

void __70__RTHealthKitManager_getLatestWorkoutDateIntervalWithStartDate_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _getLatestWorkoutDateIntervalWithStartDate:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_getLatestWorkoutDateIntervalWithStartDate:(id)a3 error:(id *)a4
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    *(void *)v64 = 0;
    v65 = v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__146;
    BOOL v68 = __Block_byref_object_dispose__146;
    id v69 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v58 = 0;
    id v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__146;
    v62 = __Block_byref_object_dispose__146;
    id v63 = 0;
    uint64_t v7 = [(RTHealthKitManager *)self workoutObserver];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __71__RTHealthKitManager__getLatestWorkoutDateIntervalWithStartDate_error___block_invoke;
    v54[3] = &unk_1E6B9BC00;
    __int16 v56 = &v58;
    uint64_t v57 = v64;
    id v8 = v6;
    __int16 v55 = v8;
    [v7 currentWorkoutSnapshotWithCompletion:v54];

    uint64_t v9 = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v11 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v9, v11)) {
      goto LABEL_7;
    }
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSinceDate:v10];
    double v14 = v13;
    uint64_t v15 = objc_opt_new();
    id v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v18 = [v17 filteredArrayUsingPredicate:v16];
    id v19 = [v18 firstObject];

    [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v21 = (void *)MEMORY[0x1E4F28C58];
    v77[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v77 count:1];
    uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

    if (v23)
    {
      id v24 = v23;

      char v25 = 0;
    }
    else
    {
LABEL_7:
      id v24 = 0;
      char v25 = 1;
    }

    id v51 = v24;
    if ((v25 & 1) == 0)
    {
      objc_storeStrong((id *)v65 + 5, v24);
      id v26 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "Current workout snapshot fetch timed out", buf, 2u);
      }
    }
    id v27 = (void *)v59[5];
    if (v27)
    {
      id v28 = [v27 builderStartDate];
      uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        BOOL v30 = [v28 stringFromDate];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "Current workout snapshot retrieved with builder start date, %@", buf, 0xCu);
      }
      if (v28)
      {
        if (a4) {
          *a4 = *((id *)v65 + 5);
        }
        id v31 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v32 = [MEMORY[0x1E4F1C9C8] date];
        BOOL v33 = (void *)[v31 initWithStartDate:v28 endDate:v32];

        goto LABEL_38;
      }
      if (a4)
      {
        id v46 = *((id *)v65 + 5);
LABEL_36:
        id v28 = 0;
        BOOL v33 = 0;
        *a4 = v46;
LABEL_38:

        _Block_object_dispose(&v58, 8);
        _Block_object_dispose(v64, 8);

        goto LABEL_39;
      }
    }
    else
    {
      BOOL v35 = [(RTHealthKitManager *)self _getWorkoutAllTypes];
      uint64_t v36 = (id *)(v65 + 40);
      id obj = (id)*((void *)v65 + 5);
      id v28 = [(RTHealthKitManager *)self _getLatestWorkoutWithStartDate:v5 nearLocation:0 distanceThreshold:0 onlySourcedFromFitnessApp:1 includePastureModeRoutes:v35 workoutTypes:&obj error:1.79769313e308];
      objc_storeStrong(v36, obj);

      if (v28)
      {
        uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v50 = [v28 startDate];
          id v38 = [v50 stringFromDate];
          id v39 = [v28 endDate];
          id v40 = [v39 stringFromDate];
          uint64_t v41 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v28 workoutActivityType]);
          uint64_t v42 = *((void *)v65 + 5);
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v38;
          __int16 v71 = 2112;
          id v72 = v40;
          __int16 v73 = 2112;
          v74 = v41;
          __int16 v75 = 2112;
          uint64_t v76 = v42;
          _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_DEFAULT, "recent workout retrieved, workout start, %@, workout end, %@, workout type, %@, error, %@", buf, 0x2Au);
        }
        if (a4) {
          *a4 = *((id *)v65 + 5);
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C18]);
        SEL v44 = [v28 startDate];
        v45 = [v28 endDate];
        BOOL v33 = (void *)[v43 initWithStartDate:v44 endDate:v45];

        goto LABEL_38;
      }
      v47 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = *((void *)v65 + 5);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_DEFAULT, "no recent workout retrieved, error, %@", buf, 0xCu);
      }

      if (a4)
      {
        id v46 = *((id *)v65 + 5);
        goto LABEL_36;
      }
    }
    id v28 = 0;
    BOOL v33 = 0;
    goto LABEL_38;
  }
  uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v64 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", v64, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"startDate");
    BOOL v33 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v33 = 0;
  }
LABEL_39:

  return v33;
}

void __71__RTHealthKitManager__getLatestWorkoutDateIntervalWithStartDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getWorkoutsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    *(void *)buf = 0;
    id v22 = buf;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__146;
    char v25 = __Block_byref_object_dispose__146;
    id v26 = 0;
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__146;
    id v19 = __Block_byref_object_dispose__146;
    id v20 = 0;
    uint64_t v7 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__RTHealthKitManager_getWorkoutsWithUUIDs_error___block_invoke;
    v11[3] = &unk_1E6B9BBD8;
    double v13 = buf;
    v11[4] = self;
    id v12 = v6;
    double v14 = &v15;
    dispatch_sync(v7, v11);

    if (a4) {
      *a4 = (id) v16[5];
    }
    id v8 = *((id *)v22 + 5);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workoutUUIDs");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = [MEMORY[0x1E4F1C978] array];
  }

  return v8;
}

void __49__RTHealthKitManager_getWorkoutsWithUUIDs_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _getWorkoutsWithUUIDs:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_getWorkoutsWithUUIDs:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v48 = a4;
    id v46 = objc_opt_new();
    SEL v44 = objc_opt_new();
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v49 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v55 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v15 = (void *)MEMORY[0x1E016D870]();
          id v16 = [MEMORY[0x1E4F2B3C0] predicateForObjectWithUUID:v14];
          [v8 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v11);
    }

    uint64_t v17 = [(RTHealthKitManager *)self workoutClusterStore];
    id v18 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v8];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __50__RTHealthKitManager__getWorkoutsWithUUIDs_error___block_invoke;
    v50[3] = &unk_1E6B9BC28;
    id v19 = v46;
    id v51 = v19;
    id v20 = v44;
    id v52 = v20;
    id v21 = v7;
    __int16 v53 = v21;
    [v17 fetchWorkoutsWithPredicate:v18 anchor:0 limit:0 completion:v50];

    id v22 = v21;
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v24 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v22, v24))
    {
      id v47 = v19;
      v45 = [MEMORY[0x1E4F1C9C8] now];
      [v45 timeIntervalSinceDate:v23];
      double v26 = v25;
      id v27 = objc_opt_new();
      id v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v30 = [v29 filteredArrayUsingPredicate:v28];
      id v31 = [v30 firstObject];

      [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
      uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      BOOL v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F5CFE8];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      BOOL v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v59 count:1];
      uint64_t v36 = [v33 errorWithDomain:v34 code:15 userInfo:v35];

      if (v36)
      {
        id v37 = v36;
      }
      else
      {
        id v37 = 0;
      }
      id v19 = v47;
      id v40 = v48;
    }
    else
    {
      id v37 = 0;
      id v40 = v48;
    }

    id v41 = v37;
    if (v41) {
      [v20 addObject:v41];
    }
    if (v40)
    {
      uint64_t v42 = _RTSafeArray();
      _RTMultiErrorCreate();
      *id v40 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v39 = v19;

    id v6 = v49;
  }
  else
  {
    id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workoutUUIDs");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v39 = [MEMORY[0x1E4F1C978] array];
  }

  return v39;
}

void __50__RTHealthKitManager__getWorkoutsWithUUIDs_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
        id v16 = (void *)MEMORY[0x1E016D870](v11);
        [*(id *)(a1 + 32) addObject:v15];
        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }

  if (v9) {
    [*(id *)(a1 + 40) addObject:v9];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F29008]);
  id v18 = (void *)[v17 initWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  dispatch_time_t v24 = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

  [*(id *)(a1 + 32) sortUsingDescriptors:v19];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_getWorkoutAllTypes
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&unk_1F34523E8, &unk_1F3452400, &unk_1F3452418, &unk_1F3452430, &unk_1F3452448, 0];

  return v2;
}

- (id)_getRTWorkoutDefaultTypesForRaceRoute
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&unk_1F34523E8, &unk_1F3452400, &unk_1F3452418, 0];

  return v2;
}

- (id)_getRTWorkoutDefaultTypesForSMSuggestions
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&unk_1F34523E8, &unk_1F3452400, &unk_1F3452430, &unk_1F3452448, 0];

  return v2;
}

- (id)_getPredicatesFromRTWorkoutDefaultTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
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
          unint64_t v10 = +[RTHealthKitManager HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:](RTHealthKitManager, "HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:", [*(id *)(*((void *)&v14 + 1) + 8 * i) unsignedIntegerValue:v14]);
          uint64_t v11 = [MEMORY[0x1E4F2B3C0] predicateForWorkoutsWithWorkoutActivityType:v10];
          [v4 addObject:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
  }

  return v4;
}

- (BOOL)isWorkoutActivityType:(unint64_t)a3 inTypes:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1E016D870](v6);
        uint64_t v12 = [v10 unsignedIntValue];
        if (v12 == a3)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (id)_getWorkoutDefaultStartDateForRaceRoute
{
  uint64_t v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [v2 dateByAddingUnit:4 value:-10 toDate:v3 options:0];

  return v4;
}

- (id)_getWorkoutDefaultEndDateForRaceRoute
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (id)getWorkoutDefaultSortDescriptors
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F29008]);
  id v3 = (void *)[v2 initWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)getWorkoutRouteUsingWorkout:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    *(void *)buf = 0;
    long long v22 = buf;
    uint64_t v23 = 0x3032000000;
    dispatch_time_t v24 = __Block_byref_object_copy__146;
    double v25 = __Block_byref_object_dispose__146;
    id v26 = 0;
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__146;
    id v19 = __Block_byref_object_dispose__146;
    id v20 = 0;
    uint64_t v7 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__RTHealthKitManager_getWorkoutRouteUsingWorkout_error___block_invoke;
    v11[3] = &unk_1E6B9BBD8;
    BOOL v13 = buf;
    v11[4] = self;
    id v12 = v6;
    long long v14 = &v15;
    dispatch_sync(v7, v11);

    if (a4) {
      *a4 = (id) v16[5];
    }
    id v8 = *((id *)v22 + 5);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workout");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = [MEMORY[0x1E4F1C978] array];
  }

  return v8;
}

void __56__RTHealthKitManager_getWorkoutRouteUsingWorkout_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _getWorkoutRouteUsingWorkout:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_getWorkoutRouteUsingWorkout:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    *(void *)id v41 = 0;
    uint64_t v42 = v41;
    uint64_t v43 = 0x3032000000;
    SEL v44 = __Block_byref_object_copy__146;
    v45 = __Block_byref_object_dispose__146;
    id v46 = (id)objc_opt_new();
    uint64_t v6 = objc_opt_new();
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    BOOL v35 = [MEMORY[0x1E4F2B3C0] predicateForObjectsFromWorkout:v5];
    id v8 = objc_alloc(MEMORY[0x1E4F2ABF0]);
    uint64_t v9 = [MEMORY[0x1E4F2B498] workoutRouteType];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __57__RTHealthKitManager__getWorkoutRouteUsingWorkout_error___block_invoke;
    v37[3] = &unk_1E6B9BC50;
    id v40 = v41;
    id v10 = v6;
    id v38 = v10;
    uint64_t v11 = v7;
    id v39 = v11;
    uint64_t v34 = (void *)[v8 initWithType:v9 predicate:v35 anchor:0 limit:0 resultsHandler:v37];

    id v12 = [(RTHealthKitManager *)self healthStore];
    [v12 executeQuery:v34];

    BOOL v13 = v11;
    long long v14 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v15 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v13, v15)) {
      goto LABEL_7;
    }
    long long v16 = [MEMORY[0x1E4F1C9C8] now];
    [v16 timeIntervalSinceDate:v14];
    double v18 = v17;
    id v19 = objc_opt_new();
    id v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    long long v21 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v22 = [v21 filteredArrayUsingPredicate:v20];
    uint64_t v23 = [v22 firstObject];

    [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
    dispatch_time_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    double v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v47 count:1];
    id v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

    if (v27)
    {
      id v28 = v27;
    }
    else
    {
LABEL_7:
      id v28 = 0;
    }

    id v29 = v28;
    if (v29) {
      [v10 addObject:v29];
    }
    if (a4)
    {
      BOOL v30 = _RTSafeArray();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v31 = *((id *)v42 + 5);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v41 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v41, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workout");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v31 = [MEMORY[0x1E4F1C978] array];
  }

  return v31;
}

void __57__RTHealthKitManager__getWorkoutRouteUsingWorkout_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * v19);
        long long v21 = (void *)MEMORY[0x1E016D870]();
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v20];
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  if (v14) {
    [*(id *)(a1 + 32) addObject:v14];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)fetchWorkoutRouteLocationsUsingWorkoutRoute:(id)a3 batchSize:(unint64_t)a4 fetchOnlyFirstFew:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__RTHealthKitManager_fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke;
  block[3] = &unk_1E6B96AF8;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v17 = v11;
  unint64_t v18 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

uint64_t __102__RTHealthKitManager_fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutRouteLocationsUsingWorkoutRoute:*(void *)(a1 + 40) batchSize:*(void *)(a1 + 56) fetchOnlyFirstFew:*(unsigned __int8 *)(a1 + 64) handler:*(void *)(a1 + 48)];
}

- (void)_fetchWorkoutRouteLocationsUsingWorkoutRoute:(id)a3 batchSize:(unint64_t)a4 fetchOnlyFirstFew:(BOOL)a5 handler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(id, void *, void *))a6;
  id v40 = v10;
  if (v10)
  {
    id v39 = 0;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    id v52 = @"workoutRoute cannot be nil";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v39 = [v12 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v13];

    id v14 = [MEMORY[0x1E4F1C978] array];
    v11[2](v11, v14, v39);
  }
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__146;
  v49[4] = __Block_byref_object_dispose__146;
  id v50 = (id)objc_opt_new();
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  id v16 = objc_alloc(MEMORY[0x1E4F2B7B8]);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __103__RTHealthKitManager__fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke;
  v41[3] = &unk_1E6B9BC78;
  id v17 = v11;
  v45 = v17;
  unint64_t v18 = v15;
  BOOL v48 = a5;
  uint64_t v42 = v18;
  uint64_t v43 = self;
  id v46 = v49;
  unint64_t v47 = a4;
  id v44 = 0;
  BOOL v19 = (void *)[v16 initWithRoute:v40 dataHandler:v41];
  uint64_t v20 = [(RTHealthKitManager *)self healthStore];
  [v20 executeQuery:v19];

  long long v21 = v18;
  id v22 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v23 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v21, v23)) {
    goto LABEL_9;
  }
  long long v24 = [MEMORY[0x1E4F1C9C8] now];
  [v24 timeIntervalSinceDate:v22];
  double v26 = v25;
  id v27 = objc_opt_new();
  uint64_t v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
  id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
  BOOL v30 = [v29 filteredArrayUsingPredicate:v28];
  id v31 = [v30 firstObject];

  [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
  uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  BOOL v33 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v53 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v53 count:1];
  BOOL v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

  if (v35)
  {
    id v36 = v35;
  }
  else
  {
LABEL_9:
    id v36 = 0;
  }

  id v37 = v36;
  if (v37)
  {
    id v38 = [MEMORY[0x1E4F1C978] array];
    v17[2](v17, v38, v37);
  }
  _Block_object_dispose(v49, 8);
}

void __103__RTHealthKitManager__fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = [MEMORY[0x1E4F1C978] array];
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v11);
LABEL_3:

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_4;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v14 = v10;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v51 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            uint64_t v20 = (void *)MEMORY[0x1E016D870]();
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v16);
      }

      long long v21 = [*(id *)(a1 + 40) healthStore];
      [v21 stopQuery:*(void *)(a1 + 48)];

      uint64_t v22 = *(void *)(a1 + 56);
      dispatch_time_t v23 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);

      uint64_t v24 = *(void *)(a1 + 56);
      double v25 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v24 + 16))(v24, v25, 0);

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
  else
  {
    id v45 = v9;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v26 = v10;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v47 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          uint64_t v32 = (void *)MEMORY[0x1E016D870]();
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v28);
    }

    id v9 = v45;
    while ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] < *(void *)(a1 + 72)) {
        break;
      }
      BOOL v33 = (void *)MEMORY[0x1E016D870]();
      uint64_t v34 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
      uint64_t v35 = *(void *)(a1 + 72);
      if (v34 == v35 || v35 == 0)
      {
        uint64_t v37 = *(void *)(a1 + 56);
        id v38 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        (*(void (**)(uint64_t, void *, void))(v37 + 16))(v37, v38, 0);

        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeAllObjects];
      }
      else if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] > *(void *)(a1 + 72))
      {
        id v39 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        id v40 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexesInRange:0, *(void *)(a1 + 72)];
        id v41 = [v39 objectsAtIndexes:v40];

        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeObjectsInRange:0, *(void *)(a1 + 72)];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    if (![v26 count] || a4)
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
      {
        uint64_t v42 = *(void *)(a1 + 56);
        uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        (*(void (**)(uint64_t, void *, void))(v42 + 16))(v42, v43, 0);

        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeAllObjects];
      }
      uint64_t v44 = *(void *)(a1 + 56);
      id v13 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v44 + 16))(v44, v13, 0);
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (void)fetchRouteLocationsUsingWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(unint64_t)a5 shift:(BOOL)a6 handler:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  if (!v12)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v25 = "-[RTHealthKitManager fetchRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:]";
      __int16 v26 = 1024;
      int v27 = 1940;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v15 = [(RTNotifier *)self queue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__RTHealthKitManager_fetchRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke;
  v18[3] = &unk_1E6B9BCA0;
  v18[4] = self;
  id v19 = v12;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  BOOL v23 = a6;
  id v20 = v13;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(v15, v18);
}

uint64_t __90__RTHealthKitManager_fetchRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getRouteLocationsUsingWorkout:*(void *)(a1 + 40) decimationLevel:*(void *)(a1 + 56) limit:*(void *)(a1 + 64) shift:*(unsigned __int8 *)(a1 + 72) handler:*(void *)(a1 + 48)];
}

- (void)_getRouteLocationsUsingWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(unint64_t)a5 shift:(BOOL)a6 handler:(id)a7
{
  BOOL v76 = a6;
  v140[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v79 = a7;
  id v10 = (uint64_t *)MEMORY[0x1E4F5CFE8];
  id v11 = (uint64_t *)MEMORY[0x1E4F28568];
  uint64_t v89 = v9;
  if (!v9)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v138 = *MEMORY[0x1E4F28568];
    uint64_t v139 = @"workout is nil";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
    id v14 = [v12 errorWithDomain:*v10 code:7 userInfo:v13];

    (*((void (**)(id, void, void, void *))v79 + 2))(v79, 0, 0, v14);
  }
  v77 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v15 = 7200;
  if (a5) {
    unint64_t v15 = a5;
  }
  unint64_t v88 = v15;
  size_t v86 = 16 * v15;
  ptr = (char *)malloc_type_malloc(16 * v15, 0x1000040451B5BE8uLL);
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x2020000000;
  uint64_t v122 = 0;
  uint64_t v113 = 0;
  v114 = &v113;
  uint64_t v115 = 0x3032000000;
  v116 = __Block_byref_object_copy__146;
  uint64_t v117 = __Block_byref_object_dispose__146;
  id v118 = [(RTHealthKitManager *)self _getStartDateForWorkout:v89];
  v87 = [(RTHealthKitManager *)self _getEndDateForWorkout:v89];
  v83 = 0;
  char v82 = 0;
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3032000000;
  long long v110 = __Block_byref_object_copy__146;
  long long v111 = __Block_byref_object_dispose__146;
  id v112 = 0;
  uint64_t v84 = *v10;
  uint64_t v85 = *v11;
  do
  {
    id v16 = (void *)MEMORY[0x1E016D870]();
    uint64_t v101 = 0;
    id v102 = &v101;
    uint64_t v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__146;
    BOOL v105 = __Block_byref_object_dispose__146;
    id v106 = 0;
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x2020000000;
    uint64_t v100 = 0;
    id v17 = malloc_type_malloc(v86, 0x1000040451B5BE8uLL);
    v120[3] = (uint64_t)v17;
    id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v19 = (void *)[v18 initWithStartDate:v114[5] endDate:v87];
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    unint64_t v21 = [(RTHealthKitManager *)self workoutClusterStore];
    unint64_t v22 = [v89 UUID];
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke;
    v96[3] = &unk_1E6B9BCC8;
    v96[4] = &v119;
    v96[5] = &v97;
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_2;
    v92[3] = &unk_1E6B9BCF0;
    id v94 = &v113;
    v95 = &v101;
    BOOL v23 = v20;
    v93 = v23;
    [v21 fetchRouteCoordinatesForWorkoutUUID:v22 dateInterval:v19 limit:v88 handler:v96 completion:v92];

    uint64_t v24 = v23;
    double v25 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v26 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v24, v26)) {
      goto LABEL_11;
    }
    int v27 = [MEMORY[0x1E4F1C9C8] now];
    [v27 timeIntervalSinceDate:v25];
    double v29 = v28;
    BOOL v30 = objc_opt_new();
    uint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    BOOL v33 = [v32 filteredArrayUsingPredicate:v31];
    uint64_t v34 = [v33 firstObject];

    [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
    uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v36 = (void *)MEMORY[0x1E4F28C58];
    v140[0] = v85;
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v140 count:1];
    id v38 = [v36 errorWithDomain:v84 code:15 userInfo:v37];

    if (v38)
    {
      id v39 = v38;
    }
    else
    {
LABEL_11:
      id v39 = 0;
    }

    id v40 = v39;
    id v41 = v40;
    uint64_t v42 = v40;
    if (v40 || (uint64_t v42 = (void *)v102[5]) != 0)
    {
      uint64_t v43 = v108;
      id v44 = v42;
      id v45 = (void *)v43[5];
      v43[5] = (uint64_t)v44;

LABEL_15:
      int v46 = 1;
      goto LABEL_16;
    }
    if (a4 - 1 <= 1)
    {
      uint64_t v47 = v120[3];
      uint64_t v48 = v98[3];
      [(RTHealthKitManager *)self _getDurationForWorkout:v89];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_3;
      v91[3] = &unk_1E6B9B0C0;
      v91[4] = &v119;
      v91[5] = &v97;
      v91[6] = &v107;
      id v40 = (id)-[RTHealthKitManager _decimateLocations:locationsCount:totalDuration:decimationLevel:handler:](self, "_decimateLocations:locationsCount:totalDuration:decimationLevel:handler:", v47, v48, a4, v91);
      if (v108[5]) {
        goto LABEL_15;
      }
    }
    if (v98[3])
    {
      uint64_t v49 = 0;
      unint64_t v50 = 0;
      do
      {
        long long v51 = (void *)MEMORY[0x1E016D870](v40);
        *(_OWORD *)&ptr[16 * (void)v83 + v49] = *(_OWORD *)(v120[3] + v49);
        ++v50;
        v49 += 16;
      }
      while (v50 < v98[3]);
      v83 = (char *)v83 + v50;
    }
    long long v52 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      long long v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v56 = [v89 UUID];
      long long v57 = (__CFString *)v98[3];
      id v58 = [(id)v114[5] stringFromDate];
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138414082;
      *(void *)&uint8_t buf[4] = v54;
      __int16 v124 = 2112;
      id v125 = v55;
      __int16 v126 = 2112;
      v127 = v56;
      __int16 v128 = 2048;
      id v129 = v83;
      __int16 v130 = 2048;
      long long v131 = v57;
      __int16 v132 = 2048;
      unint64_t v133 = v88;
      __int16 v134 = 2112;
      id v135 = v58;
      __int16 v136 = 2048;
      uint64_t v137 = v59;
      _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, workout uuid, %@, total locations count, %lu, buffer locations count, %lu, limit, %lu, next startDate, %@, footprint, %.4f", buf, 0x52u);
    }
    uint64_t v60 = v120;
    uint64_t v61 = (void *)v120[3];
    if (v61)
    {
      free(v61);
      uint64_t v60 = v120;
    }
    v60[3] = 0;
    if (v114[5])
    {
      int v46 = 1;
      if (!v108[5] && (void *)v88 != v83 && (v82 & 1) == 0)
      {
        ptr = (char *)malloc_type_realloc(ptr, 16 * ((void)v83 + v88), 0x1000040451B5BE8uLL);
        int v46 = 0;
        char v82 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      int v46 = 1;
    }
    char v82 = 1;
LABEL_16:

    _Block_object_dispose(&v97, 8);
    _Block_object_dispose(&v101, 8);
  }
  while (!v46);
  v62 = v120;
  id v63 = (void *)v120[3];
  if (v108[5])
  {
    if (v63)
    {
      free(v63);
      v62 = v120;
    }
    v62[3] = 0;
    if (ptr) {
      free(ptr);
    }
    v64 = 0;
    v65 = 0;
  }
  else
  {
    if (v63)
    {
      free(v63);
      v62 = v120;
    }
    v62[3] = 0;
    if (v83)
    {
      v64 = malloc_type_realloc(ptr, 16 * (void)v83, 0x1000040451B5BE8uLL);
    }
    else
    {
      if (ptr) {
        free(ptr);
      }
      v64 = 0;
    }
    if (v76) {
      [(RTHealthKitManager *)self _shiftLocations:v64 locationsCount:v83];
    }
    uint64_t v66 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v69 = (id)objc_claimAutoreleasedReturnValue();
      id v70 = [(id)objc_opt_class() stringFromHealthKitDecimationLevel:a4];
      if (v76) {
        __int16 v71 = @"YES";
      }
      else {
        __int16 v71 = @"NO";
      }
      id v72 = [MEMORY[0x1E4F1C9C8] date];
      [v72 timeIntervalSinceDate:v77];
      unint64_t v74 = v73;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413826;
      *(void *)&uint8_t buf[4] = v68;
      __int16 v124 = 2112;
      id v125 = v69;
      __int16 v126 = 2048;
      v127 = v83;
      __int16 v128 = 2112;
      id v129 = v70;
      __int16 v130 = 2112;
      long long v131 = v71;
      __int16 v132 = 2048;
      unint64_t v133 = v74;
      __int16 v134 = 2048;
      id v135 = v75;
      _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "%@, %@, fetched locations count, %lu, decimation level, %@, shift, %@, latency, %.4f, footprint, %.4f", buf, 0x48u);
    }
    v65 = v83;
  }
  (*((void (**)(id, void *, void *, uint64_t))v79 + 2))(v79, v64, v65, v108[5]);
  _Block_object_dispose(&v107, 8);

  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v119, 8);
}

void __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = v5 + 1;
  *(CLLocationCoordinate2D *)(v3 + 16 * v5) = CLLocationCoordinate2DMake(a2, a3);
}

void __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1[4] + 8);
  uint64_t v9 = *(void **)(v8 + 24);
  if (v9)
  {
    free(v9);
    uint64_t v8 = *(void *)(a1[4] + 8);
  }
  *(void *)(v8 + 24) = 0;
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

- (void)_shiftLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _shiftLocations:locationsCount:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2109;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v49 = [MEMORY[0x1E4F1C9C8] date];
  context = (void *)MEMORY[0x1E016D870]();
  id v7 = objc_opt_new();
  if (a4)
  {
    p_longitude = &a3->longitude;
    do
    {
      uint64_t v9 = (void *)MEMORY[0x1E016D870]();
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:*(p_longitude - 1) longitude:*p_longitude];
      [v7 addObject:v10];

      p_longitude += 2;
      --a4;
    }
    while (a4);
  }
  if ([MEMORY[0x1E4F2B908] isShiftRequiredForLocations:v7])
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__146;
    *(void *)&long long v63 = __Block_byref_object_dispose__146;
    *((void *)&v63 + 1) = 0;
    id v12 = objc_opt_new();
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke;
    v51[3] = &unk_1E6B9BD18;
    long long v53 = buf;
    id v13 = v11;
    long long v52 = v13;
    [v12 shiftLocations:v7 withCompletion:v51];

    id v14 = v13;
    unint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v14, v16)) {
      goto LABEL_16;
    }
    id v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:v15];
    double v19 = v18;
    dispatch_semaphore_t v20 = objc_opt_new();
    unint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    unint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    BOOL v23 = [v22 filteredArrayUsingPredicate:v21];
    uint64_t v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v54 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v54, 2u);
    }

    dispatch_time_t v26 = (void *)MEMORY[0x1E4F28C58];
    v64[0] = *MEMORY[0x1E4F28568];
    *(void *)id v54 = @"semaphore wait timeout";
    int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v64 count:1];
    double v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

    if (v28)
    {
      id v29 = v28;
    }
    else
    {
LABEL_16:
      id v29 = 0;
    }

    id v37 = v29;
    id v38 = *(void **)(*(void *)&buf[8] + 40);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke_2;
    v50[3] = &__block_descriptor_40_e27_v32__0__CLLocation_8Q16_B24l;
    void v50[4] = a3;
    [v38 enumerateObjectsUsingBlock:v50];
    id v39 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      id v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = [MEMORY[0x1E4F1C9C8] date];
      [v43 timeIntervalSinceDate:v49];
      uint64_t v45 = v44;
      +[RTRuntime footprint];
      *(_DWORD *)id v54 = 138413058;
      *(void *)&void v54[4] = v41;
      __int16 v55 = 2112;
      id v56 = v42;
      __int16 v57 = 2048;
      uint64_t v58 = v45;
      __int16 v59 = 2048;
      uint64_t v60 = v46;
      _os_log_debug_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_DEBUG, "%@, %@, shifting complete, latency, %.4f, footprint, %.4f", v54, 0x2Au);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {

    id v14 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      BOOL v30 = (objc_class *)objc_opt_class();
      uint64_t v31 = NSStringFromClass(v30);
      uint64_t v32 = NSStringFromSelector(a2);
      BOOL v33 = [MEMORY[0x1E4F1C9C8] date];
      [v33 timeIntervalSinceDate:v49];
      uint64_t v35 = v34;
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2048;
      v62 = v35;
      LOWORD(v63) = 2048;
      *(void *)((char *)&v63 + 2) = v36;
      _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, shifting not required, latency, %.4f, footprint, %.4f", buf, 0x2Au);
    }
  }
}

void __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = (void *)(*(void *)(a1 + 32) + 16 * a3);
  uint64_t result = [a2 coordinate];
  void *v3 = v5;
  v3[1] = v6;
  return result;
}

- (void)_decimateLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 totalDuration:(double)a5 decimationLevel:(unint64_t)a6 handler:(id)a7
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  if (!a3)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v76 = "-[RTHealthKitManager _decimateLocations:locationsCount:totalDuration:decimationLevel:handler:]";
      __int16 v77 = 1024;
      LODWORD(v78) = 2165;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations (in %s:%d)", buf, 0x12u);
    }
  }
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = MEMORY[0x1E016D870]();
  unint64_t v15 = (void *)v14;
  unint64_t v59 = a6;
  if (a6 == 2)
  {
    id v57 = v11;
    dispatch_time_t v26 = objc_opt_new();
    int v27 = [MEMORY[0x1E4F1C978] array];
    if (a4)
    {
      p_longitude = &a3->longitude;
      unint64_t v29 = a4;
      do
      {
        BOOL v30 = (void *)MEMORY[0x1E016D870]();
        uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:*(p_longitude - 1) longitude:*p_longitude];
        [v26 addObject:v31];

        p_longitude += 2;
        --v29;
      }
      while (v29);
    }
    uint64_t v32 = (void *)MEMORY[0x1E4F5CE08];
    BOOL v33 = [(RTHealthKitManager *)self errorFunction];
    uint64_t v34 = [v32 downsampleLocations:v26 errorFunction:v33 errorThreshold:0 outputSize:10.0];

    double v25 = (char *)malloc_type_malloc(16 * [v34 count], 0x1000040451B5BE8uLL);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v35 = v34;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v91 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      v64 = v13;
      v67 = v15;
      unint64_t v20 = 0;
      uint64_t v38 = *(void *)v72;
      v62 = v25;
      id v39 = v25 + 8;
      do
      {
        uint64_t v40 = 0;
        id v41 = &v39[16 * v20];
        do
        {
          if (*(void *)v72 != v38) {
            objc_enumerationMutation(v35);
          }
          id v42 = *(void **)(*((void *)&v71 + 1) + 8 * v40);
          uint64_t v43 = (void *)MEMORY[0x1E016D870]();
          [v42 coordinate];
          *((void *)v41 - 1) = v44;
          *(void *)id v41 = v45;
          ++v40;
          v41 += 16;
        }
        while (v37 != v40);
        uint64_t v37 = [v35 countByEnumeratingWithState:&v71 objects:v91 count:16];
        v20 += v40;
      }
      while (v37);
      id v13 = v64;
      unint64_t v15 = v67;
      double v25 = v62;
    }
    else
    {
      unint64_t v20 = 0;
    }

    uint64_t v17 = 1;
    id v11 = v57;
  }
  else if (a6 == 1)
  {
    long long v63 = v13;
    uint64_t v66 = (void *)v14;
    unint64_t v16 = [(RTHealthKitManager *)self _getDecimationSkipAheadFactorForDuration:a5];
    uint64_t v17 = v16;
    if (a4 % v16) {
      unint64_t v18 = a4 / v16 + 1;
    }
    else {
      unint64_t v18 = a4 / v16;
    }
    double v19 = (char *)malloc_type_malloc(16 * v18, 0x1000040451B5BE8uLL);
    uint64_t v61 = v19;
    unint64_t v20 = 0;
    if (a4)
    {
      unint64_t v21 = 0;
      unint64_t v22 = v19 + 8;
      BOOL v23 = &a3->longitude;
      do
      {
        uint64_t v24 = (void *)MEMORY[0x1E016D870]();
        ++v20;
        *(CLLocationCoordinate2D *)(v22 - 8) = CLLocationCoordinate2DMake(*(v23 - 1), *v23);
        v21 += v17;
        v22 += 16;
        v23 += 2 * v17;
      }
      while (v21 < a4);
    }
    id v13 = v63;
    unint64_t v15 = v66;
    if (v18 == v20)
    {
      unint64_t v20 = v18;
      double v25 = v61;
    }
    else
    {
      uint64_t v47 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      double v25 = v61;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        __int16 v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        id v56 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v58 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        BOOL v76 = v56;
        __int16 v77 = 2112;
        id v78 = v58;
        __int16 v79 = 2048;
        unint64_t v80 = v18;
        __int16 v81 = 2048;
        uint64_t v82 = v20;
        _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "%@, %@, outputLocationsCount, %lu, outputLocationsCount, %lu", buf, 0x2Au);
      }
    }
  }
  else
  {
    uint64_t v46 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "invalid decimation level", buf, 2u);
    }

    (*((void (**)(id, void, void, void))v11 + 2))(v11, 0, 0, 0);
    unint64_t v20 = 0;
    double v25 = 0;
    uint64_t v17 = 1;
  }
  uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    unint64_t v50 = (char *)objc_claimAutoreleasedReturnValue();
    v65 = NSStringFromSelector(a2);
    [(id)objc_opt_class() stringFromHealthKitDecimationLevel:v59];
    long long v51 = v68 = v15;
    id v70 = [MEMORY[0x1E4F1C9C8] date];
    [v70 timeIntervalSinceDate:v13];
    uint64_t v53 = v52;
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138414082;
    BOOL v76 = v50;
    __int16 v77 = 2112;
    id v78 = v65;
    __int16 v79 = 2112;
    unint64_t v80 = (unint64_t)v51;
    __int16 v81 = 2048;
    uint64_t v82 = v17;
    __int16 v83 = 2048;
    unint64_t v84 = a4;
    __int16 v85 = 2048;
    unint64_t v86 = v20;
    __int16 v87 = 2048;
    uint64_t v88 = v53;
    __int16 v89 = 2048;
    uint64_t v90 = v54;
    _os_log_debug_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEBUG, "%@, %@, decimation, decimation level, %@, skip ahead factor, %lu, input locations count, %lu, actual outputLocations count, %lu, latency, %.4f, footprint, %.4f", buf, 0x52u);

    unint64_t v15 = v68;
  }

  (*((void (**)(id, char *, unint64_t, void))v11 + 2))(v11, v25, v20, 0);
}

- (unint64_t)_getDecimationSkipAheadFactorForDuration:(double)a3
{
  unint64_t v3 = 6;
  if (a3 > 36000.0) {
    unint64_t v3 = 9;
  }
  if (a3 <= 18000.0) {
    return 3;
  }
  else {
    return v3;
  }
}

- (id)getOdometerReadingUsingWorkout:(id)a3 samplingIntervalComponents:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a5) {
      goto LABEL_15;
    }
    uint64_t v14 = @"workout";
    goto LABEL_14;
  }
  if (!v9)
  {
    unint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingIntervalComponents", buf, 2u);
    }

    if (!a5) {
      goto LABEL_15;
    }
    uint64_t v14 = @"samplingIntervalComponents";
LABEL_14:
    _RTErrorInvalidParameterCreate((uint64_t)v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    id v12 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_16;
  }
  *(void *)buf = 0;
  unint64_t v29 = buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__146;
  uint64_t v32 = __Block_byref_object_dispose__146;
  id v33 = 0;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy__146;
  dispatch_time_t v26 = __Block_byref_object_dispose__146;
  id v27 = 0;
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__RTHealthKitManager_getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke;
  block[3] = &unk_1E6B96FC8;
  unint64_t v20 = buf;
  void block[4] = self;
  id v18 = v8;
  id v19 = v10;
  unint64_t v21 = &v22;
  dispatch_sync(v11, block);

  if (a5) {
    *a5 = (id) v23[5];
  }
  id v12 = *((id *)v29 + 5);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:

  return v12;
}

void __86__RTHealthKitManager_getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _getOdometerReadingUsingWorkout:v3 samplingIntervalComponents:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_getOdometerReadingUsingWorkout:(id)a3 samplingIntervalComponents:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"workout");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingIntervalComponents", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"samplingIntervalComponents");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    id v19 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_33;
  }
  *(void *)buf = 0;
  uint64_t v58 = buf;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = __Block_byref_object_copy__146;
  uint64_t v61 = __Block_byref_object_dispose__146;
  id v62 = (id)objc_opt_new();
  uint64_t v52 = objc_opt_new();
  long long v51 = [MEMORY[0x1E4F2B3C0] predicateForObjectsFromWorkout:v8];
  id v11 = (void *)MEMORY[0x1E4F2B3C0];
  id v12 = [v8 startDate];
  id v13 = [v8 endDate];
  unint64_t v50 = [v11 predicateForSamplesWithStartDate:v12 endDate:v13 options:0];

  uint64_t v14 = (void *)MEMORY[0x1E4F28BA0];
  v65[0] = v51;
  v65[1] = v50;
  unint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  uint64_t v49 = [v14 andPredicateWithSubpredicates:v15];

  if ([v8 workoutActivityType] == 37)
  {
    unint64_t v16 = (void *)MEMORY[0x1E4F2A7E0];
  }
  else if ([v8 workoutActivityType] == 13)
  {
    unint64_t v16 = (void *)MEMORY[0x1E4F2A7B0];
  }
  else
  {
    if ([v8 workoutActivityType] != 71) {
      goto LABEL_25;
    }
    unint64_t v16 = (void *)MEMORY[0x1E4F2A7E8];
  }
  unint64_t v20 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*v16];
  if (v20)
  {
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    id v22 = objc_alloc(MEMORY[0x1E4F2B5C8]);
    BOOL v23 = [v8 startDate];
    uint64_t v48 = (void *)[v22 initWithQuantityType:v20 quantitySamplePredicate:v49 options:16 anchorDate:v23 intervalComponents:v10];

    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __87__RTHealthKitManager__getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke;
    v53[3] = &unk_1E6B9BD40;
    id v56 = buf;
    id v45 = v52;
    id v54 = v45;
    uint64_t v24 = v21;
    __int16 v55 = v24;
    [v48 setInitialResultsHandler:v53];
    double v25 = [(RTHealthKitManager *)self healthStore];
    [v25 executeQuery:v48];

    dispatch_time_t v26 = v24;
    uint64_t v47 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v27 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v26, v27)) {
      goto LABEL_26;
    }
    uint64_t v46 = [MEMORY[0x1E4F1C9C8] now];
    [v46 timeIntervalSinceDate:v47];
    double v29 = v28;
    uint64_t v30 = objc_opt_new();
    uint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v33 = [v32 filteredArrayUsingPredicate:v31];
    uint64_t v34 = [v33 firstObject];

    [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v67 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v67, 2u);
    }

    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    *(void *)v67 = @"semaphore wait timeout";
    uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
    uint64_t v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

    if (v38)
    {
      id v39 = v38;
    }
    else
    {
LABEL_26:
      id v39 = 0;
    }

    id v42 = v39;
    if (v42) {
      [v45 addObject:v42];
    }

    goto LABEL_30;
  }
LABEL_25:
  uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v63 = *MEMORY[0x1E4F28568];
  v64 = @"Only workouts of type Running or Cycling is currently considered to get odometer readings.";
  id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  dispatch_time_t v26 = [v40 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v41];

  [v52 addObject:v26];
  unint64_t v20 = 0;
LABEL_30:

  if (a5)
  {
    uint64_t v43 = _RTSafeArray();
    _RTMultiErrorCreate();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v19 = *((id *)v58 + 5);

  _Block_object_dispose(buf, 8);
LABEL_33:

  return v19;
}

void __87__RTHealthKitManager__getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a4;
  uint64_t v6 = [a3 statistics];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (v9) {
    [*(id *)(a1 + 32) addObject:v9];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)createWorkoutClusterWithWorkoutUUIDs:(id)a3 bestWorkoutUUID:(id)a4 lastWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8 error:(id *)a9
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  if (!v17)
  {
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (!a9) {
      goto LABEL_28;
    }
    _RTErrorInvalidParameterCreate(@"workoutUUIDs");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (!v19)
  {
    dispatch_time_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lastWorkoutUUID", buf, 2u);
    }

    if (!a9) {
      goto LABEL_28;
    }
    _RTErrorInvalidParameterCreate(@"lastWorkoutUUID");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (!v18)
  {
    double v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bestWorkoutUUID", buf, 2u);
    }

    if (!a9) {
      goto LABEL_28;
    }
    _RTErrorInvalidParameterCreate(@"bestWorkoutUUID");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    BOOL v24 = 0;
    *a9 = v26;
    goto LABEL_29;
  }
  if (!v20)
  {
    double v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"workoutRouteSnapshot");
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_28:
    BOOL v24 = 0;
    goto LABEL_29;
  }
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  *(void *)buf = 0;
  id v45 = buf;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__146;
  uint64_t v48 = __Block_byref_object_dispose__146;
  id v49 = 0;
  id v22 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __151__RTHealthKitManager_createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke;
  block[3] = &unk_1E6B9BD68;
  id v41 = &v50;
  void block[4] = self;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  double v43 = a6;
  id v39 = v20;
  id v40 = v21;
  id v42 = buf;
  dispatch_sync(v22, block);

  if (a9 && *((void *)v45 + 5))
  {
    BOOL v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v33 = NSStringFromSelector(a2);
      uint64_t v34 = *((void *)v45 + 5);
      *(_DWORD *)id v54 = 138412802;
      id v55 = v32;
      __int16 v56 = 2112;
      id v57 = v33;
      __int16 v58 = 2112;
      uint64_t v59 = v34;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v54, 0x20u);
    }
    *a9 = *((id *)v45 + 5);
  }
  BOOL v24 = *((unsigned char *)v51 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v50, 8);
LABEL_29:

  return v24;
}

void __151__RTHealthKitManager_createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke(double *a1)
{
  id v2 = (void *)*((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  uint64_t v4 = *((void *)a1 + 6);
  uint64_t v5 = *((void *)a1 + 7);
  uint64_t v6 = *((void *)a1 + 8);
  double v7 = a1[12];
  uint64_t v8 = *((void *)a1 + 9);
  uint64_t v9 = *(void *)(*((void *)a1 + 11) + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v2 _createWorkoutClusterWithWorkoutUUIDs:v3 bestWorkoutUUID:v4 lastWorkoutUUID:v5 relevanceValue:v6 workoutRouteSnapshot:v8 workoutRouteLabel:&obj error:v7];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*((void *)a1 + 10) + 8) + 24) = v10;
}

- (BOOL)_createWorkoutClusterWithWorkoutUUIDs:(id)a3 bestWorkoutUUID:(id)a4 lastWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8 error:(id *)a9
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  id v22 = v21;
  if (!v17)
  {
    id v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (!a9) {
      goto LABEL_42;
    }
    _RTErrorInvalidParameterCreate(@"workoutUUIDs");
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (!v19)
  {
    double v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lastWorkoutUUID", buf, 2u);
    }

    if (!a9) {
      goto LABEL_42;
    }
    _RTErrorInvalidParameterCreate(@"lastWorkoutUUID");
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (!v18)
  {
    uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bestWorkoutUUID", buf, 2u);
    }

    if (!a9) {
      goto LABEL_42;
    }
    _RTErrorInvalidParameterCreate(@"bestWorkoutUUID");
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (!v20)
  {
    id v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (!a9) {
      goto LABEL_42;
    }
    _RTErrorInvalidParameterCreate(@"workoutRouteSnapshot");
    id v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:
    BOOL v52 = 0;
    *a9 = v42;
    goto LABEL_52;
  }
  if (!v21)
  {
    char v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteLabel", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"workoutRouteLabel");
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_42:
    BOOL v52 = 0;
    goto LABEL_52;
  }
  v67 = self;
  aSelector = a2;
  uint64_t v85 = 0;
  unint64_t v86 = &v85;
  uint64_t v87 = 0x2020000000;
  char v88 = 0;
  *(void *)buf = 0;
  unint64_t v80 = buf;
  uint64_t v81 = 0x3032000000;
  uint64_t v82 = __Block_byref_object_copy__146;
  __int16 v83 = __Block_byref_object_dispose__146;
  id v84 = 0;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v96[0] = v19;
  v96[1] = v18;
  BOOL v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v75 objects:v97 count:16];
  id v70 = v22;
  if (v24)
  {
    uint64_t v25 = *(void *)v76;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v76 != v25) {
          objc_enumerationMutation(v23);
        }
        dispatch_time_t v27 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        if (([v17 containsObject:v27] & 1) == 0)
        {
          dispatch_semaphore_t dsemaa = (dispatch_semaphore_t)MEMORY[0x1E4F28C58];
          uint64_t v94 = *MEMORY[0x1E4F28568];
          uint64_t v46 = NSString;
          [v27 UUIDString];
          v47 = id v22 = v70;
          uint64_t v48 = [v46 stringWithFormat:@"UUID %@ not found in cluster list", v47];
          v95 = v48;
          id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          uint64_t v50 = [dsemaa errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v49];
          long long v51 = (void *)*((void *)v80 + 5);
          *((void *)v80 + 5) = v50;

          BOOL v52 = 0;
          if (a9) {
            *a9 = *((id *)v80 + 5);
          }
          goto LABEL_51;
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v75 objects:v97 count:16];
      id v22 = v70;
      if (v24) {
        continue;
      }
      break;
    }
  }

  BOOL v23 = (void *)[objc_alloc(MEMORY[0x1E4F2B750]) initWithWorkoutUUIDs:v17 lastWorkoutUUID:v19 bestWorkoutUUID:v18 relevanceValue:v20 workoutRouteSnapshot:v22 workoutRouteLabel:a6];
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  double v29 = [(RTHealthKitManager *)v67 workoutClusterStore];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __152__RTHealthKitManager__createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke;
  v71[3] = &unk_1E6B92050;
  long long v73 = buf;
  long long v74 = &v85;
  uint64_t v30 = v28;
  long long v72 = v30;
  [v29 createWorkoutCluster:v23 completion:v71];

  uint64_t v31 = (id *)(v80 + 40);
  id obj = (id)*((void *)v80 + 5);
  dsema = v30;
  v65 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v32 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v32))
  {
    uint64_t v63 = [MEMORY[0x1E4F1C9C8] now];
    [v63 timeIntervalSinceDate:v65];
    double v34 = v33;
    uint64_t v61 = objc_opt_new();
    id v62 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    id v35 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v36 = [v35 filteredArrayUsingPredicate:v62];
    uint64_t v60 = [v36 firstObject];

    [v61 submitToCoreAnalytics:v60 type:1 duration:v34];
    id v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int16 v89 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v89, 2u);
    }

    id v38 = (void *)MEMORY[0x1E4F28C58];
    v98[0] = *MEMORY[0x1E4F28568];
    *(void *)__int16 v89 = @"semaphore wait timeout";
    id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v98 count:1];
    id v40 = [v38 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v39];

    id v22 = v70;
    if (v40)
    {
      id obj = v40;
    }
  }
  else
  {
    id v22 = v70;
  }

  objc_storeStrong(v31, obj);
  if (a9 && *((void *)v80 + 5))
  {
    id v54 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      __int16 v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v58 = NSStringFromSelector(aSelector);
      uint64_t v59 = *((void *)v80 + 5);
      *(_DWORD *)__int16 v89 = 138412802;
      *(void *)&v89[4] = v57;
      __int16 v90 = 2112;
      id v91 = v58;
      __int16 v92 = 2112;
      uint64_t v93 = v59;
      _os_log_error_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v89, 0x20u);
    }
    *a9 = *((id *)v80 + 5);
  }
  BOOL v52 = *((unsigned char *)v86 + 24) != 0;

LABEL_51:
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v85, 8);
LABEL_52:

  return v52;
}

void __152__RTHealthKitManager__createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newBestWorkoutUUID:(id)a4 newLastWorkoutUUID:(id)a5 newRelevance:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = v21;
  if (v16)
  {
    BOOL v23 = v21;
    uint64_t v48 = 0;
    id v49 = &v48;
    uint64_t v50 = 0x2020000000;
    char v51 = 0;
    *(void *)buf = 0;
    double v43 = buf;
    uint64_t v44 = 0x3032000000;
    id v45 = __Block_byref_object_copy__146;
    uint64_t v46 = __Block_byref_object_dispose__146;
    id v47 = 0;
    uint64_t v24 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __159__RTHealthKitManager_updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke;
    block[3] = &unk_1E6B9BD90;
    id v40 = &v48;
    void block[4] = self;
    id v34 = v16;
    id v35 = v17;
    id v36 = v18;
    id v37 = v19;
    id v38 = v20;
    id v22 = v23;
    id v39 = v23;
    id v41 = buf;
    dispatch_sync(v24, block);

    if (a9 && *((void *)v43 + 5))
    {
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        double v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = NSStringFromSelector(a2);
        uint64_t v32 = *((void *)v43 + 5);
        *(_DWORD *)BOOL v52 = 138412802;
        id v53 = v30;
        __int16 v54 = 2112;
        id v55 = v31;
        __int16 v56 = 2112;
        uint64_t v57 = v32;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v52, 0x20u);
      }
      *a9 = *((id *)v43 + 5);
    }
    BOOL v26 = *((unsigned char *)v49 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v48, 8);
  }
  else
  {
    dispatch_time_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"clusterUUID");
      BOOL v26 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v26 = 0;
    }
  }

  return v26;
}

void __159__RTHealthKitManager_updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v8 = a1[10];
  uint64_t v9 = *(void *)(a1[12] + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v2 _updateWorkoutClusterWithUUID:v3 newBestWorkoutUUID:v4 newLastWorkoutUUID:v5 newRelevance:v6 newWorkoutAssociations:v7 workoutAssociationsToRemove:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = v10;
}

- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 newBestWorkoutUUID:(id)a4 newLastWorkoutUUID:(id)a5 newRelevance:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v46 = a4;
  id v47 = a5;
  id v48 = a6;
  id v49 = a7;
  id v50 = a8;
  id v45 = v15;
  if (v15)
  {
    uint64_t v61 = 0;
    id v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 0;
    *(void *)id v55 = 0;
    __int16 v56 = v55;
    uint64_t v57 = 0x3032000000;
    uint64_t v58 = __Block_byref_object_copy__146;
    uint64_t v59 = __Block_byref_object_dispose__146;
    id v60 = 0;
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    id v17 = [(RTHealthKitManager *)self workoutClusterStore];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __160__RTHealthKitManager__updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke;
    v51[3] = &unk_1E6B92050;
    id v53 = v55;
    __int16 v54 = &v61;
    id v18 = v16;
    BOOL v52 = v18;
    [v17 updateWorkoutClusterWithUUID:v15 newRelevance:v48 newLastWorkoutUUID:v47 newBestWorkoutUUID:v46 newWorkoutAssociations:v49 workoutAssociationsToRemove:v50 completion:v51];

    id v20 = (id *)(v56 + 40);
    id v19 = (id)*((void *)v56 + 5);
    id v21 = v18;
    id v22 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v23 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v21, v23))
    {
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
      [v24 timeIntervalSinceDate:v22];
      double v26 = v25;
      dispatch_time_t v27 = objc_opt_new();
      dispatch_semaphore_t v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
      double v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v30 = [v29 filteredArrayUsingPredicate:v28];
      uint64_t v31 = [v30 firstObject];

      [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
      uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      double v33 = (void *)MEMORY[0x1E4F28C58];
      v70[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v70 count:1];
      id v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

      if (v35)
      {
        id v19 = v35;
      }
    }

    objc_storeStrong(v20, v19);
    if (a9 && *((void *)v56 + 5))
    {
      id v36 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        id v42 = NSStringFromSelector(a2);
        uint64_t v43 = *((void *)v56 + 5);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v41;
        __int16 v66 = 2112;
        v67 = v42;
        __int16 v68 = 2112;
        uint64_t v69 = v43;
        _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      *a9 = *((id *)v56 + 5);
    }
    BOOL v37 = *((unsigned char *)v62 + 24) != 0;

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v61, 8);
  }
  else
  {
    id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v55 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", v55, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate(@"clusterUUID");
      BOOL v37 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v37 = 0;
    }
  }

  return v37;
}

void __160__RTHealthKitManager__updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 workoutRouteSnapshot:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"clusterUUID");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      BOOL v14 = 0;
      *a5 = v16;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
  if (!v10)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"workoutRouteSnapshot");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  *(void *)buf = 0;
  double v29 = buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__146;
  uint64_t v32 = __Block_byref_object_dispose__146;
  id v33 = 0;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke;
  block[3] = &unk_1E6B96FC8;
  double v26 = &v34;
  void block[4] = self;
  id v24 = v9;
  id v25 = v11;
  dispatch_time_t v27 = buf;
  dispatch_sync(v12, block);

  if (a5 && *((void *)v29 + 5))
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = NSStringFromSelector(a2);
      uint64_t v22 = *((void *)v29 + 5);
      *(_DWORD *)id v38 = 138412802;
      id v39 = v20;
      __int16 v40 = 2112;
      id v41 = v21;
      __int16 v42 = 2112;
      uint64_t v43 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v38, 0x20u);
    }
    *a5 = *((id *)v29 + 5);
  }
  BOOL v14 = *((unsigned char *)v35 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v34, 8);
LABEL_19:

  return v14;
}

void __78__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v2 _updateWorkoutClusterWithUUID:v3 workoutRouteSnapshot:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 workoutRouteSnapshot:(id)a4 error:(id *)a5
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"clusterUUID");
      id v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      BOOL v32 = 0;
      *a5 = v34;
      goto LABEL_24;
    }
LABEL_23:
    BOOL v32 = 0;
    goto LABEL_24;
  }
  if (!v10)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"workoutRouteSnapshot");
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  aSelector = a2;
  uint64_t v55 = 0;
  __int16 v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  *(void *)buf = 0;
  id v50 = buf;
  uint64_t v51 = 0x3032000000;
  BOOL v52 = __Block_byref_object_copy__146;
  id v53 = __Block_byref_object_dispose__146;
  id v54 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = self;
  dispatch_semaphore_t v14 = v12;
  id v15 = [(RTHealthKitManager *)v13 workoutClusterStore];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __79__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke;
  v45[3] = &unk_1E6B92050;
  id v47 = buf;
  id v48 = &v55;
  id v16 = v14;
  id v46 = v16;
  [v15 updateWorkoutRouteSnapshot:v11 forClusterUUID:v9 completion:v45];

  id v17 = (id *)(v50 + 40);
  id obj = (id)*((void *)v50 + 5);
  id v18 = v16;
  uint64_t v43 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v19 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    __int16 v42 = [MEMORY[0x1E4F1C9C8] now:aSelector];
    [v42 timeIntervalSinceDate:v43];
    double v21 = v20;
    uint64_t v22 = objc_opt_new();
    dispatch_time_t v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v25 = [v24 filteredArrayUsingPredicate:v23];
    double v26 = [v25 firstObject];

    [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
    dispatch_time_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v59 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
    }

    dispatch_semaphore_t v28 = (void *)MEMORY[0x1E4F28C58];
    v64[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v59 = @"semaphore wait timeout";
    double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v64 count:1];
    uint64_t v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

    if (v30)
    {
      id obj = v30;
    }
  }

  objc_storeStrong(v17, obj);
  if (a5 && *((void *)v50 + 5))
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      char v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      id v39 = NSStringFromSelector(aSelector);
      uint64_t v40 = *((void *)v50 + 5);
      *(_DWORD *)uint64_t v59 = 138412802;
      *(void *)&v59[4] = v38;
      __int16 v60 = 2112;
      uint64_t v61 = v39;
      __int16 v62 = 2112;
      uint64_t v63 = v40;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v59, 0x20u);
    }
    *a5 = *((id *)v50 + 5);
  }
  BOOL v32 = *((unsigned char *)v56 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v55, 8);
LABEL_24:

  return v32;
}

void __79__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 workoutRouteLabel:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"clusterUUID");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      BOOL v14 = 0;
      *a5 = v16;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
  if (!v10)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteLabel", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"workoutRouteLabel");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  *(void *)buf = 0;
  double v29 = buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__146;
  BOOL v32 = __Block_byref_object_dispose__146;
  id v33 = 0;
  dispatch_semaphore_t v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke;
  block[3] = &unk_1E6B96FC8;
  double v26 = &v34;
  void block[4] = self;
  id v24 = v9;
  id v25 = v11;
  dispatch_time_t v27 = buf;
  dispatch_sync(v12, block);

  if (a5 && *((void *)v29 + 5))
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      double v21 = NSStringFromSelector(a2);
      uint64_t v22 = *((void *)v29 + 5);
      *(_DWORD *)id v38 = 138412802;
      id v39 = v20;
      __int16 v40 = 2112;
      id v41 = v21;
      __int16 v42 = 2112;
      uint64_t v43 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v38, 0x20u);
    }
    *a5 = *((id *)v29 + 5);
  }
  BOOL v14 = *((unsigned char *)v35 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v34, 8);
LABEL_19:

  return v14;
}

void __75__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v2 _updateWorkoutClusterWithUUID:v3 workoutRouteLabel:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 workoutRouteLabel:(id)a4 error:(id *)a5
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"clusterUUID");
      id v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      BOOL v32 = 0;
      *a5 = v34;
      goto LABEL_24;
    }
LABEL_23:
    BOOL v32 = 0;
    goto LABEL_24;
  }
  if (!v10)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteLabel", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"workoutRouteLabel");
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  aSelector = a2;
  uint64_t v55 = 0;
  __int16 v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  *(void *)buf = 0;
  id v50 = buf;
  uint64_t v51 = 0x3032000000;
  BOOL v52 = __Block_byref_object_copy__146;
  id v53 = __Block_byref_object_dispose__146;
  id v54 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = self;
  dispatch_semaphore_t v14 = v12;
  id v15 = [(RTHealthKitManager *)v13 workoutClusterStore];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __76__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke;
  v45[3] = &unk_1E6B92050;
  id v47 = buf;
  id v48 = &v55;
  id v16 = v14;
  id v46 = v16;
  [v15 updateWorkoutRouteLabel:v11 forClusterUUID:v9 completion:v45];

  id v17 = (id *)(v50 + 40);
  id obj = (id)*((void *)v50 + 5);
  id v18 = v16;
  uint64_t v43 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v19 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    __int16 v42 = [MEMORY[0x1E4F1C9C8] now:aSelector];
    [v42 timeIntervalSinceDate:v43];
    double v21 = v20;
    uint64_t v22 = objc_opt_new();
    dispatch_time_t v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v25 = [v24 filteredArrayUsingPredicate:v23];
    double v26 = [v25 firstObject];

    [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
    dispatch_time_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v59 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
    }

    dispatch_semaphore_t v28 = (void *)MEMORY[0x1E4F28C58];
    v64[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v59 = @"semaphore wait timeout";
    double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v64 count:1];
    uint64_t v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

    if (v30)
    {
      id obj = v30;
    }
  }

  objc_storeStrong(v17, obj);
  if (a5 && *((void *)v50 + 5))
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      char v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      id v39 = NSStringFromSelector(aSelector);
      uint64_t v40 = *((void *)v50 + 5);
      *(_DWORD *)uint64_t v59 = 138412802;
      *(void *)&v59[4] = v38;
      __int16 v60 = 2112;
      uint64_t v61 = v39;
      __int16 v62 = 2112;
      uint64_t v63 = v40;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v59, 0x20u);
    }
    *a5 = *((id *)v50 + 5);
  }
  BOOL v32 = *((unsigned char *)v56 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v55, 8);
LABEL_24:

  return v32;
}

void __76__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchWorkoutClustersWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[RTHealthKitManager fetchWorkoutClustersWithHandler:]";
      __int16 v12 = 1024;
      int v13 = 2618;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v6 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__RTHealthKitManager_fetchWorkoutClustersWithHandler___block_invoke;
  v8[3] = &unk_1E6B90CE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __54__RTHealthKitManager_fetchWorkoutClustersWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutClustersWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchWorkoutClustersWithHandler:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutClustersWithHandler:]";
      __int16 v36 = 1024;
      int v37 = 2629;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [(RTHealthKitManager *)self workoutClusterStore];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __55__RTHealthKitManager__fetchWorkoutClustersWithHandler___block_invoke;
  BOOL v32 = &unk_1E6B90688;
  id v8 = v4;
  id v34 = v8;
  id v9 = v6;
  id v33 = v9;
  [v7 fetchWorkoutClustersWithCompletion:&v29];

  id v10 = v9;
  id v11 = [MEMORY[0x1E4F1C9C8] now:v29, v30, v31, v32];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_10;
  }
  int v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  id v16 = objc_opt_new();
  id v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
  id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  dispatch_time_t v19 = [v18 filteredArrayUsingPredicate:v17];
  double v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *MEMORY[0x1E4F5CFE8];
  v38[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v38 count:1];
  id v25 = [v22 errorWithDomain:v23 code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;
  }
  else
  {
LABEL_10:
    id v26 = 0;
  }

  id v27 = v26;
  if (v27)
  {
    dispatch_semaphore_t v28 = [MEMORY[0x1E4F1C978] array];
    (*((void (**)(id, void *, id))v8 + 2))(v8, v28, v27);
  }
}

intptr_t __55__RTHealthKitManager__fetchWorkoutClustersWithHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)fetchWorkoutClusterContainingWorkoutUUID:(id)a3 handler:(id)a4
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
    *(_DWORD *)buf = 136315394;
    id v18 = "-[RTHealthKitManager fetchWorkoutClusterContainingWorkoutUUID:handler:]";
    __int16 v19 = 1024;
    int v20 = 2649;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTHealthKitManager fetchWorkoutClusterContainingWorkoutUUID:handler:]";
      __int16 v19 = 1024;
      int v20 = 2650;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTHealthKitManager_fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __71__RTHealthKitManager_fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutClusterContainingWorkoutUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchWorkoutClusterContainingWorkoutUUID:(id)a3 handler:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterContainingWorkoutUUID:handler:]";
      __int16 v43 = 1024;
      int v44 = 2663;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v6) {
      goto LABEL_4;
    }
LABEL_15:
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F5CFE8];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    id v41 = @"requires valid UUID.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v33 = [v31 errorWithDomain:v32 code:0 userInfo:v13];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v33);
    goto LABEL_22;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterContainingWorkoutUUID:handler:]";
    __int16 v43 = 1024;
    int v44 = 2662;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8) {
    goto LABEL_12;
  }
LABEL_3:
  if (!v6) {
    goto LABEL_15;
  }
LABEL_4:
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(RTHealthKitManager *)self workoutClusterStore];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __72__RTHealthKitManager__fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke;
  v37[3] = &unk_1E6B9BDB8;
  id v11 = v8;
  id v39 = v11;
  id v12 = v9;
  id v38 = v12;
  [v10 fetchWorkoutClusterContainingWorkoutUUID:v6 completion:v37];

  id v13 = v12;
  double v14 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    id v35 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v36 = v14;
    [v35 timeIntervalSinceDate:v14];
    double v17 = v16;
    id v18 = objc_opt_new();
    __int16 v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    int v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    uint64_t v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F5CFE8];
    v45[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v45 count:1];
    id v27 = [v24 errorWithDomain:v25 code:15 userInfo:v26];

    if (v27)
    {
      id v28 = v27;
    }
    else
    {
      id v28 = 0;
    }
    double v14 = v36;
  }
  else
  {
    id v28 = 0;
  }

  id v34 = v28;
  if (v34) {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v34);
  }

  id v33 = v39;
LABEL_22:
}

intptr_t __72__RTHealthKitManager__fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:(id)a3 handler:(id)a4
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
  dispatch_semaphore_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[RTHealthKitManager fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
    __int16 v19 = 1024;
    int v20 = 2692;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTHealthKitManager fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
      __int16 v19 = 1024;
      int v20 = 2693;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__RTHealthKitManager_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __77__RTHealthKitManager_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:(id)a3 handler:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_8:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
      __int16 v43 = 1024;
      int v44 = 2706;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (!v6) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  dispatch_semaphore_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
    __int16 v43 = 1024;
    int v44 = 2705;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs (in %s:%d)", buf, 0x12u);
  }

  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  if (!v6) {
    goto LABEL_17;
  }
LABEL_11:
  if (![v6 count])
  {
LABEL_17:
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F5CFE8];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    id v41 = @"requires valid UUID.";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v33 = [v31 errorWithDomain:v32 code:0 userInfo:v15];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v33);
    goto LABEL_24;
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = [(RTHealthKitManager *)self workoutClusterStore];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __78__RTHealthKitManager__fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke;
  v37[3] = &unk_1E6B90688;
  id v13 = v8;
  id v39 = v13;
  double v14 = v11;
  id v38 = v14;
  [v12 fetchWorkoutClustersContainingWorkoutUUIDs:v6 completion:v37];

  id v15 = v14;
  id v16 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v17 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v15, v17))
  {
    id v35 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v36 = v16;
    [v35 timeIntervalSinceDate:v16];
    double v19 = v18;
    int v20 = objc_opt_new();
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v23 = [v22 filteredArrayUsingPredicate:v21];
    id v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F5CFE8];
    v45[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v45 count:1];
    uint64_t v29 = [v26 errorWithDomain:v27 code:15 userInfo:v28];

    if (v29)
    {
      id v30 = v29;
    }
    else
    {
      id v30 = 0;
    }
    id v16 = v36;
  }
  else
  {
    id v30 = 0;
  }

  id v34 = v30;
  if (v34) {
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v34);
  }

  id v33 = v39;
LABEL_24:
}

intptr_t __78__RTHealthKitManager__fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)fetchWorkoutUUIDsForClusterUUID:(id)a3 handler:(id)a4
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
  dispatch_semaphore_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    double v18 = "-[RTHealthKitManager fetchWorkoutUUIDsForClusterUUID:handler:]";
    __int16 v19 = 1024;
    int v20 = 2735;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v18 = "-[RTHealthKitManager fetchWorkoutUUIDsForClusterUUID:handler:]";
      __int16 v19 = 1024;
      int v20 = 2736;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  dispatch_semaphore_t v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTHealthKitManager_fetchWorkoutUUIDsForClusterUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __62__RTHealthKitManager_fetchWorkoutUUIDsForClusterUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutUUIDsForClusterUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchWorkoutUUIDsForClusterUUID:(id)a3 handler:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutUUIDsForClusterUUID:handler:]";
      __int16 v43 = 1024;
      int v44 = 2749;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v6) {
      goto LABEL_4;
    }
LABEL_15:
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F5CFE8];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    id v41 = @"requires valid UUID.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v33 = [v31 errorWithDomain:v32 code:0 userInfo:v13];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v33);
    goto LABEL_22;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutUUIDsForClusterUUID:handler:]";
    __int16 v43 = 1024;
    int v44 = 2748;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8) {
    goto LABEL_12;
  }
LABEL_3:
  if (!v6) {
    goto LABEL_15;
  }
LABEL_4:
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(RTHealthKitManager *)self workoutClusterStore];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __63__RTHealthKitManager__fetchWorkoutUUIDsForClusterUUID_handler___block_invoke;
  v37[3] = &unk_1E6B90688;
  id v11 = v8;
  id v39 = v11;
  id v12 = v9;
  id v38 = v12;
  [v10 fetchWorkoutUUIDsForClusterUUID:v6 completion:v37];

  id v13 = v12;
  double v14 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    id v35 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v36 = v14;
    [v35 timeIntervalSinceDate:v14];
    double v17 = v16;
    double v18 = objc_opt_new();
    __int16 v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    int v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    uint64_t v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F5CFE8];
    v45[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v45 count:1];
    uint64_t v27 = [v24 errorWithDomain:v25 code:15 userInfo:v26];

    if (v27)
    {
      id v28 = v27;
    }
    else
    {
      id v28 = 0;
    }
    double v14 = v36;
  }
  else
  {
    id v28 = 0;
  }

  id v34 = v28;
  if (v34) {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v34);
  }

  id v33 = v39;
LABEL_22:
}

intptr_t __63__RTHealthKitManager__fetchWorkoutUUIDsForClusterUUID_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 handler:(id)a4
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
  dispatch_semaphore_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    double v18 = "-[RTHealthKitManager fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
    __int16 v19 = 1024;
    int v20 = 2778;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v18 = "-[RTHealthKitManager fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
      __int16 v19 = 1024;
      int v20 = 2779;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTHealthKitManager_fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __70__RTHealthKitManager_fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutRouteSnapshotForClusterUUID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 handler:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
      __int16 v43 = 1024;
      int v44 = 2792;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v6) {
      goto LABEL_4;
    }
LABEL_15:
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F5CFE8];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    id v41 = @"requires valid UUID.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v33 = [v31 errorWithDomain:v32 code:0 userInfo:v13];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v33);
    goto LABEL_22;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
    __int16 v43 = 1024;
    int v44 = 2791;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8) {
    goto LABEL_12;
  }
LABEL_3:
  if (!v6) {
    goto LABEL_15;
  }
LABEL_4:
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(RTHealthKitManager *)self workoutClusterStore];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __71__RTHealthKitManager__fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke;
  v37[3] = &unk_1E6B9BDE0;
  id v11 = v8;
  id v39 = v11;
  id v12 = v9;
  id v38 = v12;
  [v10 fetchWorkoutRouteSnapshotForClusterUUID:v6 completion:v37];

  id v13 = v12;
  double v14 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    id v35 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v36 = v14;
    [v35 timeIntervalSinceDate:v14];
    double v17 = v16;
    double v18 = objc_opt_new();
    __int16 v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    int v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    uint64_t v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F5CFE8];
    v45[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v45 count:1];
    uint64_t v27 = [v24 errorWithDomain:v25 code:15 userInfo:v26];

    if (v27)
    {
      id v28 = v27;
    }
    else
    {
      id v28 = 0;
    }
    double v14 = v36;
  }
  else
  {
    id v28 = 0;
  }

  id v34 = v28;
  if (v34) {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v34);
  }

  id v33 = v39;
LABEL_22:
}

intptr_t __71__RTHealthKitManager__fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (BOOL)deleteWorkoutCluster:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    *(void *)buf = 0;
    double v16 = buf;
    uint64_t v17 = 0x3032000000;
    double v18 = __Block_byref_object_copy__146;
    __int16 v19 = __Block_byref_object_dispose__146;
    id v20 = 0;
    id v7 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__RTHealthKitManager_deleteWorkoutCluster_error___block_invoke;
    v11[3] = &unk_1E6B9BBD8;
    id v13 = &v21;
    v11[4] = self;
    id v12 = v6;
    double v14 = buf;
    dispatch_sync(v7, v11);

    if (a4) {
      *a4 = *((id *)v16 + 5);
    }
    BOOL v8 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    dispatch_semaphore_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutClusterUUID", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workoutClusterUUID");
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

void __49__RTHealthKitManager_deleteWorkoutCluster_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _deleteWorkoutCluster:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_deleteWorkoutCluster:(id)a3 error:(id *)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    aSelector = a2;
    *(void *)uint64_t v40 = 0;
    id v41 = v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    dispatch_semaphore_t v9 = [(RTHealthKitManager *)self workoutClusterStore];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __50__RTHealthKitManager__deleteWorkoutCluster_error___block_invoke;
    v37[3] = &unk_1E6B979A8;
    id v39 = v40;
    id v10 = v8;
    id v38 = v10;
    [v9 deleteWorkoutClusterWithUUID:v7 completion:v37];

    id v11 = v10;
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13)) {
      goto LABEL_7;
    }
    double v14 = [MEMORY[0x1E4F1C9C8] now:aSelector];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;
    uint64_t v17 = objc_opt_new();
    double v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    __int16 v19 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v20 = [v19 filteredArrayUsingPredicate:v18];
    uint64_t v21 = [v20 firstObject];

    [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    v49[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v49 count:1];
    uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

    if (v25)
    {
      id v26 = v25;
    }
    else
    {
LABEL_7:
      id v26 = 0;
    }

    id v27 = v26;
    id v28 = v27;
    if (a4 && v27)
    {
      uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        id v35 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v34;
        __int16 v45 = 2112;
        id v46 = v35;
        __int16 v47 = 2112;
        id v48 = v28;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      *a4 = v28;
    }
    BOOL v30 = v41[24] != 0;

    _Block_object_dispose(v40, 8);
  }
  else
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v40 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutClusterUUID", v40, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"workoutClusterUUID");
      BOOL v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v30 = 0;
    }
  }

  return v30;
}

intptr_t __50__RTHealthKitManager__deleteWorkoutCluster_error___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)generateRaceRouteClustersWithLimit:(unint64_t)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v14 = "-[RTHealthKitManager generateRaceRouteClustersWithLimit:handler:]";
      __int16 v15 = 1024;
      int v16 = 2863;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  dispatch_semaphore_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTHealthKitManager_generateRaceRouteClustersWithLimit_handler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__RTHealthKitManager_generateRaceRouteClustersWithLimit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateRaceRouteClustersWithLimit:*(void *)(a1 + 48) handler:*(void *)(a1 + 40)];
}

- (void)_generateRaceRouteClustersWithLimit:(unint64_t)a3 handler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_time_t v13 = "-[RTHealthKitManager _generateRaceRouteClustersWithLimit:handler:]";
      __int16 v14 = 1024;
      int v15 = 2875;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  dispatch_semaphore_t v8 = [(RTHealthKitManager *)self workoutClusterStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__RTHealthKitManager__generateRaceRouteClustersWithLimit_handler___block_invoke;
  v10[3] = &unk_1E6B93658;
  id v11 = v6;
  id v9 = v6;
  [v8 generateRaceRouteClustersWithLimit:a3 completion:v10];
}

uint64_t __66__RTHealthKitManager__generateRaceRouteClustersWithLimit_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getHealthKitDataWithStartDate:(id)a3 limit:(int64_t)a4 includeLocations:(BOOL)a5 includeOdometerReadings:(BOOL)a6 odometerSamplingIntervalComponents:(id)a7 error:(id *)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  if (v14)
  {
    if (a4 < 0)
    {
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[RTHealthKitManager getHealthKitDataWithStartDate:limit:includeLocations:includeOdometerRe"
                             "adings:odometerSamplingIntervalComponents:error:]";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2894;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
      }
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v36 = __Block_byref_object_copy__146;
    int v37 = __Block_byref_object_dispose__146;
    id v38 = 0;
    uint64_t v29 = 0;
    BOOL v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__146;
    id v33 = __Block_byref_object_dispose__146;
    id v34 = 0;
    uint64_t v17 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __140__RTHealthKitManager_getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke;
    block[3] = &unk_1E6B9BB88;
    char v24 = buf;
    void block[4] = self;
    id v22 = v14;
    int64_t v26 = a4;
    BOOL v27 = a5;
    BOOL v28 = a6;
    id v23 = v15;
    uint64_t v25 = &v29;
    dispatch_sync(v17, block);

    if (a8) {
      *a8 = (id) v30[5];
    }
    id v18 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v18 = [MEMORY[0x1E4F1C978] array];
  }

  return v18;
}

void __140__RTHealthKitManager_getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 81);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v2 _getHealthKitDataWithStartDate:v3 limit:v7 includeLocations:v5 includeOdometerReadings:v6 odometerSamplingIntervalComponents:v4 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)_getHealthKitDataWithStartDate:(id)a3 limit:(int64_t)a4 includeLocations:(BOOL)a5 includeOdometerReadings:(BOOL)a6 odometerSamplingIntervalComponents:(id)a7 error:(id *)a8
{
  BOOL v76 = a6;
  BOOL v92 = a5;
  v157[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v77 = a7;
  __int16 v68 = v10;
  if (v10)
  {
    if (a4 < 0)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[RTHealthKitManager _getHealthKitDataWithStartDate:limit:includeLocations:includeOdometerR"
                             "eadings:odometerSamplingIntervalComponents:error:]";
        __int16 v127 = 1024;
        LODWORD(v128) = 2920;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
      }
    }
    id v75 = (id)objc_opt_new();
    uint64_t v120 = 0;
    uint64_t v121 = &v120;
    uint64_t v122 = 0x3032000000;
    uint64_t v123 = __Block_byref_object_copy__146;
    __int16 v124 = __Block_byref_object_dispose__146;
    id v125 = (id)objc_opt_new();
    unint64_t v12 = [(RTHealthKitManager *)self getWorkoutDefaultSortDescriptors];
    dispatch_time_t v13 = [(RTHealthKitManager *)self _getRTWorkoutDefaultTypesForRaceRoute];
    id v119 = 0;
    id v14 = [(RTHealthKitManager *)self _getWorkoutsWithStartDate:v68 limit:a4 sortDescriptors:v12 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:1.79769313e308 workoutTypes:v13 error:&v119];
    id v82 = v119;

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id obj = v14;
    uint64_t v74 = [obj countByEnumeratingWithState:&v115 objects:v156 count:16];
    if (v74)
    {
      uint64_t v73 = *(void *)v116;
      if (v92) {
        id v15 = @"YES";
      }
      else {
        id v15 = @"NO";
      }
      uint64_t v86 = *MEMORY[0x1E4F5CFE8];
      if (v76) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      uint64_t v69 = v16;
      id v70 = v15;
      uint64_t v87 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v74; ++i)
        {
          if (*(void *)v116 != v73) {
            objc_enumerationMutation(obj);
          }
          uint64_t v85 = *(void **)(*((void *)&v115 + 1) + 8 * i);
          uint64_t v81 = (void *)MEMORY[0x1E016D870]();
          uint64_t v17 = objc_opt_new();
          [v17 setObject:v85 forKeyedSubscript:@"Workout"];
          id v84 = v17;
          id v18 = self;
          id v19 = v82;
          if (v76)
          {
            id v114 = v82;
            id v20 = [(RTHealthKitManager *)self _getOdometerReadingUsingWorkout:v85 samplingIntervalComponents:v77 error:&v114];
            id v19 = v114;

            if (v20 && [v20 count]) {
              [v84 setObject:v20 forKeyedSubscript:@"Odometer"];
            }

            id v18 = self;
          }
          id v113 = v19;
          uint64_t v21 = [(RTHealthKitManager *)v18 _getWorkoutRouteUsingWorkout:v85 error:&v113];
          id v82 = v113;

          v95 = objc_opt_new();
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v89 = v21;
          uint64_t v22 = [v89 countByEnumeratingWithState:&v109 objects:v155 count:16];
          if (v22)
          {
            uint64_t v99 = 0;
            uint64_t v93 = *(void *)v110;
            do
            {
              uint64_t v97 = v22;
              for (uint64_t j = 0; j != v97; ++j)
              {
                if (*(void *)v110 != v93) {
                  objc_enumerationMutation(v89);
                }
                uint64_t v102 = *(void *)(*((void *)&v109 + 1) + 8 * j);
                context = (void *)MEMORY[0x1E016D870]();
                char v24 = objc_opt_new();
                uint64_t v25 = objc_opt_new();
                if (v92)
                {
                  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
                  v104[0] = MEMORY[0x1E4F143A8];
                  v104[1] = 3221225472;
                  v104[2] = __141__RTHealthKitManager__getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke;
                  v104[3] = &unk_1E6B9BE08;
                  uint64_t v107 = &v120;
                  v104[4] = self;
                  SEL v108 = a2;
                  BOOL v27 = v26;
                  BOOL v105 = v27;
                  id v106 = v25;
                  [(RTHealthKitManager *)self _fetchWorkoutRouteLocationsUsingWorkoutRoute:v102 batchSize:0 fetchOnlyFirstFew:0 handler:v104];
                  BOOL v28 = v27;
                  uint64_t v29 = [MEMORY[0x1E4F1C9C8] now];
                  dispatch_time_t v30 = dispatch_time(0, 3600000000000);
                  if (!dispatch_semaphore_wait(v28, v30)) {
                    goto LABEL_33;
                  }
                  __int16 v90 = [MEMORY[0x1E4F1C9C8] now];
                  [v90 timeIntervalSinceDate:v29];
                  double v32 = v31;
                  id v33 = objc_opt_new();
                  id v34 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
                  id v35 = [MEMORY[0x1E4F29060] callStackSymbols];
                  __int16 v36 = [v35 filteredArrayUsingPredicate:v34];
                  int v37 = [v36 firstObject];

                  [v33 submitToCoreAnalytics:v37 type:1 duration:v32];
                  id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                  }

                  uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
                  v157[0] = v87;
                  *(void *)buf = @"semaphore wait timeout";
                  uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v157 count:1];
                  id v41 = [v39 errorWithDomain:v86 code:15 userInfo:v40];

                  if (v41)
                  {
                    id v42 = v41;
                  }
                  else
                  {
LABEL_33:
                    id v42 = 0;
                  }

                  id v43 = v42;
                  int v44 = v43;
                  if (v121[5] && v43)
                  {
                    __int16 v45 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                    {
                      id v46 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v46);
                      id v47 = (id)objc_claimAutoreleasedReturnValue();
                      id v48 = NSStringFromSelector(a2);
                      *(_DWORD *)buf = 138412802;
                      *(void *)&uint8_t buf[4] = v47;
                      __int16 v127 = 2112;
                      id v128 = v48;
                      __int16 v129 = 2112;
                      __int16 v130 = v44;
                      _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
                    }
                    [(id)v121[5] addObject:v44];

                    int v44 = 0;
                  }
                }
                [v24 setObject:v102 forKeyedSubscript:@"WorkoutRoute"];
                if ([v25 count])
                {
                  [v24 setObject:v25 forKeyedSubscript:@"WorkoutRouteLocations"];
                  v99 += [v25 count];
                }
                [v95 addObject:v24];
              }
              uint64_t v22 = [v89 countByEnumeratingWithState:&v109 objects:v155 count:16];
            }
            while (v22);
          }
          else
          {
            uint64_t v99 = 0;
          }

          if ([v95 count]) {
            [v84 setObject:v95 forKeyedSubscript:@"WorkoutRoutes"];
          }
          id v49 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            id v50 = (objc_class *)objc_opt_class();
            NSStringFromClass(v50);
            id v94 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v103 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v79 = [v85 UUID];
            id v91 = [v85 device];
            long long v78 = [v91 name];
            [objc_opt_class() stringFromWorkoutActivityType:[v85 workoutActivityType]];
            id v98 = (id)objc_claimAutoreleasedReturnValue();
            unint64_t v80 = [v85 startDate];
            id contexta = [v80 stringFromDate];
            uint64_t v51 = [v85 endDate];
            id v52 = [v51 stringFromDate];
            id v53 = objc_opt_class();
            [(RTHealthKitManager *)self _getDurationForWorkout:v85];
            [v53 stringFromTimeInterval:];
            id v54 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v55 = [(RTHealthKitManager *)self _getTotalDistanceForWorkout:v85];
            __int16 v56 = [MEMORY[0x1E4F2B618] meterUnit];
            [v55 doubleValueForUnit:v56];
            uint64_t v58 = v57;
            uint64_t v59 = [v84 objectForKeyedSubscript:@"Odometer"];
            uint64_t v60 = [v59 count];
            if (v60)
            {
              long long v72 = [v84 objectForKeyedSubscript:@"Odometer"];
              uint64_t v61 = v72;
            }
            else
            {
              uint64_t v61 = 0;
            }
            if (v77) {
              uint64_t v62 = [v77 second];
            }
            else {
              uint64_t v62 = 0;
            }
            +[RTRuntime footprint];
            *(_DWORD *)buf = 138415874;
            *(void *)&uint8_t buf[4] = v94;
            __int16 v127 = 2112;
            id v128 = v103;
            __int16 v129 = 2112;
            __int16 v130 = v79;
            __int16 v131 = 2112;
            __int16 v132 = v78;
            __int16 v133 = 2112;
            id v134 = v98;
            __int16 v135 = 2112;
            id v136 = contexta;
            __int16 v137 = 2112;
            id v138 = v52;
            __int16 v139 = 2112;
            id v140 = v54;
            __int16 v141 = 2048;
            uint64_t v142 = v58;
            __int16 v143 = 2048;
            uint64_t v144 = v99;
            __int16 v145 = 2048;
            v146 = v61;
            __int16 v147 = 2112;
            v148 = v70;
            __int16 v149 = 2112;
            v150 = v69;
            __int16 v151 = 2048;
            uint64_t v152 = v62;
            __int16 v153 = 2048;
            uint64_t v154 = v63;
            _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "%@, %@, workout UUID, %@, device, %@, workoutType, %@, startDate, %@, endDate, %@, duration, %@, totalDistance, %.3f meters, number of locations, %lu, number of odometer readings, %lu, include locations, %@, include Odometer Readings, %@, odometer sampling rate in seconds, %lu, footprint, %.2f MB", buf, 0x98u);
            if (v60) {
          }
            }
          [v75 addObject:v84];
        }
        uint64_t v74 = [obj countByEnumeratingWithState:&v115 objects:v156 count:16];
      }
      while (v74);
    }

    if (a8)
    {
      char v64 = _RTSafeArray();
      _RTMultiErrorCreate();
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v120, 8);
  }
  else
  {
    v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v75 = [MEMORY[0x1E4F1C978] array];
  }

  return v75;
}

void __141__RTHealthKitManager__getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (uint64_t v7 = [v5 count], !v6) && v7)
  {
    [*(id *)(a1 + 48) addObjectsFromArray:v5];
  }
  else
  {
    if (v6 && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
        int v12 = 138412802;
        dispatch_time_t v13 = v10;
        __int16 v14 = 2112;
        id v15 = v11;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", (uint8_t *)&v12, 0x20u);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];

      id v6 = 0;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

- (BOOL)saveEntireHealthKitDataToURL:(id)a3 outAbsoluteURL:(id *)a4 includeWorkoutData:(BOOL)a5 includeLocations:(BOOL)a6 includeOdometerReadings:(BOOL)a7 odometerSamplingIntervalComponents:(id)a8 includeClustersData:(BOOL)a9 error:(id *)a10
{
  id v17 = a3;
  id v18 = a8;
  id v19 = v18;
  if (!v17)
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }

    if (a10)
    {
      id v23 = @"url";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      BOOL v21 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    BOOL v21 = 0;
    goto LABEL_16;
  }
  if (!a4)
  {
    char v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAbsoluteURL", buf, 2u);
    }

    if (a10)
    {
      id v23 = @"outAbsoluteURL";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  dispatch_semaphore_t v26 = v18;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  *(void *)buf = 0;
  __int16 v45 = buf;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__146;
  id v48 = __Block_byref_object_dispose__146;
  id v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__146;
  id v42 = __Block_byref_object_dispose__146;
  id v43 = 0;
  id v20 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __187__RTHealthKitManager_saveEntireHealthKitDataToURL_outAbsoluteURL_includeWorkoutData_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_includeClustersData_error___block_invoke;
  block[3] = &unk_1E6B9BE30;
  SEL v33 = a2;
  void block[4] = self;
  dispatch_time_t v30 = &v50;
  id v28 = v17;
  double v31 = buf;
  BOOL v34 = a5;
  BOOL v35 = a6;
  BOOL v36 = a7;
  id v19 = v26;
  BOOL v37 = a9;
  id v29 = v26;
  double v32 = &v38;
  dispatch_sync(v20, block);

  *a4 = *((id *)v45 + 5);
  if (a10) {
    *a10 = (id) v39[5];
  }
  BOOL v21 = *((unsigned char *)v51 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v50, 8);
LABEL_16:

  return v21;
}

void __187__RTHealthKitManager_saveEntireHealthKitDataToURL_outAbsoluteURL_includeWorkoutData_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_includeClustersData_error___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 80));
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    double v32 = v5;
    __int16 v33 = 2112;
    BOOL v34 = v6;
    __int16 v35 = 2048;
    uint64_t v36 = v7;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "---------> %@, %@, start _saveEntireHealthKitDataToURL, footprint, %.2f MB <---------", buf, 0x20u);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 89);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 90);
  uint64_t v15 = *(void *)(a1 + 48);
  char v16 = *(unsigned char *)(a1 + 91);
  uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
  id v29 = *(id *)(v17 + 40);
  id obj = v11;
  LOBYTE(v28) = v16;
  char v18 = [v8 _saveEntireHealthKitDataToURL:v9 outAbsoluteURL:&obj includeWorkoutData:v12 includeLocations:v13 includeOdometerReadings:v14 odometerSamplingIntervalComponents:v15 includeClustersData:v28 error:&v29];
  objc_storeStrong((id *)(v10 + 40), obj);
  objc_storeStrong((id *)(v17 + 40), v29);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18;
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = (objc_class *)objc_opt_class();
    BOOL v21 = NSStringFromClass(v20);
    uint64_t v22 = NSStringFromSelector(*(SEL *)(a1 + 80));
    +[RTRuntime footprint];
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    dispatch_semaphore_t v26 = [MEMORY[0x1E4F1C9C8] date];
    [v26 timeIntervalSinceDate:v2];
    *(_DWORD *)buf = 138413314;
    double v32 = v21;
    __int16 v33 = 2112;
    BOOL v34 = v22;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    __int16 v37 = 2112;
    uint64_t v38 = v25;
    __int16 v39 = 2048;
    uint64_t v40 = v27;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "---------> %@, %@, finished _saveEntireHealthKitDataToURL, footprint, %.2f MB, error, %@, latency, %.2f <---------", buf, 0x34u);
  }
}

- (BOOL)_saveEntireHealthKitDataToURL:(id)a3 outAbsoluteURL:(id *)a4 includeWorkoutData:(BOOL)a5 includeLocations:(BOOL)a6 includeOdometerReadings:(BOOL)a7 odometerSamplingIntervalComponents:(id)a8 includeClustersData:(BOOL)a9 error:(id *)a10
{
  BOOL v127 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a8;
  uint64_t v17 = v16;
  if (!v15)
  {
    uint64_t v58 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }

    if (a10)
    {
      uint64_t v59 = @"url";
LABEL_52:
      _RTErrorInvalidParameterCreate((uint64_t)v59);
      char v61 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_88;
    }
LABEL_53:
    char v61 = 0;
    goto LABEL_88;
  }
  if (!a4)
  {
    uint64_t v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAbsoluteURL", buf, 2u);
    }

    if (a10)
    {
      uint64_t v59 = @"outAbsoluteURL";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  BOOL v114 = v11;
  long long v112 = a4;
  id v119 = v16;
  char v18 = objc_opt_new();
  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = NSString;
  BOOL v21 = objc_opt_class();
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v23 = [v21 stringFromDate:v22 dateFormat:@"yyyy-MM-dd-HH-mm-ss-SSS"];
  uint64_t v24 = [v20 stringWithFormat:@"RaceRoute-%@", v23];

  long long v116 = (void *)v24;
  uint64_t v122 = [v15 URLByAppendingPathComponent:v24];
  uint64_t v25 = [v122 path];
  long long v118 = v19;
  LOBYTE(v23) = [v19 fileExistsAtPath:v25 isDirectory:0];

  dispatch_semaphore_t v26 = 0;
  if ((v23 & 1) == 0)
  {
    id v138 = 0;
    [v19 createDirectoryAtURL:v122 withIntermediateDirectories:1 attributes:0 error:&v138];
    id v27 = v138;
    dispatch_semaphore_t v26 = v27;
    if (v18)
    {
      if (v27)
      {
        uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v99 = (objc_class *)objc_opt_class();
          uint64_t v100 = NSStringFromClass(v99);
          uint64_t v101 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          id v142 = v100;
          __int16 v143 = 2112;
          uint64_t v144 = (uint64_t)v101;
          __int16 v145 = 2112;
          uint64_t v146 = (uint64_t)v26;
          _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
        }
        [v18 addObject:v26];

        dispatch_semaphore_t v26 = 0;
      }
    }
  }
  id v29 = objc_opt_new();
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"Workout"];
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"WorkoutRoute"];
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"WorkoutRouteLocations"];
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"Odometer"];
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"TotalWorkoutRouteLocations"];
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"TotalOdometer"];
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"TotalClusters"];
  uint64_t v120 = v29;
  [v29 setObject:&unk_1F3452460 forKeyedSubscript:@"TotalWorkoutsInClusters"];
  id v30 = [MEMORY[0x1E4F1C9C8] distantPast];
  __int16 v124 = [MEMORY[0x1E4F1C9C8] distantFuture];
  double v31 = 0;
  long long v117 = v15;
  aSelector = a2;
  if (!v12 || (id v32 = v119, !v30))
  {
    id v36 = v26;
    uint64_t v123 = 0;
    __int16 v33 = self;
    goto LABEL_56;
  }
  double v31 = 0;
  uint64_t v123 = 0;
  __int16 v33 = self;
  while (1)
  {
    BOOL v34 = v31;
    __int16 v35 = (void *)MEMORY[0x1E016D870]();
    id v137 = v26;
    double v31 = [(RTHealthKitManager *)v33 _getHealthKitDataWithStartDate:v30 limit:1 includeLocations:0 includeOdometerReadings:v127 odometerSamplingIntervalComponents:v32 error:&v137];
    id v36 = v137;

    if (v18 && v36)
    {
      __int16 v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v49 = (objc_class *)objc_opt_class();
        uint64_t v50 = NSStringFromClass(v49);
        uint64_t v51 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        id v142 = v50;
        __int16 v143 = 2112;
        uint64_t v144 = (uint64_t)v51;
        __int16 v145 = 2112;
        uint64_t v146 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

        id v32 = v119;
      }

      [v18 addObject:v36];
      dispatch_semaphore_t v26 = 0;
      goto LABEL_41;
    }
    if (!v31 || ![v31 count]) {
      break;
    }
    id v136 = v30;
    id v135 = v124;
    [(RTHealthKitManager *)v33 _updateHealthKitStartDatesUsingData:v31 currentStartDate:&v136 nextStartDate:&v135];
    id v38 = v136;

    id v39 = v135;
    uint64_t v40 = NSString;
    uint64_t v41 = [(id)objc_opt_class() stringFromDate:v38 dateFormat:@"yyyy-MM-dd-HH-mm-ss-SSS"];
    id v42 = [v40 stringWithFormat:@"Workouts-StartDate-%@", v41];
    id v43 = [v122 URLByAppendingPathComponent:v42];

    int v44 = [v43 path];
    LOBYTE(v41) = [v118 fileExistsAtPath:v44 isDirectory:0];

    if (v41) {
      goto LABEL_20;
    }
    id v134 = v36;
    [v118 createDirectoryAtURL:v43 withIntermediateDirectories:1 attributes:0 error:&v134];
    id v47 = v134;

    if (!v18)
    {
      id v36 = v47;
LABEL_20:
      __int16 v33 = self;
      goto LABEL_21;
    }
    __int16 v33 = self;
    if (v47)
    {
      id v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      goto LABEL_34;
    }
    id v36 = 0;
LABEL_21:
    __int16 v45 = v36;
    id v133 = v36;
    [(RTHealthKitManager *)v33 _dumpHealthKitMetaData:v31 dir:v43 stats:v120 error:&v133];
    id v36 = v133;

    if (v18 && v36)
    {
      uint64_t v46 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v52 = (objc_class *)objc_opt_class();
        id v125 = NSStringFromClass(v52);
        uint64_t v53 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        id v142 = v125;
        __int16 v143 = 2112;
        uint64_t v144 = v53;
        id v54 = (void *)v53;
        __int16 v145 = 2112;
        uint64_t v146 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
      }
      [v18 addObject:v36];
      dispatch_semaphore_t v26 = 0;
      goto LABEL_35;
    }
    if (!v114) {
      goto LABEL_39;
    }
    id v132 = v36;
    [(RTHealthKitManager *)v33 _dumpWorkoutLocationsUsingData:v31 dir:v43 stats:v120 error:&v132];
    id v47 = v132;

    if (!v18 || !v47)
    {
      id v36 = v47;
LABEL_39:
      dispatch_semaphore_t v26 = v36;
      id v30 = v39;
      id v36 = v38;
      __int16 v124 = v30;
      goto LABEL_40;
    }
    id v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
LABEL_43:
      uint64_t v55 = (objc_class *)objc_opt_class();
      __int16 v126 = NSStringFromClass(v55);
      uint64_t v56 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      id v142 = v126;
      __int16 v143 = 2112;
      uint64_t v144 = v56;
      uint64_t v57 = (void *)v56;
      __int16 v145 = 2112;
      uint64_t v146 = (uint64_t)v47;
      _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);
    }
LABEL_34:

    [v18 addObject:v47];
    dispatch_semaphore_t v26 = 0;
    id v36 = v47;
LABEL_35:
    __int16 v124 = v39;
    id v30 = v38;
LABEL_40:
    uint64_t v123 = v43;
    id v32 = v119;
LABEL_41:

    if (!v30)
    {
      id v36 = v26;
      goto LABEL_56;
    }
  }
LABEL_56:
  BOOL v62 = a9;
  uint64_t v63 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    char v64 = (objc_class *)objc_opt_class();
    id v128 = NSStringFromClass(v64);
    v65 = NSStringFromSelector(aSelector);
    long long v115 = [v120 objectForKeyedSubscript:@"Workout"];
    uint64_t v108 = [v115 integerValue];
    long long v111 = [v120 objectForKeyedSubscript:@"WorkoutRoute"];
    uint64_t v107 = [v111 integerValue];
    long long v110 = [v120 objectForKeyedSubscript:@"WorkoutRouteLocations"];
    uint64_t v106 = [v110 integerValue];
    long long v109 = [v120 objectForKeyedSubscript:@"TotalWorkoutRouteLocations"];
    uint64_t v105 = [v109 integerValue];
    __int16 v66 = [v120 objectForKeyedSubscript:@"Odometer"];
    uint64_t v67 = [v66 integerValue];
    __int16 v68 = [v120 objectForKeyedSubscript:@"TotalOdometer"];
    uint64_t v69 = [v68 integerValue];
    *(_DWORD *)buf = 138414082;
    id v142 = v128;
    __int16 v143 = 2112;
    uint64_t v144 = (uint64_t)v65;
    __int16 v145 = 2048;
    uint64_t v146 = v108;
    __int16 v147 = 2048;
    uint64_t v148 = v107;
    __int16 v149 = 2048;
    uint64_t v150 = v106;
    __int16 v151 = 2048;
    uint64_t v152 = v105;
    __int16 v153 = 2048;
    uint64_t v154 = v67;
    BOOL v62 = a9;
    __int16 v155 = 2048;
    uint64_t v156 = v69;
    _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_INFO, "%@, %@, For running or cycling, workouts count, %lu, workout routes count, %lu, workout route locations count, %lu, total workout route locations count, %lu, odometer readings count, %lu, total odometer readings count, %lu", buf, 0x52u);
  }
  if (v62)
  {
    id v70 = [v122 URLByAppendingPathComponent:@"1_Clusters"];
    id v131 = v36;
    [(RTHealthKitManager *)v33 _dumpWorkoutClusterAtDir:v70 stats:v120 error:&v131];
    id v71 = v131;

    if (v18 && v71)
    {
      long long v72 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        uint64_t v102 = (objc_class *)objc_opt_class();
        id v103 = NSStringFromClass(v102);
        v104 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        id v142 = v103;
        __int16 v143 = 2112;
        uint64_t v144 = (uint64_t)v104;
        __int16 v145 = 2112;
        uint64_t v146 = (uint64_t)v71;
        _os_log_error_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
      }
      [v18 addObject:v71];

      id v36 = 0;
    }
    else
    {
      id v36 = v71;
    }
  }
  uint64_t v73 = [v122 URLByAppendingPathComponent:@"2_Summary.json"];
  id v130 = v36;
  [(RTHealthKitManager *)v33 _writeToJSONAtURL:v73 data:v120 error:&v130];
  id v74 = v130;

  if (v18 && v74)
  {
    id v75 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      uint64_t v93 = (objc_class *)objc_opt_class();
      id v94 = NSStringFromClass(v93);
      v95 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      id v142 = v94;
      __int16 v143 = 2112;
      uint64_t v144 = (uint64_t)v95;
      __int16 v145 = 2112;
      uint64_t v146 = (uint64_t)v74;
      _os_log_error_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
    }
    [v18 addObject:v74];

    id v74 = 0;
  }
  BOOL v76 = [NSString stringWithFormat:@"%@.tar.gz", v116];
  id v77 = [v117 URLByAppendingPathComponent:v76];

  long long v78 = [[RTArchiver alloc] initWithOutputURL:v77 compress:1];
  __int16 v79 = v78;
  if (v78)
  {
    [(RTArchiver *)v78 addDirectoryToArchive:v122];
    [(RTArchiver *)v79 closeArchive];
    id v80 = v77;
    *long long v112 = v80;
    uint64_t v81 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      id v82 = [v80 absoluteString];
      *(_DWORD *)buf = 138412290;
      id v142 = v82;
      _os_log_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_INFO, "Archive created at, %@", buf, 0xCu);
    }
    id v129 = v74;
    __int16 v83 = v118;
    [v118 removeItemAtURL:v122 error:&v129];
    id v84 = v129;

    if (v18 && v84)
    {
      uint64_t v85 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v96 = (objc_class *)objc_opt_class();
        uint64_t v97 = NSStringFromClass(v96);
        id v98 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        id v142 = v97;
        __int16 v143 = 2112;
        uint64_t v144 = (uint64_t)v98;
        __int16 v145 = 2112;
        uint64_t v146 = (uint64_t)v84;
        _os_log_error_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

        __int16 v83 = v118;
      }

      [v18 addObject:v84];
      id v84 = 0;
    }
    if ([v18 count])
    {
      char v61 = (char)a10;
      if (a10)
      {
        uint64_t v86 = _RTSafeArray();
        _RTMultiErrorCreate();
        *a10 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_85;
      }
    }
    else
    {
      char v61 = 1;
    }
  }
  else
  {
    uint64_t v87 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v88 = *MEMORY[0x1E4F5CFE8];
    uint64_t v139 = *MEMORY[0x1E4F28568];
    id v89 = [NSString stringWithFormat:@"error while creating archive at destination url, %@", v77];
    id v140 = v89;
    __int16 v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
    id v84 = [v87 errorWithDomain:v88 code:7 userInfo:v90];

    id v91 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v142 = v84;
      _os_log_error_impl(&dword_1D9BFA000, v91, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
    }

    __int16 v83 = v118;
    if (a10)
    {
      id v84 = v84;
      char v61 = 0;
      *a10 = v84;
    }
    else
    {
LABEL_85:
      char v61 = 0;
    }
  }

  id v15 = v117;
  uint64_t v17 = v119;
LABEL_88:

  return v61;
}

- (void)_updateHealthKitStartDatesUsingData:(id)a3 currentStartDate:(id *)a4 nextStartDate:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  *a4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  *a5 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v23 + 1) + 8 * v12) objectForKeyedSubscript:@"Workout"];
        uint64_t v14 = [v13 startDate];

        if (v14)
        {
          id v15 = *a5;
          id v16 = [v13 startDate];
          uint64_t v17 = [v15 compare:v16];

          if (v17 == -1)
          {
            *a5 = [v13 startDate];
          }
          id v18 = *a4;
          id v19 = [v13 startDate];
          uint64_t v20 = [v18 compare:v19];

          if (v20 == 1)
          {
            *a4 = [v13 startDate];
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id v21 = *a5;
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] distantPast];
  LOBYTE(v21) = [v21 isEqualToDate:v22];

  if ((v21 & 1) == 0)
  {
    *a5 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:*a5 sinceDate:0.001];
  }
}

- (id)_convertHealthKitDataToJSONCompatibleType:(id)a3 stats:(id)a4
{
  uint64_t v233 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    v166 = v6;
    id v177 = (id)objc_opt_new();
    long long v224 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    id v167 = v5;
    id obj = v5;
    uint64_t v178 = [obj countByEnumeratingWithState:&v224 objects:v232 count:16];
    if (v178)
    {
      uint64_t v186 = 0;
      uint64_t v182 = 0;
      uint64_t v202 = 0;
      uint64_t v198 = 0;
      uint64_t v199 = 0;
      uint64_t v179 = 0;
      uint64_t v173 = *MEMORY[0x1E4F2BB98];
      uint64_t v172 = *MEMORY[0x1E4F2BBA0];
      uint64_t v170 = *MEMORY[0x1E4F2BB78];
      uint64_t v171 = *MEMORY[0x1E4F2BBA8];
      uint64_t v168 = *MEMORY[0x1E4F2BB88];
      uint64_t v169 = *MEMORY[0x1E4F2BB80];
      id v8 = @"WorkoutRoute";
      uint64_t v9 = @"WorkoutRouteLocations";
      uint64_t v175 = *MEMORY[0x1E4F2BB90];
      uint64_t v176 = *(void *)v225;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v225 != v176)
          {
            uint64_t v11 = v10;
            objc_enumerationMutation(obj);
            uint64_t v10 = v11;
          }
          uint64_t v181 = v10;
          uint64_t v12 = *(void **)(*((void *)&v224 + 1) + 8 * v10);
          v180 = (void *)MEMORY[0x1E016D870]();
          uint64_t v13 = objc_opt_new();
          v183 = v12;
          uint64_t v14 = [v12 objectForKeyedSubscript:@"Workout"];
          v184 = v13;
          v185 = v14;
          if (v14)
          {
            id v15 = v14;
            id v16 = [v14 UUID];
            uint64_t v17 = [v16 UUIDString];
            [v13 setObject:v17 forKeyedSubscript:@"UUID"];

            id v18 = [v15 device];
            id v19 = [v18 name];
            [v13 setObject:v19 forKeyedSubscript:@"Device"];

            uint64_t v20 = [v15 sourceRevision];

            if (v20)
            {
              id v21 = [v15 sourceRevision];
              uint64_t v22 = [v21 source];
              long long v23 = [v22 name];
              [v13 setObject:v23 forKeyedSubscript:@"SourceName"];

              long long v24 = [v185 sourceRevision];
              long long v25 = [v24 source];
              long long v26 = [v25 bundleIdentifier];
              [v13 setObject:v26 forKeyedSubscript:@"SourceBundleIdentifier"];

              id v27 = [v185 sourceRevision];
              uint64_t v28 = [v27 version];
              [v13 setObject:v28 forKeyedSubscript:@"Version"];

              id v29 = [v185 sourceRevision];
              id v30 = [v29 productType];
              [v13 setObject:v30 forKeyedSubscript:@"ProductType"];

              double v31 = NSString;
              id v32 = [v185 sourceRevision];
              __int16 v33 = v32;
              if (v32)
              {
                [v32 operatingSystemVersion];
                uint64_t v34 = v221;
              }
              else
              {
                uint64_t v34 = 0;
                uint64_t v222 = 0;
                uint64_t v221 = 0;
                uint64_t v223 = 0;
              }
              __int16 v35 = [v185 sourceRevision];
              id v36 = v35;
              if (v35)
              {
                [v35 operatingSystemVersion];
                uint64_t v37 = v219;
              }
              else
              {
                uint64_t v37 = 0;
                uint64_t v219 = 0;
                uint64_t v218 = 0;
                uint64_t v220 = 0;
              }
              id v38 = [v185 sourceRevision];
              id v39 = v38;
              if (v38)
              {
                [v38 operatingSystemVersion];
                uint64_t v40 = v217;
              }
              else
              {
                uint64_t v40 = 0;
                uint64_t v215 = 0;
                uint64_t v216 = 0;
                uint64_t v217 = 0;
              }
              uint64_t v41 = [v31 stringWithFormat:@"%lu.%lu.%lu", v34, v37, v40];
              [v13 setObject:v41 forKeyedSubscript:@"OperatingSystemVersion"];

              id v15 = v185;
            }
            id v42 = [NSNumber numberWithInteger:[v15 workoutActivityType]];
            [v13 setObject:v42 forKeyedSubscript:@"WorkoutEnum"];

            id v43 = [objc_opt_class() stringFromWorkoutActivityType:[v15 workoutActivityType]];
            [v13 setObject:v43 forKeyedSubscript:@"WorkoutType"];

            int v44 = objc_opt_class();
            __int16 v45 = [v15 startDate];
            uint64_t v46 = [v44 stringFromDate:v45 dateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
            [v13 setObject:v46 forKeyedSubscript:@"StartDate"];

            id v47 = objc_opt_class();
            id v48 = [v185 endDate];
            id v49 = [v47 stringFromDate:v48 dateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
            [v13 setObject:v49 forKeyedSubscript:@"EndDate"];

            uint64_t v50 = NSNumber;
            [v185 duration];
            uint64_t v51 = [v50 numberWithDouble:x0];
            [v13 setObject:v51 forKeyedSubscript:@"TotalDuration"];

            uint64_t v52 = NSNumber;
            uint64_t v53 = [v185 totalDistance];
            id v54 = [MEMORY[0x1E4F2B618] meterUnit];
            [v53 doubleValueForUnit:v54];
            uint64_t v55 = [v52 numberWithDouble:];
            [v13 setObject:v55 forKeyedSubscript:@"TotalDistance"];

            uint64_t v56 = NSNumber;
            uint64_t v57 = [v185 totalEnergyBurned];
            uint64_t v58 = [MEMORY[0x1E4F2B618] largeCalorieUnit];
            [v57 doubleValueForUnit:v58];
            uint64_t v59 = [v56 numberWithDouble:];
            [v13 setObject:v59 forKeyedSubscript:@"TotalEnergyBurned"];

            uint64_t v60 = NSNumber;
            char v61 = [v185 totalFlightsClimbed];
            BOOL v62 = [MEMORY[0x1E4F2B618] countUnit];
            [v61 doubleValueForUnit:v62];
            uint64_t v63 = [v60 numberWithDouble:];
            [v13 setObject:v63 forKeyedSubscript:@"TotalFlightsClimbed"];

            char v64 = v185;
            if ([(RTHealthKitManager *)self _doesWorkoutHaveSubsetRoute:v185])
            {
              v65 = objc_opt_class();
              __int16 v66 = [v185 metadata];
              uint64_t v67 = [v66 objectForKeyedSubscript:v173];
              __int16 v68 = [v65 stringFromDate:v67 dateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
              [v13 setObject:v68 forKeyedSubscript:v173];

              uint64_t v69 = [v185 metadata];
              id v70 = [v69 objectForKeyedSubscript:v172];
              [v13 setObject:v70 forKeyedSubscript:v172];

              id v71 = [v185 metadata];
              long long v72 = [v71 objectForKeyedSubscript:v171];
              [v13 setObject:v72 forKeyedSubscript:v171];

              uint64_t v73 = objc_opt_class();
              id v74 = [v185 metadata];
              id v75 = [v74 objectForKeyedSubscript:v170];
              BOOL v76 = [v73 stringFromDate:v75 dateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
              [v13 setObject:v76 forKeyedSubscript:v170];

              id v77 = [v185 metadata];
              long long v78 = [v77 objectForKeyedSubscript:v169];
              [v13 setObject:v78 forKeyedSubscript:v169];

              __int16 v79 = [v185 metadata];
              id v80 = [v79 objectForKeyedSubscript:v168];
              char v64 = v185;
              [v13 setObject:v80 forKeyedSubscript:v168];
            }
            ++v179;
            uint64_t v81 = [v64 metadata];
            id v82 = [v81 objectForKeyedSubscript:v175];

            if (v82)
            {
              __int16 v83 = [v64 metadata];
              id v84 = [v83 objectForKeyedSubscript:v175];
              [v13 setObject:v84 forKeyedSubscript:v175];
            }
            uint64_t v9 = @"WorkoutRouteLocations";
          }
          uint64_t v85 = objc_opt_new();
          long long v211 = 0u;
          long long v212 = 0u;
          long long v213 = 0u;
          long long v214 = 0u;
          id v187 = [v183 objectForKeyedSubscript:@"WorkoutRoutes"];
          v191 = v85;
          uint64_t v192 = [v187 countByEnumeratingWithState:&v211 objects:v231 count:16];
          if (v192)
          {
            id v188 = *(id *)v212;
            do
            {
              for (uint64_t i = 0; i != v192; ++i)
              {
                if (*(id *)v212 != v188) {
                  objc_enumerationMutation(v187);
                }
                uint64_t v87 = *(void **)(*((void *)&v211 + 1) + 8 * i);
                uint64_t v88 = (void *)MEMORY[0x1E016D870]();
                id v89 = objc_opt_new();
                __int16 v90 = [v87 objectForKeyedSubscript:v8];

                context = v89;
                if (v90)
                {
                  ++v198;
                  id v91 = v8;
                  BOOL v92 = [v87 objectForKeyedSubscript:v8];
                  [v92 UUID];
                  id v94 = v93 = v9;
                  v95 = [v94 UUIDString];
                  [v89 setObject:v95 forKeyedSubscript:@"UUID"];

                  uint64_t v9 = v93;
                }
                else
                {
                  id v91 = v8;
                }
                v96 = [v87 objectForKeyedSubscript:v9];

                if (v96)
                {
                  v194 = v88;
                  uint64_t v196 = i;
                  uint64_t v97 = [v87 objectForKeyedSubscript:v9];
                  id v98 = objc_opt_new();
                  uint64_t v99 = [v97 count];
                  uint64_t v100 = v199;
                  if (v99) {
                    uint64_t v100 = v199 + 1;
                  }
                  uint64_t v199 = v100;
                  long long v207 = 0u;
                  long long v208 = 0u;
                  long long v209 = 0u;
                  long long v210 = 0u;
                  id v101 = v97;
                  uint64_t v102 = [v101 countByEnumeratingWithState:&v207 objects:v230 count:16];
                  if (v102)
                  {
                    uint64_t v103 = v102;
                    uint64_t v104 = *(void *)v208;
                    do
                    {
                      for (uint64_t j = 0; j != v103; ++j)
                      {
                        if (*(void *)v208 != v104) {
                          objc_enumerationMutation(v101);
                        }
                        uint64_t v106 = *(void **)(*((void *)&v207 + 1) + 8 * j);
                        uint64_t v107 = (void *)MEMORY[0x1E016D870]();
                        uint64_t v108 = [v106 jsonObject];
                        long long v109 = (void *)[v108 mutableCopy];

                        long long v110 = NSNumber;
                        long long v111 = [v106 timestamp];
                        [v111 timeIntervalSince1970];
                        long long v112 = [v110 numberWithDouble:x0];
                        [v109 setObject:v112 forKeyedSubscript:@"timestamp"];

                        [v98 addObject:v109];
                      }
                      v202 += v103;
                      uint64_t v103 = [v101 countByEnumeratingWithState:&v207 objects:v230 count:16];
                    }
                    while (v103);
                  }

                  id v113 = context;
                  [context setObject:v98 forKeyedSubscript:@"Locations"];
                  BOOL v114 = [NSNumber numberWithUnsignedInteger:[v98 count]];
                  [context setObject:v114 forKeyedSubscript:@"LocationsCount"];

                  id v8 = @"WorkoutRoute";
                  uint64_t v9 = @"WorkoutRouteLocations";
                  uint64_t v85 = v191;
                  uint64_t v88 = v194;
                  uint64_t i = v196;
                }
                else
                {
                  id v113 = v89;
                  id v8 = v91;
                  uint64_t v85 = v191;
                }
                if ([v113 count]) {
                  [v85 addObject:v113];
                }
              }
              uint64_t v192 = [v187 countByEnumeratingWithState:&v211 objects:v231 count:16];
            }
            while (v192);
          }

          if ([v85 count]) {
            [v184 setObject:v85 forKeyedSubscript:@"WorkoutRoutes"];
          }
          long long v115 = objc_opt_new();
          long long v116 = [v183 objectForKeyedSubscript:@"Odometer"];

          uint64_t v117 = v182;
          if (v116) {
            uint64_t v117 = v182 + 1;
          }
          uint64_t v182 = v117;
          long long v205 = 0u;
          long long v206 = 0u;
          long long v203 = 0u;
          long long v204 = 0u;
          id v189 = [v183 objectForKeyedSubscript:@"Odometer"];
          uint64_t v197 = [v189 countByEnumeratingWithState:&v203 objects:v229 count:16];
          if (v197)
          {
            uint64_t v193 = *(void *)v204;
            v195 = v115;
            do
            {
              for (uint64_t k = 0; k != v197; ++k)
              {
                if (*(void *)v204 != v193) {
                  objc_enumerationMutation(v189);
                }
                id v119 = *(void **)(*((void *)&v203 + 1) + 8 * k);
                id contexta = (void *)MEMORY[0x1E016D870]();
                uint64_t v120 = objc_opt_new();
                uint64_t v121 = NSNumber;
                uint64_t v122 = [v119 startDate];
                [v122 timeIntervalSince1970];
                uint64_t v123 = [v121 numberWithDouble:];
                [v120 setObject:v123 forKeyedSubscript:@"StartDate"];

                __int16 v124 = NSNumber;
                id v125 = [v119 endDate];
                [v125 timeIntervalSince1970];
                __int16 v126 = [v124 numberWithDouble:];
                [v120 setObject:v126 forKeyedSubscript:@"EndDate"];

                BOOL v127 = objc_opt_class();
                id v128 = [v119 startDate];
                id v129 = [v127 stringFromDate:v128 dateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
                [v120 setObject:v129 forKeyedSubscript:@"StartDate"];

                id v130 = objc_opt_class();
                id v131 = [v119 endDate];
                id v132 = [v130 stringFromDate:v131 dateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
                [v120 setObject:v132 forKeyedSubscript:@"EndDate"];

                id v133 = NSNumber;
                id v134 = [v119 sumQuantity];
                id v135 = [MEMORY[0x1E4F2B618] meterUnit];
                [v134 doubleValueForUnit:v135];
                id v136 = [v133 numberWithDouble:];
                [v120 setObject:v136 forKeyedSubscript:@"SumQuantity"];

                long long v115 = v195;
                [v195 addObject:v120];
              }
              v186 += v197;
              uint64_t v197 = [v189 countByEnumeratingWithState:&v203 objects:v229 count:16];
            }
            while (v197);
          }

          if ([v115 count])
          {
            [v184 setObject:v115 forKeyedSubscript:@"Odometer"];
            id v137 = NSNumber;
            id v138 = [v183 objectForKeyedSubscript:@"Odometer"];
            uint64_t v139 = [v137 numberWithUnsignedInteger:[v138 count]];
            [v184 setObject:v139 forKeyedSubscript:@"OdometerCount"];
          }
          [v177 addObject:v184];

          uint64_t v10 = v181 + 1;
          id v8 = @"WorkoutRoute";
          uint64_t v9 = @"WorkoutRouteLocations";
        }
        while (v181 + 1 != v178);
        uint64_t v178 = [obj countByEnumeratingWithState:&v224 objects:v232 count:16];
      }
      while (v178);
    }
    else
    {
      uint64_t v186 = 0;
      uint64_t v182 = 0;
      uint64_t v202 = 0;
      uint64_t v198 = 0;
      uint64_t v199 = 0;
      uint64_t v179 = 0;
    }

    id v7 = v166;
    if (v166)
    {
      __int16 v141 = [v166 objectForKeyedSubscript:@"Workout"];

      id v5 = v167;
      if (v141)
      {
        id v142 = NSNumber;
        __int16 v143 = [v166 objectForKeyedSubscript:@"Workout"];
        uint64_t v144 = [v142 numberWithInteger:[v143 integerValue] + v179];
        [v166 setObject:v144 forKeyedSubscript:@"Workout"];
      }
      __int16 v145 = [v166 objectForKeyedSubscript:@"WorkoutRoute"];

      if (v145)
      {
        uint64_t v146 = NSNumber;
        __int16 v147 = [v166 objectForKeyedSubscript:@"WorkoutRoute"];
        uint64_t v148 = [v146 numberWithInteger:[v147 integerValue] + v198];
        [v166 setObject:v148 forKeyedSubscript:@"WorkoutRoute"];
      }
      __int16 v149 = [v166 objectForKeyedSubscript:@"WorkoutRouteLocations"];

      if (v149)
      {
        uint64_t v150 = NSNumber;
        __int16 v151 = [v166 objectForKeyedSubscript:@"WorkoutRouteLocations"];
        uint64_t v152 = [v150 numberWithInteger:[v151 integerValue] + v199];
        [v166 setObject:v152 forKeyedSubscript:@"WorkoutRouteLocations"];
      }
      __int16 v153 = [v166 objectForKeyedSubscript:@"Odometer"];

      if (v153)
      {
        uint64_t v154 = NSNumber;
        __int16 v155 = [v166 objectForKeyedSubscript:@"Odometer"];
        uint64_t v156 = [v154 numberWithInteger:objc_msgSend(v155, "integerValue") + v182];
        [v166 setObject:v156 forKeyedSubscript:@"Odometer"];
      }
      uint64_t v157 = [v166 objectForKeyedSubscript:@"TotalWorkoutRouteLocations"];

      if (v157)
      {
        v158 = NSNumber;
        v159 = [v166 objectForKeyedSubscript:@"TotalWorkoutRouteLocations"];
        v160 = [v158 numberWithInteger:[v159 integerValue] + v202];
        [v166 setObject:v160 forKeyedSubscript:@"TotalWorkoutRouteLocations"];
      }
      v161 = [v166 objectForKeyedSubscript:@"TotalOdometer"];

      if (v161)
      {
        v162 = NSNumber;
        v163 = [v166 objectForKeyedSubscript:@"TotalOdometer"];
        v164 = [v162 numberWithInteger:[v163 integerValue] + v186];
        [v166 setObject:v164 forKeyedSubscript:@"TotalOdometer"];
      }
    }
    else
    {
      id v5 = v167;
    }
  }
  else
  {
    id v140 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v140, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    id v177 = [MEMORY[0x1E4F1C978] array];
  }

  return v177;
}

- (BOOL)_dumpHealthKitMetaData:(id)a3 dir:(id)a4 stats:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = v13;
  if (!v11)
  {
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a6)
    {
      id v29 = @"data";
LABEL_15:
      _RTErrorInvalidParameterCreate((uint64_t)v29);
      BOOL v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_16:
    BOOL v26 = 0;
    goto LABEL_23;
  }
  if (!v12)
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: srcDir", buf, 2u);
    }

    if (a6)
    {
      id v29 = @"srcDir";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v38 = v13;
  id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = [v12 path];
  char v17 = [v15 fileExistsAtPath:v16 isDirectory:0];

  id v18 = 0;
  if ((v17 & 1) == 0
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        double v31 = objc_claimAutoreleasedReturnValue(),
        id v42 = 0,
        [v31 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v42],
        id v18 = v42,
        v31,
        a6)
    && v18)
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = (objc_class *)objc_opt_class();
      __int16 v35 = NSStringFromClass(v34);
      id v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      int v44 = v35;
      __int16 v45 = 2112;
      uint64_t v46 = v36;
      __int16 v47 = 2112;
      id v48 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v27 = v18;
    BOOL v26 = 0;
    *a6 = v27;
  }
  else
  {
    id v40 = 0;
    id v41 = 0;
    [(RTHealthKitManager *)self _updateHealthKitStartDatesUsingData:v11 currentStartDate:&v41 nextStartDate:&v40];
    id v19 = v41;
    id v37 = v40;
    uint64_t v20 = NSString;
    uint64_t v21 = [v11 count];
    uint64_t v22 = [(id)objc_opt_class() stringFromDate:v19 dateFormat:@"yyyy-MM-dd-HH-mm-ss-SSS"];
    long long v23 = [v20 stringWithFormat:@"Metadata-count-%lu-StartDate-%@.json", v21, v22];

    long long v24 = [v12 URLByAppendingPathComponent:v23];
    long long v25 = [(RTHealthKitManager *)self _convertHealthKitDataToJSONCompatibleType:v11 stats:v38];
    id v39 = v18;
    BOOL v26 = [(RTHealthKitManager *)self _writeToJSONAtURL:v24 data:v25 error:&v39];
    id v27 = v39;

    if (a6) {
      *a6 = v27;
    }
  }
  uint64_t v14 = v38;

LABEL_23:
  return v26;
}

- (BOOL)_dumpWorkoutLocationsUsingData:(id)a3 dir:(id)a4 stats:(id)a5 error:(id *)a6
{
  v157[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v89 = v8;
  id v90 = a5;
  uint64_t v100 = v9;
  if (!v8)
  {
    char v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"data");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:
      BOOL v16 = 0;
      *a6 = v18;
      goto LABEL_70;
    }
LABEL_55:
    BOOL v16 = 0;
    goto LABEL_70;
  }
  if (!v9)
  {
    uint64_t v73 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: srcDir", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"srcDir");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
    goto LABEL_55;
  }
  uint64_t v140 = 0;
  __int16 v141 = &v140;
  uint64_t v142 = 0x3032000000;
  __int16 v143 = __Block_byref_object_copy__146;
  uint64_t v144 = __Block_byref_object_dispose__146;
  id v145 = (id)objc_opt_new();
  uint64_t v134 = 0;
  id v135 = &v134;
  uint64_t v136 = 0x3032000000;
  id v137 = __Block_byref_object_copy__146;
  id v138 = __Block_byref_object_dispose__146;
  id v139 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [v9 path];
  char v12 = [v10 fileExistsAtPath:v11 isDirectory:0];

  if ((v12 & 1) == 0
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        id v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = (id *)(v135 + 5),
        id obj = (id)v135[5],
        [v13 createDirectoryAtURL:v100 withIntermediateDirectories:1 attributes:0 error:&obj],
        objc_storeStrong(v14, obj),
        v13,
        a6)
    && v135[5])
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v85 = (objc_class *)objc_opt_class();
      NSStringFromClass(v85);
      id v86 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v87 = NSStringFromSelector(a2);
      uint64_t v88 = (void *)v135[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v86;
      __int16 v147 = 2112;
      id v148 = v87;
      __int16 v149 = 2112;
      uint64_t v150 = v88;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    BOOL v16 = 0;
    *a6 = (id) v135[5];
  }
  else
  {
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v92 = v89;
    uint64_t v94 = [v92 countByEnumeratingWithState:&v129 objects:v156 count:16];
    if (v94)
    {
      uint64_t v105 = 0;
      uint64_t v106 = 0;
      uint64_t v93 = *(void *)v130;
      uint64_t v97 = *MEMORY[0x1E4F5CFE8];
      uint64_t v98 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v94; ++i)
        {
          if (*(void *)v130 != v93) {
            objc_enumerationMutation(v92);
          }
          id v19 = *(void **)(*((void *)&v129 + 1) + 8 * i);
          v95 = (void *)MEMORY[0x1E016D870]();
          uint64_t v20 = [v19 objectForKeyedSubscript:@"Workout"];
          if (v20)
          {
            uint64_t v21 = [v19 objectForKeyedSubscript:@"WorkoutRoutes"];
            BOOL v22 = v21 == 0;

            if (v22)
            {
              long long v23 = [v19 objectForKeyedSubscript:@"Workout"];
              long long v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                long long v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                id v26 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v27 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v28 = [v23 UUID];
                id v29 = [v28 UUIDString];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v26;
                __int16 v147 = 2112;
                id v148 = v27;
                __int16 v149 = 2112;
                uint64_t v150 = v29;
                _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, No workoutRoutes found for Workout %@", buf, 0x20u);
              }
            }
          }
          long long v127 = 0u;
          long long v128 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          id v30 = [v19 objectForKeyedSubscript:@"WorkoutRoutes"];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v125 objects:v155 count:16];
          if (v31)
          {
            uint64_t v103 = *(void *)v126;
            id v99 = v30;
            do
            {
              uint64_t v104 = v31;
              for (uint64_t j = 0; j != v104; ++j)
              {
                if (*(void *)v126 != v103) {
                  objc_enumerationMutation(v99);
                }
                __int16 v33 = *(void **)(*((void *)&v125 + 1) + 8 * j);
                context = (void *)MEMORY[0x1E016D870]();
                uint64_t v34 = [v33 objectForKeyedSubscript:@"WorkoutRoute"];

                if (v34)
                {
                  __int16 v35 = [v33 objectForKeyedSubscript:@"WorkoutRoute"];
                  uint64_t v121 = 0;
                  uint64_t v122 = &v121;
                  uint64_t v123 = 0x2020000000;
                  uint64_t v124 = 0;
                  uint64_t v115 = 0;
                  long long v116 = &v115;
                  uint64_t v117 = 0x3032000000;
                  long long v118 = __Block_byref_object_copy__146;
                  id v119 = __Block_byref_object_dispose__146;
                  id v36 = NSString;
                  id v37 = [v35 UUID];
                  id v38 = [v37 UUIDString];
                  id v39 = [v36 stringWithFormat:@"Locations-WorkoutRouteID-%@.csv", v38];
                  id v120 = [v100 URLByAppendingPathComponent:v39];

                  dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
                  v108[0] = MEMORY[0x1E4F143A8];
                  v108[1] = 3221225472;
                  v108[2] = __69__RTHealthKitManager__dumpWorkoutLocationsUsingData_dir_stats_error___block_invoke;
                  v108[3] = &unk_1E6B9BE58;
                  long long v110 = &v140;
                  v108[4] = self;
                  SEL v114 = a2;
                  id v41 = v40;
                  long long v109 = v41;
                  long long v111 = &v115;
                  long long v112 = &v134;
                  id v113 = &v121;
                  [(RTHealthKitManager *)self _fetchWorkoutRouteLocationsUsingWorkoutRoute:v35 batchSize:0 fetchOnlyFirstFew:0 handler:v108];
                  id v42 = v41;
                  id v43 = [MEMORY[0x1E4F1C9C8] now];
                  dispatch_time_t v44 = dispatch_time(0, 3600000000000);
                  if (!dispatch_semaphore_wait(v42, v44)) {
                    goto LABEL_34;
                  }
                  __int16 v45 = [MEMORY[0x1E4F1C9C8] now];
                  [v45 timeIntervalSinceDate:v43];
                  double v47 = v46;
                  id v48 = objc_opt_new();
                  uint64_t v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
                  uint64_t v50 = [MEMORY[0x1E4F29060] callStackSymbols];
                  uint64_t v51 = [v50 filteredArrayUsingPredicate:v49];
                  uint64_t v52 = [v51 firstObject];

                  [v48 submitToCoreAnalytics:v52 type:1 duration:v47];
                  uint64_t v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                  }

                  id v54 = (void *)MEMORY[0x1E4F28C58];
                  v157[0] = v98;
                  *(void *)buf = @"semaphore wait timeout";
                  uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v157 count:1];
                  uint64_t v56 = [v54 errorWithDomain:v97 code:15 userInfo:v55];

                  if (v56)
                  {
                    id v57 = v56;
                  }
                  else
                  {
LABEL_34:
                    id v57 = 0;
                  }

                  id v58 = v57;
                  uint64_t v59 = v58;
                  if (v141[5] && v58)
                  {
                    uint64_t v60 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      id v70 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v70);
                      id v71 = (id)objc_claimAutoreleasedReturnValue();
                      long long v72 = NSStringFromSelector(a2);
                      *(_DWORD *)buf = 138412802;
                      *(void *)&uint8_t buf[4] = v71;
                      __int16 v147 = 2112;
                      id v148 = v72;
                      __int16 v149 = 2112;
                      uint64_t v150 = v59;
                      _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
                    }
                    [(id)v141[5] addObject:v59];

                    uint64_t v59 = 0;
                  }
                  char v61 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                  {
                    BOOL v62 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v62);
                    id v63 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    id v64 = (id)objc_claimAutoreleasedReturnValue();
                    v65 = (void *)v122[3];
                    __int16 v66 = [(id)v116[5] relativeString];
                    +[RTRuntime footprint];
                    *(_DWORD *)buf = 138413314;
                    *(void *)&uint8_t buf[4] = v63;
                    __int16 v147 = 2112;
                    id v148 = v64;
                    __int16 v149 = 2048;
                    uint64_t v150 = v65;
                    __int16 v151 = 2112;
                    uint64_t v152 = v66;
                    __int16 v153 = 2048;
                    uint64_t v154 = v67;
                    _os_log_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_INFO, "%@, %@, Saved CSV of %lu locations, %@ file, current footprint, %.2f MB", buf, 0x34u);
                  }
                  uint64_t v68 = v122[3];
                  uint64_t v69 = v106;
                  if (v68 > 0) {
                    uint64_t v69 = v106 + 1;
                  }
                  uint64_t v106 = v69;

                  _Block_object_dispose(&v115, 8);
                  _Block_object_dispose(&v121, 8);

                  v105 += v68 & ~(v68 >> 63);
                }
              }
              id v30 = v99;
              uint64_t v31 = [v99 countByEnumeratingWithState:&v125 objects:v155 count:16];
            }
            while (v31);
          }
        }
        uint64_t v94 = [v92 countByEnumeratingWithState:&v129 objects:v156 count:16];
      }
      while (v94);
    }
    else
    {
      uint64_t v105 = 0;
      uint64_t v106 = 0;
    }

    if (v90)
    {
      id v74 = [v90 objectForKeyedSubscript:@"WorkoutRouteLocations"];

      if (v74)
      {
        id v75 = NSNumber;
        BOOL v76 = [v90 objectForKeyedSubscript:@"WorkoutRouteLocations"];
        id v77 = [v75 numberWithInteger:[v76 integerValue] + v106];
        [v90 setObject:v77 forKeyedSubscript:@"WorkoutRouteLocations"];
      }
      long long v78 = [v90 objectForKeyedSubscript:@"TotalWorkoutRouteLocations"];

      if (v78)
      {
        __int16 v79 = NSNumber;
        id v80 = [v90 objectForKeyedSubscript:@"TotalWorkoutRouteLocations"];
        uint64_t v81 = [v79 numberWithInteger:[v80 integerValue] + v105];
        [v90 setObject:v81 forKeyedSubscript:@"TotalWorkoutRouteLocations"];
      }
    }
    if ([(id)v141[5] count])
    {
      if (a6)
      {
        id v82 = _RTSafeArray();
        _RTMultiErrorCreate();
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v16 = 0;
    }
    else
    {
      if (a6)
      {
        __int16 v83 = _RTSafeArray();
        _RTMultiErrorCreate();
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v16 = 1;
    }
  }
  _Block_object_dispose(&v134, 8);

  _Block_object_dispose(&v140, 8);
LABEL_70:

  return v16;
}

void __69__RTHealthKitManager__dumpWorkoutLocationsUsingData_dir_stats_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (uint64_t v7 = [v5 count], !v6) && v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v10 + 40);
    [v8 _writeLocations:v5 csvFileURL:v9 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 80));
        uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        long long v24 = v19;
        __int16 v25 = 2112;
        id v26 = v20;
        __int16 v27 = 2112;
        id v28 = v21;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v5 count];
  }
  else
  {
    if (v6 && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = (objc_class *)objc_opt_class();
        BOOL v16 = NSStringFromClass(v15);
        char v17 = NSStringFromSelector(*(SEL *)(a1 + 80));
        *(_DWORD *)buf = 138412802;
        long long v24 = v16;
        __int16 v25 = 2112;
        id v26 = v17;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v6];

      id v6 = 0;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

- (BOOL)_dumpWorkoutClusterAtDir:(id)a3 stats:(id)a4 error:(id *)a5
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v185 = a4;
  uint64_t v186 = v6;
  if (!v6)
  {
    long long v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v216 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: srcDir", v216, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"srcDir");
      BOOL v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
    goto LABEL_104;
  }
  *(void *)uint64_t v216 = 0;
  uint64_t v217 = v216;
  uint64_t v218 = 0x3032000000;
  uint64_t v219 = __Block_byref_object_copy__146;
  uint64_t v220 = __Block_byref_object_dispose__146;
  id v221 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8 isDirectory:0];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = (id *)(v217 + 40);
    id obj = (id)*((void *)v217 + 5);
    [v10 createDirectoryAtURL:v186 withIntermediateDirectories:1 attributes:0 error:&obj];
    objc_storeStrong(v11, obj);

    if (a5)
    {
      if (*((void *)v217 + 5))
      {
        uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v158 = (objc_class *)objc_opt_class();
          NSStringFromClass(v158);
          id v159 = (id)objc_claimAutoreleasedReturnValue();
          v160 = NSStringFromSelector(a2);
          v161 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v217 + 5);
          *(_DWORD *)v236 = 138412802;
          *(void *)&v236[4] = v159;
          *(_WORD *)&v236[12] = 2112;
          *(void *)&v236[14] = v160;
          *(_WORD *)&v236[22] = 2112;
          v237 = v161;
          _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v236, 0x20u);
        }
        BOOL v13 = 0;
        *a5 = *((id *)v217 + 5);
        goto LABEL_103;
      }
    }
  }
  uint64_t v182 = [v186 URLByAppendingPathComponent:@"Cluster_Snapshots"];
  uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = [v182 path];
  char v16 = [v14 fileExistsAtPath:v15 isDirectory:0];

  if ((v16 & 1) == 0)
  {
    char v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = (id *)(v217 + 40);
    id v214 = (id)*((void *)v217 + 5);
    [v17 createDirectoryAtURL:v182 withIntermediateDirectories:1 attributes:0 error:&v214];
    objc_storeStrong(v18, v214);

    if (a5)
    {
      if (*((void *)v217 + 5))
      {
        id v19 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v162 = (objc_class *)objc_opt_class();
          NSStringFromClass(v162);
          id v163 = (id)objc_claimAutoreleasedReturnValue();
          v164 = NSStringFromSelector(a2);
          v165 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v217 + 5);
          *(_DWORD *)v236 = 138412802;
          *(void *)&v236[4] = v163;
          *(_WORD *)&v236[12] = 2112;
          *(void *)&v236[14] = v164;
          *(_WORD *)&v236[22] = 2112;
          v237 = v165;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v236, 0x20u);
        }
        BOOL v13 = 0;
        *a5 = *((id *)v217 + 5);
        goto LABEL_102;
      }
    }
  }
  *(void *)v236 = 0;
  *(void *)&v236[8] = v236;
  *(void *)&v236[16] = 0x3032000000;
  v237 = __Block_byref_object_copy__146;
  v238 = __Block_byref_object_dispose__146;
  id v239 = 0;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  v210[0] = MEMORY[0x1E4F143A8];
  v210[1] = 3221225472;
  v210[2] = __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke;
  v210[3] = &unk_1E6B905F0;
  long long v212 = v236;
  long long v213 = v216;
  dispatch_semaphore_t dsema = v20;
  dispatch_semaphore_t v211 = dsema;
  [(RTHealthKitManager *)self _fetchWorkoutClustersWithHandler:v210];
  uint64_t v21 = (id *)(v217 + 40);
  id v22 = (id)*((void *)v217 + 5);
  if (a5 && v22)
  {
    long long v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v154 = (objc_class *)objc_opt_class();
      NSStringFromClass(v154);
      id v155 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v156 = NSStringFromSelector(a2);
      uint64_t v157 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v217 + 5);
      *(_DWORD *)v231 = 138412802;
      *(void *)&v231[4] = v155;
      *(_WORD *)&v231[12] = 2112;
      *(void *)&v231[14] = v156;
      *(_WORD *)&v231[22] = 2112;
      v232 = v157;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v231, 0x20u);
    }
LABEL_32:

    id v39 = *((id *)v217 + 5);
    BOOL v13 = 0;
LABEL_100:
    *a5 = v39;
    goto LABEL_101;
  }
  dispatch_semaphore_t dsema = dsema;
  __int16 v25 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v26 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v26))
  {
    __int16 v27 = [MEMORY[0x1E4F1C9C8] now];
    [v27 timeIntervalSinceDate:v25];
    double v29 = v28;
    id v30 = objc_opt_new();
    uint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v33 = [v32 filteredArrayUsingPredicate:v31];
    uint64_t v34 = [v33 firstObject];

    [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
    __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v231 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v231, 2u);
    }

    id v36 = (void *)MEMORY[0x1E4F28C58];
    *(void *)buf = *MEMORY[0x1E4F28568];
    *(void *)v231 = @"semaphore wait timeout";
    id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v231 forKeys:buf count:1];
    id v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

    if (v38)
    {
      id v22 = v38;
    }
  }

  objc_storeStrong(v21, v22);
  if (a5 && *((void *)v217 + 5))
  {
    long long v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v166 = (objc_class *)objc_opt_class();
      NSStringFromClass(v166);
      id v167 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v168 = NSStringFromSelector(a2);
      uint64_t v169 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v217 + 5);
      *(_DWORD *)v231 = 138412802;
      *(void *)&v231[4] = v167;
      *(_WORD *)&v231[12] = 2112;
      *(void *)&v231[14] = v168;
      *(_WORD *)&v231[22] = 2112;
      v232 = v169;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v231, 0x20u);
    }
    goto LABEL_32;
  }
  if (![*(id *)(*(void *)&v236[8] + 40) count])
  {
    uint64_t v176 = 0;
    BOOL v13 = 1;
    goto LABEL_93;
  }
  id v177 = objc_opt_new();
  long long v208 = 0u;
  long long v209 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  id v181 = *(id *)(*(void *)&v236[8] + 40);
  uint64_t v40 = [v181 countByEnumeratingWithState:&v206 objects:v235 count:16];
  if (!v40)
  {
    uint64_t v176 = 0;
    goto LABEL_83;
  }
  uint64_t v176 = 0;
  uint64_t v184 = *(void *)v207;
  uint64_t v178 = *MEMORY[0x1E4F5CFE8];
  uint64_t v179 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v41 = 0;
    uint64_t v183 = v40;
    do
    {
      if (*(void *)v207 != v184) {
        objc_enumerationMutation(v181);
      }
      uint64_t v188 = v41;
      id v42 = *(void **)(*((void *)&v206 + 1) + 8 * v41);
      context = (void *)MEMORY[0x1E016D870]();
      id v43 = objc_opt_new();
      dispatch_time_t v44 = [v42 clusterUUID];
      __int16 v45 = [v44 UUIDString];
      [v43 setObject:v45 forKeyedSubscript:@"ClusterUUID"];

      double v46 = [v42 bestWorkoutUUID];
      double v47 = [v46 UUIDString];
      [v43 setObject:v47 forKeyedSubscript:@"BestWorkoutUUID"];

      id v48 = [v42 lastWorkoutUUID];
      uint64_t v49 = [v48 UUIDString];
      [v43 setObject:v49 forKeyedSubscript:@"LastWorkoutUUID"];

      uint64_t v50 = [v42 workoutRouteLabel];
      [v43 setObject:v50 forKeyedSubscript:@"Label"];

      uint64_t v51 = NSNumber;
      [v42 relevanceValue];
      uint64_t v52 = [v51 numberWithDouble:];
      [v43 setObject:v52 forKeyedSubscript:@"RelevanceScore"];

      *(void *)v231 = 0;
      *(void *)&v231[8] = v231;
      *(void *)&v231[16] = 0x3032000000;
      v232 = __Block_byref_object_copy__146;
      uint64_t v233 = __Block_byref_object_dispose__146;
      id v234 = 0;
      dispatch_semaphore_t v53 = dispatch_semaphore_create(0);

      id v54 = [v42 clusterUUID];
      v202[0] = MEMORY[0x1E4F143A8];
      v202[1] = 3221225472;
      v202[2] = __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_791;
      v202[3] = &unk_1E6B905F0;
      long long v204 = v231;
      long long v205 = v216;
      dispatch_semaphore_t dsema = v53;
      dispatch_semaphore_t v203 = dsema;
      [(RTHealthKitManager *)self _fetchWorkoutUUIDsForClusterUUID:v54 handler:v202];

      uint64_t v55 = (id *)(v217 + 40);
      if (*((void *)v217 + 5)) {
        goto LABEL_47;
      }
      dispatch_semaphore_t dsema = dsema;
      uint64_t v56 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v57 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v57)) {
        goto LABEL_45;
      }
      id v58 = [MEMORY[0x1E4F1C9C8] now];
      [v58 timeIntervalSinceDate:v56];
      double v60 = v59;
      char v61 = objc_opt_new();
      BOOL v62 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
      id v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v64 = [v63 filteredArrayUsingPredicate:v62];
      v65 = [v64 firstObject];

      [v61 submitToCoreAnalytics:v65 type:1 duration:v60];
      __int16 v66 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v67 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v241 = v179;
      *(void *)buf = @"semaphore wait timeout";
      uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v241 count:1];
      uint64_t v69 = [v67 errorWithDomain:v178 code:15 userInfo:v68];

      if (v69)
      {
        id v70 = v69;
      }
      else
      {
LABEL_45:
        id v70 = 0;
      }

      objc_storeStrong(v55, v70);
      if (*((void *)v217 + 5))
      {
LABEL_47:
        int v71 = 6;
        goto LABEL_48;
      }
      long long v72 = objc_opt_new();
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      id v73 = *(id *)(*(void *)&v231[8] + 40);
      uint64_t v74 = [v73 countByEnumeratingWithState:&v198 objects:v230 count:16];
      if (v74)
      {
        uint64_t v75 = *(void *)v199;
        do
        {
          for (uint64_t i = 0; i != v74; ++i)
          {
            if (*(void *)v199 != v75) {
              objc_enumerationMutation(v73);
            }
            id v77 = *(void **)(*((void *)&v198 + 1) + 8 * i);
            long long v78 = (void *)MEMORY[0x1E016D870]();
            __int16 v79 = [v77 UUIDString];
            [v72 addObject:v79];
          }
          uint64_t v74 = [v73 countByEnumeratingWithState:&v198 objects:v230 count:16];
        }
        while (v74);
      }

      [v43 setObject:v72 forKeyedSubscript:@"WorkoutUUIDs"];
      id v80 = [NSNumber numberWithUnsignedInteger:[v72 count]];
      [v43 setObject:v80 forKeyedSubscript:@"WorkoutUUIDsCount"];

      [v43 setObject:&unk_1F3452460 forKeyedSubscript:@"TotalDistance"];
      [v43 setObject:&unk_1F3452460 forKeyedSubscript:@"TotalDuration"];
      if (![*(id *)(*(void *)&v231[8] + 40) count]) {
        goto LABEL_64;
      }
      uint64_t v81 = [*(id *)(*(void *)&v231[8] + 40) firstObject];
      v229 = v81;
      id v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v229 count:1];
      __int16 v83 = (id *)(v217 + 40);
      id v197 = (id)*((void *)v217 + 5);
      id v84 = [(RTHealthKitManager *)self _getWorkoutsWithUUIDs:v82 error:&v197];
      objc_storeStrong(v83, v197);

      if (!*((void *)v217 + 5))
      {
        if ([v84 count])
        {
          uint64_t v85 = NSNumber;
          id v86 = [v84 firstObject];
          uint64_t v87 = [v86 totalDistance];
          uint64_t v88 = [MEMORY[0x1E4F2B618] meterUnit];
          [v87 doubleValueForUnit:v88];
          id v89 = [v85 numberWithDouble:x0];
          [v43 setObject:v89 forKeyedSubscript:@"TotalDistance"];

          id v90 = NSNumber;
          id v91 = [v84 firstObject];
          [v91 duration];
          id v92 = [v90 numberWithDouble:];
          [v43 setObject:v92 forKeyedSubscript:@"TotalDuration"];

          uint64_t v93 = [v84 firstObject];
          uint64_t v94 = +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", [v93 workoutActivityType]);
          [v43 setObject:v94 forKeyedSubscript:@"WorkoutType"];
        }
LABEL_64:
        *(void *)buf = 0;
        long long v224 = buf;
        uint64_t v225 = 0x3032000000;
        long long v226 = __Block_byref_object_copy__146;
        long long v227 = __Block_byref_object_dispose__146;
        id v228 = 0;
        dispatch_semaphore_t v95 = dispatch_semaphore_create(0);

        v96 = [v42 clusterUUID];
        v193[0] = MEMORY[0x1E4F143A8];
        v193[1] = 3221225472;
        v193[2] = __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_2;
        v193[3] = &unk_1E6B9BE80;
        v195 = buf;
        uint64_t v196 = v216;
        dispatch_semaphore_t dsema = v95;
        dispatch_semaphore_t v194 = dsema;
        [(RTHealthKitManager *)self _fetchWorkoutRouteSnapshotForClusterUUID:v96 handler:v193];

        uint64_t v97 = (id *)(v217 + 40);
        if (*((void *)v217 + 5)) {
          goto LABEL_72;
        }
        uint64_t v98 = dsema;
        uint64_t v175 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v99 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v98, v99)) {
          goto LABEL_70;
        }
        v174 = [MEMORY[0x1E4F1C9C8] now];
        [v174 timeIntervalSinceDate:v175];
        double v101 = v100;
        uint64_t v102 = objc_opt_new();
        uint64_t v103 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
        uint64_t v104 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v105 = [v104 filteredArrayUsingPredicate:v103];
        uint64_t v106 = [v105 firstObject];

        [v102 submitToCoreAnalytics:v106 type:1 duration:v101];
        uint64_t v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v241 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v107, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v241, 2u);
        }

        uint64_t v108 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v240 = v179;
        *(void *)v241 = @"semaphore wait timeout";
        long long v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v241 forKeys:&v240 count:1];
        long long v110 = [v108 errorWithDomain:v178 code:15 userInfo:v109];

        if (v110)
        {
          id v111 = v110;
        }
        else
        {
LABEL_70:
          id v111 = 0;
        }

        objc_storeStrong(v97, v111);
        if (*((void *)v217 + 5))
        {
LABEL_72:
          int v71 = 6;
        }
        else
        {
          if (*((void *)v224 + 5))
          {
            long long v112 = NSString;
            uint64_t v113 = [v72 count];
            [v42 relevanceValue];
            uint64_t v115 = v114;
            long long v116 = [v42 workoutRouteLabel];
            uint64_t v117 = [v43 objectForKeyedSubscript:@"TotalDistance"];
            [v117 doubleValue];
            uint64_t v119 = v118;
            id v120 = [v43 objectForKeyedSubscript:@"TotalDuration"];
            uint64_t v121 = [v120 integerValue];
            uint64_t v122 = [v42 clusterUUID];
            uint64_t v123 = [v112 stringWithFormat:@"Count-%lu-score-[%.3f]-label-%@-dist-%.3f-dur-%lu-%@.png", v113, v115, v116, v119, v121, v122];

            uint64_t v124 = [v182 URLByAppendingPathComponent:v123];
            [*((id *)v224 + 5) writeToURL:v124 atomically:1];
          }
          uint64_t v125 = [*(id *)(*(void *)&v231[8] + 40) count];
          [v177 addObject:v43];
          int v71 = 0;
          v176 += v125;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_74;
      }

      int v71 = 6;
LABEL_74:

LABEL_48:
      _Block_object_dispose(v231, 8);

      if (v71) {
        goto LABEL_83;
      }
      uint64_t v41 = v188 + 1;
    }
    while (v188 + 1 != v183);
    uint64_t v40 = [v181 countByEnumeratingWithState:&v206 objects:v235 count:16];
  }
  while (v40);
LABEL_83:

  if (a5 && *((void *)v217 + 5))
  {
    long long v126 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
    {
      uint64_t v170 = (objc_class *)objc_opt_class();
      NSStringFromClass(v170);
      id v171 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v172 = NSStringFromSelector(a2);
      uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v217 + 5);
      *(_DWORD *)v231 = 138412802;
      *(void *)&v231[4] = v171;
      *(_WORD *)&v231[12] = 2112;
      *(void *)&v231[14] = v172;
      *(_WORD *)&v231[22] = 2112;
      v232 = v173;
      _os_log_error_impl(&dword_1D9BFA000, v126, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v231, 0x20u);
    }
    *a5 = *((id *)v217 + 5);

    BOOL v13 = 0;
    goto LABEL_101;
  }
  long long v127 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
  {
    long long v128 = (objc_class *)objc_opt_class();
    NSStringFromClass(v128);
    id v129 = (id)objc_claimAutoreleasedReturnValue();
    long long v130 = NSStringFromSelector(a2);
    *(_DWORD *)v231 = 138412546;
    *(void *)&v231[4] = v129;
    *(_WORD *)&v231[12] = 2112;
    *(void *)&v231[14] = v130;
    _os_log_impl(&dword_1D9BFA000, v127, OS_LOG_TYPE_INFO, "%@, %@, sorting the clusters", v231, 0x16u);
  }
  long long v131 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"RelevanceScore" ascending:1];
  v222[0] = v131;
  long long v132 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"TotalDistance" ascending:1];
  v222[1] = v132;
  id v133 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"TotalDuration" ascending:1];
  v222[2] = v133;
  uint64_t v134 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"Label" ascending:1];
  v222[3] = v134;
  id v135 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"BestWorkoutUUID" ascending:1];
  v222[4] = v135;
  uint64_t v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:v222 count:5];
  [v177 sortUsingDescriptors:v136];

  id v137 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
  {
    id v138 = (objc_class *)objc_opt_class();
    NSStringFromClass(v138);
    id v139 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v140 = NSStringFromSelector(a2);
    *(_DWORD *)v231 = 138412546;
    *(void *)&v231[4] = v139;
    *(_WORD *)&v231[12] = 2112;
    *(void *)&v231[14] = v140;
    _os_log_impl(&dword_1D9BFA000, v137, OS_LOG_TYPE_INFO, "%@, %@, ready to save data", v231, 0x16u);
  }
  __int16 v141 = [NSString stringWithFormat:@"WorkoutClusters-Count-%lu.json", [*(id *)(*(void *)&v236[8] + 40) count]];
  uint64_t v142 = [v186 URLByAppendingPathComponent:v141];
  __int16 v143 = (id *)(v217 + 40);
  id v192 = (id)*((void *)v217 + 5);
  BOOL v13 = [(RTHealthKitManager *)self _writeToJSONAtURL:v142 data:v177 error:&v192];
  objc_storeStrong(v143, v192);

LABEL_93:
  if (v185)
  {
    uint64_t v144 = [v185 objectForKeyedSubscript:@"TotalClusters"];

    if (v144)
    {
      id v145 = NSNumber;
      uint64_t v146 = [v185 objectForKeyedSubscript:@"TotalClusters"];
      uint64_t v147 = [v146 integerValue];
      id v148 = [v145 numberWithUnsignedInteger:[*(id *)(*(void *)&v236[8] + 40) count] + v147];
      [v185 setObject:v148 forKeyedSubscript:@"TotalClusters"];
    }
    __int16 v149 = [v185 objectForKeyedSubscript:@"TotalWorkoutsInClusters"];

    if (v149)
    {
      uint64_t v150 = NSNumber;
      __int16 v151 = [v185 objectForKeyedSubscript:@"TotalWorkoutsInClusters"];
      uint64_t v152 = [v150 numberWithInteger:[v151 integerValue] + v176];
      [v185 setObject:v152 forKeyedSubscript:@"TotalWorkoutsInClusters"];
    }
  }
  if (a5)
  {
    id v39 = *((id *)v217 + 5);
    goto LABEL_100;
  }
LABEL_101:

  _Block_object_dispose(v236, 8);
LABEL_102:

LABEL_103:
  _Block_object_dispose(v216, 8);

LABEL_104:
  return v13;
}

void __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_791(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_writeLocations:(id)a3 csvFileURL:(id)a4 error:(id *)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9)
    {
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v12 = [v10 path];
      char v13 = [v11 fileExistsAtPath:v12];

      if (v13)
      {
        double v46 = v11;
        double v47 = a5;
        id v48 = v10;
        __int16 v45 = 0;
      }
      else
      {
        id v72 = 0;
        BOOL v17 = [(RTHealthKitManager *)self _writeToFileAtURL:v10 contentString:@"latitude, longitude, altitude, horizontalAccuracy, verticalAccuracy, course, speed, signalEnvironmentType, timestamp, \n" error:&v72];
        id v18 = v72;
        id v19 = v18;
        if (a5 && v18)
        {
          dispatch_semaphore_t v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v42 = (objc_class *)objc_opt_class();
            id v43 = NSStringFromClass(v42);
            dispatch_time_t v44 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            uint64_t v75 = v43;
            __int16 v76 = 2112;
            id v77 = v44;
            __int16 v78 = 2112;
            __int16 v79 = v19;
            _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
          }
          id v21 = v19;
          *a5 = v21;
          goto LABEL_31;
        }
        __int16 v45 = v18;
        double v46 = v11;
        double v47 = a5;
        id v48 = v10;
      }
      uint64_t v52 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v49 = v8;
      id obj = v8;
      uint64_t v54 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v54)
      {
        uint64_t v51 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v69 != v51) {
              objc_enumerationMutation(obj);
            }
            long long v23 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            context = (void *)MEMORY[0x1E016D870]();
            char v61 = NSString;
            long long v24 = NSNumber;
            [v23 coordinate];
            id v64 = [v24 numberWithDouble:];
            double v59 = [v64 stringValue];
            __int16 v25 = NSNumber;
            [v23 coordinate];
            id v63 = [v25 numberWithDouble:v26];
            __int16 v66 = [v63 stringValue];
            __int16 v27 = NSNumber;
            [v23 altitude];
            BOOL v62 = [v27 numberWithDouble:];
            dispatch_time_t v57 = [v62 stringValue];
            double v28 = NSNumber;
            [v23 horizontalAccuracy];
            double v60 = [v28 numberWithDouble:x0];
            uint64_t v55 = [v60 stringValue];
            double v29 = NSNumber;
            [v23 verticalAccuracy];
            id v58 = [v29 numberWithDouble:];
            id v30 = [v58 stringValue];
            uint64_t v31 = NSNumber;
            [v23 course];
            uint64_t v56 = [v31 numberWithDouble:];
            id v32 = [v56 stringValue];
            __int16 v33 = NSNumber;
            [v23 speed];
            uint64_t v34 = [v33 numberWithDouble:];
            __int16 v35 = [v34 stringValue];
            uint64_t v36 = [v23 signalEnvironmentType];
            id v37 = objc_opt_class();
            id v38 = [v23 timestamp];
            id v39 = [v37 stringFromDate:v38 dateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
            uint64_t v40 = [v61 stringWithFormat:@"%@, %@, %@, %@, %@, %@, %@, %lu, %@ \n", v59, v66, v57, v55, v30, v32, v35, v36, v39];
            [v52 appendString:v40];
          }
          uint64_t v54 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v54);
      }

      id v67 = v45;
      uint64_t v10 = v48;
      BOOL v17 = [(RTHealthKitManager *)self _writeToFileAtURL:v48 contentString:v52 error:&v67];
      id v21 = v67;

      if (v47) {
        id *v47 = v21;
      }

      id v8 = v49;
      id v11 = v46;
LABEL_31:

      goto LABEL_32;
    }
    char v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: csvFileURL", buf, 2u);
    }

    if (a5)
    {
      id v15 = @"csvFileURL";
      goto LABEL_13;
    }
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_32;
  }
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
  }

  if (!a5) {
    goto LABEL_14;
  }
  id v15 = @"locations";
LABEL_13:
  _RTErrorInvalidParameterCreate((uint64_t)v15);
  BOOL v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v17;
}

- (BOOL)_writeToFileAtURL:(id)a3 contentString:(id)a4 error:(id *)a5
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9)
    {
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v12 = [v8 path];
      char v13 = [v11 fileExistsAtPath:v12];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = [v8 path];
        char v15 = [v11 createFileAtPath:v14 contents:0 attributes:0];

        if ((v15 & 1) == 0)
        {
          id v32 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v33 = *MEMORY[0x1E4F5CFE8];
          uint64_t v56 = *MEMORY[0x1E4F28568];
          uint64_t v34 = NSString;
          __int16 v35 = [v8 path];
          uint64_t v36 = [v34 stringWithFormat:@"Could not create file at %@", v35];
          v57[0] = v36;
          id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
          id v20 = [v32 errorWithDomain:v33 code:0 userInfo:v37];

          if (a5)
          {
            id v20 = v20;
            BOOL v28 = 0;
            *a5 = v20;
          }
          else
          {
            BOOL v28 = 0;
          }
          goto LABEL_36;
        }
      }
      char v16 = (void *)MEMORY[0x1E4F28CB0];
      BOOL v17 = [v8 path];
      id v18 = [v16 fileHandleForWritingAtPath:v17];

      if (!v18)
      {
        double v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *MEMORY[0x1E4F5CFE8];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        uint64_t v55 = @"Could not open file descriptor to write diagnostics.";
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        id v20 = [v29 errorWithDomain:v30 code:0 userInfo:v31];

        if (!a5)
        {
          BOOL v28 = 0;
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
LABEL_34:
        id v20 = v20;
        BOOL v28 = 0;
        *a5 = v20;
        goto LABEL_35;
      }
      id v47 = 0;
      [v18 truncateAtOffset:[v18 seekToEndOfFile] error:&v47];
      id v19 = v47;
      id v20 = v19;
      if (a5 && v19)
      {
        id v21 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
LABEL_33:

          goto LABEL_34;
        }
        id v22 = (objc_class *)objc_opt_class();
        long long v23 = NSStringFromClass(v22);
        long long v24 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v49 = v23;
        __int16 v50 = 2112;
        uint64_t v51 = v24;
        __int16 v52 = 2112;
        id v53 = v20;
      }
      else
      {
        id v38 = [v10 dataUsingEncoding:4];
        id v46 = 0;
        [v18 writeData:v38 error:&v46];
        id v39 = v46;

        if (a5 && v39)
        {
          id v21 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = (objc_class *)objc_opt_class();
            id v42 = NSStringFromClass(v41);
            id v43 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            id v49 = v42;
            __int16 v50 = 2112;
            uint64_t v51 = v43;
            __int16 v52 = 2112;
            id v53 = v39;
            _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
          }
          id v20 = v39;
          goto LABEL_33;
        }
        id v45 = 0;
        [v18 closeAndReturnError:&v45];
        id v20 = v45;

        BOOL v28 = 1;
        if (!a5 || !v20) {
          goto LABEL_35;
        }
        id v21 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        dispatch_time_t v44 = (objc_class *)objc_opt_class();
        long long v23 = NSStringFromClass(v44);
        long long v24 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v49 = v23;
        __int16 v50 = 2112;
        uint64_t v51 = v24;
        __int16 v52 = 2112;
        id v53 = v20;
      }
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      goto LABEL_33;
    }
    __int16 v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contentString", buf, 2u);
    }

    if (a5)
    {
      double v26 = @"contentString";
      goto LABEL_19;
    }
LABEL_20:
    BOOL v28 = 0;
    goto LABEL_37;
  }
  __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
  }

  if (!a5) {
    goto LABEL_20;
  }
  double v26 = @"url";
LABEL_19:
  _RTErrorInvalidParameterCreate((uint64_t)v26);
  BOOL v28 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v28;
}

- (BOOL)_writeToJSONAtURL:(id)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v19 = 0;
  id v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a4 options:3 error:&v19];
  id v9 = v19;
  if (v9)
  {
    id v10 = v9;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v10;
    id v12 = "Encountered error in creating labelled JSON file, %@";
    goto LABEL_8;
  }
  BOOL v13 = 1;
  if ([v8 writeToURL:v7 atomically:1])
  {
    id v10 = 0;
    goto LABEL_12;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v15 = *MEMORY[0x1E4F5CFE8];
  uint64_t v20 = *MEMORY[0x1E4F28568];
  char v16 = [NSString stringWithFormat:@"JSON file couldn't be created, %@", v7];
  id v21 = v16;
  BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v10 = [v14 errorWithDomain:v15 code:7 userInfo:v17];

  id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v10;
    id v12 = "error, %@";
LABEL_8:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
  }
LABEL_9:

  if (a5)
  {
    id v10 = v10;
    BOOL v13 = 0;
    *a5 = v10;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_12:

  return v13;
}

- (void)fetchMostRecentWorkoutLocationTypeWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__RTHealthKitManager_fetchMostRecentWorkoutLocationTypeWithHandler___block_invoke;
  v7[3] = &unk_1E6B90D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__RTHealthKitManager_fetchMostRecentWorkoutLocationTypeWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) defaultsManager];
  id v2 = [v3 objectForKey:@"RTDefaultsMostRecentWorkoutLocationType"];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, (int)[v2 intValue]);
}

- (void)fetchMostRecentWorkoutActivityTypeWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__RTHealthKitManager_fetchMostRecentWorkoutActivityTypeWithHandler___block_invoke;
  v7[3] = &unk_1E6B90D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__RTHealthKitManager_fetchMostRecentWorkoutActivityTypeWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) defaultsManager];
  id v2 = [v3 objectForKey:@"RTDefaultsMostRecentWorkoutActivityType"];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, (int)[v2 intValue]);
}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [a3 URLByAppendingPathComponent:@"Location_Workout_Study"];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = 0;
    [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v8 = v18;

    if (v8)
    {
      BOOL v9 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
    else
    {
      id v16 = 0;
      id v17 = 0;
      LOBYTE(v15) = 1;
      BOOL v9 = [(RTHealthKitManager *)self _saveEntireHealthKitDataToURL:v6 outAbsoluteURL:&v17 includeWorkoutData:1 includeLocations:1 includeOdometerReadings:0 odometerSamplingIntervalComponents:0 includeClustersData:v15 error:&v16];
      id v11 = v17;
      id v12 = v16;
      BOOL v13 = v12;
      if (a4) {
        *a4 = v12;
      }
    }
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"url");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([a4 hasMask:2])
  {
    id v11 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__RTHealthKitManager_sendDiagnosticsToURL_options_handler___block_invoke;
    v12[3] = &unk_1E6B90C40;
    v12[4] = self;
    SEL v15 = a2;
    id v13 = v9;
    id v14 = v10;
    dispatch_async(v11, v12);
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __59__RTHealthKitManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    id v23 = v5;
    __int16 v24 = 2112;
    __int16 v25 = v6;
    __int16 v26 = 2048;
    uint64_t v27 = v7;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "---------> %@, %@, start _generateDiagnosticFilesAtURL, footprint, %.2f MB <---------", buf, 0x20u);
  }
  id v8 = (void *)MEMORY[0x1E016D870]();
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v21 = 0;
  [v9 _generateDiagnosticFilesAtURL:v10 error:&v21];
  id v11 = v21;
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    SEL v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
    +[RTRuntime footprint];
    uint64_t v17 = v16;
    id v18 = [MEMORY[0x1E4F1C9C8] date];
    [v18 timeIntervalSinceDate:v2];
    *(_DWORD *)buf = 138413314;
    id v23 = v14;
    __int16 v24 = 2112;
    __int16 v25 = v15;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "---------> %@, %@, finished _generateDiagnosticFilesAtURL, footprint, %.2f MB, error, %@, latency, %.2f <---------", buf, 0x34u);
  }
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v11);
  }
}

- (void)fetchEmergencyContactsWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__RTHealthKitManager_fetchEmergencyContactsWithHandler___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[RTHealthKitManager fetchEmergencyContactsWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 3995;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __56__RTHealthKitManager_fetchEmergencyContactsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEmergencyContactsWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchEmergencyContactsWithHandler:(id)a3
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void, id))a3;
  if (v5)
  {
    aSelector = a2;
    *(void *)double v59 = 0;
    *(void *)&v59[8] = v59;
    *(void *)&v59[16] = 0x3032000000;
    double v60 = __Block_byref_object_copy__146;
    char v61 = __Block_byref_object_dispose__146;
    id v62 = 0;
    uint64_t v48 = 0;
    id v49 = &v48;
    uint64_t v50 = 0x3032000000;
    uint64_t v51 = __Block_byref_object_copy__146;
    __int16 v52 = __Block_byref_object_dispose__146;
    id v53 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v7 = [(RTHealthKitManager *)self medicalIDStore];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __57__RTHealthKitManager__fetchEmergencyContactsWithHandler___block_invoke;
    v44[3] = &unk_1E6B905F0;
    id v46 = v59;
    id v47 = &v48;
    id v8 = v6;
    id v45 = v8;
    [v7 fetchMedicalIDEmergencyContactsWithCompletion:v44];

    id v9 = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v11 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v9, v11)) {
      goto LABEL_7;
    }
    int v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSinceDate:v10];
    double v14 = v13;
    SEL v15 = objc_opt_new();
    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v18 = [v17 filteredArrayUsingPredicate:v16];
    uint64_t v19 = [v18 firstObject];

    [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v21 = (void *)MEMORY[0x1E4F28C58];
    v63[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v63 count:1];
    id v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

    if (v23)
    {
      id v24 = v23;
    }
    else
    {
LABEL_7:
      id v24 = 0;
    }

    id v25 = v24;
    __int16 v26 = v25;
    id v27 = (id)v49[5];
    if (v27 || (id v27 = v25) != 0)
    {
      v5[2](v5, 0, v27);
    }
    else
    {
      id v29 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        __int16 v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = [*(id *)(*(void *)&v59[8] + 40) count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v31;
        __int16 v55 = 2112;
        id v56 = v32;
        __int16 v57 = 2048;
        uint64_t v58 = v33;
        _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, fetched emergency contacts count, %lu", buf, 0x20u);
      }
      uint64_t v34 = *(void *)(*(void *)&v59[8] + 40);
      __int16 v35 = (id *)(v49 + 5);
      id obj = (id)v49[5];
      uint64_t v36 = [(RTHealthKitManager *)self _getRTContactsFromHKEmergencyContacts:v34 error:&obj];
      objc_storeStrong(v35, obj);
      id v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        id v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = [v36 count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v39;
        __int16 v55 = 2112;
        id v56 = v40;
        __int16 v57 = 2048;
        uint64_t v58 = v41;
        _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, %@, RTContact count, %lu", buf, 0x20u);
      }
      ((void (**)(id, void *, id))v5)[2](v5, v36, (id)v49[5]);
    }
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(v59, 8);
  }
  else
  {
    __int16 v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)double v59 = 136315394;
      *(void *)&v59[4] = "-[RTHealthKitManager _fetchEmergencyContactsWithHandler:]";
      *(_WORD *)&unsigned char v59[12] = 1024;
      *(_DWORD *)&v59[14] = 4009;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v59, 0x12u);
    }
  }
}

void __57__RTHealthKitManager__fetchEmergencyContactsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getRTContactsFromHKEmergencyContacts:(id)a3 error:(id *)a4
{
  aSelector = a2;
  v77[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v65 = 0;
  __int16 v66 = &v65;
  uint64_t v67 = 0x3032000000;
  long long v68 = __Block_byref_object_copy__146;
  long long v69 = __Block_byref_object_dispose__146;
  id v70 = 0;
  uint64_t v59 = 0;
  double v60 = &v59;
  uint64_t v61 = 0x3032000000;
  id v62 = __Block_byref_object_copy__146;
  id v63 = __Block_byref_object_dispose__146;
  id v64 = 0;
  id v5 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v76 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v56;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v55 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1E016D870](v7);
        double v13 = [v11 nameContactIdentifier:aSelector];

        if (v13)
        {
          double v14 = [v11 nameContactIdentifier];
          [v5 addObject:v14];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v76 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  if ([v5 count])
  {
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    uint64_t v16 = [(RTHealthKitManager *)self contactsManager];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __66__RTHealthKitManager__getRTContactsFromHKEmergencyContacts_error___block_invoke;
    v51[3] = &unk_1E6B905F0;
    id v53 = &v65;
    uint64_t v54 = &v59;
    uint64_t v17 = v15;
    __int16 v52 = v17;
    [v16 fetchContactsUsingContactIdentifiers:v5 handler:v51];

    id v18 = v17;
    id v19 = (id)0x1E4F1C000;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v21 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v18, v21)) {
      goto LABEL_16;
    }
    id v22 = [MEMORY[0x1E4F1C9C8] now];
    [v22 timeIntervalSinceDate:v20];
    double v24 = v23;
    id v25 = objc_opt_new();
    __int16 v26 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1152];
    id v27 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v28 = [v27 filteredArrayUsingPredicate:v26];
    id v29 = [v28 firstObject];

    [v25 submitToCoreAnalytics:v29 type:1 duration:v24];
    __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v31 = (void *)MEMORY[0x1E4F28C58];
    v77[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v77 count:1];
    id v19 = [v31 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v32];

    if (v19)
    {
      id v33 = v19;
    }
    else
    {
LABEL_16:
      id v33 = 0;
    }

    id v34 = v33;
    __int16 v35 = v34;
    if (a4)
    {
      if (v60[5])
      {
        uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          id v43 = NSStringFromSelector(aSelector);
          dispatch_time_t v44 = (void *)v60[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v42;
          __int16 v72 = 2112;
          id v73 = v43;
          __int16 v74 = 2112;
          uint64_t v75 = v44;
          _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        id v37 = (void *)v60[5];
LABEL_26:
        *a4 = v37;
        id v19 = [MEMORY[0x1E4F1C978] array];
        int v39 = 0;
        goto LABEL_28;
      }
      if (v34)
      {
        id v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          id v46 = (id)objc_claimAutoreleasedReturnValue();
          id v47 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v46;
          __int16 v72 = 2112;
          id v73 = v47;
          __int16 v74 = 2112;
          uint64_t v75 = v35;
          _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        id v37 = v35;
        goto LABEL_26;
      }
    }
    int v39 = 1;
LABEL_28:

    if (!v39) {
      goto LABEL_30;
    }
  }
  id v19 = (id)v66[5];
LABEL_30:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v19;
}

void __66__RTHealthKitManager__getRTContactsFromHKEmergencyContacts_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setupEvalMode
{
  id v3 = [(RTHealthKitManager *)self platform];
  int v4 = [v3 internalInstall];

  if (v4)
  {
    int out_token = 0;
    id v5 = (const char *)[@"RTDefaultsHealthKitManagerSpoofNotification" UTF8String];
    id v6 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__RTHealthKitManager__setupEvalMode__block_invoke;
    v7[3] = &unk_1E6B99760;
    v7[4] = self;
    notify_register_dispatch(v5, &out_token, v6, v7);
  }
}

void __36__RTHealthKitManager__setupEvalMode__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) defaultsManager];
  id v14 = [v2 objectForKey:@"RTDefaultsHealthKitManagerSpoofNotification"];

  id v3 = +[RTNotification notificationName];
  int v4 = [v14 isEqualToString:v3];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
LABEL_9:
    uint64_t v8 = (RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification *)objc_opt_new();
    goto LABEL_10;
  }
  id v6 = +[RTNotification notificationName];
  int v7 = [v14 isEqualToString:v6];

  if (!v7)
  {
    uint64_t v9 = +[RTNotification notificationName];
    int v10 = [v14 isEqualToString:v9];

    if (v10)
    {
      id v5 = *(void **)(a1 + 32);
    }
    else
    {
      id v11 = +[RTNotification notificationName];
      int v12 = [v14 isEqualToString:v11];

      if (!v12) {
        goto LABEL_11;
      }
      id v5 = *(void **)(a1 + 32);
    }
    goto LABEL_9;
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v8 = [[RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification alloc] initWithAlertDimissedReason:5];
LABEL_10:
  double v13 = v8;
  [v5 postNotification:v8];

LABEL_11:
}

- (NSUUID)currentWorkoutSessionIdentifier
{
  return self->_currentWorkoutSessionIdentifier;
}

- (void)setCurrentWorkoutSessionIdentifier:(id)a3
{
}

- (BOOL)currentWorkoutIsFirstPartyWorkout
{
  return self->_currentWorkoutIsFirstPartyWorkout;
}

- (void)setCurrentWorkoutIsFirstPartyWorkout:(BOOL)a3
{
  self->_currentWorkoutIsFirstPartyWorkout = a3;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
}

- (_HKWorkoutObserver)workoutObserver
{
  return self->_workoutObserver;
}

- (void)setWorkoutObserver:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void)setMedicalIDStore:(id)a3
{
}

- (id)errorFunction
{
  return self->_errorFunction;
}

- (void)setErrorFunction:(id)a3
{
}

- (HKWorkoutClusterStore)workoutClusterStore
{
  return self->_workoutClusterStore;
}

- (void)setWorkoutClusterStore:(id)a3
{
}

- (HKObserverQuery)theNewWorkoutsForRaceRouteQuery
{
  return self->_theNewWorkoutsForRaceRouteQuery;
}

- (void)setTheNewWorkoutsForRaceRouteQuery:(id)a3
{
}

- (HKObserverQuery)theNewWorkoutsForSMSuggestionsQuery
{
  return self->_theNewWorkoutsForSMSuggestionsQuery;
}

- (void)setTheNewWorkoutsForSMSuggestionsQuery:(id)a3
{
}

- (BOOL)receivedInitialNewWorkoutsQueryResponse
{
  return self->_receivedInitialNewWorkoutsQueryResponse;
}

- (void)setReceivedInitialNewWorkoutsQueryResponse:(BOOL)a3
{
  self->_receivedInitialNewWorkoutsQueryResponse = a3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (BOOL)listenForNewWorkoutsForRaceRouteEnabled
{
  return self->_listenForNewWorkoutsForRaceRouteEnabled;
}

- (BOOL)listenForNewWorkoutsForSMSuggestionsEnabled
{
  return self->_listenForNewWorkoutsForSMSuggestionsEnabled;
}

- (void)setListenForNewWorkoutsForSMSuggestionsEnabled:(BOOL)a3
{
  self->_listenForNewWorkoutsForSMSuggestionsEnabled = a3;
}

- (BOOL)listenForWorkoutSnapshotUpdatesEnabled
{
  return self->_listenForWorkoutSnapshotUpdatesEnabled;
}

- (void)setListenForWorkoutSnapshotUpdatesEnabled:(BOOL)a3
{
  self->_listenForWorkoutSnapshotUpdatesEnabled = a3;
}

- (BOOL)listenForWorkoutOngoingChangedEnabled
{
  return self->_listenForWorkoutOngoingChangedEnabled;
}

- (void)setListenForWorkoutOngoingChangedEnabled:(BOOL)a3
{
  self->_listenForWorkoutOngoingChangedEnabled = a3;
}

- (unint64_t)workoutMinDistance
{
  return self->_workoutMinDistance;
}

- (void)setWorkoutMinDistance:(unint64_t)a3
{
  self->_workoutMinDistance = a3;
}

- (unint64_t)workoutMinDistanceCycling
{
  return self->_workoutMinDistanceCycling;
}

- (void)setWorkoutMinDistanceCycling:(unint64_t)a3
{
  self->_workoutMinDistanceCycling = a3;
}

- (NSDate)mostRecentWorkoutStartDate
{
  return self->_mostRecentWorkoutStartDate;
}

- (void)setMostRecentWorkoutStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentWorkoutStartDate, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_theNewWorkoutsForSMSuggestionsQuery, 0);
  objc_storeStrong((id *)&self->_theNewWorkoutsForRaceRouteQuery, 0);
  objc_storeStrong((id *)&self->_workoutClusterStore, 0);
  objc_storeStrong(&self->_errorFunction, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_workoutObserver, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);

  objc_storeStrong((id *)&self->_currentWorkoutSessionIdentifier, 0);
}

@end