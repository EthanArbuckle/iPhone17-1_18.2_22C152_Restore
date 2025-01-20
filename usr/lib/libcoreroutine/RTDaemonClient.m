@interface RTDaemonClient
+ (id)filterVisits:(id)a3 executable:(id)a4;
- (BOOL)enabled;
- (BOOL)hasReasonToOutliveClientConnection;
- (BOOL)leechLowConfidenceVisits;
- (BOOL)leechVisits;
- (BOOL)monitorPlaceInferences;
- (BOOL)monitorVisits;
- (BOOL)supported;
- (BOOL)targetUserSession;
- (NSMutableDictionary)restorationData;
- (NSMutableDictionary)vendedClassesStoreManagerDict;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)executableName;
- (NSString)executablePath;
- (NSString)restorationIdentifier;
- (NSString)signingIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (RTAccountManager)accountManager;
- (RTAssetManager)assetManager;
- (RTAuthorizationManager)authorizationManager;
- (RTAuthorizedLocationManager)authorizedLocationManager;
- (RTBackgroundInertialOdometryManager)backgroundInertialOdometryManager;
- (RTClientListenerProtocol)clientManagerDelegate;
- (RTContactsManager)contactsManager;
- (RTDaemonClient)init;
- (RTDaemonClient)initWithQueue:(id)a3 restorationData:(id)a4 accountManager:(id)a5 assetManager:(id)a6 authorizationManager:(id)a7 backgroundInertialOdometryManager:(id)a8 contactsManager:(id)a9 defaultsManager:(id)a10 deviceLocationPredictor:(id)a11 diagnostics:(id)a12 elevationManager:(id)a13 eventAgentManager:(id)a14 eventModelProvider:(id)a15 authorizedLocationManager:(id)a16 fingerprintManager:(id)a17 healthKitManager:(id)a18 hintManager:(id)a19 intermittentGNSSManager:(id)a20 learnedLocationManager:(id)a21 learnedLocationStore:(id)a22 locationManager:(id)a23 locationContextManager:(id)a24 locationStore:(id)a25 mapServiceManager:(id)a26 metricManager:(id)a27 motionActivityManager:(id)a28 peopleDiscoveryProvider:(id)a29 placeInferenceManager:(id)a30 purgeManager:(id)a31 scenarioTriggerManager:(id)a32 timerManager:(id)a33 tripSegmentManager:(id)a34 vehicleLocationProvider:(id)a35 vehicleStore:(id)a36 visitManager:(id)a37 wifiManager:(id)a38;
- (RTDaemonClientRegistrarPeopleDiscovery)peopleDiscoveryRegistrar;
- (RTDaemonClientRegistrarScenarioTrigger)scenarioTriggerRegistrar;
- (RTDaemonClientRegistrarVehicleEvent)vehicleEventRegistrar;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTDiagnostics)diagnostics;
- (RTElevationManager)elevationManager;
- (RTEntitlementProvider)entitlementProvider;
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
- (RTPlaceInferenceOptions)placeInferenceOptions;
- (RTPurgeManager)purgeManager;
- (RTScenarioTriggerManager)scenarioTriggerManager;
- (RTTimerManager)timerManager;
- (RTTripSegmentManager)tripSegmentManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTVehicleStore)vehicleStore;
- (RTVisitManager)visitManager;
- (RTWiFiManager)wifiManager;
- (id)_clientIdentifier;
- (int)processIdentifier;
- (void)_fetchHindsightVisitsWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5;
- (void)_fetchRealtimeVisitsWithDateInterval:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_onLocationContextManagerNotification:(id)a3;
- (void)_onVisitManagerNotification:(id)a3;
- (void)_startMonitoringVehicleEvents;
- (void)addBackgroundInertialOdometrySamples:(id)a3 reply:(id)a4;
- (void)addElevations:(id)a3 handler:(id)a4;
- (void)addLocationOfInterestOfType:(int64_t)a3 mapItemStorage:(id)a4 customLabel:(id)a5 reply:(id)a6;
- (void)clearAllVehicleEventsWithReply:(id)a3;
- (void)clearRoutineWithReply:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)deleteTripSegmentWithUUID:(id)a3 reply:(id)a4;
- (void)engageInVehicleEventWithIdentifier:(id)a3 reply:(id)a4;
- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)fetchAllLocationsOfInterestForSettingsWithReply:(id)a3;
- (void)fetchAuthorizedLocationStatus:(id)a3;
- (void)fetchAutomaticVehicleEventDetectionSupportedWithReply:(id)a3;
- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 reply:(id)a4;
- (void)fetchCloudSyncAuthorizationStateWithReply:(id)a3;
- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchCurrentPredictedLocationsOfInterestLookingBack:(double)a3 lookingAhead:(double)a4 reply:(id)a5;
- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 reply:(id)a4;
- (void)fetchElevationsWithOptions:(id)a3 reply:(id)a4;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(id)a4 reply:(id)a5;
- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 reply:(id)a5;
- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 reply:(id)a4;
- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3;
- (void)fetchLastVehicleEventsWithReply:(id)a3;
- (void)fetchLocationOfInterestAtLocation:(id)a3 reply:(id)a4;
- (void)fetchLocationOfInterestForRegion:(id)a3 reply:(id)a4;
- (void)fetchLocationOfInterestWithIdentifier:(id)a3 reply:(id)a4;
- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 reply:(id)a4;
- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 reply:(id)a4;
- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 reply:(id)a4;
- (void)fetchLocationsOfInterestOfType:(int64_t)a3 reply:(id)a4;
- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5;
- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 reply:(id)a5;
- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 reply:(id)a4;
- (void)fetchMonitoredScenarioTriggerTypesWithReply:(id)a3;
- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 reply:(id)a6;
- (void)fetchOngoingPeopleDensity:(id)a3;
- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 reply:(id)a4;
- (void)fetchPeopleCountEventsHistory:(id)a3 completionHandler:(id)a4;
- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)fetchPlaceInferencesWithOptions:(id)a3 reply:(id)a4;
- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 reply:(id)a5;
- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 reply:(id)a6;
- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5;
- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 reply:(id)a4;
- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)fetchRemoteStatusWithReply:(id)a3;
- (void)fetchRoutineEnabledWithReply:(id)a3;
- (void)fetchRoutineModeFromLocation:(id)a3 reply:(id)a4;
- (void)fetchStoredLocationsWithContext:(id)a3 reply:(id)a4;
- (void)fetchStoredVisitsWithOptions:(id)a3 reply:(id)a4;
- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5;
- (void)fetchTripSegmentMetadataWithOptions:(id)a3 reply:(id)a4;
- (void)fetchTripSegmentsWithOptions:(id)a3 reply:(id)a4;
- (void)fetchVehiclesWithOptions:(id)a3 reply:(id)a4;
- (void)launchClient;
- (void)onAuthorizationNotification:(id)a3;
- (void)onLocationContextManagerNotification:(id)a3;
- (void)onVisitManagerNotification:(id)a3;
- (void)peopleDiscoveryRegistrar:(id)a3 didReceivePeopleDensityUpdate:(id)a4 error:(id)a5;
- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 reply:(id)a5;
- (void)processHindsightVisitsWithReply:(id)a3;
- (void)removeLocationOfInterestWithIdentifier:(id)a3 reply:(id)a4;
- (void)removeVisitWithIdentifier:(id)a3 reply:(id)a4;
- (void)restore;
- (void)scenarioTriggerRegistrar:(id)a3 didReceiveScenarioTriggers:(id)a4 error:(id)a5;
- (void)setAccountManager:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setAuthorizedLocationManager:(id)a3;
- (void)setBackgroundInertialOdometryManager:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setClientManagerDelegate:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDeviceLocationPredictor:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setElevationManager:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEntitlementProvider:(id)a3;
- (void)setEventAgentManager:(id)a3;
- (void)setEventModelProvider:(id)a3;
- (void)setExecutableName:(id)a3;
- (void)setExecutablePath:(id)a3;
- (void)setFingerprintManager:(id)a3;
- (void)setHealthKitManager:(id)a3;
- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 reply:(id)a5;
- (void)setHintManager:(id)a3;
- (void)setIntermittentGNSSManager:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLeechLowConfidenceVisits:(BOOL)a3;
- (void)setLeechVisits:(BOOL)a3;
- (void)setLocationContextManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationStore:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setMonitorPlaceInferences:(BOOL)a3;
- (void)setMonitorVisits:(BOOL)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setPeopleDiscoveryProvider:(id)a3;
- (void)setPeopleDiscoveryRegistrar:(id)a3;
- (void)setPlaceInferenceManager:(id)a3;
- (void)setPlaceInferenceOptions:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setPurgeManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRestorationData:(id)a3;
- (void)setRestorationIdentifier:(id)a3;
- (void)setRoutineEnabled:(BOOL)a3 reply:(id)a4;
- (void)setScenarioTriggerManager:(id)a3;
- (void)setScenarioTriggerRegistrar:(id)a3;
- (void)setSigningIdentifier:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setTimerManager:(id)a3;
- (void)setTripSegmentManager:(id)a3;
- (void)setVehicleEventRegistrar:(id)a3;
- (void)setVehicleLocationProvider:(id)a3;
- (void)setVehicleStore:(id)a3;
- (void)setVendedClassesStoreManagerDict:(id)a3;
- (void)setVisitManager:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)shutdown;
- (void)startLeechingLowConfidenceVisitsWithReply:(id)a3;
- (void)startLeechingVisitsWithReply:(id)a3;
- (void)startMonitoringForPeopleDiscovery:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)startMonitoringPlaceInferencesWithOptions:(id)a3 reply:(id)a4;
- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 reply:(id)a4;
- (void)startMonitoringVehicleEventsWithReply:(id)a3;
- (void)startMonitoringVisitsWithReply:(id)a3;
- (void)stopLeechingLowConfidenceVisitsWithReply:(id)a3;
- (void)stopLeechingVisitsWithReply:(id)a3;
- (void)stopMonitoringForPeopleDiscoveryWithReply:(id)a3;
- (void)stopMonitoringPlaceInferencesWithReply:(id)a3;
- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 reply:(id)a4;
- (void)stopMonitoringVehicleEventsWithReply:(id)a3;
- (void)stopMonitoringVisitsWithReply:(id)a3;
- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 reply:(id)a4;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 reply:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItemStorage:(id)a4 reply:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 customLabel:(id)a5 reply:(id)a6;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 mapItemStorage:(id)a5 customLabel:(id)a6 reply:(id)a7;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 reply:(id)a5;
- (void)updateVehicleEventWithIdentifier:(id)a3 geoMapItem:(id)a4 reply:(id)a5;
- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4 reply:(id)a5;
- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4 reply:(id)a5;
- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4 reply:(id)a5;
- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 geoMapItem:(id)a6 reply:(id)a7;
- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 reply:(id)a5;
- (void)vehicleEventRegistrar:(id)a3 didReceiveVehicleEvents:(id)a4 error:(id)a5;
@end

@implementation RTDaemonClient

void __54__RTDaemonClient_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) invoke];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v8 = [*(id *)(a1 + 40) executableName];
      v9 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v8;
      __int16 v81 = 2112;
      v82 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_EVENT, v5, "ClientService", "client %@, request %@", buf, 0x16u);
    }
    v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = [*(id *)(a1 + 40) executableName];
      v18 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v17;
      __int16 v81 = 2112;
      v82 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);
    }
    v12 = [*(id *)(a1 + 32) target];
    v13 = [*(id *)(*(void *)(a1 + 40) + 64) protocol];
    int v14 = [v12 conformsToProtocol:v13];

    if (v14)
    {
      v15 = [*(id *)(a1 + 48) exportedInterface];
      v16 = [v15 replyBlockSignatureForSelector:objc_msgSend(*(id *)(a1 + 32), "selector")];
    }
    else
    {
      v16 = 0;
    }
    int v19 = [*(id *)(a1 + 40) supported];
    v20 = (void *)_MergedGlobals_93;
    v21 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
    if ([v20 containsObject:v21]) {
      int v22 = 1;
    }
    else {
      int v22 = [*(id *)(a1 + 40) enabled];
    }

    v23 = (void *)qword_1EBE387E0;
    v24 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
    v25 = [v23 objectForKey:v24];

    if ([v25 count])
    {
      if ([v25 count])
      {
        v26 = [*(id *)(a1 + 40) executableName];
        if ([v25 containsObject:v26])
        {
          int v27 = 1;
        }
        else
        {
          v28 = [*(id *)(a1 + 40) bundleIdentifier];
          int v27 = [v25 containsObject:v28];
        }
      }
      else
      {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 1;
    }
    int v29 = [*(id *)(*(void *)(a1 + 40) + 64) clientConnection:*(void *)(a1 + 48) satisfiesEntitlementRequirementsForInvocation:*(void *)(a1 + 32)];
    if (v16)
    {
      if (v29)
      {
        if (v19)
        {
          if (v22)
          {
            if (v27)
            {
              uint64_t v30 = [*(id *)(a1 + 32) blockArgumentIndex];
              *(void *)buf = 0;
              [*(id *)(a1 + 32) getArgument:buf atIndex:v30];
              v31 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
              v32 = (void *)[*(id *)buf copy];
              [v16 UTF8String];
              v68 = v31;
              id v69 = v10;
              v70 = v32;
              id v33 = v32;
              id v34 = v31;
              id v71 = (id)__NSMakeSpecialForwardingCaptureBlock();
              [*(id *)(a1 + 32) setArgument:&v71 atIndex:v30];
              [*(id *)(a1 + 32) invoke];
              uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
              v36 = *(void **)(v35 + 40);
              *(void *)(v35 + 40) = 0;
            }
            else
            {
              uint64_t v72 = *MEMORY[0x1E4F28568];
              v56 = NSString;
              v57 = [*(id *)(a1 + 40) executableName];
              v58 = [v56 stringWithFormat:@"This operation is unavailable for %@.", v57];
              v73 = v58;
              v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];

              v60 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:v59];
              v61 = _rt_log_facility_get_os_log(RTLogFacilityClient);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                v66 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
                v67 = [*(id *)(a1 + 40) executableName];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v66;
                __int16 v81 = 2112;
                v82 = v67;
                _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "invocation, %@, for client, %@, is unavailable.", buf, 0x16u);
              }
              [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v60 replyTypes:v16];
              uint64_t v62 = *(void *)(*(void *)(a1 + 56) + 8);
              v63 = *(void **)(v62 + 40);
              *(void *)(v62 + 40) = 0;
            }
          }
          else
          {
            uint64_t v74 = *MEMORY[0x1E4F28568];
            v75 = @"This operation is not supported since Significant Locations is not enabled.";
            v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
            v53 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:v52];
            [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v53 replyTypes:v16];
            uint64_t v54 = *(void *)(*(void *)(a1 + 56) + 8);
            v55 = *(void **)(v54 + 40);
            *(void *)(v54 + 40) = 0;
          }
        }
        else
        {
          uint64_t v76 = *MEMORY[0x1E4F28568];
          v77 = @"This operation is not supported on this platform.";
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          v49 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v48];
          [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v49 replyTypes:v16];
          uint64_t v50 = *(void *)(*(void *)(a1 + 56) + 8);
          v51 = *(void **)(v50 + 40);
          *(void *)(v50 + 40) = 0;
        }
      }
      else
      {
        uint64_t v78 = *MEMORY[0x1E4F28568];
        v39 = NSString;
        v40 = [*(id *)(a1 + 40) executableName];
        v41 = [v39 stringWithFormat:@"%@ is not entitled for this operation.", v40];
        v79 = v41;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];

        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        v44 = (void *)[v43 initWithDomain:*MEMORY[0x1E4F5CFE8] code:3 userInfo:v42];
        v45 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v64 = [*(id *)(a1 + 40) executableName];
          v65 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v64;
          __int16 v81 = 2112;
          v82 = v65;
          _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "client, %@, is not entitled for invocation, %@.", buf, 0x16u);
        }
        [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 32) withError:v44 replyTypes:v16];
        uint64_t v46 = *(void *)(*(void *)(a1 + 56) + 8);
        v47 = *(void **)(v46 + 40);
        *(void *)(v46 + 40) = 0;
      }
    }
    else
    {
      if ((v29 & v19 & v22 & v27) == 1) {
        [*(id *)(a1 + 32) invoke];
      }
      uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8);
      v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = 0;
    }
  }
}

- (NSString)executableName
{
  return self->_executableName;
}

void __54__RTDaemonClient_connection_handleInvocation_isReply___block_invoke_475(void *a1, void *a2)
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

