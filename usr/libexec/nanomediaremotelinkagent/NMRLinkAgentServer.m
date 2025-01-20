@interface NMRLinkAgentServer
+ (id)server;
- (NMRLinkAgentServer)init;
- (id)_originInfoFromOrigin:(id)a3;
- (id)_proxiedOrigins;
- (void)_handleActiveOriginDidChangeNotification:(id)a3;
- (void)_handleAvailableOriginsDidChangeNotification:(id)a3;
- (void)_handleDiscoverAndConnectEndpointsMessage:(id)a3;
- (void)_handleGetProxiedOriginsMessage:(id)a3;
- (void)_handleMediaRemoteCommandRequestMessage:(id)a3;
- (void)_handleMediaRemoteGetArtworkMessage:(id)a3;
- (void)_handleMediaRemoteGetStateMessage:(id)a3;
- (void)_handleOriginDeviceInfoDidChangeNotification:(id)a3;
- (void)_handlePlaybackQueueRequest:(id)a3;
- (void)_handlePrewarmSystemMusicAppMessage:(id)a3;
- (void)_prewarmSystemMusicApp;
- (void)_registerForOriginNotification;
- (void)_sendOriginUpdatesToClient:(id)a3;
- (void)_sendProxiedOriginsToClient;
- (void)_updateOriginsControllers;
- (void)messageCenter:(id)a3 messageWithIdentifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6;
- (void)originController:(id)a3 sendSetStateMessage:(id)a4 resultingMessageIdentifier:(id *)a5;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
@end

@implementation NMRLinkAgentServer

+ (id)server
{
  if (qword_1000506D0 != -1) {
    dispatch_once(&qword_1000506D0, &stru_1000455C8);
  }
  v2 = (void *)qword_1000506C8;

  return v2;
}

- (NMRLinkAgentServer)init
{
  v29.receiver = self;
  v29.super_class = (Class)NMRLinkAgentServer;
  v2 = [(NMRLinkAgentServer *)&v29 init];
  if (!v2) {
    goto LABEL_3;
  }
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  v4 = [v3 getActivePairedDevice];
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AD00FAC5-9C37-4D0C-8F16-9B00B4C821C6"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if ((v6 & 1) == 0)
  {
    v8 = sub_10002C428(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Hello, world!", v28, 2u);
    }

    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100045608);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanomediaremotelinkagent.NMRLinkAgentServer", v10);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    messageCenter = v2->_messageCenter;
    v2->_messageCenter = (NMRIDSMessageCenter *)v13;

    [(NMRIDSMessageCenter *)v2->_messageCenter setDelegate:v2];
    uint64_t v15 = SBSCreateOpenApplicationService();
    openApplicationService = v2->_openApplicationService;
    v2->_openApplicationService = (FBSOpenApplicationService *)v15;

    [(NMRIDSMessageCenter *)v2->_messageCenter setMessageHandlerTarget:v2 action:"_handleMediaRemoteCommandRequestMessage:" forIncomingMessagesOfType:1];
    [(NMRIDSMessageCenter *)v2->_messageCenter setMessageHandlerTarget:v2 action:"_handleMediaRemoteGetStateMessage:" forIncomingMessagesOfType:2];
    [(NMRIDSMessageCenter *)v2->_messageCenter setMessageHandlerTarget:v2 action:"_handleMediaRemoteGetArtworkMessage:" forIncomingMessagesOfType:5];
    [(NMRIDSMessageCenter *)v2->_messageCenter setMessageHandlerTarget:v2 action:"_handlePrewarmSystemMusicAppMessage:" forIncomingMessagesOfType:7];
    [(NMRIDSMessageCenter *)v2->_messageCenter setMessageHandlerTarget:v2 action:"_handleGetProxiedOriginsMessage:" forIncomingMessagesOfType:14];
    [(NMRIDSMessageCenter *)v2->_messageCenter setMessageHandlerTarget:v2 action:"_handleDiscoverAndConnectEndpointsMessage:" forIncomingMessagesOfType:16];
    [(NMRIDSMessageCenter *)v2->_messageCenter setMessageHandlerTarget:v2 action:"_handlePlaybackQueueRequest:" forIncomingMessagesOfType:18];
    [(NMRIDSMessageCenter *)v2->_messageCenter startHandlingMessages];
    uint64_t v17 = +[NSMutableDictionary dictionary];
    lastOriginUpdatesIdentifiers = v2->_lastOriginUpdatesIdentifiers;
    v2->_lastOriginUpdatesIdentifiers = (NSMutableDictionary *)v17;

    uint64_t v19 = +[NSMutableDictionary dictionary];
    originControllers = v2->_originControllers;
    v2->_originControllers = (NSMutableDictionary *)v19;

    id v21 = objc_alloc_init((Class)MPAVEndpointRoutingDataSource);
    id v22 = [objc_alloc((Class)MPAVRoutingController) initWithDataSource:v21 name:@"NMRLinkAgentRoutingController"];
    [v22 setDelegate:v2];
    endpointRoutingController = v2->_endpointRoutingController;
    v2->_endpointRoutingController = (MPAVRoutingController *)v22;
    id v24 = v22;

    uint64_t v25 = +[NSMutableSet set];
    connectingEndpoints = v2->_connectingEndpoints;
    v2->_connectingEndpoints = (NSMutableSet *)v25;

    [(NMRLinkAgentServer *)v2 _registerForOriginNotification];
    v7 = v2;
  }
  else
  {
LABEL_3:
    v7 = 0;
  }

  return v7;
}

