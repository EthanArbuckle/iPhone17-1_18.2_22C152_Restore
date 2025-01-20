@interface MRDAVHostedRoutingService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MRDAVHostedRoutingService)init;
- (MRDHostedRoutingController)hostedRoutingController;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (id)endpointForDeviceUID:(id)a3;
- (id)endpointForOrigin:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)hostedDiscoverySessionDidInvalidate:(id)a3;
@end

@implementation MRDAVHostedRoutingService

- (MRDAVHostedRoutingService)init
{
  v15.receiver = self;
  v15.super_class = (Class)MRDAVHostedRoutingService;
  v2 = [(MRDAVHostedRoutingService *)&v15 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NSXPCListener anonymousListener];
    anonymousListener = v2->_anonymousListener;
    v2->_anonymousListener = (NSXPCListener *)v8;

    [(NSXPCListener *)v2->_anonymousListener setDelegate:v2];
    v10 = objc_alloc_init(MRDAVHostedRoutingController);
    hostedRoutingController = v2->_hostedRoutingController;
    v2->_hostedRoutingController = &v10->super;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    hostedDiscoverySessions = v2->_hostedDiscoverySessions;
    v2->_hostedDiscoverySessions = v12;

    [(NSXPCListener *)v2->_anonymousListener resume];
  }
  return v2;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return [(NSXPCListener *)self->_anonymousListener endpoint];
}

- (id)endpointForOrigin:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = sub_100077960;
  v16 = sub_100077970;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077978;
  block[3] = &unk_100416870;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)endpointForDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = sub_100077960;
  v16 = sub_100077970;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077C64;
  block[3] = &unk_100416870;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)hostedDiscoverySessionDidInvalidate:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077E28;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [[MRDAVHostedDiscoverySession alloc] initWithConnection:v5 hostedRoutingController:self->_hostedRoutingController];

  [(MRDAVHostedDiscoverySession *)v6 setDelegate:self];
  serialQueue = self->_serialQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100077F0C;
  v10[3] = &unk_1004158D8;
  v10[4] = self;
  v11 = v6;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v10);

  return 1;
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077FB0;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (MRDHostedRoutingController)hostedRoutingController
{
  return self->_hostedRoutingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedRoutingController, 0);
  objc_storeStrong((id *)&self->_hostedDiscoverySessions, 0);
  objc_storeStrong((id *)&self->_anonymousListener, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end