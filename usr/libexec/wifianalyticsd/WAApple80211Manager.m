@interface WAApple80211Manager
+ (id)sharedObject;
- (NSMutableDictionary)interfaceNameToApple80211InstanceMap;
- (NSString)infraInterfaceName;
- (OS_dispatch_queue)serialQueue;
- (WAApple80211Manager)init;
- (id)_getInfraApple80211;
- (id)getInfraApple80211;
- (void)setInfraInterfaceName:(id)a3;
- (void)setInterfaceNameToApple80211InstanceMap:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation WAApple80211Manager

+ (id)sharedObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C214;
  block[3] = &unk_1000D0CF8;
  block[4] = a1;
  if (qword_1000F0FA0 != -1) {
    dispatch_once(&qword_1000F0FA0, block);
  }
  v2 = (void *)qword_1000F0F98;

  return v2;
}

- (WAApple80211Manager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WAApple80211Manager;
  v2 = [(WAApple80211Manager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    interfaceNameToApple80211InstanceMap = v2->_interfaceNameToApple80211InstanceMap;
    v2->_interfaceNameToApple80211InstanceMap = v3;

    dispatch_queue_t v5 = dispatch_queue_create("WAApple80211ManagerQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }
  else
  {
    serialQueue = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(serialQueue, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "-[WAApple80211Manager init]";
      __int16 v11 = 1024;
      int v12 = 51;
      _os_log_impl((void *)&_mh_execute_header, serialQueue, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
    }
  }

  return v2;
}

- (id)getInfraApple80211
{
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = sub_10002C488;
  int v12 = sub_10002C498;
  id v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C4A0;
  block[3] = &unk_1000D0D48;
  objc_copyWeak(&v7, &location);
  block[4] = &v8;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);

  return v4;
}

- (id)_getInfraApple80211
{
  if (self->_infraInterfaceName)
  {
    interfaceNameToApple80211InstanceMap = self->_interfaceNameToApple80211InstanceMap;
    if (interfaceNameToApple80211InstanceMap)
    {
      uint64_t v4 = -[NSMutableDictionary objectForKey:](interfaceNameToApple80211InstanceMap, "objectForKey:");
      if (v4)
      {
        id v7 = (void *)v4;
        goto LABEL_10;
      }
    }
  }
  dispatch_queue_t v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136446466;
    v21 = "-[WAApple80211Manager _getInfraApple80211]";
    __int16 v22 = 1024;
    int v23 = 78;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding interface name and alloc WAApple80211", (uint8_t *)&v20, 0x12u);
  }

  id v6 = [[WAApple80211 alloc] initByFindingInterfaceName];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 ifName];
    infraInterfaceName = self->_infraInterfaceName;
    self->_infraInterfaceName = v8;

    uint64_t v10 = self->_infraInterfaceName;
    if (v10 && [(NSString *)v10 length])
    {
      [(NSMutableDictionary *)self->_interfaceNameToApple80211InstanceMap setObject:v7 forKey:self->_infraInterfaceName];
      goto LABEL_10;
    }
    id v13 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v20 = 136446466;
    v21 = "-[WAApple80211Manager _getInfraApple80211]";
    __int16 v22 = 1024;
    int v23 = 84;
    v14 = "%{public}s::%d:WAApple80211 bad infraInterfaceName";
    goto LABEL_17;
  }
  id v13 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136446466;
    v21 = "-[WAApple80211Manager _getInfraApple80211]";
    __int16 v22 = 1024;
    int v23 = 81;
    v14 = "%{public}s::%d:WAApple80211 initByFindingInterfaceName failed";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v20, 0x12u);
  }
LABEL_18:

  v15 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136446466;
    v21 = "-[WAApple80211Manager _getInfraApple80211]";
    __int16 v22 = 1024;
    int v23 = 91;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create WAApple80211", (uint8_t *)&v20, 0x12u);
  }

  if (self->_infraInterfaceName)
  {
    v16 = self->_interfaceNameToApple80211InstanceMap;
    if (v16)
    {
      v17 = -[NSMutableDictionary objectForKey:](v16, "objectForKey:");

      if (v17)
      {
        v18 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136446466;
          v21 = "-[WAApple80211Manager _getInfraApple80211]";
          __int16 v22 = 1024;
          int v23 = 97;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:Removing existing entry in interface map", (uint8_t *)&v20, 0x12u);
        }

        [(NSMutableDictionary *)self->_interfaceNameToApple80211InstanceMap removeObjectForKey:self->_infraInterfaceName];
      }
    }
  }
  v19 = self->_infraInterfaceName;
  self->_infraInterfaceName = 0;

  id v7 = 0;
LABEL_10:
  id v11 = v7;

  return v11;
}

- (NSMutableDictionary)interfaceNameToApple80211InstanceMap
{
  return self->_interfaceNameToApple80211InstanceMap;
}

- (void)setInterfaceNameToApple80211InstanceMap:(id)a3
{
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_infraInterfaceName, 0);

  objc_storeStrong((id *)&self->_interfaceNameToApple80211InstanceMap, 0);
}

@end