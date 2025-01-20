@interface MRDAVRoutingServer
- (BOOL)_setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5;
- (BOOL)_shouldIgnorePortStatusFailureForRouteWithUID:(id)a3 previouslyCachedRouteUID:(id *)a4;
- (BOOL)airplayActive;
- (BOOL)isSilentPrimary;
- (BOOL)isStartingNowPlayingSession;
- (BOOL)outputDeviceAuthorizationSession:(id)a3 shouldRetryAuthorizationRequest:(id)a4 reason:(id)a5;
- (BOOL)routeIsActiveWithUID:(id)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5;
- (MRDAVHostedRoutingService)hostedRoutingService;
- (MRDAVRoutingDataSource)routingDataSource;
- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3;
- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3 hostedRoutingService:(id)a4 systemEndpointController:(id)a5 autoConnectionController:(id)a6 homeServer:(id)a7 avOutputDeviceAuthorizationSession:(id)a8;
- (MRDAVSystemEndpointController)systemEndpointController;
- (MRDRouteRecommendationController)recommendationController;
- (MROSTransaction)discoveryTransaction;
- (MSVSystemDialog)activeDialog;
- (MSVSystemDialog)activePasswordDialog;
- (id)_createAirPlaySecuritySettings;
- (id)_descriptionForDiscoveryMode:(unsigned int)a3;
- (id)_existingKeychainAccountForOutputDevice:(id)a3 password:(id *)a4;
- (id)_passwordDialogForRouteWithName:(id)a3 usingInputType:(int64_t)a4;
- (id)_predictGroupLeaderForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5;
- (id)_preferredIdentifierForMACAddress:(id)a3 identifier:(id)a4 name:(id)a5;
- (id)_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7;
- (id)_savedPasswordForOutputDevice:(id)a3;
- (id)applicationPickedRoutes;
- (id)clientsForApplicationPickedRoute:(id)a3;
- (id)clientsWithApplicationPickedRoutes;
- (id)createTransientEndpointForOutputDeviceUID:(id)a3 details:(id)a4;
- (id)mediaActivityManager;
- (id)pickableRoutesForCategory:(id)a3;
- (void)_clearPasswordForOutputDevice:(id)a3;
- (void)_clientInvalidatedNotification:(id)a3;
- (void)_failedToConnectToOutputDeviceNotification:(id)a3;
- (void)_handleAddVirtualOutputDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleAuthenticationFailureForRoute:(id)a3 withOptions:(unsigned int)a4;
- (void)_handleAuthorizationRequest:(id)a3;
- (void)_handleClearAllAVRoutePasswordsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleClusterErrorStatus:(int)a3 forRoute:(id)a4;
- (void)_handleCreateDirectEndpointForDevices:(id)a3 fromClient:(id)a4;
- (void)_handleCreateEndpointWithDevices:(id)a3 fromClient:(id)a4;
- (void)_handleCreateGroupWithDevices:(id)a3 fromClient:(id)a4;
- (void)_handleCreateHostedEndpointForDevices:(id)a3 fromClient:(id)a4;
- (void)_handleDismissAllBannersMessage:(id)a3 fromClient:(id)a4;
- (void)_handleErrorStatus:(int)a3 forRoute:(id)a4;
- (void)_handleGetActiveSystemEndpointUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAirPlaySecuritySettingsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAirplayStatus:(id)a3 fromClient:(id)a4;
- (void)_handleGetExternalDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetExternalScreenTypeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetHostedEndpointForDeviceUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetHostedRoutingXPCEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetOutputContextUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPickableRoutesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetRecentAVOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetRecommendRouteCandidatesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVirtualOutputDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGroupDevicesAndSendCommand:(id)a3 fromClient:(id)a4;
- (void)_handleMigrateFromEndpointToEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleMigrateFromEndpointToOutputDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleModifyOutputContextMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePauseOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePredictGroupLeader:(id)a3 fromClient:(id)a4;
- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePromptForRouteAuthorizationMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRecommendRouteCandidateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRemoveFromParentGroup:(id)a3 fromClient:(id)a4;
- (void)_handleResetOutputContextMessage:(id)a3 fromClient:(id)a4;
- (void)_handleResumeNowPlayingSession:(id)a3 fromClient:(id)a4;
- (void)_handleSearchEndpointsForOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSearchEndpointsForRoutingContextUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendCommandToEachEndpointContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendCommandToNewGroupContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetApplicationPickedRoutes:(id)a3 fromClient:(id)a4;
- (void)_handleSetNearbyDevice:(id)a3 fromClient:(id)a4;
- (void)_handleSetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPickedRouteMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetRecentAVOutputDeviceUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetRouteDiscoveryModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4;
- (void)_handleStartNowPlayingSession:(id)a3 fromClient:(id)a4;
- (void)_handleStopNowPlayingSession:(id)a3 fromClient:(id)a4;
- (void)_handleUnpickAirPlayRoutesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdateActiveSystemEndpointUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleWillStartPlayingInterruptMessage:(id)a3 fromClient:(id)a4;
- (void)_launchTVClusterSettings;
- (void)_loadMostRecentlyPicked;
- (void)_postExternalScreenDidChange;
- (void)_postRouteStatusDidChangeNotificationForRoute:(id)a3 newStatus:(int)a4;
- (void)_presentPasswordDialogForRoute:(id)a3 withOptions:(unsigned int)a4;
- (void)_reevaluateAirplayActive;
- (void)_registerNotifications;
- (void)_routingDataSourceExternalScreenDidChangeNotification:(id)a3;
- (void)_routingDataSourcePickableRoutesDidChangeNotification:(id)a3;
- (void)_routingDataSourceRouteStatusDidChangeNotification:(id)a3;
- (void)_saveMostRecentlyPicked;
- (void)_storePassword:(id)a3 forOutputDevice:(id)a4;
- (void)_storePassword:(id)a3 forRoute:(id)a4;
- (void)_unregisterNotifications;
- (void)_updateSystemRouteDiscoveryMode;
- (void)collectDiagnostic:(id)a3;
- (void)createEndpointForOutputDeviceIDs:(id)a3 details:(id)a4 completion:(id)a5;
- (void)createEndpointForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)outputDeviceAuthorizationSession:(id)a3 didProvideAuthorizationRequest:(id)a4;
- (void)pickCachedRouteWithUID:(id)a3;
- (void)postSystemEndpointDeviceChange:(id)a3 type:(int64_t)a4 originClient:(id)a5 handler:(id)a6;
- (void)removeOutputDeviceUIDsFromParentGroup:(id)a3 details:(id)a4 completion:(id)a5;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)restoreClientSystemEndpointWithType:(int64_t)a3 handler:(id)a4;
- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)setActiveDialog:(id)a3;
- (void)setActivePasswordDialog:(id)a3;
- (void)setAirplayActive:(BOOL)a3;
- (void)setDiscoveryTransaction:(id)a3;
- (void)systemEndpointController:(id)a3 activeSystemEndpointDidChangeForRequest:(id)a4 type:(int64_t)a5;
@end

@implementation MRDAVRoutingServer

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x300000000000001uLL:
      [(MRDAVRoutingServer *)self _handleSetRouteDiscoveryModeMessage:xdict fromClient:v6];
      break;
    case 0x300000000000002uLL:
      [(MRDAVRoutingServer *)self _handleGetPickableRoutesMessage:xdict fromClient:v6];
      break;
    case 0x300000000000003uLL:
      [(MRDAVRoutingServer *)self _handleSetPickedRouteMessage:xdict fromClient:v6];
      break;
    case 0x300000000000004uLL:
      [(MRDAVRoutingServer *)self _handleGetPickedRouteHasVolumeControlMessage:xdict fromClient:v6];
      break;
    case 0x300000000000005uLL:
      [(MRDAVRoutingServer *)self _handleSetPickedRouteHasVolumeControlMessage:xdict fromClient:v6];
      break;
    case 0x300000000000006uLL:
      [(MRDAVRoutingServer *)self _handleGetExternalScreenTypeMessage:xdict fromClient:v6];
      break;
    case 0x300000000000007uLL:
      [(MRDAVRoutingServer *)self _handleGetSavedAVRoutePasswordMessage:xdict fromClient:v6];
      break;
    case 0x300000000000008uLL:
      [(MRDAVRoutingServer *)self _handleSetSavedAVRoutePasswordMessage:xdict fromClient:v6];
      break;
    case 0x300000000000009uLL:
      [(MRDAVRoutingServer *)self _handleClearAllAVRoutePasswordsMessage:xdict fromClient:v6];
      break;
    case 0x30000000000000AuLL:
      [(MRDAVRoutingServer *)self _handleUnpickAirPlayRoutesMessage:xdict fromClient:v6];
      break;
    case 0x30000000000000BuLL:
      [(MRDAVRoutingServer *)self _handleSetApplicationPickedRoutes:xdict fromClient:v6];
      break;
    case 0x30000000000000CuLL:
      [(MRDAVRoutingServer *)self _handleGetAirPlaySecuritySettingsMessage:xdict fromClient:v6];
      break;
    case 0x30000000000000DuLL:
      [(MRDAVRoutingServer *)self _handleGetHostedRoutingXPCEndpointMessage:xdict fromClient:v6];
      break;
    case 0x30000000000000EuLL:
      [(MRDAVRoutingServer *)self _handleSetRecentAVOutputDeviceUIDMessage:xdict fromClient:v6];
      break;
    case 0x30000000000000FuLL:
      [(MRDAVRoutingServer *)self _handleGetRecentAVOutputDeviceUIDsMessage:xdict fromClient:v6];
      break;
    case 0x300000000000010uLL:
      [(MRDAVRoutingServer *)self _handleGetActiveSystemEndpointUIDsMessage:xdict fromClient:v6];
      break;
    case 0x300000000000011uLL:
      [(MRDAVRoutingServer *)self _handleUpdateActiveSystemEndpointUIDMessage:xdict fromClient:v6];
      break;
    case 0x300000000000013uLL:
      [(MRDAVRoutingServer *)self _handleCreateEndpointWithDevices:xdict fromClient:v6];
      break;
    case 0x300000000000014uLL:
      [(MRDAVRoutingServer *)self _handlePromptForRouteAuthorizationMessage:xdict fromClient:v6];
      break;
    case 0x300000000000015uLL:
      [(MRDAVRoutingServer *)self _handlePresentRouteAuthorizationStatusMessage:xdict fromClient:v6];
      break;
    case 0x300000000000016uLL:
      [(MRDAVRoutingServer *)self _handleGetAirplayStatus:xdict fromClient:v6];
      break;
    case 0x300000000000017uLL:
      [(MRDAVRoutingServer *)self _handleGroupDevicesAndSendCommand:xdict fromClient:v6];
      break;
    case 0x300000000000018uLL:
      [(MRDAVRoutingServer *)self _handleRemoveFromParentGroup:xdict fromClient:v6];
      break;
    case 0x300000000000019uLL:
      [(MRDAVRoutingServer *)self _handlePredictGroupLeader:xdict fromClient:v6];
      break;
    case 0x30000000000001AuLL:
      [(MRDAVRoutingServer *)self _handleSetNearbyDevice:xdict fromClient:v6];
      break;
    case 0x30000000000001CuLL:
      [(MRDAVRoutingServer *)self _handleResetOutputContextMessage:xdict fromClient:v6];
      break;
    case 0x30000000000001DuLL:
      [(MRDAVRoutingServer *)self _handleGetExternalDeviceMessage:xdict fromClient:v6];
      break;
    case 0x30000000000001EuLL:
      [(MRDAVRoutingServer *)self _handleAddVirtualOutputDeviceMessage:xdict fromClient:v6];
      break;
    case 0x30000000000001FuLL:
      [(MRDAVRoutingServer *)self _handleGetVirtualOutputDevicesMessage:xdict fromClient:v6];
      break;
    case 0x300000000000020uLL:
      [(MRDAVRoutingServer *)self _handleCreateGroupWithDevices:xdict fromClient:v6];
      break;
    case 0x300000000000021uLL:
      [(MRDAVRoutingServer *)self _handleCreateDirectEndpointForDevices:xdict fromClient:v6];
      break;
    case 0x300000000000022uLL:
      [(MRDExternalDeviceHomeServer *)self->_homeServer handleXPCMessage:xdict fromClient:v6];
      break;
    case 0x300000000000023uLL:
      [(MRDAVRoutingServer *)self _handleStartNowPlayingSession:xdict fromClient:v6];
      break;
    case 0x300000000000024uLL:
      [(MRDAVRoutingServer *)self _handleStopNowPlayingSession:xdict fromClient:v6];
      break;
    case 0x300000000000025uLL:
      [(MRDAVRoutingServer *)self _handleGetOutputContextUIDMessage:xdict fromClient:v6];
      break;
    case 0x300000000000026uLL:
      [(MRDAVRoutingServer *)self _handleMigrateFromEndpointToOutputDevicesMessage:xdict fromClient:v6];
      break;
    case 0x300000000000027uLL:
      [(MRDAVRoutingServer *)self _handleMigrateFromEndpointToEndpointMessage:xdict fromClient:v6];
      break;
    case 0x300000000000028uLL:
      [(MRDAVRoutingServer *)self _handleModifyOutputContextMessage:xdict fromClient:v6];
      break;
    case 0x300000000000029uLL:
      [(MRDAVRoutingServer *)self _handleCreateHostedEndpointForDevices:xdict fromClient:v6];
      break;
    case 0x30000000000002AuLL:
      [(MRDAVRoutingServer *)self _handleWillStartPlayingInterruptMessage:xdict fromClient:v6];
      break;
    case 0x30000000000002BuLL:
      [(MRDAVRoutingServer *)self _handleRecommendRouteCandidateMessage:xdict fromClient:v6];
      break;
    case 0x30000000000002CuLL:
      [(MRDAVRoutingServer *)self _handleGetRecommendRouteCandidatesMessage:xdict fromClient:v6];
      break;
    case 0x30000000000002DuLL:
      [(MRDAVRoutingServer *)self _handleResumeNowPlayingSession:xdict fromClient:v6];
      break;
    case 0x30000000000002EuLL:
      [(MRDAVRoutingServer *)self _handleDismissAllBannersMessage:xdict fromClient:v6];
      break;
    case 0x30000000000002FuLL:
      [(MRDAVRoutingServer *)self _handlePauseOutputDeviceUIDsMessage:xdict fromClient:v6];
      break;
    case 0x300000000000030uLL:
      [(MRDAVRoutingServer *)self _handleSearchEndpointsForOutputDeviceUIDsMessage:xdict fromClient:v6];
      break;
    case 0x300000000000031uLL:
      [(MRDAVRoutingServer *)self _handleSendCommandToEachEndpointContainingOutputDeviceUIDsMessage:xdict fromClient:v6];
      break;
    case 0x300000000000032uLL:
      [(MRDAVRoutingServer *)self _handleSendCommandToNewGroupContainingOutputDeviceUIDsMessage:xdict fromClient:v6];
      break;
    case 0x300000000000033uLL:
      [(MRDAVRoutingServer *)self _handleSearchEndpointsForRoutingContextUIDMessage:xdict fromClient:v6];
      break;
    default:
      break;
  }
}

