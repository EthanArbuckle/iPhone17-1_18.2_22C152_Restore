@interface MRDTransportExternalDevice
- (BOOL)_maybeBatchRequest:(id)a3;
- (BOOL)isCallingClientCallback;
- (BOOL)isPaired;
- (BOOL)isUsingSystemPairing;
- (BOOL)isValid;
- (BOOL)supportsIdleDisconnection;
- (BOOL)wantsEndpointChangeNotifications;
- (BOOL)wantsNowPlayingArtworkNotifications;
- (BOOL)wantsNowPlayingNotifications;
- (BOOL)wantsOutputDeviceNotifications;
- (BOOL)wantsSystemEndpointNotifications;
- (BOOL)wantsVolumeNotifications;
- (MRDTransportExternalDevice)initWithTransport:(id)a3;
- (MRDeviceInfo)deviceInfo;
- (MRExternalClientConnection)clientConnection;
- (MRExternalDeviceTransport)transport;
- (MROrigin)customOrigin;
- (MSVTimer)powerLogIntervalTimer;
- (NSMutableArray)pendingConnectCompletionHandlers;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)connectionStateCallbackQueue;
- (OS_dispatch_queue)customDataCallbackQueue;
- (OS_dispatch_queue)deviceInfoCallbackQueue;
- (OS_dispatch_queue)nameCallbackQueue;
- (OS_dispatch_queue)outputContextCallbackQueue;
- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue;
- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue;
- (OS_dispatch_queue)pairingAllowedCallbackQueue;
- (OS_dispatch_queue)pairingCallbackQueue;
- (OS_dispatch_queue)volumeCallbackQueue;
- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue;
- (OS_dispatch_queue)volumeMutedCallbackQueue;
- (OS_dispatch_queue)workerQueue;
- (id)_onSerialQueue_deviceInfo;
- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3;
- (id)_onWorkerQueue_initializeConnectionWithOptions:(unsigned int)a3 userInfo:(id)a4;
- (id)_onWorkerQueue_loadDeviceInfoWithUserInfo:(id)a3;
- (id)_onWorkerQueue_reRegisterCustomOriginWithUserInfo:(id)a3;
- (id)_onWorkerQueue_registerCustomOriginWithUserInfo:(id)a3;
- (id)_onWorkerQueue_syncClientStateWithUserInfo:(id)a3;
- (id)connectionStateCallback;
- (id)currentClientUpdatesConfigMessage;
- (id)customDataCallback;
- (id)deviceInfoCallback;
- (id)errorForCurrentState;
- (id)groupSessionToken;
- (id)hostName;
- (id)name;
- (id)nameCallback;
- (id)outputDevicesRemovedCallback;
- (id)outputDevicesUpdatedCallback;
- (id)pairingAllowedCallback;
- (id)pairingCallback;
- (id)personalOutputDevices;
- (id)shortDescription;
- (id)subscribedPlayerPaths;
- (id)supportedMessages;
- (id)uid;
- (id)volumeCallback;
- (id)volumeControlCapabilitiesCallback;
- (id)volumeMutedCallback;
- (int64_t)connectionRecoveryBehavior;
- (int64_t)port;
- (unsigned)connectionState;
- (void)_activeSystemEndpointDidChangeNotification:(id)a3;
- (void)_callAllPendingCompletionsWithError:(id)a3;
- (void)_callClientAllowsPairingCallback;
- (void)_callClientConnectionStateCallback:(unsigned int)a3 previousConnectionState:(unsigned int)a4 error:(id)a5;
- (void)_callClientCustomDataCallback:(id)a3 name:(id)a4;
- (void)_callClientNameCallback;
- (void)_callClientPairingCallback:(id)a3;
- (void)_callDeviceInfoCallback:(id)a3 oldDeviceInfo:(id)a4;
- (void)_callIsMutedCallback:(BOOL)a3 outputDeviceUID:(id)a4;
- (void)_callOutputDevicesRemovedCallbackWithOutputDeviceUIDs:(id)a3;
- (void)_callOutputDevicesUpdatedCallbackWithOutputDevices:(id)a3;
- (void)_callVolumeCallback:(float)a3 outputDeviceUID:(id)a4;
- (void)_callVolumeControlCapabilitiesCallback:(unsigned int)a3 outputDeviceUID:(id)a4;
- (void)_cleanUpStreamsWithReason:(int64_t)a3 error:(id)a4;
- (void)_cleanUpWithReason:(int64_t)a3 error:(id)a4;
- (void)_handleApplicationConnectionProtocolMessage:(id)a3;
- (void)_handleDeviceInfoChange:(id)a3 oldDevice:(id)a4;
- (void)_handleDeviceInfoUpdateMessage:(id)a3;
- (void)_handleDiscoveryUpdateOutputDevicesMessage:(id)a3;
- (void)_handleGenericMessage:(id)a3;
- (void)_handleInvalidateApplicationConnectionMessage:(id)a3;
- (void)_handleLegacyVolumeControlCapabilitiesDidChangeMessage:(id)a3;
- (void)_handleNotificationMessage:(id)a3;
- (void)_handleOutputDevicesRemovedMessage:(id)a3;
- (void)_handleOutputDevicesUpdatedMessage:(id)a3;
- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlayerClientParticipantsUpdateMessage:(id)a3;
- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3;
- (void)_handlePromptForRouteAuthorizationMessage:(id)a3;
- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6;
- (void)_handleRemoveClientMessage:(id)a3;
- (void)_handleRemovePlayerMessage:(id)a3;
- (void)_handleSetConnectionStateMessage:(id)a3;
- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3;
- (void)_handleSetNowPlayingClientMessage:(id)a3;
- (void)_handleSetNowPlayingPlayerMessage:(id)a3;
- (void)_handleSetOriginClientPropertiesMessage:(id)a3;
- (void)_handleSetPlayerClientPropertiesMessage:(id)a3;
- (void)_handleSetStateMessage:(id)a3;
- (void)_handleUpdateActiveSystemEndpoint:(id)a3;
- (void)_handleUpdateClientMessage:(id)a3;
- (void)_handleUpdateContentItemsMessage:(id)a3;
- (void)_handleUpdatePlayerMessage:(id)a3;
- (void)_handleVolumeControlCapabilitiesDidChangeMessage:(id)a3;
- (void)_handleVolumeDidChangeMessage:(id)a3;
- (void)_handleVolumeMutedDidChangeMessage:(id)a3;
- (void)_localDeviceInfoDidChangeNotification:(id)a3;
- (void)_onSerialQueue_completeGroupSessionRequestsWithIdentifier:(id)a3 error:(id)a4;
- (void)_onSerialQueue_prepareToConnectWithOptions:(unsigned int)a3 userInfo:(id)a4 connectionAttemptDetails:(id)a5 connectionHandler:(id)a6;
- (void)_onSerialQueue_prepareToDisconnect:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)_onSerialQueue_registerOriginCallbacks;
- (void)_onWorkerQueue_connectWithOptions:(unsigned int)a3 isRetry:(BOOL)a4 userInfo:(id)a5 completion:(id)a6;
- (void)_onWorkerQueue_disconnect:(id)a3;
- (void)_onWorkerQueue_sendBatchedMessages;
- (void)_sendClientMessage:(id)a3 completion:(id)a4;
- (void)_transportDeviceInfoDidChangeNotification:(id)a3;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)clientDidDisconnect:(id)a3 error:(id)a4;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)disconnect:(id)a3;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5;
- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendButtonEvent:(_MRHIDButtonEvent)a3;
- (void)sendClientUpdatesConfigMessage;
- (void)sendClientUpdatesConfigMessageWithCompletion:(id)a3;
- (void)sendCustomData:(id)a3 withName:(id)a4;
- (void)setClientConnection:(id)a3;
- (void)setConnectionRecoveryBehavior:(int64_t)a3;
- (void)setConnectionState:(unsigned int)a3 error:(id)a4;
- (void)setConnectionStateCallback:(id)a3;
- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4;
- (void)setConnectionStateCallbackQueue:(id)a3;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setCustomDataCallback:(id)a3;
- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4;
- (void)setCustomDataCallbackQueue:(id)a3;
- (void)setCustomOrigin:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceInfoCallback:(id)a3;
- (void)setDeviceInfoCallbackQueue:(id)a3;
- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setIsCallingClientCallback:(BOOL)a3;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setName:(id)a3;
- (void)setNameCallback:(id)a3;
- (void)setNameCallback:(id)a3 withQueue:(id)a4;
- (void)setNameCallbackQueue:(id)a3;
- (void)setOutputContextCallbackQueue:(id)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)setOutputDevicesRemovedCallback:(id)a3;
- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesRemovedCallbackQueue:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3;
- (void)setPairingAllowedCallback:(id)a3;
- (void)setPairingAllowedCallback:(id)a3 withQueue:(id)a4;
- (void)setPairingAllowedCallbackQueue:(id)a3;
- (void)setPairingCallback:(id)a3;
- (void)setPairingCallback:(id)a3 withQueue:(id)a4;
- (void)setPairingCallbackQueue:(id)a3;
- (void)setPendingConnectCompletionHandlers:(id)a3;
- (void)setPowerLogIntervalTimer:(id)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setUsingSystemPairing:(BOOL)a3;
- (void)setVolumeCallback:(id)a3;
- (void)setVolumeCallbackQueue:(id)a3;
- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallback:(id)a3;
- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3;
- (void)setVolumeMutedCallback:(id)a3;
- (void)setVolumeMutedCallbackQueue:(id)a3;
- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setWantsEndpointChangeNotifications:(BOOL)a3;
- (void)setWantsNowPlayingArtworkNotifications:(BOOL)a3;
- (void)setWantsNowPlayingNotifications:(BOOL)a3;
- (void)setWantsOutputDeviceNotifications:(BOOL)a3;
- (void)setWantsSystemEndpointNotifications:(BOOL)a3;
- (void)setWantsVolumeNotifications:(BOOL)a3;
- (void)setWorkerQueue:(id)a3;
- (void)verifyConnectionStatusAndMaybeDisconnect:(id)a3;
@end

@implementation MRDTransportExternalDevice

- (MRDTransportExternalDevice)initWithTransport:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MRDTransportExternalDevice;
  v6 = (MRDTransportExternalDevice *)[(MRDTransportExternalDevice *)&v24 _init];
  v7 = v6;
  if (v6)
  {
    p_transport = (id *)&v6->_transport;
    objc_storeStrong((id *)&v6->_transport, a3);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDevice.SerialQueue", v9);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDevice.WorkerQueue", v12);
    workerQueue = v7->_workerQueue;
    v7->_workerQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDevice.NotificationQueue", v15);
    notificationQueue = v7->_notificationQueue;
    v7->_notificationQueue = (OS_dispatch_queue *)v16;

    v7->_connectionState = 3;
    v7->_reconnectionAttemptCount = 0;
    v7->_connectionOptions = 0;
    v7->_forceReconnectOnConnectionFailure = 0;
    v18 = +[NSUUID UUID];
    uint64_t v19 = [v18 UUIDString];
    connectionUID = v7->_connectionUID;
    v7->_connectionUID = (NSString *)v19;

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v7 selector:"_localDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
    [v21 addObserver:v7 selector:"_transportDeviceInfoDidChangeNotification:" name:MRExternalDeviceTransportDeviceInfoDidChangeNotification object:*p_transport];
    [v21 addObserver:v7 selector:"_activeSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
    v22 = [*p_transport deviceInfo];
    [(MRDTransportExternalDevice *)v7 _handleDeviceInfoChange:v22 oldDevice:0];
  }
  return v7;
}

- (void)dealloc
{
  [(MRDTransportExternalDevice *)self _cleanUpWithReason:1 error:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(MRExternalClientConnection *)self->_clientConnection setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)MRDTransportExternalDevice;
  [(MRDTransportExternalDevice *)&v4 dealloc];
}

- (id)shortDescription
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%p", objc_opt_class(), self];

  return v2;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(MRDTransportExternalDevice *)self name];
  id v5 = [(MRDTransportExternalDevice *)self transport];
  v6 = +[NSString stringWithFormat:@"<%@:%p %@ transport=%@>", v3, self, v4, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(MRDTransportExternalDevice *)self name];
  id v5 = [(MRDTransportExternalDevice *)self customOrigin];
  v6 = MRCreateIndentedDebugDescriptionFromObject();
  v7 = [(MRDTransportExternalDevice *)self transport];
  v8 = MRCreateIndentedDebugDescriptionFromObject();
  v9 = [(MRDTransportExternalDevice *)self clientConnection];
  dispatch_queue_t v10 = MRCreateIndentedDebugDescriptionFromObject();
  v11 = +[NSString stringWithFormat:@"<%@:%p {\n    device=%@\n    origin=%@\n    transport=%@\n    connection=%@\n}>", v3, self, v4, v6, v8, v10];

  return (NSString *)v11;
}

- (id)name
{
  transport = [(MRDTransportExternalDevice *)self deviceInfo];
  objc_super v4 = transport;
  if (!transport) {
    transport = self->_transport;
  }
  id v5 = [transport name];

  return v5;
}

- (id)hostName
{
  return [(MRExternalDeviceTransport *)self->_transport hostname];
}

- (int64_t)port
{
  return (int64_t)[(MRExternalDeviceTransport *)self->_transport port];
}

- (id)uid
{
  return [(MRExternalDeviceTransport *)self->_transport uid];
}