- (BOOL)supported
{
  return self->_supported;
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
  v29[3] = __Block_byref_object_copy__9;
  v29[4] = __Block_byref_object_dispose__9;
  uint64_t v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  int v14 = NSStringFromSelector(a2);
  id v15 = [v11 stringWithFormat:@"%@-%@", v13, v14];
  [v15 UTF8String];
  id v30 = (id)os_transaction_create();

  v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    int v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v32 = v21;
    __int16 v33 = 2112;
    id v34 = v22;
    _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RTDaemonClient_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_1E6B913A0;
  BOOL v28 = a5;
  id v24 = v10;
  v25 = self;
  id v26 = v9;
  int v27 = v29;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v29, 8);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RTDaemonClient)initWithQueue:(id)a3 restorationData:(id)a4 accountManager:(id)a5 assetManager:(id)a6 authorizationManager:(id)a7 backgroundInertialOdometryManager:(id)a8 contactsManager:(id)a9 defaultsManager:(id)a10 deviceLocationPredictor:(id)a11 diagnostics:(id)a12 elevationManager:(id)a13 eventAgentManager:(id)a14 eventModelProvider:(id)a15 authorizedLocationManager:(id)a16 fingerprintManager:(id)a17 healthKitManager:(id)a18 hintManager:(id)a19 intermittentGNSSManager:(id)a20 learnedLocationManager:(id)a21 learnedLocationStore:(id)a22 locationManager:(id)a23 locationContextManager:(id)a24 locationStore:(id)a25 mapServiceManager:(id)a26 metricManager:(id)a27 motionActivityManager:(id)a28 peopleDiscoveryProvider:(id)a29 placeInferenceManager:(id)a30 purgeManager:(id)a31 scenarioTriggerManager:(id)a32 timerManager:(id)a33 tripSegmentManager:(id)a34 vehicleLocationProvider:(id)a35 vehicleStore:(id)a36 visitManager:(id)a37 wifiManager:(id)a38
{
  v306[27] = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v220 = a4;
  id v155 = a5;
  id v42 = a5;
  id v236 = a6;
  id v254 = a7;
  id v252 = a8;
  id v251 = a9;
  id v250 = a10;
  id v249 = a11;
  id v248 = a12;
  id v247 = a13;
  id v246 = a14;
  id v245 = a15;
  id v244 = a16;
  id v243 = a17;
  id v242 = a18;
  id v241 = a19;
  id v240 = a20;
  id v239 = a21;
  id v238 = a22;
  id v237 = a23;
  id v235 = a24;
  id v219 = a25;
  id v234 = a26;
  id v233 = a27;
  id v232 = a28;
  id v231 = a29;
  id v230 = a30;
  id v229 = a31;
  id v228 = a32;
  id v227 = a33;
  id v224 = a34;
  id v226 = a35;
  id v223 = a36;
  id v225 = a37;
  id v222 = a38;
  id v221 = v41;
  if (!v41)
  {
    v84 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v85 = 0;
    goto LABEL_62;
  }
  id v161 = v42;
  if (!v42)
  {
    v86 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accountManager", buf, 2u);
    }

    v85 = 0;
    id v42 = 0;
LABEL_62:
    id v43 = v236;
LABEL_99:
    v89 = v219;
    v90 = self;
    v91 = v220;
    goto LABEL_100;
  }
  id v43 = v236;
  if (!v236)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: assetManager";
LABEL_97:
    _os_log_error_impl(&dword_1D9BFA000, v87, OS_LOG_TYPE_ERROR, v88, buf, 2u);
    goto LABEL_98;
  }
  if (!v254)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: authorizationManager";
    goto LABEL_97;
  }
  if (!v252)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: backgroundInertialOdometryManager";
    goto LABEL_97;
  }
  if (!v251)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: contactsManager";
    goto LABEL_97;
  }
  if (!v250)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_97;
  }
  if (!v249)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: deviceLocationPredictor";
    goto LABEL_97;
  }
  if (!v248)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_97;
  }
  if (!v247)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: elevationManager";
    goto LABEL_97;
  }
  if (!v246)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: eventAgentManager";
    goto LABEL_97;
  }
  if (!v245)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: eventModelProvider";
    goto LABEL_97;
  }
  if (!v244)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: authorizedLocationManager";
    goto LABEL_97;
  }
  if (!v243)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_97;
  }
  if (!v242)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_97;
  }
  if (!v241)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_97;
  }
  if (!v240)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: intermittentGNSSManager";
    goto LABEL_97;
  }
  if (!v239)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_98;
    }
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_97;
  }
  if (!v238)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v88 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_97;
    }
LABEL_98:

    v85 = 0;
    goto LABEL_99;
  }
  if (!v237)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v93, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
    }
    goto LABEL_133;
  }
  if (!v235)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: locationContextManager";
LABEL_132:
    _os_log_error_impl(&dword_1D9BFA000, v93, OS_LOG_TYPE_ERROR, v94, buf, 2u);
    goto LABEL_133;
  }
  if (!v234)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_132;
  }
  if (!v233)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_132;
  }
  if (!v232)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_132;
  }
  if (!v231)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: peopleDiscoveryProvider";
    goto LABEL_132;
  }
  if (!v230)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: placeInferenceManager";
    goto LABEL_132;
  }
  if (!v229)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: purgeManager";
    goto LABEL_132;
  }
  if (!v228)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: scenarioTriggerManager";
    goto LABEL_132;
  }
  if (!v227)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_132;
  }
  if (!v226)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: vehicleLocationProvider";
    goto LABEL_132;
  }
  if (!v225)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_132;
  }
  if (!v224)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: tripSegmentManager";
    goto LABEL_132;
  }
  if (!v223)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: vehicleStore";
    goto LABEL_132;
  }
  if (!v222)
  {
    v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v94 = "Invalid parameter not satisfying: wifiManager";
      goto LABEL_132;
    }