- (void)_handleGetExternalScreenTypeMessage:(id)a3 fromClient:(id)a4
{
  routingDataSource = self->_routingDataSource;
  id v5 = a3;
  sub_10001432C(v5, (uint64_t)"MRXPC_ROUTE_EXTERNAL_SCREEN_TYPE_KEY", 1, [(MRDAVRoutingDataSource *)routingDataSource externalScreenType], 0);
}

- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MRDAVHostedRoutingService);
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 supportSystemEndpoints];

  if (v7)
  {
    v8 = [MRDAVSystemEndpointController alloc];
    v9 = [(MRDAVHostedRoutingService *)v5 hostedRoutingController];
    v10 = [(MRDAVSystemEndpointController *)v8 initWithRoutingController:v9];
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_alloc_init(MRDExternalDeviceHomeServer);
  v12 = [(objc_class *)off_100477888() sharedAuthorizationSession];
  v13 = +[MRDAutoConnectionController sharedConnectionController];
  v14 = [(MRDAVRoutingServer *)self initWithRoutingDataSource:v4 hostedRoutingService:v5 systemEndpointController:v10 autoConnectionController:v13 homeServer:v11 avOutputDeviceAuthorizationSession:v12];

  return v14;
}

- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3 hostedRoutingService:(id)a4 systemEndpointController:(id)a5 autoConnectionController:(id)a6 homeServer:(id)a7 avOutputDeviceAuthorizationSession:(id)a8
{
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v66.receiver = self;
  v66.super_class = (Class)MRDAVRoutingServer;
  v18 = [(MRDAVRoutingServer *)&v66 init];
  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.mediaremote.routingServer.workerQueue", v19);
    workerQueue = v18->_workerQueue;
    v18->_workerQueue = (OS_dispatch_queue *)v20;

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100131680;
    v64[3] = &unk_10041DF80;
    v22 = v18;
    v65 = v22;
    +[MRAVLightweightReconnaissanceSession setSearchEndpointsForOutputDeviceUIDImplementation:v64];
    +[MRAVOutputContextModification setModifyOutputContextImplementation:&stru_10041DFC0];
    objc_storeStrong((id *)&v22->_routingDataSource, a3);
    objc_storeStrong((id *)&v22->_hostedRoutingService, a4);
    objc_storeStrong((id *)&v22->_systemEndpointController, a5);
    [(MRDAVSystemEndpointController *)v22->_systemEndpointController setDelegate:v22];
    objc_storeStrong((id *)&v22->_autoConnectionController, a6);
    objc_storeStrong((id *)&v22->_homeServer, a7);
    v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    routeUIDsToIgnorePortStatusFailures = v22->_routeUIDsToIgnorePortStatusFailures;
    v22->_routeUIDsToIgnorePortStatusFailures = v23;

    v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    reconnaissanceSessions = v22->_reconnaissanceSessions;
    v22->_reconnaissanceSessions = v25;

    v27 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mostRecentlyPickedDevices = v22->_mostRecentlyPickedDevices;
    v22->_mostRecentlyPickedDevices = v27;

    v22->_mostRecentStatus = -1;
    v29 = objc_alloc_init(MRDRoutingContinuityManager);
    routingContinuityManager = v22->_routingContinuityManager;
    v22->_routingContinuityManager = v29;

    v31 = +[MRUserSettings currentSettings];
    unsigned int v32 = [v31 supportMultiplayerHost];

    if (v32)
    {
      v33 = objc_alloc_init(MRDIdleTopologySimplifier);
      topologySimplifier = v22->_topologySimplifier;
      v22->_topologySimplifier = v33;

      v35 = objc_alloc_init(MRDAVLocalDeviceCommitManager);
      localDeviceCommitManager = v22->_localDeviceCommitManager;
      v22->_localDeviceCommitManager = v35;

      v37 = objc_alloc_init(MRDNowPlayingAirPlaySessionController);
      nowPlayingAirPlaySessionController = v22->_nowPlayingAirPlaySessionController;
      v22->_nowPlayingAirPlaySessionController = v37;
    }
    v39 = +[MRUserSettings currentSettings];
    unsigned int v40 = [v39 useProactivePFSQSender];

    if (v40)
    {
      v41 = objc_alloc_init(MRDProactivePrepareForSetQueueSender);
      proactivePrepareForSetQueueSender = v22->_proactivePrepareForSetQueueSender;
      v22->_proactivePrepareForSetQueueSender = v41;
    }
    v43 = +[MRUserSettings currentSettings];
    unsigned int v44 = [v43 supportRouteRecommendations];

    if (v44)
    {
      v45 = objc_alloc_init(MRDRouteRecommendationController);
      recommendationController = v22->_recommendationController;
      v22->_recommendationController = v45;
    }
    v47 = +[MRUserSettings currentSettings];
    unsigned int v48 = [v47 showBluePill];

    if (v48)
    {
      v49 = objc_alloc_init(MRDRoutedBackgroundActivityManager);
      routedBackgroundActivityManager = v22->_routedBackgroundActivityManager;
      v22->_routedBackgroundActivityManager = v49;

      v51 = [(MRDRouteRecommendationController *)v22->_recommendationController focusMonitor];
      [(MRDRoutedBackgroundActivityManager *)v22->_routedBackgroundActivityManager setFocusMonitor:v51];

      [(MRDRouteRecommendationController *)v22->_recommendationController setRoutedBackgroundActivityManager:v22->_routedBackgroundActivityManager];
    }
    v52 = +[MRUserSettings currentSettings];
    unsigned int v53 = [v52 donateActiveRoutesToBiome];

    if (v53)
    {
      v54 = objc_alloc_init(MRDActiveMediaRouteBiomeDonor);
      activeMediaRouteDonor = v22->_activeMediaRouteDonor;
      v22->_activeMediaRouteDonor = v54;
    }
    [v17 setDelegate:v22];
    uint64_t v56 = +[MRDPreemptiveRemoteControlConnectionManager sharedManager];
    preemptiveRemoteControlConnectionManager = v22->_preemptiveRemoteControlConnectionManager;
    v22->_preemptiveRemoteControlConnectionManager = (MRDPreemptiveRemoteControlConnectionManager *)v56;

    [(MRDAVRoutingServer *)v22 _registerNotifications];
    [(MRDAVRoutingServer *)v22 _loadMostRecentlyPicked];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100131744;
    block[3] = &unk_100415CC8;
    v63 = v22;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v18;
}

- (void)dealloc
{
  v3 = [(objc_class *)off_100477888() sharedAuthorizationSession];
  [v3 setDelegate:0];
  [(MRDAVRoutingServer *)self _unregisterNotifications];

  v4.receiver = self;
  v4.super_class = (Class)MRDAVRoutingServer;
  [(MRDAVRoutingServer *)&v4 dealloc];
}

- (void)setAirplayActive:(BOOL)a3
{
  if (self->_airplayActive != a3)
  {
    self->_airplayActive = a3;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"MRDRoutingServerAirplayActiveDidChange" object:self];
  }
}

- (BOOL)isSilentPrimary
{
  v2 = +[MRSharedSettings currentSettings];
  unsigned __int8 v3 = [v2 supportNowPlayingSessionDataSource];

  if (v3)
  {
    id v4 = +[MRUserSettings currentSettings];
    unsigned __int8 v5 = [v4 supportMultiplayerHost];

    if (v5)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      unsigned int v7 = +[MRAVOutputContext sharedAudioPresentationContext];
      unsigned int v6 = [v7 containsLocalDevice] ^ 1;
    }
    return v6;
  }
  else
  {
    return _MRMediaRemoteGetLocalIsProxyGroupPlayer();
  }
}

- (BOOL)isStartingNowPlayingSession
{
  return [(MRDNowPlayingAirPlaySessionController *)self->_nowPlayingAirPlaySessionController isStartingNowPlayingSession];
}

