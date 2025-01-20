@interface PUServer
- (BOOL)gizmoWantsNotificationOnNextUnlock;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableSet)connections;
- (PUPeer)peer;
- (PUServer)init;
- (void)_handlePasscodeRemoval;
- (void)_removeConnection:(id)a3;
- (void)checkIn;
- (void)dealloc;
- (void)didCompleteRemoteAction:(BOOL)a3 error:(id)a4;
- (void)disableOnlyRemoteUnlock;
- (void)enableOnlyRemoteUnlockWithPasscode:(id)a3;
- (void)pairForUnlockWithPasscode:(id)a3;
- (void)peer:(id)a3 didNotifyRemoteState:(id)a4 error:(id)a5;
- (void)peer:(id)a3 didPairForUnlock:(BOOL)a4 error:(id)a5;
- (void)peer:(id)a3 remoteDeviceRequestsRemoteAction:(int64_t)a4 type:(int64_t)a5 existingPasscode:(id)a6 completionHandler:(id)a7;
- (void)peer:(id)a3 remoteDeviceRequestsRemoteAction:(int64_t)a4 type:(int64_t)a5 existingPasscode:(id)a6 showAsReprompt:(BOOL)a7 completionHandler:(id)a8;
- (void)peer:(id)a3 wantsNotificationOfNextUnlock:(BOOL)a4;
- (void)peerRemoteDeviceDidUnlock:(id)a3;
- (void)queryRemoteDeviceState:(id)a3;
- (void)requestDeviceSetWristDetectionDisabled:(BOOL)a3 completion:(id)a4;
- (void)requestRemoteDeviceRemoteAction:(int64_t)a3 type:(int64_t)a4;
- (void)requestRemoteDeviceRemoveLockout;
- (void)setGizmoWantsNotificationOnNextUnlock:(BOOL)a3;
- (void)syncObserverRequestsWristDetectionReset:(id)a3;
- (void)unpairForUnlock;
@end

@implementation PUServer

- (PUServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUServer;
  v2 = [(PUServer *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(PUPeer);
    peer = v2->_peer;
    v2->_peer = v3;

    [(PUPeer *)v2->_peer setDelegate:v2];
    objc_storeStrong((id *)&qword_10001EED8, v2);
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    connections = v2->_connections;
    v2->_connections = v5;

    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.paired-unlock"];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100018990);
  }
  return v2;
}

- (void)_handlePasscodeRemoval
{
  if (CFPreferencesGetAppBooleanValue(@"IsUnlockOnly", @"com.apple.paired-unlock", 0))
  {
    v3 = pu_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not unpairing now; will do so when watch next connects",
        buf,
        2u);
    }

    [(PUPeer *)self->_peer requestRemoteDeviceDisableOnlyRemoteUnlock];
  }
  else
  {
    id v4 = +[SFUnlockManager sharedUnlockManager];
    [v4 disableUnlockWithDevice:IDSDefaultPairedDevice];
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(NSXPCConnection *)self->_actionServerConnection invalidate];
  [(NSXPCListener *)self->_listener invalidate];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableSet *)self->_connections copy];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) invalidate];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)PUServer;
  [(PUServer *)&v9 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
LABEL_10:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  v8 = pu_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Server got new connection", buf, 2u);
  }

  objc_super v9 = [v7 valueForEntitlement:PUAuthorizationEntitlement];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    long long v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PUUnlockClient];
    [v7 setRemoteObjectInterface:v11];

    long long v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PUUnlockServer];
    [v7 setExportedInterface:v12];

    [v7 setExportedObject:self];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_10000EA7C;
    v24 = &unk_1000189E0;
    objc_copyWeak(&v25, &from);
    objc_copyWeak(&v26, &location);
    [v7 setInvalidationHandler:&v21];
    objc_msgSend(v7, "resume", v21, v22, v23, v24);
    long long v13 = pu_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_loadWeakRetained(&from);
      *(_DWORD *)buf = 138412290;
      id v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "received connection %@", buf, 0xCu);
    }
    [(NSMutableSet *)self->_connections addObject:v7];
    v15 = pu_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = +[NSNumber numberWithUnsignedInteger:[(NSMutableSet *)self->_connections count]];
      connections = self->_connections;
      *(_DWORD *)buf = 138412546;
      id v30 = v16;
      __int16 v31 = 2112;
      v32 = connections;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_connections (%@) = %@", buf, 0x16u);
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  v19 = pu_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10001088C(v7, v19);
  }

  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = pu_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 1024;
    unsigned int v9 = [v4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server lost connection %@ to PID %d", (uint8_t *)&v6, 0x12u);
  }

  [(NSMutableSet *)self->_connections removeObject:v4];
}