- (void)originController:(id)a3 sendSetStateMessage:(id)a4 resultingMessageIdentifier:(id *)a5
{
  id v7 = a4;
  v8 = [v7 originIdentifier];
  id v11 = +[NSString stringWithFormat:@"%@-%@", @"MediaRemoteSetState", v8];

  messageCenter = self->_messageCenter;
  v10 = [v7 protobufData];

  [(NMRIDSMessageCenter *)messageCenter sendMessageWithProtobufData:v10 messageType:4 priority:1 timeout:0 bypassDuet:0 skipStorage:0 expectReply:IDSMaxMessageTimeout queueOneIdentifier:v11 resultingMessageIdentifier:a5 error:0];
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v7, v8];
  [v9 UTF8String];
  v10 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D6C0;
  block[3] = &unk_100045680;
  id v15 = v5;
  v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v5;
  dispatch_async(serialQueue, block);
}

- (void)_handleMediaRemoteGetStateMessage:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  unsigned __int8 v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v7, v8];
  [v9 UTF8String];
  v10 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DC4C;
  block[3] = &unk_100045680;
  id v15 = v5;
  v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v5;
  dispatch_async(serialQueue, block);
}

- (void)_handleMediaRemoteGetArtworkMessage:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  unsigned __int8 v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v7, v8];
  [v9 UTF8String];
  v10 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E004;
  block[3] = &unk_100045680;
  id v15 = v5;
  v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v5;
  dispatch_async(serialQueue, block);
}

- (void)_handleMediaRemoteCommandRequestMessage:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  unsigned __int8 v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v7, v8];
  [v9 UTF8String];
  v10 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E380;
  block[3] = &unk_100045680;
  id v15 = v5;
  v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v5;
  dispatch_async(serialQueue, block);
}

- (void)_handlePrewarmSystemMusicAppMessage:(id)a3
{
  id v5 = (objc_class *)objc_opt_class();
  unsigned __int8 v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v6, v7];
  [v8 UTF8String];
  id v9 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E680;
  block[3] = &unk_100044CB8;
  id v13 = v9;
  v14 = self;
  id v11 = v9;
  dispatch_async(serialQueue, block);
}

- (void)_handleGetProxiedOriginsMessage:(id)a3
{
  id v5 = (objc_class *)objc_opt_class();
  unsigned __int8 v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v6, v7];
  [v8 UTF8String];
  id v9 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E7D4;
  block[3] = &unk_100044CB8;
  id v13 = v9;
  v14 = self;
  id v11 = v9;
  dispatch_async(serialQueue, block);
}

- (void)_handleDiscoverAndConnectEndpointsMessage:(id)a3
{
  id v5 = (objc_class *)objc_opt_class();
  unsigned __int8 v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v6, v7];
  [v8 UTF8String];
  id v9 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E928;
  block[3] = &unk_100044CB8;
  void block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(serialQueue, block);
}

- (void)_handlePlaybackQueueRequest:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  unsigned __int8 v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v7, v8];
  [v9 UTF8String];
  v10 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EC50;
  block[3] = &unk_100045680;
  id v15 = v5;
  v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v5;
  dispatch_async(serialQueue, block);
}

