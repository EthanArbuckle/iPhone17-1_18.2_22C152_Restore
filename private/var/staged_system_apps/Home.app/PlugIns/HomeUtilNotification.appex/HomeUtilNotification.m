void sub_100002794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000027D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v27 = [WeakRetained announcementsBrowserViewController];
  v26 = [v27 view];
  v24 = [v26 topAnchor];
  v25 = [WeakRetained view];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v28[0] = v22;
  v21 = [WeakRetained announcementsBrowserViewController];
  v20 = [v21 view];
  v18 = [v20 leadingAnchor];
  v19 = [WeakRetained view];
  v17 = [v19 leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v28[1] = v16;
  v15 = [WeakRetained announcementsBrowserViewController];
  v14 = [v15 view];
  v13 = [v14 trailingAnchor];
  v2 = [WeakRetained view];
  v3 = [v2 trailingAnchor];
  v4 = [v13 constraintEqualToAnchor:v3];
  v28[2] = v4;
  v5 = [WeakRetained announcementsBrowserViewController];
  v6 = [v5 view];
  v7 = [v6 bottomAnchor];
  v8 = [WeakRetained view];
  v9 = [v8 bottomAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v28[3] = v10;
  id v12 = +[NSArray arrayWithObjects:v28 count:4];

  return v12;
}

uint64_t HFLogForCategory()
{
  return _HFLogForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_activateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 activateIfNeeded];
}

id objc_msgSend_announcementsBrowserViewController(void *a1, const char *a2, ...)
{
  return [a1 announcementsBrowserViewController];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_dismissNotificationContentExtension(void *a1, const char *a2, ...)
{
  return [a1 dismissNotificationContentExtension];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_isTearingDown(void *a1, const char *a2, ...)
{
  return [a1 isTearingDown];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_notificationPayload(void *a1, const char *a2, ...)
{
  return [a1 notificationPayload];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_staticConstraintSet(void *a1, const char *a2, ...)
{
  return [a1 staticConstraintSet];
}

id objc_msgSend_tearDownAudioActivity(void *a1, const char *a2, ...)
{
  return [a1 tearDownAudioActivity];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}