LABEL_133:

    v85 = 0;
    v91 = v220;
    id v43 = v236;
    v89 = v219;
    v90 = self;
    goto LABEL_100;
  }
  v271.receiver = self;
  v271.super_class = (Class)RTDaemonClient;
  v218 = [(RTDaemonClient *)&v271 init];
  if (v218)
  {
    objc_storeStrong((id *)&v218->_queue, a3);
    objc_storeStrong((id *)&v218->_accountManager, v155);
    objc_storeStrong((id *)&v218->_assetManager, a6);
    objc_storeStrong((id *)&v218->_authorizationManager, a7);
    objc_storeStrong((id *)&v218->_backgroundInertialOdometryManager, a8);
    objc_storeStrong((id *)&v218->_contactsManager, a9);
    objc_storeStrong((id *)&v218->_defaultsManager, a10);
    objc_storeStrong((id *)&v218->_deviceLocationPredictor, a11);
    objc_storeStrong((id *)&v218->_diagnostics, a12);
    objc_storeStrong((id *)&v218->_elevationManager, a13);
    objc_storeStrong((id *)&v218->_eventAgentManager, a14);
    objc_storeStrong((id *)&v218->_eventModelProvider, a15);
    objc_storeStrong((id *)&v218->_authorizedLocationManager, a16);
    objc_storeStrong((id *)&v218->_fingerprintManager, a17);
    objc_storeStrong((id *)&v218->_healthKitManager, a18);
    objc_storeStrong((id *)&v218->_hintManager, a19);
    objc_storeStrong((id *)&v218->_intermittentGNSSManager, a20);
    objc_storeStrong((id *)&v218->_learnedLocationManager, a21);
    objc_storeStrong((id *)&v218->_learnedLocationStore, a22);
    objc_storeStrong((id *)&v218->_locationManager, a23);
    objc_storeStrong((id *)&v218->_locationContextManager, a24);
    objc_storeStrong((id *)&v218->_locationStore, a25);
    objc_storeStrong((id *)&v218->_mapServiceManager, a26);
    objc_storeStrong((id *)&v218->_metricManager, a27);
    objc_storeStrong((id *)&v218->_motionActivityManager, a28);
    objc_storeStrong((id *)&v218->_peopleDiscoveryProvider, a29);
    objc_storeStrong((id *)&v218->_placeInferenceManager, a30);
    objc_storeStrong((id *)&v218->_purgeManager, a31);
    objc_storeStrong((id *)&v218->_scenarioTriggerManager, a32);
    objc_storeStrong((id *)&v218->_timerManager, a33);
    objc_storeStrong((id *)&v218->_vehicleLocationProvider, a35);
    objc_storeStrong((id *)&v218->_vehicleStore, a36);
    objc_storeStrong((id *)&v218->_visitManager, a37);
    objc_storeStrong((id *)&v218->_tripSegmentManager, a34);
    objc_storeStrong((id *)&v218->_wifiManager, a38);
    v136 = (void *)MEMORY[0x1E4F1CAD0];
    v215 = NSStringFromSelector(sel_startMonitoringVisitsWithReply_);
    NSStringFromSelector(sel_stopMonitoringVisitsWithReply_);
    id v212 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startLeechingVisitsWithReply_);
    id v209 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopLeechingVisitsWithReply_);
    id v206 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startLeechingLowConfidenceVisitsWithReply_);
    id v203 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopLeechingLowConfidenceVisitsWithReply_);
    id v201 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startMonitoringPlaceInferencesWithOptions_reply_);
    id v199 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopMonitoringPlaceInferencesWithReply_);
    id v197 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchStoredVisitsWithOptions_reply_);
    id v193 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchTripSegmentsWithOptions_reply_);
    id v195 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchLocationsCountForTripSegmentWithOptions_reply_);
    id v185 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchLocationsForTripSegmentWithOptions_reply_);
    id v191 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deleteTripSegmentWithUUID_reply_);
    id v181 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchVehiclesWithOptions_reply_);
    id v189 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchTripSegmentMetadataWithOptions_reply_);
    id v187 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startMonitoringScenarioTriggerOfType_reply_);
    id v183 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopMonitoringScenarioTriggerOfType_reply_);
    id v175 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchMonitoredScenarioTriggerTypesWithReply_);
    id v179 = (id)objc_claimAutoreleasedReturnValue();
    v135 = NSStringFromSelector(sel_startMonitoringVehicleEventsWithReply_);
    NSStringFromSelector(sel_stopMonitoringVehicleEventsWithReply_);
    id v177 = (id)objc_claimAutoreleasedReturnValue();
    v134 = NSStringFromSelector(sel_setRoutineEnabled_reply_);
    NSStringFromSelector(sel_fetchRoutineEnabledWithReply_);
    id v173 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_clearRoutineWithReply_);
    id v171 = (id)objc_claimAutoreleasedReturnValue();
    v132 = NSStringFromSelector(sel_setRestorationIdentifier_);
    NSStringFromSelector(sel_setTargetUserSession_);
    id v169 = (id)objc_claimAutoreleasedReturnValue();
    v131 = NSStringFromSelector(sel_fetchCloudSyncAuthorizationStateWithReply_);
    NSStringFromSelector(sel_updateCloudSyncProvisionedForAccount_reply_);
    id v167 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchAllLocationsOfInterestForSettingsWithReply_);
    id v165 = (id)objc_claimAutoreleasedReturnValue();
    v162 = NSStringFromSelector(sel_addElevations_handler_);
    NSStringFromSelector(sel_fetchElevationsWithOptions_reply_);
    id v159 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_);
    id v157 = (id)objc_claimAutoreleasedReturnValue();
    v129 = NSStringFromSelector(sel_addBackgroundInertialOdometrySamples_reply_);
    v128 = NSStringFromSelector(sel_startMonitoringForPeopleDiscovery_configuration_reply_);
    v44 = NSStringFromSelector(sel_stopMonitoringForPeopleDiscoveryWithReply_);
    v45 = NSStringFromSelector(sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_);
    v127 = NSStringFromSelector(sel_fetchProximityHistoryFromEventIDs_completionHandler_);
    uint64_t v46 = NSStringFromSelector(sel_fetchPeopleCountEventsHistory_completionHandler_);
    v126 = NSStringFromSelector(sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_);
    v47 = NSStringFromSelector(sel_fetchOngoingPeopleDensity_);
    v48 = NSStringFromSelector(sel_fetchContactScoresFromContactIDs_completionHandler_);
    v49 = NSStringFromSelector(sel_fetchAuthorizedLocationStatus_);
    objc_msgSend(v136, "setWithObjects:", v215, v212, v209, v206, v203, v201, v199, v197, v193, v195, v185, v191, v181, v189, v187, v183, v175,
      v179,
      v135,
      v177,
      v134,
      v173,
      v171,
      v132,
      v169,
      v131,
      v167,
      v165,
      v162,
      v159,
      v157,
      v129,
      v128,
      v44,
      v45,
      v127,
      v46,
      v126,
      v47,
      v48,
      v49,
    uint64_t v50 = 0);
    v51 = (void *)_MergedGlobals_93;
    _MergedGlobals_93 = v50;

    id v202 = [(id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:@"locationd", @"loctool", @"RTDiagnosticExtension", @"xctest", @"wedge", @"coreautomationd", @"Routine", @"routinetool", @"RoutineAssistant", @"safetyalertsd", @"momentsd", 0];
    NSStringFromSelector(sel_fetchFormattedPostalAddressesFromMeCard_);
    id v213 = (id)objc_claimAutoreleasedReturnValue();
    v305[0] = v213;
    v304[0] = @"locationd";
    v304[1] = @"wedge";
    v304[2] = @"xctest";
    id v210 = [MEMORY[0x1E4F1C978] arrayWithObjects:v304 count:3];
    v306[0] = v210;
    NSStringFromSelector(sel_fetchPlaceInferencesWithOptions_reply_);
    id v207 = (id)objc_claimAutoreleasedReturnValue();
    v305[1] = v207;
    v303[0] = @"locationd";
    v303[1] = @"wedge";
    v303[2] = @"coreautomationd";
    id v204 = [MEMORY[0x1E4F1C978] arrayWithObjects:v303 count:3];
    v306[1] = v204;
    NSStringFromSelector(sel_startMonitoringVisitsWithReply_);
    id v200 = (id)objc_claimAutoreleasedReturnValue();
    v305[2] = v200;
    v302[0] = @"locationd";
    v302[1] = @"wedge";
    v302[2] = @"xctest";
    id v198 = [MEMORY[0x1E4F1C978] arrayWithObjects:v302 count:3];
    v306[2] = v198;
    NSStringFromSelector(sel_startLeechingVisitsWithReply_);
    id v196 = (id)objc_claimAutoreleasedReturnValue();
    v305[3] = v196;
    v301[0] = @"locationd";
    v301[1] = @"wedge";
    id v194 = [MEMORY[0x1E4F1C978] arrayWithObjects:v301 count:2];
    v306[3] = v194;
    NSStringFromSelector(sel_startLeechingLowConfidenceVisitsWithReply_);
    id v192 = (id)objc_claimAutoreleasedReturnValue();
    v305[4] = v192;
    v300[0] = @"locationd";
    v300[1] = @"wedge";
    id v190 = [MEMORY[0x1E4F1C978] arrayWithObjects:v300 count:2];
    v306[4] = v190;
    NSStringFromSelector(sel_startMonitoringPlaceInferencesWithOptions_reply_);
    id v188 = (id)objc_claimAutoreleasedReturnValue();
    v305[5] = v188;
    v299[0] = @"locationd";
    v299[1] = @"wedge";
    v299[2] = @"xctest";
    id v186 = [MEMORY[0x1E4F1C978] arrayWithObjects:v299 count:3];
    v306[5] = v186;
    NSStringFromSelector(sel_fetchStoredVisitsWithOptions_reply_);
    id v184 = (id)objc_claimAutoreleasedReturnValue();
    v305[6] = v184;
    v298[0] = @"locationd";
    v298[1] = @"wedge";
    v298[2] = @"loctool";
    v298[3] = @"xctest";
    v298[4] = @"coreautomationd";
    v298[5] = @"Routine";
    v298[6] = @"momentsd";
    v298[7] = @"intelligenceplatformd";
    v298[8] = @"knowledgeconstructiond";
    v298[9] = @"destinationd";
    v298[10] = @"com.apple.Maps";
    id v182 = [MEMORY[0x1E4F1C978] arrayWithObjects:v298 count:11];
    v306[6] = v182;
    NSStringFromSelector(sel_processHindsightVisitsWithReply_);
    id v180 = (id)objc_claimAutoreleasedReturnValue();
    v305[7] = v180;
    v297[0] = @"wedge";
    v297[1] = @"xctest";
    v297[2] = @"Routine";
    v297[3] = @"momentsd";
    id v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:v297 count:4];
    v306[7] = v178;
    NSStringFromSelector(sel_fetchTripSegmentsWithOptions_reply_);
    id v176 = (id)objc_claimAutoreleasedReturnValue();
    v305[8] = v176;
    v296[0] = @"locationd";
    v296[1] = @"wedge";
    v296[2] = @"xctest";
    v296[3] = @"Routine";
    v296[4] = @"routinetool";
    v296[5] = @"RoutineAssistant";
    v296[6] = @"com.apple.momentsd";
    v296[7] = @"com.apple.MomentsUIService";
    v296[8] = @"com.apple.appsspecialprojects.PromptValidator";
    id v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:v296 count:9];
    v306[8] = v174;
    NSStringFromSelector(sel_fetchLocationsCountForTripSegmentWithOptions_reply_);
    id v172 = (id)objc_claimAutoreleasedReturnValue();
    v305[9] = v172;
    v295[0] = @"locationd";
    v295[1] = @"wedge";
    v295[2] = @"xctest";
    v295[3] = @"Routine";
    v295[4] = @"routinetool";
    v295[5] = @"RoutineAssistant";
    v295[6] = @"com.apple.momentsd";
    v295[7] = @"com.apple.MomentsUIService";
    v295[8] = @"com.apple.appsspecialprojects.PromptValidator";
    id v170 = [MEMORY[0x1E4F1C978] arrayWithObjects:v295 count:9];
    v306[9] = v170;
    NSStringFromSelector(sel_fetchLocationsForTripSegmentWithOptions_reply_);
    id v168 = (id)objc_claimAutoreleasedReturnValue();
    v305[10] = v168;
    v294[0] = @"locationd";
    v294[1] = @"wedge";
    v294[2] = @"xctest";
    v294[3] = @"Routine";
    v294[4] = @"routinetool";
    v294[5] = @"RoutineAssistant";
    v294[6] = @"com.apple.momentsd";
    v294[7] = @"com.apple.MomentsUIService";
    v294[8] = @"com.apple.appsspecialprojects.PromptValidator";
    id v166 = [MEMORY[0x1E4F1C978] arrayWithObjects:v294 count:9];
    v306[10] = v166;
    v163 = NSStringFromSelector(sel_deleteTripSegmentWithUUID_reply_);
    v305[11] = v163;
    v293[0] = @"locationd";
    v293[1] = @"wedge";
    v293[2] = @"xctest";
    v293[3] = @"Routine";
    v293[4] = @"routinetool";
    v293[5] = @"RoutineAssistant";
    id v160 = [MEMORY[0x1E4F1C978] arrayWithObjects:v293 count:6];
    v306[11] = v160;
    NSStringFromSelector(sel_fetchVehiclesWithOptions_reply_);
    id v158 = (id)objc_claimAutoreleasedReturnValue();
    v305[12] = v158;
    v292[0] = @"locationd";
    v292[1] = @"wedge";
    v292[2] = @"xctest";
    v292[3] = @"Routine";
    v292[4] = @"routinetool";
    v292[5] = @"RoutineAssistant";
    v148 = [MEMORY[0x1E4F1C978] arrayWithObjects:v292 count:6];
    v306[12] = v148;
    NSStringFromSelector(sel_fetchTripSegmentMetadataWithOptions_reply_);
    v149 = (char *)objc_claimAutoreleasedReturnValue();
    v305[13] = v149;
    v291[0] = @"locationd";
    v291[1] = @"wedge";
    v291[2] = @"xctest";
    v291[3] = @"Routine";
    v291[4] = @"routinetool";
    v291[5] = @"RoutineAssistant";
    v291[6] = @"com.apple.momentsd";
    v291[7] = @"com.apple.MomentsUIService";
    v291[8] = @"com.apple.appsspecialprojects.PromptValidator";
    v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:v291 count:9];
    v306[13] = v147;
    NSStringFromSelector(sel_fetchAllLocationsOfInterestForSettingsWithReply_);
    v146 = (char *)objc_claimAutoreleasedReturnValue();
    v305[14] = v146;
    v290[0] = @"com.apple.Preferences";
    v290[1] = @"SecurityPrivacyExtension";
    v290[2] = @"com.apple.NanoSettings";
    v290[3] = @"xctest";
    v290[4] = @"wedge";
    v290[5] = @"coreautomationd";
    v290[6] = @"RTDiagnosticExtension";
    v290[7] = @"induce";
    v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:v290 count:8];
    v306[14] = v145;
    NSStringFromSelector(sel_setRoutineEnabled_reply_);
    v150 = (char *)objc_claimAutoreleasedReturnValue();
    v305[15] = v150;
    v289[0] = @"com.apple.Preferences";
    v289[1] = @"SecurityPrivacyExtension";
    v289[2] = @"com.apple.NanoSettings";
    v289[3] = @"xctest";
    v289[4] = @"wedge";
    v289[5] = @"coreautomationd";
    v144 = [MEMORY[0x1E4F1C978] arrayWithObjects:v289 count:6];
    v306[15] = v144;
    NSStringFromSelector(sel_clearRoutineWithReply_);
    v151 = (char *)objc_claimAutoreleasedReturnValue();
    v305[16] = v151;
    v288[0] = @"com.apple.Preferences";
    v288[1] = @"SecurityPrivacyExtension";
    v288[2] = @"com.apple.NanoSettings";
    v288[3] = @"xctest";
    v288[4] = @"wedge";
    v288[5] = @"coreautomationd";
    v288[6] = @"RTDiagnosticExtension";
    v288[7] = @"induce";
    v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:v288 count:8];
    v306[16] = v143;
    NSStringFromSelector(sel_fetchPathToDiagnosticFilesWithOptions_reply_);
    v142 = (char *)objc_claimAutoreleasedReturnValue();
    v305[17] = v142;
    v287[0] = @"com.apple.Preferences";
    v287[1] = @"SecurityPrivacyExtension";
    v287[2] = @"com.apple.NanoSettings";
    v287[3] = @"xctest";
    v287[4] = @"wedge";
    v287[5] = @"coreautomationd";
    v287[6] = @"RTDiagnosticExtension";
    v287[7] = @"induce";
    v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:v287 count:8];
    v306[17] = v141;
    NSStringFromSelector(sel_fetchCloudSyncAuthorizationStateWithReply_);
    id v152 = (id)objc_claimAutoreleasedReturnValue();
    v305[18] = v152;
    v286[0] = @"com.apple.Preferences";
    v286[1] = @"SecurityPrivacyExtension";
    v286[2] = @"com.apple.NanoSettings";
    v286[3] = @"accountsd";
    v286[4] = @"xctest";
    v286[5] = @"wedge";
    v286[6] = @"coreautomationd";
    v286[7] = @"RTDiagnosticExtension";
    v286[8] = @"Routine";
    v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v286 count:9];
    v306[18] = v140;
    NSStringFromSelector(sel_updateCloudSyncProvisionedForAccount_reply_);
    id obja = (id)objc_claimAutoreleasedReturnValue();
    v305[19] = obja;
    v285[0] = @"accountsd";
    v285[1] = @"xctest";
    v285[2] = @"wedge";
    v285[3] = @"coreautomationd";
    v285[4] = @"Routine";
    v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:v285 count:5];
    v306[19] = v139;
    NSStringFromSelector(sel_fetchEnumerableObjectsWithOptions_offset_reply_);
    aSelector = (char *)objc_claimAutoreleasedReturnValue();
    v305[20] = aSelector;
    v284[0] = @"locationd";
    v284[1] = @"RTDiagnosticExtension";
    v284[2] = @"xctest";
    v284[3] = @"wedge";
    v284[4] = @"coreautomationd";
    v284[5] = @"Routine";
    v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:v284 count:6];
    v306[20] = v133;
    v130 = NSStringFromSelector(sel_fetchEstimatedLocationAtDate_options_reply_);
    v305[21] = v130;
    v283[0] = @"locationd";
    v283[1] = @"loctool";
    v283[2] = @"RTDiagnosticExtension";
    v283[3] = @"xctest";
    v283[4] = @"wedge";
    v283[5] = @"coreautomationd";
    v283[6] = @"Routine";
    v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v283 count:7];
    v306[21] = v137;
    NSStringFromSelector(sel_fetchElevationsWithOptions_reply_);
    id v156 = (id)objc_claimAutoreleasedReturnValue();
    v305[22] = v156;
    v282[0] = @"locationd";
    v282[1] = @"wedge";
    v282[2] = @"xctest";
    v282[3] = @"Routine";
    v282[4] = @"routinetool";
    v282[5] = @"RoutineAssistant";
    v216 = [MEMORY[0x1E4F1C978] arrayWithObjects:v282 count:6];
    v306[22] = v216;
    v52 = NSStringFromSelector(sel_fetchAuthorizedLocationStatus_);
    v305[23] = v52;
    v281[0] = @"wedge";
    v281[1] = @"xctest";
    v281[2] = @"Routine";
    v281[3] = @"coreauthd";
    v281[4] = @"com.apple.coreauthd";
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v281 count:5];
    v306[23] = v53;
    uint64_t v54 = NSStringFromSelector(sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_);
    v305[24] = v54;
    v280[0] = @"locationd";
    v280[1] = @"wedge";
    v280[2] = @"xctest";
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v280 count:3];
    v306[24] = v55;
    v56 = NSStringFromSelector(sel_addBackgroundInertialOdometrySamples_reply_);
    v305[25] = v56;
    v279[0] = @"locationd";
    v279[1] = @"wedge";
    v279[2] = @"xctest";
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v279 count:3];
    v306[25] = v57;
    v58 = NSStringFromSelector(sel_fetchStoredLocationsWithContext_reply_);
    v305[26] = v58;
    v306[26] = v202;
    uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v306 forKeys:v305 count:27];
    v60 = (void *)qword_1EBE387E0;
    qword_1EBE387E0 = v59;

    uint64_t v61 = objc_opt_new();
    vendedClassesStoreManagerDict = v218->_vendedClassesStoreManagerDict;
    v218->_vendedClassesStoreManagerDict = (NSMutableDictionary *)v61;

    long long v269 = 0u;
    long long v270 = 0u;
    long long v267 = 0u;
    long long v268 = 0u;
    locationManager = v218->_locationManager;
    v277[0] = v218->_learnedLocationManager;
    v277[1] = locationManager;
    visitManager = v218->_visitManager;
    v277[2] = v218->_fingerprintManager;
    v277[3] = visitManager;
    v277[4] = v218->_hintManager;
    id v205 = [MEMORY[0x1E4F1C978] arrayWithObjects:v277 count:5];
    id v211 = (id)[v205 countByEnumeratingWithState:&v267 objects:v278 count:16];
    if (v211)
    {
      id v208 = *(id *)v268;
      do
      {
        for (id i = 0; i != v211; id i = (char *)i + 1)
        {
          if (*(id *)v268 != v208) {
            objc_enumerationMutation(v205);
          }
          uint64_t v65 = *(void *)(*((void *)&v267 + 1) + 8 * i);
          long long v263 = 0u;
          long long v264 = 0u;
          long long v265 = 0u;
          long long v266 = 0u;
          v66 = [(id)objc_opt_class() vendedClasses];
          uint64_t v67 = [v66 countByEnumeratingWithState:&v263 objects:v276 count:16];
          if (v67)
          {
            uint64_t v68 = v67;
            uint64_t v69 = *(void *)v264;
            do
            {
              for (uint64_t j = 0; j != v68; ++j)
              {
                if (*(void *)v264 != v69) {
                  objc_enumerationMutation(v66);
                }
                id v71 = *(objc_class **)(*((void *)&v263 + 1) + 8 * j);
                uint64_t v72 = v218->_vendedClassesStoreManagerDict;
                v73 = NSStringFromClass(v71);
                uint64_t v74 = [(NSMutableDictionary *)v72 objectForKey:v73];

                if (v74)
                {
                  v75 = _rt_log_facility_get_os_log(RTLogFacilityClient);
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
                  {
                    uint64_t v78 = NSStringFromClass(v71);
                    v79 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v79);
                    v80 = (NSString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v273 = v78;
                    __int16 v274 = 2112;
                    v275 = v80;
                    _os_log_fault_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_FAULT, "duplicate vended class, %@, from manager class, %@", buf, 0x16u);
                  }
                }
                uint64_t v76 = v218->_vendedClassesStoreManagerDict;
                v77 = NSStringFromClass(v71);
                [(NSMutableDictionary *)v76 setObject:v65 forKey:v77];
              }
              uint64_t v68 = [v66 countByEnumeratingWithState:&v263 objects:v276 count:16];
            }
            while (v68);
          }
        }
        id v211 = (id)[v205 countByEnumeratingWithState:&v267 objects:v278 count:16];
      }
      while (v211);
    }

    uint64_t v81 = +[RTEntitlementProvider daemonProtocolEntitlementProvider];
    entitlementProvider = v218->_entitlementProvider;
    v218->_entitlementProvider = (RTEntitlementProvider *)v81;

    if (v220) {
      uint64_t v83 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v220 copyItems:1];
    }
    else {
      uint64_t v83 = objc_opt_new();
    }
    restorationData = v218->_restorationData;
    v218->_restorationData = (NSMutableDictionary *)v83;

    v96 = [v220 objectForKey:@"restorationIdentifier"];
    uint64_t v97 = [v96 copy];
    v98 = v218;
    restorationIdentifier = v218->_restorationIdentifier;
    v218->_restorationIdentifier = (NSString *)v97;

    v100 = [v220 objectForKey:@"bundleIdentifier"];
    uint64_t v101 = [v100 copy];
    bundleIdentifier = v218->_bundleIdentifier;
    v218->_bundleIdentifier = (NSString *)v101;

    v103 = [[RTDaemonClientRegistrarScenarioTrigger alloc] initWithScenarioTriggerManager:v98->_scenarioTriggerManager queue:v98->_queue];
    scenarioTriggerRegistrar = v218->_scenarioTriggerRegistrar;
    v218->_scenarioTriggerRegistrar = v103;

    [(RTDaemonClientRegistrarScenarioTrigger *)v98->_scenarioTriggerRegistrar setDelegate:v98];
    v105 = [RTDaemonClientRegistrarVehicleEvent alloc];
    vehicleLocationProvider = v218->_vehicleLocationProvider;
    v107 = [(RTDaemonClient *)v218 queue];
    uint64_t v108 = [(RTDaemonClientRegistrarVehicleEvent *)v105 initWithVehicleLocationProvider:vehicleLocationProvider queue:v107];
    vehicleEventRegistrar = v218->_vehicleEventRegistrar;
    v218->_vehicleEventRegistrar = (RTDaemonClientRegistrarVehicleEvent *)v108;

    v110 = [(RTDaemonClient *)v218 vehicleEventRegistrar];
    [v110 setDelegate:v218];

    v111 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v112 = [(RTDaemonClient *)v218 executableName];
      v113 = v218->_restorationIdentifier;
      *(_DWORD *)buf = 138412546;
      v273 = v112;
      __int16 v274 = 2112;
      v275 = v113;
      _os_log_impl(&dword_1D9BFA000, v111, OS_LOG_TYPE_DEFAULT, "client, %@, _restorationIdentifier, %@", buf, 0x16u);
    }
    v114 = [[RTDaemonClientRegistrarPeopleDiscovery alloc] initWithPeopleDiscoveryProvider:v218->_peopleDiscoveryProvider queue:v218->_queue];
    peopleDiscoveryRegistrar = v218->_peopleDiscoveryRegistrar;
    v218->_peopleDiscoveryRegistrar = v114;

    [(RTDaemonClientRegistrarPeopleDiscovery *)v218->_peopleDiscoveryRegistrar setDelegate:v218];
    v116 = dispatch_group_create();
    dispatch_group_enter(v116);
    authorizationManager = v218->_authorizationManager;
    v260[0] = MEMORY[0x1E4F143A8];
    v260[1] = 3221225472;
    v260[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke;
    v260[3] = &unk_1E6B91350;
    v118 = v218;
    v261 = v118;
    v119 = v116;
    v262 = v119;
    [(RTAuthorizationManager *)authorizationManager fetchRoutineSupportedWithHandler:v260];
    v120 = v218->_authorizationManager;
    v121 = +[RTNotification notificationName];
    [(RTNotifier *)v120 addObserver:v118 selector:sel_onAuthorizationNotification_ name:v121];

    dispatch_group_enter(v119);
    v122 = v218->_authorizationManager;
    v257[0] = MEMORY[0x1E4F143A8];
    v257[1] = 3221225472;
    v257[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_3;
    v257[3] = &unk_1E6B91350;
    v123 = v118;
    v258 = v123;
    v259 = v119;
    v124 = v119;
    [(RTAuthorizationManager *)v122 fetchRoutineEnabledWithHandler:v257];
    v125 = [(RTDaemonClient *)v123 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_5;
    block[3] = &unk_1E6B90E70;
    v256 = v123;
    dispatch_group_notify(v124, v125, block);
  }
  v90 = v218;
  v85 = v90;
  id v41 = v221;
  v91 = v220;
  id v42 = v161;
  id v43 = v236;
  v89 = v219;
LABEL_100:

  return v85;
}

- (RTDaemonClientRegistrarVehicleEvent)vehicleEventRegistrar
{
  return self->_vehicleEventRegistrar;
}

- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a6;
  uint64_t v11 = v10;
  if (v10)
  {
    eventModelProvider = self->_eventModelProvider;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke;
    v14[3] = &unk_1E6B914B8;
    v14[4] = self;
    id v15 = v10;
    [(RTEventModelProvider *)eventModelProvider fetchPredictedLocationsOfInterestAssociatedToTitle:a3 location:a4 calendarIdentifier:a5 withHandler:v14];
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

uint64_t __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "sending %lu predicted locations of interest to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) restore];
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  [v2 resume];
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (void)setXpcConnection:(id)a3
{
}

- (void)setSigningIdentifier:(id)a3
{
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (void)setExecutablePath:(id)a3
{
}

- (void)setExecutableName:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
  id v9 = a3;
  if (![(NSString *)self->_bundleIdentifier isEqualToString:v9])
  {
    uint64_t v4 = (NSString *)[v9 copy];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v4;

    uint64_t v6 = self->_bundleIdentifier;
    int v7 = [(RTDaemonClient *)self restorationData];
    uint64_t v8 = v7;
    if (v6) {
      [v7 setObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
    }
    else {
      [v7 removeObjectForKey:@"bundleIdentifier"];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)restore
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(RTDaemonClient *)self restorationData];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = self;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "restoring client, %@, from existing session", buf, 0xCu);
    }

    uint64_t v6 = [(RTDaemonClient *)self restorationData];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __25__RTDaemonClient_restore__block_invoke;
    v7[3] = &unk_1E6B91888;
    v7[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

- (NSMutableDictionary)restorationData
{
  return self->_restorationData;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void)setClientManagerDelegate:(id)a3
{
}

void __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke_2;
  v12[3] = &unk_1E6B91490;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSupported:*(unsigned __int8 *)(a1 + 48)];
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

void __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    uint64_t v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest, to client, %@, error, %@", buf, 0x2Au);
  }
  int v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_538;
  v10[3] = &__block_descriptor_40_e44_v32__0__RTLearnedLocationOfInterest_8Q16_B24l;
  v10[4] = *(void *)(a1 + 64);
  [v7 enumerateObjectsUsingBlock:v10];
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 48));
}

void __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = +[RTLearnedPlace placeTypeToString:*(void *)(a1 + 72)];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138413314;
    id v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    __int16 v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest with type, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 48));
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke;
    v12[3] = &unk_1E6B91730;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    [(RTLearnedLocationManager *)learnedLocationManager fetchLocationOfInterestAtLocation:v10 handler:v12];
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