- (id)groupSessionToken
{
  uint64_t v3 = [(MRDTransportExternalDevice *)self deviceInfo];
  objc_super v4 = [v3 groupSessionToken];
  uint64_t v5 = [v4 equivalentMediaIdentifier];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = +[MRSharedSettings currentSettings];
    unsigned int v8 = [v7 supportGroupSessionHome];

    if (!v8)
    {
      v9 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  dispatch_queue_t v10 = [(MRDTransportExternalDevice *)self deviceInfo];
  v9 = [v10 groupSessionToken];

LABEL_6:

  return v9;
}

- (BOOL)isValid
{
  return self->_transport != 0;
}

- (BOOL)isPaired
{
  return 0;
}

- (BOOL)isUsingSystemPairing
{
  return self->_usingSystemPairing;
}

- (void)setUsingSystemPairing:(BOOL)a3
{
  self->_usingSystemPairing = a3;
}

- (BOOL)wantsNowPlayingNotifications
{
  return self->_wantsNowPlayingNotifications;
}

- (void)setWantsNowPlayingNotifications:(BOOL)a3
{
  if (self->_wantsNowPlayingNotifications != a3)
  {
    self->_wantsNowPlayingNotifications = a3;
    [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessage];
  }
}

- (BOOL)wantsNowPlayingArtworkNotifications
{
  return self->_wantsNowPlayingArtworkNotifications;
}

- (void)setWantsNowPlayingArtworkNotifications:(BOOL)a3
{
  if (self->_wantsNowPlayingArtworkNotifications != a3)
  {
    self->_wantsNowPlayingArtworkNotifications = a3;
    [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessage];
  }
}

- (BOOL)wantsVolumeNotifications
{
  return self->_wantsVolumeNotifications;
}

- (void)setWantsVolumeNotifications:(BOOL)a3
{
  if (self->_wantsVolumeNotifications != a3)
  {
    self->_wantsVolumeNotifications = a3;
    MRMediaRemoteSetWantsVolumeControlNotifications();
    [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessage];
  }
}

- (BOOL)wantsOutputDeviceNotifications
{
  return self->_wantsOutputDeviceNotifications;
}

- (void)setWantsOutputDeviceNotifications:(BOOL)a3
{
  if (self->_wantsOutputDeviceNotifications != a3)
  {
    self->_wantsOutputDeviceNotifications = a3;
    [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessage];
  }
}

- (BOOL)wantsEndpointChangeNotifications
{
  return self->_wantsEndpointChangeNotifications;
}

- (void)setWantsEndpointChangeNotifications:(BOOL)a3
{
  if (self->_wantsEndpointChangeNotifications != a3)
  {
    self->_wantsEndpointChangeNotifications = a3;
    [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessage];
  }
}

- (BOOL)wantsSystemEndpointNotifications
{
  return self->_wantsSystemEndpointNotifications;
}

- (void)setWantsSystemEndpointNotifications:(BOOL)a3
{
  if (self->_wantsSystemEndpointNotifications != a3)
  {
    self->_wantsSystemEndpointNotifications = a3;
    [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessage];
  }
}

- (id)subscribedPlayerPaths
{
  uint64_t v3 = [(MRExternalDeviceTransport *)self->_transport subscribedPlayerPaths];
  id v4 = [v3 copy];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = [(NSArray *)self->_subscribedPlayerPaths copy];
  }
  v7 = v6;

  return v7;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  unsigned int v8 = (NSArray *)a3;
  id v4 = self->_subscribedPlayerPaths;
  if (v4 == v8)
  {
  }
  else
  {
    unsigned __int8 v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSArray *)[(NSArray *)v8 copy];
      subscribedPlayerPaths = self->_subscribedPlayerPaths;
      self->_subscribedPlayerPaths = v6;

      [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessage];
    }
  }
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UTF8String];
  id v6 = [v4 length];

  id v10 = +[NSData dataWithBytes:v5 length:v6];
  v7 = [(MRDTransportExternalDevice *)self clientConnection];
  id v8 = objc_alloc((Class)MRGenericMessage);
  id v9 = [v8 initWithKey:MRGenericMessageSetNameKey data:v10];
  [v7 sendMessage:v9];
}

- (void)setClientConnection:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (MRExternalClientConnection)clientConnection
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000A4120;
  id v8 = sub_1000A4130;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRExternalClientConnection *)v2;
}

- (void)setCustomOrigin:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (MROrigin)customOrigin
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000A4120;
  id v8 = sub_1000A4130;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MROrigin *)v2;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = [a3 copy];
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (id)_onSerialQueue_deviceInfo
{
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    id v3 = deviceInfo;
  }
  else
  {
    id v3 = [(MRExternalDeviceTransport *)self->_transport deviceInfo];
  }

  return v3;
}

- (MRDeviceInfo)deviceInfo
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000A4120;
  id v8 = sub_1000A4130;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDeviceInfo *)v2;
}

- (id)supportedMessages
{
  id v2 = [(MRDTransportExternalDevice *)self clientConnection];
  id v3 = [v2 supportedMessages];

  return v3;
}

- (unsigned)connectionState
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setConnectionState:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  id v6 = a4;
  msv_dispatch_sync_on_queue();
  -[MRDTransportExternalDevice _callClientConnectionStateCallback:previousConnectionState:error:](self, "_callClientConnectionStateCallback:previousConnectionState:error:", v4, *((unsigned int *)v8 + 6), v6, _NSConcreteStackBlock, 3221225472, sub_1000A4918, &unk_10041A5B0, self);

  _Block_object_dispose(&v7, 8);
}

- (void)setPairingCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4BA4;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4CC4;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setNameCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4DE4;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setPairingAllowedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4F04;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5024;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5144;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5264;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5384;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A54A4;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A55C4;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A56E4;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)sendButtonEvent:(_MRHIDButtonEvent)a3
{
  unsigned int v3 = *(_DWORD *)&a3.down;
  uint64_t v4 = *(void *)&a3.usagePage;
  id v6 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (!v6)
  {
    id v7 = objc_msgSend(objc_alloc((Class)MRSendButtonEventMessage), "initWithButtonEvent:", v4, v3);
    id v8 = [(MRDTransportExternalDevice *)self clientConnection];
    [v8 sendMessage:v7];

    id v6 = 0;
  }
}

- (id)personalOutputDevices
{
  return 0;
}

- (BOOL)supportsIdleDisconnection
{
  return [(MRExternalDeviceTransport *)self->_transport supportsIdleDisconnection];
}

- (void)_onWorkerQueue_connectWithOptions:(unsigned int)a3 isRetry:(BOOL)a4 userInfo:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v74 = a5;
  id v9 = a6;
  id v10 = +[NSDate date];
  id v11 = [v74 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  v72 = [v74 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey];
  v69 = [v74 objectForKeyedSubscript:MRExternalDeviceConnectionClientBundleIDUserInfoKey];
  v12 = [(MRExternalDeviceTransport *)self->_transport description];
  id v13 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions", v11];
  id v14 = v13;
  if (v12) {
    [v13 appendFormat:@" for %@", v12];
  }
  if (v72) {
    [v14 appendFormat:@" because %@", v72];
  }
  v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_1000A68B0;
  v96[3] = &unk_100418348;
  id v64 = v12;
  id v97 = v64;
  v98 = @"TransportExternalDevice.connectWithOptions";
  id v16 = v11;
  id v99 = v16;
  id v17 = v10;
  id v100 = v17;
  id v63 = v9;
  id v101 = v63;
  v68 = objc_retainBlock(v96);
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_1000A6B04;
  v95[3] = &unk_10041A5D8;
  v95[4] = self;
  v71 = objc_retainBlock(v95);
  if (v7) {
    [(MRDTransportExternalDevice *)self setConnectionState:1 error:0];
  }
  else {
    self->_reconnectionAttemptCount = 0;
  }
  v65 = +[NSMutableDictionary dictionaryWithCapacity:5];
  if (v7)
  {
    [(MRDTransportExternalDevice *)self _cleanUpStreamsWithReason:2 error:0];
  }
  else
  {
    [(MRDTransportExternalDevice *)self _cleanUpWithReason:2 error:0];
  }
  ((void (*)(void))v71[2])();
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      CFStringRef v21 = @"Interrupted";
LABEL_20:

      v70 = v17;
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    CFStringRef v103 = v19;
    v47 = "<%{public}@> Exiting connection attempt due to disconnection request for device %{public}@. %{public}@";
LABEL_40:
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v47, buf, 0x20u);
    goto LABEL_15;
  }
  uint64_t v19 = [(MRDTransportExternalDevice *)self _onWorkerQueue_initializeConnectionWithOptions:a3 userInfo:v74];
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      CFStringRef v103 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<%{public}@> Failed to initialize IO streams for device: %{public}@. %{public}@", buf, 0x20u);
    }
    CFStringRef v21 = @"Failed to create IO Streams";
    goto LABEL_20;
  }
  ((void (*)(void))v71[2])();
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
  [v17 timeIntervalSinceNow];
  v49 = +[NSNumber numberWithDouble:fabs(v48)];
  [v65 setObject:v49 forKeyedSubscript:kMRConnectionCreateIOStreamsDurationKey];

  v50 = +[NSDate date];

  uint64_t v19 = [(MRDTransportExternalDevice *)self _onWorkerQueue_loadDeviceInfoWithUserInfo:v74];
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      CFStringRef v103 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<%{public}@> Error loading device info for device %{public}@. %{public}@", buf, 0x20u);
    }
    CFStringRef v21 = @"Failed to load device info";
LABEL_45:
    id v17 = v50;
    goto LABEL_20;
  }
  ((void (*)(void))v71[2])();
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      CFStringRef v103 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<%{public}@> Exiting connection attempt due to disconnection request for %{public}@. %{public}@", buf, 0x20u);
    }
    CFStringRef v21 = @"Interrupted";
    goto LABEL_45;
  }
  [v50 timeIntervalSinceNow];
  v52 = +[NSNumber numberWithDouble:fabs(v51)];
  [v65 setObject:v52 forKeyedSubscript:kMRConnectionLoadDeviceInfoDurationKey];

  id v17 = +[NSDate date];

  v53 = [(MRDTransportExternalDevice *)self customOrigin];
  LODWORD(v52) = v53 == 0;

  if (v52)
  {
    uint64_t v19 = [(MRDTransportExternalDevice *)self _onWorkerQueue_registerCustomOriginWithUserInfo:v74];
    if (v19)
    {
      v20 = _MRLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        CFStringRef v103 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<%{public}@> Failed to register custom origin for device %{public}@. %{public}@", buf, 0x20u);
      }
      CFStringRef v21 = @"Failed to register custom origin";
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v19 = [(MRDTransportExternalDevice *)self _onWorkerQueue_reRegisterCustomOriginWithUserInfo:v74];
    if (v19)
    {
      v20 = _MRLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        CFStringRef v103 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<%{public}@> Failed to re-register custom origin for device %{public}@. %{public}@", buf, 0x20u);
      }
      CFStringRef v21 = @"Failed to re-register custom origin";
      goto LABEL_20;
    }
  }
  ((void (*)(void))v71[2])();
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
LABEL_34:
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    CFStringRef v103 = v19;
    v47 = "<%{public}@> Exiting connection attempt due to disconnection request for %{public}@. %{public}@";
    goto LABEL_40;
  }
  [v17 timeIntervalSinceNow];
  v55 = +[NSNumber numberWithDouble:fabs(v54)];
  [v65 setObject:v55 forKeyedSubscript:kMRConnectionRegisterCustomOriginDurationKey];

  v70 = +[NSDate date];

  uint64_t v19 = [(MRDTransportExternalDevice *)self _onWorkerQueue_syncClientStateWithUserInfo:v74];
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      CFStringRef v103 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<%{public}@> Failed to sync client state for device %{public}@. %{public}@", buf, 0x20u);
    }
    CFStringRef v21 = @"Failed to sync client state";
LABEL_70:
    id v17 = v70;
    goto LABEL_20;
  }
  ((void (*)(void))v71[2])();
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      CFStringRef v103 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<%{public}@> Exiting connection attempt due to disconnection request for %{public}@. %{public}@", buf, 0x20u);
    }
    CFStringRef v21 = @"Interrupted";
    goto LABEL_70;
  }
  [v70 timeIntervalSinceNow];
  v57 = +[NSNumber numberWithDouble:fabs(v56)];
  [v65 setObject:v57 forKeyedSubscript:kMRConnectionSyncClientStateDurationKey];

  [(MRDTransportExternalDevice *)self _onWorkerQueue_sendBatchedMessages];
  v58 = +[MRUserSettings currentSettings];
  [v58 externalDeviceArtificalConnectionDelay];
  double v60 = v59;

  if (v60 > 0.0)
  {
    v61 = _MRLogForCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = @"TransportExternalDevice.connectWithOptions";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      CFStringRef v103 = @"Artifical Delay...";
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v20 = dispatch_semaphore_create(0);
    dispatch_time_t v62 = dispatch_time(0, (uint64_t)(v60 * 1000000000.0));
    dispatch_semaphore_wait(v20, v62);
    CFStringRef v21 = 0;
    uint64_t v19 = 0;
    goto LABEL_70;
  }
  CFStringRef v21 = 0;
  uint64_t v19 = 0;
LABEL_21:
  v22 = +[NSDate date];
  [v22 timeIntervalSinceDate:v70];
  objc_super v24 = v23;

  id v25 = objc_alloc((Class)NSString);
  v26 = [(MRExternalDeviceTransport *)self->_transport name];
  uint64_t v27 = [(MRExternalDeviceTransport *)self->_transport uid];
  v28 = (void *)v27;
  char v29 = a3 & 1;
  if (v19) {
    CFStringRef v30 = v19;
  }
  else {
    CFStringRef v30 = @"success";
  }
  v67 = (__CFString *)[v25 initWithFormat:@"<%@> Connection to: %@ (%@) from client: %@ isRetry: %u allowAuth: %u reason: %@ result: %@ in: %.2f", v16, v26, v27, v69, v7, a3 & 1, v72, v30, v24];

  v31 = _MRLogForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = @"TransportExternalDevice.connectWithOptions";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    CFStringRef v103 = v67;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  objc_initWeak(&location, self);
  v82 = _NSConcreteStackBlock;
  uint64_t v83 = 3221225472;
  v84 = sub_1000A6C78;
  v85 = &unk_10041A600;
  objc_copyWeak(v91, &location);
  BOOL v92 = v7;
  id v32 = v72;
  id v86 = v32;
  id v73 = v16;
  id v87 = v73;
  id v33 = v69;
  id v88 = v33;
  char v93 = v29;
  v91[1] = v24;
  id v34 = v65;
  id v89 = v34;
  v90 = (__CFString *)v21;
  MRAnalyticsSendEvent();
  if (v19)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A6EC4;
    block[3] = &unk_100415B98;
    block[4] = self;
    v79 = v19;
    id v80 = v74;
    v81 = v68;
    dispatch_async((dispatch_queue_t)serialQueue, block);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v103) = 0;
    v36 = self->_serialQueue;
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1000A6ED4;
    v77[3] = &unk_100415940;
    v77[4] = self;
    v77[5] = buf;
    dispatch_sync((dispatch_queue_t)v36, v77);
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v37 = +[NSMutableDictionary dictionary];
      [v37 setObject:v33 forKeyedSubscript:MRPowerLogInfoKeyClientBundleID];
      [v37 setObject:v32 forKeyedSubscript:MRPowerLogInfoKeyReason];
      [v37 setObject:self->_connectionUID forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionID];
      v38 = [(MRDTransportExternalDevice *)self deviceInfo];
      v39 = +[NSNumber numberWithInteger:MRPowerLogDeviceTypeFromDeviceInfo()];
      [v37 setObject:v39 forKeyedSubscript:MRPowerLogInfoKeyDeviceType];

      v40 = +[NSNumber numberWithInteger:MRPowerLogConnectionTransportTypeFromTransport()];
      [v37 setObject:v40 forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionTransportType];

      [v37 setObject:&__kCFBooleanTrue forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionIsActive];
      v41 = +[MRPowerLogger sharedLogger];
      [v41 logEvent:MRPowerLogEventRemoteControlSession withInfo:v37];

      id v42 = objc_alloc((Class)MSVTimer);
      v43 = dispatch_get_global_queue(9, 0);
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_1000A6F48;
      v75[3] = &unk_100415CC8;
      id v44 = v37;
      id v76 = v44;
      v45 = (MSVTimer *)[v42 initWithInterval:1 repeats:v43 queue:v75 block:1800.0];
      powerLogIntervalTimer = self->_powerLogIntervalTimer;
      self->_powerLogIntervalTimer = v45;
    }
    ((void (*)(void *, void))v68[2])(v68, 0);
    [(MRDTransportExternalDevice *)self setConnectionState:2 error:0];
    _Block_object_dispose(buf, 8);
  }

  objc_destroyWeak(v91);
  objc_destroyWeak(&location);
}

