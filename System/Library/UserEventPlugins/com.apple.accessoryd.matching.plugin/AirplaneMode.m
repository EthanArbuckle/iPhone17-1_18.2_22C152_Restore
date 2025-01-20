@interface AirplaneMode
- (AirplaneMode)init;
- (BOOL)airplaneMode;
- (BOOL)initComplete;
- (RadiosPreferences)radiosPreferences;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)init;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setInitComplete:(BOOL)a3;
- (void)setRadiosPreferences:(id)a3;
@end

@implementation AirplaneMode

- (AirplaneMode)init
{
  v9.receiver = self;
  v9.super_class = (Class)AirplaneMode;
  v2 = [(AirplaneMode *)&v9 init];
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
      -[AirplaneMode init](v5);
    }

    v2->_initComplete = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __20__AirplaneMode_init__block_invoke;
    block[3] = &unk_51448;
    v8 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v2;
}

id __20__AirplaneMode_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)RadiosPreferences);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [*(id *)(*(void *)(a1 + 32) + 16) airplaneMode];
  if (gLogObjects && gNumLogObjects >= 3)
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    v5 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
    v9[0] = 67109120;
    v9[1] = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Init RadiosPreferences: airplaneMode = %d", (uint8_t *)v9, 8u);
  }

  return [*(id *)(a1 + 32) airplaneModeChanged];
}

- (void)dealloc
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL airplaneMode = self->_airplaneMode;
    *(_DWORD *)buf = 67109120;
    BOOL v10 = airplaneMode;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Dealloc RadiosPreferences: BOOL airplaneMode = %d", buf, 8u);
  }

  [(RadiosPreferences *)self->_radiosPreferences setDelegate:0];
  radiosPreferences = self->_radiosPreferences;
  self->_radiosPreferences = 0;

  v8.receiver = self;
  v8.super_class = (Class)AirplaneMode;
  [(AirplaneMode *)&v8 dealloc];
}

- (void)airplaneModeChanged
{
  unsigned int v3 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
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
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL airplaneMode = self->_airplaneMode;
    v9[0] = 67109376;
    v9[1] = airplaneMode;
    __int16 v10 = 1024;
    unsigned int v11 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "BOOL airplaneMode = %d -> %d", (uint8_t *)v9, 0xEu);
  }

  self->_BOOL airplaneMode = v3;
  self->_initComplete = 1;
  objc_super v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:ueaPluginSystemSettingsAirplaneModeChanged object:0];
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_BOOL airplaneMode = a3;
}

- (BOOL)initComplete
{
  return self->_initComplete;
}

- (void)setInitComplete:(BOOL)a3
{
  self->_initComplete = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_0, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end