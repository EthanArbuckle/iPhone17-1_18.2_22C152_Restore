@interface MRDIDSCompanionRemoteControlService
- (BOOL)isDiscoveryChannelConnected;
- (MRDIDSCompanionRemoteControlService)initWithRoutingDataSource:(id)a3;
- (MRDIDSCompanionRemoteControlServiceDelegate)delegate;
- (MRDIDSServerClientConnection)discoveryChannel;
- (NSRunLoop)runLoop;
- (NSString)description;
- (void)_addAuthorizationCallbackForOutputDevice:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_handleCompanionDeviceConnectedNotification:(id)a3;
- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3;
- (void)_handleDeviceInfoDidChangeNotification:(id)a3;
- (void)_handleOutputDevicesDidChangeNotification:(id)a3;
- (void)_onWorkerQueue_connectDiscoveryChannelWithReason:(id)a3;
- (void)_onWorkerQueue_connectRemoteControlChannelForDestination:(id)a3 session:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)_onWorkerQueue_disconnectAllRemoteControlChannelsWithError:(id)a3;
- (void)_onWorkerQueue_disconnectDiscoveryChannel;
- (void)_onWorkerQueue_disconnectRemoteControlChannelsForDestination:(id)a3 error:(id)a4;
- (void)_onWorkerQueue_initializeDiscoveryChannel;
- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5;
- (void)_removeAuthorizationCallbackForOutputDevice:(id)a3;
- (void)_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4;
- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDIDSCompanionRemoteControlService

- (MRDIDSCompanionRemoteControlService)initWithRoutingDataSource:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MRDIDSCompanionRemoteControlService;
  v6 = [(MRDIDSCompanionRemoteControlService *)&v36 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaremote.MRDIDSCompanionRemoteControlServiceConnection.workerQueue", v7);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v8;

    v10 = (MRAVRoutingDiscoverySessionConfiguration *)[objc_alloc((Class)MRAVRoutingDiscoverySessionConfiguration) initWithEndpointFeatures:16];
    configuration = v6->_configuration;
    v6->_configuration = v10;

    objc_storeStrong((id *)&v6->_routingDataSource, a3);
    v12 = +[MRIDSCompanionConnection sharedManager];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000A1158;
    v34[3] = &unk_10041A4C0;
    v13 = v6;
    v35 = v13;
    [v12 setMessageHandler:v34 forType:MRIDSServiceMessageTypeConnectRemoteControl];

    v14 = +[NSNotificationCenter defaultCenter];
    uint64_t v15 = MRIDSCompanionConnectionDeviceDidConnect;
    v16 = +[MRIDSCompanionConnection sharedManager];
    [v14 addObserver:v13 selector:"_handleCompanionDeviceConnectedNotification:" name:v15 object:v16];

    v17 = +[NSNotificationCenter defaultCenter];
    uint64_t v18 = MRIDSCompanionConnectionDeviceDidDisconnect;
    v19 = +[MRIDSCompanionConnection sharedManager];
    [v17 addObserver:v13 selector:"_handleCompanionDeviceDisconnectedNotification:" name:v18 object:v19];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v13 selector:"_handleDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

    v21 = +[NSNotificationCenter defaultCenter];
    uint64_t v22 = MRAVEndpointDidAddOutputDeviceNotification;
    v23 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [v21 addObserver:v13 selector:"_handleOutputDevicesDidChangeNotification:" name:v22 object:v23];

    v24 = +[NSNotificationCenter defaultCenter];
    uint64_t v25 = MRAVEndpointDidChangeOutputDeviceNotification;
    v26 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [v24 addObserver:v13 selector:"_handleOutputDevicesDidChangeNotification:" name:v25 object:v26];

    v27 = +[NSNotificationCenter defaultCenter];
    uint64_t v28 = MRAVEndpointDidRemoveOutputDeviceNotification;
    v29 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [v27 addObserver:v13 selector:"_handleOutputDevicesDidChangeNotification:" name:v28 object:v29];

    v30 = v6->_workerQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000A13D8;
    v32[3] = &unk_100415CC8;
    v33 = v13;
    dispatch_async(v30, v32);
  }
  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"%@ %p", v5, self];

  v7 = +[MRIDSCompanionConnection sharedManager];
  [v6 appendFormat:@"IDSWatch: %@\n", v7];

  [(MRDIDSServerClientConnection *)self->_discoveryChannel discoveryMode];
  dispatch_queue_t v8 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  [v6 appendFormat:@"DiscoveryChannelMode: %@\n", v8];

  [v6 appendFormat:@"Connections: %@\n", self->_remoteControlConnections];
  lastSentEndpoint = self->_lastSentEndpoint;
  [(NSDate *)self->_lastSentEndpointDate timeIntervalSinceNow];
  [v6 appendFormat:@"lastSentEndpoint: %@ (%.1fs ago)\n", lastSentEndpoint, -v10];

  return (NSString *)v6;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_started)
  {
    v2->_started = 1;
    workerQueue = v2->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A1594;
    block[3] = &unk_100415CC8;
    block[4] = v2;
    dispatch_async(workerQueue, block);
  }
  objc_sync_exit(v2);
}