- (void)_sendProxiedOriginsToClient
{
  v3 = [(NMRLinkAgentServer *)self _proxiedOrigins];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(NMRLinkAgentServer *)self _originInfoFromOrigin:*(void *)(*((void *)&v17 + 1) + 8 * (void)v9)];
        if (v10) {
          [v4 addObject:v10];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  id v11 = sub_10002C428(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Sending proxiedOrigins %@", buf, 0xCu);
  }

  messageCenter = self->_messageCenter;
  id v13 = sub_10000AA6C(v4);
  id v16 = 0;
  [(NMRIDSMessageCenter *)messageCenter sendMessageWithProtobufData:v13 messageType:15 priority:3 timeout:0 bypassDuet:0 skipStorage:0 expectReply:IDSMaxMessageTimeout queueOneIdentifier:@"MediaRemoteSetProxiedOrigins" resultingMessageIdentifier:&v16 error:0];
  id v14 = v16;
  id v15 = v16;

  if (v15) {
    objc_storeStrong((id *)&self->_lastProxiedOriginsMessageIdentifier, v14);
  }
}

- (void)_sendOriginUpdatesToClient:(id)a3
{
  id v4 = a3;
  [(NMRLinkAgentServer *)self _proxiedOrigins];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10002F640;
  v36[3] = &unk_100045748;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = v5;
  id v6 = +[NSPredicate predicateWithBlock:v36];
  id v7 = [v4 filteredArrayUsingPredicate:v6];

  uint64_t v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [(NMRLinkAgentServer *)self _originInfoFromOrigin:*(void *)(*((void *)&v32 + 1) + 8 * (void)v13)];
        if (v14) {
          [v8 addObject:v14];
        }

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v11);
  }

  id v15 = sub_10002C428(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Sending updates for proxied origins %@", buf, 0xCu);
  }

  if ([v8 count])
  {
    messageCenter = self->_messageCenter;
    long long v17 = sub_10000AA6C(v8);
    id v31 = 0;
    [(NMRIDSMessageCenter *)messageCenter sendMessageWithProtobufData:v17 messageType:17 priority:3 timeout:0 bypassDuet:0 skipStorage:0 expectReply:IDSMaxMessageTimeout queueOneIdentifier:@"MediaRemoteUpdateProxiedOrigins" resultingMessageIdentifier:&v31 error:0];
    id v18 = v31;

    if (v18)
    {
      id v26 = v5;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v19 = v9;
      id v20 = [v19 countByEnumeratingWithState:&v27 objects:v38 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v28;
        do
        {
          v23 = 0;
          do
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(v19);
            }
            lastOriginUpdatesIdentifiers = self->_lastOriginUpdatesIdentifiers;
            uint64_t v25 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v23) uniqueIdentifier];
            [(NSMutableDictionary *)lastOriginUpdatesIdentifiers setObject:v18 forKeyedSubscript:v25];

            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          id v21 = [v19 countByEnumeratingWithState:&v27 objects:v38 count:16];
        }
        while (v21);
      }

      id v5 = v26;
    }
  }
}

- (id)_originInfoFromOrigin:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NMROriginInfo);
  [v3 mediaRemoteOrigin];
  id v5 = (const void *)MRMediaRemoteCopyDeviceInfo();
  if (v5)
  {
    CFAutorelease(v5);
    ExternalRepresentation = (void *)MRPairedDeviceCreateExternalRepresentation();
    if ([v3 isLocal])
    {
      [(NMROriginInfo *)v4 setUniqueIdentifier:1129140302];
      [(NMROriginInfo *)v4 setDisplayName:@"iPhone"];
    }
    else
    {
      id v9 = [v3 uniqueIdentifier];
      -[NMROriginInfo setUniqueIdentifier:](v4, "setUniqueIdentifier:", [v9 intValue]);

      id v10 = [v3 displayName];
      [(NMROriginInfo *)v4 setDisplayName:v10];
    }
    [(NMROriginInfo *)v4 setDeviceInfoData:ExternalRepresentation];
    uint64_t v8 = v4;
  }
  else
  {
    id v7 = sub_10002C428(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100031840((uint64_t)v3, v7);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_proxiedOrigins
{
  v2 = +[NMROriginManager sharedManager];
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = [v3 getActivePairedDevice];

  NRWatchOSVersionForRemoteDevice();
  if (NRVersionIsGreaterThanOrEqual())
  {
    id v5 = [v2 availableOrigins];
    id v6 = +[NSSet setWithArray:v5];
  }
  else
  {
    id v5 = [v2 localOrigin];
    id v7 = [v2 activeOrigin];
    id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v7, 0);
  }

  return v6;
}

- (void)messageCenter:(id)a3 messageWithIdentifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  id v14 = NSStringFromSelector(a2);
  id v15 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v13, v14];
  [v15 UTF8String];
  id v16 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F9EC;
  block[3] = &unk_100045770;
  id v22 = v16;
  id v23 = v11;
  id v24 = v10;
  uint64_t v25 = self;
  BOOL v26 = a5;
  id v18 = v10;
  id v19 = v11;
  id v20 = v16;
  dispatch_async(serialQueue, block);
}

