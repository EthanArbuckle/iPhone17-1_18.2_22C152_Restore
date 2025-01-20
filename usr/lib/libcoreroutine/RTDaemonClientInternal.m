@interface RTDaemonClientInternal
- (NSString)description;
- (NSString)executablePath;
- (NSString)signingIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (RTAccountManager)accountManager;
- (RTAssetManager)assetManager;
- (RTAuthorizationManager)authorizationManager;
- (RTAuthorizedLocationManager)authorizedLocationManager;
- (RTBuildingPolygonManager)buildingPolygonManager;
- (RTDaemonClientInternal)init;
- (RTDaemonClientInternal)initWithQueue:(id)a3 accountManager:(id)a4 assetManager:(id)a5 authorizationManager:(id)a6 buildingPolygonManager:(id)a7 deviceLocationPredictor:(id)a8 diagnostics:(id)a9 eventModelProvider:(id)a10 authorizedLocationManager:(id)a11 fingerprintManager:(id)a12 hintManager:(id)a13 intermittentGNSSManager:(id)a14 learnedLocationManager:(id)a15 learnedLocationStore:(id)a16 locationManager:(id)a17 locationStore:(id)a18 mapServiceManager:(id)a19 motionActivityManager:(id)a20 peopleDiscoveryProvider:(id)a21 persistenceManager:(id)a22 placeInferenceQueryStore:(id)a23 pointOfInterestSampler:(id)a24 purgeManager:(id)a25 safetyCacheStore:(id)a26 scenarioTriggerManager:(id)a27 vehicleLocationProvider:(id)a28 visitManager:(id)a29 workoutRouteManager:(id)a30 workoutScheduler:(id)a31;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTDiagnostics)diagnostics;
- (RTEntitlementProvider)entitlementProvider;
- (RTEventModelProvider)eventModelProvider;
- (RTFingerprintManager)fingerprintManager;
- (RTHintManager)hintManager;
- (RTIntermittentGNSSManager)intermittentGNSSManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationManager)locationManager;
- (RTLocationStore)locationStore;
- (RTMapServiceManager)mapServiceManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider;
- (RTPersistenceManager)persistenceManager;
- (RTPlaceInferenceQueryStore)placeInferenceQueryStore;
- (RTPointOfInterestSampler)pointOfInterestSampler;
- (RTPurgeManager)purgeManager;
- (RTScenarioTriggerManager)scenarioTriggerManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTVisitManager)visitManager;
- (RTWorkoutRouteManager)workoutRouteManager;
- (RTWorkoutScheduler)workoutScheduler;
- (SMSafetyCacheStore)safetyCacheStore;
- (int)processIdentifier;
- (void)clearAllLocationsOfInterestWithReply:(id)a3;
- (void)computeContactScores:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)deleteWorkout:(id)a3 reply:(id)a4;
- (void)displayWorkoutDistanceRecordsWithHandler:(id)a3;
- (void)eraseVisitLogDatabase:(id)a3;
- (void)expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 reply:(id)a5;
- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 toExpireOn:(id)a4 reply:(id)a5;
- (void)fetchAllLocationsOfInterestWithReply:(id)a3;
- (void)fetchAuthorizedLocationExtendedStatus:(id)a3;
- (void)fetchAuthorizedLocations:(id)a3;
- (void)fetchBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)fetchCurrentLocationWithReply:(id)a3;
- (void)fetchDataVaultPath:(id)a3;
- (void)fetchFMCEnabledWithReply:(id)a3;
- (void)fetchFingerprintsWithOptions:(id)a3 reply:(id)a4;
- (void)fetchFusionCandidatesForVisitIdentifier:(id)a3 reply:(id)a4;
- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 reply:(id)a4;
- (void)fetchIntermittentGNSSRegistrationStateWithReply:(id)a3;
- (void)fetchLocationsOfInterestWithVisitsWithinDistance:(id)a3 location:(id)a4 reply:(id)a5;
- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 reply:(id)a5;
- (void)fetchPathToBackupWithReply:(id)a3;
- (void)fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 reply:(id)a5;
- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 reply:(id)a4;
- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 reply:(id)a5;
- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 reply:(id)a7;
- (void)fetchVisitLogsWithDateInterval:(id)a3 reply:(id)a4;
- (void)fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5;
- (void)fetchVisitsWithReply:(id)a3;
- (void)fetchWiFiAccessPointsForFingerprint:(id)a3 reply:(id)a4;
- (void)forceAuthorizedLocationEraseInstallInitialization:(id)a3;
- (void)forceEventModelRefreshWithReply:(id)a3;
- (void)forcePlaceTypeClassificationWithReply:(id)a3;
- (void)forceProcessWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 reply:(id)a11;
- (void)forceRelabeling:(id)a3;
- (void)forceSequentialClusterIdentification:(id)a3;
- (void)forceUpdateAssetMetadataWithReply:(id)a3;
- (void)injectFingerprintWithIdentifier:(id)a3 settledState:(unint64_t)a4 start:(id)a5 reply:(id)a6;
- (void)injectFingerprintWithSettledState:(BOOL)a3 start:(id)a4 reply:(id)a5;
- (void)injectLocationOfInterest:(id)a3 reply:(id)a4;
- (void)injectLocations:(id)a3 reply:(id)a4;
- (void)injectPeopleDensityBundle:(id)a3 handler:(id)a4;
- (void)injectPeopleDensityStats:(unint64_t)a3 duration:(double)a4 date:(id)a5 advertisements:(id)a6 handler:(id)a7;
- (void)injectPeopleDiscoveryAdv:(id)a3 handler:(id)a4;
- (void)injectProximityEvent:(id)a3 handler:(id)a4;
- (void)injectRealtimeVisit:(id)a3 reply:(id)a4;
- (void)injectSignalForSignalGeneratorOptions:(id)a3 reply:(id)a4;
- (void)injectVisit:(id)a3 locationOfInterest:(id)a4 reply:(id)a5;
- (void)injectWiFiAccessPointWithMac:(id)a3 rssi:(int64_t)a4 channel:(int64_t)a5 age:(double)a6 date:(id)a7 reply:(id)a8;
- (void)logDatabasesWithReply:(id)a3;
- (void)logSafetyCacheWithReply:(id)a3;
- (void)mirroringDelegateSetupState:(id)a3;
- (void)performExportMirroringRequest:(id)a3;
- (void)performImportMirroringRequest:(id)a3;
- (void)performZoneResetMirroringRequest:(id)a3;
- (void)periodicPurgeWithReply:(id)a3;
- (void)processNewlyAddedWorkout:(id)a3 reply:(id)a4;
- (void)queryProvider:(id)a3 options:(id)a4 reply:(id)a5;
- (void)reconstructTransitionsWithReply:(id)a3;
- (void)removeAllPeopleDensityBundles:(id)a3;
- (void)removeAllProximityEvent:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setAuthorizedLocationManager:(id)a3;
- (void)setBuildingPolygonManager:(id)a3;
- (void)setDeviceLocationPredictor:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setEntitlementProvider:(id)a3;
- (void)setEventModelProvider:(id)a3;
- (void)setExecutablePath:(id)a3;
- (void)setFingerprintManager:(id)a3;
- (void)setHintManager:(id)a3;
- (void)setIntermittentGNSSManager:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationStore:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setPeopleDiscoveryProvider:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPlaceInferenceQueryStore:(id)a3;
- (void)setPointOfInterestSampler:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setPurgeManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSafetyCacheStore:(id)a3;
- (void)setScenarioTriggerManager:(id)a3;
- (void)setSigningIdentifier:(id)a3;
- (void)setVehicleLocationProvider:(id)a3;
- (void)setVisitManager:(id)a3;
- (void)setWorkoutRouteManager:(id)a3;
- (void)setWorkoutScheduler:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)simulateScenarioTrigger:(id)a3 reply:(id)a4;
- (void)simulateVisit:(id)a3 reply:(id)a4;
- (void)startSamplingPointOfInterestWithInterval:(double)a3 handler:(id)a4;
- (void)stopSamplingPointOfInterest:(id)a3;
- (void)storeHints:(id)a3 reply:(id)a4;
- (void)submitHintAtLocation:(id)a3 reply:(id)a4;
- (void)submitMetrics:(id)a3 metricName:(id)a4 reply:(id)a5;
- (void)submitTransitMetricsWithReply:(id)a3;
- (void)tearDownPersistenceStack:(id)a3;
- (void)updateAssetServerURL:(id)a3 assetType:(id)a4 reply:(id)a5;
- (void)updateIntermittentGNSSRegistrationOverrideState:(unint64_t)a3 reply:(id)a4;
- (void)updateRelevanceScoresWithReply:(id)a3;
- (void)updateTransitionWithIdentifier:(id)a3 modeOfTransportation:(int64_t)a4 reply:(id)a5;
@end

