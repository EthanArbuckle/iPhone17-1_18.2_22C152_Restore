@interface FMDBluetoothManager
- (BOOL)isDiscoveryActive;
- (FMDBluetoothDiscoveryCoordinator)discoveryCoordinator;
- (FMDBluetoothFrameworkBTManaging)mockBluetoothManager;
- (FMDBluetoothManager)init;
- (FMDBluetoothManager)initWithMockBluetoothManager:(id)a3;
- (FMDBluetoothManagerDelegate)delegate;
- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry;
- (FMQueueSynchronizer)bluetoothManagerQueueSynchronizer;
- (NSMutableDictionary)bluetoothManagerDevicesByAddress;
- (OS_dispatch_queue)accessoriesQueue;
- (OS_dispatch_queue)bluetoothDiscoveryQueue;
- (OS_dispatch_queue)bluetoothManagerQueue;
- (id)_bluetoothManagerDeviceForBluetoothDevice:(id)a3;
- (id)bluetoothDeviceForBLEDevice:(id)a3;
- (id)bluetoothManager;
- (id)bluetoothManagerDeviceForBluetoothDevice:(id)a3;
- (id)newDiscovery;
- (int64_t)profileForBluetoothManagerDevice:(id)a3;
- (void)addDeviceNotification:(id)a3;
- (void)connectToDeviceAddress:(id)a3;
- (void)deviceNameChanged:(id)a3;
- (void)didDiscoverDevice:(id)a3;
- (void)didLoseDevice:(id)a3;
- (void)getAccessoriesWithCompletion:(id)a3;
- (void)removeDeviceNotification:(id)a3;
- (void)setAccessoriesQueue:(id)a3;
- (void)setAllAudioChannelsActive:(BOOL)a3;
- (void)setBluetoothDiscoveryQueue:(id)a3;
- (void)setBluetoothManagerDevicesByAddress:(id)a3;
- (void)setBluetoothManagerQueue:(id)a3;
- (void)setBluetoothManagerQueueSynchronizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryCoordinator:(id)a3;
- (void)setInternalDeviceAudioChannels:(id)a3 profile:(int64_t)a4 active:(BOOL)a5;
- (void)setMockBluetoothManager:(id)a3;
- (void)setSupportedAccessoryRegistry:(id)a3;
- (void)setupDiscovery;
- (void)startMonitoringDevices;
- (void)updateBeaconsWithDevice:(id)a3 active:(BOOL)a4;
@end

@implementation FMDBluetoothManager

- (FMDBluetoothManager)init
{
  return [(FMDBluetoothManager *)self initWithMockBluetoothManager:0];
}

- (FMDBluetoothManager)initWithMockBluetoothManager:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDBluetoothManager;
  v5 = [(FMDBluetoothManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    [(FMDBluetoothManager *)v5 setMockBluetoothManager:v4];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.findmydeviced.bluetoothdiscoveryqueue", 0);
    [(FMDBluetoothManager *)v6 setBluetoothDiscoveryQueue:v7];

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.icloud.findmydeviced.bluetoothManagerQueue", 0);
    [(FMDBluetoothManager *)v6 setBluetoothManagerQueue:v8];

    id v9 = objc_alloc((Class)FMQueueSynchronizer);
    v10 = [(FMDBluetoothManager *)v6 bluetoothManagerQueue];
    id v11 = [v9 initWithQueue:v10];
    [(FMDBluetoothManager *)v6 setBluetoothManagerQueueSynchronizer:v11];

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.icloud.findmydeviced.bluetoothManagerAccessoriesQueue", 0);
    [(FMDBluetoothManager *)v6 setAccessoriesQueue:v12];

    v13 = +[NSMutableDictionary dictionary];
    [(FMDBluetoothManager *)v6 setBluetoothManagerDevicesByAddress:v13];

    [(FMDBluetoothManager *)v6 setupDiscovery];
    [(FMDBluetoothManager *)v6 startMonitoringDevices];
    v14 = [(FMDBluetoothManager *)v6 bluetoothManager];
    v15 = sub_100004238();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMDBluetoothManager starting BluetoothManager %@", buf, 0xCu);
    }

    v16 = sub_100004238();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMDBluetoothManager initialized", buf, 2u);
    }
  }
  return v6;
}

