@interface CRCarKitServiceAgent
+ (id)_pairingIdentifierForMessagingVehicle:(id)a3;
+ (id)_pairingIdentifierForPromptFlow:(id)a3;
+ (unint64_t)_declineTypeForOOBPairingMessagingVehicle:(id)a3;
+ (unint64_t)_pairingDeclineCountForIdentifier:(id)a3;
+ (void)_incrementPairingDeclineCountForIdentifier:(id)a3;
- (BOOL)_currentlyConnectedVehicleSupportsMixableAudio;
- (BOOL)_isRestricted:(id *)a3;
- (BOOL)_isVehicleActionable:(id)a3;
- (BOOL)_requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:(id)a3;
- (BOOL)_sendDeviceIdentifiersForMessagingVehicle:(id)a3 pairingStatus:(unint64_t)a4;
- (BOOL)_shouldPromptEnhancedIntegrationForStoredVehicle:(id)a3 messagingVehicle:(id)a4;
- (BOOL)attemptConnectionWithVehicles:(id)a3;
- (BOOL)carPlaySimulatorActive;
- (BOOL)enhancedIntegrationSupportedForPairingPromptFlow:(id)a3;
- (BOOL)hasExistingBluetoothPairingForPairingPromptFlow:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)needsBluetoothTurnedOnForPairingPromptFlow:(id)a3;
- (BOOL)needsWiFiTurnedOnForPairingPromptFlow:(id)a3;
- (BOOL)postInCarNotificationForVehicle:(id)a3;
- (BOOL)postOutOfCarNotificationForVehicle:(id)a3;
- (BOOL)removeVehicle:(id)a3;
- (BOOL)supportsThemeAssetsForPairingPromptFlow:(id)a3;
- (CARConnectionTimeServiceAgent)connectionTimeServiceAgent;
- (CARMessagingServiceConnector)messagingConnector;
- (CARSessionRequestClient)sessionRequestClient;
- (CARSessionStatus)sessionStatus;
- (CRBluetoothManager)bluetoothManager;
- (CRCarKitMonitoringServiceAgent)monitoringService;
- (CRCarKitServiceAgent)initWithVehicleStore:(id)a3 sessionStatus:(id)a4 bluetoothManager:(id)a5 preferences:(id)a6 connectionTimeServiceAgent:(id)a7;
- (CRCarPlayPreferences)preferencesManager;
- (CRFeaturesAvailabilityAgent)featuresAvailabilityAgent;
- (CRHeadUnitPairingPresenterDelegate)headUnitPairingDelegate;
- (CRLoggingChannelManager)loggingChannelManager;
- (CRMessagingServiceVehicleRepresenting)BTPowerMessagingVehicle;
- (CRPairingPromptFlowController)currentPromptFlowController;
- (CRSetupPromptDirectorAgent)setupPromptDirector;
- (CRVehicle)BTPowerStoredVehicle;
- (CRVehicleAssetManaging)vehicleAssetManager;
- (CRVehicleStore)vehicleStore;
- (CRWiFiCarManager)wifiManager;
- (CRWirelessSessionAssertionManager)assertionManager;
- (NSMutableArray)outstandingApprovalAlerts;
- (NSMutableArray)outstandingEnableWiFiAlerts;
- (NSMutableArray)outstandingEnhancedIntegrationAlerts;
- (NSMutableArray)outstandingPairingAlerts;
- (NSMutableDictionary)serviceCountDuringAlertForBluetoothAddress;
- (NSNumber)cachedCarPlayAllowedChangeValue;
- (NSString)lastStartSessionDeviceID;
- (id)_presentedReconnectionEnableWiFiAlertForVehicle:(id)a3;
- (id)_wirelessPairingAnalyticsDescriptionForMessagingVehicle:(id)a3 storedVehicle:(id)a4;
- (id)accessoryRadarDescription:(id)a3;
- (id)assetProgressForPairingPromptFlow:(id)a3;
- (id)carKeyInfoForPairingPromptFlow:(id)a3;
- (id)currentBluetoothConfirmationHandler;
- (id)currentBluetoothPairingCompletion;
- (id)pairedVehiclesConnectedOnBluetooth;
- (id)saveVehicle:(id)a3;
- (id)storedVehicleForSession:(id)a3;
- (id)vehicleMatchingMessagingVehicle:(id)a3 inVehicles:(id)a4;
- (unint64_t)outOfBandPairingDeclineCountForPairingPromptFlow:(id)a3;
- (void)_beginWiredPairingWithMessagingVehicle:(id)a3 storedVehicle:(id)a4;
- (void)_delegateHeadUnitPairingDidCompletePairingFlow:(BOOL)a3 forBluetoothAddress:(id)a4 error:(id)a5;
- (void)_delegateHeadUnitPairingDidReceiveUserConfirmation:(BOOL)a3 forBluetoothAddress:(id)a4;
- (void)_dismissApprovalAlertForMessagingVehicle:(id)a3;
- (void)_dismissApprovalAlerts;
- (void)_dismissEnhancedIntegrationAlertForMessagingVehicle:(id)a3;
- (void)_dismissEnhancedIntegrationAlerts;
- (void)_dismissPairingAlertForMessagingVehicle:(id)a3;
- (void)_dismissPairingAlerts;
- (void)_dismissPairingPromptFlow:(id)a3;
- (void)_dismissReconnectionEnableWiFiAlertExceptForVehicle:(id)a3;
- (void)_dismissReconnectionEnableWiFiAlertForVehicle:(id)a3;
- (void)_enhancedIntegrationUpdatedForMessagingVehicle:(id)a3 status:(unint64_t)a4;
- (void)_findWirelessPairedVehicleForAccessoryConnectionIdentifier:(unint64_t)a3 result:(id)a4;
- (void)_findWirelessPairedVehicleForMessagingVehicle:(id)a3 result:(id)a4;
- (void)_handleCarPlayAllowedDidChange;
- (void)_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_mainQueue_startSessionForHost:(id)a3 reply:(id)a4;
- (void)_mainQueue_updateClusterAssetIdentifier:(id)a3 assetVersion:(id)a4 sdkVersion:(id)a5 forVehicle:(id)a6;
- (void)_presentApprovalIfNecessaryForMessagingVehicle:(id)a3 storedVehicle:(id)a4;
- (void)_presentApprovalUsingAlertsForMessagingVehicle:(id)a3;
- (void)_presentCarPlaySetupForMessagingVehicle:(id)a3 storedVehicle:(id)a4;
- (void)_presentEnhancedIntegrationAlertForMessagingVehicle:(id)a3;
- (void)_presentReconnectionEnableWiFiAlertForVehicle:(id)a3;
- (void)_presentWiredBluetoothPairingAlertForMessagingVehicle:(id)a3 storedVehicle:(id)a4;
- (void)_saveWiFiCredentials:(id)a3 forAccessoryConnectionIdentifier:(unint64_t)a4 result:(id)a5;
- (void)_saveWiFiCredentials:(id)a3 fromMessagingVehicle:(id)a4 forWirelessPairedVehicle:(id)a5 result:(id)a6;
- (void)_sendCarPlayAvailabilityForMessagingVehicle:(id)a3 storedVehicle:(id)a4;
- (void)_setVehiclePairingStatus:(unint64_t)a3 forPromptFlow:(id)a4;
- (void)allowsConnectionsForCertificateSerial:(id)a3 reply:(id)a4;
- (void)allowsConnectionsForWiFiUUID:(id)a3 reply:(id)a4;
- (void)bluetoothManager:(id)a3 completedPairingForDeviceAddress:(id)a4 deviceName:(id)a5;
- (void)bluetoothManager:(id)a3 didChangePowerState:(BOOL)a4;
- (void)bluetoothManager:(id)a3 failedPairingForDeviceAddress:(id)a4 name:(id)a5 didTimeout:(BOOL)a6;
- (void)bluetoothManager:(id)a3 requestsConfirmationForDeviceAddress:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7;
- (void)dealloc;
- (void)deviceSupportedCarPlayFeaturesWithReply:(id)a3;
- (void)didCompletePairingPromptFlow:(id)a3;
- (void)didFailToHeadUnitPairWithBluetoothAddress:(id)a3 error:(id)a4;
- (void)didHeadUnitPairWithBluetoothAddress:(id)a3;
- (void)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4 reply:(id)a5;
- (void)enumerateStoredVehiclesForMessagingVehicles:(id)a3 usingBlock:(id)a4;
- (void)fetchAllVehiclesWithReply:(id)a3;
- (void)fetchInstrumentClusterURLsWithReply:(id)a3;
- (void)fetchScaledDisplaysWithReply:(id)a3 reply:(id)a4;
- (void)handleAnyMessagingConnectionsToVehicles;
- (void)handleBluetoothClassicPairingCompletedForDeviceAddress:(id)a3 name:(id)a4 preApproved:(BOOL)a5 reply:(id)a6;
- (void)handleCarPlayAllowedDidChange;
- (void)handleCarPlayConnectionRequestForConnectionID:(unsigned int)a3 startSessionProperties:(id)a4 reply:(id)a5;
- (void)handleCarPlayDiagnosticsWithDeviceScreenshotURL:(id)a3 carScreenshotURL:(id)a4 attachmentURLs:(id)a5 activeBundleIdentifier:(id)a6 reply:(id)a7;
- (void)handleCarPlayRestrictionChangedWithReply:(id)a3;
- (void)handleDidConnectBluetoothAddress:(id)a3 reply:(id)a4;
- (void)handleDidConnectMessagingToVehicles:(id)a3;
- (void)handleDidDisconnectBluetoothAddress:(id)a3 reply:(id)a4;
- (void)handleVehicleStoreAvailabiltyDidChange:(id)a3;
- (void)hasVehiclesWithReply:(id)a3;
- (void)incrementOutOfBandPairingDeclineCountForPairingPromptFlow:(id)a3;
- (void)isBluetoothInCarWithReply:(id)a3;
- (void)isCarPlayAllowedWithReply:(id)a3;
- (void)isEnhancedIntegrationEnabledWithCertificateSerial:(id)a3 reply:(id)a4;
- (void)isPairedWithCertificateSerial:(id)a3 reply:(id)a4;
- (void)pairingPromptFlow:(id)a3 didCancelWithRequiredStepsRemaining:(BOOL)a4;
- (void)pairingPromptFlow:(id)a3 receivedAllowWhileLockedResponse:(BOOL)a4;
- (void)pairingPromptFlow:(id)a3 receivedBluetoothConfirmationResponse:(BOOL)a4 forDeviceIdentifier:(id)a5;
- (void)pairingPromptFlow:(id)a3 receivedBluetoothContactsSyncResponse:(BOOL)a4 forDeviceIdentifier:(id)a5;
- (void)pairingPromptFlow:(id)a3 receivedConnectCarPlayFromCarKeyResponse:(BOOL)a4 vehicleName:(id)a5 turnOnWiFi:(BOOL)a6;
- (void)pairingPromptFlow:(id)a3 receivedConnectCarPlayResponse:(BOOL)a4 turnOnWiFi:(BOOL)a5;
- (void)pairingPromptFlow:(id)a3 receivedEnhancedIntegrationResponse:(BOOL)a4;
- (void)pairingPromptFlow:(id)a3 receivedUseWirelessResponse:(BOOL)a4 turnOnBluetooth:(BOOL)a5 turnOnWiFi:(BOOL)a6;
- (void)pairingPromptFlow:(id)a3 wantsToPerformPresentation:(id)a4;
- (void)postBannerToPhone:(id)a3 notificationMessage:(id)a4 reply:(id)a5;
- (void)presentHeadUnitPairingForBluetoothAddress:(id)a3 showBluetoothOnlyOption:(BOOL)a4;
- (void)removeVehicle:(id)a3 reply:(id)a4;
- (void)saveVehicle:(id)a3 reply:(id)a4;
- (void)saveWiFiCredentials:(id)a3 forAccessoryConnectionIdentifier:(unint64_t)a4 reply:(id)a5;
- (void)serviceConnector:(id)a3 completedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5;
- (void)serviceConnector:(id)a3 didConnectUnsupportedAccessoryWithBluetoothAddress:(id)a4;
- (void)serviceConnector:(id)a3 didConnectVehicle:(id)a4;
- (void)serviceConnector:(id)a3 didDisconnectVehicle:(id)a4;
- (void)serviceConnector:(id)a3 didUpdateVehicle:(id)a4;
- (void)serviceConnector:(id)a3 failedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5 error:(id)a6;
- (void)serviceConnector:(id)a3 receivedStartSessionMessage:(id)a4 fromVehicle:(id)a5;
- (void)serviceConnector:(id)a3 requestsPairingConfirmationForBluetoothLEIdentifier:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAssertionManager:(id)a3;
- (void)setBTPowerMessagingVehicle:(id)a3;
- (void)setBTPowerStoredVehicle:(id)a3;
- (void)setBluetoothManager:(id)a3;
- (void)setCachedCarPlayAllowedChangeValue:(id)a3;
- (void)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5 reply:(id)a6;
- (void)setCarPlaySimulatorActive:(BOOL)a3;
- (void)setConnectionTimeServiceAgent:(id)a3;
- (void)setCurrentBluetoothConfirmationHandler:(id)a3;
- (void)setCurrentBluetoothPairingCompletion:(id)a3;
- (void)setCurrentPromptFlowController:(id)a3;
- (void)setFeaturesAvailabilityAgent:(id)a3;
- (void)setHeadUnitPairingDelegate:(id)a3;
- (void)setLastStartSessionDeviceID:(id)a3;
- (void)setMessagingConnector:(id)a3;
- (void)setMonitoringService:(id)a3;
- (void)setOutstandingApprovalAlerts:(id)a3;
- (void)setOutstandingEnableWiFiAlerts:(id)a3;
- (void)setOutstandingEnhancedIntegrationAlerts:(id)a3;
- (void)setOutstandingPairingAlerts:(id)a3;
- (void)setPreferencesManager:(id)a3;
- (void)setServiceCountDuringAlertForBluetoothAddress:(id)a3;
- (void)setSessionRequestClient:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setSetupPromptDirector:(id)a3;
- (void)setVehicleAssetManager:(id)a3;
- (void)setVehicleStore:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)startBluetoothClassicPairingForDeviceAddress:(id)a3 deviceName:(id)a4 numericCode:(id)a5 showBluetoothOnlyOption:(BOOL)a6 reply:(id)a7;
- (void)startBluetoothLEPairingForIdentifier:(id)a3 deviceName:(id)a4 reply:(id)a5;
- (void)supportedAirPlayFeaturesForVehicleIdentifier:(id)a3 reply:(id)a4;
- (void)supportedCarPlayFeaturesForCertificateSerial:(id)a3 reply:(id)a4;
- (void)updateIncompletePairingsMatchingMessagingVehicles:(id)a3;
- (void)updateStoredVehicle:(id)a3 usingMessagingVehicle:(id)a4;
- (void)vehicleIdentifierForCertificateSerial:(id)a3 reply:(id)a4;
- (void)wantsCarPlayControlAdvertisingForUSBWithReply:(id)a3;
- (void)wantsCarPlayControlAdvertisingForWiFiUUID:(id)a3 reply:(id)a4;
@end