@implementation RTDaemonClientInternal

- (RTDaemonClientInternal)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_accountManager_assetManager_authorizationManager_buildingPolygonManager_deviceLocationPredictor_diagnostics_eventModelProvider_authorizedLocationManager_fingerprintManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationStore_mapServiceManager_motionActivityManager_peopleDiscoveryProvider_persistenceManager_placeInferenceQueryStore_pointOfInterestSampler_purgeManager_safetyCacheStore_scenarioTriggerManager_vehicleLocationProvider_visitManager_workoutRouteManager_workoutScheduler_);
}

- (RTDaemonClientInternal)initWithQueue:(id)a3 accountManager:(id)a4 assetManager:(id)a5 authorizationManager:(id)a6 buildingPolygonManager:(id)a7 deviceLocationPredictor:(id)a8 diagnostics:(id)a9 eventModelProvider:(id)a10 authorizedLocationManager:(id)a11 fingerprintManager:(id)a12 hintManager:(id)a13 intermittentGNSSManager:(id)a14 learnedLocationManager:(id)a15 learnedLocationStore:(id)a16 locationManager:(id)a17 locationStore:(id)a18 mapServiceManager:(id)a19 motionActivityManager:(id)a20 peopleDiscoveryProvider:(id)a21 persistenceManager:(id)a22 placeInferenceQueryStore:(id)a23 pointOfInterestSampler:(id)a24 purgeManager:(id)a25 safetyCacheStore:(id)a26 scenarioTriggerManager:(id)a27 vehicleLocationProvider:(id)a28 visitManager:(id)a29 workoutRouteManager:(id)a30 workoutScheduler:(id)a31
{
  id v85 = a3;
  id v55 = a4;
  id v60 = a4;
  id v36 = a5;
  id v68 = a6;
  id v84 = a7;
  id v83 = a8;
  id v82 = a9;
  id v81 = a10;
  id v80 = a11;
  id v79 = a12;
  id v78 = a13;
  id v77 = a14;
  id v76 = a15;
  id v75 = a16;
  id v74 = a17;
  id v59 = a18;
  id v73 = a19;
  id v72 = a20;
  id v71 = a21;
  id v70 = a22;
  id v69 = a23;
  id v67 = a24;
  id v66 = a25;
  id v57 = a26;
  id v65 = a27;
  id v64 = a28;
  id v63 = a29;
  id v62 = a30;
  id v61 = a31;
  if (!v85)
  {
    v47 = v36;
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v43 = 0;
    v44 = 0;
    v45 = v60;
    goto LABEL_35;
  }
  id v56 = v36;
  if (!v36)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      v43 = 0;
      v44 = v85;
      v45 = v60;
      v47 = v56;
LABEL_35:
      v37 = v68;
LABEL_74:
      v42 = self;
      v46 = v59;
      goto LABEL_75;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: assetManager";
LABEL_49:
    _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, v52, buf, 2u);
    goto LABEL_34;
  }
  v37 = v68;
  if (!v68)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: authorizationManager";
LABEL_72:
    _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, v51, buf, 2u);
    goto LABEL_73;
  }
  if (!v84)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: buildingPolygonManager";
    goto LABEL_72;
  }
  if (!v83)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: deviceLocationPredictor";
    goto LABEL_72;
  }
  if (!v82)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_72;
  }
  if (!v81)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: eventModelProvider";
    goto LABEL_72;
  }
  if (!v80)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: authorizedLocationManager";
    goto LABEL_72;
  }
  if (!v79)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_72;
  }
  if (!v78)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_72;
  }
  if (!v77)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: intermittentGNSSManager";
    goto LABEL_72;
  }
  if (!v76)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_72;
  }
  if (!v75)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_72;
  }
  if (!v74)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_72;
  }
  if (!v73)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_72;
  }
  if (!v72)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_72;
  }
  if (!v71)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: peopleDiscoveryProvider";
    goto LABEL_72;
  }
  if (!v70)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_72;
  }
  if (!v69)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = "Invalid parameter not satisfying: placeInferenceQueryStore";
      goto LABEL_72;
    }
LABEL_73:

    v43 = 0;
    v44 = v85;
    v45 = v60;
    v47 = v56;
    goto LABEL_74;
  }
  if (!v67)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: pointOfInterestSampler";
    goto LABEL_49;
  }
  if (!v66)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: purgeManager";
    goto LABEL_49;
  }
  if (!v65)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: scenarioTriggerManager";
    goto LABEL_49;
  }
  if (!v64)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: vehicleLocationProvider";
    goto LABEL_49;
  }
  if (!v63)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_49;
  }
  if (!v62)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: workoutRouteManager";
    goto LABEL_49;
  }
  if (!v61)
  {
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: workoutScheduler";
    goto LABEL_49;
  }
  v86.receiver = self;
  v86.super_class = (Class)RTDaemonClientInternal;
  v38 = [(RTDaemonClientInternal *)&v86 init];
  v39 = v38;
  if (v38)
  {
    objc_storeStrong((id *)&v38->_queue, a3);
    objc_storeStrong((id *)&v39->_accountManager, v55);
    objc_storeStrong((id *)&v39->_assetManager, a5);
    objc_storeStrong((id *)&v39->_authorizationManager, a6);
    objc_storeStrong((id *)&v39->_buildingPolygonManager, a7);
    objc_storeStrong((id *)&v39->_deviceLocationPredictor, a8);
    objc_storeStrong((id *)&v39->_diagnostics, a9);
    objc_storeStrong((id *)&v39->_eventModelProvider, a10);
    objc_storeStrong((id *)&v39->_authorizedLocationManager, a11);
    objc_storeStrong((id *)&v39->_fingerprintManager, a12);
    objc_storeStrong((id *)&v39->_hintManager, a13);
    objc_storeStrong((id *)&v39->_intermittentGNSSManager, a14);
    objc_storeStrong((id *)&v39->_learnedLocationManager, a15);
    objc_storeStrong((id *)&v39->_learnedLocationStore, a16);
    objc_storeStrong((id *)&v39->_locationManager, a17);
    objc_storeStrong((id *)&v39->_locationStore, a18);
    objc_storeStrong((id *)&v39->_mapServiceManager, a19);
    objc_storeStrong((id *)&v39->_motionActivityManager, a20);
    objc_storeStrong((id *)&v39->_peopleDiscoveryProvider, a21);
    objc_storeStrong((id *)&v39->_persistenceManager, a22);
    objc_storeStrong((id *)&v39->_placeInferenceQueryStore, a23);
    objc_storeStrong((id *)&v39->_pointOfInterestSampler, a24);
    objc_storeStrong((id *)&v39->_purgeManager, a25);
    objc_storeStrong((id *)&v39->_scenarioTriggerManager, a27);
    objc_storeStrong((id *)&v39->_vehicleLocationProvider, a28);
    objc_storeStrong((id *)&v39->_visitManager, a29);
    objc_storeStrong((id *)&v39->_workoutRouteManager, a30);
    objc_storeStrong((id *)&v39->_workoutScheduler, a31);
    objc_storeStrong((id *)&v39->_safetyCacheStore, a26);
    uint64_t v40 = +[RTEntitlementProvider internalDaemonProtocolEntitlementProvider];
    entitlementProvider = v39->_entitlementProvider;
    v39->_entitlementProvider = (RTEntitlementProvider *)v40;
  }
  v42 = v39;
  v43 = v42;
  v44 = v85;
  v46 = v59;
  v45 = v60;
  v47 = v56;
  v37 = v68;
