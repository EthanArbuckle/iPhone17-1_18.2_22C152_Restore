void sub_100001580(id a1)
{
  uint64_t vars8;

  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_1000015C4(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001608(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001C38(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001C7C(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001CC0(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001D04(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001D48(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001D8C(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001DD0(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001E14(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100001E9C(id a1)
{
  byte_10000CA48 = _os_feature_enabled_impl();
  if (qword_10000CA58 != -1) {
    dispatch_once(&qword_10000CA58, &stru_100008400);
  }
  v1 = qword_10000CA60;
  if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_INFO))
  {
    if (byte_10000CA48) {
      v2 = "enabled";
    }
    else {
      v2 = "disabled";
    }
    int v3 = 136315138;
    v4 = v2;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Transparency CFUs are %s (via feature flags)", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100001F98(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100002030(id a1)
{
  if (+[TransparencyFollowup isFollowupEnabled])
  {
    qword_10000CA40 = [[TransparencyFollowup alloc] initWithAnalytics:0];
    _objc_release_x1();
  }
}

void sub_100002380(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003B3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003B58(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003B9C(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003BE0(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003C24(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003C68(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003CAC(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003CF0(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003EE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003F00(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100003F44(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_1000042CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100004300(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_1000044B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004544(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100004848(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100004DD4(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100004E18(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100004E5C(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100004EA0(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100004EE4(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100004F28(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100004F6C(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_100005354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100005394(id a1)
{
  qword_10000CA60 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_1000054B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000054D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained ktFollowupStatus];

  return v2;
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_followUpItems(void *a1, const char *a2, ...)
{
  return [a1 followUpItems];
}

id objc_msgSend_ignoreAction(void *a1, const char *a2, ...)
{
  return [a1 ignoreAction];
}

id objc_msgSend_informativeText(void *a1, const char *a2, ...)
{
  return [a1 informativeText];
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return [a1 instance];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isFollowupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFollowupEnabled];
}

id objc_msgSend_ktFollowupStatus(void *a1, const char *a2, ...)
{
  return [a1 ktFollowupStatus];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_startFollowupStatusSampler(void *a1, const char *a2, ...)
{
  return [a1 startFollowupStatusSampler];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}