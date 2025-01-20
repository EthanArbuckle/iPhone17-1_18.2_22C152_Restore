@interface BluetoothSetting
- (BOOL)bluetoothEnabled;
- (BOOL)initComplete;
- (BluetoothSetting)init;
- (void)btSettingChanged:(id)a3;
- (void)dealloc;
- (void)init;
- (void)setBluetoothEnabled:(BOOL)a3;
- (void)setInitComplete:(BOOL)a3;
@end

@implementation BluetoothSetting

- (BluetoothSetting)init
{
  v9.receiver = self;
  v9.super_class = (Class)BluetoothSetting;
  v2 = [(BluetoothSetting *)&v9 init];
  if (v2)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 3;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      v5 = &_os_log_default;
      id v4 = &_os_log_default;
    }
    else
    {
      v5 = *(id *)(gLogObjects + 16);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BluetoothSetting init](v5);
    }

    v2->_initComplete = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __24__BluetoothSetting_init__block_invoke;
    block[3] = &unk_51448;
    v8 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v2;
}

void __24__BluetoothSetting_init__block_invoke(uint64_t a1)
{
  v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"btSettingChanged:" name:BluetoothStateChangedNotification object:0];

  BOOL v3 = +[BluetoothManager sharedInstance];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v3 powerState] == 2;

  if (gLogObjects && gNumLogObjects >= 3)
  {
    id v4 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v4 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Registered for BluetoothStateChangedNotification: bluetoothEnabled = %d", (uint8_t *)v7, 8u);
  }
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    int v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    int v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL bluetoothEnabled = self->_bluetoothEnabled;
    *(_DWORD *)buf = 67109120;
    BOOL v10 = bluetoothEnabled;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Unregistered for BluetoothStateChangedNotification: BOOL bluetoothEnabled = %d", buf, 8u);
  }

  v8.receiver = self;
  v8.super_class = (Class)BluetoothSetting;
  [(BluetoothSetting *)&v8 dealloc];
}

- (void)btSettingChanged:(id)a3
{
  BOOL v4 = +[BluetoothManager sharedInstance];
  unsigned int v5 = [v4 powerState];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 3;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    objc_super v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    objc_super v8 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "btSettingChanged: powerState = %d", buf, 8u);
  }

  if (v5 == 1)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      objc_super v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      objc_super v9 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "btSettingChanged: transitioning... check again later", buf, 2u);
    }

    dispatch_time_t v12 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __37__BluetoothSetting_btSettingChanged___block_invoke;
    block[3] = &unk_51448;
    void block[4] = self;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      BOOL v10 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      BOOL v10 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL bluetoothEnabled = self->_bluetoothEnabled;
      *(_DWORD *)buf = 67109376;
      unsigned int v18 = bluetoothEnabled;
      __int16 v19 = 1024;
      BOOL v20 = v5 == 2;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "btSettingChanged: BOOL bluetoothEnabled = %d -> %d", buf, 0xEu);
    }

    self->_BOOL bluetoothEnabled = v5 == 2;
    self->_initComplete = 1;
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:ueaPluginSystemSettingsBluetoothSettomgChanged object:0];
  }
}

id __37__BluetoothSetting_btSettingChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) btSettingChanged:0];
}

- (BOOL)bluetoothEnabled
{
  return self->_bluetoothEnabled;
}

- (void)setBluetoothEnabled:(BOOL)a3
{
  self->_BOOL bluetoothEnabled = a3;
}

- (BOOL)initComplete
{
  return self->_initComplete;
}

- (void)setInitComplete:(BOOL)a3
{
  self->_initComplete = a3;
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Init BluetoothSetting: start", v1, 2u);
}

@end