- (void)peer:(id)a3 didPairForUnlock:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(NSMutableSet *)self->_connections copy];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) remoteObjectProxy];
        [v13 didPairForUnlock:v5 error:v7];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)peerRemoteDeviceDidUnlock:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableSet *)self->_connections copy];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) remoteObjectProxy];
        [v8 remoteDeviceDidUnlock];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)peer:(id)a3 didNotifyRemoteState:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(NSMutableSet *)self->_connections copy];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) remoteObjectProxy];
        [v14 didGetRemoteDeviceState:v7 error:v8];

        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)peer:(id)a3 remoteDeviceRequestsRemoteAction:(int64_t)a4 type:(int64_t)a5 existingPasscode:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  long long v13 = pu_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Remote device requested passcode action %li", buf, 0xCu);
  }

  long long v14 = [(NSXPCConnection *)self->_actionServerConnection remoteObjectProxy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F0B0;
  v16[3] = &unk_100018A08;
  id v17 = v11;
  id v15 = v11;
  [v14 requestRemoteAction:a4 type:a5 existingPasscode:v12 completion:v16];
}

- (void)peer:(id)a3 remoteDeviceRequestsRemoteAction:(int64_t)a4 type:(int64_t)a5 existingPasscode:(id)a6 showAsReprompt:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  id v13 = a8;
  id v14 = a6;
  id v15 = pu_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v21 = a4;
    __int16 v22 = 1024;
    BOOL v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Remote device requested passcode action %li (show as reprompt:%{BOOL}u)", buf, 0x12u);
  }

  long long v16 = [(NSXPCConnection *)self->_actionServerConnection remoteObjectProxy];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F23C;
  v18[3] = &unk_100018A08;
  id v19 = v13;
  id v17 = v13;
  [v16 requestRemoteAction:a4 type:a5 existingPasscode:v14 showAsReprompt:v8 completion:v18];
}

- (void)peer:(id)a3 wantsNotificationOfNextUnlock:(BOOL)a4
{
}

- (void)checkIn
{
  v2 = pu_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Client connection checked in", v3, 2u);
  }
}

- (void)pairForUnlockWithPasscode:(id)a3
{
}

- (void)requestRemoteDeviceRemoteAction:(int64_t)a3 type:(int64_t)a4
{
  objc_initWeak(&location, self);
  peer = self->_peer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F3A8;
  v8[3] = &unk_100018A30;
  objc_copyWeak(&v9, &location);
  [(PUPeer *)peer requestRemoteDeviceRemoteAction:a3 type:a4 completionHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)didCompleteRemoteAction:(BOOL)a3 error:(id)a4
{
  requestRemoteActionHandler = (void (**)(id, void, id))self->_requestRemoteActionHandler;
  if (requestRemoteActionHandler)
  {
    requestRemoteActionHandler[2](requestRemoteActionHandler, 0, a4);
    id v6 = self->_requestRemoteActionHandler;
    self->_requestRemoteActionHandler = 0;
  }
}

- (void)unpairForUnlock
{
  objc_initWeak(&location, self);
  peer = self->_peer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F624;
  v4[3] = &unk_100018A30;
  objc_copyWeak(&v5, &location);
  [(PUPeer *)peer unpairForUnlockWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)enableOnlyRemoteUnlockWithPasscode:(id)a3
{
  peer = self->_peer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F7D0;
  v4[3] = &unk_100018A58;
  void v4[4] = self;
  [(PUPeer *)peer enableOnlyRemoteUnlockWithPasscode:a3 completionHandler:v4];
}

- (void)disableOnlyRemoteUnlock
{
  peer = self->_peer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F96C;
  v3[3] = &unk_100018A58;
  v3[4] = self;
  [(PUPeer *)peer disableOnlyRemoteUnlockWithCompletionHandler:v3];
}

- (void)queryRemoteDeviceState:(id)a3
{
  id v4 = a3;
  peer = self->_peer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FB2C;
  v7[3] = &unk_100018670;
  id v8 = v4;
  id v6 = v4;
  [(PUPeer *)peer queryRemoteDeviceState:v7];
}

- (void)requestRemoteDeviceRemoveLockout
{
  peer = self->_peer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000FBB8;
  v3[3] = &unk_100018A58;
  v3[4] = self;
  [(PUPeer *)peer requestRemoteDeviceRemoveLockout:v3];
}

- (void)requestDeviceSetWristDetectionDisabled:(BOOL)a3 completion:(id)a4
{
}

- (BOOL)gizmoWantsNotificationOnNextUnlock
{
  return CFPreferencesGetAppBooleanValue(@"ShouldNotifyNextUnlock", @"com.apple.paired-unlock", 0) != 0;
}

- (void)setGizmoWantsNotificationOnNextUnlock:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    id v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"ShouldNotifyNextUnlock", *v3, @"com.apple.paired-unlock");
}

- (void)syncObserverRequestsWristDetectionReset:(id)a3
{
}

- (PUPeer)peer
{
  return self->_peer;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_actionServerConnection, 0);
  objc_storeStrong(&self->_requestRemoteActionHandler, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end