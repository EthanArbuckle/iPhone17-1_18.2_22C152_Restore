@interface RTAuthorizedLocationManager
+ (unint64_t)_locationAvailabilityFromCLLocation:(id)a3;
- (BOOL)_assertMotionConsistencyForLocations:(id)a3 positionUncertaintyRate:(double)a4;
- (BOOL)_assertRecentLocationTechnologyQualityForAuthorizedLocation:(id)a3 visit:(id)a4;
- (BOOL)_assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation:(id)a3 visit:(id)a4;
- (BOOL)_assertUserTimeAndTrustedTimeAreConsistent;
- (BOOL)_isExpeditedSyncAndLearnRequired;
- (BOOL)_isRoutineEnabled;
- (BOOL)_loadEraseInstallInitializationXPCCriteriaFromDefaults;
- (BOOL)_oneTimeRetroactivelyRegisterAllStoredVisits;
- (BOOL)allowUnsecureTimeFallback;
- (BOOL)forceTrustedTimeUnavailability;
- (BOOL)isEraseInstallDatabaseInitializationRequired;
- (BOOL)isSupportedDevice;
- (BOOL)isUnlockedSinceBoot;
- (BOOL)relaxTrustedTimeRequirement;
- (NSArray)authorizedLocationArr;
- (NSDate)dateOfLastAuthorizedLocationsCuration;
- (NSDate)eraseInstallInitializationStartDate;
- (NSDate)mostRecentDateAtWhichDeviceDataIsTrusted;
- (RTAuthorizationManager)authorizationManager;
- (RTAuthorizedLocationBiometricsManager)biometricsManager;
- (RTAuthorizedLocationManager)initWithVisitManager:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 learnedLocationManager:(id)a6 motionActivityManager:(id)a7 visitLogStore:(id)a8 defaultsManager:(id)a9 xpcActivityManager:(id)a10 dataProtectionManager:(id)a11 persistenceMirroringManager:(id)a12 platform:(id)a13 authorizationManager:(id)a14;
- (RTAuthorizedLocationMetrics)metrics;
- (RTAuthorizedLocationStatus)overrideAuthorizedLocationStatus;
- (RTAuthorizedLocationVisitLogStore)visitLogStore;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPersistenceMirroringManager)persistenceMirroringManager;
- (RTPlatform)platform;
- (RTTrustedTimeCache)trustedTimeCache;
- (RTVisitManager)visitManager;
- (RTXPCActivityCriteria)eraseInstallInitializationXpcCriteria;
- (RTXPCActivityManager)xpcActivityManager;
- (double)_positionUncertaintyRateFromMotionActivity:(id)a3 dateInterval:(id)a4;
- (id)_assertWeAreAtAuthorizedLocation:(id)a3;
- (id)_getCurrentVisit;
- (id)trustedTimeNow;
- (unint64_t)_computeLocationTechnologyAvailabilityForDateInterval:(id)a3;
- (unint64_t)_computeLocationTechnologyExpectationFromHistoricalAvailability:(id)a3;
- (unint64_t)eraseInstallDatabaseInitializationAttemptCount;
- (unint64_t)eraseInstallDatabaseInitializationMaxAttemptCount;
- (void)_checkConfiguration;
- (void)_checkStatusOverrideDefault;
- (void)_curateAuthorizedLocationsWithHandler:(id)a3;
- (void)_fetchAuthorizedLocationExtendedStatus:(id)a3;
- (void)_fetchAuthorizedLocationExtendedStatusWithMetrics:(id)a3;
- (void)_fetchAuthorizedLocations:(id)a3;
- (void)_fetchCurrentLocationWithHandler:(id)a3;
- (void)_registerForDeviceUnlockNotification;
- (void)_runEraseInstallDatabaseInitialization:(id)a3;
- (void)_setup;
- (void)_setupEraseInstallDatabaseInitializationActivity;
- (void)_setupVisitLogActivity;
- (void)_updateMostRecentDateAtWhichDeviceDataIsTrusted;
- (void)_updateReferenceTimeBoundsFromVisitLog;
- (void)_updateVisitLogWithTrustedTime:(id)a3 isRetroRegistrationTime:(BOOL)a4 handler:(id)a5;
- (void)curateAuthorizedLocationsWithHandler:(id)a3;
- (void)eraseVisitLogDatabase:(id)a3;
- (void)fetchAuthorizedLocationExtendedStatus:(id)a3;
- (void)fetchAuthorizedLocations:(id)a3;
- (void)fetchVisitLogsWithOptions:(id)a3 handler:(id)a4;
- (void)onDataProtectionNotification:(id)a3;
- (void)runEraseInstallDatabaseInitialization:(id)a3;
- (void)setAllowUnsecureTimeFallback:(BOOL)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setAuthorizedLocationArr:(id)a3;
- (void)setDateOfLastAuthorizedLocationsCuration:(id)a3;
- (void)setEraseInstallDatabaseInitializationAttemptCount:(unint64_t)a3;
- (void)setEraseInstallDatabaseInitializationMaxAttemptCount:(unint64_t)a3;
- (void)setEraseInstallInitializationStartDate:(id)a3;
- (void)setEraseInstallInitializationXpcCriteria:(id)a3;
- (void)setForceTrustedTimeUnavailability:(BOOL)a3;
- (void)setIsEraseInstallDatabaseInitializationRequired:(BOOL)a3;
- (void)setIsUnlockedSinceBoot:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setMostRecentDateAtWhichDeviceDataIsTrusted:(id)a3;
- (void)setOverrideAuthorizedLocationStatus:(id)a3;
- (void)setRelaxTrustedTimeRequirement:(BOOL)a3;
@end

@implementation RTAuthorizedLocationManager

- (RTAuthorizedLocationManager)initWithVisitManager:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 learnedLocationManager:(id)a6 motionActivityManager:(id)a7 visitLogStore:(id)a8 defaultsManager:(id)a9 xpcActivityManager:(id)a10 dataProtectionManager:(id)a11 persistenceMirroringManager:(id)a12 platform:(id)a13 authorizationManager:(id)a14
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v58 = a4;
  id v20 = a4;
  id v59 = a5;
  id v21 = a5;
  id v60 = a6;
  id v22 = a6;
  id v61 = a7;
  id v23 = a7;
  id v69 = a8;
  id v68 = a9;
  id v67 = a10;
  id v66 = a11;
  id v65 = a12;
  id v64 = a13;
  id v63 = a14;
  v24 = v19;
  if (v19)
  {
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 141;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager (in %s:%d)", buf, 0x12u);
    }

    if (v20)
    {
LABEL_3:
      if (v21) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:m"
          "otionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirrori"
          "ngManager:platform:authorizationManager:]";
    __int16 v73 = 1024;
    int v74 = 142;
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (v21)
  {
LABEL_4:
    if (v22) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_13:
  v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:m"
          "otionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirrori"
          "ngManager:platform:authorizationManager:]";
    __int16 v73 = 1024;
    int v74 = 143;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
  }

  if (v22)
  {
LABEL_5:
    if (v23) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
LABEL_16:
  v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:m"
          "otionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirrori"
          "ngManager:platform:authorizationManager:]";
    __int16 v73 = 1024;
    int v74 = 144;
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
  }

  if (!v23)
  {
LABEL_19:
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 145;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionActivityManager (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_22:
  if (!v69)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 146;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitLogStore (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v68)
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 147;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v67)
  {
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 148;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v66)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 149;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v65)
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 150;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceMirroringManager (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v64)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 151;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v63)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager"
            ":motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMir"
            "roringManager:platform:authorizationManager:]";
      __int16 v73 = 1024;
      int v74 = 152;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", buf, 0x12u);
    }
  }
  v70.receiver = self;
  v70.super_class = (Class)RTAuthorizedLocationManager;
  v37 = [(RTNotifier *)&v70 init];
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_platform, a13);
    v38->_isSupportedDevice = [(RTPlatform *)v38->_platform iPhoneDevice];
    objc_storeStrong((id *)&v38->_authorizationManager, a14);
    objc_storeStrong((id *)&v38->_visitManager, a3);
    objc_storeStrong((id *)&v38->_locationManager, v58);
    objc_storeStrong((id *)&v38->_distanceCalculator, v59);
    objc_storeStrong((id *)&v38->_learnedLocationManager, v60);
    objc_storeStrong((id *)&v38->_motionActivityManager, v61);
    v39 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    authorizedLocationArr = v38->_authorizedLocationArr;
    v38->_authorizedLocationArr = v39;

    objc_storeStrong((id *)&v38->_visitLogStore, a8);
    objc_storeStrong((id *)&v38->_defaultsManager, a9);
    objc_storeStrong((id *)&v38->_xpcActivityManager, a10);
    objc_storeStrong((id *)&v38->_dataProtectionManager, a11);
    uint64_t v41 = [MEMORY[0x1E4F1C9C8] distantPast];
    dateOfLastAuthorizedLocationsCuration = v38->_dateOfLastAuthorizedLocationsCuration;
    v38->_dateOfLastAuthorizedLocationsCuration = (NSDate *)v41;

    overrideAuthorizedLocationStatus = v38->_overrideAuthorizedLocationStatus;
    v38->_overrideAuthorizedLocationStatus = 0;

    v38->_relaxTrustedTimeRequirement = 0;
    v38->_isEraseInstallDatabaseInitializationRequired = 0;
    v38->_isUnlockedSinceBoot = 0;
    v44 = objc_alloc_init(RTTrustedTimeCache);
    trustedTimeCache = v38->_trustedTimeCache;
    v38->_trustedTimeCache = v44;

    v38->_allowUnsecureTimeFallback = 0;
    v38->_forceTrustedTimeUnavailability = 0;
    v46 = [RTAuthorizedLocationMetrics alloc];
    v47 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v48 = [(RTAuthorizedLocationMetrics *)v46 initWithDaemonStartDate:v47];
    metrics = v38->_metrics;
    v38->_metrics = (RTAuthorizedLocationMetrics *)v48;

    -[RTAuthorizedLocationMetrics setLocationServicesEnabled:](v38->_metrics, "setLocationServicesEnabled:", [MEMORY[0x1E4F1E600] locationServicesEnabled]);
    [(RTAuthorizedLocationMetrics *)v38->_metrics setRoutineEnabled:[(RTAuthorizedLocationManager *)v38 _isRoutineEnabled]];
    v50 = [[RTAuthorizedLocationBiometricsManager alloc] initWithTrustedTimeCache:v38->_trustedTimeCache defaultsManager:v38->_defaultsManager];
    biometricsManager = v38->_biometricsManager;
    v38->_biometricsManager = v50;

    v24 = v19;
    uint64_t v52 = [MEMORY[0x1E4F1C9C8] distantPast];
    mostRecentDateAtWhichDeviceDataIsTrusted = v38->_mostRecentDateAtWhichDeviceDataIsTrusted;
    v38->_mostRecentDateAtWhichDeviceDataIsTrusted = (NSDate *)v52;

    objc_storeStrong((id *)&v38->_persistenceMirroringManager, a12);
    eraseInstallInitializationXpcCriteria = v38->_eraseInstallInitializationXpcCriteria;
    v38->_eraseInstallInitializationXpcCriteria = 0;

    v38->_eraseInstallDatabaseInitializationMaxAttemptCount = 0;
    v38->_eraseInstallDatabaseInitializationAttemptCount = 0;
    eraseInstallInitializationStartDate = v38->_eraseInstallInitializationStartDate;
    v38->_eraseInstallInitializationStartDate = 0;

    [(RTService *)v38 setup];
  }

  return v38;
}

- (void)_setup
{
  if (self->_isSupportedDevice)
  {
    [(RTAuthorizedLocationManager *)self _checkConfiguration];
    [(RTAuthorizedLocationManager *)self _loadEraseInstallInitializationXPCCriteriaFromDefaults];
    [(RTAuthorizedLocationManager *)self _setupVisitLogActivity];
    [(RTAuthorizedLocationManager *)self _registerForDeviceUnlockNotification];
  }
}

- (BOOL)_isRoutineEnabled
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  authorizationManager = self->_authorizationManager;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__RTAuthorizedLocationManager__isRoutineEnabled__block_invoke;
  v23[3] = &unk_1E6B949A0;
  v25 = &v26;
  v5 = v3;
  v24 = v5;
  [(RTAuthorizationManager *)authorizationManager fetchRoutineEnabledWithHandler:v23];
  v6 = v5;
  v7 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v8 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    v9 = [MEMORY[0x1E4F1C9C8] now];
    [v9 timeIntervalSinceDate:v7];
    double v11 = v10;
    v12 = objc_opt_new();
    v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
    v14 = [MEMORY[0x1E4F29060] callStackSymbols];
    v15 = [v14 filteredArrayUsingPredicate:v13];
    v16 = [v15 firstObject];

    [v12 submitToCoreAnalytics:v16 type:1 duration:v11];
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v30 count:1];
    id v20 = [v18 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v19];

    if (v20) {
  }
    }

  BOOL v21 = *((unsigned char *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

intptr_t __48__RTAuthorizedLocationManager__isRoutineEnabled__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_checkConfiguration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    [(RTAuthorizedLocationManager *)self _checkStatusOverrideDefault];
    v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsAuthorizedLocationRelaxTrustedTimeRequirement"];
    self->_relaxTrustedTimeRequirement = [v4 BOOLValue];

    if (self->_relaxTrustedTimeRequirement)
    {
      v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        double v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = NSStringFromSelector(a2);
        int v17 = 138412546;
        v18 = v12;
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@:%@, WARNING, defaults set to relax trusted time requirement (not requiring user time and trusted time to align).", (uint8_t *)&v17, 0x16u);
      }
    }
    v6 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsAuthorizedLocationForceTrustedTimeUnavailability"];
    self->_forceTrustedTimeUnavailability = [v6 BOOLValue];

    if (self->_forceTrustedTimeUnavailability)
    {
      v7 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        v16 = NSStringFromSelector(a2);
        int v17 = 138412546;
        v18 = v15;
        __int16 v19 = 2112;
        id v20 = v16;
        _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@:%@, WARNING, defaults set to force trusted time to be unavailable.", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  dispatch_time_t v8 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityAttemptCount"];

  if (v8)
  {
    v9 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityAttemptCount"];
    self->_eraseInstallDatabaseInitializationAttemptCount = [v9 integerValue];
  }
  double v10 = [(RTAuthorizedLocationManager *)self visitLogStore];
  self->_allowUnsecureTimeFallback = [v10 wasTrustedTimeRecentlyAvailable] ^ 1;
}

- (BOOL)_isExpeditedSyncAndLearnRequired
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = [(RTAuthorizedLocationManager *)self visitLogStore];
  uint64_t v5 = [v4 getEraseInstallRetroRegistrationStatus];

  if (v5 == 2)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = NSStringFromSelector(a2);
      int v23 = 138412546;
      v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, expedited sync not required as it has already run.", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        dispatch_time_t v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        double v10 = NSStringFromSelector(a2);
        unint64_t eraseInstallDatabaseInitializationAttemptCount = self->_eraseInstallDatabaseInitializationAttemptCount;
        int v23 = 138412802;
        v24 = v9;
        __int16 v25 = 2112;
        uint64_t v26 = v10;
        __int16 v27 = 1024;
        int v28 = eraseInstallDatabaseInitializationAttemptCount;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, expedited sync is required, and current running, attempt %d.", (uint8_t *)&v23, 0x1Cu);
      }
    }
    else
    {
      if (v7)
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v17 = NSStringFromSelector(a2);
        int v23 = 138412546;
        v24 = v16;
        __int16 v25 = 2112;
        uint64_t v26 = v17;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, initiating first expedited sync attempt, storing start date.", (uint8_t *)&v23, 0x16u);
      }
      self->_unint64_t eraseInstallDatabaseInitializationAttemptCount = 0;
      defaultsManager = self->_defaultsManager;
      __int16 v19 = [NSNumber numberWithInteger:0];
      [(RTDefaultsManager *)defaultsManager setObject:v19 forKey:@"RTAuthorizedLocationEraseInstallInitActivityAttemptCount"];

      id v20 = self->_defaultsManager;
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
      [(RTDefaultsManager *)v20 setObject:v21 forKey:@"RTAuthorizedLocationEraseInstallInitActivityStartDate"];

      v6 = [(RTAuthorizedLocationManager *)self visitLogStore];
      [v6 setEraseInstallRetroRegistrationStatus:1];
    }
  }

  return v5 != 2;
}

- (void)_checkStatusOverrideDefault
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsAuthorizedLocationStatusOverride"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 isEqualToString:@"Confirmed"])
      {
        v6 = (RTAuthorizedLocationStatus *)[objc_alloc(MEMORY[0x1E4F5CD90]) initWithStatus:2];
        overrideAuthorizedLocationStatus = self->_overrideAuthorizedLocationStatus;
        self->_overrideAuthorizedLocationStatus = v6;

        dispatch_time_t v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v9 = (objc_class *)objc_opt_class();
          double v10 = NSStringFromClass(v9);
          double v11 = NSStringFromSelector(a2);
          int v20 = 138412546;
          uint64_t v21 = v10;
          __int16 v22 = 2112;
          int v23 = v11;
          v12 = "%@:%@, WARNING, using defaults override of status with RTAuthorizedLocationEnumIsConfirmedAtAuthorizedLocation";
LABEL_13:
          _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v20, 0x16u);
        }
      }
      else if ([v5 isEqualToString:@"NotConfirmed"])
      {
        v14 = (RTAuthorizedLocationStatus *)[objc_alloc(MEMORY[0x1E4F5CD90]) initWithStatus:1];
        v15 = self->_overrideAuthorizedLocationStatus;
        self->_overrideAuthorizedLocationStatus = v14;

        dispatch_time_t v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v16 = (objc_class *)objc_opt_class();
          double v10 = NSStringFromClass(v16);
          double v11 = NSStringFromSelector(a2);
          int v20 = 138412546;
          uint64_t v21 = v10;
          __int16 v22 = 2112;
          int v23 = v11;
          v12 = "%@:%@, WARNING, using defaults override of status with RTAuthorizedLocationEnumIsNotConfirmedAtAuthorizedLocation";
          goto LABEL_13;
        }
      }
      else
      {
        if (![v5 isEqualToString:@"NotAvailable"])
        {
LABEL_15:

          goto LABEL_16;
        }
        int v17 = (RTAuthorizedLocationStatus *)[objc_alloc(MEMORY[0x1E4F5CD90]) initWithStatus:0];
        v18 = self->_overrideAuthorizedLocationStatus;
        self->_overrideAuthorizedLocationStatus = v17;

        dispatch_time_t v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          __int16 v19 = (objc_class *)objc_opt_class();
          double v10 = NSStringFromClass(v19);
          double v11 = NSStringFromSelector(a2);
          int v20 = 138412546;
          uint64_t v21 = v10;
          __int16 v22 = 2112;
          int v23 = v11;
          v12 = "%@:%@, WARNING, using defaults override of status with RTAuthorizedLocationEnumUnavailable";
          goto LABEL_13;
        }
      }

      goto LABEL_15;
    }
  }
  v13 = self->_overrideAuthorizedLocationStatus;
  self->_overrideAuthorizedLocationStatus = 0;

LABEL_16:
}

- (void)_setupVisitLogActivity
{
  LOBYTE(v6) = 1;
  v4 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:0 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:0 networkTransferUploadSize:1 networkTransferDownloadSize:3600.0 allowBattery:900.0 powerNap:900.0 delay:v6 requireBatteryLevel:0];
  xpcActivityManager = self->_xpcActivityManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke;
  v7[3] = &unk_1E6B949F0;
  v7[4] = self;
  v7[5] = a2;
  [(RTXPCActivityManager *)xpcActivityManager registerActivityWithIdentifier:@"com.apple.routined.authorizedLocation.maintenance" criteria:v4 handler:v7];
}

void __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v7;
    __int16 v19 = 2112;
    int v20 = @"com.apple.routined.authorizedLocation.maintenance";
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, Begin XPC Activity: %@", buf, 0x20u);
  }
  dispatch_time_t v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_38;
  block[3] = &unk_1E6B921E0;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v10;
  block[4] = v9;
  id v11 = v3;
  dispatch_async(v8, block);
}

void __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_38(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) trustedTimeNow];
  [*(id *)(a1 + 32) _updateMostRecentDateAtWhichDeviceDataIsTrusted];
  id v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_2;
  v9[3] = &unk_1E6B949C8;
  uint64_t v4 = *(void *)(a1 + 48);
  v9[4] = v3;
  v9[5] = v4;
  [v3 _updateVisitLogWithTrustedTime:v2 isRetroRegistrationTime:0 handler:v9];
  [*(id *)(a1 + 32) _updateReferenceTimeBoundsFromVisitLog];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    dispatch_time_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    v15 = @"com.apple.routined.authorizedLocation.maintenance";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, End XPC Activity: %@", buf, 0x20u);
  }
}

void __53__RTAuthorizedLocationManager__setupVisitLogActivity__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      dispatch_time_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v14 = 138412802;
      v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, error registering visits via XPC Activity: %@.", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (v7)
  {
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v14 = 138412802;
    v15 = v12;
    __int16 v16 = 2112;
    __int16 v17 = v13;
    __int16 v18 = 1026;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully registered %{public}d visits via XPC Activity.", (uint8_t *)&v14, 0x1Cu);
  }
}

