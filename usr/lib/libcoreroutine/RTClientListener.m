@interface RTClientListener
+ (id)persistedClientsPath;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)persistedClients;
- (RTAccountManager)accountManager;
- (RTAssetManager)assetManager;
- (RTAuthorizationManager)authorizationManager;
- (RTAuthorizedLocationManager)authorizedLocationManager;
- (RTBackgroundInertialOdometryManager)backgroundInertialOdometryManager;
- (RTClientListener)init;
- (RTClientListener)initWithAccountManager:(id)a3 assetManager:(id)a4 authorizationManager:(id)a5 backgroundInertialOdometryManager:(id)a6 contactsManager:(id)a7 defaultsManager:(id)a8 deviceLocationPredictor:(id)a9 diagnostics:(id)a10 elevationManager:(id)a11 eventAgentManager:(id)a12 eventModelProvider:(id)a13 authorizedLocationManager:(id)a14 fingerprintManager:(id)a15 healthKitManager:(id)a16 hintManager:(id)a17 intermittentGNSSManager:(id)a18 learnedLocationManager:(id)a19 learnedLocationStore:(id)a20 locationManager:(id)a21 locationContextManager:(id)a22 locationStore:(id)a23 mapServiceManager:(id)a24 metricManager:(id)a25 motionActivityManager:(id)a26 peopleDiscoveryProvider:(id)a27 placeInferenceManager:(id)a28 purgeManager:(id)a29 scenarioTriggerManager:(id)a30 timerManager:(id)a31 tripSegmentManager:(id)a32 vehicleLocationProvider:(id)a33 vehicleStore:(id)a34 visitManager:(id)a35 wifiManager:(id)a36;
- (RTContactsManager)contactsManager;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTDiagnostics)diagnostics;
- (RTElevationManager)elevationManager;
- (RTEventAgentManager)eventAgentManager;
- (RTEventModelProvider)eventModelProvider;
- (RTFingerprintManager)fingerprintManager;
- (RTHealthKitManager)healthKitManager;
- (RTHintManager)hintManager;
- (RTIntermittentGNSSManager)intermittentGNSSManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationContextManager)locationContextManager;
- (RTLocationManager)locationManager;
- (RTLocationStore)locationStore;
- (RTMapServiceManager)mapServiceManager;
- (RTMetricManager)metricManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider;
- (RTPlaceInferenceManager)placeInferenceManager;
- (RTPurgeManager)purgeManager;
- (RTScenarioTriggerManager)scenarioTriggerManager;
- (RTTimerManager)timerManager;
- (RTTripSegmentManager)tripSegmentManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTVehicleStore)vehicleStore;
- (RTVisitManager)visitManager;
- (RTWiFiManager)wifiManager;
- (id)handleClientConnection:(id)a3;
- (id)handleRestorationForDaemonClient:(id)a3;
- (void)_setup;
- (void)_setupConnection:(id)a3 forClient:(id)a4;
- (void)handleDisconnectionForDaemonClient:(id)a3;
- (void)saveDaemonClient:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setAuthorizedLocationManager:(id)a3;
- (void)setBackgroundInertialOdometryManager:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDeviceLocationPredictor:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setElevationManager:(id)a3;
- (void)setEventAgentManager:(id)a3;
- (void)setEventModelProvider:(id)a3;
- (void)setFingerprintManager:(id)a3;
- (void)setHealthKitManager:(id)a3;
- (void)setHintManager:(id)a3;
- (void)setIntermittentGNSSManager:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLocationContextManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationStore:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setPeopleDiscoveryProvider:(id)a3;
- (void)setPersistedClients:(id)a3;
- (void)setPlaceInferenceManager:(id)a3;
- (void)setPurgeManager:(id)a3;
- (void)setScenarioTriggerManager:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTripSegmentManager:(id)a3;
- (void)setVehicleLocationProvider:(id)a3;
- (void)setVehicleStore:(id)a3;
- (void)setVisitManager:(id)a3;
- (void)setWifiManager:(id)a3;
@end

@implementation RTClientListener

