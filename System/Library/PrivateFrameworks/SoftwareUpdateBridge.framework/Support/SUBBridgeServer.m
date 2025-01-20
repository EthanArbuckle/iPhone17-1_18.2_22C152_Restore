@interface SUBBridgeServer
- (NSMutableArray)clients;
- (OS_dispatch_queue)queue;
- (SUBBridgeServer)init;
- (SUBMessageEndpoint)endpoint;
- (void)addClient:(id)a3;
- (void)forwardIDSMessage:(id)a3;
- (void)forwardXPCMessage:(id)a3 fromClient:(id)a4;
- (void)forwardXPCMessage:(id)a3 fromClient:(id)a4 withReply:(id)a5;
- (void)removeClient:(id)a3;
- (void)resetLocale;
- (void)sendClient:(id)a3 message:(id)a4;
- (void)setClients:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SUBBridgeServer

- (SUBBridgeServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUBBridgeServer;
  v2 = [(SUBBridgeServer *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.subridge.server", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clients = v2->_clients;
    v2->_clients = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"resetLocale" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v2;
}

- (void)resetLocale
{
  v2 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "received NSCurrentLocaleDidChangeNotification, exiting", v3, 2u);
  }
  exit(0);
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D718;
  v7[3] = &unk_10002D120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D7BC;
  v7[3] = &unk_10002D120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)sendClient:(id)a3 message:(id)a4
{
}

- (void)forwardXPCMessage:(id)a3 fromClient:(id)a4
{
}

- (void)forwardXPCMessage:(id)a3 fromClient:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_10000E53C(v8);
  endpoint = self->_endpoint;
  if (v10)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000D95C;
    v20[3] = &unk_10002D148;
    v13 = &v21;
    id v21 = v10;
    [(SUBMessageEndpoint *)endpoint sendMessage:v11 isCritical:1 withReply:v20];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000D96C;
    v15[3] = &unk_10002D170;
    v13 = &v16;
    id v16 = v8;
    id v14 = v11;
    id v17 = v14;
    v18 = self;
    id v19 = v9;
    [(SUBMessageEndpoint *)endpoint sendMessage:v14 isCritical:1 completion:v15];
  }
}

- (void)forwardIDSMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DC28;
  v7[3] = &unk_10002D120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (SUBMessageEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end