- (BOOL)_loadEraseInstallInitializationXPCCriteriaFromDefaults
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityMaxAttemptCount"];

  if (v4)
  {
    id v5 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityMaxAttemptCount"];
    uint64_t v6 = [v5 integerValue];
  }
  else
  {
    uint64_t v6 = 25;
  }
  BOOL v7 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityIntervalSeconds"];

  if (v7)
  {
    dispatch_time_t v8 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityIntervalSeconds"];
    [v8 floatValue];
    float v10 = v9;
  }
  else
  {
    float v10 = 3600.0;
  }
  id v11 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityGracePeriodSeconds"];

  if (v11)
  {
    __int16 v12 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityGracePeriodSeconds"];
    [v12 floatValue];
    float v14 = v13;

    double v15 = v14;
  }
  else
  {
    double v15 = 900.0;
  }
  __int16 v16 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityDelaySeconds"];

  if (v16)
  {
    __int16 v17 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityDelaySeconds"];
    [v17 floatValue];
    float v19 = v18;
  }
  else
  {
    float v19 = 7200.0;
  }
  uint64_t v20 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityPriority"];

  if (v20)
  {
    uint64_t v21 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityPriority"];
    uint64_t v22 = [v21 integerValue];

    if (v22 == 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 2;
    }
  }
  else
  {
    uint64_t v23 = 2;
  }
  uint64_t v24 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityInexpensiveConnectivity"];

  if (v24)
  {
    __int16 v25 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityInexpensiveConnectivity"];
    uint64_t v26 = [v25 BOOLValue];
  }
  else
  {
    uint64_t v26 = 1;
  }
  __int16 v27 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityAllowBattery"];

  if (v27)
  {
    int v28 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityAllowBattery"];
    uint64_t v29 = [v28 BOOLValue];
  }
  else
  {
    uint64_t v29 = 1;
  }
  uint64_t v30 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityUploadSize"];

  if (v30)
  {
    v31 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityUploadSize"];
    uint64_t v30 = (void *)[v31 integerValue];
  }
  uint64_t v32 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityDownloadSize"];

  if (v32)
  {
    v33 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityDownloadSize"];
    uint64_t v32 = (void *)[v33 integerValue];
  }
  if (self->_eraseInstallDatabaseInitializationAttemptCount > 1) {
    float v19 = v10;
  }
  LOBYTE(v63) = 1;
  v34 = [[RTXPCActivityCriteria alloc] initWithInterval:v23 gracePeriod:1 priority:v26 requireNetworkConnectivity:v30 requireInexpensiveNetworkConnectivity:v32 networkTransferUploadSize:v29 networkTransferDownloadSize:v10 allowBattery:v15 powerNap:v19 delay:v63 requireBatteryLevel:0];
  v35 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = NSStringFromSelector(a2);
    v39 = [(RTXPCActivityCriteria *)v34 description];
    *(_DWORD *)buf = 138413314;
    id v65 = v37;
    __int16 v66 = 2112;
    id v67 = v38;
    __int16 v68 = 2112;
    id v69 = v39;
    __int16 v70 = 1026;
    *(_DWORD *)v71 = v6;
    *(_WORD *)&v71[4] = 2112;
    *(void *)&v71[6] = @"com.apple.routined.authorizedLocation.maintenance";
    _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@, Loaded XPC activity criteria, %@, maxAttemptCount, %{public}d, for activity, %@", buf, 0x30u);
  }
  v40 = &OBJC_IVAR___SMReceiverService__attemptedToLoadFromDisk;
  if (!self->_eraseInstallInitializationXpcCriteria) {
    goto LABEL_43;
  }
  [(RTXPCActivityCriteria *)v34 interval];
  double v42 = v41;
  [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria interval];
  if (v42 != v43) {
    goto LABEL_40;
  }
  [(RTXPCActivityCriteria *)v34 gracePeriod];
  double v45 = v44;
  [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria gracePeriod];
  if (v45 != v46) {
    goto LABEL_40;
  }
  uint64_t v47 = [(RTXPCActivityCriteria *)v34 priority];
  if (v47 == [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria priority]
    && (BOOL v48 = [(RTXPCActivityCriteria *)v34 requireInexpensiveNetworkConnectivity], v48 == [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria requireInexpensiveNetworkConnectivity])&& (v49 = [(RTXPCActivityCriteria *)v34 networkTransferUploadSize], v49 == [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria networkTransferUploadSize])&& (v50 = [(RTXPCActivityCriteria *)v34 networkTransferDownloadSize], v50 == [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria networkTransferDownloadSize])&& (v51 = [(RTXPCActivityCriteria *)v34 allowBattery], v51 == [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria allowBattery]))
  {
LABEL_43:
    BOOL v60 = 0;
  }
  else
  {
LABEL_40:
    uint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v53);
      v55 = NSStringFromSelector(a2);
      v56 = [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria description];
      uint64_t v57 = v6;
      unint64_t eraseInstallDatabaseInitializationMaxAttemptCount = self->_eraseInstallDatabaseInitializationMaxAttemptCount;
      id v59 = [(RTXPCActivityCriteria *)v34 description];
      *(_DWORD *)buf = 138413826;
      id v65 = v54;
      __int16 v66 = 2112;
      id v67 = v55;
      __int16 v68 = 2112;
      id v69 = @"com.apple.routined.authorizedLocation.maintenance";
      __int16 v70 = 2112;
      *(void *)v71 = v56;
      *(_WORD *)&v71[8] = 1026;
      *(_DWORD *)&v71[10] = eraseInstallDatabaseInitializationMaxAttemptCount;
      uint64_t v6 = v57;
      __int16 v72 = 2112;
      __int16 v73 = v59;
      __int16 v74 = 1026;
      int v75 = v57;
      _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_DEFAULT, "%@:%@, Detected change in XPC activity criteria for activity, %@, replacing old criteria, %@, maxAttemptCount, %{public}d, with new criteria, %@, maxAttemptCount, %{public}d.", buf, 0x40u);

      v40 = &OBJC_IVAR___SMReceiverService__attemptedToLoadFromDisk;
    }

    BOOL v60 = 1;
  }
  eraseInstallInitializationXpcCriteria = self->_eraseInstallInitializationXpcCriteria;
  self->_eraseInstallInitializationXpcCriteria = v34;

  *(Class *)((char *)&self->super.super.super.isa + v40[166]) = (Class)v6;
  return v60;
}

- (void)_setupEraseInstallDatabaseInitializationActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(a2);
    dispatch_time_t v8 = [(RTXPCActivityCriteria *)self->_eraseInstallInitializationXpcCriteria description];
    *(_DWORD *)buf = 138413058;
    float v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    __int16 v17 = 2112;
    float v18 = @"com.apple.routined.authorizedLocation.maintenance";
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, Registering erase-install initialization XPC activity, %@, with criteria, %@", buf, 0x2Au);
  }
  float v9 = objc_alloc_init(RTAuthorizedLocationDatabaseInitializationMetrics);
  [(RTAuthorizedLocationMetrics *)self->_metrics setInitializationMetrics:v9];

  xpcActivityManager = self->_xpcActivityManager;
  eraseInstallInitializationXpcCriteria = self->_eraseInstallInitializationXpcCriteria;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke;
  v12[3] = &unk_1E6B949F0;
  v12[4] = self;
  v12[5] = a2;
  [(RTXPCActivityManager *)xpcActivityManager registerActivityWithIdentifier:@"com.apple.routined.authorizedLocation.eraseInstallInitialization" criteria:eraseInstallInitializationXpcCriteria handler:v12];
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    __int16 v16 = v6;
    __int16 v17 = 2112;
    float v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = @"com.apple.routined.authorizedLocation.eraseInstallInitialization";
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, Begin XPC Activity: %@", buf, 0x20u);
  }
  dispatch_time_t v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_70;
  block[3] = &unk_1E6B921E0;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v10;
  block[4] = v9;
  id v11 = v3;
  dispatch_async(v8, block);
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_70(uint64_t a1)
{
  v47[2] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  ++*(void *)(*(void *)(a1 + 32) + 176);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 104);
  id v5 = [NSNumber numberWithInteger:*(void *)(v3 + 176)];
  [v4 setObject:v5 forKey:@"RTAuthorizedLocationEraseInstallInitActivityAttemptCount"];

  if (![*v2 _loadEraseInstallInitializationXPCCriteriaFromDefaults])
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    id v13 = *(void **)(a1 + 32);
    if (v13[22] >= v13[21])
    {
      __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        float v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(v19 + 176);
        uint64_t v21 = *(void *)(v19 + 168);
        *(_DWORD *)buf = 138413058;
        id v43 = v17;
        __int16 v44 = 2112;
        double v45 = v18;
        __int16 v46 = 1026;
        LODWORD(v47[0]) = v20;
        WORD2(v47[0]) = 1026;
        *(_DWORD *)((char *)v47 + 6) = v21;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ attempt count %{public}d exceeded max retry count %{public}d, disabling erase install initialization.", buf, 0x22u);
      }
      if (!*((unsigned char *)v38 + 24)) {
        goto LABEL_14;
      }
    }
    else
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_72;
      v36[3] = &unk_1E6B94A18;
      uint64_t v14 = *(void *)(a1 + 48);
      v36[5] = &v37;
      v36[6] = v14;
      v36[4] = v13;
      [v13 _runEraseInstallDatabaseInitialization:v36];
      if (!*((unsigned char *)v38 + 24))
      {
LABEL_17:
        _Block_object_dispose(&v37, 8);
        goto LABEL_18;
      }
    }
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v25 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v43 = v24;
      __int16 v44 = 2112;
      double v45 = v25;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ completed successfully, disabling erase install initialization.", buf, 0x16u);
    }
LABEL_14:
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = [*(id *)(*(void *)(a1 + 32) + 152) convertToDictionary];
      *(_DWORD *)buf = 138412290;
      id v43 = v27;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEFAULT, "Metric, eraseInstallInitialization, %@", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 152) submitToCoreAnalytics];
    [*(id *)(*(void *)(a1 + 32) + 152) setInitializationMetrics:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 35) = 0;
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = *(void **)(v28 + 128);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_74;
    v35[3] = &unk_1E6B90CB8;
    uint64_t v30 = *(void *)(a1 + 48);
    v35[4] = v28;
    v35[5] = v30;
    [v29 unregisterActivityWithIdentifier:@"com.apple.routined.authorizedLocation.eraseInstallInitialization" handler:v35];
    [*(id *)(*(void *)(a1 + 32) + 120) setEraseInstallRetroRegistrationStatus:2];
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + 128);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_2;
  v41[3] = &unk_1E6B90CB8;
  uint64_t v8 = *(void *)(a1 + 48);
  v41[4] = v6;
  v41[5] = v8;
  [v7 unregisterActivityWithIdentifier:@"com.apple.routined.authorizedLocation.eraseInstallInitialization" handler:v41];
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    __int16 v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412546;
    id v43 = v11;
    __int16 v44 = 2112;
    double v45 = v12;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@, erase-install initialization XPC activity due to criteria change.", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _setupEraseInstallDatabaseInitializationActivity];
LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v31 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    v34 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    id v43 = v33;
    __int16 v44 = 2112;
    double v45 = v34;
    __int16 v46 = 2112;
    v47[0] = @"com.apple.routined.authorizedLocation.maintenance";
    _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@, End XPC Activity: %@", buf, 0x20u);
  }
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = @"com.apple.routined.authorizedLocation.maintenance";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, unregistered erase-install initialization XPC activity due to criteria change: %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_72(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v10 = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 1024;
    int v15 = a2;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, _runEraseInstallDatabaseInitialization completed status: %d", (uint8_t *)&v10, 0x1Cu);
  }
  if (!a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __79__RTAuthorizedLocationManager__setupEraseInstallDatabaseInitializationActivity__block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = @"com.apple.routined.authorizedLocation.maintenance";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@, unregistered erase-install initialization XPC activity due to successful completion or max-retry limit: %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void)_registerForDeviceUnlockNotification
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(a2);
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked.", (uint8_t *)&v10, 0x16u);
  }
  int v8 = [(RTAuthorizedLocationManager *)self dataProtectionManager];
  uint64_t v9 = +[RTNotification notificationName];
  [v8 addObserver:self selector:sel_onDataProtectionNotification_ name:v9];
}

- (void)onDataProtectionNotification:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTAuthorizedLocationManager_onDataProtectionNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  int v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __60__RTAuthorizedLocationManager_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v13 = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked with notification RTDataProtectionManagerNotificationUnlockedSinceBoot", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(void **)(v9 + 136);
    SEL v11 = +[RTNotification notificationName];
    [v10 removeObserver:v9 fromNotification:v11];

    *(unsigned char *)(*(void *)(a1 + 40) + 33) = 1;
    *(unsigned char *)(*(void *)(a1 + 40) + 35) = [*(id *)(a1 + 40) _isExpeditedSyncAndLearnRequired];
    __int16 v12 = *(unsigned char **)(a1 + 40);
    if (v12[35]) {
      [v12 _setupEraseInstallDatabaseInitializationActivity];
    }
  }
}

- (BOOL)_oneTimeRetroactivelyRegisterAllStoredVisits
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  BOOL v2 = !self->_isUnlockedSinceBoot;
  oslog = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  BOOL v3 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v3)
    {
      v55 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v55);
      uint64_t v57 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v57;
      _os_log_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEFAULT, "%@:%@, device not unlocked since last boot, unable to execute retro-registration.", buf, 0x16u);
    }
    goto LABEL_35;
  }
  if (v3)
  {
    int v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked.", buf, 0x16u);
  }
  oslog = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!oslog)
  {
    if (v8)
    {
      id v65 = (objc_class *)objc_opt_class();
      __int16 v66 = NSStringFromClass(v65);
      id v67 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v67;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trustedTimeNow, not retroactively registering visit logs.", buf, 0x16u);
    }
    oslog = 0;
LABEL_35:
    BOOL v61 = 0;
    goto LABEL_36;
  }
  if (v8)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    SEL v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@, WARNING, attempting to retroactively register all stored visits. This will be run one time after software upgrade.", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v95 = __Block_byref_object_copy__46;
  v96 = __Block_byref_object_dispose__46;
  id v97 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  int v13 = [(RTAuthorizedLocationManager *)self visitLogStore];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke;
  v83[3] = &unk_1E6B90728;
  v85 = buf;
  __int16 v15 = v12;
  v84 = v15;
  [v13 purgeVisitLogsPredating:v14 handler:v83];

  uint64_t v17 = (id *)(*(void *)&buf[8] + 40);
  id v16 = *(id *)(*(void *)&buf[8] + 40);
  dsema = v15;
  float v18 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v19 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v19))
  {
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
    [v20 timeIntervalSinceDate:v18];
    double v22 = v21;
    uint64_t v23 = objc_opt_new();
    id v24 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
    __int16 v25 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v26 = [v25 filteredArrayUsingPredicate:v24];
    __int16 v27 = [v26 firstObject];

    [v23 submitToCoreAnalytics:v27 type:1 duration:v22];
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v86 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v86, 2u);
    }

    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v90 = *MEMORY[0x1E4F28568];
    *(void *)v86 = @"semaphore wait timeout";
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v90 count:1];
    v31 = [v29 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v30];

    if (v31)
    {
      id v16 = v31;
    }
  }

  objc_storeStrong(v17, v16);
  [(RTAuthorizedLocationManager *)self _updateMostRecentDateAtWhichDeviceDataIsTrusted];
  [oslog timeIntervalSinceDate:self->_mostRecentDateAtWhichDeviceDataIsTrusted];
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 0;
  uint64_t v76 = (uint64_t)(v32 / 86400.0);
  if (v76 < 0) {
    goto LABEL_27;
  }
  double v33 = v32 + (double)(uint64_t)(v32 / 86400.0) * 86400.0;
  uint64_t v70 = *MEMORY[0x1E4F5CFE8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  do
  {
    *(void *)v86 = 0;
    *(void *)&v86[8] = v86;
    *(void *)&v86[16] = 0x3032000000;
    v87 = __Block_byref_object_copy__46;
    v88 = __Block_byref_object_dispose__46;
    id v89 = 0;
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:oslog sinceDate:-(v33 + (double)v76 * 86400.0 + 3600.0)];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke_2;
    v77[3] = &unk_1E6B94A40;
    v80 = v86;
    v77[4] = self;
    v81 = &v90;
    SEL v82 = a2;
    id v36 = v35;
    id v78 = v36;
    uint64_t v37 = v34;
    v79 = v37;
    [(RTAuthorizedLocationManager *)self _updateVisitLogWithTrustedTime:v36 isRetroRegistrationTime:1 handler:v77];
    v38 = (id *)(*(void *)&v86[8] + 40);
    id v39 = *(id *)(*(void *)&v86[8] + 40);
    char v40 = v37;
    double v41 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v42 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v40, v42))
    {
      int v75 = [MEMORY[0x1E4F1C9C8] now];
      [v75 timeIntervalSinceDate:v41];
      double v44 = v43;
      double v45 = objc_opt_new();
      __int16 v46 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
      uint64_t v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v48 = [v47 filteredArrayUsingPredicate:v46];
      uint64_t v49 = [v48 firstObject];

      [v45 submitToCoreAnalytics:v49 type:1 duration:v44];
      uint64_t v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v99 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v99, 2u);
      }

      BOOL v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v98 = v71;
      *(void *)v99 = @"semaphore wait timeout";
      uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
      v53 = [v51 errorWithDomain:v70 code:15 userInfo:v52];

      if (v53)
      {
        id v39 = v53;
      }
    }

    objc_storeStrong(v38, v39);
    _Block_object_dispose(v86, 8);
  }
  while (v76-- > 0);
  if (!v91[3])
  {
LABEL_27:
    BOOL v60 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      id v64 = NSStringFromSelector(a2);
      *(_DWORD *)v86 = 138412546;
      *(void *)&v86[4] = v63;
      *(_WORD *)&v86[12] = 2112;
      *(void *)&v86[14] = v64;
      _os_log_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to register any visits, will try again, not disabling visit retro-registration for next launch.", v86, 0x16u);
    }
    BOOL v61 = 0;
  }
  else
  {
    id v58 = [(RTAuthorizedLocationMetrics *)self->_metrics initializationMetrics];

    if (!v58)
    {
      BOOL v61 = 1;
      goto LABEL_31;
    }
    uint64_t v59 = v91[3];
    BOOL v60 = [(RTAuthorizedLocationMetrics *)self->_metrics initializationMetrics];
    [v60 setNumberOfVisitsRegisteredDuringEraseInstallInitialization:v59];
    BOOL v61 = 1;
  }

LABEL_31:
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(buf, 8);
LABEL_36:

  return v61;
}

void __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __75__RTAuthorizedLocationManager__oneTimeRetroactivelyRegisterAllStoredVisits__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v18 = 138412802;
      dispatch_time_t v19 = v9;
      __int16 v20 = 2112;
      double v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      dispatch_semaphore_t v12 = "%@:%@, error retroactively registering visits %@.";
LABEL_9:
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    BOOL v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v13)
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v9 = NSStringFromClass(v14);
        int v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
        uint64_t v15 = *(void *)(a1 + 40);
        int v18 = 138412802;
        dispatch_time_t v19 = v9;
        __int16 v20 = 2112;
        double v21 = v10;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        dispatch_semaphore_t v12 = "%@:%@, successfully registered visits with registrationDate: %@";
        goto LABEL_9;
      }
    }
    else if (v13)
    {
      id v16 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v16);
      int v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138412802;
      dispatch_time_t v19 = v9;
      __int16 v20 = 2112;
      double v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      dispatch_semaphore_t v12 = "%@:%@, no visits to register for registrationDate: %@";
      goto LABEL_9;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)trustedTimeNow
{
  if (self->_relaxTrustedTimeRequirement)
  {
    BOOL v2 = [MEMORY[0x1E4F1C9C8] now];
  }
  else if (self->_allowUnsecureTimeFallback)
  {
    BOOL v2 = [(RTTrustedTimeCache *)self->_trustedTimeCache getApproximateTrustedDateNowWithUnsecureFallback];
  }
  else if (self->_forceTrustedTimeUnavailability)
  {
    BOOL v2 = 0;
  }
  else
  {
    BOOL v2 = [(RTTrustedTimeCache *)self->_trustedTimeCache getApproximateTrustedDateNow];
  }

  return v2;
}

- (void)_updateReferenceTimeBoundsFromVisitLog
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  double v33 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v5 = [v3 initWithTimeInterval:v4 sinceDate:-120.0];

  uint64_t v30 = (void *)v5;
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v33 endDate:v5];
  double v32 = [[RTAuthorizedLocationVisitLogFetchOptions alloc] initWithAscending:0 dateInterval:v31 limit:&unk_1F3450CC0];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__46;
  uint64_t v50 = __Block_byref_object_dispose__46;
  id v51 = 0;
  uint64_t v40 = 0;
  double v41 = &v40;
  uint64_t v42 = 0x3032000000;
  double v43 = __Block_byref_object_copy__46;
  double v44 = __Block_byref_object_dispose__46;
  id v45 = 0;
  id v7 = [(RTAuthorizedLocationManager *)self visitLogStore];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__RTAuthorizedLocationManager__updateReferenceTimeBoundsFromVisitLog__block_invoke;
  v35[3] = &unk_1E6B94018;
  uint64_t v37 = &v46;
  v38 = &v40;
  v35[4] = self;
  SEL v39 = a2;
  BOOL v8 = v6;
  id v36 = v8;
  [v7 fetchVisitLogsWithOptions:v32 handler:v35];

  uint64_t v9 = (id *)(v47 + 5);
  id v10 = (id)v47[5];
  uint64_t v11 = v8;
  dispatch_semaphore_t v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v11, v13))
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;
    uint64_t v17 = objc_opt_new();
    int v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
    dispatch_time_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v20 = [v19 filteredArrayUsingPredicate:v18];
    double v21 = [v20 firstObject];

    [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v52 count:1];
    __int16 v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

    if (v25)
    {
      id v10 = v25;
    }
  }

  objc_storeStrong(v9, v10);
  uint64_t v26 = (void *)v41[5];
  if (v26)
  {
    id v27 = v26;
    id v28 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v29 = (void *)[v28 initWithTimeInterval:v41[5] sinceDate:259200.0];
    [(RTTrustedTimeCache *)self->_trustedTimeCache setBoundsForReferenceTimeWithMinimumDate:v27 maximumDate:v29];
  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __69__RTAuthorizedLocationManager__updateReferenceTimeBoundsFromVisitLog__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (!v6 && [v5 count] == 1)
  {
    id v7 = [v5 firstObject];
    uint64_t v8 = [v7 registrationDate];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      dispatch_semaphore_t v12 = (objc_class *)objc_opt_class();
      dispatch_time_t v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v16 = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      dispatch_time_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@:%@, setting bound from date %@", (uint8_t *)&v16, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (unint64_t)_locationAvailabilityFromCLLocation:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  unsigned int v5 = [v3 integrity];
  int v6 = [v4 type];
  if (v6 == 1)
  {
    unint64_t v7 = 1;
    goto LABEL_10;
  }
  if (v6 == 11 || v6 == 4)
  {
    if (v5 >= *MEMORY[0x1E4F1E758]) {
      unint64_t v7 = 6;
    }
    else {
      unint64_t v7 = 2;
    }
  }
  else
  {
LABEL_8:
    unint64_t v7 = 0;
  }
LABEL_10:

  return v7;
}

- (unint64_t)_computeLocationTechnologyAvailabilityForDateInterval:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v53 = v3;
  if (!v3)
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      double v44 = (objc_class *)objc_opt_class();
      id v45 = NSStringFromClass(v44);
      uint64_t v46 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v46;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v73) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEBUG, "%@:%@, skipping nil dateInterval, locationTechnologyAvailability, %{public}08x.", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  id v4 = v3;
  [v3 duration];
  if (v5 < 7200.0)
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      __int16 v73 = v53;
      LOWORD(v74) = 1026;
      *(_DWORD *)((char *)&v74 + 2) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEBUG, "%@:%@, skipping short dateInterval %@, locationTechnologyAvailability, %{public}08x.", buf, 0x26u);
    }
LABEL_7:
    unint64_t v9 = 0;
    goto LABEL_27;
  }
  v55 = [v4 startDate];
  unint64_t v9 = 0;
  oslog = 0;
  uint64_t v48 = *MEMORY[0x1E4F5CFE8];
  uint64_t v49 = *MEMORY[0x1E4F28568];
  do
  {
    id v10 = oslog;
    oslog = v55;

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:oslog sinceDate:1800.0];
    dispatch_semaphore_t v12 = [v53 endDate];
    v55 = [v11 earlierDate:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F5CF40]);
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:oslog endDate:v55];
    uint64_t v54 = (void *)[v13 initWithDateInterval:v14 horizontalAccuracy:0 batchSize:0 boundingBoxLocation:100.0];

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v73 = __Block_byref_object_copy__46;
    __int16 v74 = __Block_byref_object_dispose__46;
    id v75 = 0;
    uint64_t v65 = 0;
    __int16 v66 = &v65;
    uint64_t v67 = 0x3032000000;
    __int16 v68 = __Block_byref_object_copy__46;
    id v69 = __Block_byref_object_dispose__46;
    id v70 = 0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    int v16 = [(RTAuthorizedLocationManager *)self locationManager];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __85__RTAuthorizedLocationManager__computeLocationTechnologyAvailabilityForDateInterval___block_invoke;
    v61[3] = &unk_1E6B905F0;
    id v63 = buf;
    id v64 = &v65;
    uint64_t v17 = v15;
    v62 = v17;
    [v16 fetchStoredLocationsWithOptions:v54 handler:v61];

    __int16 v18 = (id *)(*(void *)&buf[8] + 40);
    id v19 = *(id *)(*(void *)&buf[8] + 40);
    __int16 v20 = v17;
    uint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v22 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v20, v22))
    {
      uint64_t v52 = [MEMORY[0x1E4F1C9C8] now];
      [v52 timeIntervalSinceDate:v21];
      double v24 = v23;
      id v51 = objc_opt_new();
      __int16 v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v26 filteredArrayUsingPredicate:v25];
      id v28 = [v27 firstObject];

      [v51 submitToCoreAnalytics:v28 type:1 duration:v24];
      uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
      }

      uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = v49;
      *(void *)v77 = @"semaphore wait timeout";
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
      double v32 = [v30 errorWithDomain:v48 code:15 userInfo:v31];

      if (v32)
      {
        id v19 = v32;
      }
    }

    objc_storeStrong(v18, v19);
    if (v66[5])
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v33 = (id)v66[5];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v71 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v58 != v35) {
              objc_enumerationMutation(v33);
            }
            v9 |= +[RTAuthorizedLocationManager _locationAvailabilityFromCLLocation:*(void *)(*((void *)&v57 + 1) + 8 * i)];
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v71 count:16];
        }
        while (v34);
      }
    }
    _Block_object_dispose(&v65, 8);

    _Block_object_dispose(buf, 8);
    uint64_t v37 = [v53 endDate];
    char v38 = [v55 isBeforeDate:v37];
  }
  while ((v38 & 1) != 0);
  SEL v39 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = (objc_class *)objc_opt_class();
    double v41 = NSStringFromClass(v40);
    uint64_t v42 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v41;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    __int16 v73 = v53;
    LOWORD(v74) = 1026;
    *(_DWORD *)((char *)&v74 + 2) = v9;
    _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_DEFAULT, "%@:%@, dateInterval %@, locationTechnologyAvailability, %{public}08x.", buf, 0x26u);
  }