- (id)pickableRoutesForCategory:(id)a3
{
  unsigned __int8 v3 = [(MRDAVRoutingDataSource *)self->_routingDataSource pickableRoutesForCategory:a3];
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionary", (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[MRDAVRoute alloc] initWithDictionary:v9];

  LOBYTE(v5) = [(MRDAVRoutingServer *)self _setPickedRoute:v10 withPassword:v8 options:v5];
  return v5;
}

- (void)pickCachedRouteWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Route change requested for AV server's cached routes with UID %{public}@", buf, 0xCu);
  }

  [(MRDAVRoutingDataSource *)self->_routingDataSource pickedRoutes];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "uniqueIdentifier", (void)v21);
        unsigned __int8 v12 = [v11 hasPrefix:v4];

        if (v12)
        {
          id v15 = v6;
          goto LABEL_27;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v13 = [(MRDAVRoutingDataSource *)self->_routingDataSource pickableRoutesForCategory:0];
  id v14 = v4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v25 objects:buf count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        if (objc_msgSend(v19, "matchesUniqueIdentifier:", v14, (void)v21))
        {
          id v16 = v19;
          goto LABEL_22;
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:buf count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  if (v16)
  {
    dispatch_queue_t v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Switching to route with UID %{public}@", buf, 0xCu);
    }

    [(MRDAVRoutingServer *)self _setPickedRoute:v16 withPassword:0 options:0];
  }

LABEL_27:
}

- (BOOL)routeIsActiveWithUID:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v4 = a3;
  uint64_t v5 = [(MRDAVRoutingDataSource *)routingDataSource pickedRoute];
  id v6 = [v5 uniqueIdentifier];
  unsigned __int8 v7 = [v6 hasPrefix:v4];

  return v7;
}

- (id)applicationPickedRoutes
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  unsigned __int8 v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 allClients];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
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
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "applicationPickedRoutes", (void)v13);
        [v2 addObjectsFromArray:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [v2 allObjects];

  return v11;
}

- (id)clientsForApplicationPickedRoute:(id)a3
{
  id v3 = a3;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 allClients];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = [v7 applicationPickedRoutes];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) uniqueIdentifier];
              long long v15 = [v3 uniqueIdentifier];
              unsigned int v16 = [v14 isEqual:v15];

              if (v16)
              {
                [v19 addObject:v7];
                goto LABEL_16;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  return v19;
}

- (id)clientsWithApplicationPickedRoutes
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 allClients];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "applicationPickedRoutes", (void)v16);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          long long v13 = [v10 applicationPickedRoutes];
          id v14 = [v13 count];

          if (v14) {
            [v2 addObject:v10];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v2;
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  id v6 = a4;
  if ([a3 isEntitledFor:0x10000])
  {
    [(MRDAVRoutingServer *)self restoreClientSystemEndpointWithType:0 handler:v6];
    [(MRDAVRoutingServer *)self restoreClientSystemEndpointWithType:1 handler:v6];
    [(MRDAVRoutingServer *)self restoreClientSystemEndpointWithType:2 handler:v6];
    [(MRDAVRoutingServer *)self restoreClientSystemEndpointWithType:3 handler:v6];
  }
}

- (void)restoreClientSystemEndpointWithType:(int64_t)a3 handler:(id)a4
{
  systemEndpointController = self->_systemEndpointController;
  if (systemEndpointController)
  {
    id v7 = a4;
    id v9 = [(MRDAVSystemEndpointController *)systemEndpointController activeOutputDeviceUID:a3];
    id v8 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v9 reason:@"Restore"];
    [v8 setChangeType:0];
    [(MRDAVRoutingServer *)self postSystemEndpointDeviceChange:v8 type:a3 originClient:0 handler:v7];
  }
}

- (id)mediaActivityManager
{
  mediaActivityManager = self->_mediaActivityManager;
  if (!mediaActivityManager)
  {
    id v4 = objc_alloc_init(MRDMediaActivityManager);
    id v5 = self->_mediaActivityManager;
    self->_mediaActivityManager = v4;

    mediaActivityManager = self->_mediaActivityManager;
  }

  return mediaActivityManager;
}

- (void)collectDiagnostic:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v5 = a3;
  objc_msgSend(v5, "setSystemDiscoveryMode:", -[MRDAVRoutingDataSource discoveryMode](routingDataSource, "discoveryMode"));
  id v6 = (void *)MRMediaRemoteCopyDeviceUID();
  [v5 setLocalReceiverPairingIdentity:v6];

  id v11 = [(MRDAVRoutingServer *)self _createAirPlaySecuritySettings];
  [v5 setAirplaySecuritySettings:v11];
  id v7 = [(MRDAVSystemEndpointController *)self->_systemEndpointController systemEndpointInfo];
  [v5 setSystemActiveEndpoints:v7];

  id v8 = [(MRDAVSystemEndpointController *)self->_systemEndpointController recentlyDismissedRecommendationsInfo];
  [v5 setRecentlyDismissedSystemEndpoints:v8];

  id v9 = [(MRDAutoConnectionController *)self->_autoConnectionController autoConnectingEndpoints];
  [v5 setAutoConnectingEndpoints:v9];

  id v10 = [(MRDAutoConnectionController *)self->_autoConnectionController autoConnectedEndpoints];
  [v5 setAutoConnectedEndpoints:v10];

  [v5 setAutomaticRemoteControlConnections:self->_preemptiveRemoteControlConnectionManager];
  [(MRDAVHostedRoutingService *)self->_hostedRoutingService collectDiagnostic:v5];
}

- (void)outputDeviceAuthorizationSession:(id)a3 didProvideAuthorizationRequest:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (unint64_t)[v5 status];
  if (v6 > 5) {
    id v7 = 0;
  }
  else {
    id v7 = off_10041E588[v6];
  }
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v44 = v5;
    __int16 v45 = 2114;
    v46 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Received output device authorization request: %{public}@ (status = %{public}@)", buf, 0x16u);
  }

  id v9 = [v5 outputDevice];
  id v10 = [v9 name];
  id v11 = [[MRDAVOutputDeviceRoute alloc] initWithAVOutputDevice:v9];
  [(MRDAVRoutingServer *)self _postRouteStatusDidChangeNotificationForRoute:v11 newStatus:1];

  uint64_t v12 = [(MRDAVRoutingServer *)self _savedPasswordForOutputDevice:v9];
  if (v12)
  {
    long long v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 name];
      *(_DWORD *)buf = 138543618;
      id v44 = v14;
      __int16 v45 = 2112;
      v46 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Authorization request using saved password for %{public}@: %@", buf, 0x16u);
    }
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100132C1C;
    v39[3] = &unk_100415A80;
    unsigned int v40 = v9;
    v41 = v12;
    v42 = self;
    id v15 = v9;
    [v5 respondWithAuthorizationToken:v41 completionHandler:v39];

    id v16 = v40;
  }
  else
  {
    id v15 = [v5 authorizationTokenType];
    long long v17 = off_100477890();
    unsigned int v18 = [v15 isEqualToString:v17];

    uint64_t v19 = 3;
    if (!v18) {
      uint64_t v19 = 1;
    }
    uint64_t v28 = v19;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100132C80;
    v36[3] = &unk_1004158D8;
    id v20 = v10;
    id v37 = v20;
    long long v29 = v10;
    id v21 = v5;
    id v38 = v21;
    long long v22 = objc_retainBlock(v36);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100132D40;
    v30[3] = &unk_10041E038;
    id v31 = v9;
    id v32 = v21;
    id v33 = v20;
    v34 = self;
    id v35 = v22;
    id v16 = v9;
    long long v23 = v22;
    long long v24 = objc_retainBlock(v30);
    long long v25 = [MRDRouteAuthorizationRequest alloc];
    long long v26 = [[MRDAVOutputDeviceRoute alloc] initWithAVOutputDevice:v16];
    long long v27 = [(MRDRouteAuthorizationRequest *)v25 initWithRoute:v26 inputType:v28 responseCallback:v24 cancelCallback:v23];

    [(MRDAVRoutingServer *)self _handleAuthorizationRequest:v27];
    id v10 = v29;
  }
}

- (BOOL)outputDeviceAuthorizationSession:(id)a3 shouldRetryAuthorizationRequest:(id)a4 reason:(id)a5
{
  return self->_activePasswordDialog == 0;
}

- (void)_handleSetRouteDiscoveryModeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  objc_msgSend(v6, "setRouteDiscoveryMode:", xpc_dictionary_get_uint64(a3, "MRXPC_ROUTE_DISCOVERY_MODE_KEY"));
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 displayName];
    id v9 = -[MRDAVRoutingServer _descriptionForDiscoveryMode:](self, "_descriptionForDiscoveryMode:", [v6 routeDiscoveryMode]);
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2114;
    long long v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Client %{public}@ changed route discovery mode to %{public}@.", (uint8_t *)&v10, 0x16u);
  }
  [(MRDAVRoutingServer *)self _updateSystemRouteDiscoveryMode];
}

- (void)_handleGetPickableRoutesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "MRXPC_ROUTE_CATEGORY_KEY");
  if (string)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:string];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v10 = (id)v7;
  id v8 = [(MRDAVRoutingServer *)self pickableRoutesForCategory:v7];
  id v9 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:0];
  sub_1001678A4(v5, (uint64_t)"MRXPC_ROUTES_DATA_KEY", v9, 0);
}

- (void)_handleSetPickedRouteMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MRCreatePropertyListFromXPCMessage();
  id v9 = MRCreateStringFromXPCMessage();
  id v10 = MRCreateStringFromXPCMessage();
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_ROUTE_OPTIONS_KEY");
  if (v8)
  {
    __int16 v12 = _MRLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v7 displayName];
      id v14 = (void *)MRMediaRemoteCopySetPickedRouteOptionsDescription();
      *(_DWORD *)buf = 138543874;
      id v31 = v13;
      __int16 v32 = 2114;
      id v33 = v8;
      __int16 v34 = 2114;
      id v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] %{public}@ requesting to pick route: %{public}@, options: %{public}@", buf, 0x20u);
    }
    if ([(MRDAVRoutingServer *)self setPickedRoute:v8 withPassword:v10 options:uint64])
    {
      unsigned int v15 = 0;
    }
    else
    {
      unsigned int v15 = 7;
    }
    sub_1001679D8(v6, v15);
  }
  else
  {
    id v16 = _MRLogForCategory();
    long long v17 = v16;
    if (v9)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v18 = [v7 displayName];
        uint64_t v19 = (void *)MRMediaRemoteCopySetPickedRouteOptionsDescription();
        *(_DWORD *)buf = 138543874;
        id v31 = v18;
        __int16 v32 = 2114;
        id v33 = v9;
        __int16 v34 = 2114;
        id v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] %{public}@ requesting to pick route with UID: %{public}@, options: %{public}@", buf, 0x20u);
      }
      id v20 = [[MRDAVReconnaissanceSession alloc] initWithRouteUID:v9];
      [(NSMutableSet *)self->_reconnaissanceSessions addObject:v20];
      id v21 = _MRLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Beginning AV reconnaissance session for route with UID: %{public}@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v20);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1001335D0;
      v22[3] = &unk_10041E060;
      objc_copyWeak(&v26, (id *)buf);
      id v23 = v9;
      id v24 = v10;
      int v28 = uint64;
      objc_copyWeak(&v27, &location);
      id v25 = v6;
      [(MRDAVReconnaissanceSession *)v20 beginSearchWithTimeout:v22 completion:5.0];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10032FC78();
      }

      sub_1001679D8(v6, 7u);
    }
  }
}