@implementation CRCarKitServiceAgent

- (CRCarKitServiceAgent)initWithVehicleStore:(id)a3 sessionStatus:(id)a4 bluetoothManager:(id)a5 preferences:(id)a6 connectionTimeServiceAgent:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)CRCarKitServiceAgent;
  v17 = [(CRCarKitServiceAgent *)&v39 init];
  v18 = v17;
  if (v17)
  {
    [(CRCarKitServiceAgent *)v17 setVehicleStore:v12];
    [(CRCarKitServiceAgent *)v18 setSessionStatus:v13];
    [v13 addSessionObserver:v18];
    v19 = [[CARMessagingServiceConnector alloc] initWithVehicleStore:v12];
    [(CRCarKitServiceAgent *)v18 setMessagingConnector:v19];
    [(CARMessagingServiceConnector *)v19 setDelegate:v18];
    v20 = [[CRWirelessSessionAssertionManager alloc] initWithSessionStatus:v13 connectionTimeServiceAgent:v16 messagingConnector:v19];
    [(CRWirelessSessionAssertionManager *)v20 setStoredVehicleProvider:v18];
    [(CRCarKitServiceAgent *)v18 setAssertionManager:v20];
    v21 = +[CARAnalytics sharedInstance];
    [v21 setConnectionTimeServiceAgent:v16];

    [(CRCarKitServiceAgent *)v18 setBluetoothManager:v14];
    v22 = [(CRCarKitServiceAgent *)v18 bluetoothManager];
    [v22 addObserver:v18];

    v23 = [(CRCarKitServiceAgent *)v18 bluetoothManager];
    [v23 setPairingDelegate:v18];

    id v24 = objc_alloc_init((Class)CARSessionRequestClient);
    [(CRCarKitServiceAgent *)v18 setSessionRequestClient:v24];

    [(CRCarKitServiceAgent *)v18 setPreferencesManager:v15];
    v25 = [(CRCarKitServiceAgent *)v18 preferencesManager];
    [v25 setPreferencesDelegate:v18];

    v26 = [[CRFeaturesAvailabilityAgent alloc] initWithPreferencesManager:v15 vehicleStore:v12];
    [(CRCarKitServiceAgent *)v18 setFeaturesAvailabilityAgent:v26];

    v27 = objc_alloc_init(CRWiFiCarManager);
    [(CRCarKitServiceAgent *)v18 setWifiManager:v27];

    v28 = +[NSMutableArray array];
    [(CRCarKitServiceAgent *)v18 setOutstandingApprovalAlerts:v28];

    v29 = +[NSMutableArray array];
    [(CRCarKitServiceAgent *)v18 setOutstandingPairingAlerts:v29];

    v30 = +[NSMutableArray array];
    [(CRCarKitServiceAgent *)v18 setOutstandingEnableWiFiAlerts:v30];

    v31 = +[NSMutableArray array];
    [(CRCarKitServiceAgent *)v18 setOutstandingEnhancedIntegrationAlerts:v31];

    id v32 = objc_alloc_init((Class)NSMutableDictionary);
    [(CRCarKitServiceAgent *)v18 setServiceCountDuringAlertForBluetoothAddress:v32];

    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v18 selector:"handleVehicleStoreAvailabiltyDidChange:" name:CRVehicleStoreAvailabilityDidChangeNotification object:0];

    v34 = [(CRCarKitServiceAgent *)v18 vehicleStore];
    id v35 = [v34 allStoredVehicles];

    v36 = [[CRLoggingChannelManager alloc] initWithSessionStatus:v13];
    loggingChannelManager = v18->_loggingChannelManager;
    v18->_loggingChannelManager = v36;

    objc_storeStrong((id *)&v18->_connectionTimeServiceAgent, a7);
  }

  return v18;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRCarKitServiceAgent;
  [(CRCarKitServiceAgent *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.carkit"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRCarKitService];
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    [v8 setClasses:v10 forSelector:"fetchAllVehiclesWithReply:" argumentIndex:0 ofReply:1];

    v11 = +[NSSet setWithObject:objc_opt_class()];
    [v8 setClasses:v11 forSelector:"handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:" argumentIndex:0 ofReply:0];

    id v12 = +[NSSet setWithObject:objc_opt_class()];
    [v8 setClasses:v12 forSelector:"handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:" argumentIndex:1 ofReply:0];

    uint64_t v13 = objc_opt_class();
    id v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
    [v8 setClasses:v14 forSelector:"handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:" argumentIndex:2 ofReply:0];

    id v15 = +[NSSet setWithObject:objc_opt_class()];
    [v8 setClasses:v15 forSelector:"handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:" argumentIndex:3 ofReply:0];

    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
    [v8 setClasses:v17 forSelector:"fetchInstrumentClusterURLsWithReply:" argumentIndex:0 ofReply:1];

    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    [v8 setClasses:v20 forSelector:"fetchScaledDisplaysWithReply:reply:" argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    v21 = CarGeneralLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v5 serviceName];
      v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 processIdentifier]);
      *(_DWORD *)buf = 138412802;
      id v26 = v5;
      __int16 v27 = 2112;
      v28 = v22;
      __int16 v29 = 2112;
      v30 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Receiving CarKit service connection %@ to service %@ from %@", buf, 0x20u);
    }
    [v5 resume];
  }
  else
  {
    v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000718B8(v5, v8);
    }
  }

  return v7;
}

- (void)saveVehicle:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v9 processIdentifier];
    LOWORD(v15) = 2113;
    *(void *)((char *)&v15 + 2) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "saveVehicle from process %i, vehicle: %{private}@", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&long long v15 = buf;
  *((void *)&v15 + 1) = 0x3032000000;
  uint64_t v16 = sub_100020C28;
  v17 = sub_100020C38;
  id v18 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020C40;
  block[3] = &unk_1000BDB20;
  uint64_t v13 = buf;
  block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  (*((void (**)(id, void, void))v7 + 2))(v7, *(void *)(v15 + 40), 0);

  _Block_object_dispose(buf, 8);
}

- (void)removeVehicle:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v9 processIdentifier];
    LOWORD(v15) = 2113;
    *(void *)((char *)&v15 + 2) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "removeVehicle from process %i, vehicle: %{private}@", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&long long v15 = buf;
  *((void *)&v15 + 1) = 0x2020000000;
  char v16 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020E58;
  block[3] = &unk_1000BDB20;
  uint64_t v13 = buf;
  block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  (*((void (**)(id, void, void))v7 + 2))(v7, *(unsigned __int8 *)(v15 + 24), 0);

  _Block_object_dispose(buf, 8);
}

- (void)fetchAllVehiclesWithReply:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_100020C28;
  char v16 = sub_100020C38;
  id v17 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100020C28;
  id v10 = sub_100020C38;
  id v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020FFC;
  block[3] = &unk_1000BDB48;
  block[4] = self;
  void block[5] = &v6;
  block[6] = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v4[2](v4, v13[5], v7[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

- (void)hasVehiclesWithReply:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100021120;
  v5[3] = &unk_1000BDB70;
  id v6 = a3;
  id v4 = v6;
  [(CRCarKitServiceAgent *)self fetchAllVehiclesWithReply:v5];
}

- (void)handleDidConnectBluetoothAddress:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t, uint64_t))a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100020C28;
  v25 = sub_100020C38;
  id v26 = 0;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100020C28;
  uint64_t v19 = sub_100020C38;
  id v20 = 0;
  uint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "attempting fast-reconnection with %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021400;
  block[3] = &unk_1000BDB98;
  block[4] = self;
  uint64_t v12 = &v15;
  id v9 = v6;
  id v11 = v9;
  uint64_t v13 = &v21;
  uint64_t v14 = &v27;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v7[2](v7, *((unsigned __int8 *)v28 + 24), v22[5], v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

- (void)handleDidDisconnectBluetoothAddress:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000218D4;
  block[3] = &unk_1000BDBC0;
  block[4] = self;
  id v8 = v6;
  id v10 = v8;
  id v11 = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  (*((void (**)(id, void, void))v7 + 2))(v7, *((unsigned __int8 *)v13 + 24), 0);

  _Block_object_dispose(&v12, 8);
}

- (void)isBluetoothInCarWithReply:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t, uint64_t))a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = sub_100020C28;
  char v16 = sub_100020C38;
  id v17 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100020C28;
  id v10 = sub_100020C38;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100021B18;
  v5[3] = &unk_1000BDBE8;
  void v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v18;
  v5[7] = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  v4[2](v4, *((unsigned __int8 *)v19 + 24), v13[5], v7[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

- (void)handleBluetoothClassicPairingCompletedForDeviceAddress:(id)a3 name:(id)a4 preApproved:(BOOL)a5 reply:(id)a6
{
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_100020C28;
  v20[4] = sub_100020C38;
  id v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021DA0;
  v13[3] = &unk_1000BDC10;
  id v14 = a3;
  id v15 = a4;
  id v17 = a6;
  uint64_t v18 = v20;
  char v16 = self;
  BOOL v19 = a5;
  id v10 = v17;
  id v11 = v15;
  id v12 = v14;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v13);

  _Block_object_dispose(v20, 8);
}

- (void)startBluetoothLEPairingForIdentifier:(id)a3 deviceName:(id)a4 reply:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000220A0;
  v11[3] = &unk_1000BDC60;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)startBluetoothClassicPairingForDeviceAddress:(id)a3 deviceName:(id)a4 numericCode:(id)a5 showBluetoothOnlyOption:(BOOL)a6 reply:(id)a7
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022548;
  block[3] = &unk_1000BDC88;
  BOOL v18 = a6;
  id v14 = a3;
  id v15 = self;
  id v16 = a5;
  id v17 = a7;
  id v10 = v16;
  id v11 = v17;
  id v12 = v14;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleCarPlayConnectionRequestForConnectionID:(unsigned int)a3 startSessionProperties:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100022A40;
  v11[3] = &unk_1000BDD00;
  id v13 = self;
  id v14 = a5;
  id v12 = v8;
  unsigned int v15 = a3;
  id v9 = v14;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)postBannerToPhone:(id)a3 notificationMessage:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CARDNDManager sharedManager];
  id v11 = [v10 alertManager];

  [v11 postBannerWithTitle:v9 message:v8 destinations:3];
  v7[2](v7);
}

- (void)wantsCarPlayControlAdvertisingForUSBWithReply:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100020C28;
  id v10 = sub_100020C38;
  id v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023838;
  block[3] = &unk_1000BDB48;
  void block[4] = self;
  void block[5] = &v6;
  block[6] = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v4[2](v4, *((unsigned __int8 *)v13 + 24), v7[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

- (void)wantsCarPlayControlAdvertisingForWiFiUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100020C28;
  BOOL v18 = sub_100020C38;
  id v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023B48;
  v9[3] = &unk_1000BDD28;
  id v8 = v6;
  id v10 = v8;
  id v11 = self;
  uint64_t v12 = &v14;
  id v13 = &v20;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v21 + 24), v15[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)saveWiFiCredentials:(id)a3 forAccessoryConnectionIdentifier:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, BOOL, void))a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100020C28;
  uint64_t v27 = sub_100020C38;
  id v28 = 0;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100020C28;
  id v21 = sub_100020C38;
  id v22 = 0;
  id v10 = CarGeneralLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received WiFi credentials for connectionID %lu", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024054;
  block[3] = &unk_1000BDD78;
  void block[4] = self;
  id v11 = v8;
  id v13 = v11;
  uint64_t v14 = &v23;
  char v15 = &v17;
  unint64_t v16 = a4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v9[2](v9, v24[5] != 0, v18[5]);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

- (void)allowsConnectionsForWiFiUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = sub_100020C28;
  uint64_t v17 = sub_100020C38;
  id v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000242D4;
  v9[3] = &unk_1000BDDA0;
  void v9[4] = self;
  id v11 = &v13;
  uint64_t v12 = &v19;
  id v8 = v6;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v20 + 24), v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)allowsConnectionsForCertificateSerial:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = sub_100020C28;
  uint64_t v17 = sub_100020C38;
  id v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000245FC;
  v9[3] = &unk_1000BDDA0;
  void v9[4] = self;
  id v11 = &v13;
  uint64_t v12 = &v19;
  id v8 = v6;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v20 + 24), v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)isPairedWithCertificateSerial:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = sub_100020C28;
  uint64_t v17 = sub_100020C38;
  id v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024918;
  v9[3] = &unk_1000BD708;
  void v9[4] = self;
  id v11 = &v13;
  id v8 = v6;
  id v10 = v8;
  uint64_t v12 = &v19;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v20 + 24), v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)isEnhancedIntegrationEnabledWithCertificateSerial:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = sub_100020C28;
  uint64_t v17 = sub_100020C38;
  id v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024C20;
  v9[3] = &unk_1000BD708;
  void v9[4] = self;
  id v11 = &v13;
  id v8 = v6;
  id v10 = v8;
  uint64_t v12 = &v19;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, v20[3], v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)handleCarPlayRestrictionChangedWithReply:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024E48;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  v3 = (void (**)(void))a3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v3[2](v3);
}