- (void)connectToDeviceAddress:(id)a3
{
  id v4 = a3;
  v5 = [(FMDBluetoothManager *)self bluetoothManager];
  v6 = [(FMDBluetoothManager *)self bluetoothManagerQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100060B1C;
  v9[3] = &unk_1002D93F0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (id)newDiscovery
{
  v2 = [(FMDBluetoothManager *)self discoveryCoordinator];
  id v3 = [v2 newDiscovery];

  return v3;
}

- (BOOL)isDiscoveryActive
{
  v2 = [(FMDBluetoothManager *)self discoveryCoordinator];
  unsigned __int8 v3 = [v2 isDiscoveryActive];

  return v3;
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FMDBluetoothManager *)self bluetoothManager];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100060CD4;
  v17[4] = sub_100060CE4;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v6 = [(FMDBluetoothManager *)self bluetoothManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060F74;
  block[3] = &unk_1002DB878;
  v13 = v15;
  v14 = v17;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

- (void)startMonitoringDevices
{
  unsigned __int8 v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BluetoothManager startWatchingForDevices", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"deviceNameChanged:" name:BluetoothMagicPairedDeviceNameChangedNotification object:0];
  [v4 addObserver:self selector:"addDeviceNotification:" name:BluetoothDeviceConnectSuccessNotification object:0];
  [v4 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
}

- (void)deviceNameChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  unsigned __int8 v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___FMDBluetoothFrameworkDevice];

  if (v6)
  {
    id v7 = [v4 object];
    id v8 = [v7 copy];

    if ([v8 isTemporaryPaired])
    {
      id v9 = sub_100004238();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BluetoothMagicPairedDeviceNameChangedNotification ignoring temporary device", buf, 2u);
      }
    }
    else
    {
      id v10 = [(FMDBluetoothManager *)self bluetoothManagerDeviceForBluetoothDevice:v8];
      id v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BluetoothManager deviceNameChanged %@", buf, 0xCu);
      }

      [(FMDBluetoothManager *)self delegate];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000619B8;
      v13[3] = &unk_1002D93F0;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = v10;
      id v12 = v10;
      id v9 = v14;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
  else
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10023FA9C();
    }
  }
}

- (void)addDeviceNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  unsigned __int8 v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___FMDBluetoothFrameworkDevice];

  if (v6)
  {
    id v7 = [v4 object];
    id v8 = [v7 copy];

    if ([v8 isTemporaryPaired])
    {
      id v9 = sub_100004238();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BluetoothDeviceConnectSuccessNotification ignoring temporary device", buf, 2u);
      }
    }
    else
    {
      id v9 = [v8 address];
      id v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BluetoothManager addDeviceNotification %@", buf, 0xCu);
      }

      id v11 = [(FMDBluetoothManager *)self bluetoothManagerDeviceForBluetoothDevice:v8];
      id v12 = [(FMDBluetoothManager *)self delegate];
      v13 = sub_100004238();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BluetoothManager notifying delegate bluetoothManagerDidConnectDevice %@", buf, 0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100061C48;
      v16[3] = &unk_1002D93F0;
      v17 = v12;
      id v18 = v11;
      id v14 = v11;
      id v15 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
    }
  }
  else
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10023FAD0();
    }
  }
}

- (void)removeDeviceNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  unsigned __int8 v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___FMDBluetoothFrameworkDevice];

  if (v6)
  {
    id v7 = [v4 object];
    id v8 = [v7 copy];

    if ([v8 isTemporaryPaired])
    {
      id v9 = sub_100004238();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BluetoothDeviceDisconnectSuccessNotification ignoring temporary device", buf, 2u);
      }
    }
    else
    {
      id v9 = [v8 address];
      id v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BluetoothManager removeDeviceNotification %@", buf, 0xCu);
      }

      id v11 = [(FMDBluetoothManager *)self bluetoothManagerDeviceForBluetoothDevice:v8];
      id v12 = [(FMDBluetoothManager *)self delegate];
      v13 = sub_100004238();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BluetoothManager notifying delegate bluetoothManagerDidDisconnectDevice %@", buf, 0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100061ED8;
      v16[3] = &unk_1002D93F0;
      v17 = v12;
      id v18 = v11;
      id v14 = v11;
      id v15 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
    }
  }
  else
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10023FB04();
    }
  }
}

