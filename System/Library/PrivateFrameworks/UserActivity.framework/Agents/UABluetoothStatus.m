@interface UABluetoothStatus
+ (UABluetoothStatus)sharedInstance;
- (BOOL)poweredOn;
- (BTLocalDeviceImpl)localDevice;
- (BTSessionImpl)session;
- (UABluetoothStatus)init;
- (id)registerCallback:(id)a3;
- (void)attachSession:(BTSessionImpl *)a3;
- (void)attachToBluetoothSession;
- (void)dealloc;
- (void)detachFromBluetoothSession;
- (void)detachSession:(BTSessionImpl *)a3;
- (void)handleLocalDeviceCallback:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5;
- (void)handleSessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)processCallbacks;
- (void)terminateSession:(BTSessionImpl *)a3;
- (void)unregisterCallback:(id)a3;
@end

@implementation UABluetoothStatus

- (BOOL)poweredOn
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_poweredOnValid) {
    goto LABEL_18;
  }
  v2->_BOOL poweredOn = 0;
  if (v2->_terminated)
  {
    v3 = sub_10000BA18(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BLUETOOTH: Returning NO for .poweredOn because our session has been terminated.", buf, 2u);
    }
    goto LABEL_16;
  }
  if (v2->_attached)
  {
    [(UABluetoothStatus *)v2 localDevice];
    int ModulePower = BTLocalDeviceGetModulePower();
    if (ModulePower)
    {
      v3 = sub_10000BA18(0);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        session = v2->_session;
        localDevice = v2->_localDevice;
        *(_DWORD *)buf = 134349568;
        v17 = session;
        __int16 v18 = 2050;
        v19 = localDevice;
        __int16 v20 = 1026;
        int v21 = ModulePower;
        v7 = "BLUETOOTH: Failed to get device powered status, for local device %{public}p from BTSession %{public}p, result=%{public}d.";
        v8 = v3;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 28;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
      }
    }
    else
    {
      v2->_BOOL poweredOn = 0;
      v2->_poweredOnValid = 1;
      v3 = sub_10000BA18(0);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v12 = v2->_localDevice;
        BOOL poweredOn = v2->_poweredOn;
        *(_DWORD *)buf = 134349312;
        v17 = v12;
        __int16 v18 = 1024;
        LODWORD(v19) = poweredOn;
        v7 = "BLUETOOTH: Setting powered status for device %{public}p to %{BOOL}d";
        v8 = v3;
        os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
        uint32_t v10 = 18;
        goto LABEL_15;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BLUETOOTH: Returning NO for .poweredOn because our session has been detached, so also triggering a re-attach.", buf, 2u);
  }

  [(UABluetoothStatus *)v2 attachToBluetoothSession];
LABEL_17:
  if (!v2->_poweredOnValid)
  {
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_18:
  BOOL v14 = v2->_poweredOn;
LABEL_19:
  objc_sync_exit(v2);

  return v14;
}

- (BTSessionImpl)session
{
  return self->_session;
}

- (BTLocalDeviceImpl)localDevice
{
  return self->_localDevice;
}

- (UABluetoothStatus)init
{
  v5.receiver = self;
  v5.super_class = (Class)UABluetoothStatus;
  v2 = [(UABluetoothStatus *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UABluetoothStatus *)v2 attachToBluetoothSession];
  }
  return v3;
}

- (void)dealloc
{
  [(UABluetoothStatus *)self detachFromBluetoothSession];
  v3.receiver = self;
  v3.super_class = (Class)UABluetoothStatus;
  [(UABluetoothStatus *)&v3 dealloc];
}

+ (UABluetoothStatus)sharedInstance
{
  if (qword_1000E68A8 != -1) {
    dispatch_once(&qword_1000E68A8, &stru_1000C5CE8);
  }
  v2 = (void *)qword_1000E68A0;

  return (UABluetoothStatus *)v2;
}

- (void)attachToBluetoothSession
{
  v2 = self;
  objc_sync_enter(v2);
  if (!*(_WORD *)&v2->_attached)
  {
    v2->_attachInProcess = 1;
    objc_super v3 = sub_10004B4B4();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004B508;
    block[3] = &unk_1000C4CF0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  objc_sync_exit(v2);
}

- (void)detachFromBluetoothSession
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_attached)
  {
    v2->_attached = 0;
    v2->_poweredOnValid = 0;
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x2020000000;
    v5[3] = v2->_session;
    v2->_session = 0;
    objc_super v3 = sub_10004B4B4();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004B7A0;
    block[3] = &unk_1000C57D0;
    block[4] = v5;
    dispatch_async(v3, block);

    _Block_object_dispose(v5, 8);
  }
  objc_sync_exit(v2);
}

- (id)registerCallback:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_callbacks)
  {
    uint64_t v7 = objc_opt_new();
    callbacks = v5->_callbacks;
    v5->_callbacks = (NSMutableDictionary *)v7;
  }
  *(void *)&long long v6 = 138543618;
  long long v16 = v6;
  do
  {
    os_log_type_t v9 = +[NSUUID UUID];
    uint32_t v10 = [(NSMutableDictionary *)v5->_callbacks objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = 0;
    }
    else
    {
      id v12 = objc_retainBlock(v4);
      [(NSMutableDictionary *)v5->_callbacks setObject:v12 forKeyedSubscript:v9];

      v13 = sub_10000BA18(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = objc_retainBlock(v4);
        *(_DWORD *)buf = v16;
        __int16 v18 = v9;
        __int16 v19 = 2050;
        id v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "BLUETOOTH: Registering callback %{public}@ to %{public}p", buf, 0x16u);
      }
      id v11 = v9;
    }
  }
  while (!v11);
  objc_sync_exit(v5);

  return v11;
}