- (void)isCarPlayAllowedWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(CRCarKitServiceAgent *)self preferencesManager];
  (*((void (**)(id, id, void))a3 + 2))(v5, [v6 isCarPlayAllowed], 0);
}

- (void)deviceSupportedCarPlayFeaturesWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025004;
  v7[3] = &unk_1000BD768;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100071B64();
  }

  id v6 = +[NSNumber numberWithUnsignedInteger:v9[3]];
  v4[2](v4, v6, 0);

  _Block_object_dispose(&v8, 8);
}

- (void)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_1000251D0;
  unint64_t v16 = &unk_1000BDDC8;
  uint64_t v19 = &v21;
  unint64_t v20 = a3;
  uint64_t v17 = self;
  id v10 = v8;
  id v18 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &v13);
  uint64_t v11 = CarGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100071BD0();
  }

  uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v22 + 24), v13, v14, v15, v16, v17);
  v9[2](v9, v12, 0);

  _Block_object_dispose(&v21, 8);
}

- (void)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002538C;
  block[3] = &unk_1000BDDF0;
  unint64_t v16 = &v19;
  unint64_t v17 = a3;
  void block[4] = self;
  BOOL v18 = a4;
  id v12 = v10;
  id v15 = v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v13 = CarGeneralLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100071C64();
  }

  (*((void (**)(id, void, void))v11 + 2))(v11, *((unsigned __int8 *)v20 + 24), 0);
  _Block_object_dispose(&v19, 8);
}

- (void)supportedCarPlayFeaturesForCertificateSerial:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000255B4;
  block[3] = &unk_1000BDB20;
  uint64_t v14 = &v15;
  void block[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  id v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v16[3];
    *(_DWORD *)buf = 134349056;
    uint64_t v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: %{public}lu", buf, 0xCu);
  }

  id v11 = +[NSNumber numberWithUnsignedInteger:v16[3]];
  v7[2](v7, v11, 0);

  _Block_object_dispose(&v15, 8);
}

- (void)supportedAirPlayFeaturesForVehicleIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100020C28;
  uint64_t v18 = sub_100020C38;
  id v19 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000257E4;
  block[3] = &unk_1000BDB20;
  id v13 = &v14;
  void block[4] = self;
  id v8 = v6;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  id v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v15[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "supportedAirPlayFeatures: %{public}@", buf, 0xCu);
  }

  v7[2](v7, v15[5], 0);
  _Block_object_dispose(&v14, 8);
}

- (void)handleCarPlayDiagnosticsWithDeviceScreenshotURL:(id)a3 carScreenshotURL:(id)a4 attachmentURLs:(id)a5 activeBundleIdentifier:(id)a6 reply:(id)a7
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100025A40;
  v16[3] = &unk_1000BDE18;
  v16[4] = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v11 = v21;
  id v12 = v20;
  id v13 = v19;
  id v14 = v18;
  id v15 = v17;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v16);
}

- (void)fetchInstrumentClusterURLsWithReply:(id)a3
{
  id v4 = a3;
  id v5 = +[NSError errorWithDomain:@"com.apple.carkit" code:5 userInfo:0];
  (*((void (**)(id, void *, id))a3 + 2))(v4, &__NSArray0__struct, v5);
}

- (id)accessoryRadarDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  id v5 = [v3 manufacturer];
  id v6 = [v3 modelNumber];
  id v7 = [v3 firmwareRevision];
  id v8 = [v3 hardwareRevision];
  id v9 = [v3 serialNumber];
  uint64_t v10 = [v3 ppid];

  id v11 = +[NSString stringWithFormat:@"Accessory Name: %@\nManufacturer: %@\nModel Number: %@\nFirmware Revision: %@\nHardware Revision: %@\nSerial Number: %@\nPPID: %@\n", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (void)fetchScaledDisplaysWithReply:(id)a3 reply:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000261FC;
  v6[3] = &unk_1000BDE40;
  id v7 = a4;
  id v5 = v7;
  +[CRScreenScaleHeuristics scaledDisplays:a3 reply:v6];
}

- (void)serviceConnector:(id)a3 requestsPairingConfirmationForBluetoothLEIdentifier:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026328;
  block[3] = &unk_1000BDE90;
  void block[4] = self;
  id v19 = v11;
  id v21 = v12;
  id v22 = a7;
  id v20 = v13;
  id v14 = v12;
  id v15 = v13;
  id v16 = v22;
  id v17 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)serviceConnector:(id)a3 failedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5 error:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000266F8;
  v11[3] = &unk_1000BDEB8;
  void v11[4] = self;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)serviceConnector:(id)a3 completedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026874;
  v7[3] = &unk_1000BD3A8;
  id v8 = a4;
  id v9 = self;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)serviceConnector:(id)a3 didConnectVehicle:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002696C;
  v5[3] = &unk_1000BD3A8;
  void v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)serviceConnector:(id)a3 didUpdateVehicle:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026C30;
  v5[3] = &unk_1000BD3A8;
  void v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)serviceConnector:(id)a3 receivedStartSessionMessage:(id)a4 fromVehicle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CarPlay connection request startSessionMessage: %@", buf, 0xCu);
  }

  if (v7)
  {
    id v23 = 0;
    unsigned int v10 = [(CRCarKitServiceAgent *)self _isRestricted:&v23];
    id v11 = v23;
    if (v10)
    {
      id v12 = CarGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100071A5C();
      }
    }
    else
    {
      id v13 = +[NSMutableDictionary dictionary];
      id v14 = [v7 SSID];
      [v13 setObject:v14 forKey:@"SSID_STR"];

      id v15 = [v7 passphrase];
      [v13 setObject:v15 forKey:@"password"];

      id v16 = [v7 channel];
      [v13 setObject:v16 forKey:@"CHANNEL"];

      id v17 = [v7 securityType];
      [v13 setObject:v17 forKey:@"securityType"];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100026FA0;
      v18[3] = &unk_1000BDF70;
      id v19 = v8;
      id v20 = self;
      id v21 = v13;
      id v22 = v7;
      id v12 = v13;
      [(CRCarKitServiceAgent *)self _findWirelessPairedVehicleForMessagingVehicle:v19 result:v18];
    }
  }
  else
  {
    id v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100071EAC();
    }
  }
}

- (void)serviceConnector:(id)a3 didDisconnectVehicle:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000274F8;
  v5[3] = &unk_1000BD3A8;
  void v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)serviceConnector:(id)a3 didConnectUnsupportedAccessoryWithBluetoothAddress:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = CarPairingLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 141558275;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connected an iAP accessory that doesn't support CarPlay: %{private, mask.hash}@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [(CRCarKitServiceAgent *)self currentPromptFlowController];

  if (v7)
  {
    id v8 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
    [v8 handleUnsupportedMessagingConnectionForDeviceIdentifier:v5];
  }
}

- (void)handleCarPlayAllowedDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000276F0;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleCarPlayAllowedDidChange
{
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CarPlay restriction changed", buf, 2u);
  }

  id v4 = [(CRCarKitServiceAgent *)self preferencesManager];
  id v5 = [v4 isCarPlayAllowed];

  id v6 = [(CRCarKitServiceAgent *)self cachedCarPlayAllowedChangeValue];
  id v7 = v6;
  if (!v6 || v5 != [v6 BOOLValue])
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"disabled";
      if (v5) {
        CFStringRef v9 = @"enabled";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CarPlay is now %@", buf, 0xCu);
    }

    uint64_t v10 = +[NSNumber numberWithBool:v5];
    [(CRCarKitServiceAgent *)self setCachedCarPlayAllowedChangeValue:v10];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carplay.allowed-changed", 0, 0, 1u);
    +[CRVehicleStore postPairingsDidChangeNotification];
    if (v5)
    {
      [(CRCarKitServiceAgent *)self handleAnyMessagingConnectionsToVehicles];
    }
    else
    {
      [(CRCarKitServiceAgent *)self _dismissApprovalAlerts];
      [(CRCarKitServiceAgent *)self _dismissPairingAlerts];
      [(CRCarKitServiceAgent *)self _dismissEnhancedIntegrationAlerts];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = [(CRCarKitServiceAgent *)self vehicleStore];
      id v13 = [v12 allStoredVehicles];

      id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v17);
            id v19 = [(CRCarKitServiceAgent *)self monitoringService];
            [v19 handleUpdatedVehicle:v18 enabled:0 completion:0];

            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v15);
      }

      id v20 = [(CRCarKitServiceAgent *)self sessionRequestClient];
      [v20 cancelRequests];
    }
  }
}

- (void)handleVehicleStoreAvailabiltyDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027A24;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)postInCarNotificationForVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 carplayWiFiUUID];
  id v6 = (void *)v5;
  if (v5)
  {
    CFStringRef v16 = @"CARPLAY_UUID";
    uint64_t v17 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending iAP in-car wifi notification %@", (uint8_t *)&v14, 0xCu);
    }

    kdebug_trace();
    CFStringRef v9 = [(CRCarKitServiceAgent *)self wifiManager];
    [v9 setInCar:1 carPlayUUID:v6];

    if ([v4 requiresBonjour])
    {
      uint64_t v10 = [(CRCarKitServiceAgent *)self sessionRequestClient];
      [v10 startAdvertisingCarPlayControlForWiFiUUID:v6];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carplay.in-car", 0, 0, 1u);
    id v12 = +[CARAnalytics sharedInstance];
    [v12 wirelessReconnectStarted];
  }
  return v6 != 0;
}

- (BOOL)postOutOfCarNotificationForVehicle:(id)a3
{
  uint64_t v3 = [a3 carplayWiFiUUID];
  id v4 = (void *)v3;
  if (v3)
  {
    CFStringRef v11 = @"CARPLAY_UUID";
    uint64_t v12 = v3;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending iAP out-of-car wifi notification %@", (uint8_t *)&v9, 0xCu);
    }

    kdebug_trace();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carplay.out-of-car", 0, 0, 1u);
  }
  return v4 != 0;
}

- (BOOL)_isRestricted:(id *)a3
{
  id v4 = [(CRCarKitServiceAgent *)self preferencesManager];
  unsigned __int8 v5 = [v4 isCarPlayAllowed];

  if (a3 && (v5 & 1) == 0)
  {
    *a3 = +[NSError errorWithDomain:@"com.apple.carkit" code:1 userInfo:0];
  }
  return v5 ^ 1;
}

- (BOOL)_isVehicleActionable:(id)a3
{
  return [a3 pairingStatus] != (id)1;
}

- (void)_findWirelessPairedVehicleForAccessoryConnectionIdentifier:(unint64_t)a3 result:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(CRCarKitServiceAgent *)self messagingConnector];
    id v8 = [v7 vehicleAccessoryForiAPConnectionIdentifier:a3];

    if (!v8)
    {
      int v9 = CarGeneralLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100071F5C();
      }

      uint64_t v10 = +[NSError errorWithDomain:@"com.apple.carkit" code:3 userInfo:0];
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v10);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100027F5C;
    v12[3] = &unk_1000BDF98;
    id v13 = v8;
    id v14 = v6;
    id v11 = v8;
    [(CRCarKitServiceAgent *)self _findWirelessPairedVehicleForMessagingVehicle:v11 result:v12];
  }
}

- (void)_findWirelessPairedVehicleForMessagingVehicle:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (v7)
  {
    id v26 = 0;
    unsigned int v8 = [(CRCarKitServiceAgent *)self _isRestricted:&v26];
    id v9 = v26;
    if (v8)
    {
      v7[2](v7, 0, v9);
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v10 = [(CRCarKitServiceAgent *)self vehicleStore];
    id v11 = [v10 allStoredVehicles];
    long long v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    long long v23 = sub_100028214;
    long long v24 = &unk_1000BDFC0;
    id v12 = v6;
    id v25 = v12;
    id v13 = [v11 objectsPassingTest:&v21];

    id v14 = [v13 anyObject:v21, v22, v23, v24];
    id v15 = v14;
    if (v14 && ([v14 isPaired] & 1) != 0)
    {
      CFStringRef v16 = [v15 bluetoothAddress];
      if (v16)
      {

LABEL_13:
        ((void (**)(id, void *, id))v7)[2](v7, v15, 0);
        goto LABEL_14;
      }
      id v20 = [v12 bluetoothAddress];

      if (v20) {
        goto LABEL_13;
      }
      uint64_t v17 = CarGeneralLogging();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v15;
        uint64_t v18 = "Vehicle %@ is not paired for wireless";
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v17 = CarGeneralLogging();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v15;
        uint64_t v18 = "Vehicle %@ is not paired";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
    }

    id v19 = +[NSError errorWithDomain:@"com.apple.carkit" code:1 userInfo:0];
    v7[2](v7, 0, v19);

LABEL_14:
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_saveWiFiCredentials:(id)a3 forAccessoryConnectionIdentifier:(unint64_t)a4 result:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100028350;
  v10[3] = &unk_1000BDFE8;
  id v11 = a3;
  id v12 = a5;
  v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  [(CRCarKitServiceAgent *)self _findWirelessPairedVehicleForAccessoryConnectionIdentifier:a4 result:v10];
}

- (void)_saveWiFiCredentials:(id)a3 fromMessagingVehicle:(id)a4 forWirelessPairedVehicle:(id)a5 result:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = [v11 bluetoothAddress];
  id v15 = [v12 bluetoothAddress];
  CFStringRef v16 = v15;
  if (v14 && v15)
  {
    unsigned __int8 v17 = [v15 isEqual:v14];

    if (v17)
    {
LABEL_4:
      int v18 = 0;
      goto LABEL_7;
    }
  }
  else
  {

    if (!v14) {
      goto LABEL_4;
    }
  }
  [v12 setBluetoothAddress:v14];
  int v18 = 1;
LABEL_7:
  uint64_t v19 = [v12 carplayWiFiUUID];
  if (v19)
  {
    id v20 = (void *)v19;
    if (!v18) {
      goto LABEL_15;
    }
  }
  else
  {
    long long v21 = +[NSUUID UUID];
    id v20 = [v21 UUIDString];

    [v12 setCarplayWiFiUUID:v20];
  }
  uint64_t v22 = CarGeneralLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412290;
    id v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Saving vehicle %@ for Bluetooth address or Wi-Fi UUID update", (uint8_t *)&v34, 0xCu);
  }

  long long v23 = [(CRCarKitServiceAgent *)self vehicleStore];
  uint64_t v24 = [v23 saveVehicle:v12];

  if (!v24)
  {
    v31 = CarGeneralLogging();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100071FC4();
    }

    if (!v13) {
      goto LABEL_35;
    }