- (void)_onSerialQueue_prepareToConnectWithOptions:(unsigned int)a3 userInfo:(id)a4 connectionAttemptDetails:(id)a5 connectionHandler:(id)a6
{
  id v33 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc((Class)MRBlockGuard);
  id v13 = objc_alloc((Class)NSString);
  id v14 = [v10 requestID];
  v15 = [v10 reason];
  id v16 = [v13 initWithFormat:@"%@<%@:%@>", @"TransportExternalDevice.connectWithOptions", v14, v15];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000A74B0;
  v39[3] = &unk_100415FA8;
  id v17 = v11;
  id v40 = v17;
  id v18 = [v12 initWithTimeout:v16 reason:v39 handler:30.0];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000A74C0;
  v36[3] = &unk_1004187A8;
  id v19 = v18;
  id v37 = v19;
  id v20 = v17;
  id v38 = v20;
  CFStringRef v21 = objc_retainBlock(v36);
  unsigned int connectionState = self->_connectionState;
  if (connectionState == 1)
  {
    v26 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Connection already in progress, batching connection attempt %@", self->_pendingConnectCompletionHandlers];
    uint64_t v27 = _MRLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v10 requestID];
      *(_DWORD *)buf = 138543874;
      CFStringRef v42 = @"TransportExternalDevice.connectWithOptions";
      __int16 v43 = 2114;
      id v44 = v28;
      __int16 v45 = 2112;
      CFStringRef v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
    if ((a3 & 1) != 0 && (self->_connectionOptions & 1) == 0)
    {
      char v29 = _MRLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v30 = [v10 requestID];
        *(_DWORD *)buf = 138543874;
        CFStringRef v42 = @"TransportExternalDevice.connectWithOptions";
        __int16 v43 = 2114;
        id v44 = v30;
        __int16 v45 = 2112;
        CFStringRef v46 = @"AuthUpgrade required";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }
      self->_forceReconnectOnConnectionFailure = 1;
      self->_connectionOptions = a3;
    }
    [v19 disarm];

    objc_super v24 = v33;
  }
  else if (connectionState == 2)
  {
    v23 = _MRLogForCategory();
    objc_super v24 = v33;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v10 requestID];
      *(_DWORD *)buf = 138543874;
      CFStringRef v42 = @"TransportExternalDevice.connectWithOptions";
      __int16 v43 = 2114;
      id v44 = v25;
      __int16 v45 = 2112;
      CFStringRef v46 = @"Already Connected";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
    ((void (*)(void *, void))v21[2])(v21, 0);
  }
  else
  {
    self->_connectionOptions = a3;
    [(MRDTransportExternalDevice *)self setConnectionState:1 error:0];
    workerQueue = self->_workerQueue;
    objc_super v24 = v33;
    id v34 = v33;
    v35 = v21;
    id v32 = MRCreateDonatedQosBlock();
    dispatch_async((dispatch_queue_t)workerQueue, v32);
  }
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v37 = a5;
  id v8 = a4;
  v36 = +[NSDate now];
  id v9 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
  id v10 = +[NSNumber numberWithUnsignedInt:v6];
  id v38 = v9;
  [v9 setObject:v10 forKeyedSubscript:@"ConnectOptions"];

  id v11 = [v8 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  uint64_t v12 = [v8 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey];

  id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%p, connectionID=%@", objc_opt_class(), self, self->_connectionUID];
  id v14 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions", v11];
  v15 = v14;
  if (v13) {
    [v14 appendFormat:@" for %@", v13];
  }
  if (v12) {
    [v15 appendFormat:@" because %@", v12];
  }
  v39 = (void *)v12;
  id v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v17 = qos_class_self();
  id v18 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.mediaremote.transportExternalDevice.connect.%@", v11];
  id v19 = (const char *)[v18 UTF8String];
  id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  CFStringRef v21 = dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)v17, 0);
  v22 = [(MRDTransportExternalDevice *)self connectionStateCallbackQueue];
  dispatch_queue_t v23 = dispatch_queue_create_with_target_V2(v19, v21, v22);

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000A79C8;
  v41[3] = &unk_10041A650;
  int v47 = v17;
  id v42 = v11;
  id v43 = v13;
  dispatch_queue_t v45 = v23;
  id v46 = v37;
  id v44 = v36;
  v35 = v23;
  id v24 = v37;
  id v25 = v36;
  id v26 = v13;
  id v27 = v11;
  v28 = objc_retainBlock(v41);
  id v29 = objc_alloc_init((Class)MRExternalDeviceConnectionDetails);
  [v29 setStartDate:v25];
  [v29 setRequestID:v27];
  [v29 setReason:v39];
  [v29 setQos:v17];
  id v30 = [v28 copy];
  [v29 setCompletion:v30];

  serialQueue = self->_serialQueue;
  id v40 = v29;
  id v32 = v38;
  id v33 = v29;
  id v34 = MRCreateDonatedQosBlock();
  dispatch_async((dispatch_queue_t)serialQueue, v34);
}

- (void)_onWorkerQueue_disconnect:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  batchedRequestsDuringReconnectionAttempt = self->_batchedRequestsDuringReconnectionAttempt;
  self->_batchedRequestsDuringReconnectionAttempt = 0;

  [(MRExternalDeviceTransport *)self->_transport resetWithError:v4];
  [(MRDTransportExternalDevice *)self _cleanUpWithReason:3 error:v4];
  if (self->_connectionState != 3) {
    [(MRDTransportExternalDevice *)self setConnectionState:3 error:v4];
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7F1C;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)_onSerialQueue_prepareToDisconnect:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = self->_serialQueue;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  uint64_t v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10032D624();
  }

  id v13 = [v11 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey];
  id v14 = [v11 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  v15 = [v11 objectForKeyedSubscript:MRExternalDeviceConnectionClientBundleIDUserInfoKey];

  id v16 = [v8 domain];
  unsigned int v17 = [v16 isEqualToString:kMRMediaRemoteFrameworkErrorDomain];

  if (v17) {
    uint64_t v18 = (uint64_t)[v8 code];
  }
  else {
    uint64_t v18 = 1;
  }
  id v61 = v13;
  id v60 = v14;
  id v19 = v15;
  double v59 = v9;
  if (qword_10047E098 != -1) {
    dispatch_once(&qword_10047E098, &stru_10041A698);
  }
  uint64_t v20 = qword_10047E090;
  CFStringRef v21 = +[NSNumber numberWithUnsignedInt:v18];
  LOBYTE(v20) = [(id)v20 containsObject:v21];

  v22 = "@\"MRRouteBannerRequest\"" + 22;
  id v23 = v19;
  id v24 = v60;
  id v25 = v61;
  if ((v20 & 1) == 0)
  {
    if (self->_forceReconnectOnConnectionFailure) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = v18 != 119
    }
         && self->_connectionRecoveryBehavior == 1
         && [(MRExternalDeviceTransport *)self->_transport supportsReconnection]
         && self->_reconnectionAttemptCount == 0;
    id v24 = v60;
    if (!v60)
    {
      id v27 = objc_alloc((Class)NSString);
      if (self->_forceReconnectOnConnectionFailure)
      {
        CFStringRef v28 = @"authUpgrade";
      }
      else
      {
        int64_t connectionRecoveryBehavior = self->_connectionRecoveryBehavior;
        CFStringRef v30 = @"?";
        if (connectionRecoveryBehavior == 1) {
          CFStringRef v30 = @"AutoRetry";
        }
        if (connectionRecoveryBehavior) {
          CFStringRef v28 = v30;
        }
        else {
          CFStringRef v28 = @"None";
        }
      }
      id v24 = [v27 initWithFormat:@"attemptReconnection due to <%@>", v28];
    }
    id v25 = v61;
    if (!v61)
    {
      v31 = +[NSUUID UUID];
      id v25 = [v31 UUIDString];
    }
    id v23 = v19;
    if (!v19)
    {
      id v32 = +[MRDMediaRemoteServer server];
      id v33 = [v32 daemonClient];
      id v23 = [v33 bundleIdentifier];

      id v19 = 0;
    }
    [(NSDate *)self->_connectionStateTimestamp timeIntervalSinceNow];
    unint64_t reconnectionAttemptCount = self->_reconnectionAttemptCount;
    id v73 = _NSConcreteStackBlock;
    uint64_t v74 = 3221225472;
    v75 = sub_1000A8854;
    id v76 = &unk_10041A6B8;
    double v77 = -v35;
    unint64_t v78 = reconnectionAttemptCount;
    BOOL v79 = v26;
    MRAnalyticsSendEvent();
    v36 = _MRLogForCategory();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v37)
      {
        unint64_t v38 = self->_reconnectionAttemptCount + 1;
        *(_DWORD *)buf = 138543874;
        v81 = self;
        __int16 v82 = 2048;
        unint64_t v83 = v38;
        __int16 v84 = 2048;
        uint64_t v85 = 1;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect to external device %{public}@ (retry %llu out of %llu)", buf, 0x20u);
      }

      ++self->_reconnectionAttemptCount;
      self->_forceReconnectOnConnectionFailure = 0;
      v39 = +[NSDate now];
      id v40 = (MRDTransportExternalDevice *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions.attemptReconnection", v25];
      v41 = [(MRDTransportExternalDevice *)self shortDescription];

      if (v41)
      {
        id v42 = [(MRDTransportExternalDevice *)self shortDescription];
        [(MRDTransportExternalDevice *)v40 appendFormat:@" for %@", v42];
      }
      id v43 = _MRLogForCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v81 = v40;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
      }

      [(MRDTransportExternalDevice *)self setConnectionState:1 error:0];
      id v44 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->_batchedRequestsDuringReconnectionAttempt];
      batchedRequestsDuringReconnectionAttempt = self->_batchedRequestsDuringReconnectionAttempt;
      self->_batchedRequestsDuringReconnectionAttempt = v44;

      dispatch_time_t v46 = dispatch_time(0, 3500000000);
      workerQueue = self->_workerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000A896C;
      block[3] = &unk_10041A6E0;
      id v24 = v24;
      id v67 = v24;
      id v25 = v25;
      id v68 = v25;
      id v23 = v23;
      id v69 = v23;
      v70 = self;
      id v71 = v39;
      id v72 = v59;
      id v48 = v59;
      id v49 = v39;
      dispatch_after(v46, (dispatch_queue_t)workerQueue, block);

      goto LABEL_46;
    }
    if (v37)
    {
      int64_t v50 = self->_connectionRecoveryBehavior;
      unint64_t v51 = self->_reconnectionAttemptCount;
      *(_DWORD *)buf = 138544130;
      if (v50 == 1) {
        v52 = "retry";
      }
      else {
        v52 = "none";
      }
      v81 = self;
      __int16 v82 = 2114;
      unint64_t v83 = (unint64_t)v8;
      __int16 v84 = 2082;
      uint64_t v85 = (uint64_t)v52;
      __int16 v86 = 2048;
      unint64_t v87 = v51;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not attempting reconnect of external device %{public}@ (error = %{public}@, recovery behavior = %{public}s, attempt count = %llu)", buf, 0x2Au);
    }

    v22 = "\"";
  }
  powerLogIntervalTimer = self->_powerLogIntervalTimer;
  self->_powerLogIntervalTimer = 0;

  if (self->_originalConnectionStartDate)
  {
    double v54 = +[NSMutableDictionary dictionary];
    [v54 setObject:self->_connectionUID forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionID];
    [v54 setObject:&__kCFBooleanFalse forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionIsActive];
    v55 = +[MRPowerLogger sharedLogger];
    [v55 logEvent:MRPowerLogEventRemoteControlSession withInfo:v54];
  }
  double v56 = [(MRExternalClientConnection *)self->_clientConnection cryptoSession];
  [v56 close];

  self->_disconnecting = 1;
  objc_initWeak((id *)buf, self);
  v57 = self->_workerQueue;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = *((void *)v22 + 96);
  v62[2] = sub_1000A8D3C;
  v62[3] = &unk_10041A708;
  objc_copyWeak(&v65, (id *)buf);
  id v63 = v8;
  id v64 = v59;
  id v58 = v59;
  dispatch_async((dispatch_queue_t)v57, v62);

  objc_destroyWeak(&v65);
  objc_destroyWeak((id *)buf);
LABEL_46:
  [(MRDTransportExternalDevice *)self _onSerialQueue_completeGroupSessionRequestsWithIdentifier:0 error:v8];
}

- (void)_callAllPendingCompletionsWithError:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x3032000000;
  CFStringRef v28 = sub_1000A4120;
  id v29 = sub_1000A4130;
  id v30 = 0;
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  CFStringRef v21 = sub_1000A909C;
  v22 = &unk_100415CF0;
  id v23 = self;
  id v24 = &v25;
  msv_dispatch_sync_on_queue();
  if ((unint64_t)[(id)v26[5] count] >= 2)
  {
    id v5 = objc_alloc((Class)NSString);
    id v6 = [v5 initWithFormat:@"Calling batched completions %@", v26[5]];
    BOOL v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(id)v26[5] firstObject];
      id v9 = [v8 requestID];
      *(_DWORD *)buf = 138543874;
      CFStringRef v33 = @"TransportExternalDevice.connectWithOptions";
      __int16 v34 = 2114;
      double v35 = v9;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = (id)v26[5];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) completion];
        ((void (**)(void, id))v14)[2](v14, v4);

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v31 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v25, 8);
}