LABEL_27:

  return v9;
}

void __85__RTAuthorizedLocationManager__computeLocationTechnologyAvailabilityForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)_computeLocationTechnologyExpectationFromHistoricalAvailability:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 0xA)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    unint64_t v5 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v5)
    {
      unsigned int v7 = 0;
      uint64_t v8 = *(void *)v20;
      double v9 = 0.0;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) unsignedIntegerValue:v19];
          if (v12)
          {
            ++v7;
            if (v12) {
              double v13 = 1.0;
            }
            else {
              double v13 = 0.0;
            }
            double v10 = v10 + v13;
            if ((v12 & 4) != 0) {
              double v14 = 1.0;
            }
            else {
              double v14 = 0.0;
            }
            double v9 = v9 + v14;
          }
        }
        unint64_t v5 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v5);

      if (!v7) {
        goto LABEL_2;
      }
      unint64_t v5 = (v10 / (double)v7 > 0.8) | (4 * (v9 / (double)v7 > 0.8)) | 2;
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_semaphore_t v15 = (objc_class *)objc_opt_class();
        int v16 = NSStringFromClass(v15);
        uint64_t v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        double v24 = v16;
        __int16 v25 = 2112;
        uint64_t v26 = v17;
        __int16 v27 = 1026;
        int v28 = (v10 / (double)v7 > 0.8) | (4 * (v9 / (double)v7 > 0.8)) | 2;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, technology expectation bitset %{public}08x.", buf, 0x1Cu);
      }
    }

    goto LABEL_22;
  }
LABEL_2:
  unint64_t v5 = 0;
LABEL_22:

  return v5;
}

- (void)_updateVisitLogWithTrustedTime:(id)a3 isRetroRegistrationTime:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v144 = (void (**)(id, void, uint64_t))a5;
  if (!v144)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTAuthorizedLocationManager _updateVisitLogWithTrustedTime:isRetroRegistrationTime:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 850;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v145 = v7;
  if (v7)
  {
    double v9 = [MEMORY[0x1E4F1CA48] array];
    v142 = (uint64_t (*)(uint64_t, uint64_t))[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v7 sinceDate:-2592000.0];
    id v143 = v7;
    v140 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v142 endDate:v143];
    v139 = [[RTAuthorizedLocationVisitLogFetchOptions alloc] initWithAscending:1 dateInterval:v140 limit:0];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    uint64_t v192 = 0;
    v193 = &v192;
    uint64_t v194 = 0x3032000000;
    v195 = __Block_byref_object_copy__46;
    v196 = __Block_byref_object_dispose__46;
    id v197 = 0;
    uint64_t v11 = [(RTAuthorizedLocationManager *)self visitLogStore];
    v188[0] = MEMORY[0x1E4F143A8];
    v188[1] = 3221225472;
    v188[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke;
    v188[3] = &unk_1E6B94A68;
    v191 = &v192;
    id v158 = v9;
    id v189 = v158;
    uint64_t v12 = v10;
    v190 = v12;
    [v11 fetchVisitLogsWithOptions:v139 handler:v188];

    double v13 = (id *)(v193 + 5);
    id v14 = (id)v193[5];
    dsema = v12;
    dispatch_semaphore_t v15 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v16 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v16))
    {
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
      [v17 timeIntervalSinceDate:v15];
      double v19 = v18;
      long long v20 = objc_opt_new();
      long long v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
      long long v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v23 = [v22 filteredArrayUsingPredicate:v21];
      double v24 = [v23 firstObject];

      [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
      __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v203 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v203 count:1];
      int v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

      if (v28)
      {
        id v14 = v28;
      }
    }

    objc_storeStrong(v13, v14);
    if (v193[5])
    {
      uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v130 = (objc_class *)objc_opt_class();
        NSStringFromClass(v130);
        id v131 = (id)objc_claimAutoreleasedReturnValue();
        v132 = NSStringFromSelector(a2);
        v133 = (uint64_t (*)(uint64_t, uint64_t))v193[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v131;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v132;
        *(_WORD *)&buf[22] = 2112;
        v201 = v133;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch visit logs: %@.", buf, 0x20u);
      }
      v144[2](v144, 0, v193[5]);
    }
    else
    {
      uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = [v158 count];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v37;
        *(_WORD *)&buf[22] = 2050;
        v201 = (uint64_t (*)(uint64_t, uint64_t))v38;
        *(_WORD *)v202 = 2112;
        *(void *)&v202[2] = v140;
        _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld visit logs for interval: %@.", buf, 0x2Au);
      }
      uint64_t v203 = 0;
      v204 = &v203;
      uint64_t v205 = 0x3032000000;
      v206 = __Block_byref_object_copy__46;
      v207 = __Block_byref_object_dispose__46;
      id v208 = 0;
      uint64_t v182 = 0;
      v183 = &v182;
      uint64_t v184 = 0x3032000000;
      v185 = __Block_byref_object_copy__46;
      v186 = __Block_byref_object_dispose__46;
      id v187 = 0;
      dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
      uint64_t v40 = [(RTAuthorizedLocationManager *)self learnedLocationManager];
      v178[0] = MEMORY[0x1E4F143A8];
      v178[1] = 3221225472;
      v178[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_84;
      v178[3] = &unk_1E6B905F0;
      v180 = &v203;
      v181 = &v182;
      double v41 = v39;
      v179 = v41;
      [v40 fetchLocationsOfInterestVisitedBetweenStartDate:v142 endDate:v143 handler:v178];

      uint64_t v42 = (id *)(v204 + 5);
      id v43 = (id)v204[5];
      v138 = v41;
      double v44 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v45 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v138, v45))
      {
        uint64_t v46 = [MEMORY[0x1E4F1C9C8] now];
        [v46 timeIntervalSinceDate:v44];
        double v48 = v47;
        uint64_t v49 = objc_opt_new();
        uint64_t v50 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
        id v51 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v52 = [v51 filteredArrayUsingPredicate:v50];
        v53 = [v52 firstObject];

        [v49 submitToCoreAnalytics:v53 type:1 duration:v48];
        uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v55 = (void *)MEMORY[0x1E4F28C58];
        *(void *)v210 = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v210 count:1];
        long long v57 = [v55 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v56];

        if (v57)
        {
          id v43 = v57;
        }
      }

      objc_storeStrong(v42, v43);
      if (v204[5])
      {
        long long v58 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v134 = (objc_class *)objc_opt_class();
          NSStringFromClass(v134);
          id v135 = (id)objc_claimAutoreleasedReturnValue();
          v136 = NSStringFromSelector(a2);
          v137 = (uint64_t (*)(uint64_t, uint64_t))v204[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v135;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v136;
          *(_WORD *)&buf[22] = 2112;
          v201 = v137;
          _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch historical locations of interest: %@.", buf, 0x20u);
        }
        v144[2](v144, 0, v204[5]);
      }
      else
      {
        long long v59 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          long long v60 = (objc_class *)objc_opt_class();
          NSStringFromClass(v60);
          id v61 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v62 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v63 = [(id)v183[5] count];
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v61;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v62;
          *(_WORD *)&buf[22] = 2050;
          v201 = (uint64_t (*)(uint64_t, uint64_t))v63;
          *(_WORD *)v202 = 2112;
          *(void *)&v202[2] = v142;
          *(_WORD *)&v202[10] = 2112;
          *(void *)&v202[12] = v143;
          _os_log_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld historical locations of interest between %@ and %@.", buf, 0x34u);
        }
        id v64 = [(RTTrustedTimeCache *)self->_trustedTimeCache getApproximateTrustedDateNow];
        BOOL v65 = v64 != 0;

        v152 = +[RTAuthorizedLocationVisitLog encodeTimeSourceWithValue:v143 isTrusted:v65 isRetroRegistration:v6];
        long long v176 = 0u;
        long long v177 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        obuint64_t j = (id)v183[5];
        uint64_t v147 = [obj countByEnumeratingWithState:&v174 objects:v199 count:16];
        if (v147)
        {
          uint64_t v157 = 0;
          uint64_t v146 = *(void *)v175;
          uint64_t v150 = *MEMORY[0x1E4F5CFE8];
          uint64_t v151 = *MEMORY[0x1E4F28568];
          do
          {
            for (uint64_t i = 0; i != v147; ++i)
            {
              if (*(void *)v175 != v146) {
                objc_enumerationMutation(obj);
              }
              __int16 v66 = *(void **)(*((void *)&v174 + 1) + 8 * i);
              long long v170 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v173 = 0u;
              uint64_t v67 = [v66 visits];
              uint64_t v68 = [v67 countByEnumeratingWithState:&v170 objects:v198 count:16];
              if (v68)
              {
                uint64_t v159 = *(void *)v171;
                id v153 = v67;
                do
                {
                  uint64_t v160 = v68;
                  for (uint64_t j = 0; j != v160; ++j)
                  {
                    if (*(void *)v171 != v159) {
                      objc_enumerationMutation(v153);
                    }
                    id v70 = *(void **)(*((void *)&v170 + 1) + 8 * j);
                    uint64_t v71 = [v70 identifier];
                    char v72 = [v158 containsObject:v71];

                    if (v72)
                    {
                      __int16 v73 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                      {
                        __int16 v74 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v74);
                        id v75 = (id)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        id v76 = (id)objc_claimAutoreleasedReturnValue();
                        v77 = [v70 identifier];
                        *(_DWORD *)buf = 138412802;
                        *(void *)&uint8_t buf[4] = v75;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v76;
                        *(_WORD *)&buf[22] = 2112;
                        v201 = v77;
                        _os_log_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_DEFAULT, "%@:%@, visit already registered: %@", buf, 0x20u);
                      }
                    }
                    else
                    {
                      uint64_t v78 = [v70 entryDate];
                      if (v78)
                      {
                        v79 = [v70 exitDate];
                        BOOL v80 = v79 == 0;

                        if (v80)
                        {
                          uint64_t v78 = 0;
                        }
                        else
                        {
                          id v81 = objc_alloc(MEMORY[0x1E4F28C18]);
                          SEL v82 = [v70 entryDate];
                          v83 = [v70 exitDate];
                          v84 = (void *)[v81 initWithStartDate:v82 endDate:v83];

                          uint64_t v78 = [(RTAuthorizedLocationManager *)self _computeLocationTechnologyAvailabilityForDateInterval:v84];
                        }
                      }
                      v85 = [RTAuthorizedLocationVisitLog alloc];
                      v86 = [v70 identifier];
                      v87 = [(RTAuthorizedLocationVisitLog *)v85 initWithVisitIdentifier:v86 registrationDate:v152 locationTechnologyAvailability:v78];

                      dispatch_semaphore_t v88 = dispatch_semaphore_create(0);
                      *(void *)buf = 0;
                      *(void *)&uint8_t buf[8] = buf;
                      *(void *)&uint8_t buf[16] = 0x3032000000;
                      v201 = __Block_byref_object_copy__46;
                      *(void *)v202 = __Block_byref_object_dispose__46;
                      *(void *)&v202[8] = 0;
                      id v89 = [(RTAuthorizedLocationManager *)self visitLogStore];
                      v165[0] = MEMORY[0x1E4F143A8];
                      v165[1] = 3221225472;
                      v165[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_86;
                      v165[3] = &unk_1E6B937E8;
                      v168 = buf;
                      v165[4] = self;
                      SEL v169 = a2;
                      __int16 v73 = v87;
                      v166 = v73;
                      uint64_t v90 = v88;
                      v167 = v90;
                      [v89 storeVisitLog:v73 handler:v165];

                      v91 = (id *)(*(void *)&buf[8] + 40);
                      id v92 = *(id *)(*(void *)&buf[8] + 40);
                      uint64_t v93 = v90;
                      v94 = [MEMORY[0x1E4F1C9C8] now];
                      dispatch_time_t v95 = dispatch_time(0, 3600000000000);
                      if (dispatch_semaphore_wait(v93, v95))
                      {
                        v156 = [MEMORY[0x1E4F1C9C8] now];
                        [v156 timeIntervalSinceDate:v94];
                        double v97 = v96;
                        v155 = objc_opt_new();
                        uint64_t v98 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
                        v99 = [MEMORY[0x1E4F29060] callStackSymbols];
                        uint64_t v100 = [v99 filteredArrayUsingPredicate:v98];
                        v101 = [v100 firstObject];

                        [v155 submitToCoreAnalytics:v101 type:1 duration:v97];
                        v102 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
                        {
                          *(_WORD *)v210 = 0;
                          _os_log_fault_impl(&dword_1D9BFA000, v102, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v210, 2u);
                        }

                        v103 = (void *)MEMORY[0x1E4F28C58];
                        uint64_t v209 = v151;
                        *(void *)v210 = @"semaphore wait timeout";
                        v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v210 forKeys:&v209 count:1];
                        v105 = [v103 errorWithDomain:v150 code:15 userInfo:v104];

                        if (v105)
                        {
                          id v92 = v105;
                        }
                      }

                      objc_storeStrong(v91, v92);
                      _Block_object_dispose(buf, 8);

                      ++v157;
                    }
                  }
                  uint64_t v67 = v153;
                  uint64_t v68 = [v153 countByEnumeratingWithState:&v170 objects:v198 count:16];
                }
                while (v68);
              }
            }
            uint64_t v147 = [obj countByEnumeratingWithState:&v174 objects:v199 count:16];
          }
          while (v147);
        }
        else
        {
          uint64_t v157 = 0;
        }

        v106 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          v107 = (objc_class *)objc_opt_class();
          NSStringFromClass(v107);
          id v108 = (id)objc_claimAutoreleasedReturnValue();
          v109 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v108;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v109;
          *(_WORD *)&buf[22] = 2112;
          v201 = v142;
          _os_log_impl(&dword_1D9BFA000, v106, OS_LOG_TYPE_DEFAULT, "%@:%@, purging visit logs predating: %@", buf, 0x20u);
        }
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v201 = __Block_byref_object_copy__46;
        *(void *)v202 = __Block_byref_object_dispose__46;
        *(void *)&v202[8] = 0;
        dispatch_semaphore_t v110 = dispatch_semaphore_create(0);
        v111 = [(RTAuthorizedLocationManager *)self visitLogStore];
        v162[0] = MEMORY[0x1E4F143A8];
        v162[1] = 3221225472;
        v162[2] = __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_87;
        v162[3] = &unk_1E6B90728;
        v164 = buf;
        v112 = v110;
        v163 = v112;
        [v111 purgeVisitLogsPredating:v142 handler:v162];

        v113 = (id *)(*(void *)&buf[8] + 40);
        id v114 = *(id *)(*(void *)&buf[8] + 40);
        v115 = v112;
        v116 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v117 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v115, v117))
        {
          v118 = [MEMORY[0x1E4F1C9C8] now];
          [v118 timeIntervalSinceDate:v116];
          double v120 = v119;
          v121 = objc_opt_new();
          v122 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
          v123 = [MEMORY[0x1E4F29060] callStackSymbols];
          v124 = [v123 filteredArrayUsingPredicate:v122];
          v125 = [v124 firstObject];

          [v121 submitToCoreAnalytics:v125 type:1 duration:v120];
          v126 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v210 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v126, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v210, 2u);
          }

          v127 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v209 = *MEMORY[0x1E4F28568];
          *(void *)v210 = @"semaphore wait timeout";
          v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v210 forKeys:&v209 count:1];
          v129 = [v127 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v128];

          if (v129)
          {
            id v114 = v129;
          }
        }

        objc_storeStrong(v113, v114);
        v144[2](v144, v157, *(void *)(*(void *)&buf[8] + 40));

        _Block_object_dispose(buf, 8);
      }

      _Block_object_dispose(&v182, 8);
      _Block_object_dispose(&v203, 8);
    }
    _Block_object_dispose(&v192, 8);
  }
  else
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (objc_class *)objc_opt_class();
      double v32 = NSStringFromClass(v31);
      id v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEFAULT, "%@:%@, nil trusted time, not updating visit logs.", buf, 0x16u);
    }
    v144[2](v144, 0, 0);
  }
}

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (!v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(a1 + 32);
          double v13 = [[*(id *)(*((void *)&v14 + 1) + 8 * v11) visitIdentifier:v14];
          [v12 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_84(uint64_t a1, void *a2, void *a3)
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

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      double v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, registered visit: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __94__RTAuthorizedLocationManager__updateVisitLogWithTrustedTime_isRetroRegistrationTime_handler___block_invoke_87(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_curateAuthorizedLocationsWithHandler:(id)a3
{
  uint64_t v379 = *MEMORY[0x1E4F143B8];
  v272 = (void (**)(id, id))a3;
  if (!v272)
  {
    id v4 = self;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTAuthorizedLocationManager _curateAuthorizedLocationsWithHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 965;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    self = v4;
  }
  v299 = self;
  uint64_t v6 = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  v293 = v6;
  if (v6)
  {
    [v6 timeIntervalSinceDate:self->_dateOfLastAuthorizedLocationsCuration];
    double v8 = v7;
    if (v7 > 86400.0)
    {
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2050;
        *(double *)v367 = v8;
        *(_WORD *)&v367[8] = 2050;
        *(void *)&v367[10] = 0x40F5180000000000;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: time since last authorized location curation %{public}.0f seconds, greater than threshold %{public}.0f seconds. Clearing authorized location list.", buf, 0x2Au);
      }
      uint64_t v13 = [MEMORY[0x1E4F1C978] array];
      authorizedLocationArr = v299->_authorizedLocationArr;
      v299->_authorizedLocationArr = (NSArray *)v13;

LABEL_14:
      uint64_t v19 = objc_alloc_init(RTAuthorizedLocationCurationMetrics);
      [(RTAuthorizedLocationMetrics *)v299->_metrics setCurationMetrics:v19];

      [(RTAuthorizedLocationManager *)v299 _updateReferenceTimeBoundsFromVisitLog];
      v270 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v293 sinceDate:-2592000.0];
      v269 = v299->_mostRecentDateAtWhichDeviceDataIsTrusted;
      v283 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v270 endDate:v269];
      uint64_t v348 = 0;
      v349 = &v348;
      uint64_t v350 = 0x3032000000;
      v351 = __Block_byref_object_copy__46;
      v352 = __Block_byref_object_dispose__46;
      id v353 = 0;
      uint64_t v342 = 0;
      v343 = &v342;
      uint64_t v344 = 0x3032000000;
      v345 = __Block_byref_object_copy__46;
      v346 = __Block_byref_object_dispose__46;
      id v347 = 0;
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      long long v21 = [(RTAuthorizedLocationManager *)v299 learnedLocationManager];
      v338[0] = MEMORY[0x1E4F143A8];
      v338[1] = 3221225472;
      v338[2] = __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke;
      v338[3] = &unk_1E6B905F0;
      v340 = &v348;
      v341 = &v342;
      long long v22 = v20;
      v339 = v22;
      [v21 fetchLocationsOfInterestVisitedBetweenStartDate:v270 endDate:v269 handler:v338];

      double v23 = (id *)(v349 + 5);
      id v24 = (id)v349[5];
      dsema = v22;
      __int16 v25 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v26 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(dsema, v26))
      {
        __int16 v27 = [MEMORY[0x1E4F1C9C8] now];
        [v27 timeIntervalSinceDate:v25];
        double v29 = v28;
        uint64_t v30 = objc_opt_new();
        v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
        double v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v33 = [v32 filteredArrayUsingPredicate:v31];
        uint64_t v34 = [v33 firstObject];

        [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
        uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        id v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v371 = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v371 count:1];
        uint64_t v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

        if (v38)
        {
          id v24 = v38;
        }
      }

      objc_storeStrong(v23, v24);
      if (v349[5])
      {
        dispatch_semaphore_t v39 = (void *)v343[5];
        v343[5] = 0;

        id v40 = (id)v349[5];
        double v41 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v223 = (objc_class *)objc_opt_class();
          NSStringFromClass(v223);
          id v224 = (id)objc_claimAutoreleasedReturnValue();
          v225 = NSStringFromSelector(a2);
          uint64_t v226 = v349[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v224;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v225;
          *(_WORD *)&buf[22] = 2112;
          *(void *)v367 = v226;
          _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch historical locations of interest: %@.", buf, 0x20u);
        }
        v272[2](v272, v40);
LABEL_160:

        _Block_object_dispose(&v342, 8);
        _Block_object_dispose(&v348, 8);

        goto LABEL_161;
      }
      uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v46 = [(id)v343[5] count];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2050;
        *(void *)v367 = v46;
        *(_WORD *)&v367[8] = 2112;
        *(void *)&v367[10] = v270;
        *(_WORD *)&v367[18] = 2112;
        *(void *)&v367[20] = v269;
        _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld historical locations of interest between %@ and %@.", buf, 0x34u);
      }
      double v47 = [MEMORY[0x1E4F1CA60] dictionary];
      double v48 = [MEMORY[0x1E4F1CA48] array];
      v266 = [[RTAuthorizedLocationVisitLogFetchOptions alloc] initWithAscending:1 dateInterval:v283 limit:0];
      dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
      uint64_t v371 = 0;
      v372 = &v371;
      uint64_t v373 = 0x3032000000;
      v374 = __Block_byref_object_copy__46;
      v375 = __Block_byref_object_dispose__46;
      id v376 = 0;
      uint64_t v50 = [(RTAuthorizedLocationManager *)v299 visitLogStore];
      v333[0] = MEMORY[0x1E4F143A8];
      v333[1] = 3221225472;
      v333[2] = __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_91;
      v333[3] = &unk_1E6B90750;
      v337 = &v371;
      id v295 = v47;
      id v334 = v295;
      id v51 = v48;
      id v335 = v51;
      uint64_t v52 = v49;
      v336 = v52;
      [v50 fetchVisitLogsWithOptions:v266 handler:v333];

      v53 = (id *)(v372 + 5);
      id v54 = (id)v372[5];
      v267 = v52;
      v55 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v56 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v267, v56))
      {
        long long v57 = [MEMORY[0x1E4F1C9C8] now];
        [v57 timeIntervalSinceDate:v55];
        double v59 = v58;
        long long v60 = objc_opt_new();
        id v61 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
        id v62 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v63 = [v62 filteredArrayUsingPredicate:v61];
        id v64 = [v63 firstObject];

        [v60 submitToCoreAnalytics:v64 type:1 duration:v59];
        BOOL v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        __int16 v66 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v355 = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        uint64_t v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v355 count:1];
        uint64_t v68 = [v66 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v67];

        if (v68)
        {
          id v54 = v68;
        }
      }

      objc_storeStrong(v53, v54);
      long long v331 = 0u;
      long long v332 = 0u;
      long long v329 = 0u;
      long long v330 = 0u;
      obuint64_t j = v51;
      uint64_t v69 = [obj countByEnumeratingWithState:&v329 objects:v370 count:16];
      if (v69)
      {
        v285 = 0;
        v286 = 0;
        int v70 = 0;
        int v71 = 0;
        int v287 = 0;
        uint64_t v72 = *(void *)v330;
        do
        {
          for (uint64_t i = 0; i != v69; ++i)
          {
            if (*(void *)v330 != v72) {
              objc_enumerationMutation(obj);
            }
            __int16 v74 = *(void **)(*((void *)&v329 + 1) + 8 * i);
            id v75 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
            int v76 = [v75 ageDaysRegistry];

            if (v76 < 0)
            {
              [v293 timeIntervalSinceDate:v74];
              double v78 = v77;
              v79 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
              LODWORD(v80) = llround(v78 / 86400.0);
              [v79 setAgeDaysRegistry:v80];
            }
            buf[0] = 0;
            LOBYTE(v355) = 0;
            if (+[RTAuthorizedLocationVisitLog decodeTimeSourceWithValue:v74 isRetroRegistration:&v355 isTrusted:buf])
            {
              if (buf[0])
              {
                id v81 = v285;
                if (!v285 || (id v81 = v285, [v285 isOnOrAfter:v74]))
                {
                  id v82 = v74;

                  v285 = v82;
                }
                ++v71;
                v83 = v286;
                if (!v286 || (v83 = v286, [v286 isOnOrBefore:v74]))
                {
                  id v84 = v74;

                  v286 = v84;
                }
              }
              ++v287;
              v70 += v355;
            }
          }
          uint64_t v69 = [obj countByEnumeratingWithState:&v329 objects:v370 count:16];
        }
        while (v69);

        if (v287 < 1) {
          goto LABEL_55;
        }
        v85 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
        *(float *)&double v86 = (float)v71 / (float)v287;
        [v85 setRegistrationUsesBestTimeFraction:v86];
      }
      else
      {
        int v287 = 0;
        int v71 = 0;
        int v70 = 0;
        v285 = 0;
        v286 = 0;
        v85 = obj;
      }

