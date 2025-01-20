@interface CCDGatekeeper
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CCDGatekeeper)init;
- (CCDServer)server;
- (NSTimer)idleTimer;
- (double)machTimeScaleFactor;
- (void)idleTimerDidFire:(id)a3;
- (void)resetIdleTimer;
- (void)setIdleTimer:(id)a3;
- (void)setMachTimeScaleFactor:(double)a3;
- (void)setServer:(id)a3;
@end

@implementation CCDGatekeeper

- (CCDGatekeeper)init
{
  v5.receiver = self;
  v5.super_class = (Class)CCDGatekeeper;
  v2 = [(CCDGatekeeper *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CCDGatekeeper *)v2 resetIdleTimer];
  }
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [(CCDGatekeeper *)self resetIdleTimer];
  v6 = [v5 valueForEntitlement:kCCServiceEntitlement];
  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v6 BOOLValue] & 1) != 0)
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DEPXPCProtocol];
    [v5 setExportedInterface:v7];

    v8 = [CCDServicer alloc];
    v9 = [(CCDGatekeeper *)self server];
    v10 = [(CCDServicer *)v8 initWithXPCConnection:v5 server:v9];
    [v5 setExportedObject:v10];

    [v5 resume];
    v11 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Accepted new connection.", v15, 2u);
    }
    BOOL v12 = 1;
  }
  else
  {
    v13 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "rejecting connection because it is not entitled to use this service!", buf, 2u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)idleTimerDidFire:(id)a3
{
  v3 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "idling", v5, 2u);
  }
  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

- (void)resetIdleTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AF5C;
  block[3] = &unk_10001C978;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CCDServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (CCDServer *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (NSTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (double)machTimeScaleFactor
{
  return self->_machTimeScaleFactor;
}

- (void)setMachTimeScaleFactor:(double)a3
{
  self->_machTimeScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);

  objc_destroyWeak((id *)&self->_server);
}

@end