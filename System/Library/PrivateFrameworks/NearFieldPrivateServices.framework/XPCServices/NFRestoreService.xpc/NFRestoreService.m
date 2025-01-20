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

uint64_t sub_100002B08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002B18(uint64_t a1)
{
}

void sub_100002B20(uint64_t a1)
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v3 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v7 = 45;
    if (isMetaClass) {
      uint64_t v7 = 43;
    }
    v3(3, "%c[%{public}s %{public}s]:%i Fail to run in time, exiting", v7, ClassName, Name, 63);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v8 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v9)) {
      int v10 = 43;
    }
    else {
      int v10 = 45;
    }
    v11 = object_getClassName(*(id *)(a1 + 32));
    v12 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    int v15 = v10;
    __int16 v16 = 2082;
    v17 = v11;
    __int16 v18 = 2082;
    v19 = v12;
    __int16 v20 = 1024;
    int v21 = 63;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail to run in time, exiting", buf, 0x22u);
  }

  exit(-1);
}

void sub_100002C70(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = [v2 objectForKey:@"FactoryInstall"];
    objc_opt_class();
    id v4 = &__kCFBooleanFalse;
    if (objc_opt_isKindOfClass())
    {
      if ([v3 BOOLValue]) {
        v5 = &__kCFBooleanTrue;
      }
      else {
        v5 = &__kCFBooleanFalse;
      }
      id v4 = v5;
    }
    v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"StockholmOnly"];

    objc_opt_class();
    id v7 = &__kCFBooleanFalse;
    if (objc_opt_isKindOfClass())
    {
      if ([v6 BOOLValue]) {
        v8 = &__kCFBooleanTrue;
      }
      else {
        v8 = &__kCFBooleanFalse;
      }
      id v7 = v8;
    }
    v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"HammerfestOnly"];

    objc_opt_class();
    id v10 = &__kCFBooleanFalse;
    if (objc_opt_isKindOfClass())
    {
      if ([v9 BOOLValue]) {
        v11 = &__kCFBooleanTrue;
      }
      else {
        v11 = &__kCFBooleanFalse;
      }
      id v10 = v11;
    }
  }
  else
  {
    id v10 = &__kCFBooleanFalse;
    id v7 = &__kCFBooleanFalse;
    id v4 = &__kCFBooleanFalse;
  }
  v57[0] = @"RootFilePath";
  v57[1] = @"JcopUpdateDisable";
  v58[0] = @"/usr/standalone/firmware/nfrestore/firmware";
  v58[1] = &__kCFBooleanTrue;
  v57[2] = @"FactoryInstall";
  v57[3] = @"StockholmOnly";
  v58[2] = v4;
  v58[3] = v7;
  v57[4] = @"HammerfestOnly";
  v58[4] = v10;
  v12 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:5];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 40));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 40));
    Name = sel_getName(*(SEL *)(a1 + 72));
    uint64_t v18 = 45;
    if (isMetaClass) {
      uint64_t v18 = 43;
    }
    v14(5, "%c[%{public}s %{public}s]:%i Updating FW", v18, ClassName, Name, 99);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = object_getClass(*(id *)(a1 + 40));
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    v22 = object_getClassName(*(id *)(a1 + 40));
    v23 = sel_getName(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 67109890;
    int v48 = v21;
    __int16 v49 = 2082;
    v50 = v22;
    __int16 v51 = 2082;
    v52 = v23;
    __int16 v53 = 1024;
    int v54 = 99;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Updating FW", buf, 0x22u);
  }

  uint64_t v24 = NfRestore();
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v25 = NFLogGetLogger();
  if (v25)
  {
    v26 = (void (*)(uint64_t, const char *, ...))v25;
    v27 = object_getClass(*(id *)(a1 + 40));
    BOOL v28 = class_isMetaClass(v27);
    v42 = object_getClassName(*(id *)(a1 + 40));
    v44 = sel_getName(*(SEL *)(a1 + 72));
    uint64_t v29 = 45;
    if (v28) {
      uint64_t v29 = 43;
    }
    v26(6, "%c[%{public}s %{public}s]:%i FW is updated with status %d", v29, v42, v44, 101, v24);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v30 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = object_getClass(*(id *)(a1 + 40));
    if (class_isMetaClass(v31)) {
      int v32 = 43;
    }
    else {
      int v32 = 45;
    }
    v33 = object_getClassName(*(id *)(a1 + 40));
    v34 = sel_getName(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 67110146;
    int v48 = v32;
    __int16 v49 = 2082;
    v50 = v33;
    __int16 v51 = 2082;
    v52 = v34;
    __int16 v53 = 1024;
    int v54 = 101;
    __int16 v55 = 1024;
    int v56 = v24;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i FW is updated with status %d", buf, 0x28u);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
  v36 = *(void **)(v35 + 40);
  *(void *)(v35 + 40) = 0;

  uint64_t v37 = *(void *)(a1 + 48);
  if (v24)
  {
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    CFStringRef v46 = @"Restore error";
    v38 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v39 = +[NSError errorWithDomain:@"nfrestore" code:v24 userInfo:v38];
    (*(void (**)(uint64_t, void, void *))(v37 + 16))(v37, 0, v39);
  }
  else
  {
    (*(void (**)(void, void, void))(v37 + 16))(*(void *)(a1 + 48), 0, 0);
  }
  uint64_t v40 = *(void *)(*(void *)(a1 + 64) + 8);
  v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = 0;
}

uint64_t NFLogGetLogger()
{
  return _NFLogGetLogger();
}

uint64_t NFSharedLogGetLogger()
{
  return _NFSharedLogGetLogger();
}

uint64_t NfRestore()
{
  return _NfRestore();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkCurrentuser(void *a1, const char *a2, ...)
{
  return [a1 checkCurrentuser];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}