@interface MRDIDSRemoteControlService
- (MRDAVRoutingDataSource)routingDataSource;
- (MRDIDSRemoteControlService)initWithRoutingDataSource:(id)a3;
- (MRDIDSRemoteControlServiceDelegate)delegate;
- (MRDIDSService)service;
- (NSMutableDictionary)discoveryChannels;
- (NSMutableDictionary)remoteControlChannels;
- (NSString)debugDescription;
- (OS_dispatch_queue)workerQueue;
- (id)_createDiscoveryChannelForIDSConnection:(id)a3 deviceInfo:(id)a4;
- (id)_createRemoteControlChannelForIDSConnection:(id)a3 deviceInfo:(id)a4 destination:(id)a5 session:(id)a6 userInfo:(id)a7;
- (id)serviceToken;
- (void)_addAuthorizationCallbackForOutputDevice:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_handleConnectRemoteControlMessage:(id)a3 fromDevice:(id)a4 destination:(id)a5 session:(id)a6;
- (void)_handleDiscoveryMessage:(id)a3 fromDevice:(id)a4;
- (void)_intializeClient:(id)a3 forRemoteControlChannel:(id)a4 authCallback:(id)a5 completion:(id)a6;
- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5;
- (void)_removeAuthorizationCallbackForOutputDevice:(id)a3;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)clientDidDisconnect:(id)a3 error:(id)a4;
- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4;
- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryChannels:(id)a3;
- (void)setRemoteControlChannels:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceToken:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDIDSRemoteControlService

- (MRDIDSRemoteControlService)initWithRoutingDataSource:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRDIDSRemoteControlService;
  v6 = [(MRDIDSRemoteControlService *)&v13 init];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.mediaremote.%@", objc_opt_class()];
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_routingDataSource, a3);
  }

  return v6;
}

- (NSString)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  v4 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" Service = %@\n", v4];

  id v5 = [(NSMutableDictionary *)self->_discoveryChannels allValues];
  v6 = MRCreateIndentedDebugDescriptionFromArray();
  [v3 appendFormat:@" DiscoveryChannels = %@\n", v6];

  id v7 = [(NSMutableDictionary *)self->_remoteControlChannels allValues];
  v8 = MRCreateIndentedDebugDescriptionFromArray();
  [v3 appendFormat:@" RemoteControlChannels = %@\n", v8];

  [v3 appendFormat:@"}>"];

  return (NSString *)v3;
}

- (void)start
{
  if (!self->_service)
  {
    id v3 = +[MRDIDSService sharedService];
    service = self->_service;
    self->_service = v3;

    objc_initWeak(&location, self);
    id v5 = self->_service;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007B000;
    v8[3] = &unk_100418D38;
    objc_copyWeak(&v9, &location);
    v6 = [(MRDIDSService *)v5 addMessageHandler:v8];
    id serviceToken = self->_serviceToken;
    self->_id serviceToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)stop
{
  [(MRDIDSService *)self->_service removeHandler:self->_serviceToken];
  id serviceToken = self->_serviceToken;
  self->_id serviceToken = 0;

  service = self->_service;
  self->_service = 0;
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v6;
  id v8 = [v7 type];
  if (v8 == (id)101)
  {
    [(MRDIDSRemoteControlService *)self handleSetDiscoveryModeMessage:v7 forClient:v9];
  }
  else if (v8 == (id)38)
  {
    [(MRDIDSRemoteControlService *)self handleSetConnectionStateMessage:v7 forClient:v9];
  }
}

- (void)clientDidDisconnect:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B3A4;
  block[3] = &unk_1004159B8;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4
{
}

- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B58C;
  block[3] = &unk_1004159B8;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)_handleDiscoveryMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v8 = objc_msgSend(v7, "mr_deviceInfo");
  id v9 = [v8 deviceUID];
  id v10 = [(NSMutableDictionary *)self->_discoveryChannels objectForKeyedSubscript:v9];
  if (!v10)
  {
    v11 = [[MRDIDSServiceConnection alloc] initWithDevice:v7];
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10007B868;
    v18[3] = &unk_1004165A0;
    objc_copyWeak(&v20, &location);
    id v12 = v9;
    id v19 = v12;
    [(MRDIDSServiceConnection *)v11 setInvalidationHandler:v18];
    id v10 = [(MRDIDSRemoteControlService *)self _createDiscoveryChannelForIDSConnection:v11 deviceInfo:v8];
    discoveryChannels = self->_discoveryChannels;
    if (!discoveryChannels)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v15 = self->_discoveryChannels;
      self->_discoveryChannels = v14;

      discoveryChannels = self->_discoveryChannels;
    }
    [(NSMutableDictionary *)discoveryChannels setObject:v10 forKeyedSubscript:v12];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  v16 = [v10 transport];
  v17 = [v6 data];
  [v16 ingestData:v17];
}

