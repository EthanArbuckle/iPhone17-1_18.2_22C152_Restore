@interface RMXPCListenerDelegate
- (BOOL)allowedToRun;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSPersistentContainer)persistentContainer;
- (RMXPCListenerDelegate)initWithPersistentContainer:(id)a3 allowedToRun:(BOOL)a4;
@end

@implementation RMXPCListenerDelegate

- (RMXPCListenerDelegate)initWithPersistentContainer:(id)a3 allowedToRun:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMXPCListenerDelegate;
  v8 = [(RMXPCListenerDelegate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_persistentContainer, a3);
    v9->_allowedToRun = a4;
  }

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[RMLog XPCListenerDelegate];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Evaluating new connection %{public}@", (uint8_t *)&v15, 0xCu);
  }

  BOOL v7 = [(RMXPCListenerDelegate *)self allowedToRun];
  v8 = +[RMLog XPCListenerDelegate];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accepted new connection %{public}@ ", (uint8_t *)&v15, 0xCu);
    }

    id v10 = +[RMXPCProxy newInterface];
    [v5 setExportedInterface:v10];

    objc_super v11 = [RMXPCProxyHandler alloc];
    v12 = [(RMXPCListenerDelegate *)self persistentContainer];
    v13 = [(RMXPCProxyHandler *)v11 initWithXPCConnection:v5 persistentContainer:v12];
    [v5 setExportedObject:v13];

    [v5 resume];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10008D21C();
    }
  }
  return v7;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (BOOL)allowedToRun
{
  return self->_allowedToRun;
}

- (void).cxx_destruct
{
}

@end