@interface MRDRapportRemoteControlService
+ (NSUserDefaults)userDefaults;
+ (id)_readConnectionRecordsFromDisk;
+ (void)_writeConnectionRecordsToDisk:(id)a3;
- (MRCompanionLinkClient)client;
- (MRDRapportRemoteControlService)init;
- (MRDRapportRemoteControlServiceDelegate)delegate;
- (NSMutableArray)connections;
- (id)_connectionForSource:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_onWorkerQueue_connectRemoteControlChannelForSource:(id)a3 destination:(id)a4 destinationGroupUID:(id)a5 session:(id)a6 name:(id)a7;
- (void)_onWorkerQueue_disconnectAllRemoteControlChannels;
- (void)_onWorkerQueue_disconnectRemoteControlChannelForSource:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_onWorkerQueue_disconnectRemoteControlChannelsWithError:(id)a3 predicate:(id)a4;
- (void)_persistConnectionRecordsToDisk;
- (void)_resetPersistedConnections;
- (void)setClient:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRDRapportRemoteControlService

- (MRDRapportRemoteControlService)init
{
  v27.receiver = self;
  v27.super_class = (Class)MRDRapportRemoteControlService;
  v2 = [(MRDRapportRemoteControlService *)&v27 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaremote.MRDRapportRemoteControlService.workerQueue", v3);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    connections = v2->_connections;
    v2->_connections = v6;

    uint64_t v8 = +[MRCompanionLinkClient sharedCompanionLinkClient];
    client = v2->_client;
    v2->_client = (MRCompanionLinkClient *)v8;

    objc_initWeak(&location, v2);
    v10 = v2->_client;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100058C04;
    v24[3] = &unk_100417DB0;
    objc_copyWeak(&v25, &location);
    id v11 = [(MRCompanionLinkClient *)v10 registerRequest:@"com.apple.mediaremote.remotecontrol.connect" callback:v24];
    v12 = v2->_client;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100058E1C;
    v22[3] = &unk_100417E00;
    objc_copyWeak(&v23, &location);
    id v13 = [(MRCompanionLinkClient *)v12 registerEvent:@"com.apple.mediaremote.remotecontrol.disconnect" callback:v22];
    v14 = v2->_client;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1000591AC;
    v20 = &unk_100417E00;
    objc_copyWeak(&v21, &location);
    id v15 = [(MRCompanionLinkClient *)v14 registerEvent:@"com.apple.mediaremote.remotecontrol.reset" callback:&v17];
    [(MRDRapportRemoteControlService *)v2 _resetPersistedConnections];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (NSUserDefaults)userDefaults
{
  if (qword_10047DF80 != -1) {
    dispatch_once(&qword_10047DF80, &stru_100417E48);
  }
  v2 = (void *)qword_10047DF78;

  return (NSUserDefaults *)v2;
}

- (id)_connectionForSource:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  connections = self->_connections;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000595B4;
  v17[3] = &unk_100417E70;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = [(NSMutableArray *)connections mr_first:v17];

  return v15;
}

- (void)_onWorkerQueue_connectRemoteControlChannelForSource:(id)a3 destination:(id)a4 destinationGroupUID:(id)a5 session:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v36 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v16 = [(MRDRapportRemoteControlService *)self _connectionForSource:v12 destination:v13 session:v15];
  v17 = MRLogCategoryConnections();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = v12;
    __int16 v45 = 2112;
    id v46 = v13;
    __int16 v47 = 2112;
    id v48 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[MRDRapportRemoteControlServiceConnection] Connecting remoteControlChannel to <%@->%@/%@>...", buf, 0x20u);
  }

  id v18 = objc_alloc_init(MRDRapportRemoteControlServiceConnection);
  [(MRDRapportRemoteControlServiceConnection *)v18 setSourceUID:v12];
  [(MRDRapportRemoteControlServiceConnection *)v18 setDestinationOutputDeviceUID:v13];
  [(MRDRapportRemoteControlServiceConnection *)v18 setDestinationGroupUID:v14];
  [(MRDRapportRemoteControlServiceConnection *)v18 setSessionUID:v15];
  [(MRDRapportRemoteControlServiceConnection *)v18 setName:v36];
  id v19 = +[NSDate now];
  [(MRDRapportRemoteControlServiceConnection *)v18 setConnectionAttemptDate:v19];

  id v20 = [objc_alloc((Class)MRRapportTransportConnection) initWithDeviceUID:v12 sessionUID:v15 targetDevice:0 error:0];
  id v21 = objc_alloc((Class)NSString);
  if (v14) {
    id v22 = v14;
  }
  else {
    id v22 = v13;
  }
  id v23 = [v21 initWithFormat:@"RapportRemoteControlChannel-<%@->%@/%@>", v12, v22, v15];
  [v20 setLabel:v23];

  [v20 setDestinationOutputDeviceUID:v13];
  [v20 setDestinationGroupUID:v14];
  [(MRDRapportRemoteControlServiceConnection *)v18 setConnection:v20];
  objc_initWeak((id *)buf, self);
  v24 = +[NSNotificationCenter defaultCenter];
  id v25 = [(MRDRapportRemoteControlServiceConnection *)v18 connection];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100059AD8;
  v37[3] = &unk_100417E98;
  objc_copyWeak(&v42, (id *)buf);
  id v35 = v12;
  id v38 = v35;
  id v26 = v13;
  id v39 = v26;
  id v27 = v15;
  id v40 = v27;
  id v28 = v14;
  id v41 = v28;
  v29 = [v24 addObserverForName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v25 queue:0 usingBlock:v37];
  [(MRDRapportRemoteControlServiceConnection *)v18 setNotificationToken:v29];

  connections = self->_connections;
  if (!connections)
  {
    v31 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v32 = self->_connections;
    self->_connections = v31;

    connections = self->_connections;
  }
  [(NSMutableArray *)connections addObject:v18];
  v33 = [(MRDRapportRemoteControlService *)self delegate];
  v34 = [(MRDRapportRemoteControlServiceConnection *)v18 connection];
  [v33 rapportRemoteControlService:self didAcceptConnection:v34];

  [(MRDRapportRemoteControlService *)self _persistConnectionRecordsToDisk];
  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);
}

