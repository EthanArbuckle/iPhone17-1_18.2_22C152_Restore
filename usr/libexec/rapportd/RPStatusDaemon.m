@interface RPStatusDaemon
+ (id)sharedStatusDaemon;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (OS_dispatch_queue)dispatchQueue;
- (RPMessageable)messenger;
- (RPStatusDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_invalidate;
- (void)_invalidated;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setMessenger:(id)a3;
@end

@implementation RPStatusDaemon

+ (id)sharedStatusDaemon
{
  if (qword_100143018 != -1) {
    dispatch_once(&qword_100143018, &stru_100124FD0);
  }
  v2 = (void *)qword_100143010;

  return v2;
}

- (RPStatusDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPStatusDaemon;
  v2 = [(RPStatusDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 < 21)
  {
    uint64_t v26 = 0;
    NSAppendPrintF();
    id v4 = 0;
    id v5 = [(NSMutableSet *)self->_xpcConnections count];
    if (v5)
    {
      id v25 = v4;
      id v19 = v5;
      NSAppendPrintF();
      id v6 = v4;

      id v4 = v6;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obj = self->_xpcConnections;
    id v7 = [(NSMutableSet *)obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v12 = [v11 xpcCnx:v19];
          id v19 = [v12 processIdentifier];
          NSAppendPrintF();
          id v13 = v4;

          v14 = [v11 subscriber];
          if (v14)
          {
            CUDescriptionWithLevel();
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            NSAppendPrintF();
            id v15 = v13;

            id v13 = v15;
          }

          v16 = [v11 provider];
          if (v16)
          {
            CUDescriptionWithLevel();
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            NSAppendPrintF();
            id v17 = v13;

            id v13 = v17;
          }

          NSAppendPrintF();
          id v4 = v13;
        }
        id v8 = [(NSMutableSet *)obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    NSPrintF();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB994;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.rapport.StatusUpdates"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  if (!self->_messenger)
  {
    id v5 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
    messenger = self->_messenger;
    self->_messenger = v5;

    CFStringRef v8 = @"statusFlags";
    uint64_t v9 = &off_10012B348;
    id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [(RPMessageable *)self->_messenger registerEventID:@"_statusInfo" options:v7 handler:&stru_100125010];
  }
  [(RPStatusDaemon *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BBC2C;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPMessageable *)self->_messenger deregisterEventID:@"_statusInfo"];
    [(NSXPCListener *)self->_xpcListener invalidate];
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    [(RPStatusDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [[RPStatusUpdatableXPCConnection alloc] initWithDaemon:self xpcCnx:v5];
  [(RPStatusUpdatableXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    CFStringRef v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uint64_t v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  v10 = self->_xpcClientInterface;
  if (!v10)
  {
    id v32 = objc_alloc((Class)NSSet);
    uint64_t v30 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = [v32 initWithObjects:v30, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0];
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPStatusUpdatableXPCClientInterface];
    [(NSXPCInterface *)v10 setClasses:v17 forSelector:"xpcStatusUpdatableGiveStatusUpdate:peerDevice:currentState:statusInfo:" argumentIndex:1 ofReply:0];
    objc_storeStrong((id *)&self->_xpcClientInterface, v10);
  }
  v18 = self->_xpcDaemonInterface;
  if (!v18)
  {
    id v33 = objc_alloc((Class)NSSet);
    uint64_t v31 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    id v24 = [v33 initWithObjects:v31, v29, v19, v20, v21, v22, v23, objc_opt_class(), 0];
    id v25 = objc_alloc((Class)NSSet);
    uint64_t v26 = objc_opt_class();
    id v27 = [v25 initWithObjects:v26, objc_opt_class(), 0];
    v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPStatusUpdatableXPCDaemonInterface];
    [(NSXPCInterface *)v18 setClasses:v27 forSelector:"xpcStatusSubscriberActivate:completion:" argumentIndex:0 ofReply:1];
    [(NSXPCInterface *)v18 setClasses:v27 forSelector:"xpcStatusProviderActivate:completion:" argumentIndex:0 ofReply:1];
    [(NSXPCInterface *)v18 setClasses:v24 forSelector:"xpcStatusUpdatableProvideStatus:statusInfo:" argumentIndex:0 ofReply:0];
    [(NSXPCInterface *)v18 setClass:objc_opt_class() forSelector:"xpcStatusUpdatableCancelProvideStatus:" argumentIndex:0 ofReply:0];
    [(NSXPCInterface *)v18 setClass:objc_opt_class() forSelector:"xpcStatusUpdatableSubscribeToStatus:" argumentIndex:0 ofReply:0];
    [(NSXPCInterface *)v18 setClass:objc_opt_class() forSelector:"xpcStatusUpdatableUnsubscribeToStatus:" argumentIndex:0 ofReply:0];
    objc_storeStrong((id *)&self->_xpcDaemonInterface, v18);
  }
  [v5 setExportedInterface:v18];
  [v5 setExportedObject:v6];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000BC26C;
  v34[3] = &unk_1001219D0;
  v34[4] = self;
  v34[5] = v6;
  [v5 setInvalidationHandler:v34];
  [v5 setRemoteObjectInterface:v10];
  [v5 _setQueue:self->_dispatchQueue];
  [v5 resume];
  if (dword_100142810 <= 20 && (dword_100142810 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  [(NSMutableSet *)self->_xpcConnections removeObject:v5];

  [(RPStatusDaemon *)self _update];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcDaemonInterface, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);

  objc_storeStrong((id *)&self->_xpcClientInterface, 0);
}

@end