- (void)stop
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_started)
  {
    v2->_started = 0;
    workerQueue = v2->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A1640;
    block[3] = &unk_100415CC8;
    block[4] = v2;
    dispatch_async(workerQueue, block);
  }
  objc_sync_exit(v2);
}

- (MRDIDSServerClientConnection)discoveryChannel
{
  id v3 = +[MRIDSCompanionConnection sharedManager];
  if ([v3 isConnected]) {
    discoveryChannel = self->_discoveryChannel;
  }
  else {
    discoveryChannel = 0;
  }
  id v5 = discoveryChannel;

  return v5;
}

- (void)_handleCompanionDeviceConnectedNotification:(id)a3
{
  id v3 = self;
  objc_sync_enter(v3);
  if (v3->_started)
  {
    workerQueue = v3->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A1738;
    block[3] = &unk_100415CC8;
    block[4] = v3;
    dispatch_async(workerQueue, block);
  }
  objc_sync_exit(v3);
}

- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A17BC;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  v4 = [a3 playerPath];
  id v5 = [v4 origin];
  unsigned int v6 = [v5 isLocal];

  if (v6)
  {
    id v8 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    v7 = [(MRDIDSCompanionRemoteControlService *)self discoveryChannel];
    [(MRDIDSCompanionRemoteControlService *)self _sendEndpoint:v8 toClient:v7 options:0];
  }
}

- (void)_handleOutputDevicesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_sendEndpointScheduled)
  {
    v5->_sendEndpointScheduled = 1;
    unsigned int v6 = [v4 object];
    dispatch_time_t v7 = dispatch_time(0, 300000000);
    workerQueue = v5->_workerQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A1A04;
    v10[3] = &unk_1004158D8;
    v10[4] = v5;
    id v11 = v6;
    id v9 = v6;
    dispatch_after(v7, workerQueue, v10);
  }
  objc_sync_exit(v5);
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v6;
  id v8 = [v7 type];
  if (v8 == (id)101)
  {
    [(MRDIDSCompanionRemoteControlService *)self handleSetDiscoveryModeMessage:v7 forClient:v9];
  }
  else if (v8 == (id)38)
  {
    [(MRDIDSCompanionRemoteControlService *)self handleSetConnectionStateMessage:v7 forClient:v9];
  }
}

- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1BA8;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mode];
  [v6 setDiscoveryMode:v7];

  if (v7)
  {
    id v10 = objc_alloc_init((Class)MRProtocolMessageOptions);
    [v10 setPriority:5];
    [v10 setWaking:1];
    id v8 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    id v9 = [(MRDIDSCompanionRemoteControlService *)self discoveryChannel];
    [(MRDIDSCompanionRemoteControlService *)self _sendEndpoint:v8 toClient:v9 options:v10];
  }
}

- (void)_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workerQueue = self->_workerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A1DDC;
  v15[3] = &unk_1004162F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v15);
}

- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 discoveryMode])
  {
    id v10 = [v8 connection];
    id v11 = [v10 exportEndpoint:v19];

    if (v11)
    {
      id v12 = objc_alloc((Class)MRDiscoveryUpdateOutputDevicesMessage);
      id v13 = [v11 outputDevices];
      id v14 = [v12 initWithOutputDevices:v13 configuration:self->_configuration];

      [v14 setTransportOptions:v9];
      [v8 sendMessage:v14];
      lastSentEndpoint = self->_lastSentEndpoint;
      self->_lastSentEndpoint = (MRAVEndpoint *)v11;
      id v16 = v11;

      id v17 = +[NSDate date];
      lastSentEndpointDate = self->_lastSentEndpointDate;
      self->_lastSentEndpointDate = v17;
    }
  }
}

