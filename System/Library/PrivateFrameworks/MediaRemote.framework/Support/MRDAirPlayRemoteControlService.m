@interface MRDAirPlayRemoteControlService
- (MRDAirPlayRemoteControlService)init;
- (MRDAirPlayRemoteControlServiceDelegate)delegate;
- (NSString)debugDescription;
- (void)_didCloseCommunicationChannel:(id)a3 error:(id)a4;
- (void)_didReceiveData:(id)a3 fromCommunicationChannel:(id)a4 connectionFactory:(id)a5;
- (void)_handleNewConnection:(id)a3 forServiceType:(int64_t)a4;
- (void)dealloc;
- (void)didCloseCommunicationChannel:(id)a3;
- (void)didReceiveData:(id)a3 fromCommunicationChannel:(id)a4;
- (void)outputContext:(id)a3 didCloseCommunicationChannel:(id)a4;
- (void)outputContext:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startContext:(id)a3;
- (void)stop;
@end

@implementation MRDAirPlayRemoteControlService

- (MRDAirPlayRemoteControlService)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRDAirPlayRemoteControlService;
  v2 = [(MRDAirPlayRemoteControlService *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable weakToWeakObjectsMapTable];
    connections = v2->_connections;
    v2->_connections = (NSMapTable *)v3;

    v2->_started = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaremote.MRDAirPlayRemoteControlService.workerQueue", v5);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[MRDMRRelayConnectionManager sharedManager];
    mrRelayConnectionManager = v2->_mrRelayConnectionManager;
    v2->_mrRelayConnectionManager = (MRDMRRelayConnectionManager *)v8;
  }
  return v2;
}

- (void)dealloc
{
  [(MRDAirPlayRemoteControlService *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MRDAirPlayRemoteControlService;
  [(MRDAirPlayRemoteControlService *)&v3 dealloc];
}

- (NSString)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(NSMapTable *)v2->_connections objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  id v8 = objc_alloc((Class)NSString);
  uint64_t v9 = objc_opt_class();
  if (v2->_started) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  objc_super v11 = MRCreateIndentedDebugDescriptionFromArray();
  v12 = MRCreateIndentedDebugDescriptionFromObject();
  id v13 = [v8 initWithFormat:@"<%@:%p {\n  started = %@\n  connections = %@\n  relayConnectionManager = %@\n}>", v9, v2, v10, v11, v12];

  objc_sync_exit(v2);

  return (NSString *)v13;
}

- (void)start
{
  if (MRSupportsMediaControlReceiver())
  {
    if (qword_10047E228 != -1) {
      dispatch_once(&qword_10047E228, &stru_10041D558);
    }
    if (qword_10047E230 && dlsym((void *)qword_10047E230, "APReceiverMediaRemoteXPCClient_SetDelegate"))
    {
      id v3 = MRLogCategoryConnections();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[AirPlayRemoteControlService] Starting AirPlay remote control service", v7, 2u);
      }

      off_100477280(self);
    }
  }
  if (!self->_systemMusicContext)
  {
    v4 = [(objc_class *)off_1004771B8() sharedAudioPresentationOutputContext];
    [v4 setCommunicationChannelDelegate:self];
    systemMusicContext = self->_systemMusicContext;
    self->_systemMusicContext = (AVOutputContext *)v4;
  }
  uint64_t v6 = +[MRDAVOutputContextManager sharedManager];
  [v6 registerCommunicationsChannels];

  self->_started = 1;
}

- (void)stop
{
  if (MRSupportsMediaControlReceiver())
  {
    if (qword_10047E228 != -1) {
      dispatch_once(&qword_10047E228, &stru_10041D558);
    }
    if (qword_10047E230 && dlsym((void *)qword_10047E230, "APReceiverMediaRemoteXPCClient_SetDelegate"))
    {
      id v3 = MRLogCategoryConnections();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[AirPlayRemoteControlService] Stopping AirPlay remote control service", v4, 2u);
      }

      off_100477280(0);
    }
  }
  [(AVOutputContext *)self->_systemMusicContext setCommunicationChannelDelegate:0];
  self->_started = 0;
}

- (void)startContext:(id)a3
{
}

- (void)outputContext:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workerQueue = self->_workerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100115714;
  v15[3] = &unk_1004162F8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)workerQueue, v15);
}

