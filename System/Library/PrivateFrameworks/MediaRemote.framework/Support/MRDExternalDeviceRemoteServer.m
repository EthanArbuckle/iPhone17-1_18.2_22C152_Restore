@interface MRDExternalDeviceRemoteServer
+ (unint64_t)minimumSupportedHangdogApplicationVersion;
+ (unint64_t)minimumSupportedProtocolVersion;
- (BOOL)_connection:(id)a3 canReceiveUpdatesForOrigin:(id)a4;
- (BOOL)_connection:(id)a3 canReceiveUpdatesForPlayerPath:(id)a4;
- (BOOL)_connection:(id)a3 wasPreviouslySubscribedToPlayerPath:(id)a4;
- (BOOL)_isConnectionForManagedConfigIDAllowed:(id)a3;
- (BOOL)_origin:(id)a3 client:(id)a4 matchesSubscribedPlayerPath:(id)a5;
- (BOOL)_origin:(id)a3 client:(id)a4 player:(id)a5 matchesSubscribedPlayerPath:(id)a6;
- (BOOL)_origin:(id)a3 matchesSubscribedPlayerPath:(id)a4;
- (BOOL)_playerPath:(id)a3 matchesSubscribedPlayerPath:(id)a4;
- (BOOL)_shouldSendStateUpdateMessageFromSource:(int64_t)a3 toClient:(id)a4;
- (BOOL)_verifyClientVersionCompatibility:(id)a3 withError:(id *)a4;
- (MRDAVRoutingDataSource)routingDataSource;
- (MRDExternalDeviceRemoteServer)init;
- (MRDExternalDeviceRemoteServer)initWithRoutingDataSource:(id)a3;
- (MRDRemoteControlService)remoteControlService;
- (NSArray)clients;
- (NSArray)endpoints;
- (NSMapTable)clientDisconnectionHandlers;
- (id)_clientForIdentifier:(id)a3;
- (id)_clientForPairingSession:(id)a3;
- (id)_createLocalizedOutputDevice:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6;
- (id)_createLocalizedOutputDevices:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6;
- (id)_findClientIf:(id)a3;
- (id)_unpair:(id)a3;
- (unsigned)serverDiscoveryModeForConfiguration:(id)a3;
- (void)_activeSystemEndpointDidChangeNotification:(id)a3;
- (void)_addNowPlayingStateToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5;
- (void)_addOutputDevicesToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5;
- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 nowPlayingClient:(id)a5;
- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 originClient:(id)a5;
- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 playerClient:(id)a5;
- (void)_addToMessage:(id)a3 withAllClusterDeviceMembers:(id)a4 block:(id)a5;
- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 outputDevice:(id)a5 withEndpoint:(id)a6;
- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5;
- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5 completion:(id)a6;
- (void)_broadcastKeyboardMessageWithState:(unint64_t)a3 text:(id)a4 attributes:(id)a5;
- (void)_broadcastRemoteTextInputMessageWithPayload:(id)a3;
- (void)_clearPlaybackQueueForPlayerPath:(id)a3;
- (void)_disconnectClient:(id)a3 withError:(id)a4;
- (void)_handleAdjustVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleClientConnection:(id)a3;
- (void)_handleClientUpdatesConfigMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCreateHostedEndpointRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handleDeletePairedDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleDeletePairingIdentityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleDeviceInfoRequest:(id)a3 fromClient:(id)a4;
- (void)_handleDeviceInfoUpdateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGenericMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetInputModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPairedDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVolumeControlCapabilitiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVolumeMutedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleInvalidateApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleLyricsEventMessage:(id)a3 fromClient:(id)a4;
- (void)_handleModifyOutputContextRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handleMuteVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackQueueRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionMigrateRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handleReceivedCommand:(id)a3 fromClient:(id)a4;
- (void)_handleReceivedVoiceInputMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterGameControllerMessage:(id)a3 client:(id)a4;
- (void)_handleRegisterHIDDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterVoiceInputDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendTelevisionCustomDataMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetConnectionStateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetConversationDetectionEnabledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetDiscoveryModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetInputModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetListeningModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetMessageLogging:(id)a3 fromClient:(id)a4;
- (void)_handleSetVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleTelevisionEndpointAvailableMessage:(id)a3 fromClient:(id)a4;
- (void)_handleTouchEvent:(_MRHIDTouchEvent *)a3 withDeviceID:(unint64_t)a4 fromClient:(id)a5;
- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdateActiveSystemEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_notifyAndDisconnectClient:(id)a3 withError:(id)a4;
- (void)_notifyAndDisconnectClients:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)_onQueue_registerDisconnectionHandler:(id)a3 forClient:(id)a4;
- (void)_prewarmMediaApps;
- (void)_registerCallbacks;
- (void)_sendMessageFromEndpoint:(id)a3 outputDevice:(id)a4 withSource:(int64_t)a5 handler:(id)a6;
- (void)_sendMessageFromEndpoint:(id)a3 withSource:(int64_t)a4 handler:(id)a5;
- (void)_sendStateUpdateMessageFromOrigin:(id)a3 source:(int64_t)a4 handler:(id)a5;
- (void)_sendStateUpdateMessageFromPlayerPath:(id)a3 source:(int64_t)a4 handler:(id)a5;
- (void)_setGameControllerInputMode:(unsigned int)a3;
- (void)_syncStateToClient:(id)a3;
- (void)addAuthorizationCallbackForOutputDevice:(id)a3 callback:(id)a4;
- (void)addAuthorizationCallbackForOutputDevice:(id)a3 client:(id)a4;
- (void)clearEndpointForClient:(id)a3;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)deviceInfoDidChangeNotification:(id)a3;
- (void)endpointDidAddOutputDeviceNotification:(id)a3;
- (void)endpointDidChangeOutputDeviceNotification:(id)a3;
- (void)endpointDidRemoveOutputDeviceNotification:(id)a3;
- (void)endpointVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)endpointVolumeDidChangeNotification:(id)a3;
- (void)endpointVolumeMutedDidChangeNotification:(id)a3;
- (void)externalDeviceClient:(id)a3 gameController:(unint64_t)a4 propertiesChanged:(id)a5;
- (void)gameControllerConnectionDidInterrupt:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)outputDevicesChanged:(id)a3 forConfiguration:(id)a4;
- (void)pairingSession:(id)a3 didCompleteExchangeWithError:(id)a4;
- (void)pairingSession:(id)a3 didPrepareExchangeData:(id)a4;
- (void)pairingSession:(id)a3 showSetupCode:(id)a4;
- (void)pinPairingDialogDidClose:(id)a3 forClient:(id)a4 userCancelled:(BOOL)a5;
- (void)playbackDidTimeoutNotification:(id)a3;
- (void)playerParticipantsDidChangeNotification:(id)a3;
- (void)purgeUnusedDiscoverySessions;
- (void)registerNotifications;
- (void)remoteControlService:(id)a3 didAcceptClientConnection:(id)a4;
- (void)removeAuthorizationCallbackForOutputDevice:(id)a3;
- (void)setServerDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)sleepObserverSystemWillSleep:(id)a3 completion:(id)a4;
- (void)start;
- (void)stateObserver:(id)a3 didReceiveClientDidUnregister:(id)a4;
- (void)stateObserver:(id)a3 didReceiveCoalescedNowPlayingStateChange:(id)a4 playerPath:(id)a5;
- (void)stateObserver:(id)a3 didReceiveDefaultSupportedCommandsChange:(id)a4 playerPath:(id)a5;
- (void)stateObserver:(id)a3 didReceiveNowPlayingClientChange:(id)a4;
- (void)stateObserver:(id)a3 didReceiveNowPlayingPlayerChange:(id)a4;
- (void)stateObserver:(id)a3 didReceivePlayerDidUnregister:(id)a4;
- (void)stateObserver:(id)a3 didReceiveVolumeControlCapabilitiesChange:(unsigned int)a4 playerPath:(id)a5;
- (void)stop;
- (void)updateASEAssertionForRemoteDeviceID:(id)a3 isAsserting:(BOOL)a4;
@end

@implementation MRDExternalDeviceRemoteServer

+ (unint64_t)minimumSupportedProtocolVersion
{
  return 1;
}

+ (unint64_t)minimumSupportedHangdogApplicationVersion
{
  return 74;
}

- (MRDExternalDeviceRemoteServer)initWithRoutingDataSource:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MRDExternalDeviceRemoteServer;
  v6 = [(MRDExternalDeviceRemoteServer *)&v36 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routingDataSource, a3);
    v8 = [[MRDRemoteControlService alloc] initWithRoutingDataSource:v5];
    remoteControlService = v7->_remoteControlService;
    v7->_remoteControlService = v8;

    [(MRDRemoteControlService *)v7->_remoteControlService setDelegate:v7];
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    connectedClients = v7->_connectedClients;
    v7->_connectedClients = v10;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    tvEndpoints = v7->_tvEndpoints;
    v7->_tvEndpoints = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeReconSessions = v7->_activeReconSessions;
    v7->_activeReconSessions = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDeviceRemoteServer.SerialQueue", v16);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v17;

    v7->_serverIsRunning = 0;
    v19 = objc_alloc_init(MRDNowPlayingStateObserver);
    stateObserver = v7->_stateObserver;
    v7->_stateObserver = v19;

    [(MRDNowPlayingStateObserver *)v7->_stateObserver setDelegate:v7];
    v7->_gameControllerInputMode = 0;
    v21 = objc_alloc_init(MRDPinPairingDialog);
    pinPairingDialog = v7->_pinPairingDialog;
    v7->_pinPairingDialog = v21;

    [(MRDPinPairingDialog *)v7->_pinPairingDialog setDelegate:v7];
    v23 = objc_alloc_init(MRDSleepObserver);
    sleepObserver = v7->_sleepObserver;
    v7->_sleepObserver = v23;

    [(MRDSleepObserver *)v7->_sleepObserver setDelegate:v7];
    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    outputDeviceCallbackTokens = v7->_outputDeviceCallbackTokens;
    v7->_outputDeviceCallbackTokens = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    discoverySessions = v7->_discoverySessions;
    v7->_discoverySessions = v27;

    v29 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    clientDisconnectionHandlers = v7->_clientDisconnectionHandlers;
    v7->_clientDisconnectionHandlers = v29;

    [(MRDExternalDeviceRemoteServer *)v7 registerNotifications];
    v31 = +[MRUserSettings currentSettings];
    [v31 transactionWaitDurationOnNetworkSend];
    v7->_transactionWaitDuration = v32;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D95C4;
    block[3] = &unk_100415CC8;
    v35 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v7;
}

- (MRDExternalDeviceRemoteServer)init
{
  return [(MRDExternalDeviceRemoteServer *)self initWithRoutingDataSource:0];
}

- (void)registerNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_activeSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
  [v3 addObserver:self selector:"endpointDidAddOutputDeviceNotification:" name:MRAVEndpointDidAddOutputDeviceNotification object:0];
  [v3 addObserver:self selector:"endpointDidChangeOutputDeviceNotification:" name:MRAVEndpointDidChangeOutputDeviceNotification object:0];
  [v3 addObserver:self selector:"endpointDidRemoveOutputDeviceNotification:" name:MRAVEndpointDidRemoveOutputDeviceNotification object:0];
  [v3 addObserver:self selector:"endpointVolumeControlCapabilitiesDidChangeNotification:" name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
  [v3 addObserver:self selector:"endpointVolumeDidChangeNotification:" name:kMRAVEndpointVolumeDidChangeNotification object:0];
  [v3 addObserver:self selector:"endpointVolumeMutedDidChangeNotification:" name:MRAVEndpointVolumeMutedDidChangeNotification object:0];
  [v3 addObserver:self selector:"deviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
  [v3 addObserver:self selector:"playerParticipantsDidChangeNotification:" name:MRPlaybackQueueParticipantsDidChangeForPlayerNotification object:0];
  [v3 addObserver:self selector:"playbackDidTimeoutNotification:" name:_MRMediaRemotePlaybackDidTimeoutNotification object:0];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(MRDExternalDeviceRemoteServer *)self stop];
  [(MRDNowPlayingStateObserver *)self->_stateObserver setDelegate:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_connectedClients;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) cryptoSession];
        [v9 setDelegate:0];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)MRDExternalDeviceRemoteServer;
  [(MRDExternalDeviceRemoteServer *)&v10 dealloc];
}