LABEL_55:
      uint64_t v90 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = (objc_class *)objc_opt_class();
        NSStringFromClass(v91);
        id v92 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v93 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v94 = [v295 count];
        dispatch_time_t v95 = [(RTAuthorizedLocationVisitLogFetchOptions *)v266 dateInterval];
        *(_DWORD *)buf = 138413826;
        *(void *)&uint8_t buf[4] = v92;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v93;
        *(_WORD *)&buf[22] = 2050;
        *(void *)v367 = v94;
        *(_WORD *)&v367[8] = 2112;
        *(void *)&v367[10] = v95;
        *(_WORD *)&v367[18] = 1026;
        *(_DWORD *)&v367[20] = v71;
        *(_WORD *)&v367[24] = 1026;
        *(_DWORD *)&v367[26] = v287;
        __int16 v368 = 1026;
        int v369 = v70;
        _os_log_impl(&dword_1D9BFA000, v90, OS_LOG_TYPE_DEFAULT, "%@:%@, found %{public}zu UUIDs in visit log store for interval %@ with %{public}d/%{public}d (%{public}d) sources", buf, 0x3Cu);
      }
      if ([v295 count])
      {
        double v96 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          double v97 = (objc_class *)objc_opt_class();
          NSStringFromClass(v97);
          id v98 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v99 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v100 = [(id)v343[5] count];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v98;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v99;
          *(_WORD *)&buf[22] = 2050;
          *(void *)v367 = v100;
          _os_log_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_DEFAULT, "%@:%@, starting visit curation, processing %{public}lu LOIs", buf, 0x20u);
        }
        id v275 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v327 = 0u;
        long long v328 = 0u;
        long long v325 = 0u;
        long long v326 = 0u;
        id v268 = (id)v343[5];
        uint64_t v101 = [v268 countByEnumeratingWithState:&v325 objects:v365 count:16];
        if (v101)
        {
          int v102 = 0;
          int v103 = 0;
          uint64_t v273 = *(void *)v326;
          uint64_t v274 = v101;
          do
          {
            for (uint64_t j = 0; j != v274; ++j)
            {
              int v277 = v103;
              if (*(void *)v326 != v273) {
                objc_enumerationMutation(v268);
              }
              v279 = *(void **)(*((void *)&v325 + 1) + 8 * j);
              v104 = [v279 visits];
              v105 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:1];
              v364 = v105;
              v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v364 count:1];
              v107 = [v104 sortedArrayUsingDescriptors:v106];

              id v108 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
              {
                v109 = (objc_class *)objc_opt_class();
                NSStringFromClass(v109);
                id v110 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v111 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v112 = [v107 count];
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v110;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v111;
                *(_WORD *)&buf[22] = 2050;
                *(void *)v367 = v112;
                *(_WORD *)&v367[8] = 2112;
                *(void *)&v367[10] = v279;
                _os_log_impl(&dword_1D9BFA000, v108, OS_LOG_TYPE_DEFAULT, "%@:%@, processing %{public}lu visits for LOI %@.", buf, 0x2Au);
              }
              v302 = [MEMORY[0x1E4F1C9C8] distantPast];
              v291 = [MEMORY[0x1E4F1CA48] array];
              int v276 = [v107 count];
              long long v323 = 0u;
              long long v324 = 0u;
              long long v321 = 0u;
              long long v322 = 0u;
              id v290 = v107;
              uint64_t v113 = 0;
              uint64_t v114 = 0;
              uint64_t v115 = 0;
              unint64_t v116 = 0;
              uint64_t v117 = [v290 countByEnumeratingWithState:&v321 objects:v363 count:16];
              if (v117)
              {
                v300 = 0;
                uint64_t v292 = *(void *)v322;
                double v118 = 0.0;
                uint64_t v119 = -1;
                uint64_t v297 = -1;
                do
                {
                  uint64_t v120 = 0;
                  uint64_t v294 = v117;
                  do
                  {
                    if (*(void *)v322 != v292) {
                      objc_enumerationMutation(v290);
                    }
                    v306 = *(void **)(*((void *)&v321 + 1) + 8 * v120);
                    v121 = [v306 entryDate];
                    [v293 timeIntervalSinceDate:v121];
                    double v123 = v122;
                    uint64_t v296 = v120;

                    v124 = [v306 exitDate];
                    v125 = [v306 entryDate];
                    [v124 timeIntervalSinceDate:v125];
                    double v127 = v126;

                    unint64_t v128 = llround(v123 / 86400.0);
                    uint64_t v129 = v297;
                    int64_t v304 = v128;
                    if (v297 < 0) {
                      uint64_t v129 = v128;
                    }
                    uint64_t v297 = v129;
                    v130 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                    BOOL v131 = v304 > (int)[v130 ageDaysFirstAnyLoiVisit];

                    if (v131)
                    {
                      v132 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                      [v132 setAgeDaysFirstAnyLoiVisit:v304];
                    }
                    v133 = [v306 identifier];
                    v134 = [v295 objectForKey:v133];

                    id v135 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                    if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
                    {
                      v136 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v136);
                      id v137 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      id v138 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413314;
                      *(void *)&uint8_t buf[4] = v137;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v138;
                      *(_WORD *)&buf[22] = 1026;
                      *(_DWORD *)v367 = v134 != 0;
                      *(_WORD *)&v367[4] = 2050;
                      *(double *)&v367[6] = v127;
                      *(_WORD *)&v367[14] = 2112;
                      *(void *)&v367[16] = v306;
                      _os_log_impl(&dword_1D9BFA000, v135, OS_LOG_TYPE_INFO, "%@:%@, processing visit, isRegistered, %{public}d, dwell, %{public}.1f: %@", buf, 0x30u);
                    }
                    if (v134)
                    {
                      v139 = [v306 entryDate];
                      v140 = [v139 startOfDay];

                      [v140 timeIntervalSinceDate:v302];
                      if (v141 > 86340.0)
                      {
                        id v142 = v140;

                        ++v116;
                        v302 = v142;
                      }
                      id v143 = [v306 exitDate];
                      v300 = [v143 startOfDay];

                      [v300 timeIntervalSinceDate:v302];
                      double v145 = v144;
                      if (v144 > 86340.0)
                      {
                        id v146 = v300;

                        unint64_t v116 = (unint64_t)(ceil(v145 / 86400.0) + (double)v116);
                        v302 = v146;
                      }
                      if (v119 < 0) {
                        uint64_t v119 = v304;
                      }
                      uint64_t v147 = [v306 identifier];
                      v148 = [v295 objectForKey:v147];

                      v149 = [NSNumber numberWithUnsignedInteger:[v148 locationTechnologyAvailability]];
                      [v291 addObject:v149];

                      if ([v148 locationTechnologyAvailability]) {
                        ++v113;
                      }
                      char v150 = [v148 locationTechnologyAvailability];
                      unint64_t v151 = [v148 locationTechnologyAvailability];

                      double v118 = v118 + v127;
                      ++v102;
                      v114 += v150 & 1;
                      v115 += (v151 >> 2) & 1;
                    }
                    uint64_t v120 = v296 + 1;
                  }
                  while (v294 != v296 + 1);
                  uint64_t v117 = [v290 countByEnumeratingWithState:&v321 objects:v363 count:16];
                }
                while (v117);
              }
              else
              {
                v300 = 0;
                double v118 = 0.0;
                uint64_t v119 = -1;
                uint64_t v297 = -1;
              }

              v152 = [[RTAuthorizedLocation alloc] initWithLoi:v279 dwellTime:v116 numberOfDaysVisited:v297 ageDaysFirstVisit:v119 ageDaysFirstRegisteredVisit:[(RTAuthorizedLocationManager *)v299 _computeLocationTechnologyExpectationFromHistoricalAvailability:v291] locationTechnologyAvailability:v113 visitsWithTechnologyAnnotation:v118 visitsWithGPS:v114 visitsWithWiFiHI:v115];
              [v275 addObject:v152];

              int v103 = v277 + v276;
            }
            uint64_t v274 = [v268 countByEnumeratingWithState:&v325 objects:v365 count:16];
          }
          while (v274);
        }
        else
        {
          int v102 = 0;
          int v103 = 0;
        }

        uint64_t v157 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
        {
          id v158 = (objc_class *)objc_opt_class();
          NSStringFromClass(v158);
          id v159 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v160 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v159;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v160;
          *(_WORD *)&buf[22] = 1026;
          *(_DWORD *)v367 = v102;
          *(_WORD *)&v367[4] = 1026;
          *(_DWORD *)&v367[6] = v103;
          _os_log_impl(&dword_1D9BFA000, v157, OS_LOG_TYPE_DEFAULT, "%@:%@ %{public}d/%{public}d visits registered", buf, 0x22u);
        }
        if (v103 >= 1)
        {
          v161 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
          *(float *)&double v162 = (float)v102 / (float)v103;
          [v161 setVisitRegistrationFraction:v162];
        }
        v163 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"dwellTime_s" ascending:0];
        v362 = v163;
        v164 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v362 count:1];
        [v275 sortUsingDescriptors:v164];

        id v288 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v319 = 0u;
        long long v320 = 0u;
        long long v317 = 0u;
        long long v318 = 0u;
        id v298 = v275;
        uint64_t v303 = [v298 countByEnumeratingWithState:&v317 objects:v361 count:16];
        if (v303)
        {
          uint64_t v278 = 0;
          uint64_t v301 = *(void *)v318;
          uint64_t v280 = *MEMORY[0x1E4F5CFE8];
          uint64_t v282 = *MEMORY[0x1E4F28568];
          do
          {
            for (uint64_t k = 0; k != v303; ++k)
            {
              if (*(void *)v318 != v301) {
                objc_enumerationMutation(v298);
              }
              v165 = *(void **)(*((void *)&v317 + 1) + 8 * k);
              [v165 dwellTime_s];
              if (v166 <= 86400.0
                || [v165 numberOfDaysVisited] < 4
                || (unint64_t)[v288 count] > 3)
              {
                v167 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                {
                  long long v171 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v171);
                  id v172 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v173 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v172;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v173;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v367 = v165;
                  _os_log_impl(&dword_1D9BFA000, v167, OS_LOG_TYPE_DEFAULT, "%@:%@, skipping ALOI, %@.", buf, 0x20u);
                }
              }
              else
              {
                ++v278;
                [v165 setRank:];
                [v288 addObject:v165];
                v167 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                {
                  v168 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v168);
                  id v169 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v170 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v169;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v170;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v367 = v165;
                  _os_log_impl(&dword_1D9BFA000, v167, OS_LOG_TYPE_DEFAULT, "%@:%@, appending ALOI, %@.", buf, 0x20u);
                }
              }

              if ([v165 rank] == 1)
              {
                long long v174 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];

                if (v174)
                {
                  uint64_t v175 = [v165 ageDaysFirstVisit];
                  long long v176 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                  [v176 setAgeDaysFirstTopLoiVisit:v175];

                  uint64_t v177 = [v165 ageDaysFirstRegisteredVisit];
                  v178 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                  [v178 setAgeDaysFirstTopLoiRegisteredVisit:v177];

                  uint64_t v179 = [v165 visitsWithTechnologyAnnotation];
                  v180 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                  [v180 setVisitsToTopLOIWithTechAvailabilityKnown:v179];

                  if ([v165 visitsWithTechnologyAnnotation] >= 1)
                  {
                    uint64_t v181 = [v165 visitsWithGPS];
                    uint64_t v182 = [v165 visitsWithTechnologyAnnotation];
                    v183 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                    *(float *)&double v184 = (float)v181 / (float)v182;
                    [v183 setFractionOfVisitsToTopLOIWithGPS:v184];

                    uint64_t v185 = [v165 visitsWithWiFiHI];
                    uint64_t v186 = [v165 visitsWithTechnologyAnnotation];
                    id v187 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                    *(float *)&double v188 = (float)v185 / (float)v186;
                    [v187 setFractionOfVisitsToTopLOIWithWiFiHI:v188];
                  }
                }
                id v189 = [(RTAuthorizedLocationManager *)v299 learnedLocationManager];
                v190 = [v189 learnedLocationStore];
                v191 = [v165 loi];
                uint64_t v192 = [v191 location];
                v193 = [v192 location];
                v305 = [v190 predicateForVisitsWithinDistance:v193 location:200.0];

                dispatch_semaphore_t v194 = dispatch_semaphore_create(0);
                *(void *)buf = 0;
                *(void *)&uint8_t buf[8] = buf;
                *(void *)&uint8_t buf[16] = 0x3032000000;
                *(void *)v367 = __Block_byref_object_copy__46;
                *(void *)&v367[8] = __Block_byref_object_dispose__46;
                *(void *)&v367[16] = 0;
                uint64_t v355 = 0;
                v356 = &v355;
                uint64_t v357 = 0x3032000000;
                v358 = __Block_byref_object_copy__46;
                v359 = __Block_byref_object_dispose__46;
                id v360 = 0;
                v195 = [(RTAuthorizedLocationManager *)v299 learnedLocationManager];
                v196 = [v195 learnedLocationStore];
                v312[0] = MEMORY[0x1E4F143A8];
                v312[1] = 3221225472;
                v312[2] = __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_100;
                v312[3] = &unk_1E6B94018;
                v314 = buf;
                v312[4] = v299;
                v315 = &v355;
                SEL v316 = a2;
                id v197 = v194;
                v313 = v197;
                [v196 fetchVisitsWithPredicate:v305 ascending:1 dateInterval:v283 limit:&unk_1F3450CC0 handler:v312];

                v198 = (id *)(*(void *)&buf[8] + 40);
                id v199 = *(id *)(*(void *)&buf[8] + 40);
                v200 = v197;
                v201 = [MEMORY[0x1E4F1C9C8] now];
                dispatch_time_t v202 = dispatch_time(0, 3600000000000);
                if (dispatch_semaphore_wait(v200, v202))
                {
                  uint64_t v203 = [MEMORY[0x1E4F1C9C8] now];
                  [v203 timeIntervalSinceDate:v201];
                  double v205 = v204;
                  v206 = objc_opt_new();
                  v207 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
                  id v208 = [MEMORY[0x1E4F29060] callStackSymbols];
                  uint64_t v209 = [v208 filteredArrayUsingPredicate:v207];
                  v210 = [v209 firstObject];

                  [v206 submitToCoreAnalytics:v210 type:1 duration:v205];
                  uint64_t v211 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (os_log_type_enabled(v211, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v378 = 0;
                    _os_log_fault_impl(&dword_1D9BFA000, v211, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v378, 2u);
                  }

                  v212 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v377 = v282;
                  *(void *)v378 = @"semaphore wait timeout";
                  v213 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v378 forKeys:&v377 count:1];
                  v214 = [v212 errorWithDomain:v280 code:15 userInfo:v213];

                  if (v214)
                  {
                    id v199 = v214;
                  }
                }

                objc_storeStrong(v198, v199);
                v215 = (void *)v356[5];
                if (v215)
                {
                  v216 = [v215 entryDate];
                  [v293 timeIntervalSinceDate:v216];
                  double v218 = v217;
                  v219 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
                  LODWORD(v220) = llround(v218 / 86400.0);
                  [v219 setAgeDaysFirstTopLoiGeoVisit:v220];
                }
                _Block_object_dispose(&v355, 8);

                _Block_object_dispose(buf, 8);
              }
            }
            uint64_t v303 = [v298 countByEnumeratingWithState:&v317 objects:v361 count:16];
          }
          while (v303);
        }

        if ([v288 count])
        {
          objc_storeStrong((id *)&v299->_authorizedLocationArr, v288);
          v221 = v293;
          p_super = &v299->_dateOfLastAuthorizedLocationsCuration->super;
          v299->_dateOfLastAuthorizedLocationsCuration = v221;
        }
        else
        {
          p_super = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            v227 = (objc_class *)objc_opt_class();
            NSStringFromClass(v227);
            id v228 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v229 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v230 = [(NSArray *)v299->_authorizedLocationArr count];
            dateOfLastAuthorizedLocationsCuration = v299->_dateOfLastAuthorizedLocationsCuration;
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v228;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v229;
            *(_WORD *)&buf[22] = 2050;
            *(void *)v367 = v230;
            *(_WORD *)&v367[8] = 2112;
            *(void *)&v367[10] = dateOfLastAuthorizedLocationsCuration;
            *(_WORD *)&v367[18] = 2050;
            *(double *)&v367[20] = v8;
            _os_log_impl(&dword_1D9BFA000, p_super, OS_LOG_TYPE_DEFAULT, "%@:%@, zero authorized locations created during current curation, retaining previously generated list of length %{public}lu, creation, %@, age, %{public}.1f.", buf, 0x34u);
          }
        }

        v232 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];

        if (v232)
        {
          v233 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
          [v233 setMaxCumulativeDwellTimeForNotFamiliarLoiHours:0.0];

          v234 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
          [v234 setMaxUniqueVisitDaysForNotFamiliarLois:0];

          unint64_t v235 = [v298 count];
          if (v235 > [(NSArray *)v299->_authorizedLocationArr count])
          {
            v236 = [v298 objectAtIndexedSubscript:-[NSArray count](v299->_authorizedLocationArr, "count")];
            [v236 dwellTime_s];
            double v238 = v237;
            v239 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
            *(float *)&double v240 = v238;
            [v239 setMaxCumulativeDwellTimeForNotFamiliarLoiHours:v240];

            v241 = [v298 objectAtIndexedSubscript:-[NSArray count](v299->_authorizedLocationArr, "count")];
            uint64_t v242 = [v241 numberOfDaysVisited];
            v243 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
            [v243 setMaxUniqueVisitDaysForNotFamiliarLois:v242];
          }
        }
        long long v310 = 0u;
        long long v311 = 0u;
        long long v308 = 0u;
        long long v309 = 0u;
        v244 = v299->_authorizedLocationArr;
        uint64_t v245 = [(NSArray *)v244 countByEnumeratingWithState:&v308 objects:v354 count:16];
        if (v245)
        {
          uint64_t v246 = *(void *)v309;
          do
          {
            for (uint64_t m = 0; m != v245; ++m)
            {
              if (*(void *)v309 != v246) {
                objc_enumerationMutation(v244);
              }
              uint64_t v248 = *(void *)(*((void *)&v308 + 1) + 8 * m);
              v249 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
              {
                v250 = (objc_class *)objc_opt_class();
                NSStringFromClass(v250);
                id v251 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v252 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v251;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v252;
                *(_WORD *)&buf[22] = 2112;
                *(void *)v367 = v248;
                _os_log_impl(&dword_1D9BFA000, v249, OS_LOG_TYPE_DEFAULT, "%@:%@: Ranked Authorized Locations: %@.", buf, 0x20u);
              }
            }
            uint64_t v245 = [(NSArray *)v244 countByEnumeratingWithState:&v308 objects:v354 count:16];
          }
          while (v245);
        }

        BOOL v253 = 0;
        if (v286)
        {
          if (v285)
          {
            [v286 timeIntervalSinceDate:v285];
            BOOL v253 = 0;
            if (v254 > 604800.0 && v287 >= 21)
            {
              v255 = [(RTAuthorizedLocationMetrics *)v299->_metrics curationMetrics];
              [v255 registrationUsesBestTimeFraction];
              BOOL v253 = v256 > 0.999999;
            }
          }
        }
        if (v299->_allowUnsecureTimeFallback == v253)
        {
          v257 = [(RTAuthorizedLocationManager *)v299 visitLogStore];
          int v258 = [v257 setTrustedTimeRecentAvailability:v253];

          if (v258)
          {
            v259 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v259, OS_LOG_TYPE_DEFAULT))
            {
              v260 = (objc_class *)objc_opt_class();
              NSStringFromClass(v260);
              id v261 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v262 = (id)objc_claimAutoreleasedReturnValue();
              v263 = v262;
              BOOL allowUnsecureTimeFallback = v299->_allowUnsecureTimeFallback;
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v261;
              if (allowUnsecureTimeFallback) {
                v265 = "YES";
              }
              else {
                v265 = "NO";
              }
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v262;
              *(_WORD *)&buf[22] = 2082;
              *(void *)v367 = v265;
              _os_log_impl(&dword_1D9BFA000, v259, OS_LOG_TYPE_DEFAULT, "%@:%@ changing allowUnsecureTimeFallback flag to %{public}s", buf, 0x20u);
            }
            v299->_BOOL allowUnsecureTimeFallback = !v253;
          }
        }
        v272[2](v272, 0);
      }
      else
      {
        id v153 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
        {
          v154 = (objc_class *)objc_opt_class();
          NSStringFromClass(v154);
          id v155 = (id)objc_claimAutoreleasedReturnValue();
          v156 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v155;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v156;
          _os_log_impl(&dword_1D9BFA000, v153, OS_LOG_TYPE_DEFAULT, "%@:%@, unable to curate authorized locations with empty visit log.", buf, 0x16u);
        }
        v272[2](v272, 0);
      }

      _Block_object_dispose(&v371, 8);
      id v40 = 0;
      goto LABEL_160;
    }
    if (v7 > 3600.0) {
      goto LABEL_14;
    }
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v87 = (objc_class *)objc_opt_class();
      dispatch_semaphore_t v88 = NSStringFromClass(v87);
      id v89 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v88;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v89;
      *(_WORD *)&buf[22] = 2050;
      *(double *)v367 = v8;
      *(_WORD *)&v367[8] = 2050;
      *(void *)&v367[10] = 0x40AC200000000000;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: time since last authorized location curation %{public}.0f seconds, less than threshold %{public}.0f seconds. Not regenerating authorized location list.", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      double v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now. Not regenerating authorized location list.", buf, 0x16u);
    }
  }

  v272[2](v272, 0);
  id v40 = 0;