- (void)_setupConnection:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 suspend];
  v8 = [(RTXPCListener *)self queue];
  [v6 _setQueue:v8];

  [v6 setRemoteObjectInterface:self->_frameworkInterface];
  [v6 setExportedInterface:self->_daemonInterface];
  [v6 setExportedObject:v7];
  objc_initWeak(&location, v7);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__RTClientListener__setupConnection_forClient___block_invoke;
  v17[3] = &unk_1E6B91900;
  objc_copyWeak(&v18, &location);
  [v6 setInterruptionHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__RTClientListener__setupConnection_forClient___block_invoke_274;
  v15[3] = &unk_1E6B91900;
  objc_copyWeak(&v16, &location);
  [v6 setInvalidationHandler:v15];
  [v6 resume];
  v9 = +[RTXPC executablePathOfConnection:v6];
  [v7 setExecutablePath:v9];

  v10 = [v7 executablePath];
  v11 = [v10 lastPathComponent];
  [v7 setExecutableName:v11];

  [v7 setProcessIdentifier:[v6 processIdentifier]];
  v12 = +[RTXPC signingIdentifierOfConnection:v6];
  [v7 setSigningIdentifier:v12];

  v13 = [v7 signingIdentifier];
  [v7 setBundleIdentifier:v13];

  [v7 setXpcConnection:v6];
  v14 = [v7 xpcConnection];
  [v14 setDelegate:v7];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v21 = 0;
    BOOL v6 = +[RTXPC clientCodeSignatureIsValid:v5 error:&v21];
    id v7 = v21;
    v8 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v17 = [v5 processIdentifier];
        id v18 = [(RTXPCListener *)self machServiceName];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v23 = v17;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = v18;
        _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "listener received incoming connection from pid %d, for service, %@", buf, 0x12u);
      }
      uint64_t v10 = [(RTClientListener *)self handleClientConnection:v5];
      if (v10)
      {
        v9 = v10;
        v11 = [(RTXPCListener *)self connectedClients];
        [v11 addObject:v9];

        v12 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [(RTXPCListener *)self machServiceName];
          *(_DWORD *)buf = 138412546;
          *(void *)v23 = v9;
          *(_WORD *)&v23[8] = 2112;
          *(void *)&v23[10] = v13;
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "client connected, %@, to service, %@", buf, 0x16u);
        }
        [(RTXPCListener *)self logClients];
        BOOL v14 = 1;
        goto LABEL_18;
      }
      v15 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v19 = [v5 processIdentifier];
        v20 = [(RTXPCListener *)self machServiceName];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v23 = v19;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = v20;
        _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "failed to create client for connection from pid, %d, for service, %@", buf, 0x12u);
      }
      v9 = 0;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v23 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "incoming xpc connection failed code-signing check, error, %@.", buf, 0xCu);
    }
    BOOL v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "incoming xpc connection is nil", buf, 2u);
  }
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (id)handleClientConnection:(id)a3
{
  id v8 = a3;
  id v7 = [RTDaemonClient alloc];
  v4 = [(RTXPCListener *)self queue];
  id v5 = -[RTDaemonClient initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:](v7, "initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:", v4, 0, self->_accountManager, self->_assetManager, self->_authorizationManager, self->_backgroundInertialOdometryManager, self->_contactsManager, self->_defaultsManager, self->_deviceLocationPredictor, self->_diagnostics, self->_elevationManager, self->_eventAgentManager,
         self->_eventModelProvider,
         self->_authorizedLocationManager,
         self->_fingerprintManager,
         self->_healthKitManager,
         self->_hintManager,
         self->_intermittentGNSSManager,
         self->_learnedLocationManager,
         self->_learnedLocationStore,
         self->_locationManager,
         self->_locationContextManager,
         self->_locationStore,
         self->_mapServiceManager,
         self->_metricManager,
         self->_motionActivityManager,
         self->_peopleDiscoveryProvider,
         self->_placeInferenceManager,
         self->_purgeManager,
         self->_scenarioTriggerManager,
         self->_timerManager,
         self->_tripSegmentManager,
         self->_vehicleLocationProvider,
         self->_vehicleStore,
         self->_visitManager,
         self->_wifiManager);

  [(RTDaemonClient *)v5 setClientManagerDelegate:self];
  [(RTClientListener *)self _setupConnection:v8 forClient:v5];

  return v5;
}