LABEL_75:

  return v43;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(RTDaemonClientInternal *)self executablePath];
  uint64_t v5 = [(RTDaemonClientInternal *)self processIdentifier];
  v6 = [(RTDaemonClientInternal *)self signingIdentifier];
  v7 = [v3 stringWithFormat:@"%@(%d), %@", v4, v5, v6];

  return (NSString *)v7;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  [v10 retainArguments];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__71;
  v29[4] = __Block_byref_object_dispose__71;
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = NSStringFromSelector(a2);
  id v15 = [v11 stringWithFormat:@"%@-%@", v13, v14];
  [v15 UTF8String];
  id v30 = (id)os_transaction_create();

  v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v32 = v21;
    __int16 v33 = 2112;
    v34 = v22;
    _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTDaemonClientInternal_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_1E6B913A0;
  BOOL v28 = a5;
  id v24 = v10;
  v25 = self;
  id v26 = v9;
  v27 = v29;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v29, 8);
}

void __62__RTDaemonClientInternal_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) invoke];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v12 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v38 = 2112;
      v39 = v12;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);
    }
    v6 = [*(id *)(a1 + 32) target];
    v7 = [*(id *)(*(void *)(a1 + 40) + 48) protocol];
    int v8 = [v6 conformsToProtocol:v7];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 48) exportedInterface];
      id v10 = [v9 replyBlockSignatureForSelector:[*(id *)(a1 + 32) selector]];
    }
    else
    {
      id v10 = 0;
    }
    v13 = +[RTXPC executablePathOfConnection:*(void *)(a1 + 48)];
    v14 = [v13 lastPathComponent];

    int v15 = [*(id *)(*(void *)(a1 + 40) + 48) clientConnection:*(void *)(a1 + 48) satisfiesEntitlementRequirementsForInvocation:*(void *)(a1 + 32)];
    if (v10)
    {
      if (v15)
      {
        uint64_t v16 = [*(id *)(a1 + 32) blockArgumentIndex];
        *(void *)buf = 0;
        [*(id *)(a1 + 32) getArgument:buf atIndex:v16];
        v17 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
        id v18 = (void *)[*(id *)buf copy];
        [v10 UTF8String];
        v31 = v17;
        id v32 = v4;
        __int16 v33 = v18;
        id v19 = v18;
        id v20 = v17;
        id v34 = (id)__NSMakeSpecialForwardingCaptureBlock();
        [*(id *)(a1 + 32) setArgument:&v34 atIndex:v16];
        [*(id *)(a1 + 32) invoke];
        uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
        v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = 0;
      }
      else
      {
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v25 = [NSString stringWithFormat:@"%@ is not entitled for this operation.", v14];
        id v36 = v25;
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        BOOL v28 = (void *)[v27 initWithDomain:*MEMORY[0x1E4F5CFE8] code:3 userInfo:v26];
        [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v28 replyTypes:v10];
        uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
        id v30 = *(void **)(v29 + 40);
        *(void *)(v29 + 40) = 0;
      }
    }
    else
    {
      if (v15) {
        [*(id *)(a1 + 32) invoke];
      }
      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = 0;
    }
  }
}

void __62__RTDaemonClientInternal_connection_handleInvocation_isReply___block_invoke_479(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:a1[5]];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Sending reply for request \"%@\", latency, %.2f", (uint8_t *)&v8, 0x16u);
  }
  [v3 setTarget:a1[6]];
  [v3 invoke];
}

- (void)setXpcConnection:(id)a3
{
  id v5 = a3;
  p_xpcConnection = (id *)&self->_xpcConnection;
  objc_storeStrong((id *)&self->_xpcConnection, a3);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    int v8 = [(RTDaemonClientInternal *)self queue];
    [(NSXPCConnection *)xpcConnection _setQueue:v8];

    uint64_t v9 = self->_xpcConnection;
    __int16 v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3484AC0];
    [(NSXPCConnection *)v9 setExportedInterface:v10];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    uint64_t v11 = [(RTDaemonClientInternal *)self xpcConnection];
    uint64_t v12 = [v11 exportedInterface];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    int v15 = [v13 setWithObjects:v14, objc_opt_class(), 0];
    [v12 setClasses:v15 forSelector:sel_injectLocations_reply_ argumentIndex:0 ofReply:0];

    uint64_t v16 = [(RTDaemonClientInternal *)self xpcConnection];
    v17 = [v16 exportedInterface];
    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    id v20 = [v18 setWithObjects:v19, objc_opt_class(), 0];
    [v17 setClasses:v20 forSelector:sel_extendLifetimeOfVisitsWithIdentifiers_toExpireOn_reply_ argumentIndex:0 ofReply:0];

    uint64_t v21 = [(RTDaemonClientInternal *)self xpcConnection];
    v22 = [v21 exportedInterface];
    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = [v23 setWithObjects:v24, objc_opt_class(), nil];
    [v22 setClasses:v25 forSelector:sel_expireLifetimeOfVisitsWithIdentifiers_expirationDate_reply_ argumentIndex:0 ofReply:0];

    id v26 = [(RTDaemonClientInternal *)self xpcConnection];
    id v27 = [v26 exportedInterface];
    BOOL v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    id v30 = [v28 setWithObjects:v29, objc_opt_class(), 0];
    [v27 setClasses:v30 forSelector:sel_storeHints_reply_ argumentIndex:0 ofReply:0];

    v31 = [(RTDaemonClientInternal *)self xpcConnection];
    id v32 = [v31 exportedInterface];
    __int16 v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = [v33 setWithObjects:v34, objc_opt_class(), nil];
    [v32 setClasses:v35 forSelector:sel_fetchBuildingPolygonsFromLocations_radius_limit_reply_ argumentIndex:0 ofReply:0];

    id v36 = [(RTDaemonClientInternal *)self xpcConnection];
    v37 = [v36 exportedInterface];
    __int16 v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = [v38 setWithObjects:v39, objc_opt_class(), 0];
    [v37 setClasses:v40 forSelector:sel_fetchBuildingPolygonsFromLocations_radius_limit_reply_ argumentIndex:0 ofReply:1];

    v41 = [(RTDaemonClientInternal *)self xpcConnection];
    v42 = [v41 exportedInterface];
    v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    [v43 setWithObjects:v44, objc_opt_class(), nil];
    [v42 setClasses:v45 forSelector:sel_injectPeopleDensityStats_duration_date_advertisements_handler_ argumentIndex:3 ofReply:0];

    v46 = [(RTDaemonClientInternal *)self xpcConnection];
    v47 = [v46 exportedInterface];
    v48 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
    [v47 setClasses:v48 forSelector:sel_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply_ argumentIndex:0 ofReply:0];

    v49 = [(RTDaemonClientInternal *)self xpcConnection];
    v50 = [v49 exportedInterface];
    v51 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v52 = objc_opt_class();
    v53 = [v51 setWithObjects:v52, objc_opt_class(), 0];
    [v50 setClasses:v53 forSelector:sel_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply_ argumentIndex:0 ofReply:1];

    v54 = [(RTDaemonClientInternal *)self xpcConnection];
    id v55 = [v54 exportedInterface];
    id v56 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
    [v55 setClasses:v56 forSelector:sel_fetchPointOfInterestsAroundCoordinate_radius_reply_ argumentIndex:0 ofReply:0];

    id v57 = [(RTDaemonClientInternal *)self xpcConnection];
    v58 = [v57 exportedInterface];
    id v59 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v60 = objc_opt_class();
    id v61 = [v59 setWithObjects:v60, objc_opt_class(), 0];
    [v58 setClasses:v61 forSelector:sel_fetchPointOfInterestsAroundCoordinate_radius_reply_ argumentIndex:0 ofReply:1];

    id v62 = [(RTDaemonClientInternal *)self xpcConnection];
    id v63 = [v62 exportedInterface];
    id v64 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
    [v63 setClasses:v64 forSelector:sel_fetchPointOfInterestAttributesWithIdentifier_reply_ argumentIndex:0 ofReply:1];

    id v65 = [(RTDaemonClientInternal *)self xpcConnection];
    id v66 = [v65 exportedInterface];
    id v67 = [MEMORY[0x1E4F1CAD0] setWithObjects:objc_opt_class(), 0];
    [v66 setClasses:v67 forSelector:sel_fetchCurrentLocationWithReply_ argumentIndex:0 ofReply:1];

    objc_initWeak(&location, self);
    id v68 = self->_xpcConnection;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __43__RTDaemonClientInternal_setXpcConnection___block_invoke;
    v72[3] = &unk_1E6B91900;
    objc_copyWeak(&v73, &location);
    [(NSXPCConnection *)v68 setInterruptionHandler:v72];
    id v69 = *p_xpcConnection;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __43__RTDaemonClientInternal_setXpcConnection___block_invoke_677;
    v70[3] = &unk_1E6B91900;
    objc_copyWeak(&v71, &location);
    [v69 setInvalidationHandler:v70];
    [*p_xpcConnection resume];
    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&location);
  }
}

