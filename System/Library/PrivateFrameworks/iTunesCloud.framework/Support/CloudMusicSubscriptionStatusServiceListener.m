@interface CloudMusicSubscriptionStatusServiceListener
+ (CloudMusicSubscriptionStatusServiceListener)sharedMusicSubscriptionStatusServiceListener;
- (BOOL)isActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (void)dealloc;
- (void)performSubscriptionStatusRequest:(id)a3 forUniqueIdentifier:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation CloudMusicSubscriptionStatusServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceListener, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedObject:self];
  v6 = +[ICMusicSubscriptionStatusRemoteRequesting serviceInterface];
  [v5 setExportedInterface:v6];

  v7 = +[ICMusicSubscriptionStatusRemoteRequesting clientInterface];
  [v5 setRemoteObjectInterface:v7];

  v8 = +[ICDeviceSetupStatusMonitor sharedMonitor];
  unsigned int v9 = [v8 isDeviceSetupComplete];

  if (v9)
  {
    [v5 resume];
  }
  else
  {
    v10 = +[ICDeviceSetupStatusMonitor sharedMonitor];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A1638;
    v12[3] = &unk_1001BEC20;
    id v13 = v5;
    [v10 performBlockAfterDeviceSetup:v12];
  }
  return 1;
}

- (void)performSubscriptionStatusRequest:(id)a3 forUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSXPCConnection currentConnection];
  unsigned int v9 = +[ICMusicSubscriptionStatusController sharedStatusController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A1744;
  v12[3] = &unk_1001BEB88;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  [v9 performSubscriptionStatusRequest:v7 withStatusHandler:v12];
}

- (void)stop
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1A08;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)start
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1B60;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A1CF0;
  v5[3] = &unk_1001BE648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  [(CloudMusicSubscriptionStatusServiceListener *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)CloudMusicSubscriptionStatusServiceListener;
  [(CloudMusicSubscriptionStatusServiceListener *)&v3 dealloc];
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)CloudMusicSubscriptionStatusServiceListener;
  v2 = [(CloudMusicSubscriptionStatusServiceListener *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.CloudMusicSubscriptionStatusServiceListener.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc((Class)NSXPCListener);
    uint64_t v6 = +[ICMusicSubscriptionStatusRemoteRequesting machServiceName];
    id v7 = (NSXPCListener *)[v5 initWithMachServiceName:v6];
    serviceListener = v2->_serviceListener;
    v2->_serviceListener = v7;
  }
  return v2;
}

+ (CloudMusicSubscriptionStatusServiceListener)sharedMusicSubscriptionStatusServiceListener
{
  if (qword_1001F38E0 != -1) {
    dispatch_once(&qword_1001F38E0, &stru_1001BC130);
  }
  v2 = (void *)qword_1001F38D8;

  return (CloudMusicSubscriptionStatusServiceListener *)v2;
}

@end