LABEL_30:
    id v32 = +[NSError errorWithDomain:@"com.apple.carkit" code:2 userInfo:0];
    v13[2](v13, 0, v32);

    goto LABEL_35;
  }

  id v12 = (id)v24;
LABEL_15:
  id v25 = [(CRCarKitServiceAgent *)self wifiManager];
  unsigned __int8 v26 = [v25 saveNetworkCredentials:v10 forCarPlayUUID:v20];

  CFStringRef v27 = CarGeneralLogging();
  id v28 = v27;
  if ((v26 & 1) == 0)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100072060(v12, v28);
    }

    if (!v13) {
      goto LABEL_35;
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412290;
    id v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "saved WiFi credentials for %@", (uint8_t *)&v34, 0xCu);
  }

  if ([v11 transportType] == (id)2 || objc_msgSend(v11, "transportType") == (id)4)
  {
    uint64_t v29 = [(CRCarKitServiceAgent *)self pairedVehiclesConnectedOnBluetooth];
    unsigned int v30 = [v29 containsObject:v12];

    if (v30)
    {
      kdebug_trace();
      [(CRCarKitServiceAgent *)self postInCarNotificationForVehicle:v12];
      if (!v13) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  v33 = CarGeneralLogging();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_10007202C();
  }

  if (v13) {
LABEL_34:
  }
    ((void (**)(id, void *, void *))v13)[2](v13, v20, 0);
LABEL_35:
}

- (void)_mainQueue_startSessionForHost:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v8 = CRLocalizedStringForKey();
  [v7 setDisplayName:v8];

  id v9 = [v7 deviceIdentifier];
  [(CRCarKitServiceAgent *)self setLastStartSessionDeviceID:v9];

  id v10 = +[NSUUID UUID];
  id v11 = [(CRCarKitServiceAgent *)self sessionRequestClient];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028954;
  v13[3] = &unk_1000BD530;
  id v14 = v6;
  id v12 = v6;
  [v11 startSessionWithHost:v7 requestIdentifier:v10 completion:v13];
}

- (void)_mainQueue_updateClusterAssetIdentifier:(id)a3 assetVersion:(id)a4 sdkVersion:(id)a5 forVehicle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CRCarKitServiceAgent *)self vehicleAssetManager];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v14 receivedClusterAssetIdentifier:v10 assetVersion:v11 sdkVersion:v12 forVehicle:v13];
  }
  else
  {
    id v15 = CarGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10007216C();
    }
  }
}

- (BOOL)_shouldPromptEnhancedIntegrationForStoredVehicle:(id)a3 messagingVehicle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 enhancedIntegrationStatus])
  {
LABEL_2:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if (([v5 supportsEnhancedIntegration] & 1) == 0
    && ![v6 supportsEnhancedIntegration])
  {
    CFTypeRef cf = 0;
    FigEndpointCopyActiveCarPlayEndpoint();
    id v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000721A0();
    }

    goto LABEL_2;
  }
  id v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int buf = 138412290;
    *(void *)buf_4 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "vehicle %@ declares enhanced integration support", (uint8_t *)&buf, 0xCu);
  }

  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (void)handleAnyMessagingConnectionsToVehicles
{
  uint64_t v3 = [(CRCarKitServiceAgent *)self messagingConnector];
  id v4 = [v3 connectedVehicles];

  [(CRCarKitServiceAgent *)self handleDidConnectMessagingToVehicles:v4];
}

- (void)handleDidConnectMessagingToVehicles:(id)a3
{
  id v4 = a3;
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handling CarPlay attach", buf, 2u);
  }

  id v6 = [(CRCarKitServiceAgent *)self preferencesManager];
  unsigned __int8 v7 = [v6 isCarPlayAllowed];

  if (v7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v13 transportType] == (id)1
            && [v13 supportsUSBCarPlay]
            && ([v13 supportsCarPlayConnectionRequest] & 1) == 0)
          {
            id v14 = [(CRCarKitServiceAgent *)self sessionRequestClient];
            [v14 startAdvertisingCarPlayControlForUSB];

            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carplay.starting-wired-connection", 0, 0, 1u);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v10);
    }

    [(CRCarKitServiceAgent *)self updateIncompletePairingsMatchingMessagingVehicles:v8];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002921C;
    v22[3] = &unk_1000BDF20;
    v22[4] = self;
    [(CRCarKitServiceAgent *)self enumerateStoredVehiclesForMessagingVehicles:v8 usingBlock:v22];
  }
  else
  {
    CFStringRef v16 = CarGeneralLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CarPlay is not available", buf, 2u);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v4;
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          [(CRCarKitServiceAgent *)self _sendCarPlayAvailabilityForMessagingVehicle:*(void *)(*((void *)&v27 + 1) + 8 * (void)j) storedVehicle:0];
        }
        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v19);
    }
  }
}

- (id)_wirelessPairingAnalyticsDescriptionForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 analyticsDescription];
  id v9 = [v8 mutableCopy];

  id v10 = [(CRCarKitServiceAgent *)self sessionStatus];
  uint64_t v11 = [v10 currentSession];

  uint64_t v12 = [v7 PPID];
  id v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = @"Unknown";
  }
  [v9 setObject:v14 forKeyedSubscript:@"ppid"];

  id v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supportsWiredBluetoothPairing]);
  [v9 setObject:v15 forKeyedSubscript:@"supportsOOBPairing"];

  uint64_t v16 = [v11 sourceVersion];
  id v17 = (void *)v16;
  if (v16) {
    CFStringRef v18 = (const __CFString *)v16;
  }
  else {
    CFStringRef v18 = @"Unknown";
  }
  [v9 setObject:v18 forKeyedSubscript:@"SourceVersion"];

  uint64_t v19 = [v6 vehicleName];
  uint64_t v20 = (void *)v19;
  if (v19) {
    CFStringRef v21 = (const __CFString *)v19;
  }
  else {
    CFStringRef v21 = @"Unknown";
  }
  [v9 setObject:v21 forKeyedSubscript:@"vehicleName"];

  uint64_t v22 = [v6 vehicleModelName];
  long long v23 = (void *)v22;
  if (v22) {
    CFStringRef v24 = (const __CFString *)v22;
  }
  else {
    CFStringRef v24 = @"Unknown";
  }
  [v9 setObject:v24 forKeyedSubscript:@"vehicleModel"];

  long long v25 = (char *)[v7 transportType];
  if ((unint64_t)(v25 - 1) > 3) {
    CFStringRef v26 = @"unknown";
  }
  else {
    CFStringRef v26 = *(&off_1000BE210 + (void)(v25 - 1));
  }
  [v9 setObject:v26 forKeyedSubscript:@"transportType"];
  long long v27 = [v6 supportsStartSessionRequest];
  if ([v27 BOOLValue]) {
    CFStringRef v28 = @"StartSession";
  }
  else {
    CFStringRef v28 = @"Bonjour";
  }
  [v9 setObject:v28 forKeyedSubscript:@"sessionType"];

  if ([v6 supportsBluetoothLE]) {
    CFStringRef v29 = @"BLE";
  }
  else {
    CFStringRef v29 = @"BT Classic";
  }
  [v9 setObject:v29 forKeyedSubscript:@"bluetoothType"];
  long long v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 supportsUSBCarPlay]);
  [v9 setObject:v30 forKeyedSubscript:@"supportsUSBCarPlay"];

  v31 = [v11 configuration];
  id v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v31 supportsVehicleData]);
  [v9 setObject:v32 forKeyedSubscript:@"nextGenCarPlaySession"];

  v33 = +[NSDictionary dictionaryWithDictionary:v9];

  return v33;
}

- (void)updateIncompletePairingsMatchingMessagingVehicles:(id)a3
{
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v36;
    long long v30 = v34;
    *(void *)&long long v6 = 138412290;
    long long v29 = v6;
    uint64_t v31 = *(void *)v36;
    id v32 = v4;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v11 = [v10 bluetoothAddress:v29, v30];
        uint64_t v12 = [(CRCarKitServiceAgent *)self vehicleStore];
        id v13 = [v12 vehicleForBluetoothAddress:v11];

        if (v13)
        {
          CFStringRef v14 = [v13 certificateSerialNumber];

          if (!v14)
          {
            id v15 = [(CRCarKitServiceAgent *)self preferencesManager];
            uint64_t v16 = [v15 isCarPlaySetupEnabled];

            if (!v16)
            {
              id v17 = [(CRCarKitServiceAgent *)self _wirelessPairingAnalyticsDescriptionForMessagingVehicle:v10 storedVehicle:v13];
              CFStringRef v18 = +[CARAnalytics sharedInstance];
              [v18 userCreatedWirelessPairingWithSource:@"Settings" payload:v17];
            }
            uint64_t v19 = [v10 certificateSerialNumber];
            if (v19)
            {
              uint64_t v20 = CarGeneralLogging();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)int buf = v29;
                v40 = v11;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "First accessory attach for %@, adding certificateSerial", buf, 0xCu);
              }

              [v13 setCertificateSerialNumber:v19];
              CFStringRef v21 = [(CRCarKitServiceAgent *)self vehicleStore];
              v33[0] = _NSConcreteStackBlock;
              v33[1] = 3221225472;
              v34[0] = sub_100029998;
              v34[1] = &unk_1000BE010;
              v34[2] = self;
              id v22 = [v21 saveVehicle:v13 withMergePolicy:v33];
            }
            long long v23 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
            CFStringRef v24 = v23;
            if (v23)
            {
              long long v25 = [v23 bluetoothDeviceIdentifier];
              unsigned int v26 = [v11 isEqual:v25];

              if (v26)
              {
                long long v27 = CarPairingLogging();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)int buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "adding connected accessory to prompt flow", buf, 2u);
                }

                [v24 setUserInfo:v13];
                if ([v13 pairingStatus])
                {
                  CFStringRef v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 pairingStatus] == (id)2);
                }
                else
                {
                  CFStringRef v28 = 0;
                }
                [v24 handleConnectedMessagingVehicle:v10 pairingAccepted:v28];
              }
            }

            uint64_t v8 = v31;
            id v4 = v32;
          }
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }
}

- (id)vehicleMatchingMessagingVehicle:(id)a3 inVehicles:(id)a4
{
  id v5 = a4;
  long long v6 = [a3 certificateSerialNumber];
  if (v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [v11 certificateSerialNumber:v17];
          if (v12)
          {
            id v13 = (void *)v12;
            CFStringRef v14 = [v11 certificateSerialNumber];
            unsigned int v15 = [v6 isEqualToData:v14];

            if (v15)
            {
              id v8 = v11;
              goto LABEL_14;
            }
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)enumerateStoredVehiclesForMessagingVehicles:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    id v8 = [(CRCarKitServiceAgent *)self vehicleStore];
    uint64_t v9 = [v8 allStoredVehicles];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v16 = [(CRCarKitServiceAgent *)self vehicleMatchingMessagingVehicle:v15 inVehicles:v9];
          v7[2](v7, v15, v16);
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    id v6 = v17;
  }
}