LABEL_161:
}

void __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (!v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
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
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = *(void **)(a1 + 32);
          __int16 v14 = [v12 visitIdentifier:v17];
          [v13 setObject:v12 forKey:v14];

          uint64_t v15 = *(void **)(a1 + 40);
          uint64_t v16 = [v12 registrationDate];
          [v15 addObject:v16];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __69__RTAuthorizedLocationManager__curateAuthorizedLocationsWithHandler___block_invoke_100(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && [v5 count] == 1)
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v15 = 138412802;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      long long v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, earliest visit to vicinity of LOI: %@.", (uint8_t *)&v15, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)curateAuthorizedLocationsWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[RTAuthorizedLocationManager curateAuthorizedLocationsWithHandler:]";
      __int16 v12 = 1024;
      int v13 = 1306;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v6 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__RTAuthorizedLocationManager_curateAuthorizedLocationsWithHandler___block_invoke;
  v8[3] = &unk_1E6B90CE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __68__RTAuthorizedLocationManager_curateAuthorizedLocationsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _curateAuthorizedLocationsWithHandler:*(void *)(a1 + 40)];
}

- (BOOL)_assertMotionConsistencyForLocations:(id)a3 positionUncertaintyRate:(double)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 count];
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  id v9 = v8;
  if (v7 <= 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      __int16 v12 = NSStringFromSelector(a2);
      int v41 = 138412546;
      uint64_t v42 = v11;
      __int16 v43 = 2112;
      id v44 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@:%@ invoked with fewer than two locations, returning NO.", (uint8_t *)&v41, 0x16u);
LABEL_9:

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    int v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v6 firstObject];
    __int16 v17 = [v6 lastObject];
    int v41 = 138413058;
    uint64_t v42 = v14;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2112;
    double v46 = *(double *)&v16;
    __int16 v47 = 2112;
    double v48 = *(double *)&v17;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ invoked with two or more locations, start location, %@, end location, %@.", (uint8_t *)&v41, 0x2Au);
  }
  long long v18 = [v6 firstObject];
  __int16 v19 = [v18 timestamp];
  uint64_t v20 = [v6 lastObject];
  uint64_t v21 = [v20 timestamp];
  [v19 timeIntervalSinceDate:v21];
  double v23 = fabs(v22);

  id v24 = [v6 firstObject];
  __int16 v25 = [v6 lastObject];
  [v24 distanceFromLocation:v25];
  double v27 = v26;

  double v28 = [v6 firstObject];
  [v28 horizontalAccuracy];
  double v30 = v29;
  v31 = [v6 lastObject];
  [v31 horizontalAccuracy];
  double v33 = (v30 + v32) * 3.0;

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  BOOL v34 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v27 > v33 + a4 * v23)
  {
    if (v34)
    {
      uint64_t v35 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v35);
      __int16 v12 = NSStringFromSelector(a2);
      int v41 = 138413826;
      uint64_t v42 = v11;
      __int16 v43 = 2112;
      id v44 = v12;
      __int16 v45 = 2050;
      double v46 = v27;
      __int16 v47 = 2050;
      double v48 = v23;
      __int16 v49 = 2050;
      double v50 = v33;
      __int16 v51 = 2050;
      double v52 = a4;
      __int16 v53 = 2050;
      double v54 = v33 + a4 * v23;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ distance, %{public}.1f, duration, %{public}.1f, accuracy, %{public}.1f, position uncertainty rate, %{public}.2f, distance threshold, %{public}.1f, location batch is not consistent.", (uint8_t *)&v41, 0x48u);
      goto LABEL_9;
    }
LABEL_10:
    BOOL v36 = 0;
    goto LABEL_14;
  }
  if (v34)
  {
    id v37 = (objc_class *)objc_opt_class();
    uint64_t v38 = NSStringFromClass(v37);
    dispatch_semaphore_t v39 = NSStringFromSelector(a2);
    int v41 = 138413826;
    uint64_t v42 = v38;
    __int16 v43 = 2112;
    id v44 = v39;
    __int16 v45 = 2050;
    double v46 = v27;
    __int16 v47 = 2050;
    double v48 = v23;
    __int16 v49 = 2050;
    double v50 = v33;
    __int16 v51 = 2050;
    double v52 = a4;
    __int16 v53 = 2050;
    double v54 = v33 + a4 * v23;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ distance, %{public}.1f, duration, %{public}.1f, accuracy, %{public}.1f, position uncertainty rate, %{public}.2f, distance threshold, %{public}.1f, location batch is consistent.", (uint8_t *)&v41, 0x48u);
  }
  BOOL v36 = 1;
LABEL_14:

  return v36;
}

- (double)_positionUncertaintyRateFromMotionActivity:(id)a3 dateInterval:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v55 = v9;
    __int16 v56 = 2112;
    long long v57 = v10;
    __int16 v58 = 2112;
    *(void *)double v59 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@, processing motion activity on date interval %@.", buf, 0x20u);
  }
  if (v5)
  {
    id v11 = [RTMotionActivityHistogram alloc];
    __int16 v12 = [v6 startDate];
    id v46 = v6;
    int v13 = [v6 endDate];
    id v47 = v5;
    uint64_t v14 = [(RTMotionActivityHistogram *)v11 initWithActivites:v5 betweenDate:v12 andDate:v13];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    p_super = &v14->super;
    obuint64_t j = [(RTMotionActivityHistogram *)v14 binsSortedByInterval];
    uint64_t v15 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v51;
      double v18 = 40.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          unint64_t v21 = [v20 type];
          if (v21 > 6) {
            double v22 = 40.0;
          }
          else {
            double v22 = dbl_1DA0FF668[v21];
          }
          [v20 interval];
          double v24 = v23;
          __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            double v26 = (objc_class *)objc_opt_class();
            double v27 = NSStringFromClass(v26);
            double v28 = NSStringFromSelector(a2);
            int v29 = [v20 type];
            [v20 interval];
            *(_DWORD *)buf = 138413314;
            uint64_t v55 = v27;
            __int16 v56 = 2112;
            long long v57 = v28;
            __int16 v58 = 1026;
            *(_DWORD *)double v59 = v29;
            *(_WORD *)&v59[4] = 2048;
            *(void *)&v59[6] = v30;
            __int16 v60 = 2048;
            double v61 = v22;
            _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@, motion activity, %{public}d, cumulative interval %.3f s, position uncertainty rate, %.3f.", buf, 0x30u);
          }
          double v18 = v18 + v22 * v24;
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 40.0;
    }

    v31 = p_super;
    [p_super totalInterval];
    if (v36 <= 0.0)
    {
      uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      double v32 = 2.0;
      id v5 = v47;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v43 = (objc_class *)objc_opt_class();
        id v40 = NSStringFromClass(v43);
        int v41 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v55 = v40;
        __int16 v56 = 2112;
        long long v57 = v41;
        __int16 v58 = 2050;
        *(void *)double v59 = 0x4000000000000000;
        uint64_t v42 = "%@:%@, using default position uncertainty rate, %{public}f mps.";
        goto LABEL_25;
      }
    }
    else
    {
      [p_super totalInterval];
      double v32 = v18 / v37;
      uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      id v5 = v47;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_semaphore_t v39 = (objc_class *)objc_opt_class();
        id v40 = NSStringFromClass(v39);
        int v41 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v55 = v40;
        __int16 v56 = 2112;
        long long v57 = v41;
        __int16 v58 = 2050;
        *(double *)double v59 = v32;
        uint64_t v42 = "%@:%@, using weighted average position uncertainty rate from motion activity, %{public}f mps.";
LABEL_25:
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, v42, buf, 0x20u);
      }
    }

    id v6 = v46;
    goto LABEL_27;
  }
  v31 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  double v32 = 2.0;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    double v33 = (objc_class *)objc_opt_class();
    BOOL v34 = NSStringFromClass(v33);
    uint64_t v35 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v55 = v34;
    __int16 v56 = 2112;
    long long v57 = v35;
    __int16 v58 = 2050;
    *(void *)double v59 = 0x4000000000000000;
    _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@, no motion activity, defaulting to %{public}f mps.", buf, 0x20u);
  }
LABEL_27:

  return v32;
}

- (BOOL)_assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation:(id)a3 visit:(id)a4
{
  v208[1] = *MEMORY[0x1E4F143B8];
  id v152 = a3;
  id v155 = a4;
  v167 = self;
  uint64_t v157 = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  if (!v157)
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = (objc_class *)objc_opt_class();
      double v27 = NSStringFromClass(v26);
      double v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v28;
      _os_log_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now, cannot verify motion and location consistency.", buf, 0x16u);
    }
    BOOL v29 = 0;
    goto LABEL_92;
  }
  id v6 = [v155 entry];

  if (!v6) {
    goto LABEL_10;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  uint64_t v8 = [v155 entry];
  id v9 = (void *)[v7 initWithTimeInterval:v8 sinceDate:300.0];

  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    int v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringFromDate];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v206 = v14;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, setting endTime to currentVisit.entry: %@.", buf, 0x20u);
  }
  if (v9)
  {
    if ([v157 isBeforeDate:v9])
    {
      id v15 = v157;

      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (objc_class *)objc_opt_class();
        double v18 = NSStringFromClass(v17);
        __int16 v19 = NSStringFromSelector(a2);
        uint64_t v20 = [v15 stringFromDate];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v206 = v20;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@, trustedNow is before user-time currentVisit.entry, overriding endTime with trustedNow: %@.", buf, 0x20u);
      }
    }
    else
    {
      id v15 = v9;
    }
  }
  else
  {
LABEL_10:
    unint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      double v24 = NSStringFromSelector(a2);
      __int16 v25 = [0 stringFromDate];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      v206 = v25;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@, currentVisit.entry has no value setting endTime to trustedNow: %@.", buf, 0x20u);
    }
    id v15 = v157;
  }
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v15 sinceDate:-21600.0];
  v156 = v15;
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v156 sinceDate:-5400.0];
  v165 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v156 sinceDate:-1200.0];
  v163 = [v30 laterDate:v167->_mostRecentDateAtWhichDeviceDataIsTrusted];

  unint64_t v151 = [v31 laterDate:v167->_mostRecentDateAtWhichDeviceDataIsTrusted];

  double v32 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    double v33 = (objc_class *)objc_opt_class();
    BOOL v34 = NSStringFromClass(v33);
    uint64_t v35 = NSStringFromSelector(a2);
    double v36 = [v163 stringFromDate];
    double v37 = [v151 stringFromDate];
    uint64_t v38 = [v156 stringFromDate];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v34;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    v206 = v36;
    *(_WORD *)v207 = 2112;
    *(void *)&v207[2] = v37;
    *(_WORD *)&v207[10] = 2112;
    *(void *)&v207[12] = v38;
    _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@, applying check between lookbackStartEpoch %@,  stringentLookbackStartEpoch %@ and endTime %@.", buf, 0x34u);
  }
  uint64_t v162 = 0;
  uint64_t v159 = *MEMORY[0x1E4F5CFE8];
  uint64_t v160 = *MEMORY[0x1E4F28568];
  int v169 = *MEMORY[0x1E4F1E768];
  *(void *)&long long v39 = 138412802;
  long long v150 = v39;
  oslog = v156;
  do
  {
    v168 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v165 endDate:oslog];
    double v166 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v168 horizontalAccuracy:0 batchSize:1 ascending:100.0];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v206 = __Block_byref_object_copy__46;
    *(void *)v207 = __Block_byref_object_dispose__46;
    *(void *)&v207[8] = 0;
    uint64_t v182 = 0;
    v183 = &v182;
    uint64_t v184 = 0x3032000000;
    uint64_t v185 = __Block_byref_object_copy__46;
    uint64_t v186 = __Block_byref_object_dispose__46;
    id v187 = 0;
    dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
    locationManager = v167->_locationManager;
    v178[0] = MEMORY[0x1E4F143A8];
    v178[1] = 3221225472;
    v178[2] = __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke;
    v178[3] = &unk_1E6B905F0;
    v180 = buf;
    uint64_t v181 = &v182;
    uint64_t v42 = v40;
    uint64_t v179 = v42;
    [(RTLocationManager *)locationManager fetchStoredLocationsWithOptions:v166 handler:v178];
    __int16 v43 = (id *)(*(void *)&buf[8] + 40);
    id v44 = *(id *)(*(void *)&buf[8] + 40);
    __int16 v45 = v42;
    id v46 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v47 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v45, v47))
    {
      double v48 = [MEMORY[0x1E4F1C9C8] now];
      [v48 timeIntervalSinceDate:v46];
      double v50 = v49;
      long long v51 = objc_opt_new();
      long long v52 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
      long long v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v54 = [v53 filteredArrayUsingPredicate:v52];
      uint64_t v55 = [v54 firstObject];

      [v51 submitToCoreAnalytics:v55 type:1 duration:v50];
      __int16 v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v201 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v201, 2u);
      }

      long long v57 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v195 = v160;
      *(void *)v201 = @"semaphore wait timeout";
      __int16 v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v201 forKeys:&v195 count:1];
      double v59 = [v57 errorWithDomain:v159 code:15 userInfo:v58];

      if (v59)
      {
        id v44 = v59;
      }
    }

    objc_storeStrong(v43, v44);
    if (!*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v63 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        id v64 = (objc_class *)objc_opt_class();
        NSStringFromClass(v64);
        id v65 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v66 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v67 = [(id)v183[5] count];
        *(_DWORD *)v201 = 138413058;
        *(void *)&v201[4] = v65;
        *(_WORD *)&v201[12] = 2112;
        *(void *)&v201[14] = v66;
        *(_WORD *)&v201[22] = 2050;
        dispatch_time_t v202 = (uint64_t (*)(uint64_t, uint64_t))v67;
        LOWORD(v203) = 2112;
        *(void *)((char *)&v203 + 2) = v168;
        _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld locations for date interval %@.", v201, 0x2Au);
      }
      id v62 = [MEMORY[0x1E4F1CA48] array];
      long long v176 = 0u;
      long long v177 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      id v68 = (id)v183[5];
      uint64_t v69 = [v68 countByEnumeratingWithState:&v174 objects:v204 count:16];
      if (!v69) {
        goto LABEL_44;
      }
      uint64_t v70 = *(void *)v175;
LABEL_34:
      uint64_t v71 = 0;
      while (1)
      {
        if (*(void *)v175 != v70) {
          objc_enumerationMutation(v68);
        }
        uint64_t v72 = *(void **)(*((void *)&v174 + 1) + 8 * v71);
        __int16 v73 = [v72 sourceInformation:v150];
        int v74 = [v73 isSimulatedBySoftware];

        if (v74)
        {
          uint64_t v100 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v101 = (objc_class *)objc_opt_class();
            NSStringFromClass(v101);
            id v102 = (id)objc_claimAutoreleasedReturnValue();
            int v103 = NSStringFromSelector(a2);
            *(_DWORD *)v201 = 138412546;
            *(void *)&v201[4] = v102;
            *(_WORD *)&v201[12] = 2112;
            *(void *)&v201[14] = v103;
            _os_log_impl(&dword_1D9BFA000, v100, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 9.", v201, 0x16u);
          }
          v104 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];

          if (v104)
          {
            v105 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];
            [v105 setRejectionReasonCode:9];
          }
          goto LABEL_61;
        }
        id v75 = [v72 sourceInformation];
        if ([v75 isProducedByAccessory]) {
          break;
        }
        BOOL v76 = [v72 integrity] == v169;

        if (!v76) {
          goto LABEL_41;
        }
LABEL_42:
        if (v69 == ++v71)
        {
          uint64_t v69 = [v68 countByEnumeratingWithState:&v174 objects:v204 count:16];
          if (v69) {
            goto LABEL_34;
          }
LABEL_44:

          *(void *)v201 = 0;
          *(void *)&v201[8] = v201;
          *(void *)&v201[16] = 0x3032000000;
          dispatch_time_t v202 = __Block_byref_object_copy__46;
          *(void *)&long long v203 = __Block_byref_object_dispose__46;
          *((void *)&v203 + 1) = 0;
          uint64_t v195 = 0;
          v196 = &v195;
          uint64_t v197 = 0x3032000000;
          v198 = __Block_byref_object_copy__46;
          id v199 = __Block_byref_object_dispose__46;
          id v200 = 0;
          dispatch_semaphore_t v77 = dispatch_semaphore_create(0);
          motionActivityManager = v167->_motionActivityManager;
          v79 = [v168 startDate];
          uint64_t v80 = [v168 endDate];
          v170[0] = MEMORY[0x1E4F143A8];
          v170[1] = 3221225472;
          v170[2] = __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke_104;
          v170[3] = &unk_1E6B905F0;
          id v172 = &v195;
          id v173 = v201;
          id v81 = v77;
          long long v171 = v81;
          [(RTMotionActivityManager *)motionActivityManager fetchMotionActivitiesFromStartDate:v79 endDate:v80 handler:v170];

          id v82 = (id *)(v196 + 5);
          id v83 = (id)v196[5];
          dsema = v81;
          id v84 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v85 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(dsema, v85))
          {
            v154 = [MEMORY[0x1E4F1C9C8] now];
            [v154 timeIntervalSinceDate:v84];
            double v87 = v86;
            id v153 = objc_opt_new();
            dispatch_semaphore_t v88 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
            id v89 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v90 = [v89 filteredArrayUsingPredicate:v88];
            v91 = [v90 firstObject];

            [v153 submitToCoreAnalytics:v91 type:1 duration:v87];
            id v92 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)double v188 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v188, 2u);
            }

            id v93 = (void *)MEMORY[0x1E4F28C58];
            v208[0] = v160;
            *(void *)double v188 = @"semaphore wait timeout";
            uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:v208 count:1];
            dispatch_time_t v95 = [v93 errorWithDomain:v159 code:15 userInfo:v94];

            if (v95)
            {
              id v83 = v95;
            }
          }

          objc_storeStrong(v82, v83);
          if (v196[5])
          {
            double v96 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            {
              id v143 = (objc_class *)objc_opt_class();
              NSStringFromClass(v143);
              id v144 = (id)objc_claimAutoreleasedReturnValue();
              double v145 = NSStringFromSelector(a2);
              uint64_t v146 = v196[5];
              *(_DWORD *)double v188 = v150;
              *(void *)&void v188[4] = v144;
              __int16 v189 = 2112;
              id v190 = v145;
              __int16 v191 = 2112;
              uint64_t v192 = v146;
              _os_log_error_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch motion activity: %@.", v188, 0x20u);
            }
            double v97 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];

            if (v97)
            {
              id v98 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];
              [v98 setHistoricalRejectionReasonCode:8];
              goto LABEL_54;
            }
LABEL_85:
            int v99 = 1;
LABEL_88:

            _Block_object_dispose(&v195, 8);
            _Block_object_dispose(v201, 8);

LABEL_62:
            goto LABEL_63;
          }
          id v108 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            v109 = (objc_class *)objc_opt_class();
            NSStringFromClass(v109);
            id v110 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v111 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v112 = [*(id *)(*(void *)&v201[8] + 40) count];
            *(_DWORD *)double v188 = 138413058;
            *(void *)&void v188[4] = v110;
            __int16 v189 = 2112;
            id v190 = v111;
            __int16 v191 = 2050;
            uint64_t v192 = v112;
            __int16 v193 = 2112;
            dispatch_semaphore_t v194 = v168;
            _os_log_impl(&dword_1D9BFA000, v108, OS_LOG_TYPE_DEFAULT, "%@:%@, fetched %{public}ld motion activities for date interval %@.", v188, 0x2Au);
          }
          [(RTAuthorizedLocationManager *)v167 _positionUncertaintyRateFromMotionActivity:*(void *)(*(void *)&v201[8] + 40) dateInterval:v168];
          double v114 = v113;
          if (!-[RTAuthorizedLocationManager _assertMotionConsistencyForLocations:positionUncertaintyRate:](v167, "_assertMotionConsistencyForLocations:positionUncertaintyRate:", v62)&& (unint64_t)[v62 count] >= 2)
          {
            uint64_t v115 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v116 = (objc_class *)objc_opt_class();
              NSStringFromClass(v116);
              id v117 = (id)objc_claimAutoreleasedReturnValue();
              double v118 = NSStringFromSelector(a2);
              *(_DWORD *)double v188 = v150;
              *(void *)&void v188[4] = v117;
              __int16 v189 = 2112;
              id v190 = v118;
              __int16 v191 = 2112;
              uint64_t v192 = (uint64_t)v168;
              _os_log_impl(&dword_1D9BFA000, v115, OS_LOG_TYPE_DEFAULT, "%@:%@, motion-derived position uncertainty rate inconsistent with locations for date interval %@.", v188, 0x20u);
            }
            uint64_t v119 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];

            if (!v119) {
              goto LABEL_85;
            }
            uint64_t v120 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];
            *(float *)&double v121 = v114;
            [v120 setHistoricalRejectionSpeedMps:v121];

            [v156 timeIntervalSinceDate:oslog];
            double v123 = v122;
            [v156 timeIntervalSinceDate:v165];
            double v125 = v124;
            id v98 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];
            [v98 setMotionSpeedLimitRejectionCodeFromLookbackHours:(v123 + v125) * 0.5 / 3600.0];
            goto LABEL_54;
          }
          ++v162;
          if ((unint64_t)objc_msgSend(v62, "count", v150) < 2)
          {
            [oslog timeIntervalSinceDate:v165];
            if (v137 > 3600.0 && [v165 isOnOrAfter:v151])
            {
              id v138 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
              {
                v139 = (objc_class *)objc_opt_class();
                NSStringFromClass(v139);
                id v140 = (id)objc_claimAutoreleasedReturnValue();
                double v141 = NSStringFromSelector(a2);
                *(_DWORD *)double v188 = 138413058;
                *(void *)&void v188[4] = v140;
                __int16 v189 = 2112;
                id v190 = v141;
                __int16 v191 = 2112;
                uint64_t v192 = (uint64_t)v165;
                __int16 v193 = 2112;
                dispatch_semaphore_t v194 = oslog;
                _os_log_impl(&dword_1D9BFA000, v138, OS_LOG_TYPE_DEFAULT, "%@:%@, no locations recorded on interval between %@ and %@, cannot assert location history.", v188, 0x2Au);
              }
              id v142 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];

              if (!v142) {
                goto LABEL_85;
              }
              id v98 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];
              [v98 setHistoricalRejectionReasonCode:7];
LABEL_54:
              int v99 = 1;
            }
            else
            {
              int v99 = 0;
              id v98 = v165;
              v165 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v165 sinceDate:-1200.0];
            }
          }
          else
          {
            id v126 = objc_alloc(MEMORY[0x1E4F1C9C8]);
            double v127 = [v62 firstObject];
            unint64_t v128 = [v127 timestamp];
            uint64_t v129 = [v126 initWithTimeInterval:v128 sinceDate:-1200.0];

            id v130 = objc_alloc(MEMORY[0x1E4F1C9C8]);
            id v98 = [v62 firstObject];
            BOOL v131 = [v98 timestamp];
            uint64_t v132 = [v130 initWithTimeInterval:v131 sinceDate:0.01];

            int v99 = 0;
            oslog = v132;
            v165 = (void *)v129;
          }

          goto LABEL_88;
        }
      }

