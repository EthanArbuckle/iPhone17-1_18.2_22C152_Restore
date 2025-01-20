@interface ueaPluginSystemSettingsMonitor
- (AirplaneMode)airplaneMode;
- (BOOL)initComplete;
- (BluetoothSetting)bluetoothSetting;
- (ueaPluginSystemSettingsMonitor)init;
- (void)airplaneModeOrBTSettingChanged:(id)a3;
- (void)notifyDriverOfBluetoothSetting:(BOOL)a3 andAirplaneMode:(BOOL)a4;
- (void)setAirplaneMode:(id)a3;
- (void)setBluetoothSetting:(id)a3;
- (void)setInitComplete:(BOOL)a3;
@end

@implementation ueaPluginSystemSettingsMonitor

- (ueaPluginSystemSettingsMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)ueaPluginSystemSettingsMonitor;
  v2 = [(ueaPluginSystemSettingsMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_initComplete = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __38__ueaPluginSystemSettingsMonitor_init__block_invoke;
    block[3] = &unk_51448;
    v6 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v3;
}

- (void)airplaneModeOrBTSettingChanged:(id)a3
{
  BOOL v4 = [(AirplaneMode *)self->_airplaneMode airplaneMode];
  BOOL v5 = [(BluetoothSetting *)self->_bluetoothSetting bluetoothEnabled];
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
    v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    v8 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v19 = 67109376;
    int v20 = v5;
    __int16 v21 = 1024;
    int v22 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "airplaneModeOrBTSettingChanged: current bt: %d, apm: %d", (uint8_t *)&v19, 0xEu);
  }

  if (self->_initComplete) {
    goto LABEL_33;
  }
  if ([(AirplaneMode *)self->_airplaneMode initComplete]
    && [(BluetoothSetting *)self->_bluetoothSetting initComplete])
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      v9 = &_os_log_default;
      id v15 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unsigned int v16 = [(AirplaneMode *)self->_airplaneMode initComplete];
      unsigned int v17 = [(BluetoothSetting *)self->_bluetoothSetting initComplete];
      BOOL initComplete = self->_initComplete;
      int v19 = 67109888;
      int v20 = v16;
      __int16 v21 = 1024;
      int v22 = v17;
      __int16 v23 = 1024;
      unsigned int v24 = initComplete;
      __int16 v25 = 1024;
      int v26 = 1;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "airplaneModeOrBTSettingChanged: initComplete (%d, %d) %d -> %d", (uint8_t *)&v19, 0x1Au);
    }

    self->_BOOL initComplete = 1;
    goto LABEL_33;
  }
  if (self->_initComplete)
  {
LABEL_33:
    [(ueaPluginSystemSettingsMonitor *)self notifyDriverOfBluetoothSetting:v5 andAirplaneMode:v4];
    return;
  }
  if (gLogObjects && gNumLogObjects >= 3)
  {
    v10 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    v10 = &_os_log_default;
    id v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = [(AirplaneMode *)self->_airplaneMode initComplete];
    unsigned int v13 = [(BluetoothSetting *)self->_bluetoothSetting initComplete];
    BOOL v14 = self->_initComplete;
    int v19 = 67110144;
    int v20 = v5;
    __int16 v21 = 1024;
    int v22 = v4;
    __int16 v23 = 1024;
    unsigned int v24 = v12;
    __int16 v25 = 1024;
    int v26 = v13;
    __int16 v27 = 1024;
    BOOL v28 = v14;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "airplaneModeOrBTSettingChanged: current bt: %d, apm: %d, not initComplete yet! (%d, %d) %d", (uint8_t *)&v19, 0x20u);
  }
}

- (void)notifyDriverOfBluetoothSetting:(BOOL)a3 andAirplaneMode:(BOOL)a4
{
  kern_return_t v11;
  BOOL v12;
  kern_return_t v13;
  NSObject *v14;
  BOOL v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  io_connect_t connect;
  uint8_t buf[4];
  BOOL v30;
  __int16 v31;
  io_connect_t v32;
  __int16 v33;
  io_service_t v34;

  BOOL v4 = a4;
  BOOL v5 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 3;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    v9 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v30 = v5;
    v31 = 1024;
    v32 = v4;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "notifyDriverOfBluetoothSetting:andAirplaneMode: bt %d, apm %d", buf, 0xEu);
  }

  connect = 0;
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  id v11 = IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect);
  if (v11) {
    unsigned int v12 = 1;
  }
  else {
    unsigned int v12 = connect == 0;
  }
  if (v12)
  {
    unsigned int v13 = v11;
    if (gLogObjects && gNumLogObjects >= 3)
    {
      BOOL v14 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      BOOL v14 = &_os_log_default;
      unsigned int v24 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      v30 = v13;
      v31 = 1024;
      v32 = connect;
      v33 = 1024;
      v34 = ServiceWithPrimaryPort;
      _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "IOServiceOpen fail kernStatus:%02X, ioConnForService:%04X ioService:%d", buf, 0x14u);
    }
  }
  else
  {
    id v15 = !v4;
    if (v4) {
      unsigned int v16 = 0;
    }
    else {
      unsigned int v16 = 0x10000;
    }
    if (v15) {
      unsigned int v17 = 0;
    }
    else {
      unsigned int v17 = 0x10000;
    }
    v18 = [(AirplaneMode *)self->_airplaneMode initComplete];
    int v19 = v16 | 0x40000;
    if (!v18) {
      int v19 = v16;
    }
    if (v5) {
      int v20 = v19 | 0x20000;
    }
    else {
      int v20 = v19;
    }
    if (v5) {
      __int16 v21 = v17;
    }
    else {
      __int16 v21 = v17 | 0x20000;
    }
    if ([(BluetoothSetting *)self->_bluetoothSetting initComplete]) {
      int v22 = v20 | 0x80000;
    }
    else {
      int v22 = v20;
    }
    if (v21 && IOAccessoryManagerRevokeFeatures())
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        __int16 v23 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        __int16 v23 = &_os_log_default;
        __int16 v25 = &_os_log_default;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ueaPluginSystemSettingsMonitor notifyDriverOfBluetoothSetting:andAirplaneMode:]();
      }
    }
    if (v22 && IOAccessoryManagerAllowFeatures())
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        int v26 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        int v26 = &_os_log_default;
        __int16 v27 = &_os_log_default;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ueaPluginSystemSettingsMonitor notifyDriverOfBluetoothSetting:andAirplaneMode:]();
      }
    }
    IOServiceClose(connect);
  }
}

- (AirplaneMode)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(id)a3
{
}

- (BluetoothSetting)bluetoothSetting
{
  return self->_bluetoothSetting;
}

- (void)setBluetoothSetting:(id)a3
{
}

- (BOOL)initComplete
{
  return self->_initComplete;
}

- (void)setInitComplete:(BOOL)a3
{
  self->_BOOL initComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothSetting, 0);

  objc_storeStrong((id *)&self->_airplaneMode, 0);
}

- (void)notifyDriverOfBluetoothSetting:andAirplaneMode:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_0, v0, v1, "IOAccMgrAllowFeatures 0x%x fail kernStatus:%02X", v2, v3);
}

- (void)notifyDriverOfBluetoothSetting:andAirplaneMode:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_0, v0, v1, "IOAccMgrRevokeFeatures 0x%x fail kernStatus:%02X", v2, v3);
}

@end