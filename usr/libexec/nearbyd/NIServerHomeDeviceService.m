@interface NIServerHomeDeviceService
+ (id)sharedInstance;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)printableState;
- (void)_processCommonConfiguration;
- (void)addServiceClient:(id)a3 identifier:(id)a4 configuration:(id)a5;
- (void)removeServiceClientWithIdentifier:(id)a3;
@end

@implementation NIServerHomeDeviceService

+ (id)sharedInstance
{
  if (qword_1008A52E8 != -1) {
    dispatch_once(&qword_1008A52E8, &stru_100859B60);
  }
  v2 = (void *)qword_1008A52E0;

  return v2;
}

- (id)_initInternal
{
  v14.receiver = self;
  v14.super_class = (Class)NIServerHomeDeviceService;
  v2 = [(NIServerHomeDeviceService *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nearbyd.home-device-service", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMapTable strongToWeakObjectsMapTable];
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v6;

    uint64_t v8 = objc_opt_new();
    configurations = v2->_configurations;
    v2->_configurations = (NSMutableDictionary *)v8;

    if (+[NIPlatformInfo isInternalBuild]
      || (+[NSUserDefaults standardUserDefaults],
          v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 BOOLForKey:@"EnableStateDump"],
          v10,
          v11))
    {
      v13 = v2;
      os_state_add_handler();
    }
  }
  return v2;
}

- (void)addServiceClient:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001FF9E8;
    v12[3] = &unk_1008565C8;
    v12[4] = self;
    id v13 = v9;
    id v14 = v10;
    id v15 = v8;
    dispatch_sync((dispatch_queue_t)queue, v12);
  }
}

- (void)removeServiceClientWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FFC20;
  v7[3] = &unk_100846588;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (id)printableState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1001FFDFC;
  id v10 = sub_1001FFE0C;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001FFE14;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  id v3 = objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = +[NSString stringWithFormat:@"%d clients", [(NSMapTable *)self->_clients count]];
  [v3 addObject:v5];

  return v3;
}

- (void)_processCommonConfiguration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 3;
  configurations = self->_configurations;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020006C;
  v7[3] = &unk_100859B88;
  void v7[4] = &v8;
  [(NSMutableDictionary *)configurations enumerateKeysAndObjectsUsingBlock:v7];
  id v4 = [(NSMapTable *)self->_clients objectEnumerator];
  v5 = 0;
  while (1)
  {
    uint64_t v6 = [v4 nextObject];

    if (!v6) {
      break;
    }
    v5 = v6;
    if (objc_opt_respondsToSelector())
    {
      v5 = v6;
      [v6 didUpdateMinimumPreferredUpdateRate:v9[3]];
    }
  }

  _Block_object_dispose(&v8, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end