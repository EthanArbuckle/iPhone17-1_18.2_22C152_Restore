@interface KTAPSConnection
- (APSConnection)apsConnection;
- (KTAPSConnection)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4;
- (NSMutableArray)receivers;
- (NSString)namedDelegatePort;
- (OS_dispatch_queue)deliveryQueue;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)registerPushReceiver:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setDeliveryQueue:(id)a3;
- (void)setLog:(id)a3;
- (void)setNamedDelegatePort:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
@end

@implementation KTAPSConnection

- (KTAPSConnection)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)KTAPSConnection;
  v7 = [(KTAPSConnection *)&v24 init];
  v8 = v7;
  if (v7)
  {
    [(KTAPSConnection *)v7 setNamedDelegatePort:v6];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("aps-queue", v9);
    [(KTAPSConnection *)v8 setQueue:v10];

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("aps-delivery-queue", v11);
    [(KTAPSConnection *)v8 setDeliveryQueue:v12];

    v13 = [(objc_class *)a4 alloc];
    uint64_t v14 = APSEnvironmentProduction;
    v15 = [(KTAPSConnection *)v8 queue];
    v16 = [(objc_class *)v13 initWithEnvironmentName:v14 namedDelegatePort:v6 queue:v15];
    [(KTAPSConnection *)v8 setApsConnection:v16];

    v17 = [(KTAPSConnection *)v8 apsConnection];
    [v17 setDelegate:v8];

    os_log_t v18 = os_log_create("com.apple.Transparency", "KTAPSConnection");
    [(KTAPSConnection *)v8 setLog:v18];

    CFStringRef v25 = @"com.apple.icloud-container.com.apple.transparencyd";
    v19 = +[NSArray arrayWithObjects:&v25 count:1];
    v20 = [(KTAPSConnection *)v8 apsConnection];
    [v20 _setEnabledTopics:v19];

    v21 = +[NSMutableArray array];
    [(KTAPSConnection *)v8 setReceivers:v21];

    v22 = v8;
  }

  return v8;
}

- (void)registerPushReceiver:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(KTAPSConnection *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DAD0C;
  v7[3] = &unk_1002B71D0;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = [v5 userInfo];
  id v7 = [v6 copy];

  id v8 = [(KTAPSConnection *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v5 token];
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didReceiveIncomingMessage: %@: userInfo: %@", buf, 0x16u);
  }
  id v10 = [(KTAPSConnection *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DAF84;
  block[3] = &unk_1002B9DD0;
  block[4] = self;
  id v14 = v5;
  id v15 = v7;
  id v11 = v7;
  id v12 = v5;
  dispatch_async(v10, block);
}

- (NSString)namedDelegatePort
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNamedDelegatePort:(id)a3
{
}

- (APSConnection)apsConnection
{
  return (APSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApsConnection:(id)a3
{
}

- (NSMutableArray)receivers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReceivers:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)deliveryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeliveryQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);

  objc_storeStrong((id *)&self->_namedDelegatePort, 0);
}

@end