- (void)_handleGetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = +[MRDMediaRemoteServer server];
  id v7 = [v6 nowPlayingServer];

  id v8 = [v7 queryExistingPlayerPathForXPCMessage:v13 forClient:v5];

  id v9 = [v8 originClient];

  if (v9)
  {
    id v10 = [v8 originClient];
    unsigned int v11 = [v10 volumeControlCapabilities];

    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  sub_10001432C(v13, (uint64_t)"MRXPC_ROUTE_VOLUME_CONTROL_CAPABILITIES_KEY", 0, v12, 0);
}

- (void)_handleSetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v5 = a4;
  id v6 = +[MRDMediaRemoteServer server];
  id v7 = [v6 nowPlayingServer];

  id v8 = [v7 queryExistingPlayerPathForXPCMessage:xdict forClient:v5];

  id v9 = [v8 originClient];

  if (v9)
  {
    if ([v8 isLocalOrigin])
    {
      unsigned int v10 = 2;
    }
    else
    {
      int64_t int64 = xpc_dictionary_get_int64(xdict, "MRXPC_ROUTE_VOLUME_CONTROL_CAPABILITIES_KEY");
      uint64_t v12 = [v8 originClient];
      [v12 setVolumeControlCapabilities:int64];

      unsigned int v10 = 0;
    }
  }
  else
  {
    unsigned int v10 = [v8 error];
  }
  sub_1001679D8(xdict, v10);
}

- (void)_handleGetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = MRCreateStringFromXPCMessage();
  id v6 = v5;
  if (v5) {
    id v5 = (void *)MSVKeychainCopyKeychainValue();
  }
  id v7 = v5;
  sub_10001432C(v4, (uint64_t)"MRXPC_ROUTE_PASSWORD_KEY", 3, (uint64_t)[v7 UTF8String], 0);
}

- (void)_handleSetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v4 = MRCreateStringFromXPCMessage();
  id v5 = MRCreateStringFromXPCMessage();
  if (v4)
  {
    MSVKeychainSetKeychainValue();
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = 2;
  }
  sub_1001679D8(v7, v6);
}

- (void)_handleClearAllAVRoutePasswordsMessage:(id)a3 fromClient:(id)a4
{
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Requesting to clear all AirPlay route passwords...", buf, 2u);
  }

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:&__kCFBooleanTrue forKey:kSecUseSystemKeychain];
  [v5 setObject:@"com.apple.airplay.password" forKey:kSecAttrService];
  [v5 setObject:kSecMatchLimitAll forKey:kSecMatchLimit];
  [v5 setObject:kSecClassGenericPassword forKey:kSecClass];
  [v5 setObject:kCFBooleanTrue forKey:kSecReturnPersistentRef];
  CFTypeRef result = 0;
  uint64_t v6 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if (v6 == -25300)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10032FE08();
    }
  }
  else
  {
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10032FD98(v7, v8, v18, v19, v20, v21, v22, v23);
      }
    }
    else
    {
      id v8 = (id)result;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v9 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
      if (v9)
      {
        id v10 = v9;
        id v24 = v5;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            id v14 = objc_alloc_init((Class)NSMutableDictionary);
            [v14 setObject:v13 forKey:kSecValuePersistentRef];
            [v14 setObject:kCFBooleanTrue forKey:kSecReturnPersistentRef];
            OSStatus v15 = SecItemDelete((CFDictionaryRef)v14);
            if (v15)
            {
              OSStatus v16 = v15;
              long long v17 = _MRLogForCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v31 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[AVRoutingServer] Error %ld trying to delete passwords", buf, 0xCu);
              }
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
        }
        while (v10);
        id v5 = v24;
      }
    }
  }
}

- (void)_handleUnpickAirPlayRoutesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Requesting to unpick AirPlay routes", v8, 2u);
  }

  if ([(MRDAVRoutingDataSource *)self->_routingDataSource unpickAirPlayRoutes]) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = 7;
  }
  sub_1001679D8(v5, v7);
}

- (void)_handleSetApplicationPickedRoutes:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)MRCreatePropertyListFromXPCMessage();
  BOOL v8 = xpc_dictionary_get_BOOL(v5, "MRXPC_ROUTE_OPTIONS_KEY");
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Received SetApplicationPickedRoutes message with route descriptions: %{public}@", buf, 0xCu);
  }

  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      OSStatus v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        OSStatus v16 = [[MRDAVRoute alloc] initWithDictionary:*(void *)(*((void *)&v18 + 1) + 8 * (void)v15)];
        [v10 addObject:v16];

        OSStatus v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  [(MRDAVRoutingServer *)self _setApplicationPickedRoutes:v10 updateRoutes:v8 forClient:v6];
}

- (void)_handleGetAirPlaySecuritySettingsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleGetHostedRoutingXPCEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  xpc_dictionary_handoff_reply();
}

- (void)_handleSetRecentAVOutputDeviceUIDMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  MRCreateStringFromXPCMessage();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](self->_mostRecentlyPickedDevices, "insertObject:atIndex:");
  id v6 = [(NSMutableArray *)self->_mostRecentlyPickedDevices count];
  if ((unint64_t)v6 >= 2)
  {
    unint64_t v7 = (unint64_t)v6;
    id v8 = -[NSMutableArray indexOfObject:inRange:](self->_mostRecentlyPickedDevices, "indexOfObject:inRange:", v9, 1, (char *)[(NSMutableArray *)self->_mostRecentlyPickedDevices count] - 1);
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_mostRecentlyPickedDevices removeObjectAtIndex:v8];
      --v7;
    }
    if (v7 >= 0xB) {
      -[NSMutableArray removeObjectsInRange:](self->_mostRecentlyPickedDevices, "removeObjectsInRange:", 10, v7 - 10);
    }
  }
  [(MRDAVRoutingServer *)self _saveMostRecentlyPicked];
  sub_1001679D8(v5, 0);
}

- (void)_handleGetRecentAVOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  mostRecentlyPickedDevices = self->_mostRecentlyPickedDevices;
  id v5 = a3;
  id v6 = +[NSPropertyListSerialization dataWithPropertyList:mostRecentlyPickedDevices format:200 options:0 error:0];
  sub_1001678A4(v5, (uint64_t)"MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY", v6, 0);
}

- (void)_handleUpdateActiveSystemEndpointUIDMessage:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)_handleGetActiveSystemEndpointUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  xpc_dictionary_handoff_reply();
}

- (void)_handleGetHostedEndpointForDeviceUIDMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  xpc_dictionary_handoff_reply();
}

- (void)_handlePromptForRouteAuthorizationMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreateProtobufFromXPCMessage();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100134E40;
  v21[3] = &unk_10041D0A8;
  id v22 = v5;
  id v7 = v5;
  id v8 = objc_retainBlock(v21);
  id v9 = [v6 inputType];
  id v10 = [MRDOutputDeviceRoute alloc];
  id v11 = [v6 route];
  id v12 = [(MRDOutputDeviceRoute *)v10 initWithOutputDevice:v11];

  id v13 = [MRDRouteAuthorizationRequest alloc];
  OSStatus v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  long long v18 = sub_100134F50;
  long long v19 = &unk_100416938;
  id v20 = v8;
  uint64_t v14 = v8;
  OSStatus v15 = [(MRDRouteAuthorizationRequest *)v13 initWithRoute:v12 inputType:v9 responseCallback:v14 cancelCallback:&v16];
  -[MRDAVRoutingServer _handleAuthorizationRequest:](self, "_handleAuthorizationRequest:", v15, v16, v17, v18, v19);
}

- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  MRCreateProtobufFromXPCMessage();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v10 status];
  id v7 = [MRDOutputDeviceRoute alloc];
  id v8 = [v10 route];
  id v9 = [(MRDOutputDeviceRoute *)v7 initWithOutputDevice:v8];
  [(MRDAVRoutingServer *)self _handleErrorStatus:v6 forRoute:v9];

  sub_100014324(v5, 0);
}

- (void)_handleGetAirplayStatus:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleSetNearbyDevice:(id)a3 fromClient:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001351B0;
  v5[3] = &unk_100415DC8;
  id v6 = a3;
  id v4 = v6;
  sub_100014324(v4, v5);
}

- (void)_handleResetOutputContextMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleAddVirtualOutputDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  if (!_os_feature_enabled_impl()
    || (+[MRUserSettings currentSettings],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 useAPSyncAPI],
        v4,
        (v5 & 1) == 0))
  {
    sub_100014324(v6, &stru_10041E080);
  }
}

- (void)_handleGetVirtualOutputDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  if (!_os_feature_enabled_impl()
    || (+[MRUserSettings currentSettings],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 useAPSyncAPI],
        v4,
        (v5 & 1) == 0))
  {
    sub_100014324(v6, &stru_10041E0A0);
  }
}

- (void)_handleCreateGroupWithDevices:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)_handleStartNowPlayingSession:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  xpc_dictionary_handoff_reply();
}

- (void)_handleStopNowPlayingSession:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  xpc_dictionary_handoff_reply();
}

- (void)_handleResumeNowPlayingSession:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  MRCreatePlayerPathFromXPCMessage();
  v11 = id v10 = v6;
  id v12 = v5;
  id v7 = v5;
  id v8 = v11;
  id v9 = v6;
  xpc_dictionary_handoff_reply();
}

- (void)_handleGetOutputContextUIDMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  if (qword_10047E290 != -1) {
    dispatch_once(&qword_10047E290, &stru_10041E130);
  }
  id v6 = v4;
  id v5 = v4;
  MRMediaRemoteGetDeviceUIDWithRetryIntervals();
}

- (void)_handleMigrateFromEndpointToOutputDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleMigrateFromEndpointToEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleCreateEndpointWithDevices:(id)a3 fromClient:(id)a4
{
}

- (void)_handleCreateDirectEndpointForDevices:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)_handleGroupDevicesAndSendCommand:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)_handleCreateHostedEndpointForDevices:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)_handlePredictGroupLeader:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)_handleRemoveFromParentGroup:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MRCreatePropertyListFromXPCMessage();
  MRCreateRequestDetailsFromXPCMessage();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    id v10 = objc_alloc((Class)MRRequestDetails);
    uint64_t v11 = MRRequestDetailsInitiatorInfer;
    id v12 = [v7 bundleIdentifier];
    id v9 = [v10 initWithInitiator:v11 requestID:0 reason:@"RoutingServer.handleRemoveFromParentGroup" userInitiated:0 originatingBundleID:v12];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100138198;
  v14[3] = &unk_100415F80;
  id v15 = v6;
  id v13 = v6;
  [(MRDAVRoutingServer *)self removeOutputDeviceUIDsFromParentGroup:v8 details:v9 completion:v14];
}

- (void)_handleGetExternalDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10047E2A0 != -1) {
    dispatch_once(&qword_10047E2A0, &stru_10041E238);
  }
  if ([v6 isEntitledFor:0x8000])
  {
    id v7 = v5;
    xpc_dictionary_handoff_reply();
  }
  else
  {
    sub_100014324(v5, &stru_10041E258);
  }
}

- (void)_handleModifyOutputContextMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleWillStartPlayingInterruptMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleRecommendRouteCandidateMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] [MRDRRC] _handleRecommendRouteCandidateMessage: %@ fromClient: %@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100138C18;
  v10[3] = &unk_100415DF0;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_100014324(v9, v10);
}

- (void)_handleGetRecommendRouteCandidatesMessage:(id)a3 fromClient:(id)a4
{
  id v4 = [(MRDRouteRecommendationController *)self->_recommendationController recommender];
  [v4 requestCurrentContext];
}

- (void)_handleDismissAllBannersMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] _handleDismissAllBannersMessage: %@ fromClient: %@", buf, 0x16u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100138E4C;
  v9[3] = &unk_100415DC8;
  v9[4] = self;
  sub_100014324(v6, v9);
}

