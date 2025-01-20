@interface RTLocationManager
+ (BOOL)isValidIdentifier:(id)a3;
+ (BOOL)isValidLocation:(id)a3 options:(id)a4;
+ (BOOL)supportsNotificationName:(id)a3;
+ (id)clientRegionForRegion:(id)a3 clientIdentifierPrefix:(id)a4;
+ (id)defaultLocationRequestOptions;
+ (id)errorDuplicateClientIdentifier:(id)a3;
+ (id)errorUnregisteredClientIdentifier:(id)a3;
+ (id)errorUsedDelimiter;
+ (id)regionIdentifierDelimiterString;
+ (id)regionWithModifiedIdentifier:(id)a3 forRegion:(id)a4;
+ (id)stringForRegionCallbackType:(int64_t)a3;
+ (id)vendedClasses;
+ (int64_t)periodicPurgePolicy;
- (BOOL)_considerInUse;
- (BOOL)_isClientIdentifierAvailable:(id)a3;
- (BOOL)_isMonitoringForRegionWithClientIdentifier:(id)a3 regionIdentifier:(id)a4;
- (BOOL)_performCallbackForClientRegion:(id)a3 clientIdentifier:(id)a4 regionEvent:(int64_t)a5 callbackError:(id)a6 handler:(id)a7;
- (BOOL)_performCallbackForRegion:(id)a3 regionEvent:(int64_t)a4 callbackError:(id)a5 handler:(id)a6;
- (BOOL)_stopMonitoringAllRegionsForClientIdentifier:(id)a3 error:(id *)a4;
- (BOOL)enabled;
- (BOOL)isMonitoringForRegionWithClientIdentifier:(id)a3 regionIdentifier:(id)a4;
- (BOOL)leechingLocations;
- (BOOL)locationStoreAvailable;
- (BOOL)monitoringLocations;
- (BOOL)monitoringRhythmicLocations;
- (BOOL)persistingLocations;
- (BOOL)startMonitoringForRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)stopMonitoringAllRegionsForClientIdentifier:(id)a3 error:(id *)a4;
- (BOOL)stopMonitoringForRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)supported;
- (CLLocation)lastLocation;
- (CLLocationManager)locationManager;
- (CLLocationManager)rhythmicLocationManager;
- (CLLocationManagerRoutine)locationManagerRoutine;
- (NSMutableArray)currentLocationRequests;
- (NSMutableDictionary)regionEventHandlerDictionary;
- (NSString)effectiveLocationBundlePath;
- (NSString)locationBundlePathShortname;
- (RTAuthorizationManager)authorizationManager;
- (RTDefaultsManager)defaultsManager;
- (RTInvocationDispatcher)dispatcher;
- (RTInvocationDispatcher)regionEventDispatcher;
- (RTLocationManager)init;
- (RTLocationManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 locationSmoother:(id)a5 locationStore:(id)a6 platform:(id)a7 routineLocationManager:(id)a8 timerManager:(id)a9;
- (RTLocationManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 locationSmoother:(id)a5 locationStore:(id)a6 platform:(id)a7 routineLocationManager:(id)a8 timerManager:(id)a9 effectiveLocationBundlePath:(id)a10;
- (RTLocationSmoother)locationSmoother;
- (RTLocationStoreProtocol)locationStore;
- (RTPlatform)platform;
- (RTPowerAssertion)powerAssertion;
- (RTTimer)activeLocationRequestTimer;
- (RTTimerManager)timerManager;
- (RTTrustedTimeCache)trustedTimeCache;
- (double)_activeLocationRequestsMinDesiredAccuracy;
- (id)_activeLocationRequestTimerExpiryDate;
- (id)_clientIdentifierForRegion:(id)a3;
- (id)_fullIdentifierForClientIdentifier:(id)a3 regionIdentifier:(id)a4 error:(id *)a5;
- (id)_prefixForClientIdentifier:(id)a3 error:(id *)a4;
- (id)_regionForClientRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (id)preprocessLocationsForStorage:(id)a3;
- (id)trustedDate;
- (void)_createLocationManager;
- (void)_fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7;
- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)_fetchStoredLocationsWithContext:(id)a3 limit:(unint64_t)a4 referenceDate:(id)a5 handler:(id)a6;
- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)_handleExpiredLocationRequestsWithIndexes:(id)a3;
- (void)_registerForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4;
- (void)_registerNotifications;
- (void)_removeLocationsPredating:(id)a3 handler:(id)a4;
- (void)_reviewActiveLocationRequests;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)_storeLocations:(id)a3 handler:(id)a4;
- (void)_unregisterForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4;
- (void)_unregisterNotifications;
- (void)fetchCachedLocationWithHandler:(id)a3;
- (void)fetchCachedLocationWithOptions:(id)a3 handler:(id)a4;
- (void)fetchCurrentLocationWithHandler:(id)a3;
- (void)fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchLastLocationWithHandler:(id)a3;
- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7;
- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)injectLocations:(id)a3 handler:(id)a4;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)onActiveLocationRequestTimerExpiry;
- (void)onAuthorizationNotification:(id)a3;
- (void)onLocationStoreNotification:(id)a3;
- (void)onUserSessionChangeNotification:(id)a3;
- (void)performCallbackForRegion:(id)a3 regionEvent:(int64_t)a4 callbackError:(id)a5 handler:(id)a6;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)registerForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4;
- (void)setActiveLocationRequestTimer:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setCurrentLocationRequests:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setEffectiveLocationBundlePath:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLastLocation:(id)a3;
- (void)setLeechingLocations:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationManagerRoutine:(id)a3;
- (void)setLocationSmoother:(id)a3;
- (void)setLocationStore:(id)a3;
- (void)setLocationStoreAvailable:(BOOL)a3;
- (void)setMonitoringLocations:(BOOL)a3;
- (void)setMonitoringRhythmicLocations:(BOOL)a3;
- (void)setPersistingLocations:(BOOL)a3;
- (void)setPlatform:(id)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setRegionEventDispatcher:(id)a3;
- (void)setRegionEventHandlerDictionary:(id)a3;
- (void)setRhythmicLocationManager:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setTimerManager:(id)a3;
- (void)shouldLeechLocations;
- (void)shouldMonitorLocations;
- (void)shouldMonitorRhythmicLocations;
- (void)shouldPersistLocations;
- (void)submitHarvestSample:(id)a3 handler:(id)a4;
- (void)unregisterForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4;
@end

@implementation RTLocationManager

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke;
  block[3] = &unk_1E6B90FA8;
  id v17 = v10;
  v18 = self;
  id v19 = v9;
  id v20 = v11;
  SEL v21 = a2;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, block);
}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v3 = [*(id *)(a1 + 40) locationManagerRoutine];
    if (v3)
    {
      v4 = *(void **)(a1 + 48);
      v1 = [*(id *)(a1 + 40) locationManagerRoutine];
      if ([v4 isEqual:v1])
      {

        goto LABEL_11;
      }
    }
    v5 = [*(id *)(a1 + 40) locationManagerRoutine];
    if (v5)
    {

      if (v3)
      {
      }
    }
    else
    {
      char v6 = [*(id *)(a1 + 40) _considerInUse];
      if (v3)
      {
      }
      if (v6)
      {
LABEL_11:
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2;
        v46[3] = &unk_1E6B93A18;
        v7 = *(void **)(a1 + 32);
        v46[4] = *(void *)(a1 + 40);
        [v7 enumerateObjectsUsingBlock:v46];
        v8 = [*(id *)(a1 + 32) sortedArrayUsingComparator:&__block_literal_global_162];
        id v9 = [*(id *)(a1 + 40) preprocessLocationsForStorage:v8];

        id v10 = *(void **)(a1 + 40);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2_163;
        v43[3] = &unk_1E6B94130;
        uint64_t v45 = *(void *)(a1 + 64);
        v43[4] = v10;
        id v44 = *(id *)(a1 + 32);
        [v10 _storeLocations:v9 handler:v43];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_164;
        v42[3] = &unk_1E6B93A18;
        v42[4] = *(void *)(a1 + 40);
        [v9 enumerateObjectsUsingBlock:v42];
        id v11 = [v9 lastObject];
        v12 = [v11 timestamp];
        id v13 = [*(id *)(a1 + 40) lastLocation];
        id v14 = [v13 timestamp];
        int v15 = [v12 isOnOrAfter:v14];

        if (v15)
        {
          v16 = [v9 lastObject];
          [*(id *)(a1 + 40) setLastLocation:v16];
        }
        id v17 = *(void **)(a1 + 40);
        v18 = +[RTNotification notificationName];
        if (![v17 getNumberOfObservers:v18])
        {
          id v19 = *(void **)(a1 + 40);
          id v20 = +[RTNotification notificationName];
          if (![v19 getNumberOfObservers:v20])
          {
            v39 = *(void **)(a1 + 40);
            v40 = +[RTNotification notificationName];
            uint64_t v41 = [v39 getNumberOfObservers:v40];

            if (!v41)
            {
LABEL_23:
              uint64_t v36 = *(void *)(a1 + 56);
              if (v36) {
                (*(void (**)(void))(v36 + 16))();
              }

              return;
            }
LABEL_17:
            SEL v21 = *(void **)(a1 + 40);
            v22 = +[RTNotification notificationName];
            uint64_t v23 = [v21 getNumberOfObservers:v22];

            if (v23)
            {
              v24 = *(void **)(a1 + 40);
              v25 = [[RTLocationManagerNotificationLocationsLeeched alloc] initWithLocations:v9];
              [v24 postNotification:v25];
            }
            v26 = *(void **)(a1 + 40);
            v27 = +[RTNotification notificationName];
            uint64_t v28 = [v26 getNumberOfObservers:v27];

            if (v28)
            {
              v29 = *(void **)(a1 + 40);
              v30 = [[RTLocationManagerNotificationLocationsAccuracyHundredMeters alloc] initWithLocations:v9];
              [v29 postNotification:v30];
            }
            v31 = *(void **)(a1 + 40);
            v32 = +[RTNotification notificationName];
            uint64_t v33 = [v31 getNumberOfObservers:v32];

            if (v33)
            {
              v34 = *(void **)(a1 + 40);
              v35 = [[RTLocationManagerNotificationLocationsAccuracyBest alloc] initWithLocations:v9];
              [v34 postNotification:v35];
            }
            goto LABEL_23;
          }
        }
        goto LABEL_17;
      }
    }
  }
  uint64_t v37 = *(void *)(a1 + 56);
  if (v37)
  {
    v38 = *(void (**)(void))(v37 + 16);
    v38();
  }
}

- (CLLocationManagerRoutine)locationManagerRoutine
{
  return self->_locationManagerRoutine;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2_163(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3 && [v3 code] != 2)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56);
      int v9 = 138413058;
      id v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = [v7 count];
      __int16 v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@, %@, encountered error storing %lu locations, error, %@", (uint8_t *)&v9, 0x2Au);
    }
  }
}

uint64_t __45__RTLocationManager__storeLocations_handler___block_invoke_156(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)vendedClasses
{
  v2 = (void *)vendedClasses_vendedClasses_1;
  if (!vendedClasses_vendedClasses_1)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:objc_opt_class(), 0];
    v4 = (void *)vendedClasses_vendedClasses_1;
    vendedClasses_vendedClasses_1 = v3;

    v2 = (void *)vendedClasses_vendedClasses_1;
  }

  return v2;
}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    int v9 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"BypassPersistRawLocations"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        locationBundlePathShortname = self->_locationBundlePathShortname;
        *(_DWORD *)buf = 138412290;
        v34 = locationBundlePathShortname;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, dropping leeched locations because override default is set.", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
  if ([(RTLocationManager *)self persistingLocations])
  {
    if ([v7 count])
    {
      if ([(RTLocationManager *)self locationStoreAvailable])
      {
        __int16 v13 = [(RTLocationManager *)self locationStore];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __45__RTLocationManager__storeLocations_handler___block_invoke_156;
        v23[3] = &unk_1E6B90C18;
        id v24 = v8;
        [v13 storeLocations:v7 handler:v23];

        uint64_t v14 = v24;
      }
      else
      {
        id v19 = [(RTLocationManager *)self dispatcher];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __45__RTLocationManager__storeLocations_handler___block_invoke;
        v28[3] = &unk_1E6B90660;
        v28[4] = self;
        id v29 = v7;
        id v30 = v8;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __45__RTLocationManager__storeLocations_handler___block_invoke_2;
        v25[3] = &unk_1E6B921E0;
        v25[4] = self;
        SEL v27 = a2;
        id v26 = v30;
        id v20 = (objc_class *)objc_opt_class();
        SEL v21 = NSStringFromClass(v20);
        v22 = NSStringFromSelector(a2);
        [v19 enqueueBlock:v28, v25, @"%@-%@", v21, v22 failureBlock description];

        uint64_t v14 = v29;
      }
    }
    else if (v8)
    {
LABEL_13:
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
  else if (v8)
  {
    __int16 v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32 = @"Service has been disabled by user.";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v18 = [v15 errorWithDomain:v16 code:2 userInfo:v17];
    (*((void (**)(id, void *))v8 + 2))(v8, v18);
  }
}

- (id)preprocessLocationsForStorage:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61 = self;
  v5 = [(RTLocationManager *)self effectiveLocationBundlePath];
  char v6 = [v5 isEqualToString:@"/System/Library/LocationBundles/Routine.bundle"];

  if ((v6 & 1) == 0)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      v54 = NSStringFromSelector(a2);
      v55 = [(RTLocationManager *)v61 effectiveLocationBundlePath];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v53;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v54;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v55;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "%@, %@, bypassing preprocessor, effectiveLocationBundlePath, %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  id v7 = [(RTLocationManager *)v61 platform];
  if ([v7 internalInstall])
  {
    id v8 = [(RTLocationManager *)v61 defaultsManager];
    int v9 = [v8 objectForKey:@"RTDefaultsLocationManagerBypassPreprocessor"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v56 = (objc_class *)objc_opt_class();
        v57 = NSStringFromClass(v56);
        v58 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v58;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = @"RTDefaultsLocationManagerBypassPreprocessor";
        _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, bypassing preprocessor, disable: defaults delete com.apple.routined %@", buf, 0x20u);
      }
LABEL_10:
      id v13 = v4;
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v14 = [(RTLocationManager *)v61 trustedDate];
  id v13 = [MEMORY[0x1E4F1CA48] array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v59 = v4;
  id v15 = v4;
  uint64_t v64 = [v15 countByEnumeratingWithState:&v65 objects:v85 count:16];
  if (!v64) {
    goto LABEL_40;
  }
  uint64_t v63 = *(void *)v66;
  int v62 = *MEMORY[0x1E4F1E768];
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v66 != v63) {
        objc_enumerationMutation(v15);
      }
      uint64_t v17 = *(void **)(*((void *)&v65 + 1) + 8 * v16);
      v18 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v41 = (objc_class *)objc_opt_class();
        v42 = NSStringFromClass(v41);
        v43 = NSStringFromSelector(a2);
        locationBundlePathShortname = v61->_locationBundlePathShortname;
        int v45 = [v17 integrity];
        *(_DWORD *)buf = 138413315;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = locationBundlePathShortname;
        LOWORD(v78) = 2112;
        *(void *)((char *)&v78 + 2) = v17;
        WORD5(v78) = 1025;
        HIDWORD(v78) = v45;
        _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "%@,%@, %@, processing location, %@, integrity %{private}d", buf, 0x30u);
      }
      uint64_t v19 = [v17 sourceInformation];
      if (!v19
        || (id v20 = (void *)v19,
            [v17 sourceInformation],
            SEL v21 = objc_claimAutoreleasedReturnValue(),
            int v22 = [v21 isSimulatedBySoftware],
            v21,
            v20,
            !v22))
      {
        v25 = v17;
        id v26 = v25;
        if (v14
          && ([v25 timestamp],
              SEL v27 = objc_claimAutoreleasedReturnValue(),
              [v14 timeIntervalSinceDate:v27],
              double v29 = fabs(v28),
              v27,
              v29 <= 600.0))
        {
          v38 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v46 = (objc_class *)objc_opt_class();
            v47 = NSStringFromClass(v46);
            v48 = NSStringFromSelector(a2);
            v49 = v61->_locationBundlePathShortname;
            int v50 = [v26 integrity];
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v47;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v48;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v49;
            LOWORD(v78) = 2112;
            *(void *)((char *)&v78 + 2) = v26;
            WORD5(v78) = 1026;
            HIDWORD(v78) = v50;
            _os_log_debug_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEBUG, "%@,%@, %@, processed location, no integrity downgrade, %@, integrity, %{public}d.", buf, 0x30u);
          }
          uint64_t v23 = v26;
        }
        else
        {
          long long v83 = 0u;
          memset(v84, 0, 28);
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v78 = 0u;
          memset(buf, 0, sizeof(buf));
          if (v26) {
            [v26 clientLocation];
          }
          LODWORD(v84[0]) = v62;
          id v30 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          long long v74 = v82;
          long long v75 = v83;
          v76[0] = v84[0];
          *(_OWORD *)((char *)v76 + 12) = *(_OWORD *)((char *)v84 + 12);
          long long v70 = v78;
          long long v71 = v79;
          long long v72 = v80;
          long long v73 = v81;
          *(_OWORD *)v69 = *(_OWORD *)buf;
          *(_OWORD *)&v69[16] = *(_OWORD *)&buf[16];
          uint64_t v23 = [v30 initWithClientLocation:v69];

          uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v32)
            {
              uint64_t v33 = v61->_locationBundlePathShortname;
              int v34 = [v23 integrity];
              *(_DWORD *)v69 = 138413058;
              *(void *)&v69[4] = v33;
              *(_WORD *)&v69[12] = 2112;
              *(void *)&v69[14] = v14;
              *(_WORD *)&v69[22] = 2112;
              *(void *)&v69[24] = v23;
              LOWORD(v70) = 1026;
              *(_DWORD *)((char *)&v70 + 2) = v34;
              uint64_t v35 = v31;
              uint64_t v36 = "%@, downgrading leeched location integrity because user-time to trusted-time offset is too large: %@"
                    ", %@, integrity, %{public}d.";
              uint32_t v37 = 38;
              goto LABEL_35;
            }
          }
          else if (v32)
          {
            v39 = v61->_locationBundlePathShortname;
            int v40 = [v23 integrity];
            *(_DWORD *)v69 = 138412802;
            *(void *)&v69[4] = v39;
            *(_WORD *)&v69[12] = 2112;
            *(void *)&v69[14] = v23;
            *(_WORD *)&v69[22] = 1026;
            *(_DWORD *)&v69[24] = v40;
            uint64_t v35 = v31;
            uint64_t v36 = "%@, downgrading leeched location integrity because trusted-time is unavailable, %@, integrity, %{public}d.";
            uint32_t v37 = 28;
LABEL_35:
            _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEFAULT, v36, v69, v37);
          }
        }
        [v13 addObject:v23];
        goto LABEL_38;
      }
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = v61->_locationBundlePathShortname;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, dropping leeched location that is simulated by software, %@.", buf, 0x16u);
      }
