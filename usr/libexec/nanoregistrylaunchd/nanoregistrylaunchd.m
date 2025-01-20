uint64_t sub_100002124(uint64_t a1)
{
  uint64_t vars8;

  qword_10000CE80 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000027D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _enableAltOnlyDaemons:*(unsigned __int8 *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000028EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _enableNanoDaemons:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100003724(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 getLocalPairingStorePath];
  [v2 chownWhine:v3];

  v4 = +[NSFileManager defaultManager];
  v5 = [*(id *)(a1 + 32) getLocalPairingStorePath];
  id v38 = 0;
  v6 = [v4 contentsOfDirectoryAtPath:v5 error:&v38];
  id v33 = v38;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v35;
    *(void *)&long long v9 = 138543618;
    long long v31 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v12);
        id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
        if (v14 && ([*(id *)(a1 + 40) containsObject:v14] & 1) == 0)
        {
          id v16 = [*(id *)(a1 + 32) deletePairedStoreWithUUID:v14];
          v17 = nr_root_daemon_log();
          v18 = v17;
          if (v16)
          {
            id v19 = v7;
            BOOL v20 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

            if (v20)
            {
              v21 = nr_root_daemon_log();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v32 = [v16 nr_safeDescription];
                uint64_t v25 = [v14 UUIDString];
                *(_DWORD *)buf = v31;
                v40 = v32;
                __int16 v41 = 2114;
                uint64_t v42 = v25;
                v26 = (void *)v25;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error %{public}@ deleting pairing store %{public}@", buf, 0x16u);
              }
            }
            id v7 = v19;
            if (!v33)
            {
              id v16 = v16;
              id v33 = v16;
            }
          }
          else
          {
            BOOL v22 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

            if (v22)
            {
              v23 = nr_root_daemon_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = [v14 UUIDString];
                *(_DWORD *)buf = 138543362;
                v40 = v24;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Deleted pairing store %{public}@", buf, 0xCu);
              }
            }
          }
        }
        else
        {
          v15 = [*(id *)(a1 + 32) getLocalPairingStorePath:v31];
          id v16 = [v15 stringByAppendingPathComponent:v13];

          [*(id *)(a1 + 32) chownWhine:v16];
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v27 = [v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
      id v10 = v27;
    }
    while (v27);
  }

  v28 = nr_root_daemon_log();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

  if (v29)
  {
    v30 = nr_root_daemon_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Completed pairing store cleanup", buf, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100003CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003CFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003D0C(uint64_t a1)
{
}

void sub_100003D14(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100003F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003F64(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_10000417C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000419C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t start()
{
  +[NRLaunchDaemon sharedInstance];

  v1 = +[NSRunLoop mainRunLoop];
  [v1 run];

  return 0;
}

void sub_1000057A4(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"com.apple.nano.nanoregistry.nanoregistrylaunchd";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No entitlement %@", (uint8_t *)&v1, 0xCu);
}

void sub_100005828(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected rooting of %{public}@!!! Unrooting...", (uint8_t *)&v2, 0xCu);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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
  return _chown(a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t launch_disable_directory()
{
  return _launch_disable_directory();
}

uint64_t launch_enable_directory()
{
  return _launch_enable_directory();
}

uint64_t nr_root_daemon_log()
{
  return _nr_root_daemon_log();
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

id objc_msgSend_NRSHA256(void *a1, const char *a2, ...)
{
  return [a1 NRSHA256];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return [a1 compact];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleterDataDescriptionPath(void *a1, const char *a2, ...)
{
  return [a1 deleterDataDescriptionPath];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_getLocalPairingStorePath(void *a1, const char *a2, ...)
{
  return [a1 getLocalPairingStorePath];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_launchDaemonsPaths(void *a1, const char *a2, ...)
{
  return [a1 launchDaemonsPaths];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mobileLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 mobileLibraryPath];
}

id objc_msgSend_pairingStoreUUID(void *a1, const char *a2, ...)
{
  return [a1 pairingStoreUUID];
}

id objc_msgSend_quarantinePath(void *a1, const char *a2, ...)
{
  return [a1 quarantinePath];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sourcePath(void *a1, const char *a2, ...)
{
  return [a1 sourcePath];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}

id objc_msgSend_xpcClients(void *a1, const char *a2, ...)
{
  return [a1 xpcClients];
}

id objc_msgSend_xpcStartListener(void *a1, const char *a2, ...)
{
  return [a1 xpcStartListener];
}