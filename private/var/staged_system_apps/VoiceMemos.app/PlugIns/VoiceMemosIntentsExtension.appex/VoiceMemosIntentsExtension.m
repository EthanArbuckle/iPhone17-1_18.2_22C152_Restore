void sub_100003340(uint64_t a1, int a2)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = objc_alloc((Class)RecordVoiceMemoIntentResponse);
  if (a2)
  {
    v5 = [v4 _initWithCode:1 userActivity:0];
    v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100003630(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    v5 = [v4 _initWithCode:6 userActivity:0];
    v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000036A8(v6, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000353C(uint64_t a1, int a2)
{
  id v4 = objc_alloc((Class)PlaybackVoiceMemoIntentResponse);
  if (a2)
  {
    id v5 = [v4 _initWithCode:1 userActivity:0];
    v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100003720(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v5 = [v4 _initWithCode:6 userActivity:0];
    v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100003798(v6, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003614(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100003630(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000036A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003720(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003798(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogForCategory()
{
  return _OSLogForCategory();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}