- (void)disconnect:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A919C;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)verifyConnectionStatusAndMaybeDisconnect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A92A8;
  v6[3] = &unk_10041A730;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(MRDTransportExternalDevice *)self ping:v6 callback:self->_workerQueue withQueue:7.0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v8)
  {
    id v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10032D750((uint64_t)v8, v9);
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)MRGenericMessage) initWithKey:v7 data:v6];
    id v11 = [(MRDTransportExternalDevice *)self clientConnection];
    [v11 sendMessage:v10];
  }
}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000A96AC;
  v23[3] = &unk_10041A778;
  id v10 = [objc_alloc((Class)MSVBlockGuard) initWithDeallocHandler:&stru_10041A750];
  id v24 = v10;
  id v11 = v8;
  id v26 = v11;
  id v12 = v9;
  id v25 = v12;
  id v13 = objc_retainBlock(v23);
  id v14 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v14)
  {
    long long v15 = _MRLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10032D7C8();
    }

    ((void (*)(void *, void *))v13[2])(v13, v14);
  }
  else
  {
    id v16 = [objc_alloc((Class)MRBlockGuard) initWithTimeout:@"ping" reason:v13 handler:a3];
    id v17 = [objc_alloc((Class)MRGenericMessage) initWithKey:0 data:0];
    long long v18 = [(MRDTransportExternalDevice *)self clientConnection];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A977C;
    v20[3] = &unk_10041A7A0;
    id v21 = v16;
    v22 = v13;
    id v19 = v16;
    [v18 sendMessage:v17 reply:v20];
  }
}

- (id)errorForCurrentState
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_1000A4120;
  id v8 = sub_1000A4130;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)currentClientUpdatesConfigMessage
{
  id v3 = objc_alloc_init((Class)MRProtocolMessageOptions);
  [v3 setPriority:5];
  [v3 setWaking:1];
  id v4 = objc_alloc((Class)MRClientUpdatesConfigMessage);
  BOOL v5 = [(MRDTransportExternalDevice *)self wantsNowPlayingNotifications];
  BOOL v6 = [(MRDTransportExternalDevice *)self wantsNowPlayingArtworkNotifications];
  BOOL v7 = [(MRDTransportExternalDevice *)self wantsVolumeNotifications];
  BOOL v8 = [(MRDTransportExternalDevice *)self wantsOutputDeviceNotifications];
  BOOL v9 = [(MRDTransportExternalDevice *)self wantsSystemEndpointNotifications];
  id v10 = [(MRDTransportExternalDevice *)self subscribedPlayerPaths];
  id v11 = [v4 initWithNowPlayingUpdates:v5 artworkUpdates:v6 volumeUpdates:v7 keyboardUpdates:0 outputDeviceUpdates:v8 systemEndpointUpdates:v9 subscribedPlayerPaths:v10];

  [v11 setTransportOptions:v3];

  return v11;
}

- (void)sendClientUpdatesConfigMessage
{
}

- (void)sendClientUpdatesConfigMessageWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MRDTransportExternalDevice *)self deviceInfo];
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A9DCC;
  v17[3] = &unk_10041A7F0;
  objc_copyWeak(&v19, &location);
  id v6 = v4;
  id v18 = v6;
  BOOL v7 = objc_retainBlock(v17);
  BOOL v8 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v8)
  {
    ((void (*)(void *, void *))v7[2])(v7, v8);
  }
  else
  {
    self->_isClientSyncActive = 1;
    unsigned int SharedQueueVersion = MRPairedDeviceGetSharedQueueVersion();
    if (v6 && SharedQueueVersion >= 2)
    {
      id v10 = [(MRDTransportExternalDevice *)self clientConnection];
      id v11 = [(MRDTransportExternalDevice *)self currentClientUpdatesConfigMessage];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000A9ED8;
      v15[3] = &unk_10041A818;
      id v16 = v7;
      [v10 sendMessage:v11 reply:v15];

      Error = v16;
    }
    else
    {
      id v13 = [(MRDTransportExternalDevice *)self clientConnection];
      id v14 = [(MRDTransportExternalDevice *)self currentClientUpdatesConfigMessage];
      [v13 sendMessage:v14];

      Error = (void *)MRMediaRemoteCreateError();
      ((void (*)(void *, void *))v7[2])(v7, Error);
    }
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000AA298;
  v33[3] = &unk_1004189B0;
  id v15 = a7;
  id v35 = v15;
  id v16 = v14;
  id v34 = v16;
  id v17 = objc_retainBlock(v33);
  id v18 = self;
  id v19 = [(MRDTransportExternalDevice *)v18 errorForCurrentState];
  if (v19)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000AA3C0;
    v25[3] = &unk_10041A840;
    v25[4] = v18;
    float v30 = a3;
    id v26 = v12;
    id v27 = v13;
    id v28 = v16;
    id v29 = v15;
    if (![(MRDTransportExternalDevice *)v18 _maybeBatchRequest:v25]) {
      ((void (*)(void *, void *))v17[2])(v17, v19);
    }
  }
  else
  {
    id v20 = objc_alloc_init((Class)MRProtocolMessageOptions);
    [v20 setPriority:4];
    [v20 setWaking:1];
    id v21 = objc_alloc((Class)MRSetVolumeMessage);
    *(float *)&double v22 = a3;
    id v23 = [v21 initWithVolume:v12 outputDeviceUID:v13 details:v22];
    [v23 setTransportOptions:v20];
    id v24 = [(MRDTransportExternalDevice *)v18 clientConnection];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000AA360;
    v31[3] = &unk_10041A818;
    id v32 = v17;
    [v24 sendMessage:v23 reply:v31];
  }
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000AA670;
  v31[3] = &unk_1004189B0;
  id v15 = a7;
  id v33 = v15;
  id v16 = v14;
  id v32 = v16;
  id v17 = objc_retainBlock(v31);
  id v18 = self;
  id v19 = [(MRDTransportExternalDevice *)v18 errorForCurrentState];
  if (v19)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000AA798;
    v23[3] = &unk_1004191A8;
    void v23[4] = v18;
    BOOL v28 = v10;
    id v24 = v12;
    id v25 = v13;
    id v26 = v16;
    id v27 = v15;
    if (![(MRDTransportExternalDevice *)v18 _maybeBatchRequest:v23]) {
      ((void (*)(void *, void *))v17[2])(v17, v19);
    }
  }
  else
  {
    id v20 = objc_alloc_init((Class)MRProtocolMessageOptions);
    [v20 setPriority:4];
    [v20 setWaking:1];
    id v21 = [objc_alloc((Class)MRMuteVolumeMessage) initWithMuted:v10 outputDeviceUID:v12 details:v13];
    [v21 setTransportOptions:v20];
    double v22 = [(MRDTransportExternalDevice *)v18 clientConnection];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AA738;
    v29[3] = &unk_10041A818;
    float v30 = v17;
    [v22 sendMessage:v21 reply:v29];
  }
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000AAA48;
  v31[3] = &unk_1004189B0;
  id v15 = a7;
  id v33 = v15;
  id v16 = v14;
  id v32 = v16;
  id v17 = objc_retainBlock(v31);
  id v18 = self;
  id v19 = [(MRDTransportExternalDevice *)v18 errorForCurrentState];
  if (v19)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000AAB70;
    v23[3] = &unk_10041A868;
    void v23[4] = v18;
    int64_t v28 = a3;
    id v24 = v12;
    id v25 = v13;
    id v26 = v16;
    id v27 = v15;
    if (![(MRDTransportExternalDevice *)v18 _maybeBatchRequest:v23]) {
      ((void (*)(void *, void *))v17[2])(v17, v19);
    }
  }
  else
  {
    id v20 = objc_alloc_init((Class)MRProtocolMessageOptions);
    [v20 setPriority:4];
    [v20 setWaking:1];
    id v21 = [objc_alloc((Class)MRAdjustVolumeMessage) initWithAdjustment:a3 outputDeviceUID:v12 details:v13];
    [v21 setTransportOptions:v20];
    double v22 = [(MRDTransportExternalDevice *)v18 clientConnection];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AAB10;
    v29[3] = &unk_10041A818;
    float v30 = v17;
    [v22 sendMessage:v21 reply:v29];
  }
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000AAD34;
  v18[3] = &unk_10041A890;
  id v10 = a5;
  id v20 = v10;
  id v11 = v9;
  id v19 = v11;
  id v12 = objc_retainBlock(v18);
  id v13 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v13)
  {
    ((void (*)(void *, void *, double))v12[2])(v12, v13, 0.0);
  }
  else
  {
    id v14 = [(MRDTransportExternalDevice *)self clientConnection];
    id v15 = [objc_alloc((Class)MRGetVolumeMessage) initWithOutputDeviceUID:v8];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000AAE9C;
    v16[3] = &unk_10041A818;
    id v17 = v12;
    [v14 sendMessage:v15 timeout:v16 reply:30.0];
  }
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000AB1AC;
  v25[3] = &unk_10041A8B8;
  id v10 = a5;
  id v27 = v10;
  id v11 = v9;
  id v26 = v11;
  id v12 = objc_retainBlock(v25);
  id v13 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v13)
  {
    ((void (*)(void *, void, void *))v12[2])(v12, 0, v13);
  }
  else
  {
    id v14 = [(MRDTransportExternalDevice *)self clientConnection];
    id v15 = [v14 supportedMessages];
    unsigned int v16 = [v15 isSupported:62];

    if (v16)
    {
      id v17 = [(MRDTransportExternalDevice *)self clientConnection];
      id v18 = [objc_alloc((Class)MRGetVolumeControlCapabilitiesMessage) initWithOutputDeviceUID:v8];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000AB30C;
      v23[3] = &unk_10041A818;
      id v24 = v12;
      [v17 sendMessage:v18 timeout:v23 reply:30.0];

      id v19 = v24;
    }
    else
    {
      id v20 = [(MRDTransportExternalDevice *)self customOrigin];
      id v21 = dispatch_get_global_queue(0, 0);
      double v22 = v12;
      MRMediaRemoteGetPickedRoutedVolumeControlCapabilities();

      id v19 = v22;
    }
  }
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AB580;
  v21[3] = &unk_1004189B0;
  id v13 = a6;
  id v23 = v13;
  id v14 = v12;
  id v22 = v14;
  id v15 = objc_retainBlock(v21);
  unsigned int v16 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v16)
  {
    ((void (*)(void *, void *))v15[2])(v15, v16);
  }
  else
  {
    id v17 = [objc_alloc((Class)MRSetListeningModeMessage) initWithListeningMode:v10 outputDeviceUID:v11];
    id v18 = [(MRDTransportExternalDevice *)self clientConnection];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AB6D4;
    v19[3] = &unk_10041A818;
    id v20 = v15;
    [v18 sendMessage:v17 reply:v19];
  }
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000AB8E4;
  v20[3] = &unk_1004189B0;
  id v12 = a6;
  id v22 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = objc_retainBlock(v20);
  id v15 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v15)
  {
    ((void (*)(void *, void *))v14[2])(v14, v15);
  }
  else
  {
    id v16 = [objc_alloc((Class)MRSetConversationDetectionEnabledMessage) initWithOutputDeviceUID:v10 enabled:v8];
    id v17 = [(MRDTransportExternalDevice *)self clientConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000ABA38;
    v18[3] = &unk_10041A818;
    id v19 = v14;
    [v17 sendMessage:v16 reply:v18];
  }
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000ABCD0;
  v23[3] = &unk_1004189B0;
  id v10 = a5;
  id v25 = v10;
  id v11 = v9;
  id v24 = v11;
  id v12 = objc_retainBlock(v23);
  id v13 = self;
  id v14 = [(MRDTransportExternalDevice *)v13 errorForCurrentState];
  if (v14)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000ABDF8;
    v17[3] = &unk_100415B98;
    void v17[4] = v13;
    id v18 = v8;
    id v19 = v11;
    id v20 = v10;
    if (![(MRDTransportExternalDevice *)v13 _maybeBatchRequest:v17]) {
      ((void (*)(void *, void *))v12[2])(v12, v14);
    }
  }
  else
  {
    id v15 = [objc_alloc((Class)MRModifyOutputContextRequestMessage) initWithRequest:v8];
    id v16 = [(MRDTransportExternalDevice *)v13 clientConnection];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000ABD98;
    v21[3] = &unk_10041A818;
    id v22 = v12;
    [v16 sendMessage:v15 reply:v21];
  }
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000AC044;
  v23[3] = &unk_10041A908;
  id v10 = a5;
  id v25 = v10;
  id v11 = v9;
  id v24 = v11;
  id v12 = objc_retainBlock(v23);
  id v13 = self;
  id v14 = [(MRDTransportExternalDevice *)v13 errorForCurrentState];
  if (v14)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000AC258;
    v17[3] = &unk_100415B98;
    void v17[4] = v13;
    id v18 = v8;
    id v19 = v11;
    id v20 = v10;
    if (![(MRDTransportExternalDevice *)v13 _maybeBatchRequest:v17]) {
      ((void (*)(void *, void, void *))v12[2])(v12, 0, v14);
    }
  }
  else
  {
    id v15 = [objc_alloc((Class)MRCreateHostedEndpointRequestMessage) initWithOutputDeviceUIDs:v8];
    id v16 = [(MRDTransportExternalDevice *)v13 clientConnection];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000AC138;
    v21[3] = &unk_10041A818;
    id v22 = v12;
    [v16 sendMessage:v15 reply:v21];
  }
}

- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000AC4BC;
  v23[3] = &unk_1004189B0;
  id v10 = a5;
  id v25 = v10;
  id v11 = v9;
  id v24 = v11;
  id v12 = objc_retainBlock(v23);
  id v13 = self;
  id v14 = [(MRDTransportExternalDevice *)v13 errorForCurrentState];
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AC610;
    v19[3] = &unk_100415B98;
    void v19[4] = v13;
    id v20 = v8;
    id v21 = v11;
    id v22 = v10;
    if (![(MRDTransportExternalDevice *)v13 _maybeBatchRequest:v19]) {
      ((void (*)(void *, void *))v12[2])(v12, v14);
    }
  }
  else
  {
    id v15 = [(MRDTransportExternalDevice *)v13 clientConnection];
    id v16 = objc_alloc((Class)MRRemoveFromParentGroupMessage);
    id v26 = v8;
    id v17 = +[NSArray arrayWithObjects:&v26 count:1];
    id v18 = [v16 initWithOutputDeviceUIDs:v17];
    [v15 sendMessage:v18];

    ((void (*)(void *, void))v12[2])(v12, 0);
  }
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000AC834;
  v25[3] = &unk_10041A930;
  id v11 = v9;
  id v26 = v11;
  id v12 = v10;
  id v27 = v12;
  id v13 = objc_retainBlock(v25);
  id v14 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v14)
  {
    ((void (*)(void *, void, void *))v13[2])(v13, 0, v14);
  }
  else
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AC920;
    block[3] = &unk_10041A958;
    void block[4] = self;
    id v20 = &v21;
    id v19 = v13;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
    if (*((unsigned char *)v22 + 24))
    {
      id v16 = [objc_alloc((Class)MRRequestGroupSessionMessage) initWithDetails:v8];
      id v17 = [(MRDTransportExternalDevice *)self clientConnection];
      [v17 sendMessage:v16];
    }
    _Block_object_dispose(&v21, 8);
  }
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (uint64_t)[v5 type];
  uint64_t v7 = v6;
  if (v6 > 103)
  {
    if (v6 <= 128)
    {
      switch(v6)
      {
        case 'h':
          [(MRDTransportExternalDevice *)self _handleSetPlayerClientPropertiesMessage:v5];
          break;
        case 'i':
          [(MRDTransportExternalDevice *)self _handleSetOriginClientPropertiesMessage:v5];
          break;
        case 'm':
          [(MRDTransportExternalDevice *)self _handleDiscoveryUpdateOutputDevicesMessage:v5];
          break;
      }
    }
    else
    {
      switch(v6)
      {
        case 129:
          [(MRDTransportExternalDevice *)self _handleVolumeMutedDidChangeMessage:v5];
          break;
        case 131:
          [(MRDTransportExternalDevice *)self _handlePlayerClientParticipantsUpdateMessage:v5];
          break;
        case 135:
          [(MRDTransportExternalDevice *)self _handleApplicationConnectionProtocolMessage:v5];
          break;
        case 136:
          [(MRDTransportExternalDevice *)self _handleInvalidateApplicationConnectionMessage:v5];
          break;
        default:
          break;
      }
    }
  }
  else if (v6 <= 16)
  {
    if (v6)
    {
      if (v6 == 4)
      {
        [(MRDTransportExternalDevice *)self _handleSetStateMessage:v5];
      }
      else if (v6 == 11)
      {
        [(MRDTransportExternalDevice *)self _handleNotificationMessage:v5];
      }
    }
    else
    {
LABEL_12:
      id v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v5 uniqueIdentifier];
        id v10 = [v5 replyIdentifier];
        int v11 = 134218754;
        uint64_t v12 = v7;
        __int16 v13 = 2112;
        id v14 = v9;
        __int16 v15 = 2112;
        id v16 = v10;
        __int16 v17 = 2114;
        id v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown message type=%ld identifier=%@ replyIdentifier=%@ attempting to be handled for device %{public}@", (uint8_t *)&v11, 0x2Au);
      }
    }
  }
  else
  {
    switch(v6)
    {
      case '!':
      case '""':
      case '9':
        goto LABEL_12;
      case '#':
      case '$':
      case '\'':
      case '(':
      case ')':
      case '+':
      case ',':
      case '-':
      case '0':
      case '1':
      case '2':
      case '3':
      case '<':
      case '>':
      case '?':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
        break;
      case '%':
        [(MRDTransportExternalDevice *)self _handleDeviceInfoUpdateMessage:v5];
        break;
      case '&':
        [(MRDTransportExternalDevice *)self _handleSetConnectionStateMessage:v5];
        break;
      case '*':
        [(MRDTransportExternalDevice *)self _handleGenericMessage:v5];
        break;
      case '.':
        [(MRDTransportExternalDevice *)self _handleSetNowPlayingClientMessage:v5];
        break;
      case '/':
        [(MRDTransportExternalDevice *)self _handleSetNowPlayingPlayerMessage:v5];
        break;
      case '4':
        [(MRDTransportExternalDevice *)self _handleVolumeDidChangeMessage:v5];
        break;
      case '5':
        [(MRDTransportExternalDevice *)self _handleRemoveClientMessage:v5];
        break;
      case '6':
        [(MRDTransportExternalDevice *)self _handleRemovePlayerMessage:v5];
        break;
      case '7':
        [(MRDTransportExternalDevice *)self _handleUpdateClientMessage:v5];
        break;
      case '8':
        [(MRDTransportExternalDevice *)self _handleUpdateContentItemsMessage:v5];
        break;
      case ':':
        [(MRDTransportExternalDevice *)self _handleUpdatePlayerMessage:v5];
        break;
      case ';':
        [(MRDTransportExternalDevice *)self _handlePromptForRouteAuthorizationMessage:v5];
        break;
      case '=':
        [(MRDTransportExternalDevice *)self _handlePresentRouteAuthorizationStatusMessage:v5];
        break;
      case '@':
        [(MRDTransportExternalDevice *)self _handleVolumeControlCapabilitiesDidChangeMessage:v5];
        break;
      case 'A':
        [(MRDTransportExternalDevice *)self _handleOutputDevicesUpdatedMessage:v5];
        break;
      case 'B':
        [(MRDTransportExternalDevice *)self _handleOutputDevicesRemovedMessage:v5];
        break;
      case 'H':
        [(MRDTransportExternalDevice *)self _handleSetDefaultSupportedCommandsMessage:v5];
        break;
      case 'M':
        [(MRDTransportExternalDevice *)self _handleUpdateActiveSystemEndpoint:v5];
        break;
      default:
        if (v6 == 17) {
          [(MRDTransportExternalDevice *)self _handleLegacyVolumeControlCapabilitiesDidChangeMessage:v5];
        }
        break;
    }
  }
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v9 = objc_alloc_init((Class)MRProtocolMessageOptions);
  [v9 setPriority:4];
  [v9 setWaking:1];
  id v7 = [objc_alloc((Class)MRSetDiscoveryModeMessage) initWithMode:v4 configuration:v6];

  [v7 setTransportOptions:v9];
  id v8 = [(MRDTransportExternalDevice *)self clientConnection];
  [v8 sendMessage:v7];
}

- (void)_handleDiscoveryUpdateOutputDevicesMessage:(id)a3
{
  id v4 = a3;
  id v6 = [v4 outputDevices];
  id v5 = [v4 configuration];

  [(MRDTransportExternalDevice *)self notifyDiscoveryOutputDevicesChanged:v6 forConfiguration:v5];
}

- (void)clientDidDisconnect:(id)a3 error:(id)a4
{
}

- (void)_localDeviceInfoDidChangeNotification:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  id v5 = MRGetOriginFromUserInfo();
  if ([v5 isLocal])
  {
    id v6 = [v10 userInfo];
    id v7 = MRGetDeviceInfoFromUserInfo();

    if (v7)
    {
      id v8 = [(MRDTransportExternalDevice *)self clientConnection];
      id v9 = [objc_alloc((Class)MRDeviceInfoUpdateMessage) initWithDeviceInfo:v7];
      [v8 sendMessage:v9];
    }
  }
}

- (void)_transportDeviceInfoDidChangeNotification:(id)a3
{
  id v9 = a3;
  id v4 = [v9 userInfo];
  id v5 = [v4 objectForKey:MRExternalDeviceTransportNewDeviceInfoUserInfoKey];

  id v6 = [(MRDTransportExternalDevice *)self clientConnection];

  if (v6)
  {
    if (!self->_deviceInfo) {
      goto LABEL_7;
    }
    id v7 = [v5 bluetoothAddress];
    if (v7) {
      MRPairedDeviceSetBluetoothAddress();
    }
  }
  else
  {
    id v8 = [v9 userInfo];
    id v7 = [v8 objectForKey:MRExternalDeviceTransportOldDeviceInfoUserInfoKey];

    [(MRDTransportExternalDevice *)self _handleDeviceInfoChange:v5 oldDevice:v7];
  }

LABEL_7:
}

- (void)_activeSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = +[MRUserSettings currentSettings];
  unsigned __int8 v6 = [v5 disablePairedDeviceActiveEndpointSync];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:MRUpdateActiveSystemEndpointRequestUserInfoKey];

    id v9 = [v8 type];
    id v10 = [v8 outputDeviceUID];
    if (v10)
    {
      int v11 = [v8 outputDeviceUID];
      uint64_t v12 = +[MRAVOutputDevice localDeviceUID];
      unsigned int v13 = [v11 isEqualToString:v12] ^ 1;
    }
    else
    {
      unsigned int v13 = 0;
    }

    if (v9) {
      goto LABEL_15;
    }
    id v14 = [(MRDTransportExternalDevice *)self clientConnection];
    id v15 = [v14 deviceInfo];
    if ([v15 isCompanion] && !objc_msgSend(v8, "isPairedDeviceSync"))
    {
      unsigned int v16 = v13 & ~[v8 suppressPairedDeviceSync];

      if (v16 != 1)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v14 = objc_alloc_init((Class)MRProtocolMessageOptions);
      [v14 setPriority:4];
      if ([v8 demoteWhenSyncingToCompanion])
      {
        [v8 setType:2];
        __int16 v17 = _MRLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          id v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Demoted Gizmo's %@ to RSE", (uint8_t *)&v19, 0xCu);
        }
      }
      id v15 = [objc_alloc((Class)MRUpdateActiveSystemEndpointMessage) initWithRequest:v8];
      [v15 setTransportOptions:v14];
      id v18 = [(MRDTransportExternalDevice *)self clientConnection];
      [v18 sendMessage:v15];
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3
{
  uint64_t v3 = qword_10047E0A8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10047E0A8, &stru_10041A978);
  }
  id v5 = objc_alloc((Class)MRExternalClientConnection);
  id v6 = [v5 initWithConnection:v4 queue:qword_10047E0A0];

  return v6;
}

- (id)_onWorkerQueue_initializeConnectionWithOptions:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v7 = +[NSDate date];
  id v8 = [v6 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  id v9 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions.initializeConnection", v8];
  id v10 = [(MRDTransportExternalDevice *)self shortDescription];

  if (v10)
  {
    int v11 = [(MRDTransportExternalDevice *)self shortDescription];
    [(__CFString *)v9 appendFormat:@" for %@", v11];
  }
  uint64_t v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  [(MRExternalDeviceTransport *)self->_transport setShouldUseSystemAuthenticationPrompt:v4 & 1];
  unsigned int v13 = [(MRExternalDeviceTransport *)self->_transport createConnectionWithUserInfo:v6];
  id v14 = v13;
  if (v13)
  {
    [v13 setConnectOptions:v4];
    id v15 = [(MRDTransportExternalDevice *)self _onWorkerQueue_createClientConnectionWithTransport:v14];
    [v15 setDelegate:self];
    objc_msgSend(v15, "setCryptoEnabled:", -[MRExternalDeviceTransport requiresCustomPairing](self->_transport, "requiresCustomPairing"));
    [(MRDTransportExternalDevice *)self setClientConnection:v15];
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ADCCC;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)serialQueue, block);

    __int16 v17 = [(MRDTransportExternalDevice *)self shortDescription];

    id v18 = _MRLogForCategory();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        id v20 = [(MRDTransportExternalDevice *)self shortDescription];
        uint64_t v21 = +[NSDate date];
        [v21 timeIntervalSinceDate:v7];
        *(_DWORD *)buf = 138544386;
        CFStringRef v46 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
        __int16 v47 = 2114;
        id v48 = v8;
        __int16 v49 = 2112;
        id v50 = v14;
        __int16 v51 = 2114;
        v52 = v20;
        __int16 v53 = 2048;
        uint64_t v54 = v22;
        uint64_t v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        char v24 = v18;
        uint32_t v25 = 52;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

LABEL_15:
      }
LABEL_16:
      id Error = 0;
      goto LABEL_17;
    }
    if (!v19) {
      goto LABEL_16;
    }
    id v20 = +[NSDate date];
    [v20 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138544130;
    CFStringRef v46 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
    __int16 v47 = 2114;
    id v48 = v8;
    __int16 v49 = 2112;
    id v50 = v14;
    __int16 v51 = 2048;
    v52 = v29;
    float v30 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v31 = v18;
    uint32_t v32 = 42;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_15;
  }
  id v26 = [(MRExternalDeviceTransport *)self->_transport error];

  if (v26)
  {
    id v27 = [(MRExternalDeviceTransport *)self->_transport error];
    id Error = [v27 copy];
  }
  else
  {
    id Error = (id)MRMediaRemoteCreateError();
  }
  id v34 = [(MRDTransportExternalDevice *)self shortDescription];

  id v35 = _MRLogForCategory();
  id v18 = v35;
  if (!Error)
  {
    BOOL v40 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (!v40) {
        goto LABEL_16;
      }
      id v20 = [(MRDTransportExternalDevice *)self shortDescription];
      uint64_t v21 = +[NSDate date];
      [v21 timeIntervalSinceDate:v7];
      *(_DWORD *)buf = 138544130;
      CFStringRef v46 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
      __int16 v47 = 2114;
      id v48 = v8;
      __int16 v49 = 2114;
      id v50 = v20;
      __int16 v51 = 2048;
      v52 = v41;
      uint64_t v23 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      char v24 = v18;
      uint32_t v25 = 42;
      goto LABEL_9;
    }
    if (!v40) {
      goto LABEL_16;
    }
    id v20 = +[NSDate date];
    [v20 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138543874;
    CFStringRef v46 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
    __int16 v47 = 2114;
    id v48 = v8;
    __int16 v49 = 2048;
    id v50 = v43;
    float v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v31 = v18;
    uint32_t v32 = 32;
    goto LABEL_14;
  }
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
  if (v34)
  {
    if (!v36) {
      goto LABEL_17;
    }
    id v37 = [(MRDTransportExternalDevice *)self shortDescription];
    unint64_t v38 = +[NSDate date];
    [v38 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138544386;
    CFStringRef v46 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
    __int16 v47 = 2114;
    id v48 = v8;
    __int16 v49 = 2114;
    id v50 = Error;
    __int16 v51 = 2114;
    v52 = v37;
    __int16 v53 = 2048;
    uint64_t v54 = v39;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
  }
  else
  {
    if (!v36) {
      goto LABEL_17;
    }
    id v37 = +[NSDate date];
    [v37 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138544130;
    CFStringRef v46 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
    __int16 v47 = 2114;
    id v48 = v8;
    __int16 v49 = 2114;
    id v50 = Error;
    __int16 v51 = 2048;
    v52 = v42;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
  }

LABEL_17:

  return Error;
}

- (id)_onWorkerQueue_loadDeviceInfoWithUserInfo:(id)a3
{
  id v44 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v43 = +[NSDate date];
  uint64_t v4 = [v44 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  id v5 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions.loadDeviceInfo", v4];
  id v6 = [(MRDTransportExternalDevice *)self shortDescription];

  if (v6)
  {
    id v7 = [(MRDTransportExternalDevice *)self shortDescription];
    [v5 appendFormat:@" for %@", v7];
  }
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v9 = [(MRDTransportExternalDevice *)self clientConnection];
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = objc_alloc_init((Class)MRProtocolMessageOptions);
    [v11 setPriority:5];
    [v11 setWaking:1];
    id v12 = objc_alloc((Class)MRDeviceInfoMessage);
    unsigned int v13 = +[MRDMediaRemoteServer server];
    id v14 = [v13 deviceInfo];
    id v15 = [v12 initWithDeviceInfo:v14];

    [v15 setTransportOptions:v11];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v53 = sub_1000A4120;
    *(void *)uint64_t v54 = sub_1000A4130;
    *(void *)&v54[8] = 0;
    objc_initWeak(&location, self);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000AE4D0;
    v47[3] = &unk_10041A9A0;
    objc_copyWeak(&v50, &location);
    __int16 v49 = buf;
    unsigned int v16 = v10;
    id v48 = v16;
    __int16 v17 = objc_retainBlock(v47);
    id v18 = +[MRUserSettings currentSettings];
    [v18 externalDeviceTimeoutDuration];
    double v20 = v19;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000AE708;
    v45[3] = &unk_10041A818;
    uint64_t v21 = v17;
    id v46 = v21;
    [v9 sendMessage:v15 timeout:v45 reply:v20];

    uint64_t v22 = +[MRUserSettings currentSettings];
    [v22 externalDeviceTimeoutDuration];
    dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));

    if (dispatch_semaphore_wait(v16, v24)) {
      uint32_t v25 = (uint64_t (*)(uint64_t, uint64_t))[objc_alloc((Class)NSError) initWithMRError:113];
    }
    else {
      uint32_t v25 = (uint64_t (*)(uint64_t, uint64_t))*(id *)(*(void *)&buf[8] + 40);
    }
    id v26 = v25;

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v26 = (uint64_t (*)(uint64_t, uint64_t))[objc_alloc((Class)NSError) initWithMRError:100];
  }
  id v27 = [(MRDTransportExternalDevice *)self shortDescription];

  int64_t v28 = _MRLogForCategory();
  id v29 = v28;
  if (v26)
  {
    BOOL v30 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v30)
      {
        v31 = [(MRDTransportExternalDevice *)self shortDescription];
        uint32_t v32 = +[NSDate date];
        [v32 timeIntervalSinceDate:v43];
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2114;
        __int16 v53 = v26;
        *(_WORD *)uint64_t v54 = 2114;
        *(void *)&v54[2] = v31;
        *(_WORD *)&v54[10] = 2048;
        *(void *)&v54[12] = v33;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      }
    }
    else if (v30)
    {
      unint64_t v38 = +[NSDate date];
      [v38 timeIntervalSinceDate:v43];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2114;
      __int16 v53 = v26;
      *(_WORD *)uint64_t v54 = 2048;
      *(void *)&v54[2] = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
    }
  }
  else
  {
    BOOL v34 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v34)
      {
        id v35 = [(MRDTransportExternalDevice *)self shortDescription];
        BOOL v36 = +[NSDate date];
        [v36 timeIntervalSinceDate:v43];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2114;
        __int16 v53 = v35;
        *(_WORD *)uint64_t v54 = 2048;
        *(void *)&v54[2] = v37;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);
      }
    }
    else if (v34)
    {
      BOOL v40 = +[NSDate date];
      [v40 timeIntervalSinceDate:v43];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2048;
      __int16 v53 = v41;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    }
  }

  return v26;
}