void __43__RTDaemonClientInternal_setXpcConnection___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc interruption", (uint8_t *)&v3, 0xCu);
  }
}

void __43__RTDaemonClientInternal_setXpcConnection___block_invoke_677(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc invalidation", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setXpcConnection:0];
}

- (void)fetchDataVaultPath:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v3 = (void (**)(id, void, void *))a3;
  if (v3)
  {
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = @"This operation is unsupported on this platform.";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v4];
    v3[2](v3, 0, v5);
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)fetchPathToBackupWithReply:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [(RTDaemonClientInternal *)self diagnostics];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __53__RTDaemonClientInternal_fetchPathToBackupWithReply___block_invoke;
    v8[3] = &unk_1E6B968A8;
    SEL v10 = a2;
    v8[4] = self;
    id v9 = v5;
    [v6 fetchPathToBackupWithHandler:v8];
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __53__RTDaemonClientInternal_fetchPathToBackupWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, reply to client, %@, pathToBackup, %@, error, %@", (uint8_t *)&v10, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchAllLocationsOfInterestWithReply:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke;
    v9[3] = &unk_1E6B91468;
    v9[4] = self;
    SEL v11 = a2;
    id v10 = v5;
    [(RTLearnedLocationManager *)learnedLocationManager fetchAllLocationsOfInterestWithHandler:v9];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v5;
  uint64_t v15 = v8;
  id v16 = v6;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v17 = v12;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v9 = 138413058;
    id v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest to client, %@, error, %@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, *(void *)(a1 + 48));
}

- (void)forceSequentialClusterIdentification:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [(RTDaemonClientInternal *)self learnedLocationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke;
    v8[3] = &unk_1E6B916B8;
    v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 trainForReason:2 mode:1 handler:v8];
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)injectLocationOfInterest:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    __int16 v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [[RTLearnedLocationOfInterest alloc] initWithLocationOfInterest:v7 creationDate:v9];
    learnedLocationManager = self->_learnedLocationManager;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke;
    v13[3] = &unk_1E6B916B8;
    v13[4] = self;
    SEL v15 = a2;
    id v14 = v8;
    uint64_t v12 = self;
    [(RTLearnedLocationManager *)learnedLocationManager addLocationOfInterest:v10 handler:v13];
  }
  else
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)injectVisit:(id)a3 locationOfInterest:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = [v12 dateByAddingTimeInterval:2419200.0];
    id v14 = [[RTLearnedVisit alloc] initWithVisit:v9 locationOfInterest:v10 creationDate:v12 expirationDate:v13];
    SEL v15 = [[RTLearnedLocationOfInterest alloc] initWithLocationOfInterest:v10 creationDate:v12];
    learnedLocationManager = self->_learnedLocationManager;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke;
    v18[3] = &unk_1E6B916B8;
    v18[4] = self;
    SEL v20 = a2;
    id v19 = v11;
    uint64_t v17 = self;
    [(RTLearnedLocationManager *)learnedLocationManager addVisit:v14 locationOfInterest:v15 handler:v18];
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 reply:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (v15)
  {
    locationManager = self->_locationManager;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke;
    v18[3] = &unk_1E6B968F8;
    v18[4] = self;
    SEL v22 = a2;
    id v19 = v13;
    id v20 = v14;
    double v23 = a5;
    unint64_t v24 = a6;
    id v21 = v15;
    [(RTLocationManager *)locationManager fetchStoredLocationsCountFromDate:v19 toDate:v20 uncertainty:a6 limit:v18 handler:a5];
  }
  else
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke_2;
  block[3] = &unk_1E6B968D0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v17 = a2;
  void block[4] = v7;
  id v12 = v8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 80);
  id v13 = v9;
  id v14 = v5;
  id v15 = *(id *)(a1 + 56);
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 96);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v12 = 138414082;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, %lu location fromDate, %@, toDate, %@, uncertainty, %.2f, limit, %lu, error, %@", (uint8_t *)&v12, 0x52u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)fetchLocationsOfInterestWithVisitsWithinDistance:(id)a3 location:(id)a4 reply:(id)a5
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      *(void *)uint64_t v34 = 0;
      uint64_t v35 = v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__71;
      __int16 v38 = __Block_byref_object_dispose__71;
      int v12 = NSString;
      id v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      id v16 = [v12 stringWithFormat:@"%@-%@", v14, v15];
      [v16 UTF8String];
      id v39 = (id)os_transaction_create();

      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v41 = v26;
        __int16 v42 = 2112;
        v43 = v27;
        _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
      }
      learnedLocationStore = self->_learnedLocationStore;
      [v9 doubleValue];
      double v20 = v19;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke;
      v28[3] = &unk_1E6B96948;
      v28[4] = self;
      SEL v33 = a2;
      id v29 = v9;
      id v30 = v10;
      id v31 = v11;
      id v32 = v34;
      [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestWithVisitsWithinDistance:v30 location:v28 handler:v20];

      _Block_object_dispose(v34, 8);
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45[0] = @"distance cannot be nil";
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      __int16 v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v23];

      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v24);
    }
  }
  else
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v34 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v34, 2u);
    }
  }
}

void __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke_2;
  v13[3] = &unk_1E6B96920;
  uint64_t v21 = *(void *)(a1 + 72);
  id v14 = v5;
  id v15 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v17 = v9;
  id v10 = *(id *)(a1 + 56);
  id v18 = v6;
  id v19 = v10;
  uint64_t v20 = *(void *)(a1 + 64);
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, v13);
}

void __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 88));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    [*(id *)(a1 + 40) doubleValue];
    uint64_t v6 = v5;
    uint64_t v7 = [*(id *)(a1 + 48) coordinateToString];
    uint64_t v8 = *(void *)(a1 + 56);
    int v13 = 138413314;
    id v14 = v3;
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest within %.2fm of %@ to client, %@", (uint8_t *)&v13, 0x34u);
  }
  uint64_t v9 = *(void *)(a1 + 72);
  id v10 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, *(void *)(a1 + 64));

  uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

- (void)fetchVisitsWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    learnedLocationStore = self->_learnedLocationStore;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __47__RTDaemonClientInternal_fetchVisitsWithReply___block_invoke;
    v8[3] = &unk_1E6B92A68;
    uint64_t v9 = v4;
    [(RTLearnedLocationStore *)learnedLocationStore fetchVisitsWithHandler:v8];
    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __47__RTDaemonClientInternal_fetchVisitsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v5 count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        id v14 = objc_alloc(MEMORY[0x1E4F5CE28]);
        __int16 v15 = [v14 initWithRTLearnedVisit:v13, v16];
        if (v15) {
          [v7 addObject:v15];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceRelabeling:(id)a3
{
  if (a3)
  {
    learnedLocationManager = self->_learnedLocationManager;
    -[RTLearnedLocationManager forceRelabeling:](learnedLocationManager, "forceRelabeling:");
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)forcePlaceTypeClassificationWithReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __64__RTDaemonClientInternal_forcePlaceTypeClassificationWithReply___block_invoke;
    v8[3] = &unk_1E6B90C18;
    uint64_t v9 = v4;
    [(RTLearnedLocationManager *)learnedLocationManager classifyPlaceTypesWithHandler:v8];
    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

uint64_t __64__RTDaemonClientInternal_forcePlaceTypeClassificationWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)simulateScenarioTrigger:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    scenarioTriggerManager = self->_scenarioTriggerManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke;
    v10[3] = &unk_1E6B96970;
    v10[4] = self;
    id v11 = v6;
    [(RTScenarioTriggerManager *)scenarioTriggerManager simulateScenarioTrigger:a3 handler:v10];
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)forceUpdateAssetMetadataWithReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    assetManager = self->_assetManager;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __60__RTDaemonClientInternal_forceUpdateAssetMetadataWithReply___block_invoke;
    v8[3] = &unk_1E6B90C18;
    id v9 = v4;
    [(RTAssetManager *)assetManager forceUpdateAssetMetadataWithHandler:v8];
    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