- (void)saveDaemonClient:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [v5 restorationIdentifier];

  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v17 = [v5 restorationIdentifier];
      id v18 = [v5 restorationData];
      int v20 = 138413058;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@%@, restorationIdentifier, %@, restorationData, %@", (uint8_t *)&v20, 0x2Au);
    }
    id v8 = [v5 restorationData];

    v9 = [(RTClientListener *)self persistedClients];
    if (v8)
    {
      uint64_t v10 = [v5 restorationData];
      v11 = [v5 restorationIdentifier];
      [v9 setObject:v10 forKey:v11];
    }
    else
    {
      uint64_t v10 = [v5 restorationIdentifier];
      [v9 removeObjectForKey:v10];
    }

    v12 = [(RTClientListener *)self persistedClients];
    v13 = +[RTClientListener persistedClientsPath];
    int v14 = [v12 writeToFile:v13 atomically:0];

    v15 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v19 = @"NO";
      if (v14) {
        int v19 = @"YES";
      }
      int v20 = 138412290;
      id v21 = v19;
      _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "success writing persisted clients, %@", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (RTClientListener)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager_);
}

- (RTClientListener)initWithAccountManager:(id)a3 assetManager:(id)a4 authorizationManager:(id)a5 backgroundInertialOdometryManager:(id)a6 contactsManager:(id)a7 defaultsManager:(id)a8 deviceLocationPredictor:(id)a9 diagnostics:(id)a10 elevationManager:(id)a11 eventAgentManager:(id)a12 eventModelProvider:(id)a13 authorizedLocationManager:(id)a14 fingerprintManager:(id)a15 healthKitManager:(id)a16 hintManager:(id)a17 intermittentGNSSManager:(id)a18 learnedLocationManager:(id)a19 learnedLocationStore:(id)a20 locationManager:(id)a21 locationContextManager:(id)a22 locationStore:(id)a23 mapServiceManager:(id)a24 metricManager:(id)a25 motionActivityManager:(id)a26 peopleDiscoveryProvider:(id)a27 placeInferenceManager:(id)a28 purgeManager:(id)a29 scenarioTriggerManager:(id)a30 timerManager:(id)a31 tripSegmentManager:(id)a32 vehicleLocationProvider:(id)a33 vehicleStore:(id)a34 visitManager:(id)a35 wifiManager:(id)a36
{
  id v150 = a3;
  id v149 = a4;
  id v148 = a5;
  id v147 = a6;
  id v146 = a7;
  id v115 = a8;
  id v145 = a8;
  id v144 = a9;
  id v143 = a10;
  id v142 = a11;
  id v141 = a12;
  id v140 = a13;
  id v139 = a14;
  id v138 = a15;
  id v137 = a16;
  id v136 = a17;
  id v135 = a18;
  id v134 = a19;
  id v133 = a20;
  id v132 = a21;
  id v131 = a22;
  id v130 = a23;
  id v129 = a24;
  id v128 = a25;
  id v127 = a26;
  id v126 = a27;
  id v125 = a28;
  id v124 = a29;
  id v123 = a30;
  id v122 = a31;
  id v121 = a32;
  id v120 = a33;
  id v119 = a34;
  id v118 = a35;
  id v117 = a36;
  v152.receiver = self;
  v152.super_class = (Class)RTClientListener;
  v41 = [(RTXPCListener *)&v152 initWithMachServiceName:@"com.apple.routined.registration"];
  v42 = v41;
  if (v41)
  {
    objc_storeStrong((id *)&v41->_accountManager, a3);
    objc_storeStrong((id *)&v42->_assetManager, a4);
    objc_storeStrong((id *)&v42->_authorizationManager, a5);
    objc_storeStrong((id *)&v42->_backgroundInertialOdometryManager, a6);
    objc_storeStrong((id *)&v42->_contactsManager, a7);
    objc_storeStrong((id *)&v42->_defaultsManager, v115);
    objc_storeStrong((id *)&v42->_deviceLocationPredictor, a9);
    objc_storeStrong((id *)&v42->_diagnostics, a10);
    objc_storeStrong((id *)&v42->_elevationManager, a11);
    objc_storeStrong((id *)&v42->_eventAgentManager, a12);
    objc_storeStrong((id *)&v42->_eventModelProvider, a13);
    objc_storeStrong((id *)&v42->_fingerprintManager, a15);
    objc_storeStrong((id *)&v42->_authorizedLocationManager, a14);
    objc_storeStrong((id *)&v42->_healthKitManager, a16);
    objc_storeStrong((id *)&v42->_hintManager, a17);
    objc_storeStrong((id *)&v42->_intermittentGNSSManager, a18);
    objc_storeStrong((id *)&v42->_learnedLocationManager, a19);
    objc_storeStrong((id *)&v42->_learnedLocationStore, a20);
    objc_storeStrong((id *)&v42->_locationManager, a21);
    objc_storeStrong((id *)&v42->_locationContextManager, a22);
    objc_storeStrong((id *)&v42->_locationStore, a23);
    objc_storeStrong((id *)&v42->_mapServiceManager, a24);
    objc_storeStrong((id *)&v42->_metricManager, a25);
    objc_storeStrong((id *)&v42->_motionActivityManager, a26);
    objc_storeStrong((id *)&v42->_peopleDiscoveryProvider, a27);
    objc_storeStrong((id *)&v42->_placeInferenceManager, a28);
    objc_storeStrong((id *)&v42->_purgeManager, a29);
    objc_storeStrong((id *)&v42->_scenarioTriggerManager, a30);
    objc_storeStrong((id *)&v42->_timerManager, a31);
    objc_storeStrong((id *)&v42->_vehicleLocationProvider, a33);
    objc_storeStrong((id *)&v42->_vehicleStore, a34);
    objc_storeStrong((id *)&v42->_visitManager, a35);
    objc_storeStrong((id *)&v42->_tripSegmentManager, a32);
    objc_storeStrong((id *)&v42->_wifiManager, a36);
    uint64_t v43 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34F2E48];
    frameworkInterface = v42->_frameworkInterface;
    v42->_frameworkInterface = (NSXPCInterface *)v43;

    uint64_t v45 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F345F4E0];
    daemonInterface = v42->_daemonInterface;
    v42->_daemonInterface = (NSXPCInterface *)v45;

    v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v151 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    v55 = [v47 setWithObjects:v151, v48, v49, v50, v51, v52, v53, v54, objc_opt_class(), nil];
    [(NSXPCInterface *)v42->_daemonInterface setClasses:v55 forSelector:sel_extendLifetimeOfVisitsWithIdentifiers_reply_ argumentIndex:0 ofReply:0];
    v56 = v42->_daemonInterface;
    v57 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v58 = objc_opt_class();
    [v57 setWithObjects:v58, objc_opt_class(), 0];
    [(NSXPCInterface *)v56 setClasses:v59 forSelector:sel_fetchStoredVisitsWithOptions_reply_ argumentIndex:0 ofReply:0];

    v60 = v42->_daemonInterface;
    v61 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v62 = objc_opt_class();
    uint64_t v63 = objc_opt_class();
    [v61 setWithObjects:v62, v63, objc_opt_class(), nil];
    [(NSXPCInterface *)v60 setClasses:v64 forSelector:sel_fetchFamiliarityIndexResultsWithOptions_reply_ argumentIndex:0 ofReply:0];

    v65 = v42->_daemonInterface;
    v66 = [MEMORY[0x1E4F1CAD0] setWithObjects:objc_opt_class(), 0];
    [(NSXPCInterface *)v65 setClasses:v66 forSelector:sel_fetchAuthorizedLocationStatus_ argumentIndex:0 ofReply:0];

    v67 = v42->_daemonInterface;
    v68 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v69 = objc_opt_class();
    v70 = [v68 setWithObjects:v69, objc_opt_class(), 0];
    [(NSXPCInterface *)v67 setClasses:v70 forSelector:sel_fetchTripSegmentsWithOptions_reply_ argumentIndex:0 ofReply:0];

    v71 = v42->_daemonInterface;
    v72 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v73 = objc_opt_class();
    v74 = [v72 setWithObjects:v73, objc_opt_class(), 0];
    [(NSXPCInterface *)v71 setClasses:v74 forSelector:sel_fetchLocationsCountForTripSegmentWithOptions_reply_ argumentIndex:0 ofReply:0];

    v75 = v42->_daemonInterface;
    v76 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v77 = objc_opt_class();
    v78 = [v76 setWithObjects:v77, objc_opt_class(), 0];
    [(NSXPCInterface *)v75 setClasses:v78 forSelector:sel_fetchLocationsForTripSegmentWithOptions_reply_ argumentIndex:0 ofReply:0];

    v79 = v42->_daemonInterface;
    v80 = [MEMORY[0x1E4F1CAD0] setWithObjects:objc_opt_class(), 0];
    [(NSXPCInterface *)v79 setClasses:v80 forSelector:sel_deleteTripSegmentWithUUID_reply_ argumentIndex:0 ofReply:0];

    v81 = v42->_daemonInterface;
    v82 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v83 = objc_opt_class();
    [v82 setWithObjects:v83, objc_opt_class(), 0];
    [(NSXPCInterface *)v81 setClasses:v84 forSelector:sel_fetchTripSegmentMetadataWithOptions_reply_ argumentIndex:0 ofReply:0];

    v85 = v42->_daemonInterface;
    v86 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v87 = objc_opt_class();
    v88 = [v86 setWithObjects:v87, objc_opt_class(), 0];
    [(NSXPCInterface *)v85 setClasses:v88 forSelector:sel_fetchVehiclesWithOptions_reply_ argumentIndex:0 ofReply:0];

    v89 = v42->_daemonInterface;
    v90 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v91 = objc_opt_class();
    [v90 setWithObjects:v91, objc_opt_class(), 0];
    [(NSXPCInterface *)v89 setClasses:v92 forSelector:sel_fetchProximityHistoryFromEventIDs_completionHandler_ argumentIndex:0 ofReply:0];

    v93 = v42->_daemonInterface;
    v94 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v95 = objc_opt_class();
    v96 = [v94 setWithObjects:v95, objc_opt_class(), 0];
    [(NSXPCInterface *)v93 setClasses:v96 forSelector:sel_fetchPeopleCountEventsHistory_completionHandler_ argumentIndex:0 ofReply:0];

    v97 = v42->_daemonInterface;
    v98 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v99 = objc_opt_class();
    v100 = [v98 setWithObjects:v99, objc_opt_class(), nil];
    [(NSXPCInterface *)v97 setClasses:v100 forSelector:sel_fetchContactScoresFromContactIDs_completionHandler_ argumentIndex:0 ofReply:0];

    v101 = v42->_daemonInterface;
    v102 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v103 = objc_opt_class();
    [v102 setWithObjects:v103, objc_opt_class(), 0];
    [(NSXPCInterface *)v101 setClasses:v104 forSelector:sel_addElevations_handler_ argumentIndex:0 ofReply:0];

    v105 = v42->_daemonInterface;
    v106 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
    [(NSXPCInterface *)v105 setClasses:v106 forSelector:sel_fetchElevationsWithOptions_reply_ argumentIndex:0 ofReply:0];

    v107 = v42->_daemonInterface;
    v108 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v109 = objc_opt_class();
    v110 = [v108 setWithObjects:v109, objc_opt_class(), 0];
    [(NSXPCInterface *)v107 setClasses:v110 forSelector:sel_addBackgroundInertialOdometrySamples_reply_ argumentIndex:0 ofReply:0];

    v111 = v42->_daemonInterface;
    v112 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
    [(NSXPCInterface *)v111 setClasses:v112 forSelector:sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_ argumentIndex:0 ofReply:0];

    [(RTXPCListener *)v42 setup];
  }

  return v42;
}

