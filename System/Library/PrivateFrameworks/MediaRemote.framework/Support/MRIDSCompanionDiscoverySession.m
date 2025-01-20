@interface MRIDSCompanionDiscoverySession
- (BOOL)devicePresenceDetected;
- (MRIDSCompanionDiscoverySession)init;
- (MRIDSCompanionDiscoverySession)initWithConfiguration:(id)a3;
- (MRProtocolClientConnection)discoveryChannel;
- (NSString)debugDescription;
- (id)availableOutputDevices;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (void)_handleCompanionDeviceDidConnectNotification:(id)a3;
- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3;
- (void)_onIDSQueue_connectDiscoveryChannel:(id)a3;
- (void)_onIDSQueue_disconnectDiscoveryChannel:(id)a3;
- (void)_onIDSQueue_initializeDiscoveryChannel;
- (void)_syncClientStateToConnection:(id)a3;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)handleUpdateOutputDevicesMessage:(id)a3 forClient:(id)a4;
- (void)setDiscoveryChannel:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRIDSCompanionDiscoverySession

- (MRIDSCompanionDiscoverySession)init
{
  return [(MRIDSCompanionDiscoverySession *)self initWithFeatures:16];
}

- (MRIDSCompanionDiscoverySession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRIDSCompanionDiscoverySession;
  v5 = [(MRIDSCompanionDiscoverySession *)&v19 initWithConfiguration:v4];
  if (v5)
  {
    v5->_endpointFeatures = [v4 features];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.MRExternalRoutingDiscoverySession.idsQueue", v6);
    idsQueue = v5->_idsQueue;
    v5->_idsQueue = (OS_dispatch_queue *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    uint64_t v10 = MRIDSCompanionConnectionDeviceDidDisconnect;
    v11 = +[MRIDSCompanionConnection sharedManager];
    [v9 addObserver:v5 selector:"_handleCompanionDeviceDisconnectedNotification:" name:v10 object:v11];

    v12 = +[NSNotificationCenter defaultCenter];
    uint64_t v13 = MRIDSCompanionConnectionDeviceDidConnect;
    v14 = +[MRIDSCompanionConnection sharedManager];
    [v12 addObserver:v5 selector:"_handleCompanionDeviceDidConnectNotification:" name:v13 object:v14];

    v15 = v5->_idsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015A60C;
    block[3] = &unk_100415CC8;
    v18 = v5;
    dispatch_async(v15, block);
  }
  return v5;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)MRIDSCompanionDiscoverySession;
  id v4 = [(MRIDSCompanionDiscoverySession *)&v9 debugDescription];
  v5 = +[MRIDSCompanionConnection sharedManager];
  v6 = [(MRIDSCompanionDiscoverySession *)self availableOutputDevices];
  id v7 = [v3 initWithFormat:@"%@\nIDSCompanion: %@\navailableDevices = %@\n", v4, v5, v6];

  return (NSString *)v7;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_discoveryMode != v3)
  {
    v5 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();

    if (v5)
    {
      v6 = _MRLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        id v9 = (id)MRMediaRemoteCopyRouteDiscoveryModeDescription();
        uint64_t v10 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
        int v16 = 138544130;
        id v17 = v8;
        __int16 v18 = 2114;
        CFStringRef v19 = @"discoveryMode";
        __int16 v20 = 2112;
        id v21 = v9;
        __int16 v22 = 2112;
        v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", (uint8_t *)&v16, 0x2Au);
      }
    }
    else
    {
      v6 = _MRLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
        int v16 = 138543874;
        id v17 = v12;
        __int16 v18 = 2114;
        CFStringRef v19 = @"discoveryMode";
        __int16 v20 = 2112;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v16, 0x20u);
      }
    }

    v4->_discoveryMode = v3;
    id v14 = objc_msgSend(objc_alloc((Class)MRSetDiscoveryModeMessage), "initWithMode:features:", v3, -[MRIDSCompanionDiscoverySession endpointFeatures](v4, "endpointFeatures"));
    v15 = [(MRIDSCompanionDiscoverySession *)v4 discoveryChannel];
    [v15 sendMessage:v14];
  }
  objc_sync_exit(v4);
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (unsigned)endpointFeatures
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int endpointFeatures = v2->_endpointFeatures;
  objc_sync_exit(v2);

  return endpointFeatures;
}

- (MRProtocolClientConnection)discoveryChannel
{
  uint64_t v3 = +[MRIDSCompanionConnection sharedManager];
  if ([v3 isConnected]) {
    discoveryChannel = self->_discoveryChannel;
  }
  else {
    discoveryChannel = 0;
  }
  v5 = discoveryChannel;

  return v5;
}