uint64_t __60__RTDaemonClientInternal_forceUpdateAssetMetadataWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAssetServerURL:(id)a3 assetType:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    assetManager = self->_assetManager;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke;
    v12[3] = &unk_1E6B92690;
    v12[4] = self;
    id v13 = v8;
    [(RTAssetManager *)assetManager updateAssetServerURL:a3 assetType:a4 handler:v12];
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke_2;
  v7[3] = &unk_1E6B90D08;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)forceEventModelRefreshWithReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    eventModelProvider = self->_eventModelProvider;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke;
    v8[3] = &unk_1E6B92690;
    void v8[4] = self;
    id v9 = v4;
    [(RTEventModelProvider *)eventModelProvider refreshAllLOIHistogramsWithHandler:v8];
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke_2;
  v7[3] = &unk_1E6B90D08;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)injectLocations:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    locationManager = self->_locationManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__RTDaemonClientInternal_injectLocations_reply___block_invoke;
    v10[3] = &unk_1E6B92690;
    v10[4] = self;
    id v11 = v6;
    [(RTLocationManager *)locationManager injectLocations:a3 handler:v10];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __48__RTDaemonClientInternal_injectLocations_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RTDaemonClientInternal_injectLocations_reply___block_invoke_2;
  v7[3] = &unk_1E6B90D08;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __48__RTDaemonClientInternal_injectLocations_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)storeHints:(id)a3 reply:(id)a4
{
  id v6 = a4;
  hintManager = self->_hintManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__RTDaemonClientInternal_storeHints_reply___block_invoke;
  v9[3] = &unk_1E6B90C18;
  id v10 = v6;
  id v8 = v6;
  [(RTHintManager *)hintManager storeHints:a3 handler:v9];
}

uint64_t __43__RTDaemonClientInternal_storeHints_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)injectSignalForSignalGeneratorOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    locationManager = self->_locationManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__RTDaemonClientInternal_injectSignalForSignalGeneratorOptions_reply___block_invoke;
    v10[3] = &unk_1E6B90C18;
    id v11 = v6;
    +[RTSignalGenerator injectSignalForSignalGeneratorOptions:a3 locationManager:locationManager handler:v10];
    id v9 = v11;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

uint64_t __70__RTDaemonClientInternal_injectSignalForSignalGeneratorOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAllLocationsOfInterestWithReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke;
    v8[3] = &unk_1E6B92690;
    void v8[4] = self;
    id v9 = v4;
    [(RTLearnedLocationManager *)learnedLocationManager removeAllLocationsOfInterestWithHandler:v8];
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke_2;
  v7[3] = &unk_1E6B90D08;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateTransitionWithIdentifier:(id)a3 modeOfTransportation:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    -[RTLearnedLocationManager updateTransitionWithIdentifier:motionActivityType:handler:](self->_learnedLocationManager, "updateTransitionWithIdentifier:motionActivityType:handler:", v8, [MEMORY[0x1E4F5CE20] motionActivityTypeFromModeOfTransportation:a4], v9);
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v11, 2u);
    }
  }
}

- (void)reconstructTransitionsWithReply:(id)a3
{
  if (a3)
  {
    learnedLocationManager = self->_learnedLocationManager;
    -[RTLearnedLocationManager reconstructTransitionsWithHandler:](learnedLocationManager, "reconstructTransitionsWithHandler:");
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)simulateVisit:(id)a3 reply:(id)a4
{
  if (a4)
  {
    visitManager = self->_visitManager;
    -[RTVisitManager simulateVisit:handler:](visitManager, "simulateVisit:handler:", a3);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    visitManager = self->_visitManager;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__RTDaemonClientInternal_fetchVisitsBetweenStartDate_endDate_reply___block_invoke;
    v12[3] = &unk_1E6B914B8;
    v12[4] = self;
    id v13 = v8;
    [(RTVisitManager *)visitManager fetchVisitsFromDate:a3 toDate:a4 handler:v12];
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __68__RTDaemonClientInternal_fetchVisitsBetweenStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v5 count];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 134218242;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "sending %lu visits to client, %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)injectRealtimeVisit:(id)a3 reply:(id)a4
{
  if (a4)
  {
    visitManager = self->_visitManager;
    -[RTVisitManager injectRealtimeVisit:handler:](visitManager, "injectRealtimeVisit:handler:", a3);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)submitHintAtLocation:(id)a3 reply:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (v7)
  {
    if (v6)
    {
      [(RTHintManager *)self->_hintManager submitHintFromSource:-1 location:v6];
      v7[2](v7, 0);
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F5CFE8];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"Valid location required.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      __int16 v12 = [v9 errorWithDomain:v10 code:7 userInfo:v11];
      ((void (**)(id, void *))v7)[2](v7, v12);
    }
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v13, 2u);
    }
  }
}

- (void)fetchFusionCandidatesForVisitIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__RTDaemonClientInternal_fetchFusionCandidatesForVisitIdentifier_reply___block_invoke;
    v11[3] = &unk_1E6B969B8;
    SEL v13 = a2;
    __int16 v12 = v7;
    [(RTLearnedLocationManager *)learnedLocationManager fetchFusionCandidatesForVisitIdentifier:a3 handler:v11];
    uint64_t v10 = v12;
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __72__RTDaemonClientInternal_fetchFusionCandidatesForVisitIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v11 = 138412290;
    __int16 v12 = v8;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v11, 0xCu);
  }
  if (v6)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [[_RTMap alloc] initWithInput:v5];
    uint64_t v9 = [(_RTMap *)v10 withBlock:&__block_literal_global_57];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __72__RTDaemonClientInternal_fetchFusionCandidatesForVisitIdentifier_reply___block_invoke_700(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5CE10];
  id v3 = a2;
  id v4 = [v3 secondObject];
  uint64_t v5 = [v2 typeFromPlaceType:[v4 unsignedIntegerValue]];

  id v6 = objc_alloc(MEMORY[0x1E4F5CE58]);
  id v7 = [v3 firstObject];

  uint64_t v8 = [NSNumber numberWithInteger:v5];
  uint64_t v9 = (void *)[v6 initWithFirstObject:v7 secondObject:v8];

  return v9;
}

- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke;
    v11[3] = &unk_1E6B96A08;
    void v11[4] = self;
    SEL v13 = a2;
    id v12 = v7;
    [(RTLearnedLocationManager *)learnedLocationManager fetchInferredMapItemForVisitIdentifier:a3 handler:v11];
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E6B969E0;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)queryProvider:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke;
    v13[3] = &unk_1E6B91468;
    void v13[4] = self;
    SEL v15 = a2;
    id v14 = v9;
    [(RTLearnedLocationManager *)learnedLocationManager queryProvider:a3 options:a4 handler:v13];
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke_2;
  block[3] = &unk_1E6B969E0;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchFingerprintsWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, NSObject *))a4;
  if (!v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[RTDaemonClientInternal fetchFingerprintsWithOptions:reply:]";
      __int16 v24 = 1024;
      int v25 = 900;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v21 = @"requires valid options.";
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v12 = [v14 errorWithDomain:v15 code:7 userInfo:v16];

    v8[2](v8, 0, v12);
LABEL_9:

    goto LABEL_10;
  }
  fingerprintManager = self->_fingerprintManager;
  id v10 = [v7 dateInterval];
  uint64_t v11 = [v7 settledState];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke;
  v17[3] = &unk_1E6B91468;
  v17[4] = self;
  SEL v19 = a2;
  long long v18 = v8;
  [(RTFingerprintManager *)fingerprintManager fetchFingerprintsInDateInterval:v10 filteredBySettledState:v11 handler:v17];

LABEL_10:
}

void __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke_2;
  block[3] = &unk_1E6B969E0;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchWiFiAccessPointsForFingerprint:(id)a3 reply:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (!v8)
  {
    long long v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[RTDaemonClientInternal fetchWiFiAccessPointsForFingerprint:reply:]";
      __int16 v23 = 1024;
      int v24 = 926;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint (in %s:%d)", buf, 0x12u);
    }

    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"requires a valid fingerprint.";
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    long long v11 = [v13 errorWithDomain:v14 code:7 userInfo:v15];

    ((void (**)(void, void, NSObject *))v9)[2](v9, 0, v11);
LABEL_9:

    goto LABEL_10;
  }
  fingerprintManager = self->_fingerprintManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke;
  v16[3] = &unk_1E6B91468;
  v16[4] = self;
  SEL v18 = a2;
  id v17 = v8;
  [(RTFingerprintManager *)fingerprintManager fetchWifiAccessPointsForFingerprint:v7 handler:v16];