- (void)start
{
  self->_serverIsRunning = 1;
}

- (void)stop
{
  self->_serverIsRunning = 0;
}

- (void)clearEndpointForClient:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Removing television endpoint for client %{public}@", buf, 0xCu);
  }

  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D9A64;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v8);
}

- (NSArray)clients
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000D9B60;
  objc_super v10 = sub_1000D9B70;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D9B78;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)endpoints
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000D9B60;
  objc_super v10 = sub_1000D9B70;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D9CB4;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)remoteControlService:(id)a3 didAcceptClientConnection:(id)a4
{
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v7 type];
  id v9 = v6;
  if ([v7 type] == (id)15 || objc_msgSend(v7, "type") == (id)37)
  {
    id v10 = v7;
    id v11 = [v10 deviceInfo];

    if (v11)
    {
      long long v12 = [v10 deviceInfo];
      [v9 setDeviceInfo:v12];

      long long v13 = [v10 supportedProtocolMessages];
      [v9 setSupportedMessages:v13];

      long long v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v10 deviceInfo];
        *(_DWORD *)buf = 138543362;
        v46 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received device info: %{public}@", buf, 0xCu);
      }
    }
  }
  id v44 = 0;
  unsigned __int8 v16 = [(MRDExternalDeviceRemoteServer *)self _verifyClientVersionCompatibility:v9 withError:&v44];
  Error = v44;
  if ((v16 & 1) == 0)
  {
    v21 = _MRLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10032E3E4();
    }
    goto LABEL_18;
  }
  if ([v7 encryptionType] == (id)1)
  {
    if ([v9 cryptoEnabled])
    {
      if ([v7 encryptionType] != (id)1
        || ([v9 cryptoSession],
            v18 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v19 = [v18 isValid],
            v18,
            (v19 & 1) == 0))
      {
        v20 = _MRLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10032E3B0();
        }

        v21 = Error;
        Error = MRMediaRemoteCreateError();
LABEL_18:
      }
    }
  }
  if (([v9 isAllowedToSendMessageType:v8] & 1) == 0)
  {
    v22 = _MRLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10032E348();
    }

    uint64_t v23 = MRMediaRemoteCreateError();
    Error = v23;
  }
  if (Error)
  {
    v24 = [objc_alloc((Class)MRProtocolMessage) initWithUnderlyingCodableMessage:0 error:Error];
    [v7 replyWithMessage:v24];
LABEL_25:
  }
  else if (v8 > 105)
  {
    switch(v8)
    {
      case 121:
        [(MRDExternalDeviceRemoteServer *)self _handleCreateHostedEndpointRequestMessage:v7 fromClient:v9];
        break;
      case 122:
      case 123:
      case 124:
      case 127:
      case 129:
      case 131:
      case 133:
        break;
      case 125:
        [(MRDExternalDeviceRemoteServer *)self _handleAdjustVolumeMessage:v7 fromClient:v9];
        break;
      case 126:
        [(MRDExternalDeviceRemoteServer *)self _handleGetVolumeMutedMessage:v7 fromClient:v9];
        break;
      case 128:
        [(MRDExternalDeviceRemoteServer *)self _handleMuteVolumeMessage:v7 fromClient:v9];
        break;
      case 130:
        [(MRDExternalDeviceRemoteServer *)self _handleSetConversationDetectionEnabledMessage:v7 fromClient:v9];
        break;
      case 132:
        [(MRDExternalDeviceRemoteServer *)self _handleRequestGroupSessionMessage:v7 fromClient:v9];
        break;
      case 134:
        [(MRDExternalDeviceRemoteServer *)self _handleCreateApplicationConnectionMessage:v7 fromClient:v9];
        break;
      case 135:
        [(MRDExternalDeviceRemoteServer *)self _handleApplicationConnectionMessage:v7 fromClient:v9];
        break;
      case 136:
        [(MRDExternalDeviceRemoteServer *)self _handleInvalidateApplicationConnectionMessage:v7 fromClient:v9];
        break;
      default:
        if (v8 == 106)
        {
          [(MRDExternalDeviceRemoteServer *)self _handleTriggerAudioFadeMessage:v7 fromClient:v9];
        }
        else if (v8 == 110)
        {
          [(MRDExternalDeviceRemoteServer *)self _handleSetListeningModeMessage:v7 fromClient:v9];
        }
        break;
    }
  }
  else
  {
    switch(v8)
    {
      case 0:
        v24 = _MRLogForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10032E2D8(v24, v27, v28, v29, v30, v31, v32, v33);
        }
        goto LABEL_25;
      case 1:
        [(MRDExternalDeviceRemoteServer *)self _handleReceivedCommand:v7 fromClient:v9];
        break;
      case 2:
      case 3:
      case 4:
      case 5:
      case 7:
      case 9:
      case 11:
      case 12:
      case 13:
      case 14:
      case 17:
      case 20:
      case 22:
      case 23:
      case 26:
      case 27:
      case 29:
      case 30:
      case 33:
      case 34:
      case 35:
      case 45:
      case 46:
      case 47:
      case 50:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 63:
      case 64:
      case 65:
      case 66:
      case 71:
      case 72:
      case 74:
        break;
      case 6:
        [(MRDExternalDeviceRemoteServer *)self _handleRegisterHIDDeviceMessage:v7 fromClient:v9];
        break;
      case 8:
      case 39:
        id v25 = [v7 buttonEvent];
        -[MRDExternalDeviceRemoteServer _handleReceivedButtonEvent:fromClient:](self, "_handleReceivedButtonEvent:fromClient:", v25, v26, v9);
        break;
      case 10:
        id v34 = v7;
        id v35 = v34;
        if (v34) {
          [v34 event];
        }
        else {
          memset(v43, 0, sizeof(v43));
        }
        id v39 = [v35 virtualDeviceID];
        v40 = v43;
        goto LABEL_87;
      case 15:
        [(MRDExternalDeviceRemoteServer *)self _handleDeviceInfoRequest:v7 fromClient:v9];
        break;
      case 16:
        [(MRDExternalDeviceRemoteServer *)self _handleClientUpdatesConfigMessage:v7 fromClient:v9];
        break;
      case 18:
        id v36 = v7;
        objc_msgSend(v9, "gameControllerWithID:", objc_msgSend(v36, "controllerID"));
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        v37 = [v36 event];

        [v35 sendGameControllerEvent:v37];
        goto LABEL_88;
      case 19:
        [(MRDExternalDeviceRemoteServer *)self _handleRegisterGameControllerMessage:v7 client:v9];
        break;
      case 21:
        objc_msgSend(v9, "removeGameController:", objc_msgSend(v7, "controllerID"));
        break;
      case 24:
        [(MRDExternalDeviceRemoteServer *)self _handleGetKeyboardSessionMessage:v7 fromClient:v9];
        break;
      case 25:
        [(MRDExternalDeviceRemoteServer *)self _handleTextInputMessage:v7 fromClient:v9];
        break;
      case 28:
        [(MRDExternalDeviceRemoteServer *)self _handleRegisterVoiceInputDeviceMessage:v7 fromClient:v9];
        break;
      case 31:
        [(MRDExternalDeviceRemoteServer *)self _handleReceivedVoiceInputMessage:v7 fromClient:v9];
        break;
      case 32:
        [(MRDExternalDeviceRemoteServer *)self _handlePlaybackQueueRequestMessage:v7 fromClient:v9];
        break;
      case 36:
        id v35 = [objc_alloc((Class)MRSetConnectionStateMessage) initWithConnectionState:2];
        [(MRDExternalDeviceRemoteServer *)self clientConnection:v9 didReceiveMessage:v35];
        goto LABEL_88;
      case 37:
        [(MRDExternalDeviceRemoteServer *)self _handleDeviceInfoUpdateMessage:v7 fromClient:v9];
        break;
      case 38:
        [(MRDExternalDeviceRemoteServer *)self _handleSetConnectionStateMessage:v7 fromClient:v9];
        break;
      case 40:
        [(MRDExternalDeviceRemoteServer *)self _handleSetHiliteModeMessage:v7 fromClient:v9];
        break;
      case 41:
        sub_10016A990(1);
        break;
      case 42:
        [(MRDExternalDeviceRemoteServer *)self _handleGenericMessage:v7 fromClient:v9];
        break;
      case 43:
        id v38 = v7;
        id v35 = v38;
        if (v38)
        {
          [v38 event];
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
        }
        id v39 = objc_msgSend(v35, "virtualDeviceID", v41, v42);
        v40 = &v41;
LABEL_87:
        [(MRDExternalDeviceRemoteServer *)self _handleTouchEvent:v40 withDeviceID:v39 fromClient:v9];
LABEL_88:

        break;
      case 44:
        [(MRDExternalDeviceRemoteServer *)self _handleLyricsEventMessage:v7 fromClient:v9];
        break;
      case 48:
        [(MRDExternalDeviceRemoteServer *)self _handleModifyOutputContextRequestMessage:v7 fromClient:v9];
        break;
      case 49:
        [(MRDExternalDeviceRemoteServer *)self _handleGetVolumeMessage:v7 fromClient:v9];
        break;
      case 51:
        [(MRDExternalDeviceRemoteServer *)self _handleSetVolumeMessage:v7 fromClient:v9];
        break;
      case 62:
        [(MRDExternalDeviceRemoteServer *)self _handleGetVolumeControlCapabilitiesMessage:v7 fromClient:v9];
        break;
      case 67:
        [(MRDExternalDeviceRemoteServer *)self _handleRemoteTextInputMessage:v7 fromClient:v9];
        break;
      case 68:
        [(MRDExternalDeviceRemoteServer *)self _handleGetRemoteTextInputSessionMessage:v7 fromClient:v9];
        break;
      case 69:
        notify_post((const char *)[@"kAirPlayWHANotification_BreakAwayFromCurrentGroup" UTF8String]);
        break;
      case 70:
        [(MRDExternalDeviceRemoteServer *)self _handlePlaybackSessionRequestMessage:v7 fromClient:v9];
        break;
      case 73:
        [(MRDExternalDeviceRemoteServer *)self _handlePlaybackSessionMigrateRequestMessage:v7 fromClient:v9];
        break;
      case 75:
        [(MRDExternalDeviceRemoteServer *)self _handlePlaybackSessionMigrateBeginMessage:v7 fromClient:v9];
        break;
      case 76:
        [(MRDExternalDeviceRemoteServer *)self _handlePlaybackSessionMigrateEndMessage:v7 fromClient:v9];
        break;
      case 77:
        [(MRDExternalDeviceRemoteServer *)self _handleUpdateActiveSystemEndpointMessage:v7 fromClient:v9];
        break;
      default:
        if (v8 == 101) {
          [(MRDExternalDeviceRemoteServer *)self _handleSetDiscoveryModeMessage:v7 fromClient:v9];
        }
        break;
    }
  }
}

- (void)stateObserver:(id)a3 didReceiveClientDidUnregister:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10032E418();
  }

  id v7 = objc_alloc((Class)MRRemoveClientMessage);
  uint64_t v8 = [v5 client];
  id v9 = [v7 initWithClient:v8];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DA770;
  v11[3] = &unk_10041B878;
  id v12 = v9;
  id v10 = v9;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v5 source:1 handler:v11];
}

- (void)stateObserver:(id)a3 didReceivePlayerDidUnregister:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10032E480();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DA868;
  v8[3] = &unk_10041B878;
  id v9 = [objc_alloc((Class)MRRemovePlayerMessage) initWithPlayerPath:v5];
  id v7 = v9;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v5 source:1 handler:v8];
}

