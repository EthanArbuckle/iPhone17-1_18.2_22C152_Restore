@interface MRDUIServer
+ (MRDUIServer)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MRDServerMessageProxy)messageProxy;
- (MRDUIActivityServer)activityServer;
- (MRDUIServer)init;
- (NSArray)clients;
- (NSHashTable)clientObservers;
- (NSMutableArray)pendingRelayEndpointReplies;
- (NSMutableSet)internalClients;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)serviceEndpoint;
- (OS_dispatch_queue)messageQueue;
- (id)clientForConnection:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_addClient:(id)a3;
- (void)_handleGetDeviceSupportsUIActivitiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUIServerEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_removeClient:(id)a3;
- (void)addClientObserver:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleClientInvalidated:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)releaseTimeBasedNowPlayingActivityAssertions;
- (void)removeClientObserver:(id)a3;
- (void)setActivityServer:(id)a3;
- (void)setClientObservers:(id)a3;
- (void)setMessageProxy:(id)a3;
- (void)setPendingRelayEndpointReplies:(id)a3;
- (void)setServiceEndpoint:(id)a3;
- (void)start;
@end

@implementation MRDUIServer

+ (MRDUIServer)sharedServer
{
  if (qword_10047E278 != -1) {
    dispatch_once(&qword_10047E278, &stru_10041D698);
  }
  v2 = (void *)qword_10047E270;

  return (MRDUIServer *)v2;
}

- (MRDUIServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)MRDUIServer;
  v2 = [(MRDUIServer *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableSet set];
    internalClients = v3->_internalClients;
    v3->_internalClients = (NSMutableSet *)v4;

    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    clientObservers = v3->_clientObservers;
    v3->_clientObservers = (NSHashTable *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, (dispatch_qos_class_t)2u, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MRDUIServer.messageQueue", v9);
    messageQueue = v3->_messageQueue;
    v3->_messageQueue = (OS_dispatch_queue *)v10;

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"handleClientInvalidated:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0];
  }
  return v3;
}

- (void)start
{
  v3 = objc_alloc_init(MRDUIActivityServer);
  [(MRDUIServer *)self setActivityServer:v3];

  uint64_t v4 = [(MRDUIServer *)self activityServer];
  v7 = v4;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  uint64_t v6 = +[MRDServerMessageProxy proxyForObjects:v5 protocol:&OBJC_PROTOCOL___MRUIServerXPCProtocol];
  [(MRDUIServer *)self setMessageProxy:v6];
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0xB00000000000001uLL:
      [(MRDUIServer *)self _handleGetUIServerEndpointMessage:xdict fromClient:v6];
      break;
    case 0xB00000000000002uLL:
      [(MRDUIServer *)self _handleGetUIServiceRelayEndpointMessage:xdict fromClient:v6];
      break;
    case 0xB00000000000003uLL:
      [(MRDUIServer *)self _handleSetUIServiceRelayEndpointMessage:xdict fromClient:v6];
      break;
    case 0xB00000000000004uLL:
      [(MRDUIServer *)self _handleGetDeviceSupportsUIActivitiesMessage:xdict fromClient:v6];
      break;
    default:
      break;
  }
}

- (void)handleClientInvalidated:(id)a3
{
  id v6 = [a3 object];
  uint64_t v4 = [v6 bundleIdentifier];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.MediaRemoteUIService"];

  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    [(MRDUIServer *)self setServiceEndpoint:0];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_handleGetUIServerEndpointMessage:(id)a3 fromClient:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011B9A8;
  v4[3] = &unk_100415DC8;
  v4[4] = self;
  sub_100014324(a3, v4);
}

- (void)_handleGetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011BBD8;
  v15[3] = &unk_10041D6C0;
  id v5 = a3;
  id v16 = v5;
  id v6 = objc_retainBlock(v15);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(MRDUIServer *)self serviceEndpoint];
  if (!v8)
  {
    v9 = [(MRDUIServer *)self pendingRelayEndpointReplies];

    if (!v9)
    {
      v12 = +[NSMutableArray array];
      [(MRDUIServer *)self setPendingRelayEndpointReplies:v12];

      v13 = [(MRDUIServer *)self pendingRelayEndpointReplies];
      objc_super v14 = objc_retainBlock(v6);
      [v13 addObject:v14];

      os_unfair_lock_unlock(p_lock);
      sub_100167FD0(@"com.apple.MediaRemoteUIService", @"UI service endpoint requested", 0, &stru_10041D6E0);
      goto LABEL_5;
    }
    dispatch_queue_t v10 = [(MRDUIServer *)self pendingRelayEndpointReplies];
    v11 = objc_retainBlock(v6);
    [v10 addObject:v11];
  }
  os_unfair_lock_unlock(p_lock);
LABEL_5:
}