- (void)updateStoredVehicle:(id)a3 usingMessagingVehicle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 vehicleName];
  uint64_t v9 = [v7 accessoryProtocols];
  id v10 = +[NSSet setWithArray:v9];

  if (v8
    && ([v6 vehicleName],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v8 isEqualToString:v11],
        v11,
        (v12 & 1) == 0))
  {
    [v6 setVehicleName:v8];
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  CFStringRef v14 = [v6 accessoryProtocols];
  unsigned __int8 v15 = [v10 isEqualToSet:v14];

  if ((v15 & 1) == 0)
  {
    [v6 setAccessoryProtocols:v10];
    int v13 = 1;
  }
  if ([v7 transportType] != (id)3)
  {
    uint64_t v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supportsCarPlayConnectionRequest]);
    id v17 = [v6 supportsStartSessionRequest];
    unsigned __int8 v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      long long v19 = CarGeneralLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        if (v16)
        {
          unsigned int v20 = [v16 BOOLValue];
          CFStringRef v21 = @"NO";
          if (v20) {
            CFStringRef v21 = @"YES";
          }
        }
        else
        {
          CFStringRef v21 = @"unset";
        }
        *(_DWORD *)int buf = 138543618;
        CFStringRef v48 = v21;
        __int16 v49 = 2112;
        id v50 = v6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating supportsStartSessionRequest to %{public}@ for %@", buf, 0x16u);
      }

      [v6 setSupportsStartSessionRequest:v16];
      int v13 = 1;
    }
    unsigned int v22 = [v6 supportsBluetoothLE];
    if (v22 != [v7 supportsBluetoothLE])
    {
      long long v23 = CarGeneralLogging();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = [v7 supportsBluetoothLE];
        CFStringRef v25 = @"NO";
        if (v24) {
          CFStringRef v25 = @"YES";
        }
        *(_DWORD *)int buf = 138543618;
        CFStringRef v48 = v25;
        __int16 v49 = 2112;
        id v50 = v6;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updating supportsBluetoothLE to %{public}@ for %@", buf, 0x16u);
      }

      [v6 setSupportsBluetoothLE:[v7 supportsBluetoothLE]];
      int v13 = 1;
    }
    uint64_t v26 = [v6 supportsThemeAssets];
    if (!v26) {
      goto LABEL_25;
    }
    long long v27 = (void *)v26;
    CFStringRef v28 = [v6 supportsThemeAssets];
    v46 = v8;
    long long v29 = v10;
    long long v30 = v16;
    uint64_t v31 = self;
    unsigned int v32 = [v28 BOOLValue];
    unsigned int v33 = [v7 supportsThemeAssets];

    BOOL v34 = v32 == v33;
    self = v31;
    uint64_t v16 = v30;
    id v10 = v29;
    id v8 = v46;
    if (!v34)
    {
LABEL_25:
      long long v35 = CarGeneralLogging();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v36 = [v7 supportsThemeAssets];
        CFStringRef v37 = @"NO";
        if (v36) {
          CFStringRef v37 = @"YES";
        }
        *(_DWORD *)int buf = 138543618;
        CFStringRef v48 = v37;
        __int16 v49 = 2112;
        id v50 = v6;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Updating supportsThemeAssets to %{public}@ for %@", buf, 0x16u);
      }

      long long v38 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supportsThemeAssets]);
      [v6 setSupportsThemeAssets:v38];

      int v13 = 1;
    }
  }
  unsigned int v39 = [v6 supportsUSBCarPlay];
  if (v39 != [v7 supportsUSBCarPlay])
  {
    [v6 setSupportsUSBCarPlay:[v7 supportsUSBCarPlay]];
    int v13 = 1;
  }
  unsigned int v40 = [v6 supportsWirelessCarPlay];
  if (v40 != [v7 supportsWirelessCarPlay])
  {
    [v6 setSupportsWirelessCarPlay:[v7 supportsWirelessCarPlay]];
    int v13 = 1;
  }
  BOOL v41 = [(CRCarKitServiceAgent *)self _currentlyConnectedVehicleSupportsMixableAudio];
  if (v41 != [v6 supportsMixableAudio])
  {
    [v6 setSupportsMixableAudio:v41];
    if (!CRIsInternalInstall()) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  if (CRIsInternalInstall())
  {
LABEL_39:
    v42 = +[NSDate date];
    [v6 setLastConnectedDate:v42];

    v43 = [v7 vehicleModelName];
    [v6 setVehicleModelName:v43];

LABEL_41:
    v44 = [(CRCarKitServiceAgent *)self vehicleStore];
    id v45 = [v44 saveVehicle:v6];

    goto LABEL_42;
  }
  if (v13) {
    goto LABEL_41;
  }
LABEL_42:
}

- (id)pairedVehiclesConnectedOnBluetooth
{
  uint64_t v3 = +[NSMutableSet set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = [(CRCarKitServiceAgent *)self bluetoothManager];
  id v5 = [v4 connectedBluetoothAddresses];

  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v11 = [(CRCarKitServiceAgent *)self vehicleStore];
        unsigned __int8 v12 = [v11 vehicleForBluetoothAddress:v10];

        if (v12 && [v12 isPaired]) {
          [v3 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v7);
  }

  int v13 = [(CRCarKitServiceAgent *)self messagingConnector];
  CFStringRef v14 = [v13 connectedVehicles];

  unsigned __int8 v15 = +[NSPredicate predicateWithBlock:&stru_1000BE050];
  uint64_t v16 = [v14 filteredSetUsingPredicate:v15];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        unsigned int v22 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        long long v23 = [(CRCarKitServiceAgent *)self vehicleStore];
        unsigned int v24 = [v22 bluetoothAddress];
        CFStringRef v25 = [v23 vehicleForBluetoothAddress:v24];

        if (v25 && [v25 isPaired]) {
          [v3 addObject:v25];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v19);
  }

  uint64_t v26 = CarGeneralLogging();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    CFStringRef v37 = v3;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "BT connected vehicles: %@", buf, 0xCu);
  }

  return v3;
}

- (BOOL)_currentlyConnectedVehicleSupportsMixableAudio
{
  v2 = [(CRCarKitServiceAgent *)self sessionStatus];
  uint64_t v3 = [v2 currentSession];

  if (v3)
  {
    id v4 = [v3 configuration];
    unsigned __int8 v5 = [v4 supportsSiriMixable];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)saveVehicle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [(CRCarKitServiceAgent *)self vehicleStore];
    id v6 = [v4 identifier];
    id v7 = [v5 vehicleForIdentifier:v6];

    if (v7) {
      unsigned int v8 = [v7 isPaired];
    }
    else {
      unsigned int v8 = 0;
    }
    id v11 = [(CRCarKitServiceAgent *)self vehicleStore];
    uint64_t v9 = [v11 saveVehicle:v4];

    unsigned int v12 = [v9 isPaired];
    int v13 = CarGeneralLogging();
    CFStringRef v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Saved vehicle %@", buf, 0xCu);
      }

      if (v8 != v12)
      {
        unsigned __int8 v15 = CarGeneralLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v9 identifier];
          id v17 = (void *)v16;
          CFStringRef v18 = @"NO";
          if (v8) {
            CFStringRef v19 = @"YES";
          }
          else {
            CFStringRef v19 = @"NO";
          }
          *(_DWORD *)int buf = 138543874;
          *(void *)&uint8_t buf[4] = v16;
          *(void *)&buf[14] = v19;
          *(_WORD *)&buf[12] = 2114;
          if (v12) {
            CFStringRef v18 = @"YES";
          }
          *(_WORD *)&buf[22] = 2114;
          long long v28 = (uint64_t (*)(uint64_t, uint64_t))v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "vehicle %{public}@ changed pairing status from %{public}@ to: %{public}@", buf, 0x20u);
        }
        *(void *)int buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        long long v28 = sub_100020C28;
        long long v29 = sub_100020C38;
        id v30 = (id)os_transaction_create();
        dispatch_time_t v20 = dispatch_time(0, 100000000);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10002AA98;
        v23[3] = &unk_1000BE0A0;
        v23[4] = self;
        char v26 = v12;
        unsigned int v24 = v9;
        CFStringRef v25 = buf;
        dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, v23);

        _Block_object_dispose(buf, 8);
      }
      CFStringRef v21 = v9;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000722D8();
      }
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000722A4();
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)removeVehicle:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = CarGeneralLogging();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing vehicle %@", (uint8_t *)&buf, 0xCu);
    }

    id v7 = [(CRCarKitServiceAgent *)self vehicleStore];
    unsigned __int8 v8 = [v7 removeVehicle:v4];

    id v6 = [v4 carplayWiFiUUID];
    if (v6)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v25 = 0x3032000000;
      char v26 = sub_100020C28;
      long long v27 = sub_100020C38;
      id v28 = (id)os_transaction_create();
      dispatch_time_t v9 = dispatch_time(0, 100000000);
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      CFStringRef v18 = sub_10002B140;
      CFStringRef v19 = &unk_1000BE0C8;
      dispatch_time_t v20 = self;
      id v21 = v4;
      unsigned int v22 = v6;
      p_long long buf = &buf;
      dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, &v16);

      _Block_object_dispose(&buf, 8);
    }
    uint64_t v10 = [v4 bluetoothAddress:v16, v17, v18, v19, v20];
    if (v10)
    {
      if ([v4 supportsBluetoothLE])
      {
        id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
        if (v11)
        {
          unsigned int v12 = [(CRCarKitServiceAgent *)self messagingConnector];
          unsigned __int8 v13 = [v12 unpairWithBluetoothLEIdentifier:v11];
        }
        else
        {
          unsigned __int8 v13 = 1;
        }
      }
      else
      {
        id v11 = [(CRCarKitServiceAgent *)self bluetoothManager];
        unsigned __int8 v13 = [v11 unpairWithBluetoothAddress:v10];
      }
    }
    else
    {
      unsigned __int8 v13 = 1;
    }
    char v14 = v8 & v13;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000723D0();
    }
    char v14 = 0;
  }

  return v14;
}

- (BOOL)attemptConnectionWithVehicles:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    BOOL v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "attemptConnectionForVehicles %@", buf, 0xCu);
  }

  if (![(CRCarKitServiceAgent *)self _isRestricted:0])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v25 = v4;
    obj = v4;
    id v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (!v7)
    {
      char v26 = 0;
      goto LABEL_36;
    }
    id v8 = v7;
    char v26 = 0;
    uint64_t v9 = *(void *)v35;
    uint64_t v27 = *(void *)v35;
    while (1)
    {
      uint64_t v10 = 0;
      id v28 = v8;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(NSObject **)(*((void *)&v34 + 1) + 8 * (void)v10);
        if ([v11 isPaired])
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          unsigned int v12 = [(CRCarKitServiceAgent *)self messagingConnector];
          unsigned __int8 v13 = [v12 connectedVehicles];

          id v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v31;
LABEL_13:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              CFStringRef v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
              CFStringRef v19 = +[NSSet setWithObject:v11];
              dispatch_time_t v20 = [(CRCarKitServiceAgent *)self vehicleMatchingMessagingVehicle:v18 inVehicles:v19];

              if (v20) {
                break;
              }
              if (v15 == (id)++v17)
              {
                id v15 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
                if (v15) {
                  goto LABEL_13;
                }
                goto LABEL_19;
              }
            }
            if ([v18 supportsCarPlayConnectionRequest])
            {
              [(CRCarKitServiceAgent *)self _sendCarPlayAvailabilityForMessagingVehicle:v18 storedVehicle:v11];
              char v26 = 1;
              goto LABEL_27;
            }
            id v8 = v28;
            if ([v18 supportsWirelessCarPlay])
            {
              long long v23 = [(CRCarKitServiceAgent *)self messagingConnector];
              [v23 requestWiFiCredentialsFromVehicle:v18];
            }
            char v26 = 1;
          }
          else
          {
LABEL_19:

            unsigned __int8 v13 = [v11 bluetoothAddress];
            if (!v13)
            {
LABEL_27:
              uint64_t v9 = v27;
              id v8 = v28;
              goto LABEL_32;
            }
            id v21 = CarGeneralLogging();
            id v8 = v28;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              BOOL v41 = v13;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "attempting Bluetooth connection to %@", buf, 0xCu);
            }

            unsigned int v22 = [(CRCarKitServiceAgent *)self bluetoothManager];
            [v22 connectWithBluetoothAddress:v13];
          }
          uint64_t v9 = v27;
        }
        else
        {
          unsigned __int8 v13 = CarGeneralLogging();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            BOOL v41 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "no WiFi credentials request necessary for %@", buf, 0xCu);
          }
        }
LABEL_32:

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (!v8)
      {
LABEL_36:

        id v4 = v25;
        char v6 = v26;
        goto LABEL_37;
      }
    }
  }
  char v6 = 0;
LABEL_37:

  return v6 & 1;
}

- (void)_sendCarPlayAvailabilityForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  if ([v27 supportsCarPlayConnectionRequest])
  {
    id v7 = [(CRCarKitServiceAgent *)self preferencesManager];
    unsigned int v8 = [v7 isCarPlayAllowed];

    if (v8)
    {
      if (v6)
      {
        uint64_t v9 = [v6 bluetoothAddress];
        BOOL v10 = v9 != 0;

        id v11 = [v6 pairingStatus];
      }
      else
      {
        BOOL v10 = 0;
        id v11 = 0;
      }
      BOOL v14 = [v27 transportType] == (id)2 || [v27 transportType] == (id)4;
      if ([v27 supportsThemeAssets])
      {
        if (v11 == (id)2
          || ((unsigned int v15 = [(CRCarKitServiceAgent *)self carPlaySimulatorActive]) == 0
            ? (unsigned int v12 = &__kCFBooleanFalse)
            : (unsigned int v12 = &__kCFBooleanTrue),
              v6 && v15))
        {
          uint64_t v16 = [(CRCarKitServiceAgent *)self featuresAvailabilityAgent];
          uint64_t v17 = [v6 identifier];
          unsigned int v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", CRCarPlayFeaturesAllFerriteFeatures() & (unint64_t)[v16 supportedCarPlayFeaturesForVehicleIdentifier:v17]);
        }
        if (v14) {
          goto LABEL_22;
        }
      }
      else
      {
        unsigned int v12 = 0;
        if (v14)
        {
LABEL_22:
          if (v11) {
            BOOL v18 = v10;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18)
          {
            CFStringRef v19 = [(CRCarKitServiceAgent *)self messagingConnector];
            BOOL v20 = v11 == (id)2;
            if (v11 == (id)2) {
              id v21 = &__kCFBooleanTrue;
            }
            else {
              id v21 = 0;
            }
            unsigned int v22 = +[NSNumber numberWithBool:v20];
            [v19 sendWiredCarPlayAvailable:v21 wirelessCarPlayAvailable:v22 themeAssetsAvailable:v12 toVehicle:v27];
          }
          goto LABEL_35;
        }
      }
      long long v23 = [(CRCarKitServiceAgent *)self messagingConnector];
      unsigned int v24 = v23;
      if (v10)
      {
        uint64_t v25 = +[NSNumber numberWithBool:v11 == (id)2];
        [v24 sendWiredCarPlayAvailable:&__kCFBooleanTrue wirelessCarPlayAvailable:v25 themeAssetsAvailable:v12 toVehicle:v27];
      }
      else
      {
        [v23 sendWiredCarPlayAvailable:&__kCFBooleanTrue wirelessCarPlayAvailable:0 themeAssetsAvailable:v12 toVehicle:v27];
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carplay.starting-wired-connection", 0, 0, 1u);
    }
    else
    {
      unsigned int v12 = [(CRCarKitServiceAgent *)self messagingConnector];
      if ([v27 supportsThemeAssets]) {
        unsigned __int8 v13 = &__kCFBooleanFalse;
      }
      else {
        unsigned __int8 v13 = 0;
      }
      [v12 sendWiredCarPlayAvailable:&__kCFBooleanFalse wirelessCarPlayAvailable:&__kCFBooleanFalse themeAssetsAvailable:v13 toVehicle:v27];
    }
LABEL_35:
  }
}