- (void)stateObserver:(id)a3 didReceiveNowPlayingClientChange:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10032E4E8();
  }

  id v7 = objc_alloc_init((Class)MRProtocolMessageOptions);
  [v7 setPriority:4];
  uint64_t v8 = +[MRDMediaRemoteServer server];
  id v9 = [v8 nowPlayingServer];

  id v10 = objc_alloc((Class)MRSetNowPlayingClientMessage);
  id v11 = [v5 client];
  id v12 = [v10 initWithClient:v11];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DAA04;
  v17[3] = &unk_10041B8A0;
  id v18 = v7;
  id v19 = v12;
  v20 = self;
  id v21 = v5;
  id v22 = v9;
  id v13 = v9;
  id v14 = v5;
  id v15 = v12;
  id v16 = v7;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v14 source:1 handler:v17];
}

- (void)stateObserver:(id)a3 didReceiveNowPlayingPlayerChange:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10032E550();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DAC24;
  v8[3] = &unk_10041B878;
  id v9 = [objc_alloc((Class)MRSetNowPlayingPlayerMessage) initWithPlayerPath:v5];
  id v7 = v9;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v5 source:1 handler:v8];
}

- (void)stateObserver:(id)a3 didReceiveVolumeControlCapabilitiesChange:(unsigned int)a4 playerPath:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  uint64_t v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10032E5B8(v5, v8);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DAD20;
  v10[3] = &unk_10041B878;
  id v11 = [objc_alloc((Class)MRLegacyVolumeControlCapabilitiesDidChangeMessage) initWithCapabilities:v5];
  id v9 = v11;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v7 source:2 handler:v10];
}

- (void)stateObserver:(id)a3 didReceiveDefaultSupportedCommandsChange:(id)a4 playerPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10032E648();
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DAEBC;
  v16[3] = &unk_10041B8C8;
  id v17 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  id v18 = v7;
  id v19 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v17;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000DAF84;
  v14[3] = &unk_10041B8F0;
  id v15 = objc_retainBlock(v16);
  id v13 = v15;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v10 source:1 handler:v14];
}

- (void)stateObserver:(id)a3 didReceiveCoalescedNowPlayingStateChange:(id)a4 playerPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10032E6B0();
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DB124;
  v12[3] = &unk_10041B918;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v10 source:1 handler:v12];
}

- (void)pairingSession:(id)a3 didPrepareExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDExternalDeviceRemoteServer *)self _clientForPairingSession:v6];
  id v9 = _MRLogForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = [v7 length];
      id v12 = [v8 deviceInfo];
      id v13 = [v12 name];
      int v14 = 134218242;
      id v15 = v11;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Exchanging %llu bytes of crypto pairing data with client \"%{public}@\"", (uint8_t *)&v14, 0x16u);
    }
    id v9 = [objc_alloc((Class)MRCryptoPairingMessage) initWithPairingData:v7 status:0];
    [v8 sendMessage:v9];
  }
  else if (v10)
  {
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] ERROR: Unable to exchange pairing data. Unknown client for crypto pairing session: %{public}@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)pairingSession:(id)a3 showSetupCode:(id)a4
{
  id v6 = a4;
  id v7 = [(MRDExternalDeviceRemoteServer *)self _clientForPairingSession:a3];
  id v8 = +[MROrigin localOrigin];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DB6A4;
  v11[3] = &unk_10041B940;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  +[MRDeviceInfoRequest deviceInfoForOrigin:v8 queue:&_dispatch_main_q completion:v11];
}

- (void)pairingSession:(id)a3 didCompleteExchangeWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDExternalDeviceRemoteServer *)self _clientForPairingSession:v6];
  id v9 = [v8 deviceInfo];
  id v10 = [v9 name];

  if (!v7)
  {
    id v13 = _MRLogForCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    v19[0] = v10;
    id v14 = "[ExternalDeviceServer] Successfully opened security session with peer %{public}@";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_11;
  }
  if (!v8)
  {
    id v13 = _MRLogForCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    v19[0] = v6;
    id v14 = "[ExternalDeviceServer] ERROR: Unable to send pairing failure message. Unknown client for crypto pairing session: %{public}@";
    goto LABEL_10;
  }
  id v11 = [v7 code];
  id v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v19[0]) = v11;
    WORD2(v19[0]) = 2114;
    *(void *)((char *)v19 + 6) = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Returning OSStatus code %d back to %{public}@", buf, 0x12u);
  }

  id v13 = [objc_alloc((Class)MRCryptoPairingMessage) initWithPairingData:0 status:v11];
  [v8 sendMessage:v13];
LABEL_11:

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DBB40;
  v16[3] = &unk_1004158D8;
  void v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
}

- (void)pinPairingDialogDidClose:(id)a3 forClient:(id)a4 userCancelled:(BOOL)a5
{
  id v9 = a4;
  id v6 = [v9 cryptoSession];
  unsigned __int8 v7 = [v6 isValid];

  if ((v7 & 1) == 0)
  {
    Error = (void *)MRMediaRemoteCreateError();
    [(MRDExternalDeviceRemoteServer *)self _notifyAndDisconnectClient:v9 withError:Error];
  }
}

- (void)externalDeviceClient:(id)a3 gameController:(unint64_t)a4 propertiesChanged:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)MRGameControllerPropertiesMessage) initWithGameControllerProperties:v7 controllerID:a4];

  [v8 sendMessage:v9];
}

- (void)gameControllerConnectionDidInterrupt:(id)a3
{
}

- (id)_createLocalizedOutputDevice:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6
{
  if (a3)
  {
    BOOL v7 = a4;
    id v17 = a3;
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    id v13 = +[NSArray arrayWithObjects:&v17 count:1];

    id v14 = -[MRDExternalDeviceRemoteServer _createLocalizedOutputDevices:redactVolume:forClient:endpoint:](self, "_createLocalizedOutputDevices:redactVolume:forClient:endpoint:", v13, v7, v11, v10, v17);

    id v15 = [v14 firstObject];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_createLocalizedOutputDevices:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = objc_msgSend(a3, "mr_allOutputDevices");
  id v12 = objc_msgSend(v11, "mr_redactClusterMembers");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000DBF98;
  v25[3] = &unk_100417940;
  id v13 = v9;
  id v26 = v13;
  id v14 = objc_msgSend(v12, "msv_filter:", v25);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000DC02C;
  v22[3] = &unk_100418698;
  id v23 = v13;
  id v24 = v10;
  id v15 = v10;
  id v16 = v13;
  id v17 = objc_msgSend(v14, "msv_map:", v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000DC0A0;
  v20[3] = &unk_10041B960;
  BOOL v21 = a4;
  id v18 = objc_msgSend(v17, "msv_map:", v20);

  return v18;
}

- (void)endpointDidAddOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];

  BOOL v7 = [v6 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DC288;
  v10[3] = &unk_10041B988;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  [(MRDExternalDeviceRemoteServer *)self _sendMessageFromEndpoint:v8 outputDevice:v9 withSource:3 handler:v10];
}

- (void)endpointDidChangeOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];

  BOOL v7 = [v6 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DC4D0;
  v10[3] = &unk_10041B988;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  [(MRDExternalDeviceRemoteServer *)self _sendMessageFromEndpoint:v8 outputDevice:v9 withSource:3 handler:v10];
}

- (void)endpointDidRemoveOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];

  BOOL v7 = [v6 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DC6E4;
  v10[3] = &unk_10041B988;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  [(MRDExternalDeviceRemoteServer *)self _sendMessageFromEndpoint:v8 outputDevice:v9 withSource:3 handler:v10];
}

- (void)endpointVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];
  BOOL v7 = [v6 objectForKeyedSubscript:MRAVEndpointVolumeControlCapabilitiesUserInfoKey];

  id v8 = [v4 userInfo];

  id v9 = [v8 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];

  if (v9)
  {
    unsigned int v10 = [v7 intValue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000DC8C4;
    v11[3] = &unk_10041B9B0;
    void v11[4] = self;
    id v12 = v9;
    id v13 = v5;
    unsigned int v14 = v10;
    [(MRDExternalDeviceRemoteServer *)self _sendMessageFromEndpoint:v13 outputDevice:v12 withSource:2 handler:v11];
  }
}

- (void)endpointVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];
  BOOL v7 = [v6 objectForKeyedSubscript:MRAVEndpointVolumeUserInfoKey];

  id v8 = [v4 userInfo];

  id v9 = [v8 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];

  if (v9)
  {
    [v7 floatValue];
    int v11 = v10;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DCAD4;
    v12[3] = &unk_10041B9B0;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v5;
    int v15 = v11;
    [(MRDExternalDeviceRemoteServer *)self _sendMessageFromEndpoint:v14 outputDevice:v13 withSource:2 handler:v12];
  }
}

- (void)endpointVolumeMutedDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];
  BOOL v7 = [v6 objectForKeyedSubscript:MRAVEndpointVolumeMutedUserInfoKey];

  id v8 = [v4 userInfo];

  id v9 = [v8 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];

  if (v9)
  {
    unsigned __int8 v10 = [v7 BOOLValue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000DCCDC;
    v11[3] = &unk_10041B9D8;
    void v11[4] = self;
    id v12 = v9;
    id v13 = v5;
    unsigned __int8 v14 = v10;
    [(MRDExternalDeviceRemoteServer *)self _sendMessageFromEndpoint:v13 outputDevice:v12 withSource:2 handler:v11];
  }
}

- (void)deviceInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = MRGetPlayerPathFromUserInfo();

  BOOL v7 = [v4 userInfo];
  id v8 = MRGetDeviceInfoFromUserInfo();

  if (v8)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = sub_1000D9B60;
    v13[4] = sub_1000D9B70;
    id v14 = 0;
    id v9 = [v6 origin];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000DCEE8;
    v10[3] = &unk_10041BA00;
    id v12 = v13;
    id v11 = v8;
    [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromOrigin:v9 source:0 handler:v10];

    _Block_object_dispose(v13, 8);
  }
}

- (void)playerParticipantsDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = MRGetPlayerPathFromUserInfo();

  if (v5 && [v5 isResolved])
  {
    id v6 = +[MRDMediaRemoteServer server];
    BOOL v7 = [v6 nowPlayingServer];
    id v8 = [v7 queryExistingPlayerPath:v5];

    id v9 = [v8 playerClient];
    unsigned __int8 v10 = v9;
    if (v9)
    {
      id v11 = [v9 participantDataSource];

      if (v11)
      {
        id v12 = objc_alloc((Class)MRPlayerClientParticipantsUpdateMessage);
        id v13 = [v10 playerPath];
        id v14 = [v10 participantDataSource];
        int v15 = [v14 participants];
        id v16 = [v12 initWithPlayerPath:v13 participants:v15];

        id v17 = [v5 origin];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        void v19[2] = sub_1000DD11C;
        v19[3] = &unk_10041B878;
        id v20 = v16;
        id v18 = v16;
        [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromOrigin:v17 source:1 handler:v19];
      }
    }
  }
}

- (void)playbackDidTimeoutNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = MRGetOriginFromUserInfo();

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1000D9B60;
  void v11[4] = sub_1000D9B70;
  id v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DD258;
  v8[3] = &unk_10041BA00;
  unsigned __int8 v10 = v11;
  id v7 = v6;
  id v9 = v7;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromOrigin:v7 source:1 handler:v8];

  _Block_object_dispose(v11, 8);
}

