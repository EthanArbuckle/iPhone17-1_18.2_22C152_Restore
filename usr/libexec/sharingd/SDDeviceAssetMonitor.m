@interface SDDeviceAssetMonitor
+ (SDDeviceAssetMonitor)sharedAssetMonitor;
- (NSString)state;
- (SDDeviceAssetMonitor)init;
- (id)queryForBluetoothDevice:(id)a3;
- (os_state_data_s)stateDump;
- (void)activateIfReady;
- (void)addObservers;
- (void)bluetoothDevicePaired:(id)a3;
- (void)bluetoothDeviceUnpaired:(id)a3;
- (void)downloadAssetsForQuery:(id)a3;
- (void)setUpBluetoothDeviceMonitor;
- (void)triggerAssetCleanupWithBluetoothDeviceRemoved:(id)a3;
@end

@implementation SDDeviceAssetMonitor

+ (SDDeviceAssetMonitor)sharedAssetMonitor
{
  if (qword_10097FB80 != -1) {
    dispatch_once(&qword_10097FB80, &stru_1008CAA78);
  }
  v2 = (void *)qword_10097FB78;

  return (SDDeviceAssetMonitor *)v2;
}

- (SDDeviceAssetMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)SDDeviceAssetMonitor;
  v2 = [(SDDeviceAssetMonitor *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tasks = v2->_tasks;
    v2->_tasks = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    bluetoothDevices = v2->_bluetoothDevices;
    v2->_bluetoothDevices = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    deviceAssetManager = v2->_deviceAssetManager;
    v2->_deviceAssetManager = (SFDeviceAssetManager *)v7;

    uint64_t v9 = objc_opt_new();
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = (CUSystemMonitor *)v9;

    [(SDDeviceAssetMonitor *)v2 addObservers];
  }
  return v2;
}

- (void)activateIfReady
{
  uint64_t v3 = asset_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[SDDeviceAssetMonitor activateIfReady]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }

  if (!self->_activated)
  {
    if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
    {
      self->_activated = 1;
      [(SFDeviceAssetManager *)self->_deviceAssetManager activate];
      [(SDDeviceAssetMonitor *)self setUpBluetoothDeviceMonitor];
      [(CUSystemMonitor *)self->_systemMonitor invalidate];
      systemMonitor = self->_systemMonitor;
      self->_systemMonitor = 0;
    }
  }
}

- (void)addObservers
{
  location[1] = _NSConcreteStackBlock;
  location[2] = (id)3221225472;
  location[3] = sub_10004C518;
  location[4] = &unk_1008CAAA0;
  location[5] = self;
  self->_stateHandle = os_state_add_handler();
  location[0] = 0;
  objc_initWeak(location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004C520;
  v6[3] = &unk_1008CA3B0;
  objc_copyWeak(&v7, location);
  [(CUSystemMonitor *)self->_systemMonitor setFirstUnlockHandler:v6];
  systemMonitor = self->_systemMonitor;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004C560;
  v4[3] = &unk_1008CA3B0;
  objc_copyWeak(&v5, location);
  [(CUSystemMonitor *)systemMonitor activateWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(location);
}

- (void)setUpBluetoothDeviceMonitor
{
  uint64_t v3 = (CUBluetoothClient *)objc_opt_new();
  bluetoothClient = self->_bluetoothClient;
  self->_bluetoothClient = v3;

  [(CUBluetoothClient *)self->_bluetoothClient setFlags:1];
  id location = 0;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C70C;
  v7[3] = &unk_1008CAAC8;
  objc_copyWeak(&v8, &location);
  [(CUBluetoothClient *)self->_bluetoothClient setDevicePairedHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004C768;
  v5[3] = &unk_1008CAAC8;
  objc_copyWeak(&v6, &location);
  [(CUBluetoothClient *)self->_bluetoothClient setDeviceUnpairedHandler:v5];
  [(CUBluetoothClient *)self->_bluetoothClient activate];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)queryForBluetoothDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)SFDeviceAssetQuery);
  uint64_t v5 = [v3 productIdentifier];
  signed int v6 = [v3 colorCode];

  id v7 = [v4 initWithBluetoothProductIdentifier:v5 color:v6];

  return v7;
}