- (void)_handleSetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v6 = xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
  id v7 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  [v7 _setEndpoint:v6];
  [(MRDUIServer *)self setServiceEndpoint:v7];
  v8 = [(MRDUIServer *)self pendingRelayEndpointReplies];
  [(MRDUIServer *)self setPendingRelayEndpointReplies:0];
  os_unfair_lock_unlock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_handleGetDeviceSupportsUIActivitiesMessage:(id)a3 fromClient:(id)a4
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  id v9 = MSVBundleIDForAuditToken();
  if (![v9 length])
  {
    long long v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10032F778(v14);
    }
    goto LABEL_14;
  }
  id v10 = [v8 valueForEntitlement:@"com.apple.mediaremote.ui-control"];

  if (!v10)
  {
    id v11 = +[MRUserSettings currentSettings];
    unsigned __int8 v12 = [v11 allowAllClientUIConnections];

    if ((v12 & 1) == 0)
    {
      long long v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10032F824();
      }
LABEL_14:
      BOOL v27 = 0;
      goto LABEL_15;
    }
  }
  v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10032F7BC();
  }

  long long v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MRUIServerXPCProtocol];
  long long v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MRUIClientXPCProtocol];
  [v8 setExportedInterface:v14];
  long long v16 = [(MRDUIServer *)self messageProxy];
  [v8 setExportedObject:v16];

  [v8 setRemoteObjectInterface:v15];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
  v21 = MSVPropertyListDataClasses();
  [v20 unionSet:v21];

  [v14 setClasses:v20 forSelector:"acquireGroupSessionNearbyAssertionForSession:withReply:" argumentIndex:0 ofReply:0];
  [v15 setClasses:v20 forSelector:"nearbyGroupSessionDismissed:" argumentIndex:0 ofReply:0];
  v22 = [[MRDUIClient alloc] initWithConnection:v8 bundleID:v9];
  v23 = [(MRDUIServer *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011C284;
  block[3] = &unk_1004158D8;
  block[4] = self;
  v24 = v22;
  v32 = v24;
  dispatch_sync(v23, block);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10011C290;
  v29[3] = &unk_1004158D8;
  v29[4] = self;
  v30 = v24;
  v25 = v24;
  [v8 setInvalidationHandler:v29];
  v26 = [(MRDUIServer *)self messageQueue];
  [v8 _setQueue:v26];

  [v8 resume];
  BOOL v27 = 1;
LABEL_15:

  return v27;
}

- (void)_addClient:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10032F898();
  }

  os_unfair_lock_lock(&self->_lock);
  id v6 = [(MRDUIServer *)self internalClients];
  [v6 addObject:v4];

  os_unfair_lock_unlock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(MRDUIServer *)self clientObservers];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector()) {
          [v12 clientConnected:v4];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_removeClient:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10032F900();
  }

  os_unfair_lock_lock(&self->_lock);
  id v6 = [(MRDUIServer *)self internalClients];
  [v6 removeObject:v4];

  os_unfair_lock_unlock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(MRDUIServer *)self clientObservers];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector()) {
          [v12 clientDisconnected:v4];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NSArray)clients
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(MRDUIServer *)self internalClients];
  id v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (NSXPCListener)listener
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  listener = self->_listener;
  if (!listener)
  {
    id v5 = +[NSXPCListener anonymousListener];
    id v6 = self->_listener;
    self->_listener = v5;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener resume];
    listener = self->_listener;
  }
  id v7 = listener;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)addClientObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(MRDUIServer *)self clientObservers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeClientObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(MRDUIServer *)self clientObservers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  [(MRDUIServer *)self clients];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
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
        uint64_t v10 = objc_msgSend(v9, "connection", (void)v13);
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

- (void)releaseTimeBasedNowPlayingActivityAssertions
{
  id v2 = [(MRDUIServer *)self activityServer];
  [v2 releaseTimeBasedNowPlayingActivityAssertions];
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDUIServer *)self activityServer];
  [v5 collectDiagnostic:v4];
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableSet)internalClients
{
  return self->_internalClients;
}

- (NSHashTable)clientObservers
{
  return self->_clientObservers;
}

- (void)setClientObservers:(id)a3
{
}

- (MRDUIActivityServer)activityServer
{
  return self->_activityServer;
}

- (void)setActivityServer:(id)a3
{
}

- (MRDServerMessageProxy)messageProxy
{
  return self->_messageProxy;
}

- (void)setMessageProxy:(id)a3
{
}

- (NSMutableArray)pendingRelayEndpointReplies
{
  return self->_pendingRelayEndpointReplies;
}

- (void)setPendingRelayEndpointReplies:(id)a3
{
}

- (NSXPCListenerEndpoint)serviceEndpoint
{
  return self->_serviceEndpoint;
}

- (void)setServiceEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceEndpoint, 0);
  objc_storeStrong((id *)&self->_pendingRelayEndpointReplies, 0);
  objc_storeStrong((id *)&self->_messageProxy, 0);
  objc_storeStrong((id *)&self->_activityServer, 0);
  objc_storeStrong((id *)&self->_clientObservers, 0);
  objc_storeStrong((id *)&self->_internalClients, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end