- (void)_setup
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v4 = +[RTClientListener persistedClientsPath];
  id v5 = [v3 dictionaryWithContentsOfFile:v4];
  [(RTClientListener *)self setPersistedClients:v5];

  BOOL v6 = [(RTClientListener *)self persistedClients];

  if (!v6
    || ([(RTClientListener *)self persistedClients],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:@"$archiver"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = objc_opt_new();
    [(RTClientListener *)self setPersistedClients:v9];
  }
  uint64_t v10 = [(RTClientListener *)self persistedClients];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __26__RTClientListener__setup__block_invoke;
  v12[3] = &unk_1E6B9C1F8;
  v12[4] = self;
  [v10 enumerateKeysAndObjectsUsingBlock:v12];

  v11.receiver = self;
  v11.super_class = (Class)RTClientListener;
  [(RTXPCListener *)&v11 _setup];
}

void __26__RTClientListener__setup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = [RTDaemonClient alloc];
  id v5 = [*(id *)(a1 + 32) queue];
  BOOL v6 = *(void **)(a1 + 32);
  v9 = -[RTDaemonClient initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:](v8, "initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:", v5, v4, v6[37], v6[26], v6[17], v6[46], v6[43], v6[18], v6[19], v6[32], v6[45], v6[31],
         v6[22],
         v6[23],
         v6[40],
         v6[20],
         v6[27],
         v6[47],
         v6[33],
         v6[34],
         v6[29],
         v6[30],
         v6[28],
         v6[42],
         v6[38],
         v6[39],
         v6[36],
         v6[35],
         v6[21],
         v6[14],
         v6[44],
         v6[25],
         v6[15],
         v6[16],
         v6[24],
         v6[41]);

  [(RTDaemonClient *)v9 setClientManagerDelegate:*(void *)(a1 + 32)];
  id v7 = [*(id *)(a1 + 32) disconnectedClients];
  [v7 addObject:v9];
}