- (void)_addToMessage:(id)a3 withAllClusterDeviceMembers:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = objc_msgSend(a4, "clusterComposition", 0);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v15 = [v14 uid];
        id v16 = v8[2](v8, v15, [v14 deviceSubtype]);

        if (v16) {
          [v7 addMessage:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)_activeSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MRUserSettings currentSettings];
  unsigned __int8 v6 = [v5 disablePairedDeviceActiveEndpointSync];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:MRUpdateActiveSystemEndpointRequestUserInfoKey];
    id v9 = [v8 copy];

    if (v9
      && ![v9 type]
      && ([v9 isPairedDeviceSync] & 1) == 0
      && ([v9 suppressPairedDeviceSync] & 1) == 0)
    {
      uint64_t v10 = [v9 outputDeviceUID];
      if (!v10) {
        goto LABEL_8;
      }
      id v11 = (void *)v10;
      uint64_t v12 = [v9 outputDeviceUID];
      id v13 = +[MRAVOutputDevice localDeviceUID];
      unsigned int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
LABEL_8:
        int v15 = +[MROrigin localOrigin];
        id v16 = +[MRDeviceInfoRequest deviceInfoForOrigin:v15];

        long long v17 = [v16 WHAIdentifier];
        [v9 setOutputDeviceUID:v17];
      }
      id v18 = [objc_alloc((Class)MRUpdateActiveSystemEndpointMessage) initWithRequest:v9];
      long long v19 = +[MROrigin localOrigin];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000DD6E0;
      v21[3] = &unk_10041B878;
      id v22 = v18;
      id v20 = v18;
      [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromOrigin:v19 source:4 handler:v21];
    }
  }
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x600000000000001uLL:
      [(MRDExternalDeviceRemoteServer *)self _handleGetInputModeMessage:xdict fromClient:v6];
      break;
    case 0x600000000000002uLL:
      [(MRDExternalDeviceRemoteServer *)self _handleSetInputModeMessage:xdict fromClient:v6];
      break;
    case 0x600000000000003uLL:
      [(MRDExternalDeviceRemoteServer *)self _handleDeletePairingIdentityMessage:xdict fromClient:v6];
      break;
    case 0x600000000000004uLL:
      [(MRDExternalDeviceRemoteServer *)self _handleGetPairedDevicesMessage:xdict fromClient:v6];
      break;
    case 0x600000000000005uLL:
      [(MRDExternalDeviceRemoteServer *)self _handleDeletePairedDeviceMessage:xdict fromClient:v6];
      break;
    case 0x600000000000006uLL:
      [(MRDExternalDeviceRemoteServer *)self _handleSetMessageLogging:xdict fromClient:v6];
      break;
    case 0x600000000000009uLL:
      [(MRDExternalDeviceRemoteServer *)self _handleTelevisionEndpointAvailableMessage:xdict fromClient:v6];
      break;
    case 0x60000000000000AuLL:
      [(MRDExternalDeviceRemoteServer *)self _handleSendTelevisionCustomDataMessage:xdict fromClient:v6];
      break;
    default:
      break;
  }
}

- (void)sleepObserverSystemWillSleep:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id Error = (id)MRMediaRemoteCreateError();
  id v6 = [(MRDExternalDeviceRemoteServer *)self clients];
  [(MRDExternalDeviceRemoteServer *)self _notifyAndDisconnectClients:v6 withError:Error completion:v5];
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DD95C;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)_handleClientConnection:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Client connected: %{public}@", buf, 0xCu);
  }

  serialQueue = self->_serialQueue;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1000DDD34;
  unsigned int v14 = &unk_1004158D8;
  int v15 = self;
  id v16 = v4;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, &v11);
  id v8 = +[MRUserSettings currentSettings];
  [v8 externalDeviceSleepAssertionOnClientConnectDuration];
  uint64_t v10 = [[MRDSleepAssertion alloc] initWithName:@"com.apple.MediaRemote.Television.KeepAlive10SecondsForUser" timeout:v9];
  [(MRDExternalDeviceRemoteServer *)self _prewarmMediaApps];
  [v7 requestDestinationEndpoint:0];
}

- (void)_prewarmMediaApps
{
  id v2 = objc_alloc((Class)MRClient);
  id v3 = (void *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
  id v9 = [v2 initWithBundleIdentifier:v3];

  id v4 = +[MROrigin localOrigin];
  MRMediaRemoteGetSupportedCommandsForClient();

  id v5 = objc_alloc((Class)MRClient);
  id v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  id v7 = [v5 initWithBundleIdentifier:v6];

  id v8 = +[MROrigin localOrigin];
  MRMediaRemoteGetSupportedCommandsForClient();
}

- (void)_disconnectClient:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] MRExternalClientConnection did disconnect client: %{public}@ with error %{public}@", buf, 0x16u);
  }

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v38 = sub_1000D9B60;
  id v39 = sub_1000D9B70;
  id v40 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DE2AC;
  block[3] = &unk_10041BAB0;
  uint64_t v30 = &v32;
  void block[4] = self;
  id v11 = v8;
  id v29 = v11;
  uint64_t v31 = buf;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (*((unsigned char *)v33 + 24))
  {
    if ([v11 registeredToNowPlayingUpdates]) {
      [(MRDNowPlayingStateObserver *)self->_stateObserver stopReceivingUpdatesForSource:1];
    }
    if ([v11 registeredToVolumeUpdates]) {
      [(MRDNowPlayingStateObserver *)self->_stateObserver stopReceivingUpdatesForSource:2];
    }
    [(MRDPinPairingDialog *)self->_pinPairingDialog closeForClient:v11];
    [v11 flushLyricsEvents:&stru_10041BAF0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000DE3F4;
    v26[3] = &unk_10041BB18;
    id v12 = v11;
    id v27 = v12;
    [v12 flushPendingPlaybackSessionMigrateEvents:v26];
    [(MRDExternalDeviceRemoteServer *)self purgeUnusedDiscoverySessions];
    if (MSVDeviceIsAudioAccessory())
    {
      id v13 = [v12 deviceInfo];
      unsigned int v14 = [v13 WHAIdentifier];
      [(MRDExternalDeviceRemoteServer *)self updateASEAssertionForRemoteDeviceID:v14 isAsserting:0];
    }
    int v15 = +[MRDMediaRemoteServer server];
    [v15 postClientNotificationNamed:kMRTelevisionServicePairedDevicesDidChangeNotification];

    id v16 = +[NSNotificationCenter defaultCenter];
    long long v17 = [v12 connection];
    [v16 postNotificationName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v17 userInfo:0];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = *(id *)(*(void *)&buf[8] + 40);
    id v19 = [v18 countByEnumeratingWithState:&v22 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v23;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v18);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v22 + 1) + 8 * i));
        }
        id v19 = [v18 countByEnumeratingWithState:&v22 objects:v36 count:16];
      }
      while (v19);
    }
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v32, 8);
}

- (id)_findClientIf:(id)a3
{
  id v4 = (unsigned int (**)(id, void *))a3;
  [(MRDExternalDeviceRemoteServer *)self clients];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
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
        if (v4[2](v4, v9))
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

- (id)_clientForPairingSession:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DE6B4;
  v7[3] = &unk_10041BB40;
  id v8 = a3;
  id v4 = v8;
  id v5 = [(MRDExternalDeviceRemoteServer *)self _findClientIf:v7];

  return v5;
}

- (id)_clientForIdentifier:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DE7A4;
  v7[3] = &unk_10041BB40;
  id v8 = a3;
  id v4 = v8;
  id v5 = [(MRDExternalDeviceRemoteServer *)self _findClientIf:v7];

  return v5;
}

- (BOOL)_verifyClientVersionCompatibility:(id)a3 withError:(id *)a4
{
  id v5 = [a3 deviceInfo];
  id v6 = [v5 name];
  uint64_t v7 = [v5 bundleIdentifier];
  id v8 = [v5 bundleVersion];
  id v9 = [v5 protocolVersion];
  if (v9 >= [(id)objc_opt_class() minimumSupportedProtocolVersion])
  {
    if (![v7 isEqualToString:@"com.apple.TVRemote"]
      || (id v11 = [v8 integerValue],
          v11 >= [(id)objc_opt_class() minimumSupportedHangdogApplicationVersion]))
    {
      id Error = 0;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      int v15 = v6;
      __int16 v16 = 2048;
      id v17 = [v8 integerValue];
      __int16 v18 = 2048;
      id v19 = [(id)objc_opt_class() minimumSupportedHangdogApplicationVersion];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Client %{public}@ is not compatible. TVRemote application version %llu is less than the required minimum version %llu", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      int v15 = v6;
      __int16 v16 = 2048;
      id v17 = [v5 protocolVersion];
      __int16 v18 = 2048;
      id v19 = [(id)objc_opt_class() minimumSupportedProtocolVersion];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Client %{public}@ is not compatible. Protocol version %llu is less than the required minimum version %llu", (uint8_t *)&v14, 0x20u);
    }
  }

  id Error = (void *)MRMediaRemoteCreateError();
  if (a4) {
LABEL_10:
  }
    *a4 = Error;
LABEL_11:

  return Error == 0;
}

- (BOOL)_connection:(id)a3 wasPreviouslySubscribedToPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [v6 subscribedPlayerPaths];
    id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      id v22 = v6;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v13 = objc_msgSend(v7, "origin", v22);
          unsigned int v14 = [(MRDExternalDeviceRemoteServer *)self _origin:v13 matchesSubscribedPlayerPath:v12];

          if (v14)
          {
            int v15 = [v12 client];
            __int16 v16 = +[MRClient anyClient];
            if ([v15 isEqual:v16])
            {

LABEL_16:
              BOOL v20 = 1;
              goto LABEL_17;
            }
            id v17 = [v12 client];
            __int16 v18 = [v7 client];
            unsigned __int8 v19 = [v17 isEqual:v18];

            if (v19) {
              goto LABEL_16;
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v20 = 0;
LABEL_17:
      id v6 = v22;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_connection:(id)a3 canReceiveUpdatesForPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = objc_msgSend(v6, "subscribedPlayerPaths", 0);
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([(MRDExternalDeviceRemoteServer *)self _playerPath:v7 matchesSubscribedPlayerPath:*(void *)(*((void *)&v15 + 1) + 8 * i)])
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_connection:(id)a3 canReceiveUpdatesForOrigin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = objc_msgSend(v6, "subscribedPlayerPaths", 0);
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([(MRDExternalDeviceRemoteServer *)self _origin:v7 matchesSubscribedPlayerPath:*(void *)(*((void *)&v15 + 1) + 8 * i)])
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_sendMessageFromEndpoint:(id)a3 withSource:(int64_t)a4 handler:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  [(MRDExternalDeviceRemoteServer *)self clients];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        BOOL v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (-[MRDExternalDeviceRemoteServer _shouldSendStateUpdateMessageFromSource:toClient:](self, "_shouldSendStateUpdateMessageFromSource:toClient:", a4, v13, v14))
        {
          objc_initWeak(&location, self);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1000DF0E0;
          v15[3] = &unk_10041BB68;
          id v16 = v14;
          objc_copyWeak(&v19, &location);
          long long v17 = v13;
          id v18 = v8;
          [v13 requestDestinationEndpoint:v15];

          objc_destroyWeak(&v19);
          objc_destroyWeak(&location);
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

- (void)_sendMessageFromEndpoint:(id)a3 outputDevice:(id)a4 withSource:(int64_t)a5 handler:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DF280;
  v12[3] = &unk_10041BB90;
  id v13 = a4;
  id v14 = a6;
  id v10 = v14;
  id v11 = v13;
  [(MRDExternalDeviceRemoteServer *)self _sendMessageFromEndpoint:a3 withSource:a5 handler:v12];
}

- (void)_sendStateUpdateMessageFromPlayerPath:(id)a3 source:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(MRDExternalDeviceRemoteServer *)self clients];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([(MRDExternalDeviceRemoteServer *)self _shouldSendStateUpdateMessageFromSource:a4 toClient:v15]&& [(MRDExternalDeviceRemoteServer *)self _connection:v15 canReceiveUpdatesForPlayerPath:v8])
        {
          id v16 = v9[2](v9, v15);
          if (v16) {
            [v15 sendMessage:v16];
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)_sendStateUpdateMessageFromOrigin:(id)a3 source:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(MRDExternalDeviceRemoteServer *)self clients];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([(MRDExternalDeviceRemoteServer *)self _shouldSendStateUpdateMessageFromSource:a4 toClient:v15]&& [(MRDExternalDeviceRemoteServer *)self _connection:v15 canReceiveUpdatesForOrigin:v8])
        {
          id v16 = v9[2](v9, v15);
          if (v16) {
            [v15 sendMessage:v16];
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (BOOL)_shouldSendStateUpdateMessageFromSource:(int64_t)a3 toClient:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  switch(a3)
  {
    case 1:
      unsigned __int8 v7 = [v5 registeredToNowPlayingUpdates];
      goto LABEL_7;
    case 2:
      unsigned __int8 v7 = [v5 registeredToVolumeUpdates];
      goto LABEL_7;
    case 3:
      unsigned __int8 v7 = [v5 registeredToOutputDeviceUpdates];
      goto LABEL_7;
    case 4:
      unsigned __int8 v7 = [v5 registeredToSystemEndpointUpdates];
LABEL_7:
      BOOL v8 = v7;
      break;
    default:
      BOOL v8 = 1;
      break;
  }

  return v8;
}

- (void)_broadcastKeyboardMessageWithState:(unint64_t)a3 text:(id)a4 attributes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MRDExternalDeviceRemoteServer *)self clients];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
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
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v15 registeredKeyboardUpdates])
        {
          id v16 = [v15 cryptoSession];
          long long v17 = +[MRKeyboardMessage encryptedMessageWithState:a3 text:v8 attributes:v9 usingCryptoSession:v16];

          [v15 sendMessage:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)_broadcastRemoteTextInputMessageWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000D9B60;
  long long v24 = sub_1000D9B70;
  id v25 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DFAB0;
  block[3] = &unk_100415CF0;
  void block[4] = self;
  void block[5] = &v20;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)v21[5];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "registeredKeyboardUpdates", (void)v15))
        {
          id v11 = objc_alloc((Class)MRRemoteTextInputMessage);
          id v12 = [v4 version];
          uint64_t v13 = [v4 data];
          id v14 = [v11 initWithVersion:v12 data:v13];

          [v10 sendMessage:v14];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)_setGameControllerInputMode:(unsigned int)a3
{
  if (self->_gameControllerInputMode != a3)
  {
    uint64_t v3 = *(void *)&a3;
    id v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Description = (void *)MRGameControllerInputModeCreateDescription();
      *(_DWORD *)buf = 138543362;
      long long v15 = Description;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Setting game controller input mode to %{public}@", buf, 0xCu);
    }
    self->_gameControllerInputMode = v3;
    id v7 = [objc_alloc((Class)MRRegisterForGameControllerEventsMessage) initWithInputMode:v3];
    id v8 = objc_alloc((Class)MRPlayerPath);
    id v9 = +[MROrigin localOrigin];
    id v10 = [v8 initWithOrigin:v9 client:0 player:0];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DFC9C;
    v12[3] = &unk_10041B878;
    id v13 = v7;
    id v11 = v7;
    [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v10 source:0 handler:v12];
  }
}