- (void)unregisterCallback:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  long long v6 = [(NSMutableDictionary *)v5->_callbacks objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "BLUETOOTH: Unregistering callback %{public}@", (uint8_t *)&v8, 0xCu);
    }

    [(NSMutableDictionary *)v5->_callbacks removeObjectForKey:v4];
  }
  objc_sync_exit(v5);
}

- (void)processCallbacks
{
  v2 = self;
  objc_sync_enter(v2);
  callbacks = v2->_callbacks;
  if (callbacks
    && [(NSMutableDictionary *)callbacks count]
    && (int poweredOn = v2->_poweredOn, v5 = [(UABluetoothStatus *)v2 poweredOn], v6 = v5, poweredOn != v5))
  {
    id v7 = [(NSMutableDictionary *)v2->_callbacks copy];
  }
  else
  {
    id v7 = 0;
    char v6 = 0;
  }
  objc_sync_exit(v2);

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004BC44;
    v8[3] = &unk_1000C5D08;
    char v9 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

- (void)handleSessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  switch(a4)
  {
    case 0:
      -[UABluetoothStatus attachSession:](self, "attachSession:");
      break;
    case 1:
      -[UABluetoothStatus detachSession:](self, "detachSession:");
      break;
    case 2:
      [(UABluetoothStatus *)self detachFromBluetoothSession];
      -[UABluetoothStatus terminateSession:](self, "terminateSession:");
      break;
    case 3:
      char v6 = sub_10000BA18(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67240192;
        v7[1] = 3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "BLUETOOTH: Unexpected error %{public}d, so ignoring it.", (uint8_t *)v7, 8u);
      }

      break;
    default:
      return;
  }
}

- (void)attachSession:(BTSessionImpl *)a3
{
  unsigned int v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    long long v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BLUETOOTH: Attached to BTSession %{public}p", buf, 0xCu);
  }

  char v6 = self;
  objc_sync_enter(v6);
  v6->_session = a3;
  p_localDevice = &v6->_localDevice;
  int Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    char v9 = sub_10000BA18(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349312;
      long long v16 = a3;
      __int16 v17 = 1026;
      LODWORD(v18) = Default;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "BLUETOOTH: Failed to get local device for session %{public}p, result=%{public}d", buf, 0x12u);
    }

    v6->_poweredOnValid = 0;
    v6->_localDevice = 0;
  }
  else
  {
    uint32_t v10 = sub_10000BA18(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = *p_localDevice;
      *(_DWORD *)buf = 134349568;
      long long v16 = a3;
      __int16 v17 = 2050;
      __int16 v18 = v11;
      __int16 v19 = 1026;
      int v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "BLUETOOTH: Local device %{public}p from BTSession %{public}p, result=%{public}d.", buf, 0x1Cu);
    }

    [(UABluetoothStatus *)v6 localDevice];
    int v12 = BTLocalDeviceAddCallbacks();
    if (v12 || (int v12 = BTLocalDeviceMaskCallbacks()) != 0)
    {
      v13 = sub_10000BA18(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = *p_localDevice;
        *(_DWORD *)buf = 134349568;
        long long v16 = a3;
        __int16 v17 = 2050;
        __int16 v18 = v14;
        __int16 v19 = 1026;
        int v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "BLUETOOTH: Failed to add callbacks for local device %{public}p from BTSession %{public}p, result=%{public}d.", buf, 0x1Cu);
      }
    }
  }
  objc_sync_exit(v6);
}

- (void)detachSession:(BTSessionImpl *)a3
{
  unsigned int v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    localDevice = self->_localDevice;
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = localDevice;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BLUETOOTH: Detached from BTSession %{public}p localDevice=%{public}p", buf, 0x16u);
  }

  id v7 = self;
  objc_sync_enter(v7);
  if ([(UABluetoothStatus *)v7 localDevice])
  {
    *(_OWORD *)&buf[8] = 0uLL;
    *(void *)buf = sub_10004C1BC;
    [(UABluetoothStatus *)v7 localDevice];
    int v8 = BTLocalDeviceRemoveCallbacks();
    if (v8)
    {
      char v9 = sub_10000BA18(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67240448;
        v10[1] = v8;
        __int16 v11 = 2050;
        int v12 = [(UABluetoothStatus *)v7 localDevice];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "BLUETOOTH: Error %{public}d removing device callbacks, device=%{public}p", (uint8_t *)v10, 0x12u);
      }
    }
    v7->_localDevice = 0;
  }
  v7->_attached = 0;
  objc_sync_exit(v7);
}

- (void)terminateSession:(BTSessionImpl *)a3
{
  unsigned int v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    localDevice = self->_localDevice;
    int v8 = 134349312;
    char v9 = a3;
    __int16 v10 = 2050;
    __int16 v11 = localDevice;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BLUETOOTH: Terminated from BTSession %{public}p localDevice=%{public}p", (uint8_t *)&v8, 0x16u);
  }

  [(UABluetoothStatus *)self detachSession:a3];
  id v7 = self;
  objc_sync_enter(v7);
  [(UABluetoothStatus *)v7 detachSession:a3];
  objc_sync_exit(v7);
}

- (void)handleLocalDeviceCallback:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5
{
  if (!a4)
  {
    id v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      int v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BLUETOOTH: Setting powered-status-validity for device %{public}p to NO", buf, 0xCu);
    }

    int v8 = self;
    objc_sync_enter(v8);
    v8->_poweredOnValid = 0;
    char v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C5C8;
    block[3] = &unk_1000C4CF0;
    block[4] = v8;
    dispatch_async(v9, block);

    objc_sync_exit(v8);
  }
}

- (void).cxx_destruct
{
}

@end