- (void)_onWorkerQueue_connectDiscoveryChannelWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  [(MRDIDSCompanionRemoteControlService *)self _onWorkerQueue_disconnectDiscoveryChannel];
  id v5 = +[MRIDSCompanionConnection sharedManager];
  unsigned int v6 = [v5 isConnected];

  id v7 = MRLogCategoryConnections();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = +[MRIDSCompanionConnection sharedManager];
      id v10 = [v9 deviceInfo];
      id v11 = [v10 name];
      int v14 = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[IDSCompanionRemoteControlService] Connecting discoveryChannel to <%@> for reason <%@>...", (uint8_t *)&v14, 0x16u);
    }
    id v12 = +[MRIDSCompanionConnection sharedManager];
    [v12 resetConnection];

    id v7 = +[MRIDSCompanionConnection sharedManager];
    id v13 = [v7 deviceInfo];
    [(MRDIDSServerClientConnection *)self->_discoveryChannel setDeviceInfo:v13];
  }
  else if (v8)
  {
    int v14 = 138412546;
    uint64_t v15 = (void *)IDSDefaultPairedDevice;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[IDSCompanionRemoteControlService] No device avaiable to connect discoveryChannel to <%@> for reason <%@>", (uint8_t *)&v14, 0x16u);
  }
}

- (void)_onWorkerQueue_disconnectDiscoveryChannel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  [(MRDIDSServerClientConnection *)self->_discoveryChannel setDeviceInfo:0];
  [(MRDIDSServerClientConnection *)self->_discoveryChannel setDiscoveryMode:0];
  lastSentEndpoint = self->_lastSentEndpoint;
  self->_lastSentEndpoint = 0;

  lastSentEndpointDate = self->_lastSentEndpointDate;
  self->_lastSentEndpointDate = 0;
}

- (void)_onWorkerQueue_initializeDiscoveryChannel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  if (qword_10047E088 != -1) {
    dispatch_once(&qword_10047E088, &stru_10041A4E0);
  }
  id v3 = objc_alloc((Class)MRIDSCompanionTransportConnection);
  id v4 = +[MRIDSCompanionConnection sharedManager];
  id v9 = [v3 initWithConnection:v4 type:MRIDSServiceMessageTypeDiscovery destination:0 session:0];

  id v5 = [MRDIDSServerClientConnection alloc];
  unsigned int v6 = [(MRDIDSServerClientConnection *)v5 initWithConnection:v9 queue:qword_10047E080];
  discoveryChannel = self->_discoveryChannel;
  self->_discoveryChannel = v6;

  [(MRDIDSServerClientConnection *)self->_discoveryChannel setDelegate:self];
  [(MRDIDSServerClientConnection *)self->_discoveryChannel setLabel:@"IDSDiscoveryChannel"];
  id v8 = [objc_alloc((Class)MRSupportedProtocolMessages) initWithAllSupportedMessages];
  [(MRDIDSServerClientConnection *)self->_discoveryChannel setSupportedMessages:v8];
}