- (void)_handleConnectRemoteControlMessage:(id)a3 fromDevice:(id)a4 destination:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v14 = objc_msgSend(v11, "mr_deviceInfo");
  v36 = [v14 deviceUID];
  v15 = [v10 data];
  if (v15)
  {
    v16 = [v10 data];
    id v43 = 0;
    uint64_t v17 = +[NSPropertyListSerialization propertyListWithData:v16 options:0 format:0 error:&v43];
    id v31 = v43;
  }
  else
  {
    uint64_t v17 = 0;
    id v31 = 0;
  }

  v18 = [[MRDIDSServiceConnection alloc] initWithDevice:v11];
  v33 = (void *)v17;
  id v19 = [(MRDIDSRemoteControlService *)self _createRemoteControlChannelForIDSConnection:v18 deviceInfo:v14 destination:v12 session:v13 userInfo:v17];
  remoteControlChannels = self->_remoteControlChannels;
  if (!remoteControlChannels)
  {
    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v22 = self->_remoteControlChannels;
    self->_remoteControlChannels = v21;

    remoteControlChannels = self->_remoteControlChannels;
  }
  v34 = v14;
  v35 = v11;
  -[NSMutableDictionary objectForKeyedSubscript:](remoteControlChannels, "objectForKeyedSubscript:", v36, v31);
  v23 = (MRDIDSRemoteControlServiceRemoteControlChannels *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v23 = objc_alloc_init(MRDIDSRemoteControlServiceRemoteControlChannels);
    [(NSMutableDictionary *)self->_remoteControlChannels setObject:v23 forKeyedSubscript:v36];
  }
  [(MRDIDSRemoteControlServiceRemoteControlChannels *)v23 addChannel:v19 forDestination:v12 session:v13];
  v24 = [(MRDIDSRemoteControlService *)self delegate];
  v25 = [v19 transport];
  v26 = [v24 idsRemoteControlService:self didAcceptConnection:v25];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10007BCE4;
  v39[3] = &unk_100418DA8;
  v40 = v18;
  id v41 = v12;
  id v42 = v13;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007BEE8;
  v37[3] = &unk_100415F80;
  id v38 = v10;
  id v27 = v10;
  id v28 = v13;
  id v29 = v12;
  v30 = v18;
  [(MRDIDSRemoteControlService *)self _intializeClient:v26 forRemoteControlChannel:v19 authCallback:v39 completion:v37];
}

- (id)_createDiscoveryChannelForIDSConnection:(id)a3 deviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10047DFE0 != -1) {
    dispatch_once(&qword_10047DFE0, &stru_100418DC8);
  }
  id v8 = [MRDIDSTransportConnection alloc];
  id v9 = [(MRDIDSTransportConnection *)v8 initWithConnection:v6 type:MRIDSServiceMessageTypeDiscovery destination:0 session:0];
  id v10 = [MRDIDSServerClientConnection alloc];
  id v11 = [(MRDIDSServerClientConnection *)v10 initWithConnection:v9 queue:qword_10047DFD8];
  [(MRDIDSServerClientConnection *)v11 setDeviceInfo:v7];
  id v12 = [objc_alloc((Class)MRSupportedProtocolMessages) initWithAllSupportedMessages];
  [(MRDIDSServerClientConnection *)v11 setSupportedMessages:v12];

  [(MRDIDSServerClientConnection *)v11 setDelegate:self];
  id v13 = objc_alloc_init(MRDIDSRemoteControlServiceDiscoveryChannel);
  [(MRDIDSRemoteControlServiceDiscoveryChannel *)v13 setTransport:v9];
  [(MRDIDSRemoteControlServiceDiscoveryChannel *)v13 setClient:v11];
  v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDIDSRemoteControlService] Created new DiscoveryChannel %@ for device=%@", (uint8_t *)&v16, 0x16u);
  }

  return v13;
}