LABEL_38:

      ++v16;
    }
    while (v64 != v16);
    uint64_t v64 = [v15 countByEnumeratingWithState:&v65 objects:v85 count:16];
  }
  while (v64);
LABEL_40:

  id v4 = v59;
LABEL_41:

  return v13;
}

- (id)trustedDate
{
  return [(RTTrustedTimeCache *)self->_trustedTimeCache getApproximateTrustedDateNowWithUnsecureFallback];
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (BOOL)persistingLocations
{
  return self->_persistingLocations;
}

- (RTLocationStoreProtocol)locationStore
{
  return self->_locationStore;
}

- (BOOL)locationStoreAvailable
{
  return self->_locationStoreAvailable;
}

- (NSString)effectiveLocationBundlePath
{
  return self->_effectiveLocationBundlePath;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 type] == 13)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_FAULT, "%@, received location of LoiOverride type, location, %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_reviewActiveLocationRequests
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    uint64_t v5 = [(RTLocationManager *)self currentLocationRequests];
    *(_DWORD *)buf = 136315650;
    uint64_t v23 = "-[RTLocationManager _reviewActiveLocationRequests]";
    __int16 v24 = 2112;
    v25 = locationBundlePathShortname;
    __int16 v26 = 1024;
    int v27 = [v5 count];
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, %@, #location requests, %d", buf, 0x1Cu);
  }
  activeLocationRequestTimer = self->_activeLocationRequestTimer;
  if (activeLocationRequestTimer)
  {
    [(RTTimer *)activeLocationRequestTimer invalidate];
    uint64_t v7 = self->_activeLocationRequestTimer;
    self->_activeLocationRequestTimer = 0;
  }
  [(RTLocationManager *)self shouldMonitorLocations];
  __int16 v8 = [(RTLocationManager *)self currentLocationRequests];
  BOOL v9 = [v8 count] == 0;

  if (!v9)
  {
    uint64_t v10 = [(RTLocationManager *)self _activeLocationRequestTimerExpiryDate];
    objc_initWeak((id *)buf, self);
    timerManager = self->_timerManager;
    uint64_t v12 = NSString;
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    id v15 = [v12 stringWithFormat:@"%@.activeLocationRequestTimer", v14];
    uint64_t v16 = [(RTNotifier *)self queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __50__RTLocationManager__reviewActiveLocationRequests__block_invoke;
    v20[3] = &unk_1E6B91900;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v17 = [(RTTimerManager *)timerManager timerWithIdentifier:v15 queue:v16 handler:v20];
    v18 = self->_activeLocationRequestTimer;
    self->_activeLocationRequestTimer = v17;

    uint64_t v19 = self->_activeLocationRequestTimer;
    [v10 timeIntervalSinceNow];
    -[RTTimer fireWithInterval:leeway:](v19, "fireWithInterval:leeway:");
    [(RTTimer *)self->_activeLocationRequestTimer resume];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setLastLocation:(id)a3
{
  id v5 = a3;
  int v6 = [(CLLocation *)self->_lastLocation timestamp];
  uint64_t v7 = [v5 timestamp];
  __int16 v8 = [v6 laterDate:v7];
  BOOL v9 = [(CLLocation *)self->_lastLocation timestamp];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    [v5 horizontalAccuracy];
    if (v11 >= 0.0)
    {
      [v5 horizontalAccuracy];
      if (v12 <= *MEMORY[0x1E4F1E748])
      {
        id v13 = [(RTLocationManager *)self currentLocationRequests];
        uint64_t v14 = [v13 count];

        if (v14)
        {
          id v15 = [(RTLocationManager *)self currentLocationRequests];
          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 3221225472;
          v18 = __37__RTLocationManager_setLastLocation___block_invoke;
          uint64_t v19 = &unk_1E6B96E60;
          id v20 = self;
          id v21 = v5;
          [v15 enumerateObjectsUsingBlock:&v16];

          [(RTLocationManager *)self _reviewActiveLocationRequests];
        }
      }
    }
  }
}

- (NSMutableArray)currentLocationRequests
{
  return self->_currentLocationRequests;
}

- (void)setMonitoringLocations:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_monitoringLocations != a3)
  {
    BOOL v3 = a3;
    self->_monitoringLocations = a3;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        locationBundlePathShortname = self->_locationBundlePathShortname;
        __int16 v8 = [(RTLocationManager *)self locationManager];
        [v8 desiredAccuracy];
        int v12 = 138412546;
        id v13 = locationBundlePathShortname;
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, start monitoring locations, desiredAccuracy, %f", (uint8_t *)&v12, 0x16u);
      }
      char v10 = [(RTLocationManager *)self locationManager];
      [v10 startUpdatingLocation];
    }
    else
    {
      if (v6)
      {
        double v11 = self->_locationBundlePathShortname;
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, stop monitoring locations", (uint8_t *)&v12, 0xCu);
      }

      char v10 = [(RTLocationManager *)self locationManager];
      [v10 stopUpdatingLocation];
    }
  }
}

- (void)shouldMonitorLocations
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[RTNotification notificationName];
  unint64_t v4 = [(RTNotifier *)self getNumberOfObservers:v3];

  if (v4)
  {
    double v5 = *MEMORY[0x1E4F1E6D8];
    BOOL v6 = 1;
    uint64_t v7 = 2;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1E6E8];
    __int16 v8 = +[RTNotification notificationName];
    unint64_t v9 = [(RTNotifier *)self getNumberOfObservers:v8];

    BOOL v6 = v9 != 0;
    uint64_t v7 = 1;
  }
  char v10 = [(RTLocationManager *)self currentLocationRequests];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    [(RTLocationManager *)self _activeLocationRequestsMinDesiredAccuracy];
    if (v5 >= v12) {
      double v5 = v12;
    }
    BOOL v6 = 1;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    uint64_t v15 = @"NO";
    *(void *)&v29[4] = "-[RTLocationManager shouldMonitorLocations]";
    *(_DWORD *)double v29 = 136315906;
    if (v6) {
      uint64_t v15 = @"YES";
    }
    *(_WORD *)&v29[12] = 2112;
    *(void *)&v29[14] = locationBundlePathShortname;
    __int16 v30 = 2048;
    double v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, %@, desiredAccuracy, %.2f, shouldMonitor, %@", v29, 0x2Au);
  }

  uint64_t v16 = [(RTLocationManager *)self locationManager];
  [v16 desiredAccuracy];
  double v18 = v17;

  if (v5 != v18)
  {
    uint64_t v19 = [(RTLocationManager *)self locationManager];
    [v19 setDesiredAccuracy:v5];
  }
  id v20 = [(RTLocationManager *)self powerAssertion];

  if (v4)
  {
    if (v20) {
      goto LABEL_22;
    }
    id v21 = [[RTPowerAssertion alloc] initWithIdentifier:@"com.apple.routined.location" timeout:20.0];
    [(RTLocationManager *)self setPowerAssertion:v21];

    int v22 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = self->_locationBundlePathShortname;
      __int16 v24 = [(RTLocationManager *)self powerAssertion];
      *(_DWORD *)double v29 = 138412546;
      *(void *)&v29[4] = v23;
      *(_WORD *)&v29[12] = 1024;
      *(_DWORD *)&v29[14] = v24 != 0;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, Taking power assertion, success, %d", v29, 0x12u);
    }
  }
  else
  {
    if (!v20) {
      goto LABEL_22;
    }
    [(RTLocationManager *)self setPowerAssertion:0];
    int v22 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = self->_locationBundlePathShortname;
      *(_DWORD *)double v29 = 138412290;
      *(void *)&v29[4] = v25;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, Releasing power assertion", v29, 0xCu);
    }
  }

LABEL_22:
  __int16 v26 = [(RTLocationManager *)self locationManager];
  uint64_t v27 = [v26 activityType];

  if (v7 != v27)
  {
    uint64_t v28 = [(RTLocationManager *)self locationManager];
    [v28 setActivityType:v7];
  }
  [(RTLocationManager *)self setMonitoringLocations:v6];
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (double)_activeLocationRequestsMinDesiredAccuracy
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  __int16 v14 = (double *)&v13;
  uint64_t v3 = *MEMORY[0x1E4F1E748];
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = v3;
  unint64_t v4 = [(RTLocationManager *)self currentLocationRequests];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__RTLocationManager__activeLocationRequestsMinDesiredAccuracy__block_invoke;
  v12[3] = &unk_1E6B96EB0;
  v12[4] = &v13;
  [v4 enumerateObjectsUsingBlock:v12];

  double v5 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    uint64_t v7 = [(RTLocationManager *)self currentLocationRequests];
    int v8 = [v7 count];
    uint64_t v9 = *((void *)v14 + 3);
    *(_DWORD *)buf = 136315906;
    double v18 = "-[RTLocationManager _activeLocationRequestsMinDesiredAccuracy]";
    __int16 v19 = 2112;
    id v20 = locationBundlePathShortname;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, %@, #requests, %d, min desired accuracy, %.2f", buf, 0x26u);
  }
  double v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)_activeLocationRequestTimerExpiryDate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__72;
  uint64_t v16 = __Block_byref_object_dispose__72;
  id v17 = 0;
  uint64_t v3 = [(RTLocationManager *)self currentLocationRequests];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__RTLocationManager__activeLocationRequestTimerExpiryDate__block_invoke;
  v11[3] = &unk_1E6B96EB0;
  v11[4] = &v12;
  [v3 enumerateObjectsUsingBlock:v11];

  unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    BOOL v6 = [(RTLocationManager *)self currentLocationRequests];
    int v7 = [v6 count];
    uint64_t v8 = v13[5];
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[RTLocationManager _activeLocationRequestTimerExpiryDate]";
    __int16 v20 = 2112;
    __int16 v21 = locationBundlePathShortname;
    __int16 v22 = 1024;
    int v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, %@, #requests, %d, min expiryDate, %@", buf, 0x26u);
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_164(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
    BOOL v6 = [v3 toString];
    int v19 = 138412546;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, received location, %@", (uint8_t *)&v19, 0x16u);
  }
  int v7 = [v3 timestamp];
  uint64_t v8 = [*(id *)(a1 + 32) lastLocation];
  id v9 = [v8 timestamp];
  int v10 = [v7 isBeforeDate:v9];

  if (v10)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = v12[7];
      uint64_t v14 = [v12 lastLocation];
      uint64_t v15 = [*(id *)(a1 + 32) lastLocation];
      uint64_t v16 = [v15 timestamp];
      id v17 = [v3 timestamp];
      [v16 timeIntervalSinceDate:v17];
      int v19 = 138413058;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, current location, %@, predates last location, %@, interval, %.2f", (uint8_t *)&v19, 0x2Au);
    }
  }
}

- (void)fetchCurrentLocationWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(id)objc_opt_class() defaultLocationRequestOptions];
    [(RTLocationManager *)self fetchCurrentLocationWithOptions:v5 handler:v4];
  }
}

- (void)fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Invalid parameter not satisfying: options";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Invalid parameter not satisfying: handler";
    goto LABEL_12;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]";
    __int16 v19 = 2112;
    uint64_t v20 = locationBundlePathShortname;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, %@, options, %@", buf, 0x20u);
  }

  uint64_t v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B92668;
  void block[4] = self;
  id v16 = v8;
  id v15 = v6;
  dispatch_async(v11, block);

LABEL_10:
}

+ (id)defaultLocationRequestOptions
{
  v2 = [RTLocationRequestOptions alloc];
  id v3 = [(RTLocationRequestOptions *)v2 initWithDesiredAccuracy:1 horizontalAccuracy:0 maxAge:*MEMORY[0x1E4F1E6E8] yieldLastLocation:100.0 timeout:3.0 fallback:30.0 fallbackHorizontalAccuracy:3000.0 fallbackMaxAge:0.0];

  return v3;
}

void __58__RTLocationManager__activeLocationRequestTimerExpiryDate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v12 = v3;
  if (!v4) {
    goto LABEL_3;
  }
  id v5 = [v3 expiryDate];
  id v6 = [v4 laterDate:v5];
  int v7 = [v6 isEqualToDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  uint64_t v8 = v12;
  if (v7)
  {
LABEL_3:
    uint64_t v9 = [v12 expiryDate];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v8 = v12;
  }
}

