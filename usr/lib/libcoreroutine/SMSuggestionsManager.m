@interface SMSuggestionsManager
+ (int64_t)periodicPurgePolicy;
- (BOOL)_checkInitiatorEligibilityWithError:(id *)a3;
- (BOOL)_checkReceiverEligibilityForHandle:(id)a3 error:(id *)a4;
- (BOOL)_deleteProactiveNotificationUponNavigationDestination:(id)a3 error:(id *)a4;
- (BOOL)_deleteProactiveNotificationWithDestinationLocation:(id)a3 error:(id *)a4;
- (BOOL)_deleteProactiveNotificationWithError:(id *)a3;
- (BOOL)_didInteractInPastWithHandle:(id)a3 timeInterval:(double)a4 error:(id *)a5;
- (BOOL)_isEffectivePairedDeviceNearby;
- (BOOL)_isFirstTimeUserOfZelkovaWithError:(id *)a3;
- (BOOL)_isSessionConfigurationSimilarToTheSuggestion:(id)a3 sessionConfiguration:(id)a4 error:(id *)a5;
- (BOOL)_isUserInActiveSessionWithError:(id *)a3;
- (BOOL)_isValidForNextTimePrompt;
- (BOOL)_isWalkingBoutDetectedByAppendingPedometerData:(id)a3;
- (BOOL)_reRegisterForPedometerNotificationsForLearnedLocationOfInterest:(id)a3 startDate:(id)a4 error:(id *)a5;
- (BOOL)_refreshCurrentLocationWithError:(id *)a3;
- (BOOL)_registerForPedometerNotificationsForLearnedLocationOfInterest:(id)a3 startDate:(id)a4 error:(id *)a5;
- (BOOL)_resetStatesForPedometerData;
- (BOOL)_setupPedometerDataHandler;
- (BOOL)_setupPedometerNotificationsIfExists:(id *)a3;
- (BOOL)_shouldShowProactiveSuggestions;
- (BOOL)_showSuggestionsDetectionUIWithSuggestion:(id)a3 error:(id *)a4;
- (BOOL)_unregisterForPedometerNotificationsWithError:(id *)a3;
- (BOOL)isPedometerNotificationsSetupAfterRoutineStarted;
- (BOOL)isZelkovaSuggestionsFeatureEnabledWithError:(id *)a3;
- (BOOL)routineEnabled;
- (BOOL)suggestionEnabledForUserType:(unint64_t)a3;
- (NSDate)pedometerStartDate;
- (NSMutableSet)pedometerUUIDs;
- (RTAuthorizationManager)authorizationManager;
- (RTContactsManager)contactsManager;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTDistanceCalculator)distanceCalculator;
- (RTHealthKitManager)healthKitManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLearnedLocationOfInterest)currentLOI;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocation)latestLocationOfTheDevice;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTMotionActivityPedometerData)previousPedometerData;
- (RTNavigationManager)navigationManager;
- (RTPlatform)platform;
- (RTVisitManager)visitManager;
- (RTXPCTimerAlarm)walkingTriggerAlarm;
- (SMAppDeletionManager)appDeletionManager;
- (SMEligibilityChecker)eligibilityChecker;
- (SMMessagingService)messagingService;
- (SMSessionStore)sessionStore;
- (SMSuggestionsHelper)suggestionsHelper;
- (SMSuggestionsManager)initWithAuthorizationManager:(id)a3 contactsManager:(id)a4 defaultsManager:(id)a5 deviceLocationPredictor:(id)a6 distanceCalculator:(id)a7 healthKitManager:(id)a8 learnedLocationStore:(id)a9 learnedLocationManager:(id)a10 locationManager:(id)a11 mapServiceManager:(id)a12 messagingService:(id)a13 motionActivityManager:(id)a14 navigationManager:(id)a15 platform:(id)a16 visitManager:(id)a17 sessionStore:(id)a18 suggestionsStore:(id)a19 suggestionsHelper:(id)a20 appDeletionManager:(id)a21;
- (SMSuggestionsMetricsManager)suggestionsMetricsManager;
- (SMSuggestionsStore)suggestionsStore;
- (id)_generatePersonalizedSuggestionForFirstTimeUserFromContext:(id)a3 error:(id *)a4;
- (id)_generatePersonalizedSuggestionForOccasionalUserFromContext:(id)a3 error:(id *)a4;
- (id)_generatePersonalizedSuggestionForRegularUserFromContext:(id)a3 error:(id *)a4;
- (id)_generatePersonalizedSuggestionForWorkoutUserFromContext:(id)a3 error:(id *)a4;
- (id)_generatePersonalizedSuggestionFromContext:(id)a3 error:(id *)a4;
- (id)_getCurrentDateFromContext:(id)a3 error:(id *)a4;
- (id)_getFirstEligibleHandleFromSessionConfigurations:(id)a3 error:(id *)a4;
- (id)_getMessagesURLFromSessionConfig:(id)a3 payloadType:(int64_t)a4 error:(id *)a5;
- (id)_getNPLOIsToHomeWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6;
- (id)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6;
- (id)_getNotificationExpirationDateForSuggestion:(id)a3 error:(id *)a4;
- (id)_getSessionConfigurationsWithOptions:(id)a3 error:(id *)a4;
- (id)_getSourceLocationFromContext:(id)a3 error:(id *)a4;
- (id)_getSuggestionBodyWithPlaceInference:(id)a3;
- (id)_getSuggestionTitleWithHandle:(id)a3 error:(id *)a4;
- (id)_getSuggestionsFooter:(id)a3;
- (id)_getSunriseDateAtLocation:(id)a3 date:(id)a4 error:(id *)a5;
- (id)_getSunsetDateAtLocation:(id)a3 date:(id)a4 error:(id *)a5;
- (id)_getSystemVersionUpdateDate;
- (id)_getValuesFromDefaultsIfExists:(id)a3 error:(id *)a4;
- (id)_runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 error:(id *)a5;
- (id)pedometerDataHandler;
- (unint64_t)_getSuggestionTriggerFromContext:(id)a3 error:(id *)a4;
- (unint64_t)_suppressSuggestion:(id)a3 context:(id)a4 error:(id *)a5;
- (void)_changeWidgetVisibilityForMessagesInstallationState:(BOOL)a3;
- (void)_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3;
- (void)_fetchSuggestedSessionConfigurationWithHandler:(id)a3;
- (void)_generateSuggestionFromCurrentHealthKitWorkoutSnapshot:(id)a3;
- (void)_launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4;
- (void)_logStatesForPedometerData;
- (void)_onAuthorizationNotification:(id)a3;
- (void)_onHealthKitNotification:(id)a3;
- (void)_onLearnedLocationManagerNotification:(id)a3;
- (void)_onNavigationNotification:(id)a3;
- (void)_onSessionEndedForActiveDevice:(BOOL)a3;
- (void)_onSessionStartedWithConfiguration:(id)a3;
- (void)_onVehicleConnectedNotification:(id)a3;
- (void)_onVisitManagerNotification:(id)a3;
- (void)_sendTipsSignal;
- (void)_setup;
- (void)_shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)_shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)_triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:(BOOL)a3;
- (void)_updateSafetyMonitorWorkoutSuggestionWidget;
- (void)_updateSystemVersionInDefaults;
- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3;
- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3;
- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3;
- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4;
- (void)onAuthorizationNotification:(id)a3;
- (void)onHealthKitNotification:(id)a3;
- (void)onLearnedLocationManagerNotification:(id)a3;
- (void)onMessagesAppInstalled;
- (void)onMessagesAppUninstalled;
- (void)onNavigationNotification:(id)a3;
- (void)onSessionEndedForActiveDevice:(BOOL)a3;
- (void)onSessionStartedWithConfiguration:(id)a3;
- (void)onVehicleConnectedNotification:(id)a3;
- (void)onVisitManagerNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5;
- (void)setCurrentLOI:(id)a3;
- (void)setIsPedometerNotificationsSetupAfterRoutineStarted:(BOOL)a3;
- (void)setLatestLocationOfTheDevice:(id)a3;
- (void)setPedometerDataHandler:(id)a3;
- (void)setPedometerStartDate:(id)a3;
- (void)setPedometerUUIDs:(id)a3;
- (void)setPreviousPedometerData:(id)a3;
- (void)setRoutineEnabled:(BOOL)a3;
- (void)setSuggestionsMetricsManager:(id)a3;
- (void)setWalkingTriggerAlarm:(id)a3;
- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5;
- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4;
- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4;
@end

@implementation SMSuggestionsManager

- (void)_sendTipsSignal
{
  if (qword_1EA8D4FC0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DA0D7010();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA8D4FC8);
  v1 = sub_1DA0D6FF0();
  os_log_type_t v2 = sub_1DA0D7040();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v11 = v4;
    *(_DWORD *)v3 = 136315138;
    sub_1D9C35EB8(0xD000000000000011, 0x80000001DA100A30, &v11);
    sub_1DA0D7050();
    _os_log_impl(&dword_1D9BFA000, v1, v2, "%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E016DF30](v4, -1, -1);
    MEMORY[0x1E016DF30](v3, -1, -1);
  }

  id v5 = [BiomeLibrary() discoverability];
  swift_unknownObjectRelease();
  id v6 = [v5 sel_Signals];
  swift_unknownObjectRelease();
  id v7 = [v6 sel_source];

  id v8 = objc_allocWithZone(MEMORY[0x1E4F4FE08]);
  v9 = (void *)sub_1DA0D7020();
  id v10 = [v8 sel_initWithContentIdentifier_context_osBuild_userInfo_:v9, 0, 0, 0];

  [v7 sendEvent:v10];
}

- (SMSuggestionsManager)initWithAuthorizationManager:(id)a3 contactsManager:(id)a4 defaultsManager:(id)a5 deviceLocationPredictor:(id)a6 distanceCalculator:(id)a7 healthKitManager:(id)a8 learnedLocationStore:(id)a9 learnedLocationManager:(id)a10 locationManager:(id)a11 mapServiceManager:(id)a12 messagingService:(id)a13 motionActivityManager:(id)a14 navigationManager:(id)a15 platform:(id)a16 visitManager:(id)a17 sessionStore:(id)a18 suggestionsStore:(id)a19 suggestionsHelper:(id)a20 appDeletionManager:(id)a21
{
  id v74 = a3;
  id v54 = a4;
  id v26 = a4;
  id v73 = a5;
  id v55 = a6;
  id v72 = a6;
  id v71 = a7;
  id v70 = a8;
  id v69 = a9;
  id v68 = a10;
  id v67 = a11;
  id v66 = a12;
  id v58 = a13;
  id v57 = a14;
  id v65 = a15;
  id v64 = a16;
  id v63 = a17;
  id v62 = a18;
  id v61 = a19;
  id v60 = a20;
  id v27 = a21;
  v59 = v27;
  if (!v74)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: authorizationManager";
LABEL_53:
    _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, v50, buf, 2u);
    goto LABEL_54;
  }
  if (!v26)
  {
    v28 = 0;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: contactsManager";
    goto LABEL_53;
  }
  if (!v73)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_53;
  }
  if (!v72)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: deviceLocationPredictor";
    goto LABEL_53;
  }
  if (!v71)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_53;
  }
  if (!v70)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_53;
  }
  if (!v69)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_53;
  }
  if (!v68)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_53;
  }
  if (!v67)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_53;
  }
  if (!v66)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_53;
  }
  if (!v65)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_53;
  }
  if (!v64)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: platform";
    goto LABEL_53;
  }
  if (!v63)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_53;
  }
  if (!v62)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_53;
  }
  if (!v61)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: suggestionsStore";
    goto LABEL_53;
  }
  if (!v60)
  {
    v28 = v26;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v50 = "Invalid parameter not satisfying: suggestionsHelper";
      goto LABEL_53;
    }
LABEL_54:

    v45 = 0;
    v46 = v74;
    v48 = v57;
    v47 = v58;
LABEL_55:
    v44 = self;
    goto LABEL_56;
  }
  v28 = v26;
  if (!v27)
  {
    v52 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = v74;
    v48 = v57;
    v47 = v58;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: appDeletionManager", buf, 2u);
    }

    v45 = 0;
    goto LABEL_55;
  }
  v75.receiver = self;
  v75.super_class = (Class)SMSuggestionsManager;
  v29 = [(RTNotifier *)&v75 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_authorizationManager, a3);
    objc_storeStrong((id *)&v30->_contactsManager, v54);
    objc_storeStrong((id *)&v30->_defaultsManager, a5);
    objc_storeStrong((id *)&v30->_deviceLocationPredictor, v55);
    objc_storeStrong((id *)&v30->_distanceCalculator, a7);
    objc_storeStrong((id *)&v30->_healthKitManager, a8);
    objc_storeStrong((id *)&v30->_learnedLocationStore, a9);
    objc_storeStrong((id *)&v30->_learnedLocationManager, a10);
    objc_storeStrong((id *)&v30->_locationManager, a11);
    objc_storeStrong((id *)&v30->_mapServiceManager, a12);
    objc_storeStrong((id *)&v30->_messagingService, a13);
    objc_storeStrong((id *)&v30->_motionActivityManager, a14);
    objc_storeStrong((id *)&v30->_navigationManager, a15);
    uint64_t v31 = objc_opt_new();
    notificationHelper = v30->_notificationHelper;
    v30->_notificationHelper = (RTDarwinNotificationHelper *)v31;

    objc_storeStrong((id *)&v30->_platform, a16);
    id v33 = objc_alloc(MEMORY[0x1E4F99860]);
    dispatch_queue_t v34 = dispatch_queue_create("com.apple.CoreRoutine.SuggestionsManager.EligibilityChecker", 0);
    uint64_t v35 = [v33 initWithQueue:v34];
    eligibilityChecker = v30->_eligibilityChecker;
    v30->_eligibilityChecker = (SMEligibilityChecker *)v35;

    objc_storeStrong((id *)&v30->_sessionStore, a18);
    objc_storeStrong((id *)&v30->_suggestionsStore, a19);
    objc_storeStrong((id *)&v30->_visitManager, a17);
    objc_storeStrong((id *)&v30->_suggestionsHelper, a20);
    objc_storeStrong((id *)&v30->_appDeletionManager, a21);
    latestLocationOfTheDevice = v30->_latestLocationOfTheDevice;
    v30->_latestLocationOfTheDevice = 0;

    uint64_t v38 = objc_opt_new();
    pedometerUUIDs = v30->_pedometerUUIDs;
    v30->_pedometerUUIDs = (NSMutableSet *)v38;

    previousPedometerData = v30->_previousPedometerData;
    v30->_previousPedometerData = 0;

    currentLOI = v30->_currentLOI;
    v30->_currentLOI = 0;

    v30->_isPedometerNotificationsSetupAfterRoutineStarted = 0;
    v42 = [[SMSuggestionsMetricsManager alloc] initWithDefaultsManager:v73 deviceLocationPredictor:v72 sessionStore:v62 suggestionsStore:v61];
    suggestionsMetricsManager = v30->_suggestionsMetricsManager;
    v30->_suggestionsMetricsManager = v42;

    [(RTService *)v30 setup];
  }
  v44 = v30;
  v45 = v44;
  v46 = v74;
  v48 = v57;
  v47 = v58;
LABEL_56:

  return v45;
}

- (void)_setup
{
  if ([(SMSuggestionsManager *)self isZelkovaSuggestionsFeatureEnabledWithError:0])
  {
    v3 = [(SMSuggestionsManager *)self authorizationManager];
    uint64_t v4 = +[RTNotification notificationName];
    [v3 addObserver:self selector:sel_onAuthorizationNotification_ name:v4];

    id v5 = [(SMSuggestionsManager *)self visitManager];
    id v6 = +[RTNotification notificationName];
    [v5 addObserver:self selector:sel_onVisitManagerNotification_ name:v6];

    id v7 = [(SMSuggestionsManager *)self healthKitManager];
    id v8 = +[RTNotification notificationName];
    [v7 addObserver:self selector:sel_onHealthKitNotification_ name:v8];

    v9 = [(SMSuggestionsManager *)self healthKitManager];
    id v10 = +[RTNotification notificationName];
    [v9 addObserver:self selector:sel_onHealthKitNotification_ name:v10];

    uint64_t v11 = [(SMSuggestionsManager *)self navigationManager];
    v12 = +[RTNotification notificationName];
    [v11 addObserver:self selector:sel_onNavigationNotification_ name:v12];

    v13 = [(SMSuggestionsManager *)self motionActivityManager];
    v14 = +[RTNotification notificationName];
    [v13 addObserver:self selector:sel_onVehicleConnectedNotification_ name:v14];

    v15 = [(SMSuggestionsManager *)self learnedLocationManager];
    v16 = +[RTNotification notificationName];
    [v15 addObserver:self selector:sel_onLearnedLocationManagerNotification_ name:v16];

    [(SMSuggestionsManager *)self _setupPedometerDataHandler];
    [(SMSuggestionsManager *)self _updateSystemVersionInDefaults];
    id v17 = [(SMSuggestionsManager *)self appDeletionManager];
    [v17 addObserver:self];
  }
}

- (void)_updateSystemVersionInDefaults
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SMSuggestionsManager *)self defaultsManager];
  id v5 = [v4 objectForKey:@"RTDefaultsSuggestionsManagerSystemVersion"];

  id v6 = [(SMSuggestionsManager *)self defaultsManager];
  id v7 = [v6 objectForKey:@"RTDefaultsSuggestionsManagerSystemVersionUpdateDate"];

  id v8 = [(SMSuggestionsManager *)self platform];
  v9 = [v8 systemVersion];
  int v10 = [v5 isEqualToString:v9];

  if (v10 && v7)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = NSStringFromSelector(a2);
      v15 = [v7 stringFromDate];
      int v25 = 138413058;
      id v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      __int16 v29 = 2112;
      v30 = v5;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, skipping version update - current values, systemVersion, %@, systemVersionUpdateDate, %@", (uint8_t *)&v25, 0x2Au);
    }
    v16 = v7;
    id v17 = v5;
  }
  else
  {
    v18 = [(SMSuggestionsManager *)self platform];
    id v17 = [v18 systemVersion];

    v19 = [(SMSuggestionsManager *)self defaultsManager];
    [v19 setObject:v17 forKey:@"RTDefaultsSuggestionsManagerSystemVersion"];

    v16 = [MEMORY[0x1E4F1C9C8] date];

    v20 = [(SMSuggestionsManager *)self defaultsManager];
    [v20 setObject:v16 forKey:@"RTDefaultsSuggestionsManagerSystemVersionUpdateDate"];

    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = NSStringFromSelector(a2);
      v24 = [v16 stringFromDate];
      int v25 = 138413058;
      id v26 = v22;
      __int16 v27 = 2112;
      v28 = v23;
      __int16 v29 = 2112;
      v30 = v17;
      __int16 v31 = 2112;
      v32 = v24;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, setting RTDefaultsSuggestionsManagerSystemVersion, %@, RTDefaultsSuggestionsManagerSystemVersionUpdateDate, %@", (uint8_t *)&v25, 0x2Au);
    }
  }
}

- (id)_getSystemVersionUpdateDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SMSuggestionsManager *)self defaultsManager];
  uint64_t v4 = [v3 objectForKey:@"RTDefaultsSuggestionsManagerSystemVersionUpdateDate"];

  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    v9 = [v4 stringFromDate];
    int v11 = 138412802;
    v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, RTDefaultsSuggestionsManagerSystemVersionUpdateDate, %@", (uint8_t *)&v11, 0x20u);
  }

  return v4;
}

- (void)onAuthorizationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SMSuggestionsManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__SMSuggestionsManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onAuthorizationNotification:*(void *)(a1 + 40)];
}

- (void)_onAuthorizationNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    -[SMSuggestionsManager setRoutineEnabled:](self, "setRoutineEnabled:", [v5 enabled]);
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [(SMSuggestionsManager *)self routineEnabled];
      int v11 = @"NO";
      if (v10) {
        int v11 = @"YES";
      }
      int v14 = 138412290;
      __int16 v15 = v11;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      __int16 v13 = [v5 name];
      int v14 = 138412546;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SMSuggestionsManager_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__SMSuggestionsManager_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationManagerNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = v5;
    BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      NSStringFromSelector(a2);
      __int16 v13 = (char *)objc_claimAutoreleasedReturnValue();
      if ([v9 available]) {
        int v14 = @"YES";
      }
      else {
        int v14 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      if ([(SMSuggestionsManager *)self isPedometerNotificationsSetupAfterRoutineStarted])
      {
        __int16 v15 = @"YES";
      }
      else
      {
        __int16 v15 = @"NO";
      }
      id v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v14;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, learned location manager available, %@, isPedometerNotificationsSetupAfterRoutineStarted, %@", buf, 0x2Au);
    }
    if ([v9 available]
      && ![(SMSuggestionsManager *)self isPedometerNotificationsSetupAfterRoutineStarted])
    {
      uint64_t v16 = 0;
      [(SMSuggestionsManager *)self _setupPedometerNotificationsIfExists:&v16];
      [(SMSuggestionsManager *)self setIsPedometerNotificationsSetupAfterRoutineStarted:1];
    }
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v5;
      __int16 v19 = 2080;
      v20 = "-[SMSuggestionsManager _onLearnedLocationManagerNotification:]";
      __int16 v21 = 1024;
      LODWORD(v22) = 390;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

- (void)onVisitManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SMSuggestionsManager_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__SMSuggestionsManager_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVisitManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onVisitManagerNotification:(id)a3
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = v5;
    BOOL v10 = [v9 visitIncident];
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      int v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v96 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, received visit notification, %@", buf, 0x20u);
    }
    if ([v10 type] == 1)
    {
      __int16 v15 = [v10 location];
      id v87 = 0;
      BOOL v16 = [(SMSuggestionsManager *)self _deleteProactiveNotificationWithDestinationLocation:v15 error:&v87];
      uint64_t v17 = v87;

      if (v17)
      {
        id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          uint64_t v21 = NSStringFromSelector(a2);
          v22 = (void *)v21;
          __int16 v23 = @"NO";
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v20;
          *(_WORD *)&buf[12] = 2112;
          if (v16) {
            __int16 v23 = @"YES";
          }
          *(void *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2112;
          v96 = (uint64_t (*)(uint64_t, uint64_t))v23;
          LOWORD(v97) = 2112;
          *(void *)((char *)&v97 + 2) = v17;
          _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@, %@, delete proactive notification status, %@, error, %@,", buf, 0x2Au);
        }
      }
      else
      {
        dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v96 = __Block_byref_object_copy__102;
        *(void *)&long long v97 = __Block_byref_object_dispose__102;
        *((void *)&v97 + 1) = 0;
        uint64_t v81 = 0;
        v82 = &v81;
        uint64_t v83 = 0x3032000000;
        v84 = __Block_byref_object_copy__102;
        v85 = __Block_byref_object_dispose__102;
        id v86 = 0;
        v37 = [(SMSuggestionsManager *)self learnedLocationManager];
        uint64_t v38 = [v10 placeInference];
        v39 = [v38 loiIdentifier];
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __52__SMSuggestionsManager__onVisitManagerNotification___block_invoke;
        v77[3] = &unk_1E6B90B28;
        v79 = buf;
        v80 = &v81;
        v40 = v36;
        v78 = v40;
        [v37 fetchLocationOfInterestWithIdentifier:v39 handler:v77];

        id v18 = v40;
        id v73 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v41 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v18, v41)) {
          goto LABEL_28;
        }
        id v72 = [MEMORY[0x1E4F1C9C8] now];
        [v72 timeIntervalSinceDate:v73];
        double v43 = v42;
        id v71 = objc_opt_new();
        v44 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
        v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        v46 = [v45 filteredArrayUsingPredicate:v44];
        v47 = [v46 firstObject];

        [v71 submitToCoreAnalytics:v47 type:1 duration:v43];
        v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v88 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v88, 2u);
        }

        v49 = (void *)MEMORY[0x1E4F28C58];
        v98[0] = *MEMORY[0x1E4F28568];
        *(void *)v88 = @"semaphore wait timeout";
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v98 count:1];
        v51 = [v49 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v50];

        if (v51)
        {
          id v52 = v51;
        }
        else
        {
LABEL_28:
          id v52 = 0;
        }

        id v57 = (__CFString *)v52;
        if (v57 || v82[5])
        {
          id v58 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            id v67 = (objc_class *)objc_opt_class();
            NSStringFromClass(v67);
            id v68 = (id)objc_claimAutoreleasedReturnValue();
            id v69 = NSStringFromSelector(a2);
            id v70 = v82[5];
            *(_DWORD *)v88 = 138413058;
            *(void *)&v88[4] = v68;
            __int16 v89 = 2112;
            uint64_t v90 = (uint64_t)v69;
            __int16 v91 = 2112;
            v92 = v57;
            __int16 v93 = 2112;
            v94 = v70;
            _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "%@, %@, sema error, %@, fetch loi error, %@", v88, 0x2Au);
          }
          uint64_t v17 = 0;
        }
        else
        {
          uint64_t v59 = *(void *)(*(void *)&buf[8] + 40);
          id v60 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1800.0];
          id v76 = 0;
          BOOL v61 = [(SMSuggestionsManager *)self _reRegisterForPedometerNotificationsForLearnedLocationOfInterest:v59 startDate:v60 error:&v76];
          uint64_t v17 = v76;

          id v58 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            id v62 = (objc_class *)objc_opt_class();
            NSStringFromClass(v62);
            id v63 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v64 = NSStringFromSelector(a2);
            id v65 = (void *)v64;
            id v66 = @"NO";
            *(_DWORD *)v88 = 138413058;
            *(void *)&v88[4] = v63;
            __int16 v89 = 2112;
            if (v61) {
              id v66 = @"YES";
            }
            uint64_t v90 = v64;
            __int16 v91 = 2112;
            v92 = v66;
            __int16 v93 = 2112;
            v94 = v17;
            _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, %@, register for pedometer notifications status, %@, error, %@", v88, 0x2Au);
          }
        }

        _Block_object_dispose(&v81, 8);
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      if ([v10 type] != 3)
      {
LABEL_36:

        goto LABEL_37;
      }
      v24 = [v10 exit];
      uint64_t v25 = [v10 entry];
      [v24 timeIntervalSinceDate:v25];
      double v27 = v26;

      v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        __int16 v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        __int16 v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2048;
        v96 = *(uint64_t (**)(uint64_t, uint64_t))&v27;
        LOWORD(v97) = 2048;
        *(void *)((char *)&v97 + 2) = 0x408C200000000000;
        _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, visit duration, %f, kSMSuggestionVisitExitTriggerMinDuration, %f", buf, 0x2Au);
      }
      if (v27 >= 900.0)
      {
        id v75 = 0;
        v32 = [(SMSuggestionsManager *)self _runProactiveSuggestionsEngineWithContext:v10 shouldStoreSuggestions:1 error:&v75];
        id v18 = v75;
        v53 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          id v54 = (objc_class *)objc_opt_class();
          id v55 = NSStringFromClass(v54);
          v56 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v55;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 2112;
          v96 = (uint64_t (*)(uint64_t, uint64_t))v32;
          LOWORD(v97) = 2112;
          *(void *)((char *)&v97 + 2) = v18;
          _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);
        }
      }
      else
      {
        v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = (objc_class *)objc_opt_class();
          dispatch_queue_t v34 = NSStringFromClass(v33);
          uint64_t v35 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, %@, proactive engine not triggered", buf, 0x16u);
        }
        id v18 = 0;
      }

      id v74 = v18;
      [(SMSuggestionsManager *)self _unregisterForPedometerNotificationsWithError:&v74];
      uint64_t v17 = v74;
    }

    goto LABEL_36;
  }
  v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[SMSuggestionsManager _onVisitManagerNotification:]";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v96) = 503;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
  }
LABEL_37:
}

void __52__SMSuggestionsManager__onVisitManagerNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onHealthKitNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SMSuggestionsManager_onHealthKitNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__SMSuggestionsManager_onHealthKitNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onHealthKitNotification:*(void *)(a1 + 40)];
}

- (void)_onHealthKitNotification:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [(SMSuggestionsManager *)self healthKitManager];
    BOOL v10 = [(SMSuggestionsManager *)self healthKitManager];
    id v11 = [v10 _getWorkoutDefaultStartDateForRaceRoute];
    id v12 = [(SMSuggestionsManager *)self healthKitManager];
    __int16 v13 = [v12 _getRTWorkoutDefaultTypesForSMSuggestions];
    id v34 = 0;
    int v14 = [v9 getLatestWorkoutWithStartDate:v11 nearLocation:0 distanceThreshold:0 onlySourcedFromFitnessApp:0 includePastureModeRoutes:v13 workoutTypes:&v34 error:1.79769313e308];
    id v15 = v34;

    BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      NSStringFromSelector(a2);
      __int16 v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v36 = v18;
      __int16 v37 = 2112;
      uint64_t v38 = v19;
      __int16 v39 = 2112;
      v40 = v14;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, %@, received workout notification for new workout, %@", buf, 0x20u);
    }
    id v33 = v15;
    v20 = [(SMSuggestionsManager *)self _runProactiveSuggestionsEngineWithContext:v14 shouldStoreSuggestions:1 error:&v33];
    id v21 = v33;

    v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      NSStringFromSelector(a2);
      uint64_t v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      id v36 = v24;
      __int16 v37 = 2112;
      uint64_t v38 = v25;
      __int16 v39 = 2112;
      v40 = v20;
      __int16 v41 = 2112;
      id v42 = v21;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);
    }
  }
  else
  {
    double v26 = [v5 name];
    double v27 = +[RTNotification notificationName];
    int v28 = [v26 isEqualToString:v27];

    if (v28)
    {
      __int16 v29 = [(SMSuggestionsManager *)self defaultsManager];
      v30 = [v29 objectForKey:@"RTDefaultsWorkoutOngoing"];
      uint64_t v31 = [v30 BOOLValue];

      [(SMSuggestionsManager *)self _triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:v31];
    }
    else
    {
      v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v36 = v5;
        __int16 v37 = 2080;
        uint64_t v38 = "-[SMSuggestionsManager _onHealthKitNotification:]";
        __int16 v39 = 1024;
        LODWORD(v40) = 550;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
      }
    }
  }
}

- (void)_triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    BOOL v17 = v3;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, shouldGenerateURL: %{Bool}d", buf, 0x1Cu);
  }
  if (v3)
  {
    BOOL v10 = [(SMSuggestionsManager *)self healthKitManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke;
    v11[3] = &unk_1E6B994C0;
    v11[4] = self;
    [v10 fetchCurrentWorkoutSnapshotWithHandler:v11];
  }
  else
  {
    [(SMSuggestionsManager *)self _updateSafetyMonitorWorkoutSuggestionWidget];
  }
}

void __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke_2;
  v6[3] = &unk_1E6B90BF0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _generateSuggestionFromCurrentHealthKitWorkoutSnapshot:*(void *)(a1 + 40)];
  os_log_type_t v2 = *(void **)(a1 + 32);

  return [v2 _updateSafetyMonitorWorkoutSuggestionWidget];
}

- (void)_generateSuggestionFromCurrentHealthKitWorkoutSnapshot:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = 0;
    id v4 = [(SMSuggestionsManager *)self _runProactiveSuggestionsEngineWithContext:a3 shouldStoreSuggestions:1 error:&v10];
    id v5 = v10;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      id v12 = v8;
      __int16 v13 = 2112;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v4;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);
    }
  }
}

- (void)onNavigationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SMSuggestionsManager_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__SMSuggestionsManager_onNavigationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNavigationNotification:*(void *)(a1 + 40)];
}

- (void)_onNavigationNotification:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = (__CFString *)v5;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      NSStringFromSelector(a2);
      __int16 v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v13;
      __int16 v34 = 2112;
      uint64_t v35 = v9;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, received maps navigation start with notification, %@", buf, 0x20u);
    }
    id v14 = objc_alloc(MEMORY[0x1E4F5CE00]);
    [(__CFString *)v9 destinationLatitude];
    double v16 = v15;
    [(__CFString *)v9 destinationLongitude];
    double v18 = v17;
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    v20 = (void *)[v14 initWithLatitude:v19 longitude:v16 horizontalUncertainty:v18 date:0.0];

    id v29 = 0;
    BOOL v21 = [(SMSuggestionsManager *)self _deleteProactiveNotificationUponNavigationDestination:v20 error:&v29];
    v22 = v29;
    __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      uint64_t v26 = NSStringFromSelector(a2);
      double v27 = (void *)v26;
      int v28 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v31 = v25;
      __int16 v32 = 2112;
      if (v21) {
        int v28 = @"YES";
      }
      id v33 = (const char *)v26;
      __int16 v34 = 2112;
      uint64_t v35 = v28;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, %@, proactive notification deletion status, %@", buf, 0x20u);
    }
  }
  else
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v5;
      __int16 v32 = 2080;
      id v33 = "-[SMSuggestionsManager _onNavigationNotification:]";
      __int16 v34 = 1024;
      LODWORD(v35) = 648;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

- (void)onVehicleConnectedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SMSuggestionsManager_onVehicleConnectedNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__SMSuggestionsManager_onVehicleConnectedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVehicleConnectedNotification:*(void *)(a1 + 40)];
}

- (void)_onVehicleConnectedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = v5;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      NSStringFromSelector(a2);
      __int16 v13 = (char *)objc_claimAutoreleasedReturnValue();
      id v14 = +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:](RTMotionActivityManager, "motionActivityVehicleConnectedStateToString:", [v9 vehicleConnectedState]);
      *(_DWORD *)buf = 138412802;
      id v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      double v27 = v14;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, received vehicle connected notification with state, %@", buf, 0x20u);
    }
    id v21 = 0;
    double v15 = [(SMSuggestionsManager *)self _runProactiveSuggestionsEngineWithContext:v9 shouldStoreSuggestions:1 error:&v21];
    double v16 = v21;
    double v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      NSStringFromSelector(a2);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      id v23 = v19;
      __int16 v24 = 2112;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      double v27 = v15;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);
    }
  }
  else
  {
    double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v5;
      __int16 v24 = 2080;
      uint64_t v25 = "-[SMSuggestionsManager _onVehicleConnectedNotification:]";
      __int16 v26 = 1024;
      LODWORD(v27) = 684;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

- (void)onSessionStartedWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SMSuggestionsManager_onSessionStartedWithConfiguration___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__SMSuggestionsManager_onSessionStartedWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionStartedWithConfiguration:*(void *)(a1 + 40)];
}

- (void)_onSessionStartedWithConfiguration:(id)a3
{
  uint64_t v4 = 0;
  [(SMSuggestionsManager *)self _deleteProactiveNotificationWithError:&v4];
  [(SMSuggestionsManager *)self _triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:0];
  [(SMSuggestionsManager *)self _sendTipsSignal];
}

- (void)onSessionEndedForActiveDevice:(BOOL)a3
{
  id v5 = [(RTNotifier *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SMSuggestionsManager_onSessionEndedForActiveDevice___block_invoke;
  v6[3] = &unk_1E6B90F08;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __54__SMSuggestionsManager_onSessionEndedForActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSessionEndedForActiveDevice:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_onSessionEndedForActiveDevice:(BOOL)a3
{
}

- (BOOL)_deleteProactiveNotificationWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = [(SMSuggestionsManager *)self defaultsManager];
  id v6 = [v5 objectForKey:@"RTDefaultsSuggestionsManagerLastSuggestionNotificationUUID"];

  if (v6)
  {
    BOOL v7 = [RTUserNotification alloc];
    id v8 = [(RTUserNotification *)v7 initWithBundleIdentifier:*MEMORY[0x1E4F99AA8] notificationUUIDString:v6];
    id v21 = 0;
    int v9 = [v8 deleteNotificationWithError:&v21];
    id v10 = v21;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(a2);
      double v15 = (void *)v14;
      double v16 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v23 = v13;
      if (v9) {
        double v16 = @"YES";
      }
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      double v27 = v16;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, scheduled clean up of notification status, %@, error, %@", buf, 0x2Au);
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    LOBYTE(v9) = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v17 = (objc_class *)objc_opt_class();
      double v18 = NSStringFromClass(v17);
      uint64_t v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v19;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, notification UUID from defaults is nil", buf, 0x16u);
    }
    id v10 = 0;
  }

  if (a3) {
    *a3 = v10;
  }

  return v9;
}

- (BOOL)_deleteProactiveNotificationWithDestinationLocation:(id)a3 error:(id *)a4
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v72 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = objc_alloc(MEMORY[0x1E4F999C0]);
    id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v8 = [v72 dateByAddingTimeInterval:-600.0];
    uint64_t v9 = *MEMORY[0x1E4F99C18];
    id v10 = (void *)[v7 initWithStartDate:v8 endDate:v72];
    uint64_t v11 = [v6 initWithBatchSize:v9 fetchLimit:1 offset:v9 includeSuppressed:0 sortByCreationDate:1 ascending:0 dateInterval:v10 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];

    uint64_t v85 = 0;
    id v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__102;
    __int16 v89 = __Block_byref_object_dispose__102;
    id v90 = 0;
    uint64_t v79 = 0;
    v80 = (double *)&v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__102;
    uint64_t v83 = __Block_byref_object_dispose__102;
    id v84 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    __int16 v13 = [(SMSuggestionsManager *)self suggestionsStore];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __82__SMSuggestionsManager__deleteProactiveNotificationWithDestinationLocation_error___block_invoke;
    v75[3] = &unk_1E6B905F0;
    v77 = &v85;
    v78 = &v79;
    uint64_t v14 = v12;
    id v76 = v14;
    [v13 fetchSuggestionsWithOptions:v11 handler:v75];
    id v70 = (void *)v11;

    double v15 = v14;
    double v16 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v17)) {
      goto LABEL_7;
    }
    double v18 = [MEMORY[0x1E4F1C9C8] now];
    [v18 timeIntervalSinceDate:v16];
    double v20 = v19;
    id v21 = objc_opt_new();
    v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v24 = [v23 filteredArrayUsingPredicate:v22];
    uint64_t v25 = [v24 firstObject];

    [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
    __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    double v27 = (void *)MEMORY[0x1E4F28C58];
    v102[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    __int16 v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v102 count:1];
    id v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

    if (v29)
    {
      id v30 = v29;
    }
    else
    {
LABEL_7:
      id v30 = 0;
    }

    id v31 = v30;
    __int16 v32 = v31;
    if (a4 && v31)
    {
      id v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        id v60 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v59;
        __int16 v92 = 2112;
        id v93 = v60;
        __int16 v94 = 2112;
        double v95 = *(double *)&v32;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      BOOL v34 = 0;
      uint64_t v35 = v32;
      goto LABEL_39;
    }
    if (a4 && *((void *)v80 + 5))
    {
      __int16 v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        BOOL v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        id v62 = (id)objc_claimAutoreleasedReturnValue();
        id v63 = NSStringFromSelector(a2);
        double v64 = v80[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v62;
        __int16 v92 = 2112;
        id v93 = v63;
        __int16 v94 = 2112;
        double v95 = v64;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        __int16 v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        *(double *)&uint64_t v42 = COERCE_DOUBLE([(id)v86[5] count]);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v40;
        __int16 v92 = 2112;
        id v93 = v41;
        __int16 v94 = 2048;
        double v95 = *(double *)&v42;
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, suggestions count, %lu", buf, 0x20u);
      }
      if (![(id)v86[5] count])
      {
        BOOL v34 = 1;
        goto LABEL_40;
      }
      uint64_t v43 = [(SMSuggestionsManager *)self distanceCalculator];
      v44 = [(id)v86[5] firstObject];
      v45 = [v44 destinationLocation];
      v46 = (id *)(v80 + 5);
      id obj = (id)*((void *)v80 + 5);
      [v43 distanceFromLocation:v45 toLocation:v5 error:&obj];
      double v48 = v47;
      objc_storeStrong(v46, obj);

      if (!a4 || !*((void *)v80 + 5))
      {
        v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          id v52 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v53 = (id)objc_claimAutoreleasedReturnValue();
          id v54 = [(id)v86[5] firstObject];
          id v55 = [v54 destinationLocation];
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = v52;
          __int16 v92 = 2112;
          id v93 = v53;
          __int16 v94 = 2048;
          double v95 = v48;
          __int16 v96 = 2048;
          uint64_t v97 = 0x408F400000000000;
          __int16 v98 = 2112;
          v99 = v55;
          __int16 v100 = 2112;
          id v101 = v5;
          _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%@, %@, distance, %.3f, kSMSuggestionMinimimDistanceBetweenSourceAndDestination, %.3f, suggestion location, %@, destinationLocation, %@", buf, 0x3Eu);
        }
        BOOL v34 = 1;
        if (v48 >= 0.0 && v48 < 1000.0)
        {
          v56 = (id *)(v80 + 5);
          id v73 = (id)*((void *)v80 + 5);
          BOOL v34 = [(SMSuggestionsManager *)self _deleteProactiveNotificationWithError:&v73];
          objc_storeStrong(v56, v73);
        }
        if (!a4) {
          goto LABEL_40;
        }
        goto LABEL_38;
      }
      v49 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        id v65 = (objc_class *)objc_opt_class();
        NSStringFromClass(v65);
        id v66 = (id)objc_claimAutoreleasedReturnValue();
        id v67 = NSStringFromSelector(a2);
        double v68 = v80[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v66;
        __int16 v92 = 2112;
        id v93 = v67;
        __int16 v94 = 2112;
        double v95 = v68;
        _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
    }
    BOOL v34 = 0;
LABEL_38:
    uint64_t v35 = (void *)*((void *)v80 + 5);
LABEL_39:
    *a4 = v35;
LABEL_40:

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(&v85, 8);

    goto LABEL_41;
  }
  uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"destinationLocation");
    BOOL v34 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v34 = 0;
  }
LABEL_41:

  return v34;
}

void __82__SMSuggestionsManager__deleteProactiveNotificationWithDestinationLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_deleteProactiveNotificationUponNavigationDestination:(id)a3 error:(id *)a4
{
  v123[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    aSelector = a2;
    uint64_t v106 = 0;
    v107 = (double *)&v106;
    uint64_t v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__102;
    v110 = __Block_byref_object_dispose__102;
    id v111 = 0;
    id obj = 0;
    [(SMSuggestionsManager *)self _refreshCurrentLocationWithError:&obj];
    objc_storeStrong(&v111, obj);
    if (a4 && *((void *)v107 + 5))
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        BOOL v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        id v62 = (id)objc_claimAutoreleasedReturnValue();
        id v63 = NSStringFromSelector(aSelector);
        double v64 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v62;
        __int16 v113 = 2112;
        id v114 = v63;
        __int16 v115 = 2112;
        double v116 = v64;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      BOOL v9 = 0;
      *a4 = *((id *)v107 + 5);
      goto LABEL_59;
    }
    __int16 v91 = [MEMORY[0x1E4F1C9C8] date];
    id v10 = [(SMSuggestionsManager *)self distanceCalculator];
    id v11 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
    id v12 = (id *)(v107 + 5);
    id v104 = (id)*((void *)v107 + 5);
    [v10 distanceFromLocation:v11 toLocation:v7 error:&v104];
    double v14 = v13;
    objc_storeStrong(v12, v104);

    if (a4 && *((void *)v107 + 5))
    {
      double v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v72 = (objc_class *)objc_opt_class();
        NSStringFromClass(v72);
        id v73 = (id)objc_claimAutoreleasedReturnValue();
        id v74 = NSStringFromSelector(aSelector);
        double v75 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v73;
        __int16 v113 = 2112;
        id v114 = v74;
        __int16 v115 = 2112;
        double v116 = v75;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      BOOL v9 = 0;
      *a4 = *((id *)v107 + 5);
      goto LABEL_58;
    }
    dispatch_time_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v19;
      __int16 v113 = 2112;
      id v114 = v20;
      __int16 v115 = 2048;
      double v116 = v14;
      __int16 v117 = 2048;
      uint64_t v118 = 0x407F400000000000;
      __int16 v119 = 2112;
      v120 = v21;
      __int16 v121 = 2112;
      id v122 = v7;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, distanceBetweenCurrentLocationAndNavigationDestination, %.3f, kSMSuggestionProactiveNotificationTearDownDistanceCloseBy, %.3f, latestLocationOfTheDevice, %@, navigationDestination, %@", buf, 0x3Eu);
    }
    if (v14 < 500.0)
    {
      BOOL v9 = 1;
LABEL_58:

LABEL_59:
      _Block_object_dispose(&v106, 8);

      goto LABEL_60;
    }
    id v22 = objc_alloc(MEMORY[0x1E4F999C0]);
    id v23 = objc_alloc(MEMORY[0x1E4F28C18]);
    __int16 v24 = [v91 dateByAddingTimeInterval:-600.0];
    uint64_t v25 = (void *)[v23 initWithStartDate:v24 endDate:v91];
    v88 = (void *)[v22 initWithBatchSize:*MEMORY[0x1E4F99C18] fetchLimit:1 offset:*MEMORY[0x1E4F99C18] includeSuppressed:0 sortByCreationDate:1 ascending:0 dateInterval:v25 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];

    uint64_t v98 = 0;
    v99 = &v98;
    uint64_t v100 = 0x3032000000;
    id v101 = __Block_byref_object_copy__102;
    v102 = __Block_byref_object_dispose__102;
    id v103 = 0;
    dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
    double v27 = [(SMSuggestionsManager *)self suggestionsStore];
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __84__SMSuggestionsManager__deleteProactiveNotificationUponNavigationDestination_error___block_invoke;
    v94[3] = &unk_1E6B905F0;
    __int16 v96 = &v98;
    uint64_t v97 = &v106;
    __int16 v28 = v26;
    double v95 = v28;
    [v27 fetchSuggestionsWithOptions:v88 handler:v94];

    dsema = v28;
    id v29 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v30 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v30)) {
      goto LABEL_26;
    }
    id v31 = [MEMORY[0x1E4F1C9C8] now];
    [v31 timeIntervalSinceDate:v29];
    double v33 = v32;
    BOOL v34 = objc_opt_new();
    uint64_t v35 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    uint64_t v36 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v37 = [v36 filteredArrayUsingPredicate:v35];
    uint64_t v38 = [v37 firstObject];

    [v34 submitToCoreAnalytics:v38 type:1 duration:v33];
    __int16 v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    id v40 = (void *)MEMORY[0x1E4F28C58];
    v123[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v123 count:1];
    uint64_t v42 = [v40 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v41];

    if (v42)
    {
      id v43 = v42;
    }
    else
    {
LABEL_26:
      id v43 = 0;
    }

    double v44 = COERCE_DOUBLE(v43);
    if (v44 != 0.0 && a4 != 0)
    {
      v46 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v77 = (objc_class *)objc_opt_class();
        NSStringFromClass(v77);
        id v78 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v79 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v78;
        __int16 v113 = 2112;
        id v114 = v79;
        __int16 v115 = 2112;
        double v116 = v44;
        _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      BOOL v9 = 0;
      double v47 = v44;
      goto LABEL_56;
    }
    if (a4 && *((void *)v107 + 5))
    {
      double v48 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v80 = (objc_class *)objc_opt_class();
        NSStringFromClass(v80);
        id v81 = (id)objc_claimAutoreleasedReturnValue();
        v82 = NSStringFromSelector(aSelector);
        double v83 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v81;
        __int16 v113 = 2112;
        id v114 = v82;
        __int16 v115 = 2112;
        double v116 = v83;
        _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
    }
    else
    {
      v49 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        id v51 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        *(double *)&uint64_t v53 = COERCE_DOUBLE([(id)v99[5] count]);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v51;
        __int16 v113 = 2112;
        id v114 = v52;
        __int16 v115 = 2048;
        double v116 = *(double *)&v53;
        _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "%@, %@, suggestions count, %lu", buf, 0x20u);
      }
      if (![(id)v99[5] count])
      {
        BOOL v9 = 1;
LABEL_57:

        _Block_object_dispose(&v98, 8);
        goto LABEL_58;
      }
      id v54 = [(SMSuggestionsManager *)self distanceCalculator];
      id v55 = [(id)v99[5] firstObject];
      v56 = [v55 destinationLocation];
      id v57 = (id *)(v107 + 5);
      id v93 = (id)*((void *)v107 + 5);
      [v54 distanceFromLocation:v56 toLocation:v7 error:&v93];
      double v59 = v58;
      objc_storeStrong(v57, v93);

      if (!a4 || !*((void *)v107 + 5))
      {
        id v65 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          id v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          id v67 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          id v68 = (id)objc_claimAutoreleasedReturnValue();
          id v69 = [(id)v99[5] firstObject];
          id v70 = [v69 destinationLocation];
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = v67;
          __int16 v113 = 2112;
          id v114 = v68;
          __int16 v115 = 2048;
          double v116 = v59;
          __int16 v117 = 2048;
          uint64_t v118 = 0x407F400000000000;
          __int16 v119 = 2112;
          v120 = v70;
          __int16 v121 = 2112;
          id v122 = v7;
          _os_log_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_INFO, "%@, %@, distanceBetweenDestinations, %.3f, kSMSuggestionProactiveNotificationTearDownDistanceFromNavigationDestination, %.3f, suggestion location, %@, navigationDestination, %@", buf, 0x3Eu);
        }
        if (v59 <= 500.0)
        {
          BOOL v9 = 1;
        }
        else
        {
          id v71 = (id *)(v107 + 5);
          id v92 = (id)*((void *)v107 + 5);
          BOOL v9 = [(SMSuggestionsManager *)self _deleteProactiveNotificationWithError:&v92];
          objc_storeStrong(v71, v92);
        }
        if (!a4) {
          goto LABEL_57;
        }
        goto LABEL_55;
      }
      id v60 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        id v84 = (objc_class *)objc_opt_class();
        NSStringFromClass(v84);
        id v85 = (id)objc_claimAutoreleasedReturnValue();
        id v86 = NSStringFromSelector(aSelector);
        double v87 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v85;
        __int16 v113 = 2112;
        id v114 = v86;
        __int16 v115 = 2112;
        double v116 = v87;
        _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
    }
    BOOL v9 = 0;
LABEL_55:
    double v47 = v107[5];
LABEL_56:
    *a4 = *(id *)&v47;
    goto LABEL_57;
  }
  double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: navigationDestination", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"navigationDestination");
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_60:

  return v9;
}

void __84__SMSuggestionsManager__deleteProactiveNotificationUponNavigationDestination_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_updateSafetyMonitorWorkoutSuggestionWidget
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, Suggestion widget not supported on this platform", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_changeWidgetVisibilityForMessagesInstallationState:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    __int16 v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, Suggestion widget not supported on this platform", (uint8_t *)&v8, 0x16u);
  }
}

- (void)onMessagesAppInstalled
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SMSuggestionsManager_onMessagesAppInstalled__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__SMSuggestionsManager_onMessagesAppInstalled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeWidgetVisibilityForMessagesInstallationState:1];
}

- (void)onMessagesAppUninstalled
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SMSuggestionsManager_onMessagesAppUninstalled__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __48__SMSuggestionsManager_onMessagesAppUninstalled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeWidgetVisibilityForMessagesInstallationState:0];
}

- (BOOL)_setupPedometerDataHandler
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(RTNotifier *)self queue];

  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v14 = "-[SMSuggestionsManager _setupPedometerDataHandler]";
      __int16 v15 = 1024;
      LODWORD(v16) = 1039;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.queue (in %s:%d)", buf, 0x12u);
    }
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    int v8 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    double v14 = v8;
    __int16 v15 = 2112;
    double v16 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, setting pedometer data handler", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke;
  v11[3] = &unk_1E6B994E8;
  objc_copyWeak(v12, (id *)buf);
  v12[1] = (id)a2;
  [(SMSuggestionsManager *)self setPedometerDataHandler:v11];
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke_2;
  block[3] = &unk_1E6B90F80;
  uint64_t v12 = *(void *)(a1 + 40);
  id v19 = v9;
  uint64_t v20 = v12;
  block[4] = WeakRetained;
  id v17 = v7;
  id v18 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v11, block);
}

void __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  os_log_type_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) dateInterval];
    id v8 = [v7 startDate];
    id v9 = [v8 stringFromDate];
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413570;
    id v23 = v4;
    __int16 v24 = 2112;
    uint64_t v25 = v5;
    __int16 v26 = 2112;
    double v27 = v6;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@, received pedometer data notification, subscriber UUID, %@, startDate, %@, with data, %@, error, %@", buf, 0x3Eu);
  }
  if (!*(void *)(a1 + 56))
  {
    if (*(void *)(a1 + 40))
    {
      if (*(void *)(a1 + 48))
      {
        uint64_t v12 = [*(id *)(a1 + 32) pedometerUUIDs];
        [v12 addObject:*(void *)(a1 + 40)];

        if (*(void *)(a1 + 48))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "_isWalkingBoutDetectedByAppendingPedometerData:"))
          {
            id v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(a1 + 48);
            id v21 = 0;
            id v15 = [v13 _runProactiveSuggestionsEngineWithContext:v14 shouldStoreSuggestions:1 error:&v21];
            id v16 = v21;
            id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              id v18 = (objc_class *)objc_opt_class();
              id v19 = NSStringFromClass(v18);
              uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 64));
              *(_DWORD *)buf = 138413058;
              id v23 = v19;
              __int16 v24 = 2112;
              uint64_t v25 = v20;
              __int16 v26 = 2112;
              double v27 = v15;
              __int16 v28 = 2112;
              id v29 = v16;
              _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);
            }
          }
        }
      }
    }
  }
}

- (BOOL)_setupPedometerNotificationsIfExists:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = [(SMSuggestionsManager *)self defaultsManager];
  id v7 = [v6 objectForKey:@"RTDefaultsSuggestionLastDateWalkingBoutTriggerIsScheduled"];

  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(a2);
    uint64_t v12 = [v7 stringFromDate];
    *(_DWORD *)buf = 138412802;
    __int16 v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = (uint64_t)v11;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, walkingBoutTriggerScheduledDate, %@,", buf, 0x20u);
  }
  id v22 = 0;
  BOOL v13 = [(SMSuggestionsManager *)self _reRegisterForPedometerNotificationsForLearnedLocationOfInterest:0 startDate:v7 error:&v22];
  id v14 = v22;
  id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    uint64_t v18 = NSStringFromSelector(a2);
    id v19 = (void *)v18;
    uint64_t v20 = @"NO";
    *(_DWORD *)buf = 138413058;
    __int16 v24 = v17;
    if (v13) {
      uint64_t v20 = @"YES";
    }
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    __int16 v28 = v20;
    __int16 v29 = 2112;
    id v30 = v14;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, %@, status, %@, error, %@", buf, 0x2Au);
  }
  if (a3) {
    *a3 = v14;
  }

  return v13;
}

- (BOOL)_reRegisterForPedometerNotificationsForLearnedLocationOfInterest:(id)a3 startDate:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    id v14 = NSStringFromSelector(a2);
    id v15 = [v10 stringFromDate];
    *(_DWORD *)buf = 138413058;
    __int16 v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    __int16 v32 = v15;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, reRegistering for pedometer data, startDate, %@, locationOfInterest, %@", buf, 0x2Au);
  }
  id v26 = 0;
  BOOL v16 = [(SMSuggestionsManager *)self _unregisterForPedometerNotificationsWithError:&v26];
  id v17 = v26;
  uint64_t v18 = v17;
  if (a5 && v17)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      __int16 v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v28 = v23;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      __int16 v32 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    goto LABEL_9;
  }
  id v25 = v17;
  BOOL v16 = [(SMSuggestionsManager *)self _registerForPedometerNotificationsForLearnedLocationOfInterest:v9 startDate:v10 error:&v25];
  id v20 = v25;

  uint64_t v18 = v20;
  if (a5)
  {
LABEL_9:
    id v20 = v18;
    *a5 = v20;
  }

  return v16;
}

- (BOOL)_registerForPedometerNotificationsForLearnedLocationOfInterest:(id)a3 startDate:(id)a4 error:(id *)a5
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v91 = v7;
  if (!v8)
  {
    uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      BOOL v37 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
LABEL_51:
    BOOL v37 = 0;
    goto LABEL_52;
  }
  [(SMSuggestionsManager *)self _resetStatesForPedometerData];
  if (v7)
  {
    [(SMSuggestionsManager *)self setCurrentLOI:v7];
    goto LABEL_4;
  }
  id v107 = 0;
  [(SMSuggestionsManager *)self _refreshCurrentLocationWithError:&v107];
  __int16 v39 = (uint64_t (*)(uint64_t, uint64_t))v107;
  if (a5 && v39)
  {
    id v40 = v39;
    id v41 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v79 = (objc_class *)objc_opt_class();
      v80 = NSStringFromClass(v79);
      id v81 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v80;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v81;
      *(_WORD *)&buf[22] = 2112;
      v109 = v40;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    uint64_t v42 = v40;
    *a5 = v42;

    goto LABEL_51;
  }
  __int16 v89 = v39;
  double v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    double v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    v50 = NSStringFromSelector(a2);
    [v8 stringFromDate:v89];
    id v51 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    id v52 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v49;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v50;
    *(_WORD *)&buf[22] = 2112;
    v109 = v51;
    *(_WORD *)v110 = 2112;
    *(void *)&v110[2] = v52;
    _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%@, %@, registering for pedometer notifications using startDate, %@, location, %@", buf, 0x2Au);
  }
  dispatch_semaphore_t v53 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v109 = __Block_byref_object_copy__102;
  *(void *)v110 = __Block_byref_object_dispose__102;
  *(void *)&v110[8] = 0;
  id location = 0;
  p_id location = &location;
  uint64_t v103 = 0x3032000000;
  id v104 = __Block_byref_object_copy__102;
  v105 = __Block_byref_object_dispose__102;
  id v106 = 0;
  id v54 = [(SMSuggestionsManager *)self learnedLocationManager];
  id v55 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke;
  v97[3] = &unk_1E6B90B28;
  v99 = buf;
  uint64_t v100 = &location;
  v56 = v53;
  uint64_t v98 = v56;
  [v54 fetchLocationOfInterestAtLocation:v55 handler:v97];

  id v57 = v56;
  double v58 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v59 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v57, v59))
  {
    id v60 = [MEMORY[0x1E4F1C9C8] now];
    [v60 timeIntervalSinceDate:v58];
    double v62 = v61;
    id v63 = objc_opt_new();
    double v64 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    id v65 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v66 = [v65 filteredArrayUsingPredicate:v64];
    id v67 = [v66 firstObject];

    [v63 submitToCoreAnalytics:v67 type:1 duration:v62];
    id v68 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v111 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v111, 2u);
    }

    id v69 = (void *)MEMORY[0x1E4F28C58];
    v116[0] = *MEMORY[0x1E4F28568];
    *(void *)id v111 = @"semaphore wait timeout";
    id v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v116 count:1];
    id v71 = [v69 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v70];

    if (v71)
    {
      id v71 = v71;
    }
  }
  else
  {
    id v71 = 0;
  }

  id v72 = v71;
  if (v72) {
    BOOL v73 = a5 != 0;
  }
  else {
    BOOL v73 = 0;
  }
  if (v73)
  {
    id v74 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      v82 = (objc_class *)objc_opt_class();
      NSStringFromClass(v82);
      id v83 = (id)objc_claimAutoreleasedReturnValue();
      id v84 = NSStringFromSelector(a2);
      *(_DWORD *)id v111 = 138412802;
      *(void *)&v111[4] = v83;
      __int16 v112 = 2112;
      __int16 v113 = v84;
      __int16 v114 = 2112;
      id v115 = v72;
      _os_log_error_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v111, 0x20u);
    }
    id v75 = v72;
LABEL_48:
    char v77 = 0;
    *a5 = v75;
    goto LABEL_50;
  }
  if (a5 && p_location[5])
  {
    id v76 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      id v85 = (objc_class *)objc_opt_class();
      NSStringFromClass(v85);
      id v86 = (id)objc_claimAutoreleasedReturnValue();
      double v87 = NSStringFromSelector(a2);
      id v88 = p_location[5];
      *(_DWORD *)id v111 = 138412802;
      *(void *)&v111[4] = v86;
      __int16 v112 = 2112;
      __int16 v113 = v87;
      __int16 v114 = 2112;
      id v115 = v88;
      _os_log_error_impl(&dword_1D9BFA000, v76, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v111, 0x20u);
    }
    id v75 = p_location[5];
    goto LABEL_48;
  }
  -[SMSuggestionsManager setCurrentLOI:](self, "setCurrentLOI:", *(void *)(*(void *)&buf[8] + 40), v89);
  char v77 = 1;
LABEL_50:

  _Block_object_dispose(&location, 8);
  _Block_object_dispose(buf, 8);

  if ((v77 & 1) == 0) {
    goto LABEL_51;
  }
LABEL_4:
  id v9 = [(SMSuggestionsManager *)self currentLOI];
  BOOL v10 = v9 == 0;

  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      id v43 = (objc_class *)objc_opt_class();
      double v44 = NSStringFromClass(v43);
      v45 = NSStringFromSelector(a2);
      v46 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      v109 = v46;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, no corresponding LOI at this location, %@", buf, 0x20u);
    }
    goto LABEL_51;
  }
  if (v12)
  {
    BOOL v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    BOOL v16 = [v8 stringFromDate];
    id v17 = [(SMSuggestionsManager *)self currentLOI];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v109 = v16;
    *(_WORD *)v110 = 2112;
    *(void *)&v110[2] = v17;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, registering for pedometer data, startDate, %@, current LOI, %@", buf, 0x2Au);
  }
  [(SMSuggestionsManager *)self _logStatesForPedometerData];
  uint64_t v18 = [(SMSuggestionsManager *)self walkingTriggerAlarm];

  if (v18)
  {
    id v19 = [(SMSuggestionsManager *)self walkingTriggerAlarm];
    [v19 invalidate];
  }
  objc_initWeak(&location, self);
  id v20 = [RTXPCTimerAlarm alloc];
  id v21 = [MEMORY[0x1E4F29128] UUID];
  id v22 = [v21 UUIDString];
  id v23 = [(RTNotifier *)self queue];
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke_121;
  v94[3] = &unk_1E6B99510;
  objc_copyWeak(v96, &location);
  id v24 = v8;
  id v95 = v24;
  v96[1] = (id)a2;
  id v25 = [(RTXPCTimerAlarm *)v20 initWithIdentifier:v22 queue:v23 handler:v94];
  [(SMSuggestionsManager *)self setWalkingTriggerAlarm:v25];

  id v26 = [(SMSuggestionsManager *)self walkingTriggerAlarm];
  id v93 = 0;
  int v27 = [v26 fireWithDate:v24 error:&v93];
  id v28 = v93;

  __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    id v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v24 stringFromDate];
    id v34 = (void *)v33;
    uint64_t v35 = @"NO";
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v31;
    *(_WORD *)&unsigned char buf[12] = 2112;
    if (v27) {
      uint64_t v35 = @"YES";
    }
    *(void *)&buf[14] = v32;
    *(_WORD *)&buf[22] = 2112;
    v109 = (uint64_t (*)(uint64_t, uint64_t))v33;
    *(_WORD *)v110 = 2112;
    *(void *)&v110[2] = v35;
    *(_WORD *)&v110[10] = 2112;
    *(void *)&v110[12] = v28;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, timer set for pedometer notifications to fire at startDate, %@, status, %@, error, %@", buf, 0x34u);
  }
  uint64_t v36 = [(SMSuggestionsManager *)self defaultsManager];
  [v36 setObject:v24 forKey:@"RTDefaultsSuggestionLastDateWalkingBoutTriggerIsScheduled"];

  if (a5) {
    *a5 = v28;
  }
  BOOL v37 = v28 == 0;

  objc_destroyWeak(v96);
  objc_destroyWeak(&location);
LABEL_52:

  return v37;
}

void __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke_121(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained motionActivityManager];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [WeakRetained pedometerDataHandler];
  [v3 subscribeForPedometerDataWithStartDate:v4 handler:v5];

  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    BOOL v10 = [*(id *)(a1 + 32) stringFromDate];
    int v11 = 138412802;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    BOOL v16 = v10;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, added walking trigger, startDate, %@", (uint8_t *)&v11, 0x20u);
  }
}

- (BOOL)_unregisterForPedometerNotificationsWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    uint64_t v9 = [(SMSuggestionsManager *)self pedometerUUIDs];
    *(_DWORD *)buf = 138412802;
    int v27 = v7;
    __int16 v28 = 2112;
    __int16 v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, unregistering for pedometer data for pedometer uuids, %@", buf, 0x20u);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v10 = [(SMSuggestionsManager *)self pedometerUUIDs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        BOOL v16 = (void *)MEMORY[0x1E016D870]();
        uint64_t v17 = [(SMSuggestionsManager *)self motionActivityManager];
        [v17 unsubscribeForPedometerData:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [(SMSuggestionsManager *)self _resetStatesForPedometerData];
  uint64_t v18 = [(SMSuggestionsManager *)self defaultsManager];
  id v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v18 setObject:v19 forKey:@"RTDefaultsSuggestionLastDateWalkingBoutTriggerIsScheduled"];

  return 1;
}

- (BOOL)_resetStatesForPedometerData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SMSuggestionsManager *)self setCurrentLOI:0];
  [(SMSuggestionsManager *)self setPreviousPedometerData:0];
  uint64_t v4 = objc_opt_new();
  [(SMSuggestionsManager *)self setPedometerUUIDs:v4];

  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, reset states for pedometer data", (uint8_t *)&v10, 0x16u);
  }
  [(SMSuggestionsManager *)self _logStatesForPedometerData];
  return 1;
}

- (void)_logStatesForPedometerData
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(a2);
    id v8 = [(SMSuggestionsManager *)self currentLOI];
    uint64_t v9 = [(SMSuggestionsManager *)self previousPedometerData];
    int v10 = 138413058;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, states for pedometer data, currentLOI, %@, previousPedometerDataEndDate, %@,", (uint8_t *)&v10, 0x2Au);
  }
}

- (BOOL)_isWalkingBoutDetectedByAppendingPedometerData:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SMSuggestionsManager *)self currentLOI];
  id v6 = [v5 location];
  uint64_t v7 = [v6 location];
  [v7 horizontalUncertainty];
  double v9 = v8 * 2.0 + 40.0;

  int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    uint64_t v13 = NSStringFromSelector(a2);
    id v65 = [v4 dateInterval];
    double v64 = [v65 startDate];
    __int16 v14 = [v64 stringFromDate];
    [(SMSuggestionsManager *)self previousPedometerData];
    v15 = id v66 = v4;
    __int16 v16 = [(SMSuggestionsManager *)self currentLOI];
    uint64_t v17 = [v16 location];
    uint64_t v18 = [v17 location];
    [v18 horizontalUncertainty];
    uint64_t v20 = v19;
    long long v21 = [(SMSuggestionsManager *)self currentLOI];
    *(_DWORD *)buf = 138415106;
    id v71 = v12;
    __int16 v72 = 2112;
    BOOL v73 = v13;
    __int16 v74 = 2112;
    id v75 = v14;
    __int16 v76 = 2048;
    uint64_t v77 = 0x4044000000000000;
    __int16 v78 = 2048;
    uint64_t v79 = 0x4000000000000000;
    __int16 v80 = 2112;
    id v81 = v15;
    __int16 v82 = 2048;
    uint64_t v83 = v20;
    __int16 v84 = 2048;
    uint64_t v85 = 0x4000000000000000;
    __int16 v86 = 2048;
    uint64_t v87 = 0x4044000000000000;
    __int16 v88 = 2048;
    double v89 = v9;
    __int16 v90 = 2112;
    id v91 = v66;
    __int16 v92 = 2112;
    id v93 = v21;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, startDate, %@, kSMWalkingBoutMaxBreakTime, %.3f, kSMWalkingBoutMultiplierForLOIUncertainty, %.3f, previousPedometerData, %@, loi uncertainty, %.3f, multiplier, %.3f, sigma, %.3f, threshold, %.3f, pedometerData, %@, currentLOI, %@", buf, 0x7Au);

    id v4 = v66;
  }

  long long v22 = [(SMSuggestionsManager *)self previousPedometerData];
  long long v23 = [v22 dateInterval];
  uint64_t v24 = [v23 endDate];
  if (v24)
  {
    id v25 = (void *)v24;
    id v26 = [v4 dateInterval];
    int v27 = [v26 endDate];
    __int16 v28 = [(SMSuggestionsManager *)self previousPedometerData];
    __int16 v29 = [v28 dateInterval];
    __int16 v30 = [v29 endDate];
    [v27 timeIntervalSinceDate:v30];
    double v32 = v31;

    if (v32 > 40.0)
    {
      uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v51 = (objc_class *)objc_opt_class();
        id v52 = NSStringFromClass(v51);
        dispatch_semaphore_t v53 = NSStringFromSelector(a2);
        id v54 = [v4 dateInterval];
        id v55 = [v54 startDate];
        v56 = [v55 stringFromDate];
        id v57 = [v4 dateInterval];
        double v58 = [v57 endDate];
        [v58 stringFromDate];
        v59 = id v67 = v4;
        *(_DWORD *)buf = 138413058;
        id v71 = v52;
        __int16 v72 = 2112;
        BOOL v73 = v53;
        __int16 v74 = 2112;
        id v75 = v56;
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v59;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, max gap threshold exceeded for pedometer data, startDate, %@, endDate, %@", buf, 0x2Au);

        id v4 = v67;
      }

      id v34 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v35 = [(SMSuggestionsManager *)self currentLOI];
      id v69 = 0;
      [(SMSuggestionsManager *)self _reRegisterForPedometerNotificationsForLearnedLocationOfInterest:v35 startDate:v34 error:&v69];
      id v36 = v69;

      BOOL v37 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v60 = (objc_class *)objc_opt_class();
        double v61 = NSStringFromClass(v60);
        double v62 = NSStringFromSelector(a2);
        id v63 = [v34 stringFromDate];
        *(_DWORD *)buf = 138413058;
        id v71 = v61;
        __int16 v72 = 2112;
        BOOL v73 = v62;
        __int16 v74 = 2112;
        id v75 = v63;
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, reRegistered again for pedometer data, startDate, %@, error, %@", buf, 0x2Au);
      }
LABEL_17:
      BOOL v49 = 0;
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v38 = [(SMSuggestionsManager *)self previousPedometerData];
  if (!v38) {
    goto LABEL_13;
  }
  __int16 v39 = (void *)v38;
  [v4 distance];
  double v41 = v40;
  uint64_t v42 = [(SMSuggestionsManager *)self previousPedometerData];
  [v42 distance];
  double v44 = v43;

  if (v41 != v44) {
LABEL_13:
  }
    [(SMSuggestionsManager *)self setPreviousPedometerData:v4];
  uint64_t v45 = [(SMSuggestionsManager *)self currentLOI];
  if (!v45) {
    goto LABEL_17;
  }
  v46 = (void *)v45;
  [v4 distance];
  double v48 = v47;

  if (v48 <= v9) {
    goto LABEL_17;
  }
  BOOL v49 = 1;
LABEL_18:

  return v49;
}

- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__SMSuggestionsManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke;
  v13[3] = &unk_1E6B907A0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __96__SMSuggestionsManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  os_log_type_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  id v9 = 0;
  id v5 = [v2 _runProactiveSuggestionsEngineWithContext:v3 shouldStoreSuggestions:v4 error:&v9];
  id v6 = v9;
  uint64_t v7 = *(void *)(a1 + 48);
  if (v5)
  {
    v10[0] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, MEMORY[0x1E4F1CBF0], v6);
  }
}

- (id)_runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v122[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    *(void *)v110 = 0;
    id v111 = v110;
    uint64_t v112 = 0x3032000000;
    __int16 v113 = __Block_byref_object_copy__102;
    __int16 v114 = __Block_byref_object_dispose__102;
    id v115 = 0;
    id obj = 0;
    unint64_t v10 = [(SMSuggestionsManager *)self _getSuggestionTriggerFromContext:v9 error:&obj];
    objc_storeStrong(&v115, obj);
    if (a5 && *((void *)v111 + 5))
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        id v61 = (id)objc_claimAutoreleasedReturnValue();
        double v62 = NSStringFromSelector(a2);
        id v63 = (__CFString *)*((void *)v111 + 5);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v61;
        __int16 v118 = 2112;
        uint64_t v119 = (uint64_t)v62;
        __int16 v120 = 2112;
        __int16 v121 = v63;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v12 = *((id *)v111 + 5);
LABEL_13:
      BOOL v16 = 0;
      uint64_t v17 = 0;
      *a5 = v12;
LABEL_32:

      _Block_object_dispose(v110, 8);
      goto LABEL_33;
    }
    if (v10)
    {
      uint64_t v13 = (id *)(v111 + 40);
      id v108 = (id)*((void *)v111 + 5);
      BOOL v14 = [(SMSuggestionsManager *)self _checkInitiatorEligibilityWithError:&v108];
      objc_storeStrong(v13, v108);
      if (a5 && *((void *)v111 + 5))
      {
        id v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          double v64 = (objc_class *)objc_opt_class();
          NSStringFromClass(v64);
          id v65 = (id)objc_claimAutoreleasedReturnValue();
          id v66 = NSStringFromSelector(a2);
          id v67 = (__CFString *)*((void *)v111 + 5);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v65;
          __int16 v118 = 2112;
          uint64_t v119 = (uint64_t)v66;
          __int16 v120 = 2112;
          __int16 v121 = v67;
          _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        id v12 = *((id *)v111 + 5);
        goto LABEL_13;
      }
      if (v14)
      {
        uint64_t v19 = (id *)(v111 + 40);
        id v107 = (id)*((void *)v111 + 5);
        BOOL v16 = [(SMSuggestionsManager *)self _generatePersonalizedSuggestionFromContext:v9 error:&v107];
        objc_storeStrong(v19, v107);
        if (a5 && *((void *)v111 + 5))
        {
          uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            __int16 v86 = (objc_class *)objc_opt_class();
            NSStringFromClass(v86);
            id v87 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v88 = NSStringFromSelector(a2);
            double v89 = (__CFString *)*((void *)v111 + 5);
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v87;
            __int16 v118 = 2112;
            uint64_t v119 = (uint64_t)v88;
            __int16 v120 = 2112;
            __int16 v121 = v89;
            _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
          }
          id v21 = *((id *)v111 + 5);
          goto LABEL_75;
        }
        if (v16)
        {
          double v31 = (id *)(v111 + 40);
          id v106 = (id)*((void *)v111 + 5);
          unint64_t v32 = [(SMSuggestionsManager *)self _suppressSuggestion:v16 context:v9 error:&v106];
          objc_storeStrong(v31, v106);
          if (a5 && *((void *)v111 + 5))
          {
            uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              __int16 v90 = (objc_class *)objc_opt_class();
              NSStringFromClass(v90);
              id v91 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v92 = NSStringFromSelector(a2);
              id v93 = (__CFString *)*((void *)v111 + 5);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v91;
              __int16 v118 = 2112;
              uint64_t v119 = (uint64_t)v92;
              __int16 v120 = 2112;
              __int16 v121 = v93;
              _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
            }
            id v21 = *((id *)v111 + 5);
          }
          else
          {
            [(__CFString *)v16 setSuppressionReason:v32];
            id v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              uint64_t v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              id v36 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v37 = (id)objc_claimAutoreleasedReturnValue();
              int v38 = [(__CFString *)v16 isSuppressed];
              __int16 v39 = @"NO";
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v36;
              __int16 v118 = 2112;
              if (v38) {
                __int16 v39 = @"YES";
              }
              uint64_t v119 = (uint64_t)v37;
              __int16 v120 = 2112;
              __int16 v121 = v39;
              _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, %@, is suggestion suppressed, %@", buf, 0x20u);
            }
            if (v6)
            {
              dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
              double v41 = [(SMSuggestionsManager *)self suggestionsStore];
              double v116 = v16;
              uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
              v103[0] = MEMORY[0x1E4F143A8];
              v103[1] = 3221225472;
              v103[2] = __95__SMSuggestionsManager__runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_error___block_invoke;
              v103[3] = &unk_1E6B90728;
              v105 = v110;
              double v43 = v40;
              id v104 = v43;
              [v41 storeSuggestions:v42 handler:v103];

              double v44 = v43;
              uint64_t v100 = [MEMORY[0x1E4F1C9C8] now];
              dispatch_time_t v45 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(v44, v45)) {
                goto LABEL_55;
              }
              uint64_t v98 = [MEMORY[0x1E4F1C9C8] now];
              [v98 timeIntervalSinceDate:v100];
              double v47 = v46;
              __int16 v96 = objc_opt_new();
              uint64_t v97 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
              double v48 = [MEMORY[0x1E4F29060] callStackSymbols];
              BOOL v49 = [v48 filteredArrayUsingPredicate:v97];
              v50 = [v49 firstObject];

              [v96 submitToCoreAnalytics:v50 type:1 duration:v47];
              id v51 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
              }

              id v52 = (void *)MEMORY[0x1E4F28C58];
              v122[0] = *MEMORY[0x1E4F28568];
              *(void *)buf = @"semaphore wait timeout";
              dispatch_semaphore_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v122 count:1];
              id v54 = [v52 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v53];

              if (v54)
              {
                id v55 = v54;
              }
              else
              {
LABEL_55:
                id v55 = 0;
              }
              BOOL v68 = a5 == 0;

              id v69 = (__CFString *)v55;
              if (!v69) {
                BOOL v68 = 1;
              }
              if (v68)
              {
                uint64_t v17 = 0;
              }
              else
              {
                id v70 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v94 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v94);
                  id v101 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v95 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v101;
                  __int16 v118 = 2112;
                  v99 = (void *)v95;
                  uint64_t v119 = v95;
                  __int16 v120 = 2112;
                  __int16 v121 = v69;
                  _os_log_error_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
                }
                *a5 = v69;
                uint64_t v17 = v16;
              }

              if (!v68) {
                goto LABEL_32;
              }
            }
            if ([(__CFString *)v16 isSuppressed])
            {
              id v71 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                __int16 v72 = (objc_class *)objc_opt_class();
                NSStringFromClass(v72);
                id v73 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v74 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v73;
                __int16 v118 = 2112;
                uint64_t v119 = (uint64_t)v74;
                __int16 v120 = 2112;
                __int16 v121 = v16;
                _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, "%@, %@, suggestion is not displayed because it is suppressed, %@", buf, 0x20u);
              }
            }
            else
            {
              id v75 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                __int16 v76 = (objc_class *)objc_opt_class();
                NSStringFromClass(v76);
                id v77 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v78 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v77;
                __int16 v118 = 2112;
                uint64_t v119 = (uint64_t)v78;
                __int16 v120 = 2112;
                __int16 v121 = v16;
                _os_log_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_INFO, "%@, %@, displaying suggestion, %@", buf, 0x20u);
              }
              uint64_t v79 = (id *)(v111 + 40);
              id v102 = (id)*((void *)v111 + 5);
              BOOL v80 = [(SMSuggestionsManager *)self _showSuggestionsDetectionUIWithSuggestion:v16 error:&v102];
              objc_storeStrong(v79, v102);
              id v71 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                id v81 = (objc_class *)objc_opt_class();
                NSStringFromClass(v81);
                id v82 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v83 = NSStringFromSelector(a2);
                __int16 v84 = (void *)v83;
                uint64_t v85 = @"NO";
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v82;
                __int16 v118 = 2112;
                if (v80) {
                  uint64_t v85 = @"YES";
                }
                uint64_t v119 = v83;
                __int16 v120 = 2112;
                __int16 v121 = v85;
                _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, "%@, %@, displaying suggestion status, %@", buf, 0x20u);
              }
            }

            if (!a5) {
              goto LABEL_76;
            }
            id v21 = *((id *)v111 + 5);
          }
LABEL_75:
          *a5 = v21;
LABEL_76:
          BOOL v16 = v16;
          uint64_t v17 = v16;
          goto LABEL_32;
        }
        v56 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          id v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          id v58 = (id)objc_claimAutoreleasedReturnValue();
          dispatch_time_t v59 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v58;
          __int16 v118 = 2112;
          uint64_t v119 = (uint64_t)v59;
          _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "%@, %@, No Suggestion created!", buf, 0x16u);
        }
      }
      else
      {
        id v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v29 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v28;
          __int16 v118 = 2112;
          uint64_t v119 = (uint64_t)v29;
          _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, %@, initiator is not eligible, skipping suggestions engine", buf, 0x16u);
        }
      }
    }
    else
    {
      long long v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v24;
        __int16 v118 = 2112;
        uint64_t v119 = (uint64_t)v25;
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);
      }
    }
    BOOL v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_32;
  }
  uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v110 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v110, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"context");
    uint64_t v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_33:

  return v17;
}

void __95__SMSuggestionsManager__runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_generatePersonalizedSuggestionFromContext:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v39 = 0;
    unint64_t v8 = [(SMSuggestionsManager *)self _getSuggestionTriggerFromContext:v7 error:&v39];
    id v9 = v39;
    id v10 = v9;
    if (a4 && v9)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        id v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        double v41 = v25;
        __int16 v42 = 2112;
        double v43 = v26;
        __int16 v44 = 2112;
        id v45 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v12 = v10;
      id v10 = v12;
      uint64_t v13 = 0;
      goto LABEL_17;
    }
    if (!v8)
    {
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        id v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        double v41 = v20;
        __int16 v42 = 2112;
        double v43 = v21;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);
      }
      uint64_t v13 = 0;
      goto LABEL_24;
    }
    id v38 = v9;
    uint64_t v13 = [(SMSuggestionsManager *)self _generatePersonalizedSuggestionForWorkoutUserFromContext:v7 error:&v38];
    id v15 = v38;

    if (a4 && v15)
    {
      BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        uint64_t v17 = v15;
LABEL_16:
        id v12 = v17;
        id v10 = v12;
LABEL_17:
        *a4 = v12;
LABEL_24:

        goto LABEL_25;
      }
      __int16 v30 = (objc_class *)objc_opt_class();
      id v28 = NSStringFromClass(v30);
      __int16 v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      double v41 = v28;
      __int16 v42 = 2112;
      double v43 = v29;
      __int16 v44 = 2112;
      id v45 = v15;
LABEL_39:
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      goto LABEL_15;
    }
    if (v13)
    {
LABEL_23:
      id v10 = v15;
      goto LABEL_24;
    }
    id v37 = v15;
    uint64_t v13 = [(SMSuggestionsManager *)self _generatePersonalizedSuggestionForRegularUserFromContext:v7 error:&v37];
    id v10 = v37;

    if (a4 && v10)
    {
      long long v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      id v34 = (objc_class *)objc_opt_class();
      unint64_t v32 = NSStringFromClass(v34);
      uint64_t v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      double v41 = v32;
      __int16 v42 = 2112;
      double v43 = v33;
      __int16 v44 = 2112;
      id v45 = v10;
    }
    else
    {
      if (v13) {
        goto LABEL_24;
      }
      id v36 = v10;
      uint64_t v13 = [(SMSuggestionsManager *)self _generatePersonalizedSuggestionForOccasionalUserFromContext:v7 error:&v36];
      id v15 = v36;

      if (a4 && v15)
      {
        BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        int v27 = (objc_class *)objc_opt_class();
        id v28 = NSStringFromClass(v27);
        __int16 v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        double v41 = v28;
        __int16 v42 = 2112;
        double v43 = v29;
        __int16 v44 = 2112;
        id v45 = v15;
        goto LABEL_39;
      }
      if (v13) {
        goto LABEL_23;
      }
      id v35 = v15;
      uint64_t v13 = [(SMSuggestionsManager *)self _generatePersonalizedSuggestionForFirstTimeUserFromContext:v7 error:&v35];
      id v10 = v35;

      if (!a4 || !v10)
      {
        if (!a4 || v13) {
          goto LABEL_24;
        }
        goto LABEL_32;
      }
      long long v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

LABEL_32:
        uint64_t v17 = v10;
        goto LABEL_16;
      }
      double v31 = (objc_class *)objc_opt_class();
      unint64_t v32 = NSStringFromClass(v31);
      uint64_t v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      double v41 = v32;
      __int16 v42 = 2112;
      double v43 = v33;
      __int16 v44 = 2112;
      id v45 = v10;
    }
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    goto LABEL_31;
  }
  BOOL v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"context");
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_25:

  return v13;
}

- (id)_generatePersonalizedSuggestionForRegularUserFromContext:(id)a3 error:(id *)a4
{
  v246[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v199 = v5;
  if (v5)
  {
    uint64_t v227 = 0;
    v228 = (id *)&v227;
    uint64_t v229 = 0x3032000000;
    v230 = __Block_byref_object_copy__102;
    v231 = __Block_byref_object_dispose__102;
    id v232 = 0;
    id obj = 0;
    unint64_t v197 = [(SMSuggestionsManager *)self _getSuggestionTriggerFromContext:v5 error:&obj];
    objc_storeStrong(&v232, obj);
    if (a4 && v228[5])
    {
      BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = NSStringFromSelector(a2);
        id v29 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v235 = 2112;
        id v236 = v28;
        __int16 v237 = 2112;
        id v238 = v29;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v228[5];
      goto LABEL_121;
    }
    if (!v197)
    {
      BOOL v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v235 = 2112;
        id v236 = v17;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);
      }
      id v7 = 0;
      goto LABEL_121;
    }
    unint64_t v8 = v228 + 5;
    id v225 = v228[5];
    v196 = [(SMSuggestionsManager *)self _getSourceLocationFromContext:v199 error:&v225];
    objc_storeStrong(v8, v225);
    id v9 = v228 + 5;
    if (a4 && v228[5])
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        dispatch_semaphore_t v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v42 = NSStringFromSelector(a2);
        id v43 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v41;
        __int16 v235 = 2112;
        id v236 = v42;
        __int16 v237 = 2112;
        id v238 = v43;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v228[5];
      goto LABEL_120;
    }
    id v224 = v228[5];
    v195 = [(SMSuggestionsManager *)self _getCurrentDateFromContext:v199 error:&v224];
    objc_storeStrong(v9, v224);
    id v12 = v228 + 5;
    if (a4 && v228[5])
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v92 = (objc_class *)objc_opt_class();
        NSStringFromClass(v92);
        id v93 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v94 = NSStringFromSelector(a2);
        id v95 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v93;
        __int16 v235 = 2112;
        id v236 = v94;
        __int16 v237 = 2112;
        id v238 = v95;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v228[5];
      goto LABEL_119;
    }
    id v223 = v228[5];
    v186 = [(SMSuggestionsManager *)self _getNPLOIsWithOnlyHighConfidence:1 location:v196 date:v195 error:&v223];
    objc_storeStrong(v12, v223);
    if (a4 && v228[5])
    {
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v96 = (objc_class *)objc_opt_class();
        NSStringFromClass(v96);
        id v97 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v98 = NSStringFromSelector(a2);
        id v99 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v97;
        __int16 v235 = 2112;
        id v236 = v98;
        __int16 v237 = 2112;
        id v238 = v99;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v228[5];
      goto LABEL_118;
    }
    if (!v186 || ![v186 count])
    {
      id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        long long v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:v197];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v23;
        __int16 v235 = 2112;
        id v236 = v24;
        __int16 v237 = 2112;
        id v238 = v25;
        _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because nploi with High confidence is not found", buf, 0x20u);
      }
      id v7 = 0;
      goto LABEL_118;
    }
    uint64_t v19 = v228 + 5;
    id v222 = v228[5];
    v184 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionTimeIntervalBuffer" error:&v222];
    objc_storeStrong(v19, v222);
    if (a4 && v228[5])
    {
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v146 = (objc_class *)objc_opt_class();
        NSStringFromClass(v146);
        id v147 = (id)objc_claimAutoreleasedReturnValue();
        v148 = NSStringFromSelector(a2);
        id v149 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v147;
        __int16 v235 = 2112;
        id v236 = v148;
        __int16 v237 = 2112;
        id v238 = v149;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v228[5];
      goto LABEL_117;
    }
    __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      double v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      [v184 doubleValue];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v235 = 2112;
      id v236 = v33;
      __int16 v237 = 2048;
      id v238 = v34;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, %@, using time interval buffer, %.3f", buf, 0x20u);
    }
    [v184 doubleValue];
    v183 = [v195 dateByAddingTimeInterval:-v35];
    uint64_t v216 = 0;
    v217 = &v216;
    uint64_t v218 = 0x3032000000;
    v219 = __Block_byref_object_copy__102;
    v220 = __Block_byref_object_dispose__102;
    id v221 = 0;
    id v36 = v228 + 5;
    if (a4 && v228[5])
    {
      id v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v150 = (objc_class *)objc_opt_class();
        NSStringFromClass(v150);
        id v151 = (id)objc_claimAutoreleasedReturnValue();
        v152 = NSStringFromSelector(a2);
        id v153 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v151;
        __int16 v235 = 2112;
        id v236 = v152;
        __int16 v237 = 2112;
        id v238 = v153;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v228[5];
      goto LABEL_116;
    }
    id v215 = v228[5];
    v182 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionBoundingBoxRadius" error:&v215];
    objc_storeStrong(v36, v215);
    if (a4 && v228[5])
    {
      id v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v163 = (objc_class *)objc_opt_class();
        NSStringFromClass(v163);
        id v164 = (id)objc_claimAutoreleasedReturnValue();
        v165 = NSStringFromSelector(a2);
        id v166 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v164;
        __int16 v235 = 2112;
        id v236 = v165;
        __int16 v237 = 2112;
        id v238 = v166;
        _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v39 = v228[5];
      v190 = 0;
      v187 = 0;
    }
    else
    {
      __int16 v44 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        id v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v47 = (id)objc_claimAutoreleasedReturnValue();
        [v182 doubleValue];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v46;
        __int16 v235 = 2112;
        id v236 = v47;
        __int16 v237 = 2048;
        id v238 = v48;
        _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, %@, using bounding box radius, %.3f", buf, 0x20u);
      }
      long long v213 = 0u;
      long long v214 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      id v176 = v186;
      uint64_t v49 = [v176 countByEnumeratingWithState:&v211 objects:v245 count:16];
      if (v49)
      {
        uint64_t v179 = v49;
        id v50 = 0;
        id v51 = 0;
        uint64_t v181 = *(void *)v212;
        uint64_t v180 = *MEMORY[0x1E4F99C08];
        uint64_t v177 = *MEMORY[0x1E4F5CFE8];
        uint64_t v178 = *MEMORY[0x1E4F28568];
LABEL_57:
        uint64_t v188 = 0;
        id v52 = v50;
        id v192 = v51;
        while (1)
        {
          if (*(void *)v212 != v181) {
            objc_enumerationMutation(v176);
          }
          dispatch_semaphore_t v53 = *(void **)(*((void *)&v211 + 1) + 8 * v188);
          context = (void *)MEMORY[0x1E016D870]();
          id v191 = v53;

          id v54 = objc_alloc(MEMORY[0x1E4F99920]);
          id v55 = objc_alloc(MEMORY[0x1E4F28C18]);
          [v184 doubleValue];
          id v57 = (void *)[v55 initWithStartDate:v183 duration:v56 + v56];
          id v58 = objc_alloc(MEMORY[0x1E4F28C18]);
          dispatch_time_t v59 = [v195 dateByAddingTimeInterval:-2419200.0];
          id v60 = (void *)[v58 initWithStartDate:v59 duration:2419200.0];
          id v61 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTLocation:v196];
          id v62 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          id v63 = [v191 locationOfInterest];
          double v64 = [v63 location];
          id v65 = (void *)[v62 initWithRTLocation:v64];
          LOBYTE(v175) = 1;
          v189 = (void *)[v54 initWithBatchSize:v180 fetchLimit:v180 sortBySessionStartDate:1 ascending:0 sessionTypes:&unk_1F3453168 timeInADayInterval:v57 pickOneConfigInTimeInADayInterval:v175 dateInterval:v60 startBoundingBoxLocation:v61 destinationBoundingBoxLocation:v65 boundingBoxRadius:v182 sessionIdentifier:0];

          dispatch_semaphore_t v66 = dispatch_semaphore_create(0);
          id v67 = [(SMSuggestionsManager *)self sessionStore];
          v207[0] = MEMORY[0x1E4F143A8];
          v207[1] = 3221225472;
          v207[2] = __87__SMSuggestionsManager__generatePersonalizedSuggestionForRegularUserFromContext_error___block_invoke;
          v207[3] = &unk_1E6B905F0;
          v209 = &v216;
          v210 = &v227;
          BOOL v68 = v66;
          v208 = v68;
          [v67 fetchSessionConfigurationsWithOptions:v189 handler:v207];

          id v69 = v68;
          id v70 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v71 = dispatch_time(0, 3600000000000);
          id v72 = v192;
          if (dispatch_semaphore_wait(v69, v71))
          {
            id v73 = [MEMORY[0x1E4F1C9C8] now];
            [v73 timeIntervalSinceDate:v70];
            double v75 = v74;
            __int16 v76 = objc_opt_new();
            id v77 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
            __int16 v78 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v79 = [v78 filteredArrayUsingPredicate:v77];
            BOOL v80 = [v79 firstObject];

            [v76 submitToCoreAnalytics:v80 type:1 duration:v75];
            id v81 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
            }

            id v82 = (void *)MEMORY[0x1E4F28C58];
            v246[0] = v178;
            *(void *)buf = @"semaphore wait timeout";
            uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v246 count:1];
            __int16 v84 = [v82 errorWithDomain:v177 code:15 userInfo:v83];

            id v72 = v192;
            if (v84)
            {
              id v72 = v84;
            }
          }

          id v51 = v72;
          if (v51)
          {
            objc_storeStrong(v228 + 5, v72);
            BOOL v85 = 0;
          }
          else
          {
            __int16 v86 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              id v87 = (objc_class *)objc_opt_class();
              NSStringFromClass(v87);
              id v88 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v89 = (id)objc_claimAutoreleasedReturnValue();
              id v90 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:v197];
              uint64_t v91 = [(id)v217[5] count];
              *(_DWORD *)buf = 138413570;
              *(void *)&uint8_t buf[4] = v88;
              __int16 v235 = 2112;
              id v236 = v89;
              __int16 v237 = 2112;
              id v238 = v90;
              __int16 v239 = 2112;
              uint64_t v240 = (uint64_t)v191;
              __int16 v241 = 2048;
              uint64_t v242 = v91;
              __int16 v243 = 2048;
              uint64_t v244 = 3;
              _os_log_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, nploi, %@, sessionConfiguration count, %lu, kSMSuggestionRegularUserSessionConfigurationCount, %lu", buf, 0x3Eu);
            }
            BOOL v85 = (unint64_t)[(id)v217[5] count] < 3;
          }

          id v50 = v191;
          if (!v85) {
            break;
          }
          id v52 = v191;
          id v192 = v51;
          if (v179 == ++v188)
          {
            uint64_t v179 = [v176 countByEnumeratingWithState:&v211 objects:v245 count:16];
            if (v179) {
              goto LABEL_57;
            }
            break;
          }
        }
      }
      else
      {
        id v50 = 0;
        id v51 = 0;
      }
      v187 = v51;
      v190 = v50;

      if (!a4 || !v228[5])
      {
        id v101 = (void *)v217[5];
        if (v101 && (unint64_t)[v101 count] > 2)
        {
          long long v205 = 0u;
          long long v206 = 0u;
          long long v203 = 0u;
          long long v204 = 0u;
          id v193 = (id)v217[5];
          uint64_t v108 = [v193 countByEnumeratingWithState:&v203 objects:v233 count:16];
          if (v108)
          {
            uint64_t v109 = *(void *)v204;
            do
            {
              for (uint64_t i = 0; i != v108; ++i)
              {
                id v111 = self;
                if (*(void *)v204 != v109) {
                  objc_enumerationMutation(v193);
                }
                uint64_t v112 = *(void **)(*((void *)&v203 + 1) + 8 * i);
                __int16 v113 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                {
                  __int16 v114 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v114);
                  id v115 = (id)objc_claimAutoreleasedReturnValue();
                  double v116 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v115;
                  __int16 v235 = 2112;
                  id v236 = v116;
                  __int16 v237 = 2112;
                  id v238 = v112;
                  _os_log_impl(&dword_1D9BFA000, v113, OS_LOG_TYPE_INFO, "%@, %@, session, %@", buf, 0x20u);
                }
                self = v111;
              }
              uint64_t v108 = [v193 countByEnumeratingWithState:&v203 objects:v233 count:16];
            }
            while (v108);
          }

          uint64_t v117 = v217[5];
          __int16 v118 = v228 + 5;
          id v202 = v228[5];
          id v194 = [(SMSuggestionsManager *)self _getFirstEligibleHandleFromSessionConfigurations:v117 error:&v202];
          objc_storeStrong(v118, v202);
          if (a4 && v228[5])
          {
            uint64_t v119 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            {
              v171 = (objc_class *)objc_opt_class();
              NSStringFromClass(v171);
              id v172 = (id)objc_claimAutoreleasedReturnValue();
              v173 = NSStringFromSelector(a2);
              id v174 = v228[5];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v172;
              __int16 v235 = 2112;
              id v236 = v173;
              __int16 v237 = 2112;
              id v238 = v174;
              _os_log_error_impl(&dword_1D9BFA000, v119, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
            }
            id v7 = 0;
            *a4 = v228[5];
          }
          else
          {
            __int16 v120 = +[SMSuggestionsHelper getSMContactInformationFromSMHandle:v194];
            if (v120)
            {
              __int16 v121 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
              {
                id v122 = (objc_class *)objc_opt_class();
                NSStringFromClass(v122);
                id v123 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v124 = (id)objc_claimAutoreleasedReturnValue();
                v125 = [(id)v217[5] firstObject];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v123;
                __int16 v235 = 2112;
                id v236 = v124;
                __int16 v237 = 2112;
                id v238 = v125;
                _os_log_impl(&dword_1D9BFA000, v121, OS_LOG_TYPE_INFO, "%@, %@, first obj session info, %@", buf, 0x20u);
              }
              v126 = [(id)v217[5] firstObject];
              v127 = [v126 destination];
              [v127 radius];
              double v129 = v128;
              v130 = [v190 locationOfInterest];
              v131 = [v130 location];
              id v201 = 0;
              v132 = +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceRadius:v131 location:&v201 error:v129];
              id v133 = v201;

              id v134 = v132;
              v135 = v134;
              if (v133 || (v136 = v134) == 0)
              {
                v137 = [v190 locationOfInterest];
                v136 = [v137 location];
              }
              id v138 = objc_alloc(MEMORY[0x1E4F999B8]);
              v139 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v195 duration:3600.0];
              v140 = [v190 locationOfInterest];
              v141 = (void *)[v138 initWithSuggestionTrigger:v197 suggestionUserType:1 suppressionReason:1 sessionType:2 sourceLocation:v196 destinationLocation:v136 buddy:v120 dateInterval:v139 creationDate:v195 locationOfInterest:v140];

              v142 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
              {
                v143 = (objc_class *)objc_opt_class();
                NSStringFromClass(v143);
                id v144 = (id)objc_claimAutoreleasedReturnValue();
                v145 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v144;
                __int16 v235 = 2112;
                id v236 = v145;
                __int16 v237 = 2112;
                id v238 = v141;
                _os_log_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", buf, 0x20u);
              }
              if (a4) {
                *a4 = v133;
              }
              id v7 = v141;
            }
            else
            {
              v154 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
              {
                v155 = (objc_class *)objc_opt_class();
                NSStringFromClass(v155);
                id v156 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v157 = (id)objc_claimAutoreleasedReturnValue();
                v158 = [(id)v217[5] firstObject];
                v159 = [v158 conversation];
                v160 = [v159 receiverHandles];
                v161 = [v160 firstObject];
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v156;
                __int16 v235 = 2112;
                id v236 = v157;
                __int16 v237 = 2112;
                id v238 = 0;
                __int16 v239 = 2112;
                uint64_t v240 = (uint64_t)v161;
                _os_log_impl(&dword_1D9BFA000, v154, OS_LOG_TYPE_INFO, "%@, %@, invalid contact information, %@, handle, %@", buf, 0x2Au);
              }
              id v7 = 0;
            }
          }
        }
        else
        {
          id v102 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
          {
            uint64_t v103 = (objc_class *)objc_opt_class();
            NSStringFromClass(v103);
            id v104 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v105 = (id)objc_claimAutoreleasedReturnValue();
            id v106 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:v197];
            uint64_t v107 = [(id)v217[5] count];
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v104;
            __int16 v235 = 2112;
            id v236 = v105;
            __int16 v237 = 2112;
            id v238 = v106;
            __int16 v239 = 2048;
            uint64_t v240 = v107;
            __int16 v241 = 2048;
            uint64_t v242 = 3;
            _os_log_impl(&dword_1D9BFA000, v102, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because sessionConfiguration count doesn't meet threshold, sessionConfiguration count, %lu, kSMSuggestionRegularUserSessionConfigurationCount, %lu", buf, 0x34u);
          }
          id v7 = 0;
        }
        goto LABEL_115;
      }
      uint64_t v100 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        v167 = (objc_class *)objc_opt_class();
        NSStringFromClass(v167);
        id v168 = (id)objc_claimAutoreleasedReturnValue();
        v169 = NSStringFromSelector(a2);
        id v170 = v228[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v168;
        __int16 v235 = 2112;
        id v236 = v169;
        __int16 v237 = 2112;
        id v238 = v170;
        _os_log_error_impl(&dword_1D9BFA000, v100, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v39 = v228[5];
    }
    id v7 = 0;
    *a4 = v39;
LABEL_115:

LABEL_116:
    _Block_object_dispose(&v216, 8);

LABEL_117:
LABEL_118:

LABEL_119:
LABEL_120:

LABEL_121:
    _Block_object_dispose(&v227, 8);

    goto LABEL_122;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"context");
    id v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
LABEL_122:

  return v7;
}

void __87__SMSuggestionsManager__generatePersonalizedSuggestionForRegularUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_generatePersonalizedSuggestionForOccasionalUserFromContext:(id)a3 error:(id *)a4
{
  v211[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v170 = v5;
  if (v5)
  {
    uint64_t v193 = 0;
    id v194 = (id *)&v193;
    uint64_t v195 = 0x3032000000;
    v196 = __Block_byref_object_copy__102;
    unint64_t v197 = __Block_byref_object_dispose__102;
    id v198 = 0;
    id obj = 0;
    v169 = self;
    unint64_t v167 = [(SMSuggestionsManager *)self _getSuggestionTriggerFromContext:v5 error:&obj];
    objc_storeStrong(&v198, obj);
    if (a4 && v194[5])
    {
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        double v31 = NSStringFromSelector(a2);
        id v32 = v194[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v30;
        __int16 v200 = 2112;
        id v201 = v31;
        __int16 v202 = 2112;
        id v203 = v32;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v194[5];
      goto LABEL_97;
    }
    if (!v167)
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        BOOL v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        id v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v15;
        __int16 v200 = 2112;
        id v201 = v16;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);
      }
      id v7 = 0;
      goto LABEL_97;
    }
    unint64_t v8 = v194 + 5;
    id v191 = v194[5];
    id v166 = [(SMSuggestionsManager *)v169 _getSourceLocationFromContext:v170 error:&v191];
    objc_storeStrong(v8, v191);
    uint64_t v9 = v194 + 5;
    if (a4)
    {
      id v10 = v169;
      if (v194[5])
      {
        id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v93 = (objc_class *)objc_opt_class();
          NSStringFromClass(v93);
          id v94 = (id)objc_claimAutoreleasedReturnValue();
          id v95 = NSStringFromSelector(a2);
          id v96 = v194[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v94;
          __int16 v200 = 2112;
          id v201 = v95;
          __int16 v202 = 2112;
          id v203 = v96;
          _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        id v7 = 0;
        *a4 = v194[5];
        goto LABEL_96;
      }
      uint64_t v17 = v170;
    }
    else
    {
      id v10 = v169;
      uint64_t v17 = v170;
    }
    id v190 = v194[5];
    v165 = [(SMSuggestionsManager *)v10 _getCurrentDateFromContext:v17 error:&v190];
    objc_storeStrong(v9, v190);
    uint64_t v18 = v194 + 5;
    if (a4)
    {
      uint64_t v19 = v169;
      if (v194[5])
      {
        uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          __int16 v121 = (objc_class *)objc_opt_class();
          NSStringFromClass(v121);
          id v122 = (id)objc_claimAutoreleasedReturnValue();
          id v123 = NSStringFromSelector(a2);
          id v124 = v194[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v122;
          __int16 v200 = 2112;
          id v201 = v123;
          __int16 v202 = 2112;
          id v203 = v124;
          _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        id v7 = 0;
        *a4 = v194[5];
        goto LABEL_95;
      }
    }
    else
    {
      uint64_t v19 = v169;
    }
    id v189 = v194[5];
    v161 = [(SMSuggestionsManager *)v19 _getNPLOIsWithOnlyHighConfidence:1 location:v166 date:v165 error:&v189];
    objc_storeStrong(v18, v189);
    if (a4 && v194[5])
    {
      id v21 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v132 = (objc_class *)objc_opt_class();
        NSStringFromClass(v132);
        id v133 = (id)objc_claimAutoreleasedReturnValue();
        id v134 = NSStringFromSelector(a2);
        id v135 = v194[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v133;
        __int16 v200 = 2112;
        id v201 = v134;
        __int16 v202 = 2112;
        id v203 = v135;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v194[5];
      goto LABEL_94;
    }
    if (!v161 || ![v161 count])
    {
      id v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:v167];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v26;
        __int16 v200 = 2112;
        id v201 = v27;
        __int16 v202 = 2112;
        id v203 = v28;
        _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because nploi with High confidence is not found", buf, 0x20u);
      }
      id v7 = 0;
      goto LABEL_94;
    }
    long long v22 = v194 + 5;
    id v188 = v194[5];
    v160 = [(SMSuggestionsManager *)v169 _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionTimeIntervalBuffer" error:&v188];
    objc_storeStrong(v22, v188);
    if (a4 && v194[5])
    {
      id v23 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v136 = (objc_class *)objc_opt_class();
        NSStringFromClass(v136);
        id v137 = (id)objc_claimAutoreleasedReturnValue();
        id v138 = NSStringFromSelector(a2);
        id v139 = v194[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v137;
        __int16 v200 = 2112;
        id v201 = v138;
        __int16 v202 = 2112;
        id v203 = v139;
        _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v7 = 0;
      *a4 = v194[5];
      goto LABEL_93;
    }
    id v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      [v160 doubleValue];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v200 = 2112;
      id v201 = v36;
      __int16 v202 = 2048;
      id v203 = v37;
      _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "%@, %@, using time interval buffer, %.3f", buf, 0x20u);
    }
    [v160 doubleValue];
    v158 = [v165 dateByAddingTimeInterval:-v38];
    uint64_t v182 = 0;
    v183 = &v182;
    uint64_t v184 = 0x3032000000;
    v185 = __Block_byref_object_copy__102;
    v186 = __Block_byref_object_dispose__102;
    id v187 = 0;
    id v39 = v194 + 5;
    id v181 = v194[5];
    v159 = [(SMSuggestionsManager *)v169 _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionBoundingBoxRadius" error:&v181];
    objc_storeStrong(v39, v181);
    if (a4 && v194[5])
    {
      dispatch_semaphore_t v40 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v140 = (objc_class *)objc_opt_class();
        NSStringFromClass(v140);
        id v141 = (id)objc_claimAutoreleasedReturnValue();
        v142 = NSStringFromSelector(a2);
        id v143 = v194[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v141;
        __int16 v200 = 2112;
        id v201 = v142;
        __int16 v202 = 2112;
        id v203 = v143;
        _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v41 = v194[5];
      __int16 v42 = 0;
      id v43 = 0;
    }
    else
    {
      __int16 v44 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        id v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v47 = (id)objc_claimAutoreleasedReturnValue();
        [v159 doubleValue];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v46;
        __int16 v200 = 2112;
        id v201 = v47;
        __int16 v202 = 2048;
        id v203 = v48;
        _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, %@, using bounding box radius, %.3f", buf, 0x20u);
      }
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      id v152 = v161;
      uint64_t v49 = [v152 countByEnumeratingWithState:&v177 objects:v210 count:16];
      id v50 = 0;
      id v43 = 0;
      if (v49)
      {
        uint64_t v157 = *(void *)v178;
        uint64_t v156 = *MEMORY[0x1E4F99C08];
        uint64_t v153 = *MEMORY[0x1E4F5CFE8];
        uint64_t v154 = *MEMORY[0x1E4F28568];
LABEL_55:
        uint64_t v155 = v49;
        uint64_t v163 = 0;
        id v51 = v50;
        id v52 = v43;
        while (1)
        {
          if (*(void *)v178 != v157) {
            objc_enumerationMutation(v152);
          }
          dispatch_semaphore_t v53 = *(void **)(*((void *)&v177 + 1) + 8 * v163);
          context = (void *)MEMORY[0x1E016D870]();
          id v164 = v53;

          id v54 = objc_alloc(MEMORY[0x1E4F99920]);
          id v55 = objc_alloc(MEMORY[0x1E4F28C18]);
          [v160 doubleValue];
          id v57 = (void *)[v55 initWithStartDate:v158 duration:v56 + v56];
          id v58 = objc_alloc(MEMORY[0x1E4F28C18]);
          dispatch_time_t v59 = [v165 dateByAddingTimeInterval:-604800.0];
          id v60 = (void *)[v58 initWithStartDate:v59 duration:604800.0];
          id v61 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          id v62 = [v164 locationOfInterest];
          id v63 = [v62 location];
          double v64 = (void *)[v61 initWithRTLocation:v63];
          LOBYTE(v151) = 1;
          id v65 = (void *)[v54 initWithBatchSize:v156 fetchLimit:v156 sortBySessionStartDate:1 ascending:0 sessionTypes:&unk_1F3453180 timeInADayInterval:v57 pickOneConfigInTimeInADayInterval:v151 dateInterval:v60 startBoundingBoxLocation:0 destinationBoundingBoxLocation:v64 boundingBoxRadius:v159 sessionIdentifier:0];

          dispatch_semaphore_t v66 = dispatch_semaphore_create(0);
          id v67 = [(SMSuggestionsManager *)v169 sessionStore];
          v173[0] = MEMORY[0x1E4F143A8];
          v173[1] = 3221225472;
          v173[2] = __90__SMSuggestionsManager__generatePersonalizedSuggestionForOccasionalUserFromContext_error___block_invoke;
          v173[3] = &unk_1E6B905F0;
          uint64_t v175 = &v182;
          id v176 = &v193;
          BOOL v68 = v66;
          id v174 = v68;
          [v67 fetchSessionConfigurationsWithOptions:v65 handler:v173];

          id v69 = v68;
          id v70 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v71 = dispatch_time(0, 3600000000000);
          id v72 = v52;
          if (dispatch_semaphore_wait(v69, v71))
          {
            id v73 = [MEMORY[0x1E4F1C9C8] now];
            [v73 timeIntervalSinceDate:v70];
            double v75 = v74;
            __int16 v76 = objc_opt_new();
            id v77 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
            __int16 v78 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v79 = [v78 filteredArrayUsingPredicate:v77];
            BOOL v80 = [v79 firstObject];

            [v76 submitToCoreAnalytics:v80 type:1 duration:v75];
            id v81 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v81, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
            }

            id v82 = (void *)MEMORY[0x1E4F28C58];
            v211[0] = v154;
            *(void *)buf = @"semaphore wait timeout";
            uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v211 count:1];
            __int16 v84 = [v82 errorWithDomain:v153 code:15 userInfo:v83];

            id v72 = v52;
            if (v84)
            {
              id v72 = v84;
            }
          }

          id v43 = v72;
          if (v43)
          {
            objc_storeStrong(v194 + 5, v72);
            BOOL v85 = 0;
          }
          else
          {
            __int16 v86 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              id v87 = (objc_class *)objc_opt_class();
              NSStringFromClass(v87);
              id v88 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v89 = (id)objc_claimAutoreleasedReturnValue();
              id v90 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:v167];
              uint64_t v91 = [(id)v183[5] count];
              *(_DWORD *)buf = 138413570;
              *(void *)&uint8_t buf[4] = v88;
              __int16 v200 = 2112;
              id v201 = v89;
              __int16 v202 = 2112;
              id v203 = v164;
              __int16 v204 = 2112;
              uint64_t v205 = (uint64_t)v90;
              __int16 v206 = 2048;
              uint64_t v207 = v91;
              __int16 v208 = 2048;
              uint64_t v209 = 1;
              _os_log_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, nploi, %@, sessionConfiguration count, %lu, kSMSuggestionOccasionalUserSessionConfigurationCount, %lu", buf, 0x3Eu);
            }
            BOOL v85 = (unint64_t)[(id)v183[5] count] < 2;
          }

          id v50 = v164;
          if (!v85) {
            break;
          }
          id v51 = v164;
          id v52 = v43;
          if (v155 == ++v163)
          {
            uint64_t v49 = [v152 countByEnumeratingWithState:&v177 objects:v210 count:16];
            if (v49) {
              goto LABEL_55;
            }
            break;
          }
        }
      }
      __int16 v42 = v50;

      if (!a4 || !v194[5])
      {
        id v97 = (void *)v183[5];
        if (v97 && [v97 count])
        {
          uint64_t v98 = +[SMSuggestionsHelper dedupeSessionConfigurations:v183[5]];
          id v99 = (void *)v183[5];
          v183[5] = v98;

          uint64_t v100 = [(id)v183[5] firstObject];
          id v101 = [v100 destination];
          [v101 radius];
          double v103 = v102;
          id v104 = [v50 locationOfInterest];
          id v105 = [v104 location];
          id v172 = 0;
          id v106 = +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceRadius:v105 location:&v172 error:v103];
          id v107 = v172;

          id v108 = v106;
          uint64_t v109 = v108;
          if (v107 || (v110 = v108) == 0)
          {
            id v111 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              v148 = (objc_class *)objc_opt_class();
              NSStringFromClass(v148);
              id v149 = (id)objc_claimAutoreleasedReturnValue();
              v150 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v149;
              __int16 v200 = 2112;
              id v201 = v150;
              __int16 v202 = 2112;
              id v203 = v109;
              __int16 v204 = 2112;
              uint64_t v205 = (uint64_t)v107;
              _os_log_error_impl(&dword_1D9BFA000, v111, OS_LOG_TYPE_ERROR, "%@, %@, masqueradingLocation, %@, error, %@", buf, 0x2Au);
            }
            uint64_t v112 = [v42 locationOfInterest];
            v110 = [v112 location];
          }
          id v113 = objc_alloc(MEMORY[0x1E4F999B8]);
          __int16 v114 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v165 duration:3600.0];
          id v115 = [v42 locationOfInterest];
          double v116 = (void *)[v113 initWithSuggestionTrigger:v167 suggestionUserType:2 suppressionReason:1 sessionType:2 sourceLocation:v166 destinationLocation:v110 buddy:0 dateInterval:v114 creationDate:v165 locationOfInterest:v115];

          uint64_t v117 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
          {
            __int16 v118 = (objc_class *)objc_opt_class();
            NSStringFromClass(v118);
            id v119 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v120 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v119;
            __int16 v200 = 2112;
            id v201 = v120;
            __int16 v202 = 2112;
            id v203 = v116;
            _os_log_impl(&dword_1D9BFA000, v117, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", buf, 0x20u);
          }
          if (a4) {
            *a4 = v107;
          }
          id v7 = v116;
        }
        else
        {
          v125 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
          {
            v126 = (objc_class *)objc_opt_class();
            NSStringFromClass(v126);
            id v127 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v128 = (id)objc_claimAutoreleasedReturnValue();
            id v129 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:v167];
            uint64_t v130 = [(id)v183[5] count];
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v127;
            __int16 v200 = 2112;
            id v201 = v128;
            __int16 v202 = 2112;
            id v203 = v129;
            __int16 v204 = 2048;
            uint64_t v205 = v130;
            __int16 v206 = 2048;
            uint64_t v207 = 1;
            _os_log_impl(&dword_1D9BFA000, v125, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because sessionConfiguration count doesn't meet threshold, sessionConfiguration count, %lu, kSMSuggestionOccasionalUserSessionConfigurationCount, %lu", buf, 0x34u);
          }
          id v7 = 0;
        }
        goto LABEL_92;
      }
      __int16 v92 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        id v144 = (objc_class *)objc_opt_class();
        NSStringFromClass(v144);
        id v145 = (id)objc_claimAutoreleasedReturnValue();
        v146 = NSStringFromSelector(a2);
        id v147 = v194[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v145;
        __int16 v200 = 2112;
        id v201 = v146;
        __int16 v202 = 2112;
        id v203 = v147;
        _os_log_error_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v41 = v194[5];
    }
    id v7 = 0;
    *a4 = v41;
LABEL_92:

    _Block_object_dispose(&v182, 8);
LABEL_93:

LABEL_94:
LABEL_95:

LABEL_96:
LABEL_97:
    _Block_object_dispose(&v193, 8);

    goto LABEL_98;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"context");
    id v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
LABEL_98:

  return v7;
}

void __90__SMSuggestionsManager__generatePersonalizedSuggestionForOccasionalUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_generatePersonalizedSuggestionForFirstTimeUserFromContext:(id)a3 error:(id *)a4
{
  v186[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v169 = 0;
    id v170 = &v169;
    uint64_t v171 = 0x3032000000;
    id v172 = __Block_byref_object_copy__102;
    v173 = __Block_byref_object_dispose__102;
    id v174 = 0;
    id obj = 0;
    unint64_t v7 = [(SMSuggestionsManager *)self _getSuggestionTriggerFromContext:v6 error:&obj];
    objc_storeStrong(&v174, obj);
    if (a4 && v170[5])
    {
      unint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        double v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_t v40 = NSStringFromSelector(a2);
        id v41 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v39;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v184 = v41;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v9 = 0;
      *a4 = (id) v170[5];
      goto LABEL_51;
    }
    if (!v7)
    {
      id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);
      }
      id v9 = 0;
      goto LABEL_51;
    }
    id v10 = (id *)(v170 + 5);
    id v167 = (id)v170[5];
    id v152 = [(SMSuggestionsManager *)self _getSourceLocationFromContext:v6 error:&v167];
    objc_storeStrong(v10, v167);
    id v11 = (id *)(v170 + 5);
    if (a4 && v170[5])
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        dispatch_semaphore_t v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        id v54 = (id)objc_claimAutoreleasedReturnValue();
        id v55 = NSStringFromSelector(a2);
        double v56 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v54;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v55;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v184 = v56;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v9 = 0;
      *a4 = (id) v170[5];
      goto LABEL_50;
    }
    id v166 = (id)v170[5];
    uint64_t v151 = [(SMSuggestionsManager *)self _getCurrentDateFromContext:v6 error:&v166];
    objc_storeStrong(v11, v166);
    if (a4 && v170[5])
    {
      BOOL v14 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_time_t v59 = NSStringFromSelector(a2);
        id v60 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v58;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v59;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v184 = v60;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v9 = 0;
      *a4 = (id) v170[5];
      goto LABEL_49;
    }
    v150 = [(SMSuggestionsManager *)self _getSystemVersionUpdateDate];
    [v151 timeIntervalSinceDate:x0];
    double v20 = v19;
    id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = [v150 stringFromDate];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v184 = v25;
      *(_WORD *)v185 = 2048;
      *(void *)&v185[2] = (unint64_t)v20;
      *(_WORD *)&v185[10] = 2048;
      *(void *)&v185[12] = 0x4122750000000000;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, systemVersionUpdateDate, %@, timeIntervalSinceLastVersionUpdate, %lu, kSMSuggestionFirstTimeUserMinimumVersionUpdateTimeInterval, %.3f", buf, 0x34u);
    }
    id v9 = 0;
    if (!v150 || v20 < 604800.0)
    {
LABEL_48:

LABEL_49:
LABEL_50:

LABEL_51:
      _Block_object_dispose(&v169, 8);

      goto LABEL_52;
    }
    id v26 = (id *)(v170 + 5);
    id v165 = (id)v170[5];
    id v149 = [(SMSuggestionsManager *)self _getNPLOIsToHomeWithOnlyHighConfidence:1 location:v152 date:v151 error:&v165];
    objc_storeStrong(v26, v165);
    if (a4 && v170[5])
    {
      id v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v109 = (objc_class *)objc_opt_class();
        NSStringFromClass(v109);
        id v110 = (id)objc_claimAutoreleasedReturnValue();
        id v111 = NSStringFromSelector(a2);
        uint64_t v112 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v110;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v111;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v184 = v112;
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v28 = (id) v170[5];
LABEL_35:
      id v9 = 0;
      *a4 = v28;
LABEL_47:

      goto LABEL_48;
    }
    if (v149 && [v149 count])
    {
      id v29 = (id *)(v170 + 5);
      id v164 = (id)v170[5];
      BOOL v30 = [(SMSuggestionsManager *)self _isFirstTimeUserOfZelkovaWithError:&v164];
      objc_storeStrong(v29, v164);
      if (a4 && v170[5])
      {
        double v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v131 = (objc_class *)objc_opt_class();
          NSStringFromClass(v131);
          id v132 = (id)objc_claimAutoreleasedReturnValue();
          id v133 = NSStringFromSelector(a2);
          id v134 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v132;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v133;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v184 = v134;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        id v28 = (id) v170[5];
        goto LABEL_35;
      }
      if (v30)
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v42 setDateFormat:@"HH.mm"];
        id v43 = [v42 stringFromDate:v151];
        __int16 v44 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          [v43 floatValue];
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v45;
          _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "Time of the day logged from user context: %f", buf, 0xCu);
        }
        id v141 = v43;
        v140 = v42;

        [v43 floatValue];
        if (v46 > 5.0)
        {
          [v43 floatValue];
          if (v47 < 22.0)
          {
            double v48 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              uint64_t v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              id v50 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v51 = (id)objc_claimAutoreleasedReturnValue();
              id v52 = [v151 stringFromDate];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v50;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v51;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v184 = v52;
              *(_WORD *)v185 = 2048;
              *(void *)&v185[2] = 0x4014000000000000;
              *(_WORD *)&v185[10] = 2048;
              *(void *)&v185[12] = 0x4036000000000000;
              _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, %@, date check failed, current date, %@, suggestion skipped because time of day is between %f to %f", buf, 0x34u);
            }
            id v9 = 0;
            goto LABEL_107;
          }
        }
        dispatch_semaphore_t v65 = dispatch_semaphore_create(0);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        uint64_t v184 = __Block_byref_object_copy__102;
        *(void *)v185 = __Block_byref_object_dispose__102;
        *(void *)&v185[8] = 0;
        dispatch_semaphore_t v66 = [(SMSuggestionsManager *)self suggestionsHelper];
        v160[0] = MEMORY[0x1E4F143A8];
        v160[1] = 3221225472;
        v160[2] = __89__SMSuggestionsManager__generatePersonalizedSuggestionForFirstTimeUserFromContext_error___block_invoke;
        v160[3] = &unk_1E6B905F0;
        v162 = buf;
        uint64_t v163 = &v169;
        id v67 = v65;
        v161 = v67;
        [v66 fetchMostLikelyReceiverHandlesWithHandler:v160];

        dsema = v67;
        BOOL v68 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v69 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(dsema, v69)) {
          goto LABEL_71;
        }
        id v70 = [MEMORY[0x1E4F1C9C8] now];
        [v70 timeIntervalSinceDate:v68];
        double v72 = v71;
        context = objc_opt_new();
        id v73 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
        double v74 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v75 = [v74 filteredArrayUsingPredicate:v73];
        __int16 v76 = [v75 firstObject];

        [context submitToCoreAnalytics:v76 type:1 duration:v72];
        id v77 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v175 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v77, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v175, 2u);
        }

        __int16 v78 = (void *)MEMORY[0x1E4F28C58];
        v186[0] = *MEMORY[0x1E4F28568];
        *(void *)uint64_t v175 = @"semaphore wait timeout";
        uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v186 count:1];
        BOOL v80 = [v78 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v79];

        if (v80)
        {
          id v81 = v80;
        }
        else
        {
LABEL_71:
          id v81 = 0;
        }

        id v82 = v81;
        uint64_t v83 = *(void **)(*(void *)&buf[8] + 40);
        id v139 = v82;
        if (v83 && [v83 count])
        {
          long long v158 = 0u;
          long long v159 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          id v144 = *(id *)(*(void *)&buf[8] + 40);
          uint64_t v84 = [v144 countByEnumeratingWithState:&v156 objects:v182 count:16];
          if (v84)
          {
            char v143 = 0;
            uint64_t v145 = *(void *)v157;
LABEL_76:
            uint64_t v85 = 0;
            uint64_t v146 = v84;
            while (1)
            {
              if (*(void *)v157 != v145) {
                objc_enumerationMutation(v144);
              }
              __int16 v86 = *(void **)(*((void *)&v156 + 1) + 8 * v85);
              contexta = (void *)MEMORY[0x1E016D870]();
              id v87 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
              {
                id v88 = (objc_class *)objc_opt_class();
                NSStringFromClass(v88);
                id v89 = (id)objc_claimAutoreleasedReturnValue();
                id v90 = NSStringFromSelector(a2);
                *(_DWORD *)uint64_t v175 = 138412802;
                *(void *)&v175[4] = v89;
                __int16 v176 = 2112;
                uint64_t v177 = (uint64_t)v90;
                __int16 v178 = 2112;
                long long v179 = v86;
                _os_log_impl(&dword_1D9BFA000, v87, OS_LOG_TYPE_INFO, "%@, %@, handle, %@", v175, 0x20u);
              }
              uint64_t v91 = (id *)(v170 + 5);
              id v155 = (id)v170[5];
              BOOL v92 = [(SMSuggestionsManager *)self _checkReceiverEligibilityForHandle:v86 error:&v155];
              objc_storeStrong(v91, v155);
              id v94 = (id *)(v170 + 5);
              uint64_t v93 = v170[5];
              BOOL v95 = v93 == 0;
              if (v93) {
                BOOL v96 = 0;
              }
              else {
                BOOL v96 = v92;
              }
              if (v95) {
                int v97 = 7;
              }
              else {
                int v97 = 6;
              }
              if (v96)
              {
                id v154 = 0;
                BOOL v98 = [(SMSuggestionsManager *)self _didInteractInPastWithHandle:v86 timeInterval:&v154 error:604800.0];
                objc_storeStrong(v94, v154);
                id v99 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
                {
                  uint64_t v100 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v100);
                  id v101 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v102 = NSStringFromSelector(a2);
                  double v103 = (void *)v102;
                  *(_DWORD *)uint64_t v175 = 138413058;
                  id v104 = @"NO";
                  if (v98) {
                    id v104 = @"YES";
                  }
                  *(void *)&v175[4] = v101;
                  __int16 v176 = 2112;
                  uint64_t v177 = v102;
                  __int16 v178 = 2112;
                  long long v179 = v86;
                  __int16 v180 = 2112;
                  id v181 = v104;
                  _os_log_impl(&dword_1D9BFA000, v99, OS_LOG_TYPE_INFO, "%@, %@, handle, %@, interactedWithHandle, %@", v175, 0x2Au);
                }
                if (v170[5])
                {
                  int v97 = 6;
                }
                else
                {
                  v143 |= v98;
                  if (v98) {
                    int v97 = 6;
                  }
                  else {
                    int v97 = 0;
                  }
                }
              }
              if (v97 != 7)
              {
                if (v97) {
                  break;
                }
              }
              if (v146 == ++v85)
              {
                uint64_t v84 = [v144 countByEnumeratingWithState:&v156 objects:v182 count:16];
                if (v84) {
                  goto LABEL_76;
                }
                break;
              }
            }
          }
          else
          {
            char v143 = 0;
          }

          if (a4 && v170[5])
          {
            id v113 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              id v135 = (objc_class *)objc_opt_class();
              NSStringFromClass(v135);
              id v136 = (id)objc_claimAutoreleasedReturnValue();
              id v137 = NSStringFromSelector(a2);
              id v138 = (void *)v170[5];
              *(_DWORD *)uint64_t v175 = 138412802;
              *(void *)&v175[4] = v136;
              __int16 v176 = 2112;
              uint64_t v177 = (uint64_t)v137;
              __int16 v178 = 2112;
              long long v179 = v138;
              _os_log_error_impl(&dword_1D9BFA000, v113, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v175, 0x20u);
            }
            id v9 = 0;
            *a4 = (id) v170[5];
            goto LABEL_106;
          }
          if (v143)
          {
            id v114 = objc_alloc(MEMORY[0x1E4F999B8]);
            id v115 = [v149 firstObject];
            double v116 = [v115 locationOfInterest];
            uint64_t v117 = [v116 location];
            __int16 v118 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v151 duration:3600.0];
            id v119 = [v149 firstObject];
            __int16 v120 = [v119 locationOfInterest];
            __int16 v121 = [v114 initWithSuggestionTrigger:v7 suggestionUserType:3 suppressionReason:1 sessionType:2 sourceLocation:v152 destinationLocation:v117 buddy:0 dateInterval:v118 locationOfInterest:v151 creationDate:v120 locationOfInterest:v139];

            id v122 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
            {
              id v123 = (objc_class *)objc_opt_class();
              NSStringFromClass(v123);
              id v124 = (id)objc_claimAutoreleasedReturnValue();
              v125 = NSStringFromSelector(a2);
              *(_DWORD *)uint64_t v175 = 138412802;
              *(void *)&v175[4] = v124;
              __int16 v176 = 2112;
              uint64_t v177 = (uint64_t)v125;
              __int16 v178 = 2112;
              long long v179 = v121;
              _os_log_impl(&dword_1D9BFA000, v122, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", v175, 0x20u);
            }
            id v9 = v121;
            goto LABEL_106;
          }
          v126 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
          {
            id v127 = (objc_class *)objc_opt_class();
            NSStringFromClass(v127);
            id v128 = (id)objc_claimAutoreleasedReturnValue();
            id v129 = NSStringFromSelector(a2);
            uint64_t v130 = *(void **)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v175 = 138412802;
            *(void *)&v175[4] = v128;
            __int16 v176 = 2112;
            uint64_t v177 = (uint64_t)v129;
            __int16 v178 = 2112;
            long long v179 = v130;
            _os_log_impl(&dword_1D9BFA000, v126, OS_LOG_TYPE_INFO, "%@, %@, no eligible buddy for first time user, handles, %@", v175, 0x20u);
          }
        }
        else
        {
          id v105 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
          {
            id v106 = (objc_class *)objc_opt_class();
            NSStringFromClass(v106);
            id v107 = (id)objc_claimAutoreleasedReturnValue();
            id v108 = NSStringFromSelector(a2);
            *(_DWORD *)uint64_t v175 = 138412546;
            *(void *)&v175[4] = v107;
            __int16 v176 = 2112;
            uint64_t v177 = (uint64_t)v108;
            _os_log_impl(&dword_1D9BFA000, v105, OS_LOG_TYPE_INFO, "%@, %@, likely receivers don't exist", v175, 0x16u);
          }
        }
        id v9 = 0;
LABEL_106:

        _Block_object_dispose(buf, 8);
        double v48 = dsema;
LABEL_107:

        goto LABEL_47;
      }
      id v61 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        id v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        id v63 = (id)objc_claimAutoreleasedReturnValue();
        double v64 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v63;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v64;
        _os_log_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_INFO, "%@, %@, not a first time user, user already used zelkova before,", buf, 0x16u);
      }
    }
    else
    {
      id v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        id v36 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:v7];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v184 = v36;
        _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because nploi to Home with High confidence is not found", buf, 0x20u);
      }
    }
    id v9 = 0;
    goto LABEL_47;
  }
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"context");
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
LABEL_52:

  return v9;
}

void __89__SMSuggestionsManager__generatePersonalizedSuggestionForFirstTimeUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)suggestionEnabledForUserType:(unint64_t)a3
{
  uint64_t v15 = v3;
  switch(a3)
  {
    case 1uLL:
      uint64_t v9 = [(SMSuggestionsManager *)self defaultsManager];
      id v10 = v9;
      id v11 = @"RTDefaultsSuggestionRegularUserEnabled";
      goto LABEL_7;
    case 2uLL:
      uint64_t v9 = [(SMSuggestionsManager *)self defaultsManager];
      id v10 = v9;
      id v11 = @"RTDefaultsSuggestionOccasionalUserEnabled";
      goto LABEL_7;
    case 3uLL:
      uint64_t v9 = [(SMSuggestionsManager *)self defaultsManager];
      id v10 = v9;
      id v11 = @"RTDefaultsSuggestionFirstTimeUserEnabled";
      goto LABEL_7;
    case 4uLL:
      uint64_t v9 = [(SMSuggestionsManager *)self defaultsManager];
      id v10 = v9;
      id v11 = @"RTDefaultsSuggestionWorkoutUserEnabled";
LABEL_7:
      uint64_t v13 = [v9 objectForKey:v11 value:MEMORY[0x1E4F1CC38] value:v6 value:v5 value:v4 value:v15 value:v7 value:v8];
      char v14 = [v13 BOOLValue];

      BOOL result = v14;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (id)_generatePersonalizedSuggestionForWorkoutUserFromContext:(id)a3 error:(id *)a4
{
  v162[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v120 = v5;
  if (!v5)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"context");
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
    goto LABEL_92;
  }
  uint64_t v145 = 0;
  uint64_t v146 = &v145;
  uint64_t v147 = 0x3032000000;
  v148 = __Block_byref_object_copy__102;
  id v149 = __Block_byref_object_dispose__102;
  id v150 = 0;
  id obj = 0;
  id v122 = self;
  unint64_t v6 = [(SMSuggestionsManager *)self _getSuggestionTriggerFromContext:v5 error:&obj];
  objc_storeStrong(&v150, obj);
  if (a4 && v146[5])
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v80 = (objc_class *)objc_opt_class();
      NSStringFromClass(v80);
      id v81 = (id)objc_claimAutoreleasedReturnValue();
      id v82 = NSStringFromSelector(a2);
      unint64_t v83 = v146[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v81;
      __int16 v152 = 2112;
      uint64_t v153 = (uint64_t)v82;
      __int16 v154 = 2112;
      unint64_t v155 = v83;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v8 = 0;
    *a4 = (id) v146[5];
    goto LABEL_91;
  }
  if (v6 != 4)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v152 = 2112;
      uint64_t v153 = (uint64_t)v15;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);
    }
    id v8 = 0;
    goto LABEL_91;
  }
  uint64_t v9 = (id *)(v146 + 5);
  id v143 = (id)v146[5];
  id v114 = [(SMSuggestionsManager *)v122 _getCurrentDateFromContext:v120 error:&v143];
  objc_storeStrong(v9, v143);
  if (a4 && v146[5])
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v98 = (objc_class *)objc_opt_class();
      NSStringFromClass(v98);
      id v99 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v100 = NSStringFromSelector(a2);
      unint64_t v101 = v146[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v99;
      __int16 v152 = 2112;
      uint64_t v153 = (uint64_t)v100;
      __int16 v154 = 2112;
      unint64_t v155 = v101;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v8 = 0;
    *a4 = (id) v146[5];
    goto LABEL_90;
  }
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v137 = 0;
  id v138 = &v137;
  uint64_t v139 = 0x3032000000;
  v140 = __Block_byref_object_copy__102;
  id v141 = __Block_byref_object_dispose__102;
  id v142 = 0;
  id v17 = objc_alloc(MEMORY[0x1E4F99920]);
  id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
  double v19 = [v114 dateByAddingTimeInterval:-2419200.0];
  double v20 = (void *)[v18 initWithStartDate:v19 duration:2419200.0];
  LOBYTE(v110) = 0;
  id v113 = (void *)[v17 initWithBatchSize:*MEMORY[0x1E4F99C08] fetchLimit:*MEMORY[0x1E4F99C08] sortBySessionStartDate:1 ascending:0 sessionTypes:&unk_1F3453198 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v110 dateInterval:v20 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];

  id v21 = [(SMSuggestionsManager *)v122 sessionStore];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __87__SMSuggestionsManager__generatePersonalizedSuggestionForWorkoutUserFromContext_error___block_invoke;
  v133[3] = &unk_1E6B905F0;
  id v135 = &v137;
  id v136 = &v145;
  long long v22 = v16;
  id v134 = v22;
  [v21 fetchSessionConfigurationsWithOptions:v113 handler:v133];

  dsema = v22;
  id v23 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v24 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v24))
  {
    id v25 = [MEMORY[0x1E4F1C9C8] now];
    [v25 timeIntervalSinceDate:v23];
    double v27 = v26;
    id v28 = objc_opt_new();
    id v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    BOOL v30 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v31 = [v30 filteredArrayUsingPredicate:v29];
    id v32 = [v31 firstObject];

    [v28 submitToCoreAnalytics:v32 type:1 duration:v27];
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    id v34 = (void *)MEMORY[0x1E4F28C58];
    v162[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v162 count:1];
    id v36 = [v34 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v35];

    if (v36)
    {
      id v36 = v36;
    }
  }
  else
  {
    id v36 = 0;
  }

  id v112 = v36;
  if (a4 && v146[5])
  {
    id v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v102 = (objc_class *)objc_opt_class();
      NSStringFromClass(v102);
      id v103 = (id)objc_claimAutoreleasedReturnValue();
      id v104 = NSStringFromSelector(a2);
      unint64_t v105 = v146[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v103;
      __int16 v152 = 2112;
      uint64_t v153 = (uint64_t)v104;
      __int16 v154 = 2112;
      unint64_t v155 = v105;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v8 = 0;
    *a4 = (id) v146[5];
    goto LABEL_89;
  }
  id v38 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v39 = [v38 initWithCapacity:[v138[5] count]];
  id v40 = objc_alloc(MEMORY[0x1E4F1CA70]);
  id v41 = [v40 initWithCapacity:[v138[5] count]];
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v42 = (id)v138[5];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v129 objects:v161 count:16];
  if (!v43) {
    goto LABEL_45;
  }
  uint64_t v44 = *(void *)v130;
  do
  {
    for (uint64_t i = 0; i != v43; ++i)
    {
      if (*(void *)v130 != v44) {
        objc_enumerationMutation(v42);
      }
      float v46 = *(void **)(*((void *)&v129 + 1) + 8 * i);
      float v47 = [v46 sessionID];

      if (v47)
      {
        double v48 = [v46 sessionID];
        [v39 addObject:v48];
      }
      uint64_t v49 = [v46 conversation];
      if (([v49 isGroup] & 1) == 0)
      {
        id v50 = [v46 conversation];
        id v51 = [v50 receiverHandles];
        BOOL v52 = v51 == 0;

        if (v52) {
          continue;
        }
        uint64_t v49 = [v46 conversation];
        dispatch_semaphore_t v53 = [v49 receiverHandles];
        [v41 addObjectsFromArray:v53];
      }
    }
    uint64_t v43 = [v42 countByEnumeratingWithState:&v129 objects:v161 count:16];
  }
  while (v43);
LABEL_45:

  unint64_t v111 = [v39 count];
  if (v111 < 3)
  {
    uint64_t v117 = 0;
  }
  else
  {
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v116 = v41;
    uint64_t v54 = [v116 countByEnumeratingWithState:&v125 objects:v160 count:16];
    if (v54)
    {
      uint64_t v117 = 0;
      uint64_t v118 = *(void *)v126;
LABEL_48:
      uint64_t v55 = 0;
      while (1)
      {
        if (*(void *)v126 != v118) {
          objc_enumerationMutation(v116);
        }
        double v56 = *(void **)(*((void *)&v125 + 1) + 8 * v55);
        id v57 = (void *)MEMORY[0x1E016D870]();
        id v58 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          dispatch_time_t v59 = (objc_class *)objc_opt_class();
          NSStringFromClass(v59);
          id v60 = (id)objc_claimAutoreleasedReturnValue();
          id v61 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v60;
          __int16 v152 = 2112;
          uint64_t v153 = (uint64_t)v61;
          __int16 v154 = 2112;
          unint64_t v155 = (unint64_t)v56;
          _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, %@, handle, %@", buf, 0x20u);
        }
        id v62 = (id *)(v146 + 5);
        id v124 = (id)v146[5];
        BOOL v63 = [(SMSuggestionsManager *)v122 _checkReceiverEligibilityForHandle:v56 error:&v124];
        objc_storeStrong(v62, v124);
        dispatch_semaphore_t v65 = (id *)(v146 + 5);
        uint64_t v64 = v146[5];
        BOOL v66 = v64 == 0;
        if (v64) {
          BOOL v67 = 0;
        }
        else {
          BOOL v67 = v63;
        }
        if (v66) {
          int v68 = 9;
        }
        else {
          int v68 = 8;
        }
        if (v67)
        {
          id v123 = 0;
          BOOL v69 = [(SMSuggestionsManager *)v122 _didInteractInPastWithHandle:v56 timeInterval:&v123 error:604800.0];
          objc_storeStrong(v65, v123);
          id v70 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            double v71 = (objc_class *)objc_opt_class();
            NSStringFromClass(v71);
            id v72 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v73 = NSStringFromSelector(a2);
            double v74 = (void *)v73;
            *(_DWORD *)buf = 138413058;
            double v75 = @"NO";
            if (v69) {
              double v75 = @"YES";
            }
            *(void *)&uint8_t buf[4] = v72;
            __int16 v152 = 2112;
            uint64_t v153 = v73;
            __int16 v154 = 2112;
            unint64_t v155 = (unint64_t)v56;
            __int16 v156 = 2112;
            uint64_t v157 = (uint64_t)v75;
            _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_INFO, "%@, %@, handle, %@, interactedWithHandle, %@", buf, 0x2Au);
          }
          uint64_t v76 = v146[5];
          BOOL v66 = v76 == 0;
          BOOL v77 = v76 != 0;
          if (v66 && v69)
          {
            uint64_t v79 = +[SMSuggestionsHelper getSMContactInformationFromSMHandle:v56];

            int v68 = 8;
            uint64_t v117 = (void *)v79;
          }
          else
          {
            int v68 = 8 * v77;
          }
        }
        if (v68 != 9)
        {
          if (v68) {
            break;
          }
        }
        if (v54 == ++v55)
        {
          uint64_t v54 = [v116 countByEnumeratingWithState:&v125 objects:v160 count:16];
          if (v54) {
            goto LABEL_48;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v117 = 0;
    }
  }
  uint64_t v84 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    uint64_t v85 = (objc_class *)objc_opt_class();
    NSStringFromClass(v85);
    id v86 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v87 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v88 = [v41 count];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v86;
    __int16 v152 = 2112;
    uint64_t v153 = (uint64_t)v87;
    __int16 v154 = 2048;
    unint64_t v155 = v111;
    __int16 v156 = 2048;
    uint64_t v157 = v88;
    __int16 v158 = 2112;
    long long v159 = v117;
    _os_log_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_INFO, "%@, %@, uniqueSessionCount, %lu, handles.count, %lu, chosen contactInformation, %@", buf, 0x34u);
  }
  if (a4 && v146[5])
  {
    id v89 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      id v106 = (objc_class *)objc_opt_class();
      NSStringFromClass(v106);
      id v107 = (id)objc_claimAutoreleasedReturnValue();
      id v108 = NSStringFromSelector(a2);
      unint64_t v109 = v146[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v107;
      __int16 v152 = 2112;
      uint64_t v153 = (uint64_t)v108;
      __int16 v154 = 2112;
      unint64_t v155 = v109;
      _os_log_error_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v8 = 0;
    *a4 = (id) v146[5];
  }
  else
  {
    id v90 = objc_alloc(MEMORY[0x1E4F999B8]);
    uint64_t v91 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v114 duration:3600.0];
    BOOL v92 = (void *)[v90 initWithSuggestionTrigger:4 suggestionUserType:4 suppressionReason:1 sessionType:4 sourceLocation:0 destinationLocation:0 buddy:v117 dateInterval:v91 creationDate:v114 locationOfInterest:0];

    uint64_t v93 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      id v94 = (objc_class *)objc_opt_class();
      NSStringFromClass(v94);
      id v95 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v96 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v95;
      __int16 v152 = 2112;
      uint64_t v153 = (uint64_t)v96;
      __int16 v154 = 2112;
      unint64_t v155 = (unint64_t)v92;
      _os_log_impl(&dword_1D9BFA000, v93, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", buf, 0x20u);
    }
    id v8 = v92;
  }

LABEL_89:
  _Block_object_dispose(&v137, 8);

LABEL_90:
LABEL_91:
  _Block_object_dispose(&v145, 8);

LABEL_92:

  return v8;
}

void __87__SMSuggestionsManager__generatePersonalizedSuggestionForWorkoutUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_showSuggestionsDetectionUIWithSuggestion:(id)a3 error:(id *)a4
{
  v316[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (v7)
  {
    aSelector = a2;
    id v8 = [(SMSuggestionsManager *)self platform];
    if ([v8 iPhoneDevice])
    {

      goto LABEL_9;
    }
    id v11 = [(SMSuggestionsManager *)self platform];
    char v12 = [v11 watchPlatform];

    if (v12)
    {
LABEL_9:
      if ([(SMSuggestionsManager *)self _shouldShowProactiveSuggestions])
      {
        uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2112;
          v313 = v7;
          _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, trying to show suggestion detection UI, suggestion, %@", buf, 0x20u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v313 = __Block_byref_object_copy__102;
        v314 = __Block_byref_object_dispose__102;
        id v315 = 0;
        id v17 = [v7 buddy];
        id v18 = [v17 email];

        if (v18)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F99888]);
          double v20 = [v7 buddy];
          id v21 = [v20 email];
          uint64_t v22 = [v19 initWithPrimaryHandle:v21 secondaryHandles:MEMORY[0x1E4F1CBF0]];
        }
        else
        {
          double v27 = [v7 buddy];
          id v28 = [v27 phoneNumber];

          if (!v28) {
            goto LABEL_26;
          }
          id v29 = objc_alloc(MEMORY[0x1E4F99888]);
          double v20 = [v7 buddy];
          id v21 = [v20 phoneNumber];
          uint64_t v22 = [v29 initWithPrimaryHandle:v21 secondaryHandles:MEMORY[0x1E4F1CBF0]];
        }
        v269 = (void *)v22;

        if (v269)
        {
          uint64_t v30 = *(void *)&buf[8];
          id obj = *(id *)(*(void *)&buf[8] + 40);
          BOOL v10 = [(SMSuggestionsManager *)self _checkReceiverEligibilityForHandle:v269 error:&obj];
          objc_storeStrong((id *)(v30 + 40), obj);
          if (a4 && *(void *)(*(void *)&buf[8] + 40))
          {
            double v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              __int16 v200 = (objc_class *)objc_opt_class();
              NSStringFromClass(v200);
              id v201 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v202 = NSStringFromSelector(aSelector);
              id v203 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
              *(_DWORD *)v306 = 138412802;
              *(void *)&v306[4] = v201;
              *(_WORD *)&v306[12] = 2112;
              *(void *)&v306[14] = v202;
              *(_WORD *)&v306[22] = 2112;
              v307 = v203;
              _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v306, 0x20u);
            }
            id v32 = *(id *)(*(void *)&buf[8] + 40);
            goto LABEL_45;
          }
          if (!v10)
          {
            double v74 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v310 = *MEMORY[0x1E4F28568];
            double v75 = NSString;
            uint64_t v76 = (objc_class *)objc_opt_class();
            BOOL v77 = NSStringFromClass(v76);
            __int16 v78 = NSStringFromSelector(aSelector);
            uint64_t v79 = [v75 stringWithFormat:@"%@, %@, suggestion has buddy handle that is not an eligible receiver, %@", v77, v78, v269];
            v311 = v79;
            BOOL v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v311 forKeys:&v310 count:1];
            uint64_t v81 = [v74 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v80];
            id v82 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v81;

            if (!a4)
            {
              BOOL v10 = 0;
              goto LABEL_158;
            }
            id v32 = *(id *)(*(void *)&buf[8] + 40);
            BOOL v10 = 0;
LABEL_45:
            *a4 = v32;
LABEL_158:
            _Block_object_dispose(buf, 8);

            goto LABEL_159;
          }
          char v265 = 0;
          id v33 = v269;
LABEL_29:
          *(void *)v306 = 0;
          *(void *)&v306[8] = v306;
          *(void *)&v306[16] = 0x3032000000;
          v307 = __Block_byref_object_copy__102;
          v308 = __Block_byref_object_dispose__102;
          id v309 = 0;
          id v34 = [v7 locationOfInterest];
          v269 = v33;
          if (v34)
          {
          }
          else
          {
            uint64_t v54 = [v7 destinationLocation];
            BOOL v55 = v54 == 0;

            if (!v55)
            {
              dispatch_semaphore_t v56 = dispatch_semaphore_create(0);
              *(void *)v303 = 0;
              *(void *)&v303[8] = v303;
              *(void *)&v303[16] = 0x3032000000;
              v304 = __Block_byref_object_copy__102;
              *(void *)&long long v305 = __Block_byref_object_dispose__102;
              *((void *)&v305 + 1) = 0;
              id v57 = [(SMSuggestionsManager *)self learnedLocationManager];
              id v58 = [v7 destinationLocation];
              v284[0] = MEMORY[0x1E4F143A8];
              v284[1] = 3221225472;
              v284[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke;
              v284[3] = &unk_1E6B90B28;
              v286 = v306;
              v287 = v303;
              dispatch_time_t v59 = v56;
              v285 = v59;
              [v57 fetchLocationOfInterestAtLocation:v58 handler:v284];

              dsema = v59;
              id v60 = [MEMORY[0x1E4F1C9C8] now];
              dispatch_time_t v61 = dispatch_time(0, 3600000000000);
              if (dispatch_semaphore_wait(dsema, v61))
              {
                id v62 = [MEMORY[0x1E4F1C9C8] now];
                [v62 timeIntervalSinceDate:v60];
                double v64 = v63;
                dispatch_semaphore_t v65 = objc_opt_new();
                BOOL v66 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
                BOOL v67 = [MEMORY[0x1E4F29060] callStackSymbols];
                int v68 = [v67 filteredArrayUsingPredicate:v66];
                BOOL v69 = [v68 firstObject];

                [v65 submitToCoreAnalytics:v69 type:1 duration:v64];
                id v70 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)v299 = 0;
                  _os_log_fault_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v299, 2u);
                }

                double v71 = (void *)MEMORY[0x1E4F28C58];
                *(void *)v294 = *MEMORY[0x1E4F28568];
                *(void *)v299 = @"semaphore wait timeout";
                id v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v299 forKeys:v294 count:1];
                id v73 = [v71 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v72];

                if (v73)
                {
                  id v73 = v73;
                }
              }
              else
              {
                id v73 = 0;
              }

              uint64_t v88 = (uint64_t (*)(uint64_t, uint64_t))v73;
              id v89 = v88;
              if (a4 && v88)
              {
                id v90 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v218 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v218);
                  id v219 = (id)objc_claimAutoreleasedReturnValue();
                  v220 = NSStringFromSelector(aSelector);
                  *(_DWORD *)v299 = 138412802;
                  *(void *)&v299[4] = v219;
                  *(_WORD *)&v299[12] = 2112;
                  *(void *)&v299[14] = v220;
                  *(_WORD *)&v299[22] = 2112;
                  v300 = v89;
                  _os_log_error_impl(&dword_1D9BFA000, v90, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v299, 0x20u);
                }
                uint64_t v91 = v89;
              }
              else
              {
                if (!a4 || !*(void *)(*(void *)&v303[8] + 40))
                {

                  _Block_object_dispose(v303, 8);
                  goto LABEL_74;
                }
                BOOL v92 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                {
                  id v232 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v232);
                  id v233 = (id)objc_claimAutoreleasedReturnValue();
                  v234 = NSStringFromSelector(aSelector);
                  __int16 v235 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&v303[8] + 40);
                  *(_DWORD *)v299 = 138412802;
                  *(void *)&v299[4] = v233;
                  *(_WORD *)&v299[12] = 2112;
                  *(void *)&v299[14] = v234;
                  *(_WORD *)&v299[22] = 2112;
                  v300 = v235;
                  _os_log_error_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v299, 0x20u);
                }
                uint64_t v91 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&v303[8] + 40);
              }
              *a4 = v91;

              _Block_object_dispose(v303, 8);
              goto LABEL_72;
            }
          }
          id v35 = [v7 locationOfInterest];

          if (!v35)
          {
LABEL_75:
            uint64_t v93 = *(void **)(*(void *)&v306[8] + 40);
            if (!v93
              || ([v93 location],
                  id v94 = objc_claimAutoreleasedReturnValue(),
                  [v94 location],
                  id v95 = objc_claimAutoreleasedReturnValue(),
                  BOOL v96 = v95 == 0,
                  v95,
                  v94,
                  v96))
            {
              dsema = 0;
            }
            else
            {
              dispatch_semaphore_t dsemaa = (dispatch_semaphore_t)objc_alloc(MEMORY[0x1E4F5CE70]);
              dispatch_semaphore_t v262 = [*(id *)(*(void *)&v306[8] + 40) place];
              v259 = [v262 mapItem];
              int v97 = [*(id *)(*(void *)&v306[8] + 40) place];
              unint64_t v98 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLearnedPlaceType:", [v97 type]);
              id v99 = [*(id *)(*(void *)&v306[8] + 40) place];
              unint64_t v100 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:", [v99 typeSource]);
              unint64_t v101 = [*(id *)(*(void *)&v306[8] + 40) location];
              uint64_t v4 = [v101 location];
              uint64_t v102 = [*(id *)(*(void *)&v306[8] + 40) location];
              [v102 confidence];
              double v104 = v103;
              unint64_t v105 = [*(id *)(*(void *)&v306[8] + 40) identifier];
              dsema = [dsemaa initWithMapItem:v259 userType:v98 userTypeSource:v100 placeType:0 referenceLocation:v4 confidence:v105 loiIdentifier:v104];
            }
            id v106 = [v7 destinationLocation];

            if (!v106)
            {
              unint64_t v109 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v290 = *MEMORY[0x1E4F28568];
              uint64_t v110 = NSString;
              unint64_t v111 = [v7 destinationLocation];
              id v112 = [v110 stringWithFormat:@"suggestion has invalid destination information, %@", v111];
              v291 = v112;
              id v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v291 forKeys:&v290 count:1];
              uint64_t v114 = [v109 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v113];
              id v115 = *(void **)(*(void *)&buf[8] + 40);
              *(void *)(*(void *)&buf[8] + 40) = v114;

              if (a4)
              {
                id v116 = *(id *)(*(void *)&buf[8] + 40);
                dispatch_semaphore_t v117 = 0;
                BOOL v10 = 0;
                *a4 = v116;
              }
              else
              {
                dispatch_semaphore_t v117 = 0;
                BOOL v10 = 0;
              }
LABEL_156:

              goto LABEL_157;
            }
            id v107 = [*(id *)(*(void *)&v306[8] + 40) place];
            unint64_t v108 = [v107 type];

            if (v108 >= 5) {
              uint64_t v260 = 0;
            }
            else {
              uint64_t v260 = qword_1DA0FFC78[v108];
            }
            *(void *)v303 = 0;
            *(void *)&v303[8] = v303;
            *(void *)&v303[16] = 0x3032000000;
            v304 = __Block_byref_object_copy__102;
            *(void *)&long long v305 = __Block_byref_object_dispose__102;
            *((void *)&v305 + 1) = 0;
            uint64_t v118 = [*(id *)(*(void *)&v306[8] + 40) place];
            id v119 = [v118 mapItem];
            BOOL v120 = v119 == 0;

            if (!v120) {
              goto LABEL_86;
            }
            *(void *)v299 = 0;
            *(void *)&v299[8] = v299;
            *(void *)&v299[16] = 0x3032000000;
            v300 = __Block_byref_object_copy__102;
            v301 = __Block_byref_object_dispose__102;
            id v302 = 0;
            dispatch_semaphore_t v130 = dispatch_semaphore_create(0);
            id v131 = objc_alloc(MEMORY[0x1E4F5CE48]);
            long long v132 = (objc_class *)objc_opt_class();
            id v133 = NSStringFromClass(v132);
            v257 = (void *)[v131 initWithUseBackgroundTraits:1 analyticsIdentifier:v133 clientIdentifier:*MEMORY[0x1E4F99B90]];

            id v134 = [(SMSuggestionsManager *)self mapServiceManager];
            id v135 = [v7 destinationLocation];
            v276[0] = MEMORY[0x1E4F143A8];
            v276[1] = 3221225472;
            v276[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_179;
            v276[3] = &unk_1E6B905F0;
            v278 = v303;
            v279 = v299;
            id v136 = v130;
            v277 = v136;
            [v134 fetchMapItemsFromLocation:v135 options:v257 handler:v276];

            v263 = v136;
            uint64_t v137 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v138 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(v263, v138))
            {
              uint64_t v139 = [MEMORY[0x1E4F1C9C8] now];
              [v139 timeIntervalSinceDate:v137];
              double v141 = v140;
              id v142 = objc_opt_new();
              id v143 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
              id v144 = [MEMORY[0x1E4F29060] callStackSymbols];
              uint64_t v145 = [v144 filteredArrayUsingPredicate:v143];
              uint64_t v146 = [v145 firstObject];

              [v142 submitToCoreAnalytics:v146 type:1 duration:v141];
              uint64_t v147 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v294 = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v147, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v294, 2u);
              }

              v148 = (void *)MEMORY[0x1E4F28C58];
              v316[0] = *MEMORY[0x1E4F28568];
              *(void *)v294 = @"semaphore wait timeout";
              id v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v294 forKeys:v316 count:1];
              id v150 = [v148 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v149];

              if (v150)
              {
                id v150 = v150;
              }
            }
            else
            {
              id v150 = 0;
            }

            id v152 = v150;
            uint64_t v153 = v152;
            if (a4 && v152)
            {
              __int16 v154 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
              {
                uint64_t v229 = (objc_class *)objc_opt_class();
                NSStringFromClass(v229);
                id v230 = (id)objc_claimAutoreleasedReturnValue();
                v231 = NSStringFromSelector(aSelector);
                *(_DWORD *)v294 = 138412802;
                *(void *)&v294[4] = v230;
                __int16 v295 = 2112;
                id v296 = v231;
                __int16 v297 = 2112;
                v298 = v153;
                _os_log_error_impl(&dword_1D9BFA000, v154, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v294, 0x20u);
              }
              unint64_t v155 = v153;
            }
            else
            {
              if (*(void *)(*(void *)&v303[8] + 40) && !*(void *)(*(void *)&v299[8] + 40)) {
                goto LABEL_139;
              }
              uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v292 = *MEMORY[0x1E4F28568];
              __int16 v156 = NSString;
              uint64_t v157 = [v7 destinationLocation];
              __int16 v158 = [v156 stringWithFormat:@"Failed to reverse geocode for the location, %@, reverseGeocodedMapItem, %@, reverseGeocodeError, %@", v157, *(void *)(*(void *)&v303[8] + 40), *(void *)(*(void *)&v299[8] + 40)];
              v293 = v158;
              long long v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v293 forKeys:&v292 count:1];
              uint64_t v160 = [v4 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v159];
              v161 = *(void **)(*(void *)&buf[8] + 40);
              *(void *)(*(void *)&buf[8] + 40) = v160;

              v162 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
              {
                id v236 = (objc_class *)objc_opt_class();
                NSStringFromClass(v236);
                id v237 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                id v238 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v239 = *(void **)(*(void *)&buf[8] + 40);
                *(_DWORD *)v294 = 138412802;
                *(void *)&v294[4] = v237;
                __int16 v295 = 2112;
                id v296 = v238;
                __int16 v297 = 2112;
                v298 = v239;
                _os_log_error_impl(&dword_1D9BFA000, v162, OS_LOG_TYPE_ERROR, "%@, %@, error, %@", v294, 0x20u);
              }
              if (!a4 || !*(void *)(*(void *)&buf[8] + 40))
              {
LABEL_139:

                _Block_object_dispose(v299, 8);
LABEL_86:
                id v121 = objc_alloc(MEMORY[0x1E4F99928]);
                id v122 = [v7 destinationLocation];
                id v123 = [v7 destinationLocation];
                [v123 horizontalUncertainty];
                double v125 = v124;
                long long v126 = [*(id *)(*(void *)&v306[8] + 40) place];
                long long v127 = [v126 mapItem];
                if (v127)
                {
                  long long v128 = [*(id *)(*(void *)&v306[8] + 40) place];
                  uint64_t v4 = [v128 mapItem];
                  long long v129 = [v4 geoMapItemHandle];
                }
                else
                {
                  long long v129 = [*(id *)(*(void *)&v303[8] + 40) geoMapItemHandle];
                  long long v128 = v129;
                }
                dispatch_semaphore_t v264 = (dispatch_semaphore_t)[v121 initWithLocation:v122 eta:0 radius:v260 destinationType:v129 destinationMapItem:v125];
                if (v127)
                {
                }
                char v151 = 1;
                goto LABEL_114;
              }
              uint64_t v163 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
              {
                v248 = (objc_class *)objc_opt_class();
                NSStringFromClass(v248);
                id v249 = (id)objc_claimAutoreleasedReturnValue();
                v250 = NSStringFromSelector(aSelector);
                v251 = *(void **)(*(void *)&buf[8] + 40);
                *(_DWORD *)v294 = 138412802;
                *(void *)&v294[4] = v249;
                __int16 v295 = 2112;
                id v296 = v250;
                __int16 v297 = 2112;
                v298 = v251;
                _os_log_error_impl(&dword_1D9BFA000, v163, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v294, 0x20u);
              }
              unint64_t v155 = *(void **)(*(void *)&buf[8] + 40);
            }
            *a4 = v155;

            _Block_object_dispose(v299, 8);
            dispatch_semaphore_t v264 = 0;
            char v151 = 0;
LABEL_114:
            _Block_object_dispose(v303, 8);

            if (v151)
            {
              if (v265)
              {
                id v164 = 0;
              }
              else
              {
                id v165 = objc_alloc(MEMORY[0x1E4F99838]);
                v289 = v269;
                id v166 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v289 count:1];
                id v164 = (id)[v165 initWithReceiverHandles:v166 identifier:0 displayName:0];
              }
              id v167 = objc_alloc(MEMORY[0x1E4F99918]);
              id v168 = [MEMORY[0x1E4F29128] UUID];
              uint64_t v169 = [v7 dateInterval];
              id v170 = [v169 startDate];
              LOBYTE(v252) = [MEMORY[0x1E4F99880] zelkovaHandoffEnabled];
              v266 = (uint64_t (*)(uint64_t, uint64_t))[v167 initWithConversation:v164 sessionID:v168 sessionStartDate:v170 sessionType:2 time:0 destination:v264 userResponseSafeDate:0 sessionSupportsHandoff:v252 sosReceivers:v164 sessionWorkoutType:0];

              uint64_t v171 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
              {
                id v172 = (objc_class *)objc_opt_class();
                NSStringFromClass(v172);
                id v173 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                id v174 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v303 = 138412802;
                *(void *)&v303[4] = v173;
                *(_WORD *)&v303[12] = 2112;
                *(void *)&v303[14] = v174;
                *(_WORD *)&v303[22] = 2112;
                v304 = v266;
                _os_log_impl(&dword_1D9BFA000, v171, OS_LOG_TYPE_INFO, "%@, %@, config from suggestion, %@", v303, 0x20u);
              }
              uint64_t v175 = *(void *)&buf[8];
              id v275 = *(id *)(*(void *)&buf[8] + 40);
              v261 = [(SMSuggestionsManager *)self _getMessagesURLFromSessionConfig:v266 payloadType:2 error:&v275];
              objc_storeStrong((id *)(v175 + 40), v275);
              if (a4 && *(void *)(*(void *)&buf[8] + 40))
              {
                __int16 v176 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
                {
                  id v225 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v225);
                  id v226 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v227 = NSStringFromSelector(aSelector);
                  v228 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
                  *(_DWORD *)v303 = 138412802;
                  *(void *)&v303[4] = v226;
                  *(_WORD *)&v303[12] = 2112;
                  *(void *)&v303[14] = v227;
                  *(_WORD *)&v303[22] = 2112;
                  v304 = v228;
                  _os_log_error_impl(&dword_1D9BFA000, v176, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v303, 0x20u);
                }
                BOOL v10 = 0;
                *a4 = *(id *)(*(void *)&buf[8] + 40);
              }
              else
              {
                uint64_t v177 = [v266 conversation];
                __int16 v178 = [v177 receiverHandles];
                long long v179 = [v178 firstObject];
                __int16 v180 = (id *)(*(void *)&buf[8] + 40);
                id v274 = *(id *)(*(void *)&buf[8] + 40);
                v258 = [(SMSuggestionsManager *)self _getSuggestionTitleWithHandle:v179 error:&v274];
                objc_storeStrong(v180, v274);

                if (a4 && *(void *)(*(void *)&buf[8] + 40))
                {
                  id v181 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v240 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v240);
                    id v241 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v242 = NSStringFromSelector(aSelector);
                    __int16 v243 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
                    *(_DWORD *)v303 = 138412802;
                    *(void *)&v303[4] = v241;
                    *(_WORD *)&v303[12] = 2112;
                    *(void *)&v303[14] = v242;
                    *(_WORD *)&v303[22] = 2112;
                    v304 = v243;
                    _os_log_error_impl(&dword_1D9BFA000, v181, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v303, 0x20u);
                  }
                  BOOL v10 = 0;
                  *a4 = *(id *)(*(void *)&buf[8] + 40);
                }
                else
                {
                  v256 = [(SMSuggestionsManager *)self _getSuggestionBodyWithPlaceInference:dsema];
                  v255 = [(SMSuggestionsManager *)self _getSuggestionsFooter:v7];
                  if ([v7 suggestionUserType] == 1) {
                    uint64_t v182 = 2;
                  }
                  else {
                    uint64_t v182 = 1;
                  }
                  if (a4 && *(void *)(*(void *)&buf[8] + 40))
                  {
                    v183 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v244 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v244);
                      id v245 = (id)objc_claimAutoreleasedReturnValue();
                      v246 = NSStringFromSelector(aSelector);
                      v247 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
                      *(_DWORD *)v303 = 138412802;
                      *(void *)&v303[4] = v245;
                      *(_WORD *)&v303[12] = 2112;
                      *(void *)&v303[14] = v246;
                      *(_WORD *)&v303[22] = 2112;
                      v304 = v247;
                      _os_log_error_impl(&dword_1D9BFA000, v183, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v303, 0x20u);
                    }
                    BOOL v10 = 0;
                    *a4 = *(id *)(*(void *)&buf[8] + 40);
                  }
                  else
                  {
                    uint64_t v184 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
                    {
                      v185 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v185);
                      id v186 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(aSelector);
                      id v187 = (id)objc_claimAutoreleasedReturnValue();
                      id v188 = +[RTUserNotification interruptionLevelToString:v182];
                      *(_DWORD *)v303 = 138412802;
                      *(void *)&v303[4] = v186;
                      *(_WORD *)&v303[12] = 2112;
                      *(void *)&v303[14] = v187;
                      *(_WORD *)&v303[22] = 2112;
                      v304 = v188;
                      _os_log_impl(&dword_1D9BFA000, v184, OS_LOG_TYPE_INFO, "%@, %@, interruption level, %@", v303, 0x20u);
                    }
                    uint64_t v189 = *(void *)&buf[8];
                    id v273 = *(id *)(*(void *)&buf[8] + 40);
                    v254 = [(SMSuggestionsManager *)self _getNotificationExpirationDateForSuggestion:v7 error:&v273];
                    objc_storeStrong((id *)(v189 + 40), v273);
                    id v190 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
                    {
                      id v191 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v191);
                      id v192 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(aSelector);
                      id v193 = (id)objc_claimAutoreleasedReturnValue();
                      id v194 = [v254 stringFromDate];
                      uint64_t v195 = *(void *)(*(void *)&buf[8] + 40);
                      *(_DWORD *)v303 = 138413058;
                      *(void *)&v303[4] = v192;
                      *(_WORD *)&v303[12] = 2112;
                      *(void *)&v303[14] = v193;
                      *(_WORD *)&v303[22] = 2112;
                      v304 = v194;
                      LOWORD(v305) = 2112;
                      *(void *)((char *)&v305 + 2) = v195;
                      _os_log_impl(&dword_1D9BFA000, v190, OS_LOG_TYPE_INFO, "%@, %@, notificationExpirationDate, %@, error, %@", v303, 0x2Au);
                    }
                    v196 = *(void **)(*(void *)&buf[8] + 40);
                    *(void *)(*(void *)&buf[8] + 40) = 0;

                    unint64_t v197 = [(SMSuggestionsManager *)self defaultsManager];
                    id v198 = [v197 objectForKey:@"RTDefaultsSuggestionsManagerLastSuggestionNotificationUUID"];

                    if (v198)
                    {
                      id v199 = v198;
                    }
                    else
                    {
                      uint64_t v207 = [MEMORY[0x1E4F29128] UUID];
                      id v199 = [v207 UUIDString];
                    }
                    __int16 v208 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    if (os_log_type_enabled(v208, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v209 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v209);
                      id v210 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(aSelector);
                      id v211 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v303 = 138413058;
                      *(void *)&v303[4] = v210;
                      *(_WORD *)&v303[12] = 2112;
                      *(void *)&v303[14] = v211;
                      *(_WORD *)&v303[22] = 2112;
                      v304 = (uint64_t (*)(uint64_t, uint64_t))v198;
                      LOWORD(v305) = 2112;
                      *(void *)((char *)&v305 + 2) = v199;
                      _os_log_impl(&dword_1D9BFA000, v208, OS_LOG_TYPE_INFO, "%@, %@, notificationUUIDStringFromDefaults, %@, notificationUUIDString, %@", v303, 0x2Au);
                    }
                    long long v212 = [RTUserNotification alloc];
                    long long v213 = [(RTUserNotification *)v212 initWithBundleIdentifier:*MEMORY[0x1E4F99AA8] notificationUUIDString:v199];
                    long long v214 = [v261 absoluteString];
                    uint64_t v215 = *MEMORY[0x1E4F99B90];
                    v272[0] = MEMORY[0x1E4F143A8];
                    v272[1] = 3221225472;
                    v272[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_190;
                    v272[3] = &unk_1E6B94B08;
                    v272[4] = self;
                    v272[5] = buf;
                    v272[6] = aSelector;
                    LOWORD(v253) = 256;
                    -[RTUserNotification postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:](v213, "postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:", v258, 0, v256, v255, v214, v215, v182, 7, MEMORY[0x1E4F1CBF0], v253, v254, 0, v272);

                    uint64_t v216 = [(SMSuggestionsManager *)self defaultsManager];
                    [v216 setObject:v199 forKey:@"RTDefaultsSuggestionsManagerLastSuggestionNotificationUUID"];

                    if (a4) {
                      *a4 = *(id *)(*(void *)&buf[8] + 40);
                    }
                    BOOL v10 = *(void *)(*(void *)&buf[8] + 40) == 0;
                  }
                }
              }
            }
            else
            {
              BOOL v10 = 0;
            }
            dispatch_semaphore_t v117 = v264;
            goto LABEL_156;
          }
          dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
          *(void *)v303 = 0;
          *(void *)&v303[8] = v303;
          *(void *)&v303[16] = 0x3032000000;
          v304 = __Block_byref_object_copy__102;
          *(void *)&long long v305 = __Block_byref_object_dispose__102;
          *((void *)&v305 + 1) = 0;
          id v37 = [(SMSuggestionsManager *)self learnedLocationManager];
          uint64_t v4 = [v7 locationOfInterest];
          id v38 = [v4 identifier];
          v280[0] = MEMORY[0x1E4F143A8];
          v280[1] = 3221225472;
          v280[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_175;
          v280[3] = &unk_1E6B90B28;
          v282 = v306;
          v283 = v303;
          id v39 = v36;
          v281 = v39;
          [v37 fetchLocationOfInterestWithIdentifier:v38 handler:v280];

          dsema = v39;
          id v40 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v41 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(dsema, v41))
          {
            id v42 = [MEMORY[0x1E4F1C9C8] now];
            [v42 timeIntervalSinceDate:v40];
            double v44 = v43;
            float v45 = objc_opt_new();
            float v46 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
            float v47 = [MEMORY[0x1E4F29060] callStackSymbols];
            double v48 = [v47 filteredArrayUsingPredicate:v46];
            uint64_t v49 = [v48 firstObject];

            [v45 submitToCoreAnalytics:v49 type:1 duration:v44];
            id v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v299 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v299, 2u);
            }

            id v51 = (void *)MEMORY[0x1E4F28C58];
            *(void *)v294 = *MEMORY[0x1E4F28568];
            *(void *)v299 = @"semaphore wait timeout";
            BOOL v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v299 forKeys:v294 count:1];
            id v53 = [v51 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v52];

            if (v53)
            {
              id v53 = v53;
            }
          }
          else
          {
            id v53 = 0;
          }

          unint64_t v83 = (uint64_t (*)(uint64_t, uint64_t))v53;
          uint64_t v84 = v83;
          if (a4 && v83)
          {
            uint64_t v85 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              __int16 v204 = (objc_class *)objc_opt_class();
              NSStringFromClass(v204);
              id v205 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v206 = NSStringFromSelector(aSelector);
              *(_DWORD *)v299 = 138412802;
              *(void *)&v299[4] = v205;
              *(_WORD *)&v299[12] = 2112;
              *(void *)&v299[14] = v206;
              *(_WORD *)&v299[22] = 2112;
              v300 = v84;
              _os_log_error_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v299, 0x20u);
            }
            id v86 = v84;
LABEL_57:
            *a4 = v86;

            _Block_object_dispose(v303, 8);
LABEL_72:
            BOOL v10 = 0;
LABEL_157:

            _Block_object_dispose(v306, 8);
            goto LABEL_158;
          }
          if (a4 && *(void *)(*(void *)&v303[8] + 40))
          {
            id v87 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              id v221 = (objc_class *)objc_opt_class();
              NSStringFromClass(v221);
              id v222 = (id)objc_claimAutoreleasedReturnValue();
              id v223 = NSStringFromSelector(aSelector);
              id v224 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&v303[8] + 40);
              *(_DWORD *)v299 = 138412802;
              *(void *)&v299[4] = v222;
              *(_WORD *)&v299[12] = 2112;
              *(void *)&v299[14] = v223;
              *(_WORD *)&v299[22] = 2112;
              v300 = v224;
              _os_log_error_impl(&dword_1D9BFA000, v87, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v299, 0x20u);
            }
            id v86 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&v303[8] + 40);
            goto LABEL_57;
          }

          _Block_object_dispose(v303, 8);
LABEL_74:

          goto LABEL_75;
        }
LABEL_26:
        id v33 = 0;
        char v265 = 1;
        goto LABEL_29;
      }
      goto LABEL_17;
    }
    id v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      double v26 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, %@, suggestion UI skipped, reason, neither iPhone nor watch platform", buf, 0x16u);
    }
LABEL_17:
    BOOL v10 = 0;
    goto LABEL_159;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
  }

  if (!a4) {
    goto LABEL_17;
  }
  _RTErrorInvalidParameterCreate(@"suggestion");
  BOOL v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_159:

  return v10;
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_190(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Failed to post suggestion notifications: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      BOOL v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, successfully posted notification", buf, 0x16u);
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v12 + 40);
    id v5 = [v11 _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionDisplayedCount" error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:-[v5 unsignedIntegerValue] + 1];
    id v14 = [*(id *)(a1 + 32) defaultsManager];
    [v14 setObject:v13 forKey:@"RTDefaultsSuggestionDisplayedCount"];
  }
}

- (id)_getNotificationExpirationDateForSuggestion:(id)a3 error:(id *)a4
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v76 = 0;
  dispatch_time_t v61 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionNotificationExpirationTimeInterval" error:&v76];
  id v7 = v76;
  id v60 = v7;
  if (!v61 || v7)
  {
    double v10 = 600.0;
    id v57 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:600.0];
    if (!v6)
    {
      id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
      }

      if (a4)
      {
        _RTErrorInvalidParameterCreate(@"suggestion");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v9 = v57;
      goto LABEL_35;
    }
    BOOL v55 = a4;
    uint64_t v72 = 0;
    id v73 = (double *)&v72;
    uint64_t v74 = 0x2020000000;
    uint64_t v75 = 0;
    uint64_t v66 = 0;
    BOOL v67 = &v66;
    uint64_t v68 = 0x3032000000;
    BOOL v69 = __Block_byref_object_copy__102;
    id v70 = __Block_byref_object_dispose__102;
    id v71 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    dispatch_queue_t v56 = dispatch_queue_create("SMSuggestionsManager-ETA-Queue", 0);
    id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    uint64_t v13 = [v6 destinationLocation];
    id v14 = (void *)[v12 initWithRTLocation:v13];
    id v15 = [(SMSuggestionsManager *)self locationManager];
    id v16 = [(SMSuggestionsManager *)self defaultsManager];
    id v17 = [(SMSuggestionsManager *)self distanceCalculator];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __74__SMSuggestionsManager__getNotificationExpirationDateForSuggestion_error___block_invoke;
    v62[3] = &unk_1E6B99538;
    double v64 = &v72;
    dispatch_semaphore_t v65 = &v66;
    __int16 v18 = v11;
    double v63 = v18;
    +[SMTriggerDestination estimateEtaToDestination:v14 transportType:1 locationManager:v15 defaultsManager:v16 distanceCalculator:v17 queue:v56 handler:v62];

    dsema = v18;
    id v19 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v20 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v20))
    {
      id v21 = [MEMORY[0x1E4F1C9C8] now];
      [v21 timeIntervalSinceDate:v19];
      double v23 = v22;
      dispatch_time_t v24 = objc_opt_new();
      id v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
      double v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v27 = [v26 filteredArrayUsingPredicate:v25];
      id v28 = [v27 firstObject];

      [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
      id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
      }

      uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
      v92[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      double v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v92 count:1];
      id v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v31];

      if (v32)
      {
        id v32 = v32;
      }
    }
    else
    {
      id v32 = 0;
    }

    id v34 = v32;
    id v35 = v34;
    if (v55 && v34)
    {
      dispatch_semaphore_t v36 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        double v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        id v50 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v49;
        __int16 v78 = 2112;
        id v79 = v50;
        __int16 v80 = 2112;
        uint64_t v81 = v35;
        _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v37 = v35;
    }
    else
    {
      if (!v55 || !v67[5])
      {
        double v40 = fmin(v73[3] * 0.25, 7200.0);
        if (v40 >= 600.0) {
          double v10 = v40;
        }
        id v39 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v10];

        dispatch_time_t v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          id v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          id v43 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v44 = (id)objc_claimAutoreleasedReturnValue();
          float v45 = (void *)*((void *)v73 + 3);
          float v46 = [v39 stringFromDate];
          *(_DWORD *)buf = 138414082;
          *(void *)&uint8_t buf[4] = v43;
          __int16 v78 = 2112;
          id v79 = v44;
          __int16 v80 = 2048;
          uint64_t v81 = v45;
          __int16 v82 = 2048;
          uint64_t v83 = 0x3FD0000000000000;
          __int16 v84 = 2048;
          uint64_t v85 = 0x4082C00000000000;
          __int16 v86 = 2048;
          uint64_t v87 = 0x40AC200000000000;
          __int16 v88 = 2048;
          double v89 = v10;
          __int16 v90 = 2112;
          uint64_t v91 = v46;
          _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%@, %@, eta to destination, %.3f, kSMSuggestionNotificationETAFactor, %.3f, kSMSuggestionNotificationExpirationTimeInterval, %.3f, kSMSuggestionTimeIntervalBuffer, %.3f, notificationExpirationTimeInterval, %.3f, notificationExpirationDate, %@", buf, 0x52u);
        }
        goto LABEL_34;
      }
      id v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        id v53 = NSStringFromSelector(a2);
        uint64_t v54 = (void *)v67[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v52;
        __int16 v78 = 2112;
        id v79 = v53;
        __int16 v80 = 2112;
        uint64_t v81 = v54;
        _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v37 = (id) v67[5];
    }
    *BOOL v55 = v37;
    id v39 = v57;
LABEL_34:
    id v9 = v39;

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v72, 8);
LABEL_35:

    goto LABEL_36;
  }
  if (a4) {
    *a4 = 0;
  }
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v61 doubleValue];
  [v8 dateWithTimeIntervalSinceNow:];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v9;
}

void __74__SMSuggestionsManager__getNotificationExpirationDateForSuggestion_error___block_invoke(uint64_t a1, int a2, int a3, id obj, double a5)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v7 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)_suppressSuggestion:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v309 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v257 = a4;
  if (!v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"suggestion");
      unint64_t v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v11 = 0;
    }
    goto LABEL_88;
  }
  if (![(SMSuggestionsManager *)self _shouldShowProactiveSuggestions])
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, user disabled proactive suggestions", buf, 0x16u);
    }
    unint64_t v11 = 7;
    goto LABEL_88;
  }
  if (!-[SMSuggestionsManager suggestionEnabledForUserType:](self, "suggestionEnabledForUserType:", [v8 suggestionUserType]))
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      dispatch_time_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2050;
      __int16 v295 = (uint64_t (*)(uint64_t, uint64_t))[v8 suggestionUserType];
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%{public}@, %{public}@, suggestionUserType, %{public}lu, suggestion disabled", buf, 0x20u);
    }
    unint64_t v11 = 13;
    goto LABEL_88;
  }
  uint64_t v282 = 0;
  v283 = (id *)&v282;
  uint64_t v284 = 0x3032000000;
  v285 = __Block_byref_object_copy__102;
  v286 = __Block_byref_object_dispose__102;
  id v287 = 0;
  id obj = 0;
  v255 = [(SMSuggestionsManager *)self _getCurrentDateFromContext:v257 error:&obj];
  objc_storeStrong(&v287, obj);
  if (a5 && v283[5])
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v103 = (objc_class *)objc_opt_class();
      NSStringFromClass(v103);
      id v104 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v105 = NSStringFromSelector(a2);
      id v106 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v104;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v105;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = v106;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v10 = v283[5];
LABEL_9:
    unint64_t v11 = 0;
    *a5 = v10;
    goto LABEL_87;
  }
  id v21 = [(SMSuggestionsManager *)self platform];
  int v22 = [v21 watchPlatform];

  if (v22
    && [v8 suggestionUserType] != 4
    && [(SMSuggestionsManager *)self _isEffectivePairedDeviceNearby])
  {
    double v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      double v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, %@, watch has a nearby paired phone; suggestions on the watch should be supressed",
        buf,
        0x16u);
    }
    unint64_t v11 = 11;
    goto LABEL_87;
  }
  double v27 = [v8 buddy];

  if (!v27) {
    goto LABEL_57;
  }
  id v28 = [v8 buddy];
  id v29 = [v28 email];
  uint64_t v30 = [v8 buddy];
  if (v29) {
    [v30 email];
  }
  else {
  id v249 = [v30 phoneNumber];
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v295 = __Block_byref_object_copy__102;
  *(void *)id v296 = __Block_byref_object_dispose__102;
  *(void *)&v296[8] = 0;
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  id v32 = [(SMSuggestionsManager *)self contactsManager];
  v277[0] = MEMORY[0x1E4F143A8];
  v277[1] = 3221225472;
  v277[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke;
  v277[3] = &unk_1E6B905F0;
  v279 = buf;
  v280 = &v282;
  id v33 = v31;
  v278 = v33;
  [v32 fetchContactsFromEmailOrPhoneNumberString:v249 handler:v277];

  dsema = v33;
  id v34 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v35 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v35)) {
    goto LABEL_36;
  }
  dispatch_semaphore_t v36 = [MEMORY[0x1E4F1C9C8] now];
  [v36 timeIntervalSinceDate:v34];
  double v38 = v37;
  id v39 = objc_opt_new();
  double v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  dispatch_time_t v41 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v42 = [v41 filteredArrayUsingPredicate:v40];
  id v43 = [v42 firstObject];

  [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
  id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v303 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v303, 2u);
  }

  float v45 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v288 = *MEMORY[0x1E4F28568];
  *(void *)v303 = @"semaphore wait timeout";
  float v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v303 forKeys:&v288 count:1];
  float v47 = [v45 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v46];

  if (v47)
  {
    id v48 = v47;
  }
  else
  {
LABEL_36:
    id v48 = 0;
  }

  id v49 = (uint64_t (*)(uint64_t, uint64_t))v48;
  if (v49) {
    BOOL v50 = a5 != 0;
  }
  else {
    BOOL v50 = 0;
  }
  if (v50)
  {
    id v51 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v107 = (objc_class *)objc_opt_class();
      NSStringFromClass(v107);
      id v108 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v109 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v303 = 138412802;
      *(void *)&v303[4] = v108;
      *(_WORD *)&v303[12] = 2112;
      *(void *)&v303[14] = v109;
      *(_WORD *)&v303[22] = 2112;
      v304 = v49;
      _os_log_error_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v303, 0x20u);
    }
    id v52 = v49;
LABEL_55:
    unint64_t v11 = 0;
    *a5 = v52;
    BOOL v56 = 1;
    goto LABEL_56;
  }
  if (a5 && v283[5])
  {
    id v53 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      id v134 = (objc_class *)objc_opt_class();
      NSStringFromClass(v134);
      id v135 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v136 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v137 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
      *(_DWORD *)v303 = 138412802;
      *(void *)&v303[4] = v135;
      *(_WORD *)&v303[12] = 2112;
      *(void *)&v303[14] = v136;
      *(_WORD *)&v303[22] = 2112;
      v304 = v137;
      _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v303, 0x20u);
    }
    id v52 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
    goto LABEL_55;
  }
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v54 = [v8 buddy];
    BOOL v55 = v283 + 5;
    id v276 = v283[5];
    BOOL v56 = +[SMSuggestionsHelper isContactBlocked:v54 error:&v276];
    objc_storeStrong(v55, v276);

    if (a5 && v283[5])
    {
      id v57 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        id v187 = (objc_class *)objc_opt_class();
        NSStringFromClass(v187);
        id v188 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v189 = (id)objc_claimAutoreleasedReturnValue();
        id v190 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
        *(_DWORD *)v303 = 138412802;
        *(void *)&v303[4] = v188;
        *(_WORD *)&v303[12] = 2112;
        *(void *)&v303[14] = v189;
        *(_WORD *)&v303[22] = 2112;
        v304 = v190;
        _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v303, 0x20u);
      }
      id v52 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
      goto LABEL_55;
    }
    if (v56) {
      unint64_t v11 = 10;
    }
    else {
      unint64_t v11 = 0;
    }
  }
  else
  {
    BOOL v56 = 1;
    unint64_t v11 = 9;
  }
LABEL_56:

  _Block_object_dispose(buf, 8);
  if (v56) {
    goto LABEL_87;
  }
LABEL_57:
  if ([v8 suggestionTrigger] != 4)
  {
    id v76 = [(SMSuggestionsManager *)self distanceCalculator];
    BOOL v77 = [v8 sourceLocation];
    __int16 v78 = [v8 destinationLocation];
    id v79 = v283 + 5;
    id v275 = v283[5];
    [v76 distanceFromLocation:v77 toLocation:v78 error:&v275];
    double v81 = v80;
    objc_storeStrong(v79, v275);

    if (a5 && v283[5])
    {
      __int16 v82 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        id v164 = (objc_class *)objc_opt_class();
        NSStringFromClass(v164);
        id v165 = (id)objc_claimAutoreleasedReturnValue();
        id v166 = NSStringFromSelector(a2);
        id v167 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v165;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v166;
        *(_WORD *)&buf[22] = 2112;
        __int16 v295 = v167;
        _os_log_error_impl(&dword_1D9BFA000, v82, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v10 = v283[5];
      goto LABEL_9;
    }
    uint64_t v87 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      __int16 v88 = (objc_class *)objc_opt_class();
      NSStringFromClass(v88);
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v90 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v89;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v90;
      *(_WORD *)&buf[22] = 2048;
      __int16 v295 = *(uint64_t (**)(uint64_t, uint64_t))&v81;
      _os_log_impl(&dword_1D9BFA000, v87, OS_LOG_TYPE_INFO, "%@, %@, distance between source and destination locations, %.5f", buf, 0x20u);
    }
    if (v81 == 1.79769313e308)
    {
      unint64_t v11 = 0;
      goto LABEL_87;
    }
    if (v81 < 1000.0)
    {
      unint64_t v11 = 8;
      goto LABEL_87;
    }
  }
  v250 = [MEMORY[0x1E4F999C0] getEnumerationOptionsForLatestSuggestionSortedByCreationDateIncludeSuppressed:0 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];
  *(void *)v303 = 0;
  *(void *)&v303[8] = v303;
  *(void *)&v303[16] = 0x3032000000;
  v304 = __Block_byref_object_copy__102;
  long long v305 = __Block_byref_object_dispose__102;
  id v306 = 0;
  dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
  dispatch_time_t v59 = [(SMSuggestionsManager *)self suggestionsStore];
  v271[0] = MEMORY[0x1E4F143A8];
  v271[1] = 3221225472;
  v271[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_201;
  v271[3] = &unk_1E6B905F0;
  id v273 = v303;
  id v274 = &v282;
  id v60 = v58;
  v272 = v60;
  [v59 fetchSuggestionsWithOptions:v250 handler:v271];

  dispatch_semaphore_t dsemaa = v60;
  dispatch_time_t v61 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v62 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsemaa, v62)) {
    goto LABEL_68;
  }
  double v63 = [MEMORY[0x1E4F1C9C8] now];
  [v63 timeIntervalSinceDate:v61];
  double v65 = v64;
  uint64_t v66 = objc_opt_new();
  BOOL v67 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  uint64_t v68 = [MEMORY[0x1E4F29060] callStackSymbols];
  BOOL v69 = [v68 filteredArrayUsingPredicate:v67];
  id v70 = [v69 firstObject];

  [v66 submitToCoreAnalytics:v70 type:1 duration:v65];
  id v71 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  uint64_t v72 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v288 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v288 count:1];
  uint64_t v74 = [v72 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v73];

  if (v74)
  {
    id v75 = v74;
  }
  else
  {
LABEL_68:
    id v75 = 0;
  }

  uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t))v75;
  if (v83) {
    BOOL v84 = a5 != 0;
  }
  else {
    BOOL v84 = 0;
  }
  if (v84)
  {
    uint64_t v85 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      id v131 = (objc_class *)objc_opt_class();
      NSStringFromClass(v131);
      id v132 = (id)objc_claimAutoreleasedReturnValue();
      id v133 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v132;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v133;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = v83;
      _os_log_error_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    __int16 v86 = v83;
    uint64_t v83 = v86;
LABEL_85:
    unint64_t v11 = 0;
    *a5 = v86;
    goto LABEL_86;
  }
  if (a5 && v283[5])
  {
    uint64_t v91 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v183 = (objc_class *)objc_opt_class();
      NSStringFromClass(v183);
      id v184 = (id)objc_claimAutoreleasedReturnValue();
      v185 = NSStringFromSelector(a2);
      id v186 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v184;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v185;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = v186;
      _os_log_error_impl(&dword_1D9BFA000, v91, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    __int16 v86 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
    goto LABEL_85;
  }
  uint64_t v93 = [v8 creationDate];
  [v93 timeIntervalSinceDate:*(void *)(*(void *)&v303[8] + 40)];
  double v95 = v94;

  BOOL v96 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  unint64_t v97 = (unint64_t)v95;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    unint64_t v98 = (objc_class *)objc_opt_class();
    NSStringFromClass(v98);
    id v99 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v100 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v101 = [v8 suggestionUserType];
    id v102 = [*(id *)(*(void *)&v303[8] + 40) stringFromDate];
    *(_DWORD *)buf = 138414082;
    *(void *)&uint8_t buf[4] = v99;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v100;
    *(_WORD *)&buf[22] = 2048;
    __int16 v295 = (uint64_t (*)(uint64_t, uint64_t))v101;
    *(_WORD *)id v296 = 2112;
    *(void *)&v296[2] = v102;
    *(_WORD *)&v296[10] = 2048;
    *(void *)&v296[12] = (unint64_t)v95;
    __int16 v297 = 2048;
    uint64_t v298 = 0x40AC200000000000;
    __int16 v299 = 2048;
    uint64_t v300 = 0x4105180000000000;
    __int16 v301 = 2048;
    uint64_t v302 = 0x4122750000000000;
    _os_log_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_INFO, "%@, %@, suggestionUserType, %lu, last suggestion date, %@, hours since last suggestion shown, %lu, kSMSuggestionMinimimTimeIntervalSinceLastSuggestion, %.3f, kSMSuggestionOccasionalUserMinimimTimeIntervalSinceLastSuggestion, %.3f, kSMSuggestionFirstTimeUserSuppressionMinimumGap, %.3f", buf, 0x52u);
  }
  if (*(void *)(*(void *)&v303[8] + 40))
  {
    switch([v8 suggestionUserType])
    {
      case 0:
      case 1:
      case 4:
        if (v97 >= 0xE10) {
          goto LABEL_105;
        }
        goto LABEL_104;
      case 2:
        if (v97 >> 8 >= 0x2A3) {
          goto LABEL_105;
        }
LABEL_104:
        unint64_t v11 = 3;
        break;
      case 3:
        if (v97 >= 0x93A80) {
          goto LABEL_105;
        }
        unint64_t v11 = 5;
        break;
      default:
        goto LABEL_105;
    }
    goto LABEL_86;
  }
LABEL_105:
  uint64_t v110 = v283 + 5;
  id v270 = v283[5];
  BOOL v111 = [(SMSuggestionsManager *)self _isUserInActiveSessionWithError:&v270];
  objc_storeStrong(v110, v270);
  id v112 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    id v113 = (objc_class *)objc_opt_class();
    NSStringFromClass(v113);
    id v114 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v115 = (id)objc_claimAutoreleasedReturnValue();
    id v116 = v115;
    dispatch_semaphore_t v117 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v114;
    *(_WORD *)&unsigned char buf[12] = 2112;
    if (v111) {
      dispatch_semaphore_t v117 = @"YES";
    }
    *(void *)&buf[14] = v115;
    *(_WORD *)&buf[22] = 2112;
    __int16 v295 = (uint64_t (*)(uint64_t, uint64_t))v117;
    _os_log_impl(&dword_1D9BFA000, v112, OS_LOG_TYPE_INFO, "%@, %@, isUserInActiveSession, %@", buf, 0x20u);
  }
  if (v111)
  {
    unint64_t v11 = 2;
    goto LABEL_86;
  }
  uint64_t v118 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
  {
    id v119 = (objc_class *)objc_opt_class();
    NSStringFromClass(v119);
    id v120 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v121 = (id)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1E4F999B8] stringFromSMSuggestionUserType:[v8 suggestionUserType]];
    id v122 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v120;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v121;
    *(_WORD *)&buf[22] = 2112;
    __int16 v295 = v122;
    _os_log_impl(&dword_1D9BFA000, v118, OS_LOG_TYPE_INFO, "%@, %@, suggestion user type, %@,", buf, 0x20u);
  }
  if ([v8 suggestionTrigger] == 4)
  {
    id v123 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
    {
      double v124 = (objc_class *)objc_opt_class();
      NSStringFromClass(v124);
      id v125 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v126 = (id)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:[v8 suggestionTrigger]];
      long long v127 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v125;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v126;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = v127;
      _os_log_impl(&dword_1D9BFA000, v123, OS_LOG_TYPE_INFO, "%@, %@, suggestion.suggestionTrigger, %@, suprressed for notification output", buf, 0x20u);
    }
    unint64_t v11 = 12;
    goto LABEL_86;
  }
  if ([v8 suggestionUserType] != 1 && objc_msgSend(v8, "suggestionUserType") != 2)
  {
    if ([v8 suggestionUserType] == 3)
    {
      id v168 = v283 + 5;
      id v258 = v283[5];
      uint64_t v169 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionDisplayedCount" error:&v258];
      objc_storeStrong(v168, v258);
      id v170 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
      {
        uint64_t v171 = (objc_class *)objc_opt_class();
        NSStringFromClass(v171);
        id v172 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v173 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v174 = [v169 unsignedIntegerValue];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v172;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v173;
        *(_WORD *)&buf[22] = 2048;
        __int16 v295 = (uint64_t (*)(uint64_t, uint64_t))v174;
        _os_log_impl(&dword_1D9BFA000, v170, OS_LOG_TYPE_INFO, "%@, %@, fetched displayed suggestion count, %lu", buf, 0x20u);
      }
      if ((unint64_t)[v169 unsignedIntegerValue] <= 2) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = 6;
      }
    }
    else
    {
      unint64_t v11 = 0;
    }
    goto LABEL_86;
  }
  uint64_t v128 = [v8 suggestionUserType];
  long long v129 = v283 + 5;
  if (v128 == 1)
  {
    id v269 = v283[5];
    dispatch_semaphore_t v130 = &v269;
    v248 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionRegularUserSuppressionSessionConfigurationCount" error:&v269];
  }
  else
  {
    id v268 = v283[5];
    dispatch_semaphore_t v130 = &v268;
    v248 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionOccasionalUserSuppressionSessionConfigurationCount" error:&v268];
  }
  objc_storeStrong(v129, *v130);
  id v138 = objc_alloc(MEMORY[0x1E4F999C0]);
  unsigned int v139 = [v248 unsignedIntValue];
  id v140 = objc_alloc(MEMORY[0x1E4F28C18]);
  double v141 = [v255 dateByAddingTimeInterval:-604800.0];
  id v142 = (void *)[v140 initWithStartDate:v141 duration:604800.0];
  uint64_t v240 = *MEMORY[0x1E4F99C18];
  uint64_t v242 = [v138 initWithBatchSize:*MEMORY[0x1E4F99C18] fetchLimit:v139 offset:*MEMORY[0x1E4F99C18] includeSuppressed:0 sortByCreationDate:1 ascending:0 dateInterval:v142 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];

  id v143 = *(void **)(*(void *)&v303[8] + 40);
  *(void *)(*(void *)&v303[8] + 40) = 0;

  uint64_t v288 = 0;
  v289 = &v288;
  uint64_t v290 = 0x3032000000;
  v291 = __Block_byref_object_copy__102;
  uint64_t v292 = __Block_byref_object_dispose__102;
  id v293 = 0;
  dispatch_semaphore_t v144 = dispatch_semaphore_create(0);

  uint64_t v145 = [(SMSuggestionsManager *)self suggestionsStore];
  v264[0] = MEMORY[0x1E4F143A8];
  v264[1] = 3221225472;
  v264[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_208;
  v264[3] = &unk_1E6B905F0;
  v266 = &v288;
  v267 = &v282;
  uint64_t v146 = v144;
  char v265 = v146;
  [v145 fetchSuggestionsWithOptions:v242 handler:v264];

  dispatch_semaphore_t dsemaa = v146;
  v251 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v147 = dispatch_time(0, 3600000000000);
  v148 = v83;
  if (dispatch_semaphore_wait(dsemaa, v147))
  {
    v246 = [MEMORY[0x1E4F1C9C8] now];
    [v246 timeIntervalSinceDate:v251];
    double v150 = v149;
    char v151 = objc_opt_new();
    id v152 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    uint64_t v153 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v154 = [v153 filteredArrayUsingPredicate:v152];
    unint64_t v155 = [v154 firstObject];

    [v151 submitToCoreAnalytics:v155 type:1 duration:v150];
    __int16 v156 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v156, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    uint64_t v157 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v308 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    __int16 v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v308 count:1];
    long long v159 = [v157 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v158];

    v148 = v83;
    if (v159)
    {
      v148 = v159;
    }
  }

  uint64_t v244 = v148;
  if (v244) {
    BOOL v160 = a5 != 0;
  }
  else {
    BOOL v160 = 0;
  }
  if (v160)
  {
    v161 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
    {
      id v225 = (objc_class *)objc_opt_class();
      NSStringFromClass(v225);
      id v226 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v227 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v226;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v227;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = v244;
      _os_log_error_impl(&dword_1D9BFA000, v161, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    v162 = v244;
    goto LABEL_174;
  }
  if (a5 && v283[5])
  {
    uint64_t v163 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
    {
      v228 = (objc_class *)objc_opt_class();
      NSStringFromClass(v228);
      id v229 = (id)objc_claimAutoreleasedReturnValue();
      id v230 = NSStringFromSelector(a2);
      v231 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v229;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v230;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = v231;
      _os_log_error_impl(&dword_1D9BFA000, v163, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    v162 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
    goto LABEL_174;
  }
  uint64_t v175 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
  {
    __int16 v176 = (objc_class *)objc_opt_class();
    NSStringFromClass(v176);
    id v177 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v178 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v179 = [(id)v289[5] count];
    [MEMORY[0x1E4F999B8] stringFromSMSuggestionUserType:[v8 suggestionUserType]];
    id v180 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v181 = [v248 unsignedIntValue];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v177;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v178;
    *(_WORD *)&buf[22] = 2048;
    __int16 v295 = (uint64_t (*)(uint64_t, uint64_t))v179;
    *(_WORD *)id v296 = 2112;
    *(void *)&v296[2] = v180;
    *(_WORD *)&v296[10] = 2048;
    *(void *)&v296[12] = v181;
    _os_log_impl(&dword_1D9BFA000, v175, OS_LOG_TYPE_INFO, "%@, %@, previous suggestion count, %lu, suggestion user type, %@, suggestionUserSuppressionSessionConfigurationCount, %lu", buf, 0x34u);
  }
  unint64_t v182 = [(id)v289[5] count];
  if (v182 < [v248 unsignedIntValue])
  {
    unint64_t v11 = 1;
    goto LABEL_175;
  }
  unint64_t v191 = 0;
  uint64_t v238 = *MEMORY[0x1E4F5CFE8];
  uint64_t v239 = *MEMORY[0x1E4F28568];
  BOOL v237 = 1;
  do
  {
    if (v191 >= [v248 unsignedIntValue]) {
      break;
    }
    unint64_t v252 = v191;
    if ([(id)v289[5] count] <= v191) {
      break;
    }
    context = (void *)MEMORY[0x1E016D870]();
    dispatch_semaphore_t v192 = dispatch_semaphore_create(0);
    id v193 = objc_alloc(MEMORY[0x1E4F99920]);
    id v194 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v195 = [(id)v289[5] objectAtIndexedSubscript:v252];
    v196 = [v195 creationDate];
    unint64_t v197 = (void *)[v194 initWithStartDate:v196 duration:7200.0];
    LOBYTE(v236) = 0;
    v247 = (void *)[v193 initWithBatchSize:v240 fetchLimit:1 sortBySessionStartDate:1 ascending:1 sessionTypes:&unk_1F34531B0 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v236 dateInterval:v197 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v295 = __Block_byref_object_copy__102;
    *(void *)id v296 = __Block_byref_object_dispose__102;
    *(void *)&v296[8] = 0;
    id v198 = [(SMSuggestionsManager *)self sessionStore];
    v260[0] = MEMORY[0x1E4F143A8];
    v260[1] = 3221225472;
    v260[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_212;
    v260[3] = &unk_1E6B905F0;
    dispatch_semaphore_t v262 = buf;
    v263 = &v282;
    id v199 = v192;
    v261 = v199;
    [v198 fetchSessionConfigurationsWithOptions:v247 handler:v260];

    __int16 v200 = v199;
    id v245 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v201 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v200, v201)) {
      goto LABEL_159;
    }
    id v241 = [MEMORY[0x1E4F1C9C8] now];
    [v241 timeIntervalSinceDate:v245];
    double v203 = v202;
    __int16 v204 = objc_opt_new();
    id v205 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    __int16 v206 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v207 = [v206 filteredArrayUsingPredicate:v205];
    __int16 v208 = [v207 firstObject];

    [v204 submitToCoreAnalytics:v208 type:1 duration:v203];
    uint64_t v209 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v209, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v308 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v209, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v308, 2u);
    }

    id v210 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v307 = v239;
    *(void *)v308 = @"semaphore wait timeout";
    id v211 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v308 forKeys:&v307 count:1];
    long long v212 = [v210 errorWithDomain:v238 code:15 userInfo:v211];

    if (v212)
    {
      id v213 = v212;
    }
    else
    {
LABEL_159:
      id v213 = 0;
    }

    id v214 = v213;
    uint64_t v215 = v283 + 5;
    if (v214)
    {
      objc_storeStrong(v283 + 5, v213);
    }
    else if (!*v215)
    {
      uint64_t v217 = *(void *)(*(void *)&buf[8] + 40);
      id v259 = 0;
      BOOL v237 = [(SMSuggestionsManager *)self _isSessionConfigurationSimilarToTheSuggestion:v8 sessionConfiguration:v217 error:&v259];
      objc_storeStrong(v215, v259);
      if (v283[5]) {
        BOOL v216 = 0;
      }
      else {
        BOOL v216 = !v237;
      }
      goto LABEL_164;
    }
    BOOL v216 = 0;
LABEL_164:

    _Block_object_dispose(buf, 8);
    unint64_t v191 = v252 + 1;
  }
  while (v216);
  if (a5 && v283[5])
  {
    uint64_t v218 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
    {
      id v232 = (objc_class *)objc_opt_class();
      NSStringFromClass(v232);
      id v233 = (id)objc_claimAutoreleasedReturnValue();
      v234 = NSStringFromSelector(a2);
      __int16 v235 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v233;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v234;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = v235;
      _os_log_error_impl(&dword_1D9BFA000, v218, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    v162 = (uint64_t (*)(uint64_t, uint64_t))v283[5];
LABEL_174:
    unint64_t v11 = 0;
    *a5 = v162;
  }
  else
  {
    id v219 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
    {
      v220 = (objc_class *)objc_opt_class();
      NSStringFromClass(v220);
      id v221 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v222 = (id)objc_claimAutoreleasedReturnValue();
      id v223 = v222;
      id v224 = @"NO";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v221;
      *(_WORD *)&unsigned char buf[12] = 2112;
      if (v237) {
        id v224 = @"YES";
      }
      *(void *)&buf[14] = v222;
      *(_WORD *)&buf[22] = 2112;
      __int16 v295 = (uint64_t (*)(uint64_t, uint64_t))v224;
      _os_log_impl(&dword_1D9BFA000, v219, OS_LOG_TYPE_INFO, "%@, %@, atleast one previous suggestions is used, %@, ", buf, 0x20u);
    }
    if (v237) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = 4;
    }
  }
LABEL_175:

  _Block_object_dispose(&v288, 8);
  uint64_t v83 = v244;
  v250 = (void *)v242;
LABEL_86:

  _Block_object_dispose(v303, 8);
LABEL_87:

  _Block_object_dispose(&v282, 8);
LABEL_88:

  return v11;
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = [v6 creationDate];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_208(uint64_t a1, void *a2, void *a3)
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

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isSessionConfigurationSimilarToTheSuggestion:(id)a3 sessionConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    dispatch_time_t v41 = "Invalid parameter not satisfying: suggestion";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v41, buf, 2u);
    goto LABEL_39;
  }
  if (!v9)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    dispatch_time_t v41 = "Invalid parameter not satisfying: sessionConfiguration";
    goto LABEL_18;
  }
  id v11 = [(SMSuggestionsManager *)self distanceCalculator];
  id v12 = [v8 destinationLocation];
  uint64_t v13 = [v10 destination];
  id v14 = [v13 location];
  id v76 = 0;
  [v11 distanceFromLocation:v12 toLocation:v14 error:&v76];
  double v16 = v15;
  id v17 = v76;

  if (v17 || v16 == 1.79769313e308)
  {
    id v42 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = (objc_class *)objc_opt_class();
      id v44 = NSStringFromClass(v43);
      NSStringFromSelector(a2);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      id v73 = a5;
      if (v16 == 1.79769313e308)
      {
        float v46 = @"DBL_MAX";
      }
      else
      {
        [NSString stringWithFormat:@"%.3f", *(void *)&v16];
        float v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      BOOL v55 = [v8 destinationLocation];
      BOOL v56 = [v10 destination];
      id v57 = [v56 location];
      *(_DWORD *)buf = 138413570;
      __int16 v78 = v44;
      __int16 v79 = 2112;
      id v80 = v45;
      __int16 v81 = 2112;
      double v82 = *(double *)&v46;
      __int16 v83 = 2112;
      BOOL v84 = v55;
      __int16 v85 = 2112;
      __int16 v86 = v57;
      __int16 v87 = 2112;
      __int16 v88 = v17;
      _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, suggestion.destinationLocation, %@, sessionConfiguration.destination.location, %@, error, %@", buf, 0x3Eu);

      if (v16 != 1.79769313e308) {
      a5 = v73;
      }
    }

    if (a5)
    {
      id v17 = v17;
      BOOL v40 = 0;
      *a5 = v17;
      goto LABEL_40;
    }
LABEL_39:
    BOOL v40 = 0;
    goto LABEL_40;
  }
  __int16 v18 = (void *)MEMORY[0x1E4F6E6D8];
  id v19 = [v8 buddy];
  dispatch_time_t v20 = [v19 phoneNumber];
  id v21 = [v18 validateAndCleanupID:v20];
  int v22 = (void *)MEMORY[0x1E4F6E6D8];
  id v70 = [v10 conversation];
  BOOL v69 = [v70 receiverHandles];
  uint64_t v68 = [v69 firstObject];
  double v23 = [v68 primaryHandle];
  dispatch_time_t v24 = [v22 validateAndCleanupID:v23];
  id v71 = v21;
  BOOL v67 = @"YES";
  if (([v21 isEqualToString:v24] & 1) == 0)
  {
    uint64_t v66 = v19;
    id v25 = (void *)MEMORY[0x1E4F6E6D8];
    double v64 = [v8 buddy];
    double v63 = [v64 email];
    [v25 validateAndCleanupID:v63];
    double v26 = v62 = v23;
    double v65 = v20;
    double v27 = (void *)MEMORY[0x1E4F6E6D8];
    [v10 conversation];
    v28 = uint64_t v72 = a5;
    id v29 = [v28 receiverHandles];
    uint64_t v30 = [v29 firstObject];
    dispatch_semaphore_t v31 = [v30 primaryHandle];
    id v32 = [v27 validateAndCleanupID:v31];
    int v33 = [v26 isEqualToString:v32];
    id v34 = @"NO";
    if (v33) {
      id v34 = @"YES";
    }
    BOOL v67 = v34;

    dispatch_time_t v20 = v65;
    id v19 = v66;

    a5 = v72;
    double v23 = v62;
  }
  uint64_t v35 = [v8 sessionType];
  uint64_t v36 = [v10 sessionType];
  id v75 = 0;
  double v37 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionDestinationSimilarityRadiusToSessionConfiguration" error:&v75];
  double v38 = v75;
  id v17 = v38;
  if (a5 && v38)
  {
    id v39 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v59 = (objc_class *)objc_opt_class();
      id v60 = NSStringFromClass(v59);
      dispatch_time_t v61 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v78 = v60;
      __int16 v79 = 2112;
      id v80 = v61;
      __int16 v81 = 2112;
      double v82 = *(double *)&v17;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    BOOL v40 = 0;
    *a5 = v17;
  }
  else
  {
    float v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      id v48 = (objc_class *)objc_opt_class();
      id v49 = NSStringFromClass(v48);
      BOOL v50 = NSStringFromSelector(a2);
      [v37 doubleValue];
      *(_DWORD *)buf = 138413570;
      id v52 = @"NO";
      __int16 v78 = v49;
      if (v35 == v36) {
        id v52 = @"YES";
      }
      __int16 v79 = 2112;
      id v80 = v50;
      __int16 v81 = 2048;
      double v82 = v16;
      __int16 v83 = 2048;
      BOOL v84 = v51;
      __int16 v85 = 2112;
      __int16 v86 = v67;
      __int16 v87 = 2112;
      __int16 v88 = v52;
      _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%@, %@, distance between destinations, %.3f, threshold, %.3f, are buddies equal, %@, are session types equal, %@", buf, 0x3Eu);
    }
    [v37 doubleValue];
    BOOL v40 = v16 <= v53 && v35 == v36;
  }

LABEL_40:
  return v40;
}

- (BOOL)_isEffectivePairedDeviceNearby
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(a2);
    id v12 = [(SMSuggestionsManager *)self messagingService];
    uint64_t v13 = [v12 effectivePairedDevice];
    int v14 = 138412802;
    double v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 1024;
    int v19 = [v13 isNearby];
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, self.messagingService.effectivePairedDevice.nearby %d", (uint8_t *)&v14, 0x1Cu);
  }
  id v5 = [(SMSuggestionsManager *)self messagingService];
  uint64_t v6 = [v5 effectivePairedDevice];
  char v7 = [v6 isNearby];

  return v7;
}

- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v10 = 0;
    BOOL v5 = [(SMSuggestionsManager *)self isZelkovaSuggestionsFeatureEnabledWithError:&v10];
    uint64_t v6 = v10;
    if (v5)
    {
      char v7 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__SMSuggestionsManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke;
      block[3] = &unk_1E6B90CE0;
      block[4] = self;
      id v9 = v4;
      dispatch_async(v7, block);
    }
    else
    {
      (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[SMSuggestionsManager fetchSuggestedSessionConfigurationWithHandler:]";
      __int16 v13 = 1024;
      int v14 = 2958;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __70__SMSuggestionsManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSuggestedSessionConfigurationWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
  v194[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(id, void))a3;
  if (v5)
  {
    uint64_t v172 = 0;
    id v173 = &v172;
    uint64_t v174 = 0x3032000000;
    uint64_t v175 = __Block_byref_object_copy__102;
    __int16 v176 = __Block_byref_object_dispose__102;
    id v177 = 0;
    id obj = 0;
    [(SMSuggestionsManager *)self _refreshCurrentLocationWithError:&obj];
    objc_storeStrong(&v177, obj);
    uint64_t v6 = (id *)(v173 + 5);
    if (v173[5])
    {
      v5[2](v5, 0);
      char v7 = 0;
    }
    else
    {
      id v170 = 0;
      id v8 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionTimeIntervalBuffer" error:&v170];
      objc_storeStrong(v6, v170);
      if (v173[5])
      {
        v5[2](v5, 0);
        char v7 = 0;
      }
      else
      {
        id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          [v8 doubleValue];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v12;
          *(_WORD *)&buf[22] = 2048;
          dispatch_semaphore_t v192 = v13;
          _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, using time interval buffer, %.3f", buf, 0x20u);
        }
        dispatch_time_t v147 = [MEMORY[0x1E4F1C9C8] date];
        [v8 doubleValue];
        uint64_t v146 = [v147 dateByAddingTimeInterval:-v14];
        uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          __int16 v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          int v19 = [v146 stringFromDate];
          [v8 doubleValue];
          double v21 = v20;
          int v22 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2112;
          dispatch_semaphore_t v192 = v19;
          *(_WORD *)id v193 = 2048;
          *(double *)&v193[2] = v21 + v21;
          *(_WORD *)&v193[10] = 2112;
          *(void *)&v193[12] = v22;
          _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, %@, fetching config from last session around currentDateMinusBufferTime, %@, timeIntervalWindow, %.3f, location, %@", buf, 0x34u);
        }
        double v23 = (id *)(v173 + 5);
        id v169 = (id)v173[5];
        dispatch_time_t v24 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionBoundingBoxRadius" error:&v169];
        objc_storeStrong(v23, v169);
        if (v173[5])
        {
          v5[2](v5, 0);
          char v7 = 0;
        }
        else
        {
          id v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            double v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            [v24 doubleValue];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v27;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2048;
            dispatch_semaphore_t v192 = v29;
            _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, using bounding box radius, %.3f", buf, 0x20u);
          }
          id v30 = objc_alloc(MEMORY[0x1E4F99920]);
          id v31 = objc_alloc(MEMORY[0x1E4F28C18]);
          [v8 doubleValue];
          int v33 = (void *)[v31 initWithStartDate:v146 duration:v32 + v32];
          id v34 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          uint64_t v35 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
          uint64_t v36 = (void *)[v34 initWithRTLocation:v35];
          LOBYTE(v128) = 1;
          uint64_t v145 = (void *)[v30 initWithBatchSize:*MEMORY[0x1E4F99C08] fetchLimit:1 sortBySessionStartDate:1 ascending:0 sessionTypes:0 timeInADayInterval:v33 pickOneConfigInTimeInADayInterval:v128 dateInterval:0 startBoundingBoxLocation:v36 destinationBoundingBoxLocation:0 boundingBoxRadius:v24 sessionIdentifier:0];

          double v37 = (id *)(v173 + 5);
          id v168 = (id)v173[5];
          dispatch_semaphore_t v144 = [(SMSuggestionsManager *)self _getSessionConfigurationsWithOptions:v145 error:&v168];
          objc_storeStrong(v37, v168);
          if (v173[5])
          {
            v5[2](v5, 0);
            char v7 = 0;
          }
          else
          {
            double v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              id v39 = (objc_class *)objc_opt_class();
              NSStringFromClass(v39);
              id v40 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              id v41 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v42 = [v144 count];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v40;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v41;
              *(_WORD *)&buf[22] = 2048;
              dispatch_semaphore_t v192 = (uint64_t (*)(uint64_t, uint64_t))v42;
              _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, configs count, %lu", buf, 0x20u);
            }
            if ([v144 count])
            {
              char v7 = [v144 firstObject];
              id v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                id v44 = (objc_class *)objc_opt_class();
                NSStringFromClass(v44);
                id v45 = (id)objc_claimAutoreleasedReturnValue();
                float v46 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v45;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v46;
                *(_WORD *)&buf[22] = 2112;
                dispatch_semaphore_t v192 = (uint64_t (*)(uint64_t, uint64_t))v7;
                _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, %@, suggested config, %@", buf, 0x20u);
              }
              ((void (*)(void (**)(id, void), NSObject *, void))v5[2])(v5, v7, 0);
            }
            else
            {
              float v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                id v48 = (objc_class *)objc_opt_class();
                NSStringFromClass(v48);
                id v49 = (id)objc_claimAutoreleasedReturnValue();
                BOOL v50 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v49;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v50;
                _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%@, %@, since configs are zero, trying to fetch likely handles and destinations", buf, 0x16u);
              }
              dispatch_semaphore_t v51 = dispatch_semaphore_create(0);
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&uint8_t buf[16] = 0x3032000000;
              dispatch_semaphore_t v192 = __Block_byref_object_copy__102;
              *(void *)id v193 = __Block_byref_object_dispose__102;
              *(void *)&v193[8] = 0;
              uint64_t v162 = 0;
              uint64_t v163 = &v162;
              uint64_t v164 = 0x3032000000;
              id v165 = __Block_byref_object_copy__102;
              id v166 = __Block_byref_object_dispose__102;
              id v167 = 0;
              id v52 = [(SMSuggestionsManager *)self suggestionsHelper];
              v157[0] = MEMORY[0x1E4F143A8];
              v157[1] = 3221225472;
              v157[2] = __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke;
              v157[3] = &unk_1E6B99560;
              long long v159 = buf;
              BOOL v160 = &v162;
              v161 = &v172;
              double v53 = v51;
              __int16 v158 = v53;
              [v52 fetchMostLikelySessionDestinationsWithHandler:v157];

              dsema = v53;
              uint64_t v54 = [MEMORY[0x1E4F1C9C8] now];
              dispatch_time_t v55 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(dsema, v55)) {
                goto LABEL_31;
              }
              unsigned int v139 = [MEMORY[0x1E4F1C9C8] now];
              [v139 timeIntervalSinceDate:v54];
              double v57 = v56;
              id v132 = objc_opt_new();
              id v135 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
              dispatch_semaphore_t v58 = [MEMORY[0x1E4F29060] callStackSymbols];
              dispatch_time_t v59 = [v58 filteredArrayUsingPredicate:v135];
              id v60 = [v59 firstObject];

              [v132 submitToCoreAnalytics:v60 type:1 duration:v57];
              dispatch_time_t v61 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)id v187 = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v187, 2u);
              }

              dispatch_time_t v62 = (void *)MEMORY[0x1E4F28C58];
              *(void *)uint64_t v179 = *MEMORY[0x1E4F28568];
              *(void *)id v187 = @"semaphore wait timeout";
              double v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v187 forKeys:v179 count:1];
              double v64 = [v62 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v63];

              if (v64)
              {
                id v65 = v64;
              }
              else
              {
LABEL_31:
                id v65 = 0;
              }

              id v66 = v65;
              if (v66)
              {
                BOOL v67 = v66;
                ((void (*)(void (**)(id, void), void, id))v5[2])(v5, 0, v66);
                char v7 = 0;
              }
              else if (v173[5])
              {
                v5[2](v5, 0);
                BOOL v67 = 0;
                char v7 = 0;
              }
              else
              {
                uint64_t v68 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                {
                  BOOL v69 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v69);
                  id v70 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v71 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v72 = [(id)v163[5] count];
                  *(_DWORD *)id v187 = 138412802;
                  *(void *)&v187[4] = v70;
                  *(_WORD *)&v187[12] = 2112;
                  *(void *)&v187[14] = v71;
                  *(_WORD *)&v187[22] = 2048;
                  id v188 = (uint64_t (*)(uint64_t, uint64_t))v72;
                  _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "%@, %@, session destinations count, %lu", v187, 0x20u);
                }
                dispatch_semaphore_t v73 = dispatch_semaphore_create(0);

                *(void *)id v187 = 0;
                *(void *)&v187[8] = v187;
                *(void *)&v187[16] = 0x3032000000;
                id v188 = __Block_byref_object_copy__102;
                id v189 = __Block_byref_object_dispose__102;
                id v190 = 0;
                uint64_t v74 = [(SMSuggestionsManager *)self suggestionsHelper];
                v153[0] = MEMORY[0x1E4F143A8];
                v153[1] = 3221225472;
                v153[2] = __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke_224;
                v153[3] = &unk_1E6B905F0;
                unint64_t v155 = v187;
                __int16 v156 = &v172;
                id v75 = v73;
                __int16 v154 = v75;
                [v74 fetchMostLikelyReceiverHandlesWithHandler:v153];

                dsema = v75;
                id v76 = [MEMORY[0x1E4F1C9C8] now];
                dispatch_time_t v77 = dispatch_time(0, 3600000000000);
                if (!dispatch_semaphore_wait(dsema, v77)) {
                  goto LABEL_43;
                }
                id v140 = [MEMORY[0x1E4F1C9C8] now];
                [v140 timeIntervalSinceDate:v76];
                double v79 = v78;
                id v133 = objc_opt_new();
                id v136 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
                id v80 = [MEMORY[0x1E4F29060] callStackSymbols];
                __int16 v81 = [v80 filteredArrayUsingPredicate:v136];
                double v82 = [v81 firstObject];

                [v133 submitToCoreAnalytics:v82 type:1 duration:v79];
                __int16 v83 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)uint64_t v179 = 0;
                  _os_log_fault_impl(&dword_1D9BFA000, v83, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v179, 2u);
                }

                BOOL v84 = (void *)MEMORY[0x1E4F28C58];
                v194[0] = *MEMORY[0x1E4F28568];
                *(void *)uint64_t v179 = @"semaphore wait timeout";
                __int16 v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v194 count:1];
                __int16 v86 = [v84 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v85];

                if (v86)
                {
                  id v87 = v86;
                }
                else
                {
LABEL_43:
                  id v87 = 0;
                }

                id v88 = v87;
                id v134 = v88;
                if (v88 || (id v88 = (id)v173[5]) != 0)
                {
                  ((void (*)(void (**)(id, void), void, id))v5[2])(v5, 0, v88);
                  char v7 = 0;
                }
                else
                {
                  uint64_t v89 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                  {
                    id v90 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v90);
                    id v91 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    id v92 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v93 = [*(id *)(*(void *)&v187[8] + 40) count];
                    *(_DWORD *)uint64_t v179 = 138412802;
                    *(void *)&v179[4] = v91;
                    __int16 v180 = 2112;
                    id v181 = v92;
                    __int16 v182 = 2048;
                    uint64_t v183 = v93;
                    _os_log_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_INFO, "%@, %@, receiver handles count, %lu", v179, 0x20u);
                  }
                  long long v151 = 0u;
                  long long v152 = 0u;
                  long long v149 = 0u;
                  long long v150 = 0u;
                  id v131 = *(id *)(*(void *)&v187[8] + 40);
                  uint64_t v94 = [v131 countByEnumeratingWithState:&v149 objects:v186 count:16];
                  if (v94)
                  {
                    dispatch_semaphore_t v130 = 0;
                    uint64_t v137 = *(void *)v150;
LABEL_58:
                    uint64_t v95 = 0;
                    uint64_t v141 = v94;
                    while (1)
                    {
                      if (*(void *)v150 != v137) {
                        objc_enumerationMutation(v131);
                      }
                      BOOL v96 = *(void **)(*((void *)&v149 + 1) + 8 * v95);
                      unint64_t v97 = (void *)MEMORY[0x1E016D870]();
                      unint64_t v98 = (id *)(v173 + 5);
                      id v148 = (id)v173[5];
                      BOOL v99 = [(SMSuggestionsManager *)self _checkReceiverEligibilityForHandle:v96 error:&v148];
                      objc_storeStrong(v98, v148);
                      if (v173[5])
                      {
                        v5[2](v5, 0);
                        int v100 = 0;
                        int v101 = 1;
                      }
                      else if (v99)
                      {
                        id v102 = v96;

                        int v100 = 0;
                        int v101 = 6;
                        dispatch_semaphore_t v130 = v102;
                      }
                      else
                      {
                        int v101 = 0;
                        int v100 = 1;
                      }
                      if (!v100) {
                        break;
                      }
                      if (v141 == ++v95)
                      {
                        uint64_t v94 = [v131 countByEnumeratingWithState:&v149 objects:v186 count:16];
                        if (v94) {
                          goto LABEL_58;
                        }
                        goto LABEL_74;
                      }
                    }

                    if (v101 != 6 && v101)
                    {
                      char v7 = 0;
                      goto LABEL_86;
                    }
                  }
                  else
                  {
                    dispatch_semaphore_t v130 = 0;
LABEL_74:
                  }
                  if (v130 && [(id)v163[5] count])
                  {
                    double v103 = [(id)v163[5] firstObject];
                    id v104 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                    {
                      unint64_t v105 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v105);
                      id v106 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      id v107 = (id)objc_claimAutoreleasedReturnValue();
                      id v108 = [v103 referenceLocation];
                      *(_DWORD *)uint64_t v179 = 138413058;
                      *(void *)&v179[4] = v106;
                      __int16 v180 = 2112;
                      id v181 = v107;
                      __int16 v182 = 2112;
                      uint64_t v183 = (uint64_t)v130;
                      __int16 v184 = 2112;
                      uint64_t v185 = (uint64_t)v108;
                      _os_log_impl(&dword_1D9BFA000, v104, OS_LOG_TYPE_INFO, "%@, %@, creating session config using handle, %@, destination location, %@", v179, 0x2Au);
                    }
                    id v109 = objc_alloc(MEMORY[0x1E4F1E5F0]);
                    uint64_t v110 = [v103 referenceLocation];
                    id v142 = (void *)[v109 initWithRTLocation:v110];

                    id v111 = objc_alloc(MEMORY[0x1E4F99928]);
                    id v112 = [v103 mapItem];
                    id v113 = [v112 geoMapItemHandle];
                    id v138 = (void *)[v111 initWithCLLocation:v142 eta:0 radius:0 destinationType:v113 destinationMapItem:-1.0];

                    id v114 = objc_alloc(MEMORY[0x1E4F99838]);
                    id v178 = v130;
                    id v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v178 count:1];
                    id v116 = (void *)[v114 initWithReceiverHandles:v115 identifier:0 displayName:0];

                    id v117 = objc_alloc(MEMORY[0x1E4F99918]);
                    uint64_t v118 = [MEMORY[0x1E4F29128] UUID];
                    LOBYTE(v129) = [MEMORY[0x1E4F99880] zelkovaHandoffEnabled];
                    char v7 = [v117 initWithConversation:v116 sessionID:v118 sessionStartDate:0 sessionType:2 time:0 destination:v138 userResponseSafeDate:0 sessionSupportsHandoff:v129 sosReceivers:v116 sessionWorkoutType:0];
                  }
                  else
                  {
                    double v103 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
                    {
                      id v119 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v119);
                      id v120 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      id v121 = (id)objc_claimAutoreleasedReturnValue();
                      uint64_t v122 = [*(id *)(*(void *)&v187[8] + 40) count];
                      uint64_t v123 = [(id)v163[5] count];
                      *(_DWORD *)uint64_t v179 = 138413058;
                      *(void *)&v179[4] = v120;
                      __int16 v180 = 2112;
                      id v181 = v121;
                      __int16 v182 = 2048;
                      uint64_t v183 = v122;
                      __int16 v184 = 2048;
                      uint64_t v185 = v123;
                      _os_log_impl(&dword_1D9BFA000, v103, OS_LOG_TYPE_INFO, "%@, %@, session config could not be created, likely handles count, %lu, likely destinations count, %lu", v179, 0x2Au);
                    }
                    char v7 = 0;
                  }

                  double v124 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
                  {
                    id v125 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v125);
                    id v126 = (id)objc_claimAutoreleasedReturnValue();
                    long long v127 = NSStringFromSelector(a2);
                    *(_DWORD *)uint64_t v179 = 138412802;
                    *(void *)&v179[4] = v126;
                    __int16 v180 = 2112;
                    id v181 = v127;
                    __int16 v182 = 2112;
                    uint64_t v183 = (uint64_t)v7;
                    _os_log_impl(&dword_1D9BFA000, v124, OS_LOG_TYPE_INFO, "%@, %@, suggested config, %@", v179, 0x20u);
                  }
                  ((void (*)(void (**)(id, void), NSObject *, void))v5[2])(v5, v7, 0);
LABEL_86:
                }
                _Block_object_dispose(v187, 8);

                BOOL v67 = v134;
              }

              _Block_object_dispose(&v162, 8);
              _Block_object_dispose(buf, 8);
            }
          }
        }
      }
    }
    _Block_object_dispose(&v172, 8);
  }
  else
  {
    char v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsManager _fetchSuggestedSessionConfigurationWithHandler:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2978;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v18 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke_224(uint64_t a1, void *a2, void *a3)
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

- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, NSObject *))a3;
  if (!v4)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "-[SMSuggestionsManager fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:]";
      __int16 v20 = 1024;
      int v21 = 3198;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_9;
  }
  if (([MEMORY[0x1E4F99880] zelkovaWorkoutEnabled] & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F99A48];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    uint64_t v9 = NSString;
    int v10 = [MEMORY[0x1E4F99880] zelkovaWorkoutEnabled];
    id v11 = @"NO";
    if (v10) {
      id v11 = @"YES";
    }
    id v12 = [v9 stringWithFormat:@"Feature not enabled, is ZelkovaWorkout enabled, %@", v11];
    id v17 = v12;
    __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v6 = [v7 errorWithDomain:v8 code:13 userInfo:v13];

    v4[2](v4, 0, v6);
LABEL_9:

    goto LABEL_10;
  }
  id v5 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SMSuggestionsManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke;
  block[3] = &unk_1E6B90CE0;
  block[4] = self;
  uint64_t v15 = v4;
  dispatch_async(v5, block);

LABEL_10:
}

uint64_t __80__SMSuggestionsManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(SMSuggestionsManager *)self defaultsManager];
  id v6 = [v5 objectForKey:@"RTDefaultsWorkoutOngoing"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v90 = *MEMORY[0x1E4F28568];
    id v91 = @"User not in an active workout, ineligible to generate suggestion URL";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    int v10 = [v11 errorWithDomain:*MEMORY[0x1E4F99A48] code:11 userInfo:v12];

    v4[2](v4, 0, v10);
    goto LABEL_18;
  }
  id v84 = 0;
  BOOL v8 = [(SMSuggestionsManager *)self _isUserInActiveSessionWithError:&v84];
  id v9 = v84;
  if (!v9)
  {
    if (v8)
    {
      __int16 v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v88 = *MEMORY[0x1E4F28568];
      uint64_t v89 = @"User is already in an active session, ineligible to generate suggestion URL";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      uint64_t v15 = [v13 errorWithDomain:*MEMORY[0x1E4F99A48] code:11 userInfo:v14];

      v4[2](v4, 0, v15);
LABEL_17:
      int v10 = 0;
      goto LABEL_18;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F999C0]);
    id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v18 = [MEMORY[0x1E4F1C9C8] date];
    int v19 = [v18 dateByAddingTimeInterval:-604800.0];
    __int16 v20 = (void *)[v17 initWithStartDate:v19 duration:604800.0];
    dispatch_time_t v62 = (void *)[v16 initWithBatchSize:*MEMORY[0x1E4F99C18] fetchLimit:1 offset:*MEMORY[0x1E4F99C18] includeSuppressed:1 sortByCreationDate:1 ascending:0 dateInterval:v20 filteredToSuggestionTriggers:&unk_1F34531C8 filteredToSuggestionUserTypes:&unk_1F34531E0 filteredToSessionTypes:0];

    uint64_t v78 = 0;
    double v79 = &v78;
    uint64_t v80 = 0x3032000000;
    __int16 v81 = __Block_byref_object_copy__102;
    double v82 = __Block_byref_object_dispose__102;
    id v83 = 0;
    uint64_t v72 = 0;
    dispatch_semaphore_t v73 = &v72;
    uint64_t v74 = 0x3032000000;
    id v75 = __Block_byref_object_copy__102;
    id v76 = __Block_byref_object_dispose__102;
    id v77 = 0;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    uint64_t v22 = [(SMSuggestionsManager *)self suggestionsStore];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke;
    v68[3] = &unk_1E6B905F0;
    id v70 = &v78;
    id v71 = &v72;
    double v23 = v21;
    BOOL v69 = v23;
    [v22 fetchSuggestionsWithOptions:v62 handler:v68];

    dispatch_time_t v24 = v23;
    id v25 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v26 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v24, v26)) {
      goto LABEL_12;
    }
    id v27 = [MEMORY[0x1E4F1C9C8] now];
    [v27 timeIntervalSinceDate:v25];
    double v29 = v28;
    id v30 = objc_opt_new();
    id v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    double v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v33 = [v32 filteredArrayUsingPredicate:v31];
    id v34 = [v33 firstObject];

    [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
    uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v92 count:1];
    double v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

    if (v38)
    {
      id v39 = v38;
    }
    else
    {
LABEL_12:
      id v39 = 0;
    }

    id v40 = v39;
    id v41 = v40;
    if (v40 || (id v41 = (id)v73[5]) != 0)
    {
      v4[2](v4, 0, v41);
LABEL_16:

      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(&v78, 8);

      goto LABEL_17;
    }
    uint64_t v42 = [(id)v79[5] firstObject];
    if ([v42 isSuppressed]
      && [v42 suppressionReason] != 12
      && [v42 suppressionReason] != 11)
    {
      double v57 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v86 = *MEMORY[0x1E4F28568];
      dispatch_semaphore_t v58 = NSString;
      dispatch_time_t v59 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionSuppressionReason:[v42 suppressionReason]];
      id v60 = [v58 stringWithFormat:@"Suggestion is not eligible to be shown due to %@", v59];
      id v87 = v60;
      dispatch_time_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      BOOL v50 = [v57 errorWithDomain:*MEMORY[0x1E4F99A48] code:1 userInfo:v61];

      v4[2](v4, 0, v50);
      goto LABEL_30;
    }
    id v43 = [v42 buddy];
    id v44 = [v43 email];

    if (v44)
    {
      id v45 = objc_alloc(MEMORY[0x1E4F99888]);
      float v46 = [v42 buddy];
      float v47 = [v46 email];
      uint64_t v48 = [v45 initWithPrimaryHandle:v47 secondaryHandles:MEMORY[0x1E4F1CBF0]];
    }
    else
    {
      id v49 = [v42 buddy];
      BOOL v50 = [v49 phoneNumber];

      if (!v50) {
        goto LABEL_28;
      }
      id v51 = objc_alloc(MEMORY[0x1E4F99888]);
      float v46 = [v42 buddy];
      float v47 = [v46 phoneNumber];
      uint64_t v48 = [v51 initWithPrimaryHandle:v47 secondaryHandles:MEMORY[0x1E4F1CBF0]];
    }
    BOOL v50 = (void *)v48;

    if (v50)
    {
      id v52 = objc_alloc(MEMORY[0x1E4F99838]);
      __int16 v85 = v50;
      double v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
      uint64_t v54 = (void *)[v52 initWithReceiverHandles:v53 identifier:0 displayName:0];

LABEL_29:
      dispatch_time_t v55 = [(SMSuggestionsManager *)self healthKitManager];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2;
      v63[3] = &unk_1E6B99588;
      v63[4] = self;
      id v56 = v54;
      id v64 = v56;
      id v65 = v42;
      BOOL v67 = &v72;
      id v66 = v4;
      [v55 fetchMostRecentWorkoutActivityTypeWithHandler:v63];

LABEL_30:
      goto LABEL_16;
    }
LABEL_28:
    uint64_t v54 = 0;
    goto LABEL_29;
  }
  int v10 = v9;
  v4[2](v4, 0, v9);
LABEL_18:
}

void __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_3;
  block[3] = &unk_1E6B91BA8;
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v14 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v8;
  long long v13 = v8;
  dispatch_async(v4, block);
}

void __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99918]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [*(id *)(a1 + 40) dateInterval];
  uint64_t v6 = [v5 startDate];
  LOBYTE(v11) = 0;
  id v7 = (void *)[v2 initWithConversation:v3 sessionID:v4 sessionStartDate:v6 sessionType:4 time:0 destination:0 userResponseSafeDate:0 sessionSupportsHandoff:v11 sosReceivers:*(void *)(a1 + 32) sessionWorkoutType:*(void *)(a1 + 72)];

  long long v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = [v8 _getMessagesURLFromSessionConfig:v7 payloadType:3 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = (void (**)(void, void))v7;
  if (v6)
  {
    if (v7)
    {
LABEL_3:
      id v16 = 0;
      BOOL v9 = [(SMSuggestionsManager *)self isZelkovaSuggestionsFeatureEnabledWithError:&v16];
      id v10 = v16;
      if (v9)
      {
        uint64_t v11 = [(RTNotifier *)self queue];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __75__SMSuggestionsManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke;
        v13[3] = &unk_1E6B90660;
        v13[4] = self;
        id v14 = v6;
        uint64_t v15 = v8;
        dispatch_async(v11, v13);
      }
      else
      {
        ((void (**)(void, NSObject *))v8)[2](v8, v10);
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[SMSuggestionsManager launchSessionInitiationUIWithConfiguration:handler:]";
      __int16 v19 = 1024;
      int v20 = 3351;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", buf, 0x12u);
    }

    if (v8) {
      goto LABEL_3;
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[SMSuggestionsManager launchSessionInitiationUIWithConfiguration:handler:]";
    __int16 v19 = 1024;
    int v20 = 3352;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_11:
}

uint64_t __75__SMSuggestionsManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchSessionInitiationUIWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v8 = (void (**)(id, id))a4;
  if (v8)
  {
    BOOL v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v51 = 2112;
      id v52 = v12;
      __int16 v53 = 2112;
      id v54 = v7;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, launching message extension with configuration, %@", buf, 0x20u);
    }
    long long v13 = dispatch_semaphore_create(0);
    id v49 = 0;
    id v14 = [(SMSuggestionsManager *)self _getMessagesURLFromSessionConfig:v7 payloadType:2 error:&v49];
    id v15 = v49;
    if (v15)
    {
      v8[2](v8, v15);
    }
    else
    {
      aSelector = a2;
      id v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v17 = [v16 operationToOpenResource:v14 usingApplication:*MEMORY[0x1E4F99B00] userInfo:0];

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __76__SMSuggestionsManager__launchSessionInitiationUIWithConfiguration_handler___block_invoke;
      v47[3] = &unk_1E6B90E70;
      id v18 = v13;
      uint64_t v48 = v18;
      [v17 setCompletionBlock:v47];
      [v17 start];
      __int16 v19 = v18;
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v21 = dispatch_time(0, 3600000000000);
      float v46 = (void *)v20;
      if (dispatch_semaphore_wait(v19, v21))
      {
        id v44 = v19;
        id v45 = v17;
        id v43 = [MEMORY[0x1E4F1C9C8] now];
        [v43 timeIntervalSinceDate:v20];
        double v23 = v22;
        dispatch_time_t v24 = objc_opt_new();
        uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
        dispatch_time_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v41 = (void *)v25;
        id v27 = [v26 filteredArrayUsingPredicate:v25];
        double v28 = [v27 firstObject];

        uint64_t v42 = v24;
        [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
        double v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
        }

        id v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F5CFE8];
        v55[0] = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        double v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v55 count:1];
        int v33 = [v30 errorWithDomain:v31 code:15 userInfo:v32];

        if (v33)
        {
          id v34 = v33;
        }
        else
        {
          id v34 = 0;
        }
        __int16 v19 = v44;
        id v17 = v45;
      }
      else
      {
        id v34 = 0;
      }

      id v35 = v34;
      if (v35)
      {
        v8[2](v8, v35);
      }
      else
      {
        uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          double v37 = (objc_class *)objc_opt_class();
          double v38 = NSStringFromClass(v37);
          id v39 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v38;
          __int16 v51 = 2112;
          id v52 = v39;
          _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "%@, %@, message extension launched", buf, 0x16u);
        }
        v8[2](v8, 0);
      }
    }
  }
  else
  {
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsManager _launchSessionInitiationUIWithConfiguration:handler:]";
      __int16 v51 = 1024;
      LODWORD(v52) = 3374;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

intptr_t __76__SMSuggestionsManager__launchSessionInitiationUIWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SMSuggestionsManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __71__SMSuggestionsManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _shouldShowProactiveSuggestions];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)_shouldShowProactiveSuggestions
{
  if ([MEMORY[0x1E4F998E0] isLockScreenSuggestionsAllowed])
  {
    if ([(SMSuggestionsManager *)self routineEnabled]) {
      return 1;
    }
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v7 = 0;
      id v5 = "Significant Locations disabled, not showing proactive suggestions";
      id v6 = (uint8_t *)&v7;
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = 0;
      id v5 = "LockScreenSuggestions disabled, not showing proactive suggestions";
      id v6 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }

  return 0;
}

- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__102;
    __int16 v19 = __Block_byref_object_dispose__102;
    id v20 = 0;
    id obj = 0;
    BOOL v8 = [(SMSuggestionsManager *)self isZelkovaSuggestionsFeatureEnabledWithError:&obj];
    objc_storeStrong(&v20, obj);
    if (v8)
    {
      BOOL v9 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__SMSuggestionsManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke;
      block[3] = &unk_1E6B98FF8;
      void block[4] = self;
      id v11 = v6;
      long long v13 = &v15;
      id v12 = v7;
      dispatch_async(v9, block);
    }
    else
    {
      (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v16[5]);
    }
    _Block_object_dispose(&v15, 8);
  }
}

uint64_t __73__SMSuggestionsManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  [v2 _showSuggestionsDetectionUIWithSuggestion:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v23 = "-[SMSuggestionsManager shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      __int16 v24 = 1024;
      int v25 = 3479;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    double v23 = "-[SMSuggestionsManager shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
    __int16 v24 = 1024;
    int v25 = 3480;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v23 = "-[SMSuggestionsManager shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      __int16 v24 = 1024;
      int v25 = 3481;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  id v21 = 0;
  BOOL v14 = [(SMSuggestionsManager *)self isZelkovaSuggestionsFeatureEnabledWithError:&v21];
  id v15 = v21;
  if (v14)
  {
    id v16 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SMSuggestionsManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke;
    block[3] = &unk_1E6B91490;
    void block[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    dispatch_async(v16, block);
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v15);
  }
}

uint64_t __83__SMSuggestionsManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldShowKeyboardSuggestionsForInitiator:*(void *)(a1 + 40) receiver:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  v118[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (!v8)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v110 = 136315394;
      *(void *)&v110[4] = "-[SMSuggestionsManager _shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      *(_WORD *)&v110[12] = 1024;
      *(_DWORD *)&v110[14] = 3501;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", v110, 0x12u);
    }
  }
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v110 = 136315394;
      *(void *)&v110[4] = "-[SMSuggestionsManager _shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      *(_WORD *)&v110[12] = 1024;
      *(_DWORD *)&v110[14] = 3502;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", v110, 0x12u);
    }
  }
  if (v10)
  {
    if (!v8
      || ([v8 primaryHandle],
          long long v13 = objc_claimAutoreleasedReturnValue(),
          BOOL v14 = v13 == 0,
          v13,
          v14))
    {
      double v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v116 = *MEMORY[0x1E4F28568];
      id v117 = @"initiator handle is required";
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      uint64_t v31 = [v29 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v30];
      v10[2](v10, 0, v31);
    }
    else if (!v9 {
           || ([v9 primaryHandle],
    }
               id v15 = objc_claimAutoreleasedReturnValue(),
               BOOL v16 = v15 == 0,
               v15,
               v16))
    {
      int v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v114 = *MEMORY[0x1E4F28568];
      id v115 = @"receiver handle is required";
      id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      id v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v34];
      v10[2](v10, 0, v35);
    }
    else
    {
      *(void *)uint64_t v110 = 0;
      *(void *)&uint8_t v110[8] = v110;
      *(void *)&v110[16] = 0x3032000000;
      id v111 = __Block_byref_object_copy__102;
      id v112 = __Block_byref_object_dispose__102;
      id v113 = 0;
      id obj = 0;
      BOOL v17 = [(SMSuggestionsManager *)self _checkInitiatorEligibilityWithError:&obj];
      objc_storeStrong(&v113, obj);
      id v18 = (id *)(*(void *)&v110[8] + 40);
      if (*(void *)(*(void *)&v110[8] + 40)) {
        BOOL v19 = 0;
      }
      else {
        BOOL v19 = v17;
      }
      if (v19)
      {
        id v96 = 0;
        BOOL v20 = [(SMSuggestionsManager *)self _checkReceiverEligibilityForHandle:v9 error:&v96];
        objc_storeStrong(v18, v96);
        id v21 = (id *)(*(void *)&v110[8] + 40);
        if (*(void *)(*(void *)&v110[8] + 40)) {
          BOOL v22 = 0;
        }
        else {
          BOOL v22 = v20;
        }
        if (v22)
        {
          id v95 = 0;
          BOOL v23 = [(SMSuggestionsManager *)self _isUserInActiveSessionWithError:&v95];
          objc_storeStrong(v21, v95);
          if (*(void *)(*(void *)&v110[8] + 40)) {
            int v24 = 1;
          }
          else {
            int v24 = v23;
          }
          if (v24 == 1)
          {
            int v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              id v27 = (id)objc_claimAutoreleasedReturnValue();
              double v28 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v27;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v28;
              _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, user is in active session", buf, 0x16u);
            }
            v10[2](v10, 0, *(void **)(*(void *)&v110[8] + 40));
          }
          else
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            id v107 = __Block_byref_object_copy__102;
            id v108 = __Block_byref_object_dispose__102;
            id v109 = 0;
            dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
            double v37 = [(SMSuggestionsManager *)self suggestionsHelper];
            v91[0] = MEMORY[0x1E4F143A8];
            v91[1] = 3221225472;
            v91[2] = __84__SMSuggestionsManager__shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke;
            v91[3] = &unk_1E6B905F0;
            uint64_t v93 = buf;
            uint64_t v94 = v110;
            double v38 = v36;
            uint64_t v92 = v38;
            [v37 fetchMostLikelyReceiverHandlesWithHandler:v91];

            dsema = v38;
            id v39 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v40 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(dsema, v40)) {
              goto LABEL_41;
            }
            id v84 = [MEMORY[0x1E4F1C9C8] now];
            [v84 timeIntervalSinceDate:v39];
            double v42 = v41;
            id v43 = objc_opt_new();
            id v44 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
            id v45 = [MEMORY[0x1E4F29060] callStackSymbols];
            float v46 = [v45 filteredArrayUsingPredicate:v44];
            float v47 = [v46 firstObject];

            [v43 submitToCoreAnalytics:v47 type:1 duration:v42];
            uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)unint64_t v98 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v98, 2u);
            }

            id v49 = (void *)MEMORY[0x1E4F28C58];
            v118[0] = *MEMORY[0x1E4F28568];
            *(void *)unint64_t v98 = @"semaphore wait timeout";
            BOOL v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v118 count:1];
            __int16 v51 = [v49 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v50];

            if (v51)
            {
              id v52 = v51;
            }
            else
            {
LABEL_41:
              id v52 = 0;
            }

            id v53 = v52;
            id v54 = v53;
            if (v53 || (id v54 = *(id *)(*(void *)&v110[8] + 40)) != 0)
            {
              v10[2](v10, 0, v54);
            }
            else
            {
              dispatch_time_t v55 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                id v56 = (objc_class *)objc_opt_class();
                NSStringFromClass(v56);
                id v57 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v58 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v59 = [*(id *)(*(void *)&buf[8] + 40) count];
                *(_DWORD *)unint64_t v98 = 138412802;
                *(void *)&void v98[4] = v57;
                __int16 v99 = 2112;
                id v100 = v58;
                __int16 v101 = 2048;
                uint64_t v102 = v59;
                _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "%@, %@, likelyReceivers count, %lu", v98, 0x20u);
              }
              long long v89 = 0u;
              long long v90 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              double v79 = *(id *)(*(void *)&buf[8] + 40);
              uint64_t v60 = [v79 countByEnumeratingWithState:&v87 objects:v105 count:16];
              if (v60)
              {
                uint64_t v81 = *(void *)v88;
                while (2)
                {
                  uint64_t v85 = 0;
                  uint64_t v80 = v60;
                  do
                  {
                    if (*(void *)v88 != v81) {
                      objc_enumerationMutation(v79);
                    }
                    dispatch_time_t v61 = *(void **)(*((void *)&v87 + 1) + 8 * v85);
                    context = (void *)MEMORY[0x1E016D870]();
                    dispatch_time_t v62 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                    {
                      double v63 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v63);
                      id v64 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      id v65 = (id)objc_claimAutoreleasedReturnValue();
                      id v66 = [v61 primaryHandle];
                      BOOL v67 = [v9 primaryHandle];
                      *(_DWORD *)unint64_t v98 = 138413058;
                      *(void *)&void v98[4] = v64;
                      __int16 v99 = 2112;
                      id v100 = v65;
                      __int16 v101 = 2112;
                      uint64_t v102 = (uint64_t)v66;
                      __int16 v103 = 2112;
                      id v104 = v67;
                      _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "%@, %@, likelyReceiver.primaryHandle, %@, receiver.primaryHandle, %@", v98, 0x2Au);
                    }
                    uint64_t v68 = (void *)MEMORY[0x1E4F6E6D8];
                    BOOL v69 = [v61 primaryHandle];
                    id v70 = [v68 validateAndCleanupID:v69];
                    id v71 = (void *)MEMORY[0x1E4F6E6D8];
                    uint64_t v72 = [v9 primaryHandle];
                    dispatch_semaphore_t v73 = [v71 validateAndCleanupID:v72];
                    char v74 = [v70 isEqualToString:v73];

                    if (v74)
                    {
                      uint64_t v78 = 1;
                      goto LABEL_64;
                    }
                    ++v85;
                  }
                  while (v80 != v85);
                  uint64_t v60 = [v79 countByEnumeratingWithState:&v87 objects:v105 count:16];
                  if (v60) {
                    continue;
                  }
                  break;
                }
              }

              double v79 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                id v75 = (objc_class *)objc_opt_class();
                NSStringFromClass(v75);
                id v76 = (id)objc_claimAutoreleasedReturnValue();
                id v77 = NSStringFromSelector(a2);
                *(_DWORD *)unint64_t v98 = 138412546;
                *(void *)&void v98[4] = v76;
                __int16 v99 = 2112;
                id v100 = v77;
                _os_log_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_INFO, "%@, %@, receiver is not a likely receiver", v98, 0x16u);
              }
              uint64_t v78 = 0;
LABEL_64:

              v10[2](v10, v78, 0);
              id v53 = 0;
            }

            _Block_object_dispose(buf, 8);
          }
        }
        else
        {
          ((void (*)(void (**)(id, void, void *), void))v10[2])(v10, 0);
        }
      }
      else
      {
        ((void (*)(void (**)(id, void, void *), void))v10[2])(v10, 0);
      }
      _Block_object_dispose(v110, 8);
    }
  }
  else
  {
    double v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v110 = 136315394;
      *(void *)&v110[4] = "-[SMSuggestionsManager _shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      *(_WORD *)&v110[12] = 1024;
      *(_DWORD *)&v110[14] = 3503;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v110, 0x12u);
    }
  }
}

void __84__SMSuggestionsManager__shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v23 = "-[SMSuggestionsManager shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      __int16 v24 = 1024;
      int v25 = 3614;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v23 = "-[SMSuggestionsManager shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
    __int16 v24 = 1024;
    int v25 = 3615;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v23 = "-[SMSuggestionsManager shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      __int16 v24 = 1024;
      int v25 = 3616;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  id v21 = 0;
  BOOL v14 = [(SMSuggestionsManager *)self isZelkovaSuggestionsFeatureEnabledWithError:&v21];
  id v15 = v21;
  if (v14)
  {
    BOOL v16 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__SMSuggestionsManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke;
    block[3] = &unk_1E6B91490;
    void block[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    dispatch_async(v16, block);
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v15);
  }
}

uint64_t __81__SMSuggestionsManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldShowTipKitSuggestionsForInitiator:*(void *)(a1 + 40) receiver:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  v175[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsManager _shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      __int16 v160 = 1024;
      LODWORD(v161) = 3636;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v8)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsManager _shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      __int16 v160 = 1024;
      LODWORD(v161) = 3637;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v9)
  {
    double v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsManager _shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      __int16 v160 = 1024;
      LODWORD(v161) = 3638;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_40;
  }
  if (!v7
    || ([v7 primaryHandle],
        id v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = v12 == 0,
        v12,
        v13))
  {
    double v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v173 = *MEMORY[0x1E4F28568];
    uint64_t v174 = @"initiator handle is required";
    id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
    dispatch_time_t v40 = [v38 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v39];
    v9[2](v9, 0, v40);

    goto LABEL_40;
  }
  if (!v8
    || ([v8 primaryHandle],
        BOOL v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = v14 == 0,
        v14,
        v15))
  {
    double v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v171 = *MEMORY[0x1E4F28568];
    uint64_t v172 = @"receiver handle is required";
    id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
    id v44 = [v42 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v43];
    v9[2](v9, 0, v44);

    goto LABEL_40;
  }
  uint64_t v153 = 0;
  __int16 v154 = &v153;
  uint64_t v155 = 0x3032000000;
  __int16 v156 = __Block_byref_object_copy__102;
  uint64_t v157 = __Block_byref_object_dispose__102;
  id v158 = 0;
  id obj = 0;
  BOOL v16 = [(SMSuggestionsManager *)self _checkInitiatorEligibilityWithError:&obj];
  objc_storeStrong(&v158, obj);
  BOOL v17 = (id *)(v154 + 5);
  if (v154[5]) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v16;
  }
  if (!v18)
  {
    ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0);
    goto LABEL_39;
  }
  id v151 = 0;
  BOOL v19 = [(SMSuggestionsManager *)self _checkReceiverEligibilityForHandle:v8 error:&v151];
  objc_storeStrong(v17, v151);
  if (v154[5]) {
    BOOL v20 = 0;
  }
  else {
    BOOL v20 = v19;
  }
  if (!v20)
  {
    ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0);
    goto LABEL_39;
  }
  uint64_t v145 = 0;
  uint64_t v146 = &v145;
  uint64_t v147 = 0x3032000000;
  id v148 = __Block_byref_object_copy__102;
  long long v149 = __Block_byref_object_dispose__102;
  id v150 = 0;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  BOOL v22 = [(SMSuggestionsManager *)self suggestionsHelper];
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __82__SMSuggestionsManager__shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke;
  v141[3] = &unk_1E6B905F0;
  id v143 = &v145;
  dispatch_semaphore_t v144 = &v153;
  BOOL v23 = v21;
  id v142 = v23;
  [v22 fetchMostLikelyReceiverHandlesWithHandler:v141];

  dsema = v23;
  __int16 v24 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v25 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v25)) {
    goto LABEL_34;
  }
  context = [MEMORY[0x1E4F1C9C8] now];
  [context timeIntervalSinceDate:v24];
  double v27 = v26;
  double v28 = objc_opt_new();
  double v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  id v30 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v31 = [v30 filteredArrayUsingPredicate:v29];
  double v32 = [v31 firstObject];

  [v28 submitToCoreAnalytics:v32 type:1 duration:v27];
  int v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  id v34 = (void *)MEMORY[0x1E4F28C58];
  v175[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v175 count:1];
  dispatch_semaphore_t v36 = [v34 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v35];

  if (v36)
  {
    id v37 = v36;
  }
  else
  {
LABEL_34:
    id v37 = 0;
  }

  id v45 = v37;
  id v46 = v45;
  if (v45 || (id v46 = (id)v154[5]) != 0)
  {
LABEL_37:
    v9[2](v9, 0, v46);
    goto LABEL_38;
  }
  float v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    uint64_t v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    BOOL v50 = (char *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = [(id)v146[5] count];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v49;
    __int16 v160 = 2112;
    v161 = v50;
    __int16 v162 = 2048;
    uint64_t v163 = v51;
    _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%@, %@, likelyReceivers count, %lu", buf, 0x20u);
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v113 = (id)v146[5];
  uint64_t v52 = [v113 countByEnumeratingWithState:&v137 objects:v170 count:16];
  if (!v52) {
    goto LABEL_53;
  }
  os_log_t oslog = *(os_log_t *)v138;
  while (2)
  {
    uint64_t v53 = 0;
    uint64_t v115 = v52;
    do
    {
      if (*(os_log_t *)v138 != oslog) {
        objc_enumerationMutation(v113);
      }
      id v54 = *(void **)(*((void *)&v137 + 1) + 8 * v53);
      contexta = (void *)MEMORY[0x1E016D870]();
      dispatch_time_t v55 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        id v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        id v57 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v58 = (char *)(id)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = [v54 primaryHandle];
        uint64_t v60 = [v8 primaryHandle];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v57;
        __int16 v160 = 2112;
        v161 = v58;
        __int16 v162 = 2112;
        uint64_t v163 = (uint64_t)v59;
        __int16 v164 = 2112;
        id v165 = v60;
        _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "%@, %@, likelyReceiver.primaryHandle, %@, receiver.primaryHandle, %@", buf, 0x2Au);
      }
      dispatch_time_t v61 = (void *)MEMORY[0x1E4F6E6D8];
      dispatch_time_t v62 = [v54 primaryHandle];
      double v63 = [v61 validateAndCleanupID:v62];
      id v64 = (void *)MEMORY[0x1E4F6E6D8];
      id v65 = [v8 primaryHandle];
      id v66 = [v64 validateAndCleanupID:v65];
      char v67 = [v63 isEqualToString:v66];

      if (v67)
      {

        uint64_t v72 = (id *)(v154 + 5);
        id v136 = (id)v154[5];
        [(SMSuggestionsManager *)self _refreshCurrentLocationWithError:&v136];
        objc_storeStrong(v72, v136);
        id v46 = (id)v154[5];
        id v45 = 0;
        if (v46) {
          goto LABEL_37;
        }
        dispatch_semaphore_t v73 = [MEMORY[0x1E4F1C9C8] date];
        char v74 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
        id v75 = (id *)(v154 + 5);
        id v135 = (id)v154[5];
        id v76 = [(SMSuggestionsManager *)self _getSunriseDateAtLocation:v74 date:v73 error:&v135];
        objc_storeStrong(v75, v135);

        if (v154[5])
        {
          ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0);
LABEL_91:

          id v45 = 0;
          goto LABEL_38;
        }
        id v77 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
        uint64_t v78 = (id *)(v154 + 5);
        id v134 = (id)v154[5];
        double v79 = [(SMSuggestionsManager *)self _getSunsetDateAtLocation:v77 date:v73 error:&v134];
        objc_storeStrong(v78, v134);

        if (v154[5])
        {
          ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0);
LABEL_90:

          goto LABEL_91;
        }
        if ([v79 compare:v73] == 1 && objc_msgSend(v73, "compare:", v76) == 1)
        {
          uint64_t v80 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            uint64_t v81 = (objc_class *)objc_opt_class();
            NSStringFromClass(v81);
            id contextc = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            dispatch_semaphore_t v130 = (char *)(id)objc_claimAutoreleasedReturnValue();
            aSelectorb = [MEMORY[0x1E4F1C9C8] date];
            id v82 = [aSelectorb stringFromDate];
            id v83 = [v76 stringFromDate];
            id v84 = [v79 stringFromDate];
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = contextc;
            __int16 v160 = 2112;
            v161 = v130;
            __int16 v162 = 2112;
            uint64_t v163 = (uint64_t)v82;
            __int16 v164 = 2112;
            id v165 = v83;
            __int16 v166 = 2112;
            id v167 = v84;
            _os_log_impl(&dword_1D9BFA000, v80, OS_LOG_TYPE_INFO, "%@, %@, time is not after sunset or before sunrise, current time, %@, sunrise time, %@, sunset time, %@", buf, 0x34u);
          }
          v9[2](v9, 0, 0);
          goto LABEL_90;
        }
        uint64_t v85 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
        uint64_t v86 = (id *)(v154 + 5);
        id v133 = (id)v154[5];
        contextb = [(SMSuggestionsManager *)self _getNPLOIsToHomeWithOnlyHighConfidence:0 location:v85 date:v73 error:&v133];
        objc_storeStrong(v86, v133);

        if (v154[5])
        {
          ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0);
        }
        else
        {
          if (![contextb count])
          {
            id v95 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
            {
              id v96 = (objc_class *)objc_opt_class();
              NSStringFromClass(v96);
              id v97 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              unint64_t v98 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v97;
              __int16 v160 = 2112;
              v161 = v98;
              _os_log_impl(&dword_1D9BFA000, v95, OS_LOG_TYPE_INFO, "%@, %@, no nplois to home", buf, 0x16u);
            }
            v9[2](v9, 0, (void *)v154[5]);
            goto LABEL_89;
          }
          os_log_t oslogb = [(SMSuggestionsManager *)self distanceCalculator];
          uint64_t v116 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
          long long v87 = [contextb firstObject];
          long long v88 = [v87 locationOfInterest];
          long long v89 = [v88 location];
          long long v90 = (id *)(v154 + 5);
          id v132 = (id)v154[5];
          [oslogb distanceFromLocation:v116 toLocation:v89 error:&v132];
          double v92 = v91;
          objc_storeStrong(v90, v132);

          uint64_t v93 = (id *)(v154 + 5);
          if (v154[5] || v92 == 1.79769313e308)
          {
            osloga = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(osloga, OS_LOG_TYPE_INFO))
            {
              __int16 v99 = (objc_class *)objc_opt_class();
              NSStringFromClass(v99);
              id v117 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              aSelectora = (char *)(id)objc_claimAutoreleasedReturnValue();
              if (v92 == 1.79769313e308)
              {
                uint64_t v114 = @"DBL_MAX";
              }
              else
              {
                [NSString stringWithFormat:@"%.3f", *(void *)&v92];
                uint64_t v114 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              id v104 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
              unint64_t v105 = [contextb firstObject];
              id v106 = [v105 locationOfInterest];
              id v107 = [v106 location];
              uint64_t v108 = v154[5];
              *(_DWORD *)buf = 138413570;
              *(void *)&uint8_t buf[4] = v117;
              __int16 v160 = 2112;
              v161 = aSelectora;
              __int16 v162 = 2112;
              uint64_t v163 = (uint64_t)v114;
              __int16 v164 = 2112;
              id v165 = v104;
              __int16 v166 = 2112;
              id v167 = v107;
              __int16 v168 = 2112;
              uint64_t v169 = v108;
              _os_log_impl(&dword_1D9BFA000, osloga, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, nploisToHome.firstObject.locationOfInterest.location, %@, error, %@", buf, 0x3Eu);

              if (v92 != 1.79769313e308) {
            }
              }
          }
          else
          {
            if (v92 > 500.0)
            {
              id v131 = 0;
              BOOL v94 = [(SMSuggestionsManager *)self _isFirstTimeUserOfZelkovaWithError:&v131];
              objc_storeStrong(v93, v131);
              if (v154[5])
              {
                ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0);
              }
              else
              {
                if (v94)
                {
                  __int16 v103 = 0;
                }
                else
                {
                  id v109 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v110 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v110);
                    id v111 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    id v112 = (char *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v111;
                    __int16 v160 = 2112;
                    v161 = v112;
                    _os_log_impl(&dword_1D9BFA000, v109, OS_LOG_TYPE_INFO, "%@, %@, originator has started a safety session before", buf, 0x16u);
                  }
                  __int16 v103 = (void *)v154[5];
                }
                v9[2](v9, v94, v103);
              }
              goto LABEL_89;
            }
            osloga = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(osloga, OS_LOG_TYPE_INFO))
            {
              id v100 = (objc_class *)objc_opt_class();
              NSStringFromClass(v100);
              id v101 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              uint64_t v102 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v101;
              __int16 v160 = 2112;
              v161 = v102;
              _os_log_impl(&dword_1D9BFA000, osloga, OS_LOG_TYPE_INFO, "%@, %@, originator seems to be at home", buf, 0x16u);
            }
          }

          v9[2](v9, 0, (void *)v154[5]);
        }
LABEL_89:

        goto LABEL_90;
      }
      ++v53;
    }
    while (v115 != v53);
    uint64_t v52 = [v113 countByEnumeratingWithState:&v137 objects:v170 count:16];
    if (v52) {
      continue;
    }
    break;
  }
LABEL_53:

  uint64_t v68 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    BOOL v69 = (objc_class *)objc_opt_class();
    NSStringFromClass(v69);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v71 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v70;
    __int16 v160 = 2112;
    v161 = v71;
    _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "%@, %@, receiver is not a likely receiver", buf, 0x16u);
  }
  v9[2](v9, 0, 0);
  id v45 = 0;
LABEL_38:

  _Block_object_dispose(&v145, 8);
LABEL_39:
  _Block_object_dispose(&v153, 8);

LABEL_40:
}

void __82__SMSuggestionsManager__shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"only supported on watchOS";
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  uint64_t v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = [v5 errorWithDomain:v6 code:1 userInfo:v9];
  (*((void (**)(id, void *))a4 + 2))(v8, v10);
}

- (BOOL)_didInteractInPastWithHandle:(id)a3 timeInterval:(double)a4 error:(id *)a5
{
  v176[1] = *MEMORY[0x1E4F143B8];
  id v125 = a3;
  if (v125)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromSelector(a2);
      id v10 = [v125 primaryHandle];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v163 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, handle, %@,", buf, 0x20u);
    }
    uint64_t v11 = [v125 primaryHandle];
    id v12 = IMSPIGetAllChatsContainingParticipantWithHandle();

    BOOL v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = (objc_class *)objc_opt_class();
      BOOL v15 = NSStringFromClass(v14);
      BOOL v16 = NSStringFromSelector(a2);
      uint64_t v17 = [v12 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t))v17;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, chats count, %lu", buf, 0x20u);
    }
    BOOL v18 = objc_opt_new();
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id obj = v12;
    uint64_t v19 = [obj countByEnumeratingWithState:&v158 objects:v175 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v159;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v159 != v20) {
            objc_enumerationMutation(obj);
          }
          BOOL v22 = *(void **)(*((void *)&v158 + 1) + 8 * i);
          BOOL v23 = (void *)MEMORY[0x1E016D870]();
          __int16 v24 = [v22 chatGUID];
          if (v24)
          {
            dispatch_time_t v25 = [v22 participants];
            BOOL v26 = [v25 count] == 1;

            if (v26)
            {
              double v27 = [v22 chatGUID];
              [v18 addObject:v27];
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v158 objects:v175 count:16];
      }
      while (v19);
    }

    double v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v108 = (objc_class *)objc_opt_class();
      id v109 = NSStringFromClass(v108);
      uint64_t v110 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v109;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v110;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t))v18;
      _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "%@, %@, chat guids, %@", buf, 0x20u);
    }
    id v132 = objc_opt_new();
    double v124 = objc_opt_new();
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v128 = v18;
    id v133 = (id)[v128 countByEnumeratingWithState:&v154 objects:v174 count:16];
    if (v133)
    {
      uint64_t v131 = *(void *)v155;
      uint64_t v126 = *MEMORY[0x1E4F5CFE8];
      uint64_t v127 = *MEMORY[0x1E4F28568];
      uint64_t v121 = *MEMORY[0x1E4F6BBB0];
LABEL_20:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v155 != v131) {
          objc_enumerationMutation(v128);
        }
        id v30 = (void *)MEMORY[0x1E016D870]();
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        uint64_t v163 = __Block_byref_object_copy__102;
        *(void *)__int16 v164 = __Block_byref_object_dispose__102;
        *(void *)&v164[8] = 0;
        dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
        id v32 = MEMORY[0x1E4F14428];
        uint64_t v148 = MEMORY[0x1E4F143A8];
        uint64_t v149 = 3221225472;
        id v150 = __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke;
        id v151 = &unk_1E6B995B0;
        uint64_t v153 = buf;
        long long v152 = v31;
        IMSPIQueryChatWithGuid();

        int v33 = v152;
        id v34 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v35 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v33, v35)) {
          goto LABEL_28;
        }
        dispatch_semaphore_t v36 = [MEMORY[0x1E4F1C9C8] now];
        [v36 timeIntervalSinceDate:v34];
        double v38 = v37;
        id v39 = objc_opt_new();
        dispatch_time_t v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
        double v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v42 = [v41 filteredArrayUsingPredicate:v40];
        id v43 = [v42 firstObject];

        [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
        id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)__int16 v168 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v168, 2u);
        }

        id v45 = (void *)MEMORY[0x1E4F28C58];
        v176[0] = v127;
        *(void *)__int16 v168 = @"semaphore wait timeout";
        id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v176 count:1];
        float v47 = [v45 errorWithDomain:v126 code:15 userInfo:v46];

        if (v47)
        {
          id v48 = v47;
        }
        else
        {
LABEL_28:
          id v48 = 0;
        }

        id v49 = (uint64_t (*)(uint64_t, uint64_t))v48;
        if (v49) {
          break;
        }
        if (*(void *)(*(void *)&buf[8] + 40) && (objc_msgSend(v132, "containsObject:") & 1) == 0)
        {
          [v132 addObject:*(void *)(*(void *)&buf[8] + 40)];
          [v124 addObject:v121];
        }

        _Block_object_dispose(buf, 8);
        if (v133 == (id)++v29)
        {
          id v133 = (id)[v128 countByEnumeratingWithState:&v154 objects:v174 count:16];
          if (v133) {
            goto LABEL_20;
          }
          goto LABEL_35;
        }
      }
      BOOL v50 = v49;

      _Block_object_dispose(buf, 8);

      if (!a5)
      {
        BOOL v51 = 0;
        goto LABEL_45;
      }
      uint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        uint64_t v114 = (objc_class *)objc_opt_class();
        uint64_t v115 = NSStringFromClass(v114);
        uint64_t v116 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v115;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v116;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v163 = v50;
        _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      uint64_t v53 = v50;
      char v54 = 0;
      *a5 = v53;
    }
    else
    {
LABEL_35:

      BOOL v50 = 0;
      BOOL v51 = a5 != 0;
LABEL_45:
      id v56 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        id v111 = (objc_class *)objc_opt_class();
        id v112 = NSStringFromClass(v111);
        id v113 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v112;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v113;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t))v124;
        *(_WORD *)__int16 v164 = 2112;
        *(void *)&v164[2] = v132;
        _os_log_debug_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_DEBUG, "%@, %@, services, %@, chat identifiers, %@", buf, 0x2Au);
      }
      *(void *)__int16 v168 = 0;
      uint64_t v169 = v168;
      uint64_t v170 = 0x3032000000;
      uint64_t v171 = __Block_byref_object_copy__102;
      uint64_t v172 = __Block_byref_object_dispose__102;
      id v173 = 0;
      dispatch_semaphore_t v57 = dispatch_semaphore_create(0);
      id v58 = [v132 allObjects];
      id v59 = MEMORY[0x1E4F14428];
      uint64_t v140 = MEMORY[0x1E4F143A8];
      uint64_t v141 = 3221225472;
      id v142 = __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke_260;
      id v143 = &unk_1E6B995D8;
      dispatch_semaphore_t v144 = self;
      uint64_t v146 = v168;
      SEL v147 = a2;
      uint64_t v60 = v57;
      uint64_t v145 = v60;
      char v61 = IMSPIQueryMessagesWithChatIdentifiersAndQOS();

      if ((v61 & 1) == 0) {
        dispatch_semaphore_signal(v60);
      }
      dsema = v60;
      dispatch_time_t v62 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v63 = dispatch_time(0, 3600000000000);
      id v64 = v50;
      if (dispatch_semaphore_wait(dsema, v63))
      {
        id v65 = [MEMORY[0x1E4F1C9C8] now];
        [v65 timeIntervalSinceDate:v62];
        double v67 = v66;
        uint64_t v68 = objc_opt_new();
        BOOL v69 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
        id v70 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v71 = [v70 filteredArrayUsingPredicate:v69];
        uint64_t v72 = [v71 firstObject];

        [v68 submitToCoreAnalytics:v72 type:1 duration:v67];
        dispatch_semaphore_t v73 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
        }

        char v74 = (void *)MEMORY[0x1E4F28C58];
        v176[0] = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        id v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v176 count:1];
        id v76 = [v74 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v75];

        id v64 = v50;
        if (v76)
        {
          id v64 = v76;
        }
      }

      uint64_t v129 = v64;
      if (v129) {
        BOOL v77 = v51;
      }
      else {
        BOOL v77 = 0;
      }
      if (v77)
      {
        uint64_t v78 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          id v117 = (objc_class *)objc_opt_class();
          NSStringFromClass(v117);
          id v118 = (id)objc_claimAutoreleasedReturnValue();
          id v119 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v118;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v119;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v163 = v129;
          _os_log_error_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        char v54 = 0;
        *a5 = v129;
      }
      else
      {
        double v79 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          uint64_t v80 = (objc_class *)objc_opt_class();
          NSStringFromClass(v80);
          id v81 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v82 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v83 = [*((id *)v169 + 5) count];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v81;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v82;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t))v83;
          _os_log_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_INFO, "%@, %@, messages count, %lu", buf, 0x20u);
        }
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v134 = *((id *)v169 + 5);
        uint64_t v84 = [v134 countByEnumeratingWithState:&v136 objects:v167 count:16];
        if (v84)
        {
          char v54 = 0;
          uint64_t v85 = *(void *)v137;
          while (2)
          {
            for (uint64_t j = 0; j != v84; ++j)
            {
              if (*(void *)v137 != v85) {
                objc_enumerationMutation(v134);
              }
              long long v87 = *(void **)(*((void *)&v136 + 1) + 8 * j);
              long long v88 = (void *)MEMORY[0x1E016D870]();
              long long v89 = [v87 date];
              BOOL v90 = v89 == 0;

              if (v90)
              {
                __int16 v103 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                {
                  id v104 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v104);
                  id v105 = (id)objc_claimAutoreleasedReturnValue();
                  id v106 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138413058;
                  *(void *)&uint8_t buf[4] = v105;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v106;
                  *(_WORD *)&buf[22] = 2112;
                  uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t))v125;
                  *(_WORD *)__int16 v164 = 2112;
                  *(void *)&v164[2] = v87;
                  _os_log_error_impl(&dword_1D9BFA000, v103, OS_LOG_TYPE_ERROR, "%@, %@, handle, %@, no message date for message, %@", buf, 0x2Au);
                }
                int v95 = 11;
              }
              else
              {
                double v91 = [MEMORY[0x1E4F1C9C8] now];
                double v92 = [v87 date];
                [v91 timeIntervalSinceDate:v92];
                double v94 = v93;

                int v95 = v94 <= a4 && v94 >= 0.0;
                id v96 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
                {
                  id v97 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v97);
                  id v98 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v99 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v100 = [v87 chatIdentifier];
                  id v101 = (void *)v100;
                  *(_DWORD *)buf = 138413570;
                  uint64_t v102 = @"NO";
                  if (v95) {
                    uint64_t v102 = @"YES";
                  }
                  *(void *)&uint8_t buf[4] = v98;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v99;
                  *(_WORD *)&buf[22] = 2112;
                  uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t))v125;
                  *(_WORD *)__int16 v164 = 2112;
                  *(void *)&v164[2] = v100;
                  *(_WORD *)&v164[10] = 2048;
                  *(double *)&v164[12] = v94;
                  __int16 v165 = 2112;
                  __int16 v166 = v102;
                  _os_log_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_INFO, "%@, %@, handle, %@, chat identifier, %@, timeIntervalSinceMessage, %f, didInteract, %@", buf, 0x3Eu);
                }
                v54 |= v95;
              }
              if (v95 != 11 && v95)
              {

                goto LABEL_87;
              }
            }
            uint64_t v84 = [v134 countByEnumeratingWithState:&v136 objects:v167 count:16];
            if (v84) {
              continue;
            }
            break;
          }
        }

        char v54 = 0;
      }
LABEL_87:

      _Block_object_dispose(v168, 8);
      uint64_t v53 = v129;
    }
  }
  else
  {
    dispatch_time_t v55 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"handle");
      char v54 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v54 = 0;
    }
  }

  return v54 & 1;
}

intptr_t __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 chatIdentifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke_260(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v9 = 138412802;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = [v4 count];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, fetched messages count, %lu", (uint8_t *)&v9, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_getValuesFromDefaultsIfExists:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"RTDefaultsSuggestionTimeIntervalBuffer"])
    {
      int v9 = [(SMSuggestionsManager *)self defaultsManager];
      uint64_t v10 = [v9 objectForKey:v8];

      __int16 v11 = 0;
      id v12 = &unk_1F3453A48;
    }
    else if ([v8 isEqualToString:@"RTDefaultsSuggestionRegularUserSuppressionSessionConfigurationCount"])
    {
      uint64_t v15 = [(SMSuggestionsManager *)self defaultsManager];
      uint64_t v10 = [v15 objectForKey:v8];

      __int16 v11 = 0;
      id v12 = &unk_1F34519F8;
    }
    else if ([v8 isEqualToString:@"RTDefaultsSuggestionOccasionalUserSuppressionSessionConfigurationCount"])
    {
      BOOL v16 = [(SMSuggestionsManager *)self defaultsManager];
      uint64_t v10 = [v16 objectForKey:v8];

      __int16 v11 = 0;
      id v12 = &unk_1F3451A10;
    }
    else
    {
      if (![v8 isEqualToString:@"RTDefaultsSuggestionBoundingBoxRadius"]
        && ![v8 isEqualToString:@"RTDefaultsSuggestionDestinationSimilarityRadiusToSessionConfiguration"])
      {
        if ([v8 isEqualToString:@"RTDefaultsSuggestionNotificationExpirationTimeInterval"]|| objc_msgSend(v8, "isEqualToString:", @"RTDefaultsSuggestionShowTriggerTypeAsFooter")|| objc_msgSend(v8, "isEqualToString:", @"RTDefaultsSuggestionDisplayedCount"))
        {
          uint64_t v19 = [(SMSuggestionsManager *)self defaultsManager];
          uint64_t v14 = [v19 objectForKey:v8];

          __int16 v11 = 0;
        }
        else
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v21 = *MEMORY[0x1E4F5CFE8];
          uint64_t v29 = *MEMORY[0x1E4F28568];
          BOOL v22 = NSString;
          BOOL v23 = (objc_class *)objc_opt_class();
          __int16 v24 = NSStringFromClass(v23);
          dispatch_time_t v25 = NSStringFromSelector(a2);
          BOOL v26 = [v22 stringWithFormat:@"%@, %@, string, %@, not found", v24, v25, v8];
          v30[0] = v26;
          double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
          __int16 v11 = [v20 errorWithDomain:v21 code:7 userInfo:v27];

          uint64_t v14 = 0;
        }
        goto LABEL_19;
      }
      uint64_t v17 = [(SMSuggestionsManager *)self defaultsManager];
      uint64_t v10 = [v17 objectForKey:v8];

      __int16 v11 = 0;
      id v12 = &unk_1F3453A58;
    }
    if (v10) {
      uint64_t v14 = (void *)v10;
    }
    else {
      uint64_t v14 = v12;
    }
LABEL_19:
    if (a4) {
      *a4 = v11;
    }

    goto LABEL_22;
  }
  __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: string", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"string");
    uint64_t v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_22:

  return v14;
}

- (BOOL)isZelkovaSuggestionsFeatureEnabledWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl()) {
    return 1;
  }
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    BOOL v16 = NSStringFromClass(v15);
    uint64_t v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    BOOL v23 = v17;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F5CFE8];
  uint64_t v18 = *MEMORY[0x1E4F28568];
  int v9 = NSString;
  if (_os_feature_enabled_impl()) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (_os_feature_enabled_impl()) {
    __int16 v11 = @"YES";
  }
  else {
    __int16 v11 = @"NO";
  }
  id v12 = [v9 stringWithFormat:@"Feature not enabled, is Zelkova enabled, %@, is Zelkova_Suggestions enabled, %@", v10, v11, v18];
  uint64_t v19 = v12;
  __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  uint64_t v14 = [v7 errorWithDomain:v8 code:7 userInfo:v13];

  if (a3) {
    *a3 = v14;
  }

  return 0;
}

- (unint64_t)_getSuggestionTriggerFromContext:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 type] == 3)
      {
        unint64_t v7 = 1;
        if (!a4) {
          goto LABEL_31;
        }
        goto LABEL_29;
      }
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      __int16 v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      __int16 v13 = NSStringFromSelector(a2);
      uint64_t v14 = [MEMORY[0x1E4F5CFC8] stringFromVisitIncidentType:[v6 type]];
      uint64_t v15 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:0];
      int v19 = 138413058;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      __int16 v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      BOOL v26 = v15;
      BOOL v16 = "%@, %@, visit type, %@, returning suggestionTrigger, %@";
LABEL_22:
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v19, 0x2Au);

LABEL_23:
      unint64_t v7 = 0;
      if (!a4) {
        goto LABEL_31;
      }
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 vehicleConnectedState] == 2)
      {
        unint64_t v7 = 2;
        if (!a4) {
          goto LABEL_31;
        }
        goto LABEL_29;
      }
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      uint64_t v17 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v17);
      __int16 v13 = NSStringFromSelector(a2);
      uint64_t v14 = +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:](RTMotionActivityManager, "motionActivityVehicleConnectedStateToString:", [v6 vehicleConnectedState]);
      uint64_t v15 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:0];
      int v19 = 138413058;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      __int16 v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      BOOL v26 = v15;
      BOOL v16 = "%@, %@, vehicle connection state, %@, returning suggestionTrigger, %@";
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = 3;
      if (!a4) {
        goto LABEL_31;
      }
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = 4;
    }
    else {
      unint64_t v7 = 0;
    }
    if (a4)
    {
LABEL_29:
      id v9 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", (uint8_t *)&v19, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"context");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v7 = 0;
LABEL_30:
      *a4 = v9;
      goto LABEL_31;
    }
    unint64_t v7 = 0;
  }
LABEL_31:

  return v7;
}

- (id)_getSourceLocationFromContext:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 type] == 3)
    {
      uint64_t v8 = [v7 location];
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = (objc_class *)objc_opt_class();
        __int16 v11 = NSStringFromClass(v10);
        id v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v21 = v11;
        __int16 v22 = 2112;
        __int16 v23 = v12;
        __int16 v24 = 2112;
        __int16 v25 = v8;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, source location is set to visit exit location, %@", buf, 0x20u);
      }
      id v13 = 0;
    }
    else
    {
      id v19 = 0;
      [(SMSuggestionsManager *)self _refreshCurrentLocationWithError:&v19];
      id v13 = v19;
      uint64_t v8 = [(SMSuggestionsManager *)self latestLocationOfTheDevice];
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        BOOL v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v21 = v15;
        __int16 v22 = 2112;
        __int16 v23 = v16;
        __int16 v24 = 2112;
        __int16 v25 = v8;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, source location is set to latest location of the device, %@", buf, 0x20u);
      }
    }

    if (a4) {
      *a4 = v13;
    }
  }
  else
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"context");
      uint64_t v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (id)_getCurrentDateFromContext:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 type] == 3)
    {
      id v7 = [v6 date];
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        __int16 v11 = NSStringFromSelector(a2);
        id v12 = [v7 stringFromDate];
        int v18 = 138412802;
        id v19 = v10;
        __int16 v20 = 2112;
        __int16 v21 = v11;
        __int16 v22 = 2112;
        __int16 v23 = v12;
        id v13 = "%@, %@, current date is set to visit exit date, %@";
LABEL_8:
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, 0x20u);
      }
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v14);
        __int16 v11 = NSStringFromSelector(a2);
        id v12 = [v7 stringFromDate];
        int v18 = 138412802;
        id v19 = v10;
        __int16 v20 = 2112;
        __int16 v21 = v11;
        __int16 v22 = 2112;
        __int16 v23 = v12;
        id v13 = "%@, %@, current date is set to present date of the device, %@";
        goto LABEL_8;
      }
    }

    if (!a4) {
      goto LABEL_16;
    }
    id v15 = 0;
    goto LABEL_15;
  }
  BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v18) = 0;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", (uint8_t *)&v18, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"context");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = 0;
LABEL_15:
    *a4 = v15;
    goto LABEL_16;
  }
  id v7 = 0;
LABEL_16:

  return v7;
}

- (BOOL)_isUserInActiveSessionWithError:(id *)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F99998]);
  uint64_t v6 = [v5 initWithBatchSize:*MEMORY[0x1E4F99C10] fetchLimit:1 sortByCreationDate:1 ascending:0 dateInterval:0];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  dispatch_time_t v62 = __Block_byref_object_copy__102;
  dispatch_time_t v63 = __Block_byref_object_dispose__102;
  id v64 = 0;
  uint64_t v53 = 0;
  char v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = __Block_byref_object_copy__102;
  dispatch_semaphore_t v57 = __Block_byref_object_dispose__102;
  id v58 = 0;
  uint64_t v8 = [(SMSuggestionsManager *)self sessionStore];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __56__SMSuggestionsManager__isUserInActiveSessionWithError___block_invoke;
  v49[3] = &unk_1E6B905F0;
  BOOL v51 = &v59;
  uint64_t v52 = &v53;
  id v9 = v7;
  BOOL v50 = v9;
  [v8 fetchSessionManagerStatesWithOptions:v6 handler:v49];
  id v48 = (void *)v6;

  uint64_t v10 = v9;
  __int16 v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_6;
  }
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  BOOL v16 = objc_opt_new();
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  int v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v19 = [v18 filteredArrayUsingPredicate:v17];
  __int16 v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  __int16 v22 = (void *)MEMORY[0x1E4F28C58];
  v72[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v72 count:1];
  uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;
  }
  else
  {
LABEL_6:
    id v25 = 0;
  }

  uint64_t v26 = (__CFString *)v25;
  uint64_t v27 = v26;
  if (a3 && v26)
  {
    double v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      double v42 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v41;
      __int16 v66 = 2112;
      id v67 = v42;
      __int16 v68 = 2112;
      BOOL v69 = v27;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    uint64_t v29 = v27;
LABEL_17:
    *a3 = v29;
    char v31 = 1;
    goto LABEL_25;
  }
  if (a3 && v54[5])
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      id v45 = NSStringFromSelector(a2);
      id v46 = (__CFString *)v54[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v44;
      __int16 v66 = 2112;
      id v67 = v45;
      __int16 v68 = 2112;
      BOOL v69 = v46;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    uint64_t v29 = (__CFString *)v54[5];
    goto LABEL_17;
  }
  id v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    int v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    int v36 = [(id)v60[5] isActiveState];
    double v37 = @"NO";
    uint64_t v38 = v60[5];
    if (v36) {
      double v37 = @"YES";
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v34;
    __int16 v66 = 2112;
    id v67 = v35;
    __int16 v68 = 2112;
    BOOL v69 = v37;
    __int16 v70 = 2112;
    uint64_t v71 = v38;
    _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, %@, isUserInActiveSession, %@, recent session state, %@", buf, 0x2Au);
  }
  if (a3) {
    *a3 = (id) v54[5];
  }
  char v31 = [(id)v60[5] isActiveState];
LABEL_25:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  return v31;
}

void __56__SMSuggestionsManager__isUserInActiveSessionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isFirstTimeUserOfZelkovaWithError:(id *)a3
{
  v73[1] = *MEMORY[0x1E4F143B8];
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x3032000000;
  dispatch_time_t v63 = __Block_byref_object_copy__102;
  id v64 = __Block_byref_object_dispose__102;
  id v65 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000;
  dispatch_semaphore_t v57 = __Block_byref_object_copy__102;
  id v58 = __Block_byref_object_dispose__102;
  id v59 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F99998]);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = [(SMSuggestionsManager *)self sessionStore];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __59__SMSuggestionsManager__isFirstTimeUserOfZelkovaWithError___block_invoke;
  v50[3] = &unk_1E6B905F0;
  uint64_t v52 = &v60;
  uint64_t v53 = &v54;
  uint64_t v8 = v6;
  BOOL v51 = v8;
  [v7 fetchSessionManagerStatesWithOptions:v5 handler:v50];
  id v49 = v5;

  uint64_t v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v9, v11)) {
    goto LABEL_6;
  }
  dispatch_time_t v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceDate:v10];
  double v14 = v13;
  double v15 = objc_opt_new();
  BOOL v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v18 = [v17 filteredArrayUsingPredicate:v16];
  id v19 = [v18 firstObject];

  [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
  __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  __int16 v21 = (void *)MEMORY[0x1E4F28C58];
  v73[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v73 count:1];
  __int16 v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

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
  uint64_t v26 = v25;
  if (a3 && v25)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      id v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v42;
      __int16 v67 = 2112;
      id v68 = v43;
      __int16 v69 = 2112;
      uint64_t v70 = (uint64_t)v26;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    LOBYTE(v27) = 0;
    double v28 = v26;
    goto LABEL_26;
  }
  if (a3 && v55[5])
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      id v46 = NSStringFromSelector(a2);
      uint64_t v47 = v55[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v45;
      __int16 v67 = 2112;
      id v68 = v46;
      __int16 v69 = 2112;
      uint64_t v70 = v47;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    LOBYTE(v27) = 0;
LABEL_25:
    double v28 = (void *)v55[5];
LABEL_26:
    *a3 = v28;
    goto LABEL_27;
  }
  uint64_t v29 = (void *)v61[5];
  id v30 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_80];
  uint64_t v31 = [v29 filteredArrayUsingPredicate:v30];
  id v32 = (void *)v61[5];
  v61[5] = v31;

  int v33 = (void *)v61[5];
  if (v33) {
    LODWORD(v27) = [v33 count] == 0;
  }
  else {
    LODWORD(v27) = 1;
  }
  id v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    id v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [(id)v61[5] count];
    id v39 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v36;
    __int16 v67 = 2112;
    if (v27) {
      id v39 = @"YES";
    }
    id v68 = v37;
    __int16 v69 = 2048;
    uint64_t v70 = v38;
    __int16 v71 = 2112;
    uint64_t v72 = v39;
    _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, %@, active session states count, %lu, result, %@", buf, 0x2Au);
  }
  if (a3) {
    goto LABEL_25;
  }
LABEL_27:

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return (char)v27;
}

void __59__SMSuggestionsManager__isFirstTimeUserOfZelkovaWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __59__SMSuggestionsManager__isFirstTimeUserOfZelkovaWithError___block_invoke_287(uint64_t a1, void *a2)
{
  return [a2 isActiveState];
}

- (id)_getSuggestionTitleWithHandle:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v32 = [MEMORY[0x1E4F99908] getSuggestionTitleWithoutContactName];
    goto LABEL_26;
  }
  aSelector = a2;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  id v64 = __Block_byref_object_copy__102;
  id v65 = __Block_byref_object_dispose__102;
  id v66 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__102;
  id v59 = __Block_byref_object_dispose__102;
  id v60 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [(SMSuggestionsManager *)self contactsManager];
  uint64_t v10 = [v7 primaryHandle];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __60__SMSuggestionsManager__getSuggestionTitleWithHandle_error___block_invoke;
  v51[3] = &unk_1E6B905F0;
  uint64_t v53 = &v61;
  uint64_t v54 = &v55;
  id v11 = v8;
  uint64_t v52 = v11;
  [v9 fetchContactsFromEmailOrPhoneNumberString:v10 handler:v51];

  id v12 = v11;
  double v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_7;
  }
  double v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  int v18 = objc_opt_new();
  id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  __int16 v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v21 = [v20 filteredArrayUsingPredicate:v19];
  __int16 v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  id v24 = (void *)MEMORY[0x1E4F28C58];
  v72[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v72 count:1];
  uint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

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
  uint64_t v29 = v28;
  if (a4 && v28)
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      id v45 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v44;
      __int16 v68 = 2112;
      __int16 v69 = v45;
      __int16 v70 = 2112;
      __int16 v71 = v29;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v31 = v29;
  }
  else
  {
    if (!a4 || !v56[5])
    {
      if ([(id)v62[5] count])
      {
        id v34 = [MEMORY[0x1E4F28F30] sharedNameComponents];
        id v35 = [(id)v62[5] firstObject];
        id v36 = [v35 givenName];
        [v34 setGivenName:v36];

        id v37 = [(id)v62[5] firstObject];
        uint64_t v38 = [v37 familyName];
        [v34 setFamilyName:v38];

        id v39 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v34 style:1 options:0];
        if ([v39 length])
        {
          id v32 = [MEMORY[0x1E4F99908] getSuggestionTitleWithContactName:v39];

          goto LABEL_25;
        }
      }
      dispatch_time_t v40 = (void *)MEMORY[0x1E4F99908];
      id v41 = [v7 primaryHandle];
      id v32 = [v40 getSuggestionTitleWithContactName:v41];

      goto LABEL_25;
    }
    int v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      id v48 = NSStringFromSelector(aSelector);
      id v49 = (void *)v56[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v47;
      __int16 v68 = 2112;
      __int16 v69 = v48;
      __int16 v70 = 2112;
      __int16 v71 = v49;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v31 = (id) v56[5];
  }
  id v32 = 0;
  *a4 = v31;
LABEL_25:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

LABEL_26:

  return v32;
}

void __60__SMSuggestionsManager__getSuggestionTitleWithHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getSuggestionBodyWithPlaceInference:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F99908];
  id v4 = [a3 preferredName];
  id v5 = [v3 getSuggestionBodyWithPlaceInference:v4];

  return v5;
}

- (id)_getSuggestionsFooter:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v5 = [(SMSuggestionsManager *)self _getValuesFromDefaultsIfExists:@"RTDefaultsSuggestionShowTriggerTypeAsFooter" error:&v14];
  id v6 = v5;
  if (v5 && ((uint64_t v7 = v14, [v5 unsignedIntValue] == 1) ? (v8 = v7 == 0) : (v8 = 0), v8))
  {
    uint64_t v10 = NSString;
    id v11 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionTrigger:[v4 suggestionTrigger]];
    id v12 = [MEMORY[0x1E4F999B8] stringFromSMSuggestionUserType:[v4 suggestionUserType]];
    uint64_t v9 = [v10 stringWithFormat:@"Trigger: %@, User: %@", v11, v12];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F99908] getSuggestionFooter];
  }

  return v9;
}

- (BOOL)_checkInitiatorEligibilityWithError:(id *)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  BOOL v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__102;
  id v47 = __Block_byref_object_dispose__102;
  id v48 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.CoreRoutine.SuggestionsManager.InitiatorEligibilityChecker", 0);
  id v6 = [(SMSuggestionsManager *)self authorizationManager];
  uint64_t v7 = [(SMSuggestionsManager *)self messagingService];
  BOOL v8 = [v7 effectivePairedDevice];
  uint64_t v9 = [(SMSuggestionsManager *)self defaultsManager];
  uint64_t v10 = [(SMSuggestionsManager *)self platform];
  id v11 = [(SMSuggestionsManager *)self appDeletionManager];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __60__SMSuggestionsManager__checkInitiatorEligibilityWithError___block_invoke;
  v39[3] = &unk_1E6B99620;
  id v41 = &v49;
  id v42 = &v43;
  id v12 = v4;
  dispatch_time_t v40 = v12;
  +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:v5 authorizationManager:v6 effectivePairedDevice:v8 isHandoff:0 defaultsManager:v9 platform:v10 appDeletionManager:v11 handler:v39];

  double v13 = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    double v16 = [MEMORY[0x1E4F1C9C8] now];
    [v16 timeIntervalSinceDate:v14];
    double v18 = v17;
    id v19 = objc_opt_new();
    __int16 v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    __int16 v21 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v22 = [v21 filteredArrayUsingPredicate:v20];
    __int16 v23 = [v22 firstObject];

    [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    id v25 = (void *)MEMORY[0x1E4F28C58];
    v58[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v58 count:1];
    id v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

    if (v27)
    {
      id v27 = v27;
    }
  }
  else
  {
    id v27 = 0;
  }

  id v28 = v27;
  uint64_t v29 = v28;
  if (a3 && v28)
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      id v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v54 = 2112;
      uint64_t v55 = v36;
      __int16 v56 = 2112;
      uint64_t v57 = v29;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v31 = v29;
    goto LABEL_14;
  }
  if (a3)
  {
    id v31 = (void *)v44[5];
LABEL_14:
    *a3 = v31;
  }
  BOOL v32 = *((unsigned char *)v50 + 24) != 0;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  return v32;
}

void __60__SMSuggestionsManager__checkInitiatorEligibilityWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_checkReceiverEligibilityForHandle:(id)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    aSelector = a2;
    uint64_t v49 = 0;
    BOOL v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    id v8 = self;
    *(void *)uint64_t v43 = 0;
    id v44 = v43;
    uint64_t v45 = 0x3032000000;
    id v46 = __Block_byref_object_copy__102;
    id v47 = __Block_byref_object_dispose__102;
    id v48 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v10 = [(SMSuggestionsManager *)v8 eligibilityChecker];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __65__SMSuggestionsManager__checkReceiverEligibilityForHandle_error___block_invoke;
    v39[3] = &unk_1E6B99648;
    id v41 = &v49;
    id v11 = v9;
    dispatch_time_t v40 = v11;
    id v42 = v43;
    [v10 checkReceiverEligibility:v7 handler:v39];

    id v12 = v11;
    double v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14)) {
      goto LABEL_7;
    }
    dispatch_time_t v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    double v18 = objc_opt_new();
    id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    __int16 v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v21 = [v20 filteredArrayUsingPredicate:v19];
    __int16 v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    v58[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v58 count:1];
    uint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

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
    uint64_t v29 = v28;
    if (a4 && v28)
    {
      id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        id v37 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v54 = 2112;
        uint64_t v55 = v37;
        __int16 v56 = 2112;
        uint64_t v57 = v29;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v31 = v29;
    }
    else
    {
      if (!a4)
      {
LABEL_20:
        BOOL v33 = *((unsigned char *)v50 + 24) != 0;

        _Block_object_dispose(v43, 8);
        _Block_object_dispose(&v49, 8);
        goto LABEL_21;
      }
      id v31 = (void *)*((void *)v44 + 5);
    }
    *a4 = v31;
    goto LABEL_20;
  }
  BOOL v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v43 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", v43, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"handle");
    BOOL v33 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v33 = 0;
  }
LABEL_21:

  return v33;
}

void __65__SMSuggestionsManager__checkReceiverEligibilityForHandle_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2 == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_getFirstEligibleHandleFromSessionConfigurations:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionConfigurations", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"sessionConfigurations");
      id v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v27 = 0;
    }
    goto LABEL_26;
  }
  id v6 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  id v34 = v6;
  if (!v7)
  {
    id v25 = 0;
    id v24 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  id v31 = a4;
  id v32 = v5;
  uint64_t v9 = *(void *)v38;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      id v12 = (void *)MEMORY[0x1E016D870]();
      double v13 = [v11 conversation];
      dispatch_time_t v14 = [v13 receiverHandles];
      unint64_t v15 = [v14 count];

      if (v15 <= 1)
      {
        double v16 = [v11 conversation];
        double v17 = [v16 receiverHandles];
        double v18 = [v17 firstObject];
        char v19 = [v6 containsObject:v18];

        if ((v19 & 1) == 0)
        {
          __int16 v20 = [v11 conversation];
          __int16 v21 = [v20 receiverHandles];
          __int16 v22 = [v21 firstObject];
          id v36 = 0;
          BOOL v23 = [(SMSuggestionsManager *)self _checkReceiverEligibilityForHandle:v22 error:&v36];
          id v24 = v36;

          if (v23)
          {
            id v28 = [v11 conversation];
            uint64_t v29 = [v28 receiverHandles];
            id v25 = [v29 firstObject];
          }
          else
          {
            id v6 = v34;
            if (!v24) {
              goto LABEL_11;
            }
            id v25 = 0;
          }
          goto LABEL_22;
        }
      }
LABEL_11:
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  id v25 = 0;
  id v24 = 0;
LABEL_22:
  a4 = v31;
  id v5 = v32;
LABEL_23:

  if (a4) {
    *a4 = v24;
  }
  id v27 = v25;

LABEL_26:

  return v27;
}

- (id)_getMessagesURLFromSessionConfig:(id)a3 payloadType:(int64_t)a4 error:(id *)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    aSelector = a2;
    uint64_t v9 = [v7 conversation];
    if (!v9) {
      goto LABEL_5;
    }
    uint64_t v10 = [v8 conversation];
    id v11 = [v10 receiverHandles];
    id v12 = [v11 firstObject];
    if (v12)
    {
      double v13 = [v8 conversation];
      dispatch_time_t v14 = [v13 receiverHandles];
      unint64_t v15 = [v14 firstObject];
      double v16 = [v15 primaryHandle];

      if (v16)
      {
LABEL_5:
        id v84 = 0;
        id v76 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v84];
        double v17 = (uint64_t (*)(uint64_t, uint64_t))v84;
        double v18 = v17;
        if (a5 && v17)
        {
          char v19 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            __int16 v68 = (objc_class *)objc_opt_class();
            __int16 v69 = NSStringFromClass(v68);
            __int16 v70 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v69;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v70;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v86 = v18;
            _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
          }
          __int16 v20 = 0;
          *a5 = v18;
        }
        else
        {
          char v74 = [v76 base64EncodedStringWithOptions:0];
          __int16 v22 = [v8 conversation];
          BOOL v23 = [v22 receiverHandles];
          id v24 = [v23 firstObject];
          dispatch_semaphore_t v73 = [v24 primaryHandle];

          if ([v8 sessionType] != 4) {
            goto LABEL_22;
          }
          if (![v8 sessionWorkoutType]) {
            goto LABEL_22;
          }
          id v25 = [v8 conversation];
          uint64_t v26 = [v25 receiverHandles];
          id v27 = [v26 firstObject];
          id v28 = [v27 primaryHandle];
          BOOL v29 = v28 == 0;

          if (!v29)
          {
            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            uint64_t v86 = __Block_byref_object_copy__102;
            long long v87 = __Block_byref_object_dispose__102;
            id v88 = 0;
            v82[0] = 0;
            v82[1] = v82;
            v82[2] = 0x3032000000;
            v82[3] = __Block_byref_object_copy__102;
            v82[4] = __Block_byref_object_dispose__102;
            id v83 = 0;
            dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
            id v31 = [(SMSuggestionsManager *)self contactsManager];
            id v32 = [v8 conversation];
            BOOL v33 = [v32 receiverHandles];
            id v34 = [v33 firstObject];
            id v35 = [v34 primaryHandle];
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = __75__SMSuggestionsManager__getMessagesURLFromSessionConfig_payloadType_error___block_invoke;
            v78[3] = &unk_1E6B905F0;
            uint64_t v80 = buf;
            id v81 = v82;
            id v36 = v30;
            double v79 = v36;
            [v31 fetchContactsFromEmailOrPhoneNumberString:v35 handler:v78];

            long long v37 = v36;
            long long v38 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v39 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(v37, v39))
            {
              long long v40 = [MEMORY[0x1E4F1C9C8] now];
              [v40 timeIntervalSinceDate:v38];
              double v42 = v41;
              __int16 v71 = objc_opt_new();
              uint64_t v72 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
              uint64_t v43 = [MEMORY[0x1E4F29060] callStackSymbols];
              id v44 = [v43 filteredArrayUsingPredicate:v72];
              uint64_t v45 = [v44 firstObject];

              [v71 submitToCoreAnalytics:v45 type:1 duration:v42];
              id v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)double v92 = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v92, 2u);
              }

              id v47 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v91 = *MEMORY[0x1E4F28568];
              *(void *)double v92 = @"semaphore wait timeout";
              id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
              id v49 = [v47 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v48];

              if (v49)
              {
                id v49 = v49;
              }
            }
            else
            {
              id v49 = 0;
            }

            id v66 = v49;
            if ([*(id *)(*(void *)&buf[8] + 40) count])
            {
              __int16 v67 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
              BOOL v50 = [v67 givenName];
            }
            else
            {
              BOOL v50 = 0;
            }

            _Block_object_dispose(v82, 8);
            _Block_object_dispose(buf, 8);
          }
          else
          {
LABEL_22:
            BOOL v50 = 0;
          }
          if ([v8 sessionType] == 4) {
            uint64_t v51 = 8;
          }
          else {
            uint64_t v51 = 2;
          }
          __int16 v20 = [MEMORY[0x1E4F99848] createURLForSuggestionsWithRecipientHandle:v73 appPayloadDataString:v74 givenName:v50 payloadType:2 sessionStartEntryType:v51];
          char v52 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            uint64_t v53 = (objc_class *)objc_opt_class();
            __int16 v54 = NSStringFromClass(v53);
            uint64_t v55 = NSStringFromSelector(aSelector);
            __int16 v56 = [v20 absoluteString];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v54;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v55;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v86 = v56;
            _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, url, %@", buf, 0x20u);
          }
          if (a5) {
            *a5 = 0;
          }
        }
        id v57 = 0;
        goto LABEL_37;
      }
    }
    else
    {
    }
    id v58 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v89 = *MEMORY[0x1E4F28568];
    id v59 = NSString;
    id v60 = [v8 conversation];
    uint64_t v61 = [v60 receiverHandles];
    uint64_t v62 = [v61 firstObject];
    uint64_t v63 = [v59 stringWithFormat:@"config has invalid handle information, %@", v62];
    BOOL v90 = v63;
    id v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    id v57 = [v58 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v64];

    if (a5)
    {
      id v57 = v57;
      __int16 v20 = 0;
      *a5 = v57;
    }
    else
    {
      __int16 v20 = 0;
    }
LABEL_37:

    goto LABEL_38;
  }
  __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionConfig", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"sessionConfig");
    __int16 v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v20 = 0;
  }
LABEL_38:

  return v20;
}

void __75__SMSuggestionsManager__getMessagesURLFromSessionConfig_payloadType_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getSessionConfigurationsWithOptions:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    aSelector = a2;
    uint64_t v54 = 0;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x3032000000;
    id v57 = __Block_byref_object_copy__102;
    id v58 = __Block_byref_object_dispose__102;
    id v59 = 0;
    uint64_t v48 = 0;
    id v49 = &v48;
    uint64_t v50 = 0x3032000000;
    uint64_t v51 = __Block_byref_object_copy__102;
    char v52 = __Block_byref_object_dispose__102;
    id v53 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = [(SMSuggestionsManager *)self suggestionsHelper];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __67__SMSuggestionsManager__getSessionConfigurationsWithOptions_error___block_invoke;
    v44[3] = &unk_1E6B905F0;
    id v46 = &v54;
    id v47 = &v48;
    uint64_t v10 = v8;
    uint64_t v45 = v10;
    [v9 getSessionConfigurationsWithOptions:v7 handler:v44];

    id v11 = v10;
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13)) {
      goto LABEL_7;
    }
    dispatch_time_t v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;
    double v17 = objc_opt_new();
    double v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
    char v19 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v20 = [v19 filteredArrayUsingPredicate:v18];
    __int16 v21 = [v20 firstObject];

    [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    BOOL v23 = (void *)MEMORY[0x1E4F28C58];
    v71[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v71 count:1];
    id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

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
    id v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      BOOL v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [(id)v55[5] count];
      uint64_t v33 = v55[5];
      uint64_t v34 = v49[5];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v30;
      __int16 v61 = 2112;
      id v62 = v31;
      __int16 v63 = 2112;
      id v64 = v7;
      __int16 v65 = 2048;
      uint64_t v66 = v32;
      __int16 v67 = 2112;
      uint64_t v68 = v33;
      __int16 v69 = 2112;
      uint64_t v70 = v34;
      _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, options, %@, session configurations count, %lu, fetched session configurations, %@, fetch error, %@", buf, 0x3Eu);
    }
    if (a4 && v27)
    {
      id v35 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        long long v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        double v42 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v41;
        __int16 v61 = 2112;
        id v62 = v42;
        __int16 v63 = 2112;
        id v64 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      *a4 = v27;
      id v36 = [MEMORY[0x1E4F1C978] array];
    }
    else
    {
      if (a4) {
        *a4 = (id) v49[5];
      }
      id v36 = (id)v55[5];
    }
    long long v38 = v36;

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v54, 8);
  }
  else
  {
    long long v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsManager _getSessionConfigurationsWithOptions:error:]";
      __int16 v61 = 1024;
      LODWORD(v62) = 4572;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    long long v38 = [MEMORY[0x1E4F1C978] array];
  }

  return v38;
}

void __67__SMSuggestionsManager__getSessionConfigurationsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_refreshCurrentLocationWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  dispatch_time_t v39 = (id *)&v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__102;
  double v42 = __Block_byref_object_dispose__102;
  id v43 = 0;
  context = (void *)MEMORY[0x1E016D870](self, a2);
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__102;
  id v36 = __Block_byref_object_dispose__102;
  id v37 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(SMSuggestionsManager *)self suggestionsHelper];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__SMSuggestionsManager__refreshCurrentLocationWithError___block_invoke;
  v28[3] = &unk_1E6B99670;
  id v30 = &v38;
  id v31 = &v32;
  uint64_t v7 = v5;
  BOOL v29 = v7;
  [v6 refreshCurrentLocationWithHandler:v28];

  dispatch_semaphore_t v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  dispatch_time_t v14 = objc_opt_new();
  double v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  double v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v17 = [v16 filteredArrayUsingPredicate:v15];
  double v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  char v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  __int16 v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v44 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v44 count:1];
  __int16 v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

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
  [(SMSuggestionsManager *)self setLatestLocationOfTheDevice:v33[5]];

  _Block_object_dispose(&v32, 8);
  if (v24) {
    objc_storeStrong(v39 + 5, v23);
  }
  if (a3) {
    *a3 = v39[5];
  }
  BOOL v25 = v39[5] == 0;

  _Block_object_dispose(&v38, 8);
  return v25;
}

void __57__SMSuggestionsManager__refreshCurrentLocationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getNPLOIsToHomeWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  id v8 = [(SMSuggestionsManager *)self _getNPLOIsWithOnlyHighConfidence:a3 location:a4 date:a5 error:&v20];
  id v9 = v20;
  dispatch_time_t v10 = v9;
  if (a6 && v9)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v17 = (objc_class *)objc_opt_class();
      double v18 = NSStringFromClass(v17);
      char v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v22 = v18;
      __int16 v23 = 2112;
      id v24 = v19;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    *a6 = v10;
    id v12 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    double v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_313];
    dispatch_time_t v14 = [v8 filteredArrayUsingPredicate:v13];

    if (a6) {
      *a6 = v10;
    }
    id v12 = v14;
    id v8 = v12;
  }
  double v15 = v12;

  return v15;
}

BOOL __83__SMSuggestionsManager__getNPLOIsToHomeWithOnlyHighConfidence_location_date_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 locationOfInterest];
  BOOL v3 = [v2 type] == 0;

  return v3;
}

- (id)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  BOOL v58 = a3;
  aSelector = a2;
  v91[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v60 = a5;
  uint64_t v72 = 0;
  dispatch_semaphore_t v73 = &v72;
  uint64_t v74 = 0x3032000000;
  id v75 = __Block_byref_object_copy__102;
  id v76 = __Block_byref_object_dispose__102;
  id v77 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v66 = 0;
  __int16 v67 = &v66;
  uint64_t v68 = 0x3032000000;
  __int16 v69 = __Block_byref_object_copy__102;
  uint64_t v70 = __Block_byref_object_dispose__102;
  id v71 = [MEMORY[0x1E4F1C978] array];
  dispatch_time_t v10 = [(SMSuggestionsManager *)self deviceLocationPredictor];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke;
  v62[3] = &unk_1E6B905F0;
  id v64 = &v66;
  __int16 v65 = &v72;
  id v11 = v9;
  __int16 v63 = v11;
  [v10 fetchNextPredictedLocationsOfInterestFromLocation:v8 startDate:v60 timeInterval:v62 handler:3600.0];
  id v59 = v8;

  id v12 = v11;
  double v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_6;
  }
  double v15 = [MEMORY[0x1E4F1C9C8] now:aSelector];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  double v18 = objc_opt_new();
  char v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_669];
  id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v21 = [v20 filteredArrayUsingPredicate:v19];
  __int16 v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  id v24 = (void *)MEMORY[0x1E4F28C58];
  v91[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v91 count:1];
  id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;
  }
  else
  {
LABEL_6:
    id v27 = 0;
  }

  id v28 = v27;
  BOOL v29 = v28;
  if (a6)
  {
    if (v73[5])
    {
      id v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        id v50 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v51 = NSStringFromSelector(aSelector);
        uint64_t v52 = v73[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v50;
        __int16 v79 = 2112;
        id v80 = v51;
        __int16 v81 = 2112;
        uint64_t v82 = v52;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v31 = (void *)v73[5];
LABEL_16:
      *a6 = v31;
      id v33 = [MEMORY[0x1E4F1C978] array];
      goto LABEL_27;
    }
    if (v28)
    {
      uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        id v54 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v55 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v54;
        __int16 v79 = 2112;
        id v80 = v55;
        __int16 v81 = 2112;
        uint64_t v82 = (uint64_t)v29;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v31 = v29;
      goto LABEL_16;
    }
  }
  uint64_t v34 = (void *)v67[5];
  id v35 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_316 aSelector];
  id v36 = [v34 filteredArrayUsingPredicate:v35];

  id v37 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_319];
  uint64_t v38 = [v36 filteredArrayUsingPredicate:v37];

  dispatch_time_t v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    uint64_t v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelectora);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = [(id)v67[5] count];
    uint64_t v44 = [v36 count];
    uint64_t v45 = [v38 count];
    uint64_t v46 = @"NO";
    *(_DWORD *)buf = 138413826;
    *(void *)&uint8_t buf[4] = v41;
    __int16 v79 = 2112;
    if (v58) {
      uint64_t v46 = @"YES";
    }
    id v80 = v42;
    __int16 v81 = 2048;
    uint64_t v82 = v43;
    __int16 v83 = 2048;
    uint64_t v84 = v44;
    __int16 v85 = 2112;
    uint64_t v86 = v46;
    __int16 v87 = 2048;
    uint64_t v88 = v45;
    __int16 v89 = 2112;
    BOOL v90 = v59;
    _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%@, %@, nplois fetched count, %lu, nploisWithoutOnlyVehicleSource count, %lu, only high confidence, %@, nploisWithOnlyHighConfidenceAndWithoutOnlyVehicleSource, %lu, w.r.t the location, %@", buf, 0x48u);
  }
  if (v58) {
    id v47 = v38;
  }
  else {
    id v47 = v36;
  }
  if (a6) {
    *a6 = (id) v73[5];
  }
  id v33 = v47;

LABEL_27:
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);

  return v33;
}

void __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke_314(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 sources];
  if ([v3 count] == 1)
  {
    dispatch_semaphore_t v4 = [v2 sources];
    id v5 = [v4 firstObject];
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6 & 1;
}

BOOL __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 confidence];
  return v2 == 1.0;
}

- (id)_getSunriseDateAtLocation:(id)a3 date:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    dispatch_time_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"location");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v11 = (void *)MEMORY[0x1E016D870]();
  id v12 = objc_alloc_init(MEMORY[0x1E4F643C8]);
  [v8 latitude];
  double v14 = v13;
  [v8 longitude];
  double v16 = v15;
  double v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v18 = [v17 components:60 fromDate:v9];
  [v18 setHour:3];
  char v19 = [v17 dateFromComponents:v18];
  [v19 timeIntervalSinceReferenceDate];
  [v12 calculateAstronomicalTimeForLocation:v14 time:v16];
  __int16 v21 = [v12 sunrise];
  id v31 = (id)[v21 copy];

  __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    __int16 v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    __int16 v25 = NSStringFromSelector(a2);
    [v19 stringFromDate];
    id v26 = v30 = v11;
    [v31 stringFromDate];
    v28 = id v27 = v9;
    *(_DWORD *)buf = 138413314;
    id v33 = v24;
    __int16 v34 = 2112;
    id v35 = v25;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    dispatch_time_t v39 = v26;
    __int16 v40 = 2112;
    id v41 = v28;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, location, %@, third hour of today, %@, sunrise date, %@", buf, 0x34u);

    id v9 = v27;
    id v11 = v30;
  }

  return v31;
}

- (id)_getSunsetDateAtLocation:(id)a3 date:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    dispatch_time_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"location");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v11 = (void *)MEMORY[0x1E016D870]();
  id v12 = objc_alloc_init(MEMORY[0x1E4F643C8]);
  [v8 latitude];
  double v14 = v13;
  [v8 longitude];
  double v16 = v15;
  double v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v18 = [v17 components:60 fromDate:v9];
  [v18 setHour:5];
  char v19 = [v17 dateFromComponents:v18];
  [v19 timeIntervalSinceReferenceDate];
  [v12 calculateAstronomicalTimeForLocation:v14 time:v16];
  __int16 v21 = [v12 sunset];
  id v31 = (id)[v21 copy];

  __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    __int16 v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    __int16 v25 = NSStringFromSelector(a2);
    [v19 stringFromDate];
    id v26 = v30 = v11;
    [v31 stringFromDate];
    v28 = id v27 = v9;
    *(_DWORD *)buf = 138413314;
    id v33 = v24;
    __int16 v34 = 2112;
    id v35 = v25;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    dispatch_time_t v39 = v26;
    __int16 v40 = 2112;
    id v41 = v28;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, location, %@, fifth hour of today, %@, sunset date, %@", buf, 0x34u);

    id v9 = v27;
    id v11 = v30;
  }

  return v31;
}

- (BOOL)_isValidForNextTimePrompt
{
  return 0;
}

+ (int64_t)periodicPurgePolicy
{
  return 3;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_time_t v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    double v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    BOOL v3 = [*(id *)(a1 + 32) suggestionsStore];
    dispatch_semaphore_t v4 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v5[3] = &unk_1E6B92690;
    id v6 = v4;
    id v7 = *(id *)(a1 + 48);
    [v3 deleteSuggestionsPredating:v6 handler:v5];
  }
}

void __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_semaphore_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "purge entries from the suggestion store predating, %@, error, %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (SMSuggestionsMetricsManager)suggestionsMetricsManager
{
  return self->_suggestionsMetricsManager;
}

- (void)setSuggestionsMetricsManager:(id)a3
{
}

- (RTXPCTimerAlarm)walkingTriggerAlarm
{
  return self->_walkingTriggerAlarm;
}

- (void)setWalkingTriggerAlarm:(id)a3
{
}

- (id)pedometerDataHandler
{
  return self->_pedometerDataHandler;
}

- (void)setPedometerDataHandler:(id)a3
{
}

- (NSDate)pedometerStartDate
{
  return self->_pedometerStartDate;
}

- (void)setPedometerStartDate:(id)a3
{
}

- (NSMutableSet)pedometerUUIDs
{
  return self->_pedometerUUIDs;
}

- (void)setPedometerUUIDs:(id)a3
{
}

- (RTMotionActivityPedometerData)previousPedometerData
{
  return self->_previousPedometerData;
}

- (void)setPreviousPedometerData:(id)a3
{
}

- (BOOL)isPedometerNotificationsSetupAfterRoutineStarted
{
  return self->_isPedometerNotificationsSetupAfterRoutineStarted;
}

- (void)setIsPedometerNotificationsSetupAfterRoutineStarted:(BOOL)a3
{
  self->_isPedometerNotificationsSetupAfterRoutineStarted = a3;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (SMEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (SMSuggestionsStore)suggestionsStore
{
  return self->_suggestionsStore;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTLocation)latestLocationOfTheDevice
{
  return self->_latestLocationOfTheDevice;
}

- (void)setLatestLocationOfTheDevice:(id)a3
{
}

- (RTLearnedLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (void)setCurrentLOI:(id)a3
{
}

- (SMSuggestionsHelper)suggestionsHelper
{
  return self->_suggestionsHelper;
}

- (SMAppDeletionManager)appDeletionManager
{
  return self->_appDeletionManager;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDeletionManager, 0);
  objc_storeStrong((id *)&self->_suggestionsHelper, 0);
  objc_storeStrong((id *)&self->_currentLOI, 0);
  objc_storeStrong((id *)&self->_latestLocationOfTheDevice, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_suggestionsStore, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_previousPedometerData, 0);
  objc_storeStrong((id *)&self->_pedometerUUIDs, 0);
  objc_storeStrong((id *)&self->_pedometerStartDate, 0);
  objc_storeStrong(&self->_pedometerDataHandler, 0);
  objc_storeStrong((id *)&self->_walkingTriggerAlarm, 0);

  objc_storeStrong((id *)&self->_suggestionsMetricsManager, 0);
}

@end