LABEL_10:
}

void __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke_2;
  block[3] = &unk_1E6B969E0;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)injectFingerprintWithIdentifier:(id)a3 settledState:(unint64_t)a4 start:(id)a5 reply:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (!v11)
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[RTDaemonClientInternal injectFingerprintWithIdentifier:settledState:start:reply:]";
        __int16 v38 = 1024;
        int v39 = 953;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
      }
    }
    if (a4 >= 3)
    {
      SEL v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[RTDaemonClientInternal injectFingerprintWithIdentifier:settledState:start:reply:]";
        __int16 v38 = 1024;
        int v39 = 954;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTScenarioTriggerSettledStateIsValid(settledState) (in %s:%d)", buf, 0x12u);
      }

      if (v12)
      {
LABEL_8:
        if (v11) {
          goto LABEL_9;
        }
        goto LABEL_20;
      }
    }
    else if (v12)
    {
      goto LABEL_8;
    }
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTDaemonClientInternal injectFingerprintWithIdentifier:settledState:start:reply:]";
      __int16 v38 = 1024;
      int v39 = 955;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: start (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_9:
      if (a4 >= 3)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F5CFE8];
        uint64_t v32 = *MEMORY[0x1E4F28568];
        SEL v33 = @"requires a valid settledState.";
        uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v23 = &v33;
        int v24 = &v32;
      }
      else
      {
        if (v12)
        {
          long long v15 = [objc_alloc(MEMORY[0x1E4F5CDE8]) initWithIdentifier:v11 settledState:a4 start:v12 accessPoints:0];
          fingerprintManager = self->_fingerprintManager;
          id v29 = v15;
          id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke;
          v26[3] = &unk_1E6B916B8;
          v26[4] = self;
          SEL v28 = a2;
          id v27 = v13;
          [(RTFingerprintManager *)fingerprintManager injectFingerprints:v17 handler:v26];

          goto LABEL_24;
        }
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F5CFE8];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        id v31 = @"requires a valid start.";
        uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v23 = &v31;
        int v24 = &v30;
      }
LABEL_23:
      uint64_t v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
      long long v15 = [v20 errorWithDomain:v21 code:7 userInfo:v25];

      (*((void (**)(id, NSObject *))v13 + 2))(v13, v15);
      goto LABEL_24;
    }
LABEL_20:
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v35 = @"requires a valid identifier.";
    uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v23 = &v35;
    int v24 = &v34;
    goto LABEL_23;
  }
  long long v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
  }
LABEL_24:
}

void __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke_2;
  block[3] = &unk_1E6B96A30;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)injectFingerprintWithSettledState:(BOOL)a3 start:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v6) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F5CDE8]);
    id v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [v12 initWithIdentifier:v13 settledState:v11 start:v9 accessPoints:0];

    fingerprintManager = self->_fingerprintManager;
    v21[0] = v14;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke;
    v17[3] = &unk_1E6B916B8;
    v17[4] = self;
    SEL v19 = a2;
    id v18 = v10;
    [(RTFingerprintManager *)fingerprintManager injectFingerprints:v16 handler:v17];
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke_2;
  block[3] = &unk_1E6B96A30;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)injectWiFiAccessPointWithMac:(id)a3 rssi:(int64_t)a4 channel:(int64_t)a5 age:(double)a6 date:(id)a7 reply:(id)a8
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (v17)
  {
    id v18 = [objc_alloc(MEMORY[0x1E4F5CFD0]) initWithMac:v15 rssi:a4 channel:a5 age:v16 date:a6];
    fingerprintManager = self->_fingerprintManager;
    v25[0] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke;
    v21[3] = &unk_1E6B916B8;
    v21[4] = self;
    SEL v23 = a2;
    id v22 = v17;
    [(RTFingerprintManager *)fingerprintManager injectWifiAccessPointsToLastFingerprint:v20 handler:v21];
  }
  else
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke_2;
  block[3] = &unk_1E6B96A30;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)logDatabasesWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(RTDaemonClientInternal *)self learnedLocationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke;
    v7[3] = &unk_1E6B92690;
    void v7[4] = self;
    id v8 = v4;
    [v5 logDatabasesWithHandler:v7];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke_2;
  v7[3] = &unk_1E6B90D08;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)logSafetyCacheWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTDaemonClientInternal *)self safetyCacheStore];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke;
    v7[3] = &unk_1E6B92690;
    void v7[4] = self;
    id v8 = v4;
    [v5 logStoreWithHandler:v7];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke_2;
  v9[3] = &unk_1E6B90D08;
  id v5 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  dispatch_async(v4, v9);

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, v7, v8);
}

uint64_t __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performExportMirroringRequest:(id)a3
{
  if (a3)
  {
    persistenceManager = self->_persistenceManager;
    -[RTPersistenceManager performExportMirroringRequest:](persistenceManager, "performExportMirroringRequest:");
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)performImportMirroringRequest:(id)a3
{
  if (a3)
  {
    persistenceManager = self->_persistenceManager;
    -[RTPersistenceManager performImportMirroringRequest:](persistenceManager, "performImportMirroringRequest:");
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)performZoneResetMirroringRequest:(id)a3
{
  if (a3)
  {
    persistenceManager = self->_persistenceManager;
    -[RTPersistenceManager performZoneResetMirroringRequest:](persistenceManager, "performZoneResetMirroringRequest:");
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)mirroringDelegateSetupState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    persistenceManager = self->_persistenceManager;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __54__RTDaemonClientInternal_mirroringDelegateSetupState___block_invoke;
    v8[3] = &unk_1E6B96A58;
    id v9 = v4;
    [(RTPersistenceManager *)persistenceManager mirroringDelegateSetupState:v8];
    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

uint64_t __54__RTDaemonClientInternal_mirroringDelegateSetupState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tearDownPersistenceStack:(id)a3
{
  if (a3)
  {
    persistenceManager = self->_persistenceManager;
    -[RTPersistenceManager tearDownPersistenceStack:](persistenceManager, "tearDownPersistenceStack:");
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)fetchFMCEnabledWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTDaemonClientInternal *)self vehicleLocationProvider];
    [v5 fetchFMCEnabledWithHandler:v4];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    motionActivityManager = self->_motionActivityManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__RTDaemonClientInternal_fetchMotionActivitiesFromStartDate_endDate_reply___block_invoke;
    v14[3] = &unk_1E6B91690;
    SEL v18 = a2;
    v14[4] = self;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    [(RTMotionActivityManager *)motionActivityManager fetchMotionActivitiesFromStartDate:v15 endDate:v16 handler:v14];
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __75__RTDaemonClientInternal_fetchMotionActivitiesFromStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v5 count];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    int v13 = 138413570;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, reply to client, %@, %lu activites from startDate, %@, to endDate, %@, error, %@", (uint8_t *)&v13, 0x3Eu);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)submitMetrics:(id)a3 metricName:(id)a4 reply:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (NSString *)a4;
  uint64_t v9 = a5;
  if (v9)
  {
    Class v10 = NSClassFromString(v8);
    if (v10)
    {
      uint64_t v11 = v10;
      if ([(objc_class *)v10 conformsToProtocol:&unk_1F3457BB0])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_alloc_init(v11);
          id v26 = 0;
          [v12 setAllMetrics:v7 error:&v26];
          id v13 = v26;
          if (v13)
          {
            id v14 = v13;
            __int16 v15 = (void (*)(void *, id))v9[2];
          }
          else
          {
            id v25 = 0;
            char v22 = [v12 submitMetricsWithError:&v25];
            id v14 = v25;
            __int16 v15 = (void (*)(void *, id))v9[2];
            if (v22)
            {
              __int16 v23 = v9;
              id v24 = 0;
LABEL_17:
              v15(v23, v24);

              goto LABEL_13;
            }
          }
          __int16 v23 = v9;
          id v24 = v14;
          goto LABEL_17;
        }
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F5CFE8];
        uint64_t v28 = *MEMORY[0x1E4F28568];
        id v29 = @"metric provided is not a subclass of RTMetric";
        uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v19 = &v29;
        uint64_t v20 = &v28;
      }
      else
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F5CFE8];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        id v31 = @"metric provided does not conform to RTMetricProtocol";
        uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v19 = &v31;
        uint64_t v20 = &v30;
      }
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = @"metric class cannot be nil";
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v19 = (__CFString **)v33;
      uint64_t v20 = &v32;
    }
    __int16 v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    uint64_t v12 = [v16 errorWithDomain:v17 code:7 userInfo:v21];

    ((void (*)(void *, NSObject *))v9[2])(v9, v12);
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_13:
}