void __37__RTLocationManager_setLastLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v5 options];
  LODWORD(v6) = [v6 isValidLocation:v7 options:v8];

  if (v6)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 56);
      id v12 = [v10 timestamp];
      uint64_t v13 = [v5 startDate];
      [v12 timeIntervalSinceDate:v13];
      int v17 = 136316162;
      uint64_t v18 = "-[RTLocationManager setLastLocation:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v5;
      __int16 v23 = 2112;
      __int16 v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, %@, delta, %.2f", (uint8_t *)&v17, 0x34u);
    }
    id v15 = [v5 handler];
    v15[2](v15, *(void *)(a1 + 40), 0);

    id v16 = [*(id *)(a1 + 32) currentLocationRequests];
    [v16 removeObjectAtIndex:a3];
  }
}

void __60__RTLocationManager_fetchCachedLocationWithOptions_handler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) enabled])
  {
    uint64_t v2 = [*(id *)(a1 + 32) lastLocation];
    if (!v2) {
      goto LABEL_9;
    }
    id v3 = (void *)v2;
    id v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 32) lastLocation];
    LODWORD(v4) = [v4 isValidLocation:v5 options:*(void *)(a1 + 40)];

    if (!v4) {
      goto LABEL_9;
    }
    uint64_t v6 = [*(id *)(a1 + 32) lastLocation];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = 0;
    }
    else
    {
LABEL_9:
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)buf = 136315394;
        uint64_t v26 = "-[RTLocationManager fetchCachedLocationWithOptions:handler:]_block_invoke";
        __int16 v27 = 2112;
        uint64_t v28 = v16;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, %@, doesn't have a valid cached location", buf, 0x16u);
      }

      int v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFE8];
      __int16 v19 = [NSString stringWithFormat:@"no cached location", *MEMORY[0x1E4F28568]];
      id v22 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v8 = [v17 errorWithDomain:v18 code:6 userInfo:v20];

      uint64_t v7 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "-[RTLocationManager fetchCachedLocationWithOptions:handler:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, %@, doesn't have location authorization", buf, 0x16u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v7 = [NSString stringWithFormat:@"no authorization"];
    __int16 v24 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v14 = [v12 errorWithDomain:v13 code:2 userInfo:v8];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v14);
  }
}

void __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke_169(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v7 = [[RTLocationManagerLocationRequest alloc] initWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
      uint64_t v8 = [v3 timestamp];
      [v8 timeIntervalSinceNow];
      int v13 = 136316162;
      uint64_t v14 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, %@, delta, %.2f", (uint8_t *)&v13, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v5)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56);
      int v13 = 136315394;
      uint64_t v14 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, %@, yieldLastLocation, YES, doesn't have a current location, forwarding request to CL.", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v11 = [[RTLocationManagerLocationRequest alloc] initWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
    id v12 = [*(id *)(a1 + 32) currentLocationRequests];
    [v12 addObject:v11];

    [*(id *)(a1 + 32) _reviewActiveLocationRequests];
  }
}

void __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a1[4] enabled])
  {
    if ([a1[5] yieldLastLocation])
    {
      id v3 = a1[4];
      id v2 = a1[5];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __61__RTLocationManager_fetchCurrentLocationWithOptions_handler___block_invoke_169;
      v16[3] = &unk_1E6B96E88;
      v16[4] = v3;
      id v17 = v2;
      id v18 = a1[6];
      [v3 fetchCachedLocationWithOptions:v17 handler:v16];
    }
    else
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *((void *)a1[4] + 7);
        *(_DWORD *)buf = 136315394;
        uint64_t v22 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
        __int16 v23 = 2112;
        uint64_t v24 = v13;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, %@, yieldLastLocation, NO, forwarding request to CL.", buf, 0x16u);
      }

      uint64_t v14 = [[RTLocationManagerLocationRequest alloc] initWithOptions:a1[5] handler:a1[6]];
      __int16 v15 = [a1[4] currentLocationRequests];
      [v15 addObject:v14];

      [a1[4] _reviewActiveLocationRequests];
    }
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *((void *)a1[4] + 7);
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[RTLocationManager fetchCurrentLocationWithOptions:handler:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, %@, doesn't have location authorization", buf, 0x16u);
    }

    uint64_t v6 = (void (**)(id, void, void *))a1[6];
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v9 = [NSString stringWithFormat:@"no authorization"];
    id v20 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v11 = [v7 errorWithDomain:v8 code:2 userInfo:v10];
    v6[2](v6, 0, v11);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)fetchCachedLocationWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "Invalid parameter not satisfying: options";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "Invalid parameter not satisfying: handler";
    goto LABEL_10;
  }
  uint64_t v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTLocationManager_fetchCachedLocationWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B92668;
  void block[4] = self;
  id v14 = v8;
  id v13 = v6;
  dispatch_async(v9, block);

LABEL_8:
}

void __62__RTLocationManager__activeLocationRequestsMinDesiredAccuracy__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = [a2 options];
  [v4 desiredAccuracy];
  double v6 = v5;

  if (v3 >= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
}

+ (BOOL)isValidLocation:(id)a3 options:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F1C9C8] now];
  [v5 horizontalAccuracy];
  if (v8 > 0.0
    && ([v5 horizontalAccuracy], double v10 = v9, objc_msgSend(v6, "horizontalAccuracy"), v10 <= v11))
  {
    id v13 = [v5 timestamp];
    id v14 = [v7 laterDate:v13];
    if ([v14 isEqualToDate:v7])
    {
      __int16 v15 = [v5 timestamp];
      [v7 timeIntervalSinceDate:v15];
      double v17 = v16;
      [v6 maxAge];
      BOOL v12 = v17 <= v18;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = @"NO";
    int v22 = 136315906;
    __int16 v23 = "+[RTLocationManager isValidLocation:options:]";
    if (v12) {
      id v20 = @"YES";
    }
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v20;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%s, location, %@, options, %@, isValid, %@", (uint8_t *)&v22, 0x2Au);
  }

  return v12;
}

+ (id)stringForRegionCallbackType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E6B96FE8[a3 - 1];
  }
}

- (RTLocationManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_defaultsManager_locationSmoother_locationStore_platform_routineLocationManager_timerManager_);
}

- (RTLocationManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 locationSmoother:(id)a5 locationStore:(id)a6 platform:(id)a7 routineLocationManager:(id)a8 timerManager:(id)a9
{
  return [(RTLocationManager *)self initWithAuthorizationManager:a3 defaultsManager:a4 locationSmoother:a5 locationStore:a6 platform:a7 routineLocationManager:a8 timerManager:a9 effectiveLocationBundlePath:@"/System/Library/LocationBundles/Routine.bundle"];
}

- (RTLocationManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 locationSmoother:(id)a5 locationStore:(id)a6 platform:(id)a7 routineLocationManager:(id)a8 timerManager:(id)a9 effectiveLocationBundlePath:(id)a10
{
  id v54 = a3;
  id v16 = a4;
  id v17 = a5;
  id v55 = a6;
  id v57 = a7;
  id v53 = a8;
  id v56 = a9;
  id v18 = a10;
  if (!v16)
  {
    v42 = v18;
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    int v40 = 0;
    uint64_t v41 = v17;
    goto LABEL_19;
  }
  id v51 = v17;
  if (!v17)
  {
    v42 = v18;
    id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationSmoother", buf, 2u);
    }

    int v40 = 0;
    uint64_t v41 = 0;
LABEL_19:
    uint64_t v19 = v55;
LABEL_30:
    v39 = self;
    goto LABEL_31;
  }
  uint64_t v19 = v55;
  if (!v55)
  {
    v42 = v18;
    int v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: locationStore";
LABEL_28:
    _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    goto LABEL_29;
  }
  if (!v57)
  {
    v42 = v18;
    int v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: platform";
    goto LABEL_28;
  }
  if (!v56)
  {
    v42 = v18;
    int v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_28;
  }
  if (!v18)
  {
    v42 = 0;
    int v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "Invalid parameter not satisfying: effectiveBundlePath";
      goto LABEL_28;
    }
LABEL_29:

    int v40 = 0;
    uint64_t v41 = v51;
    goto LABEL_30;
  }
  int v50 = v18;
  if ([v18 isEqualToString:@"/System/Library/LocationBundles/Routine.bundle"])
  {
    if (v54)
    {
      if (v53) {
        goto LABEL_10;
      }
      v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      uint64_t v41 = v51;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: routineLocationManager", buf, 2u);
      }

      int v40 = 0;
    }
    else
    {
      v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
      }

      int v40 = 0;
      uint64_t v41 = v51;
    }
    v39 = self;
    v42 = v50;
    goto LABEL_31;
  }
LABEL_10:
  v58.receiver = self;
  v58.super_class = (Class)RTLocationManager;
  id v20 = [(RTNotifier *)&v58 init];
  __int16 v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_authorizationManager, a3);
    objc_storeStrong((id *)&v21->_defaultsManager, a4);
    objc_storeStrong((id *)&v21->_locationSmoother, a5);
    objc_storeStrong((id *)&v21->_locationStore, a6);
    objc_storeStrong((id *)&v21->_platform, a7);
    objc_storeStrong((id *)&v21->_locationManagerRoutine, a8);
    [(CLLocationManagerRoutine *)v21->_locationManagerRoutine setDelegate:v21];
    objc_storeStrong((id *)&v21->_timerManager, a9);
    objc_storeStrong((id *)&v21->_effectiveLocationBundlePath, a10);
    int v22 = [v50 componentsSeparatedByString:@"/"];
    uint64_t v23 = [v22 lastObject];
    locationBundlePathShortname = v21->_locationBundlePathShortname;
    v21->_locationBundlePathShortname = (NSString *)v23;

    uint64_t v25 = objc_opt_new();
    currentLocationRequests = v21->_currentLocationRequests;
    v21->_currentLocationRequests = (NSMutableArray *)v25;

    id v27 = [RTInvocationDispatcher alloc];
    __int16 v28 = [(RTNotifier *)v21 queue];
    uint64_t v29 = [(RTInvocationDispatcher *)v27 initWithQueue:v28];
    dispatcher = v21->_dispatcher;
    v21->_dispatcher = (RTInvocationDispatcher *)v29;

    double v31 = [RTInvocationDispatcher alloc];
    __int16 v32 = [(RTNotifier *)v21 queue];
    uint64_t v33 = [(RTInvocationDispatcher *)v31 initWithQueue:v32];
    regionEventDispatcher = v21->_regionEventDispatcher;
    v21->_regionEventDispatcher = (RTInvocationDispatcher *)v33;

    uint64_t v35 = objc_opt_new();
    regionEventHandlerDictionary = v21->_regionEventHandlerDictionary;
    v21->_regionEventHandlerDictionary = (NSMutableDictionary *)v35;

    uint32_t v37 = objc_alloc_init(RTTrustedTimeCache);
    trustedTimeCache = v21->_trustedTimeCache;
    v21->_trustedTimeCache = v37;

    [(RTService *)v21 setup];
  }
  v39 = v21;
  int v40 = v39;
  v42 = v50;
  uint64_t v41 = v51;
  uint64_t v19 = v55;
LABEL_31:

  return v40;
}

- (void)_registerNotifications
{
  double v3 = [(RTLocationManager *)self authorizationManager];
  id v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onAuthorizationNotification_ name:v4];

  id v5 = [(RTLocationManager *)self locationStore];
  id v6 = +[RTNotification notificationName];
  [v5 addObserver:self selector:sel_onLocationStoreNotification_ name:v6];

  id v8 = [(RTLocationManager *)self authorizationManager];
  double v7 = +[RTNotification notificationName];
  [v8 addObserver:self selector:sel_onUserSessionChangeNotification_ name:v7];
}

- (void)_unregisterNotifications
{
  double v3 = [(RTLocationManager *)self authorizationManager];
  [v3 removeObserver:self];

  id v4 = [(RTLocationManager *)self locationStore];
  [v4 removeObserver:self];
}

- (void)_createLocationManager
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E600]);
  id v4 = [(RTLocationManager *)self effectiveLocationBundlePath];
  id v5 = [(RTNotifier *)self queue];
  id v6 = (CLLocationManager *)[v3 initWithEffectiveBundlePath:v4 delegate:self onQueue:v5];
  locationManager = self->_locationManager;
  self->_locationManager = v6;

  [(CLLocationManager *)self->_locationManager setDesiredAccuracy:*MEMORY[0x1E4F1E6E8]];
  id v8 = objc_alloc(MEMORY[0x1E4F1E600]);
  double v9 = [(RTLocationManager *)self effectiveLocationBundlePath];
  double v10 = [(RTNotifier *)self queue];
  double v11 = (CLLocationManager *)[v8 initWithEffectiveBundlePath:v9 delegate:self onQueue:v10];
  rhythmicLocationManager = self->_rhythmicLocationManager;
  self->_rhythmicLocationManager = v11;

  double v13 = *MEMORY[0x1E4F1E738];
  id v14 = self->_rhythmicLocationManager;

  [(CLLocationManager *)v14 setDesiredAccuracy:v13];
}

- (void)_setup
{
  [(RTLocationManager *)self _createLocationManager];
  [(RTLocationManager *)self _registerNotifications];
  id v3 = [(RTLocationManager *)self authorizationManager];

  if (v3)
  {
    id v4 = [(RTLocationManager *)self authorizationManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__RTLocationManager__setup__block_invoke;
    v10[3] = &unk_1E6B94CE0;
    v10[4] = self;
    [v4 fetchRoutineEnabledWithHandler:v10];

    id v5 = [(RTLocationManager *)self authorizationManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__RTLocationManager__setup__block_invoke_3;
    v9[3] = &unk_1E6B94CE0;
    v9[4] = self;
    [v5 fetchRoutineSupportedWithHandler:v9];
  }
  else
  {
    [(RTLocationManager *)self setSupported:1];
    id v6 = [(RTLocationManager *)self locationManager];
    -[RTLocationManager setEnabled:](self, "setEnabled:", [v6 authorizationStatus] == 3);

    [(RTLocationManager *)self shouldLeechLocations];
    [(RTLocationManager *)self shouldPersistLocations];
  }
  double v7 = [(RTLocationManager *)self locationStore];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__RTLocationManager__setup__block_invoke_5;
  v8[3] = &unk_1E6B96E38;
  v8[4] = self;
  [v7 fetchLastLocationWithHandler:v8];
}

void __27__RTLocationManager__setup__block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__RTLocationManager__setup__block_invoke_2;
  v5[3] = &unk_1E6B90F08;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(v4, v5);
}

uint64_t __27__RTLocationManager__setup__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) shouldLeechLocations];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 shouldPersistLocations];
}

void __27__RTLocationManager__setup__block_invoke_3(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__RTLocationManager__setup__block_invoke_4;
  v5[3] = &unk_1E6B90F08;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(v4, v5);
}

uint64_t __27__RTLocationManager__setup__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setSupported:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) shouldLeechLocations];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 shouldPersistLocations];
}

void __27__RTLocationManager__setup__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__RTLocationManager__setup__block_invoke_6;
  v6[3] = &unk_1E6B90BF0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __27__RTLocationManager__setup__block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastLocation];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 setLastLocation:v4];
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  id v10 = a3;
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  activeLocationRequestTimer = self->_activeLocationRequestTimer;
  if (activeLocationRequestTimer)
  {
    [(RTTimer *)activeLocationRequestTimer invalidate];
    char v6 = self->_activeLocationRequestTimer;
    self->_activeLocationRequestTimer = 0;
  }
  [(RTLocationManager *)self _unregisterNotifications];
  id v7 = [(RTLocationManager *)self dispatcher];
  [v7 shutdown];

  id v8 = [(RTLocationManager *)self regionEventDispatcher];
  [v8 shutdown];

  [(RTLocationManager *)self setPowerAssertion:0];
  double v9 = v10;
  if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    double v9 = v10;
  }
}