LABEL_41:
      [v62 addObject:v72];
      goto LABEL_42;
    }
    __int16 v60 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v133 = (objc_class *)objc_opt_class();
      NSStringFromClass(v133);
      id v134 = (id)objc_claimAutoreleasedReturnValue();
      id v135 = NSStringFromSelector(a2);
      v136 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
      *(_DWORD *)v201 = v150;
      *(void *)&v201[4] = v134;
      *(_WORD *)&v201[12] = 2112;
      *(void *)&v201[14] = v135;
      *(_WORD *)&v201[22] = 2112;
      dispatch_time_t v202 = v136;
      _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch location: %@.", v201, 0x20u);
    }
    double v61 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];

    if (v61)
    {
      id v62 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];
      [v62 setHistoricalRejectionReasonCode:8];
LABEL_61:
      int v99 = 1;
      goto LABEL_62;
    }
    int v99 = 1;
LABEL_63:

    _Block_object_dispose(&v182, 8);
    _Block_object_dispose(buf, 8);

    BOOL v29 = v99 == 0;
    if (v99) {
      goto LABEL_91;
    }
    char v106 = [v165 isAfterDate:v163];
    if (v162 < 20) {
      char v107 = v106;
    }
    else {
      char v107 = 0;
    }
  }
  while ((v107 & 1) != 0);
  uint64_t v147 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];

  if (v147)
  {
    v148 = [(RTAuthorizedLocationMetrics *)v167->_metrics queryMetrics];
    [v148 setHistoricalRejectionReasonCode:0];
  }
LABEL_91:

LABEL_92:
  return v29;
}

void __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __117__RTAuthorizedLocationManager__assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation_visit___block_invoke_104(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_assertRecentLocationTechnologyQualityForAuthorizedLocation:(id)a3 visit:(id)a4
{
  uint64_t v230 = *MEMORY[0x1E4F143B8];
  id v187 = a3;
  id v182 = a4;
  uint64_t v192 = self;
  double v188 = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  if (!v188)
  {
    v104 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = (objc_class *)objc_opt_class();
      char v106 = NSStringFromClass(v105);
      char v107 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v106;
      __int16 v215 = 2112;
      id v216 = v107;
      _os_log_impl(&dword_1D9BFA000, v104, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time.", buf, 0x16u);
    }
    id v108 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

    if (v108)
    {
      uint64_t v184 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
      [v184 setRejectionReasonCode:1];
      BOOL v109 = 0;
    }
    else
    {
      BOOL v109 = 0;
    }
    goto LABEL_155;
  }
  uint64_t v6 = [v187 loi];
  id v7 = [v6 location];
  id v8 = [v7 location];
  [v8 horizontalUncertainty];
  double v10 = v9;

  id v11 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  double v12 = fmax(fmin(v10 * 3.0, 200.0), 40.0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v215 = 2112;
    id v216 = v15;
    __int16 v217 = 2050;
    *(double *)double v218 = v12;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@, threshold for INSIDE authorized location: %{public}f m", buf, 0x20u);
  }
  v183 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v188 sinceDate:-3600.0];
  id v180 = v188;
  uint64_t v179 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v183 endDate:v180];
  v178 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v179 horizontalAccuracy:0 batchSize:1 ascending:100.0];
  uint64_t v208 = 0;
  uint64_t v209 = &v208;
  uint64_t v210 = 0x3032000000;
  uint64_t v211 = __Block_byref_object_copy__46;
  v212 = __Block_byref_object_dispose__46;
  id v213 = 0;
  uint64_t v202 = 0;
  long long v203 = &v202;
  uint64_t v204 = 0x3032000000;
  double v205 = __Block_byref_object_copy__46;
  v206 = __Block_byref_object_dispose__46;
  id v207 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  locationManager = v192->_locationManager;
  v198[0] = MEMORY[0x1E4F143A8];
  v198[1] = 3221225472;
  v198[2] = __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke;
  v198[3] = &unk_1E6B905F0;
  id v200 = &v208;
  v201 = &v202;
  double v18 = v16;
  id v199 = v18;
  [(RTLocationManager *)locationManager fetchStoredLocationsWithOptions:v178 handler:v198];
  __int16 v19 = (id *)(v209 + 5);
  id v20 = (id)v209[5];
  dsema = v18;
  unint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v22 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v22))
  {
    double v23 = [MEMORY[0x1E4F1C9C8] now];
    [v23 timeIntervalSinceDate:v21];
    double v25 = v24;
    double v26 = objc_opt_new();
    double v27 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
    double v28 = [MEMORY[0x1E4F29060] callStackSymbols];
    BOOL v29 = [v28 filteredArrayUsingPredicate:v27];
    uint64_t v30 = [v29 firstObject];

    [v26 submitToCoreAnalytics:v30 type:1 duration:v25];
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    double v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v224 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v224 count:1];
    BOOL v34 = [v32 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v33];

    if (v34)
    {
      id v20 = v34;
    }
  }

  objc_storeStrong(v19, v20);
  if (v209[5])
  {
    uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v142 = (objc_class *)objc_opt_class();
      NSStringFromClass(v142);
      id v143 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v144 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v145 = v209[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v143;
      __int16 v215 = 2112;
      id v216 = v144;
      __int16 v217 = 2112;
      *(void *)double v218 = v145;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch locations: %@.", buf, 0x20u);
    }
  }
  uint64_t v224 = 0;
  v225 = &v224;
  uint64_t v226 = 0x3032000000;
  v227 = __Block_byref_object_copy__46;
  id v228 = __Block_byref_object_dispose__46;
  id v229 = 0;
  v197[0] = MEMORY[0x1E4F143A8];
  v197[1] = 3221225472;
  v197[2] = __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke_105;
  v197[3] = &unk_1E6B94A90;
  v197[4] = &v224;
  v197[5] = &v202;
  [(RTAuthorizedLocationManager *)v192 _fetchCurrentLocationWithHandler:v197];
  if (v225[5])
  {
    double v36 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      double v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = v225[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v215 = 2112;
      id v216 = v39;
      __int16 v217 = 2112;
      *(void *)double v218 = v40;
      _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_DEFAULT, "%@:%@ failed to fetch current location (%@).", buf, 0x20u);
    }
  }
  if (![(id)v203[5] count])
  {
    unint64_t v116 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      id v117 = (objc_class *)objc_opt_class();
      NSStringFromClass(v117);
      id v118 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v119 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v118;
      __int16 v215 = 2112;
      id v216 = v119;
      _os_log_impl(&dword_1D9BFA000, v116, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 5.", buf, 0x16u);
    }
    uint64_t v120 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

    if (v120)
    {
      double v121 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
      [v121 setRejectionReasonCode:5];
      __int16 v191 = v121;
      goto LABEL_102;
    }
    BOOL v109 = 0;
    goto LABEL_154;
  }
  id v41 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  uint64_t v42 = [v187 loi];
  __int16 v43 = [v42 location];
  id v44 = [v43 location];
  __int16 v191 = (void *)[v41 initWithRTLocation:v44];

  __int16 v45 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    id v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v49 = [(id)v203[5] count];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v47;
    __int16 v215 = 2112;
    id v216 = v48;
    __int16 v217 = 2050;
    *(void *)double v218 = v49;
    *(_WORD *)&v218[8] = 2050;
    *(double *)&v218[10] = v12;
    _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_DEFAULT, "%@:%@, processing %{public}zu locations using INSIDE distance threshold %{public}f m.", buf, 0x2Au);
  }
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  obuint64_t j = (id)v203[5];
  uint64_t v50 = [obj countByEnumeratingWithState:&v193 objects:v223 count:16];
  if (!v50)
  {

    char v51 = 0;
    char v103 = 0;
    char v176 = 0;
    uint64_t v173 = 0;
    LOBYTE(v175) = 0;
    char v169 = 0;
    char v177 = 0;
    char v190 = 0;
    uint64_t v102 = 0;
    goto LABEL_104;
  }
  char v51 = 0;
  char v172 = 0;
  char v176 = 0;
  uint64_t v173 = 0;
  uint64_t v175 = 0;
  char v169 = 0;
  char v177 = 0;
  char v190 = 0;
  uint64_t v52 = *(void *)v194;
  int v181 = *MEMORY[0x1E4F1E768];
  unsigned int v170 = *MEMORY[0x1E4F1E758];
  while (2)
  {
    for (uint64_t i = 0; i != v50; ++i)
    {
      if (*(void *)v194 != v52) {
        objc_enumerationMutation(obj);
      }
      double v54 = *(void **)(*((void *)&v193 + 1) + 8 * i);
      uint64_t v55 = [v54 sourceInformation];
      int v56 = [v55 isSimulatedBySoftware];

      if (v56)
      {
        id v110 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          id v111 = (objc_class *)objc_opt_class();
          NSStringFromClass(v111);
          id v112 = (id)objc_claimAutoreleasedReturnValue();
          double v113 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v112;
          __int16 v215 = 2112;
          id v216 = v113;
          _os_log_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 9.", buf, 0x16u);
        }
        double v114 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

        if (v114)
        {
          uint64_t v115 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
          [v115 setRejectionReasonCode:9];
        }
        goto LABEL_151;
      }
      [v191 distanceFromLocation:v54];
      double v58 = v57;
      [v54 horizontalAccuracy];
      double v60 = v12 + v59 * 2.0;
      if (v58 > v60)
      {
        if (v51)
        {
          double v61 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            id v62 = (objc_class *)objc_opt_class();
            NSStringFromClass(v62);
            id v63 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v64 = (id)objc_claimAutoreleasedReturnValue();
            id v65 = [v187 loi];
            id v66 = [v65 location];
            uint64_t v67 = [v66 location];
            *(_DWORD *)buf = 138413570;
            *(void *)&uint8_t buf[4] = v63;
            __int16 v215 = 2112;
            id v216 = v64;
            __int16 v217 = 2112;
            *(void *)double v218 = v54;
            *(_WORD *)&v218[8] = 2112;
            *(void *)&v218[10] = v67;
            __int16 v219 = 2050;
            double v220 = v58;
            __int16 v221 = 2050;
            double v222 = v60;
            _os_log_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_DEFAULT, "%@:%@, distance from location, %@, to ALOI location, %@, of %{public}.2f is greater than threshold, %{public}.2f m. Setting state to OUTSIDE.", buf, 0x3Eu);
          }
        }
        id v68 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

        if (v68)
        {
          uint64_t v69 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
          double v70 = v58 / v12;
          *(float *)&double v70 = v58 / v12;
          [v69 setNormalizedDistanceToCentroid:v70];
        }
        char v51 = 0;
      }
      uint64_t v71 = [v54 sourceInformation];
      if ([v71 isProducedByAccessory])
      {
        char v190 = 1;
LABEL_36:

        continue;
      }
      BOOL v72 = [v54 type] == 3;

      if (v72)
      {
        char v190 = 1;
      }
      else if ([v54 type] == 1 {
             || [v54 type] == 4
      }
             || [v54 type] == 11
             || [v54 type] == 13)
      {
        if ([v54 integrity] == v181)
        {
          char v177 = 1;
        }
        else if (v58 <= 200.0)
        {
          if (v58 <= v12)
          {
            if ((v51 & 1) == 0)
            {
              __int16 v73 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                int v74 = (objc_class *)objc_opt_class();
                NSStringFromClass(v74);
                id v75 = (id)objc_claimAutoreleasedReturnValue();
                BOOL v76 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138413570;
                *(void *)&uint8_t buf[4] = v75;
                __int16 v215 = 2112;
                id v216 = v76;
                __int16 v217 = 2112;
                *(void *)double v218 = v54;
                *(_WORD *)&v218[8] = 2112;
                *(void *)&v218[10] = v187;
                __int16 v219 = 2050;
                double v220 = v58;
                __int16 v221 = 2050;
                double v222 = v12;
                _os_log_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_DEFAULT, "%@:%@, distance from location, %@, to ALOI, %@, of %{public}.2f is less than threshold, %{public}.2f m. Setting state to INSIDE.", buf, 0x3Eu);
              }
            }
            dispatch_semaphore_t v77 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

            if (v77)
            {
              double v78 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
              double v79 = v58 / v12;
              *(float *)&double v79 = v58 / v12;
              [v78 setNormalizedDistanceToCentroid:v79];
            }
            char v51 = 1;
          }
          int v80 = [v54 type];
          unsigned int v81 = [v54 integrity];
          int v82 = [v54 type] == 4 || [v54 type] == 11;
          int v83 = [v54 type];
          BOOL v84 = v83 == 13;
          if (v81 >= v170) {
            char v85 = v82;
          }
          else {
            char v85 = 0;
          }
          char v174 = v85;
          if (v81 < v170) {
            BOOL v84 = 0;
          }
          BOOL v171 = v84;
          if (!((v80 != 1) | v175 & 1))
          {
            double v86 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              double v87 = (objc_class *)objc_opt_class();
              NSStringFromClass(v87);
              id v88 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v89 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v88;
              __int16 v215 = 2112;
              id v216 = v89;
              __int16 v217 = 1026;
              *(_DWORD *)double v218 = 1;
              *(_WORD *)&v218[4] = 2112;
              *(void *)&v218[6] = v54;
              _os_log_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}d): %@", buf, 0x26u);
            }
            uint64_t v175 = 1;
          }
          if (!((v83 != 13) & ~v82 | BYTE4(v173) & 1))
          {
            uint64_t v90 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              v91 = (objc_class *)objc_opt_class();
              NSStringFromClass(v91);
              id v92 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v93 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v92;
              __int16 v215 = 2112;
              id v216 = v93;
              __int16 v217 = 1026;
              *(_DWORD *)double v218 = 2;
              *(_WORD *)&v218[4] = 2112;
              *(void *)&v218[6] = v54;
              _os_log_impl(&dword_1D9BFA000, v90, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}d): %@", buf, 0x26u);
            }
            BYTE4(v173) = 1;
          }
          if (!(v176 & 1 | ((v174 & 1) == 0)))
          {
            uint64_t v94 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
            {
              dispatch_time_t v95 = (objc_class *)objc_opt_class();
              NSStringFromClass(v95);
              id v96 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v97 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v96;
              __int16 v215 = 2112;
              id v216 = v97;
              __int16 v217 = 1026;
              *(_DWORD *)double v218 = 4;
              *(_WORD *)&v218[4] = 2112;
              *(void *)&v218[6] = v54;
              _os_log_impl(&dword_1D9BFA000, v94, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}d): %@", buf, 0x26u);
            }
            char v176 = 1;
          }
          if (!(v172 & 1 | !v171))
          {
            uint64_t v71 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              id v98 = (objc_class *)objc_opt_class();
              NSStringFromClass(v98);
              id v99 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v100 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v99;
              __int16 v215 = 2112;
              id v216 = v100;
              __int16 v217 = 1026;
              *(_DWORD *)double v218 = 8;
              *(_WORD *)&v218[4] = 2112;
              *(void *)&v218[6] = v54;
              _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_DEFAULT, "%@:%@, found technology (%{public}  d): %@", buf, 0x26u);
            }
            char v172 = 1;
            LOBYTE(v173) = 1;
            goto LABEL_36;
          }
          LOBYTE(v173) = 1;
        }
      }
      else
      {
        char v169 = 1;
      }
    }
    uint64_t v50 = [obj countByEnumeratingWithState:&v193 objects:v223 count:16];
    if (v50) {
      continue;
    }
    break;
  }

  uint64_t v101 = 2;
  if (v175) {
    uint64_t v101 = 3;
  }
  if ((v173 & 0x100000000) != 0) {
    uint64_t v102 = v101;
  }
  else {
    uint64_t v102 = v175;
  }
  if (v176)
  {
    v102 |= 4uLL;
    if ((v172 & 1) == 0)
    {
      char v103 = 0;
      char v176 = 1;
      goto LABEL_104;
    }
    goto LABEL_157;
  }
  if (v172)
  {
LABEL_157:
    v102 |= 8uLL;
    char v103 = 1;
    goto LABEL_104;
  }
  char v103 = 0;
  char v176 = 0;
LABEL_104:
  double v122 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

  if (v122)
  {
    double v123 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
    [v123 setTechnologyAvailability:v102];
  }
  if (v173)
  {
    if (v51)
    {
      if (v175 & 1 | ((v173 & 0x100000000) == 0)) {
        char v124 = BYTE4(v173);
      }
      else {
        char v124 = v103 | v176;
      }
      if ([v187 locationTechnologyAvailability])
      {
        if ([v187 locationTechnologyAvailability]) {
          LODWORD(v125) = 1;
        }
        else {
          unint64_t v125 = ((unint64_t)[v187 locationTechnologyAvailability] >> 2) & 1;
        }
        uint64_t v151 = v125 ^ 1;
      }
      else
      {
        uint64_t v151 = 0;
      }
      if (v124)
      {
        obuint64_t j = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
        {
          id v152 = (objc_class *)objc_opt_class();
          NSStringFromClass(v152);
          id v153 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v154 = (id)objc_claimAutoreleasedReturnValue();
          int v155 = [v187 locationTechnologyAvailability];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v153;
          __int16 v215 = 2112;
          id v216 = v154;
          __int16 v217 = 1026;
          *(_DWORD *)double v218 = v102;
          *(_WORD *)&v218[4] = 1026;
          *(_DWORD *)&v218[6] = v155;
          _os_log_impl(&dword_1D9BFA000, obj, OS_LOG_TYPE_DEFAULT, "%@:%@ passed 11 (%{public}08x,%{public}08x)", buf, 0x22u);
        }
        BOOL v109 = 1;
        goto LABEL_152;
      }
      v156 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v157 = (objc_class *)objc_opt_class();
        NSStringFromClass(v157);
        id v158 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v159 = (id)objc_claimAutoreleasedReturnValue();
        int v160 = [v187 locationTechnologyAvailability];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v158;
        __int16 v215 = 2112;
        id v216 = v159;
        __int16 v217 = 1026;
        *(_DWORD *)double v218 = v102;
        *(_WORD *)&v218[4] = 1026;
        *(_DWORD *)&v218[6] = v160;
        _os_log_impl(&dword_1D9BFA000, v156, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 11 (%{public}08x,%{public}08x)", buf, 0x22u);
      }
      v161 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

      if (v161)
      {
        uint64_t v162 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
        [v162 setRejectionReasonCode:11];

        BOOL v131 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
        [v131 setIsHistoricallyALowDiversityLocation:v151];
        goto LABEL_150;
      }
    }
    else
    {
      uint64_t v132 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        v133 = (objc_class *)objc_opt_class();
        NSStringFromClass(v133);
        id v134 = (id)objc_claimAutoreleasedReturnValue();
        id v135 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v134;
        __int16 v215 = 2112;
        id v216 = v135;
        _os_log_impl(&dword_1D9BFA000, v132, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 6.", buf, 0x16u);
      }
      v136 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

      if (v136)
      {
        BOOL v131 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
        [v131 setRejectionReasonCode:6];
        goto LABEL_150;
      }
    }
LABEL_102:
    BOOL v109 = 0;
  }
  else
  {
    if (v177)
    {
      id v126 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        double v127 = (objc_class *)objc_opt_class();
        NSStringFromClass(v127);
        id v128 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v129 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v128;
        __int16 v215 = 2112;
        id v216 = v129;
        _os_log_impl(&dword_1D9BFA000, v126, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 7.", buf, 0x16u);
      }
      id v130 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

      if (v130)
      {
        BOOL v131 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
        [v131 setRejectionReasonCode:7];
        goto LABEL_150;
      }
      goto LABEL_102;
    }
    if (v169)
    {
      double v137 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
      {
        id v138 = (objc_class *)objc_opt_class();
        NSStringFromClass(v138);
        id v139 = (id)objc_claimAutoreleasedReturnValue();
        id v140 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v139;
        __int16 v215 = 2112;
        id v216 = v140;
        _os_log_impl(&dword_1D9BFA000, v137, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 8.", buf, 0x16u);
      }
      double v141 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

      if (v141)
      {
        BOOL v131 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
        [v131 setRejectionReasonCode:8];
        goto LABEL_150;
      }
      goto LABEL_102;
    }
    if (v190)
    {
      uint64_t v146 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v147 = (objc_class *)objc_opt_class();
        NSStringFromClass(v147);
        id v148 = (id)objc_claimAutoreleasedReturnValue();
        v149 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v148;
        __int16 v215 = 2112;
        id v216 = v149;
        _os_log_impl(&dword_1D9BFA000, v146, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 10.", buf, 0x16u);
      }
      long long v150 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

      if (v150)
      {
        BOOL v131 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
        [v131 setRejectionReasonCode:10];
        goto LABEL_150;
      }
      goto LABEL_102;
    }
    v163 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      v164 = (objc_class *)objc_opt_class();
      NSStringFromClass(v164);
      id v165 = (id)objc_claimAutoreleasedReturnValue();
      double v166 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v165;
      __int16 v215 = 2112;
      id v216 = v166;
      _os_log_impl(&dword_1D9BFA000, v163, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 5.", buf, 0x16u);
    }
    v167 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];

    if (!v167) {
      goto LABEL_102;
    }
    BOOL v131 = [(RTAuthorizedLocationMetrics *)v192->_metrics queryMetrics];
    [v131 setRejectionReasonCode:5];
LABEL_150:
    obuint64_t j = v131;
LABEL_151:
    BOOL v109 = 0;
LABEL_152:
  }
LABEL_154:
  _Block_object_dispose(&v224, 8);

  _Block_object_dispose(&v202, 8);
  _Block_object_dispose(&v208, 8);

LABEL_155:
  return v109;
}

void __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v6];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __97__RTAuthorizedLocationManager__assertRecentLocationTechnologyQualityForAuthorizedLocation_visit___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

- (BOOL)_assertUserTimeAndTrustedTimeAreConsistent
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  if (!v4)
  {
    id v14 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];

    if (v14)
    {
      id v15 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];
      LODWORD(v16) = -3.0;
      [v15 setUserTimeOffsetHours:v16];
    }
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      double v18 = NSStringFromClass(v17);
      __int16 v19 = NSStringFromSelector(a2);
      int v26 = 138412546;
      double v27 = v18;
      __int16 v28 = 2112;
      BOOL v29 = v19;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection reason 1 (unavailable).", (uint8_t *)&v26, 0x16u);
    }
    goto LABEL_16;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;
  id v8 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];

  if (v8)
  {
    double v9 = [(RTTrustedTimeCache *)self->_trustedTimeCache getApproximateTrustedDateNow];

    id v11 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];
    if (v9)
    {
      int v13 = v11;
      float v10 = v7 / 3600.0;
      *(float *)&double v12 = v10;
    }
    else
    {
      int v13 = v11;
      LODWORD(v12) = 3.0;
    }
    [v11 setUserTimeOffsetHours:v12];
  }
  if (fabs(v7) > 36000.0)
  {
    unint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      double v24 = NSStringFromSelector(a2);
      int v26 = 138412802;
      double v27 = v23;
      __int16 v28 = 2112;
      BOOL v29 = v24;
      __int16 v30 = 2050;
      double v31 = v7;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection reason 1 (%{public}.1f).", (uint8_t *)&v26, 0x20u);
    }
LABEL_16:
    BOOL v20 = 0;
    goto LABEL_17;
  }
  BOOL v20 = 1;
LABEL_17:

  return v20;
}

