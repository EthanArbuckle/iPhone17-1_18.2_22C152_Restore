@interface MapsXPCConnectionsManager
+ (id)sharedManager;
- (MapsXPCConnectionsManager)init;
- (void)_fetchListenerEndpoints;
- (void)_handleConnectionInvalidated;
- (void)dealloc;
- (void)listenerEndpointDidChange:(id)a3 forIdentifier:(id)a4;
@end

@implementation MapsXPCConnectionsManager

- (void)_fetchListenerEndpoints
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F540;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  if (+[NSThread isMainThread])
  {
    ((void (*)(void *))v2[2])(v2);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B63094;
    block[3] = &unk_1012E6EA8;
    v4 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (MapsXPCConnectionsManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)MapsXPCConnectionsManager;
  v2 = [(MapsXPCConnectionsManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[NSXPCConnection _maps_mapsConnectionBrokerEndpointProviderConnection];
    brokerConnection = v2->_brokerConnection;
    v2->_brokerConnection = (NSXPCConnection *)v3;

    [(NSXPCConnection *)v2->_brokerConnection setExportedObject:v2];
    v5 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointConsumerInterface];
    [(NSXPCConnection *)v2->_brokerConnection setExportedInterface:v5];

    id v6 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointProviderInterface];
    [(NSXPCConnection *)v2->_brokerConnection setRemoteObjectInterface:v6];

    objc_initWeak(&location, v2);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B62DF4;
    v10[3] = &unk_1012E6708;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)v2->_brokerConnection setInvalidationHandler:v10];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B62E34;
    v8[3] = &unk_1012E6708;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)v2->_brokerConnection setInterruptionHandler:v8];
    [(NSXPCConnection *)v2->_brokerConnection resume];
    [(MapsXPCConnectionsManager *)v2 _fetchListenerEndpoints];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_1016108E0 != -1) {
    dispatch_once(&qword_1016108E0, &stru_101319438);
  }
  v2 = (void *)qword_1016108D8;

  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_brokerConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MapsXPCConnectionsManager;
  [(MapsXPCConnectionsManager *)&v3 dealloc];
}

- (void)_handleConnectionInvalidated
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B63024;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  if (+[NSThread isMainThread])
  {
    ((void (*)(void *))v2[2])(v2);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B63084;
    block[3] = &unk_1012E6EA8;
    v4 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)listenerEndpointDidChange:(id)a3 forIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1000ABFCC(OS_LOG_TYPE_INFO, @"MapsXPCConnectionsManager %s %@ %@", v7, v8, v9, v10, v11, v12, (uint64_t)"-[MapsXPCConnectionsManager listenerEndpointDidChange:forIdentifier:]");
  if ([v6 isEqualToString:@"kSiriPluginXPCEndpointIdentifier"])
  {
    objc_super v13 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v14 = sub_100B63224;
LABEL_7:
    v13[2] = v14;
    v13[3] = &unk_1012E5D08;
    v13[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"kCompanionDaemonXPCEndpointIdentifier"])
  {
    objc_super v13 = v16;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v14 = sub_100B6327C;
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"kPushDaemonXPCEndpointIdentifier"])
  {
    objc_super v13 = v15;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v14 = sub_100B632D4;
    goto LABEL_7;
  }
LABEL_8:
}

- (void).cxx_destruct
{
}

@end