- (void)shouldLeechLocations
{
  BOOL v5 = 0;
  if ([(RTLocationManager *)self supported])
  {
    id v3 = +[RTNotification notificationName];
    unint64_t v4 = [(RTNotifier *)self getNumberOfObservers:v3];

    if (v4) {
      BOOL v5 = 1;
    }
  }

  [(RTLocationManager *)self setLeechingLocations:v5];
}

- (void)setLeechingLocations:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_leechingLocations != a3)
  {
    self->_BOOL leechingLocations = a3;
    unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      if (self->_leechingLocations) {
        char v6 = @"YES";
      }
      else {
        char v6 = @"NO";
      }
      int v10 = 138412546;
      double v11 = locationBundlePathShortname;
      __int16 v12 = 2112;
      double v13 = v6;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, leech locations, %@", (uint8_t *)&v10, 0x16u);
    }

    BOOL leechingLocations = self->_leechingLocations;
    id v8 = [(RTLocationManager *)self locationManagerRoutine];
    double v9 = v8;
    if (leechingLocations) {
      [v8 startUpdatingLocation];
    }
    else {
      [v8 stopUpdatingLocation];
    }
  }
}

- (void)shouldMonitorRhythmicLocations
{
  double v3 = *MEMORY[0x1E4F1E738];
  unint64_t v4 = [(RTLocationManager *)self rhythmicLocationManager];
  [v4 setDesiredAccuracy:v3];

  if ([(RTLocationManager *)self supported])
  {
    BOOL v5 = +[RTNotification notificationName];
    unint64_t v6 = [(RTNotifier *)self getNumberOfObservers:v5];

    if (v6)
    {
      double v7 = *MEMORY[0x1E4F1E740];
      id v8 = [(RTLocationManager *)self rhythmicLocationManager];
      [v8 setDesiredAccuracy:v7];

LABEL_6:
      uint64_t v11 = 1;
      goto LABEL_8;
    }
  }
  if ([(RTLocationManager *)self supported])
  {
    double v9 = +[RTNotification notificationName];
    unint64_t v10 = [(RTNotifier *)self getNumberOfObservers:v9];

    if (v10) {
      goto LABEL_6;
    }
  }
  uint64_t v11 = 0;
LABEL_8:

  [(RTLocationManager *)self setMonitoringRhythmicLocations:v11];
}

- (void)setMonitoringRhythmicLocations:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_monitoringRhythmicLocations != a3)
  {
    BOOL v3 = a3;
    self->_monitoringRhythmicLocations = a3;
    BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        locationBundlePathShortname = self->_locationBundlePathShortname;
        int v10 = 138412290;
        uint64_t v11 = locationBundlePathShortname;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, start monitoring rhythmic locations", (uint8_t *)&v10, 0xCu);
      }

      id v8 = [(RTLocationManager *)self rhythmicLocationManager];
      [v8 startUpdatingLocation];
    }
    else
    {
      if (v6)
      {
        double v9 = self->_locationBundlePathShortname;
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, stop monitoring rhythmic locations", (uint8_t *)&v10, 0xCu);
      }

      id v8 = [(RTLocationManager *)self rhythmicLocationManager];
      [v8 stopUpdatingLocation];
    }
  }
}

- (void)shouldPersistLocations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    BOOL v5 = [(RTAuthorizationManager *)self->_authorizationManager shouldPersistLocations];
    int v10 = 138413058;
    uint64_t v11 = locationBundlePathShortname;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = [(RTLocationManager *)self supported];
    __int16 v16 = 1024;
    BOOL v17 = [(RTLocationManager *)self enabled];
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, shouldPersistLocations %d, supported %d, enabled %d", (uint8_t *)&v10, 0x1Eu);
  }

  BOOL v6 = [(RTLocationManager *)self authorizationManager];
  if (v6) {
    BOOL v7 = [(RTAuthorizationManager *)self->_authorizationManager shouldPersistLocations];
  }
  else {
    BOOL v7 = [(RTLocationManager *)self enabled];
  }
  BOOL v8 = v7;

  BOOL v9 = [(RTLocationManager *)self supported] && [(RTLocationManager *)self enabled] && v8;
  [(RTLocationManager *)self setPersistingLocations:v9];
}

- (void)setPersistingLocations:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_persistingLocations != a3)
  {
    self->_persistingLocations = a3;
    unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      if (self->_persistingLocations) {
        BOOL v6 = @"YES";
      }
      else {
        BOOL v6 = @"NO";
      }
      int v7 = 138412546;
      BOOL v8 = locationBundlePathShortname;
      __int16 v9 = 2112;
      int v10 = v6;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, persist locations, %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

uint64_t __45__RTLocationManager__storeLocations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeLocations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __45__RTLocationManager__storeLocations_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  BOOL v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  int v7 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, %@", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    __int16 v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F5CFE8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    BOOL v15 = v6;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    __int16 v12 = [v9 errorWithDomain:v10 code:0 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);
  }
}

- (BOOL)_considerInUse
{
  if ([(RTLocationManager *)self monitoringLocations]) {
    return 1;
  }

  return [(RTLocationManager *)self monitoringRhythmicLocations];
}

uint64_t __67__RTLocationManager_locationManager_didUpdateLocations_completion___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 timestamp];
  BOOL v6 = [v4 timestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    int v11 = 138412546;
    __int16 v12 = locationBundlePathShortname;
    __int16 v13 = 2048;
    uint64_t v14 = a4;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, didChangeAuthorizationStatus, %ld", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = [(RTLocationManager *)self authorizationManager];
  [(id)v8 updateRoutineEnabled:a4 == 3];

  __int16 v9 = [(RTLocationManager *)self effectiveLocationBundlePath];
  LOBYTE(v8) = [v9 isEqualToString:@"/System/Library/LocationBundles/Routine.bundle"];

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = [(RTLocationManager *)self locationManager];
    -[RTLocationManager setEnabled:](self, "setEnabled:", [v10 authorizationStatus] == 3);

    [(RTLocationManager *)self shouldLeechLocations];
    [(RTLocationManager *)self shouldPersistLocations];
  }
}

- (void)fetchLastLocationWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__RTLocationManager_fetchLastLocationWithHandler___block_invoke;
    block[3] = &unk_1E6B921E0;
    void block[4] = self;
    SEL v9 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __50__RTLocationManager_fetchLastLocationWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) enabled])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) lastLocation];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412546;
      __int16 v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, doesn't have location authorization", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F5CFE8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    SEL v9 = [NSString stringWithFormat:@"no authorization"];
    uint64_t v14 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    int v11 = [v7 errorWithDomain:v8 code:2 userInfo:v10];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v11);
  }
}

void __50__RTLocationManager__reviewActiveLocationRequests__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onActiveLocationRequestTimerExpiry];
}

- (void)fetchCachedLocationWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(id)objc_opt_class() defaultLocationRequestOptions];
    [(RTLocationManager *)self fetchCachedLocationWithOptions:v5 handler:v4];
  }
}

- (void)_fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[RTLocationManager _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
      __int16 v35 = 1024;
      int v36 = 1111;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
    }

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "-[RTLocationManager _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
    __int16 v35 = 1024;
    int v36 = 1110;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (!v14) {
    goto LABEL_9;
  }
LABEL_3:
  if (v15)
  {
LABEL_4:
    if ([(RTLocationManager *)self enabled])
    {
      __int16 v16 = [(RTLocationManager *)self locationStore];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __89__RTLocationManager__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
      v24[3] = &unk_1E6B968F8;
      SEL v28 = a2;
      v24[4] = self;
      id v25 = v13;
      id v26 = v14;
      double v29 = a5;
      unint64_t v30 = a6;
      id v27 = v15;
      [v16 fetchStoredLocationsCountFromDate:v25 toDate:v26 uncertainty:a6 limit:v24 handler:a5];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5CFE8];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      __int16 v32 = @"Service has been disabled by user.";
      int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      uint64_t v23 = [v20 errorWithDomain:v21 code:2 userInfo:v22];
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v23);
    }
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "-[RTLocationManager _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
    __int16 v35 = 1024;
    int v36 = 1112;
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

LABEL_16:
}

void __89__RTLocationManager__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56);
    SEL v9 = [*(id *)(a1 + 40) stringFromDate];
    uint64_t v10 = [*(id *)(a1 + 48) stringFromDate];
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 80);
    int v13 = 138413826;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    int v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v12;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, fetched %ld locations from date, %@, to date, %@, uncertainty, %.2f, limit, %lu", (uint8_t *)&v13, 0x48u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int16 v15 = [(RTNotifier *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__RTLocationManager_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
  v19[3] = &unk_1E6B91418;
  v19[4] = self;
  id v20 = v12;
  double v23 = a5;
  unint64_t v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, v19);
}

uint64_t __88__RTLocationManager_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsCountFromDate:*(void *)(a1 + 40) toDate:*(void *)(a1 + 48) uncertainty:*(void *)(a1 + 72) limit:*(void *)(a1 + 56) handler:*(double *)(a1 + 64)];
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[RTLocationManager _fetchStoredLocationsWithOptions:handler:]";
      __int16 v12 = 1024;
      int v13 = 1164;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  SEL v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CF38]) initWithEnumerationOptions:v6];
  [(RTLocationManager *)self _fetchStoredLocationsWithContext:v9 handler:v7];
}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTLocationManager_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __61__RTLocationManager_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if ([(RTLocationManager *)self enabled])
    {
      if (self->_locationStore)
      {
        id v9 = [v7 options];
        char v10 = [v9 downsampleRequired];

        if (v10)
        {
          uint64_t v11 = [v7 options];
          int v12 = [v11 smoothingRequired];

          if (v12) {
            uint64_t v37 = objc_opt_new();
          }
          else {
            uint64_t v37 = 0;
          }
          id v21 = (void *)[v7 copy];
          id v22 = [v21 options];
          [v22 setBatchSize:0];

          int v36 = [MEMORY[0x1E4F5CE08] createErrorFunctionWithPerpendicularDistance];
          double v23 = [v7 options];
          [v23 smoothingErrorThreshold];
          double v25 = v24;

          if (v25 <= *MEMORY[0x1E4F5D020]) {
            double v25 = 5.0;
          }
          uint64_t v26 = [v7 options];
          uint64_t v27 = [v26 batchSize];

          SEL v28 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            double v29 = NSStringFromSelector(a2);
            locationBundlePathShortname = self->_locationBundlePathShortname;
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v29;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = locationBundlePathShortname;
            *(_WORD *)&buf[22] = 2112;
            id v54 = (uint64_t (*)(uint64_t, uint64_t))v7;
            LOWORD(v55) = 2048;
            *(double *)((char *)&v55 + 2) = v25;
            _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, context, %@, smoothing error threshold, %f", buf, 0x2Au);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          id v54 = __Block_byref_object_copy__72;
          *(void *)&long long v55 = __Block_byref_object_dispose__72;
          *((void *)&v55 + 1) = objc_opt_new();
          v48[0] = 0;
          v48[1] = v48;
          v48[2] = 0x2020000000;
          v48[3] = 0;
          locationStore = self->_locationStore;
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke_186;
          v38[3] = &unk_1E6B96ED8;
          SEL v45 = a2;
          v38[4] = self;
          id v41 = v8;
          v43 = v48;
          id v44 = buf;
          uint64_t v46 = v27;
          id v32 = v36;
          id v42 = v32;
          double v47 = v25;
          id v33 = v37;
          id v39 = v33;
          id v40 = v7;
          [(RTLocationStoreProtocol *)locationStore enumerateStoredLocationsWithContext:v21 usingBlock:v38];

          _Block_object_dispose(v48, 8);
          _Block_object_dispose(buf, 8);
        }
        else
        {
          id v20 = self->_locationStore;
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke;
          v49[3] = &unk_1E6B91A68;
          SEL v52 = a2;
          v49[4] = self;
          id v50 = v7;
          id v51 = v8;
          [(RTLocationStoreProtocol *)v20 fetchStoredLocationsWithContext:v50 handler:v49];
        }
      }
      else
      {
        __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          __int16 v35 = self->_locationBundlePathShortname;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v35;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, LocationStore was nil.", buf, 0xCu);
        }

        (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
      }
    }
    else
    {
      uint64_t v56 = *MEMORY[0x1E4F28568];
      id v57 = @"Service has been disabled by user.";
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:v17];
      (*((void (**)(id, void, void *))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], v18);
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTLocationManager _fetchStoredLocationsWithContext:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1184;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v58 = *MEMORY[0x1E4F28568];
    v59[0] = @"A completion handler is a required parameter.";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
    __int16 v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v14];
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = self->_locationBundlePathShortname;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, A completion handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v19 = [v5 count];
    uint64_t v20 = *(void *)(a1 + 40);
    id v9 = [v5 firstObject];
    char v10 = [v9 timestamp];
    uint64_t v11 = [v10 stringFromDate];
    int v12 = [v5 lastObject];
    [v12 timestamp];
    id v13 = v22 = v6;
    uint64_t v14 = [v13 stringFromDate];
    *(_DWORD *)buf = 138413570;
    double v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    __int16 v27 = 2048;
    uint64_t v28 = v19;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    uint64_t v34 = v14;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %ld locations, context, %@, first location date, %@, last location date, %@", buf, 0x3Eu);

    id v6 = v22;
  }

  __int16 v15 = [*(id *)(a1 + 40) options];
  int v16 = [v15 smoothingRequired];

  if (v16)
  {
    id v17 = objc_opt_new();
    uint64_t v18 = [v17 smoothLocations:v5];

    id v5 = (id)v18;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __62__RTLocationManager__fetchStoredLocationsWithContext_handler___block_invoke_186(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
    v48 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v11 = [v7 count];
    [v7 firstObject];
    int v12 = v55 = v8;
    id v13 = [v12 timestamp];
    [v13 stringFromDate];
    uint64_t v14 = v50 = a4;
    [v7 lastObject];
    __int16 v15 = v52 = v7;
    int v16 = [v15 timestamp];
    id v17 = [v16 stringFromDate];
    *(_DWORD *)buf = 138413314;
    id v57 = v10;
    __int16 v58 = 2112;
    id v59 = v48;
    __int16 v60 = 2048;
    uint64_t v61 = v11;
    __int16 v62 = 2112;
    uint64_t v63 = v14;
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v17;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, fetched %ld locations, first location date, %@, last location date, %@, decimated, YES", buf, 0x34u);

    id v7 = v52;
    id v8 = v55;

    a4 = v50;
  }

  if (v8)
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      SEL v45 = *(void **)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412546;
      id v57 = v45;
      __int16 v58 = 2112;
      id v59 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@, received error while fetching stored locations, %@, breaking out.", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    *a4 = 1;
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v19 = *(void *)(a1 + 96);
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if ([v7 count] && (uint64_t v21 = v19 / v20) != 0)
    {
      uint64_t v22 = [v7 count];
      double v23 = [MEMORY[0x1E4F5CE08] filterConvergingLocations:v7];

      uint64_t v24 = [v23 count];
      __int16 v25 = *(void **)(a1 + 40);
      if (v25)
      {
        id v7 = [v25 smoothLocations:v23];
      }
      else
      {
        id v7 = v23;
      }
      int v36 = [MEMORY[0x1E4F5CE08] downsampleLocations:v7 errorFunction:*(void *)(a1 + 64) errorThreshold:v21 outputSize:*(double *)(a1 + 104)];
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObjectsFromArray:v36];
      uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        uint64_t v38 = NSStringFromSelector(*(SEL *)(a1 + 88));
        double v47 = *(void **)(*(void *)(a1 + 32) + 56);
        v49 = (void *)v38;
        uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        id v51 = *(void **)(a1 + 96);
        id v54 = [*(id *)(a1 + 48) options];
        int v40 = [v54 smoothingRequired];
        id v41 = @"NO";
        if (v40) {
          id v41 = @"YES";
        }
        uint64_t v42 = [v7 count:v41];
        uint64_t v43 = [v36 count];
        uint64_t v44 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
        *(_DWORD *)buf = 138414850;
        id v57 = v49;
        __int16 v58 = 2112;
        id v59 = v47;
        __int16 v60 = 2048;
        uint64_t v61 = v39;
        id v8 = 0;
        __int16 v62 = 2048;
        uint64_t v63 = v51;
        __int16 v64 = 2048;
        uint64_t v65 = v21;
        __int16 v66 = 2048;
        uint64_t v67 = v22;
        __int16 v68 = 2048;
        uint64_t v69 = v24;
        __int16 v70 = 2112;
        uint64_t v71 = v46;
        __int16 v72 = 2048;
        uint64_t v73 = v42;
        __int16 v74 = 2048;
        uint64_t v75 = v43;
        __int16 v76 = 2048;
        uint64_t v77 = v44;
        _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, %@, itr, %lu, target output size, %lu, target sample size for itr, %lu, fetched location count, %lu, pre-filtered location count, %lu, location smoothed, %@, before downssampling location count, %lu, after downsampling count, %lu, cached location count, %lu", buf, 0x70u);
      }
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F5CE08] downsampleLocations:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) errorFunction:*(void *)(a1 + 64) errorThreshold:*(void *)(a1 + 96) outputSize:*(double *)(a1 + 104)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      __int16 v27 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 88));
        uint64_t v28 = v53 = v7;
        __int16 v29 = a4;
        uint64_t v30 = *(void **)(*(void *)(a1 + 32) + 56);
        uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        id v32 = *(void **)(a1 + 96);
        uint64_t v33 = [v53 count];
        uint64_t v34 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
        uint64_t v35 = [v26 count];
        *(_DWORD *)buf = 138413826;
        id v57 = v28;
        __int16 v58 = 2112;
        id v59 = v30;
        a4 = v29;
        __int16 v60 = 2048;
        uint64_t v61 = v31;
        __int16 v62 = 2048;
        uint64_t v63 = v32;
        __int16 v64 = 2048;
        uint64_t v65 = v33;
        __int16 v66 = 2048;
        uint64_t v67 = v34;
        __int16 v68 = 2048;
        uint64_t v69 = v35;
        _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, %@, no more stored locations to enumerate, breaking out, itr, %lu, target output size, %lu, fetched location count, %lu, cached location count, %lu, output location count, %lu", buf, 0x48u);

        id v7 = v53;
        id v8 = 0;
      }

      *a4 = 1;
    }
  }
}

- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTLocationManager_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __61__RTLocationManager_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    if (v10)
    {
LABEL_3:
      id v12 = [(RTNotifier *)self queue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__RTLocationManager_fetchEstimatedLocationAtDate_options_handler___block_invoke;
      v19[3] = &unk_1E6B91490;
      id v20 = v9;
      uint64_t v21 = self;
      id v22 = v8;
      id v23 = v11;
      dispatch_async(v12, v19);

      id v13 = v20;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "-[RTLocationManager fetchEstimatedLocationAtDate:options:handler:]";
      __int16 v26 = 1024;
      LODWORD(v27) = 1336;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    if (v11) {
      goto LABEL_3;
    }
  }
  __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[RTLocationManager fetchEstimatedLocationAtDate:options:handler:]";
    __int16 v26 = 1024;
    LODWORD(v27) = 1337;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  uint64_t v28 = *MEMORY[0x1E4F28568];
  v29[0] = @"A completion handler is a required parameter.";
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  int v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v13];
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138412546;
    __int16 v25 = (const char *)locationBundlePathShortname;
    __int16 v26 = 2112;
    __int16 v27 = v16;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@, A completion handler is a required parameter, %@", buf, 0x16u);
  }

LABEL_12:
}

void __66__RTLocationManager_fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  if (!*(void *)(a1 + 32))
  {
    id v5 = v2;
    id v4 = objc_alloc_init(MEMORY[0x1E4F5CDD0]);

    id v3 = v4;
  }
  id v6 = v3;
  [*(id *)(a1 + 40) _fetchEstimatedLocationAtDate:*(void *)(a1 + 48) options:v3 handler:*(void *)(a1 + 56)];
}

- (void)_fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  v113[1] = *MEMORY[0x1E4F143B8];
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if (!v8)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTLocationManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1362;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTLocationManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1363;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v10)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTLocationManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1364;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  if ([(RTLocationManager *)self enabled])
  {
    if (self->_locationStore)
    {
      if ([(RTLocationManager *)self locationStoreAvailable])
      {
        uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          __int16 v15 = NSStringFromSelector(a2);
          locationBundlePathShortname = self->_locationBundlePathShortname;
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = locationBundlePathShortname;
          *(_WORD *)&buf[22] = 2112;
          v105 = v8;
          LOWORD(v106) = 2112;
          *(void *)((char *)&v106 + 2) = v9;
          _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, date, %@, options, %@", buf, 0x2Au);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v105 = __Block_byref_object_copy__72;
        *(void *)&long long v106 = __Block_byref_object_dispose__72;
        *((void *)&v106 + 1) = 0;
        uint64_t v88 = 0;
        v89 = &v88;
        uint64_t v90 = 0x3032000000;
        v91 = __Block_byref_object_copy__72;
        v92 = __Block_byref_object_dispose__72;
        id v93 = 0;
        dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
        [v9 timeInterval];
        if (v18 >= 0.0) {
          double v19 = v18;
        }
        else {
          double v19 = 30.0;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v21 = [v8 dateByAddingTimeInterval:-v19];
        id v22 = [v8 dateByAddingTimeInterval:v19];
        __int16 v76 = (void *)[v20 initWithStartDate:v21 endDate:v22];

        id v23 = objc_alloc(MEMORY[0x1E4F5CF40]);
        uint64_t v75 = (void *)[v23 initWithDateInterval:v76 horizontalAccuracy:100 batchSize:0 boundingBoxLocation:*MEMORY[0x1E4F1E6E8]];
        __int16 v74 = (void *)[objc_alloc(MEMORY[0x1E4F5CF38]) initWithEnumerationOptions:v75];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke;
        v83[3] = &unk_1E6B94018;
        v85 = &v88;
        uint64_t v86 = buf;
        SEL v87 = a2;
        v83[4] = self;
        uint64_t v24 = v17;
        v84 = v24;
        [(RTLocationManager *)self _fetchStoredLocationsWithContext:v74 limit:50 referenceDate:v8 handler:v83];
        __int16 v25 = (id *)(*(void *)&buf[8] + 40);
        id obj = *(id *)(*(void *)&buf[8] + 40);
        dsema = v24;
        uint64_t v73 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v26 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(dsema, v26)) {
          goto LABEL_33;
        }
        __int16 v72 = [MEMORY[0x1E4F1C9C8] now:obj];
        [v72 timeIntervalSinceDate:v73];
        double v28 = v27;
        __int16 v29 = objc_opt_new();
        uint64_t v30 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_611];
        uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v32 = [v31 filteredArrayUsingPredicate:v30];
        uint64_t v33 = [v32 firstObject];

        [v29 submitToCoreAnalytics:v33 type:1 duration:v28];
        uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v94 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v94, 2u);
        }

        uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
        v113[0] = *MEMORY[0x1E4F28568];
        *(void *)v97 = @"semaphore wait timeout";
        int v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v113 count:1];
        uint64_t v37 = [v35 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v36];

        if (v37)
        {
          id v38 = v37;

          objc_storeStrong(v25, v38);
          uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            __int16 v68 = NSStringFromSelector(a2);
            uint64_t v69 = self->_locationBundlePathShortname;
            __int16 v70 = *(void **)(*(void *)&buf[8] + 40);
            *(_DWORD *)v97 = 138412802;
            *(void *)&v97[4] = v68;
            __int16 v98 = 2112;
            v99 = v69;
            __int16 v100 = 2112;
            v101 = v70;
            _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, %@, error, %@", v97, 0x20u);
          }
        }
        else
        {
LABEL_33:

          objc_storeStrong(v25, obj);
          if ([(id)v89[5] count])
          {
            double v47 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v89[5] count]];
            v48 = (void *)v89[5];
            v79[0] = MEMORY[0x1E4F143A8];
            v79[1] = 3221225472;
            v79[2] = __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_197;
            v79[3] = &unk_1E6B96F00;
            id v49 = v47;
            long long v81 = self;
            SEL v82 = a2;
            id v80 = v49;
            [v48 enumerateObjectsUsingBlock:v79];
            id v50 = [MEMORY[0x1E4F1CA60] dictionary];
            [v9 averageSpeed];
            if (v51 >= 0.0)
            {
              id v52 = NSNumber;
              [v9 averageSpeed];
              id v53 = [v52 numberWithDouble:];
              [v50 setObject:v53 forKey:@"kRTLocationSmootherAverageMovingSpeed"];
            }
            if (objc_msgSend(v9, "enableFallbackModel", obj)) {
              [v50 setObject:MEMORY[0x1E4F1CC38] forKey:@"kRTLocationSmootherEnableFallbackModel"];
            }
            id v54 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              id v55 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v56 = self->_locationBundlePathShortname;
              id v57 = [v8 stringFromDate];
              *(_DWORD *)v97 = 138413058;
              *(void *)&v97[4] = v55;
              __int16 v98 = 2112;
              v99 = v56;
              __int16 v100 = 2112;
              v101 = v57;
              __int16 v102 = 2112;
              v103 = v50;
              _os_log_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_INFO, "%@, %@, date, %@, parameters, %@", v97, 0x2Au);
            }
            __int16 v58 = [(RTLocationManager *)self locationSmoother];
            [v8 timeIntervalSinceReferenceDate];
            id v59 = [v58 estimateLocationWithLocations:v49 timestamp:v50];

            __int16 v60 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              id v61 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v62 = self->_locationBundlePathShortname;
              uint64_t v63 = [v8 stringFromDate];
              *(_DWORD *)v97 = 138413058;
              *(void *)&v97[4] = v61;
              __int16 v98 = 2112;
              v99 = v62;
              __int16 v100 = 2112;
              v101 = v59;
              __int16 v102 = 2112;
              v103 = v63;
              _os_log_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_INFO, "%@, %@, estimated location, %@, on date, %@", v97, 0x2Au);
            }
            if (v59 && ([v59 horizontalAccuracy], v64 > 0.0))
            {
              v10[2](v10, v59, 0);
            }
            else
            {
              uint64_t v95 = *MEMORY[0x1E4F28568];
              v96 = @"Failed to estimate a location.";
              uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
              __int16 v66 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:6 userInfo:v65];
              ((void (**)(id, void *, void *))v10)[2](v10, 0, v66);
            }
            goto LABEL_48;
          }
        }
        v10[2](v10, 0, *(void *)(*(void *)&buf[8] + 40));
LABEL_48:

        _Block_object_dispose(&v88, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_49;
      }
      uint64_t v107 = *MEMORY[0x1E4F28568];
      v108 = @"resource temporarily unavailable.";
      SEL v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      uint64_t v46 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v45];
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v46);
    }
    else
    {
      uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v67 = self->_locationBundlePathShortname;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v67;
        _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "%@, LocationStore was nil.", buf, 0xCu);
      }

      uint64_t v109 = *MEMORY[0x1E4F28568];
      v110 = @"Service error: location store is nil.";
      uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:v43];
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v44);
    }
  }
  else
  {
    uint64_t v111 = *MEMORY[0x1E4F28568];
    v112 = @"Service has been disabled by user.";
    int v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
    id v41 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:v40];
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v41);
  }
LABEL_49:
}

void __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v11 = [v6 count];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, stored locations, %ld, error, %@", (uint8_t *)&v13, 0x2Au);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __67__RTLocationManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_197(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 horizontalAccuracy];
  if (v6 <= 30.0)
  {
    int v8 = 1;
  }
  else
  {
    [v5 horizontalAccuracy];
    if (v7 <= 165.0) {
      int v8 = 4;
    }
    else {
      int v8 = 0;
    }
  }
  memset(v15, 0, 28);
  long long v14 = 0u;
  if (v5) {
    [v5 clientLocation];
  }
  LODWORD(v14) = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  long long v21 = v14;
  long long v22 = 0u;
  v23[0] = v15[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v15 + 12);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  memset(buf, 0, sizeof(buf));
  uint64_t v10 = (void *)[v9 initWithClientLocation:buf];
  [*(id *)(a1 + 32) addObject:v10];
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 56);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v10;
    LOWORD(v17) = 2048;
    *(void *)((char *)&v17 + 2) = a3;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, input location, %@, idx, %ld", buf, 0x2Au);
  }
}

- (void)_fetchStoredLocationsWithContext:(id)a3 limit:(unint64_t)a4 referenceDate:(id)a5 handler:(id)a6
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v57 = a5;
  id v49 = (void (**)(id, id, void))a6;
  __int16 v58 = v8;
  id v9 = [v8 options];
  uint64_t v50 = [v9 batchSize];

  uint64_t v56 = objc_opt_new();
  id v55 = objc_opt_new();
  uint64_t v52 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v87 = 0;
  uint64_t v78 = 0;
  long long v79 = (id *)&v78;
  uint64_t v80 = 0x3032000000;
  long long v81 = __Block_byref_object_copy__72;
  SEL v82 = __Block_byref_object_dispose__72;
  id v83 = 0;
  uint64_t v53 = *MEMORY[0x1E4F5CFE8];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    uint64_t v74 = 0;
    uint64_t v75 = &v74;
    uint64_t v76 = 0x2020000000;
    char v77 = 0;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __82__RTLocationManager__fetchStoredLocationsWithContext_limit_referenceDate_handler___block_invoke;
    v65[3] = &unk_1E6B96F28;
    __int16 v70 = &v78;
    uint64_t v71 = &v84;
    id v59 = v57;
    id v66 = v59;
    id v62 = v56;
    id v67 = v62;
    id v11 = v55;
    __int16 v72 = &v74;
    unint64_t v73 = a4;
    id v61 = v11;
    id v68 = v11;
    uint64_t v12 = v10;
    uint64_t v69 = v12;
    uint64_t v13 = (void *)MEMORY[0x1E016DB00](v65);
    id v14 = objc_alloc(MEMORY[0x1E4F5CF38]);
    __int16 v15 = [v58 options];
    uint64_t v16 = (void *)[v14 initWithEnumerationOptions:v15 offset:v85[3]];

    [(RTLocationManager *)self _fetchStoredLocationsWithContext:v16 handler:v13];
    long long v17 = v12;
    long long v18 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v19 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v17, v19)) {
      goto LABEL_7;
    }
    long long v20 = [MEMORY[0x1E4F1C9C8] now];
    [v20 timeIntervalSinceDate:v18];
    double v22 = v21;
    id v23 = objc_opt_new();
    uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_611];
    __int16 v25 = [MEMORY[0x1E4F29060] callStackSymbols];
    dispatch_time_t v26 = [v25 filteredArrayUsingPredicate:v24];
    double v27 = [v26 firstObject];

    [v23 submitToCoreAnalytics:v27 type:1 duration:v22];
    double v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    __int16 v29 = (void *)MEMORY[0x1E4F28C58];
    v105[0] = v54;
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v105 count:1];
    uint64_t v31 = [v29 errorWithDomain:v53 code:15 userInfo:v30];

    if (v31)
    {
      id v32 = v31;

      char v33 = 0;
    }
    else
    {
LABEL_7:
      id v32 = 0;
      char v33 = 1;
    }

    id v34 = v32;
    if ((v33 & 1) == 0) {
      objc_storeStrong(v79 + 5, v32);
    }
    if (v79[5])
    {
      uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = NSStringFromSelector(a2);
        locationBundlePathShortname = self->_locationBundlePathShortname;
        id v48 = v79[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v46;
        __int16 v89 = 2112;
        uint64_t v90 = locationBundlePathShortname;
        __int16 v91 = 2112;
        id v92 = v48;
        _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%@, %@, stop fetching due to error, %@", buf, 0x20u);
      }
LABEL_13:

      char v36 = 0;
      goto LABEL_18;
    }
    uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = self->_locationBundlePathShortname;
      id v40 = [v59 stringFromDate];
      uint64_t v41 = v85[3];
      uint64_t v42 = [v62 count];
      uint64_t v43 = [v61 count];
      *(_DWORD *)buf = 138414338;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v89 = 2112;
      uint64_t v90 = v39;
      __int16 v91 = 2112;
      id v92 = v40;
      __int16 v93 = 2048;
      uint64_t v94 = v50;
      __int16 v95 = 2048;
      unint64_t v96 = a4;
      __int16 v97 = 2048;
      uint64_t v98 = v41;
      __int16 v99 = 2048;
      uint64_t v100 = v42;
      __int16 v101 = 2048;
      uint64_t v102 = v43;
      __int16 v103 = 2048;
      uint64_t v104 = ++v52;
      _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, %@, date, %@, batchSize, %lu, limit, %lu, offset, %lu, locs.before.date, %lu, locs.after.date, %lu, idx, %lu", buf, 0x5Cu);
    }
    if (!*((unsigned char *)v75 + 24))
    {
      uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v44 = NSStringFromSelector(a2);
        SEL v45 = self->_locationBundlePathShortname;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v44;
        __int16 v89 = 2112;
        uint64_t v90 = v45;
        _os_log_debug_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEBUG, "%@, %@, no more locations to fetch.", buf, 0x16u);
      }
      goto LABEL_13;
    }
    char v36 = 1;
