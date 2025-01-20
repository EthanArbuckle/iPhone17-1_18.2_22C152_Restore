@interface _DASComplicationManager
+ (BOOL)watchIsPaired;
+ (_DASComplicationManager)sharedInstance;
+ (id)obtainActiveComplications;
- (BOOL)isActiveComplication:(id)a3;
- (BOOL)isAnyActiveComplication:(id)a3;
- (BOOL)isRecentlyAddedComplication:(id)a3;
- (NSDate)lastComplicationChangeDate;
- (NSSet)activeComplications;
- (NSSet)addedComplications;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASComplicationManager)init;
- (void)registerForComplicationChangeNotifications;
- (void)setActiveComplications:(id)a3;
- (void)setAddedComplications:(id)a3;
- (void)setLastComplicationChangeDate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASComplicationManager

- (_DASComplicationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASComplicationManager;
  v2 = [(_DASComplicationManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.complicationsChangedQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [(_DASComplicationManager *)v2 registerForComplicationChangeNotifications];
  }
  return v2;
}

+ (_DASComplicationManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F63C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C40B8 != -1) {
    dispatch_once(&qword_1001C40B8, block);
  }
  v2 = (void *)qword_1001C40C0;

  return (_DASComplicationManager *)v2;
}

+ (id)obtainActiveComplications
{
  v2 = (void *)os_transaction_create();
  v3 = _CDDCurrentActiveComplications();
  v4 = +[NSSet setWithArray:v3];

  return v4;
}

+ (BOOL)watchIsPaired
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = [v2 getPairedDevices];

  LOBYTE(v2) = [v3 count] != 0;
  return (char)v2;
}

- (void)registerForComplicationChangeNotifications
{
  if ([(id)objc_opt_class() watchIsPaired])
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.complicationsChangedQueue", v4);
    queue = self->_queue;
    self->_queue = v5;

    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v7;

    dispatch_set_qos_class_fallback();
    v9 = self->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006F974;
    handler[3] = &unk_1001754F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
    int out_token = 0;
    _CDDComplicationChangeOverCloudNotificationString();
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];
    v12 = self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10006FB68;
    v20[3] = &unk_1001759D0;
    v20[4] = self;
    notify_register_dispatch(v11, &out_token, v12, v20);

    int v19 = 0;
    _CDDComplicationChangeNotificationString();
    id v13 = objc_claimAutoreleasedReturnValue();
    v14 = (const char *)[v13 UTF8String];
    v15 = self->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006FBC0;
    v18[3] = &unk_1001759D0;
    v18[4] = self;
    notify_register_dispatch(v14, &v19, v15, v18);

    v16 = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006FC18;
    v17[3] = &unk_1001754F8;
    v17[4] = self;
    dispatch_sync(v16, v17);
  }
}

- (BOOL)isActiveComplication:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FDC0;
  block[3] = &unk_100175B30;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)isAnyActiveComplication:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FEC4;
  block[3] = &unk_100175948;
  id v9 = v4;
  id v10 = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

- (BOOL)isRecentlyAddedComplication:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000700A4;
  block[3] = &unk_100176988;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (NSSet)activeComplications
{
  return self->_activeComplications;
}

- (void)setActiveComplications:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)lastComplicationChangeDate
{
  return self->_lastComplicationChangeDate;
}

- (void)setLastComplicationChangeDate:(id)a3
{
}

- (NSSet)addedComplications
{
  return self->_addedComplications;
}

- (void)setAddedComplications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedComplications, 0);
  objc_storeStrong((id *)&self->_lastComplicationChangeDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_activeComplications, 0);
}

@end