- (void)_handlePauseOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)MRCreatePropertyListFromXPCMessage();
  id v6 = objc_alloc((Class)MRRequestDetails);
  id v7 = (void *)MRCreateDataFromXPCMessage();
  id v8 = [v6 initWithData:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100138F8C;
  v13[3] = &unk_100415F80;
  id v14 = v4;
  id v9 = v4;
  id v10 = objc_retainBlock(v13);
  qos_class_t v11 = qos_class_self();
  __int16 v12 = dispatch_get_global_queue(v11, 0);
  +[MRDPauseOutputDevicesRequest pauseOutputDeviceUIDs:v5 details:v8 queue:v12 completion:v10];
}

- (void)_handleSearchEndpointsForOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[NSDate now];
  id v14 = [(MRDAVHostedRoutingService *)self->_hostedRoutingService hostedRoutingController];
  id v15 = objc_alloc((Class)NSMutableString);
  id v16 = [v11 requestID];
  uint64_t v17 = (__CFString *)[v15 initWithFormat:@"%@<%@>", @"RoutingServer.searchEndpointsForOutputDeviceUID", v16];

  if (v10) {
    [(__CFString *)v17 appendFormat:@" for %@", v10];
  }
  long long v18 = [v11 reason];

  if (v18)
  {
    long long v19 = [v11 reason];
    [(__CFString *)v17 appendFormat:@" because %@", v19];
  }
  id v20 = _MRLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v52 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100139914;
  v44[3] = &unk_1004198C8;
  id v21 = v14;
  id v45 = v21;
  id v22 = v10;
  id v46 = v22;
  v47 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
  id v23 = v11;
  id v48 = v23;
  id v24 = v13;
  id v49 = v24;
  id v25 = v12;
  id v50 = v25;
  long long v26 = objc_retainBlock(v44);
  long long v27 = [v21 availableEndpoints];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100139E08;
  v42[3] = &unk_10041E2A8;
  id v28 = v22;
  id v43 = v28;
  long long v29 = objc_msgSend(v27, "msv_firstWhere:", v42);

  if (!v29) {
    goto LABEL_15;
  }
  unsigned int v30 = [v29 isConnected];
  uint64_t v31 = _MRLogForCategory();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (!v30)
  {
    if (v32)
    {
      __int16 v34 = [v23 requestID];
      *(_DWORD *)buf = 138543874;
      CFStringRef v52 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
      __int16 v53 = 2114;
      v54 = v34;
      __int16 v55 = 2112;
      CFStringRef v56 = @"Found in hostedRouting but not connected";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
LABEL_15:
    qos_class_t v35 = qos_class_self();
    v36 = dispatch_get_global_queue(v35, 0);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100139E14;
    v37[3] = &unk_10041E2D0;
    v41 = v26;
    id v38 = v21;
    v39 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
    id v40 = v23;
    +[MRDLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:v28 timeout:v40 details:v36 queue:v37 completion:a4];

    goto LABEL_16;
  }
  if (v32)
  {
    id v33 = [v23 requestID];
    *(_DWORD *)buf = 138543874;
    CFStringRef v52 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
    __int16 v53 = 2114;
    v54 = v33;
    __int16 v55 = 2112;
    CFStringRef v56 = @"Found in hostedRouting";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }
  ((void (*)(void *, void *, void))v26[2])(v26, v29, 0);
LABEL_16:
}

- (void)_handleSendCommandToEachEndpointContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleSendCommandToNewGroupContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)_handleSearchEndpointsForRoutingContextUIDMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[NSDate now];
  id v14 = objc_alloc((Class)NSMutableString);
  id v15 = [v11 requestID];
  id v16 = [v14 initWithFormat:@"%@<%@>", @"RoutingServer.searchEndpointsForRoutingContextUID", v15];

  if (v10) {
    [v16 appendFormat:@" for %@", v10];
  }
  uint64_t v17 = [v11 label];

  if (v17)
  {
    long long v18 = [v11 label];
    [v16 appendFormat:@" because %@", v18];
  }
  long long v19 = _MRLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v52 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10013AFEC;
  v44[3] = &unk_1004198C8;
  id v20 = v10;
  id v45 = v20;
  id v46 = @"RoutingServer.searchEndpointsForRoutingContextUID";
  id v47 = v11;
  id v48 = v13;
  id v49 = 0;
  id v50 = v12;
  id v21 = v12;
  id v22 = v13;
  id v23 = v11;
  id v24 = objc_retainBlock(v44);
  id v25 = objc_alloc((Class)MRBlockGuard);
  long long v26 = [v23 requestID];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10013B414;
  v42[3] = &unk_100415FA8;
  long long v27 = v24;
  id v43 = v27;
  id v28 = [v25 initWithTimeout:v26 reason:&_dispatch_main_q queue:v42 handler:a4];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10013B434;
  v38[3] = &unk_100415B98;
  v38[4] = self;
  id v39 = v20;
  id v40 = v28;
  id v41 = v27;
  long long v29 = v27;
  id v30 = v28;
  id v31 = v20;
  BOOL v32 = objc_retainBlock(v38);
  id v33 = +[NSNotificationCenter defaultCenter];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10013B628;
  v36[3] = &unk_100419ED8;
  id v37 = v32;
  __int16 v34 = v32;
  qos_class_t v35 = [v33 addObserverForName:@"MRDHostedRoutingControllerAvailableExternalDevicesDidChangeNotification" object:0 queue:0 usingBlock:v36];

  v34[2](v34);
}

- (void)systemEndpointController:(id)a3 activeSystemEndpointDidChangeForRequest:(id)a4 type:(int64_t)a5
{
  systemEndpointController = self->_systemEndpointController;
  id v8 = a4;
  id v9 = [v8 outputDeviceUID];
  id v10 = [(MRDAVSystemEndpointController *)systemEndpointController originClientForDeviceUID:v9];

  [(MRDAVRoutingServer *)self postSystemEndpointDeviceChange:v8 type:a5 originClient:v10 handler:0];
  if (a5 == 2) {
    notify_post("com.apple.mediaremote.recommendedSystemEndpointDidChange");
  }
}

- (void)postSystemEndpointDeviceChange:(id)a3 type:(int64_t)a4 originClient:(id)a5 handler:(id)a6
{
  id v25 = a3;
  id v9 = a5;
  id v10 = (void (**)(id, void, id))a6;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = +[NSNumber numberWithInteger:a4];
  [v11 setObject:v12 forKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];

  id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v25 changeType]);
  [v11 setObject:v13 forKeyedSubscript:kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey];

  id v14 = [v9 activeNowPlayingClient];
  id v15 = [v14 activePlayerClient];
  id v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 playbackState]);
  [v11 setObject:v16 forKeyedSubscript:kMRMediaRemotePlaybackStateUserInfoKey];

  uint64_t v17 = [v25 reason];

  if (v17)
  {
    long long v18 = [v25 reason];
    [v11 setObject:v18 forKeyedSubscript:kMRMediaRemoteActiveEndpointReasonUserInfoKey];
  }
  long long v19 = [v25 outputDeviceUID];

  if (v19)
  {
    id v20 = [v25 outputDeviceUID];
    [v11 setObject:v20 forKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey];
  }
  id v21 = [v9 playerPath];
  MRAddPlayerPathToUserInfo();

  id v22 = [v9 deviceInfo];
  MRAddDeviceInfoToUserInfo();

  [v11 setObject:v25 forKeyedSubscript:MRUpdateActiveSystemEndpointRequestUserInfoKey];
  uint64_t v23 = _MRMediaRemoteActiveSystemEndpointDidChangeNotification;
  if (v10)
  {
    v10[2](v10, _MRMediaRemoteActiveSystemEndpointDidChangeNotification, v11);
  }
  else
  {
    id v24 = +[MRDMediaRemoteServer server];
    [v24 postClientNotificationNamed:v23 userInfo:v11 predicate:&stru_10041E3A8];
  }
}

- (void)_clientInvalidatedNotification:(id)a3
{
  id v4 = [a3 object];
  [(MRDAVRoutingServer *)self _setApplicationPickedRoutes:0 updateRoutes:1 forClient:v4];
  [(MRDAVRoutingServer *)self _updateSystemRouteDiscoveryMode];
}

- (void)_routingDataSourcePickableRoutesDidChangeNotification:(id)a3
{
  id v3 = +[MRDMediaRemoteServer server];
  [v3 postClientNotificationNamed:kMRMediaRemotePickableRoutesDidChangeNotification];
}

- (void)_routingDataSourceExternalScreenDidChangeNotification:(id)a3
{
}

- (void)_routingDataSourceRouteStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"MRDAVRoutingDataSourceAVRouteUserInfoKey"];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKey:@"MRDAVRoutingDataSourceRouteStatusUserInfoKey"];
  id v9 = [v8 intValue];

  if ((v9 - 1) > 1)
  {
    if (v9) {
      [(MRDAVRoutingServer *)self _handleErrorStatus:v9 forRoute:v6];
    }
  }
  else
  {
    id v10 = [v6 uniqueIdentifier];
    unsigned __int8 v11 = [(MRDAVRoutingServer *)self _shouldIgnorePortStatusFailureForRouteWithUID:v10 previouslyCachedRouteUID:0];

    if (v11)
    {
      id v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Ignoring VAD port authentication failure.", v13, 2u);
      }
    }
    else
    {
      [(MRDAVRoutingServer *)self _handleAuthenticationFailureForRoute:v6 withOptions:0];
    }
  }
  self->_mostRecentStatus = (int)v9;
  [(MRDAVRoutingServer *)self _postRouteStatusDidChangeNotificationForRoute:v6 newStatus:v9];
}

- (void)_failedToConnectToOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1003300B0();
  }

  id v6 = [v4 userInfo];
  id v7 = off_100477898();
  id v8 = [v6 objectForKey:v7];

  if (v8) {
    id v9 = [[MRDAVOutputDeviceRoute alloc] initWithAVOutputDevice:v8];
  }
  else {
    id v9 = 0;
  }
  id v10 = [v4 userInfo];
  unsigned __int8 v11 = off_1004778A0();
  uint64_t v12 = [v10 objectForKey:v11];

  id v13 = [v4 userInfo];
  id v14 = off_1004778A8();
  id v15 = [v13 objectForKey:v14];

  id v16 = objc_alloc((Class)MRGroupTopologyModificationRequest);
  uint64_t v17 = (objc_class *)objc_opt_class();
  long long v18 = NSStringFromClass(v17);
  qos_class_t v35 = v15;
  long long v19 = [v15 objectForKeyedSubscript:v18];
  id v20 = [v16 initWithData:v19];

  id v21 = (void *)v12;
  if (v12)
  {
    id v31 = v4;
    BOOL v32 = v9;
    id v33 = v8;
    __int16 v34 = self;
    id v22 = off_1004778B0();
    v36[0] = v22;
    v37[0] = &off_100438220;
    uint64_t v23 = off_1004778B8();
    v36[1] = v23;
    v37[1] = &off_100438238;
    id v24 = off_1004778C0();
    v36[2] = v24;
    v37[2] = &off_100438250;
    id v25 = off_1004778C8();
    v36[3] = v25;
    v37[3] = &off_100438268;
    long long v26 = off_1004778D0();
    void v36[4] = v26;
    void v37[4] = &off_100438280;
    uint64_t v27 = 5;
    id v28 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];
    long long v29 = v21;
    id v30 = [v28 objectForKey:v21];

    if (v30) {
      uint64_t v27 = (uint64_t)[v30 intValue];
    }
    self = v34;

    id v9 = v32;
    id v8 = v33;
    id v21 = v29;
    id v4 = v31;
    if (!v20) {
      goto LABEL_13;
    }
