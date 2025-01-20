id sub_1FE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupHomeSharingWithParameters:*(void *)(a1 + 40)];
}

id sub_1FEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupITunesMatchWithParameters:*(void *)(a1 + 40)];
}

id sub_1FF8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) handler];
  if (result)
  {
    v2 = (uint64_t (*)(void))*((void *)result + 2);
    return (id)v2();
  }
  return result;
}

id sub_21C8(uint64_t a1)
{
  id v2 = +[HSAccountStore defaultStore];
  id v3 = [*(id *)(a1 + 32) objectForKey:@"email"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  [v2 setAppleID:v4];
  id v5 = [*(id *)(a1 + 32) objectForKey:@"password"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  [v2 setPassword:v6];
  if ([v2 canDetermineGroupID])
  {
    id v7 = +[SSLogConfig sharedConfig];
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v18 = 138412290;
      uint64_t v19 = objc_opt_class();
      LODWORD(v16) = 12;
      v15 = &v18;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v18, v16);
        free(v11);
        v15 = (int *)v12;
        SSFileLog();
      }
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_2434;
    v17[3] = &unk_4208;
    v17[4] = *(void *)(a1 + 40);
    return objc_msgSend(v2, "determineGroupIDWithCompletionHandler:", v17, v15);
  }
  else
  {
    v14 = *(NSObject **)(a1 + 40);
    return (id)dispatch_semaphore_signal(v14);
  }
}

intptr_t sub_2434(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_291C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_296C(uint64_t a1, void *a2)
{
  if (HSCloudClientIsSagaEnabledInURLBag())
  {
    id v4 = [a2 objectForKey:@"library-daap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = +[SSLogConfig sharedConfig];
      unsigned int v6 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v7 &= 2u;
      }
      if (v7)
      {
        int v14 = 138412546;
        uint64_t v15 = objc_opt_class();
        __int16 v16 = 2112;
        id v17 = v4;
        LODWORD(v13) = 22;
        v12 = &v14;
        uint64_t v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          int v9 = (void *)v8;
          uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
          free(v9);
          v12 = (int *)v10;
          SSFileLog();
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "objectForKey:", @"base-url", v12) != 0;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_2B28(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t HSCloudClientIsSagaEnabledInURLBag()
{
  return _HSCloudClientIsSagaEnabledInURLBag();
}

uint64_t PSIsRunningInAssistant()
{
  return _PSIsRunningInAssistant();
}

uint64_t SSAccountGetUniqueIdentifierFromValue()
{
  return _SSAccountGetUniqueIdentifierFromValue();
}

uint64_t SSFileLog()
{
  return _SSFileLog();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void free(void *a1)
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend_accountSource(void *a1, const char *a2, ...)
{
  return [a1 accountSource];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_canDetermineGroupID(void *a1, const char *a2, ...)
{
  return [a1 canDetermineGroupID];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hardwareName(void *a1, const char *a2, ...)
{
  return [a1 hardwareName];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isLibraryEmpty(void *a1, const char *a2, ...)
{
  return [a1 isLibraryEmpty];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_resetExpiration(void *a1, const char *a2, ...)
{
  return [a1 resetExpiration];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedLibrary];
}

id objc_msgSend_sharedStorage(void *a1, const char *a2, ...)
{
  return [a1 sharedStorage];
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return [a1 shouldLog];
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return [a1 shouldLogToDisk];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return [a1 userAgent];
}