- (id)_getCurrentVisit
{
  v66[1] = *MEMORY[0x1E4F143B8];
  __int16 v45 = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  if (v45)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F5CF58]);
    id v3 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3450CD8];
    oslog = [v2 initWithAscending:0 confidence:v3 dateInterval:0 labelVisit:1 limit:&unk_1F3450CC0 sources:v4];

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v63 = __Block_byref_object_copy__46;
    id v64 = __Block_byref_object_dispose__46;
    id v65 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x3032000000;
    double v54 = __Block_byref_object_copy__46;
    uint64_t v55 = __Block_byref_object_dispose__46;
    id v56 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    double v6 = [(RTAuthorizedLocationManager *)self visitManager];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __47__RTAuthorizedLocationManager__getCurrentVisit__block_invoke;
    void v47[3] = &unk_1E6B905F0;
    uint64_t v49 = buf;
    uint64_t v50 = &v51;
    double v7 = v5;
    id v48 = v7;
    [v6 fetchStoredVisitsWithOptions:oslog handler:v47];

    id v8 = (id *)(*(void *)&buf[8] + 40);
    id v9 = *(id *)(*(void *)&buf[8] + 40);
    float v10 = v7;
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v12 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v10, v12))
    {
      int v13 = [MEMORY[0x1E4F1C9C8] now];
      [v13 timeIntervalSinceDate:v11];
      double v15 = v14;
      double v16 = objc_opt_new();
      uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
      double v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v19 = [v18 filteredArrayUsingPredicate:v17];
      BOOL v20 = [v19 firstObject];

      [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
      unint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v57 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v57, 2u);
      }

      dispatch_time_t v22 = (void *)MEMORY[0x1E4F28C58];
      v66[0] = *MEMORY[0x1E4F28568];
      *(void *)double v57 = @"semaphore wait timeout";
      double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v66 count:1];
      double v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

      if (v24)
      {
        id v9 = v24;
      }
    }

    objc_storeStrong(v8, v9);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      double v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        id v41 = NSStringFromSelector(a2);
        uint64_t v42 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)double v57 = 138412802;
        *(void *)&v57[4] = v40;
        __int16 v58 = 2112;
        double v59 = v41;
        __int16 v60 = 2112;
        uint64_t v61 = v42;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v57, 0x20u);
      }
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), *(id *)(*(void *)&buf[8] + 40));
      id v26 = 0;
    }
    else
    {
      if (v52[5])
      {
        __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          double v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          double v33 = NSStringFromSelector(a2);
          uint64_t v34 = v52[5];
          *(_DWORD *)double v57 = 138412802;
          *(void *)&v57[4] = v32;
          __int16 v58 = 2112;
          double v59 = v33;
          __int16 v60 = 2112;
          uint64_t v61 = v34;
          _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEFAULT, "%@:%@ fetched visit %@.", v57, 0x20u);
        }
      }
      else
      {
        __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          double v37 = NSStringFromSelector(a2);
          *(_DWORD *)double v57 = 138412546;
          *(void *)&v57[4] = v36;
          __int16 v58 = 2112;
          double v59 = v37;
          _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEFAULT, "%@:%@ no available visit, cannot compute settled time.", v57, 0x16u);
        }
      }

      id v26 = (id)v52[5];
    }

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = (objc_class *)objc_opt_class();
      __int16 v28 = NSStringFromClass(v27);
      BOOL v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v29;
      _os_log_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now, cannot yield current visit.", buf, 0x16u);
    }
    id v26 = 0;
  }

  return v26;
}

void __47__RTAuthorizedLocationManager__getCurrentVisit__block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [v6 firstObject];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_fetchCurrentLocationWithHandler:(id)a3
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  if (!v68)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTAuthorizedLocationManager _fetchCurrentLocationWithHandler:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1942;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v69 = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  if (v69)
  {
    uint64_t v67 = [[RTLocationRequestOptions alloc] initWithDesiredAccuracy:1 horizontalAccuracy:0 maxAge:100.0 yieldLastLocation:100.0 timeout:3600.0 fallback:1.5 fallbackHorizontalAccuracy:1.0 fallbackMaxAge:1.0];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v89 = __Block_byref_object_copy__46;
    uint64_t v90 = __Block_byref_object_dispose__46;
    id v91 = 0;
    uint64_t v75 = 0;
    BOOL v76 = &v75;
    uint64_t v77 = 0x3032000000;
    double v78 = __Block_byref_object_copy__46;
    double v79 = __Block_byref_object_dispose__46;
    id v80 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    locationManager = self->_locationManager;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __64__RTAuthorizedLocationManager__fetchCurrentLocationWithHandler___block_invoke;
    v71[3] = &unk_1E6B93B48;
    __int16 v73 = buf;
    int v74 = &v75;
    uint64_t v7 = v5;
    BOOL v72 = v7;
    [(RTLocationManager *)locationManager fetchCurrentLocationWithOptions:v67 handler:v71];
    uint64_t v8 = (id *)(*(void *)&buf[8] + 40);
    id v9 = *(id *)(*(void *)&buf[8] + 40);
    dsema = v7;
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v11 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v11))
    {
      dispatch_time_t v12 = [MEMORY[0x1E4F1C9C8] now];
      [v12 timeIntervalSinceDate:v10];
      double v14 = v13;
      double v15 = objc_opt_new();
      double v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v18 = [v17 filteredArrayUsingPredicate:v16];
      __int16 v19 = [v18 firstObject];

      [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
      BOOL v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)unsigned int v81 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v81, 2u);
      }

      unint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      v92[0] = *MEMORY[0x1E4F28568];
      *(void *)unsigned int v81 = @"semaphore wait timeout";
      dispatch_time_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v92 count:1];
      double v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

      if (v23)
      {
        id v9 = v23;
      }
    }

    objc_storeStrong(v8, v9);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      double v24 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v60 = NSStringFromSelector(aSelectora);
        uint64_t v61 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)unsigned int v81 = 138412802;
        *(void *)&v81[4] = v59;
        __int16 v82 = 2112;
        id v83 = v60;
        __int16 v84 = 2112;
        uint64_t v85 = v61;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@:%@, failed to fetch location: %@.", v81, 0x20u);
      }
      (*((void (**)(id, void, void))v68 + 2))(v68, 0, *(void *)(*(void *)&buf[8] + 40));
    }
    else
    {
      if (v76[5])
      {
        BOOL v29 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelectora);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          id v33 = [(id)v76[5] description];
          int v34 = [(id)v76[5] integrity];
          *(_DWORD *)unsigned int v81 = 138413058;
          *(void *)&v81[4] = v31;
          __int16 v82 = 2112;
          id v83 = v32;
          __int16 v84 = 2112;
          uint64_t v85 = (uint64_t)v33;
          __int16 v86 = 1026;
          LODWORD(v87) = v34;
          _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ fetched location: %@, integrity, %{public}d", v81, 0x26u);
        }
        uint64_t v35 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];

        if (v35)
        {
          id v36 = [(id)v76[5] timestamp];
          [v69 timeIntervalSinceDate:v36];
          double v38 = v37;
          id v39 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];
          LODWORD(v40) = llround(v38 / 60.0);
          [v39 setLocationAgeMinutes:v40];
        }
        id v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v69 sinceDate:-3600.0];
        uint64_t v42 = [(id)v76[5] timestamp];
        int v43 = [v42 isOnOrBefore:v41];

        if (v43)
        {
          id v44 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v45 = (objc_class *)objc_opt_class();
            NSStringFromClass(v45);
            id v46 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelectora);
            id v47 = (id)objc_claimAutoreleasedReturnValue();
            id v48 = [(id)v76[5] description];
            *(_DWORD *)unsigned int v81 = 138413058;
            *(void *)&v81[4] = v46;
            __int16 v82 = 2112;
            id v83 = v47;
            __int16 v84 = 2050;
            uint64_t v85 = 0x40AC200000000000;
            __int16 v86 = 2112;
            double v87 = v48;
            _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_DEFAULT, "%@:%@, most recent location is older than %{public}.0f seconds, %@.", v81, 0x2Au);
          }
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v50 = (void *)[v49 initWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:0];
          (*((void (**)(id, void, void *))v68 + 2))(v68, 0, v50);
        }
        else
        {
          uint64_t v53 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            double v54 = (objc_class *)objc_opt_class();
            NSStringFromClass(v54);
            id v55 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelectora);
            id v56 = (id)objc_claimAutoreleasedReturnValue();
            double v57 = [(id)v76[5] toVerboseString];
            *(_DWORD *)unsigned int v81 = 138412802;
            *(void *)&v81[4] = v55;
            __int16 v82 = 2112;
            id v83 = v56;
            __int16 v84 = 2112;
            uint64_t v85 = (uint64_t)v57;
            _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_DEFAULT, "%@:%@ fetched current location: %@", v81, 0x20u);
          }
          (*((void (**)(id, uint64_t, void))v68 + 2))(v68, v76[5], 0);
        }
      }
      else
      {
        uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          id v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          id v63 = (id)objc_claimAutoreleasedReturnValue();
          id v64 = NSStringFromSelector(aSelectora);
          *(_DWORD *)unsigned int v81 = 138412546;
          *(void *)&v81[4] = v63;
          __int16 v82 = 2112;
          id v83 = v64;
          _os_log_error_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_ERROR, "%@:%@, fetched nil location.", v81, 0x16u);
        }
        id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v41 = (void *)[v52 initWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:0];
        (*((void (**)(id, void, void *))v68 + 2))(v68, 0, v41);
      }
    }
    _Block_object_dispose(&v75, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v25 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (objc_class *)objc_opt_class();
      double v27 = NSStringFromClass(v26);
      __int16 v28 = NSStringFromSelector(aSelectora);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v28;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@, failed to fetch trusted time now, not fetching current location.", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v68 + 2))(v68, 0, 0);
  }
}

void __64__RTAuthorizedLocationManager__fetchCurrentLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_assertWeAreAtAuthorizedLocation:(id)a3
{
  *(void *)((char *)&v92[1] + 6) = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(NSArray *)self->_authorizedLocationArr count])
  {
    aSelector = a2;
    uint64_t v6 = [v5 location];
    [v6 latitude];
    CLLocationDegrees v8 = v7;
    id v9 = [v5 location];
    [v9 longitude];
    CLLocationCoordinate2D v84 = CLLocationCoordinate2DMake(v8, v10);

    CLLocationCoordinate2D v83 = CLLocationCoordinate2DMake(0.0, 0.0);
    uint64_t v11 = [v5 placeInference];
    if (!v11) {
      goto LABEL_7;
    }
    dispatch_time_t v12 = (void *)v11;
    double v13 = [v5 placeInference];
    double v14 = [v13 mapItem];

    if (v14)
    {
      double v15 = [v5 placeInference];
      double v16 = [v15 mapItem];
      uint64_t v17 = [v16 location];
      [v17 latitude];
      CLLocationDegrees v19 = v18;
      BOOL v20 = [v5 placeInference];
      unint64_t v21 = [v20 mapItem];
      dispatch_time_t v22 = [v21 location];
      [v22 longitude];
      CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v19, v23);
      CLLocationCoordinate2D v83 = v24;

      double v25 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        BOOL v72 = (objc_class *)objc_opt_class();
        __int16 v73 = NSStringFromClass(v72);
        int v74 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413059;
        __int16 v86 = v73;
        __int16 v87 = 2112;
        id v88 = v74;
        __int16 v89 = 2049;
        CLLocationDegrees latitude = v24.latitude;
        __int16 v91 = 2049;
        v92[0] = *(void *)&v24.longitude;
        _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "%@:%@, also using visit map item (%{private}.6f, %{private}.6f)", buf, 0x2Au);
      }
      int v78 = 1;
    }
    else
    {
LABEL_7:
      int v78 = 0;
    }
    id v76 = v5;
    if ([(NSArray *)self->_authorizedLocationArr count])
    {
      double v79 = 0;
      uint64_t v27 = 0;
      double v28 = 1000000000.0;
      *(void *)&long long v26 = 138412802;
      long long v75 = v26;
      while (1)
      {
        BOOL v29 = -[NSArray objectAtIndexedSubscript:](self->_authorizedLocationArr, "objectAtIndexedSubscript:", v27, v75);
        v82.CLLocationDegrees latitude = 0.0;
        v82.longitude = 0.0;
        __int16 v30 = [v29 loi];
        id v31 = [v30 location];
        id v32 = [v31 location];
        [v32 latitude];
        CLLocationDegrees v34 = v33;
        uint64_t v35 = [v29 loi];
        id v36 = [v35 location];
        double v37 = [v36 location];
        [v37 longitude];
        CLLocationCoordinate2D v82 = CLLocationCoordinate2DMake(v34, v38);

        distanceCalculator = self->_distanceCalculator;
        id v81 = 0;
        [(RTDistanceCalculator *)distanceCalculator distanceFromLocationCoordinate:&v82 toLocationCoordinate:&v84 error:&v81];
        double v41 = v40;
        id v42 = v81;
        if (v42)
        {
          double v43 = *(double *)&v42;
          id v44 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            id v52 = (objc_class *)objc_opt_class();
            uint64_t v53 = NSStringFromClass(v52);
            double v54 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = v75;
            __int16 v86 = v53;
            __int16 v87 = 2112;
            id v88 = v54;
            __int16 v89 = 2112;
            CLLocationDegrees latitude = v43;
            _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%@:%@, failed to compute distance: %@.", buf, 0x20u);
          }
          goto LABEL_13;
        }
        if (!v78) {
          goto LABEL_21;
        }
        __int16 v45 = self->_distanceCalculator;
        id v80 = 0;
        [(RTDistanceCalculator *)v45 distanceFromLocationCoordinate:&v82 toLocationCoordinate:&v83 error:&v80];
        double v47 = v46;
        id v48 = v80;
        if (v48)
        {
          double v43 = *(double *)&v48;
          id v49 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            id v55 = (objc_class *)objc_opt_class();
            id v56 = NSStringFromClass(v55);
            double v57 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = v75;
            __int16 v86 = v56;
            __int16 v87 = 2112;
            id v88 = v57;
            __int16 v89 = 2112;
            CLLocationDegrees latitude = v43;
            _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "%@:%@, failed to compute distance: %@.", buf, 0x20u);
          }
          goto LABEL_22;
        }
        if (v47 < v41)
        {
          double v43 = 0.0;
          double v41 = v47;
        }
        else
        {
LABEL_21:
          double v43 = 0.0;
        }
LABEL_22:
        if (v41 >= v28) {
          goto LABEL_26;
        }
        uint64_t v50 = v29;

        uint64_t v51 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];

        if (!v51)
        {
          double v28 = v41;
          double v79 = v50;
          goto LABEL_26;
        }
        id v44 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];
        [v44 setLoiFamiliarityRank:(v27 + 1)];
        double v28 = v41;
        double v79 = v50;
LABEL_13:

LABEL_26:
        if (++v27 >= [(NSArray *)self->_authorizedLocationArr count]) {
          goto LABEL_32;
        }
      }
    }
    double v79 = 0;
    double v28 = 1000000000.0;
LABEL_32:
    id v63 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];

    if (v63)
    {
      id v65 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];
      float v64 = v28 / 200.0;
      *(float *)&double v66 = v64;
      [v65 setNormalizedDistanceToCentroid:v66];
    }
    uint64_t v67 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    id v5 = v76;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = (objc_class *)objc_opt_class();
      uint64_t v69 = NSStringFromClass(v68);
      double v70 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138413314;
      __int16 v86 = v69;
      __int16 v87 = 2112;
      id v88 = v70;
      __int16 v89 = 2050;
      CLLocationDegrees latitude = v28;
      __int16 v91 = 1026;
      LODWORD(v92[0]) = v28 < 200.0;
      WORD2(v92[0]) = 2050;
      *(void *)((char *)v92 + 6) = 0x4069000000000000;
      _os_log_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_DEFAULT, "%@:%@ distance, %{public}.3f, matched, %{public}d, threshold %{public}.3f", buf, 0x30u);
    }
    if (v28 >= 200.0)
    {
      id v62 = 0;
      __int16 v58 = v79;
    }
    else
    {
      __int16 v58 = v79;
      id v62 = v79;
    }
  }
  else
  {
    __int16 v58 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      id v59 = (objc_class *)objc_opt_class();
      __int16 v60 = NSStringFromClass(v59);
      uint64_t v61 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v86 = v60;
      __int16 v87 = 2112;
      id v88 = v61;
      _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_DEFAULT, "%@:%@, no available authorized locations: is not considered at authorized location.", buf, 0x16u);
    }
    id v62 = 0;
  }

  return v62;
}

- (void)_updateMostRecentDateAtWhichDeviceDataIsTrusted
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [(RTAuthorizedLocationManager *)self trustedTimeNow];
  if (v4)
  {
    id v5 = [(RTAuthorizedLocationManager *)self biometricsManager];
    uint64_t v6 = [v5 updateDateOfLastSuccessfulBiometricAuthentication];

    if (v6)
    {
      double v7 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v6 sinceDate:-3600.0];
      mostRecentDateAtWhichDeviceDataIsTrusted = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
      self->_mostRecentDateAtWhichDeviceDataIsTrusted = v7;
    }
    double v13 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v4 sinceDate:-604800.0];
    double v15 = [(NSDate *)v13 laterDate:v14];
    double v16 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
    self->_mostRecentDateAtWhichDeviceDataIsTrusted = v15;

    CLLocationDegrees v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      double v18 = NSStringFromClass(v17);
      CLLocationDegrees v19 = NSStringFromSelector(a2);
      BOOL v20 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
      int v21 = 138412802;
      dispatch_time_t v22 = v18;
      __int16 v23 = 2112;
      CLLocationCoordinate2D v24 = v19;
      __int16 v25 = 2114;
      long long v26 = v20;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Setting learning data age threshold to %{public}@", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_8;
  }
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    CLLocationDegrees v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(a2);
    dispatch_time_t v12 = self->_mostRecentDateAtWhichDeviceDataIsTrusted;
    int v21 = 138412802;
    dispatch_time_t v22 = v10;
    __int16 v23 = 2112;
    CLLocationCoordinate2D v24 = v11;
    __int16 v25 = 2112;
    long long v26 = v12;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, unable to fetch trustedNow, leaving _mostRecentDateAtWhichDeviceDataIsTrusted unchanged at %@", (uint8_t *)&v21, 0x20u);

LABEL_8:
  }
}

- (void)_fetchAuthorizedLocationExtendedStatus:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  CLLocationCoordinate2D v84 = (void (**)(id, RTAuthorizedLocationStatus *, uint64_t, void))a3;
  __int16 v86 = self;
  if (!v84)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v99 = "-[RTAuthorizedLocationManager _fetchAuthorizedLocationExtendedStatus:]";
      __int16 v100 = 1024;
      LODWORD(v101) = 2138;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  if (self->_overrideAuthorizedLocationStatus
    && ([(RTAuthorizedLocationManager *)self _checkStatusOverrideDefault],
        (overrideAuthorizedLocationStatus = self->_overrideAuthorizedLocationStatus) != 0))
  {
    v84[2](v84, overrideAuthorizedLocationStatus, -2, 0);
  }
  else
  {
    -[RTAuthorizedLocationMetrics setLocationServicesEnabled:](self->_metrics, "setLocationServicesEnabled:", [MEMORY[0x1E4F1E600] locationServicesEnabled]);
    [(RTAuthorizedLocationMetrics *)self->_metrics setRoutineEnabled:[(RTAuthorizedLocationManager *)self _isRoutineEnabled]];
    CLLocationCoordinate2D v82 = (RTAuthorizedLocationStatus *)[objc_alloc(MEMORY[0x1E4F5CD90]) initWithStatus:1];
    if ([(RTAuthorizedLocationManager *)self _assertUserTimeAndTrustedTimeAreConsistent])
    {
      [(RTAuthorizedLocationManager *)self _updateMostRecentDateAtWhichDeviceDataIsTrusted];
      id v81 = [(RTAuthorizedLocationManager *)self _getCurrentVisit];
      if (!v81
        || ![v81 type]
        || [v81 type] == 3
        || ([v81 entry],
            uint64_t v6 = objc_claimAutoreleasedReturnValue(),
            BOOL v7 = v6 == 0,
            v6,
            v7))
      {
        uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          double v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          BOOL v29 = (char *)objc_claimAutoreleasedReturnValue();
          __int16 v30 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          id v99 = v29;
          __int16 v100 = 2112;
          id v101 = v30;
          _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 2.", buf, 0x16u);
        }
        id v31 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

        if (v31)
        {
          id v32 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
          [v32 setRejectionReasonCode:2];
        }
        v84[2](v84, v82, 2, 0);
      }
      else
      {
        CLLocationDegrees v8 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];

        if (v8)
        {
          id v9 = [MEMORY[0x1E4F1C9C8] now];
          CLLocationDegrees v10 = [v81 entry];
          [v9 timeIntervalSinceDate:v10];
          double v12 = v11;
          double v13 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
          double v14 = v12 / 60.0;
          *(float *)&double v14 = v12 / 60.0;
          [v13 setVisitDwellMinutes:v14];
        }
        uint64_t v92 = 0;
        id v93 = &v92;
        uint64_t v94 = 0x3032000000;
        dispatch_time_t v95 = __Block_byref_object_copy__46;
        id v96 = __Block_byref_object_dispose__46;
        id v97 = 0;
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __70__RTAuthorizedLocationManager__fetchAuthorizedLocationExtendedStatus___block_invoke;
        v91[3] = &unk_1E6B94AB8;
        v91[4] = &v92;
        [(RTAuthorizedLocationManager *)v86 _curateAuthorizedLocationsWithHandler:v91];
        if (v93[5])
        {
          double v15 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            double v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            uint64_t v17 = (char *)(id)objc_claimAutoreleasedReturnValue();
            double v18 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            id v99 = v17;
            __int16 v100 = 2112;
            id v101 = v18;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 3.", buf, 0x16u);
          }
          CLLocationDegrees v19 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

          if (v19)
          {
            BOOL v20 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
            [v20 setRejectionReasonCode:3];
          }
          v84[2](v84, v82, 3, 0);
        }
        else
        {
          double v33 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

          if (v33)
          {
            uint64_t v34 = [(NSArray *)v86->_authorizedLocationArr count];
            uint64_t v35 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
            [v35 setNumFamiliarLois:v34];
          }
          if ([(NSArray *)v86->_authorizedLocationArr count])
          {
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            obuint64_t j = v86->_authorizedLocationArr;
            uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v87 objects:v108 count:16];
            if (v36)
            {
              uint64_t v37 = *(void *)v88;
              do
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v88 != v37) {
                    objc_enumerationMutation(obj);
                  }
                  id v39 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  double v40 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    double v41 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v41);
                    id v42 = (char *)(id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    id v43 = (id)objc_claimAutoreleasedReturnValue();
                    [v39 dwellTime_s];
                    uint64_t v45 = v44;
                    uint64_t v46 = [v39 numberOfDaysVisited];
                    double v47 = [v39 loi];
                    *(_DWORD *)buf = 138413314;
                    id v99 = v42;
                    __int16 v100 = 2112;
                    id v101 = v43;
                    __int16 v102 = 2050;
                    uint64_t v103 = v45;
                    __int16 v104 = 2050;
                    uint64_t v105 = v46;
                    __int16 v106 = 2112;
                    char v107 = v47;
                    _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_DEFAULT, "%@:%@, Authorized Locations: total visit dwell, %{public}.0f, number of unique days visited, %{public}ld, Authorized Location, %@.", buf, 0x34u);
                  }
                }
                uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v87 objects:v108 count:16];
              }
              while (v36);
            }

            id v48 = [(RTAuthorizedLocationManager *)v86 _assertWeAreAtAuthorizedLocation:v81];
            if (v48)
            {
              if ([(RTAuthorizedLocationManager *)v86 _assertRecentLocationTechnologyQualityForAuthorizedLocation:v48 visit:v81])
              {
                if ([(RTAuthorizedLocationManager *)v86 _assertRecentMotionActivityAndLocationHistoryAreConsistentForAuthorizedLocation:v48 visit:v81])
                {
                  id v49 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v50 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v50);
                    uint64_t v51 = (char *)(id)objc_claimAutoreleasedReturnValue();
                    id v52 = NSStringFromSelector(a2);
                    *(_DWORD *)buf = 138412546;
                    id v99 = v51;
                    __int16 v100 = 2112;
                    id v101 = v52;
                    _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_DEFAULT, "%@:%@, confirmed at authorized location.", buf, 0x16u);
                  }
                  uint64_t v53 = [objc_alloc(MEMORY[0x1E4F5CD90]) initWithStatus:2];

                  double v54 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

                  if (v54)
                  {
                    id v55 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
                    [v55 setRejectionReasonCode:0];

                    id v56 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
                    [v56 setResponseValue:1];
                  }
                  v84[2](v84, (RTAuthorizedLocationStatus *)v53, 0, 0);
                  CLLocationCoordinate2D v82 = (RTAuthorizedLocationStatus *)v53;
                }
                else
                {
                  long long v75 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                  {
                    id v76 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v76);
                    uint64_t v77 = (char *)(id)objc_claimAutoreleasedReturnValue();
                    int v78 = NSStringFromSelector(a2);
                    *(_DWORD *)buf = 138412546;
                    id v99 = v77;
                    __int16 v100 = 2112;
                    id v101 = v78;
                    _os_log_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 14.", buf, 0x16u);
                  }
                  double v79 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

                  if (v79)
                  {
                    id v80 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
                    [v80 setRejectionReasonCode:14];
                  }
                  v84[2](v84, v82, 14, 0);
                }
              }
              else
              {
                double v70 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v71 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v71);
                  BOOL v72 = (char *)(id)objc_claimAutoreleasedReturnValue();
                  __int16 v73 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412546;
                  id v99 = v72;
                  __int16 v100 = 2112;
                  id v101 = v73;
                  _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_DEFAULT, "%@:%@, rejected by 5,7-12.", buf, 0x16u);
                }
                int v74 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
                v84[2](v84, v82, (int)[v74 rejectionReasonCode], 0);
              }
            }
            else
            {
              float v64 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                id v65 = (objc_class *)objc_opt_class();
                NSStringFromClass(v65);
                double v66 = (char *)(id)objc_claimAutoreleasedReturnValue();
                uint64_t v67 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                id v99 = v66;
                __int16 v100 = 2112;
                id v101 = v67;
                _os_log_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_DEFAULT, "%@:%@, rejection 6.", buf, 0x16u);
              }
              id v68 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

              if (v68)
              {
                uint64_t v69 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
                [v69 setRejectionReasonCode:6];
              }
              v84[2](v84, v82, 6, 0);
            }
          }
          else
          {
            double v57 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v58 = (objc_class *)objc_opt_class();
              NSStringFromClass(v58);
              id v59 = (char *)(id)objc_claimAutoreleasedReturnValue();
              __int16 v60 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              id v99 = v59;
              __int16 v100 = 2112;
              id v101 = v60;
              _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_DEFAULT, "%@:%@: rejection 4.", buf, 0x16u);
            }
            uint64_t v61 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

            if (v61)
            {
              id v62 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
              [v62 setRejectionReasonCode:4];
            }
            uint64_t v63 = [objc_alloc(MEMORY[0x1E4F5CD90]) initWithStatus:0];

            v84[2](v84, (RTAuthorizedLocationStatus *)v63, 4, 0);
            CLLocationCoordinate2D v82 = (RTAuthorizedLocationStatus *)v63;
          }
        }
        _Block_object_dispose(&v92, 8);
      }
    }
    else
    {
      int v21 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        __int16 v23 = (char *)objc_claimAutoreleasedReturnValue();
        CLLocationCoordinate2D v24 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v99 = v23;
        __int16 v100 = 2112;
        id v101 = v24;
        _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ rejection 1.", buf, 0x16u);
      }
      __int16 v25 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];

      if (v25)
      {
        long long v26 = [(RTAuthorizedLocationMetrics *)v86->_metrics queryMetrics];
        [v26 setRejectionReasonCode:1];
      }
      v84[2](v84, v82, 1, 0);
    }
  }
}