- (void)setupDiscovery
{
  unsigned __int8 v3 = objc_alloc_init(FMDBluetoothDiscoveryXPCProxy);
  id v4 = [[FMDBluetoothDiscoveryCoordinator alloc] initWithDiscovery:v3];
  [(FMDBluetoothManager *)self setDiscoveryCoordinator:v4];

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100062188;
  void v15[3] = &unk_1002DB8A0;
  objc_copyWeak(&v16, &location);
  v5 = [(FMDBluetoothManager *)self discoveryCoordinator];
  [v5 setDidDiscoverDevice:v15];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000622F8;
  v13[3] = &unk_1002DB8A0;
  objc_copyWeak(&v14, &location);
  unsigned __int8 v6 = [(FMDBluetoothManager *)self discoveryCoordinator];
  [v6 setDidLoseDevice:v13];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100062468;
  v11[3] = &unk_1002DB8C8;
  objc_copyWeak(&v12, &location);
  id v7 = [(FMDBluetoothManager *)self discoveryCoordinator];
  [v7 setDidEndDiscovery:v11];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006257C;
  v9[3] = &unk_1002D93C8;
  objc_copyWeak(&v10, &location);
  id v8 = [(FMDBluetoothManager *)self discoveryCoordinator];
  [v8 setDidStartDiscovery:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)setAllAudioChannelsActive:(BOOL)a3
{
  v5 = [(FMDBluetoothManager *)self bluetoothDiscoveryQueue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = [(FMDBluetoothManager *)self bluetoothManagerDevicesByAddress];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062740;
  v7[3] = &unk_1002DB8F0;
  v7[4] = self;
  BOOL v8 = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)setInternalDeviceAudioChannels:(id)a3 profile:(int64_t)a4 active:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(FMDBluetoothManager *)self bluetoothDiscoveryQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(FMDBluetoothManager *)self supportedAccessoryRegistry];
  id v11 = [v10 channelNamesForProfile:a4];

  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100062964;
  v19 = &unk_1002DB918;
  BOOL v21 = a5;
  id v12 = v8;
  id v20 = v12;
  [v11 enumerateObjectsUsingBlock:&v16];
  v13 = sub_100004238();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = self;
    *(_DWORD *)buf = 134217984;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BluetoothManager setInternalDeviceAudioChannels FMDInternalBluetoothManagerDevice(0x%lX)", buf, 0xCu);
  }
  id v15 = [(FMDBluetoothManager *)self delegate];
  [v15 bluetoothManagerDidUpdateDevice:v12];
}

- (void)didDiscoverDevice:(id)a3
{
}

- (void)didLoseDevice:(id)a3
{
}

- (void)updateBeaconsWithDevice:(id)a3 active:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(FMDBluetoothManager *)self bluetoothDiscoveryQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(FMDBluetoothManager *)self bluetoothDeviceForBLEDevice:v6];
  id v9 = [(FMDBluetoothManager *)self _bluetoothManagerDeviceForBluetoothDevice:v8];
  id v10 = [v9 bluetoothDevice];
  int64_t v11 = [(FMDBluetoothManager *)self profileForBluetoothManagerDevice:v10];

  id v12 = +[FMDBLEAudioAdvertisementParser configurationDictWithBleDevice:v6 supportedAccessoryProfile:v11];

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_100062B4C;
  id v18 = &unk_1002DB940;
  BOOL v20 = a4;
  id v19 = v9;
  id v13 = v9;
  [v12 enumerateKeysAndObjectsUsingBlock:&v15];
  id v14 = [(FMDBluetoothManager *)self delegate];
  [v14 bluetoothManagerDidUpdateDevice:v13];
}

- (id)bluetoothDeviceForBLEDevice:(id)a3
{
  id v4 = a3;
  v5 = [(FMDBluetoothManager *)self bluetoothManager];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100060CD4;
  id v19 = sub_100060CE4;
  id v20 = 0;
  id v6 = [(FMDBluetoothManager *)self bluetoothManagerQueueSynchronizer];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100062D68;
  v11[3] = &unk_1002D9508;
  id v7 = v4;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v6 conditionalSync:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)bluetoothManager
{
  unsigned __int8 v3 = [(FMDBluetoothManager *)self mockBluetoothManager];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(FMDBluetoothManager *)self bluetoothManagerQueue];
    id v5 = +[FMDBluetoothFrameworkBTManagingFactory bluetoothManagerWithQueue:v6 delegate:self];
  }

  return v5;
}

