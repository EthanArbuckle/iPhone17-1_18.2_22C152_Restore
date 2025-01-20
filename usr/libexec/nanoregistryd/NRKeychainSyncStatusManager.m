@interface NRKeychainSyncStatusManager
+ (id)newService:(id)a3;
- (BOOL)enabled;
- (BOOL)enabledFlag;
- (BOOL)outstandingRequest;
- (BOOL)queryInProgress;
- (BOOL)skipNotificationOnLaunch;
- (NRKeychainSyncStatusManager)initWithQueue:(id)a3;
- (NSMutableArray)updateBlocks;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setEnabledFlag:(BOOL)a3;
- (void)setOutstandingRequest:(BOOL)a3;
- (void)setQueryInProgress:(BOOL)a3;
- (void)setSkipNotificationOnLaunch:(BOOL)a3;
- (void)setUpdateBlocks:(id)a3;
@end

@implementation NRKeychainSyncStatusManager

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 queue];

  id v7 = [v5 initWithQueue:v6];
  return v7;
}

- (BOOL)queryInProgress
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ECD00;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)propertyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setQueryInProgress:(BOOL)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000ECD8C;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)propertyQueue, v4);
}

- (BOOL)skipNotificationOnLaunch
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ECE48;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)propertyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSkipNotificationOnLaunch:(BOOL)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000ECED4;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)propertyQueue, v4);
}

- (BOOL)enabledFlag
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ECF90;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)propertyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setEnabledFlag:(BOOL)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000ED01C;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)propertyQueue, v4);
}

- (BOOL)outstandingRequest
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ED0D8;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)propertyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setOutstandingRequest:(BOOL)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000ED164;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)propertyQueue, v4);
}

- (NRKeychainSyncStatusManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NRKeychainSyncStatusManager;
  uint64_t v6 = [(NRKeychainSyncStatusManager *)&v21 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = +[NSMutableArray array];
    updateBlocks = v7->_updateBlocks;
    v7->_updateBlocks = (NSMutableArray *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanoregistry.keychainqueue", v10);
    keychainQueue = v7->_keychainQueue;
    v7->_keychainQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.nanoregistry.keychainpropertyqueue", v10);
    propertyQueue = v7->_propertyQueue;
    v7->_propertyQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = +[NSHashTable weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v15;

    v7->_keychainViewNotificationToken = -1;
    sub_1000ED2E4((uint64_t)v7);
    v17 = v7->_propertyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ED430;
    block[3] = &unk_1001655F8;
    v20 = v7;
    dispatch_async(v17, block);
  }
  return v7;
}

- (void)dealloc
{
  sub_1000ED944((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRKeychainSyncStatusManager;
  [(NRKeychainSyncStatusManager *)&v3 dealloc];
}

- (BOOL)enabled
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  propertyQueue = self->_propertyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EDB70;
  block[3] = &unk_100169700;
  void block[4] = self;
  v14 = &v15;
  id v5 = v3;
  dispatch_queue_t v13 = v5;
  dispatch_sync((dispatch_queue_t)propertyQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      id v7 = nr_daemon_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (v8)
      {
        char v9 = nr_daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000FCB58(v9);
        }
      }
      sub_1000EDC34((uint64_t)self, 0);
    }
  }
  BOOL v10 = [(NRKeychainSyncStatusManager *)self enabledFlag];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  -[NSHashTable addObject:](self->_observers, "addObject:");
  if ([(NRKeychainSyncStatusManager *)self skipNotificationOnLaunch]) {
    [v4 keychainSyncStatusDidChange:self.enabled];
  }
}

- (void)removeObserver:(id)a3
{
}

- (NSMutableArray)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUpdateBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_keychainQueryTimer, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end