- (id)_createRemoteControlChannelForIDSConnection:(id)a3 deviceInfo:(id)a4 destination:(id)a5 session:(id)a6 userInfo:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v37 = a7;
  v35 = v13;
  int v16 = [v13 deviceUID];
  v36 = [(NSMutableDictionary *)self->_remoteControlChannels objectForKeyedSubscript:v16];
  [v36 removeChannelForDestination:v14];
  uint64_t v17 = [MRDIDSTransportConnection alloc];
  __int16 v18 = [(MRDIDSTransportConnection *)v17 initWithConnection:v12 type:MRIDSServiceMessageTypeRemoteControl destination:v14 session:v15];
  id v19 = [objc_alloc((Class)NSString) initWithFormat:@"IDSRemoteControlChannel-<%@/%@>", v14, v15];
  [(MRDIDSTransportConnection *)v18 setLabel:v19];

  id v20 = (void *)IDSCopyLocalDeviceUniqueID();
  if ([v14 isEqualToString:v20]) {
    id v21 = 0;
  }
  else {
    id v21 = v14;
  }
  [(MRDIDSTransportConnection *)v18 setDestinationOutputDeviceUID:v21];

  [(MRDIDSTransportConnection *)v18 setConnectUserInfo:v37];
  v22 = objc_alloc_init(MRDIDSRemoteControlServiceRemoteControlChannel);
  [(MRDIDSRemoteControlServiceRemoteControlChannel *)v22 setDestination:v14];
  [(MRDIDSRemoteControlServiceRemoteControlChannel *)v22 setSession:v15];
  v23 = +[NSDate now];
  [(MRDIDSRemoteControlServiceRemoteControlChannel *)v22 setConnectionAttemptDate:v23];

  [(MRDIDSRemoteControlServiceRemoteControlChannel *)v22 setTransport:v18];
  objc_initWeak(&location, self);
  v24 = +[NSNotificationCenter defaultCenter];
  v25 = [(MRDIDSRemoteControlServiceRemoteControlChannel *)v22 transport];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10007C59C;
  v38[3] = &unk_100417E98;
  objc_copyWeak(&v43, &location);
  id v26 = v16;
  id v39 = v26;
  id v27 = v14;
  id v40 = v27;
  id v28 = v15;
  id v41 = v28;
  id v29 = v12;
  id v42 = v29;
  v30 = [v24 addObserverForName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v25 queue:0 usingBlock:v38];
  [(MRDIDSRemoteControlServiceRemoteControlChannel *)v22 setNotificationToken:v30];

  id v31 = _MRLogForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v46 = v22;
    __int16 v47 = 2112;
    v48 = v35;
    __int16 v49 = 2112;
    id v50 = v27;
    __int16 v51 = 2112;
    id v52 = v28;
    __int16 v53 = 2112;
    id v54 = v37;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[MRDIDSRemoteControlService] Created new RemoteControlChannel %@ for device=%@ destination=%@ session=%@ with userInfo=%@", buf, 0x34u);
  }

  v32 = v42;
  v33 = v22;

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  return v33;
}

- (void)_intializeClient:(id)a3 forRemoteControlChannel:(id)a4 authCallback:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007C8C4;
  v18[3] = &unk_100418E40;
  id v19 = v11;
  id v20 = v10;
  char v24 = [v10 connectOptions] & 1;
  id v21 = self;
  id v22 = v13;
  id v23 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  [v15 requestDestinationEndpoint:v18];
}

- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v7 discoveryMode])
  {
    id v9 = [v7 connection];
    id v10 = [v9 exportEndpoint:v15];

    if (v10)
    {
      id v11 = objc_alloc((Class)MRDiscoveryUpdateOutputDevicesMessage);
      id v12 = [v10 outputDevices];
      id v13 = [v7 configuration];
      id v14 = [v11 initWithOutputDevices:v12 configuration:v13];

      [v14 setTransportOptions:v8];
      [v7 sendMessage:v14];
    }
  }
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
  v16[2] = sub_10007CE30;
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

- (MRDAVRoutingDataSource)routingDataSource
{
  return self->_routingDataSource;
}

- (MRDIDSRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDIDSRemoteControlServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
}

- (MRDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSMutableDictionary)discoveryChannels
{
  return self->_discoveryChannels;
}

- (void)setDiscoveryChannels:(id)a3
{
}

- (NSMutableDictionary)remoteControlChannels
{
  return self->_remoteControlChannels;
}

- (void)setRemoteControlChannels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteControlChannels, 0);
  objc_storeStrong((id *)&self->_discoveryChannels, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_serviceToken, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_routingDataSource, 0);
}

@end