uint64_t __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = +[RTLearnedLocationManager modeToString:*(void *)(a1 + 72)];
    uint64_t v5 = [*(id *)(a1 + 32) coordinateToString];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138413314;
    int v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending mode, %@, at location, %@, to client, %@, error, %@", (uint8_t *)&v9, 0x34u);
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [MEMORY[0x1E4F5CE10] routineModeFromLearnedLocationMode:*(void *)(a1 + 72)], *(void *)(a1 + 48));
}

void __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) coordinateToString];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v10 = 138413314;
    __int16 v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    __int16 v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending location of interest, %@, at location, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);
  }
  uint64_t v8 = *(void *)(a1 + 64);
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 56));
}

void __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_3;
  block[3] = &unk_1E6B914E0;
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

- (void)fetchPlaceInferencesWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, NSObject *))a4;
  if (!v7)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = self;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "options is required, %@", buf, 0xCu);
    }

    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithFormat:@"options is required."];
    uint64_t v19 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    int v9 = [v11 errorWithDomain:v12 code:7 userInfo:v14];

    v7[2](v7, 0, v9);
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v8 = [(RTDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  dispatch_async(v8, block);

LABEL_10:
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_4;
  block[3] = &unk_1E6B91328;
  id v6 = *(id *)(a1 + 32);
  char v8 = a2;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_2;
  block[3] = &unk_1E6B91328;
  id v6 = *(id *)(a1 + 32);
  char v8 = a2;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

void __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_2;
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

void __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke_2;
  v12[3] = &unk_1E6B916E0;
  uint64_t v18 = *(void *)(a1 + 56);
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke_2;
  block[3] = &unk_1E6B91418;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v5;
  uint64_t v16 = v9;
  uint64_t v19 = v8;
  id v17 = v6;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v18 = v13;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, block);
}

void __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E6B91490;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      if (v10)
      {
        if ([v9 compare:v10] != 1)
        {
          learnedLocationManager = self->_learnedLocationManager;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke;
          v21[3] = &unk_1E6B91468;
          v21[4] = self;
          SEL v23 = a2;
          id v22 = v11;
          [(RTLearnedLocationManager *)learnedLocationManager fetchLocationsOfInterestVisitedBetweenStartDate:v9 endDate:v10 handler:v21];

          goto LABEL_12;
        }
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F5CFE8];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        id v26 = @"endDate must be greater than or equal to startDate";
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        id v15 = &v26;
        id v16 = &v25;
      }
      else
      {
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F5CFE8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        BOOL v28 = @"endDate is required";
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        id v15 = &v28;
        id v16 = &v27;
      }
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"startDate is required";
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = (__CFString **)v30;
      id v16 = &v29;
    }
    long long v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    uint64_t v19 = [v12 errorWithDomain:v13 code:7 userInfo:v18];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v19);
  }
  else
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_12:
}

void __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke_2;
  v10[3] = &unk_1E6B91418;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = a2;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v5;
  id v14 = *(id *)(a1 + 48);
  id v9 = v5;
  dispatch_async(v6, v10);
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 reply:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = +[RTLearnedPlace placeTypeFromType:a3];
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke;
    v11[3] = &unk_1E6B91440;
    v11[4] = self;
    SEL v13 = a2;
    unint64_t v14 = v8;
    id v12 = v7;
    [(RTLearnedLocationManager *)learnedLocationManager fetchLocationsOfInterestWithPlaceType:v8 handler:v11];
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    SEL v13 = [objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v10];
    deviceLocationPredictor = self->_deviceLocationPredictor;
    uint64_t v15 = [(RTDaemonClient *)self _clientIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke;
    v16[3] = &unk_1E6B914B8;
    v16[4] = self;
    id v17 = v12;
    [(RTDeviceLocationPredictor *)deviceLocationPredictor fetchNextPredictedLocationsOfInterestFromLocation:v13 startDate:v11 timeInterval:v15 clientIdentifier:v16 handler:a5];
  }
  else
  {
    SEL v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

- (id)_clientIdentifier
{
  id v3 = [(RTDaemonClient *)self bundleIdentifier];

  if (v3) {
    [(RTDaemonClient *)self bundleIdentifier];
  }
  else {
  uint64_t v4 = [(RTDaemonClient *)self executableName];
  }

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)fetchLastVehicleEventsWithReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    vehicleLocationProvider = self->_vehicleLocationProvider;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke;
    v8[3] = &unk_1E6B914B8;
    v8[4] = self;
    id v9 = v4;
    [(RTVehicleLocationProvider *)vehicleLocationProvider fetchLastVehicleEventsWithHandler:v8];
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

void __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke_2;
  v12[3] = &unk_1E6B91490;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

- (void)startMonitoringVehicleEventsWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self _startMonitoringVehicleEvents];
    v4[2](v4, 0);
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

- (void)_startMonitoringVehicleEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromSelector(a2);
    int v13 = 138412546;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", (uint8_t *)&v13, 0x16u);
  }
  if (![(RTDaemonClient *)self enabled])
  {
    id v5 = [(RTDaemonClient *)self xpcConnection];
    id v6 = [v5 remoteObjectProxy];
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:0];
    [v6 onVehicleEvents:0 error:v7];
  }
  uint64_t v8 = [(RTDaemonClient *)self vehicleEventRegistrar];
  [v8 startMonitoringVehicleEvents];

  id v9 = [(RTDaemonClient *)self restorationData];
  id v10 = [NSNumber numberWithBool:1];
  [v9 setObject:v10 forKey:@"vehicleEventRegistrar"];

  id v11 = [(RTDaemonClient *)self clientManagerDelegate];
  [v11 saveDaemonClient:self];
}

- (RTClientListenerProtocol)clientManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientManagerDelegate);

  return (RTClientListenerProtocol *)WeakRetained;
}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (void)onAuthorizationNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    -[RTDaemonClient setEnabled:](self, "setEnabled:", [v5 enabled]);
  }
  else
  {
    id v9 = [v5 name];
    id v10 = +[RTNotification notificationName];
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      id v12 = v5;
      int v13 = _rt_log_facility_get_os_log(RTLogFacilityClient);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = NSStringFromSelector(a2);
        if ([(RTDaemonClient *)self targetUserSession]) {
          __int16 v15 = @"YES";
        }
        else {
          __int16 v15 = @"NO";
        }
        int v20 = 138413058;
        if ([v12 activeUser]) {
          id v16 = @"YES";
        }
        else {
          id v16 = @"NO";
        }
        id v21 = v14;
        __int16 v22 = 2112;
        SEL v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, client, %@, targetUserSesssion, %@, activeUser, %@", (uint8_t *)&v20, 0x2Au);
      }
      if (-[RTDaemonClient targetUserSession](self, "targetUserSession") && ([v12 activeUser] & 1) == 0)
      {
        uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          long long v18 = NSStringFromSelector(a2);
          int v20 = 138412546;
          id v21 = v18;
          __int16 v22 = 2112;
          SEL v23 = self;
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, invalidating connection to client, %@", (uint8_t *)&v20, 0x16u);
        }
        uint64_t v19 = [(RTDaemonClient *)self xpcConnection];
        [v19 invalidate];
      }
    }
  }
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 48)];
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

uint64_t __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 134218498;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "sending %lu next PLOIs to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
    [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_7];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 134218498;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "sending %lu vehicle parked events to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchRoutineModeFromLocation:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke;
    v12[3] = &unk_1E6B91530;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    [(RTLearnedLocationManager *)learnedLocationManager fetchModeAtLocation:v10 handler:v12];
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

- (void)fetchRoutineEnabledWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, BOOL))a3;
  if (v4)
  {
    v4[2](v4, [(RTDaemonClient *)self enabled]);
  }
  else
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

void __25__RTDaemonClient_restore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"scenarioTriggerRegistrar"])
  {
    id v18 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v18];
    id v8 = v18;
    if (v8)
    {
      __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityClient);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "error unarchiving scenario trigger registrar, %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) startMonitoringScenarioTriggerOfType:[v7 monitoredScenarioTriggerTypes] reply:&__block_literal_global_564];
  }
  else
  {
    if ([v5 isEqualToString:@"vehicleEventRegistrar"])
    {
      [*(id *)(a1 + 32) _startMonitoringVehicleEvents];
      goto LABEL_18;
    }
    if (![v5 isEqualToString:@"peopleDiscoveryRegistrar"]) {
      goto LABEL_18;
    }
    id v17 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v17];
    id v8 = v17;
    if (v8)
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityClient);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "error unarchiving people discovery registrar, %@", buf, 0xCu);
      }
    }
    uint64_t v11 = [v7 clientIdentifier];
    if (v11
      && (uint64_t v12 = (void *)v11,
          [v7 configuration],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      id v14 = *(void **)(a1 + 32);
      SEL v15 = [v7 clientIdentifier];
      id v16 = [v7 configuration];
      [v14 startMonitoringForPeopleDiscovery:v15 configuration:v16 reply:&__block_literal_global_567];
    }
    else
    {
      [*(id *)(a1 + 32) stopMonitoringForPeopleDiscoveryWithReply:&__block_literal_global_573];
    }
  }

LABEL_18:
}

uint64_t __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) firstObject];
    uint64_t v7 = *(void *)(a1 + 56);
    int v9 = 134219010;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "sending %lu placeInferences to client, %@, options, %@, placeInferences[0], %@, error, %@", (uint8_t *)&v9, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 304);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_2;
  v5[3] = &unk_1E6B91508;
  v5[4] = v2;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  [v4 fetchPlaceInferencesForOptions:v6 handler:v5];
}

- (RTDaemonClient)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager_);
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(RTDaemonClient *)self executablePath];
  uint64_t v5 = [(RTDaemonClient *)self processIdentifier];
  id v6 = [(RTDaemonClient *)self restorationIdentifier];
  if (v6) {
    [(RTDaemonClient *)self restorationIdentifier];
  }
  else {
  id v7 = [(RTDaemonClient *)self signingIdentifier];
  }
  id v8 = [v3 stringWithFormat:@"%@(%d), %@", v4, v5, v7];

  return (NSString *)v8;
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 reply:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    learnedLocationManager = self->_learnedLocationManager;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke;
    v14[3] = &unk_1E6B913F0;
    v14[4] = self;
    SEL v17 = a2;
    double v18 = a3;
    id v15 = v9;
    id v16 = v10;
    [(RTLearnedLocationManager *)learnedLocationManager fetchLocationsOfInterestWithinDistance:v12 ofLocation:v14 handler:a3];
  }
  else
  {
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke_2;
  block[3] = &unk_1E6B913C8;
  uint64_t v19 = *(void *)(a1 + 56);
  id v14 = v5;
  uint64_t v20 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = *(id *)(a1 + 48);
  id v17 = v6;
  id v18 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, block);
}

void __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 80);
    id v6 = [*(id *)(a1 + 40) coordinateToString];
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138413314;
    id v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest within %.2fm of %@ to client, %@", (uint8_t *)&v10, 0x34u);
  }
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = [MEMORY[0x1E4F5CE10] locationsOfInterestFromLearnedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 56));
}

- (void)fetchAllLocationsOfInterestForSettingsWithReply:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke;
    v9[3] = &unk_1E6B91468;
    v9[4] = self;
    SEL v11 = a2;
    id v10 = v5;
    [(RTLearnedLocationManager *)learnedLocationManager fetchAllLocationsOfInterestWithHandler:v9];
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke_2;
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

void __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
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

void __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke_481(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "PLOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)setRoutineEnabled:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = @"NO";
      if (v4) {
        __int16 v8 = @"YES";
      }
      int v10 = 138412546;
      __int16 v11 = self;
      __int16 v12 = 2112;
      __int16 v13 = v8;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "client, %@, setting CoreRoutine enabled to, %@", (uint8_t *)&v10, 0x16u);
    }

    [(RTAuthorizationManager *)self->_authorizationManager setRoutineEnabled:v4 withHandler:v6];
    [(RTDaemonClient *)self setEnabled:v4];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)clearRoutineWithReply:(id)a3
{
  if (a3)
  {
    purgeManager = self->_purgeManager;
    [(RTPurgeManager *)purgeManager clearRoutineWithHandler:"clearRoutineWithHandler:"];
  }
  else
  {
    BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)fetchCloudSyncAuthorizationStateWithReply:(id)a3
{
  if (a3)
  {
    accountManager = self->_accountManager;
    -[RTAccountManager fetchCloudSyncAuthorizationState:](accountManager, "fetchCloudSyncAuthorizationState:");
  }
  else
  {
    BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 reply:(id)a4
{
  if (a4)
  {
    accountManager = self->_accountManager;
    -[RTAccountManager updateCloudSyncProvisionedForAccount:handler:](accountManager, "updateCloudSyncProvisionedForAccount:handler:", a3);
  }
  else
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    eventModelProvider = self->_eventModelProvider;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke;
    v10[3] = &unk_1E6B914B8;
    void v10[4] = self;
    id v11 = v6;
    [(RTEventModelProvider *)eventModelProvider fetchLocationsOfInterestAssociatedToIdentifier:a3 withHandler:v10];
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

void __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E6B91490;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "sending %lu locations of interest to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    deviceLocationPredictor = self->_deviceLocationPredictor;
    __int16 v9 = [(RTDaemonClient *)self _clientIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke;
    v11[3] = &unk_1E6B91508;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(RTDeviceLocationPredictor *)deviceLocationPredictor fetchPredictedLocationsOfInterestOnDate:v12 clientIdentifier:v9 withHandler:v11];
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

void __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke_2;
  block[3] = &unk_1E6B914E0;
  id v13 = v5;
  id v8 = a1[5];
  id v9 = a1[4];
  id v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v17 = a1[6];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = [*(id *)(a1 + 40) stringFromDate];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 134218754;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "sending %lu predicted locations the device may be at on %@ to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
    [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_496];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke_494(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "PLOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)fetchCurrentPredictedLocationsOfInterestLookingBack:(double)a3 lookingAhead:(double)a4 reply:(id)a5
{
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [[RTCurrentMapItemProvider alloc] initWithFingerprintManager:self->_fingerprintManager locationManager:self->_locationManager mapServiceManager:self->_mapServiceManager wifiManager:self->_wifiManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke;
    v11[3] = &unk_1E6B91580;
    v11[4] = self;
    SEL v13 = a2;
    double v14 = a3;
    double v15 = a4;
    id v12 = v9;
    [(RTCurrentMapItemProvider *)v10 fetchCurrentMapItemsLookingBack:v11 lookingAhead:a3 handler:a4];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    uint64_t v10 = (RTCurrentMapItemProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v10->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke_2;
  block[3] = &unk_1E6B91558;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v5;
  uint64_t v15 = v8;
  id v16 = v6;
  long long v18 = *(_OWORD *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v17 = v12;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    int v11 = 138413570;
    long long v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu predicted locations of interest to client, %@, error, %@, looking back, %.2fs, seconds, looking ahead, %.2fs", (uint8_t *)&v11, 0x3Eu);
  }
  +[RTCurrentMapItemProvider logMapItems:*(void *)(a1 + 32) prestring:@"Outputted MapItems"];
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = +[RTCurrentMapItemProvider convertMapItemsToPredictedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, *(void *)(a1 + 48));
}

- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 reply:(id)a5
{
  id v9 = a5;
  if (v9)
  {
    id v10 = [[RTCurrentMapItemProvider alloc] initWithFingerprintManager:self->_fingerprintManager locationManager:self->_locationManager mapServiceManager:self->_mapServiceManager wifiManager:self->_wifiManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke;
    v11[3] = &unk_1E6B915D0;
    v11[4] = self;
    SEL v13 = a2;
    double v14 = a3;
    double v15 = a4;
    id v12 = v9;
    [(RTCurrentMapItemProvider *)v10 performBluePOIQueryLookingBack:v11 lookingAhead:a3 handler:a4];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v10 = (RTCurrentMapItemProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v10->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  SEL v13 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke_2;
  block[3] = &unk_1E6B915A8;
  uint64_t v14 = *(void *)(a1 + 32);
  id v22 = v11;
  uint64_t v23 = v14;
  id v24 = v12;
  long long v28 = *(_OWORD *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 40);
  id v15 = (id)v20;
  long long v27 = v20;
  id v25 = v9;
  id v26 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v13, block);
}

void __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 80));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 96);
    int v13 = 138413570;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu predicted locations of interest to client, %@, error, %@, looking back, %.2fs, seconds, looking ahead, %.2fs", (uint8_t *)&v13, 0x3Eu);
  }
  +[RTCurrentMapItemProvider logMapItems:*(void *)(a1 + 32) prestring:@"Outputted MapItems"];
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = +[RTCurrentMapItemProvider convertMapItemsToPredictedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void))(v9 + 16))(v9, v11, v10, v12, *(void *)(a1 + 48));
}

- (void)setMonitorVisits:(BOOL)a3
{
  if (self->_monitorVisits != a3)
  {
    self->_monitorVisits = a3;
    visitManager = self->_visitManager;
    if (a3)
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier addObserver:selector:name:](visitManager, "addObserver:selector:name:", self, sel_onVisitManagerNotification_);
    }
    else
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier removeObserver:fromNotification:](visitManager, "removeObserver:fromNotification:", self);
    }
  }
}