- (id)_onWorkerQueue_registerCustomOriginWithUserInfo:(id)a3
{
  workerQueue = self->_workerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)workerQueue);
  id v6 = +[NSDate date];
  id v7 = [(MRDTransportExternalDevice *)self deviceInfo];
  if ([v7 isCompanion]) {
    uint64_t v8 = 1129140302;
  }
  else {
    uint64_t v8 = arc4random();
  }
  id v9 = [(MRDTransportExternalDevice *)self name];
  dispatch_semaphore_t v10 = [v5 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];

  id v11 = [objc_alloc((Class)MROrigin) initWithIdentifier:v8 type:1 displayName:v9];
  id v12 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions.registerCustomOrigin", v10];
  unsigned int v13 = [(MRDTransportExternalDevice *)self shortDescription];

  if (v13)
  {
    id v14 = [(MRDTransportExternalDevice *)self shortDescription];
    [(__CFString *)v12 appendFormat:@" for %@", v14];
  }
  id v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  unsigned int v16 = +[MRDMediaRemoteServer server];
  __int16 v17 = [v16 nowPlayingServer];
  [v17 registerOrigin:v11 deviceInfo:v7];

  [(MRDTransportExternalDevice *)self setCustomOrigin:v11];
  id v18 = [(MRDTransportExternalDevice *)self shortDescription];

  double v19 = _MRLogForCategory();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v18)
    {
      if (v20)
      {
        uint64_t v21 = [(MRDTransportExternalDevice *)self shortDescription];
        uint64_t v22 = +[NSDate date];
        [v22 timeIntervalSinceDate:v6];
        *(_DWORD *)buf = 138544386;
        CFStringRef v35 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
        __int16 v36 = 2114;
        uint64_t v37 = v10;
        __int16 v38 = 2112;
        id v39 = v11;
        __int16 v40 = 2114;
        v41 = v21;
        __int16 v42 = 2048;
        uint64_t v43 = v23;
        dispatch_time_t v24 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        uint32_t v25 = v19;
        uint32_t v26 = 52;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);

LABEL_21:
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if (!v20) {
      goto LABEL_22;
    }
    uint64_t v21 = +[NSDate date];
    [v21 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138544130;
    CFStringRef v35 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
    __int16 v36 = 2114;
    uint64_t v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    __int16 v40 = 2048;
    v41 = v28;
    id v29 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    BOOL v30 = v19;
    uint32_t v31 = 42;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    goto LABEL_21;
  }
  if (!v18)
  {
    if (!v20) {
      goto LABEL_22;
    }
    uint64_t v21 = +[NSDate date];
    [v21 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138543874;
    CFStringRef v35 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
    __int16 v36 = 2114;
    uint64_t v37 = v10;
    __int16 v38 = 2048;
    id v39 = v32;
    id v29 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    BOOL v30 = v19;
    uint32_t v31 = 32;
    goto LABEL_20;
  }
  if (v20)
  {
    uint64_t v21 = [(MRDTransportExternalDevice *)self shortDescription];
    uint64_t v22 = +[NSDate date];
    [v22 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138544130;
    CFStringRef v35 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
    __int16 v36 = 2114;
    uint64_t v37 = v10;
    __int16 v38 = 2114;
    id v39 = v21;
    __int16 v40 = 2048;
    v41 = v27;
    dispatch_time_t v24 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    uint32_t v25 = v19;
    uint32_t v26 = 42;
    goto LABEL_15;
  }
LABEL_22:

  return 0;
}

- (id)_onWorkerQueue_reRegisterCustomOriginWithUserInfo:(id)a3
{
  workerQueue = self->_workerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)workerQueue);
  id v6 = +[NSDate date];
  id v7 = [v5 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];

  uint64_t v8 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions.reregisterCustomOrigin", v7];
  id v9 = [(MRDTransportExternalDevice *)self customOrigin];

  if (v9)
  {
    dispatch_semaphore_t v10 = [(MRDTransportExternalDevice *)self customOrigin];
    [(__CFString *)v8 appendFormat:@" for %@", v10];
  }
  id v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v12 = +[MRDMediaRemoteServer server];
  unsigned int v13 = [v12 nowPlayingServer];
  id v14 = [(MRDTransportExternalDevice *)self customOrigin];
  id v15 = [(MRDTransportExternalDevice *)self deviceInfo];
  [v13 reregisterOrigin:v14 deviceInfo:v15];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AEFC4;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  __int16 v17 = [(MRDTransportExternalDevice *)self shortDescription];

  id v18 = _MRLogForCategory();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      BOOL v20 = [(MRDTransportExternalDevice *)self shortDescription];
      uint64_t v21 = +[NSDate date];
      [v21 timeIntervalSinceDate:v6];
      *(_DWORD *)buf = 138544130;
      CFStringRef v27 = @"TransportExternalDevice.connectWithOptions.reregisterCustomOrigin";
      __int16 v28 = 2114;
      id v29 = v7;
      __int16 v30 = 2114;
      uint32_t v31 = v20;
      __int16 v32 = 2048;
      uint64_t v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);

LABEL_10:
    }
  }
  else if (v19)
  {
    BOOL v20 = +[NSDate date];
    [v20 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138543874;
    CFStringRef v27 = @"TransportExternalDevice.connectWithOptions.reregisterCustomOrigin";
    __int16 v28 = 2114;
    id v29 = v7;
    __int16 v30 = 2048;
    uint32_t v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    goto LABEL_10;
  }

  return 0;
}

- (id)_onWorkerQueue_syncClientStateWithUserInfo:(id)a3
{
  workerQueue = self->_workerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)workerQueue);
  id v6 = +[NSDate date];
  id v7 = [v5 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];

  uint64_t v8 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"TransportExternalDevice.connectWithOptions.syncClientState", v7];
  id v9 = [(MRDTransportExternalDevice *)self shortDescription];

  if (v9)
  {
    dispatch_semaphore_t v10 = [(MRDTransportExternalDevice *)self shortDescription];
    [(__CFString *)v8 appendFormat:@" for %@", v10];
  }
  id v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v12 = +[MRUserSettings currentSettings];
  [v12 externalDeviceTimeoutDuration];
  double v14 = v13;
  id v15 = objc_alloc_init((Class)MRProtocolMessageOptions);
  [v15 setPriority:5];
  [v15 setWaking:1];
  id v16 = [objc_alloc((Class)MRSetConnectionStateMessage) initWithConnectionState:2];
  [v16 setTransportOptions:v15];
  __int16 v17 = [(MRDTransportExternalDevice *)self clientConnection];
  [v17 sendMessage:v16];

  if ([(MRDTransportExternalDevice *)self wantsNowPlayingNotifications]
    || [(MRDTransportExternalDevice *)self wantsVolumeNotifications]
    || [(MRDTransportExternalDevice *)self wantsOutputDeviceNotifications]
    || [(MRDTransportExternalDevice *)self wantsNowPlayingArtworkNotifications]
    || [(MRDTransportExternalDevice *)self wantsSystemEndpointNotifications]
    || ([(MRDTransportExternalDevice *)self subscribedPlayerPaths],
        id v18 = objc_claimAutoreleasedReturnValue(),
        id v19 = [v18 count],
        v18,
        v19))
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000AF444;
    v31[3] = &unk_10041A9C8;
    BOOL v20 = dispatch_semaphore_create(0);
    __int16 v32 = v20;
    [(MRDTransportExternalDevice *)self sendClientUpdatesConfigMessageWithCompletion:v31];
    dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    if (dispatch_semaphore_wait(v20, v21)) {
      id Error = (void *)MRMediaRemoteCreateError();
    }
    else {
      id Error = 0;
    }
  }
  else
  {
    id Error = 0;
  }
  uint64_t v23 = [(MRDTransportExternalDevice *)self shortDescription];

  dispatch_time_t v24 = _MRLogForCategory();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (!v25) {
      goto LABEL_21;
    }
    uint32_t v26 = [(MRDTransportExternalDevice *)self shortDescription];
    CFStringRef v27 = +[NSDate date];
    [v27 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138544130;
    CFStringRef v34 = @"TransportExternalDevice.connectWithOptions.syncClientState";
    __int16 v35 = 2114;
    __int16 v36 = v7;
    __int16 v37 = 2114;
    __int16 v38 = v26;
    __int16 v39 = 2048;
    uint64_t v40 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);
  }
  else
  {
    if (!v25) {
      goto LABEL_21;
    }
    uint32_t v26 = +[NSDate date];
    [v26 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138543874;
    CFStringRef v34 = @"TransportExternalDevice.connectWithOptions.syncClientState";
    __int16 v35 = 2114;
    __int16 v36 = v7;
    __int16 v37 = 2048;
    __int16 v38 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
  }

LABEL_21:

  return Error;
}

- (void)_onWorkerQueue_sendBatchedMessages
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1000A4120;
  id v19 = sub_1000A4130;
  id v20 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF684;
  block[3] = &unk_100415CF0;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)v16[5];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        uint64_t v8 = _MRLogForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending batched request...", v9, 2u);
        }

        (*(void (**)(uint64_t))(v7 + 16))(v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)_cleanUpStreamsWithReason:(int64_t)a3 error:(id)a4
{
  id v14 = a4;
  id v6 = [(MRDTransportExternalDevice *)self clientConnection];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 setDelegate:0];
    if (a3)
    {
      if (a3 != 1)
      {
        uint64_t v8 = 0;
        if (a3 != 3)
        {
LABEL_10:
          [v7 disconnectWithError:v8];

          goto LABEL_11;
        }
        id v9 = v14;
LABEL_9:
        uint64_t v8 = v9;
        goto LABEL_10;
      }
      id v10 = objc_alloc((Class)NSError);
      uint64_t v11 = 123;
    }
    else
    {
      id v10 = objc_alloc((Class)NSError);
      uint64_t v11 = 1;
    }
    id v9 = [v10 initWithMRError:v11];
    goto LABEL_9;
  }
LABEL_11:
  long long v12 = [(MRDTransportExternalDevice *)self clientConnection];
  [v12 setDelegate:0];

  [(MRDTransportExternalDevice *)self setClientConnection:0];
  long long v13 = [(MRDTransportExternalDevice *)self transport];
  [v13 resetWithError:v14];
}

- (void)_cleanUpWithReason:(int64_t)a3 error:(id)a4
{
}