void __70__RTAuthorizedLocationManager__fetchAuthorizedLocationExtendedStatus___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_fetchAuthorizedLocationExtendedStatusWithMetrics:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(RTAuthorizedLocationQueryMetrics);
  [(RTAuthorizedLocationMetrics *)self->_metrics setQueryMetrics:v5];

  uint64_t v6 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];
  [v6 startTimer];

  [(RTAuthorizedLocationManager *)self _fetchAuthorizedLocationExtendedStatus:v4];
  BOOL v7 = [(RTAuthorizedLocationMetrics *)self->_metrics queryMetrics];
  [v7 endTimer];

  CLLocationDegrees v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(RTAuthorizedLocationMetrics *)self->_metrics convertToDictionary];
    int v11 = 138412290;
    double v12 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "Metric, query, %@", (uint8_t *)&v11, 0xCu);
  }
  [(RTAuthorizedLocationMetrics *)self->_metrics timeSinceLastQueryMetricsSubmission];
  if (v10 > 3600.0) {
    [(RTAuthorizedLocationMetrics *)self->_metrics submitToCoreAnalytics];
  }
  [(RTAuthorizedLocationMetrics *)self->_metrics setQueryMetrics:0];
}

- (void)fetchAuthorizedLocationExtendedStatus:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v16 = "-[RTAuthorizedLocationManager fetchAuthorizedLocationExtendedStatus:]";
      __int16 v17 = 1024;
      LODWORD(v18) = 2287;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    BOOL v7 = [(RTNotifier *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__RTAuthorizedLocationManager_fetchAuthorizedLocationExtendedStatus___block_invoke;
    v13[3] = &unk_1E6B90CE0;
    v13[4] = self;
    id v14 = v5;
    dispatch_async(v7, v13);
  }
  else
  {
    CLLocationDegrees v8 = (void *)[objc_alloc(MEMORY[0x1E4F5CD90]) initWithStatus:0];
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      int v11 = (char *)objc_claimAutoreleasedReturnValue();
      double v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v16 = v11;
      __int16 v17 = 2112;
      double v18 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ feature not enabled or device not supported.", buf, 0x16u);
    }
    (*((void (**)(id, void *, uint64_t, void))v5 + 2))(v5, v8, -1, 0);
  }
}

uint64_t __69__RTAuthorizedLocationManager_fetchAuthorizedLocationExtendedStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAuthorizedLocationExtendedStatusWithMetrics:*(void *)(a1 + 40)];
}

- (void)_fetchAuthorizedLocations:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if (!v27)
  {
    id v4 = self;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v42 = 136315394;
      *(void *)&v42[4] = "-[RTAuthorizedLocationManager _fetchAuthorizedLocations:]";
      *(_WORD *)&v42[12] = 1024;
      *(_DWORD *)&v42[14] = 2305;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v42, 0x12u);
    }

    self = v4;
  }
  [(RTAuthorizedLocationManager *)self _updateMostRecentDateAtWhichDeviceDataIsTrusted];
  *(void *)id v42 = 0;
  *(void *)&v42[8] = v42;
  *(void *)&v42[16] = 0x3032000000;
  id v43 = __Block_byref_object_copy__46;
  uint64_t v44 = __Block_byref_object_dispose__46;
  id v45 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __57__RTAuthorizedLocationManager__fetchAuthorizedLocations___block_invoke;
  v34[3] = &unk_1E6B94AB8;
  v34[4] = v42;
  [(RTAuthorizedLocationManager *)self _curateAuthorizedLocationsWithHandler:v34];
  if (*(void *)(*(void *)&v42[8] + 40))
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = NSStringFromSelector(a2);
      uint64_t v10 = *(void *)(*(void *)&v42[8] + 40);
      *(_DWORD *)buf = 138412802;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v9;
      __int16 v39 = 2112;
      uint64_t v40 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, error curating authorized locations: %@", buf, 0x20u);
    }
    (*((void (**)(id, void, void))v27 + 2))(v27, 0, 0);
  }
  else
  {
    int v11 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = self->_authorizedLocationArr;
    uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          double v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          double v16 = [v15 loi];
          [v11 addObject:v16];

          __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            double v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v20 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            id v36 = v19;
            __int16 v37 = 2112;
            id v38 = v20;
            __int16 v39 = 2112;
            uint64_t v40 = (uint64_t)v15;
            _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: Authorized Locations: %@.", buf, 0x20u);
          }
        }
        uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v12);
    }

    int v21 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [v11 count];
      *(_DWORD *)buf = 138412802;
      id v36 = v23;
      __int16 v37 = 2112;
      id v38 = v24;
      __int16 v39 = 2048;
      uint64_t v40 = v25;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Returning %zu available authorized locations.", buf, 0x20u);
    }
    long long v26 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:v11];
    (*((void (**)(id, void *, void))v27 + 2))(v27, v26, 0);
  }
  _Block_object_dispose(v42, 8);
}

void __57__RTAuthorizedLocationManager__fetchAuthorizedLocations___block_invoke(uint64_t a1, void *a2)
{
}

- (void)fetchAuthorizedLocations:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v15 = "-[RTAuthorizedLocationManager fetchAuthorizedLocations:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 2335;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    BOOL v7 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__RTAuthorizedLocationManager_fetchAuthorizedLocations___block_invoke;
    v12[3] = &unk_1E6B90CE0;
    v12[4] = self;
    id v13 = v5;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
      int v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

uint64_t __56__RTAuthorizedLocationManager_fetchAuthorizedLocations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAuthorizedLocations:*(void *)(a1 + 40)];
}

- (void)_runEraseInstallDatabaseInitialization:(id)a3
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v80 = (void (**)(id, BOOL, void))a3;
  id v4 = [(RTAuthorizedLocationMetrics *)self->_metrics initializationMetrics];

  if (!v4)
  {
    id v5 = objc_alloc_init(RTAuthorizedLocationDatabaseInitializationMetrics);
    [(RTAuthorizedLocationMetrics *)self->_metrics setInitializationMetrics:v5];
  }
  uint64_t v6 = NSString;
  BOOL v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = NSStringFromSelector(a2);
  id v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];
  [v10 UTF8String];
  double v79 = (void *)os_transaction_create();

  int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v75 = (objc_class *)objc_opt_class();
    id v76 = NSStringFromClass(v75);
    uint64_t v77 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v76;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v77;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    double v15 = NSStringFromSelector(a2);
    unint64_t eraseInstallDatabaseInitializationAttemptCount = self->_eraseInstallDatabaseInitializationAttemptCount;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v102) = eraseInstallDatabaseInitializationAttemptCount;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: started, attempt count, %d.", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v102 = __Block_byref_object_copy__46;
  uint64_t v103 = __Block_byref_object_dispose__46;
  id v104 = 0;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  persistenceMirroringManager = self->_persistenceMirroringManager;
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke;
  v88[3] = &unk_1E6B94AE0;
  v88[4] = self;
  long long v90 = buf;
  SEL v91 = a2;
  id v19 = v17;
  long long v89 = v19;
  [(RTPersistenceMirroringManager *)persistenceMirroringManager performPeriodicSyncWithHandler:v88];
  BOOL v20 = (id *)(*(void *)&buf[8] + 40);
  id v21 = *(id *)(*(void *)&buf[8] + 40);
  dsema = v19;
  dispatch_time_t v22 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v23 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v23))
  {
    id v24 = [MEMORY[0x1E4F1C9C8] now];
    [v24 timeIntervalSinceDate:v22];
    double v26 = v25;
    id v27 = objc_opt_new();
    double v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
    BOOL v29 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v30 = [v29 filteredArrayUsingPredicate:v28];
    long long v31 = [v30 firstObject];

    [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
    long long v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v92 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
    }

    long long v33 = (void *)MEMORY[0x1E4F28C58];
    v105[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v92 = @"semaphore wait timeout";
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v105 count:1];
    uint64_t v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

    if (v35)
    {
      id v21 = v35;
    }
  }

  objc_storeStrong(v20, v21);
  if (*(void *)(*(void *)&buf[8] + 40)) {
    goto LABEL_21;
  }
  dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
  learnedLocationManager = self->_learnedLocationManager;
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_122;
  v84[3] = &unk_1E6B94AE0;
  __int16 v86 = buf;
  v84[4] = self;
  SEL v87 = a2;
  id v38 = v36;
  uint64_t v85 = v38;
  [(RTLearnedLocationManager *)learnedLocationManager trainForReason:1 mode:1 handler:v84];
  __int16 v39 = (id *)(*(void *)&buf[8] + 40);
  id v40 = *(id *)(*(void *)&buf[8] + 40);
  double v41 = v38;
  id v42 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v43 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v41, v43))
  {
    int v78 = [MEMORY[0x1E4F1C9C8] now];
    [v78 timeIntervalSinceDate:v42];
    double v45 = v44;
    uint64_t v46 = objc_opt_new();
    double v47 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_34];
    id v48 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v49 = [v48 filteredArrayUsingPredicate:v47];
    uint64_t v50 = [v49 firstObject];

    [v46 submitToCoreAnalytics:v50 type:1 duration:v45];
    uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v92 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
    }

    id v52 = (void *)MEMORY[0x1E4F28C58];
    v105[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v92 = @"semaphore wait timeout";
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v105 count:1];
    double v54 = [v52 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v53];

    if (v54)
    {
      id v40 = v54;
    }
  }

  objc_storeStrong(v39, v40);
  if (*(void *)(*(void *)&buf[8] + 40)
    || ![(RTAuthorizedLocationManager *)self _oneTimeRetroactivelyRegisterAllStoredVisits])
  {
LABEL_21:
    BOOL v55 = 0;
  }
  else
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_123;
    v83[3] = &unk_1E6B94B08;
    void v83[4] = self;
    v83[5] = buf;
    v83[6] = a2;
    [(RTAuthorizedLocationManager *)self _curateAuthorizedLocationsWithHandler:v83];
    BOOL v55 = [(NSArray *)self->_authorizedLocationArr count] != 0;
  }
  id v56 = [(RTAuthorizedLocationMetrics *)self->_metrics initializationMetrics];

  if (v56)
  {
    NSUInteger v57 = [(NSArray *)self->_authorizedLocationArr count];
    __int16 v58 = [(RTAuthorizedLocationMetrics *)self->_metrics initializationMetrics];
    [v58 setNumberOfALOIsGeneratedDuringEraseInstallInitialization:v57];

    uint64_t v59 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityAttemptCount"];
    uint64_t v60 = [(id)v59 integerValue];
    uint64_t v61 = [(RTAuthorizedLocationMetrics *)self->_metrics initializationMetrics];
    [v61 setEraseInstallInitializationAttemptCount:v60];

    id v62 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityStartDate"];
    LOBYTE(v59) = v62 == 0;

    if ((v59 & 1) == 0)
    {
      uint64_t v63 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTAuthorizedLocationEraseInstallInitActivityStartDate"];
      float v64 = [MEMORY[0x1E4F1C9C8] now];
      [v64 timeIntervalSinceDate:v63];
      double v66 = v65;

      uint64_t v67 = [(RTAuthorizedLocationMetrics *)self->_metrics initializationMetrics];
      LODWORD(v68) = vcvtmd_s64_f64(v66 / 3600.0);
      [v67 setEraseInstallInitializationCompletionTimeHours:v68];
    }
    -[RTAuthorizedLocationMetrics setLocationServicesEnabled:](self->_metrics, "setLocationServicesEnabled:", [MEMORY[0x1E4F1E600] locationServicesEnabled]);
    [(RTAuthorizedLocationMetrics *)self->_metrics setRoutineEnabled:[(RTAuthorizedLocationManager *)self _isRoutineEnabled]];
  }
  v80[2](v80, v55, *(void *)(*(void *)&buf[8] + 40));

  uint64_t v69 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    double v70 = (objc_class *)objc_opt_class();
    NSStringFromClass(v70);
    id v71 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v72 = NSStringFromSelector(a2);
    unint64_t v73 = self->_eraseInstallDatabaseInitializationAttemptCount;
    uint64_t v74 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)uint64_t v92 = 138413314;
    *(void *)&void v92[4] = v71;
    __int16 v93 = 2112;
    uint64_t v94 = v72;
    __int16 v95 = 1024;
    int v96 = v73;
    __int16 v97 = 1024;
    BOOL v98 = v55;
    __int16 v99 = 2112;
    uint64_t v100 = v74;
    _os_log_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_DEFAULT, "%@:%@: finished, attempt count, %d, status, %d, error, %@.", v92, 0x2Cu);
  }
  _Block_object_dispose(buf, 8);
}

void __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v9 = 138412802;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: sync executed, error: %@.", (uint8_t *)&v9, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v9 = 138412802;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: hindsight learning executed, error: %@.", (uint8_t *)&v9, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __70__RTAuthorizedLocationManager__runEraseInstallDatabaseInitialization___block_invoke_123(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v9 = [*(id *)(*(void *)(a1 + 32) + 96) count];
    int v10 = 138413058;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    __int16 v14 = 1024;
    int v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: curate authorized locations executed, created %d authorized locations, error: %@.", (uint8_t *)&v10, 0x26u);
  }
}

- (void)runEraseInstallDatabaseInitialization:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v15 = "-[RTAuthorizedLocationManager runEraseInstallDatabaseInitialization:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 2431;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: databaseInitCompletionHandler (in %s:%d)", buf, 0x12u);
    }
  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    BOOL v7 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__RTAuthorizedLocationManager_runEraseInstallDatabaseInitialization___block_invoke;
    v12[3] = &unk_1E6B90CE0;
    v12[4] = self;
    id v13 = v5;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      int v10 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      int v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

uint64_t __69__RTAuthorizedLocationManager_runEraseInstallDatabaseInitialization___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _runEraseInstallDatabaseInitialization:*(void *)(a1 + 40)];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 152) convertToDictionary];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "Metric, eraseInstallInitialization, %@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 152) submitToCoreAnalytics];
  return [*(id *)(*(void *)(a1 + 32) + 152) setInitializationMetrics:0];
}

- (void)eraseVisitLogDatabase:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v15 = "-[RTAuthorizedLocationManager eraseVisitLogDatabase:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 2452;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    uint64_t v7 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__RTAuthorizedLocationManager_eraseVisitLogDatabase___block_invoke;
    v12[3] = &unk_1E6B90CE0;
    v12[4] = self;
    id v13 = v5;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      int v10 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      int v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);
    }
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

void __53__RTAuthorizedLocationManager_eraseVisitLogDatabase___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) visitLogStore];
  id v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v3 purgeVisitLogsPredating:v2 handler:*(void *)(a1 + 40)];
}

- (void)fetchVisitLogsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTAuthorizedLocationManager fetchVisitLogsWithOptions:handler:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 2470;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  if (_os_feature_enabled_impl() && self->_isSupportedDevice)
  {
    int v10 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__RTAuthorizedLocationManager_fetchVisitLogsWithOptions_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    void block[4] = self;
    id v16 = v7;
    id v17 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: feature not enabled or device not supported.", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __65__RTAuthorizedLocationManager_fetchVisitLogsWithOptions_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) visitLogStore];
  [v2 fetchVisitLogsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (BOOL)isSupportedDevice
{
  return self->_isSupportedDevice;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (NSArray)authorizedLocationArr
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAuthorizedLocationArr:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (NSDate)dateOfLastAuthorizedLocationsCuration
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDateOfLastAuthorizedLocationsCuration:(id)a3
{
}

- (RTAuthorizedLocationVisitLogStore)visitLogStore
{
  return self->_visitLogStore;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (BOOL)isUnlockedSinceBoot
{
  return self->_isUnlockedSinceBoot;
}

- (void)setIsUnlockedSinceBoot:(BOOL)a3
{
  self->_isUnlockedSinceBoot = a3;
}

- (RTTrustedTimeCache)trustedTimeCache
{
  return self->_trustedTimeCache;
}

- (BOOL)allowUnsecureTimeFallback
{
  return self->_allowUnsecureTimeFallback;
}

- (void)setAllowUnsecureTimeFallback:(BOOL)a3
{
  self->_BOOL allowUnsecureTimeFallback = a3;
}

- (RTAuthorizedLocationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (RTPersistenceMirroringManager)persistenceMirroringManager
{
  return self->_persistenceMirroringManager;
}

- (BOOL)isEraseInstallDatabaseInitializationRequired
{
  return self->_isEraseInstallDatabaseInitializationRequired;
}

- (void)setIsEraseInstallDatabaseInitializationRequired:(BOOL)a3
{
  self->_isEraseInstallDatabaseInitializationRequired = a3;
}

- (unint64_t)eraseInstallDatabaseInitializationMaxAttemptCount
{
  return self->_eraseInstallDatabaseInitializationMaxAttemptCount;
}

- (void)setEraseInstallDatabaseInitializationMaxAttemptCount:(unint64_t)a3
{
  self->_unint64_t eraseInstallDatabaseInitializationMaxAttemptCount = a3;
}

- (unint64_t)eraseInstallDatabaseInitializationAttemptCount
{
  return self->_eraseInstallDatabaseInitializationAttemptCount;
}

- (void)setEraseInstallDatabaseInitializationAttemptCount:(unint64_t)a3
{
  self->_unint64_t eraseInstallDatabaseInitializationAttemptCount = a3;
}

- (NSDate)eraseInstallInitializationStartDate
{
  return self->_eraseInstallInitializationStartDate;
}

- (void)setEraseInstallInitializationStartDate:(id)a3
{
}

- (RTXPCActivityCriteria)eraseInstallInitializationXpcCriteria
{
  return self->_eraseInstallInitializationXpcCriteria;
}

- (void)setEraseInstallInitializationXpcCriteria:(id)a3
{
}

- (RTAuthorizedLocationStatus)overrideAuthorizedLocationStatus
{
  return (RTAuthorizedLocationStatus *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOverrideAuthorizedLocationStatus:(id)a3
{
}

- (BOOL)relaxTrustedTimeRequirement
{
  return self->_relaxTrustedTimeRequirement;
}

- (void)setRelaxTrustedTimeRequirement:(BOOL)a3
{
  self->_relaxTrustedTimeRequirement = a3;
}

- (BOOL)forceTrustedTimeUnavailability
{
  return self->_forceTrustedTimeUnavailability;
}

- (void)setForceTrustedTimeUnavailability:(BOOL)a3
{
  self->_forceTrustedTimeUnavailability = a3;
}

- (RTAuthorizedLocationBiometricsManager)biometricsManager
{
  return self->_biometricsManager;
}

- (NSDate)mostRecentDateAtWhichDeviceDataIsTrusted
{
  return self->_mostRecentDateAtWhichDeviceDataIsTrusted;
}

- (void)setMostRecentDateAtWhichDeviceDataIsTrusted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentDateAtWhichDeviceDataIsTrusted, 0);
  objc_storeStrong((id *)&self->_biometricsManager, 0);
  objc_storeStrong((id *)&self->_overrideAuthorizedLocationStatus, 0);
  objc_storeStrong((id *)&self->_eraseInstallInitializationXpcCriteria, 0);
  objc_storeStrong((id *)&self->_eraseInstallInitializationStartDate, 0);
  objc_storeStrong((id *)&self->_persistenceMirroringManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_trustedTimeCache, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitLogStore, 0);
  objc_storeStrong((id *)&self->_dateOfLastAuthorizedLocationsCuration, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationArr, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);

  objc_storeStrong((id *)&self->_platform, 0);
}

@end