- (void)startMonitoringVisitsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self setMonitorVisits:1];
    v4[2](v4, 0);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)stopMonitoringVisitsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self setMonitorVisits:0];
    v4[2](v4, 0);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)startLeechingVisitsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self setLeechVisits:1];
    v4[2](v4, 0);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)stopLeechingVisitsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self setLeechVisits:0];
    v4[2](v4, 0);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)setLeechVisits:(BOOL)a3
{
  if (self->_leechVisits != a3)
  {
    self->_leechVisits = a3;
    visitManager = self->_visitManager;
    if (a3)
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier addObserver:selector:name:](visitManager, "addObserver:selector:name:", self, sel_onVisitManagerNotification_);
    }
    else
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier removeObserver:fromNotification:](visitManager, "removeObserver:fromNotification:", self);
    }
  }
}

- (void)startLeechingLowConfidenceVisitsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self setLeechLowConfidenceVisits:1];
    v4[2](v4, 0);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)stopLeechingLowConfidenceVisitsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self setLeechLowConfidenceVisits:0];
    v4[2](v4, 0);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)setLeechLowConfidenceVisits:(BOOL)a3
{
  if (self->_leechLowConfidenceVisits != a3)
  {
    self->_leechLowConfidenceVisits = a3;
    visitManager = self->_visitManager;
    if (a3)
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier addObserver:selector:name:](visitManager, "addObserver:selector:name:", self, sel_onVisitManagerNotification_);
    }
    else
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier removeObserver:fromNotification:](visitManager, "removeObserver:fromNotification:", self);
    }
  }
}

- (void)_onVisitManagerNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  uint64_t v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if ([(RTDaemonClient *)self monitorVisits])
    {
      uint64_t v8 = [v4 visitIncident];
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityClient);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        __int16 v21 = v8;
        __int16 v22 = 2112;
        __int16 v23 = self;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "sending visit, %@, to client, %@", (uint8_t *)&v20, 0x16u);
      }

      uint64_t v10 = [(RTDaemonClient *)self xpcConnection];
      uint64_t v11 = [v10 remoteObjectProxy];
      [v11 onVisit:v8 withError:0];
LABEL_16:
    }
  }
  else
  {
    id v12 = [v4 name];
    int v13 = +[RTNotification notificationName];
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      if ([(RTDaemonClient *)self leechVisits])
      {
        uint64_t v8 = [v4 visitIncident];
        __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412546;
          __int16 v21 = v8;
          __int16 v22 = 2112;
          __int16 v23 = self;
          _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "sending leeched visit, %@, to client, %@", (uint8_t *)&v20, 0x16u);
        }

        uint64_t v10 = [(RTDaemonClient *)self xpcConnection];
        uint64_t v11 = [v10 remoteObjectProxy];
        [v11 onLeechedVisit:v8 withError:0];
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v16 = [v4 name];
      __int16 v17 = +[RTNotification notificationName];
      int v18 = [v16 isEqualToString:v17];

      if (v18 && [(RTDaemonClient *)self leechLowConfidenceVisits])
      {
        uint64_t v8 = [v4 visitIncident];
        __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412546;
          __int16 v21 = v8;
          __int16 v22 = 2112;
          __int16 v23 = self;
          _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "sending leeched low conf visit, %@, to client, %@", (uint8_t *)&v20, 0x16u);
        }

        uint64_t v10 = [(RTDaemonClient *)self xpcConnection];
        uint64_t v11 = [v10 remoteObjectProxy];
        [v11 onLeechedLowConfidenceVisit:v8 withError:0];
        goto LABEL_16;
      }
    }
  }
}

- (void)onVisitManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTDaemonClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__RTDaemonClient_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__RTDaemonClient_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVisitManagerNotification:*(void *)(a1 + 40)];
}

- (void)startMonitoringPlaceInferencesWithOptions:(id)a3 reply:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if ([v6 fidelityPolicy])
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F5CFE8];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"invalid fidelity policy passed. Only Local is accepted";
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v11 = [v8 errorWithDomain:v9 code:7 userInfo:v10];
      v7[2](v7, v11);
    }
    else
    {
      [(RTDaemonClient *)self setMonitorPlaceInferences:1];
      v7[2](v7, 0);
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)stopMonitoringPlaceInferencesWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClient *)self setMonitorPlaceInferences:0];
    v4[2](v4, 0);
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

- (void)setMonitorPlaceInferences:(BOOL)a3
{
  if (self->_monitorPlaceInferences != a3)
  {
    self->_monitorPlaceInferences = a3;
    locationContextManager = self->_locationContextManager;
    if (a3)
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier addObserver:selector:name:](locationContextManager, "addObserver:selector:name:", self, sel_onLocationContextManagerNotification_);
    }
    else
    {
      id v5 = +[RTNotification notificationName];
      -[RTNotifier removeObserver:fromNotification:](locationContextManager, "removeObserver:fromNotification:", self);
    }
  }
}

- (void)onLocationContextManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTDaemonClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTDaemonClient_onLocationContextManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTDaemonClient_onLocationContextManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLocationContextManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onLocationContextManagerNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  int v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8 && [(RTDaemonClient *)self monitorPlaceInferences])
  {
    uint64_t v9 = [v5 placeInferences];
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      __int16 v13 = NSStringFromSelector(a2);
      int v16 = 138413058;
      __int16 v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      __int16 v21 = v9;
      __int16 v22 = 2112;
      __int16 v23 = self;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, sending place inferences, %@, to client, %@", (uint8_t *)&v16, 0x2Au);
    }
    uint64_t v14 = [(RTDaemonClient *)self xpcConnection];
    __int16 v15 = [v14 remoteObjectProxy];
    [v15 onPlaceInferences:v9 error:0];
  }
}

+ (id)filterVisits:(id)a3 executable:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v14 = @"locationd";
  __int16 v15 = @"wedge";
  int v16 = @"loctool";
  __int16 v17 = @"xctest";
  __int16 v18 = @"coreautomationd";
  __int16 v19 = @"Routine";
  __int16 v20 = @"momentsd";
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  int v8 = [v6 arrayWithObjects:&v14 count:7];
  LODWORD(v6) = [v8 containsObject:v7, v14, v15, v16, v17, v18, v19, v20, v21];

  if (v6
    || ([v5 lastObject],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 type],
        v9,
        v10 != 1))
  {
    id v12 = v5;
  }
  else
  {
    uint64_t v11 = (void *)[v5 mutableCopy];
    [v11 removeLastObject];
    id v12 = (id)[v11 copy];
  }

  return v12;
}

- (void)fetchStoredVisitsWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v32 = v22;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, options, %@", buf, 0x16u);
    }
    uint64_t v10 = [v7 sources];
    int v11 = [v10 containsObject:&unk_1F344F940];

    if (v11)
    {
      id v12 = [v7 dateInterval];
      __int16 v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
        __int16 v18 = [MEMORY[0x1E4F1C9C8] distantPast];
        __int16 v19 = [MEMORY[0x1E4F1C9C8] date];
        id v14 = (id)[v17 initWithStartDate:v18 endDate:v19];
      }
      uint64_t v20 = [v7 ascending];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke;
      v26[3] = &unk_1E6B91690;
      v26[4] = self;
      id v27 = v14;
      id v28 = v7;
      id v29 = v8;
      SEL v30 = a2;
      id v21 = v14;
      [(RTDaemonClient *)self _fetchHindsightVisitsWithDateInterval:v21 ascending:v20 handler:v26];
    }
    else
    {
      int v16 = [(RTDaemonClient *)self visitManager];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_521;
      v23[3] = &unk_1E6B91468;
      v23[4] = self;
      SEL v25 = a2;
      id v24 = v8;
      [v16 fetchStoredVisitsWithOptions:v7 handler:v23];
    }
  }
  else
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2;
  block[3] = &unk_1E6B91668;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = v5;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v17 = v6;
  uint64_t v18 = v9;
  uint64_t v10 = *(void *)(a1 + 64);
  id v19 = v8;
  uint64_t v20 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, block);
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) startDate];
  int v3 = [*(id *)(a1 + 40) ascending];
  id v4 = *(void **)(a1 + 48);
  if (v3) {
    [v4 lastObject];
  }
  else {
  id v5 = [v4 firstObject];
  }
  id v6 = [v5 exit];

  id v7 = [*(id *)(a1 + 32) endDate];
  int v8 = [v6 isAfterDate:v7];

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (v6)
    {
      id v9 = v6;

      uint64_t v2 = v9;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v11 = [*(id *)(a1 + 32) endDate];
    id v12 = (void *)[v10 initWithStartDate:v2 endDate:v11];

    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__9;
    v24[4] = __Block_byref_object_dispose__9;
    id v25 = *(id *)(a1 + 56);
    __int16 v13 = *(void **)(a1 + 64);
    id v14 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_3;
    v18[3] = &unk_1E6B91640;
    v18[4] = v13;
    __int16 v22 = v24;
    id v19 = v14;
    id v15 = *(id *)(a1 + 48);
    id v17 = *(void **)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 80);
    id v20 = v15;
    uint64_t v23 = v16;
    id v21 = v17;
    [v13 _fetchRealtimeVisitsWithDateInterval:v12 options:v19 handler:v18];

    _Block_object_dispose(v24, 8);
  }
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_4;
  v12[3] = &unk_1E6B91618;
  uint64_t v8 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v19 = v8;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 72);
  uint64_t v17 = v9;
  id v18 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_4(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v2);
  }
  int v3 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entry" ascending:[*(id *)(a1 + 40) ascending]];
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  if ([*(id *)(a1 + 48) count])
  {
    [v4 addObjectsFromArray:*(void *)(a1 + 48)];
    v35[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v4 sortUsingDescriptors:v6];
  }
  if ([*(id *)(a1 + 56) count])
  {
    [v5 addObjectsFromArray:*(void *)(a1 + 56)];
    id v34 = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v5 sortUsingDescriptors:v7];

    if ([*(id *)(a1 + 40) ascending])
    {
      uint64_t v8 = 0;
      uint64_t v9 = (int)([v4 count] - 1);
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = (int)([v5 count] - 1);
    }
    if ([v4 count])
    {
      id v10 = [v4 objectAtIndex:v9];
    }
    else
    {
      id v10 = 0;
    }
    if ([v5 count])
    {
      id v11 = [v5 objectAtIndex:v8];
      id v12 = v11;
      if (v11)
      {
        if (v10)
        {
          id v13 = [v11 entry];
          id v14 = [v10 exit];
          int v15 = [v13 isBeforeDate:v14];

          if (v15) {
            [v5 removeObjectAtIndex:v8];
          }
        }
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  id v16 = objc_opt_new();
  int v17 = [*(id *)(a1 + 40) ascending];
  if (v17) {
    id v18 = v4;
  }
  else {
    id v18 = v5;
  }
  if (v17) {
    uint64_t v19 = v5;
  }
  else {
    uint64_t v19 = v4;
  }
  [v16 addObjectsFromArray:v18];
  [v16 addObjectsFromArray:v19];
  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = NSStringFromSelector(*(SEL *)(a1 + 88));
    uint64_t v22 = [v16 count];
    uint64_t v23 = *(void *)(a1 + 64);
    uint64_t v24 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    id v27 = v21;
    __int16 v28 = 2048;
    uint64_t v29 = v22;
    __int16 v30 = 2112;
    uint64_t v31 = v23;
    __int16 v32 = 2112;
    uint64_t v33 = v24;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, sending %lu stored visits to client, %@, error, %@", buf, 0x2Au);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_519;
  v25[3] = &__block_descriptor_40_e24_v32__0__RTVisit_8Q16_B24l;
  v25[4] = *(void *)(a1 + 88);
  [v16 enumerateObjectsUsingBlock:v25];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_519(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, visit, %@", (uint8_t *)&v8, 0x20u);
  }
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_521(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2_522;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2_522(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) executableName];
  id v5 = [v2 filterVisits:v3 executable:v4];

  id v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v8 = [v5 count];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    id v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, sending %lu stored visits to client, %@, error, %@", buf, 0x2Au);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_523;
  v11[3] = &__block_descriptor_40_e24_v32__0__RTVisit_8Q16_B24l;
  v11[4] = *(void *)(a1 + 64);
  [v5 enumerateObjectsUsingBlock:v11];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_523(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, visit, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)processHindsightVisitsWithReply:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke;
    v9[3] = &unk_1E6B916B8;
    v9[4] = self;
    SEL v11 = a2;
    id v10 = v5;
    [(RTLearnedLocationManager *)learnedLocationManager trainForReason:2 mode:2 handler:v9];
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

void __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke_2(uint64_t a1)
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

- (void)_fetchHindsightVisitsWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Invalid parameter not satisfying: handler";
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_9;
  }
  uint64_t v10 = [v8 startDate];
  __int16 v11 = [v8 endDate];
  learnedLocationManager = self->_learnedLocationManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke;
  v14[3] = &unk_1E6B91508;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  [(RTLearnedLocationManager *)learnedLocationManager fetchHindsightVisitsBetweenStartDate:v10 endDate:v11 ascending:v6 handler:v14];

LABEL_7:
}

void __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke_2;
  block[3] = &unk_1E6B914E0;
  id v13 = v5;
  id v8 = a1[5];
  id v9 = a1[4];
  id v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v17 = a1[6];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 134218754;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "fetched %lu hindsight visits in date interval, %@, for client, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_fetchRealtimeVisitsWithDateInterval:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: handler";
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_9;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F5CF58]);
  uint64_t v12 = [v9 ascending];
  uint64_t v13 = [v9 confidence];
  uint64_t v14 = [v9 labelVisit];
  uint64_t v15 = [v9 limit];
  uint64_t v16 = [v9 sources];
  id v17 = (void *)[v11 initWithAscending:v12 confidence:v13 dateInterval:v8 labelVisit:v14 limit:v15 sources:v16];

  __int16 v18 = [(RTDaemonClient *)self visitManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke;
  v21[3] = &unk_1E6B91508;
  v21[4] = self;
  id v22 = v17;
  id v23 = v10;
  uint64_t v19 = v17;
  [v18 fetchStoredVisitsWithOptions:v19 handler:v21];

LABEL_7:
}

void __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke_2;
  block[3] = &unk_1E6B914E0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke_2(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) executableName];
    id v5 = [v2 filterVisits:v3 executable:v4];

    id v6 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entry" ascending:[*(id *)(a1 + 48) ascending]];
    v20[0] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v8 = [v5 sortedArrayUsingDescriptors:v7];

    id v9 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v8 count];
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 56);
      int v14 = 134218498;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "fetched %lu realtimevisits visits for client, %@, error, %@", (uint8_t *)&v14, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v13();
  }
}

- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    diagnostics = self->_diagnostics;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke;
    v11[3] = &unk_1E6B91708;
    v11[4] = self;
    SEL v14 = a2;
    id v12 = v7;
    id v13 = v8;
    [(RTDiagnostics *)diagnostics fetchPathToDiagnosticFilesWithOptions:v12 handler:v11];
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

void __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E6B916E0;
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v9 = 138413314;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending path to diagnostic files, %@, to client, %@, options, %@, error, %@", (uint8_t *)&v9, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)shutdown
{
  uint64_t v4 = [(RTDaemonClient *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__RTDaemonClient_shutdown__block_invoke;
  v5[3] = &unk_1E6B91248;
  v5[4] = self;
  void v5[5] = a2;
  dispatch_async(v4, v5);
}

void __26__RTDaemonClient_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    int v10 = 138412546;
    __int16 v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) deviceLocationPredictor];
  [v5 removeObserver:*(void *)(a1 + 32)];

  uint64_t v6 = [*(id *)(a1 + 32) authorizationManager];
  [v6 removeObserver:*(void *)(a1 + 32)];

  uint64_t v7 = [*(id *)(a1 + 32) scenarioTriggerManager];
  [v7 removeObserver:*(void *)(a1 + 32)];

  uint64_t v8 = [*(id *)(a1 + 32) vehicleEventRegistrar];
  [v8 stopMonitoringVehicleEvents];

  int v9 = [*(id *)(a1 + 32) visitManager];
  [v9 removeObserver:*(void *)(a1 + 32)];
}

- (void)fetchLocationOfInterestForRegion:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLCircularRegion:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke;
    v12[3] = &unk_1E6B91730;
    void v12[4] = self;
    SEL v15 = a2;
    id v13 = v7;
    id v14 = v8;
    [(RTLearnedLocationManager *)learnedLocationManager fetchLocationOfInterestForRegion:v10 handler:v12];
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke_2;
  v12[3] = &unk_1E6B916E0;
  uint64_t v18 = *(void *)(a1 + 56);
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v10 = 138413314;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending location of interest, %@, matching region, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);
  }
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 56));
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke;
    v11[3] = &unk_1E6B91730;
    v11[4] = self;
    SEL v14 = a2;
    id v12 = v7;
    id v13 = v8;
    [(RTLearnedLocationManager *)learnedLocationManager fetchLocationOfInterestWithIdentifier:v12 handler:v11];
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

void __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E6B916E0;
  uint64_t v18 = *(void *)(a1 + 56);
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v10 = 138413314;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, sending location of interest, %@, with identifier, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);
  }
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 56));
}

