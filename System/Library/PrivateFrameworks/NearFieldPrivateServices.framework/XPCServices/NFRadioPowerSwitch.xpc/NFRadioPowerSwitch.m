void sub_100001924(id a1, NSNotification *a2)
{
  NSNotification *v2;

  v2 = a2;
  exit(0);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v3 registerForLocaleChange];
  [v4 resume];

  return 0;
}

void sub_100001A9C(uint64_t a1, void *a2, uint64_t a3)
{
  CFStringRef v8 = @"UserResponse";
  id v5 = a2;
  v6 = +[NSNumber numberWithInteger:a3];
  v9 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100001B74(double a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  self;
  v6 = dispatch_get_global_queue(25, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001C54;
  v8[3] = &unk_100004290;
  id v7 = v4;
  id v9 = v7;
  double v10 = a1;
  dispatch_async(v6, v8);
}

void sub_100001C54(uint64_t a1)
{
  v2 = objc_alloc_init(NFSettingsNotification);
  [(NFSettingsNotification *)v2 _requestUserNotificationWithCompletion:*(void *)(a1 + 32) popupInterval:*(double *)(a1 + 40)];
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t NFLogGetLogger()
{
  return _NFLogGetLogger();
}

uint64_t NFSharedLogGetLogger()
{
  return _NFSharedLogGetLogger();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

BOOL class_isMetaClass(Class cls)
{
  return _class_isMetaClass(cls);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void exit(int a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizations];
}

id objc_msgSend_registerForLocaleChange(void *a1, const char *a2, ...)
{
  return [a1 registerForLocaleChange];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}