- (BOOL)devicePresenceDetected
{
  v2 = [(MRIDSCompanionDiscoverySession *)self availableOutputDevices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)availableOutputDevices
{
  return [(MRIDSCompanionDiscoverySession *)self outputDevicesSnapshot];
}

- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3
{
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AB6C;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)idsQueue, block);
}

- (void)_handleCompanionDeviceDidConnectNotification:(id)a3
{
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015ABFC;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)idsQueue, block);
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 type] == (id)109) {
    [(MRIDSCompanionDiscoverySession *)self handleUpdateOutputDevicesMessage:v6 forClient:v7];
  }
}

- (void)handleUpdateOutputDevicesMessage:(id)a3 forClient:(id)a4
{
  v5 = [a3 outputDevices];
  objc_msgSend(v5, "msv_map:", &stru_10041EDA8);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(MRIDSCompanionDiscoverySession *)self notifyOutputDevicesChanged:v6];
}

- (void)_onIDSQueue_connectDiscoveryChannel:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  [(MRIDSCompanionDiscoverySession *)self _onIDSQueue_disconnectDiscoveryChannel:v4];
  v5 = _MRLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = +[MRIDSCompanionConnection sharedManager];
      id v8 = [v7 deviceInfo];
      id v9 = [v8 name];
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRIDSDiscoverySession] Connecting discoveryChannel to <%@>...", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v10 = +[MRIDSCompanionConnection sharedManager];
    v11 = [v10 deviceInfo];
    [v4 setDeviceInfo:v11];

    [(MRIDSCompanionDiscoverySession *)self _syncClientStateToConnection:v4];
  }
  else
  {
    if (v6)
    {
      int v12 = 138412290;
      uint64_t v13 = (void *)IDSDefaultPairedDevice;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRIDSDiscoverySession] No device to connect discoveryChannel to <%@>...", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_syncClientStateToConnection:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init((Class)MRProtocolMessageOptions);
  [v4 setPriority:5];
  [v4 setWaking:1];
  id v5 = objc_alloc_init((Class)MRCompositeMessage);
  [v5 setTransportOptions:v4];
  BOOL v6 = self;
  objc_sync_enter(v6);
  id v7 = [objc_alloc((Class)MRSetConnectionStateMessage) initWithConnectionState:2];
  [v5 addMessage:v7];

  id v8 = (id)[(MRIDSCompanionDiscoverySession *)v6 discoveryMode];
  if (v8)
  {
    id v9 = objc_msgSend(objc_alloc((Class)MRSetDiscoveryModeMessage), "initWithMode:features:", v8, -[MRIDSCompanionDiscoverySession endpointFeatures](v6, "endpointFeatures"));
    [v5 addMessage:v9];
  }
  objc_sync_exit(v6);

  [v10 sendMessage:v5];
}

- (void)_onIDSQueue_disconnectDiscoveryChannel:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  id v5 = [v4 deviceInfo];

  if (v5)
  {
    BOOL v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = IDSDefaultPairedDevice;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRIDSDiscoverySession] Disconnecting discoveryChannel for <%@>...", (uint8_t *)&v7, 0xCu);
    }

    [v4 setDeviceInfo:0];
    [(MRIDSCompanionDiscoverySession *)self notifyOutputDevicesChanged:0];
  }
}

- (void)_onIDSQueue_initializeDiscoveryChannel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  BOOL v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    uint64_t v12 = IDSDefaultPairedDevice;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRIDSDiscoverySession] Initializing discoveryChannel for <%@>", (uint8_t *)&v11, 0xCu);
  }

  id v4 = objc_alloc((Class)MRIDSCompanionTransportConnection);
  id v5 = +[MRIDSCompanionConnection sharedManager];
  id v6 = [v4 initWithConnection:v5 type:MRIDSServiceMessageTypeDiscovery destination:0 session:0];

  if (qword_10047E400 != -1) {
    dispatch_once(&qword_10047E400, &stru_10041EDC8);
  }
  id v7 = objc_alloc((Class)MRIDSClientConnection);
  uint64_t v8 = (MRProtocolClientConnection *)[v7 initWithConnection:v6 queue:qword_10047E3F8];
  discoveryChannel = self->_discoveryChannel;
  self->_discoveryChannel = v8;

  [(MRProtocolClientConnection *)self->_discoveryChannel setDelegate:self];
  [(MRProtocolClientConnection *)self->_discoveryChannel setLabel:@"IDSDiscoveryChannel"];
  id v10 = [objc_alloc((Class)MRSupportedProtocolMessages) initWithAllSupportedMessages];
  [(MRProtocolClientConnection *)self->_discoveryChannel setSupportedMessages:v10];
}

- (void)setDiscoveryChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsQueue, 0);

  objc_storeStrong((id *)&self->_discoveryChannel, 0);
}

@end