LABEL_18:

    _Block_object_dispose(&v74, 8);
  }
  while ((v36 & 1) != 0);
  [v62 addObjectsFromArray:v61];
  ((void (**)(id, id, id))v49)[2](v49, v62, v79[5]);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
}

void __82__RTLocationManager__fetchStoredLocationsWithContext_limit_referenceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  uint64_t v7 = [v5 count];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v7;
  if (v7)
  {
    id v19 = v6;
    id v21 = v5;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v14 = [v13 timestamp:v19];
          int v15 = [v14 isBeforeDate:*(void *)(a1 + 32)];

          if (v15) {
            uint64_t v16 = 40;
          }
          else {
            uint64_t v16 = 48;
          }
          [*(id *)(a1 + v16) addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    if ((unint64_t)[*(id *)(a1 + 40) count] > *(void *)(a1 + 88)) {
      [*(id *)(a1 + 40) removeObjectsInRange:0, *(id *)(a1 + 40) count] - *(void *)(a1 + 88)];
    }
    unint64_t v17 = [[*(id *)(a1 + 48) count:v19];
    unint64_t v18 = *(void *)(a1 + 88);
    id v6 = v20;
    if (v17 > v18) {
      [*(id *)(a1 + 48) removeObjectsInRange:v18 count:[*(id *)(a1 + 48) count] - *(void *)(a1 + 88)];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 48) count] != *(void *)(a1 + 88);
    id v5 = v21;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)onActiveLocationRequestTimerExpiry
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    id v5 = [(RTLocationManager *)self currentLocationRequests];
    *(_DWORD *)buf = 136315650;
    id v14 = "-[RTLocationManager onActiveLocationRequestTimerExpiry]";
    __int16 v15 = 2112;
    uint64_t v16 = locationBundlePathShortname;
    __int16 v17 = 1024;
    int v18 = [v5 count];
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, %@, #location requests, %d", buf, 0x1Cu);
  }
  id v6 = [(RTLocationManager *)self activeLocationRequestTimer];

  if (v6)
  {
    uint64_t v7 = [(RTLocationManager *)self activeLocationRequestTimer];
    [v7 invalidate];

    [(RTLocationManager *)self setActiveLocationRequestTimer:0];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v9 = [(RTLocationManager *)self currentLocationRequests];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__RTLocationManager_onActiveLocationRequestTimerExpiry__block_invoke;
  v11[3] = &unk_1E6B96F50;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v11];

  [(RTLocationManager *)self _handleExpiredLocationRequestsWithIndexes:v10];
  [(RTLocationManager *)self _reviewActiveLocationRequests];
}

void __55__RTLocationManager_onActiveLocationRequestTimerExpiry__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 expiryDate];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    id v8 = *(void **)(a1 + 32);
    [v8 addIndex:a3];
  }
}

- (void)_handleExpiredLocationRequestsWithIndexes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 136315650;
    id v10 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]";
    __int16 v11 = 2112;
    id v12 = locationBundlePathShortname;
    __int16 v13 = 1024;
    int v14 = [v4 count];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, %@, #expired requests, %d", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke;
  v8[3] = &unk_1E6B96F78;
  v8[4] = self;
  [v4 enumerateIndexesUsingBlock:v8];
  double v7 = [(RTLocationManager *)self currentLocationRequests];
  [v7 removeObjectsAtIndexes:v4];
}

void __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) currentLocationRequests];
  id v5 = [v4 objectAtIndex:a2];

  double v6 = [v5 options];
  int v7 = [v6 fallback];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
    id v10 = [v5 options];
    [v10 fallbackMaxAge];
    id v12 = [v9 dateWithTimeIntervalSinceNow:-v11];
    __int16 v13 = [MEMORY[0x1E4F1C9C8] now];
    int v14 = (void (**)(void, void, void))[v8 initWithStartDate:v12 endDate:v13];

    id v15 = objc_alloc(MEMORY[0x1E4F5CF40]);
    uint64_t v16 = [v5 options];
    [v16 fallbackHorizontalAccuracy];
    __int16 v17 = [v15 initWithDateInterval:v14 horizontalAccuracy:1 batchSize:0 ascending:1];

    int v18 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_2;
    v27[3] = &unk_1E6B94E10;
    v27[4] = v18;
    id v28 = v5;
    [v18 _fetchStoredLocationsWithOptions:v17 handler:v27];
  }
  else
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 56);
      id v21 = [v5 startDate];
      [v21 timeIntervalSinceNow];
      *(_DWORD *)buf = 136315906;
      id v32 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]_block_invoke";
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 2112;
      char v36 = v5;
      __int16 v37 = 2048;
      uint64_t v38 = v22;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, nil, delta, %.2f", buf, 0x2Au);
    }
    int v14 = [v5 handler];
    long long v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F5CFE8];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    __int16 v17 = [NSString stringWithFormat:@"could not get current location"];
    uint64_t v30 = v17;
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    dispatch_time_t v26 = [v23 errorWithDomain:v24 code:6 userInfo:v25];
    ((void (**)(void, void, void *))v14)[2](v14, 0, v26);
  }
}

void __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_3;
  block[3] = &unk_1E6B92F80;
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __63__RTLocationManager__handleExpiredLocationRequestsWithIndexes___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = [*(id *)(a1 + 32) firstObject];
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = *(void **)(a1 + 48);
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 56);
      double v6 = [v2 timestamp];
      id v7 = [*(id *)(a1 + 48) startDate];
      [v6 timeIntervalSinceDate:v7];
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]_block_invoke_3";
      __int16 v23 = 2112;
      uint64_t v24 = v5;
      __int16 v25 = 2112;
      dispatch_time_t v26 = v4;
      __int16 v27 = 2112;
      id v28 = v2;
      __int16 v29 = 2048;
      uint64_t v30 = v8;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, %@, delta, %.2f", buf, 0x34u);
    }
    id v9 = [*(id *)(a1 + 48) handler];
    v9[2](v9, v2, 0);
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = *(void **)(a1 + 48);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 56);
      __int16 v13 = [v11 startDate];
      [v13 timeIntervalSinceNow];
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = "-[RTLocationManager _handleExpiredLocationRequestsWithIndexes:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      dispatch_time_t v26 = v11;
      __int16 v27 = 2048;
      id v28 = v14;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, %@, fulfilled request, %@, location, nil, delta, %.2f", buf, 0x2Au);
    }
    id v2 = [*(id *)(a1 + 48) handler];
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    [NSString stringWithFormat:@"could not get any locations after fallback", *MEMORY[0x1E4F28568]];
    id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v20 = v9;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    int v18 = [v15 errorWithDomain:v16 code:6 userInfo:v17];
    ((void (**)(void, void, void *))v2)[2](v2, 0, v18);
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v5] & 1) == 0)
  {
    double v6 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      int v16 = 138412546;
      __int16 v17 = locationBundlePathShortname;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, unsupported notification, %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v7 = +[RTNotification notificationName];
  int v8 = [v5 isEqualToString:v7];

  if (v8) {
    [(RTLocationManager *)self shouldLeechLocations];
  }
  id v9 = +[RTNotification notificationName];
  if ([v5 isEqualToString:v9])
  {
  }
  else
  {
    uint64_t v10 = +[RTNotification notificationName];
    int v11 = [v5 isEqualToString:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  [(RTLocationManager *)self shouldMonitorLocations];
LABEL_11:
  uint64_t v12 = +[RTNotification notificationName];
  if ([v5 isEqualToString:v12])
  {

LABEL_14:
    [(RTLocationManager *)self shouldMonitorRhythmicLocations];
    goto LABEL_15;
  }
  __int16 v13 = +[RTNotification notificationName];
  int v14 = [v5 isEqualToString:v13];

  if (v14) {
    goto LABEL_14;
  }
LABEL_15:
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v5] & 1) == 0)
  {
    double v6 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      int v16 = 138412546;
      __int16 v17 = locationBundlePathShortname;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, unsupported notification, %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v7 = +[RTNotification notificationName];
  int v8 = [v5 isEqualToString:v7];

  if (v8) {
    [(RTLocationManager *)self shouldLeechLocations];
  }
  id v9 = +[RTNotification notificationName];
  if ([v5 isEqualToString:v9])
  {
  }
  else
  {
    uint64_t v10 = +[RTNotification notificationName];
    int v11 = [v5 isEqualToString:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  [(RTLocationManager *)self shouldMonitorLocations];
LABEL_11:
  uint64_t v12 = +[RTNotification notificationName];
  if ([v5 isEqualToString:v12])
  {

LABEL_14:
    [(RTLocationManager *)self shouldMonitorRhythmicLocations];
    goto LABEL_15;
  }
  __int16 v13 = +[RTNotification notificationName];
  int v14 = [v5 isEqualToString:v13];

  if (v14) {
    goto LABEL_14;
  }
LABEL_15:
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = +[RTNotification notificationName];
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    double v6 = +[RTNotification notificationName];
    if ([v3 isEqualToString:v6])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = +[RTNotification notificationName];
      if ([v3 isEqualToString:v7])
      {
        char v5 = 1;
      }
      else
      {
        int v8 = +[RTNotification notificationName];
        if ([v3 isEqualToString:v8])
        {
          char v5 = 1;
        }
        else
        {
          id v9 = +[RTNotification notificationName];
          if ([v3 isEqualToString:v9])
          {
            char v5 = 1;
          }
          else
          {
            uint64_t v10 = +[RTNotification notificationName];
            char v5 = [v3 isEqualToString:v10];
          }
        }
      }
    }
  }
  return v5;
}

- (void)_removeLocationsPredating:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(RTLocationManager *)self locationStoreAvailable])
  {
    id v9 = [(RTLocationManager *)self locationStore];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    _OWORD v15[2] = __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_211;
    v15[3] = &unk_1E6B90C18;
    id v16 = v8;
    [v9 removeLocationsPredating:v7 handler:v15];

    uint64_t v10 = v16;
  }
  else
  {
    int v11 = [(RTLocationManager *)self dispatcher];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__RTLocationManager__removeLocationsPredating_handler___block_invoke;
    v20[3] = &unk_1E6B90660;
    void v20[4] = self;
    id v21 = v7;
    id v22 = v8;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_2;
    v17[3] = &unk_1E6B921E0;
    v17[4] = self;
    SEL v19 = a2;
    id v18 = v22;
    uint64_t v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    int v14 = NSStringFromSelector(a2);
    [v11 enqueueBlock:v20, v17, @"%@-%@", v13, v14 failureBlock description];

    uint64_t v10 = v21;
  }
}

uint64_t __55__RTLocationManager__removeLocationsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLocationsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  char v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  double v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    SEL v19 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, %@", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F5CFE8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v15 = v6;
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v12 = [v9 errorWithDomain:v10 code:0 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);
  }
}

uint64_t __55__RTLocationManager__removeLocationsPredating_handler___block_invoke_211(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLocationStoreAvailable:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_locationStoreAvailable != a3)
  {
    self->_locationStoreAvailable = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      locationBundlePathShortname = self->_locationBundlePathShortname;
      if (self->_locationStoreAvailable) {
        double v6 = @"YES";
      }
      else {
        double v6 = @"NO";
      }
      int v10 = 138412546;
      int v11 = locationBundlePathShortname;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, locationStore available, %@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = [(RTLocationManager *)self dispatcher];
    int v8 = [v7 invocationsPending];

    if (v8)
    {
      id v9 = [(RTLocationManager *)self dispatcher];
      [v9 dispatchPendingInvocations];
    }
  }
}

- (void)onLocationStoreNotification:(id)a3
{
  id v5 = a3;
  double v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__RTLocationManager_onLocationStoreNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  int v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __49__RTLocationManager_onLocationStoreNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 32) availability] == 2;
    double v6 = *(void **)(a1 + 40);
    [v6 setLocationStoreAvailable:v5];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 56);
      int v10 = [*(id *)(a1 + 32) name];
      int v11 = 138413314;
      __int16 v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2080;
      __int16 v18 = "-[RTLocationManager onLocationStoreNotification:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 1839;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, %@, unhandled notification, %@ (in %s:%d)", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (void)onUserSessionChangeNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTLocationManager_onUserSessionChangeNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__RTLocationManager_onUserSessionChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(*(void *)(a1 + 40) + 56);
      int v7 = [*(id *)(a1 + 32) activeUser];
      int v10 = 138412546;
      int v11 = v6;
      __int16 v12 = 1024;
      LODWORD(v13) = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, active user did change: is active user: %d", (uint8_t *)&v10, 0x12u);
    }

    [*(id *)(a1 + 40) shouldPersistLocations];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 32) name];
      int v10 = 138412802;
      int v11 = v9;
      __int16 v12 = 2080;
      __int16 v13 = "-[RTLocationManager onUserSessionChangeNotification:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1853;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  int v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B93630;
  id v15 = v9;
  uint64_t v16 = self;
  int64_t v18 = a3;
  SEL v19 = a2;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    id v3 = v2;
    int v4 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v7[3] = &unk_1E6B919C8;
    uint64_t v10 = *(void *)(a1 + 64);
    void v7[4] = v4;
    id v8 = v2;
    id v9 = *(id *)(a1 + 48);
    id v5 = v3;
    [v4 _removeLocationsPredating:v5 handler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

void __65__RTLocationManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 56);
    int v7 = [*(id *)(a1 + 40) stringFromDate];
    int v8 = 138413058;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, purged locations predating, %@, %@", (uint8_t *)&v8, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)onAuthorizationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RTLocationManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__RTLocationManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    [*(id *)(a1 + 40) setEnabled:[*(id *)(a1 + 32) enabled]];
    id v5 = *(void **)(a1 + 40);
    [v5 shouldPersistLocations];
  }
}