- (id)_unpair:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MRDeviceInfo);
  [v5 setIdentifier:v4];
  id v6 = [objc_alloc((Class)MRCoreUtilsPairingSession) initWithRole:0 device:v5];
  [v6 open];
  id v7 = [v6 removePeer];
  if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      long long v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Error unpairing device: %{public}@ error: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v9 = [(MRDExternalDeviceRemoteServer *)self _clientForIdentifier:v4];
  if (v9)
  {
    id Error = (void *)MRMediaRemoteCreateError();
    [(MRDExternalDeviceRemoteServer *)self _notifyAndDisconnectClient:v9 withError:Error];
  }

  return v7;
}

- (void)_notifyAndDisconnectClient:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v6;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(MRDExternalDeviceRemoteServer *)self _notifyAndDisconnectClients:v9 withError:v7 completion:0];
}

- (void)_notifyAndDisconnectClients:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v13 = dispatch_queue_create("com.apple.MediaRemote.MRTelevisionRemoteServer.WorkerQueue", v12);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000E0020;
  v17[3] = &unk_100415B98;
  id v14 = v9;
  id v18 = v14;
  id v15 = v8;
  id v19 = v15;
  uint64_t v20 = self;
  id v16 = v10;
  id v21 = v16;
  dispatch_async(v13, v17);
}

- (void)_registerCallbacks
{
  uint64_t v3 = +[MRCoreUtilsSystemPairingSession pairingManager];
  pairingManager = self->_pairingManager;
  self->_pairingManager = v3;

  if (self->_pairingManager)
  {
    objc_initWeak(&location, self);
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_1000E05D4;
    id v8 = &unk_10041BBB8;
    objc_copyWeak(&v9, &location);
    [(CUPairingManager *)self->_pairingManager setPairedPeerRemovedHandler:&v5];
    -[CUPairingManager startMonitoringWithOptions:](self->_pairingManager, "startMonitoringWithOptions:", 4, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_isConnectionForManagedConfigIDAllowed:(id)a3
{
  id v3 = a3;
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10032E7E0();
  }

  id v5 = +[MCProfileConnection sharedConnection];
  uint64_t v6 = [v5 effectiveValuesForUnionSetting:MCFeatureTVRemoteAllowedRemotes];

  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v9 = *(void *)v17;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "lowercaseString", (void)v16);
      int v12 = [v3 lowercaseString];
      unsigned __int8 v13 = [v11 isEqualToString:v12];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10032E7A0();
    }
  }
  LOBYTE(v8) = 1;
LABEL_16:

  id v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10032E718();
  }

  return (char)v8;
}

- (void)_onQueue_registerDisconnectionHandler:(id)a3 forClient:(id)a4
{
  id v13 = a4;
  clientDisconnectionHandlers = self->_clientDisconnectionHandlers;
  id v7 = a3;
  id v8 = [(NSMapTable *)clientDisconnectionHandlers objectForKey:v13];

  if (!v8)
  {
    uint64_t v9 = self->_clientDisconnectionHandlers;
    uint64_t v10 = +[NSMutableArray array];
    [(NSMapTable *)v9 setObject:v10 forKey:v13];
  }
  id v11 = [(NSMapTable *)self->_clientDisconnectionHandlers objectForKey:v13];
  id v12 = objc_retainBlock(v7);

  [v11 addObject:v12];
}

- (void)setServerDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = self->_discoverySessions;
  objc_sync_enter(v7);
  id v8 = [(NSMutableDictionary *)self->_outputDeviceCallbackTokens objectForKeyedSubscript:v6];
  uint64_t v9 = [(NSMutableDictionary *)self->_discoverySessions objectForKeyedSubscript:v6];
  uint64_t v10 = v9;
  if (v4)
  {
    if (!v9)
    {
      uint64_t v10 = +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:v6];
      [(NSMutableDictionary *)self->_discoverySessions setObject:v10 forKeyedSubscript:v6];
    }
    if (!v8)
    {
      objc_initWeak(&location, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000E0C9C;
      v12[3] = &unk_10041BBE0;
      objc_copyWeak(&v14, &location);
      id v11 = v6;
      id v13 = v11;
      id v8 = [v10 addOutputDevicesChangedCallback:v12];
      [(NSMutableDictionary *)self->_outputDeviceCallbackTokens setObject:v8 forKeyedSubscript:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    [v10 setDiscoveryMode:v4];
  }
  else
  {
    [v9 removeOutputDevicesChangedCallback:v8];
    [(NSMutableDictionary *)self->_outputDeviceCallbackTokens setObject:0 forKeyedSubscript:v6];
    [(NSMutableDictionary *)self->_discoverySessions setObject:0 forKeyedSubscript:v6];
  }

  objc_sync_exit(v7);
}

- (void)purgeUnusedDiscoverySessions
{
  id v3 = self->_discoverySessions;
  objc_sync_enter(v3);
  discoverySessions = self->_discoverySessions;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E0DB4;
  v5[3] = &unk_10041BA28;
  v5[4] = self;
  [(NSMutableDictionary *)discoverySessions enumerateKeysAndObjectsUsingBlock:v5];
  objc_sync_exit(v3);
}

- (unsigned)serverDiscoveryModeForConfiguration:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MRDExternalDeviceRemoteServer *)self clients];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) discoveryModeForConfiguration:v4];
        if (v11 > v8) {
          unsigned int v8 = v11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)outputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned int v8 = [(MRDExternalDeviceRemoteServer *)self clients];
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 discoveryModeForConfiguration:v7])
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1000E10DC;
          v14[3] = &unk_10041BC08;
          id v15 = v6;
          id v16 = v7;
          long long v17 = v13;
          [v13 requestDestinationEndpoint:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)_handleGetInputModeMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t original = a3;
  xpc_dictionary_get_remote_connection(original);
  id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    id v7 = reply;
    if (reply)
    {
      xpc_dictionary_set_uint64(reply, "MRXPC_GAMECONTROLLER_INPUT_MODE_KEY", self->_gameControllerInputMode);
      xpc_connection_send_message(v5, v7);
    }
  }
}

- (void)_handleSetInputModeMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  [(MRDExternalDeviceRemoteServer *)self _setGameControllerInputMode:xpc_dictionary_get_uint64(xdict, "MRXPC_GAMECONTROLLER_INPUT_MODE_KEY")];
  xpc_dictionary_get_remote_connection(xdict);
  id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    if (reply) {
      xpc_connection_send_message(v5, reply);
    }
  }
}

- (void)_handleDeletePairingIdentityMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MRCryptoPairingSession) initWithRole:1 device:0];
  id v10 = 0;
  unsigned __int8 v6 = [v5 deleteIdentityWithError:&v10];
  id v7 = v10;
  if (v6)
  {
    unsigned int v8 = 0;
  }
  else
  {
    id v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Error deleting pairing identity. %{public}@", buf, 0xCu);
    }

    unsigned int v8 = 1;
  }
  sub_1001679D8(v4, v8);
}

- (void)_handleGetPairedDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)MRCoreUtilsPairingSession) initWithRole:0 device:0];
  [v6 open];
  id v7 = [v6 pairedDevices];
  serialQueue = self->_serialQueue;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  long long v13 = sub_1000E156C;
  long long v14 = &unk_1004158D8;
  id v15 = v7;
  id v16 = self;
  id v9 = v7;
  dispatch_sync((dispatch_queue_t)serialQueue, &v11);
  id v10 = +[MRDeviceInfo dataFromDeviceInfos:](MRDeviceInfo, "dataFromDeviceInfos:", v9, v11, v12, v13, v14);
  sub_1001678A4(v5, (uint64_t)"MRXPC_PAIRED_EXTERNAL_DEVICES_DATA", v10, 0);
}

- (void)_handleDeletePairedDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = +[NSString stringWithCString:xpc_dictionary_get_string(v5, "MRXPC_PAIRED_EXTERNAL_DEVICE") encoding:4];
  id v7 = [(MRDExternalDeviceRemoteServer *)self _unpair:v6];
  if (v7)
  {
    unsigned int v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      long long v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Error unpairing device: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    unsigned int v9 = 1;
  }
  else
  {
    unsigned int v9 = 0;
  }
  sub_1001679D8(v5, v9);
}

- (void)_handleSetMessageLogging:(id)a3 fromClient:(id)a4
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "MRXPC_EXTERNAL_DEVICE_LOGGING_KEY");
  id v5 = +[MRProtocolMessageLogger sharedLogger];
  [v5 setShouldVerboselyLog:v4];
}

- (void)_handleTelevisionEndpointAvailableMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  BOOL v7 = xpc_dictionary_get_BOOL(a3, "MRXPC_TELEVISION_ENDPOINT_AVAILABLE_KEY");
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E19A8;
  block[3] = &unk_100417770;
  BOOL v13 = v7;
  id v11 = v6;
  __int16 v12 = self;
  id v9 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)_handleSendTelevisionCustomDataMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MRCreatePropertyListFromXPCMessage();
  BOOL v7 = (void *)MRCreatePropertyListFromXPCMessage();

  id v8 = [objc_alloc((Class)MRGenericMessage) initWithKey:v6 data:v7];
  id v9 = objc_alloc((Class)MRPlayerPath);
  int v10 = +[MROrigin localOrigin];
  id v11 = [v9 initWithOrigin:v10 client:0 player:0];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E1C00;
  v13[3] = &unk_10041B878;
  id v14 = v8;
  id v12 = v8;
  [(MRDExternalDeviceRemoteServer *)self _sendStateUpdateMessageFromPlayerPath:v11 source:0 handler:v13];
}

- (void)_handleDeviceInfoRequest:(id)a3 fromClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E1CA0;
  v7[3] = &unk_10041BC30;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [a4 requestConnectedDestinationEndpoint:v7];
}

- (void)_handleReceivedCommand:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 playerPath];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E1EF4;
  v10[3] = &unk_10041BC58;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handleRegisterHIDDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 deviceDescriptor];
    int v17 = 138543362;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Registering HID device with descriptor: %{public}@", (uint8_t *)&v17, 0xCu);
  }
  id v9 = [MRDVirtualTouchDevice alloc];
  int v10 = [v5 deviceDescriptor];
  id v11 = [(MRDVirtualTouchDevice *)v9 initWithDeviceDescriptor:v10];

  if (v11)
  {
    id v12 = [v6 addVirtualTouchDevice:v11];
    BOOL v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(MRDVirtualTouchDevice *)v11 uniqueIdentifier];
      int v17 = 134217984;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Registered new virtual touch device with ID %llu", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v15 = 0;
  }
  else
  {
    BOOL v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10032E948();
    }
    id v12 = 0;
    uint64_t v15 = 1;
  }

  id v16 = [objc_alloc((Class)MRRegisterHIDDeviceResultMessage) initWithErrorCode:v15 deviceIdentifier:v12];
  [v5 replyWithMessage:v16];
}

- (void)_handleTouchEvent:(_MRHIDTouchEvent *)a3 withDeviceID:(unint64_t)a4 fromClient:(id)a5
{
  id v7 = a5;
  id v8 = [v7 virtualTouchDeviceWithID:a4];
  id v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a3->var2;
    v14[0] = *(_OWORD *)&a3->var0.var0.var0;
    v14[1] = v10;
    [v8 handleTouchEvent:v14];
  }
  id v11 = [v7 gameControllerWithID:a4];
  if (v11)
  {
    id v12 = (void *)MRGameControllerDigitizerCreateWithHIDTouchEvent();
    BOOL v13 = (void *)MRGameControllerEventCreateWithDigitizer();
    [v11 sendGameControllerEvent:v13];
  }
}

- (void)_handleRegisterGameControllerMessage:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)MREmulatedGameController);
  id v8 = [v6 properties];
  id v11 = [v7 initWithProperties:v8];

  id v9 = [v5 addGameController:v11];
  id v10 = [objc_alloc((Class)MRRegisterGameControllerResponseMessage) initWithControllerID:v9];
  [v6 replyWithMessage:v10];
}

- (void)_handleClientUpdatesConfigMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 registeredToNowPlayingUpdates];
  unsigned __int8 v9 = [v7 registeredToVolumeUpdates];
  unsigned __int8 v10 = [v7 registeredToOutputDeviceUpdates];
  id v11 = [v7 subscribedPlayerPaths];
  unsigned int v12 = [v7 registeredToNowPlayingUpdates];
  if (v12 != [v6 nowPlayingUpdates])
  {
    objc_msgSend(v7, "setRegisteredToNowPlayingUpdates:", objc_msgSend(v6, "nowPlayingUpdates"));
    unsigned int v13 = [v6 nowPlayingUpdates];
    stateObserver = self->_stateObserver;
    if (v13) {
      [(MRDNowPlayingStateObserver *)stateObserver beginReceivingUpdatesForSource:1];
    }
    else {
      [(MRDNowPlayingStateObserver *)stateObserver stopReceivingUpdatesForSource:1];
    }
  }
  unsigned int v15 = [v7 registeredToVolumeUpdates];
  if (v15 != [v6 volumeUpdates])
  {
    objc_msgSend(v7, "setRegisteredToVolumeUpdates:", objc_msgSend(v6, "volumeUpdates"));
    unsigned int v16 = [v6 volumeUpdates];
    int v17 = self->_stateObserver;
    if (v16) {
      [(MRDNowPlayingStateObserver *)v17 beginReceivingUpdatesForSource:2];
    }
    else {
      [(MRDNowPlayingStateObserver *)v17 stopReceivingUpdatesForSource:2];
    }
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E2864;
  v21[3] = &unk_10041BCA8;
  id v22 = v6;
  id v23 = v7;
  unsigned __int8 v26 = v10;
  unsigned __int8 v27 = v9;
  long long v24 = self;
  id v25 = v11;
  unsigned __int8 v28 = v8;
  id v18 = v11;
  id v19 = v7;
  id v20 = v6;
  [v19 requestConnectedDestinationEndpoint:v21];
}

- (void)_syncStateToClient:(id)a3
{
  id v8 = a3;
  if ([v8 isDestinationLocal])
  {
    id v4 = objc_alloc_init((Class)MRCompositeMessage);
    if (self->_gameControllerInputMode)
    {
      id v5 = [objc_alloc((Class)MRRegisterForGameControllerEventsMessage) initWithInputMode:self->_gameControllerInputMode];
      [v4 addMessage:v5];
    }
    if (self->_hiliteMode)
    {
      id v6 = [objc_alloc((Class)MRSetHiliteModeMessage) initWithHiliteMode:self->_hiliteMode];
      [v4 addMessage:v6];
    }
    [v8 sendMessage:v4];
    id v7 = +[MRDMediaRemoteServer server];
    [v7 postClientNotificationNamed:kMRTelevisionServicePairedDevicesDidChangeNotification];
  }
}

- (void)_addOutputDevicesToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 outputDevicesForEndpoint:v8];
  id v13 = [(MRDExternalDeviceRemoteServer *)self _createLocalizedOutputDevices:v11 redactVolume:1 forClient:v9 endpoint:v8];

  id v12 = [objc_alloc((Class)MRSyncOutputDevicesMessage) initWithOutputDevices:v13];
  [v10 addMessage:v12];
}

- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5 completion:(id)a6
{
  id v41 = a3;
  id v9 = a4;
  id v42 = a5;
  id v10 = (void (**)(void))a6;
  id v11 = +[MRUserSettings currentSettings];
  if (![v11 supportOutputContextSync]) {
    goto LABEL_6;
  }
  id v12 = [v42 deviceInfo];
  if (([v12 supportsOutputContextSync] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  id v13 = [v9 deviceInfo];
  unsigned int v14 = [v13 supportsOutputContextSync];

  if (v14)
  {
    [(MRDExternalDeviceRemoteServer *)self _addVolumeToMessage:v41 forClient:v9 withEndpoint:v42];
    v10[2](v10);
    goto LABEL_21;
  }
LABEL_7:
  group = dispatch_group_create();
  unsigned int v15 = +[MRDMediaRemoteServer server];
  unsigned int v16 = [v15 nowPlayingServer];
  int v17 = [v42 origin];
  id v18 = [v16 originClientForOrigin:v17];

  id v19 = [v18 volumeControlCapabilities];
  if (v19)
  {
    id v20 = [objc_alloc((Class)MRLegacyVolumeControlCapabilitiesDidChangeMessage) initWithCapabilities:v19];
    [v41 addMessage:v20];
  }
  long long v21 = "@\"MRRouteBannerRequest\"" + 22;
  if (([v9 registeredToOutputDeviceUpdates] & 1) != 0
    || ([v9 supportedMessages],
        id v22 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v23 = [v22 isSupported:65],
        v22,
        (v23 & 1) == 0))
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v53 = 0u;
    long long v52 = 0u;
    id obj = [v42 outputDevices];
    id v28 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v38 = *(void *)v53;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v53 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v32 = [(MRDExternalDeviceRemoteServer *)self _createLocalizedOutputDevice:v31 redactVolume:0 forClient:v9 endpoint:v42];
          dispatch_group_enter(group);
          [v31 uid];
          v34 = id v33 = v9;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_1000E3308;
          v45[3] = &unk_10041BD20;
          id v46 = v41;
          id v47 = v32;
          v48 = self;
          v49 = v31;
          v50 = group;
          id v35 = v42;
          id v51 = v35;
          id v36 = v32;
          [v35 outputDeviceVolumeControlCapabilities:v34 queue:&_dispatch_main_q completion:v45];

          id v9 = v33;
        }
        id v29 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v29);
    }

    long long v21 = "\"";
  }
  else
  {
    [v42 outputDevices];
    id v25 = v24 = v9;
    unsigned __int8 v26 = [(MRDExternalDeviceRemoteServer *)self _createLocalizedOutputDevices:v25 redactVolume:0 forClient:v24 endpoint:v42];

    id v27 = [objc_alloc((Class)MRSyncOutputDevicesMessage) initWithOutputDevices:v26];
    [v41 addMessage:v27];

    id v9 = v24;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v21 + 96);
  block[2] = sub_1000E375C;
  block[3] = &unk_100416938;
  id v44 = v10;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

LABEL_21:
}

- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[MRDMediaRemoteServer server];
  id v12 = [v11 nowPlayingServer];
  id v13 = [v10 origin];
  unsigned int v14 = [v12 originClientForOrigin:v13];

  id v15 = [v14 volumeControlCapabilities];
  if (v15)
  {
    id v16 = [objc_alloc((Class)MRLegacyVolumeControlCapabilitiesDidChangeMessage) initWithCapabilities:v15];
    [v8 addMessage:v16];
  }
  int v17 = [v9 outputDevicesForEndpoint:v10];
  id v18 = [(MRDExternalDeviceRemoteServer *)self _createLocalizedOutputDevices:v17 redactVolume:0 forClient:v9 endpoint:v10];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      unsigned __int8 v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[MRDExternalDeviceRemoteServer _addVolumeToMessage:forClient:outputDevice:withEndpoint:](self, "_addVolumeToMessage:forClient:outputDevice:withEndpoint:", v8, v9, *(void *)(*((void *)&v24 + 1) + 8 * (void)v23), v10, (void)v24);
        unsigned __int8 v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 outputDevice:(id)a5 withEndpoint:(id)a6
{
  id v21 = a3;
  id v7 = a5;
  id v8 = [v7 volumeCapabilities];
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_alloc((Class)MRVolumeControlCapabilitiesDidChangeMessage);
    id v11 = [v7 groupID];
    id v12 = [v7 uid];
    id v13 = [v10 initWithCapabilities:v9 endpointUID:v11 outputDeviceUID:v12];
    [v21 addMessage:v13];

    if ((v9 & 2) != 0)
    {
      [v7 volume];
      int v15 = v14;
      id v16 = objc_alloc((Class)MRVolumeDidChangeMessage);
      int v17 = [v7 groupID];
      id v18 = [v7 uid];
      LODWORD(v19) = v15;
      id v20 = [v16 initWithVolume:v17 endpointUID:v18 outputDeviceUID:v19];
      [v21 addMessage:v20];
    }
  }
}