void __47__RTClientListener__setupConnection_forClient___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [WeakRetained executableName];
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc interruption", (uint8_t *)&v4, 0xCu);
  }
}

void __47__RTClientListener__setupConnection_forClient___block_invoke_274(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [WeakRetained executableName];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc invalidation", (uint8_t *)&v5, 0xCu);
  }
  [WeakRetained setXpcConnection:0];
  [WeakRetained setProcessIdentifier:0];
  [WeakRetained setExecutablePath:0];
  int v4 = [WeakRetained clientManagerDelegate];
  [v4 handleDisconnectionForDaemonClient:WeakRetained];
}

- (id)handleRestorationForDaemonClient:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 restorationIdentifier];

  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v4 restorationIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "rehydrate any existing session for client, %@, restoration identifier, %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy__149;
    uint64_t v45 = __Block_byref_object_dispose__149;
    id v46 = 0;
    id v8 = [(RTXPCListener *)self disconnectedClients];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __53__RTClientListener_handleRestorationForDaemonClient___block_invoke;
    v36[3] = &unk_1E6B9C220;
    id v9 = v4;
    id v37 = v9;
    v38 = buf;
    [v8 enumerateObjectsUsingBlock:v36];

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v10 = [v9 xpcConnection];
      [(RTClientListener *)self _setupConnection:v10 forClient:*(void *)(*(void *)&buf[8] + 40)];

      objc_super v11 = [(RTXPCListener *)self disconnectedClients];
      [v11 removeObject:*(void *)(*(void *)&buf[8] + 40)];

      v12 = [(RTXPCListener *)self connectedClients];
      [v12 addObject:*(void *)(*(void *)&buf[8] + 40)];

      v13 = [(RTXPCListener *)self connectedClients];
      [v13 removeObject:v9];

      [v9 setXpcConnection:0];
      [v9 shutdown];
      [(RTXPCListener *)self logClients];
      id v14 = *(id *)(*(void *)&buf[8] + 40);
    }
    else
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__149;
      v34 = __Block_byref_object_dispose__149;
      id v35 = 0;
      v15 = [(RTXPCListener *)self connectedClients];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      __int16 v26 = __53__RTClientListener_handleRestorationForDaemonClient___block_invoke_2;
      v27 = &unk_1E6B9C220;
      id v16 = v9;
      id v28 = v16;
      v29 = &v30;
      [v15 enumerateObjectsUsingBlock:&v24];

      if (v31[5])
      {
        int v17 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v16 restorationIdentifier:v24, v25, v26, v27];
          *(_DWORD *)v39 = 138412546;
          id v40 = v16;
          __int16 v41 = 2112;
          v42 = v23;
          _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "client, %@, already rehydrated session for restoration identifier, %@, terminating connection, this is likely a programming error that multiple instances of RTRoutineManager from the same process are using the same restoration identifier", v39, 0x16u);
        }
        id v18 = [v16 xpcConnection];
        [v18 invalidate];

        [v16 shutdown];
        int v19 = [(RTXPCListener *)self connectedClients];
        [v19 removeObject:v16];

        [(RTXPCListener *)self logClients];
      }
      else
      {
        int v20 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = [v16 restorationIdentifier:v24, v25, v26, v27];
          *(_DWORD *)v39 = 138412290;
          id v40 = v21;
          _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "client, %@, does not have any existing sessions", v39, 0xCu);
        }
      }

      _Block_object_dispose(&v30, 8);
      id v14 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __53__RTClientListener_handleRestorationForDaemonClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = [v10 restorationIdentifier];
  id v8 = [*(id *)(a1 + 32) restorationIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __53__RTClientListener_handleRestorationForDaemonClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(id *)(a1 + 32) != v4)
  {
    id v8 = v4;
    int v5 = [v4 restorationIdentifier];
    uint64_t v6 = [*(id *)(a1 + 32) restorationIdentifier];
    int v7 = [v5 isEqualToString:v6];

    id v4 = v8;
    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      id v4 = v8;
    }
  }
}