- (void)submitHarvestSample:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__RTLocationManager_submitHarvestSample_handler___block_invoke;
  v11[3] = &unk_1E6B90CE0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __49__RTLocationManager_submitHarvestSample_handler___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 submitSample:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
}

+ (id)errorUsedDelimiter
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"Region monitoring Requires an identifier not containing character with ascii value: %02X", 31];
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v4 = *MEMORY[0x1E4F5CFE8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (void *)[v3 initWithDomain:v4 code:7 userInfo:v5];

  return v6;
}

+ (id)errorDuplicateClientIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = *MEMORY[0x1E4F5CFE8];
  id v7 = [NSString stringWithFormat:@"Given region monitoring client identifier:%@ is already in use.", v4, *MEMORY[0x1E4F28568]];

  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v5 initWithDomain:v6 code:7 userInfo:v8];

  return v9;
}

+ (id)errorUnregisteredClientIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Client Identifier: %@ received is not registered", buf, 0xCu);
  }

  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  id v7 = [NSString stringWithFormat:@"Given region monitoring client identifier:%@ is not registered.", v3];
  id v12 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v9 = (void *)[v5 initWithDomain:v6 code:7 userInfo:v8];

  return v9;
}

+ (id)regionIdentifierDelimiterString
{
  return (id)[NSString stringWithFormat:@"%c", 31];
}

+ (BOOL)isValidIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)objc_opt_class() regionIdentifierDelimiterString];
    LODWORD(v5) = [v3 containsString:v4] ^ 1;
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v7, 2u);
    }

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (id)regionWithModifiedIdentifier:(id)a3 forRegion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    LOWORD(v27) = 0;
    uint64_t v11 = "Invalid parameter not satisfying: identifier";
LABEL_23:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v27, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    LOWORD(v27) = 0;
    uint64_t v11 = "Invalid parameter not satisfying: region";
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = (objc_class *)MEMORY[0x1E4F1E5A8];
      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = (objc_class *)MEMORY[0x1E4F1E698];
      id v13 = v8;
      id v23 = [v22 alloc];
      uint64_t v24 = [v13 vertices];
      id v12 = (void *)[v23 initWithVertices:v24 identifier:v6];

      goto LABEL_13;
    }
    __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      dispatch_time_t v26 = NSStringFromSelector(a2);
      int v27 = 138412546;
      id v28 = v26;
      __int16 v29 = 2112;
      uint64_t v30 = objc_opt_class();
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "%@, received region class of type: %@", (uint8_t *)&v27, 0x16u);
    }
LABEL_9:
    id v12 = 0;
    goto LABEL_14;
  }
  id v9 = (objc_class *)MEMORY[0x1E4F1E6A0];
LABEL_12:
  id v13 = v8;
  id v14 = [v9 alloc];
  [v13 center];
  double v16 = v15;
  double v18 = v17;
  [v13 radius];
  id v12 = [v14 initForLowPowerWithCenter:v6 radius:v16 identifier:v18];
LABEL_13:
  [v12 setNotifyOnEntry:[v13 notifyOnEntry]];
  [v12 setNotifyOnExit:[v13 notifyOnExit]];
  [v12 setGeoReferenceFrame:[v13 geoReferenceFrame]];
  uint64_t v20 = [v13 conservativeEntry];

  [v12 setConservativeEntry:v20];
LABEL_14:

  return v12;
}

+ (id)clientRegionForRegion:(id)a3 clientIdentifierPrefix:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    LOWORD(v18) = 0;
    id v14 = "Invalid parameter not satisfying: region";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v18) = 0;
    id v14 = "Invalid parameter not satisfying: clientIdentifierPrefix";
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v9 = objc_opt_class();
    id v10 = [v6 identifier];
    uint64_t v11 = [v10 substringFromIndex:[v8 length]];
    id v12 = [v9 regionWithModifiedIdentifier:v11 forRegion:v6];

    goto LABEL_11;
  }
  double v16 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    double v17 = NSStringFromSelector(a2);
    int v18 = 138412546;
    double v19 = v17;
    __int16 v20 = 2112;
    uint64_t v21 = objc_opt_class();
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "%@, received region class of type: %@", (uint8_t *)&v18, 0x16u);
  }
LABEL_10:
  id v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_isClientIdentifierAvailable:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_regionEventHandlerDictionary objectForKey:a3];

  return v3 == 0;
}

- (id)_prefixForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", v11, 2u);
    }

LABEL_8:
    id v7 = 0;
    goto LABEL_10;
  }
  if ([(RTLocationManager *)self _isClientIdentifierAvailable:v6])
  {
    if (a4)
    {
      [(id)objc_opt_class() errorUnregisteredClientIdentifier:v6];
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v9 = [(id)objc_opt_class() regionIdentifierDelimiterString];
  id v7 = [v6 stringByAppendingString:v9];

LABEL_10:

  return v7;
}

- (id)_fullIdentifierForClientIdentifier:(id)a3 regionIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(RTLocationManager *)self _prefixForClientIdentifier:a3 error:a5];
  id v10 = [v9 stringByAppendingString:v8];

  return v10;
}

- (id)_regionForClientRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    int v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

LABEL_14:
      double v17 = 0;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    double v19 = "Invalid parameter not satisfying: clientRegion";
LABEL_23:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_10;
  }
  if (!v9)
  {
    int v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    double v19 = "Invalid parameter not satisfying: clientIdentifier";
    goto LABEL_23;
  }
  uint64_t v11 = objc_opt_class();
  id v12 = [v8 identifier];
  LOBYTE(v11) = [(id)v11 isValidIdentifier:v12];

  if ((v11 & 1) == 0)
  {
    *(void *)buf = 0;
    __int16 v25 = buf;
    uint64_t v26 = 0x3032000000;
    int v27 = __Block_byref_object_copy__72;
    id v28 = __Block_byref_object_dispose__72;
    id v29 = 0;
    __int16 v20 = [(id)objc_opt_class() errorUsedDelimiter];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    _OWORD v23[2] = __67__RTLocationManager__regionForClientRegion_clientIdentifier_error___block_invoke;
    v23[3] = &unk_1E6B94AB8;
    void v23[4] = buf;
    [(RTLocationManager *)self _performCallbackForClientRegion:v8 clientIdentifier:v10 regionEvent:4 callbackError:v20 handler:v23];

    if (a5) {
      *a5 = *((id *)v25 + 5);
    }
    _Block_object_dispose(buf, 8);

    goto LABEL_14;
  }
  id v13 = [v8 identifier];
  id v22 = 0;
  id v14 = [(RTLocationManager *)self _fullIdentifierForClientIdentifier:v10 regionIdentifier:v13 error:&v22];
  id v15 = v22;

  if (v15)
  {
    if (!a5)
    {
      double v17 = 0;
      goto LABEL_21;
    }
    id v16 = v15;
    double v17 = 0;
    goto LABEL_19;
  }
  double v17 = [(id)objc_opt_class() regionWithModifiedIdentifier:v14 forRegion:v8];
  if (a5) {
LABEL_19:
  }
    *a5 = v15;
LABEL_21:

LABEL_15:

  return v17;
}

void __67__RTLocationManager__regionForClientRegion_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_clientIdentifierForRegion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  if (v17)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [(NSMutableDictionary *)self->_regionEventHandlerDictionary allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v18 = 0;
          id v10 = [(RTLocationManager *)self _prefixForClientIdentifier:v9 error:&v18];
          id v11 = v18;
          if (!v11)
          {
            id v12 = [v17 identifier];
            char v13 = [v12 hasPrefix:v10];

            if (v13)
            {
              id v15 = v9;

              goto LABEL_17;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      regionEventHandlerDictionary = self->_regionEventHandlerDictionary;
      *(_DWORD *)buf = 138412546;
      id v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = regionEventHandlerDictionary;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Region: %@ received does not contain any of the registered client identifier prefixes: %@", buf, 0x16u);
    }
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region", buf, 2u);
    }
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

- (void)performCallbackForRegion:(id)a3 regionEvent:(int64_t)a4 callbackError:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  char v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__RTLocationManager_performCallbackForRegion_regionEvent_callbackError_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __80__RTLocationManager_performCallbackForRegion_regionEvent_callbackError_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCallbackForRegion:*(void *)(a1 + 40) regionEvent:*(void *)(a1 + 64) callbackError:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (BOOL)_performCallbackForRegion:(id)a3 regionEvent:(int64_t)a4 callbackError:(id)a5 handler:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  char v13 = (void (**)(id, id))a6;
  if (!v11)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v15 = "Invalid parameter not satisfying: region";
      goto LABEL_16;
    }
LABEL_6:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)a4 >= 6)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v15 = "Invalid parameter not satisfying: callbackType >= RTRegionCallbackTypeFirst() && callbackType <= RTRegionCallbackTypeLast()";
LABEL_16:
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  id v14 = [(RTLocationManager *)self _clientIdentifierForRegion:v11];
  if (v14)
  {
    id v29 = 0;
    id v17 = [(RTLocationManager *)self _prefixForClientIdentifier:v14 error:&v29];
    id v18 = v29;
    if (v18) {
      v13[2](v13, v18);
    }
    id v19 = [(id)objc_opt_class() clientRegionForRegion:v11 clientIdentifierPrefix:v17];
    BOOL v16 = [(RTLocationManager *)self _performCallbackForClientRegion:v19 clientIdentifier:v14 regionEvent:a4 callbackError:v12 handler:v13];
  }
  else
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int64_t v21 = NSStringFromSelector(a2);
      locationBundlePathShortname = self->_locationBundlePathShortname;
      id v23 = [(id)objc_opt_class() stringForRegionCallbackType:a4];
      *(_DWORD *)buf = 138413058;
      uint64_t v39 = v21;
      __int16 v40 = 2112;
      uint64_t v41 = locationBundlePathShortname;
      __int16 v42 = 2112;
      id v43 = v11;
      __int16 v44 = 2112;
      SEL v45 = v23;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, defer callback until client registers, region, %@, regionEvent, %@", buf, 0x2Au);
    }
    objc_initWeak((id *)buf, self);
    id v24 = [(RTLocationManager *)self regionEventDispatcher];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke;
    v33[3] = &unk_1E6B96FA0;
    objc_copyWeak(v37, (id *)buf);
    id v34 = v11;
    v37[1] = (id)a4;
    id v35 = v12;
    char v36 = v13;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke_2;
    v30[3] = &unk_1E6B921E0;
    v30[4] = self;
    SEL v32 = a2;
    uint64_t v31 = v36;
    __int16 v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    int v27 = NSStringFromSelector(a2);
    [v24 enqueueBlock:v33, v30, @"%@-%@", v26, v27 failureBlock description];

    objc_destroyWeak(v37);
    objc_destroyWeak((id *)buf);
    id v14 = 0;
    BOOL v16 = 1;
  }
LABEL_14:

  return v16;
}

void __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _performCallbackForRegion:*(void *)(a1 + 32) regionEvent:*(void *)(a1 + 64) callbackError:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __81__RTLocationManager__performCallbackForRegion_regionEvent_callbackError_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  uint64_t v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F5CFE8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = v6;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);
  }
}

- (BOOL)_performCallbackForClientRegion:(id)a3 clientIdentifier:(id)a4 regionEvent:(int64_t)a5 callbackError:(id)a6 handler:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  BOOL v16 = (void (**)(id, void *))a7;
  if (!v13)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      id v18 = "Invalid parameter not satisfying: clientRegion";
      goto LABEL_7;
    }
LABEL_13:
    BOOL v24 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)a5 >= 6)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      id v18 = "Invalid parameter not satisfying: callbackType >= RTRegionCallbackTypeFirst() && callbackType <= RTRegionCallbackTypeLast()";
LABEL_7:
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = NSStringFromSelector(a2);
    locationBundlePathShortname = self->_locationBundlePathShortname;
    long long v22 = [(id)objc_opt_class() stringForRegionCallbackType:a5];
    int v27 = 138413570;
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    uint64_t v30 = locationBundlePathShortname;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = v14;
    __int16 v35 = 2112;
    char v36 = v22;
    __int16 v37 = 2112;
    id v38 = v15;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@, %@, region, %@, identifier, %@, regionEvent, %@, error, %@", (uint8_t *)&v27, 0x3Eu);
  }
  uint64_t v23 = [(NSMutableDictionary *)self->_regionEventHandlerDictionary objectForKey:v14];
  uint64_t v17 = v23;
  if (!v23)
  {
    __int16 v25 = [(id)objc_opt_class() errorUnregisteredClientIdentifier:v14];
    v16[2](v16, v25);

    goto LABEL_13;
  }
  (*(void (**)(uint64_t, id, int64_t, id))(v23 + 16))(v23, v13, a5, v15);
  v16[2](v16, 0);
  BOOL v24 = 1;
LABEL_14:

  return v24;
}

- (void)registerForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__RTLocationManager_registerForRegionEventsWithClientIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __73__RTLocationManager_registerForRegionEventsWithClientIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForRegionEventsWithClientIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_registerForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void, void))v7;
  if (!v6)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v20 = 0;
    id v12 = "Invalid parameter not satisfying: clientIdentifier";
    id v13 = (uint8_t *)&v20;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_13;
  }
  if (!v7)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v12 = "Invalid parameter not satisfying: handler";
    id v13 = buf;
    goto LABEL_10;
  }
  if (([(id)objc_opt_class() isValidIdentifier:v6] & 1) == 0)
  {
    uint64_t v10 = [(id)objc_opt_class() errorUsedDelimiter];
    goto LABEL_12;
  }
  id v9 = [(NSMutableDictionary *)self->_regionEventHandlerDictionary objectForKey:v6];

  if (v9)
  {
    uint64_t v10 = [(id)objc_opt_class() errorDuplicateClientIdentifier:v6];
LABEL_12:
    id v11 = v10;
    v8[2](v8, 0, 3, v10);
    goto LABEL_13;
  }
  id v14 = [(NSMutableDictionary *)self->_regionEventHandlerDictionary objectForKey:v6];

  if (v14)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v18 = 0;
    id v12 = "Invalid parameter not satisfying: [_regionEventHandlerDictionary objectForKey:clientIdentifier] == nil";
    id v13 = (uint8_t *)&v18;
    goto LABEL_10;
  }
  regionEventHandlerDictionary = self->_regionEventHandlerDictionary;
  BOOL v16 = (void *)MEMORY[0x1E016DB00](v8);
  [(NSMutableDictionary *)regionEventHandlerDictionary setObject:v16 forKey:v6];

  uint64_t v17 = [(RTLocationManager *)self regionEventDispatcher];
  LODWORD(v16) = [v17 invocationsPending];

  if (!v16) {
    goto LABEL_14;
  }
  id v11 = [(RTLocationManager *)self regionEventDispatcher];
  [v11 dispatchPendingInvocations];
LABEL_13:

LABEL_14:
}

- (void)unregisterForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTLocationManager_unregisterForRegionEventsWithClientIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __75__RTLocationManager_unregisterForRegionEventsWithClientIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterForRegionEventsWithClientIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_unregisterForRegionEventsWithClientIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (!v6)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v14 = 0;
    id v11 = "Invalid parameter not satisfying: clientIdentifier";
    id v12 = (uint8_t *)&v14;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_13;
  }
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v13 = 0;
    id v11 = "Invalid parameter not satisfying: handler";
    id v12 = (uint8_t *)&v13;
    goto LABEL_10;
  }
  if ([(id)objc_opt_class() isValidIdentifier:v6])
  {
    if (![(RTLocationManager *)self _isClientIdentifierAvailable:v6])
    {
      [(NSMutableDictionary *)self->_regionEventHandlerDictionary removeObjectForKey:v6];
      v8[2](v8, 0);
      goto LABEL_14;
    }
    uint64_t v9 = [(id)objc_opt_class() errorUnregisteredClientIdentifier:v6];
  }
  else
  {
    uint64_t v9 = [(id)objc_opt_class() errorUsedDelimiter];
  }
  id v10 = v9;
  v8[2](v8, v9);