- (void)bluetoothDevicePaired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = asset_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SDDeviceAssetMonitor bluetoothDevicePaired:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  if ([v4 supportsAACPService])
  {
    [(NSMutableSet *)self->_bluetoothDevices addObject:v4];
    signed int v6 = [(SDDeviceAssetMonitor *)self queryForBluetoothDevice:v4];
    [(SDDeviceAssetMonitor *)self downloadAssetsForQuery:v6];
  }
  else
  {
    signed int v6 = asset_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[SDDeviceAssetMonitor bluetoothDevicePaired:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ignoring %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)bluetoothDeviceUnpaired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = asset_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SDDeviceAssetMonitor bluetoothDeviceUnpaired:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  if ([(NSMutableSet *)self->_bluetoothDevices containsObject:v4])
  {
    [(NSMutableSet *)self->_bluetoothDevices removeObject:v4];
    [(SDDeviceAssetMonitor *)self triggerAssetCleanupWithBluetoothDeviceRemoved:v4];
  }
  else
  {
    signed int v6 = asset_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[SDDeviceAssetMonitor bluetoothDeviceUnpaired:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ignoring %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)triggerAssetCleanupWithBluetoothDeviceRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SDDeviceAssetMonitor *)self queryForBluetoothDevice:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  signed int v6 = self->_bluetoothDevices;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_super v12 = -[SDDeviceAssetMonitor queryForBluetoothDevice:](self, "queryForBluetoothDevice:", v11, (void)v15);
        if ([v12 isEqual:v5])
        {
          v14 = asset_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v20 = v4;
            __int16 v21 = 2112;
            uint64_t v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "assets for removed device %@ is still needed by %@", buf, 0x16u);
          }

          goto LABEL_15;
        }
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v13 = asset_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "cleaning up assets for removed device %@", buf, 0xCu);
  }

  [(SFDeviceAssetManager *)self->_deviceAssetManager purgeAssetsMatchingQuery:v5];
LABEL_15:
}

- (void)downloadAssetsForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  signed int v6 = objc_opt_new();
  [v5 setDate:v6];

  [v5 setQuery:v4];
  id v7 = self;
  objc_sync_enter(v7);
  [(NSMutableSet *)v7->_tasks addObject:v5];
  objc_sync_exit(v7);

  id v8 = objc_alloc((Class)SFDeviceAssetRequestConfiguration);
  objc_super v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10004CE6C;
  long long v15 = &unk_1008CAAF0;
  id v16 = v4;
  id v17 = v5;
  id v9 = v5;
  id v10 = v4;
  id v11 = [v8 initWithQueryResultHandler:&v12];
  [v11 setTimeout:9999.0, v12, v13, v14, v15];
  [(SFDeviceAssetManager *)v7->_deviceAssetManager getAssetBundleForDeviceQuery:v10 withRequestConfiguration:v11];
}

- (os_state_data_s)stateDump
{
  id v3 = asset_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  NSAppendPrintF();
  id v4 = 0;
  uint64_t v5 = [(SDDeviceAssetMonitor *)self state];
  if (v5)
  {
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  if (v4)
  {
    id v7 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:0];
    id v8 = [v7 length];
    id v9 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v8 + 200, 0xB1E2BB2EuLL);
    id v10 = v9;
    if (v9)
    {
      v9->var0 = 1;
      v9->var1.var1 = v8;
      __strlcpy_chk();
      id v7 = v7;
      memcpy(v10->var4, [v7 bytes], (size_t)v8);
    }
  }
  else
  {
    id v7 = 0;
    id v10 = 0;
  }

  return v10;
}

- (NSString)state
{
  uint64_t v28 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v5 = 0;

  id v27 = v5;
  long long v18 = objc_opt_new();
  NSAppendPrintF();
  id v6 = v5;

  id v7 = [(SFDeviceAssetManager *)self->_deviceAssetManager networkStatus];

  if (v7)
  {
    id v26 = v6;
    v19 = [(SFDeviceAssetManager *)self->_deviceAssetManager networkStatus];
    NSAppendPrintF();
    id v8 = v6;

    id v6 = v8;
  }
  id v25 = v6;
  NSAppendPrintF();
  id v9 = (NSMutableSet *)v6;

  if ([(NSMutableSet *)self->_tasks count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = self->_tasks;
    id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        v14 = 0;
        long long v15 = v9;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v20 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
          NSAppendPrintF();
          id v9 = v15;

          v14 = (char *)v14 + 1;
          long long v15 = v9;
        }
        while (v12 != v14);
        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16, v20);
      }
      while (v12);
    }
  }
  else
  {
    NSAppendPrintF();
    id v10 = v9;
    id v9 = v9;
  }

  NSAppendPrintF();
  id v16 = v9;

  return (NSString *)v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
  objc_storeStrong((id *)&self->_bluetoothDevices, 0);

  objc_storeStrong((id *)&self->_deviceAssetManager, 0);
}

@end