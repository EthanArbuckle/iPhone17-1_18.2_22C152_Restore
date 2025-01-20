@interface FMDExtAccessoryManager
- (FMDAccessoryRegistry)accessoryRegistry;
- (FMDExtAccessoryManager)init;
- (FMDExtExtensionsDataSource)extensionManager;
- (NSMutableDictionary)accessoriesByExtension;
- (NSMutableSet)extensionsAlreadySynced;
- (OS_dispatch_queue)serialQueue;
- (id)_allAccessories;
- (void)configurationUpdated:(id)a3;
- (void)getAccessoriesWithCompletion:(id)a3;
- (void)setAccessoriesByExtension:(id)a3;
- (void)setAccessoryRegistry:(id)a3;
- (void)setExtensionManager:(id)a3;
- (void)setExtensionsAlreadySynced:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)startMonitoringAccessories;
- (void)supportedAccessoryTypesUpdated;
- (void)updateAccessoriesDatabaseWithContext:(id)a3;
- (void)updateAccessory:(id)a3;
- (void)updateNotificationReceived:(id)a3;
@end

@implementation FMDExtAccessoryManager

- (FMDExtAccessoryManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)FMDExtAccessoryManager;
  v2 = [(FMDExtAccessoryManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDExtAccessoryManager.serialQueue", 0);
    [(FMDExtAccessoryManager *)v2 setSerialQueue:v3];

    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(FMDExtAccessoryManager *)v2 setAccessoriesByExtension:v4];

    v5 = +[FMDExtExtensionsDataSource sharedInstance];
    [(FMDExtAccessoryManager *)v2 setExtensionManager:v5];

    id v6 = objc_alloc_init((Class)NSMutableSet);
    [(FMDExtAccessoryManager *)v2 setExtensionsAlreadySynced:v6];

    v7 = +[FMDExtConfigurationRegistry sharedInstance];
    [v7 setListner:v2];

    CFStringRef v11 = @"context";
    CFStringRef v12 = @"daemonLaunch";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [(FMDExtAccessoryManager *)v2 updateAccessoriesDatabaseWithContext:v8];

    [(FMDExtAccessoryManager *)v2 startMonitoringAccessories];
  }
  return v2;
}

- (void)startMonitoringAccessories
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:BluetoothMagicPairedDeviceNameChangedNotification object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:BluetoothDeviceConnectSuccessNotification object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:@"FMIPDeviceDidPairBluetoothDevice" object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:@"com.apple.icloud.findmydeviced.findkit.magSafe.added" object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:@"com.apple.icloud.findmydeviced.findkit.magSafe.removed" object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:@"com.apple.icloud.findmydeviced.findkit.magSafe.attach" object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:@"com.apple.icloud.findmydeviced.findkit.magSafe.detach" object:0];
  [v3 addObserver:self selector:"updateNotificationReceived:" name:@"com.apple.accessories.connection.MFi4AccessoryDisconnected" object:0];
}

- (void)updateNotificationReceived:(id)a3
{
  id v4 = a3;
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory Information changed notification received = %@", buf, 0xCu);
  }

  id v6 = +[NSDate date];
  v7 = v6;
  if (qword_10031EB50 && (objc_msgSend(v6, "timeIntervalSinceDate:"), v8 < 1.0))
  {
    v9 = sub_100059878();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v7 timeIntervalSinceDate:qword_10031EB50];
      *(_DWORD *)buf = 134217984;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not updating because time between this and last = %f < 1", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)&qword_10031EB50, v7);
    v9 = [v4 name:@"context" notificationName:@"receivedNotificaiton"];
    v13[1] = v9;
    CFStringRef v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:2];
    [(FMDExtAccessoryManager *)self updateAccessoriesDatabaseWithContext:v11];
  }
}

- (void)updateAccessoriesDatabaseWithContext:(id)a3
{
  id v17 = a3;
  id v3 = sub_100059878();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "updateAccessoriesDatabase called with context %@", buf, 0xCu);
  }

  id v4 = +[FMDSystemConfig sharedInstance];
  id v5 = [v4 unlockState];

  if (v5 == (id)1)
  {
    id v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDExtAccessoryManager skipping updateAccessoriesDatabase before first unlock", buf, 2u);
    }
  }
  else
  {
    v7 = +[FMDExtExtensionHelper getAllExtensions];
    double v8 = sub_100059878();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "extension IDList = %@", buf, 0xCu);
    }

    v9 = [(FMDExtAccessoryManager *)self accessoryRegistry];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v7;
    id v10 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v6);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v15 = +[FMDExtExtensionHelper getAccessoryProxyForId:v14 withDelegate:0];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100089768;
          v18[3] = &unk_1002DC2D0;
          v18[4] = v14;
          v18[5] = self;
          id v19 = v9;
          [v15 fetchAllAccessoriesInfoWithInfo:v17 withCompletion:v18];
        }
        id v11 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (void)updateAccessory:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008A3F0;
  v7[3] = &unk_1002D93F0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_allAccessories
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10008AED8;
  id v11 = sub_10008AEE8;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [(FMDExtAccessoryManager *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008AEF0;
  v6[3] = &unk_1002DA4D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSArray);
  id v6 = [(FMDExtAccessoryManager *)self _allAccessories];
  id v7 = [v5 initWithArray:v6 copyItems:1];

  id v8 = [(FMDExtAccessoryManager *)self serialQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008B124;
  v11[3] = &unk_1002DA108;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, v11);
}

- (void)configurationUpdated:(id)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v6 = [(FMDExtAccessoryManager *)self _allAccessories];
        id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
              id v12 = [v11 accessoryType];
              unsigned int v13 = [v12 isEqualToString:v5];

              if (v13) {
                [(FMDExtAccessoryManager *)self updateAccessory:v11];
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v8);
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)supportedAccessoryTypesUpdated
{
  CFStringRef v4 = @"context";
  CFStringRef v5 = @"supportedAccessoryTypesUpdated";
  id v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [(FMDExtAccessoryManager *)self updateAccessoriesDatabaseWithContext:v3];
}

- (FMDAccessoryRegistry)accessoryRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryRegistry);

  return (FMDAccessoryRegistry *)WeakRetained;
}

- (void)setAccessoryRegistry:(id)a3
{
}

- (NSMutableDictionary)accessoriesByExtension
{
  return self->_accessoriesByExtension;
}

- (void)setAccessoriesByExtension:(id)a3
{
}

- (FMDExtExtensionsDataSource)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableSet)extensionsAlreadySynced
{
  return self->_extensionsAlreadySynced;
}

- (void)setExtensionsAlreadySynced:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionsAlreadySynced, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_accessoriesByExtension, 0);

  objc_destroyWeak((id *)&self->_accessoryRegistry);
}

@end