- (void)_onWorkerQueue_disconnectAllRemoteControlChannels
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);

  [(MRDRapportRemoteControlService *)self _onWorkerQueue_disconnectRemoteControlChannelsWithError:0 predicate:&stru_100417ED8];
}

- (void)_onWorkerQueue_disconnectRemoteControlChannelForSource:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100059DDC;
  v14[3] = &unk_100417E70;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(MRDRapportRemoteControlService *)self _onWorkerQueue_disconnectRemoteControlChannelsWithError:0 predicate:v14];
}

- (void)_onWorkerQueue_disconnectRemoteControlChannelsWithError:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  v7 = (unsigned int (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v8 = [(NSMutableArray *)self->_connections mutableCopy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    v24 = v7;
    do
    {
      id v13 = 0;
      id v25 = v11;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v13);
        if (v7[2](v7, v14))
        {
          id v15 = MRLogCategoryConnections();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = [v14 sourceUID];
            id v17 = [v14 destinationOutputDeviceUID];
            [v14 sessionUID];
            uint64_t v18 = v12;
            id v19 = v9;
            id v20 = self;
            v22 = id v21 = v6;
            *(_DWORD *)buf = 138412802;
            v31 = v16;
            __int16 v32 = 2112;
            v33 = v17;
            __int16 v34 = 2112;
            id v35 = v22;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDRapportRemoteControlServiceConnection] Disconnecting remoteControlChannel from <%@->%@/%@>...", buf, 0x20u);

            id v6 = v21;
            self = v20;
            id v9 = v19;
            uint64_t v12 = v18;
            v7 = v24;
          }
          id v23 = [v14 connection];
          [v23 closeWithError:v6];

          [(NSMutableArray *)self->_connections removeObject:v14];
          [(MRDRapportRemoteControlService *)self _persistConnectionRecordsToDisk];
          id v11 = v25;
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v11);
  }
}

- (void)_persistConnectionRecordsToDisk
{
  id obj = [(id)objc_opt_class() userDefaults];
  objc_sync_enter(obj);
  [(id)objc_opt_class() _writeConnectionRecordsToDisk:self->_connections];
  objc_sync_exit(obj);
}

- (void)_resetPersistedConnections
{
  v3 = [(id)objc_opt_class() userDefaults];
  objc_sync_enter(v3);
  dispatch_queue_t v4 = [(id)objc_opt_class() _readConnectionRecordsFromDisk];
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v9) sourceUID];
        [v5 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [(MRCompanionLinkClient *)self->_client sendEvent:@"com.apple.mediaremote.remotecontrol.reset", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), 0, (void)v15 destination userInfo];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  [(id)objc_opt_class() _writeConnectionRecordsToDisk:0];
  objc_sync_exit(v3);
}

+ (id)_readConnectionRecordsFromDisk
{
  v2 = [(id)objc_opt_class() userDefaults];
  v3 = [v2 objectForKey:@"incomingRapportConnections"];
  id v4 = objc_alloc((Class)NSSet);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:v9 count:2];
  id v6 = [v4 initWithArray:v5];
  id v7 = MRCreateFromData();

  return v7;
}

+ (void)_writeConnectionRecordsToDisk:(id)a3
{
  id v10 = a3;
  id v3 = [v10 count];
  id v4 = [(id)objc_opt_class() userDefaults];
  id v5 = v4;
  if (v3)
  {
    id v6 = MRCreateDataFromObject();
    [v5 setObject:v6 forKey:@"incomingRapportConnections"];

    if (!MSVDeviceOSIsInternalInstall()) {
      goto LABEL_7;
    }
    id v7 = [(id)objc_opt_class() userDefaults];
    uint64_t v8 = [v10 description];
    [v7 setObject:v8 forKey:@"incomingRapportConnectionsDescription"];
  }
  else
  {
    [v4 removeObjectForKey:@"incomingRapportConnections"];

    if (!MSVDeviceOSIsInternalInstall()) {
      goto LABEL_7;
    }
    id v7 = [(id)objc_opt_class() userDefaults];
    [v7 removeObjectForKey:@"incomingRapportConnectionsDescription"];
  }

LABEL_7:
  id v9 = [(id)objc_opt_class() userDefaults];
  [v9 synchronize];
}

- (MRDRapportRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDRapportRemoteControlServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end