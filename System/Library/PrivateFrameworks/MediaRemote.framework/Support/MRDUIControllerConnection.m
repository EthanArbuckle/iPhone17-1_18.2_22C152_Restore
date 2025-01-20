@interface MRDUIControllerConnection
+ (BSServiceInterface)serviceInterface;
- (BSServiceConnectionClient)serviceConnection;
- (MRDUIControllerConnection)initWithClientObject:(id)a3 invalidationHandler:(id)a4;
- (MRUIClientProtocol)client;
- (MRUIServerProtocol)server;
- (id)invalidationHandler;
- (os_unfair_lock_s)lock;
- (void)dealloc;
@end

@implementation MRDUIControllerConnection

- (MRDUIControllerConnection)initWithClientObject:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRDUIControllerConnection;
  v9 = [(MRDUIControllerConnection *)&v14 init];
  if (v9)
  {
    v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRUIControllerConnection] <%p> Initializing.", buf, 0xCu);
    }

    id v11 = objc_retainBlock(v8);
    id invalidationHandler = v9->_invalidationHandler;
    v9->_id invalidationHandler = v11;

    objc_storeStrong((id *)&v9->_client, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(BSServiceConnectionClient *)self->_serviceConnection invalidate];
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRUIControllerConnection] <%p> Dealloc.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDUIControllerConnection;
  [(MRDUIControllerConnection *)&v4 dealloc];
}

- (MRUIServerProtocol)server
{
  v2 = [(MRDUIControllerConnection *)self serviceConnection];
  v3 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  id v7 = v3;
  objc_super v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [v2 remoteTargetWithLaunchingAssertionAttributes:v4];

  return (MRUIServerProtocol *)v5;
}

- (BSServiceConnectionClient)serviceConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRUIControllerConnection] <%p> Creating service connection.", buf, 0xCu);
    }

    v6 = +[BSServiceConnectionEndpoint endpointForMachName:@"com.apple.mediaremoteui.services" service:@"com.apple.mediaremoteui.ui-service" instance:0];
    if (v6)
    {
      objc_initWeak((id *)buf, self);
      id v7 = +[BSServiceConnection connectionWithEndpoint:v6];
      id v8 = self->_serviceConnection;
      self->_serviceConnection = v7;

      v9 = self->_serviceConnection;
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_1000929D0;
      v16 = &unk_100419C88;
      v17 = self;
      objc_copyWeak(&v18, (id *)buf);
      [(BSServiceConnectionClient *)v9 configureConnection:&v13];
      [(BSServiceConnectionClient *)self->_serviceConnection activate];
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10032CBF0((uint64_t)self, v10);
      }
    }
    serviceConnection = self->_serviceConnection;
  }
  id v11 = serviceConnection;
  os_unfair_lock_unlock(p_lock);

  return v11;
}

+ (BSServiceInterface)serviceInterface
{
  if (qword_10047E078 != -1) {
    dispatch_once(&qword_10047E078, &stru_100419CA8);
  }
  v2 = (void *)qword_10047E070;

  return (BSServiceInterface *)v2;
}

- (MRUIClientProtocol)client
{
  return self->_client;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end