- (void)handleDisconnectionForDaemonClient:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "client disconnected, %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [(RTXPCListener *)self connectedClients];
  [v6 removeObject:v4];

  if ([v4 hasReasonToOutliveClientConnection])
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "client, %@, has a reason outlive client connection", (uint8_t *)&v9, 0xCu);
    }

    id v8 = [(RTXPCListener *)self disconnectedClients];
    [v8 addObject:v4];
  }
  else
  {
    [v4 shutdown];
  }
  [(RTXPCListener *)self logClients];
}

- (NSMutableDictionary)persistedClients
{
  return self->_persistedClients;
}

- (void)setPersistedClients:(id)a3
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

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
}

- (RTPurgeManager)purgeManager
{
  return self->_purgeManager;
}

- (void)setPurgeManager:(id)a3
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

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
}

- (RTTripSegmentManager)tripSegmentManager
{
  return self->_tripSegmentManager;
}

- (void)setTripSegmentManager:(id)a3
{
}

- (RTAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (void)setLocationStore:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTLocationContextManager)locationContextManager
{
  return self->_locationContextManager;
}

- (void)setLocationContextManager:(id)a3
{
}

- (RTEventAgentManager)eventAgentManager
{
  return self->_eventAgentManager;
}

- (void)setEventAgentManager:(id)a3
{
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
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

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (void)setPlaceInferenceManager:(id)a3
{
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
}

- (RTAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (void)setElevationManager:(id)a3
{
}

- (RTBackgroundInertialOdometryManager)backgroundInertialOdometryManager
{
  return self->_backgroundInertialOdometryManager;
}

- (void)setBackgroundInertialOdometryManager:(id)a3
{
}

- (RTIntermittentGNSSManager)intermittentGNSSManager
{
  return self->_intermittentGNSSManager;
}

- (void)setIntermittentGNSSManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermittentGNSSManager, 0);
  objc_storeStrong((id *)&self->_backgroundInertialOdometryManager, 0);
  objc_storeStrong((id *)&self->_elevationManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_eventAgentManager, 0);
  objc_storeStrong((id *)&self->_locationContextManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_persistedClients, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);

  objc_storeStrong((id *)&self->_frameworkInterface, 0);
}

+ (id)persistedClientsPath
{
  return (id)[MEMORY[0x1E4F28CB8] pathInCacheDirectory:@"Clients.plist"];
}

@end