- (void)outputContext:(id)a3 didCloseCommunicationChannel:(id)a4
{
  id v5 = a4;
  workerQueue = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001158A8;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workerQueue, v8);
}

- (void)didReceiveData:(id)a3 fromCommunicationChannel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001159D4;
  block[3] = &unk_1004159B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)didCloseCommunicationChannel:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100115B44;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v7);
}

- (void)_didReceiveData:(id)a3 fromCommunicationChannel:(id)a4 connectionFactory:(id)a5
{
  id v34 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  if (self->_started)
  {
    id v10 = self;
    objc_sync_enter(v10);
    objc_super v11 = [(NSMapTable *)v10->_connections objectForKey:v8];
    if (v11 || (v9[2](v9), (id v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_sync_exit(v10);
      id v12 = v11;
    }
    else
    {
      [(NSMapTable *)v10->_connections setObject:v12 forKey:v8];
      objc_sync_exit(v10);

      id v13 = (MRDAirPlayRemoteControlService *)objc_alloc_init((Class)MRDeviceInfo);
      id v14 = +[MRProtocolMessage protocolMessageWithProtobufData:v34 error:0];
      long long v15 = v14;
      if (v14 && [v14 type] == (id)133)
      {
        id v16 = v15;
        id v17 = [v16 serviceType];
        v33 = v17;
        if ([v17 isEqualToString:@"RemoteControl"])
        {
          unsigned int v18 = 0;
          uint64_t v19 = 0;
        }
        else
        {
          unsigned int v18 = [v17 isEqualToString:@"MRRelay"];
          uint64_t v19 = v18;
        }
        v21 = [v16 destinationGroupUID];
        [v12 setDestinationGroupUID:v21];

        v22 = [v16 destinationOutputDeviceUID];
        [v12 setDestinationOutputDeviceUID:v22];

        v23 = [v16 sourceOutputDeviceUID];
        [(MRDAirPlayRemoteControlService *)v13 setDeviceUID:v23];

        v24 = [v16 sourceOutputDeviceName];
        [(MRDAirPlayRemoteControlService *)v13 setName:v24];

        uint64_t v32 = v19;
        if (v19) {
          CFStringRef v25 = @"MRRelay";
        }
        else {
          CFStringRef v25 = @"RemoteControl";
        }
        v26 = +[MRProtocolMessageLogger sharedLogger];
        [v26 logMessage:@"Message Received:" label:v25 deviceInfo:v13 protocolMessage:v16];

        if (v18)
        {
          id v27 = objc_alloc_init((Class)MRProtocolMessage);
          v28 = [v16 replyIdentifier];
          [v27 setReplyIdentifier:v28];

          v29 = [v27 protobufData];
          [v12 sendTransportData:v29 options:0];

          v30 = +[MRProtocolMessageLogger sharedLogger];
          [v30 logMessage:@"Message Sent:" label:v25 deviceInfo:v13 protocolMessage:v27];
        }
        id v31 = [objc_alloc((Class)MRExternalDeviceTransportConnectionHandle) initWithConnection:v12 deviceInfo:v13];
        [(MRDAirPlayRemoteControlService *)v10 _handleNewConnection:v31 forServiceType:v32];

        goto LABEL_5;
      }
      id v20 = [objc_alloc((Class)MRExternalDeviceTransportConnectionHandle) initWithConnection:v12 deviceInfo:v13];
      [(MRDAirPlayRemoteControlService *)v10 _handleNewConnection:v20 forServiceType:0];

      id v10 = v13;
      objc_super v11 = v12;
    }

    [v11 ingestData:v34];
LABEL_5:
  }
}

- (void)_didCloseCommunicationChannel:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMapTable *)v7->_connections objectForKey:v9];
  objc_sync_exit(v7);

  [v8 closeWithError:v6];
}

- (void)_handleNewConnection:(id)a3 forServiceType:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1)
  {
    id v10 = v6;
    id v6 = [(MRDMRRelayConnectionManager *)self->_mrRelayConnectionManager ingestConnection:v6];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v10 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [v10 connection];
    [WeakRetained airPlayRemoteControlService:self didAcceptConnection:v9];
  }
  id v7 = v10;
LABEL_6:

  _objc_release_x1(v6, v7);
}

- (MRDAirPlayRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDAirPlayRemoteControlServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mrRelayConnectionManager, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_systemMusicContext, 0);
}

@end