- (void)submitTransitMetricsWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTLearnedLocationManager *)self->_learnedLocationManager learnedLocationEngine];
    [v5 performTransitAnalyticsWithHandler:v4];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 reply:(id)a5
{
  if (a5)
  {
    learnedLocationStore = self->_learnedLocationStore;
    -[RTLearnedLocationStore expireLifetimeOfVisitsWithIdentifiers:expirationDate:handler:](learnedLocationStore, "expireLifetimeOfVisitsWithIdentifiers:expirationDate:handler:", a3, a4);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v7, 2u);
    }
  }
}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 toExpireOn:(id)a4 reply:(id)a5
{
  if (a5)
  {
    learnedLocationStore = self->_learnedLocationStore;
    [(RTLearnedLocationStore *)learnedLocationStore updateExpirationDateOfVisitsWithIdentifiers:a3 expirationDate:a4 allowThresholdBypass:1 handler:a5];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v7, 2u);
    }
  }
}

- (void)forceProcessWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 reply:(id)a11
{
  BOOL v13 = a7;
  BOOL v14 = a6;
  BOOL v15 = a5;
  BOOL v16 = a4;
  BOOL v17 = a3;
  id v20 = a11;
  if (v20)
  {
    unint64_t v30 = a9;
    SEL v31 = a2;
    __int16 v21 = dispatch_group_create();
    char v22 = objc_opt_new();
    if (v16)
    {
      dispatch_group_enter(v21);
      __int16 v23 = [(RTDaemonClientInternal *)self workoutScheduler];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke;
      v39[3] = &unk_1E6B96790;
      v39[4] = self;
      id v40 = v22;
      id v41 = v21;
      [v23 clearTaskStatesWithHandler:v39];
    }
    dispatch_group_enter(v21);
    id v24 = [(RTDaemonClientInternal *)self workoutRouteManager];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_3;
    v36[3] = &unk_1E6B96790;
    v36[4] = self;
    id v25 = v22;
    id v37 = v25;
    __int16 v38 = v21;
    id v26 = v21;
    LOBYTE(v29) = a10;
    [v24 processWorkoutsClearClusters:v17 clearExistingDistanceMatrix:v16 buildDistanceMatrix:v15 syncClustersToHealhtKit:v14 syncClustersToWatch:v13 filteringDistanceThreshold:v30 topNWorkouts:a8 isSchedulerTriggered:v29 handler:v36];

    id v27 = [(RTDaemonClientInternal *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_5;
    block[3] = &unk_1E6B90C40;
    SEL v35 = v31;
    void block[4] = self;
    id v33 = v25;
    id v34 = v20;
    id v28 = v25;
    dispatch_group_notify(v26, v27, block);
  }
  else
  {
    id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_2;
  block[3] = &unk_1E6B92F80;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) addObject:];
  }
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_4;
  block[3] = &unk_1E6B92F80;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) addObject:];
  }
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138412802;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, errors, %@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) firstObject];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (void)displayWorkoutDistanceRecordsWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [(RTDaemonClientInternal *)self workoutRouteManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke;
    v8[3] = &unk_1E6B916B8;
    void v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 displayWorkoutDistanceRecordsWithHandler:v8];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    int v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateRelevanceScoresWithReply:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTDaemonClientInternal *)self workoutRouteManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke;
    v8[3] = &unk_1E6B916B8;
    void v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 updateRelevanceScoresWithHandler:v8];
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    int v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)processNewlyAddedWorkout:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (!v7)
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: newlyAddedWorkoutUUID";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: reply";
    goto LABEL_10;
  }
  uint64_t v10 = [(RTDaemonClientInternal *)self workoutRouteManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke;
  v13[3] = &unk_1E6B916B8;
  void v13[4] = self;
  SEL v15 = a2;
  id v14 = v9;
  [v10 processNewlyAddedWorkout:v7 handler:v13];

LABEL_8:
}

void __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deleteWorkout:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (!v7)
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: workoutUUID";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid parameter not satisfying: reply";
    goto LABEL_10;
  }
  uint64_t v10 = [(RTDaemonClientInternal *)self workoutRouteManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke;
  v13[3] = &unk_1E6B916B8;
  void v13[4] = self;
  SEL v15 = a2;
  id v14 = v9;
  [v10 deleteWorkout:v7 handler:v13];

LABEL_8:
}

void __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = [(RTDaemonClientInternal *)self buildingPolygonManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke;
    v15[3] = &unk_1E6B91468;
    v15[4] = self;
    SEL v17 = a2;
    id v16 = v12;
    [v13 fetchClosestBuildingPolygonsFromLocations:v11 radius:a5 limit:v15 handler:a4];
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke_2;
  block[3] = &unk_1E6B91C48;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchIntermittentGNSSRegistrationStateWithReply:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    intermittentGNSSManager = self->_intermittentGNSSManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__RTDaemonClientInternal_fetchIntermittentGNSSRegistrationStateWithReply___block_invoke;
    v9[3] = &unk_1E6B90DD0;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [(RTIntermittentGNSSManager *)intermittentGNSSManager fetchIntermittentGNSSRegistrationStateWithHandler:v9];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __74__RTDaemonClientInternal_fetchIntermittentGNSSRegistrationStateWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = @"NO";
    int v10 = 138412802;
    SEL v11 = v7;
    if (a2) {
      __int16 v9 = @"YES";
    }
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    long long v15 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, reply to client, %@, RTIntermittentGNSSRegistered, %@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
}

- (void)updateIntermittentGNSSRegistrationOverrideState:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    intermittentGNSSManager = self->_intermittentGNSSManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__RTDaemonClientInternal_updateIntermittentGNSSRegistrationOverrideState_reply___block_invoke;
    v11[3] = &unk_1E6B96A80;
    SEL v13 = a2;
    unint64_t v14 = a3;
    void v11[4] = self;
    id v12 = v7;
    [(RTIntermittentGNSSManager *)intermittentGNSSManager updateIntermittentGNSSRegistrationOverrideState:a3 handler:v11];
  }
  else
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __80__RTDaemonClientInternal_updateIntermittentGNSSRegistrationOverrideState_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = +[RTIntermittentGNSSManager overrideStateToString:*(void *)(a1 + 56)];
    int v8 = 138412802;
    __int16 v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    SEL v13 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, reply to client, %@, client set intermittent gnss overrideState, %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)injectProximityEvent:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    __int16 v9 = self;
    __int16 v10 = [(RTDaemonClientInternal *)v9 peopleDiscoveryProvider];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke;
    v11[3] = &unk_1E6B916B8;
    void v11[4] = v9;
    SEL v13 = a2;
    id v12 = v8;
    [v10 addProximityEvent:v7 handler:v11];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    __int16 v9 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)injectPeopleDiscoveryAdv:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    __int16 v9 = self;
    uint64_t v10 = [(RTDaemonClientInternal *)v9 peopleDiscoveryProvider];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke;
    v11[3] = &unk_1E6B916B8;
    void v11[4] = v9;
    SEL v13 = a2;
    id v12 = v8;
    [v10 injectAdv:v7 handler:v11];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    __int16 v9 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeAllProximityEvent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    int v7 = [(RTDaemonClientInternal *)v6 peopleDiscoveryProvider];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke;
    v8[3] = &unk_1E6B916B8;
    void v8[4] = v6;
    SEL v10 = a2;
    id v9 = v5;
    [v7 clearProximityEvents:v8];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v6 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)injectPeopleDensityBundle:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    __int16 v9 = self;
    uint64_t v10 = [(RTDaemonClientInternal *)v9 peopleDiscoveryProvider];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke;
    v11[3] = &unk_1E6B916B8;
    void v11[4] = v9;
    SEL v13 = a2;
    id v12 = v8;
    [v10 addPeopleDensityBundle:v7 handler:v11];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    __int16 v9 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)injectPeopleDensityStats:(unint64_t)a3 duration:(double)a4 date:(id)a5 advertisements:(id)a6 handler:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    uint64_t v16 = self;
    SEL v17 = [(RTDaemonClientInternal *)v16 peopleDiscoveryProvider];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke;
    v18[3] = &unk_1E6B916B8;
    v18[4] = v16;
    SEL v20 = a2;
    id v19 = v15;
    [v17 injectPeopleDensityStats:a3 duration:v13 date:v14 advertisements:v18 handler:a4];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    uint64_t v16 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v16->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeAllPeopleDensityBundles:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    int v7 = [(RTDaemonClientInternal *)v6 peopleDiscoveryProvider];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke;
    v8[3] = &unk_1E6B916B8;
    void v8[4] = v6;
    SEL v10 = a2;
    id v9 = v5;
    [v7 clearPeopleDensityBundles:v8];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v6 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)computeContactScores:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    int v7 = [(RTDaemonClientInternal *)v6 peopleDiscoveryProvider];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __47__RTDaemonClientInternal_computeContactScores___block_invoke;
    v8[3] = &unk_1E6B916B8;
    void v8[4] = v6;
    SEL v10 = a2;
    id v9 = v5;
    [v7 computeContactScores:v8];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v6 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __47__RTDaemonClientInternal_computeContactScores___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTDaemonClientInternal_computeContactScores___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __47__RTDaemonClientInternal_computeContactScores___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchAuthorizedLocations:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTDaemonClientInternal *)self authorizedLocationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke;
    v8[3] = &unk_1E6B91468;
    void v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 fetchAuthorizedLocations:v8];
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke_2;
  block[3] = &unk_1E6B91C48;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchAuthorizedLocationExtendedStatus:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTDaemonClientInternal *)self authorizedLocationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke;
    v8[3] = &unk_1E6B96AD0;
    void v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 fetchAuthorizedLocationExtendedStatus:v8];
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke_2;
  block[3] = &unk_1E6B96AA8;
  void block[4] = *(void *)(a1 + 32);
  id v15 = v8;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v17 = v13;
  id v16 = v7;
  uint64_t v18 = a3;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, block);
}