- (BOOL)_sendDeviceIdentifiersForMessagingVehicle:(id)a3 pairingStatus:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 supportsCarPlayConnectionRequest]) {
    goto LABEL_7;
  }
  id v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100072404();
  }

  if (![(CRCarKitServiceAgent *)self _isRestricted:0]
    && ((id v8 = [v6 transportType], a4 == 2) || v8 == (id)1))
  {
    id v11 = [(CRCarKitServiceAgent *)self messagingConnector];
    [v11 sendDeviceTransportIdentifiersToVehicle:v6];

    BOOL v9 = 1;
  }
  else
  {
LABEL_7:
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:(id)a3
{
  id v4 = a3;
  if ([v4 transportType] == (id)2
    && [v4 supportsWirelessCarPlay]
    && ([v4 supportsCarPlayConnectionRequest] & 1) == 0)
  {
    id v7 = [(CRCarKitServiceAgent *)self messagingConnector];
    [v7 requestWiFiCredentialsFromVehicle:v4];

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasExistingBluetoothPairingForPairingPromptFlow:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messagingVehicle];
  BOOL v5 = [v4 bluetoothAddress];

  if (v5 || ([v3 bluetoothDeviceIdentifier], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v6 = +[CRBluetoothManager hasPairingWithAddress:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)enhancedIntegrationSupportedForPairingPromptFlow:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [v4 messagingVehicle];
  BOOL v8 = [(CRCarKitServiceAgent *)self _shouldPromptEnhancedIntegrationForStoredVehicle:v6 messagingVehicle:v7];

  return v8;
}

- (BOOL)needsBluetoothTurnedOnForPairingPromptFlow:(id)a3
{
  id v3 = [(CRCarKitServiceAgent *)self bluetoothManager];
  unsigned __int8 v4 = [v3 isPowered];

  return v4 ^ 1;
}

- (BOOL)needsWiFiTurnedOnForPairingPromptFlow:(id)a3
{
  id v3 = [(CRCarKitServiceAgent *)self wifiManager];
  unsigned __int8 v4 = [v3 isPowered];

  return v4 ^ 1;
}

- (BOOL)supportsThemeAssetsForPairingPromptFlow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 messagingVehicle];
  id v6 = [v4 messagingVehicle];

  id v7 = [v6 certificateSerialNumber];

  BOOL v8 = [(CRCarKitServiceAgent *)self featuresAvailabilityAgent];
  unint64_t v9 = (unint64_t)[v8 supportedCarPlayFeaturesForCertificateSerial:v7];

  uint64_t v10 = CRCarPlayFeaturesAllFerriteFeatures() & v9;
  uint64_t v11 = CRCarPlayFeaturesAllFerriteFeatures();
  unsigned int v12 = CarPairingLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218240;
    unint64_t v17 = v9;
    __int16 v18 = 1024;
    BOOL v19 = v10 == v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "features: %lu, supportsThemeAssets: %u", (uint8_t *)&v16, 0x12u);
  }

  unsigned __int8 v13 = [v5 supportsThemeAssets];
  if (v10 == v11) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)outOfBandPairingDeclineCountForPairingPromptFlow:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _pairingIdentifierForPromptFlow:v3];

  if (v4) {
    id v5 = [(id)objc_opt_class() _pairingDeclineCountForIdentifier:v4];
  }
  else {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (void)incrementOutOfBandPairingDeclineCountForPairingPromptFlow:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _pairingIdentifierForPromptFlow:v3];

  if (v4) {
    [(id)objc_opt_class() _incrementPairingDeclineCountForIdentifier:v4];
  }
}

- (id)carKeyInfoForPairingPromptFlow:(id)a3
{
  id v3 = [a3 messagingVehicle];
  id v4 = [v3 digitalCarKeyInformation];

  return v4;
}

- (id)assetProgressForPairingPromptFlow:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [(CRCarKitServiceAgent *)self vehicleAssetManager];
  id v6 = [v5 assetProgressForVehicle:v4];

  id v7 = CarPairingLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "prompt flow using asset progress: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (void)pairingPromptFlow:(id)a3 wantsToPerformPresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CRCarKitServiceAgent *)self setupPromptDirector];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C33C;
  v13[3] = &unk_1000BE0F0;
  id v14 = v6;
  id v15 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C45C;
  v11[3] = &unk_1000BD078;
  id v12 = v14;
  id v9 = v14;
  id v10 = v7;
  [v8 performWithPromptPresenter:v13 errorHandler:v11];
}

- (void)_dismissPairingPromptFlow:(id)a3
{
  id v12 = a3;
  id v4 = [v12 bluetoothDeviceIdentifier];
  uint64_t v5 = [(CRCarKitServiceAgent *)self currentBluetoothConfirmationHandler];
  id v6 = (void *)v5;
  if (v5 && v4) {
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
  }
  [(CRCarKitServiceAgent *)self setCurrentBluetoothConfirmationHandler:0];
  [(CRCarKitServiceAgent *)self _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:v4 success:0 error:0];
  if ([v12 startedFromCarKey])
  {
    objc_opt_class();
    id v7 = [v12 userInfo];
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8) {
      id v9 = [v8 isPaired];
    }
    else {
      id v9 = 0;
    }
    [(CRCarKitServiceAgent *)self _delegateHeadUnitPairingDidCompletePairingFlow:v9 forBluetoothAddress:v4 error:0];
  }
  id v10 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
  [v10 invalidate];

  [(CRCarKitServiceAgent *)self setCurrentPromptFlowController:0];
  uint64_t v11 = [(CRCarKitServiceAgent *)self setupPromptDirector];
  [v11 dismissPromptPresenter];
}

- (void)pairingPromptFlow:(id)a3 didCancelWithRequiredStepsRemaining:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = CarPairingLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    int v15 = 138543362;
    CFStringRef v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "canceling setup prompt flow, required steps remaining: %{public}@", (uint8_t *)&v15, 0xCu);
  }

  if (v4)
  {
    objc_opt_class();
    id v9 = [v6 userInfo];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = (__CFString *)v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      unsigned int v11 = [(CRCarKitServiceAgent *)self removeVehicle:v10];
      id v12 = CarPairingLogging();
      unsigned __int8 v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          CFStringRef v16 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "canceling setup prompt flow: removed vehicle %@", (uint8_t *)&v15, 0xCu);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_1000724E0();
      }
    }
  }
  [(CRCarKitServiceAgent *)self _dismissPairingPromptFlow:v6];
  id v14 = CarPairingLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "canceled setup prompt flow", (uint8_t *)&v15, 2u);
  }
}

- (void)didCompletePairingPromptFlow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "completed setup prompt flow", v6, 2u);
  }

  [(CRCarKitServiceAgent *)self _dismissPairingPromptFlow:v4];
}

- (void)pairingPromptFlow:(id)a3 receivedBluetoothConfirmationResponse:(BOOL)a4 forDeviceIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  CFStringRef v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setup prompt flow received BT confirmation response", v11, 2u);
  }

  id v9 = [(CRCarKitServiceAgent *)self currentBluetoothConfirmationHandler];
  if (v9)
  {
    id v10 = +[NSNumber numberWithBool:v5];
    ((void (**)(void, id, NSObject *))v9)[2](v9, v7, v10);
  }
  else
  {
    id v10 = CarPairingLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100072548();
    }
  }

  [(CRCarKitServiceAgent *)self setCurrentBluetoothConfirmationHandler:0];
}

- (void)pairingPromptFlow:(id)a3 receivedBluetoothContactsSyncResponse:(BOOL)a4 forDeviceIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  CFStringRef v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setup prompt flow received BT contacts sync response", v10, 2u);
  }

  id v9 = [(CRCarKitServiceAgent *)self bluetoothManager];
  [v9 setContactsSyncEnabled:v5 forBluetoothAddress:v7];
}

- (void)_setVehiclePairingStatus:(unint64_t)a3 forPromptFlow:(id)a4
{
  id v10 = a4;
  objc_opt_class();
  id v6 = [v10 userInfo];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if ([v7 pairingStatus] != (id)a3)
  {
    [v7 setPairingStatus:a3];
    CFStringRef v8 = [(CRCarKitServiceAgent *)self vehicleStore];
    id v9 = [v8 saveVehicle:v7];

    [v10 setUserInfo:v9];
  }
}

- (void)pairingPromptFlow:(id)a3 receivedAllowWhileLockedResponse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = CarGeneralLogging();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      uint64_t v9 = 2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allow while locked accepted", buf, 2u);
    }
    else
    {
      uint64_t v9 = 2;
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allow while locked declined", v10, 2u);
    }
    uint64_t v9 = 1;
  }

  [(CRCarKitServiceAgent *)self _setVehiclePairingStatus:v9 forPromptFlow:v6];
}

- (void)pairingPromptFlow:(id)a3 receivedUseWirelessResponse:(BOOL)a4 turnOnBluetooth:(BOOL)a5 turnOnWiFi:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  objc_opt_class();
  id v11 = [v10 userInfo];
  if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  unsigned __int8 v13 = [v10 messagingVehicle];
  if (v7)
  {
    id v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "turning on Bluetooth due to OOB pairing alert acceptance", buf, 2u);
    }

    int v15 = [(CRCarKitServiceAgent *)self bluetoothManager];
    [v15 setPowered:1];
  }
  if (v6)
  {
    CFStringRef v16 = CarGeneralLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "turning on Wi-Fi due to OOB pairing alert acceptance", v22, 2u);
    }

    unint64_t v17 = [(CRCarKitServiceAgent *)self wifiManager];
    [v17 setPowered:1];
  }
  __int16 v18 = CarGeneralLogging();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v19)
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert accepted", v21, 2u);
    }

    [(CRCarKitServiceAgent *)self _setVehiclePairingStatus:2 forPromptFlow:v10];
    [(CRCarKitServiceAgent *)self _beginWiredPairingWithMessagingVehicle:v13 storedVehicle:v12];
  }
  else
  {
    if (v19)
    {
      *(_WORD *)BOOL v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert declined", v20, 2u);
    }
  }
}

- (void)pairingPromptFlow:(id)a3 receivedConnectCarPlayResponse:(BOOL)a4 turnOnWiFi:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_opt_class();
  id v9 = [v8 userInfo];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  id v11 = [v8 messagingVehicle];
  if (v5)
  {
    id v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "turning on Wi-Fi due to connect alert acceptance", buf, 2u);
    }

    unsigned __int8 v13 = [(CRCarKitServiceAgent *)self wifiManager];
    [v13 setPowered:1];
  }
  id v14 = CarPairingLogging();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v15)
    {
      *(_WORD *)unsigned int v22 = 0;
      uint64_t v16 = 2;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connect CarPlay accepted", v22, 2u);
    }
    else
    {
      uint64_t v16 = 2;
    }
  }
  else
  {
    if (v15)
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connect CarPlay declined", v21, 2u);
    }
    uint64_t v16 = 1;
  }

  [(CRCarKitServiceAgent *)self _setVehiclePairingStatus:v16 forPromptFlow:v8];
  unsigned int v17 = [v11 supportsCarPlayConnectionRequest];
  id v18 = [v11 transportType];
  if (v17)
  {
    if (v18 == (id)2 || [v11 transportType] == (id)4) {
      [(CRCarKitServiceAgent *)self _sendCarPlayAvailabilityForMessagingVehicle:v11 storedVehicle:v10];
    }
  }
  else if (v18 == (id)2)
  {
    [(CRCarKitServiceAgent *)self _sendDeviceIdentifiersForMessagingVehicle:v11 pairingStatus:v16];
    if ([v10 isPaired]) {
      [(CRCarKitServiceAgent *)self _requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:v11];
    }
  }
  if (v6)
  {
    BOOL v19 = [(CRCarKitServiceAgent *)self _wirelessPairingAnalyticsDescriptionForMessagingVehicle:v11 storedVehicle:v10];
    BOOL v20 = +[CARAnalytics sharedInstance];
    [v20 userCreatedWirelessPairingWithSource:@"Settings" payload:v19];
  }
}

- (void)pairingPromptFlow:(id)a3 receivedConnectCarPlayFromCarKeyResponse:(BOOL)a4 vehicleName:(id)a5 turnOnWiFi:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 bluetoothDeviceIdentifier];
  unsigned __int8 v13 = CarPairingLogging();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v14)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "connect CarPlay from car key accepted", buf, 2u);
    }

    if (v6)
    {
      BOOL v15 = CarGeneralLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "turning on Wi-Fi due to connect alert acceptance", v18, 2u);
      }

      uint64_t v16 = [(CRCarKitServiceAgent *)self wifiManager];
      [v16 setPowered:1];
    }
    unsigned __int8 v13 = objc_alloc_init((Class)CRVehicle);
    [v13 setVehicleName:v11];
    [v13 setBluetoothAddress:v12];
    [v10 setUserInfo:v13];
    [(CRCarKitServiceAgent *)self _setVehiclePairingStatus:2 forPromptFlow:v10];
  }
  else if (v14)
  {
    *(_WORD *)unsigned int v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "connect CarPlay from car key declined", v17, 2u);
  }

  [(CRCarKitServiceAgent *)self _delegateHeadUnitPairingDidReceiveUserConfirmation:v8 forBluetoothAddress:v12];
}

- (void)pairingPromptFlow:(id)a3 receivedEnhancedIntegrationResponse:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [a3 messagingVehicle];
  BOOL v7 = CarGeneralLogging();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      uint64_t v9 = 2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert accepted", buf, 2u);
    }
    else
    {
      uint64_t v9 = 2;
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert declined", v10, 2u);
    }
    uint64_t v9 = 1;
  }

  [(CRCarKitServiceAgent *)self _enhancedIntegrationUpdatedForMessagingVehicle:v6 status:v9];
}

