@interface WCDPrivateClient
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)workQueue;
- (WCDClientDelegate)delegate;
- (WCDPrivateClient)init;
- (id)preferredBundleIDForApplicationInfo:(id)a3;
- (id)remoteObjectProxy;
- (unint64_t)hash;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)fakeIncomingPayloadOnSubService:(id)a3 ofType:(id)a4 clientData:(id)a5 resource:(id)a6 resourceSandboxToken:(id)a7 completionHandler:(id)a8;
- (void)handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a3;
- (void)handlePingForApplicationInfo:(id)a3;
- (void)isApplicationInfoPrivileged:(id)a3 completionHandler:(id)a4;
- (void)reconnect;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation WCDPrivateClient

- (WCDPrivateClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCDPrivateClient;
  v2 = [(WCDPrivateClient *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.wcd.private-client.work-queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCDPrivateClient;
  [(WCDPrivateClient *)&v2 dealloc];
}

- (void)setConnection:(id)a3
{
  id v5 = a3;
  p_connection = &self->_connection;
  if (([(NSXPCConnection *)self->_connection isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_connection, a3);
    [(NSXPCConnection *)self->_connection setDelegate:self];
    v7 = +[WCPrivateXPCManager privateDaemonInterface];
    [(NSXPCConnection *)self->_connection setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v8 = +[WCPrivateXPCManager privateClientInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100010198;
    v11[3] = &unk_100044B98;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v11];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010228;
    v9[3] = &unk_100044B98;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)*p_connection setInvalidationHandler:v9];
    [(NSXPCConnection *)*p_connection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (NSString)description
{
  dispatch_queue_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(WCDPrivateClient *)self connection];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %p, connection: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WCDPrivateClient *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      objc_super v6 = [(WCDPrivateClient *)self connection];
      v7 = [(WCDPrivateClient *)v5 connection];

      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  objc_super v2 = [(WCDPrivateClient *)self connection];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v5 = a4;
  [v5 retainArguments];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010510;
  block[3] = &unk_100044A68;
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reconnect
{
  objc_super v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "private client reconnected", v3, 2u);
  }
}

- (void)fakeIncomingPayloadOnSubService:(id)a3 ofType:(id)a4 clientData:(id)a5 resource:(id)a6 resourceSandboxToken:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v38 = a6;
  id v17 = a7;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100010AE8;
  v48[3] = &unk_100044E50;
  id v18 = v14;
  id v49 = v18;
  v19 = (void (**)(id, id))a8;
  v41 = objc_retainBlock(v48);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100010C38;
  v46[3] = &unk_100044E78;
  v46[4] = self;
  id v20 = v18;
  id v47 = v20;
  v21 = objc_retainBlock(v46);
  v22 = objc_opt_new();
  v23 = [v22 UUIDString];

  v40 = v16;
  if ([v15 isEqual:@"file"])
  {
    v24 = objc_opt_new();
    [v24 setObject:&off_100046B48 forKeyedSubscript:@"t"];
    if (v16) {
      [v24 setObject:v16 forKeyedSubscript:@"u"];
    }
    id v45 = 0;
    v25 = v38;
    ((void (*)(void *, id, id, NSObject *, void *, id *))v21[2])(v21, v38, v17, v24, v23, &v45);
    id v26 = v45;
    goto LABEL_19;
  }
  if (![v15 isEqual:@"userinfo"])
  {
    if ([v15 isEqual:@"complication"])
    {
      v24 = objc_opt_new();
      [v24 setVersion:1];
      [v24 setClientData:v16];
      [v24 setTransferIdentifier:v23];
      v33 = [v24 data];
      v34 = (void (*)(void))v41[2];
    }
    else
    {
      if (![v15 isEqual:@"appcontext"])
      {
        id v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        v24 = wc_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10002ADF4((uint64_t)v15, v24);
        }
        goto LABEL_18;
      }
      v24 = objc_opt_new();
      [v24 setVersion:1];
      [v24 setClientData:v16];
      v33 = [v24 data];
      v34 = (void (*)(void))v41[2];
    }
    v34();

    id v26 = 0;
LABEL_18:
    v25 = v38;
    goto LABEL_19;
  }
  id v35 = v15;
  id v36 = v20;
  id v37 = v17;
  v24 = objc_opt_new();
  id v44 = 0;
  [v24 updateUserInfoData:v16 error:&v44];
  id v27 = v44;
  [v24 setTransferIdentifier:v23];
  v28 = [v24 protobufData];
  v29 = NSTemporaryDirectory();
  v30 = [v29 stringByAppendingPathComponent:WCUserInfoTransferWireDataFileName];
  v25 = +[NSURL fileURLWithPath:v30];

  id v43 = v27;
  v39 = v28;
  LODWORD(v29) = [v28 writeToURL:v25 options:1073741825 error:&v43];
  id v26 = v43;

  if (v29)
  {
    CFStringRef v50 = @"t";
    v51 = &off_100046B60;
    v31 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    id v42 = v26;
    id v17 = v37;
    ((void (*)(void *, void *, id, NSObject *, void *, id *))v21[2])(v21, v25, v37, v31, v23, &v42);
    id v32 = v42;

    id v26 = v32;
  }
  else
  {
    v31 = wc_log();
    id v17 = v37;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10002AD60((uint64_t)v26);
    }
  }
  id v15 = v35;
  id v20 = v36;

LABEL_19:
  v19[2](v19, v26);
}

- (id)preferredBundleIDForApplicationInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 watchExtensionBundleIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 watchAppBundleIdentifier];
  }
  v7 = v6;

  return v7;
}

- (void)handlePingForApplicationInfo:(id)a3
{
  id v4 = a3;
  id v6 = [(WCDPrivateClient *)self remoteObjectProxy];
  id v5 = [(WCDPrivateClient *)self preferredBundleIDForApplicationInfo:v4];

  [v6 handlePingForExtensionBundleID:v5];
}

- (void)isApplicationInfoPrivileged:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WCDPrivateClient *)self remoteObjectProxy];
  id v8 = [(WCDPrivateClient *)self preferredBundleIDForApplicationInfo:v7];

  [v9 isExtensionPrivileged:v8 completionHandler:v6];
}

- (void)handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WCDPrivateClient *)self remoteObjectProxy];
  [v5 handlePairedSyncComplicationsStartedWithCompletionHandler:v4];
}

- (id)remoteObjectProxy
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100044EB8];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (WCDClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCDClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end