uint64_t __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)forceAuthorizedLocationEraseInstallInitialization:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTDaemonClientInternal *)self authorizedLocationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke;
    v8[3] = &unk_1E6B90DD0;
    void v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 runEraseInstallDatabaseInitialization:v8];
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke_2;
  block[3] = &unk_1E6B96AF8;
  void block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  char v13 = a2;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)eraseVisitLogDatabase:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTDaemonClientInternal *)self authorizedLocationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke;
    v8[3] = &unk_1E6B916B8;
    void v8[4] = self;
    SEL v10 = a2;
    id v9 = v5;
    [v6 eraseVisitLogDatabase:v8];
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchVisitLogsWithDateInterval:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    __int16 v9 = [[RTAuthorizedLocationVisitLogFetchOptions alloc] initWithAscending:0 dateInterval:v7 limit:0];
    uint64_t v10 = [(RTDaemonClientInternal *)self authorizedLocationManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke;
    v11[3] = &unk_1E6B91468;
    void v11[4] = self;
    SEL v13 = a2;
    id v12 = v8;
    [v10 fetchVisitLogsWithOptions:v9 handler:v11];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    __int16 v9 = (RTAuthorizedLocationVisitLogFetchOptions *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
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
        SEL v13 = [*(id *)(*((void *)&v23 + 1) + 8 * v12) description];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id v14 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke_2;
  block[3] = &unk_1E6B91C48;
  void block[4] = *(void *)(a1 + 32);
  id v20 = v6;
  long long v18 = *(_OWORD *)(a1 + 40);
  id v15 = (id)v18;
  long long v22 = v18;
  id v21 = v7;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v14, block);
}

uint64_t __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    __int16 v11 = [(RTDaemonClientInternal *)self placeInferenceQueryStore];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke;
    v13[3] = &unk_1E6B91468;
    void v13[4] = self;
    SEL v15 = a2;
    id v14 = v10;
    [v11 fetchPlaceInferenceQueriesWithDateInterval:v9 ascending:v6 handler:v13];
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke_2;
  block[3] = &unk_1E6B923E8;
  void block[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    int v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)startSamplingPointOfInterestWithInterval:(double)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v7 = (void (**)(id, void))a4;
  if (v7)
  {
    __int16 v8 = [(RTDaemonClientInternal *)self pointOfInterestSampler];
    uint64_t v9 = [(RTDaemonClientInternal *)self executablePath];
    __int16 v10 = [v9 lastPathComponent];
    [v8 startSamplingPointOfInterestFromRequester:v10 samplingInterval:a3];

    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      int v14 = 138412802;
      long long v15 = v12;
      __int16 v16 = 2112;
      id v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v14, 0x20u);
    }
    v7[2](v7, 0);
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)stopSamplingPointOfInterest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a3;
  if (v5)
  {
    int v6 = [(RTDaemonClientInternal *)self pointOfInterestSampler];
    int v7 = [(RTDaemonClientInternal *)self executablePath];
    __int16 v8 = [v7 lastPathComponent];
    [v6 stopSamplingPointOfInterestFromRequester:v8];

    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = NSStringFromSelector(a2);
      int v12 = 138412802;
      id v13 = v10;
      __int16 v14 = 2112;
      long long v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v12, 0x20u);
    }
    v5[2](v5, 0);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(RTDaemonClientInternal *)self mapServiceManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke;
    v13[3] = &unk_1E6B91468;
    void v13[4] = self;
    SEL v15 = a2;
    id v14 = v10;
    [v11 fetchPointOfInterestsAroundCoordinate:v9 radius:0 options:v13 handler:a4];
  }
  else
  {
    int v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke_2;
  block[3] = &unk_1E6B923E8;
  void block[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    int v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    __int16 v8 = [(RTDaemonClientInternal *)self mapServiceManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke;
    v10[3] = &unk_1E6B96B20;
    void v10[4] = self;
    SEL v12 = a2;
    id v11 = v7;
    [v8 fetchPointOfInterestAttributesWithIdentifier:a3 options:0 handler:v10];
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E6B923E8;
  void block[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchCurrentLocationWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTDaemonClientInternal *)self locationManager];
    [v5 fetchCurrentLocationWithHandler:v4];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)periodicPurgeWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTDaemonClientInternal *)self purgeManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__RTDaemonClientInternal_periodicPurgeWithReply___block_invoke;
    v7[3] = &unk_1E6B90C18;
    __int16 v8 = v4;
    [v5 purge:v7];

    int v6 = v8;
  }
  else
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

uint64_t __49__RTDaemonClientInternal_periodicPurgeWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void)setExecutablePath:(id)a3
{
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (void)setSigningIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTEntitlementProvider)entitlementProvider
{
  return self->_entitlementProvider;
}

- (void)setEntitlementProvider:(id)a3
{
}

- (RTAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (RTAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTBuildingPolygonManager)buildingPolygonManager
{
  return self->_buildingPolygonManager;
}

- (void)setBuildingPolygonManager:(id)a3
{
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (RTEventModelProvider)eventModelProvider
{
  return self->_eventModelProvider;
}

- (void)setEventModelProvider:(id)a3
{
}

- (RTAuthorizedLocationManager)authorizedLocationManager
{
  return self->_authorizedLocationManager;
}

- (void)setAuthorizedLocationManager:(id)a3
{
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
}

- (RTIntermittentGNSSManager)intermittentGNSSManager
{
  return self->_intermittentGNSSManager;
}

- (void)setIntermittentGNSSManager:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (void)setLocationStore:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void)setPlaceInferenceQueryStore:(id)a3
{
}

- (RTPointOfInterestSampler)pointOfInterestSampler
{
  return self->_pointOfInterestSampler;
}

- (void)setPointOfInterestSampler:(id)a3
{
}

- (RTPurgeManager)purgeManager
{
  return self->_purgeManager;
}

- (void)setPurgeManager:(id)a3
{
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (void)setScenarioTriggerManager:(id)a3
{
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setVehicleLocationProvider:(id)a3
{
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
}

- (RTWorkoutRouteManager)workoutRouteManager
{
  return self->_workoutRouteManager;
}

- (void)setWorkoutRouteManager:(id)a3
{
}

- (RTWorkoutScheduler)workoutScheduler
{
  return self->_workoutScheduler;
}

- (void)setWorkoutScheduler:(id)a3
{
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (void)setSafetyCacheStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_workoutScheduler, 0);
  objc_storeStrong((id *)&self->_workoutRouteManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_pointOfInterestSampler, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_intermittentGNSSManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_buildingPolygonManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end