- (void)_onWorkerQueue_connectRemoteControlChannelForDestination:(id)a3 session:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v38 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v12 = [(NSMutableDictionary *)self->_remoteControlConnections objectForKeyedSubscript:v10];
  id v13 = [v12 objectForKeyedSubscript:v11];

  id v14 = [objc_alloc((Class)NSError) initWithMRError:121, @"New replacement connection %@-%@ established", v10, v11 format];
  [(MRDIDSCompanionRemoteControlService *)self _onWorkerQueue_disconnectRemoteControlChannelsForDestination:v10 error:v14];

  uint64_t v15 = MRLogCategoryConnections();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v55 = v10;
    __int16 v56 = 2112;
    id v57 = v11;
    __int16 v58 = 2112;
    id v59 = v39;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[IDSCompanionRemoteControlService] Connecting remoteControlChannel to <%@-%@> with userInfo %@...", buf, 0x20u);
  }

  id v16 = objc_alloc((Class)MRIDSCompanionTransportConnection);
  id v17 = +[MRIDSCompanionConnection sharedManager];
  id v40 = [v16 initWithConnection:v17 type:MRIDSServiceMessageTypeRemoteControl destination:v10 session:v11];

  id v18 = [objc_alloc((Class)NSString) initWithFormat:@"IDSRemoteControlChannel-<%@/%@>", v10, v11];
  [v40 setLabel:v18];

  [v40 setDestinationOutputDeviceUID:v10];
  [v40 setConnectUserInfo:v39];
  id v19 = objc_alloc_init(MRDIDSCompanionRemoteControlServiceConnection);

  [(MRDIDSCompanionRemoteControlServiceConnection *)v19 setDestination:v10];
  v20 = +[NSDate now];
  [(MRDIDSCompanionRemoteControlServiceConnection *)v19 setConnectionAttemptDate:v20];

  [(MRDIDSCompanionRemoteControlServiceConnection *)v19 setConnection:v40];
  objc_initWeak((id *)buf, self);
  v21 = +[NSNotificationCenter defaultCenter];
  uint64_t v22 = [(MRDIDSCompanionRemoteControlServiceConnection *)v19 connection];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000A2818;
  v50[3] = &unk_10041A508;
  objc_copyWeak(&v53, (id *)buf);
  id v23 = v10;
  id v51 = v23;
  id v24 = v11;
  id v52 = v24;
  uint64_t v25 = [v21 addObserverForName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v22 queue:0 usingBlock:v50];
  [(MRDIDSCompanionRemoteControlServiceConnection *)v19 setNotificationToken:v25];

  remoteControlConnections = self->_remoteControlConnections;
  if (!remoteControlConnections)
  {
    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v28 = self->_remoteControlConnections;
    self->_remoteControlConnections = v27;

    remoteControlConnections = self->_remoteControlConnections;
  }
  id v29 = [(NSMutableDictionary *)remoteControlConnections objectForKeyedSubscript:v23];
  if (!v29)
  {
    id v29 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->_remoteControlConnections setObject:v29 forKeyedSubscript:v23];
  }
  [v29 setObject:v19 forKeyedSubscript:v24];
  v30 = [(MRDIDSCompanionRemoteControlService *)self delegate];
  v31 = [(MRDIDSCompanionRemoteControlServiceConnection *)v19 connection];
  v32 = [v30 idsCompanionRemoteControlService:self didAcceptConnection:v31];

  char v33 = [v32 connectOptions] & 1;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000A2A30;
  v42[3] = &unk_10041A530;
  id v34 = v40;
  id v43 = v34;
  id v41 = v23;
  id v44 = v41;
  id v35 = v38;
  id v48 = v35;
  id v36 = v32;
  char v49 = v33;
  id v45 = v36;
  v46 = self;
  id v37 = v24;
  id v47 = v37;
  [v36 requestDestinationEndpoint:v42];

  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)buf);
}

- (void)_addAuthorizationCallbackForOutputDevice:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  routingDataSource = self->_routingDataSource;
  id v12 = [v8 primaryID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A2DD4;
  v16[3] = &unk_100418E90;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(MRDAVRoutingDataSource *)routingDataSource addAuthorizationCallbackForRouteID:v12 requestCallback:v16];
}

- (void)_removeAuthorizationCallbackForOutputDevice:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v4 = [a3 primaryID];
  [(MRDAVRoutingDataSource *)routingDataSource removeAuthorizationCallbackForRouteID:v4];
}

- (void)_onWorkerQueue_disconnectRemoteControlChannelsForDestination:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v8 = [(NSMutableDictionary *)self->_remoteControlConnections objectForKeyedSubscript:v6];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1000A3138;
  id v14 = &unk_10041A558;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:&v11];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteControlConnections, "setObject:forKeyedSubscript:", 0, v10, v11, v12, v13, v14);
}

- (void)_onWorkerQueue_disconnectAllRemoteControlChannelsWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v5 = [(NSMutableDictionary *)self->_remoteControlConnections copy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A32E8;
  v7[3] = &unk_10041A580;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (MRDIDSCompanionRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDIDSCompanionRemoteControlServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDiscoveryChannelConnected
{
  return self->_isDiscoveryChannelConnected;
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lastSentEndpointDate, 0);
  objc_storeStrong((id *)&self->_lastSentEndpoint, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_remoteControlConnections, 0);
  objc_storeStrong((id *)&self->_discoveryChannelConnectionTimer, 0);
  objc_storeStrong((id *)&self->_discoveryChannel, 0);

  objc_storeStrong((id *)&self->_routingDataSource, 0);
}

@end