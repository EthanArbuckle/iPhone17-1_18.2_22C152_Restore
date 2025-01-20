int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id MTLoggingPreferenceProvider()
{
  if (MTLoggingPreferenceProvider_onceToken != -1) {
    dispatch_once(&MTLoggingPreferenceProvider_onceToken, &__block_literal_global);
  }
  v0 = (void *)MTLoggingPreferenceProvider___logObj;

  return v0;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_continuousRecordingDefaults(void *a1, const char *a2, ...)
{
  return [a1 continuousRecordingDefaults];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return [a1 logHandle];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_touchDisabled(void *a1, const char *a2, ...)
{
  return [a1 touchDisabled];
}

id objc_msgSend_tvDefaults(void *a1, const char *a2, ...)
{
  return [a1 tvDefaults];
}
S_LOG_TYPE_DEFAULT, "Touch disabled: %d", (uint8_t *)v7, 8u);
  }

  v4[2](v4, v5);
}

- (void)continuousRecordingEnabledWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = [(SessionFilterPreferenceProvider *)self continuousRecordingDefaults];
  v6 = [v5 objectForKey:@"ContinuousRecordingV3"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (uint64_t)[v6 BOOLValue];
  }
  else if (v6)
  {
    v8 = [(SessionFilterPreferenceProvider *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SessionFilterPreferenceProvider continuousRecordingEnabledWithReply:]((uint64_t)v6, v8);
    }

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  v9 = [(SessionFilterPreferenceProvider *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Continuous recording enabled: %d", (uint8_t *)v10, 8u);
  }

  v4[2](v4, v7);
}

- (void)continuousRecordingDeleteForAllServicesWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = [(SessionFilterPreferenceProvider *)self continuousRecordingDefaults];
  v6 = [v5 objectForKey:@"deleteForAllServices"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (uint64_t)[v6 BOOLValue];
  }
  else
  {
    if (v6)
    {
      v8 = [(SessionFilterPreferenceProvider *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SessionFilterPreferenceProvider continuousRecordingDeleteForAllServicesWithReply:]((uint64_t)v6, v8);
      }
    }
    uint64_t v7 = 1;
  }
  v4[2](v4, v7);
}

- (void)continuousRecordingSetDeleteForAllServices:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SessionFilterPreferenceProvider *)self continuousRecordingDefaults];
  v4 = +[NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"deleteForAllServices"];
}

- (NSUserDefaults)tvDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (NSUserDefaults)continuousRecordingDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 16, 1);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_continuousRecordingDefaults, 0);

  objc_storeStrong((id *)&self->_tvDefaults, 0);
}

- (void)touchDisabled
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized remote clickpad mode value %ld", (uint8_t *)&v2, 0xCu);
}

- (void)continuousRecordingEnabledWithReply:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412802;
  CFStringRef v3 = @"com.apple.ContinuousRecording";
  __int16 v4 = 2112;
  CFStringRef v5 = @"ContinuousRecordingV3";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Preference domain %@ key %@ invalid value %@", (uint8_t *)&v2, 0x20u);
}

- (void)continuousRecordingDeleteForAllServicesWithReply:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412802;
  CFStringRef v3 = @"com.apple.ContinuousRecording";
  __int16 v4 = 2112;
  CFStringRef v5 = @"deleteForAllServices";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Preference domain %@ key %@ invalid value %@", (uint8_t *)&v2, 0x20u);
}

@end