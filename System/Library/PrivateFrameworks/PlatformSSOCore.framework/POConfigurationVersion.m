@interface POConfigurationVersion
+ (id)notificationForType:(int64_t)a3;
- (POConfigurationVersion)initWithConfigurationType:(int64_t)a3;
- (int64_t)checkVersion;
- (int64_t)version;
- (unint64_t)_state;
- (void)_setStateAndNotify:(unint64_t)a3 type:(int64_t)a4;
- (void)_state;
- (void)dealloc;
- (void)increaseVersionWithMessage:(id)a3;
- (void)reset;
- (void)setPlatformSSOUnavailable;
@end

@implementation POConfigurationVersion

- (POConfigurationVersion)initWithConfigurationType:(int64_t)a3
{
  v5 = PO_LOG_POConfigurationVersion();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationVersion initWithConfigurationType:]((uint64_t)self, v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)POConfigurationVersion;
  v6 = [(POConfigurationVersion *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_token = -1;
    v6->_version = 0;
    v6->_type = a3;
    id v8 = +[POConfigurationVersion notificationForType:a3];
    uint32_t v9 = notify_register_check((const char *)[v8 UTF8String], &v7->_token);

    if (v9)
    {
      v10 = PO_LOG_POConfigurationVersion();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[POConfigurationVersion initWithConfigurationType:]();
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_259DFE000, v0, v1, "notify_cancel() failed with %u", v2, v3, v4, v5, v6);
}

- (int64_t)checkVersion
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(POConfigurationVersion *)v2 _state];
  unint64_t v4 = v3;
  if (v3 == -1)
  {
    v2->_unint64_t version = -1;
    int64_t v5 = 2;
  }
  else
  {
    if (!v3)
    {
      [(POConfigurationVersion *)v2 increaseVersionWithMessage:@"first load"];
LABEL_6:
      int64_t v5 = 0;
      goto LABEL_10;
    }
    if (v3 == v2->_version) {
      goto LABEL_6;
    }
    uint8_t v6 = PO_LOG_POConfigurationVersion();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t version = v2->_version;
      int v9 = 136315906;
      v10 = "-[POConfigurationVersion checkVersion]";
      __int16 v11 = 2048;
      unint64_t v12 = version;
      __int16 v13 = 2048;
      unint64_t v14 = v4;
      __int16 v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_259DFE000, v6, OS_LOG_TYPE_DEFAULT, "%s config version changed from from 0x%016llX to 0x%016llX on %@", (uint8_t *)&v9, 0x2Au);
    }

    v2->_unint64_t version = v4;
    int64_t v5 = 1;
  }
LABEL_10:
  objc_sync_exit(v2);

  return v5;
}

- (void)increaseVersionWithMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = self;
  objc_sync_enter(v5);
  uint8_t v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  v5->_unint64_t version = (unint64_t)(v7 * 1000.0);

  id v8 = PO_LOG_POConfigurationVersion();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(POConfigurationVersion *)v5 _state];
    unint64_t version = v5->_version;
    int v11 = 136316162;
    unint64_t v12 = "-[POConfigurationVersion increaseVersionWithMessage:]";
    __int16 v13 = 2048;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    unint64_t v16 = version;
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s config version increased from 0x%016llX to 0x%016llX (%{public}@) on %@", (uint8_t *)&v11, 0x34u);
  }

  [(POConfigurationVersion *)v5 _setStateAndNotify:v5->_version type:v5->_type];
  objc_sync_exit(v5);
}

- (void)setPlatformSSOUnavailable
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POConfigurationVersion();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    double v7 = "-[POConfigurationVersion setPlatformSSOUnavailable]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_259DFE000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  v4->_unint64_t version = -1;
  int64_t v5 = PO_LOG_POConfigurationVersion();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "set config version to PlatformSSO unavailable", (uint8_t *)&v6, 2u);
  }

  [(POConfigurationVersion *)v4 _setStateAndNotify:v4->_version type:0];
  [(POConfigurationVersion *)v4 _setStateAndNotify:v4->_version type:1];
  [(POConfigurationVersion *)v4 _setStateAndNotify:v4->_version type:2];
  objc_sync_exit(v4);
}

- (int64_t)version
{
  return self->_version;
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  [(POConfigurationVersion *)obj increaseVersionWithMessage:@"reset"];
  obj->_unint64_t version = -1;
  objc_sync_exit(obj);
}

- (unint64_t)_state
{
  uint64_t state64 = -1;
  int token = self->_token;
  if (token == -1)
  {
    uint64_t v3 = PO_LOG_POConfigurationVersion();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[POConfigurationVersion _state](v3);
    }
    goto LABEL_7;
  }
  if (notify_get_state(token, &state64))
  {
    uint64_t v3 = PO_LOG_POConfigurationVersion();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[POConfigurationVersion _state]();
    }
LABEL_7:
  }
  return state64;
}

- (void)_setStateAndNotify:(unint64_t)a3 type:(int64_t)a4
{
  if (notify_set_state(self->_token, a3))
  {
    int64_t v5 = PO_LOG_POConfigurationVersion();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POConfigurationVersion _setStateAndNotify:type:]();
    }
  }
  id v6 = +[POConfigurationVersion notificationForType:a4];
  uint32_t v7 = notify_post((const char *)[v6 UTF8String]);

  if (v7)
  {
    __int16 v8 = PO_LOG_POConfigurationVersion();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[POConfigurationVersion _setStateAndNotify:type:]();
    }
  }
}

+ (id)notificationForType:(int64_t)a3
{
  uint64_t v3 = @"/com.apple.PlatformSSO.user.version";
  if (a3 == 1) {
    uint64_t v3 = @"/com.apple.PlatformSSO.login.version";
  }
  if (a3 == 2) {
    return @"/com.apple.PlatformSSO.device.version";
  }
  else {
    return v3;
  }
}

- (void)initWithConfigurationType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_259DFE000, v0, v1, "notify_register_check() failed with %u", v2, v3, v4, v5, v6);
}

- (void)initWithConfigurationType:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[POConfigurationVersion initWithConfigurationType:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)_state
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_259DFE000, v0, v1, "notify_get_state() failed with error %u", v2, v3, v4, v5, v6);
}

- (void)_setStateAndNotify:type:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_259DFE000, v0, v1, "notify_post() failed with error %u", v2, v3, v4, v5, v6);
}

- (void)_setStateAndNotify:type:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_259DFE000, v0, v1, "notify_set_state() failed with error %u", v2, v3, v4, v5, v6);
}

@end