LABEL_12:
    if ([v20 suppressErrorDialog]) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  uint64_t v27 = 5;
  if (v20) {
    goto LABEL_12;
  }
LABEL_13:
  if (MSVDeviceIsAppleTV()
    && [v8 clusterType] == (id)1
    && MRMediaRemoteAVOutputDeviceIsLocalForAirPlay())
  {
    [(MRDAVRoutingServer *)self _handleClusterErrorStatus:v27 forRoute:v9];
  }
  else
  {
    [(MRDAVRoutingServer *)self _handleErrorStatus:v27 forRoute:v9];
  }
LABEL_18:
  [(MRDAVRoutingServer *)self _postRouteStatusDidChangeNotificationForRoute:v9 newStatus:v27];
}

- (void)_postRouteStatusDidChangeNotificationForRoute:(id)a3 newStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v11 = kMRMediaRemoteRouteStatusUserInfoKey;
  id v6 = +[NSNumber numberWithInt:v4];
  uint64_t v12 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v8 = [v7 mutableCopy];

  if (v5)
  {
    id v9 = [v5 dictionary];
    [v8 setObject:v9 forKey:kMRMediaRemoteRouteDescriptionUserInfoKey];
  }
  id v10 = +[MRDMediaRemoteServer server];
  [v10 postClientNotificationNamed:kMRMediaRemoteRouteStatusDidChangeNotification userInfo:v8];
}

- (void)_handleAuthorizationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 route];
  id v6 = [v4 inputType];
  routingDataSource = self->_routingDataSource;
  id v8 = [v5 uniqueIdentifier];
  id v9 = [(MRDAVRoutingDataSource *)routingDataSource authorizationRequestCallbackForRouteID:v8];

  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v12 = self->_routingDataSource;
    id v13 = v5;
    id v14 = [v13 avOutputDevice];
    id v15 = [v14 clusterID];
    id v9 = [(MRDAVRoutingDataSource *)v12 authorizationRequestCallbackForRouteID:v15];

    if (!v9)
    {
LABEL_8:
      id v16 = [(MRDAVRoutingServer *)self activePasswordDialog];

      uint64_t v17 = [v5 uniqueIdentifier];
      id v31 = 0;
      unsigned int v18 = [(MRDAVRoutingServer *)self _shouldIgnorePortStatusFailureForRouteWithUID:v17 previouslyCachedRouteUID:&v31];
      id v9 = (void (**)(id, id, void *))v31;

      if (!v16 && (v18 & 1) == 0)
      {
        long long v19 = _MRLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v5 name];
          *(_DWORD *)buf = 138543362;
          v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Prompting user with authorization request route %{public}@", buf, 0xCu);
        }
        id v21 = [v5 name];
        id v22 = [(MRDAVRoutingServer *)self _passwordDialogForRouteWithName:v21 usingInputType:v6];

        id v24 = _NSConcreteStackBlock;
        uint64_t v25 = 3221225472;
        long long v26 = sub_10013C53C;
        uint64_t v27 = &unk_10041E3F8;
        id v28 = v4;
        id v29 = v5;
        id v30 = self;
        [v22 presentWithCompletion:&v24];
        -[MRDAVRoutingServer setActivePasswordDialog:](self, "setActivePasswordDialog:", v22, v24, v25, v26, v27);

        goto LABEL_5;
      }
      if (v16)
      {
        uint64_t v23 = _MRLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100330118();
        }
      }
      else
      {
        if (!v18)
        {
LABEL_20:
          [v4 cancel];
          goto LABEL_5;
        }
        uint64_t v23 = _MRLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10033014C();
        }
      }

      goto LABEL_20;
    }
  }
  id v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v5 name];
    *(_DWORD *)buf = 138543362;
    v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Handling authorization request with custom callback for route %{public}@", buf, 0xCu);
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10013C460;
  v32[3] = &unk_10041E3D0;
  id v33 = v5;
  id v34 = v4;
  v9[2](v9, v6, v32);

LABEL_5:
}

- (void)_registerNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_clientInvalidatedNotification:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0];
  [v3 addObserver:self selector:"_routingDataSourcePickableRoutesDidChangeNotification:" name:@"MRDAVRoutingDataSourcePickableRoutesDidChangeNotification" object:self->_routingDataSource];
  [v3 addObserver:self selector:"_routingDataSourceExternalScreenDidChangeNotification:" name:@"MRDAVRoutingDataSourceExternalScreenDidChangeNotification" object:self->_routingDataSource];
  [v3 addObserver:self selector:"_routingDataSourceRouteStatusDidChangeNotification:" name:@"MRDAVRoutingDataSourceRouteStatusDidChangeNotification" object:self->_routingDataSource];
  id v4 = off_1004778D8();
  id v5 = [(objc_class *)off_1004778E0() outputContextManagerForAllOutputContexts];
  [v3 addObserver:self selector:"_failedToConnectToOutputDeviceNotification:" name:v4 object:v5];

  id v6 = +[NSNotificationCenter defaultCenter];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10013C8EC;
  v11[3] = &unk_100418568;
  v11[4] = self;
  id v7 = [v6 addObserverForName:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0 queue:0 usingBlock:v11];

  id v8 = +[NSNotificationCenter defaultCenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013C8F4;
  v10[3] = &unk_100418568;
  void v10[4] = self;
  id v9 = [v8 addObserverForName:@"MRDMediaRemoteClientDeclaringAirplayActiveDidChange" object:0 queue:0 usingBlock:v10];
}

- (void)_unregisterNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (id)_descriptionForDiscoveryMode:(unsigned int)a3
{
  id v3 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();

  return v3;
}

- (id)_passwordDialogForRouteWithName:(id)a3 usingInputType:(int64_t)a4
{
  id v5 = a3;
  id v6 = MRLocalizedString();
  id v7 = MRLocalizedString();
  id v8 = MRLocalizedString();
  id v9 = objc_alloc_init((Class)MSVSystemDialogOptions);
  [v9 setAlertHeader:v6];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5);

  [v9 setAlertMessage:v10];
  uint64_t v11 = MRLocalizedString();
  [v9 setDefaultButtonTitle:v11];

  uint64_t v12 = MRLocalizedString();
  [v9 setAlternateButtonTitle:v12];

  [v9 setShowAsTopmost:1];
  [v9 setForceModalAlertAppearance:1];
  [v9 setShowOnLockscreen:1];
  [v9 setDismissOverlaysOnLockscreen:0];
  id v13 = [objc_alloc((Class)MSVSystemDialog) initWithOptions:v9];
  id v14 = [objc_alloc((Class)MSVSystemDialogTextField) initWithTitle:v8];
  [v14 setSecure:1];
  [v14 setKeyboardType:a4];
  [v13 addTextField:v14];

  return v13;
}

- (void)_updateSystemRouteDiscoveryMode
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 allClients];

  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    LODWORD(v7) = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned int v10 = [*(id *)(*((void *)&v20 + 1) + 8 * i) routeDiscoveryMode];
        if (v10 <= v7) {
          uint64_t v7 = v7;
        }
        else {
          uint64_t v7 = v10;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (v7 != [(MRDAVRoutingDataSource *)self->_routingDataSource discoveryMode])
  {
    uint64_t v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(MRDAVRoutingServer *)self _descriptionForDiscoveryMode:v7];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Updating system route discovery mode to %{public}@", buf, 0xCu);
    }
    [(MRDAVRoutingDataSource *)self->_routingDataSource setDiscoveryMode:v7];
  }
  id v13 = [(MRDAVRoutingServer *)self discoveryTransaction];

  if (v7)
  {
    if (!v13)
    {
      id v14 = [objc_alloc((Class)MROSTransaction) initWithName:@"com.apple.mediaremoted.MRDAVRoutingServer"];
      [(MRDAVRoutingServer *)self setDiscoveryTransaction:v14];

      id v15 = [(MRDAVRoutingServer *)self discoveryTransaction];
      MRRegisterTransaction();

      id v16 = _MRLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(MRDAVRoutingServer *)self discoveryTransaction];
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Discovery enabled. Starting transaction: %{public}@", buf, 0xCu);
      }
    }
  }
  else if (v13)
  {
    unsigned int v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [(MRDAVRoutingServer *)self discoveryTransaction];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Discovery ended. Clearing transaction %{public}@", buf, 0xCu);
    }
    [(MRDAVRoutingServer *)self setDiscoveryTransaction:0];
  }
}

- (BOOL)_shouldIgnorePortStatusFailureForRouteWithUID:(id)a3 previouslyCachedRouteUID:(id *)a4
{
  id v6 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = self->_routeUIDsToIgnorePortStatusFailures;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      uint64_t v12 = 0;
      id v13 = v10;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        id v10 = *(id *)(*((void *)&v23 + 1) + 8 * (void)v12);

        id v14 = objc_msgSend(v6, "length", (void)v23);
        if (v14 >= [v10 length]) {
          id v15 = v10;
        }
        else {
          id v15 = v6;
        }
        id v16 = v15;
        id v17 = [v6 length];
        if (v17 <= [v10 length]) {
          unsigned int v18 = v10;
        }
        else {
          unsigned int v18 = v6;
        }
        unsigned int v19 = [v18 containsString:v16];

        if (v19)
        {

          if (a4) {
            unsigned int v21 = v19;
          }
          else {
            unsigned int v21 = 0;
          }
          if (v21 == 1)
          {
            id v10 = v10;
            *a4 = v10;
          }
          BOOL v20 = 1;
          goto LABEL_23;
        }
        uint64_t v12 = (char *)v12 + 1;
        id v13 = v10;
      }
      while (v9 != v12);
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    BOOL v20 = 0;
  }
  else
  {

    BOOL v20 = 0;
    id v10 = 0;
  }
LABEL_23:

  return v20;
}

- (void)_handleClusterErrorStatus:(int)a3 forRoute:(id)a4
{
  id v6 = a4;
  [(NSDate *)self->_lastClusterConnectionFailureDate timeIntervalSinceNow];
  double v8 = v7;
  BOOL v10 = v7 > -480.0 && self->_lastClusterConnectionFailureDate != 0;
  uint64_t v11 = _MRLogForCategory();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = -v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Suppressing cluster connection error. %.2f since last alert", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    if (v12)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] Error connecting to cluster member: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    id v13 = +[NSDate date];
    lastClusterConnectionFailureDate = self->_lastClusterConnectionFailureDate;
    self->_lastClusterConnectionFailureDate = v13;

    id v41 = MRLocalizedString();
    if ((a3 - 7) <= 2)
    {
      uint64_t v15 = MRLocalizedString();

      id v41 = (void *)v15;
    }
    uint64_t v11 = MRLocalizedString();
    id v16 = +[NSDate date];
    id v17 = +[NSUUID UUID];
    unsigned int v18 = [v17 UUIDString];

    id v19 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"Dialog.handleClusterErrorStatus", v18];
    BOOL v20 = v19;
    if (v6) {
      [v19 appendFormat:@" for %@", v6];
    }
    unsigned int v21 = _MRLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x3032000000;
    v65 = sub_10013D6B4;
    objc_super v66 = sub_10013D6C4;
    id v67 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    id v60 = sub_10013D6B4;
    id v61 = sub_10013D6C4;
    id v62 = 0;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10013D6CC;
    v51[3] = &unk_10041E420;
    id v52 = v6;
    id v22 = v18;
    id v53 = v22;
    id v40 = v16;
    id v54 = v40;
    __int16 v55 = &v57;
    p_long long buf = &buf;
    long long v23 = objc_retainBlock(v51);
    id v24 = objc_alloc((Class)MRBlockGuard);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10013D948;
    v49[3] = &unk_100415FA8;
    long long v25 = v23;
    id v50 = v25;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10013D958;
    v46[3] = &unk_1004187A8;
    id v26 = [v24 initWithTimeout:@"Cluster connect error" reason:v49 handler:300.0];
    id v47 = v26;
    uint64_t v27 = v25;
    id v48 = v27;
    id v28 = objc_retainBlock(v46);
    id v29 = +[NSNotificationCenter defaultCenter];
    id v30 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    uint64_t v31 = MRAVEndpointDidAddOutputDeviceNotification;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10013D9BC;
    v44[3] = &unk_100419ED8;
    BOOL v32 = v28;
    id v45 = v32;
    uint64_t v33 = [v29 addObserverForName:v31 object:v30 queue:0 usingBlock:v44];
    id v34 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v33;

    qos_class_t v35 = MRLocalizedString();
    v36 = MRLocalizedString();
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10013D9D0;
    v42[3] = &unk_10041E448;
    void v42[4] = self;
    id v37 = v32;
    id v43 = v37;
    uint64_t v38 = [(MRDAVRoutingServer *)self _presentDialogWithTitle:v41 message:v11 defaultButtonTitle:v35 alternateButtonTitle:v36 completion:v42];
    id v39 = (void *)v58[5];
    v58[5] = v38;

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_launchTVClusterSettings
{
  uint64_t v4 = FBSOpenApplicationOptionKeyPayloadURL;
  id v2 = +[NSURL URLWithString:@"prefs:root=DefaultAudioOutput"];
  id v5 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  sub_100168794(@"com.apple.TVSettings", (uint64_t)v3, &stru_10041E468);
}