- (id)bluetoothManagerDeviceForBluetoothDevice:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100060CD4;
  uint64_t v16 = sub_100060CE4;
  id v17 = 0;
  id v5 = [(FMDBluetoothManager *)self bluetoothDiscoveryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063170;
  block[3] = &unk_1002D9990;
  id v10 = v4;
  int64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_bluetoothManagerDeviceForBluetoothDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDBluetoothManager *)self bluetoothDiscoveryQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(FMDBluetoothManager *)self profileForBluetoothManagerDevice:v4];
  id v7 = [v4 address];
  if (!v7
    || ([(FMDBluetoothManager *)self bluetoothManagerDevicesByAddress],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 objectForKeyedSubscript:v7],
        id v9 = (FMDInternalBluetoothManagerDevice *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    id v9 = objc_alloc_init(FMDInternalBluetoothManagerDevice);
    [(FMDBluetoothManager *)self setInternalDeviceAudioChannels:v9 profile:v6 active:0];
    if (v7)
    {
      id v10 = [(FMDBluetoothManager *)self bluetoothManagerDevicesByAddress];
      [v10 setObject:v9 forKey:v7];
    }
  }
  [(FMDInternalBluetoothManagerDevice *)v9 setBluetoothDevice:v4];
  int64_t v11 = [(FMDBluetoothManager *)self supportedAccessoryRegistry];
  uint64_t v12 = [v11 advertisementStatusKeyForProfile:v6];
  [(FMDInternalBluetoothManagerDevice *)v9 setAdvertisementStatusKey:v12];

  return v9;
}

- (int64_t)profileForBluetoothManagerDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)FMDAccessoryIdentifier);
  int64_t v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 vendorId]);
  id v7 = [v4 productId];

  id v8 = +[NSNumber numberWithUnsignedInt:v7];
  id v9 = [v5 initWithDeviceVendor:v6 deviceProductId:v8];

  id v10 = [(FMDBluetoothManager *)self supportedAccessoryRegistry];
  id v11 = [v10 profileForAccessoryIdentifier:v9];

  return (int64_t)v11;
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  return self->_supportedAccessoryRegistry;
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
}

- (FMDBluetoothManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDBluetoothManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)bluetoothDiscoveryQueue
{
  return self->_bluetoothDiscoveryQueue;
}

- (void)setBluetoothDiscoveryQueue:(id)a3
{
}

- (OS_dispatch_queue)bluetoothManagerQueue
{
  return self->_bluetoothManagerQueue;
}

- (void)setBluetoothManagerQueue:(id)a3
{
}

- (OS_dispatch_queue)accessoriesQueue
{
  return self->_accessoriesQueue;
}

- (void)setAccessoriesQueue:(id)a3
{
}

- (FMDBluetoothDiscoveryCoordinator)discoveryCoordinator
{
  return self->_discoveryCoordinator;
}

- (void)setDiscoveryCoordinator:(id)a3
{
}

- (NSMutableDictionary)bluetoothManagerDevicesByAddress
{
  return self->_bluetoothManagerDevicesByAddress;
}

- (void)setBluetoothManagerDevicesByAddress:(id)a3
{
}

- (FMDBluetoothFrameworkBTManaging)mockBluetoothManager
{
  return self->_mockBluetoothManager;
}

- (void)setMockBluetoothManager:(id)a3
{
}

- (FMQueueSynchronizer)bluetoothManagerQueueSynchronizer
{
  return self->_bluetoothManagerQueueSynchronizer;
}

- (void)setBluetoothManagerQueueSynchronizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothManagerQueueSynchronizer, 0);
  objc_storeStrong((id *)&self->_mockBluetoothManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerDevicesByAddress, 0);
  objc_storeStrong((id *)&self->_discoveryCoordinator, 0);
  objc_storeStrong((id *)&self->_accessoriesQueue, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerQueue, 0);
  objc_storeStrong((id *)&self->_bluetoothDiscoveryQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_supportedAccessoryRegistry, 0);
}

@end