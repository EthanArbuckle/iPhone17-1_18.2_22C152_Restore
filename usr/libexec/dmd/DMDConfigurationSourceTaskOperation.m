@interface DMDConfigurationSourceTaskOperation
- (DMDConfigurationSourceController)controller;
- (DMDConfigurationSourceTaskOperation)initWithController:(id)a3;
- (NSString)machServiceName;
- (NSXPCConnection)connection;
- (NSXPCListenerEndpoint)anonymousEndpoint;
- (void)_tryConnectingToNamedService:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchRemoteProxy:(id)a3;
- (void)setAnonymousEndpoint:(id)a3;
- (void)setConnection:(id)a3;
- (void)setController:(id)a3;
- (void)setMachServiceName:(id)a3;
@end

@implementation DMDConfigurationSourceTaskOperation

- (DMDConfigurationSourceTaskOperation)initWithController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMDConfigurationSourceTaskOperation;
  v5 = [(DMDConfigurationSourceTaskOperation *)&v14 init];
  if (v5)
  {
    v6 = [v4 source];
    uint64_t v7 = [v6 listenerEndpoint];
    anonymousEndpoint = v5->_anonymousEndpoint;
    v5->_anonymousEndpoint = (NSXPCListenerEndpoint *)v7;

    v9 = [v4 source];
    v10 = [v9 machServiceName];
    v11 = (NSString *)[v10 copy];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = v11;
  }
  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DMDConfigurationSourceTaskOperation;
  [(DMDConfigurationSourceTaskOperation *)&v3 dealloc];
}

- (void)fetchRemoteProxy:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100036C98;
  v4[3] = &unk_1000CAC38;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(DMDConfigurationSourceTaskOperation *)v5 _tryConnectingToNamedService:0 completion:v4];
}

- (void)_tryConnectingToNamedService:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    uint64_t v7 = [(DMDConfigurationSourceTaskOperation *)self machServiceName];
    if (v7)
    {
      id v8 = objc_alloc((Class)NSXPCConnection);
      v9 = [(DMDConfigurationSourceTaskOperation *)self machServiceName];
      id v10 = [v8 initWithMachServiceName:v9 options:0];
LABEL_6:
      v12 = v10;
      [(DMDConfigurationSourceTaskOperation *)self setConnection:v10];

      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = [(DMDConfigurationSourceTaskOperation *)self anonymousEndpoint];
    if (v7)
    {
      id v11 = objc_alloc((Class)NSXPCConnection);
      v9 = [(DMDConfigurationSourceTaskOperation *)self anonymousEndpoint];
      id v10 = [v11 initWithListenerEndpoint:v9];
      goto LABEL_6;
    }
  }
  [(DMDConfigurationSourceTaskOperation *)self setConnection:0];
LABEL_8:

  v13 = [(DMDConfigurationSourceTaskOperation *)self connection];

  if (v13)
  {
    objc_super v14 = DMFConfigurationSourceClientXPCInterface();
    v15 = [(DMDConfigurationSourceTaskOperation *)self connection];
    [v15 setRemoteObjectInterface:v14];

    v16 = [(DMDConfigurationSourceTaskOperation *)self connection];
    [v16 resume];

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_1000371CC;
    v33 = sub_1000371DC;
    id v34 = 0;
    v17 = [(DMDConfigurationSourceTaskOperation *)self connection];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000371E4;
    v26[3] = &unk_1000CAC60;
    id v18 = v6;
    id v27 = v18;
    v28 = &v29;
    uint64_t v19 = [v17 remoteObjectProxyWithErrorHandler:v26];
    v20 = (void *)v30[5];
    v30[5] = v19;

    v21 = (void *)v30[5];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003723C;
    v23[3] = &unk_1000CAC88;
    v25 = &v29;
    id v24 = v18;
    [v21 probe:v23];

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v22 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4099 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v22);
  }
}

- (DMDConfigurationSourceController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (DMDConfigurationSourceController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)anonymousEndpoint
{
  return self->_anonymousEndpoint;
}

- (void)setAnonymousEndpoint:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_anonymousEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end