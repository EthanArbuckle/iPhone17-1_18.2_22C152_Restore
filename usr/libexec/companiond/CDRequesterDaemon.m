@interface CDRequesterDaemon
- (CDRequesterDaemon)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activated;
- (void)_invalidated;
- (void)_startServiceListener;
- (void)activate;
- (void)invalidate;
- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4;
- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6;
- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4;
- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDRequesterDaemon

- (CDRequesterDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDRequesterDaemon;
  v2 = [(CDRequesterDaemon *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  v3 = cps_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "activate called", buf, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004980;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  v3 = cps_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "invalidate called", buf, 2u);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A54;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);

  [(CDRequesterDaemon *)self _startServiceListener];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    [(CDServiceListener *)self->_serviceListener invalidate];
    serviceListener = self->_serviceListener;
    self->_serviceListener = 0;

    [(CDRequesterSession *)self->_currentSession invalidate];
    currentSession = self->_currentSession;
    self->_currentSession = 0;

    self->_invalidateDone = 1;
  }
}

- (void)_startServiceListener
{
  v3 = objc_alloc_init(CDServiceListener);
  serviceListener = self->_serviceListener;
  self->_serviceListener = v3;

  [(CDServiceListener *)self->_serviceListener setDispatchQueue:self->_dispatchQueue];
  [(CDServiceListener *)self->_serviceListener setDelegate:self];
  objc_super v5 = self->_serviceListener;

  [(CDServiceListener *)v5 activate];
}

- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = off_100034520;
LABEL_15:
    id v14 = [objc_alloc(*v9) initWithClient:v5 request:v6];
    goto LABEL_16;
  }
  v10 = self;
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    v9 = off_100034528;
    goto LABEL_15;
  }
  v12 = self;
  char v13 = objc_opt_isKindOfClass();

  if (v13)
  {
    v9 = off_100034510;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = off_100034508;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = off_100034518;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = &off_100034530;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = off_100034500;
    goto LABEL_15;
  }
  id v14 = 0;
LABEL_16:

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  +[BSDescriptionBuilder builderWithObject:self];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004DE0;
  v8[3] = &unk_100034800;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CDRequesterDaemon *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(CDRequesterDaemon *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_currentSession)
  {
    v15 = +[NSError errorWithDomain:CPSErrorDomain code:102 userInfo:0];
    v14[2](v14, v15);
  }
  else
  {
    v16 = [(CDRequesterDaemon *)self _authenticationSessionWithClient:v12 request:v13];
    currentSession = self->_currentSession;
    self->_currentSession = v16;

    v18 = self->_currentSession;
    if (v18)
    {
      [(CDRequesterSession *)v18 setDispatchQueue:self->_dispatchQueue];
      v19 = self->_currentSession;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000052AC;
      v38[3] = &unk_100034828;
      id v20 = v11;
      id v39 = v20;
      [(CDRequesterSession *)v19 setDeviceAcceptedNotificationHandler:v38];
      v21 = self->_currentSession;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000052B8;
      v36[3] = &unk_100034828;
      id v22 = v20;
      id v37 = v22;
      [(CDRequesterSession *)v21 setDeviceStartedAuthenticationHandler:v36];
      v23 = self->_currentSession;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000052C4;
      v34[3] = &unk_100034850;
      id v24 = v22;
      id v35 = v24;
      [(CDRequesterSession *)v23 setSessionFinishedHandler:v34];
      v25 = self->_currentSession;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000052D0;
      v32[3] = &unk_100034878;
      id v33 = v24;
      [(CDRequesterSession *)v25 setSessionFailedHandler:v32];
      v26 = self->_currentSession;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000052DC;
      v31[3] = &unk_1000347D8;
      v31[4] = self;
      [(CDRequesterSession *)v26 setInvalidationHandler:v31];
      objc_storeStrong((id *)&self->_currentSessionConnection, a3);
      [(CDRequesterSession *)self->_currentSession activateWithCompletionHandler:v14];
    }
    else
    {
      uint64_t v27 = CPSErrorDomain;
      NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
      v28 = +[NSString stringWithFormat:@"Invalid authentication request: %@", v13];
      v41 = v28;
      v29 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v30 = +[NSError errorWithDomain:v27 code:101 userInfo:v29];
      v14[2](v14, v30);
    }
  }
}

- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v6 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  id v7 = [(CDRequesterDaemon *)self descriptionWithMultilinePrefix:0];
  v6[2](v6, v7, 0);
}

- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  [v6 setDelegate:self];
}

- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v6 = (CDServiceConnection *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  currentSessionConnection = self->_currentSessionConnection;

  if (currentSessionConnection == v6)
  {
    [(CDRequesterSession *)self->_currentSession invalidate];
    currentSession = self->_currentSession;
    self->_currentSession = 0;

    id v9 = self->_currentSessionConnection;
    self->_currentSessionConnection = 0;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSessionConnection, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end