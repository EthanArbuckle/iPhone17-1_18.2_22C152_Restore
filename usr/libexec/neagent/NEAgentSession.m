@interface NEAgentSession
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)managerObject;
- (id)managerObjectWithErrorHandler:(id)a3;
- (void)disposeWithCompletionHandler:(id)a3;
- (void)setupWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 completionHandler:(id)a7;
@end

@implementation NEAgentSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_delegateListener, 0);
  objc_storeStrong((id *)&self->_delegateConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (id)managerObjectWithErrorHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v7 = [Property remoteObjectProxyWithErrorHandler:v5];
  if (!v7)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get the remote manager object", v11, 2u);
    }

    sub_10000782C(self, v9);
  }

  return v7;
}

- (id)managerObject
{
  v2 = self;
  if (self) {
    self = (NEAgentSession *)objc_getProperty(self, a2, 32, 1);
  }
  v3 = [(NEAgentSession *)self remoteObjectProxy];
  if (!v3)
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to get the remote manager object", v7, 2u);
    }

    sub_10000782C(v2, v5);
  }

  return v3;
}

- (void)disposeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007BB8;
  v8[3] = &unk_10000C498;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)setupWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v15 = a7;
  if (self) {
    id Property = objc_getProperty(self, v14, 16, 1);
  }
  else {
    id Property = 0;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100007E9C;
  v20[3] = &unk_10000C470;
  int64_t v24 = a4;
  int64_t v25 = a5;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v23 = v15;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  dispatch_async(Property, v20);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  delegateConnection = self->_delegateConnection;
  if (delegateConnection)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Received a second delegate connection", buf, 2u);
    }
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000084C0;
    v16[3] = &unk_10000C420;
    v16[4] = self;
    id v9 = objc_retainBlock(v16);
    v11 = [objc_getProperty(self, v10, 8, 1) driverInterface];
    [v6 setExportedInterface:v11];

    id v13 = [objc_getProperty(self, v12, 8, 1) managerInterface];
    [v6 setRemoteObjectInterface:v13];

    [v6 setExportedObject:[objc_getProperty(self, v14, 8, 1)]];
    [v6 setInvalidationHandler:v9];
    [v6 setInterruptionHandler:v9];
    objc_storeStrong((id *)&self->_delegateConnection, a4);
    [v6 resume];
  }
  return delegateConnection == 0;
}

@end