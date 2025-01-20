@interface RTClientListenerInternal
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RTAccountManager)accountManager;
- (RTAssetManager)assetManager;
- (RTAuthorizationManager)authorizationManager;
- (RTAuthorizedLocationManager)authorizedLocationManager;
- (RTBuildingPolygonManager)buildingPolygonManager;
- (RTClientListenerInternal)init;
- (RTClientListenerInternal)initWithAccountManager:(id)a3 assetManager:(id)a4 authorizationManager:(id)a5 buildingPolygonManager:(id)a6 deviceLocationPredictor:(id)a7 diagnostics:(id)a8 eventAgentManager:(id)a9 eventModelProvider:(id)a10 authorizedLocationManager:(id)a11 fingerprintManager:(id)a12 hintManager:(id)a13 intermittentGNSSManager:(id)a14 learnedLocationManager:(id)a15 learnedLocationStore:(id)a16 locationManager:(id)a17 locationStore:(id)a18 mapServiceManager:(id)a19 motionActivityManager:(id)a20 peopleDiscoveryProvider:(id)a21 persistenceManager:(id)a22 placeInferenceQueryStore:(id)a23 platform:(id)a24 pointOfInterestSampler:(id)a25 purgeManager:(id)a26 safetyCacheStore:(id)a27 scenarioTriggerManager:(id)a28 vehicleLocationProvider:(id)a29 visitManager:(id)a30 workoutRouteManager:(id)a31 workoutScheduler:(id)a32;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTDiagnostics)diagnostics;
- (RTEventAgentManager)eventAgentManager;
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
- (RTPlatform)platform;
- (RTPointOfInterestSampler)pointOfInterestSampler;
- (RTPurgeManager)purgeManager;
- (RTScenarioTriggerManager)scenarioTriggerManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTVisitManager)visitManager;
- (RTWiFiManager)wifiManager;
- (RTWorkoutRouteManager)workoutRouteManager;
- (RTWorkoutScheduler)workoutScheduler;
- (SMSafetyCacheStore)safetyCacheStore;
- (id)handleClientConnection:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setAuthorizedLocationManager:(id)a3;
- (void)setBuildingPolygonManager:(id)a3;
- (void)setDeviceLocationPredictor:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setEventAgentManager:(id)a3;
- (void)setEventModelProvider:(id)a3;
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
- (void)setPlatform:(id)a3;
- (void)setPointOfInterestSampler:(id)a3;
- (void)setPurgeManager:(id)a3;
- (void)setSafetyCacheStore:(id)a3;
- (void)setScenarioTriggerManager:(id)a3;
- (void)setVehicleLocationProvider:(id)a3;
- (void)setVisitManager:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)setWorkoutRouteManager:(id)a3;
- (void)setWorkoutScheduler:(id)a3;
@end

@implementation RTClientListenerInternal

- (RTClientListenerInternal)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_assetManager_authorizationManager_buildingPolygonManager_deviceLocationPredictor_diagnostics_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationStore_mapServiceManager_motionActivityManager_peopleDiscoveryProvider_persistenceManager_placeInferenceQueryStore_platform_pointOfInterestSampler_purgeManager_safetyCacheStore_scenarioTriggerManager_vehicleLocationProvider_visitManager_workoutRouteManager_workoutScheduler_);
}