- (BOOL)_origin:(id)a3 matchesSubscribedPlayerPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 origin];
  if (v7 == v5)
  {
    unsigned __int8 v13 = 1;
    int v14 = v5;
    int v15 = v5;
LABEL_9:

    goto LABEL_10;
  }
  id v8 = v7;
  unsigned __int8 v9 = [v7 isEqual:v5];

  if ((v9 & 1) == 0)
  {
    id v10 = [v6 origin];
    id v11 = +[MROrigin anyOrigin];
    unsigned __int8 v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      id v16 = +[MRDMediaRemoteServer server];
      int v15 = [v16 nowPlayingServer];

      int v14 = [v6 origin];
      if (v14)
      {
        unsigned __int8 v13 = 0;
      }
      else
      {
        int v17 = [v15 activeOriginClient];
        id v18 = [v17 origin];
        unsigned __int8 v13 = [v5 isEqual:v18];
      }
      goto LABEL_9;
    }
  }
  unsigned __int8 v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)_origin:(id)a3 client:(id)a4 matchesSubscribedPlayerPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[MRDMediaRemoteServer server];
  id v11 = [v10 nowPlayingServer];

  unsigned __int8 v12 = [v11 originClientForOrigin:v9];

  unsigned __int8 v13 = [v8 client];

  id v14 = [v13 copy];
  if ([v14 hasPlaceholder])
  {
    int v15 = [v12 deviceInfo];
    [v14 resolvePlaceholdersForDeviceInfo:v15];
  }
  id v16 = v14;
  int v17 = v16;
  if (v16 == v7)
  {
    unsigned __int8 v21 = 1;
    uint64_t v22 = v7;
LABEL_8:

    goto LABEL_9;
  }
  unsigned __int8 v18 = [v16 isEqual:v7];

  if ((v18 & 1) == 0)
  {
    double v19 = +[MRClient anyClient];
    unsigned __int8 v20 = [v17 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      if (v17)
      {
        unsigned __int8 v21 = 0;
        goto LABEL_9;
      }
      uint64_t v22 = [v12 activeNowPlayingClient];
      long long v24 = [v22 client];
      unsigned __int8 v21 = [v7 isEqual:v24];

      goto LABEL_8;
    }
  }
  unsigned __int8 v21 = 1;
LABEL_9:

  return v21;
}

- (BOOL)_origin:(id)a3 client:(id)a4 player:(id)a5 matchesSubscribedPlayerPath:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 player];
  if (v13 == v11)
  {
    BOOL v19 = 1;
    unsigned __int8 v20 = v11;
    unsigned __int8 v21 = v11;
LABEL_13:

    goto LABEL_14;
  }
  id v14 = v13;
  unsigned __int8 v15 = [v13 isEqual:v11];

  if ((v15 & 1) == 0)
  {
    id v16 = [v12 player];
    int v17 = +[MRPlayer anyPlayer];
    unsigned __int8 v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      uint64_t v22 = +[MRDMediaRemoteServer server];
      unsigned __int8 v21 = [v22 nowPlayingServer];

      unsigned __int8 v20 = [v21 originClientForOrigin:v9];
      unsigned __int8 v23 = [v20 existingNowPlayingClientForClient:v10];
      long long v24 = [v23 activePlayerClient];
      long long v25 = [v24 player];

      long long v26 = [v12 player];
      if (v26)
      {
      }
      else if (!v25 || ([v11 isEqual:v25] & 1) != 0)
      {
        BOOL v19 = 1;
        goto LABEL_12;
      }
      BOOL v19 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  BOOL v19 = 1;
LABEL_14:

  return v19;
}

- (BOOL)_playerPath:(id)a3 matchesSubscribedPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 origin];
  unsigned int v9 = [(MRDExternalDeviceRemoteServer *)self _origin:v8 matchesSubscribedPlayerPath:v7];

  if (!v9) {
    goto LABEL_5;
  }
  id v10 = [v6 origin];
  id v11 = [v6 client];
  unsigned int v12 = [(MRDExternalDeviceRemoteServer *)self _origin:v10 client:v11 matchesSubscribedPlayerPath:v7];

  if (!v12) {
    goto LABEL_5;
  }
  id v13 = [v6 origin];
  id v14 = [v6 client];
  unsigned __int8 v15 = [v6 player];
  unsigned __int8 v16 = [(MRDExternalDeviceRemoteServer *)self _origin:v13 client:v14 player:v15 matchesSubscribedPlayerPath:v7];

  if (v16) {
    BOOL v17 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v17 = 0;

  return v17;
}

- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 originClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 playerPath];
  unsigned int v12 = [v11 origin];
  LODWORD(self) = [(MRDExternalDeviceRemoteServer *)self _connection:v9 canReceiveUpdatesForOrigin:v12];

  if (self)
  {
    id v13 = [v9 deviceInfo];
    unsigned int v14 = [v13 supportsSharedQueue];

    if (v14)
    {
      unsigned __int8 v15 = [v10 origin];
      if ([v15 isHosted])
      {
        unsigned __int8 v16 = +[MRDMediaRemoteServer server];
        BOOL v17 = [v16 nowPlayingServer];
        id v18 = [v17 localOriginClient];
      }
      else
      {
        id v18 = v10;
      }

      BOOL v19 = [v18 defaultSupportedCommands];
      uint64_t v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472;
      uint64_t v34 = sub_1000E4314;
      id v35 = &unk_10041BD48;
      id v20 = v8;
      id v36 = v20;
      id v37 = v9;
      [v19 enumerateKeysAndObjectsUsingBlock:&v32];

      id v21 = objc_alloc((Class)MROriginClientPropertiesMessage);
      objc_msgSend(v10, "timeSincePlaying", v32, v33, v34, v35);
      unsigned __int8 v23 = +[NSDate dateWithTimeIntervalSinceNow:-v22];
      long long v24 = [v10 devicePlaybackSessionID];
      id v25 = [v21 initWithLastPlayingDate:v23 devicePlaybackSessionID:v24];
      [v20 addMessage:v25];
    }
    long long v26 = [v10 activeNowPlayingClient];
    if (v26)
    {
      long long v27 = [v9 deviceInfo];
      unsigned int v28 = [v27 supportsSharedQueue];

      if (v28)
      {
        id v29 = objc_alloc((Class)MRSetNowPlayingClientMessage);
        uint64_t v30 = [v26 client];
        id v31 = [v29 initWithClient:v30];

        [v8 addMessage:v31];
      }
    }
  }
}

- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 nowPlayingClient:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v8 playerPath];
  LODWORD(self) = [(MRDExternalDeviceRemoteServer *)self _connection:v9 canReceiveUpdatesForPlayerPath:v10];

  if (self)
  {
    id v11 = [v8 client];
    if ([v11 hasAuxiliaryProperties])
    {
      id v12 = [objc_alloc((Class)MRUpdateClientMessage) initWithClient:v11];
      [v21 addMessage:v12];
    }
    id v13 = [v8 activePlayerClient];
    unsigned int v14 = [v13 player];
    unsigned __int8 v15 = +[MRPlayer defaultPlayer];
    unsigned __int8 v16 = [v14 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      id v17 = objc_alloc((Class)MRSetNowPlayingPlayerMessage);
      id v18 = [v8 activePlayerClient];
      BOOL v19 = [v18 playerPath];
      id v20 = [v17 initWithPlayerPath:v19];

      [v21 addMessage:v20];
    }
  }
}

- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 playerClient:(id)a5
{
  id v44 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 playerPath];
  LODWORD(self) = [(MRDExternalDeviceRemoteServer *)self _connection:v8 canReceiveUpdatesForPlayerPath:v10];

  if (self)
  {
    id v11 = [v9 nowPlayingState];
    id v12 = [v9 playerPath];
    id v13 = [v8 exportNowPlayingState:v11 forPlayerPath:v12];

    id v14 = objc_alloc((Class)MRSetStateMessage);
    unsigned __int8 v15 = [v8 deviceInfo];
    id v16 = objc_msgSend(v14, "initWithNowPlayingState:encoding:", v13, objc_msgSend(v15, "preferredEncoding"));

    [v44 addMessage:v16];
    id v17 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
    id v18 = [v8 playbackQueueRequests];
    BOOL v19 = [v16 state];
    id v20 = [v19 playerPath];
    id v21 = [v18 subscriptionControllerForPlayerPath:v20];

    double v22 = [v16 state];
    unsigned __int8 v23 = [v22 playbackQueue];
    [v21 subscribeToPlaybackQueue:v23 forRequest:v17];

    id v24 = objc_alloc((Class)MRPlayerClientPropertiesMessage);
    id v25 = [v9 playerPath];
    long long v26 = [v9 lastPlayingDate];
    id v27 = [v24 initWithPlayerPath:v25 lastPlayingDate:v26];
    [v44 addMessage:v27];

    unsigned int v28 = [v9 player];
    if ([v28 hasAuxiliaryProperties])
    {
      id v29 = objc_alloc((Class)MRUpdatePlayerMessage);
      uint64_t v30 = [v9 playerPath];
      id v31 = [v29 initWithPlayerPath:v30];

      [v44 addMessage:v31];
    }
    uint64_t v32 = [v9 participantDataSource];

    if (v32)
    {
      id v33 = objc_alloc((Class)MRPlayerClientParticipantsUpdateMessage);
      uint64_t v34 = [v9 playerPath];
      id v35 = [v9 participantDataSource];
      [v35 participants];
      id v43 = v8;
      id v36 = v28;
      id v37 = v16;
      uint64_t v38 = v21;
      id v39 = v17;
      id v41 = v40 = v13;
      id v42 = [v33 initWithPlayerPath:v34 participants:v41];

      id v13 = v40;
      id v17 = v39;
      id v21 = v38;
      id v16 = v37;
      unsigned int v28 = v36;
      id v8 = v43;

      [v44 addMessage:v42];
    }
  }
}

- (void)_addNowPlayingStateToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[MRDMediaRemoteServer server];
  id v10 = [v9 nowPlayingServer];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unsigned int v28 = v10;
  id obj = [v10 originClients];
  id v11 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v43;
    uint64_t v29 = *(void *)v43;
    do
    {
      id v14 = 0;
      id v30 = v12;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v14);
        [(MRDExternalDeviceRemoteServer *)self _addSubscribedStateToMessage:v7 forClient:v8 originClient:v15];
        id v16 = [v8 deviceInfo];
        unsigned int v17 = [v16 supportsSharedQueue];

        if (v17)
        {
          uint64_t v32 = v14;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v33 = [v15 nowPlayingClients];
          id v18 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v39;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v39 != v20) {
                  objc_enumerationMutation(v33);
                }
                double v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                [(MRDExternalDeviceRemoteServer *)self _addSubscribedStateToMessage:v7 forClient:v8 nowPlayingClient:v22];
                long long v36 = 0u;
                long long v37 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                unsigned __int8 v23 = [v22 playerClients];
                id v24 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
                if (v24)
                {
                  id v25 = v24;
                  uint64_t v26 = *(void *)v35;
                  do
                  {
                    for (j = 0; j != v25; j = (char *)j + 1)
                    {
                      if (*(void *)v35 != v26) {
                        objc_enumerationMutation(v23);
                      }
                      [(MRDExternalDeviceRemoteServer *)self _addSubscribedStateToMessage:v7 forClient:v8 playerClient:*(void *)(*((void *)&v34 + 1) + 8 * (void)j)];
                    }
                    id v25 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
                  }
                  while (v25);
                }
              }
              id v19 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }
            while (v19);
          }

          uint64_t v13 = v29;
          id v12 = v30;
          id v14 = v32;
        }
        id v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v12);
  }
}

- (void)_handleRegisterVoiceInputDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 descriptor];
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Registering new virtual voice input device with descriptor: %{public}@", buf, 0xCu);
  }

  id v11 = v6;
  id v12 = v5;
  id v9 = v5;
  id v10 = v6;
  MRVirtualVoiceInputRegisterDevice();
}

- (void)_handleReceivedVoiceInputMessage:(id)a3 fromClient:(id)a4
{
  id v8 = a3;
  id v5 = [a4 registeredVirtualVoiceInputDevices];
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    [v6 unsignedIntValue];

    id v7 = [v8 buffer];
    [v8 time];
    [v8 gain];
    MRVirtualVoiceInputProcessAudioData();
  }
}