void __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_538(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, location of interest, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    __int16 v12 = dispatch_group_create();
    id v13 = v12;
    *(void *)buf = 0;
    __int16 v28 = buf;
    uint64_t v29 = 0x3032000000;
    __int16 v30 = __Block_byref_object_copy__9;
    uint64_t v31 = __Block_byref_object_dispose__9;
    id v32 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__9;
    v25[4] = __Block_byref_object_dispose__9;
    id v26 = 0;
    if (self->_learnedLocationManager)
    {
      dispatch_group_enter(v12);
      learnedLocationManager = self->_learnedLocationManager;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke;
      v21[3] = &unk_1E6B905F0;
      id v23 = buf;
      uint64_t v24 = v25;
      id v22 = v13;
      [(RTLearnedLocationManager *)learnedLocationManager fetchTransitionsBetweenStartDate:v9 endDate:v10 handler:v21];
    }
    uint64_t v15 = [(RTDaemonClient *)self queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke_2;
    v16[3] = &unk_1E6B91778;
    uint64_t v19 = buf;
    SEL v20 = a2;
    __int16 v18 = v25;
    v16[4] = self;
    id v17 = v11;
    dispatch_group_notify(v13, v15, v16);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(buf, 8);
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

void __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    *(_DWORD *)buf = 134218242;
    uint64_t v31 = v4;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "Fetched %lu transitions, error, %@", buf, 0x16u);
  }
  id v22 = v2;

  uint64_t v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v21 = a1;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v25 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = [MEMORY[0x1E4F5CE20] modeOfTransportationFromMotionActivityType:[v8 predominantMotionActivityType]];
        id v10 = objc_alloc(MEMORY[0x1E4F5CE20]);
        id v11 = [v8 identifier];
        id v12 = [v8 startDate];
        id v13 = [v8 stopDate];
        uint64_t v14 = [v8 visitIdentifierOrigin];
        uint64_t v15 = [v8 visitIdentifierDestination];
        __int16 v16 = (void *)[v10 initWithIdentifier:v11 startDate:v12 stopDate:v13 visitIdentifierOrigin:v14 visitIdentifierDestination:v15 modeOfTransportation:v9];

        if (v16) {
          [v24 addObject:v16];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v6);
  }

  id v17 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = NSStringFromSelector(*(SEL *)(v21 + 64));
    uint64_t v19 = [v24 count];
    uint64_t v20 = *(void *)(v21 + 32);
    *(_DWORD *)buf = 138413314;
    uint64_t v31 = (uint64_t)v18;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    uint64_t v35 = v24;
    __int16 v36 = 2112;
    uint64_t v37 = v20;
    __int16 v38 = 2112;
    v39 = v22;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, sending %lu transitions, %@, to client, %@, error, %@", buf, 0x34u);
  }
  (*(void (**)(void))(*(void *)(v21 + 40) + 16))();
}

- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 reply:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  if (!a3)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Region State Unknown. Unable to determine what type of hint we need to inject";
    __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v19 = [v15 errorWithDomain:v16 code:0 userInfo:v18];
    v9[2](v9, 0, v19);

LABEL_9:
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = v17;
    uint64_t v25 = @"Region State unsuported yet";
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v23 = [v21 errorWithDomain:v16 code:0 userInfo:v22];
    v9[2](v9, 0, v23);

    goto LABEL_10;
  }
  if (a3 == 1)
  {
    hintManager = self->_hintManager;
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLCircularRegion:v8];
    id v12 = hintManager;
    id v13 = v11;
    uint64_t v14 = 9;
    goto LABEL_7;
  }
  if (a3 != 2)
  {
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    goto LABEL_9;
  }
  id v10 = self->_hintManager;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLCircularRegion:v8];
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = 10;
LABEL_7:
  [(RTHintManager *)v12 storeHintSignificantRegion:v13 hintSource:v14 handler:v9];

LABEL_10:
}

- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  if (v6)
  {
    [(RTDaemonClientRegistrarScenarioTrigger *)self->_scenarioTriggerRegistrar startMonitoringForScenarioTriggerType:a3];
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_scenarioTriggerRegistrar requiringSecureCoding:1 error:0];
    id v8 = [(RTDaemonClient *)self restorationData];
    [v8 setObject:v7 forKey:@"scenarioTriggerRegistrar"];

    uint64_t v9 = [(RTDaemonClient *)self clientManagerDelegate];
    [v9 saveDaemonClient:self];

    v6[2](v6, 0);
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

- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  if (v6)
  {
    [(RTDaemonClientRegistrarScenarioTrigger *)self->_scenarioTriggerRegistrar stopMonitoringForScenarioTriggerType:a3];
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_scenarioTriggerRegistrar requiringSecureCoding:1 error:0];
    id v8 = [(RTDaemonClient *)self restorationData];
    [v8 setObject:v7 forKey:@"scenarioTriggerRegistrar"];

    uint64_t v9 = [(RTDaemonClient *)self clientManagerDelegate];
    [v9 saveDaemonClient:self];

    v6[2](v6, 0);
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

- (void)fetchMonitoredScenarioTriggerTypesWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  if (v4)
  {
    scenarioTriggerRegistrar = self->_scenarioTriggerRegistrar;
    if (scenarioTriggerRegistrar) {
      uint64_t v6 = [(RTDaemonClientRegistrarScenarioTrigger *)scenarioTriggerRegistrar monitoredScenarioTriggerTypes];
    }
    else {
      uint64_t v6 = 0;
    }
    v4[2](v4, v6, 0);
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v8, 2u);
    }
  }
}

- (void)scenarioTriggerRegistrar:(id)a3 didReceiveScenarioTriggers:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([(RTDaemonClient *)self enabled] && [(RTDaemonClient *)self supported])
  {
    if ([v8 count])
    {
      id v10 = [(RTDaemonClient *)self queue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke;
      v13[3] = &unk_1E6B917F0;
      v13[4] = self;
      id v14 = v8;
      id v15 = v9;
      SEL v16 = a2;
      dispatch_async(v10, v13);
    }
    else
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityClient);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "Dropping callback to scenario trigger monitor handler because there are no triggers.", buf, 2u);
      }
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v18 = [(RTDaemonClient *)self enabled];
      __int16 v19 = 1024;
      BOOL v20 = [(RTDaemonClient *)self supported];
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Dropping callback to scenario trigger monitor handler because routine is either not enabled %d or supported %d.", buf, 0xEu);
    }
  }
}

void __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) launchClient];
  id v2 = [*(id *)(a1 + 32) xpcConnection];

  BOOL v3 = v2 == 0;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "client, %@, not connected. buffering scenario triggers, %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 88);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_549;
    v22[3] = &unk_1E6B917A0;
    objc_copyWeak(&v25, (id *)buf);
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_550;
    v19[3] = &unk_1E6B917C8;
    objc_copyWeak(&v21, (id *)buf);
    id v20 = *(id *)(a1 + 48);
    BOOL v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
    [v17 addPendingScenarioTriggerBlock:v22 failBlock:v19 description:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v6;
      __int16 v33 = 2112;
      uint64_t v34 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "sending scenario triggers, %@, to client, %@", buf, 0x16u);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
          id v13 = [*(id *)(a1 + 32) xpcConnection];
          id v14 = [v13 remoteObjectProxy];
          [v14 onScenarioTrigger:v12 withError:0];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }
  }
}

void __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_549(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained scenarioTriggerRegistrar:WeakRetained[11] didReceiveScenarioTriggers:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "nil reference to self, returning from scenario trigger block", v5, 2u);
    }
  }
}

void __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_550(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F5CFE8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Buffered scenario trigger failed.";
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v6 = [v3 errorWithDomain:v4 code:0 userInfo:v5];

    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v6 localizedDescription];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
    }
    id v8 = [WeakRetained xpcConnection];
    uint64_t v9 = [v8 remoteObjectProxy];
    [v9 onScenarioTrigger:0 withError:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "nil reference to self, returning from scenario trigger block", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    int v11 = [objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v8];
    deviceLocationPredictor = self->_deviceLocationPredictor;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke;
    v13[3] = &unk_1E6B91840;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    [(RTDeviceLocationPredictor *)deviceLocationPredictor fetchPredictedExitDatesFromLocation:v11 onDate:v15 withHandler:v13];
  }
  else
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke_2;
  v12[3] = &unk_1E6B91818;
  id v13 = v5;
  id v14 = a1[5];
  id v8 = a1[6];
  id v9 = a1[4];
  id v15 = v8;
  id v16 = v9;
  id v17 = v6;
  id v18 = a1[7];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = [*(id *)(a1 + 40) coordinateToString];
    id v5 = [*(id *)(a1 + 48) stringFromDate];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    int v9 = 134219010;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "sending %lu predicted exit dates from location, %@, on date, %@, to client, %@, error, %@", (uint8_t *)&v9, 0x34u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
    [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_556];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke_554(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "PD %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    deviceLocationPredictor = self->_deviceLocationPredictor;
    uint64_t v12 = [(RTDaemonClient *)self _clientIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke;
    v14[3] = &unk_1E6B91840;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    [(RTDeviceLocationPredictor *)deviceLocationPredictor fetchPredictedLocationsOfInterestBetweenStartDate:v15 endDate:v16 clientIdentifier:v12 withHandler:v14];
  }
  else
  {
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke_2;
  v12[3] = &unk_1E6B91818;
  id v13 = v5;
  id v14 = a1[5];
  id v8 = a1[6];
  id v9 = a1[4];
  id v15 = v8;
  id v16 = v9;
  id v17 = v6;
  id v18 = a1[7];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    id v4 = [*(id *)(a1 + 40) stringFromDate];
    id v5 = [*(id *)(a1 + 48) stringFromDate];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    int v9 = 134219010;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "sending %lu PLOIs between startDate, %@, endDate, %@, to client, %@, error, %@", (uint8_t *)&v9, 0x34u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
    [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_559];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke_557(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "PLOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)setRestorationIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = NSString;
    id v5 = a3;
    int v6 = [(RTDaemonClient *)self signingIdentifier];
    uint64_t v7 = [v4 stringWithFormat:@"%@-%@", v6, v5];

    restorationIdentifier = self->_restorationIdentifier;
    self->_restorationIdentifier = v7;

    id v9 = [(RTDaemonClient *)self restorationData];
    [v9 setObject:self->_restorationIdentifier forKey:@"restorationIdentifier"];

    uint64_t v10 = [(RTDaemonClient *)self clientManagerDelegate];
    __int16 v11 = [v10 handleRestorationForDaemonClient:self];

    uint64_t v12 = [v11 scenarioTriggerRegistrar];
    if ([v12 invocationsPending])
    {
    }
    else
    {
      __int16 v13 = [v11 vehicleEventRegistrar];
      int v14 = [v13 invocationsPending];

      if (!v14)
      {
LABEL_8:

        return;
      }
    }
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v11;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "taking process asssertion for client, %@", buf, 0xCu);
    }

    uint64_t v16 = [v11 xpcConnection];
    uint64_t v17 = [v16 processIdentifier];
    uint64_t v18 = [(RTDaemonClient *)self queue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__RTDaemonClient_setRestorationIdentifier___block_invoke;
    v19[3] = &unk_1E6B90E70;
    id v20 = v11;
    +[RTLaunchServices createProcessAssertionForPid:v17 timeout:v18 queue:v19 timeoutHandler:10.0];

    goto LABEL_8;
  }
}

void __43__RTDaemonClient_setRestorationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "release process assertion for client, %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
  if (a3)
  {
    id v5 = [(RTDaemonClient *)self authorizationManager];
    int v4 = +[RTNotification notificationName];
    [v5 addObserver:self selector:sel_onAuthorizationNotification_ name:v4];
  }
}

- (BOOL)hasReasonToOutliveClientConnection
{
  uint64_t v3 = [(RTDaemonClient *)self restorationIdentifier];
  if (v3)
  {
    int v4 = [(RTDaemonClient *)self restorationData];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __25__RTDaemonClient_restore__block_invoke_562(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "error restoring scenario trigger monitoring, %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __25__RTDaemonClient_restore__block_invoke_565(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = @"OK";
    if (v2) {
      int v4 = v2;
    }
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "restoring people discovery monitoring %@", (uint8_t *)&v5, 0xCu);
  }
}

void __25__RTDaemonClient_restore__block_invoke_571(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = @"OK";
    if (v2) {
      int v4 = v2;
    }
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "clearing people discovery monitoring %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)launchClient
{
  uint64_t v3 = [(RTDaemonClient *)self bundleIdentifier];
  if (v3)
  {
    int v4 = (void *)v3;
    int v5 = [(RTDaemonClient *)self restorationIdentifier];

    if (v5)
    {
      uint64_t v6 = [(RTDaemonClient *)self bundleIdentifier];
      uint64_t v7 = [(RTDaemonClient *)self restorationIdentifier];
      eventAgentManager = self->_eventAgentManager;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __30__RTDaemonClient_launchClient__block_invoke;
      v9[3] = &unk_1E6B90840;
      v9[4] = self;
      +[RTLaunchServices launchClientWithBundleIdentifier:v6 restorationIdentifier:v7 eventAgentManager:eventAgentManager handler:v9];
    }
  }
}

void __30__RTDaemonClient_launchClient__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__RTDaemonClient_launchClient__block_invoke_2;
  v6[3] = &unk_1E6B90BF0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __30__RTDaemonClient_launchClient__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "launched client, %@, error, %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 reply:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    vehicleLocationProvider = self->_vehicleLocationProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__RTDaemonClient_vehicleEventAtLocation_notes_reply___block_invoke;
    v12[3] = &unk_1E6B90C18;
    __int16 v13 = v8;
    [(RTVehicleLocationProvider *)vehicleLocationProvider vehicleEventAtLocation:a3 notes:a4 handler:v12];
    __int16 v11 = v13;
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

uint64_t __53__RTDaemonClient_vehicleEventAtLocation_notes_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearAllVehicleEventsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTVehicleLocationProvider *)self->_vehicleLocationProvider clearAllVehicleEvents];
    v4[2](v4, 0);
  }
  else
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  if (v8)
  {
    [(RTVehicleLocationProvider *)self->_vehicleLocationProvider updateVehicleEventWithIdentifier:a3 notes:a4];
    v8[2](v8, 0);
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v10, 2u);
    }
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  if (v8)
  {
    [(RTVehicleLocationProvider *)self->_vehicleLocationProvider updateVehicleEventWithIdentifier:a3 photo:a4];
    v8[2](v8, 0);
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v10, 2u);
    }
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 geoMapItem:(id)a4 reply:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = (void (**)(id, id))a5;
  if (v11)
  {
    if (v9)
    {
      if (v10)
      {
        mapServiceManager = self->_mapServiceManager;
        __int16 v13 = [MEMORY[0x1E4F29128] UUID];
        int v14 = [MEMORY[0x1E4F1C9C8] date];
        id v24 = 0;
        __int16 v15 = [(RTMapServiceManager *)mapServiceManager mapItemWithIdentifier:v13 geoMapItem:v10 source:8 creationDate:v14 error:&v24];
        id v16 = v24;

        if (v16)
        {
          uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityClient);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v28 = v16;
            _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          v11[2](v11, v16);
LABEL_8:

          goto LABEL_17;
        }
        if (!v15)
        {
          id v20 = _rt_log_facility_get_os_log(RTLogFacilityClient);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
          }

          uint64_t v25 = *MEMORY[0x1E4F28568];
          long long v26 = @"Map item must be non-nil.";
          id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v21];
          v11[2](v11, v22);

          goto LABEL_8;
        }
      }
      else
      {
        __int16 v15 = 0;
      }
      [(RTVehicleLocationProvider *)self->_vehicleLocationProvider updateVehicleEventWithIdentifier:v9 mapItem:v15];
      v11[2](v11, 0);
      goto LABEL_17;
    }
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"Invalid parameter identifier, must be non-nil";
    __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v15];
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v28 = v23;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "error while calling %@, %@", buf, 0x16u);
    }
    v11[2](v11, v18);
  }
  else
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_17:
}

- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  if (v8)
  {
    [(RTVehicleLocationProvider *)self->_vehicleLocationProvider updateVehicleEventWithIdentifier:a3 location:a4];
    v8[2](v8, 0);
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v10, 2u);
    }
  }
}

- (void)engageInVehicleEventWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  if (v6)
  {
    [(RTVehicleLocationProvider *)self->_vehicleLocationProvider engageInVehicleEventWithIdentifier:a3];
    v6[2](v6, 0);
  }
  else
  {
    __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v8, 2u);
    }
  }
}

- (void)stopMonitoringVehicleEventsWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    int v5 = [(RTDaemonClient *)self vehicleEventRegistrar];
    [v5 stopMonitoringVehicleEvents];

    uint64_t v6 = [(RTDaemonClient *)self restorationData];
    [v6 removeObjectForKey:@"vehicleEventRegistrar"];

    __int16 v7 = [(RTDaemonClient *)self clientManagerDelegate];
    [v7 saveDaemonClient:self];

    v4[2](v4, 0);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }
}

- (void)fetchAutomaticVehicleEventDetectionSupportedWithReply:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    vehicleLocationProvider = self->_vehicleLocationProvider;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke;
    v8[3] = &unk_1E6B918B0;
    v8[4] = self;
    id v9 = v4;
    [(RTVehicleLocationProvider *)vehicleLocationProvider fetchAutomaticVehicleEventDetectionSupportedWithHandler:v8];
  }
  else
  {
    __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke_2;
  v9[3] = &unk_1E6B907A0;
  char v12 = a2;
  __int16 v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "sending automatic vehicle event detection supported, %d, to client, %@, error, %@", (uint8_t *)v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)vehicleEventRegistrar:(id)a3 didReceiveVehicleEvents:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(RTDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke;
  block[3] = &unk_1E6B90F80;
  void block[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v9;
  SEL v20 = a2;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v12, block);
}

