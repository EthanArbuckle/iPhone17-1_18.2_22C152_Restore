@interface BKHIDTouchSensitiveButtonScanningController
- (BKHIDTouchSensitiveButtonScanningController)initWithContext:(id)a3;
- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3;
- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)processDidTerminate:(int)a3;
- (void)serviceDidDisappear:(id)a3;
- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5;
@end

@implementation BKHIDTouchSensitiveButtonScanningController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_activeCameraButtonScanningPIDs, 0);
  objc_storeStrong((id *)&self->_lock_services, 0);
  objc_storeStrong((id *)&self->_lock_pidToProcessDeathWatcher, 0);
  objc_storeStrong((id *)&self->_serviceMatcher, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)processDidTerminate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToProcessDeathWatcher = self->_lock_pidToProcessDeathWatcher;
  v7 = +[NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)lock_pidToProcessDeathWatcher removeObjectForKey:v7];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002A0B8;
  v8[3] = &unk_1000F8A20;
  v8[4] = self;
  int v9 = v3;
  sub_10002A0CC((uint64_t)self, v8);
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSSet setWithObject:@"HalfPressThresholdModifier"];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10002A5C4;
  v15 = &unk_1000F7450;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v8;
  v17 = &v18;
  [v6 enumerateKeysAndObjectsUsingBlock:&v12];
  if (*((unsigned char *)v19 + 24))
  {
    int v9 = sub_10005FC4C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "BKHIDTouchSensitiveButton disallowed persistent properties: %{public}@", buf, 0xCu);
    }

    int64_t v10 = 1;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableSet makeObjectsPerformSelector:withObject:](self->_lock_services, "makeObjectsPerformSelector:withObject:", "asyncSetProperties:", v6, v12, v13, v14, v15);
    os_unfair_lock_unlock(&self->_lock);
    int64_t v10 = 2;
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 primaryPage] == 65280 && [v3 primaryUsage] == 102;

  return v4;
}

- (void)serviceDidDisappear:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_services removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_services = self->_lock_services;
  if (!lock_services)
  {
    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v8 = self->_lock_services;
    self->_lock_services = v7;

    lock_services = self->_lock_services;
  }
  [(NSMutableSet *)lock_services addObjectsFromArray:v5];
  int v9 = +[BKSHIDEventSenderDescriptor build:&stru_1000F6140];
  int64_t v10 = +[BKIOHIDServicePersistentPropertyController touchSensitiveButtonServicePersistentPropertyController];
  v11 = [v10 allPersistentPropertiesForServicesMatchingDescriptor:v9];

  if (![v11 count])
  {

    v11 = 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v17 addDisappearanceObserver:self queue:self->_queue];
        if (v11) {
          [v17 setProperties:v11];
        }
        sub_10002A29C((uint64_t)self, [(NSMutableIndexSet *)self->_lock_activeCameraButtonScanningPIDs count] != 0, v17);
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5
{
  BOOL v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v10 = sub_10005FA78();
  v11 = v10;
  if (a4 == 1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromBKSHIDTouchSensitiveButtonIdentifier();
      *(_DWORD *)buf = 67109634;
      int v21 = v7;
      __int16 v22 = 2114;
      id v23 = v12;
      __int16 v24 = 1024;
      int v25 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setScanningActive:%{BOOL}u button:%{public}@ pid:%d", buf, 0x18u);
    }
    if (v7 && !self->_lock_activeCameraButtonScanningPIDs)
    {
      id v13 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
      lock_activeCameraButtonScanningPIDs = self->_lock_activeCameraButtonScanningPIDs;
      self->_lock_activeCameraButtonScanningPIDs = v13;

      uint64_t v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lock_pidToProcessDeathWatcher = self->_lock_pidToProcessDeathWatcher;
      self->_lock_pidToProcessDeathWatcher = v15;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002AAF4;
    v17[3] = &unk_1000F64F0;
    BOOL v19 = v7;
    v17[4] = self;
    int v18 = a5;
    sub_10002A0CC((uint64_t)self, v17);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "setScanningActive: unsupported touch button identifier: %d", buf, 8u);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (BKHIDTouchSensitiveButtonScanningController)initWithContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKHIDTouchSensitiveButtonScanningController;
  id v5 = [(BKHIDTouchSensitiveButtonScanningController *)&v15 init];
  id v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = BSDispatchQueueCreateWithQualityOfService();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc((Class)BKIOHIDServiceMatcher);
    int64_t v10 = [v4 serviceMatcherDataProvider];
    v11 = (BKIOHIDServiceMatcher *)[v9 initWithUsagePage:65280 usage:102 builtIn:1 dataProvider:v10];
    serviceMatcher = v6->_serviceMatcher;
    v6->_serviceMatcher = v11;

    [(BKIOHIDServiceMatcher *)v6->_serviceMatcher startObserving:v6 queue:v6->_queue];
    id v13 = +[BKIOHIDServicePersistentPropertyController touchSensitiveButtonServicePersistentPropertyController];
    [v13 registerHandler:v6];
  }
  return v6;
}

@end