- (void)_handlePlaybackQueueRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 playerPath];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E500C;
  v10[3] = &unk_10041BC58;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v9 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handleDeviceInfoUpdateMessage:(id)a3 fromClient:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v6 isDestinationLocal])
  {
    id v7 = objc_alloc((Class)MRExternalDevicePairingSession);
    id v8 = [v6 deviceInfo];
    id v9 = [v7 initWithDevice:v8];

    [v9 open];
    id v10 = [v9 updatePeer];
    id v11 = +[MRDMediaRemoteServer server];
    [v11 postClientNotificationNamed:kMRTelevisionServicePairedDevicesDidChangeNotification];
  }
  id v12 = [v13 deviceInfo];
  [(MRDExternalDeviceRemoteServer *)self _handleRemoteDeviceInfo:v12];
}

- (void)_handleSetConnectionStateMessage:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  unsigned int v6 = [a3 state];
  if (v6 == 3)
  {
    id v7 = [v10 deviceInfo];
    id v8 = [v7 identifier];
    id v9 = [(MRDExternalDeviceRemoteServer *)self _unpair:v8];
  }
  else if (v6 == 2)
  {
    [(MRDExternalDeviceRemoteServer *)self _syncStateToClient:v10];
  }
}

- (void)_handleGenericMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  if ([a4 isDestinationLocal])
  {
    id v7 = [v6 key];
    if ([v7 isEqualToString:MRGenericMessageSetNameKey])
    {
      id v8 = [v6 data];
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v8 bytes]);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      id v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Changing name to %{public}@", buf, 0xCu);
      }

      if ((MCLockdownSetDeviceName() & 1) == 0)
      {
        id v11 = _MRLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v31 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Could not set device name to %{public}@", buf, 0xCu);
        }
      }
    }
    else if (v7)
    {
      id v9 = [(MRDExternalDeviceRemoteServer *)self endpoints];
      if ([v9 count])
      {
        id v25 = v7;
        id v12 = MRCreateXPCMessage();
        [v6 key];
        MRAddPropertyListToXPCMessage();
        id v13 = v6;
        [v6 data];
        MRAddPropertyListToXPCMessage();
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v24 = v9;
        id v14 = v9;
        id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v27;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v20 = _MRLogForCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                id v21 = [v13 key];
                *(_DWORD *)buf = 138543618;
                id v31 = v21;
                __int16 v32 = 2114;
                id v33 = v19;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Sending custom data %{public}@ to endpoint %{public}@", buf, 0x16u);
              }
              double v22 = [v19 connection];
              unsigned __int8 v23 = [v22 connection];
              xpc_connection_send_message(v23, v12);
            }
            id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v16);
        }

        id v6 = v13;
        id v9 = v24;
        id v7 = v25;
      }
    }
    else
    {
      id v9 = [objc_alloc((Class)MRProtocolMessage) initWithUnderlyingCodableMessage:0 error:0];
      [v6 replyWithMessage:v9];
    }
  }
}

- (void)_handleLyricsEventMessage:(id)a3 fromClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E596C;
  v7[3] = &unk_10041BDC0;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  [v5 localizeDestinationOrigin:0 completion:v7];
}

- (void)addAuthorizationCallbackForOutputDevice:(id)a3 callback:(id)a4
{
  routingDataSource = self->_routingDataSource;
  id v6 = a4;
  id v7 = [a3 primaryID];
  [(MRDAVRoutingDataSource *)routingDataSource addAuthorizationCallbackForRouteID:v7 requestCallback:v6];
}

- (void)removeAuthorizationCallbackForOutputDevice:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v4 = [a3 primaryID];
  [(MRDAVRoutingDataSource *)routingDataSource removeAuthorizationCallbackForRouteID:v4];
}

- (void)addAuthorizationCallbackForOutputDevice:(id)a3 client:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E5B90;
  v8[3] = &unk_10041BDE8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(MRDExternalDeviceRemoteServer *)self addAuthorizationCallbackForOutputDevice:v7 callback:v8];
}

- (void)_handleModifyOutputContextRequestMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Received request to modify output context: %{public}@", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E5E40;
  v11[3] = &unk_10041BC08;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v9 requestDestinationEndpoint:v11];
}

- (void)_handleGetVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E7414;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleGetVolumeControlCapabilitiesMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E75D8;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleSetVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E7794;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handlePlaybackSessionRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 playerPath];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E79C8;
  v9[3] = &unk_10041BF90;
  id v10 = v5;
  id v8 = v5;
  [v6 localizeDestinationPlayerPath:v7 completion:v9];
}

- (void)_handlePlaybackSessionMigrateRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 playerPath];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E7C38;
  v10[3] = &unk_10041BC58;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handlePlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 playerPath];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E87F8;
  v10[3] = &unk_10041BC58;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_clearPlaybackQueueForPlayerPath:(id)a3
{
  id v3 = a3;
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceServer] Clearing playback queue for %@", buf, 0xCu);
  }

  MRSystemAppPlaybackQueueCreate();
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  uint64_t v11 = kMRMediaRemoteOptionSystemAppPlaybackQueueData;
  id v12 = ExternalRepresentation;
  id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:0];
  id v8 = [[MRDRemoteControlCommand alloc] initWithCommandType:122 playerPath:v3 unresolvedPlayerPath:v3 senderAppDisplayID:@"Cayenne" optionsData:v7];
  id v9 = +[MRDMediaRemoteServer server];
  id v10 = [v9 remoteControlServer];
  [v10 sendRemoteControlCommand:v8 completion:&stru_10041C048];
}

- (void)_handlePlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 playerPath];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E8E14;
  v10[3] = &unk_10041BC58;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handleUpdateActiveSystemEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MRUserSettings currentSettings];
  unsigned __int8 v8 = [v7 disablePairedDeviceActiveEndpointSync];

  if ((v8 & 1) == 0 && [v6 isDestinationLocal])
  {
    id v9 = objc_alloc((Class)NSString);
    id v10 = [v5 request];
    id v11 = [v10 reason];
    id v12 = [v6 deviceInfo];
    id v13 = [v12 deviceUID];
    id v14 = [v6 deviceInfo];
    id v15 = [v14 name];
    id v16 = [v9 initWithFormat:@"%@ from external device client: %@<%@>", v11, v13, v15];

    uint64_t v17 = [v5 request];
    id v18 = [v17 copy];

    id v19 = [v6 deviceInfo];
    uint64_t v20 = [v19 bundleIdentifier];
    [v18 setClientBundleIdentifier:v20];

    [v18 setPairedDeviceSync:1];
    [v18 setReason:v16];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000E932C;
    v21[3] = &unk_10041AD20;
    id v22 = v5;
    [v18 perform:&_dispatch_main_q completion:v21];
  }
}

- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = +[MRDMediaRemoteServer server];
  id v6 = [v5 nowPlayingServer];
  id v7 = [v4 playerPath];
  unsigned __int8 v8 = [v6 resolveExistingPlayerPath:v7];

  id v9 = [v4 fadeType];
  id v10 = [objc_alloc((Class)MRNowPlayingRequest) initWithPlayerPath:v8];
  if (v9)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    _OWORD v14[2] = sub_1000E95D8;
    v14[3] = &unk_100415F80;
    id v11 = &v15;
    id v15 = v4;
    id v12 = v4;
    [v10 triggerAudioFadeInWithReplyQueue:&_dispatch_main_q completion:v14];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000E9558;
    v16[3] = &unk_10041C070;
    id v11 = &v17;
    id v17 = v4;
    id v13 = v4;
    [v10 triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:&_dispatch_main_q completion:v16];
  }
}

- (void)_handleSetDiscoveryModeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 configuration];
  objc_msgSend(v7, "setDiscoveryMode:forConfiguration:", objc_msgSend(v6, "mode"), v8);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1000D9B60;
  id v21 = sub_1000D9B70;
  id v22 = 0;
  id v9 = self->_discoverySessions;
  objc_sync_enter(v9);
  uint64_t v10 = [(NSMutableDictionary *)self->_discoverySessions objectForKeyedSubscript:v8];
  id v11 = (void *)v18[5];
  v18[5] = v10;

  objc_sync_exit(v9);
  if (v18[5])
  {
    if ([v6 mode])
    {
      id v12 = [(id)v18[5] availableOutputDevices];

      if (v12)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000E984C;
        v13[3] = &unk_10041C098;
        id v16 = &v17;
        id v14 = v8;
        id v15 = v7;
        [v15 requestDestinationEndpoint:v13];
      }
    }
  }
  [(MRDExternalDeviceRemoteServer *)self setServerDiscoveryMode:[(MRDExternalDeviceRemoteServer *)self serverDiscoveryModeForConfiguration:v8] forConfiguration:v8];
  _Block_object_dispose(&v17, 8);
}

- (void)_handleSetListeningModeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E9A54;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleSetConversationDetectionEnabledMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E9C40;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleCreateHostedEndpointRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)MRRequestDetails);
  unsigned __int8 v8 = [v6 deviceInfo];

  id v9 = [v8 name];
  id v10 = [v7 initWithName:@"_handleCreateHostedEndpointRequestMessage" requestID:0 reason:v9];

  id v11 = [v5 outputDeviceUIDs];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E9EC8;
  v13[3] = &unk_10041C0C0;
  id v14 = v5;
  id v12 = v5;
  +[MRDCreateHostedEndpointRequest createHostedEndpointWithOutputDeviceUIDs:v11 timeout:v10 details:v13 completion:30.0];
}

- (void)_handleAdjustVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EA0A4;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleGetVolumeMutedMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EA2A8;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleMuteVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EA490;
  v6[3] = &unk_100418870;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EA694;
  v6[3] = &unk_10041C150;
  id v7 = a3;
  id v5 = v7;
  [a4 requestConnectedDestinationEndpoint:v6];
}

- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 context];
  objc_initWeak(&location, v7);
  id v9 = [v8 destinationPlayerPath];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000EA8F4;
  v13[3] = &unk_10041C1F0;
  id v10 = v8;
  id v14 = v10;
  id v11 = v6;
  id v15 = v11;
  objc_copyWeak(&v18, &location);
  id v16 = self;
  id v12 = v7;
  id v17 = v12;
  [v12 localizeDestinationPlayerPath:v9 completion:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_handleApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 context];
  unsigned __int8 v8 = [v7 destinationPlayerPath];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EAF80;
  v11[3] = &unk_10041BC58;
  id v12 = v7;
  id v13 = v5;
  id v9 = v5;
  id v10 = v7;
  [v6 localizeDestinationPlayerPath:v8 completion:v11];
}

- (void)_handleInvalidateApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 context];
  unsigned __int8 v8 = [v7 destinationPlayerPath];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EB17C;
  v11[3] = &unk_10041BC58;
  id v12 = v7;
  id v13 = v5;
  id v9 = v5;
  id v10 = v7;
  [v6 localizeDestinationPlayerPath:v8 completion:v11];
}

- (void)updateASEAssertionForRemoteDeviceID:(id)a3 isAsserting:(BOOL)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EB340;
  block[3] = &unk_100417770;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (MRDAVRoutingDataSource)routingDataSource
{
  return self->_routingDataSource;
}

- (MRDRemoteControlService)remoteControlService
{
  return self->_remoteControlService;
}

- (NSMapTable)clientDisconnectionHandlers
{
  return self->_clientDisconnectionHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDisconnectionHandlers, 0);
  objc_storeStrong((id *)&self->_remoteControlService, 0);
  objc_storeStrong((id *)&self->_routingDataSource, 0);
  objc_storeStrong((id *)&self->_groupSessionAssertion, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointAssertionsByOrigin, 0);
  objc_storeStrong((id *)&self->_discoverySessions, 0);
  objc_storeStrong((id *)&self->_outputDeviceCallbackTokens, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_sleepObserver, 0);
  objc_storeStrong((id *)&self->_pinPairingDialog, 0);
  objc_storeStrong((id *)&self->_stateObserver, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_activeReconSessions, 0);
  objc_storeStrong((id *)&self->_tvEndpoints, 0);

  objc_storeStrong((id *)&self->_connectedClients, 0);
}

@end