void __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) launchClient];
  id v2 = [*(id *)(a1 + 32) xpcConnection];

  BOOL v3 = v2 == 0;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "client, %@, not connected. buffering vehicle events, %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v12 = [*(id *)(a1 + 32) vehicleEventRegistrar];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_584;
    v16[3] = &unk_1E6B918D8;
    objc_copyWeak(&v20, (id *)buf);
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_2;
    v14[3] = &unk_1E6B91900;
    objc_copyWeak(&v15, (id *)buf);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
    [v12 addPendingVehicleEventBlock:v16 failBlock:v14 description:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "sending vehicle events, %@, to client, %@", buf, 0x16u);
    }

    __int16 v8 = [*(id *)(a1 + 32) xpcConnection];
    id v9 = [v8 remoteObjectProxy];
    [v9 onVehicleEvents:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

void __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_584(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained vehicleEventRegistrar:*(void *)(a1 + 32) didReceiveVehicleEvents:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v14[0] = @"Buffered vehicle events failed";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:0 userInfo:v4];

  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = [v5 localizedDescription];
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v8 = [WeakRetained xpcConnection];
  id v9 = [v8 remoteObjectProxy];
  [v9 onVehicleEvents:0 error:v5];
}

- (void)addLocationOfInterestOfType:(int64_t)a3 mapItemStorage:(id)a4 customLabel:(id)a5 reply:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, id))a6;
  if (v13)
  {
    if (v11)
    {
      mapServiceManager = self->_mapServiceManager;
      id v15 = [MEMORY[0x1E4F29128] UUID];
      id v16 = [MEMORY[0x1E4F1C9C8] date];
      id v27 = 0;
      id v17 = [(RTMapServiceManager *)mapServiceManager mapItemWithIdentifier:v15 geoMapItem:v11 source:8 creationDate:v16 error:&v27];
      id v18 = v27;

      if (v18)
      {
        id v19 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v18;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v13[2](v13, 0, v18);
        goto LABEL_14;
      }
      if (v17)
      {
        objc_initWeak((id *)buf, self);
        id v20 = +[RTLearnedPlace placeTypeFromType:a3];
        id v21 = [(RTDaemonClient *)self learnedLocationManager];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke;
        v24[3] = &unk_1E6B91928;
        objc_copyWeak(v26, (id *)buf);
        v26[1] = (id)a2;
        v26[2] = v20;
        uint64_t v25 = v13;
        [v21 addLocationOfInterestWithType:v20 mapItem:v17 customLabel:v12 handler:v24];

        objc_destroyWeak(v26);
        objc_destroyWeak((id *)buf);
        goto LABEL_14;
      }
    }
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
    }

    uint64_t v28 = *MEMORY[0x1E4F28568];
    __int16 v29 = @"Map item must be non-nil.";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v17];
    v13[2](v13, 0, v23);
  }
  else
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_14:
}

void __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke_588;
    v16[3] = &unk_1E6B91418;
    uint64_t v21 = *(void *)(a1 + 48);
    id v10 = v5;
    uint64_t v22 = *(void *)(a1 + 56);
    id v17 = v10;
    id v18 = v8;
    id v19 = v6;
    id v20 = *(id *)(a1 + 32);
    dispatch_async(v9, v16);

    id v11 = v17;
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v14 = +[RTLearnedPlace placeTypeToString:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138413058;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, added location of interest, %@, type, %@, error, %@", buf, 0x2Au);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:v5];
    (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v11, v6);
  }
}

void __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke_588(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = +[RTLearnedPlace placeTypeToString:*(void *)(a1 + 72)];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138413314;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, added location of interest, %@, type, %@, reply to client, %@, error, %@", (uint8_t *)&v10, 0x34u);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 48));
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 mapItemStorage:(id)a5 customLabel:(id)a6 reply:(id)a7
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, void, id))a7;
  if (v16)
  {
    if (v14)
    {
      id v30 = v13;
      mapServiceManager = self->_mapServiceManager;
      __int16 v18 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      id v36 = 0;
      uint64_t v20 = [(RTMapServiceManager *)mapServiceManager mapItemWithIdentifier:v18 geoMapItem:v14 source:8 creationDate:v19 error:&v36];
      id v21 = v36;

      if (v21)
      {
        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v21;
          _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v16[2](v16, 0, v21);
        id v13 = v30;
      }
      else if (v20)
      {
        unint64_t v26 = +[RTLearnedPlace placeTypeFromType:a4];
        learnedLocationManager = self->_learnedLocationManager;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke;
        v31[3] = &unk_1E6B91978;
        v31[4] = self;
        SEL v34 = a2;
        unint64_t v35 = v26;
        id v32 = v15;
        __int16 v33 = v16;
        id v13 = v30;
        [(RTLearnedLocationManager *)learnedLocationManager updateLocationOfInterestWithIdentifier:v30 type:v26 mapItem:v20 mapItemSource:8 customLabel:v32 handler:v31];
      }
      else
      {
        uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        id v13 = v30;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
        }

        uint64_t v37 = *MEMORY[0x1E4F28568];
        __int16 v38 = @"Map item must be non-nil.";
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        __int16 v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v20];
        v16[2](v16, 0, v29);
      }
    }
    else
    {
      __int16 v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F5CFE8];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42[0] = @"requires a valid mapItem.";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      __int16 v25 = [v23 errorWithDomain:v24 code:0 userInfo:v20];
      v16[2](v16, 0, v25);
    }
  }
  else
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke_2;
  block[3] = &unk_1E6B91950;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = v8;
  id v14 = v5;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = v6;
  id v18 = *(id *)(a1 + 48);
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, block);
}

void __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = +[RTLearnedPlace placeTypeToString:*(void *)(a1 + 80)];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    int v11 = 138413570;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, updated location of interest, %@, type, %@, customLabel, %@, reply to client, %@, error, %@", (uint8_t *)&v11, 0x3Eu);
  }
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, *(void *)(a1 + 56));
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItemStorage:(id)a4 reply:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, id))a5;
  if (v11)
  {
    if (v10)
    {
      mapServiceManager = self->_mapServiceManager;
      __int16 v13 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      id v25 = 0;
      __int16 v15 = [(RTMapServiceManager *)mapServiceManager mapItemWithIdentifier:v13 geoMapItem:v10 source:8 creationDate:v14 error:&v25];
      id v16 = v25;

      if (v16)
      {
        __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v16;
          _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v11[2](v11, v16);
        goto LABEL_14;
      }
      if (v15)
      {
        learnedLocationManager = self->_learnedLocationManager;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke;
        v21[3] = &unk_1E6B91730;
        void v21[4] = self;
        SEL v24 = a2;
        id v22 = v9;
        uint64_t v23 = v11;
        [(RTLearnedLocationManager *)learnedLocationManager updateLocationOfInterestWithIdentifier:v22 mapItem:v15 mapItemSource:8 handler:v21];

        goto LABEL_14;
      }
    }
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
    }

    uint64_t v26 = *MEMORY[0x1E4F28568];
    __int16 v27 = @"Map item must be non-nil.";
    __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v15];
    v11[2](v11, v20);
  }
  else
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_14:
}

void __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  uint64_t v14 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v4;
  id v13 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(v5, block);
}

uint64_t __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, updated mapItem of location of interest, %@, reply to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    unint64_t v11 = +[RTLearnedPlace placeTypeFromType:a4];
    learnedLocationManager = self->_learnedLocationManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke;
    v14[3] = &unk_1E6B91978;
    void v14[4] = self;
    SEL v17 = a2;
    id v15 = v9;
    unint64_t v18 = v11;
    id v16 = v10;
    [(RTLearnedLocationManager *)learnedLocationManager updateLocationOfInterestWithIdentifier:v15 type:v11 handler:v14];
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke_2;
  v10[3] = &unk_1E6B91418;
  uint64_t v15 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v8;
  uint64_t v16 = v7;
  id v13 = v4;
  id v14 = *(id *)(a1 + 48);
  id v9 = v4;
  dispatch_async(v5, v10);
}

uint64_t __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = +[RTLearnedPlace placeTypeToString:*(void *)(a1 + 72)];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138413314;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, updated location of interest, %@, type, %@, reply to client, %@, error, %@", (uint8_t *)&v9, 0x34u);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 customLabel:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    unint64_t v14 = +[RTLearnedPlace placeTypeFromType:a4];
    learnedLocationManager = self->_learnedLocationManager;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke;
    v17[3] = &unk_1E6B919A0;
    v17[4] = self;
    SEL v21 = a2;
    id v18 = v11;
    unint64_t v22 = v14;
    id v19 = v12;
    id v20 = v13;
    [(RTLearnedLocationManager *)learnedLocationManager updateLocationOfInterestWithIdentifier:v18 type:v14 customLabel:v19 handler:v17];
  }
  else
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke_2;
  block[3] = &unk_1E6B91950;
  uint64_t v17 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 72);
  id v12 = v6;
  uint64_t v18 = v7;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v4;
  id v16 = *(id *)(a1 + 56);
  id v10 = v4;
  dispatch_async(v5, block);
}

uint64_t __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = +[RTLearnedPlace placeTypeToString:*(void *)(a1 + 80)];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    int v10 = 138413570;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, updated location of interest, %@, type, %@, customLabel, %@, reply to client, %@, error, %@", (uint8_t *)&v10, 0x3Eu);
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 56));
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke;
    v13[3] = &unk_1E6B91730;
    v13[4] = self;
    SEL v16 = a2;
    id v14 = v9;
    id v15 = v10;
    [(RTLearnedLocationManager *)learnedLocationManager updateLocationOfInterestWithIdentifier:v14 customLabel:a4 handler:v13];
  }
  else
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  uint64_t v14 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v4;
  id v13 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(v5, block);
}

uint64_t __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, updated customLabel of location of interest, %@, reply to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke;
    v11[3] = &unk_1E6B919C8;
    v11[4] = self;
    SEL v14 = a2;
    id v12 = v7;
    id v13 = v8;
    [(RTLearnedLocationManager *)learnedLocationManager removeLocationOfInterestWithIdentifier:v12 handler:v11];
  }
  else
  {
    __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  uint64_t v13 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v3;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, remove location of interest, %@, reply to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)removeVisitWithIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = dispatch_group_create();
    __int16 v10 = v9;
    *(void *)buf = 0;
    id v25 = buf;
    uint64_t v26 = 0x3032000000;
    __int16 v27 = __Block_byref_object_copy__9;
    uint64_t v28 = __Block_byref_object_dispose__9;
    id v29 = 0;
    if (self->_learnedLocationManager)
    {
      dispatch_group_enter(v9);
      learnedLocationManager = self->_learnedLocationManager;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke;
      v19[3] = &unk_1E6B91A18;
      void v19[4] = self;
      SEL v23 = a2;
      id v20 = v7;
      uint64_t v22 = buf;
      uint64_t v21 = v10;
      [(RTLearnedLocationManager *)learnedLocationManager removeVisitWithIdentifier:v20 handler:v19];
    }
    __int16 v12 = [(RTDaemonClient *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_592;
    v13[3] = &unk_1E6B91A40;
    uint64_t v17 = buf;
    SEL v18 = a2;
    id v14 = v7;
    uint64_t v15 = self;
    id v16 = v8;
    dispatch_group_notify(v10, v12, v13);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E6B919F0;
  uint64_t v12 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v11 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v6 = 138412802;
    long long v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, remove location of interest visit, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_592(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138413058;
    __int16 v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, remove location of interest visit, %@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 reply:(id)a4
{
  if (a4)
  {
    learnedLocationManager = self->_learnedLocationManager;
    -[RTLearnedLocationManager extendLifetimeOfVisitsWithIdentifiers:handler:](learnedLocationManager, "extendLifetimeOfVisitsWithIdentifiers:handler:", a3);
  }
  else
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__RTDaemonClient_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply___block_invoke;
    v11[3] = &unk_1E6B91A68;
    SEL v15 = a2;
    uint64_t v12 = v7;
    __int16 v13 = self;
    id v14 = v8;
    [(RTLearnedLocationManager *)learnedLocationManager fetchDedupedLocationOfInterestIdentifiersWithIdentifier:v12 handler:v11];

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

void __80__RTDaemonClient_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138413314;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, loi identifier, %@, deduped from other loi identifiers, %@, reply to client, %@, error, %@", (uint8_t *)&v11, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 geoMapItem:(id)a6 reply:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = (void (**)(id, id))a7;
  if (v15)
  {
    if (v14)
    {
      mapServiceManager = self->_mapServiceManager;
      __int16 v17 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
      id v24 = 0;
      __int16 v19 = [(RTMapServiceManager *)mapServiceManager mapItemWithIdentifier:v17 geoMapItem:v14 source:8 creationDate:v18 error:&v24];
      id v20 = v24;

      if (v20)
      {
        uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v20;
          _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v15[2](v15, v20);
        goto LABEL_14;
      }
      if (v19)
      {
        [(RTEventModelProvider *)self->_eventModelProvider userInteractionWithPredictedLocationOfInterest:v12 interaction:a4 feedback:v13 mapItem:v19 handler:v15];
        goto LABEL_14;
      }
    }
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
    }

    uint64_t v25 = *MEMORY[0x1E4F28568];
    uint64_t v26 = @"Map item must be non-nil.";
    __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    SEL v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v19];
    v15[2](v15, v23);
  }
  else
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_14:
}

- (void)fetchRemoteStatusWithReply:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    intermittentGNSSManager = self->_intermittentGNSSManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__RTDaemonClient_fetchRemoteStatusWithReply___block_invoke;
    v9[3] = &unk_1E6B91A90;
    SEL v11 = a2;
    v9[4] = self;
    id v10 = v5;
    [(RTIntermittentGNSSManager *)intermittentGNSSManager fetchRemoteStatusWithHandler:v9];
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

void __45__RTDaemonClient_fetchRemoteStatusWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138413058;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, reply to client, %@, remote status, %ld, error, %@", (uint8_t *)&v9, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    __int16 v19 = [RTSensitiveDateClassifier alloc];
    uint64_t v18 = [(RTDaemonClient *)self defaultsManager];
    int v9 = [(RTDaemonClient *)self healthKitManager];
    id v10 = [(RTDaemonClient *)self learnedLocationStore];
    __int16 v11 = [(RTDaemonClient *)self locationManager];
    uint64_t v12 = [(RTDaemonClient *)self motionActivityManager];
    [(RTDaemonClient *)self timerManager];
    v13 = SEL v21 = a2;
    [(RTDaemonClient *)self vehicleLocationProvider];
    id v20 = v8;
    v15 = id v14 = v7;
    id v16 = [(RTDaemonClient *)self wifiManager];
    uint64_t v17 = [(RTSensitiveDateClassifier *)v19 initWithDefaultsManager:v18 healthKitManager:v9 learnedLocationStore:v10 locationManager:v11 motionActivityManager:v12 timerManager:v13 vehicleLocationProvider:v15 wifiManager:v16];

    id v7 = v14;
    id v8 = v20;

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke;
    v22[3] = &unk_1E6B91AB8;
    void v22[4] = self;
    SEL v24 = v21;
    id v23 = v20;
    [v17 fetchLookbackWindowStartDateWithLocation:v7 handler:v22];
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

void __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, lookback window start date %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    locationManager = self->_locationManager;
    if (locationManager)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke;
      v12[3] = &unk_1E6B91A68;
      void v12[4] = self;
      SEL v15 = a2;
      id v13 = v7;
      id v14 = v8;
      [(RTLocationManager *)locationManager fetchStoredLocationsWithContext:v13 handler:v12];
    }
    else
    {
      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityClient);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "LocationManager is nil, returning", buf, 2u);
      }

      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
}

void __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke_2;
  v11[3] = &unk_1E6B916E0;
  uint64_t v16 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) count];
    id v6 = [*(id *)(a1 + 48) options];
    uint64_t v7 = *(void *)(a1 + 56);
    int v9 = 138413314;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, %lu location options %@, error, %@", (uint8_t *)&v9, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(void, void, void))v11;
  if (!v9)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    __int16 v15 = "Invalid parameter not satisfying: date";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_8;
  }
  if (!v11)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    __int16 v15 = "Invalid parameter not satisfying: reply";
    goto LABEL_14;
  }
  locationManager = self->_locationManager;
  if (locationManager)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke;
    v17[3] = &unk_1E6B91AE0;
    v17[4] = self;
    SEL v19 = a2;
    id v18 = v11;
    [(RTLocationManager *)locationManager fetchEstimatedLocationAtDate:v9 options:v10 handler:v17];
  }
  else
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "LocationManager is nil, returning", buf, 2u);
    }

    v12[2](v12, 0, 0);
  }
LABEL_9:
}

void __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, location, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchTripSegmentsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(RTDaemonClient *)self tripSegmentManager];
    [v8 fetchTripSegmentsWithOptions:v6 handler:v7];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v9, 2u);
    }
  }
}

- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(RTDaemonClient *)self tripSegmentManager];
    [v8 fetchLocationsCountForTripSegmentWithOptions:v6 handler:v7];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }
}

- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(RTDaemonClient *)self tripSegmentManager];
    [v8 fetchLocationsForTripSegmentWithOptions:v6 handler:v7];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }
}

- (void)deleteTripSegmentWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(RTDaemonClient *)self tripSegmentManager];
    [v8 deleteTripSegmentWithUUID:v6 handler:v7];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }
}

- (void)fetchVehiclesWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(RTDaemonClient *)self vehicleStore];
    [v8 fetchVehiclesWithOptions:v6 handler:v7];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v9, 2u);
    }
  }
}

- (void)fetchTripSegmentMetadataWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(RTDaemonClient *)self tripSegmentManager];
    [v8 fetchTripSegmentMetadataWithOptions:v6 handler:v7];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(id)a4 reply:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        uint64_t v11 = [v9 unsignedIntegerValue];
        __int16 v12 = (objc_class *)[v8 enumeratedType];
        vendedClassesStoreManagerDict = self->_vendedClassesStoreManagerDict;
        __int16 v14 = NSStringFromClass(v12);
        uint64_t v15 = [(NSMutableDictionary *)vendedClassesStoreManagerDict objectForKey:v14];

        uint64_t v16 = [(id)objc_opt_class() vendedClasses];
        uint64_t v17 = [v16 member:v12];

        if (v17)
        {
          [v15 fetchEnumerableObjectsWithOptions:v8 offset:v11 handler:v10];
        }
        else
        {
          SEL v24 = [NSString stringWithFormat:@"no store supports the type expected by options, %@", v8];
          uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = *MEMORY[0x1E4F5CFE8];
          uint64_t v30 = *MEMORY[0x1E4F28568];
          uint64_t v31 = v24;
          __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          id v28 = [v25 errorWithDomain:v26 code:7 userInfo:v27];

          (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v28);
        }
        goto LABEL_11;
      }
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F5CFE8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      __int16 v33 = @"offset cannot be nil";
      id v20 = (void *)MEMORY[0x1E4F1C9E8];
      SEL v21 = &v33;
      uint64_t v22 = &v32;
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F5CFE8];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35[0] = @"options cannot be nil";
      id v20 = (void *)MEMORY[0x1E4F1C9E8];
      SEL v21 = (__CFString **)v35;
      uint64_t v22 = &v34;
    }
    id v23 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
    uint64_t v15 = [v18 errorWithDomain:v19 code:7 userInfo:v23];

    (*((void (**)(id, void, void, NSObject *))v10 + 2))(v10, 0, 0, v15);
    goto LABEL_11;
  }
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
  }
LABEL_11:
}

- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (!v7)
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Invalid parameter not satisfying: options";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_8;
  }
  if (!v8)
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Invalid parameter not satisfying: reply";
    goto LABEL_14;
  }
  if (self->_learnedLocationManager)
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    learnedLocationManager = self->_learnedLocationManager;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke;
    v15[3] = &unk_1E6B91A68;
    SEL v18 = a2;
    v15[4] = self;
    id v16 = v10;
    uint64_t v17 = v9;
    __int16 v12 = v10;
    [(RTLearnedLocationManager *)learnedLocationManager fetchFamiliarityIndexResultsWithOptions:v7 handler:v15];

LABEL_8:
    goto LABEL_9;
  }
  __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "LearnedLocationManager is nil, returning", buf, 2u);
  }

  v9[2](v9, 0, 0);
LABEL_9:
}

void __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E6B916E0;
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v17 = v8;
  id v14 = v6;
  id v15 = v9;
  id v16 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v10 = 138413314;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, familiarityIndexResults, %@, error, %@, latency, %.2f", (uint8_t *)&v10, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)fetchAuthorizedLocationStatus:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[RTDaemonClient fetchAuthorizedLocationStatus:]";
      __int16 v17 = 1024;
      int v18 = 2960;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply (in %s:%d)", buf, 0x12u);
    }
  }
  if (self->_authorizedLocationManager)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    authorizedLocationManager = self->_authorizedLocationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke;
    v11[3] = &unk_1E6B91B08;
    SEL v14 = a2;
    void v11[4] = self;
    id v12 = v7;
    id v13 = v5;
    id v9 = v7;
    [(RTAuthorizedLocationManager *)authorizedLocationManager fetchAuthorizedLocationExtendedStatus:v11];
  }
  else
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "AuthorizedLocationManager is nil, returning", buf, 2u);
    }

    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

void __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke_2;
  v13[3] = &unk_1E6B916E0;
  uint64_t v9 = *(void *)(a1 + 56);
  int v10 = *(void **)(a1 + 40);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v18 = v9;
  id v15 = v7;
  id v16 = v10;
  id v17 = *(id *)(a1 + 48);
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v8, v13);
}

uint64_t __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v10 = 138413314;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchAuthorizedLocationStatus, %@, error, %@, latency, %.2f", (uint8_t *)&v10, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)peopleDiscoveryRegistrar:(id)a3 didReceivePeopleDensityUpdate:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = [(RTDaemonClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke;
  block[3] = &unk_1E6B90F80;
  void block[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v9;
  SEL v20 = a2;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v12, block);
}

void __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) launchClient];
  id v2 = [*(id *)(a1 + 32) xpcConnection];

  BOOL v3 = v2 == 0;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "client, %@, not connected. buffering people density events, count %lu", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    __int16 v12 = [*(id *)(a1 + 32) peopleDiscoveryRegistrar];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_606;
    v16[3] = &unk_1E6B918D8;
    objc_copyWeak(&v20, (id *)buf);
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_2;
    v14[3] = &unk_1E6B91900;
    objc_copyWeak(&v15, (id *)buf);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
    [v12 addPendingPeopleDensityUpdateBlock:v16 failBlock:v14 description:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 40) count];
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "sending people density events, count %lu, to client, %@", buf, 0x16u);
    }

    uint64_t v8 = [*(id *)(a1 + 32) xpcConnection];
    id v9 = [v8 remoteObjectProxy];
    [v9 onDensityUpdate:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

void __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_606(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained peopleDiscoveryRegistrar:*(void *)(a1 + 32) didReceivePeopleDensityUpdate:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v14[0] = @"Buffered people density events failed";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:0 userInfo:v4];

  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = [v5 localizedDescription];
    int v11 = 138412290;
    __int16 v12 = v10;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = [WeakRetained xpcConnection];
  id v9 = [v8 remoteObjectProxy];
  [v9 onDensityUpdate:0 error:v5];
}

- (void)startMonitoringForPeopleDiscovery:(id)a3 configuration:(id)a4 reply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if (v10)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "rdar122420473 identifier %@, configuration %@", (uint8_t *)&v15, 0x16u);
    }

    [(RTDaemonClientRegistrarPeopleDiscovery *)self->_peopleDiscoveryRegistrar startMonitoringForPeopleDiscoveryWithIdentifier:v8 configuration:v9];
    __int16 v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_peopleDiscoveryRegistrar requiringSecureCoding:1 error:0];
    uint64_t v13 = [(RTDaemonClient *)self restorationData];
    [v13 setObject:v12 forKey:@"peopleDiscoveryRegistrar"];

    id v14 = [(RTDaemonClient *)self clientManagerDelegate];
    [v14 saveDaemonClient:self];

    v10[2](v10, 0);
  }
  else
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)stopMonitoringForPeopleDiscoveryWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    [(RTDaemonClientRegistrarPeopleDiscovery *)self->_peopleDiscoveryRegistrar stopMonitoringForPeopleDiscovery];
    BOOL v5 = [(RTDaemonClient *)self restorationData];
    [v5 removeObjectForKey:@"peopleDiscoveryRegistrar"];

    uint64_t v6 = [(RTDaemonClient *)self clientManagerDelegate];
    [v6 saveDaemonClient:self];

    v4[2](v4, 0);
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v8, 2u);
    }
  }
}

- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void, NSObject *))a5;
  if (!v9)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v17 = "Invalid parameter not satisfying: startDate";
LABEL_11:
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v10)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v17 = "Invalid parameter not satisfying: endDate";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  BOOL v12 = [(RTPeopleDiscoveryProvider *)self->_peopleDiscoveryProvider isProximityEventsEnabled];
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"feature disabled";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v16 = [v18 errorWithDomain:v19 code:13 userInfo:v20];

    v11[2](v11, MEMORY[0x1E4F1CBF0], v16);
    goto LABEL_15;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", buf, 2u);
  }

  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v21[3] = &unk_1E6B91468;
  void v21[4] = self;
  SEL v23 = a2;
  uint64_t v22 = v11;
  [(RTPeopleDiscoveryProvider *)peopleDiscoveryProvider fetchProximityHistoryFromStartDate:v9 endDate:v10 completionHandler:v21];

LABEL_16:
}

void __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) count];
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchProximityHistoryFromStartDate, %lu, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = (void (**)(id, void, NSObject *))a4;
  if (!v7)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventIDs", buf, 2u);
    }
    goto LABEL_11;
  }
  BOOL v9 = [(RTPeopleDiscoveryProvider *)self->_peopleDiscoveryProvider isProximityEventsEnabled];
  __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    __int16 v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"feature disabled";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v13 = [v14 errorWithDomain:v15 code:13 userInfo:v16];

    v8[2](v8, MEMORY[0x1E4F1CBF0], v13);
LABEL_11:

    goto LABEL_12;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromEventIDs:completionHandler:", buf, 2u);
  }

  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
  v17[3] = &unk_1E6B91468;
  v17[4] = self;
  SEL v19 = a2;
  id v18 = v8;
  [(RTPeopleDiscoveryProvider *)peopleDiscoveryProvider fetchProximityHistoryFromEventIDs:v7 completionHandler:v17];

LABEL_12:
}

void __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) count];
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchProximityHistoryFromEventIDs, %lu, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchPeopleCountEventsHistory:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void, NSObject *))a4;
  if (a3)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "fetchPeopleCountEventsHistory SPI deprecated", v11, 2u);
    }

    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F5CFE8];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"SPI deprecated";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    __int16 v10 = [v7 errorWithDomain:v8 code:10 userInfo:v9];

    v5[2](v5, MEMORY[0x1E4F1CBF0], v10);
  }
  else
  {
    __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: proximityEvents", v11, 2u);
    }
  }
}

- (void)fetchOngoingPeopleDensity:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(RTPeopleDiscoveryProvider *)self->_peopleDiscoveryProvider isPeopleDensityEventsEnabled];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "RTDaemonClient fetchOngoingPeopleDensity", buf, 2u);
    }

    peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke;
    v14[3] = &unk_1E6B91B30;
    void v14[4] = self;
    SEL v16 = a2;
    id v15 = v5;
    [(RTPeopleDiscoveryProvider *)peopleDiscoveryProvider fetchMostRecentPeopleDensity:v14];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    __int16 v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"feature disabled";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:13 userInfo:v12];

    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v13);
  }
}

void __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchMostRecentPeopleDensity, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void, NSObject *))a5;
  if (!v9)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v17 = "Invalid parameter not satisfying: startDate";
LABEL_11:
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v10)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v17 = "Invalid parameter not satisfying: endDate";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  BOOL v12 = [(RTPeopleDiscoveryProvider *)self->_peopleDiscoveryProvider isPeopleDensityEventsEnabled];
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"feature disabled";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v16 = [v18 errorWithDomain:v19 code:13 userInfo:v20];

    v11[2](v11, MEMORY[0x1E4F1CBF0], v16);
    goto LABEL_15;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", buf, 2u);
  }

  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v21[3] = &unk_1E6B91468;
  void v21[4] = self;
  SEL v23 = a2;
  uint64_t v22 = v11;
  [(RTPeopleDiscoveryProvider *)peopleDiscoveryProvider fetchPeopleDensityHistoryFromStartDate:v9 endDate:v10 completionHandler:v21];

LABEL_16:
}

void __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) count];
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchPeopleDensityHistoryFromStartDate, %lu, error, %@", (uint8_t *)&v8, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, NSObject *))a4;
  if (v6)
  {
    BOOL v8 = [(RTPeopleDiscoveryProvider *)self->_peopleDiscoveryProvider isProximityEventsEnabled];
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "per-contact score feature is not enabled", v18, 2u);
      }

      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      id v20 = @"feature disabled";
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v14 = &v20;
      uint64_t v15 = &v19;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", v18, 2u);
      }

      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"feature disabled";
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v14 = (__CFString **)v22;
      uint64_t v15 = &v21;
    }
    __int16 v17 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
    uint64_t v16 = [v11 errorWithDomain:v12 code:13 userInfo:v17];

    v7[2](v7, MEMORY[0x1E4F1CBF0], v16);
  }
  else
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIDs", v18, 2u);
    }
  }
}

- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3
{
  if (a3)
  {
    contactsManager = self->_contactsManager;
    -[RTContactsManager fetchFormattedPostalAddressesFromMeCard:](contactsManager, "fetchFormattedPostalAddressesFromMeCard:");
  }
  else
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }
  }
}

- (void)addElevations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v6)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v13 = 0;
    BOOL v10 = "Invalid parameter not satisfying: elevations";
    uint64_t v11 = (uint8_t *)&v13;
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v12 = 0;
    BOOL v10 = "Invalid parameter not satisfying: handler";
    uint64_t v11 = (uint8_t *)&v12;
    goto LABEL_9;
  }
  id v9 = [(RTDaemonClient *)self elevationManager];
  [v9 addElevations:v6 handler:v8];
LABEL_7:
}

- (void)fetchElevationsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v6)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v13 = 0;
    BOOL v10 = "Invalid parameter not satisfying: options";
    uint64_t v11 = (uint8_t *)&v13;
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v12 = 0;
    BOOL v10 = "Invalid parameter not satisfying: reply";
    uint64_t v11 = (uint8_t *)&v12;
    goto LABEL_9;
  }
  id v9 = [(RTDaemonClient *)self elevationManager];
  [v9 fetchElevationsWithOptions:v6 handler:v8];
LABEL_7:
}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v16) = 0;
    uint64_t v15 = "Invalid parameter not satisfying: options";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v16) = 0;
    uint64_t v15 = "Invalid parameter not satisfying: reply";
    goto LABEL_11;
  }
  BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    __int16 v13 = NSStringFromSelector(a2);
    int v16 = 138412546;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@,%@ invoked", (uint8_t *)&v16, 0x16u);
  }
  __int16 v14 = [(RTDaemonClient *)self backgroundInertialOdometryManager];
  [v14 fetchBackgroundInertialOdometrySamplesWithOptions:v7 handler:v9];
LABEL_9:
}

- (void)addBackgroundInertialOdometrySamples:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v16) = 0;
    uint64_t v15 = "Invalid parameter not satisfying: samples";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v16) = 0;
    uint64_t v15 = "Invalid parameter not satisfying: reply";
    goto LABEL_11;
  }
  BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    __int16 v13 = NSStringFromSelector(a2);
    int v16 = 138412803;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 1025;
    int v21 = [v7 count];
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@,%@ invoked with %{private}d samples", (uint8_t *)&v16, 0x1Cu);
  }
  __int16 v14 = [(RTDaemonClient *)self backgroundInertialOdometryManager];
  [v14 addBackgroundInertialOdometrySamples:v7 handler:v9];
LABEL_9:
}

- (void)setRestorationData:(id)a3
{
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (BOOL)monitorVisits
{
  return self->_monitorVisits;
}

- (BOOL)leechVisits
{
  return self->_leechVisits;
}

- (BOOL)leechLowConfidenceVisits
{
  return self->_leechLowConfidenceVisits;
}

- (BOOL)monitorPlaceInferences
{
  return self->_monitorPlaceInferences;
}

- (RTPlaceInferenceOptions)placeInferenceOptions
{
  return self->_placeInferenceOptions;
}

- (void)setPlaceInferenceOptions:(id)a3
{
}

- (RTEntitlementProvider)entitlementProvider
{
  return self->_entitlementProvider;
}

- (void)setEntitlementProvider:(id)a3
{
}

- (NSMutableDictionary)vendedClassesStoreManagerDict
{
  return self->_vendedClassesStoreManagerDict;
}

- (void)setVendedClassesStoreManagerDict:(id)a3
{
}

- (void)setVehicleEventRegistrar:(id)a3
{
}

- (RTDaemonClientRegistrarScenarioTrigger)scenarioTriggerRegistrar
{
  return self->_scenarioTriggerRegistrar;
}

- (void)setScenarioTriggerRegistrar:(id)a3
{
}

- (RTDaemonClientRegistrarPeopleDiscovery)peopleDiscoveryRegistrar
{
  return self->_peopleDiscoveryRegistrar;
}

- (void)setPeopleDiscoveryRegistrar:(id)a3
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

- (RTBackgroundInertialOdometryManager)backgroundInertialOdometryManager
{
  return self->_backgroundInertialOdometryManager;
}

- (void)setBackgroundInertialOdometryManager:(id)a3
{
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
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

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (void)setElevationManager:(id)a3
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

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
}

- (RTAuthorizedLocationManager)authorizedLocationManager
{
  return self->_authorizedLocationManager;
}

- (void)setAuthorizedLocationManager:(id)a3
{
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
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

- (RTLocationContextManager)locationContextManager
{
  return self->_locationContextManager;
}

- (void)setLocationContextManager:(id)a3
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

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (void)setPlaceInferenceManager:(id)a3
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

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
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

- (RTTripSegmentManager)tripSegmentManager
{
  return self->_tripSegmentManager;
}

- (void)setTripSegmentManager:(id)a3
{
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_executableName, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_tripSegmentManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_locationContextManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_intermittentGNSSManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_eventAgentManager, 0);
  objc_storeStrong((id *)&self->_elevationManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_backgroundInertialOdometryManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryRegistrar, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerRegistrar, 0);
  objc_storeStrong((id *)&self->_vehicleEventRegistrar, 0);
  objc_storeStrong((id *)&self->_vendedClassesStoreManagerDict, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_placeInferenceOptions, 0);
  objc_storeStrong((id *)&self->_restorationData, 0);
  objc_destroyWeak((id *)&self->_clientManagerDelegate);
  objc_storeStrong((id *)&self->_restorationIdentifier, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end