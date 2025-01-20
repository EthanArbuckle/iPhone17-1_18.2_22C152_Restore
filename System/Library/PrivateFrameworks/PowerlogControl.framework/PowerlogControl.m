id PowerlogControlLog()
{
  void *v0;
  uint64_t vars8;

  if (PowerlogControlLog_onceToken != -1) {
    dispatch_once(&PowerlogControlLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)PowerlogControlLog___logObj;

  return v0;
}

uint64_t __PowerlogControlLog_block_invoke()
{
  PowerlogControlLog___logObj = (uint64_t)os_log_create("com.apple.powerlog", "control");

  return MEMORY[0x270F9A758]();
}

id containerPath()
{
  if (containerPath_onceToken != -1) {
    dispatch_once(&containerPath_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)containerPath_containerPath;

  return v0;
}

void __containerPath_block_invoke()
{
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    uint64_t v2 = [NSString stringWithUTF8String:v0];
    v3 = (void *)containerPath_containerPath;
    containerPath_containerPath = v2;

    free(v1);
  }
  else
  {
    NSLog(&cfstr_ErrorFetchingG.isa, 1);
  }
}

uint64_t allowModeTransition(int a1)
{
  containerPath();
  uint64_t v2 = (void *)_CFPreferencesCopyValueWithContainer();
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 intValue];
    uint64_t v5 = 1;
    if (a1 == 2 && v4 == 1)
    {
      v6 = PowerlogControlLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        allowModeTransition_cold_1(v6);
      }

      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

BOOL validValue(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v1 intValue] & 0x80000000) == 0
    && (int)[v1 intValue] < 3;

  return v2;
}

id PowerlogControlReadMode()
{
  containerPath();
  uint64_t v0 = (void *)_CFPreferencesCopyValueWithContainer();
  if (!v0)
  {
    containerPath();
    uint64_t v0 = (void *)_CFPreferencesCopyValueWithContainer();
  }

  return v0;
}

uint64_t PowerlogControlDefaultsChanged(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = PowerlogControlLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_226BFC000, v5, OS_LOG_TYPE_DEFAULT, "Mode defaults changed", v8, 2u);
  }

  if (([v3 isEqualToString:@"Mode"] & 1) != 0
    || [v3 isEqualToString:@"FullMode"])
  {
    uint64_t v6 = PowerlogControlSwitchMode(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t PowerlogControlSwitchMode(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  BOOL v2 = PowerlogControlLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v1;
    _os_log_impl(&dword_226BFC000, v2, OS_LOG_TYPE_DEFAULT, "Updating powerlog mode to '%@'", buf, 0xCu);
  }

  if (!validValue(v1))
  {
    v11 = PowerlogControlLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      PowerlogControlSwitchMode_cold_2((uint64_t)v1, v11);
    }

    goto LABEL_12;
  }
  uint64_t v3 = [v1 intValue];
  if ((allowModeTransition(v3) & 1) == 0)
  {
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  id v4 = PowerlogControlLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    PowerlogControlSwitchMode_cold_1((uint64_t)v1, v4);
  }

  [NSNumber numberWithInt:v3];
  containerPath();
  _CFPreferencesSetAppValueWithContainer();
  containerPath();
  _CFPreferencesAppSynchronizeWithContainer();
  uint64_t v5 = containerPath();
  objc_msgSend(v5, "stringByAppendingFormat:", @"%s", "/Library/Preferences/com.apple.powerlogd.plist");
  id v6 = objc_claimAutoreleasedReturnValue();
  v7 = (const char *)[v6 UTF8String];

  v8 = getpwnam("mobile");
  chown(v7, v8->pw_uid, v8->pw_gid);
  v9 = [MEMORY[0x263F08850] defaultManager];
  v10 = [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"];
  if ((int)v3 >= 1)
  {
    [v9 createFileAtPath:v10 contents:0 attributes:0];
LABEL_15:

    goto LABEL_16;
  }
  int v13 = [v9 fileExistsAtPath:v10];

  if (v13)
  {
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"];
    [v9 removeItemAtPath:v10 error:0];
    goto LABEL_15;
  }
LABEL_16:
  v14 = PowerlogControlLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226BFC000, v14, OS_LOG_TYPE_DEFAULT, "Powerlog state changed", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlog.state_changed", 0, 0, 0);
  uint64_t v12 = 1;
LABEL_19:

  return v12;
}

void allowModeTransition_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_226BFC000, log, OS_LOG_TYPE_ERROR, "Mode transition not permitted", v1, 2u);
}

void PowerlogControlSwitchMode_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226BFC000, a2, OS_LOG_TYPE_DEBUG, "Allowing mode transition to %@", (uint8_t *)&v2, 0xCu);
}

void PowerlogControlSwitchMode_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226BFC000, a2, OS_LOG_TYPE_ERROR, "Invalid powerlog mode '%@', stopping", (uint8_t *)&v2, 0xCu);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x270EE5658]();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x270EE5668]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x270EE5690]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x270ED90F0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}