- (void)_registerForOriginNotification
{
  id v4 = +[NSNotificationCenter defaultCenter];
  id v3 = +[NMROriginManager sharedManager];
  [v4 addObserver:self selector:"_handleAvailableOriginsDidChangeNotification:" name:@"NMROriginManagerAvailableOriginsDidChangeNotification" object:v3];
  [v4 addObserver:self selector:"_handleActiveOriginDidChangeNotification:" name:@"NMROriginManagerActiveOriginDidChangeNotification" object:v3];
  [v4 addObserver:self selector:"_handleOriginDeviceInfoDidChangeNotification:" name:@"NMROriginDeviceInfoDidChangeNotification" object:v3];
  [(NMRLinkAgentServer *)self _sendProxiedOriginsToClient];
}

- (void)_handleActiveOriginDidChangeNotification:(id)a3
{
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 getActivePairedDevice];

  NRWatchOSVersionForRemoteDevice();
  if ((NRVersionIsGreaterThanOrEqual() & 1) == 0)
  {
    [(NMRLinkAgentServer *)self _updateOriginsControllers];
    [(NMRLinkAgentServer *)self _sendProxiedOriginsToClient];
  }
}

- (void)_handleAvailableOriginsDidChangeNotification:(id)a3
{
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 getActivePairedDevice];

  NRWatchOSVersionForRemoteDevice();
  if (NRVersionIsGreaterThanOrEqual())
  {
    [(NMRLinkAgentServer *)self _updateOriginsControllers];
    [(NMRLinkAgentServer *)self _sendProxiedOriginsToClient];
  }
}

- (void)_updateOriginsControllers
{
  id v3 = [(NMRLinkAgentServer *)self _proxiedOrigins];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = &off_1000473A8;
        if (([v10 isLocal] & 1) == 0)
        {
          id v11 = [v10 uniqueIdentifier];
        }
        uint64_t v12 = [(NSMutableDictionary *)self->_originControllers objectForKeyedSubscript:v11];

        if (!v12)
        {
          id v13 = [[NMRLinkAgentOriginController alloc] initWithOrigin:v10 externalOriginIdentifier:v11];
          [(NMRLinkAgentOriginController *)v13 setDelegate:self];
          [(NSMutableDictionary *)self->_originControllers setObject:v13 forKeyedSubscript:v11];
        }
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  id v14 = [(NSMutableDictionary *)self->_originControllers allKeys];
  id v15 = +[NSMutableSet setWithArray:v14];

  [v15 minusSet:v4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_originControllers, "setObject:forKeyedSubscript:", 0, *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21);
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (void)_handleOriginDeviceInfoDidChangeNotification:(id)a3
{
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v7, v8];
  [v9 UTF8String];
  id v10 = (void *)os_transaction_create();

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030234;
  block[3] = &unk_100045680;
  id v15 = v10;
  id v16 = v5;
  id v17 = self;
  id v12 = v5;
  id v13 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_prewarmSystemMusicApp
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  id v7 = +[NSString stringWithFormat:@"com.apple.nanomediaremotelinkagent.%@.%@", v5, v6];
  [v7 UTF8String];
  uint64_t v8 = (void *)os_transaction_create();

  id v9 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030404;
  block[3] = &unk_100044CB8;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectingEndpoints, 0);
  objc_storeStrong((id *)&self->_endpointRoutingController, 0);
  objc_storeStrong((id *)&self->_originControllers, 0);
  objc_storeStrong((id *)&self->_lastOriginUpdatesIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastProxiedOriginsMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_openApplicationService, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end