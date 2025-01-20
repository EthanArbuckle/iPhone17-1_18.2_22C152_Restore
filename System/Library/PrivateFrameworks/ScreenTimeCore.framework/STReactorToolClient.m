@interface STReactorToolClient
+ (id)_newConnection;
- (BOOL)scheduleFailStuckMessagesWithError:(id *)a3;
- (BOOL)scheduleMessageRetryWithError:(id *)a3;
- (BOOL)scheduleStoreClenaupWithError:(id *)a3;
- (BOOL)shutdownReactorWithError:(id *)a3;
- (NSXPCConnection)connection;
- (STReactorToolClient)init;
- (id)currentMessageTransportReachabilityMap:(id *)a3;
- (void)dealloc;
@end

@implementation STReactorToolClient

- (STReactorToolClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STReactorToolClient;
  v2 = [(STReactorToolClient *)&v6 init];
  v3 = +[STReactorToolClient _newConnection];
  connection = v2->_connection;
  v2->_connection = v3;

  [(NSXPCConnection *)v2->_connection resume];
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STReactorToolClient;
  [(STReactorToolClient *)&v3 dealloc];
}

+ (id)_newConnection
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.ScreenTimeAgent.reactor-tool" options:4096];
  objc_super v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STReactorToolServiceInterface];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

- (BOOL)shutdownReactorWithError:(id *)a3
{
  v5 = +[STLog reactorTool];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting reactor shutdown", buf, 2u);
  }

  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10006D490;
  v15 = sub_10006D4A0;
  id v16 = 0;
  objc_super v6 = [(STReactorToolClient *)self connection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006D4A8;
  v10[3] = &unk_1002FBF30;
  v10[4] = buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  [v7 shutdownReactorWithCompletion:&stru_1002FDE38];
  if (a3) {
    *a3 = *((id *)v12 + 5);
  }
  BOOL v8 = *((void *)v12 + 5) == 0;

  _Block_object_dispose(buf, 8);
  return v8;
}

- (BOOL)scheduleMessageRetryWithError:(id *)a3
{
  v5 = +[STLog reactorTool];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting schedule message retry", buf, 2u);
  }

  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10006D490;
  v15 = sub_10006D4A0;
  id v16 = 0;
  objc_super v6 = [(STReactorToolClient *)self connection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006D6B8;
  v10[3] = &unk_1002FBF30;
  v10[4] = buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  [v7 scheduleMessageRetryActivity:&stru_1002FDE58];
  if (a3) {
    *a3 = *((id *)v12 + 5);
  }
  BOOL v8 = *((void *)v12 + 5) == 0;

  _Block_object_dispose(buf, 8);
  return v8;
}

- (BOOL)scheduleStoreClenaupWithError:(id *)a3
{
  v5 = +[STLog reactorTool];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting schedule store cleanup", buf, 2u);
  }

  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10006D490;
  v15 = sub_10006D4A0;
  id v16 = 0;
  objc_super v6 = [(STReactorToolClient *)self connection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006D8C8;
  v10[3] = &unk_1002FBF30;
  v10[4] = buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  [v7 scheduleStoreCleanupActivity:&stru_1002FDE78];
  if (a3) {
    *a3 = *((id *)v12 + 5);
  }
  BOOL v8 = *((void *)v12 + 5) == 0;

  _Block_object_dispose(buf, 8);
  return v8;
}

- (BOOL)scheduleFailStuckMessagesWithError:(id *)a3
{
  v5 = +[STLog reactorTool];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting schedule fail stuck messages", buf, 2u);
  }

  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10006D490;
  v15 = sub_10006D4A0;
  id v16 = 0;
  objc_super v6 = [(STReactorToolClient *)self connection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006DAD8;
  v10[3] = &unk_1002FBF30;
  v10[4] = buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  [v7 scheduleFailStuckMessagesActivity:&stru_1002FDE98];
  if (a3) {
    *a3 = *((id *)v12 + 5);
  }
  BOOL v8 = *((void *)v12 + 5) == 0;

  _Block_object_dispose(buf, 8);
  return v8;
}

- (id)currentMessageTransportReachabilityMap:(id *)a3
{
  v5 = +[STLog reactorTool];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting current message transport reachability map", buf, 2u);
  }

  *(void *)buf = 0;
  v19 = buf;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10006D490;
  v22 = sub_10006D4A0;
  id v23 = 0;
  objc_super v6 = [(STReactorToolClient *)self connection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006DD98;
  v17[3] = &unk_1002FBF30;
  v17[4] = buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v17];

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10006D490;
  v15 = sub_10006D4A0;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006DDA8;
  v10[3] = &unk_1002FDEC0;
  v10[4] = &v11;
  [v7 currentMessageTransportReachabilityMap:v10];
  if (a3) {
    *a3 = *((id *)v19 + 5);
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end