LABEL_13:

LABEL_14:
}

- (BOOL)startMonitoringForRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientRegion", buf, 2u);
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", buf, 2u);
    }
LABEL_13:

    BOOL v16 = 0;
    goto LABEL_14;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = NSStringFromSelector(a2);
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = locationBundlePathShortname;
    *(_WORD *)&buf[22] = 2112;
    int v27 = v9;
    LOWORD(v28) = 2112;
    *(void *)((char *)&v28 + 2) = v11;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, region, %@, clientIdentifier, %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  int v27 = __Block_byref_object_copy__72;
  *(void *)&long long v28 = __Block_byref_object_dispose__72;
  *((void *)&v28 + 1) = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__72;
  v24[4] = __Block_byref_object_dispose__72;
  id v25 = 0;
  id v15 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTLocationManager_startMonitoringForRegion_clientIdentifier_error___block_invoke;
  block[3] = &unk_1E6B96FC8;
  long long v22 = v24;
  void block[4] = self;
  __int16 v20 = v9;
  id v21 = v11;
  uint64_t v23 = buf;
  dispatch_sync(v15, block);

  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v16 = *(void *)(*(void *)&buf[8] + 40) == 0;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v16;
}

void __69__RTLocationManager_startMonitoringForRegion_clientIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _regionForClientRegion:v3 clientIdentifier:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v9 = [*(id *)(a1 + 32) locationManager];
    [v9 startMonitoringForRegion:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
}

- (BOOL)stopMonitoringForRegion:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientRegion", buf, 2u);
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", buf, 2u);
    }
LABEL_13:

    BOOL v16 = 0;
    goto LABEL_14;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = NSStringFromSelector(a2);
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = locationBundlePathShortname;
    *(_WORD *)&buf[22] = 2112;
    int v27 = v9;
    LOWORD(v28) = 2112;
    *(void *)((char *)&v28 + 2) = v11;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, region %@, clientIdentifier, %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  int v27 = __Block_byref_object_copy__72;
  *(void *)&long long v28 = __Block_byref_object_dispose__72;
  *((void *)&v28 + 1) = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__72;
  v24[4] = __Block_byref_object_dispose__72;
  id v25 = 0;
  id v15 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTLocationManager_stopMonitoringForRegion_clientIdentifier_error___block_invoke;
  block[3] = &unk_1E6B96FC8;
  long long v22 = v24;
  void block[4] = self;
  __int16 v20 = v9;
  id v21 = v11;
  uint64_t v23 = buf;
  dispatch_sync(v15, block);

  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v16 = *(void *)(*(void *)&buf[8] + 40) == 0;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v16;
}

void __68__RTLocationManager_stopMonitoringForRegion_clientIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _regionForClientRegion:v3 clientIdentifier:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v9 = [*(id *)(a1 + 32) locationManager];
    [v9 stopMonitoringForRegion:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
}

- (BOOL)stopMonitoringAllRegionsForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    *(void *)buf = 0;
    id v15 = buf;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__72;
    __int16 v18 = __Block_byref_object_dispose__72;
    id v19 = 0;
    uint64_t v7 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__RTLocationManager_stopMonitoringAllRegionsForClientIdentifier_error___block_invoke;
    block[3] = &unk_1E6B91128;
    void block[4] = self;
    id v12 = v6;
    __int16 v13 = buf;
    dispatch_sync(v7, block);

    if (a4) {
      *a4 = *((id *)v15 + 5);
    }
    BOOL v8 = *((void *)v15 + 5) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier", buf, 2u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

void __71__RTLocationManager_stopMonitoringAllRegionsForClientIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 _stopMonitoringAllRegionsForClientIdentifier:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (BOOL)_stopMonitoringAllRegionsForClientIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138412802;
    __int16 v31 = v9;
    __int16 v32 = 2112;
    __int16 v33 = locationBundlePathShortname;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, clientIdentifier, %@", buf, 0x20u);
  }
  BOOL v11 = [(RTLocationManager *)self _isClientIdentifierAvailable:v7];
  if (v11)
  {
    if (a4)
    {
      id v12 = [(id)objc_opt_class() errorUnregisteredClientIdentifier:v7];
LABEL_17:
      *a4 = v12;
    }
  }
  else
  {
    BOOL v24 = a4;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    __int16 v13 = [(RTLocationManager *)self locationManager];
    __int16 v14 = [v13 monitoredRegions];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          __int16 v20 = [(RTLocationManager *)self _clientIdentifierForRegion:v19];
          int v21 = [v20 isEqualToString:v7];

          if (v21)
          {
            long long v22 = [(RTLocationManager *)self locationManager];
            [v22 stopMonitoringForRegion:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }

    a4 = v24;
    if (v24)
    {
      id v12 = 0;
      goto LABEL_17;
    }
  }

  return !v11;
}

- (BOOL)isMonitoringForRegionWithClientIdentifier:(id)a3 regionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v6)
  {
    BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      BOOL v10 = 0;
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    id v12 = "Invalid parameter not satisfying: clientIdentifier";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v12 = "Invalid parameter not satisfying: regionIdentifier";
    goto LABEL_10;
  }
  *(void *)buf = 0;
  uint64_t v19 = buf;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v9 = [(RTNotifier *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__RTLocationManager_isMonitoringForRegionWithClientIdentifier_regionIdentifier___block_invoke;
  v14[3] = &unk_1E6B91CA8;
  uint64_t v17 = buf;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  dispatch_sync(v9, v14);

  BOOL v10 = v19[24] != 0;
  _Block_object_dispose(buf, 8);
LABEL_8:

  return v10;
}

uint64_t __80__RTLocationManager_isMonitoringForRegionWithClientIdentifier_regionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isMonitoringForRegionWithClientIdentifier:*(void *)(a1 + 40) regionIdentifier:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_isMonitoringForRegionWithClientIdentifier:(id)a3 regionIdentifier:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    BOOL v10 = (char *)objc_claimAutoreleasedReturnValue();
    locationBundlePathShortname = self->_locationBundlePathShortname;
    *(_DWORD *)buf = 138412802;
    __int16 v31 = v10;
    __int16 v32 = 2112;
    __int16 v33 = locationBundlePathShortname;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, clientIdentifier, %@", buf, 0x20u);
  }
  if ([(RTLocationManager *)self _isClientIdentifierAvailable:v7])
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = [(id)objc_opt_class() errorUnregisteredClientIdentifier:v7];
      *(_DWORD *)buf = 136315394;
      __int16 v31 = "-[RTLocationManager _isMonitoringForRegionWithClientIdentifier:regionIdentifier:]";
      __int16 v32 = 2112;
      __int16 v33 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%s, failed with error, %@", buf, 0x16u);
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    __int16 v14 = [(RTLocationManager *)self locationManager];
    id v12 = [v14 monitoredRegions];

    uint64_t v15 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v20 = [(RTLocationManager *)self _clientIdentifierForRegion:v19];
          if ([v20 isEqualToString:v7])
          {
            char v21 = [v19 identifier];
            char v22 = [v21 containsString:v8];

            if (v22)
            {
              BOOL v23 = 1;
              goto LABEL_18;
            }
          }
          else
          {
          }
        }
        uint64_t v16 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }
  }
  BOOL v23 = 0;
LABEL_18:

  return v23;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9
    || ([(RTLocationManager *)self locationManager],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v9 isEqual:v12],
        v12,
        v13))
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = NSStringFromSelector(a2);
      locationBundlePathShortname = self->_locationBundlePathShortname;
      *(_DWORD *)buf = 138413058;
      char v21 = v15;
      __int16 v22 = 2112;
      BOOL v23 = locationBundlePathShortname;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, region, %@, error, %@", buf, 0x2Au);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__RTLocationManager_locationManager_monitoringDidFailForRegion_withError___block_invoke;
    v17[3] = &unk_1E6B94130;
    SEL v19 = a2;
    v17[4] = self;
    id v18 = v10;
    [(RTLocationManager *)self performCallbackForRegion:v18 regionEvent:4 callbackError:v11 handler:v17];
  }
}

void __74__RTLocationManager_locationManager_monitoringDidFailForRegion_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
      id v8 = [(id)objc_opt_class() stringForRegionCallbackType:4];
      int v9 = 138413314;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);
    }
  }
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7
    || ([(RTLocationManager *)self locationManager],
        int v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v7 isEqual:v9],
        v9,
        v10))
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      locationBundlePathShortname = self->_locationBundlePathShortname;
      *(_DWORD *)buf = 138412802;
      id v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = locationBundlePathShortname;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, region, %@", buf, 0x20u);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__RTLocationManager_locationManager_didStartMonitoringForRegion___block_invoke;
    v14[3] = &unk_1E6B94130;
    SEL v16 = a2;
    v14[4] = self;
    id v15 = v8;
    [(RTLocationManager *)self performCallbackForRegion:v15 regionEvent:5 callbackError:0 handler:v14];
  }
}

void __65__RTLocationManager_locationManager_didStartMonitoringForRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
      id v8 = [(id)objc_opt_class() stringForRegionCallbackType:5];
      int v9 = 138413314;
      int v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      SEL v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);
    }
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9
    || ([(RTLocationManager *)self locationManager],
        __int16 v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v9 isEqual:v11],
        v11,
        v12))
  {
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      __int16 v15 = (void *)v14;
      locationBundlePathShortname = self->_locationBundlePathShortname;
      __int16 v17 = @"Unknown";
      if (a4 == 2) {
        __int16 v17 = @"Outside";
      }
      *(_DWORD *)buf = 138413058;
      uint64_t v32 = v14;
      __int16 v34 = locationBundlePathShortname;
      __int16 v33 = 2112;
      if (a4 == 1) {
        __int16 v17 = @"Inside";
      }
      __int16 v35 = 2112;
      uint64_t v36 = v17;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, state, %@, region, %@", buf, 0x2Au);
    }
    if (a4 == 2)
    {
      if ([v10 notifyOnExit])
      {
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        id v25 = __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke_234;
        __int16 v26 = &unk_1E6B94130;
        v28[1] = a2;
        id v27 = self;
        id v18 = (id *)v28;
        id v19 = v10;
        v28[0] = v19;
        uint64_t v20 = &v23;
        __int16 v21 = self;
        uint64_t v22 = 2;
        goto LABEL_15;
      }
    }
    else if (a4 == 1 && [v10 notifyOnEntry])
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke;
      v29[3] = &unk_1E6B94130;
      v30[1] = a2;
      v29[4] = self;
      id v18 = (id *)v30;
      id v19 = v10;
      v30[0] = v19;
      uint64_t v20 = v29;
      __int16 v21 = self;
      uint64_t v22 = 1;
LABEL_15:
      -[RTLocationManager performCallbackForRegion:regionEvent:callbackError:handler:](v21, "performCallbackForRegion:regionEvent:callbackError:handler:", v19, v22, 0, v20, v23, v24, v25, v26, v27, v28[0]);
    }
  }
}

void __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
      id v8 = [(id)objc_opt_class() stringForRegionCallbackType:1];
      int v9 = 138413314;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      SEL v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);
    }
  }
}

void __65__RTLocationManager_locationManager_didDetermineState_forRegion___block_invoke_234(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
      id v8 = [(id)objc_opt_class() stringForRegionCallbackType:2];
      int v9 = 138413314;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      SEL v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, performCallback, region, %@, regionEvent, %@, error, %@", (uint8_t *)&v9, 0x34u);
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    locationBundlePathShortname = self->_locationBundlePathShortname;
    int v8 = 138412546;
    int v9 = locationBundlePathShortname;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, locationManager didFailWithError: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    __int16 v10 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __70__RTLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E6B927F8;
    __int16 v13 = v8;
    uint64_t v14 = self;
    id v15 = v9;
    unint64_t v16 = a4;
    dispatch_async(v10, v12);

    id v11 = v13;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __70__RTLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"options cannot be nil";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = (__CFString **)v24;
    __int16 v10 = &v23;
LABEL_9:
    id v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    uint64_t v12 = v6;
    uint64_t v13 = v7;
    uint64_t v14 = 7;
LABEL_11:
    __int16 v17 = [v12 errorWithDomain:v13 code:v14 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v3 = [v2 enumeratedType];
  uint64_t v4 = [(id)objc_opt_class() vendedClasses];
  uint64_t v5 = [v4 member:v3];

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    uint64_t v22 = @"the type specified by options is not vended by this manager";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v22;
    __int16 v10 = &v21;
    goto LABEL_9;
  }
  if (([*(id *)(a1 + 40) locationStoreAvailable] & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"store is not available";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v12 = v15;
    uint64_t v13 = v16;
    uint64_t v14 = 5;
    goto LABEL_11;
  }
  id v18 = [*(id *)(a1 + 40) locationStore];
  [v18 fetchEnumerableObjectsWithOptions:*(void *)(a1 + 32) offset:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)setCurrentLocationRequests:(id)a3
{
}

- (BOOL)leechingLocations
{
  return self->_leechingLocations;
}

- (BOOL)monitoringLocations
{
  return self->_monitoringLocations;
}

- (BOOL)monitoringRhythmicLocations
{
  return self->_monitoringRhythmicLocations;
}

- (void)setEffectiveLocationBundlePath:(id)a3
{
}

- (NSString)locationBundlePathShortname
{
  return self->_locationBundlePathShortname;
}

- (RTTimer)activeLocationRequestTimer
{
  return self->_activeLocationRequestTimer;
}

- (void)setActiveLocationRequestTimer:(id)a3
{
}

- (void)setPowerAssertion:(id)a3
{
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocationManager)rhythmicLocationManager
{
  return self->_rhythmicLocationManager;
}

- (void)setRhythmicLocationManager:(id)a3
{
}

- (void)setLocationManagerRoutine:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTLocationSmoother)locationSmoother
{
  return self->_locationSmoother;
}

- (void)setLocationSmoother:(id)a3
{
}

- (void)setLocationStore:(id)a3
{
}

- (void)setPlatform:(id)a3
{
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTTrustedTimeCache)trustedTimeCache
{
  return self->_trustedTimeCache;
}

- (NSMutableDictionary)regionEventHandlerDictionary
{
  return self->_regionEventHandlerDictionary;
}

- (void)setRegionEventHandlerDictionary:(id)a3
{
}

- (RTInvocationDispatcher)regionEventDispatcher
{
  return self->_regionEventDispatcher;
}

- (void)setRegionEventDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionEventDispatcher, 0);
  objc_storeStrong((id *)&self->_regionEventHandlerDictionary, 0);
  objc_storeStrong((id *)&self->_trustedTimeCache, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_locationSmoother, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_locationManagerRoutine, 0);
  objc_storeStrong((id *)&self->_rhythmicLocationManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_activeLocationRequestTimer, 0);
  objc_storeStrong((id *)&self->_locationBundlePathShortname, 0);
  objc_storeStrong((id *)&self->_effectiveLocationBundlePath, 0);

  objc_storeStrong((id *)&self->_currentLocationRequests, 0);
}

- (void)injectLocations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTLocationManager_Evaluation__injectLocations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __57__RTLocationManager_Evaluation__injectLocations_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locationStore];
  [v2 storeLocations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

@end