- (RTClientListenerInternal)initWithAccountManager:(id)a3 assetManager:(id)a4 authorizationManager:(id)a5 buildingPolygonManager:(id)a6 deviceLocationPredictor:(id)a7 diagnostics:(id)a8 eventAgentManager:(id)a9 eventModelProvider:(id)a10 authorizedLocationManager:(id)a11 fingerprintManager:(id)a12 hintManager:(id)a13 intermittentGNSSManager:(id)a14 learnedLocationManager:(id)a15 learnedLocationStore:(id)a16 locationManager:(id)a17 locationStore:(id)a18 mapServiceManager:(id)a19 motionActivityManager:(id)a20 peopleDiscoveryProvider:(id)a21 persistenceManager:(id)a22 placeInferenceQueryStore:(id)a23 platform:(id)a24 pointOfInterestSampler:(id)a25 purgeManager:(id)a26 safetyCacheStore:(id)a27 scenarioTriggerManager:(id)a28 vehicleLocationProvider:(id)a29 visitManager:(id)a30 workoutRouteManager:(id)a31 workoutScheduler:(id)a32
{
  id v73 = a3;
  id v54 = a4;
  id v53 = a5;
  id v52 = a6;
  id v42 = a7;
  id v51 = a7;
  id v43 = a8;
  id v50 = a8;
  id v49 = a9;
  id v72 = a10;
  id v71 = a11;
  id v70 = a12;
  id v69 = a13;
  id v68 = a14;
  id v48 = a15;
  id v67 = a16;
  id v66 = a17;
  id v65 = a18;
  id v47 = a19;
  id v64 = a20;
  id v63 = a21;
  id v46 = a22;
  id v62 = a23;
  id v37 = a24;
  id v61 = a25;
  id v60 = a26;
  id v59 = a27;
  id v58 = a28;
  id v57 = a29;
  id v56 = a30;
  id v55 = a31;
  id v45 = a32;
  if ([v37 internalInstall])
  {
    v75.receiver = self;
    v75.super_class = (Class)RTClientListenerInternal;
    v38 = [(RTXPCListener *)&v75 initWithMachServiceName:@"com.apple.routined.internal"];
    p_isa = (id *)&v38->super.super.super.isa;
    if (v38)
    {
      objc_storeStrong((id *)&v38->_accountManager, a3);
      objc_storeStrong(p_isa + 12, a4);
      objc_storeStrong(p_isa + 13, a5);
      objc_storeStrong(p_isa + 14, a6);
      objc_storeStrong(p_isa + 15, v42);
      objc_storeStrong(p_isa + 16, v43);
      objc_storeStrong(p_isa + 17, a9);
      objc_storeStrong(p_isa + 18, a10);
      objc_storeStrong(p_isa + 19, a11);
      objc_storeStrong(p_isa + 20, a12);
      objc_storeStrong(p_isa + 21, a13);
      objc_storeStrong(p_isa + 22, a14);
      objc_storeStrong(p_isa + 23, a15);
      objc_storeStrong(p_isa + 24, a16);
      objc_storeStrong(p_isa + 25, a17);
      objc_storeStrong(p_isa + 26, a18);
      objc_storeStrong(p_isa + 27, a19);
      objc_storeStrong(p_isa + 28, a20);
      objc_storeStrong(p_isa + 30, a21);
      objc_storeStrong(p_isa + 29, a22);
      objc_storeStrong(p_isa + 31, a23);
      objc_storeStrong(p_isa + 33, a24);
      objc_storeStrong(p_isa + 32, a25);
      objc_storeStrong(p_isa + 34, a26);
      objc_storeStrong(p_isa + 35, a28);
      objc_storeStrong(p_isa + 36, a29);
      objc_storeStrong(p_isa + 37, a30);
      objc_storeStrong(p_isa + 39, a31);
      objc_storeStrong(p_isa + 40, a32);
      objc_storeStrong(p_isa + 41, a27);
      [p_isa setup];
    }
    v40 = p_isa;
    self = v40;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)handleClientConnection:(id)a3
{
  id v4 = a3;
  v11 = [RTDaemonClientInternal alloc];
  v5 = [(RTXPCListener *)self queue];
  v6 = -[RTDaemonClientInternal initWithQueue:accountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:](v11, "initWithQueue:accountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:", v5, self->_accountManager, self->_assetManager, self->_authorizationManager, self->_buildingPolygonManager, self->_deviceLocationPredictor, self->_diagnostics, self->_eventModelProvider, self->_authorizedLocationManager, self->_fingerprintManager, self->_hintManager, self->_intermittentGNSSManager, self->_learnedLocationManager,
         self->_learnedLocationStore,
         self->_locationManager,
         self->_locationStore,
         self->_mapServiceManager,
         self->_motionActivityManager,
         self->_peopleDiscoveryProvider,
         self->_persistenceManager,
         self->_placeInferenceQueryStore,
         self->_pointOfInterestSampler,
         self->_purgeManager,
         self->_safetyCacheStore,
         self->_scenarioTriggerManager,
         self->_vehicleLocationProvider,
         self->_visitManager,
         self->_workoutRouteManager,
         self->_workoutScheduler);

  v7 = +[RTXPC executablePathOfConnection:v4];
  [(RTDaemonClientInternal *)v6 setExecutablePath:v7];

  -[RTDaemonClientInternal setProcessIdentifier:](v6, "setProcessIdentifier:", [v4 processIdentifier]);
  v8 = +[RTXPC signingIdentifierOfConnection:v4];
  [(RTDaemonClientInternal *)v6 setSigningIdentifier:v8];

  [(RTDaemonClientInternal *)v6 setXpcConnection:v4];
  v9 = [(RTDaemonClientInternal *)v6 xpcConnection];
  [v9 setDelegate:v6];

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "incoming xpc connection is nil", (uint8_t *)&v21, 2u);
    }
    goto LABEL_15;
  }
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v19 = [v7 processIdentifier];
      v20 = [(RTXPCListener *)self machServiceName];
      int v21 = 67109378;
      *(_DWORD *)v22 = v19;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v20;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "listener received incoming connection from pid %d, for service, %@", (uint8_t *)&v21, 0x12u);
    }
    uint64_t v9 = [(RTClientListenerInternal *)self handleClientConnection:v7];
    if (v9)
    {
      v10 = v9;
      v11 = [(RTXPCListener *)self connectedClients];
      [v11 addObject:v10];

      v12 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [(RTXPCListener *)self machServiceName];
        int v21 = 138412546;
        *(void *)v22 = v10;
        *(_WORD *)&v22[8] = 2112;
        *(void *)&v22[10] = v13;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "client connected, %@, to service, %@", (uint8_t *)&v21, 0x16u);
      }
      [(RTXPCListener *)self logClients];
      BOOL v14 = 1;
      goto LABEL_16;
    }
    v15 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = [v7 processIdentifier];
      v17 = [(RTXPCListener *)self machServiceName];
      int v21 = 67109378;
      *(_DWORD *)v22 = v16;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v17;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "failed to create client for connection from pid, %d, for service, %@", (uint8_t *)&v21, 0x12u);
    }
    v10 = 0;
LABEL_15:
    BOOL v14 = 0;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v14 = 0;
LABEL_17:

  return v14;
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

- (RTEventAgentManager)eventAgentManager
{
  return self->_eventAgentManager;
}

- (void)setEventAgentManager:(id)a3
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

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
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

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
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

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
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
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_pointOfInterestSampler, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
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
  objc_storeStrong((id *)&self->_eventAgentManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_buildingPolygonManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end