- (void)presentHeadUnitPairingForBluetoothAddress:(id)a3 showBluetoothOnlyOption:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v7 = CarPairingLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 141558275;
    uint64_t v13 = 1752392040;
    __int16 v14 = 2113;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "presentPairingForBluetoothAddress: %{private, mask.hash}@", buf, 0x16u);
  }

  id v11 = 0;
  unsigned int v8 = [(CRCarKitServiceAgent *)self _isRestricted:&v11];
  id v9 = v11;
  if (v8)
  {
    [(CRCarKitServiceAgent *)self _delegateHeadUnitPairingDidCompletePairingFlow:0 forBluetoothAddress:v6 error:v9];
  }
  else
  {
    id v10 = objc_alloc_init(CRPairingPromptFlowController);
    [(CRPairingPromptFlowController *)v10 setPromptDelegate:self];
    [(CRCarKitServiceAgent *)self setCurrentPromptFlowController:v10];
    [(CRPairingPromptFlowController *)v10 handleCarKeyInitiatedConfirmationForDeviceAddress:v6 showBluetoothOnlyOption:v4];
  }
}

- (void)didHeadUnitPairWithBluetoothAddress:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v5 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
  id v6 = [v5 bluetoothDeviceIdentifier];

  if (!v6)
  {
    id v9 = CarPairingLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10007257C();
    }
    goto LABEL_10;
  }
  unsigned __int8 v7 = [v6 isEqual:v4];
  unsigned int v8 = CarPairingLogging();
  id v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000725B0();
    }
LABEL_10:

    [(CRCarKitServiceAgent *)self _delegateHeadUnitPairingDidCompletePairingFlow:0 forBluetoothAddress:v4 error:0];
    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 141558275;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2113;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "head unit pairing succeeded for Bluetooth addresses %{private, mask.hash}@", (uint8_t *)&v10, 0x16u);
  }

LABEL_11:
}

- (void)didFailToHeadUnitPairWithBluetoothAddress:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10007266C();
  }

  id v9 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
  int v10 = v9;
  if (v9)
  {
    [v9 handleCarKeyInitiatedPairingFailed];
  }
  else
  {
    uint64_t v11 = CarPairingLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100072638();
    }
  }
}

- (void)_delegateHeadUnitPairingDidReceiveUserConfirmation:(BOOL)a3 forBluetoothAddress:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [(CRCarKitServiceAgent *)self headUnitPairingDelegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 headUnitPairingPresenter:self didReceiveUserConfirmation:v4 forBluetoothAddress:v7];
  }
}

- (void)_delegateHeadUnitPairingDidCompletePairingFlow:(BOOL)a3 forBluetoothAddress:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v10 = a4;
  id v8 = a5;
  id v9 = [(CRCarKitServiceAgent *)self headUnitPairingDelegate];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v9 headUnitPairingPresenter:self didCompletePairingFlow:v6 forBluetoothAddress:v10 error:v8];
  }
}

- (void)_presentApprovalIfNecessaryForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6 || ![v6 pairingStatus])
  {
    id v8 = [(CRCarKitServiceAgent *)self preferencesManager];
    id v9 = [v8 isCarPlaySetupEnabled];
    unsigned int v10 = [v9 BOOLValue];

    if (v10) {
      [(CRCarKitServiceAgent *)self _presentCarPlaySetupForMessagingVehicle:v11 storedVehicle:v7];
    }
    else {
      [(CRCarKitServiceAgent *)self _presentApprovalUsingAlertsForMessagingVehicle:v11];
    }
  }
}

- (void)_presentCarPlaySetupForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    if ([v6 pairingStatus])
    {
      id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pairingStatus] == (id)2);
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = +[CRVehicle vehicleForMessagingVehicle:v11];
    id v7 = [(CRCarKitServiceAgent *)self saveVehicle:v9];
  }
  id v8 = 0;
LABEL_6:
  unsigned int v10 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
  if (!v10)
  {
    unsigned int v10 = objc_alloc_init(CRPairingPromptFlowController);
    [(CRPairingPromptFlowController *)v10 setPromptDelegate:self];
    [(CRCarKitServiceAgent *)self setCurrentPromptFlowController:v10];
  }
  [(CRPairingPromptFlowController *)v10 setUserInfo:v7];
  [(CRPairingPromptFlowController *)v10 handleConnectedMessagingVehicle:v11 pairingAccepted:v8];
}

- (void)_presentApprovalUsingAlertsForMessagingVehicle:(id)a3
{
  id v4 = a3;
  if ([v4 transportType] == (id)2 || objc_msgSend(v4, "transportType") == (id)4)
  {
    BOOL v5 = CROutstandingWirelessVehicleApprovalAlert;
LABEL_4:
    id v6 = [[v5 alloc] initWithMessagingVehicle:v4];
    goto LABEL_5;
  }
  if ([v4 supportsUSBCarPlay])
  {
    BOOL v5 = CROutstandingWiredVehicleApprovalAlert;
    goto LABEL_4;
  }
  if ([v4 supportsWirelessCarPlay]
    && [v4 supportsWiredBluetoothPairing])
  {
    [(CRCarKitServiceAgent *)self _presentWiredBluetoothPairingAlertForMessagingVehicle:v4 storedVehicle:0];
  }
  id v6 = 0;
LABEL_5:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = [(CRCarKitServiceAgent *)self outstandingApprovalAlerts];
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v40;
    while (2)
    {
      unsigned int v10 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v10) messagingVehicle];
        unsigned __int8 v12 = [v11 isEqual:v4];

        if (v12)
        {

          goto LABEL_17;
        }
        unsigned int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_100020C28;
  v37[4] = sub_100020C38;
  id v38 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10002DE00;
  void v34[3] = &unk_1000BDB20;
  long long v36 = v37;
  v34[4] = self;
  id v13 = v6;
  id v35 = v13;
  __int16 v14 = objc_retainBlock(v34);
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = sub_100020C28;
  long long v32 = sub_100020C38;
  id v33 = +[CRVehicle vehicleForMessagingVehicle:v4];
  uint64_t v15 = [(CRCarKitServiceAgent *)self saveVehicle:v29[5]];
  uint64_t v16 = (void *)v29[5];
  v29[5] = v15;

  BOOL v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_10002DEA8;
  unsigned int v22 = &unk_1000BE118;
  long long v23 = self;
  id v17 = v13;
  id v24 = v17;
  char v26 = &v28;
  id v25 = v4;
  id v27 = v37;
  id v18 = objc_retainBlock(&v19);
  if (objc_msgSend(v17, "presentAlertWithCompletion:", v18, v19, v20, v21, v22, v23)) {
    ((void (*)(void *))v14[2])(v14);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v37, 8);

LABEL_17:
}

- (void)_dismissApprovalAlertForMessagingVehicle:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(CRCarKitServiceAgent *)self outstandingApprovalAlerts];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 messagingVehicle];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12) {
          [v10 dismissAlert];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_dismissApprovalAlerts
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CRCarKitServiceAgent *)self outstandingApprovalAlerts];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) dismissAlert];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)_pairingIdentifierForMessagingVehicle:(id)a3
{
  id v3 = [a3 bluetoothAddress];
  id v4 = v3;
  if (!v3) {
    id v3 = @"CarPlay";
  }
  uint64_t v5 = v3;

  return v5;
}

+ (id)_pairingIdentifierForPromptFlow:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 userInfo];

  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    long long v7 = [v6 identifier];
    long long v8 = [v7 UUIDString];
  }
  else
  {
    long long v9 = CarPairingLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10007276C();
    }

    long long v8 = 0;
  }

  return v8;
}

+ (unint64_t)_pairingDeclineCountForIdentifier:(id)a3
{
  id v3 = +[CRVehicleStore payloadForVehicleWithIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 unsignedIntegerValue];
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[NSNumber numberWithUnsignedInteger:v4];
      int v8 = 138412290;
      long long v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OOB decline count: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

+ (void)_incrementPairingDeclineCountForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[a1 _pairingDeclineCountForIdentifier:v4];
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = +[NSNumber numberWithUnsignedInteger:v5];
    int v9 = 138543362;
    long long v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Incrementing OOB decline count from %{public}@", (uint8_t *)&v9, 0xCu);
  }
  int v8 = +[NSNumber numberWithUnsignedInteger:v5 + 1];
  +[CRVehicleStore setPayload:v8 forVehicleWithIdentifier:v4];
}

+ (unint64_t)_declineTypeForOOBPairingMessagingVehicle:(id)a3
{
  id v4 = a3;
  if (([v4 supportsWiredBluetoothPairing] & 1) == 0)
  {
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v6 = "Doesn't support wired BT pairing.";
      long long v7 = buf;
      goto LABEL_7;
    }
LABEL_8:

    unint64_t v8 = 0;
    goto LABEL_12;
  }
  if ([v4 supportsUSBCarPlay])
  {
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v6 = "Supports USB - setting USB decline type.";
      long long v7 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v9 = [a1 _pairingIdentifierForMessagingVehicle:v4];
  id v10 = [a1 _pairingDeclineCountForIdentifier:v9];

  if ((unint64_t)v10 <= 2) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = 2;
  }
LABEL_12:

  return v8;
}

- (void)_presentWiredBluetoothPairingAlertForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CRMessagingVehicleAlert *)[CROutstandingVehiclePairingAlert alloc] initWithMessagingVehicle:v6];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100020C28;
  v27[4] = sub_100020C38;
  id v28 = 0;
  int v9 = [(CRCarKitServiceAgent *)self bluetoothManager];
  uint64_t v10 = [v9 isPowered] ^ 1;

  [(CROutstandingVehiclePairingAlert *)v8 setShouldEnableBluetooth:v10];
  id v11 = [(id)objc_opt_class() _declineTypeForOOBPairingMessagingVehicle:v6];
  [(CROutstandingVehiclePairingAlert *)v8 setDeclineType:v11];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002EADC;
  v24[3] = &unk_1000BDB20;
  char v26 = v27;
  v24[4] = self;
  __int16 v12 = v8;
  id v25 = v12;
  long long v13 = objc_retainBlock(v24);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002EB84;
  v18[3] = &unk_1000BE140;
  void v18[4] = self;
  long long v14 = v12;
  BOOL v19 = v14;
  id v23 = v11;
  id v15 = v6;
  id v20 = v15;
  id v16 = v7;
  id v21 = v16;
  unsigned int v22 = v27;
  id v17 = objc_retainBlock(v18);
  if ([(CRMessagingVehicleAlert *)v14 presentAlertWithCompletion:v17]) {
    ((void (*)(void *))v13[2])(v13);
  }

  _Block_object_dispose(v27, 8);
}

- (void)_beginWiredPairingWithMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "starting wired Bluetooth pairing with %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100020C28;
  unsigned int v22 = sub_100020C38;
  id v23 = (id)os_transaction_create();
  objc_initWeak(&location, self);
  int v9 = [(CRCarKitServiceAgent *)self messagingConnector];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002EFD8;
  v12[3] = &unk_1000BE168;
  id v10 = v7;
  id v13 = v10;
  id v11 = v6;
  id v14 = v11;
  objc_copyWeak(&v17, &location);
  id v15 = self;
  p_long long buf = &buf;
  [v9 beginWiredBluetoothPairingWithVehicle:v11 completion:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

- (void)_dismissPairingAlertForMessagingVehicle:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CRCarKitServiceAgent *)self outstandingPairingAlerts];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 messagingVehicle];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12) {
          [v10 dismissAlert];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_dismissPairingAlerts
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CRCarKitServiceAgent *)self outstandingPairingAlerts];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) dismissAlert];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_presentReconnectionEnableWiFiAlertForVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "presenting alert to ask to turn on Wi-Fi", buf, 2u);
  }

  id v6 = [[CRReconnectionEnableWiFiAlert alloc] initWithVehicle:v4];
  *(void *)long long buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x3032000000;
  unsigned int v22 = sub_100020C28;
  id v23 = sub_100020C38;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002F678;
  v16[3] = &unk_1000BDB20;
  id v18 = buf;
  v16[4] = self;
  long long v7 = v6;
  id v17 = v7;
  long long v8 = objc_retainBlock(v16);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F720;
  v12[3] = &unk_1000BE190;
  void v12[4] = self;
  long long v9 = v7;
  long long v13 = v9;
  id v10 = v4;
  id v14 = v10;
  long long v15 = buf;
  id v11 = objc_retainBlock(v12);
  if ([(CRReconnectionEnableWiFiAlert *)v9 presentAlertWithCompletion:v11]) {
    ((void (*)(void *))v8[2])(v8);
  }

  _Block_object_dispose(buf, 8);
}

- (id)_presentedReconnectionEnableWiFiAlertForVehicle:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(CRCarKitServiceAgent *)self outstandingEnableWiFiAlerts];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 vehicle];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_dismissReconnectionEnableWiFiAlertForVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRCarKitServiceAgent *)self outstandingEnableWiFiAlerts];
  id v6 = [v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v12 vehicle:v16];
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          [v12 dismissAlert];
          long long v15 = [(CRCarKitServiceAgent *)self outstandingEnableWiFiAlerts];
          [v15 removeObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_dismissReconnectionEnableWiFiAlertExceptForVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRCarKitServiceAgent *)self outstandingEnableWiFiAlerts];
  id v6 = [v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v12 vehicle:v16];
        unsigned __int8 v14 = [v13 isEqual:v4];

        if ((v14 & 1) == 0)
        {
          [v12 dismissAlert];
          long long v15 = [(CRCarKitServiceAgent *)self outstandingEnableWiFiAlerts];
          [v15 removeObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)vehicleIdentifierForCertificateSerial:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v26 = 0;
  unsigned int v8 = [(CRCarKitServiceAgent *)self _isRestricted:&v26];
  id v9 = v26;
  if (v8)
  {
    v7[2](v7, 0, v9);
    goto LABEL_16;
  }
  if (!v6)
  {
LABEL_15:
    uint64_t v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-99 userInfo:0];
    v7[2](v7, 0, v21);

    goto LABEL_16;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [(CRCarKitServiceAgent *)self vehicleStore];
  unsigned __int8 v11 = [v10 allStoredVehicles];

  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v12)
  {
LABEL_12:

    goto LABEL_15;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v23;
LABEL_6:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v23 != v14) {
      objc_enumerationMutation(v11);
    }
    long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
    long long v17 = [v16 certificateSerialNumber];
    unsigned __int8 v18 = [v6 isEqualToData:v17];

    if (v18) {
      break;
    }
    if (v13 == (id)++v15)
    {
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v13) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  long long v19 = [v16 identifier];
  uint64_t v20 = [v19 UUIDString];

  if (!v20) {
    goto LABEL_15;
  }
  ((void (**)(id, void *, id))v7)[2](v7, v20, 0);