- (void)_onSerialQueue_registerOriginCallbacks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  objc_initWeak(&location, self);
  v40[1] = _NSConcreteStackBlock;
  v40[2] = (id)3221225472;
  v40[3] = sub_1000AFF68;
  v40[4] = &unk_10041A9F0;
  objc_copyWeak(&v41, &location);
  MRMediaRemoteSetCommandHandler();
  id v3 = [(MRDTransportExternalDevice *)self clientConnection];
  id v4 = [v3 supportedMessages];
  unsigned int v5 = [v4 isSupported:32];

  if (v5)
  {
    v39[1] = _NSConcreteStackBlock;
    v39[2] = (id)3221225472;
    v39[3] = sub_1000B0094;
    void v39[4] = &unk_100417C20;
    objc_copyWeak(v40, &location);
    MRMediaRemotePlaybackQueueDataSourceSetRequestCallback();
    objc_destroyWeak(v40);
  }
  id v6 = [(MRDTransportExternalDevice *)self clientConnection];
  uint64_t v7 = [v6 supportedMessages];
  unsigned int v8 = [v7 isSupported:44];

  if (v8)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000B01A4;
    v38[3] = &unk_10041AA40;
    objc_copyWeak(v39, &location);
    id v9 = objc_retainBlock(v38);
    MRMediaRemoteSetBeginLyricsEventCallback();
    MRMediaRemoteSetEndLyricsEventCallback();

    objc_destroyWeak(v39);
  }
  id v10 = [(MRDTransportExternalDevice *)self clientConnection];
  uint64_t v11 = [v10 supportedMessages];
  unsigned int v12 = [v11 isSupported:73];

  if (v12)
  {
    v36[1] = _NSConcreteStackBlock;
    v36[2] = (id)3221225472;
    v36[3] = sub_1000B025C;
    void v36[4] = &unk_100417C20;
    objc_copyWeak(&v37, &location);
    MRMediaRemotePlaybackSessionSetRequestCallbackForOrigin();
    long long v13 = +[MRNowPlayingOriginClientManager sharedManager];
    id v14 = [v13 originClientForOrigin:self->_customOrigin];

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000B0358;
    v35[3] = &unk_100417C70;
    objc_copyWeak(v36, &location);
    [v14 setPlaybackSessionMigrateRequestCallback:v35];
    objc_destroyWeak(v36);

    objc_destroyWeak(&v37);
  }
  uint64_t v15 = [(MRDTransportExternalDevice *)self clientConnection];
  id v16 = [v15 supportedMessages];
  unsigned int v17 = [v16 isSupported:75];

  if (v17)
  {
    v33[1] = _NSConcreteStackBlock;
    v33[2] = (id)3221225472;
    v33[3] = sub_1000B0448;
    void v33[4] = &unk_100417C98;
    objc_copyWeak(&v34, &location);
    MRMediaRemotePlaybackSessionSetMigrateBeginCallbackForOrigin();
    objc_destroyWeak(&v34);
  }
  id v18 = [(MRDTransportExternalDevice *)self clientConnection];
  id v19 = [v18 supportedMessages];
  unsigned int v20 = [v19 isSupported:76];

  if (v20)
  {
    v32[1] = _NSConcreteStackBlock;
    v32[2] = (id)3221225472;
    v32[3] = sub_1000B055C;
    v32[4] = &unk_100417CC0;
    objc_copyWeak(v33, &location);
    MRMediaRemotePlaybackSessionSetMigrateEndCallbackForOrigin();
    objc_destroyWeak(v33);
  }
  dispatch_time_t v21 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v22 = [v21 originClientForOrigin:self->_customOrigin];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000B0680;
  v31[3] = &unk_10041AA90;
  objc_copyWeak(v32, &location);
  [v22 setClientMessageCallback:v31];
  uint64_t v23 = +[MRDMediaRemoteServer server];
  dispatch_time_t v24 = [v23 nowPlayingServer];
  BOOL v25 = [v24 originClientForOrigin:self->_customOrigin];

  uint32_t v26 = [(MRDTransportExternalDevice *)self clientConnection];
  CFStringRef v27 = [v26 supportedMessages];
  LODWORD(v24) = [v27 isSupported:134];

  if (!v24)
  {
    uint64_t v28 = &stru_10041AB18;
LABEL_16:
    [v25 registerCreateNewApplicationConnectionCallback:v28];
    goto LABEL_17;
  }
  if (!_os_feature_enabled_impl())
  {
    uint64_t v28 = &stru_10041AAF8;
    goto LABEL_16;
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B06F8;
  v29[3] = &unk_10041AAB8;
  objc_copyWeak(&v30, &location);
  [v25 registerCreateNewApplicationConnectionCallback:v29];
  objc_destroyWeak(&v30);
LABEL_17:

  objc_destroyWeak(v32);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v11)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B1040;
    v18[3] = &unk_10041AB68;
    objc_copyWeak(&v22, &location);
    id v19 = v8;
    id v20 = v9;
    id v12 = v10;
    id v21 = v12;
    if (![(MRDTransportExternalDevice *)self _maybeBatchRequest:v18]) {
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v11);
    }

    objc_destroyWeak(&v22);
  }
  else
  {
    id v13 = [v8 copy];
    id v14 = objc_alloc_init((Class)MRProtocolMessageOptions);
    [v14 setPriority:4];
    [v14 setWaking:1];
    id v15 = [objc_alloc((Class)MRPlaybackQueueRequestMessage) initWithRequest:v13 forPlayerPath:v9];
    [v15 setTransportOptions:v14];
    id v16 = [(MRDTransportExternalDevice *)self clientConnection];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000B0DDC;
    v23[3] = &unk_10041AB40;
    objc_copyWeak(&v26, &location);
    id v25 = v10;
    id v17 = v13;
    id v24 = v17;
    [v16 sendMessage:v15 timeout:v23 reply:30.0];

    objc_destroyWeak(&v26);
  }

  objc_destroyWeak(&location);
}

- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(MRDTransportExternalDevice *)self errorForCurrentState];
  if (v11)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B135C;
    v15[3] = &unk_10041AB68;
    objc_copyWeak(&v19, &location);
    id v16 = v8;
    id v17 = v9;
    id v12 = v10;
    id v18 = v12;
    if (![(MRDTransportExternalDevice *)self _maybeBatchRequest:v15]) {
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v11);
    }

    objc_destroyWeak(&v19);
  }
  else
  {
    id v13 = [objc_alloc((Class)MRPlaybackSessionRequestMessage) initWithRequest:v8 forPlayerPath:v9];
    id v14 = [(MRDTransportExternalDevice *)self clientConnection];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B12B0;
    v20[3] = &unk_10041A818;
    id v21 = v10;
    [v14 sendMessage:v13 timeout:v20 reply:30.0];
  }
  objc_destroyWeak(&location);
}

- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  id v15 = [(MRDTransportExternalDevice *)v14 errorForCurrentState];
  if (v15)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B1650;
    v19[3] = &unk_10041AB90;
    void v19[4] = v14;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v16 = v13;
    id v23 = v16;
    if (![(MRDTransportExternalDevice *)v14 _maybeBatchRequest:v19]) {
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v15);
    }
  }
  else
  {
    id v17 = [objc_alloc((Class)MRPlaybackSessionMigrateRequestMessage) initWithPlaybackSession:v10 request:v11 forPlayerPath:v12];
    id v18 = [(MRDTransportExternalDevice *)v14 clientConnection];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000B15A4;
    v24[3] = &unk_10041A818;
    id v25 = v13;
    [v18 sendMessage:v17 timeout:v24 reply:30.0];
  }
}

- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = [(MRDTransportExternalDevice *)v11 errorForCurrentState];
  if (v12)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B188C;
    v16[3] = &unk_100415B98;
    void v16[4] = v11;
    id v17 = v8;
    id v18 = v9;
    id v13 = v10;
    id v19 = v13;
    if (![(MRDTransportExternalDevice *)v11 _maybeBatchRequest:v16]) {
      (*((void (**)(id, void *))v13 + 2))(v13, v12);
    }
  }
  else
  {
    id v14 = [objc_alloc((Class)MRPlaybackSessionMigrateBeginMessage) initWithRequest:v8 playerPath:v9];
    id v15 = [(MRDTransportExternalDevice *)v11 clientConnection];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B182C;
    v20[3] = &unk_10041A818;
    id v21 = v10;
    [v15 sendMessage:v14 reply:v20];
  }
}

- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  id v15 = [(MRDTransportExternalDevice *)v14 errorForCurrentState];
  if (v15)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B1AE8;
    v19[3] = &unk_10041AB90;
    void v19[4] = v14;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v16 = v13;
    id v23 = v16;
    if (![(MRDTransportExternalDevice *)v14 _maybeBatchRequest:v19]) {
      (*((void (**)(id, void *))v16 + 2))(v16, v15);
    }
  }
  else
  {
    id v17 = [objc_alloc((Class)MRPlaybackSessionMigrateEndMessage) initWithRequest:v10 error:v11 playerPath:v12];
    id v18 = [(MRDTransportExternalDevice *)v14 clientConnection];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000B1A88;
    v24[3] = &unk_10041A818;
    id v25 = v13;
    [v18 sendMessage:v17 reply:v24];
  }
}

- (void)_callClientConnectionStateCallback:(unsigned int)a3 previousConnectionState:(unsigned int)a4 error:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  msv_dispatch_sync_on_queue();
}

- (void)_callClientPairingCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)_callClientNameCallback
{
  id v3 = (void *)MRExternalDeviceCopyName();
  id v2 = v3;
  msv_dispatch_sync_on_queue();
}

- (void)_callClientAllowsPairingCallback
{
}

- (void)_callClientCustomDataCallback:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  msv_dispatch_sync_on_queue();
}

- (void)_callOutputDevicesUpdatedCallbackWithOutputDevices:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)_callOutputDevicesRemovedCallbackWithOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)_callVolumeCallback:(float)a3 outputDeviceUID:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  msv_dispatch_sync_on_queue();
}

- (void)_callVolumeControlCapabilitiesCallback:(unsigned int)a3 outputDeviceUID:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  msv_dispatch_sync_on_queue();
}

- (void)_callIsMutedCallback:(BOOL)a3 outputDeviceUID:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  msv_dispatch_sync_on_queue();
}

- (void)_callDeviceInfoCallback:(id)a3 oldDeviceInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  msv_dispatch_sync_on_queue();
}

- (BOOL)_maybeBatchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  serialQueue = self->_serialQueue;
  char v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B37AC;
  block[3] = &unk_10041ACA8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v30 = MRMediaRemoteCommandCreateDescription();
    *(_DWORD *)id location = 138543874;
    *(void *)&location[4] = v30;
    __int16 v47 = 2114;
    id v48 = v11;
    __int16 v49 = 2114;
    id v50 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Received command %{public}@ for path %{public}@ for device %{public}@", location, 0x20u);
  }
  char v14 = self;
  id v15 = [(MRDTransportExternalDevice *)v14 errorForCurrentState];
  if (v15)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000B3FA8;
    v32[3] = &unk_10041ACF8;
    v32[4] = v14;
    int v36 = v8;
    id v33 = v10;
    id v34 = v11;
    id v16 = v12;
    id v35 = v16;
    unsigned __int8 v17 = [(MRDTransportExternalDevice *)v14 _maybeBatchRequest:v32];
    if (v16) {
      char v18 = v17;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) == 0)
    {
      id v19 = +[MRCommandResult commandResultWithSendError:2];
      (*((void (**)(id, void *))v16 + 2))(v16, v19);
    }
  }
  else
  {
    id v20 = objc_alloc_init((Class)MRProtocolMessageOptions);
    [v20 setPriority:4];
    [v20 setWaking:1];
    id v31 = [objc_alloc((Class)MRSendCommandMessage) initWithCommand:v8 options:v10 playerPath:v11];
    [v31 setTransportOptions:v20];
    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v22 = qos_class_self();
    id v23 = dispatch_queue_attr_make_with_qos_class(v21, v22, 0);
    dispatch_queue_t v24 = dispatch_queue_create(0, v23);

    id v25 = [(MRDTransportExternalDevice *)v14 clientConnection];
    id v26 = [(MRDTransportExternalDevice *)v14 clientConnection];
    objc_initWeak((id *)location, v26);

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000B3CB0;
    v40[3] = &unk_10041ACD0;
    v40[4] = v14;
    int v45 = v8;
    id v41 = v10;
    objc_copyWeak(&v44, (id *)location);
    id v42 = v11;
    id v43 = v12;
    CFStringRef v27 = objc_retainBlock(v40);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000B3EE4;
    v37[3] = &unk_10041A7A0;
    uint64_t v28 = v24;
    __int16 v38 = v28;
    id v29 = v27;
    id v39 = v29;
    [v25 sendMessage:v31 timeout:v37 reply:30.0];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)location);
  }
}

- (void)_handleSetStateMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDTransportExternalDevice *)self customOrigin];
  id v6 = [v4 state];
  id v7 = [v6 playerPath];
  id v8 = [v7 copy];

  id v9 = (const void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath();
  id v10 = [v6 supportedCommands];
  if (v10) {
    MRMediaRemoteSetSupportedCommandsForPlayer();
  }
  if ([v6 playbackState])
  {
    id v11 = [v4 state];
    unsigned int v12 = [v11 hasPlaybackStateTimestamp];

    if (v12)
    {
      uint64_t v13 = [v4 state];
      [v13 playbackStateTimestamp];
    }
    else if (!self->_isClientSyncActive)
    {
      +[NSDate timeIntervalSinceReferenceDate];
    }
    [v6 playbackState];
    MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp();
  }
  char v14 = [v6 playbackQueue];
  id v15 = [v14 copy];

  if (v15)
  {
    id v23 = v8;
    dispatch_queue_t v24 = v5;
    id v16 = [v15 contentItems];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [*(id *)(*((void *)&v25 + 1) + 8 * i) metadata];
          [v21 setDeviceSpecificUserInfo:0];
        }
        id v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v18);
    }
    qos_class_t v22 = [v15 contentItems];
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer();

    MRMediaRemoteSetPlaybackQueue();
    id v8 = v23;
    id v5 = v24;
  }
  if ([v6 playbackQueueCapabilities])
  {
    [v6 playbackQueueCapabilities];
    MRMediaRemoteSetPlaybackQueueCapabilities();
  }
  CFRelease(v9);
}

- (void)_handleSetNowPlayingClientMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(MRDTransportExternalDevice *)self customOrigin];
  id v5 = [v4 client];

  MRMediaRemoteSetNowPlayingClientForOrigin();
}

- (void)_handleSetNowPlayingPlayerMessage:(id)a3
{
  id v4 = a3;
  id v7 = [(MRDTransportExternalDevice *)self customOrigin];
  id v5 = [v4 playerPath];

  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath();
  MRMediaRemoteSetNowPlayingPlayer();
}

- (void)_handleRemoveClientMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(MRDTransportExternalDevice *)self customOrigin];
  id v5 = [v4 client];

  MRMediaRemoteRemoveClientForOrigin();
}

- (void)_handleRemovePlayerMessage:(id)a3
{
  id v4 = a3;
  id v7 = [(MRDTransportExternalDevice *)self customOrigin];
  id v5 = [v4 playerPath];

  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath();
  MRMediaRemoteRemovePlayer();
}

- (void)_handleUpdateClientMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(MRDTransportExternalDevice *)self customOrigin];
  id v5 = [v4 client];

  MRMediaRemoteUpdateClientProperties();
}

- (void)_handleUpdatePlayerMessage:(id)a3
{
  id v4 = a3;
  id v7 = [(MRDTransportExternalDevice *)self customOrigin];
  id v5 = [v4 playerPath];

  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath();
  MRMediaRemoteUpdatePlayerProperties();
}

- (void)_handleUpdateContentItemsMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDTransportExternalDevice *)self customOrigin];
  id v6 = [v4 playerPath];
  id v7 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath();

  id v8 = [v4 contentItems];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      unsigned int v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) metadata];
        [v13 setDeviceSpecificUserInfo:0];

        unsigned int v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
  MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer();
}

- (void)_handleNotificationMessage:(id)a3
{
  id v4 = a3;
  id v11 = [(MRDTransportExternalDevice *)self customOrigin];
  id v5 = [v4 notification];
  id v6 = [v4 userInfo];
  id v7 = [v4 playerPath];

  id v8 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath();
  if ([v5 isEqualToString:kMRPlaybackQueueContentItemArtworkChangedNotification])
  {
    id v9 = objc_msgSend(objc_alloc((Class)MRPlaybackQueueRequest), "initWithRange:", 0, 1);
    [v9 setArtworkWidth:600.0];
    [v9 setArtworkHeight:600.0];
    id v10 = MRGetContentItemsFromUserInfo();
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer();

LABEL_5:
    goto LABEL_7;
  }
  if ([v5 isEqualToString:kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification])
  {
    id v9 = [v6 objectForKey:kMRMediaRemotePickedRouteVolumeControlAvailabilityUserInfoKey];
    [v9 BOOLValue];
    MRMediaRemoteSetPickedRouteHasVolumeControlForOrigin();
    goto LABEL_5;
  }
  MRMediaRemotePostClientNotification();
LABEL_7:
}

