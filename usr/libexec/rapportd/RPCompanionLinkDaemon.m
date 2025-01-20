@interface RPCompanionLinkDaemon
+ (id)sharedCompanionLinkDaemon;
- (BOOL)_allowMessageForRegistrationOptions:(id)a3 cnx:(id)a4;
- (BOOL)_allowStreamRequest:(id)a3 xpcCnx:(id)a4 rpCnx:(id)a5;
- (BOOL)_clientBLEActionDiscoveryShouldRun;
- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun;
- (BOOL)_clientBLENeedsCLinkAdvertiserShouldRun;
- (BOOL)_clientBLETriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 error:(id *)a5;
- (BOOL)_clientBonjourAWDLBrowserShouldRun;
- (BOOL)_clientBonjourCheckFoundPairedDevice:(id)a3 publicID:(id)a4;
- (BOOL)_clientBonjourCheckLostPairedDevice:(id)a3 publicID:(id)a4;
- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4;
- (BOOL)_clientConnectionStartOnDemand:(id)a3 xpcCnx:(id)a4 error:(id *)a5;
- (BOOL)_clientConnectionStartUnauth:(id)a3 client:(id)a4 publicID:(id)a5 xpcCnx:(id)a6 error:(id *)a7;
- (BOOL)_clientShouldFindNonSameAccountDevices;
- (BOOL)_destinationID:(id)a3 matchesCnx:(id)a4;
- (BOOL)_destinationID:(id)a3 matchesProxyDeviceOnCnx:(id)a4;
- (BOOL)_haveActiveClientConnectionsOnAWDL;
- (BOOL)_haveActiveServerConnectionsOnAWDL;
- (BOOL)_homeKitAuthMatchForBonjourDevice:(id)a3;
- (BOOL)_proxyDevice:(id)a3 isEqualTo:(id)a4;
- (BOOL)_proxyDevice:(id)a3 receivedRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 cnx:(id)a8;
- (BOOL)_receivedRequestID:(id)a3 onXPCCnx:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 unauth:(BOOL)a8 rpCnx:(id)a9;
- (BOOL)_serverBLENeedsCLinkScannerScreenOff;
- (BOOL)_serverBonjourAWDLAdvertiserShouldRun;
- (BOOL)_serverBonjourAWDLShouldRun;
- (BOOL)_serverBonjourShouldRun;
- (BOOL)_serverNearbyActionV2DiscoveryShouldRun;
- (BOOL)_serverNearbyInfoV2DiscoveryShouldRun;
- (BOOL)_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:(int)a3;
- (BOOL)_serverTCPHasActiveConnections;
- (BOOL)_shouldReceiveActivityLevelOverWiFi:(int64_t)a3;
- (BOOL)_shouldSendActivityLevelOverWiFi;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)createDeviceToEndpointMappingForDeviceID:(id)a3 endpointUUID:(id *)a4 error:(id *)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)isNearbyActionV2AdvertiserActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 error:(id *)a5;
- (NSDictionary)destinationIdentifierModelMap;
- (NSDictionary)destinationIdentifierRelMap;
- (NSMutableDictionary)activeSessions;
- (NSMutableSet)activeServers;
- (NSMutableSet)rbsPIDSet;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkDaemon)init;
- (RPCompanionLinkDevice)localDeviceInfo;
- (RPHomeKitManager)rpHomeKitManager;
- (id)_addProxyIdentifier:(id)a3 toDictionary:(id)a4;
- (id)_checkForProxyOrLocalDestinations:(id)a3 eventID:(id)a4 event:(id)a5 options:(id)a6 completion:(id)a7;
- (id)_clientBLENeedsCLinkTargetDevice;
- (id)_clientCreateConnection:(id)a3 xpcCnx:(id)a4 error:(id *)a5;
- (id)_clientShouldConnectOverBonjour:(id)a3 device:(id)a4 identities:(id)a5;
- (id)_contextCollectorDevice;
- (id)_discoveryNonceOrRotate:(BOOL)a3;
- (id)_eventForHomeHubDevice:(id)a3;
- (id)_filterHomeKitUserIdentifiers:(id)a3;
- (id)_findDeviceWithDevice:(id)a3 deviceMap:(id)a4 matchedIdentifier:(id *)a5;
- (id)_findExistingActiveDevice:(id)a3;
- (id)_findMatchingAWDLBonjourDevice:(id)a3;
- (id)_findWiFiConnectionByID:(id)a3;
- (id)_getAltDSID;
- (id)_getAppleID;
- (id)_homeKitDecryptRotatingIDForBonjourDevice:(id)a3;
- (id)_serverBonjourAuthTagString;
- (id)_serverBonjourAuthTagStringWithData:(id)a3;
- (id)_serverBonjourTempAuthTagStringWithData:(id)a3;
- (id)_serverTCPHandleConnectionStarted:(id)a3;
- (id)_xpcConnections:(id)a3 withControlFlags:(unint64_t)a4;
- (id)descriptionWithLevel:(int)a3;
- (id)findAuthAWDLPairingModeDeviceForIdentifier:(id)a3;
- (id)findConnectedDeviceForIdentifier:(id)a3 controlFlags:(unint64_t)a4 cnx:(id *)a5;
- (id)findDeviceFromID:(id)a3;
- (id)findServerClientFromID:(id)a3 senderIDS:(id)a4;
- (id)findUnauthDeviceForIdentifier:(id)a3;
- (id)homeHubDeviceForLaunchInstanceID:(id)a3;
- (id)logDictionaryOfStringArrays:(id)a3 withPrefix:(id)a4;
- (int)_airPlayLeaderStateUncached;
- (int)_localMediaAccessControlSetting;
- (int64_t)_sessionsActiveOnConnection:(id)a3 xpcConnection:(id)a4;
- (unint64_t)_nearbyActionDeviceActionTypes;
- (unsigned)_controlFlagsToNearbyActionType:(unint64_t)a3;
- (void)_activate;
- (void)_activeDeviceAdded:(id)a3 cnx:(id)a4;
- (void)_activeDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_activeDeviceChangedForConnection:(id)a3 bonjourDevice:(id)a4;
- (void)_activeDeviceRemoved:(id)a3 cnx:(id)a4;
- (void)_addApplicationPID:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_bleServerHandleConnectionEnded:(id)a3;
- (void)_bleServerHandleConnectionStarted:(id)a3;
- (void)_btPipeConnectionEnded:(id)a3;
- (void)_btPipeConnectionStart;
- (void)_btPipeEnsureStarted;
- (void)_btPipeEnsureStopped;
- (void)_btPipeHandleStateChanged:(id)a3;
- (void)_btPipeSetup:(id)a3 withPriority:(int)a4;
- (void)_btPipeSyncKeysIfNeeded;
- (void)_btPipeTearDown:(id)a3;
- (void)_clientBLEActionDiscoveryEnsureStarted;
- (void)_clientBLEActionDiscoveryEnsureStopped;
- (void)_clientBLEDiscoveryDeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4;
- (void)_clientBLEDiscoveryDeviceLost:(id)a3 force:(BOOL)a4 deviceFlags:(unsigned __int8)a5;
- (void)_clientBLEDiscoveryEnsureStarted;
- (void)_clientBLEDiscoveryEnsureStopped;
- (void)_clientBLEFamilyDeviceReportChanges;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped;
- (void)_clientBLENearbyActionV2AdvertiserRestart;
- (void)_clientBLENearbyActionV2AdvertiserUpdate;
- (void)_clientBLENeedsCLinkAdvertiserEnsureStarted;
- (void)_clientBLENeedsCLinkAdvertiserEnsureStopped;
- (void)_clientBLENeedsCLinkAdvertiserRestart;
- (void)_clientBLENeedsCLinkAdvertiserUpdate;
- (void)_clientBonjourAWDLBrowserEnsureStarted;
- (void)_clientBonjourAWDLBrowserEnsureStopped;
- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3;
- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3;
- (void)_clientBonjourEnsureStarted;
- (void)_clientBonjourEnsureStopped;
- (void)_clientBonjourFoundUnauthDevice:(id)a3 isAWDLDevice:(BOOL)a4;
- (void)_clientBonjourLostDevice:(id)a3;
- (void)_clientBonjourLostUnauthDevice:(id)a3;
- (void)_clientBonjourReevaluateAllDevices;
- (void)_clientBonjourReevaluateUnauthDevices;
- (void)_clientConnectionEnded:(id)a3 uniqueID:(id)a4;
- (void)_clientConnectionEndedUnauth:(id)a3 publicID:(id)a4;
- (void)_clientConnectionStart:(id)a3 controlFlags:(unint64_t)a4 uniqueID:(id)a5 identity:(id)a6;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_clientOnDemandAWDLDiscoveryStartForXPC:(id)a3;
- (void)_clientOnDemandAWDLDiscoveryTimedOutForDevice:(id)a3 xpcCnx:(id)a4;
- (void)_clientOnDemandConnectionEnded:(id)a3 uniqueID:(id)a4;
- (void)_clientOnDemandDiscoveryStart:(id)a3 xpcCnx:(id)a4;
- (void)_clientPurgeUnauthAWDLDevices;
- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)_clientReportFoundDevice:(id)a3;
- (void)_clientReportLostDevice:(id)a3;
- (void)_clientReportUINoteDevice:(id)a3;
- (void)_clientSendActivityLevelOverWiFiIfNecessary;
- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3;
- (void)_clientUINoteAction:(int)a3 error:(id)a4 device:(id)a5;
- (void)_clientUINoteProcessPending;
- (void)_clientUINoteStart:(id)a3;
- (void)_configureConnectionForPairing:(id)a3;
- (void)_connectionConfigureCommon:(id)a3;
- (void)_connectionStateChanged:(int)a3 cnx:(id)a4;
- (void)_createDestinationIdentifierMaps;
- (void)_createRequestEntryForXid:(id)a3 requestID:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_deliverEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7 outError:(id *)a8;
- (void)_disconnectRemovedSharedHomeDevices;
- (void)_disconnectUnauthConnections;
- (void)_disconnectUnpairedDevices;
- (void)_duetSyncEnsureStarted;
- (void)_duetSyncEnsureStopped;
- (void)_existingProxyDeviceUpdated:(id)a3 event:(id)a4 isLocal:(BOOL)a5;
- (void)_forEachConnectionWithHandler:(id)a3;
- (void)_forEachMatchingDestinationID:(id)a3 handler:(id)a4;
- (void)_forEachUniqueMatchingDestinationID:(id)a3 handler:(id)a4;
- (void)_handleContextCollectorProxyRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleContextCollectorRequest:(id)a3 responseHandler:(id)a4;
- (void)_hidEnsureStarted;
- (void)_hidEnsureStopped;
- (void)_homeHubDeviceAdded:(id)a3;
- (void)_homeHubDeviceRemoved:(id)a3;
- (void)_homeKitEnsureStarted;
- (void)_homeKitEnsureStopped;
- (void)_homeKitGetPairingIdentities;
- (void)_homeKitGetUserInfo:(id)a3;
- (void)_homeKitIdentityUpdated:(id)a3 error:(id)a4;
- (void)_homeKitPairingUpdated:(id)a3;
- (void)_homeKitSelfAccessoryMediaAccessUpdated;
- (void)_homeKitSelfAccessoryMediaSystemUpdated:(int)a3;
- (void)_homeKitSelfAccessoryUpdated;
- (void)_homeKitUpdateInfo:(BOOL)a3;
- (void)_homeKitUpdateUserIdentifiers;
- (void)_interestReceived:(id)a3 cnx:(id)a4;
- (void)_interestRemoveForCnx:(id)a3;
- (void)_interestSendEventID:(id)a3 event:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_localDeviceCleanup;
- (void)_localDeviceUpdate;
- (void)_mediaControlEnsureStarted;
- (void)_mediaControlEnsureStopped;
- (void)_mediaRemoteIDGet;
- (void)_mediaRouteIDGet;
- (void)_miscEnsureStarted;
- (void)_miscEnsureStopped;
- (void)_miscHandleLaunchAppRequest:(id)a3 responseHandler:(id)a4;
- (void)_miscHandleSpeakRequest:(id)a3 responseHandler:(id)a4;
- (void)_personalDeviceUpdate;
- (void)_processPendingLostBLEDevices;
- (void)_processPendingLostNeedsCLinkDevices;
- (void)_proxyDevice:(id)a3 loopbackRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)_proxyDeviceAdd:(id)a3 options:(id)a4 eventID:(id)a5 deviceInfo:(id)a6 cnx:(id)a7;
- (void)_proxyDeviceListUpdated:(id)a3 content:(id)a4 options:(id)a5 cnx:(id)a6;
- (void)_proxyDeviceRemove:(id)a3 options:(id)a4 cnx:(id)a5;
- (void)_proxyLocalDeviceUpdateOnConnection:(id)a3 launchInstanceID:(id)a4;
- (void)_reachabilityEnsureStarted;
- (void)_reachabilityEnsureStopped;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7;
- (void)_receivedEventID:(id)a3 onXPCCnx:(id)a4 event:(id)a5 options:(id)a6 unauth:(BOOL)a7 rpCnx:(id)a8;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 unauth:(BOOL)a7 cnx:(id)a8;
- (void)_registerConnectionRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_removeApplicationPID:(id)a3;
- (void)_reportXPCMatchingDiscoveryCLink;
- (void)_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:(id)a3;
- (void)_reportXPCMatchingDiscoveryUINoteDevice:(id)a3;
- (void)_schedulePendingLostBLEDeviceTimer;
- (void)_schedulePendingLostNeedsCLinkDeviceTimer;
- (void)_sendProxyDeviceUpdateToPeer:(id)a3;
- (void)_serverBLENeedsCLinkScannerDeviceFound:(id)a3;
- (void)_serverBLENeedsCLinkScannerDeviceLost:(id)a3;
- (void)_serverBLENeedsCLinkScannerEnsureStarted;
- (void)_serverBLENeedsCLinkScannerEnsureStopped;
- (void)_serverBTAddressChanged;
- (void)_serverBTAddressMonitorEnsureStarted;
- (void)_serverBTAddressMonitorEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserEnsureStarted;
- (void)_serverBonjourAWDLAdvertiserEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserUpdateTXT;
- (void)_serverBonjourEnsureStarted;
- (void)_serverBonjourEnsureStopped;
- (void)_serverBonjourUpdateTXT;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_serverNearbyActionV2DiscoveryEnsureStarted;
- (void)_serverNearbyActionV2DiscoveryEnsureStopped;
- (void)_serverNearbyInfoV2DeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4;
- (void)_serverNearbyInfoV2DeviceLost:(id)a3 idsIdentifier:(id)a4 force:(BOOL)a5 deviceFlags:(unsigned __int8)a6;
- (void)_serverNearbyInfoV2DiscoveryEnsureStarted;
- (void)_serverNearbyInfoV2DiscoveryEnsureStopped;
- (void)_serverReceivedNeedsAWDLEvent:(id)a3 event:(id)a4;
- (void)_serverTCPEnsureStarted;
- (void)_serverTCPEnsureStopped;
- (void)_serverTCPHandleConnectionEnded:(id)a3;
- (void)_serverTCPRemoveConnectionsWithIdentifier:(id)a3 exceptConnection:(id)a4;
- (void)_sessionHandlePeerDisconnect:(id)a3;
- (void)_sessionHandleStartRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6;
- (void)_sessionHandleStopRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6;
- (void)_siriEnsureStarted;
- (void)_siriEnsureStopped;
- (void)_stereoDeviceUpdate:(int)a3;
- (void)_update;
- (void)_updateAssertions;
- (void)_updateForXPCClientChange;
- (void)_updateForXPCServerChange;
- (void)_updateHomeHubDevices:(id)a3;
- (void)_updateRBSProcessMonitor;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)interestDeregisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5;
- (void)interestRegisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prefsChanged;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 xpcID:(unsigned int)a6 options:(id)a7 responseHandler:(id)a8;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)sessionStartSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 destinationID:(id)a6 completion:(id)a7;
- (void)sessionStopSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 completion:(id)a6;
- (void)setActiveServers:(id)a3;
- (void)setActiveSessions:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setRbsPIDSet:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation RPCompanionLinkDaemon

+ (id)sharedCompanionLinkDaemon
{
  if (qword_100142BD0 != -1) {
    dispatch_once(&qword_100142BD0, &stru_100121328);
  }
  v2 = (void *)qword_100142BC8;

  return v2;
}

- (RPCompanionLinkDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPCompanionLinkDaemon;
  v2 = [(RPCompanionLinkDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_coreDeviceChangedNotifier = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_needsPrimaryAppleIDUpdate = 1;
    [(RPCompanionLinkDaemon *)v3 _createDestinationIdentifierMaps];
    RandomBytes();
    RandomBytes();
    v4 = v3;
  }

  return v3;
}

- (void)_createDestinationIdentifierMaps
{
  v9[0] = @"rapport:rdid:ModelAppleTV";
  v9[1] = @"rapport:rdid:ModelAppleTV";
  v10[0] = &stru_100121368;
  v10[1] = &stru_100121388;
  v9[2] = @"rapport:rdid:ModelAppleTV";
  v9[3] = @"rapport:rdid:ModelAppleTV";
  v10[2] = &stru_1001213A8;
  v10[3] = &stru_1001213C8;
  v9[4] = @"rapport:rdid:ModelAppleTV";
  v9[5] = @"rapport:rdid:ModelAppleTV";
  v10[4] = &stru_1001213E8;
  v10[5] = &stru_100121408;
  v9[6] = @"rapport:rdid:ModelAppleTV";
  v10[6] = &stru_100121428;
  v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];
  destinationIdentifierModelMap = self->_destinationIdentifierModelMap;
  self->_destinationIdentifierModelMap = v3;

  v7[0] = @"rapport:rdid:RelationMyiCloud";
  v7[1] = @"rapport:rdid:RelationFamily";
  v8[0] = &stru_100121468;
  v8[1] = &stru_100121488;
  v7[2] = @"rapport:rdid:RelationFriend";
  v7[3] = @"rapport:rdid:RelationSharedHome";
  v8[2] = &stru_1001214A8;
  v8[3] = &stru_1001214C8;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  destinationIdentifierRelMap = self->_destinationIdentifierRelMap;
  self->_destinationIdentifierRelMap = v5;
}

- (id)findServerClientFromID:(id)a3 senderIDS:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000F400;
  v20 = sub_10000F410;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F418;
  v12[3] = &unk_1001214F0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v16;
  [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)findDeviceFromID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10000F400;
  id v14 = sub_10000F410;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F7E4;
  v9[3] = &unk_100121518;
  v9[4] = &v10;
  [(RPCompanionLinkDaemon *)self _forEachMatchingDestinationID:v4 handler:v9];
  v5 = (void *)v11[5];
  if (v5)
  {
    if (dword_100140E48 > 30) {
      goto LABEL_11;
    }
    if (dword_100140E48 != -1) {
      goto LABEL_4;
    }
    if (_LogCategory_Initialize())
    {
      v5 = (void *)v11[5];
LABEL_4:
      id v8 = [v5 name];
      LogPrintF();
    }
  }
  else if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_11:
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 >= 21)
  {
    NSPrintF();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_128;
  }
  uint64_t v263 = 0;
  v264 = &v263;
  uint64_t v265 = 0x3032000000;
  v266 = sub_10000F400;
  v267 = sub_10000F410;
  id v268 = 0;
  BOOL v6 = sub_10000EACC();
  id v7 = (id *)(v264 + 5);
  id obj = (id)v264[5];
  NSAppendPrintF();
  objc_storeStrong(v7, obj);
  id v8 = (id *)(v264 + 5);
  id v261 = (id)v264[5];
  mach_continuous_time();
  UpTicksToSeconds();
  mach_absolute_time();
  uint64_t v160 = UpTicksToSeconds();
  NSAppendPrintF();
  objc_storeStrong(v8, v261);
  v166 = (void *)GestaltCopyAnswer();
  v167 = (void *)WiFiCopyCurrentNetworkInfoEx();
  CFStringGetTypeID();
  v165 = CFDictionaryGetTypedValue();
  id v9 = (id *)(v264 + 5);
  id v260 = (id)v264[5];
  sub_10000EB7C((uint64_t)", Nm ", v6);
  NSAppendPrintF();
  objc_storeStrong(v9, v260);
  uint64_t v10 = (id *)(v264 + 5);
  id v259 = (id)v264[5];
  sub_10000EB7C((uint64_t)", WiFi ", v6);
  NSAppendPrintF();
  objc_storeStrong(v10, v259);
  v11 = (id *)(v264 + 5);
  id v258 = (id)v264[5];
  sub_10000EB7C((uint64_t)", AID ", v6);
  v138 = [(RPCompanionLinkDaemon *)self _getAppleID];
  NSAppendPrintF();
  objc_storeStrong(v11, v258);

  v163 = [(CUHomeKitManager *)self->_homeKitManager selfAccessory];
  v168 = [v163 home];
  if (v168)
  {
    uint64_t v12 = (id *)(v264 + 5);
    id v257 = (id)v264[5];
    sub_10000EB7C((uint64_t)", Hm ", v6);
    v139 = [v168 name];
    NSAppendPrintF();
    objc_storeStrong(v12, v257);
  }
  if (self->_prefHomeKitEnabled)
  {
    id v13 = (id *)(v264 + 5);
    id v256 = (id)v264[5];
    NSAppendPrintF();
    objc_storeStrong(v13, v256);
  }
  if (self->_prefCommunal)
  {
    id v14 = (id *)(v264 + 5);
    id v255 = (id)v264[5];
    sub_10000EB7C((uint64_t)", MeDev F ", v6);
    v140 = [(CUSystemMonitor *)self->_systemMonitor meDeviceFMFDeviceID];
    NSAppendPrintF();
    objc_storeStrong(v14, v255);

    id v15 = (id *)(v264 + 5);
    id v254 = (id)v264[5];
    sub_10000EB7C((uint64_t)" I ", v6);
    v141 = [(CUSystemMonitor *)self->_systemMonitor meDeviceIDSDeviceID];
    NSAppendPrintF();
    objc_storeStrong(v15, v254);

    uint64_t v16 = (id *)(v264 + 5);
    id v253 = (id)v264[5];
    sub_10000EB7C((uint64_t)" Nm ", v6);
    v142 = [(CUSystemMonitor *)self->_systemMonitor meDeviceName];
    NSAppendPrintF();
    objc_storeStrong(v16, v253);
  }
  if (a3 <= 10 && self->_prefHomeKitEnabled)
  {
    v17 = (id *)(v264 + 5);
    id v252 = (id)v264[5];
    homeKitIRK = self->_homeKitIRK;
    homeKitRotatingID = self->_homeKitRotatingID;
    NSAppendPrintF();
    objc_storeStrong(v17, v252);
LABEL_13:
    uint64_t v18 = (id *)(v264 + 5);
    id v251 = (id)v264[5];
    NSAppendPrintF();
    objc_storeStrong(v18, v251);
    goto LABEL_14;
  }
  if (a3 <= 10) {
    goto LABEL_13;
  }
LABEL_14:
  v19 = (id *)(v264 + 5);
  id v250 = (id)v264[5];
  NSAppendPrintF();
  objc_storeStrong(v19, v250);
  if (a3 >= 11) {
    int v20 = 50;
  }
  else {
    int v20 = 0;
  }
  id v21 = (id *)(v264 + 5);
  id v249 = (id)v264[5];
  v143 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong(v21, v249);

  if (a3 >= 11) {
    int v22 = 50;
  }
  else {
    int v22 = 30;
  }
  v23 = self->_bleDiscovery;
  if (v23)
  {
    v24 = (id *)(v264 + 5);
    id v248 = (id)v264[5];
    v143 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v24, v248);
  }
  v25 = self->_bleNeedsCLinkAdvertiser;
  if (v25)
  {
    v26 = (id *)(v264 + 5);
    id v247 = (id)v264[5];
    v143 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v26, v247);
  }
  v27 = self->_bleNeedsCLinkAdvertiserProcessName;
  v28 = v27;
  if (v27)
  {
    v29 = (id *)(v264 + 5);
    id v246 = (id)v264[5];
    v143 = v27;
    NSAppendPrintF();
    objc_storeStrong(v29, v246);
  }

  v30 = self->_bleNeedsCLinkScanner;
  if (v30)
  {
    v31 = (id *)(v264 + 5);
    id v245 = (id)v264[5];
    v143 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v31, v245);
  }
  bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
  v243[0] = _NSConcreteStackBlock;
  v243[1] = 3221225472;
  v243[2] = sub_100011024;
  v243[3] = &unk_100121540;
  v243[4] = &v263;
  int v244 = v22;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleNeedsCLinkDevices, "enumerateKeysAndObjectsUsingBlock:", v243, v143);
  v33 = self->_bleNearbyActionV2Advertiser;
  v34 = v33;
  if (v33)
  {
    v35 = (id *)(v264 + 5);
    id v242 = (id)v264[5];
    v144 = (char *)v33;
    NSAppendPrintF();
    objc_storeStrong(v35, v242);
  }

  v36 = self->_bleNearbyActionV2AdvertiserProcessName;
  v37 = v36;
  if (v36)
  {
    v38 = (id *)(v264 + 5);
    id v241 = (id)v264[5];
    v144 = (char *)v36;
    NSAppendPrintF();
    objc_storeStrong(v38, v241);
  }

  v39 = self->_bleNearbyActionV2Discovery;
  v40 = v39;
  if (v39)
  {
    v41 = (id *)(v264 + 5);
    id v240 = (id)v264[5];
    v144 = (char *)v39;
    NSAppendPrintF();
    objc_storeStrong(v41, v240);
  }

  v42 = self->_bleNearbyInfoV2Discovery;
  v43 = v42;
  if (v42)
  {
    v44 = (id *)(v264 + 5);
    id v239 = (id)v264[5];
    v144 = (char *)v42;
    NSAppendPrintF();
    objc_storeStrong(v44, v239);
  }

  if (self->_bonjourAWDLAdvertiseForPairing)
  {
    v45 = (id *)(v264 + 5);
    id v238 = (id)v264[5];
    v144 = "yes";
    NSAppendPrintF();
    objc_storeStrong(v45, v238);
  }
  v46 = self->_bonjourAdvertiser;
  if (v46)
  {
    v47 = (id *)(v264 + 5);
    id v237 = (id)v264[5];
    CUDescriptionWithLevel();
    v144 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    objc_storeStrong(v47, v237);
  }
  v48 = self->_bonjourAWDLAdvertiser;
  if (v48)
  {
    v49 = (id *)(v264 + 5);
    id v236 = (id)v264[5];
    CUDescriptionWithLevel();
    v144 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    objc_storeStrong(v49, v236);
  }
  if (self->_bonjourAWDLAdvertiserForce)
  {
    v50 = (id *)(v264 + 5);
    id v235 = (id)v264[5];
    NSAppendPrintF();
    objc_storeStrong(v50, v235);
  }
  v51 = self->_bonjourBrowser;
  if (v51)
  {
    v52 = (id *)(v264 + 5);
    id v234 = (id)v264[5];
    CUDescriptionWithLevel();
    v144 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    objc_storeStrong(v52, v234);
  }
  v53 = self->_bonjourBrowserAWDL;
  if (v53)
  {
    v54 = (id *)(v264 + 5);
    id v233 = (id)v264[5];
    CUDescriptionWithLevel();
    v144 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    objc_storeStrong(v54, v233);
  }
  if (self->_bonjourBrowserAWDLForce)
  {
    v55 = (id *)(v264 + 5);
    id v232 = (id)v264[5];
    NSAppendPrintF();
    objc_storeStrong(v55, v232);
  }
  v56 = self->_bonjourBrowserAWDLProcess;
  v57 = v56;
  if (v56)
  {
    v58 = (id *)(v264 + 5);
    id v231 = (id)v264[5];
    v144 = (char *)v56;
    NSAppendPrintF();
    objc_storeStrong(v58, v231);
  }

  v59 = self->_btPipe;
  v60 = v59;
  if (v59)
  {
    v61 = (id *)(v264 + 5);
    id v230 = (id)v264[5];
    v144 = (char *)v59;
    NSAppendPrintF();
    objc_storeStrong(v61, v230);
  }

  v62 = self->_btPipeHighPriority;
  v63 = v62;
  if (v62)
  {
    v64 = (id *)(v264 + 5);
    id v229 = (id)v264[5];
    v144 = (char *)v62;
    NSAppendPrintF();
    objc_storeStrong(v64, v229);
  }

  v65 = self->_netLinkManager;
  if (v65)
  {
    v66 = (id *)(v264 + 5);
    id v228 = (id)v264[5];
    CUDescriptionWithLevel();
    v144 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    objc_storeStrong(v66, v228);
  }
  v67 = self->_tcpServer;
  v68 = v67;
  if (v67)
  {
    v69 = (id *)(v264 + 5);
    id v227 = (id)v264[5];
    v70 = v67;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v71 = [(CUTCPServer *)v70 detailedDescription];
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        [(CUTCPServer *)v70 descriptionWithLevel:20];
      }
      else {
      uint64_t v71 = NSPrintF();
      }
    }
    v72 = (char *)v71;

    v144 = v72;
    NSAppendPrintF();
    objc_storeStrong(v69, v227);
  }
  if (self->_hidDaemon)
  {
    uint64_t v226 = 0;
    NSAppendPrintF();
    id v73 = 0;
  }
  else
  {
    id v73 = 0;
  }
  if (self->_mediaControlDaemon)
  {
    id v225 = v73;
    NSAppendPrintF();
    id v74 = v73;

    id v73 = v74;
  }
  if (self->_siriDaemon)
  {
    id v224 = v73;
    NSAppendPrintF();
    v75 = (char *)v73;
  }
  else
  {
    v75 = (char *)v73;
  }
  v164 = v75;
  if (v75)
  {
    v76 = (id *)(v264 + 5);
    id v223 = (id)v264[5];
    v144 = v164;
    NSAppendPrintF();
    objc_storeStrong(v76, v223);
  }
  BOOL v77 = self->_btPipeConnection != 0;
  v78 = (char *)[(NSMutableDictionary *)self->_bleClientConnections count];
  id v79 = [(NSMutableDictionary *)self->_tcpClientConnections count];
  v80 = &v78[v77
           + (unint64_t)[(NSMutableDictionary *)self->_tcpOnDemandClientConnections count]
           + (void)v79];
  if (v80)
  {
    v81 = (id *)(v264 + 5);
    id v222 = (id)v264[5];
    v145 = v80;
    NSAppendPrintF();
    objc_storeStrong(v81, v222);
  }
  if (self->_btPipeConnection)
  {
    v82 = (id *)(v264 + 5);
    id v221 = (id)v264[5];
    v145 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v82, v221);
  }
  tcpClientConnections = self->_tcpClientConnections;
  v219[0] = _NSConcreteStackBlock;
  v219[1] = 3221225472;
  v219[2] = sub_1000110AC;
  v219[3] = &unk_100121568;
  v219[4] = &v263;
  int v220 = v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpClientConnections, "enumerateKeysAndObjectsUsingBlock:", v219, v145);
  tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;
  v217[0] = _NSConcreteStackBlock;
  v217[1] = 3221225472;
  v217[2] = sub_100011118;
  v217[3] = &unk_100121568;
  v217[4] = &v263;
  int v218 = v20;
  [(NSMutableDictionary *)tcpOnDemandClientConnections enumerateKeysAndObjectsUsingBlock:v217];
  bleClientConnections = self->_bleClientConnections;
  v215[0] = _NSConcreteStackBlock;
  v215[1] = 3221225472;
  v215[2] = sub_100011184;
  v215[3] = &unk_100121568;
  v215[4] = &v263;
  int v216 = v20;
  [(NSMutableDictionary *)bleClientConnections enumerateKeysAndObjectsUsingBlock:v215];
  v86 = (char *)[(NSMutableSet *)self->_bleServerConnections count];
  v87 = &v86[(void)[(NSMutableSet *)self->_tcpServerConnections count]];
  if (v87)
  {
    v88 = (id *)(v264 + 5);
    id v214 = (id)v264[5];
    v146 = v87;
    NSAppendPrintF();
    objc_storeStrong(v88, v214);
  }
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  v89 = self->_tcpServerConnections;
  v90 = (char *)[(NSMutableSet *)v89 countByEnumeratingWithState:&v210 objects:v271 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v211;
    do
    {
      for (i = 0; i != v90; ++i)
      {
        if (*(void *)v211 != v91) {
          objc_enumerationMutation(v89);
        }
        v93 = (id *)(v264 + 5);
        id v209 = (id)v264[5];
        v147 = CUDescriptionWithLevel();
        NSAppendPrintF();
        objc_storeStrong(v93, v209);
      }
      v90 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v210, v271, 16, v147);
    }
    while (v90);
  }

  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  v94 = self->_bleServerConnections;
  v95 = (char *)[(NSMutableSet *)v94 countByEnumeratingWithState:&v205 objects:v270 count:16];
  if (v95)
  {
    uint64_t v96 = *(void *)v206;
    do
    {
      for (j = 0; j != v95; ++j)
      {
        if (*(void *)v206 != v96) {
          objc_enumerationMutation(v94);
        }
        v98 = (id *)(v264 + 5);
        id v204 = (id)v264[5];
        v148 = CUDescriptionWithLevel();
        NSAppendPrintF();
        objc_storeStrong(v98, v204);
      }
      v95 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v205, v270, 16, v148);
    }
    while (v95);
  }

  if (self->_personalCnx)
  {
    v99 = (id *)(v264 + 5);
    id v203 = (id)v264[5];
    v146 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v99, v203);
  }
  if (self->_stereoCnx)
  {
    v100 = (id *)(v264 + 5);
    id v202 = (id)v264[5];
    v146 = CUDescriptionWithLevel();
    NSAppendPrintF();
    objc_storeStrong(v100, v202);
  }
  uint64_t v198 = 0;
  v199 = &v198;
  uint64_t v200 = 0x2020000000;
  uint64_t v201 = 0;
  id v101 = [(NSMutableDictionary *)self->_unauthDevices count];
  id v102 = v101;
  if (v101)
  {
    v103 = (id *)(v264 + 5);
    id v197 = (id)v264[5];
    id v149 = v101;
    NSAppendPrintF();
    objc_storeStrong(v103, v197);
  }
  unauthDevices = self->_unauthDevices;
  v195[0] = _NSConcreteStackBlock;
  v195[1] = 3221225472;
  v195[2] = sub_1000111F0;
  v195[3] = &unk_100121590;
  int v196 = v20;
  v195[4] = &v263;
  v195[5] = &v198;
  v195[6] = v102;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](unauthDevices, "enumerateKeysAndObjectsUsingBlock:", v195, v149);
  v199[3] = 0;
  id v105 = [(NSMutableDictionary *)self->_bleDevices count];
  id v106 = v105;
  if (v105)
  {
    v107 = (id *)(v264 + 5);
    id v194 = (id)v264[5];
    id v150 = v105;
    NSAppendPrintF();
    objc_storeStrong(v107, v194);
  }
  bleDevices = self->_bleDevices;
  v192[0] = _NSConcreteStackBlock;
  v192[1] = 3221225472;
  v192[2] = sub_1000112D4;
  v192[3] = &unk_100121590;
  int v193 = v20;
  v192[4] = &v263;
  v192[5] = &v198;
  v192[6] = v106;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleDevices, "enumerateKeysAndObjectsUsingBlock:", v192, v150);
  v199[3] = 0;
  id v109 = [(NSMutableDictionary *)self->_nearbyInfoV2Devices count];
  id v110 = v109;
  if (v109)
  {
    v111 = (id *)(v264 + 5);
    id v191 = (id)v264[5];
    id v151 = v109;
    NSAppendPrintF();
    objc_storeStrong(v111, v191);
  }
  nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
  v189[0] = _NSConcreteStackBlock;
  v189[1] = 3221225472;
  v189[2] = sub_1000113B8;
  v189[3] = &unk_100121590;
  int v190 = v20;
  v189[4] = &v263;
  v189[5] = &v198;
  v189[6] = v110;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoV2Devices, "enumerateKeysAndObjectsUsingBlock:", v189, v151);
  v199[3] = 0;
  id v113 = [(NSMutableDictionary *)self->_pairedDevices count];
  id v114 = v113;
  if (v113)
  {
    v115 = (id *)(v264 + 5);
    id v188 = (id)v264[5];
    id v152 = v113;
    NSAppendPrintF();
    objc_storeStrong(v115, v188);
  }
  pairedDevices = self->_pairedDevices;
  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472;
  v186[2] = sub_10001149C;
  v186[3] = &unk_100121590;
  int v187 = v20;
  v186[4] = &v263;
  v186[5] = &v198;
  v186[6] = v114;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pairedDevices, "enumerateKeysAndObjectsUsingBlock:", v186, v152);
  v199[3] = 0;
  id v117 = [(NSMutableDictionary *)self->_homeHubDevices count];
  id v118 = v117;
  if (v117)
  {
    v119 = (id *)(v264 + 5);
    id v185 = (id)v264[5];
    id v153 = v117;
    NSAppendPrintF();
    objc_storeStrong(v119, v185);
  }
  homeHubDevices = self->_homeHubDevices;
  v183[0] = _NSConcreteStackBlock;
  v183[1] = 3221225472;
  v183[2] = sub_100011580;
  v183[3] = &unk_100121590;
  int v184 = v20;
  v183[4] = &v263;
  v183[5] = &v198;
  v183[6] = v118;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](homeHubDevices, "enumerateKeysAndObjectsUsingBlock:", v183, v153);
  if ([(NSMutableDictionary *)self->_uiNoteDevices count])
  {
    v121 = (id *)(v264 + 5);
    id v182 = (id)v264[5];
    id v155 = [(NSMutableDictionary *)self->_uiNoteDevices count];
    NSAppendPrintF();
    objc_storeStrong(v121, v182);
    uiNoteDevices = self->_uiNoteDevices;
    v180[0] = _NSConcreteStackBlock;
    v180[1] = 3221225472;
    v180[2] = sub_100011664;
    v180[3] = &unk_1001215B8;
    v180[4] = &v263;
    int v181 = v20;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](uiNoteDevices, "enumerateKeysAndObjectsUsingBlock:", v180, v155);
  }
  v123 = self->_uiNoteSession;
  v124 = v123;
  if (v123)
  {
    v125 = (id *)(v264 + 5);
    id v179 = (id)v264[5];
    v154 = v123;
    NSAppendPrintF();
    objc_storeStrong(v125, v179);
  }

  if ([(NSMutableDictionary *)self->_xpcMatchingMap count])
  {
    v126 = (id *)(v264 + 5);
    id v178 = (id)v264[5];
    id v156 = [(NSMutableDictionary *)self->_xpcMatchingMap count];
    NSAppendPrintF();
    objc_storeStrong(v126, v178);
    xpcMatchingMap = self->_xpcMatchingMap;
    v177[0] = _NSConcreteStackBlock;
    v177[1] = 3221225472;
    v177[2] = sub_1000116D0;
    v177[3] = &unk_1001215E0;
    v177[4] = &v263;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v177, v156);
  }
  uint64_t v128 = mach_absolute_time();
  if ([(NSMutableDictionary *)self->_activeSessions count])
  {
    v129 = (id *)(v264 + 5);
    id v176 = (id)v264[5];
    id v157 = [(NSMutableDictionary *)self->_activeSessions count];
    NSAppendPrintF();
    objc_storeStrong(v129, v176);
    activeSessions = self->_activeSessions;
    v175[0] = _NSConcreteStackBlock;
    v175[1] = 3221225472;
    v175[2] = sub_1000117B8;
    v175[3] = &unk_100121608;
    v175[4] = &v263;
    v175[5] = v128;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeSessions, "enumerateKeysAndObjectsUsingBlock:", v175, v157);
  }
  if ([(NSMutableSet *)self->_xpcConnections count])
  {
    v131 = (id *)(v264 + 5);
    id v174 = (id)v264[5];
    id v158 = [(NSMutableSet *)self->_xpcConnections count];
    NSAppendPrintF();
    objc_storeStrong(v131, v174);
    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    v132 = self->_xpcConnections;
    v133 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v170, v269, 16, v158);
    if (v133)
    {
      uint64_t v134 = *(void *)v171;
      do
      {
        for (k = 0; k != v133; ++k)
        {
          if (*(void *)v171 != v134) {
            objc_enumerationMutation(v132);
          }
          v136 = (id *)(v264 + 5);
          id v169 = (id)v264[5];
          v159 = CUDescriptionWithLevel();
          NSAppendPrintF();
          objc_storeStrong(v136, v169);
        }
        v133 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v170, v269, 16, v159);
      }
      while (v133);
    }
  }
  id v4 = (id)v264[5];
  _Block_object_dispose(&v198, 8);

  _Block_object_dispose(&v263, 8);
LABEL_128:

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000118F4;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int DeviceClass = GestaltGetDeviceClass();
  self->_prefCommunal = sub_10000EABC(DeviceClass);
  self->_prefServerBonjourOpportunitistic = GestaltGetDeviceClass() == 3;
  self->_startTicks = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  RandomBytes();
  if (!self->_xpcListener)
  {
    id v4 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.CompanionLink"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v4;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  if (self->_coreDeviceChangedNotifier == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100011BE0;
    handler[3] = &unk_100121630;
    handler[4] = self;
    notify_register_dispatch("com.apple.dt.coredevice.devicePaired", &self->_coreDeviceChangedNotifier, dispatchQueue, handler);
  }
  self->_homeKitWaiting = 1;
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  id v8 = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011BE8;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_after(v7, v8, block);
  if (!self->_nearfieldDaemon)
  {
    id v9 = +[RPNearFieldDaemon sharedNearFieldDaemon];
    nearfieldDaemon = self->_nearfieldDaemon;
    self->_nearfieldDaemon = v9;

    [(RPNearFieldDaemon *)self->_nearfieldDaemon setDispatchQueue:self->_dispatchQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100011CB8;
    v14[3] = &unk_100121158;
    v14[4] = self;
    [(RPNearFieldDaemon *)self->_nearfieldDaemon setTransactionChangedHandler:v14];
  }
  if (!self->_tvDeviceInfoManager && GestaltGetDeviceClass() == 4)
  {
    v11 = [[RPAppleTVDeviceInfoManager alloc] initWithQueue:self->_dispatchQueue];
    tvDeviceInfoManager = self->_tvDeviceInfoManager;
    self->_tvDeviceInfoManager = v11;

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100011CC0;
    v13[3] = &unk_100121158;
    v13[4] = self;
    [(RPAppleTVDeviceInfoManager *)self->_tvDeviceInfoManager setDeviceInfoChangedHandler:v13];
  }
  [(RPCompanionLinkDaemon *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011D90;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NSXPCListener *)self->_xpcListener invalidate];
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = self->_xpcConnections;
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v29;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v28 + 1) + 8 * i) xpcCnx:v28];
          [v9 invalidate];
        }
        id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v6);
    }

    [(NSMutableDictionary *)self->_xpcMatchingMap removeAllObjects];
    xpcMatchingMap = self->_xpcMatchingMap;
    self->_xpcMatchingMap = 0;

    [(RPCompanionLinkDaemon *)self _bleServerEnsureStopped];
    [(RPCompanionLinkDaemon *)self _btPipeEnsureStopped];
    [(RPCompanionLinkDaemon *)self _clientEnsureStopped];
    int coreDeviceChangedNotifier = self->_coreDeviceChangedNotifier;
    if (coreDeviceChangedNotifier != -1)
    {
      notify_cancel(coreDeviceChangedNotifier);
      self->_int coreDeviceChangedNotifier = -1;
    }
    [(RPCompanionLinkDaemon *)self _duetSyncEnsureStopped];
    [(RPCompanionLinkDaemon *)self _serverEnsureStopped];
    [(RPCompanionLinkDaemon *)self _homeKitEnsureStopped];
    [(RPCompanionLinkDaemon *)self _hidEnsureStopped];
    [(RPCompanionLinkDaemon *)self _mediaControlEnsureStopped];
    [(RPCompanionLinkDaemon *)self _miscEnsureStopped];
    [(RPCompanionLinkDaemon *)self _siriEnsureStopped];
    [(RPCompanionLinkDaemon *)self _reachabilityEnsureStopped];
    [(RPCompanionLinkDaemon *)self _localDeviceCleanup];
    [(NSMutableSet *)self->_needsAWDLNewPeers removeAllObjects];
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    self->_needsAWDLNewPeers = 0;

    [(NSMutableSet *)self->_needsAWDLSentToPeers removeAllObjects];
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;

    [(NSMutableSet *)self->_needsAWDLRequestIdentifiers removeAllObjects];
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    self->_needsAWDLRequestIdentifiers = 0;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      uint64_t v16 = needsAWDLRequestTimer;
      dispatch_source_cancel(v16);
      v17 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;
    }
    [(NSMutableDictionary *)self->_registeredEvents removeAllObjects];
    registeredEvents = self->_registeredEvents;
    self->_registeredEvents = 0;

    [(NSMutableSet *)self->_registeredProfileIDs removeAllObjects];
    registeredProfileIDs = self->_registeredProfileIDs;
    self->_registeredProfileIDs = 0;

    [(NSMutableDictionary *)self->_registeredRequests removeAllObjects];
    registeredRequests = self->_registeredRequests;
    self->_registeredRequests = 0;

    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    [(CBAdvertiser *)self->_cbAdvertiser invalidate];
    cbAdvertiser = self->_cbAdvertiser;
    self->_cbAdvertiser = 0;

    [(RPNearFieldDaemon *)self->_nearfieldDaemon setTransactionChangedHandler:0];
    nearfieldDaemon = self->_nearfieldDaemon;
    self->_nearfieldDaemon = 0;

    [(RPAppleTVDeviceInfoManager *)self->_tvDeviceInfoManager invalidate];
    tvDeviceInfoManager = self->_tvDeviceInfoManager;
    self->_tvDeviceInfoManager = 0;

    rbsProcessMonitor = self->_rbsProcessMonitor;
    if (rbsProcessMonitor)
    {
      [(RBSProcessMonitor *)rbsProcessMonitor invalidate];
      v26 = self->_rbsProcessMonitor;
      self->_rbsProcessMonitor = 0;
    }
    [(NSMutableSet *)self->_rbsPIDSet removeAllObjects];
    rbsPIDSet = self->_rbsPIDSet;
    self->_rbsPIDSet = 0;

    [(RPCompanionLinkDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && ![(NSMutableDictionary *)self->_bleClientConnections count]
    && ![(NSMutableSet *)self->_bleServerConnections count]
    && !self->_bonjourAdvertiser
    && !self->_bonjourBrowser
    && !self->_btAdvAddrMonitor
    && !self->_btPipeConnection
    && ![(NSMutableDictionary *)self->_tcpClientConnections count]
    && ![(NSMutableDictionary *)self->_tcpOnDemandClientConnections count]
    && ![(NSMutableSet *)self->_tcpServerConnections count]
    && !self->_tcpServer
    && ![(NSMutableSet *)self->_xpcConnections count]
    && !self->_xpcListener)
  {
    [(CUWiFiManager *)self->_wifiManager invalidate];
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0;

    self->_invalidateDone = 1;
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((a3 & 0x10) != 0)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkDaemon *)self _btPipeEnsureStopped];
    [(RPCompanionLinkDaemon *)self _clientEnsureStopped];
    [(RPCompanionLinkDaemon *)self _serverEnsureStopped];
    [(RPCompanionLinkDaemon *)self _update];
    if ((a3 & 0x40) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [(RPCompanionLinkDaemon *)self _update];
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_26:
  if (self->_deviceAuthTagStr)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;
  }
  if (self->_deviceAWDLRandomID)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;
  }
  [(RPCompanionLinkDaemon *)self _update];
  if ((a3 & 1) == 0)
  {
LABEL_5:
    if ((a3 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  [(RPCompanionLinkDaemon *)self _update];
  if ((a3 & 0x100) == 0)
  {
LABEL_6:
    if ((a3 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
  [(RPCompanionLinkDaemon *)self _disconnectUnpairedDevices];
  if ((a3 & 0x200) == 0)
  {
LABEL_7:
    if ((a3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
  [(RPCompanionLinkDaemon *)self _disconnectRemovedSharedHomeDevices];
  if ((a3 & 8) == 0)
  {
LABEL_8:
    if ((a3 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
  [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:&stru_100121670];
  if ((a3 & 0x20) == 0)
  {
LABEL_9:
    if ((a3 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_51;
  }
LABEL_43:
  uint64_t v7 = +[RPDaemon sharedDaemon];
  id v8 = [v7 errorFlags];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_xpcConnections;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) updateErrorFlags:v8];
      }
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if ((a3 & 0x800) == 0)
  {
LABEL_10:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_51:
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v14 = a3;
    id v15 = &unk_1001196C8;
    LogPrintF();
  }
  [(RPCompanionLinkDaemon *)self _clientBLEFamilyDeviceReportChanges];
  if ((a3 & 0x4000) == 0)
  {
LABEL_11:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_56:
  [(RPCompanionLinkDaemon *)self _update];
  if ((a3 & 0x40000) != 0) {
LABEL_12:
  }
    [(RPCompanionLinkDaemon *)self _update];
LABEL_13:
  if ((a3 & 0x18000) != 0)
  {
    self->_inDiscoverySession = (a3 & 0x8000) != 0;
    [(RPCompanionLinkDaemon *)self _update];
  }
  if ((a3 & 0x2000) != 0) {
    [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
  }
  if ((a3 & 2) != 0) {
    [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v5 rangeOfString:@"clAWDLa" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v5 rangeOfString:@"clAWDLb" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v5 rangeOfString:@"clUpdate" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v5 isEqual:@"eval"])
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateAllDevices];
          goto LABEL_36;
        }
        if ([v5 isEqual:@"hkbad"])
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          NSRandomData();
          long long v18 = (NSData *)objc_claimAutoreleasedReturnValue();
          homeKitLTPK = self->_homeKitLTPK;
          self->_homeKitLTPK = v18;

          BOOL v12 = 1;
          id v20 = [(RPCompanionLinkDaemon *)self _discoveryNonceOrRotate:1];
          [(RPCompanionLinkDaemon *)self _homeKitUpdateInfo:1];
          [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
          goto LABEL_53;
        }
        if (![v5 isEqual:@"hkgood"])
        {
          if (![v5 isEqual:@"rotate"])
          {
            BOOL v12 = 0;
            goto LABEL_37;
          }
          NSRandomData();
          unint64_t v14 = (NSData *)objc_claimAutoreleasedReturnValue();
          btAdvAddrData = self->_btAdvAddrData;
          self->_btAdvAddrData = v14;

          v24 = [(NSData *)self->_btAdvAddrData bytes];
          NSPrintF();
          long long v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          btAdvAddrStr = self->_btAdvAddrStr;
          self->_btAdvAddrStr = v16;

          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            v24 = [(NSData *)self->_btAdvAddrData bytes];
            LogPrintF();
          }
          deviceAuthTagStr = self->_deviceAuthTagStr;
          self->_deviceAuthTagStr = 0;

          BOOL v12 = 1;
          id v23 = [(RPCompanionLinkDaemon *)self _discoveryNonceOrRotate:1];
          [(RPCompanionLinkDaemon *)self _homeKitUpdateInfo:1];
LABEL_53:
          [(RPCompanionLinkDaemon *)self _update];
          goto LABEL_37;
        }
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v21 = self->_homeKitLTPK;
        self->_homeKitLTPK = 0;
      }
      else if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      BOOL bonjourBrowserAWDLForce = self->_bonjourBrowserAWDLForce;
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v10 = "yes";
        if (bonjourBrowserAWDLForce) {
          id v11 = "yes";
        }
        else {
          id v11 = "no";
        }
        if (bonjourBrowserAWDLForce) {
          id v10 = "no";
        }
        v24 = v11;
        v25 = v10;
        LogPrintF();
      }
      self->_BOOL bonjourBrowserAWDLForce = !bonjourBrowserAWDLForce;
    }
  }
  else
  {
    BOOL bonjourAWDLAdvertiserForce = self->_bonjourAWDLAdvertiserForce;
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = "yes";
      if (bonjourAWDLAdvertiserForce) {
        id v8 = "yes";
      }
      else {
        id v8 = "no";
      }
      if (bonjourAWDLAdvertiserForce) {
        uint64_t v7 = "no";
      }
      v24 = v8;
      v25 = v7;
      LogPrintF();
    }
    self->_BOOL bonjourAWDLAdvertiserForce = !bonjourAWDLAdvertiserForce;
  }
  [(RPCompanionLinkDaemon *)self _update];
LABEL_36:
  BOOL v12 = 1;
LABEL_37:

  return v12;
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int DeviceClass = GestaltGetDeviceClass();
  int v4 = DeviceClass;
  BOOL v5 = 1;
  if (DeviceClass != 3 && (DeviceClass - 1) >= 2) {
    BOOL v5 = DeviceClass == 100;
  }
  if (self->_prefAppSignIn != v5)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v6 = "yes";
      if (v5) {
        uint64_t v7 = "no";
      }
      else {
        uint64_t v7 = "yes";
      }
      if (!v5) {
        id v6 = "no";
      }
      id v74 = v7;
      v76 = v6;
      LogPrintF();
    }
    self->_prefAppSignIn = v5;
  }
  BOOL v8 = CFPrefs_GetInt64() != 0;
  if (self->_prefApplyNoiWiFiToUSB != v8)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v9 = "yes";
      if (v8) {
        id v10 = "no";
      }
      else {
        id v10 = "yes";
      }
      if (!v8) {
        id v9 = "no";
      }
      id v74 = v10;
      v76 = v9;
      LogPrintF();
    }
    self->_prefApplyNoiWiFiToUSB = v8;
  }
  BOOL v11 = 1;
  if (v4 != 3 && (v4 - 1) >= 2) {
    BOOL v11 = v4 == 100;
  }
  if (self->_prefCompanionAuthentication != v11)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      BOOL v12 = "yes";
      if (v11) {
        id v13 = "no";
      }
      else {
        id v13 = "yes";
      }
      if (!v11) {
        BOOL v12 = "no";
      }
      id v74 = v13;
      v76 = v12;
      LogPrintF();
    }
    self->_prefCompanionAuthentication = v11;
  }
  BOOL v14 = CFPrefs_GetInt64() != 0;
  if (self->_prefBLEClient != v14)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v15 = "yes";
      if (v14) {
        long long v16 = "no";
      }
      else {
        long long v16 = "yes";
      }
      if (!v14) {
        id v15 = "no";
      }
      id v74 = v16;
      v76 = v15;
      LogPrintF();
    }
    self->_prefBLEClient = v14;
  }
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", CFPrefs_GetInt64() != 0, v74, v76);
  long long v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  if (v17 != self->_prefMeDeviceIsMeOverride && (-[NSNumber isEqual:](v17, "isEqual:") & 1) == 0)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      if ([(NSNumber *)self->_prefMeDeviceIsMeOverride BOOLValue]) {
        long long v18 = "yes";
      }
      else {
        long long v18 = "no";
      }
      if ([(NSNumber *)v17 BOOLValue]) {
        long long v19 = "yes";
      }
      else {
        long long v19 = "no";
      }
      v75 = v18;
      BOOL v77 = v19;
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_prefMeDeviceIsMeOverride, v17);
  }
  BOOL v20 = CFPrefs_GetInt64() != 0;
  if (self->_prefBTPipeEnabled != v20)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v21 = "yes";
      if (v20) {
        int v22 = "no";
      }
      else {
        int v22 = "yes";
      }
      if (!v20) {
        id v21 = "no";
      }
      v75 = v22;
      BOOL v77 = v21;
      LogPrintF();
    }
    self->_prefBTPipeEnabled = v20;
  }
  BOOL v23 = CFPrefs_GetInt64() != 0;
  if (self->_prefClientEnabled != v23)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v24 = "yes";
      if (v23) {
        v25 = "no";
      }
      else {
        v25 = "yes";
      }
      if (!v23) {
        v24 = "no";
      }
      v75 = v25;
      BOOL v77 = v24;
      LogPrintF();
    }
    self->_prefClientEnabled = v23;
  }
  BOOL v26 = CFPrefs_GetInt64() != 0;
  if (self->_prefCoreDevicePaired != v26)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v27 = "yes";
      if (v26) {
        long long v28 = "no";
      }
      else {
        long long v28 = "yes";
      }
      if (!v26) {
        v27 = "no";
      }
      v75 = v28;
      BOOL v77 = v27;
      LogPrintF();
    }
    self->_prefCoreDevicePaired = v26;
    if (v26) {
      [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
    }
  }
  BOOL v29 = CFPrefs_GetInt64() != 0;
  if (self->_prefCoreDeviceEnabled != v29)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      long long v30 = "yes";
      if (v29) {
        long long v31 = "no";
      }
      else {
        long long v31 = "yes";
      }
      if (!v29) {
        long long v30 = "no";
      }
      v75 = v31;
      BOOL v77 = v30;
      LogPrintF();
    }
    self->_prefCoreDeviceEnabled = v29;
  }
  BOOL v32 = CFPrefs_GetInt64() != 0;
  if (self->_prefHIDEnabled != v32)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v33 = "yes";
      if (v32) {
        v34 = "no";
      }
      else {
        v34 = "yes";
      }
      if (!v32) {
        v33 = "no";
      }
      v75 = v34;
      BOOL v77 = v33;
      LogPrintF();
    }
    self->_prefHIDEnabled = v32;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  BOOL v36 = Int64 != 0;
  if (Int64 && !self->_prefHomeKitConfigured)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v75 = "no";
      BOOL v77 = "yes";
      LogPrintF();
    }
    self->_prefHomeKitConfigured = v36;
  }
  BOOL v37 = CFPrefs_GetInt64() != 0;
  if (self->_prefHomeKitEnabled != v37)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v38 = "yes";
      if (v37) {
        v39 = "no";
      }
      else {
        v39 = "yes";
      }
      if (!v37) {
        v38 = "no";
      }
      v75 = v39;
      BOOL v77 = v38;
      LogPrintF();
    }
    self->_prefHomeKitEnabled = v37;
  }
  uint64_t v40 = CFPrefs_GetInt64();
  BOOL v41 = v40 != 0;
  if (self->_prefIgnoreCompanionLinkChecks != v41)
  {
    if (dword_100140E48 <= 30)
    {
      uint64_t v42 = v40;
      if (dword_100140E48 != -1 || _LogCategory_Initialize())
      {
        v43 = "yes";
        if (v42) {
          v44 = "no";
        }
        else {
          v44 = "yes";
        }
        if (!v42) {
          v43 = "no";
        }
        v75 = v44;
        BOOL v77 = v43;
        LogPrintF();
      }
    }
    self->_prefIgnoreCompanionLinkChecks = v41;
  }
  BOOL v45 = CFPrefs_GetInt64() != 0;
  if (self->_prefIPEnabled != v45)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v46 = "yes";
      if (v45) {
        v47 = "no";
      }
      else {
        v47 = "yes";
      }
      if (!v45) {
        v46 = "no";
      }
      v75 = v47;
      BOOL v77 = v46;
      LogPrintF();
    }
    self->_prefIPEnabled = v45;
  }
  uint64_t v48 = CFPrefs_GetInt64();
  if (v48 <= 1000 && v48 >= 0) {
    uint64_t v51 = v48;
  }
  else {
    uint64_t v51 = 100;
  }
  prefMaxConnectionCount = (const char *)self->_prefMaxConnectionCount;
  if ((const char *)v51 != prefMaxConnectionCount)
  {
    if (dword_100140E48 <= 40)
    {
      if (dword_100140E48 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_174;
        }
        prefMaxConnectionCount = (const char *)self->_prefMaxConnectionCount;
      }
      v75 = prefMaxConnectionCount;
      BOOL v77 = (const char *)v51;
      LogPrintF();
    }
LABEL_174:
    self->_prefMaxConnectionCount = v51;
  }
  BOOL v53 = CFPrefs_GetInt64() != 0;
  if (self->_prefMediaControlEnabled != v53)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v54 = "yes";
      if (v53) {
        v55 = "no";
      }
      else {
        v55 = "yes";
      }
      if (!v53) {
        v54 = "no";
      }
      v75 = v55;
      BOOL v77 = v54;
      LogPrintF();
    }
    self->_prefMediaControlEnabled = v53;
  }
  BOOL v56 = CFPrefs_GetInt64() != 0;
  if (self->_prefServerBonjourAlways != v56)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v57 = "yes";
      if (v56) {
        v58 = "no";
      }
      else {
        v58 = "yes";
      }
      if (!v56) {
        v57 = "no";
      }
      v75 = v58;
      BOOL v77 = v57;
      LogPrintF();
    }
    self->_prefServerBonjourAlways = v56;
  }
  BOOL v59 = CFPrefs_GetInt64() != 0;
  if (self->_prefServerEnabled != v59)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v60 = "yes";
      if (v59) {
        v61 = "no";
      }
      else {
        v61 = "yes";
      }
      if (!v59) {
        v60 = "no";
      }
      v75 = v61;
      BOOL v77 = v60;
      LogPrintF();
    }
    self->_prefServerEnabled = v59;
  }
  BOOL v62 = CFPrefs_GetInt64() != 0;
  if (self->_prefSiriEnabled != v62)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v63 = "yes";
      if (v62) {
        v64 = "no";
      }
      else {
        v64 = "yes";
      }
      if (!v62) {
        v63 = "no";
      }
      v75 = v64;
      BOOL v77 = v63;
      LogPrintF();
    }
    self->_prefSiriEnabled = v62;
  }
  BOOL v65 = CFPrefs_GetInt64() != 0;
  if (self->_prefTouchEnabled != v65)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v66 = "yes";
      if (v65) {
        v67 = "no";
      }
      else {
        v67 = "yes";
      }
      if (!v65) {
        v66 = "no";
      }
      v75 = v67;
      BOOL v77 = v66;
      LogPrintF();
    }
    self->_prefTouchEnabled = v65;
  }
  BOOL v68 = CFPrefs_GetInt64() != 0;
  if (self->_prefUINotesEnabled != v68)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v69 = "yes";
      if (v68) {
        v70 = "no";
      }
      else {
        v70 = "yes";
      }
      if (!v68) {
        v69 = "no";
      }
      v75 = v70;
      BOOL v77 = v69;
      LogPrintF();
    }
    self->_prefUINotesEnabled = v68;
  }
  BOOL v71 = CFPrefs_GetInt64() != 0;
  if (self->_prefUseTargetAuthTag != v71)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v72 = "yes";
      if (v71) {
        id v73 = "no";
      }
      else {
        id v73 = "yes";
      }
      if (!v71) {
        v72 = "no";
      }
      v75 = v73;
      BOOL v77 = v72;
      LogPrintF();
    }
    self->_prefUseTargetAuthTag = v71;
  }
  [(RPCompanionLinkDaemon *)self _update];
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(RPXPCMatchingEntry);
  CFStringGetTypeID();
  BOOL v11 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  BOOL v12 = CFDictionaryGetTypedValue();
  if (![v11 isEqual:@"discovery"])
  {
    if ([v11 isEqual:@"server"]
      && ([v12 isEqual:@"_companion-link._tcp"] & 1) == 0
      && ([v12 isEqual:@"_rdlink._tcp"] & 1) == 0
      && [v12 length])
    {
      id v13 = objc_alloc_init((Class)RPServer);
      [v13 setServiceType:v12];
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setServersChangedState:6];
      [(RPXPCMatchingEntry *)v10 setServer:v13];

      goto LABEL_13;
    }
LABEL_18:
    BOOL v18 = 0;
    goto LABEL_21;
  }
  if (!self->_prefAppSignIn || ![v12 isEqual:@"RPUserNotificationAppSignIn"])
  {
    if (([v12 isEqual:@"_companion-link._tcp"] & 1) != 0
      || self->_prefCompanionAuthentication
      && ([v12 isEqual:@"com.apple.CompanionAuthentication"] & 1) != 0)
    {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  [(RPXPCMatchingEntry *)v10 setAppSignIn:1];
LABEL_13:
  [(RPXPCMatchingEntry *)v10 setEvent:v8];
  [(RPXPCMatchingEntry *)v10 setHandler:v9];
  [(RPXPCMatchingEntry *)v10 setToken:a3];
  xpcMatchingMap = self->_xpcMatchingMap;
  if (!xpcMatchingMap)
  {
    id v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v16 = self->_xpcMatchingMap;
    self->_xpcMatchingMap = v15;

    xpcMatchingMap = self->_xpcMatchingMap;
  }
  long long v17 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)xpcMatchingMap setObject:v10 forKeyedSubscript:v17];

  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v20 = v8;
    unint64_t v21 = a3;
    LogPrintF();
  }
  [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCLink];
  [(RPCompanionLinkDaemon *)self _updateForXPCClientChange];
  BOOL v18 = 1;
LABEL_21:

  return v18;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  BOOL v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v6 = [(NSMutableDictionary *)self->_xpcMatchingMap objectForKeyedSubscript:v5];
  if (v6)
  {
    [(NSMutableDictionary *)self->_xpcMatchingMap setObject:0 forKeyedSubscript:v5];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v9 = [v6 event];
      unint64_t v10 = a3;
      LogPrintF();
    }
    uint64_t v7 = [v6 server:v9, v10];
    if (v7) {
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setServersChangedState:6];
    }

    [(RPCompanionLinkDaemon *)self _updateForXPCClientChange];
  }

  return v6 != 0;
}

- (void)_reportXPCMatchingDiscoveryCLink
{
  v3 = +[NSMutableArray array];
  int v4 = [(NSMutableDictionary *)self->_activeDevices allValues];
  [v3 addObjectsFromArray:v4];

  BOOL v5 = [(NSMutableDictionary *)self->_bleDevices allValues];
  [v3 addObjectsFromArray:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      unint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v8 += ((unint64_t)[*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) statusFlags] >> 19) & 1;
        unint64_t v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
    LOBYTE(v7) = v8 > 0;
  }

  xpcMatchingMap = self->_xpcMatchingMap;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013F18;
  v12[3] = &unk_100121690;
  char v13 = (char)v7;
  [(NSMutableDictionary *)xpcMatchingMap enumerateKeysAndObjectsUsingBlock:v12];
}

- (void)_reportXPCMatchingDiscoveryUINoteDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 effectiveIdentifier];
  id v6 = (void *)v5;
  id v7 = @"?";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  xpcMatchingMap = self->_xpcMatchingMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014190;
  v11[3] = &unk_1001216B8;
  v11[4] = v8;
  id v12 = v4;
  id v10 = v4;
  [(NSMutableDictionary *)xpcMatchingMap enumerateKeysAndObjectsUsingBlock:v11];
}

- (void)_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 effectiveIdentifier];
  id v6 = (void *)v5;
  id v7 = @"?";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  xpcMatchingMap = self->_xpcMatchingMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014460;
  v11[3] = &unk_1001216B8;
  v11[4] = v8;
  id v12 = v4;
  id v10 = v4;
  [(NSMutableDictionary *)xpcMatchingMap enumerateKeysAndObjectsUsingBlock:v11];
}

- (void)_update
{
  [(RPCompanionLinkDaemon *)self _updateAssertions];
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100014C3C;
    v31[3] = &unk_100121158;
    v31[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setFirstUnlockHandler:v31];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100014C44;
    v30[3] = &unk_100121158;
    v30[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setMeDeviceChangedHandler:v30];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100014D10;
    v29[3] = &unk_100121158;
    v29[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPowerUnlimitedChangedHandler:v29];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100014D18;
    v28[3] = &unk_100121158;
    v28[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryAppleIDChangedHandler:v28];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100014D2C;
    v27[3] = &unk_100121158;
    v27[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenLockedChangedHandler:v27];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100014D34;
    v26[3] = &unk_100121158;
    v26[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:v26];
    if (self->_prefIPEnabled)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100014D3C;
      v25[3] = &unk_100121158;
      v25[4] = self;
      [(CUSystemMonitor *)self->_systemMonitor setWifiStateChangedHandler:v25];
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100014D44;
    v24[3] = &unk_100121158;
    v24[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setBluetoothAddressChangedHandler:v24];
    [(CUSystemMonitor *)self->_systemMonitor activateWithCompletion:0];
  }
  if (!self->_cbAdvertiser)
  {
    uint64_t v5 = (CBAdvertiser *)objc_alloc_init((Class)CBAdvertiser);
    cbAdvertiser = self->_cbAdvertiser;
    self->_cbAdvertiser = v5;

    [(CBAdvertiser *)self->_cbAdvertiser setDispatchQueue:self->_dispatchQueue];
    [(CBAdvertiser *)self->_cbAdvertiser activateWithCompletion:&stru_1001216F8];
  }
  BOOL v7 = self->_prefServerEnabled && !self->_disabled;
  uint64_t v8 = +[RPIdentityDaemon sharedIdentityDaemon];
  uint64_t v9 = [v8 identitiesOfType:13 error:0];

  id v10 = +[RPIdentityDaemon sharedIdentityDaemon];
  BOOL v11 = [v10 identitiesOfType:15 error:0];

  id v12 = +[RPIdentityDaemon sharedIdentityDaemon];
  char v13 = [v12 identitiesOfType:12 error:0];

  if (!v7) {
    goto LABEL_19;
  }
  if (!self->_prefCommunal)
  {
    long long v14 = +[RPCloudDaemon sharedCloudDaemon];
    if (([v14 idsIsSignedIn] & 1) != 0
      || [v9 count]
      || [v11 count]
      || [v13 count])
    {

      goto LABEL_17;
    }
    BOOL v16 = sub_10000DD3C();

    if (v16) {
      goto LABEL_17;
    }
LABEL_19:
    BOOL v15 = [(RPNearFieldDaemon *)self->_nearfieldDaemon hasCurrentTransaction];
    goto LABEL_20;
  }
LABEL_17:
  BOOL v15 = 1;
LABEL_20:
  self->_prefServerShouldRun = v15;
  if (!self->_prefClientEnabled && !self->_prefServerEnabled)
  {
    [(RPCompanionLinkDaemon *)self _localDeviceCleanup];
    int v17 = 0;
LABEL_26:
    [(RPCompanionLinkDaemon *)self _homeKitEnsureStopped];
    if (!v17) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  [(RPCompanionLinkDaemon *)self _localDeviceUpdate];
  if (!self->_prefHomeKitEnabled)
  {
    int v17 = 1;
    goto LABEL_26;
  }
  [(RPCompanionLinkDaemon *)self _homeKitEnsureStarted];
  LOBYTE(v17) = 1;
LABEL_27:
  if (self->_prefIPEnabled)
  {
    [(RPCompanionLinkDaemon *)self _reachabilityEnsureStarted];
    goto LABEL_30;
  }
LABEL_29:
  [(RPCompanionLinkDaemon *)self _reachabilityEnsureStopped];
LABEL_30:
  char v18 = v17 ^ 1;
  if (self->_disabled) {
    char v18 = 1;
  }
  if (v18) {
    [(RPCompanionLinkDaemon *)self _bleServerEnsureStopped];
  }
  else {
    [(RPCompanionLinkDaemon *)self _bleServerEnsureStarted];
  }
  if (self->_prefBTPipeEnabled) {
    [(RPCompanionLinkDaemon *)self _btPipeEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _btPipeEnsureStopped];
  }
  if (!self->_prefClientEnabled || self->_disabled || self->_homeKitWaiting && !self->_homeKitLTPK) {
    [(RPCompanionLinkDaemon *)self _clientEnsureStopped];
  }
  else {
    [(RPCompanionLinkDaemon *)self _clientEnsureStarted];
  }
  if (self->_prefServerShouldRun || self->_serverBonjourInfraPairing) {
    [(RPCompanionLinkDaemon *)self _serverEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _serverEnsureStopped];
  }
  char v19 = v17 ^ 1;
  if (!self->_prefHIDEnabled) {
    char v19 = 1;
  }
  if (v19) {
    [(RPCompanionLinkDaemon *)self _hidEnsureStopped];
  }
  else {
    [(RPCompanionLinkDaemon *)self _hidEnsureStarted];
  }
  char v20 = v17 ^ 1;
  if (!self->_prefMediaControlEnabled) {
    char v20 = 1;
  }
  if (v20) {
    [(RPCompanionLinkDaemon *)self _mediaControlEnsureStopped];
  }
  else {
    [(RPCompanionLinkDaemon *)self _mediaControlEnsureStarted];
  }
  if (self->_prefClientEnabled || self->_prefServerEnabled) {
    [(RPCompanionLinkDaemon *)self _miscEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _miscEnsureStopped];
  }
  char v21 = v17 ^ 1;
  if (!self->_prefSiriEnabled) {
    char v21 = 1;
  }
  if (v21) {
    [(RPCompanionLinkDaemon *)self _siriEnsureStopped];
  }
  else {
    [(RPCompanionLinkDaemon *)self _siriEnsureStarted];
  }
  [(RPCompanionLinkDaemon *)self _clientSendActivityLevelOverWiFiIfNecessary];
  [(RPCompanionLinkDaemon *)self _updateAssertions];
  if (self->_prefIPEnabled) {
    char v22 = v17;
  }
  else {
    char v22 = 0;
  }
  if ((v22 & 1) == 0)
  {
    [(CUWiFiManager *)self->_wifiManager invalidate];
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0;
  }
}

- (void)_updateAssertions
{
  if (!self->_prefClientEnabled && !self->_prefServerEnabled && !self->_prefBTPipeEnabled) {
    goto LABEL_7;
  }
  v3 = +[RPDaemon sharedDaemon];
  if ([v3 sigTermPending])
  {

    goto LABEL_7;
  }
  id v4 = +[RPDaemon sharedDaemon];
  unsigned __int8 v5 = [v4 languageChangePending];

  if (v5)
  {
LABEL_7:
    if (self->_osTransaction)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      osTransaction = self->_osTransaction;
      self->_osTransaction = 0;
    }
    goto LABEL_17;
  }
  if (!self->_osTransaction)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    char v13 = (OS_os_transaction *)os_transaction_create();
    long long v14 = self->_osTransaction;
    self->_osTransaction = v13;

    if (!self->_osTransaction
      && dword_100140E48 <= 90
      && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
LABEL_17:
  if (![(NSMutableDictionary *)self->_tcpClientConnections count]
    && ![(NSMutableDictionary *)self->_tcpOnDemandClientConnections count]
    && ![(NSMutableSet *)self->_tcpServerConnections count])
  {
    if (![(CUWiFiManager *)self->_wifiManager wakeOnWirelessEnabled]) {
      return;
    }
    uint64_t v11 = 0;
    p_wifiManager = &self->_wifiManager;
    goto LABEL_25;
  }
  wifiManager = self->_wifiManager;
  if (!wifiManager)
  {
    uint64_t v8 = (CUWiFiManager *)objc_alloc_init((Class)CUWiFiManager);
    uint64_t v9 = self->_wifiManager;
    self->_wifiManager = v8;

    [(CUWiFiManager *)self->_wifiManager setDispatchQueue:self->_dispatchQueue];
    [(CUWiFiManager *)self->_wifiManager setLabel:@"CLink"];
    [(CUWiFiManager *)self->_wifiManager activateWithCompletion:0];
    wifiManager = self->_wifiManager;
  }
  if (([(CUWiFiManager *)wifiManager wakeOnWirelessEnabled] & 1) == 0)
  {
    p_wifiManager = &self->_wifiManager;
    uint64_t v11 = 1;
LABEL_25:
    id v12 = *p_wifiManager;
    [(CUWiFiManager *)v12 setWakeOnWirelessEnabled:v11];
  }
}

- (void)_updateForXPCClientChange
{
  id v44 = +[NSMutableSet set];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  int DeviceClass = GestaltGetDeviceClass();
  id v37 = +[NSMutableSet set];
  uint64_t v55 = 0;
  BOOL v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = self->_xpcConnections;
  id v2 = [(NSMutableSet *)obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (!v2)
  {
    LOBYTE(v3) = 0;
    LOBYTE(v46) = 0;
    unsigned int v39 = 0;
    LOBYTE(v4) = 0;
    char v43 = 0;
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v36 = 0;
    int64_t v5 = -60;
    goto LABEL_49;
  }
  int v3 = 0;
  int v46 = 0;
  unsigned int v39 = 0;
  int v4 = 0;
  char v43 = 0;
  uint64_t v41 = *(void *)v52;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v36 = 0;
  int64_t v5 = -60;
  do
  {
    id v6 = 0;
    id v40 = v2;
    do
    {
      if (*(void *)v52 != v41) {
        objc_enumerationMutation(obj);
      }
      BOOL v7 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v6);
      uint64_t v8 = [v7 client];
      unint64_t v9 = (unint64_t)[v8 controlFlags];

      id v10 = [v7 client];
      uint64_t v11 = [v10 deviceFilter];

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100015840;
      v48[3] = &unk_100121720;
      id v49 = v44;
      v50 = v7;
      [v11 enumerateObjectsUsingBlock:v48];
      if ((v9 & 0x10000) != 0) {
        v43 |= [v11 count] == 0;
      }
      if ((v9 & 0x2104000000) != 0 && !self->_prefCommunal)
      {
        v60[3] |= v9;
        *((unsigned char *)v56 + 24) = 1;
        if ((v9 & 2) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        v60[3] |= v9;
        goto LABEL_12;
      }
      if ((v9 & 2) != 0) {
        goto LABEL_11;
      }
LABEL_12:
      if ((v9 & 0x8000) != 0) {
        *((unsigned char *)v56 + 24) = 1;
      }
      if (DeviceClass != 11
        && (v9 & 0x10000000000) != 0
        && (([v7 needsCLink] & 1) != 0
         || [v7 needsNearbyActionV2]))
      {
        LOBYTE(v36) = 1;
      }
      if ((v9 & 0x200000000) != 0)
      {
        BYTE4(v36) = 1;
        *((unsigned char *)v56 + 24) = 1;
      }
      if ((v9 & 0x20000) != 0
        && (([v7 needsCLink] & 1) != 0
         || [v7 needsNearbyActionV2]))
      {
        id v12 = [v7 client];
        char v13 = [v12 destinationDevice];
        long long v14 = [v13 identifier];

        [v37 addObject:v14];
      }
      if ((v9 & 0x10000) != 0)
      {
        BOOL v15 = [v7 client];
        BOOL v16 = (uint64_t)[v15 bleScreenOffRescanInterval] > 0;

        if (v16)
        {
          int v17 = [v7 client];
          uint64_t v35 = (uint64_t)[v17 bleScreenOffRescanInterval];
        }
        char v18 = [v7 client];
        if ([v18 bleScreenOffScanRate] <= v39) {
          goto LABEL_31;
        }
        char v19 = [v7 client];
        BOOL v20 = [v19 bleScreenOffScanRate] < 0x15;

        if (v20)
        {
          char v18 = [v7 client];
          unsigned int v39 = [v18 bleScreenOffScanRate];
LABEL_31:
        }
      }
      if (DeviceClass == 6 && (v9 & 0x10000000000000) != 0) {
        _os_feature_enabled_impl();
      }
      char v21 = [v7 client];
      id v22 = [v21 rssiThreshold];

      if ((uint64_t)v22 < v5 && v22 != 0) {
        int64_t v5 = (int64_t)v22;
      }
      BOOL v24 = *((unsigned char *)v56 + 24) != 0;

      v4 |= (v9 >> 16) & 1;
      v3 |= (v9 >> 13) & 1;
      v46 |= (v9 >> 35) & 1;
      if (v24 & v4)
      {
        LOBYTE(v4) = 1;
        goto LABEL_49;
      }
      id v6 = (char *)v6 + 1;
    }
    while (v40 != v6);
    id v2 = [(NSMutableSet *)obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  }
  while (v2);
LABEL_49:

  if (!self->_prefCommunal)
  {
    xpcMatchingMap = self->_xpcMatchingMap;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100015974;
    v47[3] = &unk_100121748;
    v47[4] = &v59;
    v47[5] = &v55;
    [(NSMutableDictionary *)xpcMatchingMap enumerateKeysAndObjectsUsingBlock:v47];
  }
  self->_bleDiscoveryControlFlags = v60[3];
  self->_bleDiscoveryForce = *((unsigned char *)v56 + 24);
  self->_bleProximityDetection = BYTE4(v36) & 1;
  self->_discoverPairedDevices = v3 & 1;
  self->_bleRSSIThreshold = v5;
  self->_enableAWDLGuestDiscovery = v46 & 1;
  if (v39) {
    unsigned int v26 = v39;
  }
  else {
    unsigned int v26 = 10;
  }
  self->_bleDiscoveryScreenOffScanRate = v26;
  if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v27 = 0;
  }
  else {
    int64_t v27 = v35;
  }
  self->_bleDiscoveryScreenOffRescanInterval = v27;
  BOOL needsAWDLTransaction = self->_needsAWDLTransaction;
  if (needsAWDLTransaction != (v36 & 1))
  {
    if (dword_100140E48 <= 30)
    {
      if (dword_100140E48 != -1) {
        goto LABEL_60;
      }
      if (_LogCategory_Initialize())
      {
        BOOL needsAWDLTransaction = self->_needsAWDLTransaction;
LABEL_60:
        BOOL v29 = "yes";
        if (needsAWDLTransaction) {
          long long v30 = "yes";
        }
        else {
          long long v30 = "no";
        }
        if ((v36 & 1) == 0) {
          BOOL v29 = "no";
        }
        v33 = v30;
        v34 = v29;
        LogPrintF();
      }
    }
    self->_BOOL needsAWDLTransaction = v36 & 1;
  }
  if (v43)
  {
    screenOffDeviceFilter = self->_screenOffDeviceFilter;
    self->_screenOffDeviceFilter = 0;

    BOOL v32 = 1;
  }
  else
  {
    objc_storeStrong((id *)&self->_screenOffDeviceFilter, v44);
    BOOL v32 = (v4 & 1) != 0 && [v44 count] != 0;
  }
  self->_bleDiscoveryScreenOff = v32;
  if (objc_msgSend(v37, "count", v33, v34))
  {
    [v37 minusSet:self->_needsAWDLSentToPeers];
    if ([v37 count]) {
      objc_storeStrong((id *)&self->_needsAWDLNewPeers, v37);
    }
  }
  [(RPCompanionLinkDaemon *)self _update];
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v59, 8);
}

- (void)_updateForXPCServerChange
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = self->_xpcConnections;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v2);
        }
        unint64_t v9 = [*(id *)(*((void *)&v20 + 1) + 8 * i) server];
        id v10 = v9;
        if (v9)
        {
          if ((~(unsigned __int16)[v9 controlFlags] & 0x404) == 0)
          {
            unsigned int v11 = [v10 passwordType];
            if (v11 > 4 || ((1 << v11) & 0x19) == 0) {
              char v6 = 1;
            }
          }
          v5 |= [v10 advertiseDeviceName];
        }
      }
      id v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
    char v6 = 0;
  }

  if (self->_serverBonjourInfraPairing != (v6 & 1))
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      char v13 = "yes";
      if (v6) {
        long long v14 = "no";
      }
      else {
        long long v14 = "yes";
      }
      if ((v6 & 1) == 0) {
        char v13 = "no";
      }
      int v17 = v14;
      char v18 = v13;
      LogPrintF();
    }
    self->_serverBonjourInfraPairing = v6 & 1;
    [(RPCompanionLinkDaemon *)self _update];
  }
  if (self->_bonjourAWDLAdvertiseForPairing != (v5 & 1))
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      BOOL v15 = "yes";
      if (v5) {
        BOOL v16 = "no";
      }
      else {
        BOOL v16 = "yes";
      }
      if ((v5 & 1) == 0) {
        BOOL v15 = "no";
      }
      int v17 = v16;
      char v18 = v15;
      LogPrintF();
    }
    self->_bonjourAWDLAdvertiseForPairing = v5 & 1;
    [(RPCompanionLinkDaemon *)self _update];
  }
}

- (void)_addApplicationPID:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableSet containsObject:](self->_rbsPIDSet, "containsObject:") & 1) == 0)
  {
    rbsPIDSet = self->_rbsPIDSet;
    if (!rbsPIDSet)
    {
      int v5 = +[NSMutableSet set];
      char v6 = self->_rbsPIDSet;
      self->_rbsPIDSet = v5;

      rbsPIDSet = self->_rbsPIDSet;
    }
    [(NSMutableSet *)rbsPIDSet addObject:v7];
    [(RPCompanionLinkDaemon *)self _updateRBSProcessMonitor];
  }
}

- (void)_removeApplicationPID:(id)a3
{
  id v8 = a3;
  unsigned int v4 = [(NSMutableSet *)self->_rbsPIDSet containsObject:v8];
  int v5 = v8;
  if (v4)
  {
    [(NSMutableSet *)self->_rbsPIDSet removeObject:v8];
    if ([(NSMutableSet *)self->_rbsPIDSet count])
    {
      [(RPCompanionLinkDaemon *)self _updateRBSProcessMonitor];
    }
    else
    {
      if (self->_rbsProcessMonitor)
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(RBSProcessMonitor *)self->_rbsProcessMonitor invalidate];
        rbsProcessMonitor = self->_rbsProcessMonitor;
        self->_rbsProcessMonitor = 0;
      }
      rbsPIDSet = self->_rbsPIDSet;
      self->_rbsPIDSet = 0;
    }
    int v5 = v8;
  }
}

- (void)_updateRBSProcessMonitor
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015EF0;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)isNearbyActionV2AdvertiserActive
{
  return self->_bleNearbyActionV2Advertiser != 0;
}

- (void)_clientEnsureStarted
{
  if (self->_prefBLEClient || self->_bleDiscoveryForce) {
    [(RPCompanionLinkDaemon *)self _clientBLEDiscoveryEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _clientBLEDiscoveryEnsureStopped];
  }
  if ([(RPCompanionLinkDaemon *)self _clientBLEActionDiscoveryShouldRun]) {
    [(RPCompanionLinkDaemon *)self _clientBLEActionDiscoveryEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _clientBLEActionDiscoveryEnsureStopped];
  }
  if (self->_prefIPEnabled) {
    [(RPCompanionLinkDaemon *)self _clientBonjourEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _clientBonjourEnsureStopped];
  }
  if ([(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserShouldRun]) {
    [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserEnsureStopped];
  }
  if ([(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserShouldRun])
  {
    [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserEnsureStarted];
  }
  else
  {
    [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserEnsureStopped];
  }
  if ([(RPCompanionLinkDaemon *)self _serverNearbyInfoV2DiscoveryShouldRun]) {
    [(RPCompanionLinkDaemon *)self _serverNearbyInfoV2DiscoveryEnsureStarted];
  }
  else {
    [(RPCompanionLinkDaemon *)self _serverNearbyInfoV2DiscoveryEnsureStopped];
  }
  if ([(RPCompanionLinkDaemon *)self _clientBonjourAWDLBrowserShouldRun])
  {
    [(RPCompanionLinkDaemon *)self _clientBonjourAWDLBrowserEnsureStarted];
  }
  else
  {
    [(RPCompanionLinkDaemon *)self _clientBonjourAWDLBrowserEnsureStopped];
  }
}

- (void)_clientEnsureStopped
{
  [(RPCompanionLinkDaemon *)self _clientBLEDiscoveryEnsureStopped];
  [(RPCompanionLinkDaemon *)self _clientBLEActionDiscoveryEnsureStopped];
  [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserEnsureStopped];
  [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserEnsureStopped];
  [(RPCompanionLinkDaemon *)self _clientBonjourAWDLBrowserEnsureStopped];
  [(RPCompanionLinkDaemon *)self _clientBonjourEnsureStopped];
  [(NSMutableDictionary *)self->_bleClientConnections enumerateKeysAndObjectsUsingBlock:&stru_100121828];
  [(NSMutableDictionary *)self->_tcpClientConnections enumerateKeysAndObjectsUsingBlock:&stru_100121848];
  tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;

  [(NSMutableDictionary *)tcpOnDemandClientConnections enumerateKeysAndObjectsUsingBlock:&stru_100121868];
}

- (void)_clientBLEActionDiscoveryEnsureStarted
{
  bleActionDiscovery = self->_bleActionDiscovery;
  unsigned int v4 = bleActionDiscovery;
  if (!bleActionDiscovery)
  {
    uint64_t bleActionDiscoveryID = self->_bleActionDiscoveryID;
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = bleActionDiscoveryID;
      LogPrintF();
    }
    char v6 = (SFDeviceDiscovery *)objc_alloc_init(off_100140EB8());
    id v7 = self->_bleActionDiscovery;
    self->_bleActionDiscovery = v6;

    [(SFDeviceDiscovery *)self->_bleActionDiscovery setChangeFlags:1];
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setPurpose:@"CLink"];
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setRssiThreshold:-60];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100016A14;
    v18[3] = &unk_100121890;
    v18[4] = self;
    int v19 = bleActionDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setDeviceFoundHandler:v18];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100016A3C;
    v16[3] = &unk_100121890;
    v16[4] = self;
    int v17 = bleActionDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setDeviceLostHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100016A68;
    v14[3] = &unk_1001218B8;
    v14[4] = self;
    int v15 = bleActionDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setDeviceChangedHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100016A90;
    v12[3] = &unk_1001218E0;
    void v12[4] = self;
    int v13 = bleActionDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setInterruptionHandler:v12];
    unsigned int v4 = self->_bleActionDiscovery;
  }
  if ((self->_bleDiscoveryControlFlags & 0x382000103C00) != 0) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 48;
  }
  if ((id)v8 != [(SFDeviceDiscovery *)v4 discoveryFlags]) {
    [(SFDeviceDiscovery *)self->_bleActionDiscovery setDiscoveryFlags:v8];
  }
  if (!bleActionDiscovery)
  {
    unint64_t v9 = self->_bleActionDiscovery;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100016B28;
    v11[3] = &unk_100121908;
    v11[4] = self;
    [(SFDeviceDiscovery *)v9 activateWithCompletion:v11];
  }
}

- (void)_clientBLEActionDiscoveryEnsureStopped
{
  if (self->_bleActionDiscovery)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t bleActionDiscoveryID = self->_bleActionDiscoveryID;
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleActionDiscovery invalidate];
    bleActionDiscovery = self->_bleActionDiscovery;
    self->_bleActionDiscovery = 0;

    ++self->_bleActionDiscoveryID;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unsigned int v4 = [(NSMutableDictionary *)self->_bleDevices allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = [(NSMutableDictionary *)self->_bleDevices objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          uint64_t v10 = v9;
          if (v9)
          {
            unsigned int v11 = [v9 bleDevice];
            [(RPCompanionLinkDaemon *)self _clientBLEDiscoveryDeviceLost:v11 force:1 deviceFlags:2];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_clientBLEActionDiscoveryShouldRun
{
  unint64_t bleDiscoveryControlFlags = self->_bleDiscoveryControlFlags;
  BOOL v3 = (bleDiscoveryControlFlags & (unint64_t)&_mh_execute_header) != 0
    || (bleDiscoveryControlFlags & 0x2000000000) != 0;
  return bleDiscoveryControlFlags && v3;
}

- (void)_clientBLEDiscoveryEnsureStarted
{
  if (([(CUSystemMonitor *)self->_systemMonitor screenOn] & 1) == 0
    && self->_bleDiscoveryScreenOff
    && [(NSSet *)self->_screenOffDeviceFilter count])
  {
    screenOffDeviceFilter = self->_screenOffDeviceFilter;
  }
  else
  {
    screenOffDeviceFilter = 0;
  }
  unsigned int v4 = screenOffDeviceFilter;
  bleDiscovery = self->_bleDiscovery;
  if (!bleDiscovery) {
    goto LABEL_46;
  }
  unsigned __int8 v6 = [(SFDeviceDiscovery *)bleDiscovery changeFlags];
  BOOL bleProximityDetection = self->_bleProximityDetection;
  if (self->_bleProximityDetection != (v6 & 2) >> 1)
  {
    if (dword_100140E48 <= 30)
    {
      unsigned __int8 v8 = v6;
      if (dword_100140E48 != -1
        || (int v11 = _LogCategory_Initialize(), bleProximityDetection = self->_bleProximityDetection, v11))
      {
        if ((v8 & 2) != 0) {
          CFStringRef v9 = @"YES";
        }
        else {
          CFStringRef v9 = @"NO";
        }
        if (bleProximityDetection) {
          CFStringRef v10 = @"YES";
        }
        else {
          CFStringRef v10 = @"NO";
        }
        CFStringRef v34 = v9;
        uint64_t v36 = (void *)v10;
        LogPrintF();
        BOOL bleProximityDetection = self->_bleProximityDetection;
      }
    }
    [(SFDeviceDiscovery *)self->_bleDiscovery setChangeFlags:[(SFDeviceDiscovery *)self->_bleDiscovery changeFlags] & 0xFFFFFFFD | (2 * bleProximityDetection)];
  }
  if ([(SFDeviceDiscovery *)self->_bleDiscovery rssiThreshold] != self->_bleRSSIThreshold)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v35 = [(SFDeviceDiscovery *)self->_bleDiscovery rssiThreshold];
      int64_t bleRSSIThreshold = self->_bleRSSIThreshold;
      LogPrintF();
      -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_bleRSSIThreshold, v35, bleRSSIThreshold);
    }
    else
    {
      -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_bleRSSIThreshold, v34, v36);
    }
  }
  if ([(NSSet *)v4 count]
    || ([(SFDeviceDiscovery *)self->_bleDiscovery deviceFilter],
        id v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = [v12 count],
        v12,
        v13))
  {
    long long v14 = [(SFDeviceDiscovery *)self->_bleDiscovery deviceFilter];
    long long v15 = v4;
    long long v16 = v14;
    if (v15 == v16)
    {
    }
    else
    {
      int v17 = v16;
      if ((v15 == 0) == (v16 != 0))
      {

LABEL_34:
        int v20 = 0;
        int v19 = 30;
LABEL_35:
        if (v19 >= dword_100140E48 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          if (v20) {
            CFStringRef v21 = @"NO";
          }
          else {
            CFStringRef v21 = @"YES";
          }
          uint64_t v36 = [(SFDeviceDiscovery *)self->_bleDiscovery deviceFilter];
          v38 = v15;
          CFStringRef v34 = v21;
          LogPrintF();
        }
        if ((v20 & 1) == 0) {
          [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceFilter:v15];
        }
        goto LABEL_44;
      }
      unsigned int v18 = [(NSSet *)v15 isEqual:v16];

      if (!v18) {
        goto LABEL_34;
      }
    }
    int v19 = 10;
    int v20 = 1;
    goto LABEL_35;
  }
LABEL_44:
  if (self->_bleDiscovery)
  {
    int v22 = 0;
    goto LABEL_56;
  }
LABEL_46:
  CFStringRef bleDiscoveryID = (const __CFString *)self->_bleDiscoveryID;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v34 = bleDiscoveryID;
    LogPrintF();
  }
  BOOL v24 = (SFDeviceDiscovery *)objc_alloc_init(off_100140EB8());
  v25 = self->_bleDiscovery;
  self->_bleDiscovery = v24;

  [(SFDeviceDiscovery *)self->_bleDiscovery setChangeFlags:1];
  if (self->_bleProximityDetection) {
    [(SFDeviceDiscovery *)self->_bleDiscovery setChangeFlags:[(SFDeviceDiscovery *)self->_bleDiscovery changeFlags] | 2];
  }
  int v22 = 1;
  -[SFDeviceDiscovery setRssiChangeDetection:](self->_bleDiscovery, "setRssiChangeDetection:", 1, v34, v36, v38);
  [(SFDeviceDiscovery *)self->_bleDiscovery setDispatchQueue:self->_dispatchQueue];
  [(SFDeviceDiscovery *)self->_bleDiscovery setPurpose:@"CLink"];
  if (self->_bleRSSIThreshold) {
    int64_t v26 = self->_bleRSSIThreshold;
  }
  else {
    int64_t v26 = -60;
  }
  [(SFDeviceDiscovery *)self->_bleDiscovery setRssiThreshold:v26];
  [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceFilter:v4];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100017474;
  v46[3] = &unk_100121890;
  v46[4] = self;
  int v47 = (int)bleDiscoveryID;
  [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceFoundHandler:v46];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10001749C;
  v44[3] = &unk_100121890;
  v44[4] = self;
  int v45 = (int)bleDiscoveryID;
  [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceLostHandler:v44];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000174C8;
  v42[3] = &unk_1001218B8;
  v42[4] = self;
  int v43 = (int)bleDiscoveryID;
  [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceChangedHandler:v42];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000174F0;
  v40[3] = &unk_1001218E0;
  v40[4] = self;
  int v41 = (int)bleDiscoveryID;
  [(SFDeviceDiscovery *)self->_bleDiscovery setInterruptionHandler:v40];
LABEL_56:
  if ((self->_bleDiscoveryControlFlags & 0x380000103C00) != 0)
  {
    uint64_t v27 = 1;
  }
  else
  {
    unsigned int v28 = [(RPCompanionLinkDaemon *)self _clientShouldFindNonSameAccountDevices];
    if (v4) {
      int v29 = 1;
    }
    else {
      int v29 = v28;
    }
    if (v29) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = 33;
    }
  }
  if ((id)v27 != [(SFDeviceDiscovery *)self->_bleDiscovery discoveryFlags]) {
    [(SFDeviceDiscovery *)self->_bleDiscovery setDiscoveryFlags:v27];
  }
  unsigned int v30 = [(SFDeviceDiscovery *)self->_bleDiscovery overrideScreenOff];
  int bleDiscoveryScreenOff = self->_bleDiscoveryScreenOff;
  if (bleDiscoveryScreenOff != v30) {
    [(SFDeviceDiscovery *)self->_bleDiscovery setOverrideScreenOff:bleDiscoveryScreenOff != 0];
  }
  if ([(SFDeviceDiscovery *)self->_bleDiscovery overrideScreenOffRescanInterval] != self->_bleDiscoveryScreenOffRescanInterval) {
    -[SFDeviceDiscovery setOverrideScreenOffRescanInterval:](self->_bleDiscovery, "setOverrideScreenOffRescanInterval:");
  }
  if ([(CUSystemMonitor *)self->_systemMonitor screenOn]) {
    uint64_t bleDiscoveryScreenOffScanRate = 0;
  }
  else {
    uint64_t bleDiscoveryScreenOffScanRate = self->_bleDiscoveryScreenOffScanRate;
  }
  [(SFDeviceDiscovery *)self->_bleDiscovery setScanRate:bleDiscoveryScreenOffScanRate];
  if (v22)
  {
    v33 = self->_bleDiscovery;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100017588;
    v39[3] = &unk_100121908;
    v39[4] = self;
    [(SFDeviceDiscovery *)v33 activateWithCompletion:v39];
  }
}

- (void)_clientBLEDiscoveryEnsureStopped
{
  if (self->_bleDiscovery)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t bleDiscoveryID = self->_bleDiscoveryID;
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleDiscovery invalidate];
    bleDiscovery = self->_bleDiscovery;
    self->_bleDiscovery = 0;

    ++self->_bleDiscoveryID;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unsigned int v4 = [(NSMutableDictionary *)self->_bleDevices allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          CFStringRef v9 = [(NSMutableDictionary *)self->_bleDevices objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          CFStringRef v10 = v9;
          if (v9)
          {
            int v11 = [v9 bleDevice];
            [(RPCompanionLinkDaemon *)self _clientBLEDiscoveryDeviceLost:v11 force:1 deviceFlags:1];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    pendingLostBLEDevicesTimer = self->_pendingLostBLEDevicesTimer;
    if (pendingLostBLEDevicesTimer)
    {
      dispatch_source_cancel(pendingLostBLEDevicesTimer);
      id v13 = self->_pendingLostBLEDevicesTimer;
      self->_pendingLostBLEDevicesTimer = 0;
    }
    [(CUUserNotificationSession *)self->_uiNoteSession invalidate];
    uiNoteSession = self->_uiNoteSession;
    self->_uiNoteSession = 0;

    [(NSMutableDictionary *)self->_uiNoteDevices removeAllObjects];
    uiNoteDevices = self->_uiNoteDevices;
    self->_uiNoteDevices = 0;
  }
}

- (BOOL)_clientBLETriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  CFStringRef v9 = &v14;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000179A4;
    v13[3] = &unk_100121930;
    v13[4] = &v14;
    void v13[5] = a5;
    [(SFDeviceDiscovery *)bleDiscovery triggerEnhancedDiscovery:v8 useCase:v6 completion:v13];
LABEL_5:
    CFStringRef v9 = v15;
    goto LABEL_6;
  }
  if (a5)
  {
    RPErrorF();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  char v11 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)_clientBLEDiscoveryDeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 idsIdentifier];
  if (!v7)
  {
    CFStringRef v10 = 0;
LABEL_9:
    uint64_t v14 = [v6 identifier];
    long long v15 = [v14 UUIDString];

    if (v7 && v15)
    {
      uint64_t v16 = [(NSMutableDictionary *)self->_bleDevices objectForKeyedSubscript:v15];
      if (v16)
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v49 = v4;
          v50 = &unk_100119850;
          unint64_t v47 = [v16 deviceFlags];
          uint64_t v48 = &unk_100119850;
          uint64_t v42 = v15;
          id v45 = v7;
          LogPrintF();
        }
        uint64_t v4 = [v16 deviceFlags:v42, v45, v47, v48, v49, v50] | v4;
        char v17 = [v16 bleDevice];
        [(RPCompanionLinkDaemon *)self _clientBLEDiscoveryDeviceLost:v17 force:1 deviceFlags:7];
      }
    }
    if (v7) {
      long long v18 = v7;
    }
    else {
      long long v18 = v15;
    }
    id v19 = v18;
    if (v19)
    {
      long long v20 = [(NSMutableDictionary *)self->_bleDevices objectForKeyedSubscript:v19];
      if (v20)
      {
        CFStringRef v21 = v20;
        long long v51 = v15;
        long long v52 = v10;
        unsigned int v22 = [v20 statusFlags];
        long long v23 = [v21 bleDevice];
        unsigned int v24 = [v23 isBLEDeviceReplaced];

        if (v24 && dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v42 = [v21 bleDevice];
          id v45 = v6;
          LogPrintF();
        }
        id v39 = [v21 updateWithSFDevice:v6, v42, v45];
        [v21 setDeviceFlags:[v21 deviceFlags] | v4];
        if (dword_100140E48 <= 10)
        {
          if (dword_100140E48 != -1 || _LogCategory_Initialize())
          {
            CUDescriptionWithLevel();
            uint64_t v46 = v4;
            id v44 = v47 = (unint64_t)&unk_100119850;
            LogPrintF();
          }
          if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v44 = CUDescriptionWithLevel();
            LogPrintF();
          }
        }
        long long v15 = v51;
        if (v39)
        {
          [(RPCompanionLinkDaemon *)self _clientReportChangedDevice:v21 changes:v39];
          id v40 = [v21 statusFlags];
          if ((v22 & 0x200000) == 0 && (v40 & 0x200000) != 0) {
            [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryUINoteDevice:v21];
          }
          unsigned int v41 = [v21 statusFlags:v44, v46, v47];
          if ((v22 & 0x40000000) == 0 && (v41 & 0x40000000) != 0) {
            [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCompanionAuthenticationDevice:v21];
          }
          if (v39)
          {
            if ([(RPCompanionLinkDevice *)self->_bleNearbyActionV2Device isEqualToDevice:v21])
            {
              [(RPCompanionLinkDevice *)self->_bleNearbyActionV2Device updateWithSFDevice:v6];
              [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserUpdate];
            }
            if ([(RPCompanionLinkDevice *)self->_bleNeedsCLinkDevice isEqualToDevice:v21])
            {
              [(RPCompanionLinkDevice *)self->_bleNeedsCLinkDevice updateWithSFDevice:v6];
              [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserUpdate];
            }
          }
        }

        CFStringRef v10 = v52;
      }
      else
      {
        v25 = v15;
        if (dword_100140E48 < 31 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          int64_t v26 = CUDescriptionWithLevel();
          uint64_t v27 = [v6 bleDevice];
          unint64_t v47 = v4;
          uint64_t v48 = &unk_100119850;
          uint64_t v42 = v26;
          id v45 = [v27 rssi];
          LogPrintF();
        }
        id v28 = objc_alloc_init((Class)RPCompanionLinkDevice);
        [v28 setIdentifier:v19];
        int v29 = v10;
        [v28 setIdsDevice:v10];
        [v28 setIdsDeviceIdentifier:v7];
        [v28 updateWithSFDevice:v6];
        [v28 setDeviceFlags:[v28 deviceFlags] | v4];
        if (self->_prefIgnoreCompanionLinkChecks)
        {
          unsigned int v30 = RPVersionToSourceVersionString();
          [v28 setSourceVersion:v30];
        }
        long long v31 = +[RPCloudDaemon sharedCloudDaemon];
        BOOL v32 = [v31 idsFamilyEndpointMap];

        v33 = [v32 objectForKeyedSubscript:v7];
        CFStringRef v34 = v33;
        if (v33)
        {
          id v35 = [v33 familyEndpointData];
          [v28 updateWithFamilyEndpoint:v35];
        }
        bleDevices = self->_bleDevices;
        if (!bleDevices)
        {
          id v37 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v38 = self->_bleDevices;
          self->_bleDevices = v37;

          bleDevices = self->_bleDevices;
        }
        [(NSMutableDictionary *)bleDevices setObject:v28 forKeyedSubscript:v19];
        [(RPCompanionLinkDaemon *)self _clientReportFoundDevice:v28];
        if (([v28 statusFlags] & 0x200000) != 0) {
          [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryUINoteDevice:v28];
        }
        if (([v28 statusFlags] & 0x40000000) != 0) {
          [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCompanionAuthenticationDevice:v28];
        }
        if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          int v43 = CUDescriptionWithLevel();
          LogPrintF();
        }
        CFStringRef v10 = v29;
        long long v15 = v25;
      }
    }
    else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_69;
  }
  id v8 = +[RPCloudDaemon sharedCloudDaemon];
  CFStringRef v9 = [v8 idsDeviceMap];
  CFStringRef v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10 || self->_prefIgnoreCompanionLinkChecks) {
    goto LABEL_9;
  }
  uint64_t v11 = [v6 model];
  if (v11)
  {
    id v12 = (void *)v11;
    int v13 = GestaltProductTypeStringToDeviceClass();
    [v10 operatingSystemVersion];
    if (!v13 || (wInTP56r94EFs9NAAi() & 1) != 0)
    {

      goto LABEL_9;
    }
    if (dword_100140E48 <= 20 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_69:
}

- (void)_clientBLEDiscoveryDeviceLost:(id)a3 force:(BOOL)a4 deviceFlags:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v28 = a3;
  id v8 = [v28 identifier];
  CFStringRef v9 = [v8 UUIDString];

  uint64_t v10 = [v28 idsIdentifier];
  uint64_t v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v9;
  }
  id v13 = v12;
  if (v13)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_bleDevices objectForKeyedSubscript:v13];
    if (!v14 && v9)
    {
      uint64_t v14 = [(NSMutableDictionary *)self->_bleDevices objectForKeyedSubscript:v9];
    }
    if (!v14) {
      goto LABEL_43;
    }
    if (!a4)
    {
      if ([v28 isBLEDeviceReplaced])
      {
        [v14 setDeviceFlags:[v14 deviceFlags] & ~v5];
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          long long v23 = v28;
          LogPrintF();
        }
        unsigned int v22 = [v14 bleDevice:v23];
        [v22 setIsBLEDeviceReplaced:1];

        [(RPCompanionLinkDaemon *)self _schedulePendingLostBLEDeviceTimer];
LABEL_43:

        goto LABEL_44;
      }
      if (!v11 || ([v28 deviceFlags] & 0x8000) != 0)
      {
        long long v15 = [v14 bleDevice];
        uint64_t v16 = [v15 identifier];
        char v17 = [v16 UUIDString];

        if (([v9 isEqual:v17] & 1) == 0)
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }

          goto LABEL_43;
        }
      }
    }
    [v14 setDeviceFlags:[v14 deviceFlags] & ~v5];
    unint64_t v18 = (unint64_t)[v14 statusFlags];
    unint64_t v19 = [(RPCompanionLinkDaemon *)self _nearbyActionDeviceActionTypes];
    if (([v14 deviceFlags] & 7) != 0)
    {
      if (([v14 deviceFlags] & 2) != 0 || (v19 & v18) == 0)
      {
        if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          v25 = CUDescriptionWithLevel();
          LogPrintF();
        }
      }
      else
      {
        [v14 setStatusFlags:((unint64_t)[v14 statusFlags] & ~v19)];
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          unsigned int v24 = CUDescriptionWithLevel();
          LogPrintF();

          -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v14, v24);
        }
        else
        {
          -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v14, v23);
        }
      }
    }
    else
    {
      if (v9) {
        [(NSMutableDictionary *)self->_bleDevices setObject:0 forKeyedSubscript:v9];
      }
      if (v11) {
        [(NSMutableDictionary *)self->_bleDevices setObject:0 forKeyedSubscript:v11];
      }
      [v14 removeSFDevice:v28];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        CUDescriptionWithLevel();
        uint64_t v26 = v5;
        long long v23 = v27 = &unk_100119850;
        LogPrintF();
      }
      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v14, v23, v26, v27);
      if ([(RPCompanionLinkDevice *)self->_bleNearbyActionV2Device isEqualToDevice:v14])
      {
        bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
        self->_bleNearbyActionV2Device = 0;

        [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserRestart];
      }
      if ([(RPCompanionLinkDevice *)self->_bleNeedsCLinkDevice isEqualToDevice:v14])
      {
        bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
        self->_bleNeedsCLinkDevice = 0;

        [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserRestart];
      }
    }
    goto LABEL_43;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_44:
}

- (void)_schedulePendingLostBLEDeviceTimer
{
  if (!self->_pendingLostBLEDevicesTimer)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pendingLostBLEDevicesTimer = self->_pendingLostBLEDevicesTimer;
    self->_pendingLostBLEDevicesTimer = v3;

    uint64_t v5 = self->_pendingLostBLEDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100018860;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_pendingLostBLEDevicesTimer);
  }
}

- (void)_processPendingLostBLEDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_bleDevices allValues];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        CFStringRef v9 = [v8 bleDevice];
        unsigned int v10 = [v9 isBLEDeviceReplaced];

        if (v10)
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v13 = v8;
            LogPrintF();
          }
          uint64_t v11 = [v8 bleDevice:v13];
          [v11 setIsBLEDeviceReplaced:0];

          id v12 = [v8 bleDevice];
          [(RPCompanionLinkDaemon *)self _clientBLEDiscoveryDeviceLost:v12 force:0 deviceFlags:0];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (BOOL)_clientShouldFindNonSameAccountDevices
{
  int DeviceClass = GestaltGetDeviceClass();
  if (DeviceClass == 1)
  {
LABEL_4:
    if (self->_inDiscoverySession) {
      goto LABEL_5;
    }
    return 0;
  }
  if (DeviceClass != 4)
  {
    if (DeviceClass != 3) {
      return 0;
    }
    goto LABEL_4;
  }
LABEL_5:
  id v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v5 = [v4 identitiesOfType:12 error:0];

  if ([v5 count])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v8 = [v7 identitiesOfType:13 error:0];

    BOOL v6 = [v8 count] != 0;
  }

  return v6;
}

- (void)_serverNearbyInfoV2DeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = [v6 btAddressData];
  if (v7)
  {
    id v8 = [v6 nearbyInfoV2TempAuthTagData];
    if (v8)
    {
      CFStringRef v9 = +[RPIdentityDaemon sharedIdentityDaemon];
      unsigned int v10 = [v9 resolveIdentityForTempAuthTagData:v8 bluetoothAddressData:v7];

      if (v10)
      {
        uint64_t v11 = [v10 idsDeviceID];
        if (v11)
        {
          id v12 = [(NSMutableDictionary *)self->_nearbyInfoV2Devices objectForKeyedSubscript:v11];
          if (v12)
          {
            id v13 = v12;
            id v14 = [v12 updateWithCBDevice:v6];
            if (v14) {
              [(RPCompanionLinkDaemon *)self _clientReportChangedDevice:v13 changes:v14];
            }
          }
          else
          {
            if (dword_100140E48 < 31 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              CUDescriptionWithLevel();
              uint64_t v32 = v4;
              int v29 = v33 = &unk_100119850;
              uint64_t v31 = (int)[v6 rssi];
              LogPrintF();
            }
            id v13 = objc_alloc_init((Class)RPCompanionLinkDevice);
            [v13 setDeviceFlags:[v13 deviceFlags] | v4];
            [v13 updateWithIdentity:v10];
            [v13 updateWithCBDevice:v6];
            [v13 setStatusFlags:((unint64_t)[v13 statusFlags] | 0x200)];
            nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
            if (!nearbyInfoV2Devices)
            {
              uint64_t v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              id v28 = self->_nearbyInfoV2Devices;
              self->_nearbyInfoV2Devices = v27;

              nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](nearbyInfoV2Devices, "setObject:forKeyedSubscript:", v13, v11, v29, v31, v32, v33);
            [(RPCompanionLinkDaemon *)self _clientReportFoundDevice:v13];
            if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              unsigned int v30 = CUDescriptionWithLevel();
              LogPrintF();
            }
          }
        }
        else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      CFStringRef v34 = v7;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = [(NSMutableDictionary *)self->_nearbyInfoV2Devices allKeys];
      id v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v36 = *(void *)v38;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v38 != v36) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            unint64_t v19 = self;
            long long v20 = [(NSMutableDictionary *)self->_nearbyInfoV2Devices objectForKeyedSubscript:v18];
            CFStringRef v21 = [v20 cbDevice];
            unsigned int v22 = [v21 identifier];
            id v23 = v6;
            unsigned int v24 = [v6 identifier];
            unsigned int v25 = [v22 isEqualToString:v24];

            if (v25)
            {
              if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              id v6 = v23;
              [(RPCompanionLinkDaemon *)v19 _serverNearbyInfoV2DeviceLost:v23 idsIdentifier:v18 force:1 deviceFlags:4];

              goto LABEL_31;
            }

            id v6 = v23;
            self = v19;
          }
          id v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_31:

      id v8 = 0;
      uint64_t v7 = v34;
    }
  }
}

- (void)_serverNearbyInfoV2DeviceLost:(id)a3 idsIdentifier:(id)a4 force:(BOOL)a5 deviceFlags:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v31 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v11 = [v31 identifier];
  uint64_t v12 = [v31 idsDeviceID];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = v10;
  }
  id v15 = v14;

  if (!v15)
  {
    id v16 = [v31 btAddressData];
    uint64_t v17 = [v31 nearbyInfoV2TempAuthTagData];
    uint64_t v18 = (void *)v17;
    if (v16 && v17)
    {
      unint64_t v19 = +[RPIdentityDaemon sharedIdentityDaemon];
      long long v20 = [v19 resolveIdentityForTempAuthTagData:v18 bluetoothAddressData:v16];

      id v15 = [v20 idsDeviceID];
    }
  }
  if (v15) {
    CFStringRef v21 = v15;
  }
  else {
    CFStringRef v21 = v11;
  }
  id v22 = v21;
  if (v22)
  {
    id v23 = [(NSMutableDictionary *)self->_nearbyInfoV2Devices objectForKeyedSubscript:v22];
    if (v23) {
      BOOL v24 = 1;
    }
    else {
      BOOL v24 = v11 == 0;
    }
    if (!v24)
    {
      id v23 = [(NSMutableDictionary *)self->_nearbyInfoV2Devices objectForKeyedSubscript:v11];
    }
    if (!v23) {
      goto LABEL_28;
    }
    [v23 setDeviceFlags:[v23 deviceFlags] & ~v6];
    if (!a5)
    {
      unsigned int v25 = [v23 cbDevice];
      uint64_t v26 = [v25 stableIdentifier];

      if (([v22 isEqual:v26] & 1) == 0)
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }

        goto LABEL_28;
      }
    }
    if (([v23 deviceFlags] & 7) == 0)
    {
      [(NSMutableDictionary *)self->_nearbyInfoV2Devices setObject:0 forKeyedSubscript:v22];
      [v23 removeCBDevice:v31];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v28 = CUDescriptionWithLevel();
        LogPrintF();

        -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v23, v28, v6, &unk_100119850);
      }
      else
      {
        -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v23, v27, v29, v30);
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_29:
}

- (void)_clientBLEFamilyDeviceReportChanges
{
  id v2 = self;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_bleDevices allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v26;
    uint64_t v23 = *(void *)v26;
    BOOL v24 = v3;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(NSMutableDictionary *)v2->_bleDevices objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        CFStringRef v9 = v8;
        if (v8)
        {
          if (([v8 deviceFlags] & 2) != 0)
          {
            uint64_t v10 = [v9 idsDeviceIdentifier];
            if (v10)
            {
              uint64_t v11 = (void *)v10;
              uint64_t v12 = +[RPCloudDaemon sharedCloudDaemon];
              id v13 = [v12 idsFamilyEndpointMap];
              [v13 objectForKeyedSubscript:v11];
              v15 = id v14 = v2;
              id v16 = [v15 familyEndpointData];
              id v17 = [v9 updateWithFamilyEndpoint:v16];

              id v2 = v14;
              if (v17)
              {
                if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v18 = [v9 name];
                  id v22 = [v9 sourceVersion];
                  LogPrintF();

                  -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](v14, "_clientReportChangedDevice:changes:", v9, v17, v11, v18, v22);
                }
                else
                {
                  -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](v14, "_clientReportChangedDevice:changes:", v9, v17, v19, v20, v21);
                }
              }

              uint64_t v6 = v23;
              BOOL v3 = v24;
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
}

- (void)_clientBLENeedsCLinkAdvertiserEnsureStarted
{
  if (!self->_bleNeedsCLinkAdvertiser)
  {
    BOOL v3 = [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkTargetDevice];
    id v4 = v3;
    if (!self->_enableAWDLGuestDiscovery && v3 == 0)
    {
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_bleNeedsCLinkDevice, v3);
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v6 = (SFService *)objc_alloc_init(off_100140EC0());
      bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
      self->_bleNeedsCLinkAdvertiser = v6;

      [(SFService *)self->_bleNeedsCLinkAdvertiser setAdvertiseRate:60];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setDeviceActionType:51];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setDispatchQueue:self->_dispatchQueue];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setIdentifier:@"bb6e0a35-ca03-4151-8feb-f6bcae4d9a41"];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setLabel:@"CLink"];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setNeedsKeyboard:1];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setPairSetupDisabled:1];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setOverrideScreenOff:self->_bleNeedsCLinkAdvertiserScreenOff];
      id v8 = [(RPCompanionLinkDevice *)self->_bleNeedsCLinkDevice bleTargetData];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setTargetAuthTag:v8];

      CFStringRef v9 = self->_bleNeedsCLinkAdvertiser;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000197D8;
      v10[3] = &unk_100121908;
      v10[4] = self;
      [(SFService *)v9 activateWithCompletion:v10];
      [(RPCompanionLinkDaemon *)self _clientSendNeedsAWDLOverWiFi:1];
    }
  }
}

- (void)_clientBLENeedsCLinkAdvertiserUpdate
{
  bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
  if (!bleNeedsCLinkAdvertiser || !self->_bleNeedsCLinkDevice) {
    return;
  }
  id v4 = [(SFService *)bleNeedsCLinkAdvertiser targetAuthTag];
  id v5 = [(RPCompanionLinkDevice *)self->_bleNeedsCLinkDevice bleTargetData];
  id v10 = v4;
  id v6 = v5;
  if (v10 != v6)
  {
    if ((v10 == 0) != (v6 != 0))
    {
      unsigned __int8 v7 = [v10 isEqual:v6];

      if (v7) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v6, v10, v6);
    }
    else
    {
      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v6, v8, v9);
    }
    goto LABEL_15;
  }

LABEL_15:
}

- (void)_clientBLENeedsCLinkAdvertiserRestart
{
  bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
  self->_bleNeedsCLinkDevice = 0;

  if ([(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserShouldRun])
  {
    id v4 = [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkTargetDevice];
    id v5 = self->_bleNeedsCLinkDevice;
    self->_bleNeedsCLinkDevice = v4;

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_bleNeedsCLinkAdvertiser)
    {
      id v6 = [(RPCompanionLinkDevice *)self->_bleNeedsCLinkDevice bleTargetData];
      [(SFService *)self->_bleNeedsCLinkAdvertiser setTargetAuthTag:v6];

      bleNeedsCLinkAdvertiserProcessName = self->_bleNeedsCLinkAdvertiserProcessName;
      if (bleNeedsCLinkAdvertiserProcessName)
      {
        uint64_t v8 = bleNeedsCLinkAdvertiserProcessName;
        id v9 = +[RPMetrics sharedMetrics];
        [v9 logNeedsAWDLAdvertisementClient:v8 actionType:51 bluetoothType:15];
      }
    }
    else
    {
      [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserEnsureStarted];
    }
  }
  else
  {
    [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserEnsureStopped];
  }
}

- (void)_clientBLENeedsCLinkAdvertiserEnsureStopped
{
  if (self->_bleNeedsCLinkAdvertiser)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkDaemon *)self _clientPurgeUnauthAWDLDevices];
    [(SFService *)self->_bleNeedsCLinkAdvertiser invalidate];
    bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
    self->_bleNeedsCLinkAdvertiser = 0;

    bleNeedsCLinkAdvertiserProcessName = self->_bleNeedsCLinkAdvertiserProcessName;
    self->_bleNeedsCLinkAdvertiserProcessName = 0;

    bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
    self->_bleNeedsCLinkDevice = 0;

    [(RPCompanionLinkDaemon *)self _clientSendNeedsAWDLOverWiFi:0];
  }
}

- (BOOL)_clientBLENeedsCLinkAdvertiserShouldRun
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v3 = self->_xpcConnections;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "needsCLink", (void)v21))
        {
          uint64_t v11 = [v10 netCnx];
          unsigned int v12 = [v11 state];

          if (v12 != 1)
          {
            id v13 = [v10 xpcCnx];
            sub_10000E944((uint64_t)[v13 processIdentifier]);
            id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
            bleNeedsCLinkAdvertiserProcessName = self->_bleNeedsCLinkAdvertiserProcessName;
            self->_bleNeedsCLinkAdvertiserProcessName = v14;

            if (GestaltGetDeviceClass() == 1)
            {
              id v16 = [v10 client];
              id v17 = [v16 serviceType];
              if ([v17 isEqualToString:@"com.apple.ApplicationService.chrono"])
              {
                LOBYTE(v18) = 1;
              }
              else
              {
                uint64_t v19 = [v10 client];
                unint64_t v18 = ((unint64_t)[v19 controlFlags] >> 51) & 1;
              }
            }
            else
            {
              LOBYTE(v18) = 0;
            }
            v6 |= v18;
            char v7 = 1;
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
    char v7 = 0;
  }

  self->_bleNeedsCLinkAdvertiserScreenOff = v6 & 1;
  return v7 & 1;
}

- (id)_clientBLENeedsCLinkTargetDevice
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = self->_xpcConnections;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v15 != v4) {
        objc_enumerationMutation(v2);
      }
      char v6 = *(void **)(*((void *)&v14 + 1) + 8 * v5);
      if (objc_msgSend(v6, "needsCLink", (void)v14))
      {
        char v7 = [v6 netCnx];
        unsigned int v8 = [v7 state];

        if (v8 != 1)
        {
          id v9 = [v6 daemonDevice];

          if (v9)
          {
            id v10 = [v6 daemonDevice];
            unsigned __int8 v11 = [v10 statusFlags];

            if ((v11 & 2) != 0) {
              break;
            }
          }
        }
      }
      if (v3 == (id)++v5)
      {
        id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    unsigned int v12 = v6;

    if (v12)
    {
      id v3 = [(NSMutableSet *)v12 daemonDevice];
      id v2 = v12;
      goto LABEL_15;
    }
    id v3 = 0;
  }
  else
  {
LABEL_15:
  }

  return v3;
}

- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = self->_xpcConnections;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "needsNearbyActionV2", (void)v17))
        {
          id v9 = [v8 netCnx];
          unsigned int v10 = [v9 state];

          if (v10 != 1)
          {
            unsigned __int8 v11 = [v8 bonjourDevice];

            if (!v11)
            {
              id v13 = [v8 xpcCnx];
              sub_10000E944((uint64_t)[v13 processIdentifier]);
              long long v14 = (NSString *)objc_claimAutoreleasedReturnValue();
              bleNearbyActionV2AdvertiserProcessName = self->_bleNearbyActionV2AdvertiserProcessName;
              self->_bleNearbyActionV2AdvertiserProcessName = v14;

              BOOL v12 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted
{
  if (self->_bleNearbyActionV2Advertiser)
  {
    [(RPCompanionLinkDaemon *)self _clientSendNeedsAWDLOverWiFi:1];
  }
  else
  {
    if (self->_bleNearbyActionV2Device) {
      goto LABEL_18;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = self->_xpcConnections;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          unsigned int v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v8 needsNearbyActionV2])
          {
            id v9 = [v8 bonjourDevice];

            if (!v9)
            {
              unsigned int v10 = [v8 daemonDevice];
              bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
              self->_bleNearbyActionV2Device = v10;

              goto LABEL_17;
            }
          }
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    if (self->_bleNearbyActionV2Device)
    {
LABEL_18:
      BOOL v12 = objc_alloc_init(RPNearbyActionV2Advertiser);
      bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
      self->_bleNearbyActionV2Advertiser = v12;

      [(RPNearbyActionV2Advertiser *)self->_bleNearbyActionV2Advertiser setDispatchQueue:self->_dispatchQueue];
      long long v14 = [(RPCompanionLinkDevice *)self->_bleNearbyActionV2Device bleTargetData];
      [(RPNearbyActionV2Advertiser *)self->_bleNearbyActionV2Advertiser setTargetData:v14];

      [(RPNearbyActionV2Advertiser *)self->_bleNearbyActionV2Advertiser setNearbyActionType:[(RPCompanionLinkDevice *)self->_bleNearbyActionV2Device nearbyActionV2Type]];
      long long v15 = self->_bleNearbyActionV2Advertiser;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001A4B4;
      v16[3] = &unk_100121908;
      v16[4] = self;
      [(RPNearbyActionV2Advertiser *)v15 activateWithCompletion:v16];
      [(RPCompanionLinkDaemon *)self _clientSendNeedsAWDLOverWiFi:1];
    }
    else if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_clientBLENearbyActionV2AdvertiserUpdate
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (!bleNearbyActionV2Advertiser || !self->_bleNearbyActionV2Device) {
    return;
  }
  id v4 = [(RPNearbyActionV2Advertiser *)bleNearbyActionV2Advertiser targetData];
  id v5 = [(RPCompanionLinkDevice *)self->_bleNearbyActionV2Device bleTargetData];
  id v10 = v4;
  id v6 = v5;
  if (v10 != v6)
  {
    if ((v10 == 0) != (v6 != 0))
    {
      unsigned __int8 v7 = [v10 isEqual:v6];

      if (v7) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6, v10, v6);
    }
    else
    {
      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6, v8, v9);
    }
    goto LABEL_15;
  }

LABEL_15:
}

- (void)_clientBLENearbyActionV2AdvertiserRestart
{
  [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserEnsureStopped];
  if ([(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserShouldRun])
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserEnsureStarted];
  }
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser)
  {
    [(RPNearbyActionV2Advertiser *)bleNearbyActionV2Advertiser invalidate];
    id v4 = self->_bleNearbyActionV2Advertiser;
    self->_bleNearbyActionV2Advertiser = 0;

    bleNearbyActionV2AdvertiserProcessName = self->_bleNearbyActionV2AdvertiserProcessName;
    self->_bleNearbyActionV2AdvertiserProcessName = 0;

    bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    self->_bleNearbyActionV2Device = 0;

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkDaemon *)self _clientSendNeedsAWDLOverWiFi:0];
  }
}

- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 608;
  if (a3) {
    uint64_t v5 = 592;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = "disable";
    uint64_t v9 = *(void *)v28;
    if (v3) {
      uint64_t v8 = "enable";
    }
    long long v21 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v26 = 0;
        BOOL v12 = [(RPCompanionLinkDaemon *)self findConnectedDeviceForIdentifier:v11 controlFlags:0x400000 cnx:&v26];
        if (v12
          && ([v26 linkType] == 6
           || [v26 linkType] == 8
           || [v26 linkType] == 7))
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            long long v19 = v12;
            id v20 = v26;
            long long v18 = v21;
            LogPrintF();
          }
          id v13 = +[NSMutableDictionary dictionary];
          long long v14 = [(RPCompanionLinkDevice *)self->_localDeviceInfo identifier];
          [v13 setObject:v14 forKeyedSubscript:@"_i"];

          long long v15 = +[NSNumber numberWithBool:v3];
          [v13 setObject:v15 forKeyedSubscript:@"_ena"];

          v24[0] = 0;
          v24[1] = v24;
          v24[2] = 0x2020000000;
          BOOL v25 = v3;
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10001AB78;
          v23[3] = &unk_100121958;
          v23[5] = v11;
          v23[6] = v24;
          v23[4] = self;
          [v26 sendEncryptedEventID:@"_needsAWDL" event:v13 options:0 completion:v23];
          _Block_object_dispose(v24, 8);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  if (!v3)
  {
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;
  }
  needsAWDLNewPeers = self->_needsAWDLNewPeers;
  self->_needsAWDLNewPeers = 0;
}

- (void)_clientBonjourEnsureStarted
{
  if (!self->_bonjourBrowser)
  {
    if (self->_btAdvAddrData || !self->_prefServerShouldRun)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v3 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
      bonjourBrowser = self->_bonjourBrowser;
      self->_bonjourBrowser = v3;

      [(CUBonjourBrowser *)self->_bonjourBrowser setChangeFlags:0xFFFFFFFFLL];
      [(CUBonjourBrowser *)self->_bonjourBrowser setControlFlags:1];
      [(CUBonjourBrowser *)self->_bonjourBrowser setDispatchQueue:self->_dispatchQueue];
      [(CUBonjourBrowser *)self->_bonjourBrowser setDomain:@"local."];
      [(CUBonjourBrowser *)self->_bonjourBrowser setLabel:@"CLink"];
      [(CUBonjourBrowser *)self->_bonjourBrowser setServiceType:@"_companion-link._tcp"];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10001AED0;
      v7[3] = &unk_100121980;
      void v7[4] = self;
      [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceFoundHandler:v7];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10001AEEC;
      v6[3] = &unk_100121980;
      v6[4] = self;
      [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceLostHandler:v6];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10001AF04;
      v5[3] = &unk_1001219A8;
      v5[4] = self;
      [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceChangedHandler:v5];
      [(CUBonjourBrowser *)self->_bonjourBrowser activate];
    }
    else if (dword_100140E48 <= 20 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_clientBonjourEnsureStopped
{
  if (self->_bonjourBrowser)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUBonjourBrowser *)self->_bonjourBrowser invalidate];
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;

    bonjourReevaluateTimer = self->_bonjourReevaluateTimer;
    if (bonjourReevaluateTimer)
    {
      id v6 = bonjourReevaluateTimer;
      dispatch_source_cancel(v6);
      uint64_t v5 = self->_bonjourReevaluateTimer;
      self->_bonjourReevaluateTimer = 0;
    }
  }
}

- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 txtDictionary];
  if (!self->_btAdvAddrStr) {
    goto LABEL_13;
  }
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();
  id v9 = v8;
  if (v8)
  {
    if ([v8 isEqual:self->_btAdvAddrStr])
    {
      if (dword_100140E48 > 10 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_69;
      }
      id v10 = v6;
      if (objc_opt_respondsToSelector()) {
        goto LABEL_7;
      }
      if (objc_opt_respondsToSelector()) {
        goto LABEL_56;
      }
      goto LABEL_67;
    }

LABEL_13:
    CFDictionaryGetInt64();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v9 = objc_claimAutoreleasedReturnValue();
    if (![v9 UTF8String] || TextToSourceVersion() <= 0x10CA0B)
    {
      if (dword_100140E48 <= 20 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_69;
    }
    int Int64 = CFDictionaryGetInt64();
    int v13 = Int64;
    if (!self->_prefCommunal && (Int64 & 2) != 0 && (Int64 & 0x20000) != 0)
    {
      uint64_t v14 = 394;
    }
    else if ((Int64 & 0x200000) == 0 || !self->_prefCoreDevicePaired)
    {
      uint64_t v14 = 2;
    }
    else
    {
      uint64_t v14 = 130;
    }
    long long v16 = +[RPIdentityDaemon sharedIdentityDaemon];
    long long v17 = [v16 resolveIdentityForBonjourDevice:v6 typeFlags:v14];

    unsigned int v18 = [(RPCompanionLinkDaemon *)self _homeKitAuthMatchForBonjourDevice:v6];
    unsigned int v19 = v18;
    if ((v18 & 1) == 0 && !v17) {
      goto LABEL_30;
    }
    if (v18
      && ([(RPCompanionLinkDaemon *)self _homeKitDecryptRotatingIDForBonjourDevice:v6], (id v21 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v22 = v21;
      int v56 = 1;
      uint64_t v57 = v21;
    }
    else
    {
      uint64_t v23 = [v17 idsDeviceID];
      if (!v23)
      {
        if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v46 = v6;
          LogPrintF();
        }
LABEL_30:
        -[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:](self, "_clientBonjourFoundUnauthDevice:isAWDLDevice:", v6, 0, v46);
        BOOL v20 = 0;
LABEL_89:

        goto LABEL_70;
      }
      long long v22 = (void *)v23;
      uint64_t v57 = 0;
      int v56 = 0;
    }
    long long v24 = self->_uniqueIDStr;
    char v58 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsDeviceIdentifier];
    if (v24 && [(NSString *)v24 caseInsensitiveCompare:v22] == NSOrderedSame
      || v58 && ![v58 caseInsensitiveCompare:v22])
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v47 = sub_10001B9C4(v6);
        LogPrintF();
      }
      goto LABEL_87;
    }
    if (!a4) {
      [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateUnauthDevices];
    }
    if ((v13 & 0x100000) != 0)
    {
      if (dword_100140E48 > 30 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_87;
      }
LABEL_66:
      LogPrintF();
LABEL_87:
      BOOL v20 = 0;
      goto LABEL_88;
    }
    if (GestaltGetDeviceClass() == 6)
    {
      if (dword_100140E48 > 30 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_87;
      }
      goto LABEL_66;
    }
    uint64_t v27 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v22];
    if (v27)
    {
      long long v28 = (void *)v27;
LABEL_73:
      long long v29 = 0;
      goto LABEL_74;
    }
    long long v30 = [v17 idsDeviceID];
    if (v30)
    {
      long long v53 = v30;
      uint64_t v31 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v30];
      if (v31)
      {
        long long v28 = (void *)v31;

        goto LABEL_73;
      }
      long long v28 = [(RPCompanionLinkDaemon *)self _findWiFiConnectionByID:v53];
      if ([v28 linkType] == 6
        && ([v28 controlFlags] & 0x200) == 0)
      {

        if (v28) {
          goto LABEL_73;
        }
LABEL_96:
        long long v51 = [v6 txtDictionary];
        CFStringGetTypeID();
        long long v54 = CFDictionaryGetTypedValue();

        long long v28 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v54];
        long long v52 = [(NSMutableDictionary *)self->_unauthDevices objectForKeyedSubscript:v54];
        uint64_t v50 = [v52 bonjourDevice];

        if (v28)
        {
          long long v29 = (void *)v50;
LABEL_74:
          [v28 setBonjourPeerDevice:v6];
          [v28 setPresent:1];
          [(RPCompanionLinkDaemon *)self _activeDeviceChangedForConnection:v28 bonjourDevice:v6];
          if (v29) {
            [(RPCompanionLinkDaemon *)self _clientBonjourLostUnauthDevice:v29];
          }
          goto LABEL_76;
        }
        if (v56) {
          uint64_t v32 = 0x8000000;
        }
        else {
          uint64_t v32 = 0;
        }
        p_superclass = &OBJC_METACLASS___RPNWEndpoint.superclass;
        if (dword_100140E48 <= 30)
        {
          if (dword_100140E48 != -1
            || (int v34 = _LogCategory_Initialize(), p_superclass = &OBJC_METACLASS___RPNWEndpoint.superclass, v34))
          {
            sub_10001B9C4(v6);
            uint64_t v48 = v46 = v22;
            LogPrintF();

            p_superclass = (__objc2_class **)(&OBJC_METACLASS___RPNWEndpoint + 8);
          }
        }
        if (!self->_prefServerBonjourAlways
          || ((v13 & 2) != 0 ? (BOOL v35 = !self->_prefCommunal) : (BOOL v35 = 0), v35 || (v13 & 0x8000) != 0))
        {
          long long v37 = self;
          id v38 = v6;
          uint64_t v39 = v32;
        }
        else
        {
          if (self->_prefCommunal && (v13 & 2) == 0)
          {
            int v36 = *((_DWORD *)p_superclass + 914);
            if (v36 > 10 || v36 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_118;
            }
            goto LABEL_123;
          }
          long long v40 = p_superclass;
          uint64_t v55 = v32;
          if ((v19 & v56) == 1)
          {
            if (([(NSString *)self->_uniqueIDStr compare:v57] & 0x8000000000000000) == 0)
            {
              int v41 = *((_DWORD *)v40 + 914);
              if (v41 > 40 || v41 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_118;
              }
LABEL_123:
              uint64_t v42 = sub_10001B9C4(v6);
              LogPrintF();
LABEL_124:

              goto LABEL_118;
            }
          }
          else
          {
            int v43 = [v17 idsDeviceID];
            unint64_t v44 = (unint64_t)[v58 compare:v43];

            if ((v44 & 0x8000000000000000) == 0)
            {
              int v45 = *((_DWORD *)v40 + 914);
              if (v45 > 40 || v45 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_118;
              }
              uint64_t v42 = [v17 idsDeviceID:v46, v48];
              uint64_t v49 = sub_10001B9C4(v6);
              LogPrintF();

              goto LABEL_124;
            }
          }
          long long v37 = self;
          id v38 = v6;
          uint64_t v39 = v55;
        }
        -[RPCompanionLinkDaemon _clientConnectionStart:controlFlags:uniqueID:identity:](v37, "_clientConnectionStart:controlFlags:uniqueID:identity:", v38, v39, v22, v17, v46, v48);
LABEL_118:
        long long v28 = 0;
        long long v29 = (void *)v50;
LABEL_76:

        BOOL v20 = 1;
LABEL_88:

        goto LABEL_89;
      }

      long long v30 = v53;
    }

    goto LABEL_96;
  }
  if (dword_100140E48 > 10 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
    goto LABEL_69;
  }
  id v10 = v6;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
LABEL_56:
      [v10 descriptionWithLevel:50];
      uint64_t v11 = LABEL_57:;
      goto LABEL_68;
    }
LABEL_67:
    [v10 description];
    goto LABEL_57;
  }
LABEL_7:
  uint64_t v11 = [v10 shortDescription];
LABEL_68:
  BOOL v25 = (void *)v11;

  LogPrintF();
LABEL_69:
  BOOL v20 = 0;
LABEL_70:

  return v20;
}

- (void)_clientBonjourLostDevice:(id)a3
{
  id v20 = a3;
  [(RPCompanionLinkDaemon *)self _clientBonjourLostUnauthDevice:v20];
  id v4 = [v20 txtDictionary];
  int Int64 = CFDictionaryGetInt64();

  if ((*(void *)&Int64 & 0x20000) != 0 && (Int64 & 2) != 0 && !self->_prefCommunal) {
    uint64_t v8 = 394;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v10 = [v9 resolveIdentityForBonjourDevice:v20 typeFlags:v8];
  unsigned int v11 = [(RPCompanionLinkDaemon *)self _homeKitAuthMatchForBonjourDevice:v20];
  if ((v11 & 1) != 0 || v10)
  {
    if (v11
      && (-[RPCompanionLinkDaemon _homeKitDecryptRotatingIDForBonjourDevice:](self, "_homeKitDecryptRotatingIDForBonjourDevice:", v20), (BOOL v12 = objc_claimAutoreleasedReturnValue()) != 0)|| ([v10 idsDeviceID], (BOOL v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v12];
      if (v13)
      {
        uint64_t v14 = (void *)v13;
      }
      else
      {
        long long v15 = [v10 idsDeviceID];
        if (v15)
        {
          uint64_t v14 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v15];
          if (v14)
          {
            id v16 = v15;

            BOOL v12 = v16;
          }
        }
        else
        {
          uint64_t v14 = 0;
        }
      }
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v17 = v20;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v18 = [v17 shortDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v17 descriptionWithLevel:50];
          }
          else {
          uint64_t v18 = [v17 description];
          }
        }
        unsigned int v19 = (void *)v18;

        LogPrintF();
      }
      if (v14) {
        [v14 setPresent:0];
      }
    }
  }
}

- (void)_clientBonjourFoundUnauthDevice:(id)a3 isAWDLDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v31 = a3;
  id v6 = [v31 txtDictionary];
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();

  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v7];
    id v9 = v8;
    if (v8)
    {
      [v8 setBonjourPeerDevice:v31];
      [v9 setPresent:1];
    }
    if (!self->_discoverPairedDevices
      || ![(RPCompanionLinkDaemon *)self _clientBonjourCheckFoundPairedDevice:v31 publicID:v7])
    {
      id v10 = [(NSMutableDictionary *)self->_unauthDevices objectForKeyedSubscript:v7];
      unsigned int v11 = v10;
      if (v10)
      {
        CFStringRef v12 = (const __CFString *)[v10 updateWithBonjourDevice:v31];
        if (v12)
        {
          CFStringRef v13 = v12;
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v14 = v31;
            if (objc_opt_respondsToSelector())
            {
              uint64_t v15 = [v14 detailedDescription];
            }
            else
            {
              if (objc_opt_respondsToSelector()) {
                [v14 descriptionWithLevel:20];
              }
              else {
              uint64_t v15 = NSPrintF();
              }
            }
            long long v22 = (void *)v15;

            if (v4) {
              CFStringRef v23 = @"YES";
            }
            else {
              CFStringRef v23 = @"NO";
            }
            long long v29 = &unk_100119874;
            CFStringRef v30 = v23;
            uint64_t v27 = v22;
            CFStringRef v28 = v13;
            id v26 = v7;
            LogPrintF();
          }
          -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v11, v13, v26, v27, v28, v29, v30);
        }
      }
      else
      {
        id v16 = objc_alloc_init((Class)RPCompanionLinkDevice);
        [v16 updateWithBonjourDevice:v31];
        [v16 setFlags:[v16 flags] | 1];
        if (v4)
        {
          [v16 setStatusFlags:((unint64_t)[v16 statusFlags] & 0xFFFFFFFFFFFFFFFBLL)];
          [v16 setStatusFlags:((unint64_t)[v16 statusFlags] | 8)];
        }
        unauthDevices = self->_unauthDevices;
        if (!unauthDevices)
        {
          uint64_t v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          unsigned int v19 = self->_unauthDevices;
          self->_unauthDevices = v18;

          unauthDevices = self->_unauthDevices;
        }
        [(NSMutableDictionary *)unauthDevices setObject:v16 forKeyedSubscript:v7];
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v20 = v31;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v21 = [v20 detailedDescription];
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              [v20 descriptionWithLevel:20];
            }
            else {
            uint64_t v21 = NSPrintF();
            }
          }
          long long v24 = (void *)v21;

          CFStringRef v25 = @"NO";
          if (v4) {
            CFStringRef v25 = @"YES";
          }
          uint64_t v27 = v24;
          CFStringRef v28 = v25;
          id v26 = v7;
          LogPrintF();
        }
        -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v16, v26, v27, v28);
      }
    }
  }
  else if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_clientBonjourCheckFoundPairedDevice:(id)a3 publicID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v9 = [v8 resolveIdentityForBonjourDevice:v6 typeFlags:128];

  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_pairedDevices objectForKeyedSubscript:v7];
    unsigned int v11 = v10;
    if (v10)
    {
      id v12 = [v10 updateWithBonjourDevice:v6];
      if (v12)
      {
        id v13 = v12;
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v14 = v6;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v15 = [v14 shortDescription];
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              [v14 descriptionWithLevel:50];
            }
            else {
            uint64_t v15 = [v14 description];
            }
          }
          long long v22 = (void *)v15;

          id v27 = v13;
          CFStringRef v28 = &unk_100119874;
          id v25 = v7;
          id v26 = v22;
          LogPrintF();
        }
        -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v11, v13, v25, v26, v27, v28);
      }
    }
    else
    {
      id v16 = objc_alloc_init((Class)RPCompanionLinkDevice);
      [v16 updateWithBonjourDevice:v6];
      [v16 setStatusFlags:[v16 statusFlags] | 0x8000];
      pairedDevices = self->_pairedDevices;
      if (!pairedDevices)
      {
        uint64_t v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        unsigned int v19 = self->_pairedDevices;
        self->_pairedDevices = v18;

        pairedDevices = self->_pairedDevices;
      }
      [(NSMutableDictionary *)pairedDevices setObject:v16 forKeyedSubscript:v7];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v20 = v6;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v21 = [v20 shortDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v20 descriptionWithLevel:50];
          }
          else {
          uint64_t v21 = [v20 description];
          }
        }
        CFStringRef v23 = (void *)v21;

        id v25 = v7;
        id v26 = v23;
        LogPrintF();
      }
      -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v16, v25, v26);
    }
  }

  return v9 != 0;
}

- (void)_clientBonjourLostUnauthDevice:(id)a3
{
  id v14 = a3;
  BOOL v4 = [v14 txtDictionary];
  CFStringGetTypeID();
  uint64_t v5 = CFDictionaryGetTypedValue();

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v5];
    id v7 = v6;
    if (v6) {
      [v6 setPresent:0];
    }
    if (![(RPCompanionLinkDaemon *)self _clientBonjourCheckLostPairedDevice:v14 publicID:v5])
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_unauthDevices objectForKeyedSubscript:v5];
      if (v8)
      {
        [(NSMutableDictionary *)self->_unauthDevices setObject:0 forKeyedSubscript:v5];
        [v8 removeBonjourDevice:v14];
        [v8 setStatusFlags:((unint64_t)[v8 statusFlags] & 0xFFFFFFFFFFFFFFF7)];
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v9 = v14;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v10 = [v9 shortDescription];
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              [v9 descriptionWithLevel:50];
            }
            else {
            uint64_t v10 = [v9 description];
            }
          }
          unsigned int v11 = (void *)v10;

          id v12 = v5;
          id v13 = v11;
          LogPrintF();
        }
        -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v8, v12, v13);
      }
    }
  }
  else if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_clientBonjourCheckLostPairedDevice:(id)a3 publicID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_pairedDevices objectForKeyedSubscript:v7];
  if (v8)
  {
    [(NSMutableDictionary *)self->_pairedDevices setObject:0 forKeyedSubscript:v7];
    [v8 removeBonjourDevice:v6];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v6;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v10 = [v9 shortDescription];
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [v9 descriptionWithLevel:50];
        }
        else {
        uint64_t v10 = [v9 description];
        }
      }
      unsigned int v11 = (void *)v10;

      id v13 = v7;
      id v14 = v11;
      LogPrintF();
    }
    -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v8, v13, v14);
  }

  return v8 != 0;
}

- (void)_clientBonjourReevaluateAllDevices
{
  BOOL v3 = [(CUBonjourBrowser *)self->_bonjourBrowser devices];
  if ([v3 count] && !self->_bonjourReevaluateTimer)
  {
    if (mach_absolute_time() >= self->_bonjourReevaluateNextTicks)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v13 = [v3 count];
        LogPrintF();
      }
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v3;
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            -[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:](self, "_clientBonjourFoundDevice:reevaluate:", *(void *)(*((void *)&v14 + 1) + 8 * i), 1, v13);
          }
          id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v9);
      }

      uint64_t v12 = mach_absolute_time();
      self->_bonjourReevaluateNextTicks = SecondsToUpTicks() + v12;
    }
    else
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      bonjourReevaluateTimer = self->_bonjourReevaluateTimer;
      self->_bonjourReevaluateTimer = v4;
      id v6 = v4;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10001C9A8;
      handler[3] = &unk_1001219D0;
      handler[4] = v6;
      void handler[5] = self;
      dispatch_source_set_event_handler(v6, handler);
      CUDispatchTimerSet();
      dispatch_activate(v6);
    }
  }
}

- (void)_clientBonjourReevaluateUnauthDevices
{
  if ([(NSMutableDictionary *)self->_unauthDevices count]
    && dword_100140E48 <= 30
    && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_unauthDevices allValues];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) bonjourDevice];
        if (v8
          && [(RPCompanionLinkDaemon *)self _clientBonjourFoundDevice:v8 reevaluate:1])
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v8, v8);
          }
          else
          {
            -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v8, v9);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_clientBonjourAWDLBrowserEnsureStarted
{
  if (!self->_bonjourBrowserAWDL)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_needsAWDLTransaction)
    {
      BOOL v3 = +[RPWiFiP2PTransaction sharedInstance];
      [v3 activateForClient:@"Ensemble"];
    }
    id v4 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = v4;

    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setChangeFlags:0xFFFFFFFFLL];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDispatchQueue:self->_dispatchQueue];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDomain:@"local."];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setInterfaceName:@"awdl0"];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setLabel:@"CLink"];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setServiceType:@"_companion-link._tcp"];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001CE58;
    v11[3] = &unk_100121980;
    v11[4] = self;
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDeviceFoundHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001CE70;
    v10[3] = &unk_100121980;
    v10[4] = self;
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDeviceLostHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001CE88;
    v9[3] = &unk_1001219A8;
    v9[4] = self;
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDeviceChangedHandler:v9];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL activate];
    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    if (bonjourBrowserAWDLProcess)
    {
      id v7 = bonjourBrowserAWDLProcess;
      id v8 = +[RPMetrics sharedMetrics];
      [v8 logAWDLBrowseClient:v7];
    }
  }
}

- (void)_clientBonjourAWDLBrowserEnsureStopped
{
  if (self->_bonjourBrowserAWDL)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL invalidate];
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = 0;

    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    self->_bonjourBrowserAWDLProcess = 0;

    [(NSMutableDictionary *)self->_bonjourAWDLDevices removeAllObjects];
    bonjourAWDLDevices = self->_bonjourAWDLDevices;
    self->_bonjourAWDLDevices = 0;

    [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices removeAllObjects];
    authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
    self->_authenticatedAWDLPairingModeDevices = 0;

    if (!self->_needsAWDLTransaction && !self->_bonjourAWDLAdvertiser)
    {
      id v7 = +[RPWiFiP2PTransaction sharedInstance];
      [v7 invalidateForClient:@"Ensemble"];
    }
  }
}

- (BOOL)_clientBonjourAWDLBrowserShouldRun
{
  if (self->_bonjourBrowserAWDLForce) {
    return 1;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = self->_xpcConnections;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v8, "needsCLink", (void)v15) & 1) != 0
          || [v8 needsNearbyActionV2])
        {
          uint64_t v9 = [v8 client];
          unsigned int v10 = [v9 controlFlags];

          if ((v10 & 0x400000) == 0)
          {
            long long v12 = [v8 xpcCnx];
            sub_10000E944((uint64_t)[v12 processIdentifier]);
            long long v13 = (NSString *)objc_claimAutoreleasedReturnValue();
            bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
            self->_bonjourBrowserAWDLProcess = v13;

            return 1;
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return [(RPCompanionLinkDaemon *)self _haveActiveClientConnectionsOnAWDL];
}

- (id)_clientShouldConnectOverBonjour:(id)a3 device:(id)a4 identities:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [v7 netCnx];
  if ([v10 present])
  {

LABEL_8:
    id v15 = 0;
    goto LABEL_28;
  }
  if ([v7 needsCLink])
  {
  }
  else
  {
    unsigned __int8 v11 = [v7 needsNearbyActionV2];

    if ((v11 & 1) == 0) {
      goto LABEL_8;
    }
  }
  long long v12 = [v8 identifier];
  long long v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v8 publicIdentifier];
  }
  long long v16 = v14;

  long long v17 = [v8 idsDeviceIdentifier];

  if (!v17 && v16 && dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    long long v18 = [v7 xpcCnx];
    id v27 = v16;
    id v28 = [v18 processIdentifier];
    LogPrintF();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v9;
  id v15 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    long long v29 = v16;
    id v30 = v9;
    uint64_t v20 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v19);
        }
        long long v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        CFStringRef v23 = [v8 idsDeviceIdentifier:v27, v28];
        long long v24 = [v22 idsDeviceID];
        unsigned int v25 = [v23 isEqual:v24];

        if (v25)
        {
          id v15 = v22;
          goto LABEL_26;
        }
      }
      id v15 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v15) {
        continue;
      }
      break;
    }
LABEL_26:
    long long v16 = v29;
    id v9 = v30;
  }

LABEL_28:

  return v15;
}

- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];

  if (v4)
  {
    id v5 = [v3 txtDictionary];
    if (CFDictionaryGetInt64())
    {
      if (dword_100140E48 > 30 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_144;
      }
      goto LABEL_12;
    }
    if ((CFDictionaryGetInt64() & 0x800) == 0)
    {
      if (dword_100140E48 > 30 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_144;
      }
LABEL_12:
      uint64_t v6 = CUDescriptionWithLevel();
      LogPrintF();

LABEL_144:
      goto LABEL_145;
    }
    CFStringGetTypeID();
    [v3 setName:CFDictionaryGetTypedValue()];
    id v7 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v8 = [v7 resolveIdentitiesForBonjourDevice:v3 typeFlags:19882];
    if ([v8 count])
    {
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id obj = v8;
      id v9 = [obj countByEnumeratingWithState:&v114 objects:v124 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v115;
LABEL_16:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v115 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = [*(id *)(*((void *)&v114 + 1) + 8 * v12) idsDeviceID];
          if (v13) {
            break;
          }
          if (v10 == (id)++v12)
          {
            id v10 = [obj countByEnumeratingWithState:&v114 objects:v124 count:16];
            if (v10) {
              goto LABEL_16;
            }
            goto LABEL_22;
          }
        }
        uint64_t v15 = v13;

        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          CUDescriptionWithLevel();
          BOOL v77 = v72 = v15;
          LogPrintF();
        }
        bonjourAWDLDevices = self->_bonjourAWDLDevices;
        if (!bonjourAWDLDevices)
        {
          long long v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          long long v18 = self->_bonjourAWDLDevices;
          self->_bonjourAWDLDevices = v17;

          bonjourAWDLDevices = self->_bonjourAWDLDevices;
        }
        uint64_t v19 = -[NSMutableDictionary objectForKeyedSubscript:](bonjourAWDLDevices, "objectForKeyedSubscript:", v15, v72, v77);
        if (v19 && dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v20 = CUDescriptionWithLevel();
          CUDescriptionWithLevel();
          v78 = id v74 = v20;
          LogPrintF();
        }
        v83 = (void *)v19;
        v85 = (void *)v15;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourAWDLDevices, "setObject:forKeyedSubscript:", v3, v15, v74, v78);
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        uint64_t v21 = self->_xpcConnections;
        id v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v110 objects:v123 count:16];
        id v86 = v3;
        v84 = v8;
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v111;
LABEL_47:
          uint64_t v25 = 0;
          while (1)
          {
            if (*(void *)v111 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v110 + 1) + 8 * v25);
            id v27 = [v26 daemonDevice];
            uint64_t v28 = [(RPCompanionLinkDaemon *)self _clientShouldConnectOverBonjour:v26 device:v27 identities:obj];
            if (v28) {
              break;
            }

            if (v23 == (id)++v25)
            {
              id v23 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v110 objects:v123 count:16];
              if (v23) {
                goto LABEL_47;
              }
              v81 = v5;
              v82 = v7;
              long long v29 = 0;
              goto LABEL_68;
            }
          }
          id v30 = (id)v28;
          [v26 setBonjourDevice:v86];
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v75 = v26;
            LogPrintF();
          }
          id v109 = 0;
          long long v29 = -[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:](self, "_clientCreateConnection:xpcCnx:error:", v27, v26, &v109, v75);
          id v31 = v109;
          if (v29)
          {
            if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              long long v32 = [v26 client];
              id v79 = v27;
              id v80 = v30;
              id v75 = [v32 clientID];
              LogPrintF();
            }
            v81 = v5;
            v82 = v7;

LABEL_68:
            id v3 = v86;
            goto LABEL_69;
          }
          if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }

          long long v29 = v21;
          id v14 = v85;
          goto LABEL_141;
        }
        v81 = v5;
        v82 = v7;
        long long v29 = 0;
LABEL_69:

        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v33 = self->_xpcConnections;
        id v34 = [(NSMutableSet *)v33 countByEnumeratingWithState:&v105 objects:v122 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v106;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v106 != v36) {
                objc_enumerationMutation(v33);
              }
              id v38 = *(void **)(*((void *)&v105 + 1) + 8 * i);
              uint64_t v39 = [v38 daemonDevice:v75, v79, v80];
              long long v40 = [(RPCompanionLinkDaemon *)self _clientShouldConnectOverBonjour:v38 device:v39 identities:obj];
              if (v40)
              {
                if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
                {
                  int v41 = [v29 label];
                  uint64_t v42 = [v38 client];
                  id v75 = v41;
                  id v79 = [v42 clientID];
                  LogPrintF();

                  id v3 = v86;
                }
                int v43 = [v38 netCnx:v75];

                if (v43)
                {
                  unint64_t v44 = [v38 netCnx];
                  [v44 processSendsUsingConnection:v29];
                }
                [v38 setNetCnx:v29];
                [v38 setBonjourDevice:v3];
                int v45 = [v38 session];
                [v45 setCnx:v29];

                id v46 = [v38 discoveryTimer];
                unint64_t v47 = v46;
                if (v46)
                {
                  dispatch_source_cancel(v46);
                  [v38 setDiscoveryTimer:0];
                  [v38 setNeedsCLink:0];
                  [v38 setNeedsNearbyActionV2:0];
                }
              }
            }
            id v35 = [(NSMutableSet *)v33 countByEnumeratingWithState:&v105 objects:v122 count:16];
          }
          while (v35);
        }

        id v27 = [(RPCompanionLinkDaemon *)self _xpcConnections:self->_xpcConnections withControlFlags:0x1000000000000];
        uint64_t v48 = [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices objectForKeyedSubscript:v85];
        id v30 = (id)v48;
        if (!v48) {
          id v30 = objc_alloc_init((Class)RPCompanionLinkDevice);
        }
        id v49 = [v30 updateWithBonjourDevice:v86, v75];
        [v30 setStatusFlags:((unint64_t)[v30 statusFlags] & 0xFFFFFFFFFFFFFFFBLL)];
        [v30 setStatusFlags:((unint64_t)[v30 statusFlags] | 8)];
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        id v50 = obj;
        id v51 = [v50 countByEnumeratingWithState:&v101 objects:v121 count:16];
        id v7 = v82;
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)v102;
          do
          {
            for (j = 0; j != v52; j = (char *)j + 1)
            {
              if (*(void *)v102 != v53) {
                objc_enumerationMutation(v50);
              }
              id v49 = (id)([v30 updateTrustStatusFlagsWithIdentity:*(void *)(*((void *)&v101 + 1) + 8 * (void)j)] | v49);
            }
            id v52 = [v50 countByEnumeratingWithState:&v101 objects:v121 count:16];
          }
          while (v52);
        }

        if (([v30 statusFlags] & 0x80000000) == 0)
        {
          id v5 = v81;
          id v14 = v85;
          if (v48)
          {
            if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              id v76 = v30;
              LogPrintF();
            }
            long long v91 = 0u;
            long long v92 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            id v58 = v27;
            id v59 = [v58 countByEnumeratingWithState:&v89 objects:v118 count:16];
            if (v59)
            {
              id v60 = v59;
              uint64_t v61 = *(void *)v90;
              do
              {
                for (k = 0; k != v60; k = (char *)k + 1)
                {
                  if (*(void *)v90 != v61) {
                    objc_enumerationMutation(v58);
                  }
                  [*(id *)(*((void *)&v89 + 1) + 8 * (void)k) reportLostDevice:v30, v76];
                }
                id v60 = [v58 countByEnumeratingWithState:&v89 objects:v118 count:16];
              }
              while (v60);
            }

            id v14 = v85;
            [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices setObject:0 forKeyedSubscript:v85];
          }
          goto LABEL_140;
        }
        authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
        id v5 = v81;
        id v14 = v85;
        if (!authenticatedAWDLPairingModeDevices)
        {
          int v56 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          uint64_t v57 = self->_authenticatedAWDLPairingModeDevices;
          self->_authenticatedAWDLPairingModeDevices = v56;

          authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
        }
        [(NSMutableDictionary *)authenticatedAWDLPairingModeDevices setObject:v30 forKeyedSubscript:v85];
        if (v48 && v49)
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v76 = v30;
            LogPrintF();
          }
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v63 = v27;
          id v64 = [v63 countByEnumeratingWithState:&v97 objects:v120 count:16];
          if (v64)
          {
            id v65 = v64;
            uint64_t v66 = *(void *)v98;
            do
            {
              for (m = 0; m != v65; m = (char *)m + 1)
              {
                if (*(void *)v98 != v66) {
                  objc_enumerationMutation(v63);
                }
                [*(id *)(*((void *)&v97 + 1) + 8 * (void)m) reportChangedDevice:v30 changes:v49, v76];
              }
              id v65 = [v63 countByEnumeratingWithState:&v97 objects:v120 count:16];
            }
            while (v65);
          }
        }
        else
        {
          if (v48)
          {
LABEL_140:
            [(RPCompanionLinkDaemon *)self _updateAssertions];
LABEL_141:

            id v3 = v86;
            id v8 = v84;
            goto LABEL_142;
          }
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v76 = v30;
            LogPrintF();
          }
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v63 = v27;
          id v68 = [v63 countByEnumeratingWithState:&v93 objects:v119 count:16];
          if (v68)
          {
            id v69 = v68;
            uint64_t v70 = *(void *)v94;
            do
            {
              for (n = 0; n != v69; n = (char *)n + 1)
              {
                if (*(void *)v94 != v70) {
                  objc_enumerationMutation(v63);
                }
                [*(id *)(*((void *)&v93 + 1) + 8 * (void)n) reportFoundDevice:v30 outReason:0 v76];
              }
              id v69 = [v63 countByEnumeratingWithState:&v93 objects:v119 count:16];
            }
            while (v69);
          }
        }

        id v14 = v85;
        goto LABEL_140;
      }
LABEL_22:

      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v14 = CUDescriptionWithLevel();
        LogPrintF();
LABEL_142:
      }
    }
    else
    {
      [(RPCompanionLinkDaemon *)self _clientBonjourFoundUnauthDevice:v3 isAWDLDevice:1];
    }

    goto LABEL_144;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v73 = CUDescriptionWithLevel();
    LogPrintF();
  }
LABEL_145:
}

- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3
{
  id v21 = a3;
  [(RPCompanionLinkDaemon *)self _clientBonjourLostUnauthDevice:v21];
  id v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v5 = [v4 resolveIdentityForBonjourDevice:v21 typeFlags:19882];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 idsDeviceID];
    if (!v7)
    {
      if (dword_100140E48 > 90 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_31;
      }
      id v9 = CUDescriptionWithLevel();
      LogPrintF();
      goto LABEL_30;
    }
    id v8 = [(NSMutableDictionary *)self->_bonjourAWDLDevices objectForKeyedSubscript:v7];
    id v9 = v8;
    if (!v8)
    {
      if (dword_100140E48 > 30 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_30;
      }
      CUDescriptionWithLevel();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }
    id v10 = [v8 identifier];
    uint64_t v11 = [v21 identifier];
    id v12 = v10;
    id v13 = v11;
    id v14 = v13;
    if (v12 == v13)
    {
    }
    else
    {
      if ((v12 == 0) == (v13 != 0))
      {

LABEL_41:
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
LABEL_28:

        goto LABEL_29;
      }
      unsigned __int8 v15 = [v12 isEqual:v13];

      if ((v15 & 1) == 0) {
        goto LABEL_41;
      }
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      CUDescriptionWithLevel();
      v20 = long long v18 = v7;
      LogPrintF();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourAWDLDevices, "setObject:forKeyedSubscript:", 0, v7, v18, v20);
    long long v16 = [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices objectForKeyedSubscript:v7];
    long long v17 = v16;
    if (v16)
    {
      [v16 setStatusFlags:((unint64_t)[v16 statusFlags] & 0xFFFFFFFF7FFFFFFFLL)];
      if (dword_100140E48 < 31 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v19 = v17;
        LogPrintF();
      }
      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v17, v19);
      [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices setObject:0 forKeyedSubscript:v7];
    }

    goto LABEL_28;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v7 = CUDescriptionWithLevel();
    LogPrintF();
LABEL_31:
  }
}

- (void)_clientConnectionStart:(id)a3 controlFlags:(unint64_t)a4 uniqueID:(id)a5 identity:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (char *)[(NSMutableDictionary *)self->_tcpClientConnections count];
  if (&v13[(void)[(NSMutableDictionary *)self->_tcpOnDemandClientConnections count]] < (char *)self->_prefMaxConnectionCount)
  {
    if (v12) {
      unint64_t v14 = a4 | 0x80;
    }
    else {
      unint64_t v14 = a4;
    }
    id v15 = objc_alloc_init((Class)RPConnection);
    [v15 setBonjourPeerDevice:v10];
    long long v16 = +[RPCloudDaemon sharedCloudDaemon];
    [v15 setCloudDaemon:v16];

    [v15 setControlFlags:v14];
    [v15 setDispatchQueue:self->_dispatchQueue];
    [v15 setHomeKitManager:self->_homeKitManager];
    [v15 setIdentityResolved:v12];
    long long v17 = +[RPIdentityDaemon sharedIdentityDaemon];
    [v15 setIdentityDaemon:v17];

    id v18 = objc_alloc((Class)NSString);
    uint64_t v19 = self->_cnxIDLast + 1;
    self->_cnxIDLast = v19;
    id v20 = [v18 initWithFormat:@"%@Cnx-%u", @"CLink", v19];
    [v15 setLabel:v20];

    [v15 setLocalDeviceInfo:self->_localDeviceInfo];
    [v15 setNetLinkManager:self->_netLinkManager];
    [v15 setPeerIdentifier:v11];
    [v15 setPreferredIdentityType:[v12 type]];
    [v15 setPresent:1];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10001EB24;
    v39[3] = &unk_100121770;
    v39[4] = self;
    void v39[5] = v15;
    id v21 = v11;
    id v40 = v21;
    [v15 setInvalidationHandler:v39];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001EB64;
    v38[3] = &unk_1001219D0;
    v38[4] = self;
    v38[5] = v15;
    [v15 setPeerUpdatedHandler:v38];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001EBDC;
    v37[3] = &unk_1001219F8;
    v37[4] = self;
    v37[5] = v15;
    [v15 setReceivedEventHandler:v37];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001EBF8;
    v36[3] = &unk_100121A20;
    v36[4] = self;
    v36[5] = v15;
    [v15 setReceivedRequestHandler:v36];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10001EC18;
    v35[3] = &unk_100121A48;
    v35[4] = self;
    v35[5] = v15;
    [v15 setStateChangedHandler:v35];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001EC28;
    v34[3] = &unk_1001219D0;
    v34[4] = v15;
    v34[5] = self;
    [v15 setHomeKitUserIdentifierHandler:v34];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001ECC0;
    v33[3] = &unk_1001219D0;
    v33[4] = self;
    v33[5] = v15;
    [v15 setProxyDeviceUpdateHandler:v33];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v22 = v10;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v23 = [v22 detailedDescription];
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [v22 descriptionWithLevel:20];
        }
        else {
        uint64_t v23 = NSPrintF();
        }
      }
      id v26 = (void *)v23;

      id v31 = v26;
      id v32 = v15;
      id v30 = v21;
      LogPrintF();
    }
    tcpClientConnections = self->_tcpClientConnections;
    if (!tcpClientConnections)
    {
      uint64_t v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v29 = self->_tcpClientConnections;
      self->_tcpClientConnections = v28;

      tcpClientConnections = self->_tcpClientConnections;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](tcpClientConnections, "setObject:forKeyedSubscript:", v15, v21, v30, v31, v32);
    [v15 activate];
    [(RPCompanionLinkDaemon *)self _updateAssertions];

    goto LABEL_30;
  }
  if (dword_100140E48 <= 60 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v24 = v10;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v25 = [v24 shortDescription];
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        [v24 descriptionWithLevel:50];
      }
      else {
      uint64_t v25 = [v24 description];
      }
    }
    id v15 = (id)v25;

    LogPrintF();
LABEL_30:
  }
}

- (BOOL)_clientConnectionStartOnDemand:(id)a3 xpcCnx:(id)a4 error:(id *)a5
{
  uint64_t v6 = [(RPCompanionLinkDaemon *)self _clientCreateConnection:a3 xpcCnx:a4 error:a5];
  if (v6) {
    [(RPCompanionLinkDaemon *)self _updateAssertions];
  }

  return v6 != 0;
}

- (id)_clientCreateConnection:(id)a3 xpcCnx:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 identifier];
  if (v10)
  {
    id v11 = [v9 client];
    id v12 = v11;
    if (!v11)
    {
      uint64_t v25 = RPErrorF();
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v26 = v8;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v27 = [v26 shortDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v26 descriptionWithLevel:50];
          }
          else {
          uint64_t v27 = [v26 description];
          }
        }
        id v51 = (void *)v27;

        LogPrintF();
      }
      if (a5) {
        *a5 = v25;
      }

      id v46 = 0;
      goto LABEL_139;
    }
    unint64_t v13 = (unint64_t)[v11 controlFlags];
    id v14 = [v9 netCnx];
    if (!v14)
    {
      id v14 = objc_alloc_init((Class)RPConnection);
      id v15 = [v12 appID];
      [v14 setAppID:v15];

      [v14 setDispatchQueue:self->_dispatchQueue];
      long long v16 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v14 setIdentityDaemon:v16];

      [v9 setNetCnx:v14];
    }
    long long v17 = [v8 ipAddress];

    if (v17)
    {
      id v18 = [v8 ipAddress];
      [v14 setDestinationString:v18];

      goto LABEL_7;
    }
    uint64_t v28 = [v8 bonjourDevice];
    if (v28 || ([v9 bonjourDevice], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unint64_t v20 = v13;
      id v21 = (void *)v28;
      int v72 = 0;
      long long v29 = "Infra";
    }
    else
    {
      if ((v13 & 0x400000) != 0
        || (v13 & 0x20000) == 0 && GestaltGetDeviceClass() == 6
        || ([(RPCompanionLinkDaemon *)self _findMatchingAWDLBonjourDevice:v8],
            (uint64_t v50 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_7:
        uint64_t v19 = [v8 ipAddress];

        if (v19)
        {
          unint64_t v20 = v13;
          id v21 = 0;
          BOOL v71 = "Infra";
          int v72 = 1;
LABEL_21:
          id v30 = (char *)[(NSMutableDictionary *)self->_tcpClientConnections count];
          if (&v30[(void)[(NSMutableDictionary *)self->_tcpOnDemandClientConnections count]] < (char *)self->_prefMaxConnectionCount)
          {
            id v31 = v21;
            goto LABEL_23;
          }
          uint64_t v36 = RPErrorF();
          if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          if (!a5) {
            goto LABEL_78;
          }
          id v47 = v36;
          goto LABEL_77;
        }
        if ((v13 & 0x100) != 0)
        {
          long long v37 = "ForceL2CAP";
          if (!"ForceL2CAP") {
            goto LABEL_87;
          }
        }
        else if (([v8 statusFlags] & 0x200) != 0)
        {
          uint64_t v95 = 0;
          v67 = (const char *)&v95;
          id v69 = 0;
          SocketGetInterfaceInfo();
          long long v37 = (const char *)((v95 << 63 >> 63) & (unint64_t)"NoLocalAWDL");
          if (!v37) {
            goto LABEL_87;
          }
        }
        else
        {
          long long v37 = "NoWiFiP2P";
          if (!"NoWiFiP2P") {
            goto LABEL_87;
          }
        }
        if ((v13 & 0x20000000000) == 0)
        {
          BOOL v71 = v37;
          unint64_t v20 = v13;
          uint64_t v48 = [v8 bleDevice];
          id v21 = [v48 identifier];

          if (!v21)
          {
            uint64_t v36 = RPErrorF();
            if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              id v68 = sub_10001B9C4(v8);
              LogPrintF();
            }
            goto LABEL_123;
          }
          if ((unint64_t)[(NSMutableDictionary *)self->_bleClientConnections count] >= 4)
          {
LABEL_84:
            uint64_t v36 = RPErrorF();
            if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
LABEL_123:
            if (!a5) {
              goto LABEL_78;
            }
            id v47 = v36;
            uint64_t v36 = v47;
LABEL_77:
            *a5 = v47;
LABEL_78:

            goto LABEL_79;
          }
          if (GestaltGetDeviceClass() == 1)
          {
            id v52 = [v8 model];
            if ([v52 hasPrefix:@"Watch"])
            {
              uint64_t v70 = +[RPCloudDaemon sharedCloudDaemon];
              unsigned int v73 = [v70 idsHasWatch];

              if (v73) {
                goto LABEL_84;
              }
            }
            else
            {
            }
          }
          [v14 setBleClientUseCase:[v12 bleClientUseCase:v67, v69]];
          [v14 setBlePeerIdentifier:v21];
          if ([v14 bleClientUseCase] == (id)327680)
          {
            uint64_t v53 = [v12 appID];
            [v14 setClientBundleID:v53];
          }
          id v31 = 0;
          int v72 = 1;
LABEL_23:
          id v32 = [v9 discoveryTimer];
          long long v33 = v32;
          if (v32)
          {
            dispatch_source_cancel(v32);
            [v9 setDiscoveryTimer:0];
          }

          uint64_t v34 = 576;
          if (v72) {
            uint64_t v34 = 640;
          }
          uint64_t v35 = v34 | v20 & 0xC08010000400;
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            CUDescriptionWithLevel();
            id v69 = v67 = v71;
            LogPrintF();
          }
          if ((v72 & 1) == 0) {
            [v14 setBonjourPeerDevice:v31];
          }
          [v14 setClient:v12 v67 v69];
          [v14 setControlFlags:v35];
          [v14 setIdentifierOverride:v10];
          id v38 = objc_alloc((Class)NSString);
          uint64_t v39 = self->_cnxIDLast + 1;
          self->_cnxIDLast = v39;
          id v40 = [v38 initWithFormat:@"%@Cnx-%u", @"CLink", v39];
          [v14 setLabel:v40];

          [v14 setLocalDeviceInfo:self->_localDeviceInfo];
          int v41 = [v12 password];
          [v14 setPassword:v41];

          [v14 setPeerIdentifier:v10];
          [v14 setPresent:1];
          [v9 setNetCnx:v14];
          unsigned int v42 = [v12 passwordType];
          if (v42 && v42 != 3)
          {
            [v14 setPasswordType:];
            if (([v12 internalAuthFlags] & 8) != 0)
            {
              v93[0] = _NSConcreteStackBlock;
              v93[1] = 3221225472;
              v93[2] = sub_10001FB14;
              v93[3] = &unk_100121908;
              id v94 = v9;
              [v14 setAuthCompletionHandler:v93];
            }
            if (([v12 internalAuthFlags] & 4) != 0)
            {
              v90[0] = _NSConcreteStackBlock;
              v90[1] = 3221225472;
              v90[2] = sub_10001FB20;
              v90[3] = &unk_100121A70;
              id v91 = v9;
              id v92 = v14;
              [v92 setPromptForPasswordHandler:v90];
            }
          }
          unint64_t v43 = (unint64_t)[v8 statusFlags];
          if ((v43 & 0x80000) != 0)
          {
            int v44 = 2;
          }
          else if ((v43 & 0x8000) != 0)
          {
            int v44 = 8;
          }
          else if ((v43 & 0x2000) != 0)
          {
            int v44 = 9;
          }
          else if ((v43 & 0x4000) != 0)
          {
            int v44 = 4;
          }
          else if ((v43 & 0x20000) != 0)
          {
            int v44 = 6;
          }
          else if ((v43 & 0x4000000000) != 0)
          {
            int v44 = 15;
          }
          else if (v43 & 0x2000000000 | v20 & 0x800000000000)
          {
            int v44 = 13;
          }
          else
          {
            int v44 = 0;
          }
          if ((v20 & 0x8000000000) != 0) {
            int v54 = 8;
          }
          else {
            int v54 = v44;
          }
          if (v54) {
            [v14 setPreferredIdentityType:];
          }
          [(RPCompanionLinkDaemon *)self _configureConnectionForPairing:v14];
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_10001FB74;
          v87[3] = &unk_100121770;
          v87[4] = self;
          id v55 = v14;
          id v88 = v55;
          long long v89 = v10;
          [v55 setInvalidationHandler:v87];
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472;
          v85[2] = sub_10001FCE0;
          v85[3] = &unk_1001219F8;
          v85[4] = self;
          id v56 = v55;
          id v86 = v56;
          [v56 setReceivedEventHandler:v85];
          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472;
          v83[2] = sub_10001FCFC;
          v83[3] = &unk_100121A20;
          v83[4] = self;
          id v57 = v56;
          id v84 = v57;
          [v57 setReceivedRequestHandler:v83];
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_10001FD1C;
          v79[3] = &unk_100121A98;
          id v80 = v8;
          v81 = self;
          id v58 = v57;
          id v82 = v58;
          [v58 setStateChangedHandler:v79];
          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472;
          v76[2] = sub_10001FD90;
          v76[3] = &unk_1001219D0;
          id v59 = v58;
          id v77 = v59;
          v78 = self;
          [v59 setHomeKitUserIdentifierHandler:v76];
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_10001FE28;
          v74[3] = &unk_1001219D0;
          v74[4] = self;
          id v60 = v59;
          id v75 = v60;
          [v60 setProxyDeviceUpdateHandler:v74];
          if (v72)
          {
            bleClientConnections = self->_bleClientConnections;
            p_bleClientConnections = &self->_bleClientConnections;
            tcpOnDemandClientConnections = bleClientConnections;
            if (!bleClientConnections) {
              goto LABEL_136;
            }
          }
          else
          {
            tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;
            if (!tcpOnDemandClientConnections)
            {
              p_bleClientConnections = &self->_tcpOnDemandClientConnections;
LABEL_136:
              id v64 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              id v65 = *p_bleClientConnections;
              *p_bleClientConnections = v64;

              tcpOnDemandClientConnections = *p_bleClientConnections;
            }
          }
          [(NSMutableDictionary *)tcpOnDemandClientConnections setObject:v60 forKeyedSubscript:v10];
          [v60 activate];
          id v46 = v60;

          goto LABEL_138;
        }
LABEL_87:
        if ((v13 & 0x400000) == 0)
        {
          [(RPCompanionLinkDaemon *)self _clientOnDemandDiscoveryStart:v8 xpcCnx:v9];
          id v46 = v14;
          goto LABEL_138;
        }
        id v49 = RPErrorF();
        if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (a5) {
          *a5 = v49;
        }

LABEL_79:
        id v46 = 0;
LABEL_138:

LABEL_139:
        goto LABEL_140;
      }
      unint64_t v20 = v13;
      id v21 = (void *)v50;
      [v9 setNeedsCLink:1];
      int v72 = 0;
      long long v29 = "AWDL";
    }
    BOOL v71 = v29;
    goto LABEL_21;
  }
  id v22 = RPErrorF();
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v23 = v8;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v24 = [v23 shortDescription];
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        [v23 descriptionWithLevel:50];
      }
      else {
      uint64_t v24 = [v23 description];
      }
    }
    int v45 = (void *)v24;

    LogPrintF();
  }
  if (a5) {
    *a5 = v22;
  }

  id v46 = 0;
LABEL_140:

  return v46;
}

- (void)_clientConnectionEnded:(id)a3 uniqueID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v6;
    id v10 = v11;
    LogPrintF();
  }
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0, v11, v9, v10);
  id v7 = [(NSMutableDictionary *)self->_bleClientConnections objectForKeyedSubscript:v6];
  if (v7 == v11) {
    [(NSMutableDictionary *)self->_bleClientConnections setObject:0 forKeyedSubscript:v6];
  }
  id v8 = [(NSMutableDictionary *)self->_tcpClientConnections objectForKeyedSubscript:v6];

  if (v8 == v11) {
    [(NSMutableDictionary *)self->_tcpClientConnections setObject:0 forKeyedSubscript:v6];
  }
  [(RPCompanionLinkDaemon *)self _updateAssertions];
  [(RPCompanionLinkDaemon *)self _update];
}

- (void)_clientOnDemandConnectionEnded:(id)a3 uniqueID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v6;
    id v11 = v12;
    LogPrintF();
  }
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0, v12, v10, v11);
  [(RPCompanionLinkDaemon *)self _sessionHandlePeerDisconnect:v12];
  id v7 = [v12 bonjourPeerDevice];

  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_tcpOnDemandClientConnections objectForKeyedSubscript:v6];
    if (v8 != v12) {
      goto LABEL_10;
    }
    p_tcpOnDemandClientConnections = &self->_tcpOnDemandClientConnections;
  }
  else
  {
    p_tcpOnDemandClientConnections = &self->_bleClientConnections;
    id v8 = [(NSMutableDictionary *)self->_bleClientConnections objectForKeyedSubscript:v6];
    if (v8 != v12) {
      goto LABEL_10;
    }
  }
  [(NSMutableDictionary *)*p_tcpOnDemandClientConnections setObject:0 forKeyedSubscript:v6];
LABEL_10:

  [(RPCompanionLinkDaemon *)self _updateAssertions];
  [(RPCompanionLinkDaemon *)self _update];
}

- (BOOL)_clientConnectionStartUnauth:(id)a3 client:(id)a4 publicID:(id)a5 xpcCnx:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = [v12 bonjourDevice];
  if (!v16)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v32 = v12;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v33 = [v32 shortDescription];
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [v32 descriptionWithLevel:50];
        }
        else {
        uint64_t v33 = [v32 description];
        }
      }
      uint64_t v36 = (void *)v33;

      LogPrintF();
      if (!a7) {
        goto LABEL_49;
      }
    }
    else if (!a7)
    {
LABEL_49:
      BOOL v41 = 0;
      goto LABEL_50;
    }
LABEL_48:
    RPErrorF();
    BOOL v41 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
  long long v17 = (char *)[(NSMutableDictionary *)self->_tcpClientConnections count];
  if (&v17[(void)[(NSMutableDictionary *)self->_tcpOnDemandClientConnections count]] >= (char *)self->_prefMaxConnectionCount)
  {
    if (dword_100140E48 <= 60 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v34 = v12;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v35 = [v34 shortDescription];
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [v34 descriptionWithLevel:50];
        }
        else {
        uint64_t v35 = [v34 description];
        }
      }
      unsigned int v42 = (void *)v35;

      LogPrintF();
      if (!a7) {
        goto LABEL_49;
      }
    }
    else if (!a7)
    {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  id v18 = objc_alloc_init((Class)RPConnection);
  uint64_t v19 = [v13 appID];
  [v18 setAppID:v19];

  [v18 setBonjourPeerDevice:v16];
  [v18 setClient:v13];
  [v18 setControlFlags:((unint64_t)[v13 controlFlags] | (unint64_t)[v18 controlFlags]) | 0x200];
  [v18 setDispatchQueue:self->_dispatchQueue];
  [v18 setFlags:1];
  unint64_t v20 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v18 setIdentityDaemon:v20];

  id v21 = objc_alloc((Class)NSString);
  uint64_t v22 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v22;
  id v23 = [v21 initWithFormat:@"%@Cnx-%u", @"CLink", v22];
  [v18 setLabel:v23];

  [v18 setLocalDeviceInfo:self->_localDeviceInfo];
  [v18 setNetLinkManager:self->_netLinkManager];
  uint64_t v24 = [v13 password];
  [v18 setPassword:v24];

  [v18 setPeerIdentifier:v14];
  [v18 setPresent:1];
  [v15 setNetCnx:v18];
  [(RPCompanionLinkDaemon *)self _configureConnectionForPairing:v18];
  id v25 = [v13 passwordType];
  if (v25)
  {
    id v26 = v25;
    if (v25 != 3)
    {
      uint64_t v27 = [v13 allowedMACAddresses];
      [v18 setAllowedMACAddresses:v27];

      uint64_t v28 = [v13 pairSetupACL];
      [v18 setPairSetupACL:v28];

      [v18 setPasswordType:v26];
      if (([v13 internalAuthFlags] & 8) != 0)
      {
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100020928;
        v58[3] = &unk_100121908;
        id v59 = v15;
        [v18 setAuthCompletionHandler:v58];
      }
      if (([v13 internalAuthFlags] & 4) != 0)
      {
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_100020934;
        v55[3] = &unk_100121A70;
        id v56 = v15;
        id v57 = v18;
        [v18 setPromptForPasswordHandler:v55];
      }
    }
  }
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100020988;
  v52[3] = &unk_100121AC0;
  v52[4] = self;
  v52[5] = v18;
  id v29 = v14;
  id v53 = v29;
  id v54 = v15;
  [v18 setInvalidationHandler:v52];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000209C8;
  v51[3] = &unk_1001219F8;
  v51[4] = self;
  v51[5] = v18;
  [v18 setReceivedEventHandler:v51];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000209E4;
  v50[3] = &unk_100121A20;
  v50[4] = self;
  v50[5] = v18;
  [v18 setReceivedRequestHandler:v50];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100020A04;
  v49[3] = &unk_100121A48;
  v49[4] = self;
  v49[5] = v18;
  [v18 setStateChangedHandler:v49];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100020A14;
  v48[3] = &unk_1001219D0;
  void v48[4] = v18;
  v48[5] = self;
  [v18 setHomeKitUserIdentifierHandler:v48];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100020AAC;
  v47[3] = &unk_1001219D0;
  v47[4] = self;
  v47[5] = v18;
  [v18 setProxyDeviceUpdateHandler:v47];
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v30 = v12;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v31 = [v30 shortDescription];
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        [v30 descriptionWithLevel:50];
      }
      else {
      uint64_t v31 = [v30 description];
      }
    }
    long long v37 = (void *)v31;

    int v45 = v37;
    id v46 = v18;
    id v44 = v29;
    LogPrintF();
  }
  tcpClientConnections = self->_tcpClientConnections;
  if (!tcpClientConnections)
  {
    uint64_t v39 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v40 = self->_tcpClientConnections;
    self->_tcpClientConnections = v39;

    tcpClientConnections = self->_tcpClientConnections;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](tcpClientConnections, "setObject:forKeyedSubscript:", v18, v29, v44, v45, v46);
  [v18 activate];
  [(RPCompanionLinkDaemon *)self _updateAssertions];

  BOOL v41 = 1;
LABEL_50:

  return v41;
}

- (void)_clientConnectionEndedUnauth:(id)a3 publicID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v6;
    id v9 = v10;
    LogPrintF();
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v6, v8, v9);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v10) {
    [(NSMutableDictionary *)self->_tcpClientConnections setObject:0 forKeyedSubscript:v6];
  }
  [(RPCompanionLinkDaemon *)self _updateAssertions];
  [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateAllDevices];
}

- (void)_clientOnDemandDiscoveryStart:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 discoveryTimer];

  if (!v9)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v18 = v7;
      LogPrintF();
    }
    id v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    [v8 setDiscoveryTimer:v10];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100020E60;
    handler[3] = &unk_100121AC0;
    handler[4] = v10;
    void handler[5] = self;
    id v11 = v7;
    id v20 = v11;
    id v12 = v8;
    id v21 = v12;
    dispatch_source_set_event_handler(v10, handler);
    CUDispatchTimerSet();
    dispatch_activate(v10);
    id v13 = [v12 client];
    [v11 setNearbyActionV2Type:-[RPCompanionLinkDaemon _controlFlagsToNearbyActionType:](self, "_controlFlagsToNearbyActionType:", objc_msgSend(v13, "controlFlags"))];

    id v14 = [v11 bleTargetData];
    if (v14 && [v11 nearbyActionV2Type])
    {
      [v12 setNeedsNearbyActionV2:1];
      bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
      p_bleNearbyActionV2Device = &self->_bleNearbyActionV2Device;
      if (!bleNearbyActionV2Device) {
        goto LABEL_16;
      }
    }
    else
    {
      [v12 setNeedsCLink:1, v18];
      bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
      p_bleNearbyActionV2Device = &self->_bleNeedsCLinkDevice;
      if (!bleNeedsCLinkDevice) {
LABEL_16:
      }
        objc_storeStrong((id *)p_bleNearbyActionV2Device, a3);
    }

    goto LABEL_18;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_18:
}

- (void)_clientOnDemandAWDLDiscoveryStartForXPC:(id)a3
{
  id v4 = a3;
  id v5 = [v4 client];
  [v5 awdlGuestDiscoveryTimeout];

  id v6 = [v4 discoveryTimer];

  if (v6)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = [v4 discoveryTimer];
    dispatch_source_cancel(v7);

    [v4 setDiscoveryTimer:0];
    [v4 setNeedsCLink:0];
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_enableAWDLGuestDiscovery = 1;
  id v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  [v4 setDiscoveryTimer:v8];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000210B8;
  handler[3] = &unk_100121770;
  handler[4] = v8;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_activate(v8);
  [v9 setNeedsCLink:1];
  [(RPCompanionLinkDaemon *)self _update];
}

- (void)_clientOnDemandAWDLDiscoveryTimedOutForDevice:(id)a3 xpcCnx:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v13 = v14;
    LogPrintF();
  }
  [v6 setDiscoveryTimer:0, v13];
  [v6 setNeedsCLink:0];
  [v6 setNeedsNearbyActionV2:0];
  id v7 = [v6 daemonDevice];
  unsigned int v8 = [v7 isEqualToDevice:self->_bleNearbyActionV2Device];

  if (v8)
  {
    [(RPCompanionLinkDaemon *)self _clientBLENearbyActionV2AdvertiserRestart];
  }
  else
  {
    id v9 = [v6 daemonDevice];
    unsigned int v10 = [v9 isEqualToDevice:self->_bleNeedsCLinkDevice];

    if (v10) {
      [(RPCompanionLinkDaemon *)self _clientBLENeedsCLinkAdvertiserRestart];
    }
  }
  id v11 = [v6 netCnx];
  id v12 = RPErrorF();
  [v11 invalidateWithError:v12];

  [v6 setNetCnx:0];
  [(RPCompanionLinkDaemon *)self _updateForXPCClientChange];
}

- (void)_clientPurgeUnauthAWDLDevices
{
  id v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_unauthDevices;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [(NSMutableDictionary *)self->_unauthDevices objectForKeyedSubscript:v9];
        id v11 = v10;
        if (v10 && ([v10 statusFlags] & 8) != 0)
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v12 = v11;
            LogPrintF();
          }
          [v11 setStatusFlags:((unint64_t)[v11 statusFlags:v12] & 0xFFFFFFFFFFFFFFF3)];
          [v3 addObject:v9];
          [(RPCompanionLinkDaemon *)self _clientReportLostDevice:v11];
        }
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_unauthDevices removeObjectsForKeys:v3];
}

- (id)logDictionaryOfStringArrays:(id)a3 withPrefix:(id)a4
{
  id v5 = a3;
  id v25 = (char *)a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v28 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v28)
  {
    unint64_t v6 = 0;
    id v7 = 0;
    id v26 = v5;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        unsigned int v10 = [v5 objectForKeyedSubscript:v9, v21, v23, v24];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v29 = v9;
          uint64_t v14 = *(void *)v31;
          while (2)
          {
            uint64_t v15 = 0;
            unint64_t v16 = v6;
            long long v17 = v7;
            do
            {
              uint64_t v18 = v15;
              if (*(void *)v31 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * v15);
              NSAppendPrintF();
              id v7 = v17;

              unint64_t v6 = v16 + v15 + 1;
              if (v6 >= 0x11)
              {
                id v21 = [(char *)[v11 count:v22] + ~v16 - v15];
                NSAppendPrintF();
                id v19 = v7;

                id v7 = v19;
                goto LABEL_16;
              }
              ++v15;
              long long v17 = v7;
            }
            while (v13 != (id)(v18 + 1));
            id v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
            unint64_t v6 = v16 + v15;
            if (v13) {
              continue;
            }
            break;
          }
          unint64_t v6 = v16 + v18 + 1;
LABEL_16:
          id v5 = v26;
          uint64_t v9 = v29;
        }

        if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v23 = v9;
          id v24 = v7;
          id v21 = v25;
          LogPrintF();
        }
      }
      id v28 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v28);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_clientReportFoundDevice:(id)a3
{
  id v4 = a3;
  [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCLink];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) reportFoundDevice:v4 outReason:0 v10];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_clientReportLostDevice:(id)a3
{
  id v4 = a3;
  [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCLink];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) reportLostDevice:v4 v10];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCLink];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_xpcConnections;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) reportChangedDevice:v6 changes:v4];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_clientReportUINoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_prefUINotesEnabled)
  {
    id v6 = [v4 idsDeviceIdentifier];
    if (v6
      || ([v5 identifier], (id v6 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v5 publicIdentifier], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v15 = 0;
      id v7 = [(RPCompanionLinkDaemon *)self _findDeviceWithDevice:v5 deviceMap:self->_uiNoteDevices matchedIdentifier:&v15];
      if (([v5 statusFlags] & 0x200000) != 0)
      {
        if (!v7 && dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          long long v14 = v5;
          LogPrintF();
        }
        uiNoteDevices = self->_uiNoteDevices;
        if (!uiNoteDevices)
        {
          uint64_t v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          long long v11 = self->_uiNoteDevices;
          self->_uiNoteDevices = v10;

          uiNoteDevices = self->_uiNoteDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](uiNoteDevices, "setObject:forKeyedSubscript:", v5, v6, v14);
      }
      else if (v7)
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          long long v14 = v7;
          LogPrintF();
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uiNoteDevices, "setObject:forKeyedSubscript:", 0, v15, v14);
        [v7 setUiTriggered:0];
        id v8 = [(CUUserNotificationSession *)self->_uiNoteSession identifier];
        if ([v8 isEqual:v15])
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            long long v14 = v7;
            LogPrintF();
          }
          [(CUUserNotificationSession *)self->_uiNoteSession invalidate];
          uiNoteSession = self->_uiNoteSession;
          self->_uiNoteSession = 0;
        }
      }
      if (!self->_uiNoteSession) {
        goto LABEL_34;
      }
      if (![(NSMutableDictionary *)self->_uiNoteDevices count])
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          long long v14 = v7;
          LogPrintF();
        }
        [(CUUserNotificationSession *)self->_uiNoteSession invalidate];
        long long v13 = self->_uiNoteSession;
        self->_uiNoteSession = 0;
      }
      if (!self->_uiNoteSession) {
LABEL_34:
      }
        [(RPCompanionLinkDaemon *)self _clientUINoteProcessPending];
    }
    else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_clientUINoteProcessPending
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_10000F400;
  id v15 = sub_10000F410;
  id v16 = 0;
  uiNoteDevices = self->_uiNoteDevices;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021FD8;
  v10[3] = &unk_100121AE8;
  v10[4] = &v11;
  [(NSMutableDictionary *)uiNoteDevices enumerateKeysAndObjectsUsingBlock:v10];
  if (v12[5])
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    xpcMatchingMap = self->_xpcMatchingMap;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100022050;
    v5[3] = &unk_1001215E0;
    v5[4] = &v6;
    [(NSMutableDictionary *)xpcMatchingMap enumerateKeysAndObjectsUsingBlock:v5];
    if (*((unsigned char *)v7 + 24))
    {
      [(RPCompanionLinkDaemon *)self _clientUINoteStart:v12[5]];
    }
    else if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _Block_object_dispose(&v6, 8);
  }
  _Block_object_dispose(&v11, 8);
}

- (void)_clientUINoteStart:(id)a3
{
  id v4 = a3;
  id v5 = [(RPCompanionLinkDaemon *)self _getAppleID];
  if (v5)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v4;
      LogPrintF();
    }
    [v4 setUiTriggered:1, v11];
    uint64_t v6 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
    uiNoteSession = self->_uiNoteSession;
    self->_uiNoteSession = v6;
    uint64_t v8 = v6;

    [(CUUserNotificationSession *)v8 setBundleID:@"com.apple.RPUserNotificationAppSignIn"];
    [(CUUserNotificationSession *)v8 setCategoryID:@"RPUserNotificationAppSignIn"];
    [(CUUserNotificationSession *)v8 setDispatchQueue:self->_dispatchQueue];
    [(CUUserNotificationSession *)v8 setFlags:1];
    char v9 = [v4 effectiveIdentifier];
    [(CUUserNotificationSession *)v8 setIdentifier:v9];

    [(CUUserNotificationSession *)v8 setLabel:@"CLink"];
    [(CUUserNotificationSession *)v8 setTitleKey:@"APP_SIGN_IN_TITLE"];
    [(CUUserNotificationSession *)v8 setBodyKey:@"APP_SIGN_IN_BODY_FORMAT"];
    long long v14 = v5;
    uint64_t v10 = +[NSArray arrayWithObjects:&v14 count:1];
    [(CUUserNotificationSession *)v8 setBodyArguments:v10];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002230C;
    v12[3] = &unk_100121B10;
    void v12[4] = v8;
    void v12[5] = self;
    id v13 = v4;
    [(CUUserNotificationSession *)v8 setActionHandler:v12];
    [(CUUserNotificationSession *)v8 activate];
  }
  else if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_clientUINoteAction:(int)a3 error:(id)a4 device:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    if (a3 > 5) {
      char v9 = "?";
    }
    else {
      char v9 = off_100122428[a3];
    }
    uiNoteSession = self->_uiNoteSession;
    id v14 = v8;
    id v11 = v9;
    id v12 = v15;
    LogPrintF();
  }
  if (a3 == 1) {
    [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryUINoteDevice:v8];
  }
  [(CUUserNotificationSession *)self->_uiNoteSession invalidate];
  uint64_t v10 = self->_uiNoteSession;
  self->_uiNoteSession = 0;

  [(RPCompanionLinkDaemon *)self _clientUINoteProcessPending];
}

- (BOOL)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100140E48 <= 10 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v8;
    uint64_t v12 = v6;
    LogPrintF();
  }
  BOOL v9 = -[RPCompanionLinkDaemon _clientBLETriggerEnhancedDiscovery:useCase:error:](self, "_clientBLETriggerEnhancedDiscovery:useCase:error:", v8, v6, a5, v11, v12);

  return v9;
}

- (BOOL)createDeviceToEndpointMappingForDeviceID:(id)a3 endpointUUID:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v9 = [(RPCompanionLinkDaemon *)self findDeviceFromID:v8];
  if (v9)
  {
    uint64_t v10 = +[NSUUID UUID];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v9;
      id v14 = v10;
      LogPrintF();
    }
    if (a4) {
      *a4 = v10;
    }
    BOOL v11 = +[RPNWEndpoint addEndpointMapping:v9, v10, @"NA", 0, 0, v13, v14 endpointID applicationService discoverySessionID shouldAutomapListener];
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a5)
    {
      RPErrorF();
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (void)_serverEnsureStarted
{
  unsigned int v3 = [(RPCompanionLinkDaemon *)self _serverBonjourShouldRun];
  unsigned __int8 v4 = [(RPCompanionLinkDaemon *)self _serverBonjourAWDLShouldRun];
  if ((v3 & 1) != 0
    || (v4 & 1) != 0
    || [(RPCompanionLinkDaemon *)self _serverTCPHasActiveConnections])
  {
    [(RPCompanionLinkDaemon *)self _serverTCPEnsureStarted];
  }
  else
  {
    [(RPCompanionLinkDaemon *)self _serverTCPEnsureStopped];
  }
  [(RPCompanionLinkDaemon *)self _serverBTAddressMonitorEnsureStarted];
  [(RPCompanionLinkDaemon *)self _serverBLENeedsCLinkScannerEnsureStarted];
  if ([(RPCompanionLinkDaemon *)self _serverNearbyActionV2DiscoveryShouldRun])
  {
    [(RPCompanionLinkDaemon *)self _serverNearbyActionV2DiscoveryEnsureStarted];
    if (!v3) {
      goto LABEL_13;
    }
  }
  else
  {
    [(RPCompanionLinkDaemon *)self _serverNearbyActionV2DiscoveryEnsureStopped];
    if (!v3) {
      goto LABEL_13;
    }
  }
  if (!self->_homeKitWaiting || self->_homeKitLTPK)
  {
    [(RPCompanionLinkDaemon *)self _serverBonjourEnsureStarted];
    goto LABEL_14;
  }
LABEL_13:
  [(RPCompanionLinkDaemon *)self _serverBonjourEnsureStopped];
LABEL_14:
  if ([(RPCompanionLinkDaemon *)self _serverBonjourAWDLAdvertiserShouldRun])
  {
    [(RPCompanionLinkDaemon *)self _serverBonjourAWDLAdvertiserEnsureStarted];
  }
  else
  {
    [(RPCompanionLinkDaemon *)self _serverBonjourAWDLAdvertiserEnsureStopped];
  }
}

- (void)_serverEnsureStopped
{
  [(RPCompanionLinkDaemon *)self _serverBLENeedsCLinkScannerEnsureStopped];
  [(RPCompanionLinkDaemon *)self _serverNearbyActionV2DiscoveryEnsureStopped];
  [(RPCompanionLinkDaemon *)self _serverBonjourAWDLAdvertiserEnsureStopped];
  [(RPCompanionLinkDaemon *)self _serverBonjourEnsureStopped];
  [(RPCompanionLinkDaemon *)self _serverBTAddressMonitorEnsureStopped];

  [(RPCompanionLinkDaemon *)self _serverTCPEnsureStopped];
}

- (BOOL)_serverNearbyActionV2DiscoveryShouldRun
{
  id v2 = +[RPCloudDaemon sharedCloudDaemon];
  BOOL v4 = [v2 idsIsSignedIn]
    && ((int DeviceClass = GestaltGetDeviceClass(), DeviceClass == 3) || DeviceClass == 100 || DeviceClass == 11)
    && (([v2 idsHasiPad] & 1) != 0
     || ([v2 idsHasMac] & 1) != 0
     || [v2 idsHasRealityDevice]);

  return v4;
}

- (void)_serverNearbyActionV2DiscoveryEnsureStarted
{
  if (!self->_bleNearbyActionV2Discovery)
  {
    unsigned int v3 = objc_alloc_init(RPNearbyActionV2Discovery);
    bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = v3;

    [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery setDiscoveryFlags:0x402000000];
    [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100022978;
    v7[3] = &unk_100121158;
    void v7[4] = self;
    [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery setUpdateHandler:v7];
    id v5 = self->_bleNearbyActionV2Discovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000229B8;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(RPNearbyActionV2Discovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_serverNearbyActionV2DiscoveryEnsureStopped
{
  bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
  if (bleNearbyActionV2Discovery)
  {
    [(RPNearbyActionV2Discovery *)bleNearbyActionV2Discovery invalidate];
    BOOL v4 = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = 0;
  }
}

- (BOOL)_serverNearbyInfoV2DiscoveryShouldRun
{
  if (_os_feature_enabled_impl())
  {
    unsigned int v3 = +[RPIdentityDaemon sharedIdentityDaemon];
    BOOL v4 = [v3 identitiesOfType:15 error:0];

    if ([v4 count]
      && ((int DeviceClass = GestaltGetDeviceClass(), DeviceClass == 1) || DeviceClass == 100 || DeviceClass == 3))
    {
      BOOL v6 = (BYTE5(self->_bleDiscoveryControlFlags) >> 5) & 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_serverNearbyInfoV2DiscoveryEnsureStarted
{
  if (!self->_bleNearbyInfoV2Discovery)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v3 = objc_alloc_init(RPNearbyInfoV2Discovery);
    bleNearbyInfoV2Discovery = self->_bleNearbyInfoV2Discovery;
    self->_bleNearbyInfoV2Discovery = v3;

    [(RPNearbyInfoV2Discovery *)self->_bleNearbyInfoV2Discovery setDiscoveryType:17];
    [(RPNearbyInfoV2Discovery *)self->_bleNearbyInfoV2Discovery setDispatchQueue:self->_dispatchQueue];
    [(RPNearbyInfoV2Discovery *)self->_bleNearbyInfoV2Discovery setUseCase:131094];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100022CB0;
    v8[3] = &unk_100121B38;
    void v8[4] = self;
    [(RPNearbyInfoV2Discovery *)self->_bleNearbyInfoV2Discovery setDeviceFoundHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100022D14;
    v7[3] = &unk_100121B38;
    void v7[4] = self;
    [(RPNearbyInfoV2Discovery *)self->_bleNearbyInfoV2Discovery setDeviceLostHandler:v7];
    id v5 = self->_bleNearbyInfoV2Discovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100022D80;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(RPNearbyInfoV2Discovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_serverNearbyInfoV2DiscoveryEnsureStopped
{
  if (self->_bleNearbyInfoV2Discovery)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNearbyInfoV2Discovery *)self->_bleNearbyInfoV2Discovery invalidate];
    bleNearbyInfoV2Discovery = self->_bleNearbyInfoV2Discovery;
    self->_bleNearbyInfoV2Discovery = 0;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v4 = [(NSMutableDictionary *)self->_nearbyInfoV2Devices allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = [(NSMutableDictionary *)self->_nearbyInfoV2Devices objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          uint64_t v10 = v9;
          if (v9)
          {
            BOOL v11 = [v9 cbDevice];
            uint64_t v12 = [v10 idsDeviceIdentifier];
            [(RPCompanionLinkDaemon *)self _serverNearbyInfoV2DeviceLost:v11 idsIdentifier:v12 force:1 deviceFlags:4];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (void)_serverBLENeedsCLinkScannerEnsureStarted
{
  if (self->_bleNeedsCLinkScanner)
  {
    BOOL v3 = [(RPCompanionLinkDaemon *)self _serverBLENeedsCLinkScannerScreenOff];
    if (v3 != [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner overrideScreenOff])
    {
      bleNeedsCLinkScanner = self->_bleNeedsCLinkScanner;
      [(SFDeviceDiscovery *)bleNeedsCLinkScanner setOverrideScreenOff:v3];
    }
  }
  else
  {
    unsigned int bleNeedsCLinkScannerID = self->_bleNeedsCLinkScannerID;
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = (SFDeviceDiscovery *)objc_alloc_init(off_100140EB8());
    uint64_t v7 = self->_bleNeedsCLinkScanner;
    self->_bleNeedsCLinkScanner = v6;

    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setChangeFlags:1];
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setDiscoveryFlags:64];
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setOverrideScreenOff:[(RPCompanionLinkDaemon *)self _serverBLENeedsCLinkScannerScreenOff]];
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setPurpose:@"CLink"];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002321C;
    v14[3] = &unk_100121890;
    unsigned int v15 = bleNeedsCLinkScannerID;
    v14[4] = self;
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setDeviceFoundHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002323C;
    v12[3] = &unk_100121890;
    unsigned int v13 = bleNeedsCLinkScannerID;
    void v12[4] = self;
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setDeviceLostHandler:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002325C;
    v10[3] = &unk_1001218B8;
    unsigned int v11 = bleNeedsCLinkScannerID;
    v10[4] = self;
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner setDeviceChangedHandler:v10];
    id v8 = self->_bleNeedsCLinkScanner;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002327C;
    v9[3] = &unk_100121908;
    v9[4] = self;
    [(SFDeviceDiscovery *)v8 activateWithCompletion:v9];
  }
}

- (void)_serverBLENeedsCLinkScannerEnsureStopped
{
  if (self->_bleNeedsCLinkScanner)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t bleNeedsCLinkScannerID = self->_bleNeedsCLinkScannerID;
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleNeedsCLinkScanner invalidate];
    bleNeedsCLinkScanner = self->_bleNeedsCLinkScanner;
    self->_bleNeedsCLinkScanner = 0;

    ++self->_bleNeedsCLinkScannerID;
    [(NSMutableDictionary *)self->_bleNeedsCLinkDevices removeAllObjects];
    pendingLostNeedsCLinkDevicesTimer = self->_pendingLostNeedsCLinkDevicesTimer;
    if (pendingLostNeedsCLinkDevicesTimer)
    {
      dispatch_source_cancel(pendingLostNeedsCLinkDevicesTimer);
      id v5 = self->_pendingLostNeedsCLinkDevicesTimer;
      self->_pendingLostNeedsCLinkDevicesTimer = 0;
    }
  }
}

- (BOOL)_serverBLENeedsCLinkScannerScreenOff
{
  if (self->_prefCommunal) {
    return 1;
  }
  BOOL v3 = +[RPCloudDaemon sharedCloudDaemon];
  BOOL v2 = ([v3 idsHasAppleTV] & 1) != 0
    || ([v3 idsHasHomePod] & 1) != 0
    || ([v3 idsHasMac] & 1) != 0
    || (int)[v3 idsHandheldCount] > 2;

  return v2;
}

- (void)_serverBLENeedsCLinkScannerDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  uint64_t v7 = [v4 idsIdentifier];
  if (v6)
  {
    id v8 = [(NSMutableDictionary *)self->_bleNeedsCLinkDevices objectForKeyedSubscript:v6];
    if ([v4 deviceActionType] != 51)
    {
      if (!v8) {
        goto LABEL_45;
      }
      [(NSMutableDictionary *)self->_bleNeedsCLinkDevices setObject:0 forKeyedSubscript:v6];
      if (dword_100140E48 > 30 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_45;
      }
      id v26 = v8;
      goto LABEL_13;
    }
    bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
    if (!bleNeedsCLinkDevices)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      unsigned int v11 = self->_bleNeedsCLinkDevices;
      self->_bleNeedsCLinkDevices = v10;

      bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
    }
    [(NSMutableDictionary *)bleNeedsCLinkDevices setObject:v4 forKeyedSubscript:v6];
    if (v8)
    {
      if (dword_100140E48 > 30 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_45;
      }
      id v26 = v4;
LABEL_13:
      LogPrintF();
LABEL_45:
      [(RPCompanionLinkDaemon *)self _update];

      goto LABEL_46;
    }
    uint64_t v29 = v6;
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v26 = v4;
      LogPrintF();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v28 = self;
    uint64_t v12 = [(NSMutableDictionary *)self->_bleNeedsCLinkDevices allValues];
    id v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v13)
    {
LABEL_38:

      self = v28;
      id v6 = v29;
LABEL_44:
      id v8 = 0;
      goto LABEL_45;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v31;
LABEL_24:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v31 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
      id v18 = [v17 idsIdentifier];
      id v19 = v7;
      id v20 = v19;
      if (v18 == v19) {
        break;
      }
      if ((v7 != 0) != (v18 == 0))
      {
        unsigned int v21 = [v18 isEqual:v19];

        if (v21) {
          goto LABEL_32;
        }
      }
      else
      {
      }
LABEL_36:
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v14) {
          goto LABEL_24;
        }
        goto LABEL_38;
      }
    }

LABEL_32:
    unsigned int v22 = [v17 isBLEDeviceReplaced];

    if (v22)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v26 = v17;
        id v27 = v4;
        LogPrintF();
      }
      self = v28;
      uint64_t v23 = v28->_bleNeedsCLinkDevices;
      id v24 = [v17 identifier:v26, v27];
      id v25 = [v24 UUIDString];
      [(NSMutableDictionary *)v23 setObject:0 forKeyedSubscript:v25];

      id v6 = v29;
      goto LABEL_44;
    }
    goto LABEL_36;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_46:
}

- (void)_serverBLENeedsCLinkScannerDeviceLost:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_bleNeedsCLinkDevices objectForKeyedSubscript:v5];
    if (v6)
    {
      if ([v8 isBLEDeviceReplaced])
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v7 = v8;
          LogPrintF();
        }
        [v6 setIsBLEDeviceReplaced:1, v7];
        [(RPCompanionLinkDaemon *)self _schedulePendingLostNeedsCLinkDeviceTimer];
      }
      else
      {
        [(NSMutableDictionary *)self->_bleNeedsCLinkDevices setObject:0 forKeyedSubscript:v5];
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          [(RPCompanionLinkDaemon *)self _update];
        }
        else
        {
          [(RPCompanionLinkDaemon *)self _update];
        }
      }
    }
  }
  else if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_schedulePendingLostNeedsCLinkDeviceTimer
{
  if (!self->_pendingLostNeedsCLinkDevicesTimer)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pendingLostNeedsCLinkDevicesTimer = self->_pendingLostNeedsCLinkDevicesTimer;
    self->_pendingLostNeedsCLinkDevicesTimer = v3;

    id v5 = self->_pendingLostNeedsCLinkDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100023C18;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_pendingLostNeedsCLinkDevicesTimer);
  }
}

- (void)_processPendingLostNeedsCLinkDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_bleNeedsCLinkDevices allValues];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 isBLEDeviceReplaced])
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v13 = v9;
            LogPrintF();
          }
          bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
          unsigned int v11 = [v9 identifier:v13];
          uint64_t v12 = [v11 UUIDString];
          [(NSMutableDictionary *)bleNeedsCLinkDevices setObject:0 forKeyedSubscript:v12];

          char v6 = 1;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);

    if (v6) {
      [(RPCompanionLinkDaemon *)self _update];
    }
  }
  else
  {
  }
}

- (BOOL)_serverBonjourShouldRun
{
  return self->_prefServerBonjourAlways
      || self->_serverBonjourInfraPairing
      || self->_prefServerBonjourOpportunitistic
      && (([(CUSystemMonitor *)self->_systemMonitor powerUnlimited] & 1) != 0
       || ![(CUSystemMonitor *)self->_systemMonitor screenLocked]);
}

- (BOOL)_serverBonjourAWDLShouldRun
{
  BOOL result = [(NSMutableDictionary *)self->_bleNeedsCLinkDevices count]
        || ([(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery actionV2Devices],
            BOOL v3 = objc_claimAutoreleasedReturnValue(),
            id v4 = [v3 count],
            v3,
            v4)
        || self->_bonjourAWDLAdvertiserForce
        || [(NSMutableSet *)self->_needsAWDLRequestIdentifiers count] != 0;
  return result;
}

- (void)_serverBonjourEnsureStarted
{
  if (self->_bonjourAdvertiser)
  {
    [(RPCompanionLinkDaemon *)self _serverBonjourUpdateTXT];
    return;
  }
  if (self->_btAdvAddrData)
  {
    if ((int)[(CUTCPServer *)self->_tcpServer tcpListeningPort] > 0)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v3 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
      bonjourAdvertiser = self->_bonjourAdvertiser;
      self->_bonjourAdvertiser = v3;

      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setDispatchQueue:self->_dispatchQueue];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setDomain:@"local."];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setLabel:@"CLink"];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setPort:[(CUTCPServer *)self->_tcpServer tcpListeningPort]];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setServiceType:@"_companion-link._tcp"];
      [(RPCompanionLinkDaemon *)self _serverBonjourUpdateTXT];
      id v5 = self->_bonjourAdvertiser;
      [(CUBonjourAdvertiser *)v5 activate];
      return;
    }
    if (dword_100140E48 > 20 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
      return;
    }
  }
  else if (dword_100140E48 > 20 || dword_100140E48 == -1 && !_LogCategory_Initialize())
  {
    return;
  }

  LogPrintF();
}

- (void)_serverBonjourEnsureStopped
{
  if (self->_bonjourAdvertiser)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = 0;
  }
}

- (id)_serverBonjourAuthTagString
{
  BOOL v3 = self->_deviceAuthTagStr;
  if (!v3)
  {
    id v4 = [(RPCompanionLinkDaemon *)self _serverBonjourAuthTagStringWithData:self->_btAdvAddrData];
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = v4;

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v3 = self->_deviceAuthTagStr;
  }

  return v3;
}

- (id)_serverBonjourAuthTagStringWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v5 = [v4 identityOfSelfAndReturnError:0];

    if (v5)
    {
      char v6 = [v5 authTagForData:v3 type:1 error:0];
      uint64_t v7 = v6;
      if (v6)
      {
        id v8 = v6;
        [v8 bytes];
        [v8 length];
        [v8 length];
        BOOL v9 = NSPrintF();
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_serverBonjourTempAuthTagStringWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v5 = [v4 identityOfTemporarySelfAndReturnError:0];

    if (v5)
    {
      char v6 = [v5 authTagForData:v3 type:1 error:0];
      uint64_t v7 = v6;
      if (v6)
      {
        id v8 = v6;
        [v8 bytes];
        [v8 length];
        [v8 length];
        BOOL v9 = NSPrintF();
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_serverBonjourUpdateTXT
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(RPCompanionLinkDaemon *)self _homeKitUpdateInfo:0];
  id v4 = [(RPCompanionLinkDaemon *)self _serverBonjourAuthTagString];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"rpAD"];
  }

  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr) {
    [v3 setObject:btAdvAddrStr forKeyedSubscript:@"rpBA"];
  }
  char v6 = [(RPCompanionLinkDaemon *)self _discoveryNonceOrRotate:0];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = [v8 bytes];
    id v10 = [v8 length];
    id v37 = [v8 length];
    unsigned int v11 = NSPrintF();
    [v3 setObject:v11 forKeyedSubscript:@"rpHN" v9, v10, v37];
  }
  int DeviceClass = GestaltGetDeviceClass();
  unint64_t v40 = 0;
  RPBonjourFlagsUpdateWithRPCompanionLinkFlags(&v40, [(RPCompanionLinkDevice *)self->_localDeviceInfo flags]);
  unint64_t v13 = v40;
  if (DeviceClass == 7) {
    unint64_t v13 = v40 | 0x40000;
  }
  unint64_t v14 = v13 & 0xFFFFFFFFFFBFFFFDLL | (2 * self->_prefCommunal) | ((unint64_t)self->_prefCoreDeviceEnabled << 22);
  unint64_t v40 = v14;
  if (DeviceClass == 100)
  {
    unint64_t v40 = v14 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)self->_prefCoreDevicePaired << 21);
    sub_10000EABC(100);
LABEL_12:
    unint64_t v15 = v40 | 0x20000;
    goto LABEL_14;
  }
  if (sub_10000EABC(DeviceClass)) {
    goto LABEL_12;
  }
  unint64_t v15 = v40;
LABEL_14:
  unint64_t v40 = v15 & 0xFFFFFFFFFFF6DFFFLL | ((unint64_t)self->_serverBonjourInfraPairing << 19) | ((unint64_t)self->_prefMediaControlEnabled << 13) | ((unint64_t)self->_prefTouchEnabled << 16);
  unint64_t v16 = (unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo statusFlags];
  unint64_t v40 = v40 & 0xFFFFFFFFFFFFBFFFLL | (((v16 >> 16) & 1) << 14);
  unint64_t v17 = (unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo statusFlags];
  unint64_t v18 = v40 & 0xFFFFFFFFFF7FFFFFLL | (((v17 >> 34) & 1) << 23);
  unint64_t v40 = v18;
  if (v18)
  {
    unint64_t v35 = v18;
    id v19 = NSPrintF();
    [v3 setObject:v19 forKeyedSubscript:@"rpFl"];
  }
  id v20 = self->_homeKitAuthTag;

  if (v20)
  {
    unsigned int v21 = v20;
    id v22 = [(NSData *)v21 bytes];
    id v23 = [(NSData *)v21 length];
    id v38 = [(NSData *)v21 length];
    id v24 = NSPrintF();
    [v3 setObject:v24 forKeyedSubscript:@"rpHA" v22, v23, v38, v40];
  }
  id v25 = self->_homeKitRotatingID;

  if (v25)
  {
    id v26 = v25;
    id v27 = [(NSData *)v26 bytes];
    id v28 = [(NSData *)v26 length];
    id v39 = [(NSData *)v26 length];
    uint64_t v29 = NSPrintF();
    [v3 setObject:v29 forKeyedSubscript:@"rpHI" withObject:v27 withObject:v28 withObject:v39];
  }
  unsigned int v30 = [(RPCompanionLinkDaemon *)self _localMediaAccessControlSetting];
  if (v30 - 1 >= 2) {
    uint64_t v31 = 0;
  }
  else {
    uint64_t v31 = v30;
  }
  uint64_t v36 = v31;
  long long v32 = NSPrintF();
  [v3 setObject:v32 forKeyedSubscript:@"rpMac" v36];

  if (self->_prefCommunal)
  {
    long long v33 = [(RPCompanionLinkDevice *)self->_localDeviceInfo model];
    if (v33) {
      [v3 setObject:v33 forKeyedSubscript:@"rpMd"];
    }
  }
  [v3 setObject:@"630.42.2" forKeyedSubscript:@"rpVr"];
  if ([(RPCompanionLinkDaemon *)self _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:6])
  {
    long long v34 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaRouteIdentifier];
    if (v34) {
      [v3 setObject:v34 forKeyedSubscript:@"rpMRtID"];
    }
  }
  [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setTxtDictionary:v3];
}

- (BOOL)_serverBonjourAWDLAdvertiserShouldRun
{
  if (self->_bonjourAWDLAdvertiserForce) {
    return 1;
  }
  if ([(NSMutableSet *)self->_needsAWDLRequestIdentifiers count]) {
    return 1;
  }
  if ([(RPCompanionLinkDaemon *)self _haveActiveServerConnectionsOnAWDL]) {
    return 1;
  }
  id v3 = [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery actionV2Devices];
  id v4 = [v3 count];

  if (v4) {
    return 1;
  }
  if (![(NSMutableDictionary *)self->_bleNeedsCLinkDevices count]) {
    return 0;
  }
  if (!self->_prefUseTargetAuthTag) {
    return 1;
  }
  uint64_t v7 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v8 = [v7 identityOfSelfAndReturnError:0];

  id v9 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v10 = [v9 identityOfTemporarySelfAndReturnError:0];

  unsigned int v11 = [v8 deviceIRKData];
  if (!v11)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v5 = 1;
    goto LABEL_68;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(NSMutableDictionary *)self->_bleNeedsCLinkDevices allValues];
  id v43 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v43)
  {
    BOOL v5 = 0;
    goto LABEL_67;
  }
  uint64_t v42 = *(void *)v46;
  id v39 = v10;
  unint64_t v40 = v8;
  id v38 = v11;
  while (2)
  {
    for (i = 0; i != v43; i = (char *)i + 1)
    {
      if (*(void *)v46 != v42) {
        objc_enumerationMutation(obj);
      }
      unint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      unint64_t v14 = [v13 bleDevice:v32 v35:v36 v37:v37];
      unint64_t v15 = [v14 advertisementFields];
      CFDataGetTypeID();
      unint64_t v16 = CFDictionaryGetTypedValue();

      if (!v16)
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          sub_10001B9C4(v13);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          LogPrintF();
          goto LABEL_65;
        }
        goto LABEL_66;
      }
      unint64_t v17 = [(CUSystemMonitor *)self->_systemMonitor bluetoothAddressData];
      unint64_t v18 = [v8 authTagForData:v17 type:2 error:0];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v19 = v13;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v20 = [v19 shortDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v19 descriptionWithLevel:50];
          }
          else {
          uint64_t v20 = [v19 description];
          }
        }
        unsigned int v21 = (void *)v20;

        id v36 = [v17 bytes];
        id v37 = v18;
        id v32 = v16;
        id v35 = v21;
        LogPrintF();
      }
      id v44 = v17;
      id v22 = v18;
      id v23 = [v22 bytes];
      id v24 = v16;
      if (!memcmp(v23, [v24 bytes], (size_t)objc_msgSend(v24, "length")))
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          long long v33 = sub_10001B9C4(v13);
          LogPrintF();
        }
LABEL_65:

LABEL_66:
        BOOL v5 = 1;
        unsigned int v11 = v38;
        goto LABEL_67;
      }
      id v25 = [(CBAdvertiser *)self->_cbAdvertiser advertisingAddressDataNonConnectable];
      if (v25)
      {
        id v26 = [v10 deviceIRKData];

        if (v26)
        {
          id v27 = [v10 authTagForData:v25 type:2 error:0];
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v28 = sub_10001B9C4(v13);
            id v36 = [v25 bytes];
            id v37 = v27;
            id v32 = v24;
            id v35 = v28;
            LogPrintF();
          }
          id v29 = v27;
          id v30 = [v29 bytes];
          id v31 = v24;
          if (!memcmp(v30, [v31 bytes], (size_t)objc_msgSend(v31, "length")))
          {
            id v8 = v40;
            if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              long long v34 = sub_10001B9C4(v13);
              LogPrintF();
            }
            id v24 = v31;
            id v10 = v39;
            goto LABEL_65;
          }
          id v8 = v40;
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            id v32 = v31;
            id v35 = v22;
            LogPrintF();
          }

          id v10 = v39;
        }
      }
    }
    BOOL v5 = 0;
    unsigned int v11 = v38;
    id v43 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v43) {
      continue;
    }
    break;
  }
LABEL_67:

LABEL_68:
  return v5;
}

- (void)_serverBonjourAWDLAdvertiserEnsureStarted
{
  if (self->_bonjourAWDLAdvertiser)
  {
    [(RPCompanionLinkDaemon *)self _serverBonjourAWDLAdvertiserUpdateTXT];
    return;
  }
  unint64_t v13 = self->_btAdvAddrData;
  if (!v13)
  {
    if (dword_100140E48 > 20 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  id v3 = [(CUTCPServer *)self->_tcpServer tcpListeningPort];
  if ((int)v3 > 0)
  {
    id v4 = v3;
    if (GestaltGetDeviceClass() != 11)
    {
      if ([(NSMutableSet *)self->_needsAWDLRequestIdentifiers count]
        || ([(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery actionV2Devices],
            BOOL v5 = objc_claimAutoreleasedReturnValue(),
            id v6 = [v5 count],
            v5,
            v6))
      {
        uint64_t v7 = +[RPWiFiP2PTransaction sharedInstance];
        [v7 activateForClient:@"Ensemble"];
      }
    }
    id v8 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
    bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
    self->_bonjourAWDLAdvertiser = v8;

    [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setAdvertiseFlags:2048];
    [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setDispatchQueue:self->_dispatchQueue];
    [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setDomain:@"local."];
    [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setInterfaceName:@"awdl0"];
    [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setLabel:@"CLink"];
    id v10 = NSPrintF();
    -[CUBonjourAdvertiser setName:](self->_bonjourAWDLAdvertiser, "setName:", v10, v13);

    [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setPort:v4];
    [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setServiceType:@"_companion-link._tcp"];
    [(RPCompanionLinkDaemon *)self _serverBonjourAWDLAdvertiserUpdateTXT];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = CUDescriptionWithLevel();
      LogPrintF();

      [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser activate];
    }
    else
    {
      [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser activate];
    }
    goto LABEL_22;
  }
  if (dword_100140E48 <= 20 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
LABEL_19:
  }
    LogPrintF();
LABEL_22:
}

- (void)_serverBonjourAWDLAdvertiserEnsureStopped
{
  bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
  if (bonjourAWDLAdvertiser)
  {
    if (dword_100140E48 <= 30)
    {
      if (dword_100140E48 != -1
        || (int v4 = _LogCategory_Initialize(), bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser, v4))
      {
        id v8 = CUDescriptionWithLevel();
        LogPrintF();

        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
      }
    }
    [(CUBonjourAdvertiser *)bonjourAWDLAdvertiser invalidate];
    if (!self->_bonjourBrowserAWDL)
    {
      BOOL v5 = +[RPWiFiP2PTransaction sharedInstance];
      [v5 invalidateForClient:@"Ensemble"];
    }
    id v6 = self->_bonjourAWDLAdvertiser;
    self->_bonjourAWDLAdvertiser = 0;

    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;
  }
}

- (void)_serverBonjourAWDLAdvertiserUpdateTXT
{
  if (self->_deviceAWDLRandomID
    || (NSRandomData(),
        id v3 = (NSData *)objc_claimAutoreleasedReturnValue(),
        deviceAWDLRandomID = self->_deviceAWDLRandomID,
        self->_deviceAWDLRandomID = v3,
        deviceAWDLRandomID,
        (id)[(NSData *)self->_deviceAWDLRandomID length] == (id)6))
  {
    id v23 = objc_alloc_init((Class)NSMutableDictionary);
    BOOL v5 = self->_deviceAWDLRandomID;
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = v5;
      id v18 = [(NSData *)v7 bytes];
      id v8 = NSPrintF();
      if (v8) {
        [v23 setObject:v8 forKeyedSubscript:@"rpBA"];
      }
      id v9 = -[RPCompanionLinkDaemon _serverBonjourAuthTagStringWithData:](self, "_serverBonjourAuthTagStringWithData:", v7, v18);
      if (v9) {
        [v23 setObject:v9 forKeyedSubscript:@"rpAD"];
      }
      id v10 = [(RPCompanionLinkDaemon *)self _serverBonjourTempAuthTagStringWithData:v7];
      if (v10) {
        [v23 setObject:v10 forKeyedSubscript:@"rpTAD"];
      }
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v19 = v8;
        id v22 = v9;
        LogPrintF();
      }
      unint64_t v11 = (unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo statusFlags];
      uint64_t v12 = 18432;
      if ((v11 & 0x10000) == 0) {
        uint64_t v12 = 2048;
      }
      if (self->_bonjourAWDLAdvertiseForPairing) {
        uint64_t v13 = v12 | 0x80000;
      }
      else {
        uint64_t v13 = v12;
      }
      uint64_t v20 = v13;
      unint64_t v14 = NSPrintF();
      [v23 setObject:v14 forKeyedSubscript:@"rpFl"];

      [v23 setObject:@"630.42.2" forKeyedSubscript:@"rpVr"];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        if (self->_bonjourAWDLAdvertiseForPairing) {
          unint64_t v15 = "yes";
        }
        else {
          unint64_t v15 = "no";
        }
        unsigned int v21 = v15;
        LogPrintF();
      }
      if (GestaltGetDeviceClass() == 4 || self->_bonjourAWDLAdvertiseForPairing)
      {
        unint64_t v16 = (char *)GestaltCopyAnswer();
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          unsigned int v21 = v16;
          LogPrintF();
        }
        if (v16) {
          [v23 setObject:v16 forKeyedSubscript:@"rpNm"];
        }
      }
      if (-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:](self, "_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:", 4, v21))
      {
        unint64_t v17 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaRouteIdentifier];
        if (v17) {
          [v23 setObject:v17 forKeyedSubscript:@"rpMRtID"];
        }
      }
      [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setTxtDictionary:v23];
    }
  }
}

- (void)_serverReceivedNeedsAWDLEvent:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  if (v8)
  {
    id v9 = NSDictionaryGetNSNumber();
    unsigned int v10 = [v9 BOOLValue];

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v11 = "disable";
      if (v10) {
        unint64_t v11 = "enable";
      }
      unsigned int v21 = v11;
      id v22 = v8;
      LogPrintF();
    }
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    if (v10)
    {
      if (needsAWDLRequestIdentifiers) {
        goto LABEL_19;
      }
      uint64_t v13 = +[NSMutableSet set];
      unint64_t v14 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = v13;

      [(NSMutableSet *)self->_needsAWDLRequestIdentifiers addObject:v8];
      if (self->_needsAWDLRequestTimer) {
        goto LABEL_19;
      }
      unint64_t v15 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = v15;
      unint64_t v17 = v15;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000258F4;
      handler[3] = &unk_100121158;
      handler[4] = self;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet();
      dispatch_activate(v17);
    }
    else
    {
      [(NSMutableSet *)needsAWDLRequestIdentifiers removeObject:v8];
      if ([(NSMutableSet *)self->_needsAWDLRequestIdentifiers count]) {
        goto LABEL_19;
      }
      id v18 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = 0;

      id v19 = self->_needsAWDLRequestTimer;
      if (!v19) {
        goto LABEL_19;
      }
      unint64_t v17 = v19;
      dispatch_source_cancel(v17);
      uint64_t v20 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;
    }
LABEL_19:
    [(RPCompanionLinkDaemon *)self _update];
    goto LABEL_20;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_20:
}

- (BOOL)_shouldSendActivityLevelOverWiFi
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  if (self->_prefSendActLvlInfra)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefSendActLvlInfra = 0;
  }

  return 0;
}

- (BOOL)_shouldReceiveActivityLevelOverWiFi:(int64_t)a3
{
  return a3 == 2;
}

- (void)_clientSendActivityLevelOverWiFiIfNecessary
{
  if ([(RPCompanionLinkDaemon *)self _shouldSendActivityLevelOverWiFi])
  {
    id v3 = [(RPCompanionLinkDevice *)self->_localDeviceInfo activityLevel];
    if (v3 != self->_lastSentActivityLevelOverWiFi)
    {
      id v4 = v3;
      id v5 = objc_alloc_init((Class)NSMutableSet);
      id v6 = +[RPCloudDaemon sharedCloudDaemon];
      id v7 = [v6 idsDeviceArray];

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100025D1C;
      void v24[3] = &unk_100121B60;
      v24[4] = self;
      id v8 = v5;
      id v25 = v8;
      id v18 = v7;
      [v7 enumerateObjectsUsingBlock:v24];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v13);
            id v19 = 0;
            unint64_t v15 = [(RPCompanionLinkDaemon *)self findConnectedDeviceForIdentifier:v14 controlFlags:0x400000 cnx:&v19];
            if (v15
              && ([v19 linkType] == 6
               || [v19 linkType] == 8
               || [v19 linkType] == 7))
            {
              unint64_t v16 = +[NSMutableDictionary dictionary];
              unint64_t v17 = +[NSNumber numberWithInt:v4];
              [v16 setObject:v17 forKeyedSubscript:@"_actLvl"];

              [v19 sendEncryptedEventID:@"_systemInfoUpdate" event:v16 options:0 completion:&stru_100121B80];
            }
            self->_lastSentActivityLevelOverWiFi = (int)v4;

            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)_serverBTAddressMonitorEnsureStarted
{
  if (!self->_btAdvAddrMonitor)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = v3;

    [(CUSystemMonitor *)self->_btAdvAddrMonitor setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100025F78;
    v7[3] = &unk_100121158;
    void v7[4] = self;
    [(CUSystemMonitor *)self->_btAdvAddrMonitor setRotatingIdentifierChangedHandler:v7];
    id v5 = self->_btAdvAddrMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100025F80;
    v6[3] = &unk_100121158;
    v6[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v6];
  }
}

- (void)_serverBTAddressMonitorEnsureStopped
{
  if (self->_btAdvAddrMonitor)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUSystemMonitor *)self->_btAdvAddrMonitor invalidate];
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = 0;
  }
}

- (void)_serverBTAddressChanged
{
  id obj = [(CUSystemMonitor *)self->_btAdvAddrMonitor rotatingIdentifierData];
  if ([obj length] == (id)6
    && ([(NSData *)self->_btAdvAddrData isEqual:obj] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_btAdvAddrData, obj);
    id v3 = obj;
    id v8 = [v3 bytes];
    NSPrintF();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    btAdvAddrStr = self->_btAdvAddrStr;
    self->_btAdvAddrStr = v4;

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      [v3 bytes:v8];
      LogPrintF();
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;

    id v7 = [(RPCompanionLinkDaemon *)self _discoveryNonceOrRotate:1];
    [(RPCompanionLinkDaemon *)self _homeKitUpdateInfo:1];
    [(RPCompanionLinkDaemon *)self _update];
  }
}

- (BOOL)_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:(int)a3
{
  uint64_t Int64 = CFPrefs_GetInt64();
  uint64_t v5 = CFPrefs_GetInt64();
  uint64_t v6 = CFPrefs_GetInt64();
  int DeviceClass = GestaltGetDeviceClass();
  int v8 = GestaltGetDeviceClass();
  BOOL v9 = Int64 == 1;
  if (v5 != 1)
  {
    if (DeviceClass == 4 || v8 == 100) {
      LODWORD(v5) = 0;
    }
    else {
      LODWORD(v5) = 0;
    }
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a3 == 6) {
    return DeviceClass == 4 && v9;
  }
  if (a3 != 4)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    return 0;
  }
  BOOL v10 = DeviceClass == 4 && v9;
  return v10 && v6 != 1 && ((v5 ^ 1) & 1) == 0;
}

- (void)_serverTCPEnsureStarted
{
  if (!self->_tcpServer)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUTCPServer *)objc_alloc_init((Class)CUTCPServer);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v3;

    [(CUTCPServer *)self->_tcpServer setDispatchQueue:self->_dispatchQueue];
    [(CUTCPServer *)self->_tcpServer setFlags:13];
    [(CUTCPServer *)self->_tcpServer setLabel:@"CLink"];
    [(CUTCPServer *)self->_tcpServer setMaxConnectionCount:self->_prefMaxConnectionCount];
    [(CUTCPServer *)self->_tcpServer setNetLinkManager:self->_netLinkManager];
    [(CUTCPServer *)self->_tcpServer setConnectionPrepareHandler:&stru_100121BC0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100026544;
    v10[3] = &unk_100121BE8;
    v10[4] = self;
    [(CUTCPServer *)self->_tcpServer setConnectionStartedHandler:v10];
    uint64_t v5 = self->_tcpServer;
    id v9 = 0;
    [(CUTCPServer *)v5 activateDirectAndReturnError:&v9];
    id v6 = v9;
    if (v6)
    {
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v8 = v6;
        LogPrintF();
      }
      [(CUTCPServer *)self->_tcpServer invalidate];
      id v7 = self->_tcpServer;
      self->_tcpServer = 0;
    }
    else
    {
      [(RPCompanionLinkDaemon *)self _localDeviceUpdate];
    }
  }
}

- (void)_serverTCPEnsureStopped
{
  if (self->_tcpServer)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = self->_tcpServerConnections;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) invalidate:v9];
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [(NSMutableSet *)self->_tcpServerConnections removeAllObjects];
    [(CUTCPServer *)self->_tcpServer invalidate];
    tcpServer = self->_tcpServer;
    self->_tcpServer = 0;
  }
}

- (id)_serverTCPHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)RPConnection);
  [v5 setDispatchQueue:self->_dispatchQueue];
  [v5 setHomeKitManager:self->_homeKitManager];
  uint64_t v6 = +[RPCloudDaemon sharedCloudDaemon];
  [v5 setCloudDaemon:v6];

  id v7 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v5 setIdentityDaemon:v7];

  id v8 = objc_alloc((Class)NSString);
  uint64_t v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  id v10 = [v8 initWithFormat:@"%@Cnx-%u", @"CLink", v9];
  [v5 setLabel:v10];

  [v5 setLocalDeviceInfo:self->_localDeviceInfo];
  [v5 setTcpConnection:v4];
  long long v11 = [v5 label];
  [v4 setLabel:v11];

  [(RPCompanionLinkDaemon *)self _connectionConfigureCommon:v5];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100026A7C;
  v23[3] = &unk_1001219D0;
  v23[4] = v5;
  v23[5] = self;
  [v5 setInvalidationHandler:v23];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100026AC8;
  v22[3] = &unk_1001219D0;
  v22[4] = v5;
  v22[5] = self;
  [v5 setPeerUpdatedHandler:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100026B5C;
  v21[3] = &unk_1001219F8;
  v21[4] = v5;
  v21[5] = self;
  [v5 setReceivedEventHandler:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100026BF4;
  v20[3] = &unk_100121A20;
  v20[4] = v5;
  v20[5] = self;
  [v5 setReceivedRequestHandler:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100026CA0;
  v19[3] = &unk_100121A48;
  v19[4] = v5;
  v19[5] = self;
  [v5 setStateChangedHandler:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100026CF4;
  v18[3] = &unk_1001219D0;
  v18[4] = v5;
  void v18[5] = self;
  [v5 setHomeKitUserIdentifierHandler:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100026D8C;
  v17[3] = &unk_1001219D0;
  v17[4] = self;
  v17[5] = v5;
  [v5 setProxyDeviceUpdateHandler:v17];
  [(RPCompanionLinkDaemon *)self _configureConnectionForPairing:v5];
  tcpServerConnections = self->_tcpServerConnections;
  if (!tcpServerConnections)
  {
    uint64_t v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uint64_t v14 = self->_tcpServerConnections;
    self->_tcpServerConnections = v13;

    tcpServerConnections = self->_tcpServerConnections;
  }
  [(NSMutableSet *)tcpServerConnections addObject:v5];
  [v5 activate];
  [(RPCompanionLinkDaemon *)self _updateAssertions];
  id v15 = v5;

  return v15;
}

- (void)_configureConnectionForPairing:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100026E6C;
  v4[3] = &unk_100121C50;
  id v5 = a3;
  id v3 = v5;
  [v3 setConfigurePairingHandler:v4];
}

- (void)_serverTCPHandleConnectionEnded:(id)a3
{
  id v4 = a3;
  if (([v4 controlFlags] & 0x200) != 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_xpcConnections;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v6) {
      goto LABEL_14;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 netCnx:v15];
        if ((id)v11 == v4)
        {
        }
        else
        {
          long long v12 = (void *)v11;
          uint64_t v13 = [v10 session];
          id v14 = [v13 cnx];

          if (v14 != v4) {
            continue;
          }
        }
        [v10 updateErrorFlags:512];
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v7)
      {
LABEL_14:

        break;
      }
    }
  }
  -[NSMutableSet removeObject:](self->_tcpServerConnections, "removeObject:", v4, (void)v15);
  [(RPCompanionLinkDaemon *)self _connectionStateChanged:0 cnx:v4];
  [(RPCompanionLinkDaemon *)self _updateAssertions];
}

- (void)_serverTCPRemoveConnectionsWithIdentifier:(id)a3 exceptConnection:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (([v6 clientMode] & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [(NSMutableSet *)self->_tcpServerConnections copy];
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          if (v12 != v6)
          {
            uint64_t v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) peerDeviceInfo];
            id v14 = [v6 peerDeviceInfo];
            unsigned int v15 = [v13 isEqualToDeviceBasic:v14];

            if (v15)
            {
              if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
              {
                long long v16 = [v12 label];
                long long v18 = [v6 label];
                id v19 = v20;
                long long v17 = v16;
                LogPrintF();
              }
              [v12 setInvalidationHandled:1, v17, v18, v19];
              [(RPCompanionLinkDaemon *)self _serverTCPHandleConnectionEnded:v12];
              [v12 invalidate];
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)_serverTCPHasActiveConnections
{
  if (!self->_prefServerBonjourOpportunitistic) {
    return [(NSMutableSet *)self->_tcpServerConnections count] != 0;
  }

  return [(RPCompanionLinkDaemon *)self _haveActiveServerConnectionsOnAWDL];
}

- (void)_bleServerEnsureStarted
{
  if (!self->_bleServer)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUBLEServer *)objc_alloc_init((Class)CUBLEServer);
    bleServer = self->_bleServer;
    self->_bleServer = v3;

    [(CUBLEServer *)self->_bleServer setDispatchQueue:self->_dispatchQueue];
    [(CUBLEServer *)self->_bleServer setLabel:@"CLink"];
    [(CUBLEServer *)self->_bleServer setListenPSM:129];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027624;
    v7[3] = &unk_100121C78;
    void v7[4] = self;
    [(CUBLEServer *)self->_bleServer setConnectionStartedHandler:v7];
    id v5 = self->_bleServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100027630;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(CUBLEServer *)v5 activateWithCompletion:v6];
  }
}

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer && dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = self->_bleServerConnections;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) invalidate:v9];
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_bleServerConnections removeAllObjects];
  [(CUBLEServer *)self->_bleServer invalidate];
  bleServer = self->_bleServer;
  self->_bleServer = 0;
}

- (void)_bleServerHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)RPConnection);
  [v5 setBleConnection:v4];

  [v5 setControlFlags:512];
  [v5 setDispatchQueue:self->_dispatchQueue];
  uint64_t v6 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v5 setIdentityDaemon:v6];

  id v7 = objc_alloc((Class)NSString);
  uint64_t v8 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v8;
  id v9 = [v7 initWithFormat:@"%@Cnx-%u", @"CLink", v8];
  [v5 setLabel:v9];

  [v5 setLocalDeviceInfo:self->_localDeviceInfo];
  [(RPCompanionLinkDaemon *)self _connectionConfigureCommon:v5];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100027BB4;
  v18[3] = &unk_1001219D0;
  v18[4] = v5;
  void v18[5] = self;
  [v5 setInvalidationHandler:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100027C00;
  v17[3] = &unk_1001219F8;
  v17[4] = v5;
  v17[5] = self;
  [v5 setReceivedEventHandler:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100027C98;
  v16[3] = &unk_100121A20;
  v16[4] = v5;
  void v16[5] = self;
  [v5 setReceivedRequestHandler:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027D44;
  v15[3] = &unk_100121A48;
  v15[4] = v5;
  v15[5] = self;
  [v5 setStateChangedHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100027D98;
  v14[3] = &unk_1001219D0;
  v14[4] = v5;
  void v14[5] = self;
  [v5 setHomeKitUserIdentifierHandler:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100027E30;
  v13[3] = &unk_1001219D0;
  v13[4] = self;
  void v13[5] = v5;
  [v5 setProxyDeviceUpdateHandler:v13];
  bleServerConnections = self->_bleServerConnections;
  if (!bleServerConnections)
  {
    long long v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    long long v12 = self->_bleServerConnections;
    self->_bleServerConnections = v11;

    bleServerConnections = self->_bleServerConnections;
  }
  [(NSMutableSet *)bleServerConnections addObject:v5];
  [v5 activate];
  [(RPCompanionLinkDaemon *)self _updateAssertions];
}

- (void)_bleServerHandleConnectionEnded:(id)a3
{
  bleServerConnections = self->_bleServerConnections;
  id v5 = a3;
  [(NSMutableSet *)bleServerConnections removeObject:v5];
  [(RPCompanionLinkDaemon *)self _connectionStateChanged:0 cnx:v5];

  [(RPCompanionLinkDaemon *)self _updateAssertions];
}

- (void)_btPipeSetup:(id)a3 withPriority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    if (v4 > 3) {
      id v7 = "?";
    }
    else {
      id v7 = off_1001224B8[(int)v4];
    }
    long long v10 = v7;
    LogPrintF();
  }
  [v6 setDispatchQueue:self->_dispatchQueue v10];
  [v6 setLabel:@"CLink"];
  [v6 setPriority:v4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028088;
  v13[3] = &unk_1001219D0;
  id v8 = v6;
  id v14 = v8;
  unsigned int v15 = self;
  [v8 setStateChangedHandler:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002809C;
  v11[3] = &unk_100121908;
  id v12 = v8;
  id v9 = v8;
  [v9 activateWithCompletion:v11];
}

- (void)_btPipeEnsureStarted
{
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    if (!self->_btPipe)
    {
      id v3 = (CUBluetoothScalablePipe *)objc_alloc_init((Class)CUBluetoothScalablePipe);
      btPipe = self->_btPipe;
      self->_btPipe = v3;

      [(CUBluetoothScalablePipe *)self->_btPipe setIdentifier:@"CLink"];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100028490;
      v13[3] = &unk_100121158;
      void v13[4] = self;
      [(CUBluetoothScalablePipe *)self->_btPipe setPeerHostStateChangedHandler:v13];
      [(RPCompanionLinkDaemon *)self _btPipeSetup:self->_btPipe withPriority:2];
    }
    if (!self->_btPipeHighPriority)
    {
      id v5 = (CUBluetoothScalablePipe *)objc_alloc_init((Class)CUBluetoothScalablePipe);
      btPipeHighPriority = self->_btPipeHighPriority;
      self->_btPipeHighPriority = v5;

      [(CUBluetoothScalablePipe *)self->_btPipeHighPriority setIdentifier:@"CLinkHP"];
      [(RPCompanionLinkDaemon *)self _btPipeSetup:self->_btPipeHighPriority withPriority:3];
    }
    if (GestaltGetDeviceClass() == 1)
    {
      id v7 = +[RPCloudDaemon sharedCloudDaemon];
      if ([v7 idsHasWatch])
      {
        int v8 = _os_feature_enabled_impl();

        if (!v8) {
          return;
        }
        CFStringRef v14 = @"statusFlags";
        unsigned int v15 = &off_10012B048;
        id v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        id v9 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:@"_ctxtColl"];

        if (!v9)
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_100028550;
          v12[3] = &unk_100121CA0;
          void v12[4] = self;
          [(RPCompanionLinkDaemon *)self registerRequestID:@"_ctxtColl" options:v7 handler:v12];
        }
        long long v10 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:@"_ctxtCollProxy"];

        if (!v10)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10002855C;
          v11[3] = &unk_100121CA0;
          void v11[4] = self;
          [(RPCompanionLinkDaemon *)self registerRequestID:@"_ctxtCollProxy" options:v7 handler:v11];
        }
      }
    }
  }
  else if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_btPipeTearDown:(id)a3
{
  id v9 = a3;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v4 = [v9 priority];
    if (v4 > 3) {
      id v5 = "?";
    }
    else {
      id v5 = off_1001224B8[v4];
    }
    int v8 = v5;
    LogPrintF();
  }
  btPipeConnection = self->_btPipeConnection;
  if (btPipeConnection)
  {
    [(RPConnection *)btPipeConnection invalidate];
    id v7 = self->_btPipeConnection;
    self->_btPipeConnection = 0;
  }
  [v9 invalidate:v8];
}

- (void)_btPipeEnsureStopped
{
  if (self->_btPipe)
  {
    -[RPCompanionLinkDaemon _btPipeTearDown:](self, "_btPipeTearDown:");
    btPipe = self->_btPipe;
    self->_btPipe = 0;
  }
  if (self->_btPipeHighPriority)
  {
    -[RPCompanionLinkDaemon _btPipeTearDown:](self, "_btPipeTearDown:");
    btPipeHighPriority = self->_btPipeHighPriority;
    self->_btPipeHighPriority = 0;
  }
}

- (void)_btPipeHandleStateChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 state];
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    [v4 priority];
    LogPrintF();
  }
  btPipeConnection = self->_btPipeConnection;
  if (v5 == 1)
  {
    if (!btPipeConnection
      && [(CUBluetoothScalablePipe *)self->_btPipe state] == 1
      && [(CUBluetoothScalablePipe *)self->_btPipeHighPriority state] == 1)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100028860;
      block[3] = &unk_100121158;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  else if (btPipeConnection {
         && [(CUBluetoothScalablePipe *)self->_btPipe state] == 2
  }
         && [(CUBluetoothScalablePipe *)self->_btPipeHighPriority state] == 2)
  {
    [(RPConnection *)self->_btPipeConnection invalidate];
    int v8 = self->_btPipeConnection;
    self->_btPipeConnection = 0;
  }
}

- (void)_btPipeConnectionStart
{
  id v3 = objc_alloc_init((Class)RPConnection);
  [v3 setBtPipe:self->_btPipe];
  [v3 setBtPipeHighPriority:self->_btPipeHighPriority];
  [v3 setControlFlags:64];
  [v3 setDispatchQueue:self->_dispatchQueue];
  id v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v3 setIdentityDaemon:v4];

  id v5 = objc_alloc((Class)NSString);
  uint64_t v6 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v6;
  id v7 = [v5 initWithFormat:@"%@Cnx-%u", @"CLink", v6];
  [v3 setLabel:v7];

  [v3 setLocalDeviceInfo:self->_localDeviceInfo];
  [v3 setPasswordType:3];
  if (GestaltGetDeviceClass() == 6) {
    CFStringRef v8 = @"BTPipe-Phone";
  }
  else {
    CFStringRef v8 = @"BTPipe-Watch";
  }
  [v3 setPeerIdentifier:v8];
  [v3 setPresent:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100028C1C;
  v20[3] = &unk_1001219D0;
  v20[4] = self;
  v20[5] = v3;
  [v3 setInvalidationHandler:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100028C28;
  v19[3] = &unk_100121908;
  v19[4] = self;
  [v3 setPairVerifyCompletion:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100028C88;
  v18[3] = &unk_1001219D0;
  v18[4] = v3;
  void v18[5] = self;
  [v3 setPeerUpdatedHandler:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100028CEC;
  v17[3] = &unk_1001219F8;
  v17[4] = self;
  v17[5] = v3;
  [v3 setReceivedEventHandler:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100028D08;
  v16[3] = &unk_100121A20;
  v16[4] = self;
  void v16[5] = v3;
  [v3 setReceivedRequestHandler:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100028D28;
  v15[3] = &unk_100121A48;
  v15[4] = self;
  v15[5] = v3;
  [v3 setStateChangedHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100028D38;
  v14[3] = &unk_1001219D0;
  v14[4] = v3;
  void v14[5] = self;
  [v3 setHomeKitUserIdentifierHandler:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028DD0;
  v13[3] = &unk_1001219D0;
  void v13[4] = self;
  void v13[5] = v3;
  [v3 setProxyDeviceUpdateHandler:v13];
  btPipeConnection = self->_btPipeConnection;
  if (btPipeConnection)
  {
    [(RPConnection *)btPipeConnection invalidate];
    long long v10 = self->_btPipeConnection;
    self->_btPipeConnection = 0;
  }
  long long v11 = self->_btPipeConnection;
  self->_btPipeConnection = (RPConnection *)v3;
  id v12 = v3;

  [v12 activate];
  [(RPCompanionLinkDaemon *)self _updateAssertions];
}

- (void)_btPipeConnectionEnded:(id)a3
{
  [(RPCompanionLinkDaemon *)self _connectionStateChanged:0 cnx:a3];
  btPipeConnection = self->_btPipeConnection;
  self->_btPipeConnection = 0;

  [(RPCompanionLinkDaemon *)self _updateAssertions];
}

- (void)_btPipeSyncKeysIfNeeded
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = [(CUBluetoothScalablePipe *)self->_btPipe peerIdentifier];
  id v4 = (void *)v3;
  if (v3)
  {
    long long v11 = (void *)v3;
    id v5 = +[RPCloudDaemon sharedCloudDaemon];
    uint64_t v6 = [v5 idsDeviceForBluetoothUUID:v11];

    if (v6)
    {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      CFStringRef v8 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v8 addSelfIdentityInfoToMessage:v7 flags:0];

      id v9 = +[RPCloudDaemon sharedCloudDaemon];
      [v9 sendIDSMessage:v7 cloudServiceID:@"com.apple.private.alloy.nearby" frameType:48 destinationDevice:v6 sendFlags:1 msgCtx:0 error:0];
    }
    else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_18;
  }
  if (dword_100140E48 <= 90)
  {
    long long v11 = 0;
    if (dword_100140E48 != -1 || (int v10 = _LogCategory_Initialize(), v4 = 0, v10))
    {
      LogPrintF();
LABEL_18:
      id v4 = v11;
    }
  }
}

- (void)_activeDeviceAdded:(id)a3 cnx:(id)a4
{
  id v19 = a3;
  uint64_t v6 = (RPConnection *)a4;
  [v19 setLinkType:-[RPConnection linkType](v6, "linkType")];
  id v7 = [(RPConnection *)v6 btPipe];

  unint64_t v8 = (unint64_t)[v19 statusFlags];
  uint64_t v9 = 4;
  if (v7) {
    uint64_t v9 = 1;
  }
  [v19 setStatusFlags:v8 | v9];
  if (!self->_prefCommunal) {
    goto LABEL_20;
  }
  int v10 = [v19 idsDeviceIdentifier];
  long long v11 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsPersonalDeviceIdentifier];
  id v12 = v10;
  id v13 = v11;
  CFStringRef v14 = v13;
  if (v12 == v13)
  {
  }
  else
  {
    if ((v12 == 0) == (v13 != 0))
    {

      goto LABEL_11;
    }
    unsigned int v15 = [v12 isEqual:v13];

    if (!v15)
    {
LABEL_11:
      unint64_t v16 = ~(unint64_t)[v19 statusFlags] & 0x10000080000;

      if (v16) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
  }

LABEL_12:
  if ([v19 isPersonal])
  {
    personalCnx = self->_personalCnx;
    [v19 setPersonal:1];
    [v19 setStatusFlags:((unint64_t)[v19 statusFlags] | 0x80)];
    objc_storeStrong((id *)&self->_personalCnx, a4);
    if (personalCnx == v6) {
      goto LABEL_20;
    }
  }
  else
  {
    [v19 setPersonal:1];
    [v19 setStatusFlags:((unint64_t)[v19 statusFlags] | 0x80)];
    objc_storeStrong((id *)&self->_personalCnx, a4);
  }
  if (dword_100140E48 > 30) {
    goto LABEL_24;
  }
  if (dword_100140E48 != -1 || _LogCategory_Initialize())
  {
    long long v18 = v19;
    LogPrintF();
  }
LABEL_20:
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    long long v18 = CUDescriptionWithLevel();
    LogPrintF();
  }
LABEL_24:
  -[RPCompanionLinkDaemon _stereoDeviceUpdate:](self, "_stereoDeviceUpdate:", 0, v18);
  [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCLink];
  notify_post("com.apple.rapport.CompanionLinkDeviceAdded");
  [(RPCompanionLinkDaemon *)self _clientReportFoundDevice:v19];
}

- (void)_activeDeviceRemoved:(id)a3 cnx:(id)a4
{
  id v6 = a3;
  id v7 = (RPConnection *)a4;
  [(RPCompanionLinkDaemon *)self _sessionHandlePeerDisconnect:v7];
  [v6 setLinkType:0];
  unint64_t v8 = [(RPConnection *)v7 btPipe];

  unint64_t v9 = (unint64_t)[v6 statusFlags];
  uint64_t v10 = -2;
  if (!v8) {
    uint64_t v10 = -5;
  }
  [v6 setStatusFlags:v9 & v10];
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v15 = CUDescriptionWithLevel();
    LogPrintF();
  }
  if (self->_personalCnx == v7)
  {
    self->_personalCnx = 0;

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [(RPCompanionLinkDaemon *)self _personalDeviceUpdate];
    }
    else
    {
      [(RPCompanionLinkDaemon *)self _personalDeviceUpdate];
    }
  }
  -[RPCompanionLinkDaemon _stereoDeviceUpdate:](self, "_stereoDeviceUpdate:", 0, v15);
  [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCLink];
  notify_post("com.apple.rapport.CompanionLinkDeviceRemoved");
  [(RPCompanionLinkDaemon *)self _clientReportLostDevice:v6];
  long long v11 = [(RPConnection *)v7 peerDeviceInfo];
  id v12 = [v11 idsDeviceIdentifier];

  tcpClientConnections = self->_tcpClientConnections;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002956C;
  v16[3] = &unk_100121CC8;
  long long v17 = v7;
  long long v18 = v12;
  CFStringRef v14 = v7;
  [(NSMutableDictionary *)tcpClientConnections enumerateKeysAndObjectsUsingBlock:v16];
}

- (void)_activeDeviceChangedForConnection:(id)a3 bonjourDevice:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [v24 peerDeviceInfo];
  if (v7)
  {
    unint64_t v8 = [v6 deviceInfo];
    unint64_t v9 = [v8 objectForKeyedSubscript:@"removedServices"];

    if (v9) {
      [v24 sendReachabilityProbe:"Bonjour partial remove"];
    }
    id v10 = [v7 updateWithBonjourDevice:v6];
    if (v10)
    {
      id v11 = v10;
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v12 = [v24 label];
        id v13 = (void *)v12;
        if (v12) {
          CFStringRef v14 = (const __CFString *)v12;
        }
        else {
          CFStringRef v14 = &stru_100125378;
        }
        unsigned int v15 = [v24 peerIdentifier];
        id v16 = v6;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v17 = [v16 shortDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v16 descriptionWithLevel:50];
          }
          else {
          uint64_t v17 = [v16 description];
          }
        }
        long long v18 = (void *)v17;

        id v22 = v11;
        long long v23 = &unk_100119874;
        id v20 = v15;
        long long v21 = v18;
        CFStringRef v19 = v14;
        LogPrintF();
      }
      -[RPCompanionLinkDaemon _activeDeviceChanged:changes:](self, "_activeDeviceChanged:changes:", v7, v11, v19, v20, v21, v22, v23);
    }
  }
}

- (void)_activeDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(RPCompanionLinkDaemon *)self _reportXPCMatchingDiscoveryCLink];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_xpcConnections;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) reportChangedDevice:v6 changes:v4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (int)_airPlayLeaderStateUncached
{
  uint64_t v3 = [(CUHomeKitManager *)self->_homeKitManager selfAccessory];
  uint64_t v4 = [v3 uniqueIdentifier];
  id v5 = [v4 UUIDString];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(CUHomeKitManager *)self->_homeKitManager selfAccessoryMediaSystem];
  id v7 = [v6 components];

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) mediaProfile];
        long long v14 = [v13 accessory];
        long long v15 = [v14 uniqueIdentifier];
        id v16 = [v15 UUIDString];

        if (v16
          && (!v10 || ((unint64_t)[v16 caseInsensitiveCompare:v10] & 0x8000000000000000) != 0))
        {
          id v17 = v16;

          uint64_t v10 = v17;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  if ([v10 isEqual:v5]) {
    int v18 = 6;
  }
  else {
    int v18 = 5;
  }

  return v18;
}

- (void)_connectionConfigureCommon:(id)a3
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = self->_activeServers;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v11 = [v10 passwordType];
        if (v11 > 4 || ((1 << (char)v11) & 0x19) == 0)
        {
          id v13 = v11;
          long long v14 = [v10 allowedMACAddresses];
          [v4 setAllowedMACAddresses:v14];

          long long v15 = [v10 pairSetupACL];
          [v4 setPairSetupACL:v15];

          id v16 = [v10 password];
          [v4 setPassword:v16];

          [v4 setPasswordType:v13];
          unsigned __int8 v17 = [v10 internalAuthFlags];
          if (v17)
          {
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_100029EC0;
            v29[3] = &unk_100121CF0;
            v29[4] = v10;
            [v4 setShowPasswordHandler:v29];
          }
          if ((v17 & 2) != 0)
          {
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_100029F38;
            v28[3] = &unk_100121D18;
            v28[4] = v10;
            [v4 setHidePasswordHandler:v28];
          }
          goto LABEL_17;
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v18 = self->_xpcConnections;
  id v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) client:v24];
        [v4 setFlags:[v4 flags] | (unsigned __int16)[v23 flags] & 0x4000];
      }
      id v20 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v20);
  }
}

- (unsigned)_controlFlagsToNearbyActionType:(unint64_t)a3
{
  if ((a3 & 0x10000000000) != 0) {
    return 38;
  }
  else {
    return 0;
  }
}

- (id)_findExistingActiveDevice:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSMutableDictionary *)self->_activeDevices allValues];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isEqualToDeviceBasic:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_connectionStateChanged:(int)a3 cnx:(id)a4
{
  id v17 = a4;
  [(RPCompanionLinkDaemon *)self _update];
  if (a3 != 1) {
    [(RPCompanionLinkDaemon *)self _interestRemoveForCnx:v17];
  }
  if (([v17 flags] & 1) == 0
    && ([v17 controlFlags] & 0x200) == 0)
  {
    id v6 = [v17 peerDeviceInfo];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 idsDeviceIdentifier];
      if (v8 || ([v7 identifier], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v9 = [(RPCompanionLinkDaemon *)self _findExistingActiveDevice:v7];
        uint64_t v10 = v9;
        if (a3 == 1)
        {
          if (v9)
          {
            if ([v17 clientMode])
            {
              long long v11 = v10;
            }
            else
            {
              if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
              {
                long long v15 = v8;
                id v16 = v17;
                LogPrintF();
              }
              -[RPCompanionLinkDaemon _serverTCPRemoveConnectionsWithIdentifier:exceptConnection:](self, "_serverTCPRemoveConnectionsWithIdentifier:exceptConnection:", v8, v17, v15, v16);
              long long v11 = [(NSMutableDictionary *)self->_activeDevices objectForKeyedSubscript:v8];

              if (v11 && dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
              {
                long long v15 = v11;
                LogPrintF();
              }
            }
          }
          else
          {
            long long v11 = 0;
          }
          activeDevices = self->_activeDevices;
          if (!activeDevices)
          {
            long long v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            long long v14 = self->_activeDevices;
            self->_activeDevices = v13;

            activeDevices = self->_activeDevices;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](activeDevices, "setObject:forKeyedSubscript:", v7, v8, v15);
          if (!v11) {
            [(RPCompanionLinkDaemon *)self _activeDeviceAdded:v7 cnx:v17];
          }
        }
        else if (v9)
        {
          if ([v9 isEqualToDeviceBasic:v7])
          {
            [(NSMutableDictionary *)self->_activeDevices setObject:0 forKeyedSubscript:v8];
            [(RPCompanionLinkDaemon *)self _activeDeviceRemoved:v10 cnx:v17];
          }
          else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          long long v11 = v10;
        }
        else
        {
          long long v11 = 0;
        }

        goto LABEL_46;
      }
      if (dword_100140E48 > 90 || dword_100140E48 == -1 && !_LogCategory_Initialize())
      {
LABEL_46:

        goto LABEL_47;
      }
    }
    else if (dword_100140E48 > 90 || dword_100140E48 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_46;
    }
    LogPrintF();
    goto LABEL_46;
  }
LABEL_47:
}

- (BOOL)_destinationID:(id)a3 matchesCnx:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (RPConnection *)a4;
  uint64_t v8 = [(RPConnection *)v7 peerIdentifier];
  unsigned __int8 v9 = [v8 isEqual:v6];

  if ((v9 & 1) == 0)
  {
    long long v11 = [(RPConnection *)v7 peerDeviceInfo];
    long long v12 = [v11 identifier];
    unsigned __int8 v13 = [v12 isEqual:v6];

    if (v13) {
      goto LABEL_6;
    }
    long long v14 = [v11 idsDeviceIdentifier];
    unsigned __int8 v15 = [v14 isEqual:v6];

    if ((v15 & 1) != 0
      || ([v11 publicIdentifier],
          id v16 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v17 = [v16 isEqual:v6],
          v16,
          (v17 & 1) != 0))
    {
LABEL_6:
      char v10 = 1;
LABEL_7:

      goto LABEL_8;
    }
    if (([(RPConnection *)v7 controlFlags] & 0x200) == 0)
    {
      uint64_t v19 = [(NSDictionary *)self->_destinationIdentifierModelMap objectForKeyedSubscript:v6];
      if (v19)
      {
        id v20 = (uint64_t (**)(void, void))v19;
        uint64_t v21 = [(RPConnection *)v7 peerDeviceInfo];
        long long v22 = [v21 model];
        unsigned __int8 v23 = ((uint64_t (**)(void, void *))v20)[2](v20, v22);
LABEL_12:
        char v10 = v23;

LABEL_15:
        goto LABEL_7;
      }
      uint64_t v24 = [(NSDictionary *)self->_destinationIdentifierRelMap objectForKeyedSubscript:v6];
      if (v24)
      {
        id v20 = (uint64_t (**)(void, void))v24;
        uint64_t v21 = [(RPConnection *)v7 peerDeviceInfo];
        char v10 = ((uint64_t (**)(void, id))v20)[2](v20, [v21 statusFlags]);
        goto LABEL_15;
      }
      if (([v6 isEqual:@"rapport:rdid:ActivePhone"] & 1) != 0
        || ([v6 isEqual:@"rapport:rdid:ActiveWatch"] & 1) != 0
        || [v6 isEqual:@"rapport:rdid:PairedCompanion"])
      {
        btPipeConnection = self->_btPipeConnection;
LABEL_20:
        char v10 = btPipeConnection == v7;
        goto LABEL_7;
      }
      if ([(RPCompanionLinkDaemon *)self _destinationID:v6 matchesProxyDeviceOnCnx:v7])
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          long long v26 = [(RPConnection *)v7 peerIdentifier];
          id v27 = v6;
          LogPrintF();
        }
        goto LABEL_35;
      }
      if ([v6 isEqual:@"rapport:rdid:PersonalCompanion"])
      {
        btPipeConnection = self->_personalCnx;
        goto LABEL_20;
      }
      if ([v6 isEqual:@"rapport:rdid:StereoCounterpart"])
      {
        btPipeConnection = self->_stereoCnx;
        goto LABEL_20;
      }
      if ([v6 isEqual:@"rapport:rdid:SameHome"])
      {
LABEL_35:
        char v10 = ((unint64_t)[(RPConnection *)v7 statusFlags] & 0x10000AE000) != 0;
        goto LABEL_7;
      }
      if ([v6 isEqual:@"rapport:rdid:SameRoom"]
        && ((unint64_t)[(RPConnection *)v7 statusFlags] & 0x10000AE000) != 0)
      {
        id v20 = [(RPCompanionLinkDevice *)self->_localDeviceInfo roomName];
        uint64_t v21 = [(RPConnection *)v7 peerDeviceInfo];
        long long v22 = [v21 roomName];
        unsigned __int8 v23 = [v20 isEqual:v22];
        goto LABEL_12;
      }
    }
    char v10 = 0;
    goto LABEL_7;
  }
  char v10 = 1;
LABEL_8:

  return v10;
}

- (void)_disconnectRemovedSharedHomeDevices
{
  uint64_t v3 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v4 = [v3 identitiesOfType:9 error:0];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002A888;
  v5[3] = &unk_100121D40;
  v5[4] = v4;
  [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:v5];
}

- (void)_disconnectUnauthConnections
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableSet *)self->_tcpServerConnections copy];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 flags])
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            [v7 invalidate:v7];
          }
          else
          {
            [v7 invalidate:v8];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_disconnectUnpairedDevices
{
  id v3 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v4 = [v3 identitiesOfType:8 error:0];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002AC78;
  v5[3] = &unk_100121D40;
  v5[4] = v4;
  [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:v5];
}

- (id)_discoveryNonceOrRotate:(BOOL)a3
{
  if (a3 || (id v4 = self->_discoveryNonceData) == 0)
  {
    NSRandomData();
    id v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_discoveryNonceData, v4);
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }

  return v4;
}

- (void)_duetSyncEnsureStarted
{
  if (!self->_duetSyncClient)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFClient *)objc_alloc_init(off_100140EC8());
    duetSyncClient = self->_duetSyncClient;
    self->_duetSyncClient = v3;

    [(SFClient *)self->_duetSyncClient setDispatchQueue:self->_dispatchQueue];
    uint64_t v5 = self->_duetSyncClient;
    [(SFClient *)v5 activateAssertionWithIdentifier:@"com.apple.sharing.DuetSync"];
  }
}

- (void)_duetSyncEnsureStopped
{
  if (self->_duetSyncClient)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFClient *)self->_duetSyncClient invalidate];
    duetSyncClient = self->_duetSyncClient;
    self->_duetSyncClient = 0;
  }
}

- (id)findAuthAWDLPairingModeDeviceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices allKeys];
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices objectForKeyedSubscript:v13];
          unsigned __int8 v15 = [v14 publicIdentifier];
          unsigned __int8 v16 = [v15 isEqual:v4];

          if (v16)
          {
            id v7 = [(NSMutableDictionary *)self->_authenticatedAWDLPairingModeDevices objectForKeyedSubscript:v13];

            goto LABEL_13;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0;
LABEL_13:
    id v6 = 0;
  }

  return v7;
}

- (id)findConnectedDeviceForIdentifier:(id)a3 controlFlags:(unint64_t)a4 cnx:(id *)a5
{
  uint64_t v15 = 0;
  unsigned __int8 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_10000F400;
  long long v19 = sub_10000F410;
  id v20 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002B360;
  v9[3] = &unk_100121D68;
  unint64_t v13 = a4;
  id v10 = self;
  id v6 = a3;
  id v11 = v6;
  long long v12 = &v15;
  long long v14 = a5;
  [(RPCompanionLinkDaemon *)v10 _forEachConnectionWithHandler:v9];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)_findWiFiConnectionByID:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = sub_10000F400;
  long long v14 = sub_10000F410;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B758;
  v7[3] = &unk_100121D90;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)_findMatchingAWDLBonjourDevice:(id)a3
{
  id v4 = a3;
  id v5 = self->_bonjourAWDLDevices;
  id v6 = [v4 idsDeviceIdentifier];
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v6];
    if (v7) {
      goto LABEL_7;
    }
  }

  id v6 = [v4 identifier];
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v6];
    if (v7) {
      goto LABEL_7;
    }
  }

  id v6 = [v4 publicIdentifier];
  if (v6
    && ([(NSMutableDictionary *)v5 objectForKeyedSubscript:v6],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_7:
    id v8 = (void *)v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_findDeviceWithDevice:(id)a3 deviceMap:(id)a4 matchedIdentifier:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 idsDeviceIdentifier];
  if (v9 && ([v8 objectForKeyedSubscript:v9], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)
    || (v9, [v7 identifier], (id v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([v8 objectForKeyedSubscript:v9], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = (void *)v10;
    uint64_t v12 = (void *)v10;
    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_6;
  }

  id v9 = [v7 publicIdentifier];
  if (v9)
  {
    uint64_t v13 = [v8 objectForKeyedSubscript:v9];
    if (v13) {
      uint64_t v12 = (void *)v13;
    }
    else {
      uint64_t v12 = 0;
    }
    if (!v13) {
      goto LABEL_15;
    }
    id v11 = (void *)v13;
    if (!a5) {
      goto LABEL_15;
    }
LABEL_6:
    objc_storeStrong(a5, v9);
    uint64_t v12 = v11;
    goto LABEL_15;
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

- (id)findUnauthDeviceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_10000F400;
  id v15 = sub_10000F410;
  id v16 = [(NSMutableDictionary *)self->_unauthDevices objectForKeyedSubscript:v4];
  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002BB68;
    v8[3] = &unk_100121D90;
    id v9 = v4;
    uint64_t v10 = &v11;
    [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:v8];
    id v6 = (id)v12[5];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_forEachConnectionWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  v41[0] = 0;
  btPipeConnection = self->_btPipeConnection;
  if (!btPipeConnection
    || ((*((void (**)(id, RPConnection *, char *))v4 + 2))(v4, btPipeConnection, v41), !*((unsigned char *)v39 + 24)))
  {
    tcpClientConnections = self->_tcpClientConnections;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002BFAC;
    v35[3] = &unk_100121DB8;
    id v8 = v5;
    id v36 = v8;
    id v37 = &v38;
    [(NSMutableDictionary *)tcpClientConnections enumerateKeysAndObjectsUsingBlock:v35];
    if (!*((unsigned char *)v39 + 24))
    {
      tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10002C008;
      v32[3] = &unk_100121DB8;
      id v10 = v8;
      id v33 = v10;
      long long v34 = &v38;
      [(NSMutableDictionary *)tcpOnDemandClientConnections enumerateKeysAndObjectsUsingBlock:v32];
      if (!*((unsigned char *)v39 + 24))
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v11 = self->_tcpServerConnections;
        id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v28 objects:v43 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v29;
LABEL_7:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v11);
            }
            (*((void (**)(id, void, uint64_t *))v10 + 2))(v10, *(void *)(*((void *)&v28 + 1) + 8 * v14), v39 + 3);
            if (*((unsigned char *)v39 + 24)) {
              break;
            }
            if (v12 == (id)++v14)
            {
              id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v28 objects:v43 count:16];
              if (v12) {
                goto LABEL_7;
              }
              goto LABEL_13;
            }
          }
        }
        else
        {
LABEL_13:

          bleClientConnections = self->_bleClientConnections;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_10002C064;
          v25[3] = &unk_100121DB8;
          id v16 = (NSMutableSet *)v10;
          long long v26 = v16;
          id v27 = &v38;
          [(NSMutableDictionary *)bleClientConnections enumerateKeysAndObjectsUsingBlock:v25];
          if (!*((unsigned char *)v39 + 24))
          {
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            uint64_t v17 = self->_bleServerConnections;
            id v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v21 objects:v42 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v22;
LABEL_16:
              uint64_t v20 = 0;
              while (1)
              {
                if (*(void *)v22 != v19) {
                  objc_enumerationMutation(v17);
                }
                ((void (*)(NSMutableSet *, void, uint64_t *))v16[2].super.super.isa)(v16, *(void *)(*((void *)&v21 + 1) + 8 * v20), v39 + 3);
                if (*((unsigned char *)v39 + 24)) {
                  break;
                }
                if (v18 == (id)++v20)
                {
                  id v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v21 objects:v42 count:16];
                  if (v18) {
                    goto LABEL_16;
                  }
                  break;
                }
              }
            }
          }
          uint64_t v11 = v26;
        }
      }
    }
  }
  _Block_object_dispose(&v38, 8);
}

- (void)_forEachMatchingDestinationID:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C180;
  v7[3] = &unk_100121DE0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(RPCompanionLinkDaemon *)v8 _forEachConnectionWithHandler:v7];
}

- (void)_forEachUniqueMatchingDestinationID:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C2CC;
  v10[3] = &unk_100121E08;
  id v11 = (id)objc_opt_new();
  id v12 = v6;
  id v8 = v6;
  id v9 = v11;
  [(RPCompanionLinkDaemon *)self _forEachMatchingDestinationID:v7 handler:v10];
}

- (id)_getAltDSID
{
  return (id)_CUAltDSIDPrimary(self, a2);
}

- (id)_getAppleID
{
  id v2 = objc_alloc_init((Class)CUAppleIDClient);
  id v3 = [v2 copyMyAppleIDAndReturnError:0];

  return v3;
}

- (BOOL)_haveActiveClientConnectionsOnAWDL
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(NSMutableDictionary *)self->_tcpOnDemandClientConnections allValues];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 state] == 1 && objc_msgSend(v8, "linkType") == 4)
        {
          id v10 = [v8 inUseProcessesToString];
          bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
          self->_bonjourBrowserAWDLProcess = v10;

          BOOL v9 = 1;
          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_haveActiveServerConnectionsOnAWDL
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_tcpServerConnections;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "linkType", (void)v7) == 4)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)_hidEnsureStarted
{
  if (!self->_hidDaemon)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = objc_alloc_init(RPHIDDaemon);
    hidDaemon = self->_hidDaemon;
    self->_hidDaemon = v3;

    [(RPHIDDaemon *)self->_hidDaemon setMessenger:self];
    id v5 = self->_hidDaemon;
    id v8 = 0;
    unsigned __int8 v6 = [(RPHIDDaemon *)v5 activateAndReturnError:&v8];
    id v7 = v8;
    if ((v6 & 1) == 0 && dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_hidEnsureStopped
{
  if (self->_hidDaemon)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPHIDDaemon *)self->_hidDaemon invalidate];
    hidDaemon = self->_hidDaemon;
    self->_hidDaemon = 0;
  }
}

- (void)interestRegisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSMutableDictionary *)self->_interestPeers objectForKeyedSubscript:v9];
  if (!v11)
  {
    if (!self->_interestPeers)
    {
      id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      interestPeers = self->_interestPeers;
      self->_interestPeers = v12;
    }
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->_interestPeers setObject:v11 forKeyedSubscript:v9];
  }
  long long v14 = [v11 objectForKeyedSubscript:v8];
  if (v14)
  {
    id v15 = v14;
    [v14 addObject:v10];
  }
  else
  {
    id v15 = objc_alloc_init((Class)NSMutableSet);
    [v11 setObject:v15 forKeyedSubscript:v8];
    [v15 addObject:v10];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v18 = v9;
      id v19 = v8;
      LogPrintF();
    }
    id v20 = v8;
    CFStringRef v21 = @"_regEvents";
    long long v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1, v18, v19);
    long long v22 = v16;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    [(RPCompanionLinkDaemon *)self sendEventID:@"_interest" event:v17 destinationID:v9 options:0 completion:0];
  }
}

- (void)interestDeregisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSMutableDictionary *)self->_interestPeers objectForKeyedSubscript:v9];
  id v12 = v11;
  if (v11)
  {
    long long v13 = [v11 objectForKeyedSubscript:v8];
    long long v14 = v13;
    if (v13)
    {
      [v13 removeObject:v10];
      if (![v14 count])
      {
        [v12 setObject:0 forKeyedSubscript:v8];
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v17 = v9;
          id v18 = v8;
          LogPrintF();
        }
        id v19 = v8;
        CFStringRef v20 = @"_deregEvents";
        id v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1, v17, v18);
        CFStringRef v21 = v15;
        long long v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

        [(RPCompanionLinkDaemon *)self sendEventID:@"_interest" event:v16 destinationID:v9 options:0 completion:0];
      }
    }
  }
}

- (void)_interestReceived:(id)a3 cnx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 peerDeviceInfo];
  uint64_t v9 = [v8 identifier];
  if (v9)
  {
    id v10 = (void *)v9;

LABEL_4:
    id v35 = v7;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    CFArrayGetTypeID();
    id v36 = v6;
    id v12 = CFDictionaryGetTypedValue();
    id v13 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [(NSMutableDictionary *)self->_interestEvents objectForKeyedSubscript:v17];
            id v19 = (id)v18;
            if (!v18)
            {
              id v19 = objc_alloc_init((Class)NSMutableSet);
              interestEvents = self->_interestEvents;
              if (!interestEvents)
              {
                CFStringRef v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                long long v22 = self->_interestEvents;
                self->_interestEvents = v21;

                interestEvents = self->_interestEvents;
              }
              [(NSMutableDictionary *)interestEvents setObject:v19 forKeyedSubscript:v17];
            }
            [v19 addObject:v10];
            if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v33 = v17;
              id v34 = [v19 count];
              long long v32 = v10;
              LogPrintF();
            }
            if (!v18) {
              [(RPHIDDaemon *)self->_hidDaemon registeredEventID:v17];
            }
            -[RPMediaControlDaemon registeredEventID:](self->_mediaControlDaemon, "registeredEventID:", v17, v32, v33, v34);
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v14);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    CFArrayGetTypeID();
    long long v23 = CFDictionaryGetTypedValue();
    id v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v29 = [(NSMutableDictionary *)self->_interestEvents objectForKeyedSubscript:v28];
            long long v30 = v29;
            if (v29)
            {
              [v29 removeObject:v10];
              id v31 = [v30 count];
              if (!v31) {
                [(NSMutableDictionary *)self->_interestEvents setObject:0 forKeyedSubscript:v28];
              }
              if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              if (!v31)
              {
                [(RPHIDDaemon *)self->_hidDaemon deregisteredEventID:v28];
                [(RPMediaControlDaemon *)self->_mediaControlDaemon deregisteredEventID:v28];
              }
            }
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v25);
    }

    id v7 = v35;
    id v6 = v36;
    goto LABEL_42;
  }
  id v11 = [v7 peerDeviceInfo];
  id v10 = [v11 publicIdentifier];

  if (v10) {
    goto LABEL_4;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_42:
}

- (void)_interestRemoveForCnx:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peerDeviceInfo];
  id v6 = [v5 identifier];

  if (v6)
  {
    id v18 = v4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = [(NSMutableDictionary *)self->_interestEvents allKeys];
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_interestEvents, "objectForKeyedSubscript:", v12, v15, v16, v17);
          [v13 removeObject:v6];
          id v14 = [v13 count];
          if (!v14) {
            [(NSMutableDictionary *)self->_interestEvents setObject:0 forKeyedSubscript:v12];
          }
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v16 = v12;
            id v17 = v14;
            uint64_t v15 = v6;
            LogPrintF();
          }
          if (!v14)
          {
            [(RPHIDDaemon *)self->_hidDaemon deregisteredEventID:v12];
            [(RPMediaControlDaemon *)self->_mediaControlDaemon deregisteredEventID:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    id v4 = v18;
  }
  else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_interestSendEventID:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_interestEvents, "objectForKeyedSubscript:", v6, 0);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(RPCompanionLinkDaemon *)self sendEventID:v6 event:v7 destinationID:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) options:0 completion:0];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_localDeviceUpdate
{
  unsigned __int8 v158 = [(RPCompanionLinkDevice *)self->_localDeviceInfo changed];
  BOOL v3 = sub_10000EACC();
  int DeviceClass = GestaltGetDeviceClass();
  if (!self->_localDeviceInfo)
  {
    uint64_t v11 = (RPCompanionLinkDevice *)objc_alloc_init((Class)RPCompanionLinkDevice);
    localDeviceInfo = self->_localDeviceInfo;
    self->_localDeviceInfo = v11;

    [(RPCompanionLinkDevice *)self->_localDeviceInfo setDaemon:1];
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setFlags:[(RPCompanionLinkDevice *)self->_localDeviceInfo flags] | 0x40];
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setFlags:[(RPCompanionLinkDevice *)self->_localDeviceInfo flags] | 0x80];
    if (DeviceClass == 4)
    {
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setStatusFlags:(unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo statusFlags] | 0x10000];
      BOOL v5 = 0;
      goto LABEL_12;
    }
    if (DeviceClass == 7) {
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setFlags:[(RPCompanionLinkDevice *)self->_localDeviceInfo flags] | 2];
    }
  }
  BOOL v5 = DeviceClass == 7;
  if (!self->_soundBoardUserLeaderKVO && DeviceClass == 7)
  {
    soundBoardPrefs = self->_soundBoardPrefs;
    if (!soundBoardPrefs)
    {
      id v7 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.soundboard"];
      id v8 = self->_soundBoardPrefs;
      self->_soundBoardPrefs = v7;

      soundBoardPrefs = self->_soundBoardPrefs;
    }
    BOOL v5 = 1;
    [(NSUserDefaults *)soundBoardPrefs addObserver:self forKeyPath:@"stereo_leader" options:1 context:0];
    [(NSUserDefaults *)self->_soundBoardPrefs addObserver:self forKeyPath:@"stereo_leader_info" options:1 context:0];
    self->_soundBoardUserLeaderKVO = 1;
    uint64_t Int64 = CFPrefs_GetInt64();
    self->_soundBoardUserLeader = Int64 != 0;
    if (!Int64)
    {
      CFDictionaryGetTypeID();
      id v10 = (void *)CFPrefs_CopyTypedValue();
      self->_soundBoardUserLeader = CFDictionaryGetInt64() != 0;

      BOOL v5 = 1;
    }
  }
LABEL_12:
  long long v13 = [(RPCompanionLinkDevice *)self->_localDeviceInfo deviceColor];

  if (!v13)
  {
    long long v14 = (void *)GestaltCopyAnswer();
    if (v14)
    {
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setDeviceColor:v14];
      unsigned __int8 v158 = 1;
    }
  }
  unsigned int v15 = [(RPCompanionLinkDevice *)self->_localDeviceInfo flags];
  if ((v15 & 0xFFFFF2DF | (32 * ([(CUSystemMonitor *)self->_systemMonitor wifiFlags] & 1)) | (self->_prefHIDEnabled << 10) | (self->_prefMediaControlEnabled << 8) | (self->_prefSiriEnabled << 11)) != v15)
  {
    -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:");
    unsigned __int8 v158 = 1;
  }
  if (!self->_needsPrimaryAppleIDUpdate)
  {
    id v22 = 0;
    id v18 = 0;
    goto LABEL_35;
  }
  long long v16 = [(RPCompanionLinkDaemon *)self _getAltDSID];
  id v17 = [(RPCompanionLinkDevice *)self->_localDeviceInfo accountAltDSID];
  id v18 = v16;
  id v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_27;
  }
  long long v20 = v19;
  if ((v18 == 0) == (v19 != 0))
  {

    goto LABEL_26;
  }
  unsigned __int8 v21 = [v18 isEqual:v19];

  if ((v21 & 1) == 0)
  {
LABEL_26:
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setAccountAltDSID:v18];
    unsigned __int8 v158 = 1;
  }
LABEL_27:
  long long v23 = [(RPCompanionLinkDaemon *)self _getAppleID];
  id v24 = [(RPCompanionLinkDevice *)self->_localDeviceInfo accountID];
  id v22 = v23;
  id v25 = v24;
  if (v22 == v25)
  {
  }
  else
  {
    uint64_t v26 = v25;
    if ((v22 == 0) != (v25 != 0))
    {
      unsigned __int8 v27 = [v22 isEqual:v25];

      if (v27) {
        goto LABEL_34;
      }
    }
    else
    {
    }
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setAccountID:v22];
    unsigned __int8 v158 = 1;
  }
LABEL_34:
  self->_needsPrimaryAppleIDUpdate = 0;
LABEL_35:
  if ([(RPCompanionLinkDaemon *)self _shouldSendActivityLevelOverWiFi])
  {
    if ([(CUSystemMonitor *)self->_systemMonitor screenOn]) {
      uint64_t v28 = 7;
    }
    else {
      uint64_t v28 = 3;
    }
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setActivityLevel:v28];
  }
  if (self->_prefHomeKitEnabled)
  {
    long long v29 = [(RPCompanionLinkDevice *)self->_localDeviceInfo homeKitIdentifier];

    if (v29
      || ([(CUHomeKitManager *)self->_homeKitManager selfAccessory],
          id v31 = objc_claimAutoreleasedReturnValue(),
          [v31 uniqueIdentifier],
          uint64_t v32 = objc_claimAutoreleasedReturnValue(),
          v31,
          (id v153 = (void *)v32) == 0))
    {
      id v153 = 0;
    }
    else
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        v142 = (NSData *)v32;
        LogPrintF();
      }
      -[RPCompanionLinkDevice setHomeKitIdentifier:](self->_localDeviceInfo, "setHomeKitIdentifier:", v32, v142);
      unsigned __int8 v158 = 1;
    }
    uint64_t v33 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v34 = [v33 homeKitIdentity];

    id v35 = [(RPCompanionLinkDevice *)self->_localDeviceInfo accountID];

    if (v35)
    {
      uint64_t v30 = (uint64_t)v22;
    }
    else
    {
      uint64_t v30 = [v34 accountID];

      if (v30)
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          sub_10000EB7C((uint64_t)"HomeKit SelfAccessory accountID: ", v3);
          v142 = (NSData *)v30;
          LogPrintF();
        }
        -[RPCompanionLinkDevice setAccountID:](self->_localDeviceInfo, "setAccountID:", v30, v142);
        unsigned __int8 v158 = 1;
      }
    }
    id v36 = [(RPCompanionLinkDevice *)self->_localDeviceInfo homeKitUserIdentifiers];

    if (v36
      || ([(RPHomeKitManager *)self->_rpHomeKitManager homeKitUserIdentifiers],
          (id v152 = (NSData *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v152 = 0;
    }
    else
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        sub_10000EB7C((uint64_t)"HomeKit SelfAccessory homeKitUserIdentifiers: ", v3);
        v142 = v152;
        LogPrintF();
      }
      -[RPCompanionLinkDevice setHomeKitUserIdentifiers:](self->_localDeviceInfo, "setHomeKitUserIdentifiers:", v152, v142);
      unsigned __int8 v158 = 1;
    }
  }
  else
  {
    id v152 = 0;
    id v153 = 0;
    uint64_t v30 = (uint64_t)v22;
  }
  if (!self->_uniqueIDData)
  {
    memset(v188, 0, sizeof(v188));
    v184.tv_nsec = 0;
    v184.tv_sec = 0;
    if (gethostuuid(v188, &v184))
    {
      NSRandomData();
      long long v37 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v37 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:v188 length:6];
    }
    uniqueIDData = self->_uniqueIDData;
    self->_uniqueIDData = v37;

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v142 = self->_uniqueIDData;
      LogPrintF();
    }
    long long v39 = [(NSData *)self->_uniqueIDData bytes];
    v145 = [(NSData *)self->_uniqueIDData length];
    NSUInteger v146 = [(NSData *)self->_uniqueIDData length];
    v142 = v39;
    NSPrintF();
    long long v40 = (NSString *)objc_claimAutoreleasedReturnValue();
    uniqueIDStr = self->_uniqueIDStr;
    self->_uniqueIDStr = v40;
  }
  id v156 = (void *)v30;
  long long v42 = self->_uniqueIDStr;
  id v151 = v18;
  if (v42)
  {
    long long v43 = [(RPCompanionLinkDevice *)self->_localDeviceInfo identifier];
    long long v44 = v42;
    long long v45 = v43;
    if (v44 == v45)
    {

      goto LABEL_84;
    }
    long long v46 = v45;
    if (v45)
    {
      unsigned __int8 v47 = [(NSString *)v44 isEqual:v45];

      if (v47) {
        goto LABEL_84;
      }
    }
    else
    {
    }
    -[RPCompanionLinkDevice setIdentifier:](self->_localDeviceInfo, "setIdentifier:", self->_uniqueIDStr, v142, v145, v146);
    unsigned __int8 v158 = 1;
  }
LABEL_84:
  long long v48 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsDeviceIdentifier];

  if (!v48)
  {
    id v49 = +[RPCloudDaemon sharedCloudDaemon];
    uint64_t v50 = [v49 idsDeviceIDSelf];

    if (v50)
    {
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setIdsDeviceIdentifier:v50];
      unsigned __int8 v158 = 1;
    }
  }
  id v51 = +[RPCloudDaemon sharedCloudDaemon];
  id v52 = [v51 idsCorrelationIdentifier];

  id v53 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsCorrelationIdentifier];
  id v54 = v52;
  id v55 = v53;
  if (v54 == v55)
  {
  }
  else
  {
    id v56 = v55;
    if ((v54 == 0) == (v55 != 0))
    {

LABEL_95:
      id v155 = v54;
      -[RPCompanionLinkDevice setIdsCorrelationIdentifier:](self->_localDeviceInfo, "setIdsCorrelationIdentifier:");
      unsigned __int8 v158 = 1;
      goto LABEL_96;
    }
    unsigned __int8 v57 = [v54 isEqual:v55];

    if ((v57 & 1) == 0) {
      goto LABEL_95;
    }
  }
  id v155 = 0;
LABEL_96:
  if ((int)[(RPCompanionLinkDevice *)self->_localDeviceInfo listeningPort] > 0
    || (id v58 = [(CUTCPServer *)self->_tcpServer tcpListeningPort], (int)v58 < 1))
  {
    int v150 = 0;
  }
  else
  {
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setListeningPort:v58];
    int v150 = 1;
    unsigned __int8 v158 = 1;
  }
  id v59 = [(RPCompanionLinkDevice *)self->_localDeviceInfo model];

  if (!v59)
  {
    id v60 = (void *)GestaltCopyAnswer();
    if (v60)
    {
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setModel:v60];
      unsigned __int8 v158 = 1;
    }
  }
  if (self->_prefCommunal)
  {
    id v61 = [(CUSystemMonitor *)self->_systemMonitor meDeviceIDSDeviceID];

    id v54 = v61;
  }
  else
  {
    id v61 = 0;
  }

  uint64_t v62 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsPersonalDeviceIdentifier];
  id v63 = v61;
  id v64 = v62;
  id v157 = v63;
  if (v63 == v64)
  {

    goto LABEL_129;
  }
  id v65 = v64;
  if ((v63 == 0) != (v64 != 0))
  {
    unsigned __int8 v66 = [v63 isEqual:v64];

    if (v66) {
      goto LABEL_129;
    }
  }
  else
  {
  }
  if (dword_100140E48 <= 30)
  {
    if (dword_100140E48 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      v143 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsPersonalDeviceIdentifier];
      v145 = (char *)v63;
      LogPrintF();
    }
  }
  -[RPCompanionLinkDevice setIdsPersonalDeviceIdentifier:](self->_localDeviceInfo, "setIdsPersonalDeviceIdentifier:", v63, v143, v145);
  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  v67 = [(NSMutableDictionary *)self->_homeHubDevices allValues];
  id v68 = [v67 countByEnumeratingWithState:&v180 objects:v190 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v181;
    do
    {
      for (i = 0; i != v69; i = (char *)i + 1)
      {
        if (*(void *)v181 != v70) {
          objc_enumerationMutation(v67);
        }
        int v72 = *(void **)(*((void *)&v180 + 1) + 8 * i);
        [v72 setIdsPersonalDeviceIdentifier:v157];
        [v72 setChanged:1];
      }
      id v69 = [v67 countByEnumeratingWithState:&v180 objects:v190 count:16];
    }
    while (v69);
  }

  [(RPCompanionLinkDaemon *)self _personalDeviceUpdate];
  unsigned __int8 v158 = 1;
LABEL_129:
  if (!self->_mediaAccessControlKVO && v5)
  {
    airplayPrefs = self->_airplayPrefs;
    if (!airplayPrefs)
    {
      id v75 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.airplay"];
      id v76 = self->_airplayPrefs;
      self->_airplayPrefs = v75;

      airplayPrefs = self->_airplayPrefs;
    }
    [(NSUserDefaults *)airplayPrefs addObserver:self forKeyPath:@"accessControlLevel" options:1 context:0];
    [(NSUserDefaults *)self->_airplayPrefs addObserver:self forKeyPath:@"p2pAllow" options:1 context:0];
    self->_mediaAccessControlKVO = 1;
  }
  id v77 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaRemoteIdentifier];

  if (!v77) {
    [(RPCompanionLinkDaemon *)self _mediaRemoteIDGet];
  }
  v78 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaRouteIdentifier];

  if (!v78) {
    [(RPCompanionLinkDaemon *)self _mediaRouteIDGet];
  }
  id v79 = self->_localDeviceInfo;
  if (v79)
  {
    [(RPCompanionLinkDevice *)v79 operatingSystemVersion];
    if (v177) {
      goto LABEL_151;
    }
  }
  else
  {
    uint64_t v177 = 0;
    uint64_t v178 = 0;
    uint64_t v179 = 0;
  }
  memset(v188, 0, sizeof(v188));
  uint64_t v189 = 0;
  id v80 = +[RPCloudDaemon sharedCloudDaemon];
  v81 = v80;
  if (v80)
  {
    [v80 operatingSystemVersionForSelf];
  }
  else
  {
    memset(v188, 0, sizeof(v188));
    uint64_t v189 = 0;
  }

  long long v175 = *(_OWORD *)v188;
  uint64_t v176 = v189;
  [(RPCompanionLinkDevice *)self->_localDeviceInfo setOperatingSystemVersion:&v175];
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    long long v173 = *(_OWORD *)v188;
    uint64_t v174 = v189;
    v143 = sub_10000E8DC((uint64_t *)&v173);
    LogPrintF();
  }
LABEL_151:
  int v82 = [(RPCompanionLinkDevice *)self->_localDeviceInfo personalDeviceState];
  if (self->_prefCommunal && [(CUSystemMonitor *)self->_systemMonitor meDeviceValid])
  {
    v83 = [(CUSystemMonitor *)self->_systemMonitor meDeviceFMFDeviceID];
    if ([v83 length]) {
      uint64_t v84 = 6;
    }
    else {
      uint64_t v84 = 5;
    }
  }
  else
  {
    uint64_t v84 = 0;
  }
  if (v84 != v82)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      if (v82 >= 8)
      {
        v85 = "?";
        if (v82 > 9) {
          v85 = "User";
        }
      }
      else
      {
        v85 = off_100122598[v82];
      }
      v144 = v85;
      v145 = off_1001224F0[v84];
      LogPrintF();
    }
    -[RPCompanionLinkDevice setPersonalDeviceState:](self->_localDeviceInfo, "setPersonalDeviceState:", v84, v144, v145);
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v86 = [(NSMutableDictionary *)self->_homeHubDevices allValues];
    id v87 = [v86 countByEnumeratingWithState:&v169 objects:v187 count:16];
    if (v87)
    {
      id v88 = v87;
      uint64_t v89 = *(void *)v170;
      do
      {
        for (j = 0; j != v88; j = (char *)j + 1)
        {
          if (*(void *)v170 != v89) {
            objc_enumerationMutation(v86);
          }
          id v91 = *(void **)(*((void *)&v169 + 1) + 8 * (void)j);
          [v91 setPersonalDeviceState:v84];
          [v91 setChanged:1];
        }
        id v88 = [v86 countByEnumeratingWithState:&v169 objects:v187 count:16];
      }
      while (v88);
    }

    unsigned __int8 v158 = 1;
  }
  unint64_t v92 = (unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo statusFlags];
  if ([(NSMutableSet *)self->_registeredProfileIDs containsObject:@"DuetSync"])
  {
    [(RPCompanionLinkDaemon *)self _duetSyncEnsureStarted];
    uint64_t v93 = 256;
  }
  else
  {
    [(RPCompanionLinkDaemon *)self _duetSyncEnsureStopped];
    uint64_t v93 = 0;
  }
  unint64_t v94 = v93 | v92 & 0xFFFFFEFFFFFFFEFFLL;
  unsigned int v95 = [(CUSystemMonitor *)self->_systemMonitor meDeviceIsMe];
  prefMeDeviceIsMeOverride = self->_prefMeDeviceIsMeOverride;
  if (prefMeDeviceIsMeOverride)
  {
    unsigned int v95 = [(NSNumber *)prefMeDeviceIsMeOverride BOOLValue];
  }
  else if (sub_10000DD3C())
  {
    unsigned int v95 = GestaltGetDeviceClass() == 1;
  }
  uint64_t v97 = 0x10000000000;
  if (!v95) {
    uint64_t v97 = 0;
  }
  long long v98 = (void *)(v94 | v97);
  if (v98 != (void *)v92)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      NSUInteger v146 = (NSUInteger)v98;
      v147 = &unk_1001198B7;
      v144 = (const char *)v92;
      v145 = (char *)&unk_1001198B7;
      LogPrintF();
    }
    -[RPCompanionLinkDevice setStatusFlags:](self->_localDeviceInfo, "setStatusFlags:", v98, v144, v145, v146, v147);
    unsigned __int8 v158 = 1;
  }
  v148 = v98;
  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr)
  {
    long long v100 = [(RPCompanionLinkDevice *)self->_localDeviceInfo publicIdentifier];
    long long v101 = btAdvAddrStr;
    long long v102 = v100;
    if (v101 == v102)
    {
    }
    else
    {
      long long v103 = v102;
      if (v102)
      {
        unsigned __int8 v104 = [(NSString *)v101 isEqual:v102];

        if (v104) {
          goto LABEL_199;
        }
      }
      else
      {
      }
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setPublicIdentifier:self->_btAdvAddrStr];
      unsigned __int8 v158 = 1;
    }
  }
LABEL_199:
  unsigned int v105 = [(RPCompanionLinkDevice *)self->_localDeviceInfo serversChangedState];
  unint64_t v149 = v92;
  if (v105 != 6 && v105)
  {
    v154 = 0;
  }
  else
  {
    id v106 = objc_alloc_init((Class)NSMutableArray);
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v107 = self->_activeServers;
    id v108 = [(NSMutableSet *)v107 countByEnumeratingWithState:&v165 objects:v186 count:16];
    if (v108)
    {
      id v109 = v108;
      uint64_t v110 = *(void *)v166;
      do
      {
        for (k = 0; k != v109; k = (char *)k + 1)
        {
          if (*(void *)v166 != v110) {
            objc_enumerationMutation(v107);
          }
          long long v112 = [*(id *)(*((void *)&v165 + 1) + 8 * (void)k) serviceType];
          if (v112) {
            [v106 addObject:v112];
          }
        }
        id v109 = [(NSMutableSet *)v107 countByEnumeratingWithState:&v165 objects:v186 count:16];
      }
      while (v109);
    }

    xpcMatchingMap = self->_xpcMatchingMap;
    v163[0] = _NSConcreteStackBlock;
    v163[1] = 3221225472;
    v163[2] = sub_10002EA0C;
    v163[3] = &unk_100121E30;
    id v114 = v106;
    id v164 = v114;
    [(NSMutableDictionary *)xpcMatchingMap enumerateKeysAndObjectsUsingBlock:v163];
    v154 = v114;
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setServiceTypes:v114];
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setServersChangedState:5];
  }
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v115 = self;
  long long v116 = self->_xpcConnections;
  id v117 = [(NSMutableSet *)v116 countByEnumeratingWithState:&v159 objects:v185 count:16];
  if (v117)
  {
    id v118 = v117;
    uint64_t v119 = *(void *)v160;
    do
    {
      for (m = 0; m != v118; m = (char *)m + 1)
      {
        if (*(void *)v160 != v119) {
          objc_enumerationMutation(v116);
        }
        v121 = *(void **)(*((void *)&v159 + 1) + 8 * (void)m);
        v122 = [v121 client];

        if (v122)
        {
          v123 = [v121 netCnx];
          v124 = v123;
          if (v123)
          {
            id v125 = v123;
          }
          else
          {
            v126 = [v121 session];
            id v125 = [v126 cnx];
          }
          if (([v125 controlFlags] & 0x200) != 0)
          {
            v127 = [v121 client];
            unsigned __int8 v128 = [v127 usingOnDemandConnection];

            if ((v128 & 1) == 0)
            {
              v129 = [v121 client];
              [v129 setUsingOnDemandConnection:1];

              v130 = [v121 xpcCnx];
              v131 = [v130 remoteObjectProxy];
              v132 = [v121 client];
              [v131 companionLinkUpdateClientState:v132];
            }
          }
          if ((v158 & 1) != 0 || ([v121 localDeviceUpdated] & 1) == 0)
          {
            v133 = [v121 xpcCnx];
            uint64_t v134 = [v133 remoteObjectProxy];
            [v134 companionLinkLocalDeviceUpdated:v115->_localDeviceInfo];

            [v121 setLocalDeviceUpdated:1];
          }
        }
      }
      id v118 = [(NSMutableSet *)v116 countByEnumeratingWithState:&v159 objects:v185 count:16];
    }
    while (v118);
  }

  id v135 = objc_alloc_init((Class)NSMutableDictionary);
  v136 = v135;
  if (v151) {
    [v135 setObject:v151 forKeyedSubscript:@"_accAltDSID"];
  }
  if (v156) {
    [v136 setObject:v156 forKeyedSubscript:@"_accID"];
  }
  if (v153) {
    [v136 setObject:v153 forKeyedSubscript:@"_hkID"];
  }
  if (v152) {
    [v136 setObject:v152 forKeyedSubscript:@"_hkUID"];
  }
  if (v154) {
    [v136 setObject:v154 forKeyedSubscript:@"_stA"];
  }
  if (v150)
  {
    v137 = +[NSNumber numberWithInt:[(RPCompanionLinkDevice *)v115->_localDeviceInfo listeningPort]];
    [v136 setObject:v137 forKeyedSubscript:@"_lP"];
  }
  if (v148 != (void *)v149)
  {
    v138 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)[(RPCompanionLinkDevice *)v115->_localDeviceInfo statusFlags] & 0x10000010100];
    [v136 setObject:v138 forKeyedSubscript:@"_sf"];
  }
  if (v155)
  {
    v139 = [(RPCompanionLinkDevice *)v115->_localDeviceInfo idsCorrelationIdentifier];
    [v136 setObject:v139 forKeyedSubscript:@"_idsCID"];
  }
  v140 = [v136 allKeys];
  id v141 = [v140 count];

  if (v141) {
    [(RPCompanionLinkDaemon *)v115 sendEventID:@"_systemInfoUpdate" event:v136 destinationID:@"rapport:rdid:SameHome" options:0 completion:0];
  }
  [(RPCompanionLinkDevice *)v115->_localDeviceInfo setChanged:0];
}

- (void)_localDeviceCleanup
{
  if (self->_mediaAccessControlKVO)
  {
    self->_mediaAccessControlKVO = 0;
    [(NSUserDefaults *)self->_airplayPrefs removeObserver:self forKeyPath:@"accessControlLevel" context:0];
    [(NSUserDefaults *)self->_airplayPrefs removeObserver:self forKeyPath:@"p2pAllow" context:0];
  }
  airplayPrefs = self->_airplayPrefs;
  self->_airplayPrefs = 0;

  if (self->_soundBoardUserLeaderKVO)
  {
    self->_soundBoardUserLeaderKVO = 0;
    [(NSUserDefaults *)self->_soundBoardPrefs removeObserver:self forKeyPath:@"stereo_leader" context:0];
    [(NSUserDefaults *)self->_soundBoardPrefs removeObserver:self forKeyPath:@"stereo_leader_info" context:0];
  }
  soundBoardPrefs = self->_soundBoardPrefs;
  self->_soundBoardPrefs = 0;
}

- (int)_localMediaAccessControlSetting
{
  uint64_t Int64 = CFPrefs_GetInt64();
  uint64_t v3 = CFPrefs_GetInt64();
  int v4 = v3 == 1;
  BOOL v5 = Int64 == 1;
  if (Int64 == 1) {
    int v4 = 3;
  }
  if (v3 == 1) {
    BOOL v5 = 1;
  }
  if (v5) {
    return v4;
  }
  else {
    return 2;
  }
}

- (void)_mediaControlEnsureStarted
{
  if (!self->_mediaControlDaemon)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = objc_alloc_init(RPMediaControlDaemon);
    mediaControlDaemon = self->_mediaControlDaemon;
    self->_mediaControlDaemon = v3;

    [(RPMediaControlDaemon *)self->_mediaControlDaemon setMessenger:self];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002ED50;
    v9[3] = &unk_100121E58;
    void v9[4] = self;
    [(RPMediaControlDaemon *)self->_mediaControlDaemon setSendInterestEventHandler:v9];
    BOOL v5 = self->_mediaControlDaemon;
    id v8 = 0;
    unsigned __int8 v6 = [(RPMediaControlDaemon *)v5 activateAndReturnError:&v8];
    id v7 = v8;
    if ((v6 & 1) == 0 && dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_mediaControlEnsureStopped
{
  if (self->_mediaControlDaemon)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPMediaControlDaemon *)self->_mediaControlDaemon invalidate];
    mediaControlDaemon = self->_mediaControlDaemon;
    self->_mediaControlDaemon = 0;
  }
}

- (void)_mediaRemoteIDGet
{
  if (!self->_mediaRemoteIDGetting)
  {
    if (MRMediaRemoteGetLocalOrigin())
    {
      self->_mediaRemoteIDGetting = 1;
      MRMediaRemoteGetDeviceInfo();
    }
    else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_mediaRouteIDGet
{
  if (!self->_mediaRouteIDGetting)
  {
    self->_mediaRouteIDGetting = 1;
    id v3 = objc_alloc_init((Class)CUPairingManager);
    [v3 setDispatchQueue:self->_dispatchQueue];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10002F1E0;
    v4[3] = &unk_100121EA8;
    void v4[4] = v3;
    v4[5] = self;
    [v3 getPairingIdentityWithOptions:5 completion:v4];
  }
}

- (void)_miscEnsureStarted
{
  if (!self->_miscStarted)
  {
    CFStringRef v11 = @"statusFlags";
    uint64_t v12 = &off_10012B048;
    id v3 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002F67C;
    v8[3] = &unk_100121CA0;
    void v8[4] = self;
    [(RPCompanionLinkDaemon *)self registerRequestID:@"_launchApp" options:v3 handler:v8];
    if (self->_prefCommunal)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10002F688;
      v7[3] = &unk_100121CA0;
      void v7[4] = self;
      [(RPCompanionLinkDaemon *)self registerRequestID:@"_speak" options:v3 handler:v7];
    }
    CFStringRef v9 = @"statusFlags";
    id v10 = &off_10012B060;
    int v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002F694;
    v6[3] = &unk_100121ED0;
    v6[4] = self;
    [(RPCompanionLinkDaemon *)self _registerConnectionRequestID:@"_sessionStart" options:v4 handler:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10002F6A4;
    v5[3] = &unk_100121ED0;
    v5[4] = self;
    [(RPCompanionLinkDaemon *)self _registerConnectionRequestID:@"_sessionStop" options:v4 handler:v5];
    self->_miscStarted = 1;
  }
}

- (void)_miscEnsureStopped
{
  if (self->_miscStarted)
  {
    if (GestaltGetDeviceClass() == 1)
    {
      id v3 = +[RPCloudDaemon sharedCloudDaemon];
      unsigned int v4 = [v3 idsHasWatch];

      if (v4) {
        [(RPCompanionLinkDaemon *)self deregisterRequestID:@"_ctxtColl"];
      }
    }
    [(RPCompanionLinkDaemon *)self deregisterRequestID:@"_launchApp"];
    [(RPCompanionLinkDaemon *)self deregisterRequestID:@"_sessionStart"];
    [(RPCompanionLinkDaemon *)self deregisterRequestID:@"_sessionStop"];
    [(RPCompanionLinkDaemon *)self deregisterRequestID:@"_speak"];
    self->_miscStarted = 0;
  }
}

- (void)_miscHandleLaunchAppRequest:(id)a3 responseHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  uint64_t Int64 = CFDictionaryGetInt64();
  if (v7)
  {
    BOOL v9 = Int64 != 0;
    id v10 = dispatch_queue_create("RPLaunchApp", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F9E8;
    block[3] = &unk_100121F20;
    BOOL v20 = v9;
    block[4] = v7;
    id v19 = v6;
    dispatch_async(v10, block);
  }
  else
  {
    CFStringGetTypeID();
    id v10 = CFDictionaryGetTypedValue();
    if (v10 && (id v11 = [objc_alloc((Class)NSURL) initWithString:v10]) != 0)
    {
      uint64_t v12 = v11;
      long long v13 = dispatch_queue_create("RPOpenURL", 0);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10002FC98;
      v15[3] = &unk_100121F48;
      id v16 = v12;
      id v17 = v6;
      id v14 = v12;
      dispatch_async(v13, v15);
    }
    else
    {
      RPErrorF();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v14);
    }
  }
}

- (void)_miscHandleSpeakRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();

  if (v8)
  {
    id v9 = objc_alloc_init((Class)CUVoiceSession);
    [v9 setDispatchQueue:self->_dispatchQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002FF6C;
    v11[3] = &unk_100121F70;
    void v11[4] = v9;
    id v12 = v6;
    [v9 speakText:v8 flags:0 completion:v11];
  }
  else
  {
    id v10 = RPErrorF();
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v10);
  }
}

- (unint64_t)_nearbyActionDeviceActionTypes
{
  return 1210056704;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a5;
  if (([v8 isEqualToString:@"stereo_leader"] & 1) != 0
    || [v8 isEqualToString:@"stereo_leader_info"])
  {
    if (CFDictionaryGetInt64())
    {
      BOOL v10 = 1;
    }
    else
    {
      CFDictionaryGetTypeID();
      id v11 = (void *)CFPrefs_CopyTypedValue();
      BOOL v10 = CFDictionaryGetInt64() != 0;
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v12 = "no";
      if (v10) {
        id v12 = "yes";
      }
      unsigned int v15 = v12;
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000301EC;
    block[3] = &unk_100121F98;
    block[4] = self;
    BOOL v18 = v10;
    dispatch_async(dispatchQueue, block);
  }
  if ((objc_msgSend(v8, "isEqualToString:", @"accessControlLevel", v15) & 1) != 0
    || [v8 isEqualToString:@"p2pAllow"])
  {
    id v14 = self->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100030210;
    v16[3] = &unk_100121158;
    void v16[4] = self;
    dispatch_async(v14, v16);
  }
}

- (void)_personalDeviceUpdate
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10000F400;
  long long v13 = sub_10000F410;
  id v14 = 0;
  id v3 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsPersonalDeviceIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000303BC;
  v8[3] = &unk_1001214F0;
  void v8[4] = v3;
  void v8[5] = self;
  v8[6] = &v9;
  [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:v8];
  unsigned int v4 = v10;
  id v5 = (RPConnection *)v10[5];
  if (v5 != self->_personalCnx)
  {
    if (dword_100140E48 <= 30)
    {
      if (dword_100140E48 == -1)
      {
        int v6 = _LogCategory_Initialize();
        unsigned int v4 = v10;
        if (!v6) {
          goto LABEL_6;
        }
        id v5 = (RPConnection *)v10[5];
      }
      id v7 = [(RPConnection *)v5 peerDeviceInfo];
      LogPrintF();

      unsigned int v4 = v10;
    }
LABEL_6:
    objc_storeStrong((id *)&self->_personalCnx, (id)v4[5]);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_reachabilityEnsureStarted
{
  if (!self->_netLinkManager)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUNetLinkManager *)objc_alloc_init((Class)CUNetLinkManager);
    netLinkManager = self->_netLinkManager;
    self->_netLinkManager = v3;

    [(CUNetLinkManager *)self->_netLinkManager setDispatchQueue:self->_dispatchQueue];
    [(CUNetLinkManager *)self->_netLinkManager setLabel:@"CLink"];
    id v5 = self->_netLinkManager;
    [(CUNetLinkManager *)v5 activate];
  }
}

- (void)_reachabilityEnsureStopped
{
  if (self->_netLinkManager
    && dword_100140E48 <= 30
    && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(CUNetLinkManager *)self->_netLinkManager invalidate];
  netLinkManager = self->_netLinkManager;
  self->_netLinkManager = 0;
}

- (void)_siriEnsureStarted
{
  if (!self->_siriDaemon)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = objc_alloc_init(RPSiriDaemon);
    siriDaemon = self->_siriDaemon;
    self->_siriDaemon = v3;

    [(RPSiriDaemon *)self->_siriDaemon setMessenger:self];
    id v5 = self->_siriDaemon;
    id v8 = 0;
    unsigned __int8 v6 = [(RPSiriDaemon *)v5 activateAndReturnError:&v8];
    id v7 = v8;
    if ((v6 & 1) == 0 && dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_siriEnsureStopped
{
  if (self->_siriDaemon)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPSiriDaemon *)self->_siriDaemon invalidate];
    siriDaemon = self->_siriDaemon;
    self->_siriDaemon = 0;
  }
}

- (void)_stereoDeviceUpdate:(int)a3
{
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x3032000000;
  unsigned __int8 v57 = sub_10000F400;
  id v58 = sub_10000F410;
  id v59 = 0;
  [(RPCompanionLinkDevice *)self->_localDeviceInfo identifier];
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = sub_10000F400;
  id v52 = sub_10000F410;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v53 = v5;
  unsigned __int8 v6 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemIdentifier];
  unsigned int v7 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemRole];
  if (v6 && v7 - 1 <= 1)
  {
    int v8 = v7 == 2;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000312B0;
    v46[3] = &unk_100121FC0;
    if (v7 == 1) {
      int v8 = 2;
    }
    int v47 = v8;
    v46[4] = v6;
    void v46[5] = &v54;
    v46[6] = &v48;
    [(RPCompanionLinkDaemon *)self _forEachConnectionWithHandler:v46];
  }
  unsigned __int8 v9 = [(RPCompanionLinkDevice *)self->_localDeviceInfo flags];
  id v10 = (id)v49[5];
  id v11 = v5;
  id v12 = v11;
  if (v10 == v11)
  {
    unsigned int v13 = 1;
  }
  else if ((v11 != 0) == (v10 == 0))
  {
    unsigned int v13 = 0;
  }
  else
  {
    unsigned int v13 = [v10 isEqual:v11];
  }

  unsigned int v14 = v9 & 0x80;
  BOOL v15 = v14 >> 7 != v13;
  if (v14 >> 7 != v13)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v16 = "yes";
      if (v14) {
        id v17 = "yes";
      }
      else {
        id v17 = "no";
      }
      if (!v13) {
        id v16 = "no";
      }
      long long v43 = v17;
      long long v44 = (char *)v16;
      LogPrintF();
    }
    localDeviceInfo = self->_localDeviceInfo;
    if (v13) {
      unint64_t v19 = [(RPCompanionLinkDevice *)self->_localDeviceInfo flags] | 0x80;
    }
    else {
      unint64_t v19 = (unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo flags] & 0xFFFFFF7F;
    }
    -[RPCompanionLinkDevice setFlags:](localDeviceInfo, "setFlags:", v19, v43, v44);
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
  }
  if (v6)
  {
    if (v55[5]) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = 2;
    }
  }
  else
  {
    unsigned __int8 v21 = [(CUHomeKitManager *)self->_homeKitManager selfAccessory];

    uint64_t v20 = v21 != 0;
  }
  unsigned int v22 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemState];
  BOOL v23 = v20 != v22;
  if (v20 != v22)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      if (v22 > 4) {
        id v24 = "?";
      }
      else {
        id v24 = off_100122528[v22];
      }
      long long v43 = v24;
      long long v44 = off_100122528[v20];
      LogPrintF();
    }
    -[RPCompanionLinkDevice setMediaSystemState:](self->_localDeviceInfo, "setMediaSystemState:", v20, v43, v44);
    BOOL v15 = 1;
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
  }
  unsigned int v25 = [(RPCompanionLinkDevice *)self->_localDeviceInfo flags] & 0x200;
  int soundBoardUserLeader = self->_soundBoardUserLeader;
  if (soundBoardUserLeader != v25 >> 9)
  {
    if (dword_100140E48 <= 30)
    {
      if (dword_100140E48 != -1
        || (int v29 = _LogCategory_Initialize(), soundBoardUserLeader = self->_soundBoardUserLeader, v29))
      {
        if (v25) {
          unsigned __int8 v27 = "yes";
        }
        else {
          unsigned __int8 v27 = "no";
        }
        if (soundBoardUserLeader) {
          uint64_t v28 = "yes";
        }
        else {
          uint64_t v28 = "no";
        }
        long long v43 = v27;
        long long v44 = (char *)v28;
        LogPrintF();
        int soundBoardUserLeader = self->_soundBoardUserLeader;
      }
    }
    uint64_t v30 = self->_localDeviceInfo;
    if (soundBoardUserLeader) {
      unint64_t v31 = [(RPCompanionLinkDevice *)self->_localDeviceInfo flags] | 0x200;
    }
    else {
      unint64_t v31 = (unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo flags] & 0xFFFFFDFF;
    }
    -[RPCompanionLinkDevice setFlags:](v30, "setFlags:", v31, v43, v44);
    BOOL v15 = 1;
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
  }
  uint64_t v32 = (RPConnection *)v55[5];
  stereoCnx = self->_stereoCnx;
  if (v32 != stereoCnx)
  {
    if (v32 && !stereoCnx)
    {
      if (dword_100140E48 <= 30)
      {
        if (dword_100140E48 == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_74;
          }
          uint64_t v32 = (RPConnection *)v55[5];
        }
        goto LABEL_68;
      }
LABEL_74:
      objc_storeStrong((id *)&self->_stereoCnx, (id)v55[5]);
      BOOL v23 = 1;
      goto LABEL_75;
    }
    if (v32 || !stereoCnx)
    {
      if (dword_100140E48 > 30) {
        goto LABEL_74;
      }
      if (dword_100140E48 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_74;
        }
        uint64_t v32 = (RPConnection *)v55[5];
      }
    }
    else
    {
      if (dword_100140E48 > 30) {
        goto LABEL_74;
      }
      if (dword_100140E48 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_74;
        }
        uint64_t v32 = (RPConnection *)v55[5];
      }
      else
      {
        uint64_t v32 = 0;
      }
    }
LABEL_68:
    id v34 = [(RPConnection *)v32 peerDeviceInfo];
    LogPrintF();

    goto LABEL_74;
  }
LABEL_75:
  if (a3 <= 3 && v23) {
    [(RPCompanionLinkDaemon *)self _homeKitSelfAccessoryMediaSystemUpdated:(a3 + 1)];
  }
  if (self->_prefCommunal)
  {
    unsigned int v35 = v20 - 2;
    if ((v20 - 2) > 2)
    {
      int v36 = 2;
    }
    else if (self->_stereoCnx)
    {
      int v36 = 5;
    }
    else
    {
      int v36 = 6;
    }
    int airplayBuddyNotReachableState = self->_airplayBuddyNotReachableState;
    if (v36 != airplayBuddyNotReachableState)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_int airplayBuddyNotReachableState = v36;
      if (v36 == 2) {
        CFPrefs_RemoveValue();
      }
      else {
        CFPrefs_SetValue();
      }
    }
    if (v35 > 2) {
      int v38 = 2;
    }
    else {
      int v38 = [(RPCompanionLinkDaemon *)self _airPlayLeaderStateUncached];
    }
    if (v38 == self->_airplayLeaderState)
    {
      if (v36 == airplayBuddyNotReachableState) {
        goto LABEL_106;
      }
    }
    else
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_airplayLeaderState = v38;
      if (v38 == 2) {
        CFPrefs_RemoveValue();
      }
      else {
        CFPrefs_SetValue();
      }
    }
    CFPreferencesAppSynchronize(@"com.apple.airplay");
    notify_post("com.apple.airplay.prefsChanged");
  }
LABEL_106:
  if (v15)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000313D0;
    block[3] = &unk_100121158;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
    v60[0] = @"_clFl";
    long long v40 = +[NSNumber numberWithUnsignedInt:(unint64_t)[(RPCompanionLinkDevice *)self->_localDeviceInfo flags] & 0x280];
    v60[1] = @"_msSt";
    v61[0] = v40;
    long long v41 = +[NSNumber numberWithInt:[(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemState]];
    v61[1] = v41;
    long long v42 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
    [(RPCompanionLinkDaemon *)self sendEventID:@"_systemInfoUpdate" event:v42 destinationID:@"rapport:rdid:SameHome" options:0 completion:0];
  }
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

- (id)_xpcConnections:(id)a3 withControlFlags:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
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
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v13 = [v12 client:v16];
        unint64_t v14 = (unint64_t)[v13 controlFlags] & a4;

        if (v14) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_homeKitEnsureStarted
{
  if (!self->_homeKitManager)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUHomeKitManager *)objc_alloc_init((Class)CUHomeKitManager);
    homeKitManager = self->_homeKitManager;
    self->_homeKitManager = v3;

    [(CUHomeKitManager *)self->_homeKitManager setDispatchQueue:self->_dispatchQueue];
    if (self->_prefCommunal) {
      uint64_t v5 = 842;
    }
    else {
      uint64_t v5 = 1600;
    }
    [(CUHomeKitManager *)self->_homeKitManager setFlags:v5];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000318F4;
    v17[3] = &unk_100121158;
    v17[4] = self;
    [(CUHomeKitManager *)self->_homeKitManager setResolvableAccessoriesChangedHandler:v17];
    if ((v5 & 2) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100031988;
      v16[3] = &unk_100121158;
      void v16[4] = self;
      [(CUHomeKitManager *)self->_homeKitManager setSelfAccessoryMediaAccessUpdatedHandler:v16];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10003199C;
      v15[3] = &unk_100121158;
      void v15[4] = self;
      [(CUHomeKitManager *)self->_homeKitManager setSelfAccessoryMediaSystemUpdatedHandler:v15];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000319B4;
      v14[3] = &unk_100121158;
      v14[4] = self;
      [(CUHomeKitManager *)self->_homeKitManager setSelfAccessoryUpdatedHandler:v14];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000319C8;
      v13[3] = &unk_100121158;
      void v13[4] = self;
      [(CUHomeKitManager *)self->_homeKitManager setSelfAccessorySiriAccessUpdatedHandler:v13];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000319DC;
    v12[3] = &unk_100121D18;
    void v12[4] = self;
    [(CUHomeKitManager *)self->_homeKitManager setStateChangedHandler:v12];
    [(CUHomeKitManager *)self->_homeKitManager activate];
  }
  if (!self->_rpHomeKitManager)
  {
    id v6 = [[RPHomeKitManager alloc] initWithQueue:self->_dispatchQueue];
    rpHomeKitManager = self->_rpHomeKitManager;
    self->_rpHomeKitManager = v6;

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100031A9C;
    v11[3] = &unk_100121158;
    void v11[4] = self;
    [(RPHomeKitManager *)self->_rpHomeKitManager setPersonalRequestsStateChangedHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100031AA4;
    v10[3] = &unk_100121FE8;
    void v10[4] = self;
    [(RPHomeKitManager *)self->_rpHomeKitManager setRoomUpdatedHandler:v10];
  }
  unsigned int v8 = [(CUHomeKitManager *)self->_homeKitManager state];
  if (v8 == 1) {
    [(RPCompanionLinkDaemon *)self _homeKitGetPairingIdentities];
  }
  if (!self->_receiveHomeKitPairingUpdated)
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_homeKitPairingUpdated:" name:@"HMAccessoryPairingIdentityUpdatedNotification" object:0];
    self->_receiveHomeKitPairingUpdated = 1;
  }
  if (v8 == 1) {
    [(RPCompanionLinkDaemon *)self _homeKitUpdateUserIdentifiers];
  }
}

- (void)_homeKitEnsureStopped
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  rpHomeKitManager = self->_rpHomeKitManager;
  if (rpHomeKitManager)
  {
    [(RPHomeKitManager *)rpHomeKitManager invalidate];
    unsigned int v4 = self->_rpHomeKitManager;
    self->_rpHomeKitManager = 0;
  }
  homeKitManager = self->_homeKitManager;
  if (homeKitManager)
  {
    [(CUHomeKitManager *)homeKitManager invalidate];
    id v6 = self->_homeKitManager;
    self->_homeKitManager = 0;
  }
  if (self->_receiveHomeKitPairingUpdated)
  {
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:@"HMAccessoryPairingIdentityUpdatedNotification" object:0];
    self->_receiveHomeKitPairingUpdated = 0;
  }
  homeKitAuthTag = self->_homeKitAuthTag;
  self->_homeKitAuthTag = 0;

  homeKitIRK = self->_homeKitIRK;
  self->_homeKitIRK = 0;

  homeKitLTPK = self->_homeKitLTPK;
  self->_homeKitLTPK = 0;

  homeKitRotatingID = self->_homeKitRotatingID;
  self->_homeKitRotatingID = 0;
}

- (void)_homeKitPairingUpdated:(id)a3
{
  id v4 = a3;
  if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031CA0;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_homeKitGetPairingIdentities
{
  if (!self->_homeKitGettingIdentity && (!self->_homeKitLTPK || self->_homeKitForceGetIdentity))
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(_WORD *)&self->_homeKitForceGetIdentity = 256;
    homeKitManager = self->_homeKitManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100031D98;
    v4[3] = &unk_100122010;
    void v4[4] = self;
    [(CUHomeKitManager *)homeKitManager getPairingIdentityWithOptions:34 completion:v4];
  }
}

- (BOOL)_homeKitAuthMatchForBonjourDevice:(id)a3
{
  id v4 = a3;
  if ((id)[(NSData *)self->_homeKitIRK length] == (id)16)
  {
    uint64_t v5 = [v4 txtDictionary];
    CFDictionaryGetData();
  }
  return 0;
}

- (id)_homeKitDecryptRotatingIDForBonjourDevice:(id)a3
{
  if (self->_homeKitLTPK)
  {
    id v3 = [a3 txtDictionary];
    CFDictionaryGetHardwareAddress();
    CFDictionaryGetData();
  }

  return 0;
}

- (void)_homeKitGetUserInfo:(id)a3
{
  id v12 = a3;
  id v4 = [(CUHomeKitManager *)self->_homeKitManager selfAccessory];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 home];
    id v7 = v6;
    if (v6)
    {
      unsigned int v8 = [v6 currentUser];
      if (v8)
      {
        id v9 = [v12 accountID];

        if (!v9)
        {
          uint64_t v10 = [v8 userID];
          [v12 setAccountID:v10];

          id v11 = [v8 uniqueIdentifier];
          [v12 setHomeKitUserIdentifier:v11];
        }
      }
    }
  }
}

- (void)_homeKitIdentityUpdated:(id)a3 error:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = [v20 publicKey];
    if ([v7 length])
    {
      homeKitLTPK = self->_homeKitLTPK;
      id v9 = v7;
      uint64_t v10 = homeKitLTPK;
      if (v9 == v10)
      {
      }
      else
      {
        id v11 = v10;
        if ((v9 == 0) == (v10 != 0))
        {

          goto LABEL_20;
        }
        unsigned int v12 = [(NSData *)v9 isEqual:v10];

        if (!v12)
        {
LABEL_20:
          objc_storeStrong((id *)&self->_homeKitLTPK, v7);
          id v13 = objc_alloc_init((Class)RPIdentity);
          [v13 setEdPKData:v9];
          unint64_t v14 = [v20 secretKey];
          [v13 setEdSKData:v14];

          BOOL v15 = [v20 identifier];
          long long v16 = [v15 UUIDString];
          [v13 setIdentifier:v16];

          [(RPCompanionLinkDaemon *)self _homeKitGetUserInfo:v13];
          long long v17 = +[RPIdentityDaemon sharedIdentityDaemon];
          [v17 setHomeKitIdentity:v13];

          self->_prefHomeKitConfigured = 1;
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            long long v19 = v9;
            LogPrintF();
          }
          -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", &stru_100122030, v19);
          id v18 = [(RPCompanionLinkDaemon *)self _discoveryNonceOrRotate:1];
          [(RPCompanionLinkDaemon *)self _homeKitUpdateInfo:1];
          [(RPCompanionLinkDaemon *)self _clientBonjourReevaluateAllDevices];
          [(RPCompanionLinkDaemon *)self _update];

          goto LABEL_29;
        }
      }
      if (dword_100140E48 > 10 || dword_100140E48 == -1 && !_LogCategory_Initialize())
      {
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if (dword_100140E48 > 90 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_29;
      }
      [v7 length];
    }
    LogPrintF();
    goto LABEL_29;
  }
  if (dword_100140E48 <= 60 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_30:
}

- (void)_homeKitSelfAccessoryMediaAccessUpdated
{
  id v3 = [(RPCompanionLinkDevice *)self->_localDeviceInfo password];
  id v4 = [(CUHomeKitManager *)self->_homeKitManager selfAccessoryMediaAccessPassword];
  id v5 = v3;
  id v18 = v5;
  if (v4 == v5)
  {

    goto LABEL_6;
  }
  if ((v5 != 0) == (v4 == 0))
  {

    goto LABEL_8;
  }
  unsigned __int8 v6 = [v4 isEqual:v5];

  if (v6)
  {
LABEL_6:
    int v7 = 0;
    goto LABEL_19;
  }
LABEL_8:
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    if ([v18 length]) {
      unsigned int v8 = "set";
    }
    else {
      unsigned int v8 = "not set";
    }
    if ([v4 length]) {
      id v9 = "set";
    }
    else {
      id v9 = "not set";
    }
    unint64_t v14 = v8;
    BOOL v15 = v9;
    LogPrintF();
  }
  -[RPCompanionLinkDevice setPassword:](self->_localDeviceInfo, "setPassword:", v4, v14, v15);
  int v7 = 1;
  [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
LABEL_19:
  uint64_t v10 = (const char *)[(RPCompanionLinkDevice *)self->_localDeviceInfo flags];
  unsigned int v11 = [(CUHomeKitManager *)self->_homeKitManager selfAccessoryMediaAccessFlags];
  int v12 = 8 * (v11 & 1);
  uint64_t v13 = v10 & 0xFFFFFFE3 | (16 * ((v11 >> 1) & 1)) | (4 * ([v4 length] != 0)) & 0xF7 | v12;
  if (v13 == v10)
  {
    if (!v7)
    {
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = v13;
      long long v17 = &unk_100119A76;
      unint64_t v14 = v10;
      BOOL v15 = (const char *)&unk_100119A76;
      LogPrintF();
    }
    -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:", v13, v14, v15, v16, v17);
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
  }
  [(RPCompanionLinkDaemon *)self _update];
  if (v12) {
LABEL_22:
  }
    [(RPCompanionLinkDaemon *)self _disconnectUnauthConnections];
LABEL_23:
}

- (void)_homeKitSelfAccessoryMediaSystemUpdated:(int)a3
{
  id v5 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemIdentifier];
  unsigned __int8 v6 = [(CUHomeKitManager *)self->_homeKitManager selfAccessoryMediaSystem];
  int v7 = [v6 uniqueIdentifier];

  id v8 = v7;
  id v9 = v5;
  uint64_t v10 = v9;
  BOOL v11 = v8 != v9;
  if (v8 == v9)
  {

    uint64_t v13 = v10;
  }
  else
  {
    if ((v9 != 0) != (v8 == 0))
    {
      unsigned __int8 v12 = [v8 isEqual:v9];

      if (v12)
      {
        BOOL v11 = 0;
        goto LABEL_13;
      }
    }
    else
    {
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v54 = v10;
      uint64_t v56 = (char *)v8;
      LogPrintF();
    }
    -[RPCompanionLinkDevice setMediaSystemIdentifier:](self->_localDeviceInfo, "setMediaSystemIdentifier:", v8, v54, v56);
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
    uint64_t v13 = [v8 UUIDString];
    CFPrefs_SetValue();
  }

LABEL_13:
  unint64_t v14 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemIdentifierEffective];

  if (self->_stereoCnx) {
    BOOL v15 = v8;
  }
  else {
    BOOL v15 = 0;
  }
  id v16 = v15;

  id v17 = v16;
  id v18 = v14;
  long long v19 = v18;
  if (v17 == v18)
  {

    int v21 = v11;
    goto LABEL_27;
  }
  if ((v18 != 0) != (v17 == 0))
  {
    unsigned __int8 v20 = [v17 isEqual:v18];

    int v21 = v11;
    if (v20) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v54 = v19;
    uint64_t v56 = (char *)v17;
    LogPrintF();
  }
  -[RPCompanionLinkDevice setMediaSystemIdentifierEffective:](self->_localDeviceInfo, "setMediaSystemIdentifierEffective:", v17, v54, v56);
  int v21 = 1;
  [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
LABEL_27:
  id v61 = v19;
  unsigned int v22 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemName];
  BOOL v23 = [(CUHomeKitManager *)self->_homeKitManager selfAccessoryMediaSystem];
  id v24 = [v23 name];

  id v25 = v24;
  id v26 = v22;
  unsigned __int8 v27 = v26;
  if (v25 == v26)
  {
  }
  else
  {
    if ((v26 != 0) == (v25 == 0))
    {

      goto LABEL_40;
    }
    unsigned __int8 v28 = [v25 isEqual:v26];

    if ((v28 & 1) == 0)
    {
LABEL_40:
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v54 = v27;
        uint64_t v56 = (char *)v25;
        LogPrintF();
      }
      -[RPCompanionLinkDevice setMediaSystemName:](self->_localDeviceInfo, "setMediaSystemName:", v25, v54, v56);
      int v21 = 1;
      [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
      goto LABEL_45;
    }
  }
  if (![v25 length] && !self->_fixedSoundBoardNameIssue && self->_soundBoardPrefs)
  {
    CFStringGetTypeID();
    int v29 = (void *)CFPrefs_CopyTypedValue();
    if ([v29 length])
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v54 = v29;
        LogPrintF();
      }
      CFPrefs_RemoveValue();
      BOOL v11 = 1;
      self->_fixedSoundBoardNameIssue = 1;
    }
  }
LABEL_45:
  id v59 = v27;
  unsigned int v30 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemRole];
  unint64_t v31 = [(CUHomeKitManager *)self->_homeKitManager selfAccessoryMediaSystemRole];
  homeKitManager = self->_homeKitManager;
  if (v31)
  {
    uint64_t v33 = [(CUHomeKitManager *)homeKitManager selfAccessoryMediaSystemRole];
    id v34 = [v33 type];
    if (v34 == (id)1) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = 2 * (v34 == (id)2);
    }
  }
  else
  {
    uint64_t v33 = [(CUHomeKitManager *)homeKitManager selfAccessory];
    if (v33) {
      uint64_t v35 = 3;
    }
    else {
      uint64_t v35 = 0;
    }
  }
  id v60 = v25;

  if (v35 != v30)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      if (v30 > 3) {
        int v36 = "?";
      }
      else {
        int v36 = off_100122578[v30];
      }
      id v55 = v36;
      uint64_t v56 = off_100122578[v35];
      LogPrintF();
    }
    -[RPCompanionLinkDevice setMediaSystemRole:](self->_localDeviceInfo, "setMediaSystemRole:", v35, v55, v56);
    if (v35 == 1)
    {
      long long v37 = (id *)&RPDeviceRoleStereoLeft;
    }
    else
    {
      if (v35 != 2)
      {
        id v38 = 0;
        goto LABEL_67;
      }
      long long v37 = (id *)&RPDeviceRoleStereoRight;
    }
    id v38 = *v37;
LABEL_67:
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setRole:v38];

    int v21 = 1;
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
  }
  unsigned int v39 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemRoleEffective];
  if (self->_stereoCnx) {
    uint64_t v40 = v35;
  }
  else {
    uint64_t v40 = 0;
  }
  if (v40 == v39)
  {
    if (!v21) {
      goto LABEL_102;
    }
    goto LABEL_88;
  }
  if (dword_100140E48 <= 30)
  {
    unsigned int v41 = v39;
    if (dword_100140E48 != -1 || _LogCategory_Initialize())
    {
      if (v41 > 3) {
        long long v42 = "?";
      }
      else {
        long long v42 = off_100122578[v41];
      }
      id v55 = v42;
      uint64_t v56 = off_100122578[v40];
      LogPrintF();
    }
  }
  -[RPCompanionLinkDevice setMediaSystemRoleEffective:](self->_localDeviceInfo, "setMediaSystemRoleEffective:", v40, v55, v56);
  [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
  if (v40 == 1)
  {
    long long v43 = (id *)&RPDeviceRoleStereoLeft;
    goto LABEL_86;
  }
  if (v40 == 2)
  {
    long long v43 = (id *)&RPDeviceRoleStereoRight;
LABEL_86:
    id v44 = *v43;
  }
  CFPrefs_SetValue();
  CFPreferencesAppSynchronize(@"com.apple.soundautoconfig");
LABEL_88:
  id v57 = v17;
  BOOL v58 = v11;
  [(RPCompanionLinkDaemon *)self _update];
  v62[0] = @"_forcedRole";
  long long v45 = [(RPCompanionLinkDevice *)self->_localDeviceInfo role];
  long long v46 = v45;
  if (!v45)
  {
    long long v46 = +[NSNull null];
  }
  v63[0] = v46;
  v62[1] = @"_msId";
  int v47 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemIdentifier];
  uint64_t v48 = v47;
  if (!v47)
  {
    uint64_t v48 = +[NSNull null];
  }
  int v49 = a3;
  v63[1] = v48;
  v62[2] = @"_msNm";
  uint64_t v50 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemName];
  id v51 = v50;
  if (!v50)
  {
    id v51 = +[NSNull null];
  }
  v63[2] = v51;
  v62[3] = @"_msRo";
  id v52 = +[NSNumber numberWithInt:[(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemRole]];
  v63[3] = v52;
  id v53 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:4];
  [(RPCompanionLinkDaemon *)self sendEventID:@"_systemInfoUpdate" event:v53 destinationID:@"rapport:rdid:SameHome" options:0 completion:0];

  if (!v50) {
  if (!v47)
  }

  if (!v45) {
  BOOL v11 = v58;
  }
  id v17 = v57;
  if (v49 <= 3) {
    [(RPCompanionLinkDaemon *)self _stereoDeviceUpdate:(v49 + 1)];
  }
LABEL_102:
  if (v11)
  {
    CFPreferencesAppSynchronize(@"com.apple.airplay");
    notify_post("com.apple.airplay.prefsChanged");
  }
}

- (void)_homeKitSelfAccessoryUpdated
{
  id v28 = +[NSMutableDictionary dictionary];
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = [(CUHomeKitManager *)self->_homeKitManager selfAccessory];
  if (v3)
  {
    id v4 = [(RPCompanionLinkDevice *)self->_localDeviceInfo roomName];
    id v5 = [v3 room];
    unsigned __int8 v6 = [v5 name];

    id v7 = v6;
    id v8 = v4;
    id v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      if ((v8 != 0) == (v7 == 0))
      {

        goto LABEL_16;
      }
      unsigned __int8 v10 = [v7 isEqual:v8];

      if ((v10 & 1) == 0)
      {
LABEL_16:
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v26 = (const char *)v9;
          unsigned __int8 v27 = (const char *)v7;
          LogPrintF();
        }
        -[RPCompanionLinkDevice setRoomName:](self->_localDeviceInfo, "setRoomName:", v7, v26, v27);
        [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
        if (v7)
        {
          [v28 setObject:v7 forKeyedSubscript:@"_roomName"];
        }
        else
        {
          unsigned __int8 v12 = +[NSNull null];
          [v28 setObject:v12 forKeyedSubscript:@"_roomName"];
        }
        int v11 = 1;
LABEL_26:
        int v13 = [(RPCompanionLinkDevice *)self->_localDeviceInfo personalRequestsState];
        unsigned int v14 = [(CUHomeKitManager *)self->_homeKitManager selfAccessorySiriEnabled];
        if (v14) {
          uint64_t v15 = 6;
        }
        else {
          uint64_t v15 = 5;
        }
        if (v15 == v13)
        {
          if (!v11) {
            goto LABEL_45;
          }
        }
        else
        {
          if (dword_100140E48 <= 30)
          {
            unsigned int v16 = v14;
            if (dword_100140E48 != -1 || _LogCategory_Initialize())
            {
              if (v13 >= 8)
              {
                id v17 = "?";
                if (v13 > 9) {
                  id v17 = "User";
                }
              }
              else
              {
                id v17 = off_100122598[v13];
              }
              id v18 = "No";
              if (v16) {
                id v18 = "Yes";
              }
              id v26 = v17;
              unsigned __int8 v27 = v18;
              LogPrintF();
            }
          }
          -[RPCompanionLinkDevice setPersonalRequestsState:](self->_localDeviceInfo, "setPersonalRequestsState:", v15, v26, v27);
          [(RPCompanionLinkDevice *)self->_localDeviceInfo setChanged:1];
        }
        [(RPCompanionLinkDaemon *)self _update];
LABEL_45:
        long long v19 = [(CUHomeKitManager *)self->_homeKitManager selfAccessory];
        unsigned __int8 v20 = [v19 home];
        int v21 = [v20 currentUser];

        unsigned int v22 = [(RPHomeKitManager *)self->_rpHomeKitManager currentUser];
        BOOL v23 = [v21 uniqueIdentifier];
        id v24 = [v22 uniqueIdentifier];
        unsigned __int8 v25 = [v23 isEqual:v24];

        if ((v25 & 1) == 0)
        {
          [(RPHomeKitManager *)self->_rpHomeKitManager setCurrentUser:0];
          [(RPCompanionLinkDaemon *)self _updatePersonalRequestsStateForHomeHubDevices];
        }
        if ([v28 count]) {
          [(RPCompanionLinkDaemon *)self sendEventID:@"_systemInfoUpdate" event:v28 destinationID:@"rapport:rdid:SameHome" options:0 completion:0];
        }

        goto LABEL_50;
      }
    }
    int v11 = 0;
    goto LABEL_26;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_50:
}

- (void)_homeKitUpdateInfo:(BOOL)a3
{
  if (a3)
  {
    homeKitAuthTag = self->_homeKitAuthTag;
    self->_homeKitAuthTag = 0;

    homeKitIRK = self->_homeKitIRK;
    self->_homeKitIRK = 0;

    homeKitRotatingID = self->_homeKitRotatingID;
    self->_homeKitRotatingID = 0;
  }
  if (!self->_homeKitIRK)
  {
    homeKitLTPK = self->_homeKitLTPK;
    if (homeKitLTPK)
    {
      [(NSData *)homeKitLTPK bytes];
      [(NSData *)self->_homeKitLTPK length];
      CryptoHKDF();
      int v11 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:v24 length:16];
      unsigned __int8 v12 = self->_homeKitIRK;
      self->_homeKitIRK = v11;

      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  if (!self->_homeKitAuthTag && (id)[(NSData *)self->_homeKitIRK length] == (id)16)
  {
    if (self->_btAdvAddrData)
    {
      [(NSData *)self->_homeKitIRK bytes];
      [(NSData *)self->_btAdvAddrData bytes];
      [(NSData *)self->_btAdvAddrData length];
      uint64_t v7 = SipHash();
      v24[0] = BYTE5(v7);
      v24[1] = BYTE4(v7);
      v24[2] = BYTE3(v7);
      void v24[3] = BYTE2(v7);
      v24[4] = BYTE1(v7);
      void v24[5] = v7;
      id v8 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:v24 length:6];
      id v9 = self->_homeKitAuthTag;
      self->_homeKitAuthTag = v8;

      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  if (!self->_homeKitRotatingID)
  {
    if (self->_btAdvAddrData)
    {
      int v13 = self->_homeKitLTPK;
      if (v13)
      {
        if (self->_uniqueIDData)
        {
          unsigned int v14 = (void *)kCryptoHashDescriptor_SHA512;
          [(NSData *)v13 bytes];
          [(NSData *)self->_homeKitLTPK length];
          CryptoHKDF();
          NSUInteger v15 = [(NSData *)self->_btAdvAddrData length];
          btAdvAddrData = self->_btAdvAddrData;
          if (v15 == 6)
          {
            [(NSData *)btAdvAddrData bytes];
            [(NSData *)self->_btAdvAddrData length];
            __memcpy_chk();
            unsigned int v14 = [(RPCompanionLinkDaemon *)self _discoveryNonceOrRotate:0];
            if ([v14 length] == (id)6)
            {
              id v17 = v14;
              [v17 bytes];
              [v17 length];
              __memcpy_chk();
              NSUInteger v18 = [(NSData *)self->_uniqueIDData length];
              uniqueIDData = self->_uniqueIDData;
              if (v18 == 6)
              {
                [uniqueIDData bytes];
                [(NSData *)self->_uniqueIDData length];
                chacha20_all_96x32();
                unsigned __int8 v20 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:v23 length:6];
                int v21 = self->_homeKitRotatingID;
                self->_homeKitRotatingID = v20;

                if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
                  LogPrintF();
                }

                return;
              }
LABEL_32:
              [uniqueIDData length];
              FatalErrorF();
            }
          }
          else
          {
            id v22 = [(NSData *)btAdvAddrData length];
            FatalErrorF();
          }
          id v22 = [v14 length];
          uniqueIDData = (void *)FatalErrorF();
          goto LABEL_32;
        }
      }
    }
  }
}

- (void)_homeKitUpdateUserIdentifiers
{
  [(RPHomeKitManager *)self->_rpHomeKitManager resetHomeKitUserIdentifiers];
  id v3 = [(RPHomeKitManager *)self->_rpHomeKitManager homeKitUserIdentifiers];
  id v4 = [(RPCompanionLinkDevice *)self->_localDeviceInfo homeKitUserIdentifiers];
  id v5 = [v4 count];
  id v6 = [v3 count];

  if (v5 == v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        int v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v11);
          int v13 = [(RPCompanionLinkDevice *)self->_localDeviceInfo homeKitUserIdentifiers];
          LODWORD(v12) = [v13 containsObject:v12];

          if (!v12)
          {

            goto LABEL_12;
          }
          int v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
LABEL_12:
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setHomeKitUserIdentifiers:0];
    [(RPCompanionLinkDaemon *)self _localDeviceUpdate];
  }
}

- (id)_filterHomeKitUserIdentifiers:(id)a3
{
  return [(RPHomeKitManager *)self->_rpHomeKitManager filterHomeKitUserIdentifiers:a3];
}

- (id)_eventForHomeHubDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  if (v4)
  {
    id v5 = +[NSMutableDictionary dictionary];
    id v6 = [v3 identifier];

    if (v6) {
      [v5 setObject:v4 forKeyedSubscript:@"_i"];
    }
    id v7 = [v3 homeKitIdentifier];

    if (v7)
    {
      id v8 = [v3 homeKitIdentifier];
      [v5 setObject:v8 forKeyedSubscript:@"_hkID"];
    }
    id v9 = [v3 mediaRouteIdentifier];

    if (v9)
    {
      uint64_t v10 = [v3 mediaRouteIdentifier];
      [v5 setObject:v10 forKeyedSubscript:@"_mRtID"];
    }
    int v11 = [v3 siriInfo];

    if (v11)
    {
      uint64_t v12 = [v3 siriInfo];
      [v5 setObject:v12 forKeyedSubscript:@"_siriInfo"];
    }
    int v13 = [v3 roomName];

    if (v13)
    {
      long long v14 = [v3 roomName];
      [v5 setObject:v14 forKeyedSubscript:@"_roomName"];
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = 0;
  }

  return v5;
}

- (void)_homeHubDeviceAdded:(id)a3
{
  id v4 = a3;
  homeHubDevices = self->_homeHubDevices;
  id v25 = v4;
  if (!homeHubDevices)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v7 = self->_homeHubDevices;
    self->_homeHubDevices = v6;

    id v4 = v25;
    homeHubDevices = self->_homeHubDevices;
  }
  id v8 = [v4 identifier];
  id v9 = [(NSMutableDictionary *)homeHubDevices objectForKeyedSubscript:v8];

  if (!v9)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v24 = CUDescriptionWithLevel();
      LogPrintF();
    }
    [v25 setPersonalDeviceState:-[RPCompanionLinkDevice personalDeviceState](self->_localDeviceInfo, "personalDeviceState", v24)];
    int v11 = [(RPCompanionLinkDevice *)self->_localDeviceInfo idsPersonalDeviceIdentifier];
    [v25 setIdsPersonalDeviceIdentifier:v11];

    rpHomeKitManager = self->_rpHomeKitManager;
    int v13 = [v25 homeKitIdentifier];
    uint64_t v10 = [(RPHomeKitManager *)rpHomeKitManager homeHubDeviceWithIdentifier:v13];

    long long v14 = self->_rpHomeKitManager;
    long long v15 = [v25 homeKitIdentifier];
    LODWORD(v14) = [(RPHomeKitManager *)v14 personalRequestsStateForAccessory:v15];

    if (v14) {
      uint64_t v16 = 6;
    }
    else {
      uint64_t v16 = 5;
    }
    [v25 setPersonalRequestsState:v16];
    long long v17 = [v10 room];
    NSUInteger v18 = [v17 name];
    [v25 setRoomName:v18];

    long long v19 = self->_homeHubDevices;
    unsigned __int8 v20 = [v25 identifier];
    [(NSMutableDictionary *)v19 setObject:v25 forKeyedSubscript:v20];

    [(RPCompanionLinkDaemon *)self _clientReportFoundDevice:v25];
    int v21 = [(RPCompanionLinkDaemon *)self _eventForHomeHubDevice:v25];
    if (v21)
    {
      id v22 = +[NSMutableArray array];
      [v22 addObject:v21];
      BOOL v23 = +[NSDictionary dictionaryWithObjectsAndKeys:v22, @"_proxyDevs", 0];
      [(RPCompanionLinkDaemon *)self sendEventID:@"_proxyAdd" event:v23 destinationID:@"rapport:rdid:SameHome" options:0 completion:&stru_100122050];
    }
    goto LABEL_19;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = CUDescriptionWithLevel();
    LogPrintF();
LABEL_19:
  }
}

- (void)_homeHubDeviceRemoved:(id)a3
{
  id v10 = a3;
  [v10 setStatusFlags:((unint64_t)[v10 statusFlags] & 0xFFFFFFFFEFFFFFFFLL)];
  [v10 setSiriInfo:0];
  [(RPCompanionLinkDaemon *)self _clientReportLostDevice:v10];
  homeHubDevices = self->_homeHubDevices;
  id v5 = [v10 identifier];
  [(NSMutableDictionary *)homeHubDevices setObject:0 forKeyedSubscript:v5];

  if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v9 = CUDescriptionWithLevel();
    LogPrintF();
  }
  id v6 = -[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v10, v9);
  if (v6)
  {
    id v7 = +[NSMutableArray array];
    [v7 addObject:v6];
    id v8 = +[NSDictionary dictionaryWithObjectsAndKeys:v7, @"_proxyDevs", 0];
    [(RPCompanionLinkDaemon *)self sendEventID:@"_proxyRemove" event:v8 destinationID:@"rapport:rdid:SameHome" options:0 completion:&stru_100122070];
  }
}

- (void)_updateHomeHubDevices:(id)a3
{
  id v4 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        homeHubDevices = self->_homeHubDevices;
        int v11 = [v9 identifier];
        uint64_t v12 = [(NSMutableDictionary *)homeHubDevices objectForKeyedSubscript:v11];

        if (!v12) {
          [(RPCompanionLinkDaemon *)self _homeHubDeviceAdded:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v6);
  }
  int v13 = [(NSMutableDictionary *)self->_homeHubDevices allValues];
  id v14 = [v13 copy];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    uint64_t v29 = *(void *)v38;
    unsigned int v30 = self;
    do
    {
      NSUInteger v18 = 0;
      id v31 = v16;
      do
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v18);
        if ((objc_msgSend(v19, "statusFlags", v29) & 0x20000000) != 0)
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v20 = v4;
          id v21 = v4;
          id v22 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v34;
            while (2)
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v34 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)j) identifier];
                unsigned __int8 v27 = [v19 identifier];
                unsigned __int8 v28 = [v26 isEqual:v27];

                if (v28)
                {

                  id v4 = v20;
                  self = v30;
                  goto LABEL_26;
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          self = v30;
          [(RPCompanionLinkDaemon *)v30 _homeHubDeviceRemoved:v19];
          id v4 = v20;
LABEL_26:
          uint64_t v17 = v29;
          id v16 = v31;
        }
        NSUInteger v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      id v16 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v16);
  }

  [(RPCompanionLinkDaemon *)self _update];
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_registeredEvents objectForKeyedSubscript:v16];

  if (v10)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v15 = v16;
      LogPrintF();
    }
    int v11 = objc_alloc_init(RPEventRegistration);
    [(RPEventRegistration *)v11 setEventID:v16];
    [(RPEventRegistration *)v11 setOptions:v8];
    [(RPEventRegistration *)v11 setHandler:v9];
    registeredEvents = self->_registeredEvents;
    if (!registeredEvents)
    {
      int v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v14 = self->_registeredEvents;
      self->_registeredEvents = v13;

      registeredEvents = self->_registeredEvents;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v11, v16, v15);
  }
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100140E48 <= 30)
  {
    if (dword_100140E48 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredEvents, "setObject:forKeyedSubscript:", 0, v4, v6);
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  long long v37 = self;
  id v31 = a7;
  uint64_t v32 = v13;
  long long v33 = -[RPCompanionLinkDaemon _checkForProxyOrLocalDestinations:eventID:event:options:completion:](self, "_checkForProxyOrLocalDestinations:eventID:event:options:completion:", v13, v12, a4, v14);
  if (v33)
  {
    unsigned int xidLast = self->_xidLast;
    if (xidLast + 1 > 1) {
      unsigned int v16 = xidLast + 1;
    }
    else {
      unsigned int v16 = 1;
    }
    self->_unsigned int xidLast = v16;
    unsigned int v34 = v16;
    uint64_t v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    long long v36 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_10012B078, @"_t", v12, @"_i", v33, @"_c", v17, @"_x", 0];

    NSUInteger v18 = [v14 objectForKeyedSubscript:@"chatty"];
    unsigned int v19 = [v18 BOOLValue];

    if (v19) {
      [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_cht"];
    }
    id v20 = [v14 objectForKeyedSubscript:@"inUseProcess"];

    if (v20)
    {
      id v21 = [v14 objectForKeyedSubscript:@"inUseProcess"];
      [v36 setObject:v21 forKeyedSubscript:@"_inUseProc"];
    }
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = sub_10000F400;
    void v63[4] = sub_10000F410;
    id v64 = 0;
    uint64_t v59 = 0;
    id v60 = &v59;
    uint64_t v61 = 0x2020000000;
    int v62 = 0;
    group = dispatch_group_create();
    if ([v13 isEqual:@"rapport:rdid:InterestedPeers"])
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v22 = [(NSMutableDictionary *)self->_interestEvents objectForKeyedSubscript:v12];
      id v23 = [v22 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v56;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v56 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472;
            v48[2] = sub_100034E04;
            v48[3] = &unk_1001220C0;
            void v48[4] = group;
            id v49 = v36;
            id v52 = v63;
            id v50 = v12;
            unsigned int v54 = v34;
            id v51 = v14;
            id v53 = &v59;
            [(RPCompanionLinkDaemon *)v37 _forEachMatchingDestinationID:v26 handler:v48];
          }
          id v23 = [v22 countByEnumeratingWithState:&v55 objects:v65 count:16];
        }
        while (v23);
      }
    }
    else
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100034FA0;
      v41[3] = &unk_1001220C0;
      v41[4] = group;
      id v42 = v36;
      long long v45 = v63;
      id v43 = v12;
      unsigned int v47 = v34;
      id v44 = v14;
      long long v46 = &v59;
      [(RPCompanionLinkDaemon *)self _forEachUniqueMatchingDestinationID:v13 handler:v41];
    }
    dispatchQueue = v37->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003513C;
    block[3] = &unk_1001220E8;
    id v39 = v31;
    long long v40 = v63;
    dispatch_group_notify(group, dispatchQueue, block);
    if (*((_DWORD *)v60 + 6)) {
      goto LABEL_30;
    }
    id v28 = v12;
    if (([v28 isEqual:@"HIDRelay"] & 1) != 0
      || ([v28 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
      || ([v28 isEqual:@"_hidT"] & 1) != 0
      || ([v28 isEqual:@"_laData"] & 1) != 0)
    {
    }
    else
    {
      unsigned int v30 = [v28 isEqual:@"_siA"];

      if (!v30)
      {
        int v29 = 30;
        goto LABEL_26;
      }
    }
    int v29 = 10;
LABEL_26:
    if (v29 >= dword_100140E48 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
LABEL_30:

    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(v63, 8);
  }
}

- (void)_receivedEventID:(id)a3 onXPCCnx:(id)a4 event:(id)a5 options:(id)a6 unauth:(BOOL)a7 rpCnx:(id)a8
{
  BOOL v9 = a7;
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  NSUInteger v18 = [v14 registeredEvents];
  uint64_t v19 = [v18 objectForKeyedSubscript:v22];
  if (v19)
  {
    id v20 = (void *)v19;
  }
  else
  {
    id v21 = [v14 registeredEvents];
    id v20 = [v21 objectForKeyedSubscript:@"*"];

    if (!v20) {
      goto LABEL_7;
    }
  }
  if (!v9
    || [(RPCompanionLinkDaemon *)self _allowMessageForRegistrationOptions:v20 cnx:v17])
  {
    [v14 receivedEventID:v22 event:v15 options:v16];
  }
LABEL_7:
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7
{
  BOOL v8 = a6;
  id v15 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (((unint64_t)[v14 statusFlags] & 0x10000AE000) != 0
    && [v15 isEqual:@"_interest"])
  {
    [(RPCompanionLinkDaemon *)self _interestReceived:v12 cnx:v14];
    goto LABEL_11;
  }
  if (([v15 isEqual:@"_proxyAdd"] & 1) != 0
    || [v15 isEqual:@"_proxyRemove"])
  {
    if (!v8)
    {
      [(RPCompanionLinkDaemon *)self _proxyDeviceListUpdated:v15 content:v12 options:v13 cnx:v14];
      goto LABEL_11;
    }
  }
  else
  {
    if (![v15 isEqual:@"_proxyUpdate"])
    {
      if ([v15 isEqual:@"_needsAWDL"])
      {
        if (v8)
        {
          if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
            goto LABEL_9;
          }
          goto LABEL_11;
        }
        [(RPCompanionLinkDaemon *)self _serverReceivedNeedsAWDLEvent:v15 event:v12];
      }
      [(RPCompanionLinkDaemon *)self _deliverEventID:v15 event:v12 options:v13 unauth:v8 cnx:v14 outError:0];
      goto LABEL_11;
    }
    if (!v8)
    {
      [(RPCompanionLinkDaemon *)self _existingProxyDeviceUpdated:v15 event:v12 isLocal:0];
      goto LABEL_11;
    }
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
LABEL_9:
  }
    LogPrintF();
LABEL_11:
}

- (void)_deliverEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7 outError:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v40 = a4;
  id v39 = a5;
  long long v37 = v14;
  id v38 = a7;
  id v15 = [(NSMutableDictionary *)self->_registeredEvents objectForKeyedSubscript:v14];
  id v16 = [v15 handler];
  if (v16)
  {
    if (!v10
      || ([v15 options], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0)
      && (NSUInteger v18 = (void *)v17,
          unsigned int v19 = [(RPCompanionLinkDaemon *)self _allowMessageForRegistrationOptions:v17 cnx:v38], v18, v19))
    {
      ((void (**)(void, id, id))v16)[2](v16, v40, v39);
    }
  }
  CFStringGetTypeID();
  uint64_t v20 = CFDictionaryGetTypedValue();
  id v21 = (void *)v20;
  if (v20) {
    BOOL v22 = !v10;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    if (!a8) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  if (!v20)
  {
    unsigned int v34 = 0;
    long long v35 = v16;
    long long v36 = v15;
    id v25 = 0;
    goto LABEL_15;
  }
  id v23 = [(NSMutableDictionary *)self->_homeHubDevices objectForKeyedSubscript:v20];
  if (v23)
  {
    uint64_t v24 = v23;
    unsigned int v34 = v21;
    long long v35 = v16;
    long long v36 = v15;
    id v25 = [v23 launchInstanceID];

LABEL_15:
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v26 = self->_xpcConnections;
    id v27 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v32 = [v31 launchInstanceID];
          long long v33 = v32;
          if ((v25 != 0) == (v32 != 0) && (!v25 || [v32 isEqual:v25])) {
            [(RPCompanionLinkDaemon *)self _receivedEventID:v37 onXPCCnx:v31 event:v40 options:v39 unauth:v10 rpCnx:v38];
          }
        }
        id v28 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v28);
    }

    id v16 = v35;
    id v15 = v36;
    id v21 = v34;
    goto LABEL_27;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a8)
  {
LABEL_33:
    RPErrorF();
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:
}

- (void)_registerConnectionRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v16];

  if (v10)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v15 = v16;
      LogPrintF();
    }
    int v11 = objc_alloc_init(RPRequestRegistration);
    [(RPRequestRegistration *)v11 setRequestID:v16];
    [(RPRequestRegistration *)v11 setOptions:v8];
    [(RPRequestRegistration *)v11 setCnxHandler:v9];
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v11, v16, v15);
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v16];

  if (v10)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v15 = v16;
      LogPrintF();
    }
    int v11 = objc_alloc_init(RPRequestRegistration);
    [(RPRequestRegistration *)v11 setRequestID:v16];
    [(RPRequestRegistration *)v11 setOptions:v8];
    [(RPRequestRegistration *)v11 setHandler:v9];
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v11, v16, v15);
  }
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100140E48 <= 30)
  {
    if (dword_100140E48 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredRequests, "setObject:forKeyedSubscript:", 0, v4, v6);
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 xpcID:(unsigned int)a6 options:(id)a7 responseHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  NSUInteger v18 = [(RPCompanionLinkDaemon *)self _addProxyIdentifier:v15 toDictionary:a4];
  unsigned int v19 = [(NSMutableDictionary *)self->_homeHubDevices objectForKeyedSubscript:v15];
  uint64_t v20 = v19;
  if (v19 && ([(RPCompanionLinkDevice *)v19 statusFlags] & 0x20000000) != 0)
  {
    uint64_t v24 = self;
    localDeviceInfo = v20;
    goto LABEL_9;
  }
  id v21 = [(RPCompanionLinkDevice *)self->_localDeviceInfo effectiveIdentifier];
  unsigned int v22 = [v15 isEqual:v21];

  if (v22)
  {
    localDeviceInfo = self->_localDeviceInfo;
    uint64_t v24 = self;
LABEL_9:
    [(RPCompanionLinkDaemon *)v24 _proxyDevice:localDeviceInfo loopbackRequestID:v14 request:v18 options:v16 responseHandler:v17];
    goto LABEL_10;
  }
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100035E6C;
  v27[3] = &unk_100122110;
  uint64_t v32 = &v34;
  id v28 = v14;
  id v29 = v18;
  unsigned int v33 = a6;
  id v30 = v16;
  id v25 = v17;
  id v31 = v25;
  [(RPCompanionLinkDaemon *)self _forEachMatchingDestinationID:v15 handler:v27];

  if (!*((unsigned char *)v35 + 24))
  {
    uint64_t v26 = RPErrorF();
    (*((void (**)(id, void, void, void *))v25 + 2))(v25, 0, 0, v26);
  }
  _Block_object_dispose(&v34, 8);
LABEL_10:
}

- (BOOL)_receivedRequestID:(id)a3 onXPCCnx:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 unauth:(BOOL)a8 rpCnx:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if ((([v15 isEqualToString:@"_streamStart"] & 1) != 0
     || [v15 isEqualToString:@"_streamStop"])
    && ![(RPCompanionLinkDaemon *)self _allowStreamRequest:v17 xpcCnx:v16 rpCnx:v20])
  {
    BOOL v23 = 0;
  }
  else
  {
    id v21 = [v16 registeredRequests];
    unsigned int v22 = [v21 objectForKeyedSubscript:v15];

    if (v22
      && (!v9
       || [(RPCompanionLinkDaemon *)self _allowMessageForRegistrationOptions:v22 cnx:v20]))
    {
      [v16 receivedRequestID:v15 request:v17 options:v18 responseHandler:v19];
      BOOL v23 = 1;
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  return v23;
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 unauth:(BOOL)a7 cnx:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v37 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v14];
  uint64_t v19 = [v18 handler];
  uint64_t v36 = [v18 cnxHandler];
  if (v19 | v36
    && (!v9
     || ([v18 options], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0)
     && (id v21 = (void *)v20,
         unsigned int v22 = [(RPCompanionLinkDaemon *)self _allowMessageForRegistrationOptions:v20 cnx:v17], v21, v22)))
  {
    BOOL v23 = (void *)v36;
    if (v36) {
      (*(void (**)(uint64_t, id, id, id, id))(v36 + 16))(v36, v17, v15, v37, v16);
    }
    else {
      (*(void (**)(uint64_t, id, id, id))(v19 + 16))(v19, v15, v37, v16);
    }
  }
  else
  {
    CFStringGetTypeID();
    uint64_t v24 = CFDictionaryGetTypedValue();
    id v25 = (void *)v24;
    if (v24) {
      BOOL v26 = !v9;
    }
    else {
      BOOL v26 = 1;
    }
    if (v26)
    {
      if (v24)
      {
        if (![(RPCompanionLinkDaemon *)self _proxyDevice:v24 receivedRequestID:v14 request:v15 options:v37 responseHandler:v16 cnx:v17])
        {
          id v27 = RPErrorF();
          (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0, 0, v27);
        }
      }
      else
      {
        uint64_t v34 = v19;
        long long v35 = v18;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v28 = self->_xpcConnections;
        id v29 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v39;
          while (2)
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v39 != v31) {
                objc_enumerationMutation(v28);
              }
              if ([(RPCompanionLinkDaemon *)self _receivedRequestID:v14 onXPCCnx:*(void *)(*((void *)&v38 + 1) + 8 * i) request:v15 options:v37 responseHandler:v16 unauth:v9 rpCnx:v17])
              {

                goto LABEL_25;
              }
            }
            id v30 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        unsigned int v33 = RPErrorF();
        (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0, 0, v33);

LABEL_25:
        uint64_t v19 = v34;
        id v18 = v35;
        id v25 = 0;
      }
    }
    else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    BOOL v23 = (void *)v36;
  }
}

- (BOOL)_allowMessageForRegistrationOptions:(id)a3 cnx:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v9 = v6
    && (unint64_t v8 = (unint64_t)[v6 statusFlags] & 0x70000AF000) != 0
    && (CFDictionaryGetInt64() & v8) != 0
    || CFDictionaryGetInt64() != 0;

  return v9;
}

- (BOOL)_allowStreamRequest:(id)a3 xpcCnx:(id)a4 rpCnx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v8 client];
  int v11 = [v10 destinationDevice];

  id v12 = [v9 peerDeviceInfo];

  id v13 = [v12 identifier];
  if (v13)
  {
    id v14 = [v11 identifier];
    id v15 = v13;
    id v16 = v14;
    id v17 = v16;
    if (v15 == v16) {
      goto LABEL_26;
    }
    if (v16)
    {
      unsigned __int8 v18 = [v15 isEqual:v16];

      if (v18) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    uint64_t v19 = [v11 idsDeviceIdentifier];
    id v15 = v15;
    id v20 = v19;
    if (v15 == v20) {
      goto LABEL_25;
    }
    id v21 = v20;
    if (v20)
    {
      unsigned __int8 v22 = [v15 isEqual:v20];

      if (v22) {
        goto LABEL_28;
      }
    }
    else
    {
    }
  }
  BOOL v23 = [v12 idsDeviceIdentifier];

  if (!v23)
  {
    id v27 = 0;
    goto LABEL_18;
  }
  uint64_t v24 = [v11 identifier];
  id v15 = v23;
  id v25 = v24;
  id v17 = v25;
  if (v15 == v25)
  {
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  if (v25)
  {
    unsigned __int8 v26 = [v15 isEqual:v25];

    if (v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  id v29 = [v11 idsDeviceIdentifier];
  id v27 = v15;
  id v30 = v29;
  if (v27 == v30)
  {
    id v15 = v27;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v31 = v30;
  if (!v30)
  {
    unsigned __int8 v28 = 0;
    id v15 = v27;
    goto LABEL_36;
  }
  unsigned __int8 v32 = [v27 isEqual:v30];

  if (v32)
  {
    id v15 = v27;
LABEL_28:
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      unsigned __int8 v28 = 0;
LABEL_37:

      id v27 = v15;
      goto LABEL_38;
    }
    id v27 = [v8 client];
    unsigned int v33 = [v27 serviceType];
    id v17 = v17;
    id v34 = v33;
    long long v35 = v34;
    if (v17 == v34)
    {
      unsigned __int8 v28 = 1;
    }
    else if (v34)
    {
      unsigned __int8 v28 = [v17 isEqual:v34];
    }
    else
    {
      unsigned __int8 v28 = 0;
    }

LABEL_36:
    goto LABEL_37;
  }
LABEL_18:
  unsigned __int8 v28 = 0;
LABEL_38:

  return v28;
}

- (void)_proxyDeviceListUpdated:(id)a3 content:(id)a4 options:(id)a5 cnx:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v32 = a5;
  id v11 = a6;
  int v39 = 0;
  objc_opt_class();
  id v12 = NSDictionaryGetNSArrayOfClass();
  if (v12)
  {
    id v27 = v10;
    id v28 = v9;
    unsigned int v30 = [v9 isEqual:@"_proxyAdd"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unsigned __int8 v26 = v12;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v36;
      uint64_t v29 = *(void *)v36;
      do
      {
        id v16 = 0;
        id v33 = v14;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v16);
          CFStringGetTypeID();
          unsigned __int8 v18 = CFDictionaryGetTypedValue();
          if (v18)
          {
            uint64_t v19 = NSDictionaryGetNSUUID();
            if (v19)
            {
              id v20 = objc_alloc_init((Class)RPCompanionLinkDevice);
              [v20 setIdentifier:v18];
              [v20 setHomeKitIdentifier:v19];
              [v20 setStatusFlags:[v20 statusFlags] | 0x10000000];
              [v20 setFlags:[v20 flags] | 0x2000];
              CFStringGetTypeID();
              id v21 = CFDictionaryGetTypedValue();
              if (v21) {
                [v20 setMediaRouteIdentifier:v21];
              }
              CFDictionaryGetTypeID();
              unsigned __int8 v22 = CFDictionaryGetTypedValue();
              if (v22) {
                [v20 setSiriInfo:v22];
              }
              CFStringGetTypeID();
              BOOL v23 = CFDictionaryGetTypedValue();
              if (v23) {
                [v20 setRoomName:v23];
              }
              [v20 setStatusFlags:((unint64_t)[v20 statusFlags] | ((unint64_t)[v11 statusFlags:(v25)] & 0x10000AE000));
              if (v30) {
                [(RPCompanionLinkDaemon *)self _proxyDeviceAdd:v20 options:v32 eventID:v28 deviceInfo:v17 cnx:v11];
              }
              else {
                [(RPCompanionLinkDaemon *)self _proxyDeviceRemove:v20 options:v32 cnx:v11];
              }

              id v14 = v33;
              uint64_t v15 = v29;
            }
            else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v25 = v17;
              LogPrintF();
            }
          }
          else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v25 = v17;
            LogPrintF();
          }

          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v24 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        id v14 = v24;
      }
      while (v24);
    }

    id v10 = v27;
    id v9 = v28;
    id v12 = v26;
  }
  else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_proxyDeviceAdd:(id)a3 options:(id)a4 eventID:(id)a5 deviceInfo:(id)a6 cnx:(id)a7
{
  id v25 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = [v13 proxyDevices];

  if (!v14)
  {
    uint64_t v15 = +[NSMutableArray array];
    [v13 setProxyDevices:v15];
  }
  id v16 = [v13 proxyDevices];
  [v16 addObject:v25];

  homeHubDevices = self->_homeHubDevices;
  if (!homeHubDevices)
  {
    unsigned __int8 v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v19 = self->_homeHubDevices;
    self->_homeHubDevices = v18;

    homeHubDevices = self->_homeHubDevices;
  }
  id v20 = [v25 identifier];
  id v21 = [(NSMutableDictionary *)homeHubDevices objectForKeyedSubscript:v20];

  if (v21)
  {
    [(RPCompanionLinkDaemon *)self _existingProxyDeviceUpdated:v11 event:v12 isLocal:0];
  }
  else
  {
    unsigned __int8 v22 = self->_homeHubDevices;
    BOOL v23 = [v25 identifier];
    [(NSMutableDictionary *)v22 setObject:v25 forKeyedSubscript:v23];

    [v25 setLinkType:[v13 linkType]];
    [v25 setStatusFlags:((unint64_t)[v25 statusFlags] | 4)];
    [(RPCompanionLinkDaemon *)self _clientReportFoundDevice:v25];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v24 = CUDescriptionWithLevel();
      LogPrintF();
    }
  }
}

- (void)_proxyDeviceRemove:(id)a3 options:(id)a4 cnx:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v8 proxyDevices];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
      if ([(RPCompanionLinkDaemon *)self _proxyDevice:v14 isEqualTo:v7]) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v14;

    if (!v15) {
      goto LABEL_15;
    }
    if (([v15 statusFlags] & 0x20000000) != 0)
    {
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      [v15 setStatusFlags:((unint64_t)[v15 statusFlags] & 0xFFFFFFFFEFFFFFFFLL)];
      [(RPCompanionLinkDaemon *)self _clientReportLostDevice:v15];
      id v16 = [v8 proxyDevices];
      [v16 removeObject:v15];

      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v19 = CUDescriptionWithLevel();
        LogPrintF();
      }
      homeHubDevices = self->_homeHubDevices;
      unsigned __int8 v18 = [v7 identifier:v19];
      [(NSMutableDictionary *)homeHubDevices setObject:0 forKeyedSubscript:v18];
    }
  }
  else
  {
LABEL_9:

LABEL_15:
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v15 = 0;
  }
}

- (BOOL)_proxyDevice:(id)a3 receivedRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 cnx:(id)a8
{
  id v14 = a3;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v15 = [(NSMutableDictionary *)self->_homeHubDevices objectForKeyedSubscript:v14];
  if (v15)
  {
    if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v27 = v34;
      id v28 = v14;
      LogPrintF();
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = self->_xpcConnections;
    id v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v17)
    {
      id v18 = v17;
      id v29 = v14;
      uint64_t v19 = *(void *)v36;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v22 = [v21 launchInstanceID:v27, v28];
          if (v22)
          {
            long long v23 = [v15 launchInstanceID];
            unsigned int v24 = [v22 isEqual:v23];

            if (v24)
            {
              id v27 = v30;
              if (-[RPCompanionLinkDaemon _receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:](self, "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:", v34, v21, v33, v32, v31, 0))
              {

                BOOL v25 = 1;
                goto LABEL_21;
              }
            }
          }
        }
        id v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      BOOL v25 = 0;
LABEL_21:
      id v14 = v29;
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_proxyDevice:(id)a3 isEqualTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 homeKitIdentifier];
  id v8 = [v6 homeKitIdentifier];
  if ([v7 isEqual:v8])
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    id v10 = [v5 identifier];
    id v11 = [v6 identifier];
    unsigned __int8 v9 = [v10 isEqual:v11];
  }
  return v9;
}

- (BOOL)_destinationID:(id)a3 matchesProxyDeviceOnCnx:(id)a4
{
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a4 proxyDevices];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        unsigned __int8 v11 = [v10 isEqual:v5];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)_addProxyIdentifier:(id)a3 toDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_homeHubDevices objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = [v7 mutableCopy];
    [v9 setObject:v6 forKeyedSubscript:@"proxyID"];

    id v7 = v9;
  }

  return v7;
}

- (void)_sendProxyDeviceUpdateToPeer:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_homeHubDevices allKeys];
  id v6 = [v5 count];

  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(NSMutableDictionary *)self->_homeHubDevices allValues];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v8)
    {
      id v10 = v7;
      goto LABEL_18;
    }
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v13 statusFlags] & 0x20000000) != 0)
        {
          long long v14 = [(RPCompanionLinkDaemon *)self _eventForHomeHubDevice:v13];
          if (v14)
          {
            if (!v10)
            {
              id v10 = +[NSMutableArray array];
            }
            [v10 addObject:v14];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);

    if (v10)
    {
      long long v15 = +[NSDictionary dictionaryWithObjectsAndKeys:v10, @"_proxyDevs", 0];
      [(RPCompanionLinkDaemon *)self sendEventID:@"_proxyAdd" event:v15 destinationID:v4 options:0 completion:&stru_100122130];

LABEL_18:
    }
  }
}

- (void)_proxyLocalDeviceUpdateOnConnection:(id)a3 launchInstanceID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(RPCompanionLinkDaemon *)self homeHubDeviceForLaunchInstanceID:v6];
  id v8 = v7;
  if (v7)
  {
    if (([v7 changed] & 1) != 0
      || ([v11 localDeviceUpdated] & 1) == 0)
    {
      id v9 = [v11 xpcCnx];
      id v10 = [v9 remoteObjectProxy];
      [v10 companionLinkLocalDeviceUpdated:v8];

      if (([v11 localDeviceUpdated] & 1) == 0)
      {
        [v11 reportFoundDevice:self->_localDeviceInfo outReason:0];
        [v11 setLocalDeviceUpdated:1];
      }
      [v8 setChanged:0];
    }
  }
  else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)homeHubDeviceForLaunchInstanceID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_homeHubDevices allValues];
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
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 launchInstanceID];
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

- (void)_existingProxyDeviceUpdated:(id)a3 event:(id)a4 isLocal:(BOOL)a5
{
  BOOL v5 = a5;
  id v30 = a3;
  id v8 = a4;
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_homeHubDevices objectForKeyedSubscript:v9];
    if (!v10)
    {
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_44;
    }
    CFDictionaryGetTypeID();
    unsigned __int8 v11 = CFDictionaryGetTypedValue();
    BOOL v29 = v5;
    if (v11)
    {
      id v12 = [v10 siriInfo];
      id v13 = v11;
      long long v14 = v13;
      if (v12 == v13)
      {
      }
      else
      {
        if (!v12)
        {

          goto LABEL_19;
        }
        unsigned __int8 v15 = [v12 isEqual:v13];

        if ((v15 & 1) == 0)
        {
LABEL_19:
          if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            BOOL v25 = [v10 identifier];
            LogPrintF();
          }
          [v10 setSiriInfo:v14, v25];
          int v16 = 1;
LABEL_26:
          CFStringGetTypeID();
          long long v17 = CFDictionaryGetTypedValue();
          if (v17)
          {
            long long v18 = [v10 roomName];
            unsigned __int8 v19 = [v17 isEqual:v18];

            if ((v19 & 1) == 0)
            {
              if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
              {
                long long v20 = [v10 identifier];
                unsigned __int8 v26 = [v10 roomName];
                id v28 = v17;
                BOOL v25 = v20;
                LogPrintF();
              }
              [v10 setRoomName:v17 v25 v26 v28];
              int v16 = 1;
            }
          }
          CFStringGetTypeID();
          long long v21 = CFDictionaryGetTypedValue();
          if (v21
            && ([v10 mediaRouteIdentifier],
                long long v22 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v23 = [v21 isEqual:v22],
                v22,
                (v23 & 1) == 0))
          {
            if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
            {
              unsigned int v24 = [v10 identifier];
              id v27 = [v10 mediaRouteIdentifier];
              LogPrintF();

              [v10 setMediaRouteIdentifier:v21, v24, v27, v21];
            }
            else
            {
              [v10 setMediaRouteIdentifier:v21, v25, v26, v28];
            }
          }
          else if ((v16 | v29) != 1)
          {
            goto LABEL_43;
          }
          [(RPCompanionLinkDaemon *)self _clientReportChangedDevice:v10 changes:2];
LABEL_43:

LABEL_44:
          goto LABEL_45;
        }
      }
    }
    int v16 = 0;
    goto LABEL_26;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_45:
}

- (void)_createRequestEntryForXid:(id)a3 requestID:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  long long v14 = objc_alloc_init(RPRequestEntry);
  [(RPRequestEntry *)v14 setOptions:v11];
  [(RPRequestEntry *)v14 setRequestID:v13];

  [(RPRequestEntry *)v14 setResponseHandler:v12];
  [(RPRequestEntry *)v14 setSendTicks:mach_absolute_time()];
  [(NSMutableDictionary *)self->_loopbackRequests setObject:v14 forKeyedSubscript:v10];
  if (v11)
  {
    CFDictionaryGetDouble();
    if (v15 > 0.0)
    {
      int v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100038114;
      handler[3] = &unk_100121770;
      handler[4] = v16;
      void handler[5] = self;
      id v18 = v10;
      dispatch_source_set_event_handler(v16, handler);
      CUDispatchTimerSet();
      dispatch_resume(v16);
      [(RPRequestEntry *)v14 setTimer:v16];
    }
  }
}

- (void)_proxyDevice:(id)a3 loopbackRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v48 = a4;
  id v45 = a5;
  id v13 = a6;
  id v14 = a7;
  unsigned int v47 = [v12 identifier];
  if (!v47)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v36 = v48;
      LogPrintF();
    }
    long long v37 = [v12 identifier:v36];
    long long v35 = RPErrorF();
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v35);

    goto LABEL_35;
  }
  if (!self->_loopbackRequests)
  {
    double v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    loopbackRequests = self->_loopbackRequests;
    self->_loopbackRequests = v15;
  }
  unsigned int loopbackXid = self->_loopbackXid;
  if (loopbackXid + 1 > 1) {
    uint64_t v18 = loopbackXid + 1;
  }
  else {
    uint64_t v18 = 1;
  }
  self->_unsigned int loopbackXid = v18;
  uint64_t v42 = v18;
  long long v46 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  id v40 = v14;
  id v41 = v13;
  -[RPCompanionLinkDaemon _createRequestEntryForXid:requestID:options:responseHandler:](self, "_createRequestEntryForXid:requestID:options:responseHandler:");
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v38 = v42;
    int v39 = v47;
    id v36 = v48;
    LogPrintF();
  }
  v57[0] = @"dlt";
  v57[1] = @"senderID";
  v58[0] = &off_10012B090;
  v58[1] = v47;
  v57[2] = @"xid";
  v58[2] = v46;
  long long v44 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 3, v36, v38, v39);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = self->_xpcConnections;
  id v19 = [(NSMutableSet *)obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v19) {
    goto LABEL_29;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v53;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v53 != v21) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      unsigned int v24 = [v12 launchInstanceID];
      BOOL v25 = [v23 launchInstanceID];
      id v26 = v24;
      id v27 = v25;
      if (v26 == v27)
      {

LABEL_24:
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1000387B8;
        v49[3] = &unk_100122158;
        v49[4] = self;
        v49[5] = v46;
        void v49[6] = v47;
        int v51 = v42;
        id v50 = v12;
        unsigned __int8 v30 = [(RPCompanionLinkDaemon *)self _receivedRequestID:v48 onXPCCnx:v23 request:v45 options:v44 responseHandler:v49 unauth:0 rpCnx:0];

        if (v30)
        {
          id v14 = v40;
          id v13 = v41;
          id v34 = obj;
          goto LABEL_32;
        }
        continue;
      }
      id v28 = v27;
      if ((v26 == 0) == (v27 != 0))
      {

        continue;
      }
      unsigned __int8 v29 = [v26 isEqual:v27];

      if (v29) {
        goto LABEL_24;
      }
    }
    id v20 = [(NSMutableSet *)obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  }
  while (v20);
LABEL_29:

  id v34 = [(NSMutableDictionary *)self->_loopbackRequests objectForKeyedSubscript:v46];
  [(NSMutableDictionary *)self->_loopbackRequests setObject:0 forKeyedSubscript:v46];
  id v31 = [v34 timer];
  [v34 setTimer:0];
  if (v31) {
    dispatch_source_cancel(v31);
  }
  id v32 = [v34 responseHandler];
  id v33 = RPErrorF();
  ((void (**)(void, void, void, void *))v32)[2](v32, 0, 0, v33);

  id v14 = v40;
  id v13 = v41;
LABEL_32:

LABEL_35:
}

- (id)_checkForProxyOrLocalDestinations:(id)a3 eventID:(id)a4 event:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = (void (**)(id, id))a7;
  long long v17 = [(NSMutableDictionary *)self->_homeHubDevices objectForKeyedSubscript:v12];
  if (v17)
  {
    uint64_t v18 = [(RPCompanionLinkDaemon *)self _addProxyIdentifier:v12 toDictionary:v14];

    id v14 = (id)v18;
    if (([v17 flags] & 0x20000000) != 0) {
      goto LABEL_17;
    }
  }
  id v19 = [(RPCompanionLinkDevice *)self->_localDeviceInfo effectiveIdentifier];
  unsigned int v20 = [v12 isEqual:v19];

  if (v20)
  {
LABEL_17:
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v24 = v13;
      id v25 = v12;
      LogPrintF();
    }
    id v26 = 0;
    -[RPCompanionLinkDaemon _deliverEventID:event:options:unauth:cnx:outError:](self, "_deliverEventID:event:options:unauth:cnx:outError:", v13, v14, v15, 0, 0, &v26, v24, v25);
    id v22 = v26;
    if (v16) {
      v16[2](v16, v22);
    }

    uint64_t v21 = 0;
  }
  else
  {
    id v14 = v14;
    uint64_t v21 = v14;
  }

  return v21;
}

- (void)sessionStartSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 destinationID:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v37 = a7;
  uint64_t v38 = self;
  unsigned int sessionIDLast = self->_sessionIDLast;
  BOOL v15 = __CFADD__(sessionIDLast, 1);
  unsigned int v16 = sessionIDLast + 1;
  unsigned int v17 = sessionIDLast + 2;
  if (v15) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v16;
  }
  self->_unsigned int sessionIDLast = v18;
  id v36 = v12;
  uint64_t v19 = [v12 serviceType];
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    [v11 label];
    long long v35 = v34 = v18;
    uint64_t v32 = v19;
    id v33 = v13;
    LogPrintF();
  }
  unsigned int v20 = [v11 btPipeHighPriority:v32, v33, v34, v35];
  BOOL v21 = [v20 state] == 1;

  v50[0] = v19;
  v49[0] = @"_srvT";
  v49[1] = @"_sid";
  id v22 = +[NSNumber numberWithUnsignedLongLong:v18];
  v50[1] = v22;
  v49[2] = @"_btHP";
  unsigned __int8 v23 = +[NSNumber numberWithBool:v21];
  v50[2] = v23;
  id v24 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];

  v48[0] = &off_10012B0A8;
  v47[0] = @"timeoutSeconds";
  v47[1] = @"highPriority";
  id v25 = +[NSNumber numberWithBool:v21];
  v48[1] = v25;
  id v26 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100038F58;
  v40[3] = &unk_100122180;
  id v27 = (void *)v19;
  v40[4] = v19;
  id v41 = v13;
  id v42 = v36;
  id v43 = v11;
  id v45 = v37;
  uint64_t v46 = v18;
  long long v44 = v38;
  id v28 = v11;
  id v29 = v36;
  id v30 = v37;
  id v31 = v13;
  [v28 sendEncryptedRequestID:@"_sessionStart" request:v24 xpcID:a5 options:v26 responseHandler:v40];
}

- (void)sessionStopSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 completion:(id)a6
{
  id v9 = a3;
  id v25 = a6;
  id v10 = a4;
  id v11 = [v10 sessionID];
  id v26 = +[NSNumber numberWithUnsignedLongLong:v11];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeSessions, "setObject:forKeyedSubscript:", 0);
  id v12 = [v9 peerIdentifier];
  id v13 = [v10 serviceType];

  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    unsigned __int8 v23 = v12;
    id v24 = v11;
    id v22 = v13;
    LogPrintF();
  }
  id v14 = [v9 btPipeHighPriority:v22, v23, v24];
  BOOL v15 = [v14 state] == 1;

  v33[0] = @"_sid";
  unsigned int v16 = +[NSNumber numberWithUnsignedLongLong:v11];
  v33[1] = @"_btHP";
  v34[0] = v16;
  unsigned int v17 = +[NSNumber numberWithInt:v15];
  v34[1] = v17;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

  v32[0] = &off_10012B0C0;
  v31[0] = @"timeoutSeconds";
  v31[1] = @"highPriority";
  uint64_t v19 = +[NSNumber numberWithInt:v15];
  v32[1] = v19;
  unsigned int v20 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000394BC;
  v28[3] = &unk_1001221A8;
  v28[4] = v13;
  void v28[5] = v12;
  id v29 = v25;
  id v30 = v11;
  id v21 = v25;
  [v9 sendEncryptedRequestID:@"_sessionStop" request:v18 xpcID:a5 options:v20 responseHandler:v28];
}

- (void)_sessionHandleStartRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6
{
  id v53 = a3;
  id v51 = a4;
  id v50 = a5;
  uint64_t v78 = 0;
  id v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = sub_10000F400;
  int v82 = sub_10000F410;
  id v83 = 0;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100039DD0;
  v75[3] = &unk_1001221D0;
  id v77 = &v78;
  id v49 = a6;
  id v76 = v49;
  id v48 = objc_retainBlock(v75);
  CFStringGetTypeID();
  long long v52 = CFDictionaryGetTypedValue();
  if (v52)
  {
    int v74 = 0;
    uint64_t Int64 = CFDictionaryGetInt64();
    if (Int64)
    {
      CFStringGetTypeID();
      id v11 = CFDictionaryGetTypedValue();
      if (v11)
      {
        uint64_t v68 = 0;
        id v69 = (id *)&v68;
        uint64_t v70 = 0x3032000000;
        BOOL v71 = sub_10000F400;
        int v72 = sub_10000F410;
        id v73 = 0;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v12 = self->_activeServers;
        id v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v64 objects:v88 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v65;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v65 != v14) {
                objc_enumerationMutation(v12);
              }
              unsigned int v16 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              unsigned int v17 = [v16 serviceType];
              unsigned __int8 v18 = [v17 isEqual:v11];

              if (v18)
              {
                objc_storeStrong(v69 + 5, v16);
                goto LABEL_14;
              }
            }
            id v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v64 objects:v88 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_14:

        uint64_t v19 = 0;
        uint64_t v58 = 0;
        uint64_t v59 = &v58;
        uint64_t v60 = 0x3032000000;
        uint64_t v61 = sub_10000F400;
        int v62 = sub_10000F410;
        id v63 = 0;
        if (v69[5]) {
          goto LABEL_17;
        }
        xpcMatchingMap = self->_xpcMatchingMap;
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100039EAC;
        void v57[3] = &unk_1001221F8;
        v57[4] = v11;
        v57[5] = &v58;
        v57[6] = &v68;
        [(NSMutableDictionary *)xpcMatchingMap enumerateKeysAndObjectsUsingBlock:v57];
        if (!v69[5]) {
          goto LABEL_45;
        }
        uint64_t v19 = [(id)v59[5] handler];
        if (v19)
        {
LABEL_17:
          unsigned int sessionIDLast = self->_sessionIDLast;
          BOOL v22 = __CFADD__(sessionIDLast, 1);
          unsigned int v23 = sessionIDLast + 1;
          unsigned int v24 = sessionIDLast + 2;
          if (v22) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = v23;
          }
          self->_unsigned int sessionIDLast = v25;
          uint64_t v26 = Int64 | (v25 << 32);
          id v27 = +[NSNumber numberWithUnsignedLongLong:v26];
          id v28 = objc_alloc_init((Class)RPSession);
          [v28 setPeerID:v52];
          [v28 setServiceType:v11];
          [v28 setSessionID:v26];
          [v28 setStartTicks:mach_absolute_time()];
          [v28 setCnx:v50];
          activeSessions = self->_activeSessions;
          if (!activeSessions)
          {
            id v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v31 = self->_activeSessions;
            self->_activeSessions = v30;

            activeSessions = self->_activeSessions;
          }
          [(NSMutableDictionary *)activeSessions setObject:v28 forKeyedSubscript:v27];
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v32 = (void *)v59[5];
            if (v32) {
              uint64_t v33 = (uint64_t)[v32 token];
            }
            else {
              uint64_t v33 = -1;
            }
            uint64_t v46 = v33;
            uint64_t v47 = 0;
            long long v44 = v52;
            uint64_t v45 = v26;
            id v43 = v11;
            LogPrintF();
          }
          if (v59[5] && v19)
          {
            v86[0] = @"type";
            v86[1] = @"serviceType";
            v87[0] = @"server";
            v87[1] = v11;
            v86[2] = @"sessionID";
            v86[3] = @"replyRequired";
            v87[2] = v27;
            v87[3] = &__kCFBooleanTrue;
            uint64_t v34 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:4];
            if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_100039F68;
            v54[3] = &unk_100122220;
            v54[4] = self;
            v54[5] = v27;
            v54[6] = v28;
            id v55 = v49;
            uint64_t v56 = v25;
            ((void (**)(void, void, void *, void *))v19)[2](v19, 0, v34, v54);
          }
          else
          {
            CFStringRef v84 = @"_sid";
            long long v35 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v25, v43, v44, v45, v46, v47);
            v85 = v35;
            uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];

            (*((void (**)(id, void *, void, void))v49 + 2))(v49, v34, 0, 0);
          }
        }
        else
        {
LABEL_45:
          uint64_t v41 = RPErrorF();
          id v42 = (void *)v79[5];
          v79[5] = v41;
        }
        _Block_object_dispose(&v58, 8);

        _Block_object_dispose(&v68, 8);
      }
      else
      {
        uint64_t v39 = RPErrorF();
        id v40 = (void *)v79[5];
        v79[5] = v39;
      }
    }
    else
    {
      uint64_t v38 = RPErrorF();
      id v11 = (void *)v79[5];
      v79[5] = v38;
    }
  }
  else
  {
    uint64_t v36 = RPErrorF();
    id v37 = (void *)v79[5];
    v79[5] = v36;
  }
  ((void (*)(void *))v48[2])(v48);

  _Block_object_dispose(&v78, 8);
}

- (void)_sessionHandleStopRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = sub_10000F400;
  uint64_t v41 = sub_10000F410;
  id v42 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  void v34[2] = sub_10003A520;
  v34[3] = &unk_1001221D0;
  uint64_t v36 = &v37;
  id v13 = a6;
  id v35 = v13;
  uint64_t v14 = objc_retainBlock(v34);
  CFStringGetTypeID();
  BOOL v15 = CFDictionaryGetTypedValue();
  if (!v15)
  {
    uint64_t v23 = RPErrorF();
    unsigned int v24 = (void *)v38[5];
    v38[5] = v23;

    goto LABEL_20;
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  id v33 = v11;
  if (!Int64)
  {
    uint64_t v25 = RPErrorF();
    unsigned int v17 = (void *)v38[5];
    v38[5] = v25;
    goto LABEL_19;
  }
  id v32 = v10;
  unsigned int v17 = +[NSNumber numberWithUnsignedLongLong:Int64];
  unsigned __int8 v18 = [(NSMutableDictionary *)self->_activeSessions objectForKeyedSubscript:v17];
  uint64_t v19 = v18;
  if (!v18
    || ([v18 peerID],
        unsigned int v20 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v21 = [v20 isEqual:v15],
        v20,
        (v21 & 1) == 0))
  {
    uint64_t v26 = RPErrorF();
    id v27 = (void *)v38[5];
    v38[5] = v26;

    goto LABEL_18;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    [v19 serviceType];
    id v30 = v15;
    id v28 = v31 = Int64;
    LogPrintF();
  }
  (*((void (**)(id, void *, void, void))v13 + 2))(v13, &__NSDictionary0__struct, 0, 0);
  [(NSMutableDictionary *)self->_activeSessions setObject:0 forKeyedSubscript:v17];
  [v19 setCnx:0];
  [v12 sessionStopped:v19];
  if (![v12 clientMode] || (objc_msgSend(v12, "controlFlags") & 0x200) == 0) {
    goto LABEL_17;
  }
  uint64_t v22 = [(RPCompanionLinkDaemon *)self _sessionsActiveOnConnection:v12 xpcConnection:0];
  if (v22 < 1)
  {
    [v12 invalidate];
LABEL_17:
    [v19 invalidate:v28, v30];
    goto LABEL_18;
  }
  if (dword_100140E48 > 40 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
    goto LABEL_17;
  }
  id v29 = [v12 label:v28, v30, v31];
  LogPrintF();

  [v19 invalidate:v29, v22];
LABEL_18:

  id v10 = v32;
LABEL_19:

  id v11 = v33;
LABEL_20:

  ((void (*)(void *))v14[2])(v14);
  _Block_object_dispose(&v37, 8);
}

- (void)_sessionHandlePeerDisconnect:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 peerIdentifier];
  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(NSMutableDictionary *)self->_activeSessions allKeys];
    id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v11 = [(NSMutableDictionary *)self->_activeSessions objectForKeyedSubscript:v10];
          id v12 = [v11 peerID];
          unsigned int v13 = [v12 isEqual:v5];

          if (!v13
            || ([v11 cnx], id v14 = (id)objc_claimAutoreleasedReturnValue(), v14, v14 != v4))
          {

            goto LABEL_17;
          }
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            BOOL v15 = [v11 serviceType];
            unsigned int v17 = v5;
            id v18 = [v11 sessionID];
            unsigned int v16 = v15;
            LogPrintF();
          }
          [v11 setCnx:0, v16, v17, v18];
          [(NSMutableDictionary *)self->_activeSessions setObject:0 forKeyedSubscript:v10];
          [v11 invalidate];
        }
        id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int64_t)_sessionsActiveOnConnection:(id)a3 xpcConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  xpcConnections = self->_xpcConnections;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003A9E8;
  v18[3] = &unk_100122248;
  id v9 = v7;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  long long v21 = &v22;
  [(NSMutableSet *)xpcConnections enumerateObjectsUsingBlock:v18];
  activeSessions = self->_activeSessions;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003AABC;
  v15[3] = &unk_100122270;
  id v12 = v10;
  id v16 = v12;
  unsigned int v17 = &v22;
  [(NSMutableDictionary *)activeSessions enumerateKeysAndObjectsUsingBlock:v15];
  int64_t v13 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (void)_handleContextCollectorProxyRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"ctxCollProxyReq"];
  if (v11)
  {
    id v12 = [v8 mutableCopy];
    [v12 removeObjectForKey:@"ctxCollProxyReq"];
    id v13 = [v12 copy];

    id v14 = [(RPCompanionLinkDaemon *)self _contextCollectorDevice];
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      [v14 identifier];
      id v18 = v17 = v11;
      LogPrintF();
    }
    BOOL v15 = [v14 identifier:v17 v18];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003AD60;
    v19[3] = &unk_100122298;
    id v20 = v10;
    [(RPCompanionLinkDaemon *)self sendRequestID:v11 request:v13 destinationID:v15 options:v9 responseHandler:v19];

    id v8 = v13;
  }
  else
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v16 = RPErrorF();
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v16);
  }
}

- (void)_handleContextCollectorRequest:(id)a3 responseHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void *, void, void *))a4;
  id v6 = [(RPCompanionLinkDaemon *)self _contextCollectorDevice];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 bonjourDevice];
    id v9 = [v8 deviceInfo];

    id v10 = [v7 ipAddress];
    id v11 = [v7 bonjourDevice];
    id v12 = [v11 deviceInfo];
    CFStringGetTypeID();
    id v13 = CFDictionaryGetTypedValue();

    if (v9 && v10 && v13)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v16 = v7;
        LogPrintF();
      }
      v17[0] = @"_bi";
      v17[1] = @"_dIP";
      v18[0] = v9;
      v18[1] = v10;
      v17[2] = @"_i";
      v18[2] = v13;
      BOOL v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3, v16);
      id v14 = 0;
    }
    else
    {
      id v14 = RPErrorF();
      BOOL v15 = 0;
    }
  }
  else
  {
    id v14 = RPErrorF();
    BOOL v15 = 0;
  }
  v5[2](v5, v15, 0, v14);
}

- (id)_contextCollectorDevice
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [(NSMutableDictionary *)self->_activeDevices allValues];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v7 = [v6 bonjourDevice];

        if (v7)
        {
          id v8 = [v6 bonjourDevice];
          id v9 = [v8 txtDictionary];

          if ((CFDictionaryGetInt64() & 0x800000) != 0)
          {
            id v10 = [v6 bonjourDevice];
            id v11 = [v10 deviceInfo];
            CFStringGetTypeID();
            id v12 = CFDictionaryGetTypedValue();

            if (v12)
            {
              id v3 = v6;

              goto LABEL_14;
            }
          }
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [[RPCompanionLinkXPCConnection alloc] initWithDaemon:self xpcCnx:v5];
  [(RPCompanionLinkXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  ++self->_xpcLastID;
  -[RPCompanionLinkXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  id v10 = self->_xpcClientInterface;
  if (!v10)
  {
    id v32 = objc_alloc((Class)NSSet);
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = [v32 initWithObjects:v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0];
    id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPCompanionLinkXPCClientInterface];
    [(NSXPCInterface *)v10 setClasses:v18 forSelector:"companionLinkReceivedEventID:event:options:" argumentIndex:1 ofReply:0];
    [(NSXPCInterface *)v10 setClasses:v18 forSelector:"companionLinkReceivedRequestID:request:options:responseHandler:" argumentIndex:1 ofReply:0];
    [(NSXPCInterface *)v10 setClasses:v18 forSelector:"companionLinkReceivedRequestID:request:options:responseHandler:" argumentIndex:0 ofReply:1];
    objc_storeStrong((id *)&self->_xpcClientInterface, v10);
  }
  id v19 = self->_xpcServerInterface;
  if (!v19)
  {
    id v33 = objc_alloc((Class)NSSet);
    uint64_t v31 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    id v26 = [v33 initWithObjects:v31, v20, v21, v22, v23, v24, v25, objc_opt_class(), 0];
    id v19 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPCompanionLinkXPCServerInterface];
    id v27 = objc_alloc((Class)NSSet);
    uint64_t v28 = objc_opt_class();
    id v29 = [v27 initWithObjects:v28, objc_opt_class(), 0];
    [(NSXPCInterface *)v19 setClasses:v29 forSelector:"companionLinkActivateClient:completion:" argumentIndex:0 ofReply:1];
    [(NSXPCInterface *)v19 setClasses:v26 forSelector:"companionLinkSendEventID:event:destinationID:options:nwActivityToken:completion:" argumentIndex:1 ofReply:0];
    [(NSXPCInterface *)v19 setClasses:v26 forSelector:"companionLinkSendRequestID:request:destinationID:options:nwActivityToken:responseHandler:" argumentIndex:1 ofReply:0];
    [(NSXPCInterface *)v19 setClasses:v26 forSelector:"companionLinkSendRequestID:request:destinationID:options:nwActivityToken:responseHandler:" argumentIndex:0 ofReply:1];
    objc_storeStrong((id *)&self->_xpcServerInterface, v19);
  }
  [v5 setExportedInterface:v19];
  [v5 setExportedObject:v6];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  void v34[2] = sub_10003B5F4;
  v34[3] = &unk_1001219D0;
  void v34[4] = self;
  v34[5] = v6;
  [v5 setInvalidationHandler:v34];
  [v5 setRemoteObjectInterface:v10];
  [v5 _setQueue:self->_dispatchQueue];
  [v5 resume];
  if (dword_100140E48 <= 20 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v6 connectionInvalidated];
  [(NSMutableSet *)self->_xpcConnections removeObject:v6];
  [(RPCompanionLinkDaemon *)self _updateForXPCClientChange];
  uint64_t v4 = [v6 rbsPID];

  if (v4)
  {
    id v5 = [v6 rbsPID];
    [(RPCompanionLinkDaemon *)self _removeApplicationPID:v5];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (RPCompanionLinkDevice)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (RPHomeKitManager)rpHomeKitManager
{
  return self->_rpHomeKitManager;
}

- (NSMutableSet)activeServers
{
  return self->_activeServers;
}

- (void)setActiveServers:(id)a3
{
}

- (NSMutableDictionary)activeSessions
{
  return self->_activeSessions;
}

- (void)setActiveSessions:(id)a3
{
}

- (NSDictionary)destinationIdentifierModelMap
{
  return self->_destinationIdentifierModelMap;
}

- (NSDictionary)destinationIdentifierRelMap
{
  return self->_destinationIdentifierRelMap;
}

- (NSMutableSet)rbsPIDSet
{
  return self->_rbsPIDSet;
}

- (void)setRbsPIDSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rbsPIDSet, 0);
  objc_storeStrong((id *)&self->_destinationIdentifierRelMap, 0);
  objc_storeStrong((id *)&self->_destinationIdentifierModelMap, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_activeServers, 0);
  objc_storeStrong((id *)&self->_rpHomeKitManager, 0);
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_nearfieldDaemon, 0);
  objc_storeStrong((id *)&self->_tvDeviceInfoManager, 0);
  objc_storeStrong((id *)&self->_siriDaemon, 0);
  objc_storeStrong((id *)&self->_mediaControlDaemon, 0);
  objc_storeStrong((id *)&self->_hidDaemon, 0);
  objc_storeStrong((id *)&self->_prefMeDeviceIsMeOverride, 0);
  objc_storeStrong((id *)&self->_xpcMatchingMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcServerInterface, 0);
  objc_storeStrong((id *)&self->_xpcClientInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_uniqueIDStr, 0);
  objc_storeStrong((id *)&self->_uniqueIDData, 0);
  objc_storeStrong((id *)&self->_unauthDevices, 0);
  objc_storeStrong((id *)&self->_uiNoteSession, 0);
  objc_storeStrong((id *)&self->_uiNoteDevices, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_tcpServerConnections, 0);
  objc_storeStrong((id *)&self->_tcpOnDemandClientConnections, 0);
  objc_storeStrong((id *)&self->_tcpClientConnections, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_stereoCnx, 0);
  objc_storeStrong((id *)&self->_soundBoardPrefs, 0);
  objc_storeStrong((id *)&self->_sleepWakeMonitor, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredProfileIDs, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_rbsProcessMonitor, 0);
  objc_storeStrong((id *)&self->_personalCnx, 0);
  objc_storeStrong((id *)&self->_pendingLostNeedsCLinkDevicesTimer, 0);
  objc_storeStrong((id *)&self->_pendingLostBLEDevicesTimer, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestTimer, 0);
  objc_storeStrong((id *)&self->_needsAWDLSentToPeers, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_needsAWDLNewPeers, 0);
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_loopbackRequests, 0);
  objc_storeStrong((id *)&self->_homeKitRotatingID, 0);
  objc_storeStrong((id *)&self->_homeKitManager, 0);
  objc_storeStrong((id *)&self->_homeKitLTPK, 0);
  objc_storeStrong((id *)&self->_homeKitIRK, 0);
  objc_storeStrong((id *)&self->_homeKitAuthTag, 0);
  objc_storeStrong((id *)&self->_homeHubDevices, 0);
  objc_storeStrong((id *)&self->_interestPeers, 0);
  objc_storeStrong((id *)&self->_interestEvents, 0);
  objc_storeStrong((id *)&self->_duetSyncClient, 0);
  objc_storeStrong((id *)&self->_discoveryNonceData, 0);
  objc_storeStrong((id *)&self->_screenOffDeviceFilter, 0);
  objc_storeStrong((id *)&self->_deviceAWDLRandomID, 0);
  objc_storeStrong((id *)&self->_deviceAuthTagStr, 0);
  objc_storeStrong((id *)&self->_btPipeHighPriority, 0);
  objc_storeStrong((id *)&self->_btPipeConnection, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
  objc_storeStrong((id *)&self->_btAdvAddrMonitor, 0);
  objc_storeStrong((id *)&self->_btAdvAddrStr, 0);
  objc_storeStrong((id *)&self->_btAdvAddrData, 0);
  objc_storeStrong((id *)&self->_bonjourReevaluateTimer, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserAWDLProcess, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserAWDL, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLDevices, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLAdvertiser, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleServerConnections, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkScanner, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkDevices, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkDevice, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkAdvertiserProcessName, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoV2Discovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Device, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Discovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2AdvertiserProcessName, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Advertiser, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
  objc_storeStrong((id *)&self->_bleClientConnections, 0);
  objc_storeStrong((id *)&self->_bleActionDiscovery, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2Devices, 0);
  objc_storeStrong((id *)&self->_bleDevices, 0);
  objc_storeStrong((id *)&self->_authenticatedAWDLPairingModeDevices, 0);
  objc_storeStrong((id *)&self->_airplayPrefs, 0);

  objc_storeStrong((id *)&self->_activeDevices, 0);
}

@end