- (void)_handleErrorStatus:(int)a3 forRoute:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (self->_mostRecentStatus == a3
    || ([v6 uniqueIdentifier],
        double v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [(MRDAVRoutingServer *)self _shouldIgnorePortStatusFailureForRouteWithUID:v8 previouslyCachedRouteUID:0], v8, (v9 & 1) != 0))
  {
    BOOL v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      mostRecentStatus = (NSMutableSet *)self->_mostRecentStatus;
      BOOL v12 = [v7 uniqueIdentifier];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v27 = mostRecentStatus;
      __int16 v28 = 2114;
      id v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] AirPlay Error %ld: Ignoring because error for \"%{public}@\" because the status code has not changed and already prompted user.", buf, 0x16u);
    }
    id v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      routeUIDsToIgnorePortStatusFailures = self->_routeUIDsToIgnorePortStatusFailures;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v27 = routeUIDsToIgnorePortStatusFailures;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] RouteUIDs ignored for port status failures: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = [v7 name];
    id v16 = (void *)v15;
    id v17 = @"<Unknown>";
    if (v15) {
      id v17 = (__CFString *)v15;
    }
    id v13 = v17;

    unsigned int v18 = [v7 extendedInfo];
    id v19 = [v18 modelName];
    [v19 hasPrefix:@"AppleTV"];

    BOOL v20 = MRLocalizedString();
    unsigned int v21 = MRLocalizedString();
    id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v13);

    long long v23 = _MRLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218498;
      uint64_t v27 = (NSMutableSet *)a3;
      __int16 v28 = 2114;
      id v29 = v20;
      __int16 v30 = 2114;
      uint64_t v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] AirPlay Error %ld: %{public}@: %{public}@", buf, 0x20u);
    }

    id v24 = MRLocalizedString();
    id v25 = [(MRDAVRoutingServer *)self _presentDialogWithTitle:v20 message:v22 defaultButtonTitle:v24 alternateButtonTitle:0 completion:0];
  }
}

- (id)_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = objc_alloc_init((Class)MSVSystemDialogOptions);
  [v17 setAlertHeader:v12];
  [v17 setAlertMessage:v13];
  [v17 setDefaultButtonTitle:v16];

  [v17 setAlternateButtonTitle:v15];
  [v17 setShowAsTopmost:1];
  [v17 setForceModalAlertAppearance:1];
  [v17 setShowOnLockscreen:1];
  [v17 setDismissOverlaysOnLockscreen:0];
  id v18 = [objc_alloc((Class)MSVSystemDialog) initWithOptions:v17];
  [(MSVSystemDialog *)self->_activePasswordDialog dismiss];
  [(MRDAVRoutingServer *)self setActivePasswordDialog:0];
  id v19 = [(MRDAVRoutingServer *)self activeDialog];

  if (v19)
  {
    BOOL v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_opt_class();
      uint64_t v33 = [(MRDAVRoutingServer *)self activeDialog];
      uint64_t v28 = objc_opt_class();
      [(MRDAVRoutingServer *)self activeDialog];
      v21 = id v32 = v14;
      uint64_t v31 = [(MRDAVRoutingServer *)self activeDialog];
      __int16 v30 = [v31 options];
      [v30 alertHeader];
      id v22 = v34 = v12;
      long long v23 = [(MRDAVRoutingServer *)self activeDialog];
      id v24 = [v23 options];
      id v25 = [v24 alertMessage];
      *(_DWORD *)long long buf = 138545666;
      uint64_t v36 = v29;
      __int16 v37 = 2048;
      uint64_t v38 = self;
      __int16 v39 = 2114;
      uint64_t v40 = v28;
      __int16 v41 = 2048;
      v42 = v21;
      __int16 v43 = 2114;
      id v44 = v22;
      __int16 v45 = 2114;
      id v46 = v25;
      __int16 v47 = 2114;
      uint64_t v48 = objc_opt_class();
      __int16 v49 = 2048;
      id v50 = v18;
      __int16 v51 = 2114;
      id v52 = v34;
      __int16 v53 = 2114;
      id v54 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[AVRoutingServer] <%{public}@: %p> Dismissing active dialog <%{public}@: %p - %{public}@: %{public}@> to present new dialog: <%{public}@: %p - %{public}@: %{public}@>", buf, 0x66u);

      id v12 = v34;
      id v14 = v32;
    }
    id v26 = [(MRDAVRoutingServer *)self activeDialog];
    [v26 dismiss];
  }
  [(MRDAVRoutingServer *)self setActiveDialog:v18];
  [v18 presentWithCompletion:v14];

  return v18;
}

- (void)_handleAuthenticationFailureForRoute:(id)a3 withOptions:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  id v6 = [v7 name];
  MSVKeychainSetKeychainValue();

  if (!self->_activePasswordDialog) {
    [(MRDAVRoutingServer *)self _presentPasswordDialogForRoute:v7 withOptions:v4];
  }
}

- (id)_existingKeychainAccountForOutputDevice:(id)a3 password:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 identifyingMACAddress];
  if ((unint64_t)[v6 length] < 6)
  {
    BOOL v10 = 0;
LABEL_5:
    id v7 = [v5 ID];

    uint64_t v11 = MSVKeychainCopyKeychainValue();
    if (v11)
    {
      unsigned __int8 v9 = (void *)v11;
    }
    else
    {
      uint64_t v12 = [v5 name];

      unsigned __int8 v9 = (void *)MSVKeychainCopyKeychainValue();
      id v7 = (id)v12;
    }
    goto LABEL_9;
  }
  [v6 bytes];
  HardwareAddressToCString();
  id v7 = +[NSString stringWithUTF8String:v14];
  uint64_t v8 = MSVKeychainCopyKeychainValue();
  if (v8)
  {
    unsigned __int8 v9 = (void *)v8;

    goto LABEL_9;
  }
  BOOL v10 = [v7 lowercaseString];

  unsigned __int8 v9 = (void *)MSVKeychainCopyKeychainValue();
  id v7 = v10;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_9:

  if (a4) {
    *a4 = v9;
  }

  return v7;
}

- (id)_savedPasswordForOutputDevice:(id)a3
{
  id v6 = 0;
  id v3 = [(MRDAVRoutingServer *)self _existingKeychainAccountForOutputDevice:a3 password:&v6];
  id v4 = v6;

  return v4;
}

- (void)_clearPasswordForOutputDevice:(id)a3
{
  uint64_t v3 = [(MRDAVRoutingServer *)self _existingKeychainAccountForOutputDevice:a3 password:0];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v3 = MSVKeychainSetKeychainValue();
    uint64_t v4 = v5;
  }

  _objc_release_x1(v3, v4);
}

- (void)_saveMostRecentlyPicked
{
  CFPreferencesSetAppValue(@"MostRecentlyUsedAVOutputDeviceUIDs", self->_mostRecentlyPickedDevices, @"com.apple.mediaremote");

  CFPreferencesAppSynchronize(@"com.apple.mediaremote");
}

- (void)_loadMostRecentlyPicked
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"MostRecentlyUsedAVOutputDeviceUIDs", @"com.apple.mediaremote");
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = (NSMutableArray *)[v3 mutableCopy];
    mostRecentlyPickedDevices = self->_mostRecentlyPickedDevices;
    self->_mostRecentlyPickedDevices = v4;

    uint64_t v3 = v6;
  }
}

- (BOOL)_setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  routeUIDsToIgnorePortStatusFailures = self->_routeUIDsToIgnorePortStatusFailures;
  uint64_t v11 = [v8 uniqueIdentifier];
  if (v5) {
    [(NSMutableSet *)routeUIDsToIgnorePortStatusFailures addObject:v11];
  }
  else {
    [(NSMutableSet *)routeUIDsToIgnorePortStatusFailures removeObject:v11];
  }

  self->_mostRecentStatus = -1;
  BOOL v12 = [(MRDAVRoutingDataSource *)self->_routingDataSource setPickedRoute:v8 withPassword:v9];
  if (!v12)
  {
    id v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10033024C();
    }
  }
  return v12;
}

- (void)_postExternalScreenDidChange
{
  uint64_t v2 = [(MRDAVRoutingDataSource *)self->_routingDataSource externalScreenType];
  uint64_t v3 = +[MRDMediaRemoteServer server];
  uint64_t v4 = kMRMediaRemoteExternalScreenTypeDidChangeNotification;
  uint64_t v7 = kMRMediaRemoteExternalScreenTypeUserInfoKey;
  char v5 = +[NSNumber numberWithUnsignedInt:v2];
  id v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v3 postClientNotificationNamed:v4 userInfo:v6];
}

- (void)_presentPasswordDialogForRoute:(id)a3 withOptions:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = +[MRDMediaRemoteServer server];
  [v7 postClientNotificationNamed:kMRMediaRemoteWillPresentRouteAuthenticationPromptNotification];

  id v8 = [v6 extendedInfo];
  if ([v8 requiresPIN]) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 1;
  }
  BOOL v10 = [v6 name];
  uint64_t v11 = [(MRDAVRoutingServer *)self _passwordDialogForRouteWithName:v10 usingInputType:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013E8F4;
  v13[3] = &unk_10041E490;
  void v13[4] = self;
  id v14 = v6;
  unsigned int v15 = a4;
  id v12 = v6;
  [v11 presentWithCompletion:v13];
  [(MRDAVRoutingServer *)self setActivePasswordDialog:v11];
}

- (void)_storePassword:(id)a3 forRoute:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 MACAddress];
  uint64_t v9 = [v6 uniqueIdentifier];
  BOOL v10 = [v6 name];

  id v11 = [(MRDAVRoutingServer *)self _preferredIdentifierForMACAddress:v8 identifier:v9 name:v10];

  MSVKeychainSetKeychainValue();
}

- (void)_storePassword:(id)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 identifyingMACAddress];
  uint64_t v9 = [v6 ID];
  BOOL v10 = [v6 name];

  id v11 = [(MRDAVRoutingServer *)self _preferredIdentifierForMACAddress:v8 identifier:v9 name:v10];

  MSVKeychainSetKeychainValue();
}