- (void)_handleOutputDevicesUpdatedMessage:(id)a3
{
  id v4 = [a3 outputDevices];
  [(MRDTransportExternalDevice *)self _callOutputDevicesUpdatedCallbackWithOutputDevices:v4];
}

- (void)_handleOutputDevicesRemovedMessage:(id)a3
{
  id v4 = [a3 outputDeviceUIDs];
  [(MRDTransportExternalDevice *)self _callOutputDevicesRemovedCallbackWithOutputDeviceUIDs:v4];
}

- (void)_handleVolumeDidChangeMessage:(id)a3
{
  id v4 = a3;
  [v4 volume];
  int v6 = v5;
  id v8 = [v4 outputDeviceUID];

  LODWORD(v7) = v6;
  [(MRDTransportExternalDevice *)self _callVolumeCallback:v8 outputDeviceUID:v7];
}

- (void)_handleVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 capabilities];
  id v6 = [v4 outputDeviceUID];

  [(MRDTransportExternalDevice *)self _callVolumeControlCapabilitiesCallback:v5 outputDeviceUID:v6];
}

- (void)_handleLegacyVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDTransportExternalDevice *)self customOrigin];
  [v4 capabilities];

  MRMediaRemoteSetPickedRouteVolumeControlCapabilities();
}

- (void)_handleDeviceInfoUpdateMessage:(id)a3
{
  id v4 = a3;
  id v7 = [(MRDTransportExternalDevice *)self deviceInfo];
  id v5 = [v7 copy];
  id v6 = [v4 deviceInfo];

  [(MRDTransportExternalDevice *)self _handleDeviceInfoChange:v6 oldDevice:v5];
}

- (void)_handleDeviceInfoChange:(id)a3 oldDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  msv_dispatch_sync_on_queue();
}

- (void)_onSerialQueue_completeGroupSessionRequestsWithIdentifier:(id)a3 error:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6 | v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = self->_requestGroupSessionCompletions;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        unsigned int v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v12) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v12));
          unsigned int v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
    self->_requestGroupSessionCompletions = 0;
  }
}

- (void)_handleSetConnectionStateMessage:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 3)
  {
    id v4 = [v5 error];
    [(MRDTransportExternalDevice *)self disconnect:v4];
  }
}

- (void)_handleGenericMessage:(id)a3
{
  id v4 = a3;
  id v6 = [v4 data];
  id v5 = [v4 key];

  [(MRDTransportExternalDevice *)self _callClientCustomDataCallback:v6 name:v5];
}

- (void)_handlePromptForRouteAuthorizationMessage:(id)a3
{
  id v3 = a3;
  MRGetSharedService();
  id v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v5 = [v4 workerQueue];
  unint64_t v7 = v3;
  id v6 = v3;
  MRMediaRemoteServicePromptRouteAuthorization();
}

- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3
{
  id v3 = a3;
  MRGetSharedService();
  id v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v5 = [v4 workerQueue];
  unint64_t v7 = v3;
  id v6 = v3;
  MRMediaRemoteServicePresentRouteAuthorizationStatus();
}

- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)MRClient);
  id v6 = [v4 bundleID];
  id v9 = [v5 initWithProcessIdentifier:0 bundleIdentifier:v6];

  unint64_t v7 = [(MRDTransportExternalDevice *)self customOrigin];
  id v8 = [v4 supportedCommands];

  MRMediaRemoteSetDefaultSupportedCommandsForClient();
}

- (void)_handleUpdateActiveSystemEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = +[MRUserSettings currentSettings];
  unsigned __int8 v5 = [v4 disablePairedDeviceActiveEndpointSync];

  if ((v5 & 1) == 0)
  {
    id v6 = [v3 request];
    id v7 = [v6 copy];

    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 bundleIdentifier];
    [v7 setClientBundleIdentifier:v9];

    [v7 setPairedDeviceSync:1];
    [v7 setReason:@"Received update from companion"];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B545C;
    v10[3] = &unk_10041AD20;
    id v11 = v3;
    [v7 perform:&_dispatch_main_q completion:v10];
  }
}

- (void)_handleSetPlayerClientPropertiesMessage:(id)a3
{
  id v4 = a3;
  id v7 = [(MRDTransportExternalDevice *)self customOrigin];
  unsigned __int8 v5 = [v4 playerPath];
  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath();

  MRGetSharedService();
  MRMediaRemoteServiceSetPlayerClientProperties();
}

- (void)_handleSetOriginClientPropertiesMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDTransportExternalDevice *)self customOrigin];
  MRGetSharedService();
  MRMediaRemoteServiceSetOriginClientProperties();
}

- (void)_handleVolumeMutedDidChangeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 isMuted];
  id v6 = [v4 outputDeviceUID];

  [(MRDTransportExternalDevice *)self _callIsMutedCallback:v5 outputDeviceUID:v6];
}

- (void)_handlePlayerClientParticipantsUpdateMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)MRPlayerPath);
  id v6 = [(MRDTransportExternalDevice *)self customOrigin];
  id v7 = [v4 playerPath];
  id v8 = [v7 client];
  id v9 = [v4 playerPath];
  id v10 = [v9 player];
  id v11 = [v5 initWithOrigin:v6 client:v8 player:v10];

  if ([v11 isResolved])
  {
    unsigned int v12 = +[MRDMediaRemoteServer server];
    uint64_t v13 = [v12 nowPlayingServer];
    long long v14 = +[MRDMediaRemoteServer server];
    long long v15 = [v14 daemonClient];
    long long v16 = [v13 queryPlayerPath:v11 forClient:v15];

    long long v17 = [v16 playerClient];
    id v18 = v17;
    if (v17)
    {
      uint64_t v19 = [v17 remoteParticipantDataSource];

      if (v19)
      {
        id v30 = v16;
        id v20 = [v4 participants];
        id v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v20 count]);

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        qos_class_t v22 = [v4 participants];
        id v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v32;
          do
          {
            long long v26 = 0;
            do
            {
              if (*(void *)v32 != v25) {
                objc_enumerationMutation(v22);
              }
              id v27 = [objc_alloc((Class)MRPlaybackQueueParticipant) initWithProtobuf:*(void *)(*((void *)&v31 + 1) + 8 * (void)v26)];
              [v21 addObject:v27];

              long long v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            id v24 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v24);
        }

        long long v28 = [v18 remoteParticipantDataSource];
        id v29 = [v21 copy];
        [v28 updateParticipants:v29];

        long long v16 = v30;
      }
    }
  }
}

- (void)_handleApplicationConnectionProtocolMessage:(id)a3
{
  id v3 = a3;
  id v5 = +[MRDMediaRemoteServer server];
  id v4 = [v5 remoteControlServer];
  [v4 handleClientBoundApplicationConnectionMessage:v3];
}

- (void)_handleInvalidateApplicationConnectionMessage:(id)a3
{
  id v3 = a3;
  id v5 = +[MRDMediaRemoteServer server];
  id v4 = [v5 remoteControlServer];
  [v4 handleInvalidateApplicationConnectionMessage:v3];
}

- (void)_sendClientMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = [(MRDTransportExternalDevice *)v8 errorForCurrentState];
  if (v9)
  {
    long long v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_1000B5BDC;
    id v18 = &unk_1004161E0;
    uint64_t v19 = v8;
    id v20 = v6;
    id v10 = v7;
    id v21 = v10;
    if (![(MRDTransportExternalDevice *)v8 _maybeBatchRequest:&v15])
    {
      id v11 = objc_alloc((Class)MRProtocolMessage);
      id v12 = objc_msgSend(v11, "initWithUnderlyingCodableMessage:error:", 0, v9, v15, v16, v17, v18, v19);
      (*((void (**)(id, id))v10 + 2))(v10, v12);
    }
    uint64_t v13 = v20;
  }
  else
  {
    long long v14 = [(MRDTransportExternalDevice *)v8 clientConnection];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000B5BCC;
    v22[3] = &unk_10041A818;
    id v23 = v7;
    [v14 sendMessage:v6 reply:v22];

    uint64_t v13 = v23;
  }
}

- (int64_t)connectionRecoveryBehavior
{
  return self->_connectionRecoveryBehavior;
}

- (void)setConnectionRecoveryBehavior:(int64_t)a3
{
  self->_int64_t connectionRecoveryBehavior = a3;
}

- (MRExternalDeviceTransport)transport
{
  return self->_transport;
}

- (BOOL)isCallingClientCallback
{
  return self->_isCallingClientCallback;
}

- (void)setIsCallingClientCallback:(BOOL)a3
{
  self->_isCallingClientCallback = a3;
}

- (id)pairingCallback
{
  return self->_pairingCallback;
}

- (void)setPairingCallback:(id)a3
{
}

- (OS_dispatch_queue)pairingCallbackQueue
{
  return self->_pairingCallbackQueue;
}

- (void)setPairingCallbackQueue:(id)a3
{
}

- (id)connectionStateCallback
{
  return self->_connectionStateCallback;
}

- (void)setConnectionStateCallback:(id)a3
{
}

- (OS_dispatch_queue)connectionStateCallbackQueue
{
  return self->_connectionStateCallbackQueue;
}

- (void)setConnectionStateCallbackQueue:(id)a3
{
}

- (id)nameCallback
{
  return self->_nameCallback;
}

- (void)setNameCallback:(id)a3
{
}

- (OS_dispatch_queue)nameCallbackQueue
{
  return self->_nameCallbackQueue;
}

- (void)setNameCallbackQueue:(id)a3
{
}

- (id)pairingAllowedCallback
{
  return self->_pairingAllowedCallback;
}

- (void)setPairingAllowedCallback:(id)a3
{
}

- (OS_dispatch_queue)pairingAllowedCallbackQueue
{
  return self->_pairingAllowedCallbackQueue;
}

- (void)setPairingAllowedCallbackQueue:(id)a3
{
}

- (id)customDataCallback
{
  return self->_customDataCallback;
}

- (void)setCustomDataCallback:(id)a3
{
}

- (OS_dispatch_queue)customDataCallbackQueue
{
  return self->_customDataCallbackQueue;
}

- (void)setCustomDataCallbackQueue:(id)a3
{
}

- (id)outputDevicesUpdatedCallback
{
  return self->_outputDevicesUpdatedCallback;
}

- (void)setOutputDevicesUpdatedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue
{
  return self->_outputDevicesUpdatedCallbackQueue;
}

- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3
{
}

- (id)outputDevicesRemovedCallback
{
  return self->_outputDevicesRemovedCallback;
}

- (void)setOutputDevicesRemovedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue
{
  return self->_outputDevicesRemovedCallbackQueue;
}

- (void)setOutputDevicesRemovedCallbackQueue:(id)a3
{
}

- (id)volumeCallback
{
  return self->_volumeCallback;
}

- (void)setVolumeCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeCallbackQueue
{
  return self->_volumeCallbackQueue;
}

- (void)setVolumeCallbackQueue:(id)a3
{
}

- (id)volumeControlCapabilitiesCallback
{
  return self->_volumeControlCapabilitiesCallback;
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue
{
  return self->_volumeControlCapabilitiesCallbackQueue;
}

- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3
{
}

- (id)volumeMutedCallback
{
  return self->_volumeMutedCallback;
}

- (void)setVolumeMutedCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeMutedCallbackQueue
{
  return self->_volumeMutedCallbackQueue;
}

- (void)setVolumeMutedCallbackQueue:(id)a3
{
}

- (id)deviceInfoCallback
{
  return self->_deviceInfoCallback;
}

- (void)setDeviceInfoCallback:(id)a3
{
}

- (OS_dispatch_queue)deviceInfoCallbackQueue
{
  return self->_deviceInfoCallbackQueue;
}

- (void)setDeviceInfoCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)outputContextCallbackQueue
{
  return self->_outputContextCallbackQueue;
}

- (void)setOutputContextCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSMutableArray)pendingConnectCompletionHandlers
{
  return self->_pendingConnectCompletionHandlers;
}

- (void)setPendingConnectCompletionHandlers:(id)a3
{
}

- (MSVTimer)powerLogIntervalTimer
{
  return self->_powerLogIntervalTimer;
}

- (void)setPowerLogIntervalTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogIntervalTimer, 0);
  objc_storeStrong((id *)&self->_pendingConnectCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_outputContextCallbackQueue, 0);
  objc_storeStrong((id *)&self->_deviceInfoCallbackQueue, 0);
  objc_storeStrong(&self->_deviceInfoCallback, 0);
  objc_storeStrong((id *)&self->_volumeMutedCallbackQueue, 0);
  objc_storeStrong(&self->_volumeMutedCallback, 0);
  objc_storeStrong((id *)&self->_volumeControlCapabilitiesCallbackQueue, 0);
  objc_storeStrong(&self->_volumeControlCapabilitiesCallback, 0);
  objc_storeStrong((id *)&self->_volumeCallbackQueue, 0);
  objc_storeStrong(&self->_volumeCallback, 0);
  objc_storeStrong((id *)&self->_outputDevicesRemovedCallbackQueue, 0);
  objc_storeStrong(&self->_outputDevicesRemovedCallback, 0);
  objc_storeStrong((id *)&self->_outputDevicesUpdatedCallbackQueue, 0);
  objc_storeStrong(&self->_outputDevicesUpdatedCallback, 0);
  objc_storeStrong((id *)&self->_customDataCallbackQueue, 0);
  objc_storeStrong(&self->_customDataCallback, 0);
  objc_storeStrong((id *)&self->_pairingAllowedCallbackQueue, 0);
  objc_storeStrong(&self->_pairingAllowedCallback, 0);
  objc_storeStrong((id *)&self->_nameCallbackQueue, 0);
  objc_storeStrong(&self->_nameCallback, 0);
  objc_storeStrong((id *)&self->_connectionStateCallbackQueue, 0);
  objc_storeStrong(&self->_connectionStateCallback, 0);
  objc_storeStrong((id *)&self->_pairingCallbackQueue, 0);
  objc_storeStrong(&self->_pairingCallback, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_customOrigin, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_requestGroupSessionCompletions, 0);
  objc_storeStrong((id *)&self->_batchedRequestsDuringReconnectionAttempt, 0);
  objc_storeStrong((id *)&self->_connectionUID, 0);
  objc_storeStrong((id *)&self->_originalConnectionStartDate, 0);
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_connectionStateTimestamp, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end