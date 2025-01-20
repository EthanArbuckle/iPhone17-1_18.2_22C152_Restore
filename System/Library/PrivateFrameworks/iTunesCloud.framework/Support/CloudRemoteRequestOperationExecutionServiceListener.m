@interface CloudRemoteRequestOperationExecutionServiceListener
+ (CloudRemoteRequestOperationExecutionServiceListener)sharedRemoteRequestOperationExecutionServiceListener;
- (BOOL)isActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (void)dealloc;
- (void)performRemoteRequestOperationWithExecutionContext:(id)a3 completionHandler:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation CloudRemoteRequestOperationExecutionServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceListener, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedObject:self];
  v6 = +[ICRemoteRequestOperationExecuting serviceInterface];
  [v5 setExportedInterface:v6];

  v7 = +[ICRemoteRequestOperationExecuting clientInterface];
  [v5 setRemoteObjectInterface:v7];

  [v5 resume];
  return 1;
}

- (void)performRemoteRequestOperationWithExecutionContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 remoteRequestOperation];
  [v7 _setShadowOperationForRemoteExecution:1];
  id v8 = [v6 qualityOfService];

  v9 = +[NSOperationQueue ic_sharedRequestOperationQueueWithQualityOfService:v8];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EE374;
  v12[3] = &unk_1001BF2B0;
  id v13 = v7;
  id v14 = v5;
  id v10 = v5;
  id v11 = v7;
  [v11 performRequestOnOperationQueue:v9 withCompletionHandler:v12];
}

- (void)stop
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE4A4;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)start
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE57C;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EE68C;
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
  [(CloudRemoteRequestOperationExecutionServiceListener *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)CloudRemoteRequestOperationExecutionServiceListener;
  [(CloudRemoteRequestOperationExecutionServiceListener *)&v3 dealloc];
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)CloudRemoteRequestOperationExecutionServiceListener;
  v2 = [(CloudRemoteRequestOperationExecutionServiceListener *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.CloudRemoteRequestOperationExecutionServiceListener.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc((Class)NSXPCListener);
    uint64_t v6 = +[ICRemoteRequestOperationExecuting machServiceName];
    v7 = (NSXPCListener *)[v5 initWithMachServiceName:v6];
    serviceListener = v2->_serviceListener;
    v2->_serviceListener = v7;
  }
  return v2;
}

+ (CloudRemoteRequestOperationExecutionServiceListener)sharedRemoteRequestOperationExecutionServiceListener
{
  if (qword_1001F39C8 != -1) {
    dispatch_once(&qword_1001F39C8, &stru_1001BDA10);
  }
  v2 = (void *)qword_1001F39C0;

  return (CloudRemoteRequestOperationExecutionServiceListener *)v2;
}

@end