- (id)_preferredIdentifierForMACAddress:(id)a3 identifier:(id)a4 name:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)[v7 length] < 6)
  {
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = v9;
    }
  }
  else
  {
    [v7 bytes];
    HardwareAddressToCString();
    id v10 = +[NSString stringWithUTF8String:v13];
  }
  id v11 = v10;

  return v11;
}

- (id)_createAirPlaySecuritySettings
{
  if (MRSupportsMediaControlReceiver())
  {
    int v8 = 0;
    if (qword_10047E318 != -1) {
      dispatch_once(&qword_10047E318, &stru_10041E568);
    }
    if (qword_10047E320 && dlsym((void *)qword_10047E320, "APReceiverMediaRemoteXPCClient_CopyProperty"))
    {
      uint64_t v2 = (void *)((uint64_t (*)(uint64_t, uint64_t))off_1004779A8[0])(@"AirPlaySecuritySetting", (uint64_t)&v8);
      uint64_t v3 = v2;
      if (v8 || !v2)
      {
        char v5 = _MRLogForCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1003302B4(&v8, v5);
        }

        uint64_t v4 = 0;
      }
      else
      {
        uint64_t v4 = [v2 objectForKeyedSubscript:@"password"];
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v6 = (void *)MRAVAirPlaySecuritySettingsCreate();

  return v6;
}

- (void)createEndpointForOutputDeviceIDs:(id)a3 details:(id)a4 completion:(id)a5
{
}

- (void)createEndpointForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5 completion:(id)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10013EE70;
  v9[3] = &unk_10041E4B8;
  id v10 = a6;
  id v8 = v10;
  +[MRDCreateEndpointRequest createEndpointWithOutputDeviceUIDs:a3 timeout:a5 details:v9 completion:30.0];
}

- (id)createTransientEndpointForOutputDeviceUID:(id)a3 details:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSDate now];
  id v9 = objc_alloc((Class)NSMutableString);
  id v10 = [v7 requestID];
  id v11 = (__CFString *)[v9 initWithFormat:@"%@<%@>", @"createTransientEndpointForOutputDeviceUID", v10];

  if (v6) {
    [(__CFString *)v11 appendFormat:@" for %@", v6];
  }
  id v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    CFStringRef v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v13 = [(MRDAVHostedRoutingService *)self->_hostedRoutingService hostedRoutingController];
  id v14 = [v13 availableOutputDevices];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10013F2B8;
  v33[3] = &unk_100417940;
  id v15 = v6;
  id v34 = v15;
  id v16 = objc_msgSend(v14, "msv_firstWhere:", v33);
  if (v16)
  {
    id v17 = [(MRDAVHostedRoutingService *)self->_hostedRoutingService hostedRoutingController];
    __int16 v43 = v16;
    id v18 = +[NSArray arrayWithObjects:&v43 count:1];
    id v19 = [v17 makeEndpointWithOutputDevices:v18 options:0];
  }
  else
  {
    id v19 = 0;
  }
  BOOL v20 = [v19 debugName];

  unsigned int v21 = _MRLogForCategory();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      long long v23 = [v7 requestID];
      [v19 debugName];
      id v32 = v7;
      v25 = id v24 = v8;
      id v26 = +[NSDate date];
      [v26 timeIntervalSinceDate:v24];
      *(_DWORD *)long long buf = 138544130;
      CFStringRef v36 = @"createTransientEndpointForOutputDeviceUID";
      __int16 v37 = 2114;
      uint64_t v38 = v23;
      __int16 v39 = 2112;
      uint64_t v40 = v25;
      __int16 v41 = 2048;
      uint64_t v42 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);

      id v8 = v24;
      id v7 = v32;
    }
  }
  else if (v22)
  {
    uint64_t v28 = [v7 requestID];
    uint64_t v29 = +[NSDate date];
    [v29 timeIntervalSinceDate:v8];
    *(_DWORD *)long long buf = 138543874;
    CFStringRef v36 = @"createTransientEndpointForOutputDeviceUID";
    __int16 v37 = 2114;
    uint64_t v38 = v28;
    __int16 v39 = 2048;
    uint64_t v40 = v30;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
  }

  return v19;
}

- (void)removeOutputDeviceUIDsFromParentGroup:(id)a3 details:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSDate now];
  id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.mediaremote.removeFromParentGroup", v11);

  id v12 = objc_alloc((Class)NSMutableString);
  id v13 = [v8 requestID];
  id v14 = [v12 initWithFormat:@"%@<%@>", @"removeOutputDeviceUIDsFromParentGroup", v13];

  if (v7) {
    [v14 appendFormat:@" for %@", v7];
  }
  id v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = sub_10013D6B4;
  v58 = sub_10013D6C4;
  id v59 = 0;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10013F838;
  v48[3] = &unk_10041E4E0;
  p_long long buf = &buf;
  id v31 = v8;
  id v49 = v31;
  id v28 = v10;
  id v50 = v28;
  id v27 = v9;
  id v51 = v27;
  uint64_t v29 = objc_retainBlock(v48);
  id v16 = dispatch_group_create();
  id v17 = +[MRDMediaRemoteServer server];
  id v18 = [v17 deviceInfo];
  id v19 = [v18 deviceUID];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v7;
  id v20 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v45;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v23 isEqualToString:v19])
        {
          id v24 = +[MRAVLocalEndpoint sharedLocalEndpoint];
          dispatch_group_enter(v16);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10013F998;
          v41[3] = &unk_1004159E0;
          __int16 v43 = &buf;
          uint64_t v42 = v16;
          [v24 removeOutputDeviceFromParentGroup:v19 queue:queue completion:v41];
        }
        else
        {
          dispatch_group_enter(v16);
          __int16 v53 = v23;
          id v25 = +[NSArray arrayWithObjects:&v53 count:1];
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10013F9F8;
          v36[3] = &unk_10041E508;
          __int16 v37 = v16;
          uint64_t v38 = v23;
          __int16 v39 = queue;
          uint64_t v40 = &buf;
          [(MRDAVRoutingServer *)self createEndpointForOutputDeviceIDs:v25 details:v31 completion:v36];

          id v24 = v37;
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v20);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013FB5C;
  block[3] = &unk_100416938;
  id v35 = v29;
  id v26 = v29;
  dispatch_group_notify(v16, queue, block);

  _Block_object_dispose(&buf, 8);
}

- (id)_predictGroupLeaderForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSDate now];
  id v11 = objc_alloc((Class)NSMutableString);
  id v12 = [v9 requestID];
  id v13 = (__CFString *)[v11 initWithFormat:@"%@<%@>", @"PredictGroupLeader", v12];

  if (v8) {
    [(__CFString *)v13 appendFormat:@" for %@", v8];
  }
  id v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    CFStringRef v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v15 = [(MRDAVHostedRoutingService *)self->_hostedRoutingService hostedRoutingController];
  id v16 = [v15 availableOutputDevices];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10013FED0;
  v31[3] = &unk_100417940;
  id v17 = v8;
  id v32 = v17;
  id v18 = objc_msgSend(v16, "msv_filter:", v31);
  id v19 = [(MRDAVHostedRoutingService *)self->_hostedRoutingService hostedRoutingController];
  id v20 = [v19 determineGroupLeaderForOutputDevices:v18 options:a4 | 0x3E];

  uint64_t v21 = _MRLogForCategory();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (!v22) {
      goto LABEL_11;
    }
    long long v23 = [v9 requestID];
    id v24 = +[NSDate date];
    [v24 timeIntervalSinceDate:v10];
    *(_DWORD *)long long buf = 138544130;
    CFStringRef v34 = @"PredictGroupLeader";
    __int16 v35 = 2114;
    CFStringRef v36 = v23;
    __int16 v37 = 2112;
    uint64_t v38 = v20;
    __int16 v39 = 2048;
    uint64_t v40 = v25;
    id v26 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v27 = v21;
    uint32_t v28 = 42;
  }
  else
  {
    if (!v22) {
      goto LABEL_11;
    }
    long long v23 = [v9 requestID];
    id v24 = +[NSDate date];
    [v24 timeIntervalSinceDate:v10];
    *(_DWORD *)long long buf = 138543874;
    CFStringRef v34 = @"PredictGroupLeader";
    __int16 v35 = 2114;
    CFStringRef v36 = v23;
    __int16 v37 = 2048;
    uint64_t v38 = v29;
    id v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v27 = v21;
    uint32_t v28 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);

LABEL_11:

  return v20;
}

- (void)_reevaluateAirplayActive
{
  uint64_t v3 = +[MRUserSettings currentSettings];
  unsigned int v4 = [v3 supportMultiplayerHost];

  if (v4)
  {
    id v6 = +[MRDMediaRemoteServer server];
    char v5 = [v6 allClients];
    -[MRDAVRoutingServer setAirplayActive:](self, "setAirplayActive:", objc_msgSend(v5, "mr_any:", &stru_10041E528));
  }
}

- (MRDAVRoutingDataSource)routingDataSource
{
  return self->_routingDataSource;
}

- (MRDAVHostedRoutingService)hostedRoutingService
{
  return self->_hostedRoutingService;
}

- (MRDAVSystemEndpointController)systemEndpointController
{
  return self->_systemEndpointController;
}

- (MRDRouteRecommendationController)recommendationController
{
  return self->_recommendationController;
}

- (BOOL)airplayActive
{
  return self->_airplayActive;
}

- (MSVSystemDialog)activePasswordDialog
{
  return self->_activePasswordDialog;
}

- (void)setActivePasswordDialog:(id)a3
{
}

- (MSVSystemDialog)activeDialog
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDialog);

  return (MSVSystemDialog *)WeakRetained;
}

- (void)setActiveDialog:(id)a3
{
}

- (MROSTransaction)discoveryTransaction
{
  return self->_discoveryTransaction;
}

- (void)setDiscoveryTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryTransaction, 0);
  objc_destroyWeak((id *)&self->_activeDialog);
  objc_storeStrong((id *)&self->_activePasswordDialog, 0);
  objc_storeStrong((id *)&self->_recommendationController, 0);
  objc_storeStrong((id *)&self->_systemEndpointController, 0);
  objc_storeStrong((id *)&self->_hostedRoutingService, 0);
  objc_storeStrong((id *)&self->_routingDataSource, 0);
  objc_storeStrong((id *)&self->_routingContinuityManager, 0);
  objc_storeStrong((id *)&self->_preemptiveRemoteControlConnectionManager, 0);
  objc_storeStrong((id *)&self->_nowPlayingAirPlaySessionController, 0);
  objc_storeStrong((id *)&self->_activeMediaRouteDonor, 0);
  objc_storeStrong((id *)&self->_routedBackgroundActivityManager, 0);
  objc_storeStrong((id *)&self->_mediaActivityManager, 0);
  objc_storeStrong((id *)&self->_proactivePrepareForSetQueueSender, 0);
  objc_storeStrong((id *)&self->_topologySimplifier, 0);
  objc_storeStrong((id *)&self->_localDeviceCommitManager, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_homeServer, 0);
  objc_storeStrong((id *)&self->_mostRecentlyPickedDevices, 0);
  objc_storeStrong((id *)&self->_reconnaissanceSessions, 0);
  objc_storeStrong((id *)&self->_lastClusterConnectionFailureDate, 0);
  objc_storeStrong((id *)&self->_routeUIDsToIgnorePortStatusFailures, 0);

  objc_storeStrong((id *)&self->_autoConnectionController, 0);
}

@end