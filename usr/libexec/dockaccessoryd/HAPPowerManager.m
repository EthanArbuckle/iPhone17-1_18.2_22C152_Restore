@interface HAPPowerManager
+ (id)logCategory;
+ (id)sharedInstance;
- (HAPPowerManager)init;
- (IONotificationPort)systemPowerPort;
- (NSMapTable)delegatesMap;
- (unsigned)systemPowerMgr;
- (unsigned)systemPowerNotifier;
- (void)deRegisterFromSleepWake:(id)a3;
- (void)dealloc;
- (void)registerForSleepWake:(id)a3 queue:(id)a4;
- (void)setDelegatesMap:(id)a3;
- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4;
@end

@implementation HAPPowerManager

+ (id)sharedInstance
{
  if (qword_1002AD6D8 != -1) {
    dispatch_once(&qword_1002AD6D8, &stru_100274308);
  }
  v2 = (void *)qword_1002AD6D0;

  return v2;
}

- (HAPPowerManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)HAPPowerManager;
  id v2 = [(HAPPowerManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("HAPPowerManager", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    uint64_t v6 = +[NSMapTable weakToWeakObjectsMapTable];
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    io_connect_t v8 = IORegisterForSystemPower(v2, (IONotificationPortRef *)v2 + 3, (IOServiceInterestCallback)j__objc_msgSend_systemPowerChanged_notificationID_, (io_object_t *)v2 + 5);
    *((_DWORD *)v2 + 4) = v8;
    if (v8)
    {
      IONotificationPortSetDispatchQueue((IONotificationPortRef)[v2 systemPowerPort], *((dispatch_queue_t *)v2 + 1));
    }
    else
    {
      id v9 = v2;
      v10 = sub_100083F74();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sub_100083FD0(v9);
        *(_DWORD *)buf = 138543362;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Error registering for system power", buf, 0xCu);
      }
    }
  }
  v12 = (HAPPowerManager *)v2;
  v13 = sub_100083F74();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = sub_100083FD0(v12);
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Initialized Power Manager.", buf, 0xCu);
  }
  return v12;
}

- (void)dealloc
{
  kern_return_t v11;
  kern_return_t v12;
  HAPPowerManager *v13;
  NSObject *v14;
  void *v15;
  HAPPowerManager *v16;
  NSObject *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  IOReturn v23;

  p_systemPowerNotifier = &self->_systemPowerNotifier;
  if (self->_systemPowerNotifier)
  {
    IOReturn v4 = IODeregisterForSystemPower(&self->_systemPowerNotifier);
    if (v4)
    {
      IOReturn v5 = v4;
      uint64_t v6 = self;
      v7 = sub_100083F74();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        io_connect_t v8 = sub_100083FD0(v6);
        *(_DWORD *)buf = 138543618;
        v21 = v8;
        v22 = 1024;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to deregister from system power with error: %d", buf, 0x12u);
      }
    }
    unsigned int *p_systemPowerNotifier = 0;
  }
  systemPowerPort = self->_systemPowerPort;
  if (systemPowerPort)
  {
    IONotificationPortDestroy(systemPowerPort);
    self->_systemPowerPort = 0;
  }
  io_connect_t systemPowerMgr = self->_systemPowerMgr;
  if (systemPowerMgr)
  {
    v11 = IOServiceClose(systemPowerMgr);
    if (v11)
    {
      v12 = v11;
      v13 = self;
      v14 = sub_100083F74();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = sub_100083FD0(v13);
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 1024;
        v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to close power IO Service with error: %d", buf, 0x12u);
      }
    }
    self->_io_connect_t systemPowerMgr = 0;
  }
  objc_super v16 = self;
  v17 = sub_100083F74();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = sub_100083FD0(v16);
    *(_DWORD *)buf = 138543362;
    v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Deallocating Power Manager", buf, 0xCu);
  }
  v19.receiver = v16;
  v19.super_class = (Class)HAPPowerManager;
  [(HAPPowerManager *)&v19 dealloc];
}

- (void)registerForSleepWake:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080D6C;
  block[3] = &unk_100273418;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)deRegisterFromSleepWake:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100080E74;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = self;
  id v7 = sub_100083F74();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = sub_100083FD0(v6);
    id v9 = sub_1000811BC(v5);
    *(_DWORD *)buf = 138543618;
    v30 = v8;
    __int16 v31 = 2112;
    v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@System power changed: %@", buf, 0x16u);
  }
  switch(v5)
  {
    case 0xE0000270:
      goto LABEL_14;
    case 0xE0000320:
      uint64_t v10 = 2;
      [(HAPPowerManager *)v6 delegatesMap];
      break;
    case 0xE0000280:
      uint64_t v10 = 1;
      [(HAPPowerManager *)v6 delegatesMap];
      break;
    default:
      return;
  v11 = };
  id v12 = [v11 keyEnumerator];

  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      v15 = [(HAPPowerManager *)v6 delegatesMap];
      objc_super v16 = [v15 objectForKey:v14];

      if (v16)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10008123C;
        block[3] = &unk_100274330;
        id v27 = v14;
        uint64_t v28 = v10;
        dispatch_async(v16, block);
      }
      uint64_t v17 = [v12 nextObject];

      v14 = (void *)v17;
    }
    while (v17);
  }

  a4 = v25;
  if (v24)
  {
LABEL_14:
    IOReturn v18 = IOAllowPowerChange([(HAPPowerManager *)v6 systemPowerMgr], (intptr_t)a4);
    if (v18)
    {
      IOReturn v19 = v18;
      v20 = v6;
      v21 = sub_100083F74();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = sub_100083FD0(v20);
        v23 = sub_1000811BC(v5);
        *(_DWORD *)buf = 138543874;
        v30 = v22;
        __int16 v31 = 2112;
        v32 = v23;
        __int16 v33 = 1024;
        IOReturn v34 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Falied to allow for %@ with error: %d", buf, 0x1Cu);
      }
    }
  }
}

+ (id)logCategory
{
  if (qword_1002AD6E0 != -1) {
    dispatch_once(&qword_1002AD6E0, &stru_100274350);
  }
  id v2 = (void *)qword_1002AD6E8;

  return v2;
}

- (unsigned)systemPowerMgr
{
  return self->_systemPowerMgr;
}

- (IONotificationPort)systemPowerPort
{
  return self->_systemPowerPort;
}

- (unsigned)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (NSMapTable)delegatesMap
{
  return self->_delegatesMap;
}

- (void)setDelegatesMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesMap, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end