LABEL_16:
}

- (void)_enhancedIntegrationUpdatedForMessagingVehicle:(id)a3 status:(unint64_t)a4
{
  id v6 = +[CRVehicle vehicleForMessagingVehicle:a3];
  [v6 setSupportsEnhancedIntegration:1];
  [v6 setEnhancedIntegrationStatus:a4];
  id v7 = [(CRCarKitServiceAgent *)self vehicleStore];
  unsigned int v8 = [v7 saveVehicle:v6];

  id v9 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v10 = CREnhancedIntegrationConsentDidChangeNotification;
  uint64_t v14 = CREnhancedIntegrationConsentDidChangeNotificationVehicleCertificateSerialKey;
  unsigned __int8 v11 = [v8 certificateSerialNumber];
  id v12 = v11;
  if (!v11)
  {
    id v12 = +[NSData data];
  }
  uint64_t v15 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v9 postNotificationName:v10 object:0 userInfo:v13];

  if (!v11) {
}
  }

- (void)_presentEnhancedIntegrationAlertForMessagingVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting enhanced integration alert", buf, 2u);
  }

  id v6 = [(CRMessagingVehicleAlert *)[CRVehicleEnhancedIntegrationAlert alloc] initWithMessagingVehicle:v4];
  *(void *)long long buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_100020C28;
  long long v23 = sub_100020C38;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100030254;
  v16[3] = &unk_1000BDB20;
  unsigned __int8 v18 = buf;
  v16[4] = self;
  id v7 = v6;
  long long v17 = v7;
  unsigned int v8 = objc_retainBlock(v16);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000302C8;
  v12[3] = &unk_1000BE190;
  void v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v10 = v4;
  id v14 = v10;
  uint64_t v15 = buf;
  unsigned __int8 v11 = objc_retainBlock(v12);
  if ([(CRMessagingVehicleAlert *)v9 presentAlertWithCompletion:v11]) {
    ((void (*)(void *))v8[2])(v8);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_dismissEnhancedIntegrationAlertForMessagingVehicle:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(CRCarKitServiceAgent *)self outstandingEnhancedIntegrationAlerts];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v11 = [v10 messagingVehicle];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12) {
          [v10 dismissAlert];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_dismissEnhancedIntegrationAlerts
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CRCarKitServiceAgent *)self outstandingEnhancedIntegrationAlerts];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) dismissAlert];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)bluetoothManager:(id)a3 didChangePowerState:(BOOL)a4
{
  if (a4)
  {
    uint64_t v5 = [(CRCarKitServiceAgent *)self BTPowerMessagingVehicle];
    if (v5)
    {
      id v6 = (void *)v5;
      long long v7 = [(CRCarKitServiceAgent *)self BTPowerStoredVehicle];

      if (v7)
      {
        id v9 = [(CRCarKitServiceAgent *)self BTPowerMessagingVehicle];
        long long v8 = [(CRCarKitServiceAgent *)self BTPowerStoredVehicle];
        [(CRCarKitServiceAgent *)self _beginWiredPairingWithMessagingVehicle:v9 storedVehicle:v8];
      }
    }
  }
}

- (void)bluetoothManager:(id)a3 requestsConfirmationForDeviceAddress:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
  if (v17)
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100030904;
    v22[3] = &unk_1000BE1B8;
    objc_copyWeak(&v25, &location);
    id v18 = v13;
    id v23 = v18;
    id v24 = v16;
    [(CRCarKitServiceAgent *)self setCurrentBluetoothConfirmationHandler:v22];
    long long v19 = CarPairingLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "showing numeric confirmation in pairing prompt flow", v21, 2u);
    }

    [v17 handleBluetoothPairingConfirmationRequestForDeviceIdentifier:v18 vehicleName:v14 numericCode:v15];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v20 = CarPairingLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000727A0();
    }
  }
}

- (void)bluetoothManager:(id)a3 failedPairingForDeviceAddress:(id)a4 name:(id)a5 didTimeout:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(CRCarKitServiceAgent *)self currentPromptFlowController];
  id v12 = CarPairingLogging();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "showing BT failure in pairing prompt flow", v14, 2u);
    }

    [v11 handleBluetoothPairingFailedForDeviceIdentifier:v9 vehicleName:v10 isTimeout:v6];
    [(CRCarKitServiceAgent *)self _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:v9 success:0 error:0];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10007283C();
    }
  }
}

- (void)bluetoothManager:(id)a3 completedPairingForDeviceAddress:(id)a4 deviceName:(id)a5
{
}

- (void)_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  id v8 = a5;
  uint64_t v9 = [(CRCarKitServiceAgent *)self currentBluetoothPairingCompletion];
  id v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, BOOL, id))(v9 + 16))(v9, v16, v6, v8);
    if (v6)
    {
      unsigned __int8 v11 = [(CRCarKitServiceAgent *)self connectionTimeServiceAgent];

      if (v11)
      {
        uint64_t v12 = CARCarKitWirelessPairingCreatedEvent;
        id v13 = +[NSDate date];
        id v14 = +[CARConnectionEvent eventWithName:v12 type:4 date:v13 payload:0];

        id v15 = [(CRCarKitServiceAgent *)self connectionTimeServiceAgent];
        [v15 recordConnectionEvent:v14 completion:&stru_1000BE1D8];
      }
    }
  }
  [(CRCarKitServiceAgent *)self setCurrentBluetoothPairingCompletion:0];
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 configuration];
  BOOL v6 = [v5 deviceIdentifier];

  long long v7 = [(CRCarKitServiceAgent *)self lastStartSessionDeviceID];
  unsigned int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    uint64_t v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling stoppedSessionForHostIdentifier: via last started deviceID", buf, 2u);
    }

    id v10 = [(CRCarKitServiceAgent *)self sessionRequestClient];
    [v10 stoppedSessionForHostIdentifier:v6];
  }
  else
  {
    unsigned __int8 v11 = [(CRCarKitServiceAgent *)self vehicleStore];
    uint64_t v12 = [v4 MFiCertificateSerialNumber];
    id v10 = [v11 vehicleForCertificateSerial:v12];

    if (v10)
    {
      id v13 = [v10 supportsStartSessionRequest];
      unsigned int v14 = [v13 BOOLValue];

      if (v14)
      {
        id v15 = CarGeneralLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "calling stoppedSessionForHostIdentifier: via vehicle record", v17, 2u);
        }

        id v16 = [(CRCarKitServiceAgent *)self sessionRequestClient];
        [v16 stoppedSessionForHostIdentifier:v6];
      }
    }
  }

  [(CRCarKitServiceAgent *)self setLastStartSessionDeviceID:0];
}

- (id)storedVehicleForSession:(id)a3
{
  id v4 = [a3 MFiCertificateSerialNumber];
  if (v4)
  {
    uint64_t v5 = [(CRCarKitServiceAgent *)self vehicleStore];
    BOOL v6 = [v5 vehicleForCertificateSerial:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setCarPlaySimulatorActive:(BOOL)a3
{
  if (self->_carPlaySimulatorActive != a3)
  {
    if (self->_carPlaySimulatorActive)
    {
      uint64_t v5 = [(CRCarKitServiceAgent *)self sessionRequestClient];
      [v5 cancelRequests];
    }
    self->_carPlaySimulatorActive = a3;
  }
}

- (CRHeadUnitPairingPresenterDelegate)headUnitPairingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headUnitPairingDelegate);

  return (CRHeadUnitPairingPresenterDelegate *)WeakRetained;
}

- (void)setHeadUnitPairingDelegate:(id)a3
{
}

- (BOOL)carPlaySimulatorActive
{
  return self->_carPlaySimulatorActive;
}

- (CRCarKitMonitoringServiceAgent)monitoringService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monitoringService);

  return (CRCarKitMonitoringServiceAgent *)WeakRetained;
}

- (void)setMonitoringService:(id)a3
{
}

- (CRSetupPromptDirectorAgent)setupPromptDirector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupPromptDirector);

  return (CRSetupPromptDirectorAgent *)WeakRetained;
}

- (void)setSetupPromptDirector:(id)a3
{
}

- (CRVehicleAssetManaging)vehicleAssetManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleAssetManager);

  return (CRVehicleAssetManaging *)WeakRetained;
}

- (void)setVehicleAssetManager:(id)a3
{
}

- (CRWirelessSessionAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setAssertionManager:(id)a3
{
}

- (CRBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (void)setBluetoothManager:(id)a3
{
}

- (CARMessagingServiceConnector)messagingConnector
{
  return self->_messagingConnector;
}

- (void)setMessagingConnector:(id)a3
{
}

- (CRCarPlayPreferences)preferencesManager
{
  return self->_preferencesManager;
}

- (void)setPreferencesManager:(id)a3
{
}

- (CRFeaturesAvailabilityAgent)featuresAvailabilityAgent
{
  return self->_featuresAvailabilityAgent;
}

- (void)setFeaturesAvailabilityAgent:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (CARSessionRequestClient)sessionRequestClient
{
  return self->_sessionRequestClient;
}

- (void)setSessionRequestClient:(id)a3
{
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
}

- (CRWiFiCarManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (CRPairingPromptFlowController)currentPromptFlowController
{
  return self->_currentPromptFlowController;
}

- (void)setCurrentPromptFlowController:(id)a3
{
}

- (id)currentBluetoothConfirmationHandler
{
  return self->_currentBluetoothConfirmationHandler;
}

- (void)setCurrentBluetoothConfirmationHandler:(id)a3
{
}

- (id)currentBluetoothPairingCompletion
{
  return self->_currentBluetoothPairingCompletion;
}

- (void)setCurrentBluetoothPairingCompletion:(id)a3
{
}

- (NSMutableArray)outstandingApprovalAlerts
{
  return self->_outstandingApprovalAlerts;
}

- (void)setOutstandingApprovalAlerts:(id)a3
{
}

- (NSMutableArray)outstandingPairingAlerts
{
  return self->_outstandingPairingAlerts;
}

- (void)setOutstandingPairingAlerts:(id)a3
{
}

- (NSMutableArray)outstandingEnableWiFiAlerts
{
  return self->_outstandingEnableWiFiAlerts;
}

- (void)setOutstandingEnableWiFiAlerts:(id)a3
{
}

- (NSMutableArray)outstandingEnhancedIntegrationAlerts
{
  return self->_outstandingEnhancedIntegrationAlerts;
}

- (void)setOutstandingEnhancedIntegrationAlerts:(id)a3
{
}

- (NSNumber)cachedCarPlayAllowedChangeValue
{
  return self->_cachedCarPlayAllowedChangeValue;
}

- (void)setCachedCarPlayAllowedChangeValue:(id)a3
{
  self->_cachedCarPlayAllowedChangeValue = (NSNumber *)a3;
}

- (NSMutableDictionary)serviceCountDuringAlertForBluetoothAddress
{
  return self->_serviceCountDuringAlertForBluetoothAddress;
}

- (void)setServiceCountDuringAlertForBluetoothAddress:(id)a3
{
}

- (NSString)lastStartSessionDeviceID
{
  return self->_lastStartSessionDeviceID;
}

- (void)setLastStartSessionDeviceID:(id)a3
{
}

- (CRMessagingServiceVehicleRepresenting)BTPowerMessagingVehicle
{
  return self->_BTPowerMessagingVehicle;
}

- (void)setBTPowerMessagingVehicle:(id)a3
{
}

- (CRVehicle)BTPowerStoredVehicle
{
  return self->_BTPowerStoredVehicle;
}

- (void)setBTPowerStoredVehicle:(id)a3
{
}

- (CRLoggingChannelManager)loggingChannelManager
{
  return self->_loggingChannelManager;
}

- (CARConnectionTimeServiceAgent)connectionTimeServiceAgent
{
  return self->_connectionTimeServiceAgent;
}

- (void)setConnectionTimeServiceAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimeServiceAgent, 0);
  objc_storeStrong((id *)&self->_loggingChannelManager, 0);
  objc_storeStrong((id *)&self->_BTPowerStoredVehicle, 0);
  objc_storeStrong((id *)&self->_BTPowerMessagingVehicle, 0);
  objc_storeStrong((id *)&self->_lastStartSessionDeviceID, 0);
  objc_storeStrong((id *)&self->_serviceCountDuringAlertForBluetoothAddress, 0);
  objc_storeStrong((id *)&self->_outstandingEnhancedIntegrationAlerts, 0);
  objc_storeStrong((id *)&self->_outstandingEnableWiFiAlerts, 0);
  objc_storeStrong((id *)&self->_outstandingPairingAlerts, 0);
  objc_storeStrong((id *)&self->_outstandingApprovalAlerts, 0);
  objc_storeStrong(&self->_currentBluetoothPairingCompletion, 0);
  objc_storeStrong(&self->_currentBluetoothConfirmationHandler, 0);
  objc_storeStrong((id *)&self->_currentPromptFlowController, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_sessionRequestClient, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_featuresAvailabilityAgent, 0);
  objc_storeStrong((id *)&self->_preferencesManager, 0);
  objc_storeStrong((id *)&self->_messagingConnector, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_destroyWeak((id *)&self->_vehicleAssetManager);
  objc_destroyWeak((id *)&self->_setupPromptDirector);
  objc_destroyWeak((id *)&self->_monitoringService);

  objc_destroyWeak((id *)&self->_headUnitPairingDelegate);
}

@end