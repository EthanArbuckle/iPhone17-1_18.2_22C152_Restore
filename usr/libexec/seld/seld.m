void sub_10000AA9C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  BOOL isMetaClass;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;

  v3 = a2;
  if (v3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v8 = 45;
      if (isMetaClass) {
        v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v8, ClassName, Name, 864, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        v11 = 43;
      }
      else {
        v11 = 45;
      }
      v12 = object_getClassName(*(id *)(a1 + 32));
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2082;
      v21 = v13;
      v22 = 1024;
      v23 = 864;
      v24 = 2114;
      v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000AD58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v8, ClassName, Name, 888, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      v12 = object_getClassName(*(id *)(a1 + 32));
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v17 = v11;
      __int16 v18 = 2082;
      v19 = v12;
      __int16 v20 = 2082;
      v21 = v13;
      __int16 v22 = 1024;
      int v23 = 888;
      __int16 v24 = 2114;
      id v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000B0B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v8, ClassName, Name, 949, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      v12 = object_getClassName(*(id *)(a1 + 32));
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v17 = v11;
      __int16 v18 = 2082;
      v19 = v12;
      __int16 v20 = 2082;
      v21 = v13;
      __int16 v22 = 1024;
      int v23 = 949;
      __int16 v24 = 2114;
      id v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000B368(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v8, ClassName, Name, 973, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      v12 = object_getClassName(*(id *)(a1 + 32));
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v17 = v11;
      __int16 v18 = 2082;
      v19 = v12;
      __int16 v20 = 2082;
      v21 = v13;
      __int16 v22 = 1024;
      int v23 = 973;
      __int16 v24 = 2114;
      id v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000C0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C134(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C144(uint64_t a1)
{
}

void sub_10000C14C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i reader session started", v11, ClassName, Name, 1010);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v31 = v14;
    __int16 v32 = 2082;
    v33 = v15;
    __int16 v34 = 2082;
    v35 = v16;
    __int16 v36 = 1024;
    int v37 = 1010;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i reader session started", buf, 0x22u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v5)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v17 = NFLogGetLogger();
    if (v17)
    {
      __int16 v18 = (void (*)(uint64_t, const char *, ...))v17;
      v19 = object_getClass(*(id *)(a1 + 32));
      BOOL v20 = class_isMetaClass(v19);
      v27 = object_getClassName(*(id *)(a1 + 32));
      v29 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v21 = 45;
      if (v20) {
        uint64_t v21 = 43;
      }
      v18(3, "%c[%{public}s %{public}s]:%i %{public}@", v21, v27, v29, 1014, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      id v25 = object_getClassName(*(id *)(a1 + 32));
      v26 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v31 = v24;
      __int16 v32 = 2082;
      v33 = v25;
      __int16 v34 = 2082;
      v35 = v26;
      __int16 v36 = 1024;
      int v37 = 1014;
      __int16 v38 = 2114;
      id v39 = v5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 104));
}

void sub_100011820(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000136B0(void *a1, int a2, double a3)
{
  if (a1)
  {
    v6 = [a1 redirectState];
    v7 = [v6 performanceMetrics];
    [v7 totalNetworkResponseTime];
    [v7 setTotalNetworkResponseTime:v8 + a3];

    v9 = [a1 redirectState];
    v10 = [v9 performanceMetrics];
    [v10 maxNetworkResponseTime];
    double v12 = v11;

    if (v12 < a3)
    {
      v13 = [a1 redirectState];
      int v14 = [v13 performanceMetrics];
      [v14 setMaxNetworkResponseTime:a3];

      v15 = [a1 redirectState];
      v16 = [v15 performanceMetrics];
      id v17 = [v16 totalResponsesWithBody];
      __int16 v18 = [a1 redirectState];
      v19 = [v18 performanceMetrics];
      [v19 setTransferWithMaxResponseTime:v17];
    }
    if (a2)
    {
      id v21 = [a1 redirectState];
      BOOL v20 = [v21 performanceMetrics];
      [v20 setTotalResponsesWithBody:[v20 totalResponsesWithBody] + 1];
    }
  }
}

void sub_10001484C(_DWORD *a1, uint64_t a2)
{
  int v3 = a1[9];
  if (v3 <= 27)
  {
    switch(v3)
    {
      case 9:
      case 16:
        goto LABEL_8;
      case 13:
      case 15:
        v4 = [a1 redirectState];
        CFStringRef v5 = @"SEAccessError";
        goto LABEL_10;
      default:
        goto LABEL_14;
    }
  }
  switch(v3)
  {
    case 66:
LABEL_8:
      v4 = [a1 redirectState];
      CFStringRef v5 = @"ScriptExecutionError";
      goto LABEL_10;
    case 65:
      v4 = [a1 redirectState];
      CFStringRef v5 = @"AIDNotFound";
      goto LABEL_10;
    case 28:
      v4 = [a1 redirectState];
      CFStringRef v5 = @"CardNotFound";
LABEL_10:
      id v21 = v4;
      [v4 setIncompleteReason:v5];
LABEL_11:

      return;
  }
LABEL_14:
  if (a2 == 16 || v3 == 7)
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@(reason=%ld)", @"Cancel", 5];
LABEL_21:
    id v21 = v6;
    v7 = [a1 redirectState];
    [v7 setIncompleteReason:v21];

    goto LABEL_11;
  }
  if (a2 != 1 && v3 != 3)
  {
    switch(a2)
    {
      case 0:
      case 3:
      case 8:
        return;
      case 1:
      case 4:
      case 5:
      case 6:
      case 7:
        goto LABEL_34;
      case 2:
        v4 = [a1 redirectState];
        CFStringRef v5 = @"NetworkUnavailable";
        goto LABEL_10;
      default:
        if (a2 == 15)
        {
          v4 = [a1 redirectState];
          CFStringRef v5 = @"NetworkError";
          goto LABEL_10;
        }
LABEL_34:
        id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown error:%d", a1[9], v19];
        break;
    }
    goto LABEL_21;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName("_processRedirectInProgressResult:");
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i connection aborted", v13, ClassName, Name, 510);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(a1);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v23 = v16;
    __int16 v24 = 2082;
    id v25 = object_getClassName(a1);
    __int16 v26 = 2082;
    v27 = sel_getName("_processRedirectInProgressResult:");
    __int16 v28 = 1024;
    int v29 = 510;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i connection aborted", buf, 0x22u);
  }

  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%@(reason=%d)", @"Cancel", [a1 abortedReason]];
  __int16 v18 = [a1 redirectState];
  [v18 setIncompleteReason:v17];
}

void sub_1000166A4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 697, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      int v16 = object_getClassName(*(id *)(a1 + 32));
      id v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v21 = v15;
      __int16 v22 = 2082;
      int v23 = v16;
      __int16 v24 = 2082;
      id v25 = v17;
      __int16 v26 = 1024;
      int v27 = 697;
      __int16 v28 = 2114;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else if (([*(id *)(a1 + 32) aborted] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100017024(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFRemoteAdminManagerInterface];
  v2 = (void *)qword_1000603B8;
  qword_1000603B8 = v1;

  id v10 = +[NFRemoteAdminManagerCallbacks interface];
  [(id)qword_1000603B8 setInterface:v10 forSelector:"registerForCallbacks:" argumentIndex:0 ofReply:0];
  [(id)qword_1000603B8 setInterface:v10 forSelector:"unregisterForCallbacks:" argumentIndex:0 ofReply:0];
  int v3 = (void *)qword_1000603B8;
  id v4 = objc_alloc((Class)NSSet);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v9 = [v4 initWithObjects:v5, v6, v7, v8, objc_opt_class(), 0];
  [v3 setClasses:v9 forSelector:"getSELDInfoForBrokerWithCompletion:" argumentIndex:0 ofReply:1];
}

void sub_1000171D0(id a1)
{
  qword_1000603C8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks];

  _objc_release_x1();
}

uint64_t start()
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    uintptr_t v2 = dword_1000450E8[i];
    signal(dword_1000450E8[i], (void (__cdecl *)(int))1);
    dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v2, 0, 0);
    dispatch_source_t v4 = qword_1000603D8[i];
    qword_1000603D8[i] = v3;

    dispatch_set_context(qword_1000603D8[i], (void *)v2);
    dispatch_source_set_event_handler_f(qword_1000603D8[i], (dispatch_function_t)sub_100018FB0);
    dispatch_resume(qword_1000603D8[i]);
  }
  +[NSError _setFileNameLocalizationEnabled:0];
  NFSetThreadPriority();
  id v5 = objc_alloc_init((Class)NFPreferenceObserver);
  [v5 start:&stru_100058840];
  uint64_t v6 = sub_10001AEC4();
  sub_10001E4EC(v6);

  do
  {
    CFRunLoopGetCurrent();
    int v8 = CFRunLoopRunSpecific();
  }
  while ((v8 - 3) < 0xFFFFFFFE);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i Exiting", "main", 141);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = "main";
    __int16 v14 = 1024;
    int v15 = 141;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Exiting", buf, 0x12u);
  }

  return 0;
}

void sub_100018FB0(uint64_t a1)
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(5, "%s:%i Received signal: %lu", "signalHandler", 87, a1);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_source_t v3 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v7 = "signalHandler";
    __int16 v8 = 1024;
    int v9 = 87;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Received signal: %lu", buf, 0x1Cu);
  }

  dispatch_source_t v4 = sub_10001AEC4();
  sub_10001ED8C(v4);

  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

void sub_1000190E4(id a1)
{
  sub_10001AEC4();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  sub_10002012C((uint64_t)v1);
}

void sub_100019444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000194E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100019654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100019D10(uint64_t a1)
{
  [*(id *)(a1 + 128) lock];
  uint64_t v2 = *(void *)(a1 + 120);
  *(void *)(a1 + 120) = v2 + 1;
  if (!v2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      dispatch_source_t v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass((id)a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName((id)a1);
      Name = sel_getName("_keepAliveTransactionRetain");
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v4(5, "%c[%{public}s %{public}s]:%i creating SELD keep alive transaction", v8, ClassName, Name, 818);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = object_getClass((id)a1);
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v29 = v11;
      __int16 v30 = 2082;
      int v31 = object_getClassName((id)a1);
      __int16 v32 = 2082;
      v33 = sel_getName("_keepAliveTransactionRetain");
      __int16 v34 = 1024;
      int v35 = 818;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i creating SELD keep alive transaction", buf, 0x22u);
    }

    if (*(void *)(a1 + 112))
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v15 = NFLogGetLogger();
      if (v15)
      {
        int v16 = (void (*)(uint64_t, const char *, ...))v15;
        id v17 = object_getClass((id)a1);
        BOOL v18 = class_isMetaClass(v17);
        id v25 = object_getClassName((id)a1);
        int v27 = sel_getName("_keepAliveTransactionRetain");
        uint64_t v19 = 45;
        if (v18) {
          uint64_t v19 = 43;
        }
        v16(3, "%c[%{public}s %{public}s]:%i FAILED: %s", v19, v25, v27, 819, "_keepAliveTransaction == ((void *)0)");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v20 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = object_getClass((id)a1);
        if (class_isMetaClass(v21)) {
          int v22 = 43;
        }
        else {
          int v22 = 45;
        }
        int v23 = object_getClassName((id)a1);
        __int16 v24 = sel_getName("_keepAliveTransactionRetain");
        *(_DWORD *)buf = 67110146;
        int v29 = v22;
        __int16 v30 = 2082;
        int v31 = v23;
        __int16 v32 = 2082;
        v33 = v24;
        __int16 v34 = 1024;
        int v35 = 819;
        __int16 v36 = 2080;
        int v37 = "_keepAliveTransaction == ((void *)0)";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i FAILED: %s", buf, 0x2Cu);
      }

      abort();
    }
    uint64_t v12 = os_transaction_create();
    uint64_t v13 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = v12;
  }
  return [*(id *)(a1 + 128) unlock];
}

void sub_10001A008(uint64_t a1)
{
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "_NFRemoteAdminManager NotifyBatteryChange", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v2, &v5);
  os_activity_scope_leave(&v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_source_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[155])
    {
      sub_10001A874(WeakRetained);
      if (!v4[155]) {
        sub_10001A0A0(v4);
      }
    }
  }
}

void sub_10001A0A0(atomic_uchar *a1)
{
  if (a1)
  {
    unsigned __int8 v2 = atomic_exchange(a1 + 154, 1u);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    dispatch_source_t v4 = (void (*)(uint64_t, const char *, ...))Logger;
    if (v2)
    {
      if (Logger)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName("_queueStartNextSession");
        uint64_t v15 = 45;
        if (isMetaClass) {
          uint64_t v15 = 43;
        }
        v4(6, "%c[%{public}s %{public}s]:%i _startNextSession is already in queued up.", v15, ClassName, Name, 2212);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = object_getClass(a1);
        if (class_isMetaClass(v17)) {
          int v18 = 43;
        }
        else {
          int v18 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v23 = v18;
        __int16 v24 = 2082;
        id v25 = object_getClassName(a1);
        __int16 v26 = 2082;
        int v27 = sel_getName("_queueStartNextSession");
        __int16 v28 = 1024;
        int v29 = 2212;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i _startNextSession is already in queued up.", buf, 0x22u);
      }
    }
    else
    {
      if (Logger)
      {
        os_activity_scope_state_s v5 = object_getClass(a1);
        BOOL v6 = class_isMetaClass(v5);
        uint64_t v7 = object_getClassName(a1);
        uint64_t v19 = sel_getName("_queueStartNextSession");
        uint64_t v8 = 45;
        if (v6) {
          uint64_t v8 = 43;
        }
        v4(6, "%c[%{public}s %{public}s]:%i Adding _startNextSession to SessionQueue.", v8, v7, v19, 2207);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = object_getClass(a1);
        if (class_isMetaClass(v10)) {
          int v11 = 43;
        }
        else {
          int v11 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v23 = v11;
        __int16 v24 = 2082;
        id v25 = object_getClassName(a1);
        __int16 v26 = 2082;
        int v27 = sel_getName("_queueStartNextSession");
        __int16 v28 = 1024;
        int v29 = 2207;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding _startNextSession to SessionQueue.", buf, 0x22u);
      }

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10003022C;
      v21[3] = &unk_100058990;
      v21[4] = a1;
      sub_10001E258((uint64_t)a1, v21);
    }
  }
}

void sub_10001A390(uint64_t a1)
{
  unsigned __int8 v2 = _os_activity_create((void *)&_mh_execute_header, "_NFRemoteAdminManager NotifyAdapterChange", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    os_activity_scope_state_s v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(WeakRetained);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(WeakRetained);
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Charging state changed", v9, ClassName, Name, 178);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = object_getClass(WeakRetained);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(WeakRetained);
    __int16 v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v12;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v13;
    __int16 v17 = 2082;
    int v18 = v14;
    __int16 v19 = 1024;
    int v20 = 178;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Charging state changed", state, 0x22u);
  }

  if (WeakRetained)
  {
    if (WeakRetained[155])
    {
      sub_10001A874(WeakRetained);
      if (!WeakRetained[155]) {
        sub_10001A0A0(WeakRetained);
      }
    }
  }
}

id *sub_10001A57C(id *result)
{
  if (result)
  {
    id v1 = result;
    [result[16] lock];
    uint64_t v2 = (uint64_t)v1[15];
    if (v2 <= 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v15 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v1);
        Name = sel_getName("_keepAliveTransactionRelease");
        uint64_t v18 = 45;
        if (isMetaClass) {
          uint64_t v18 = 43;
        }
        v15(3, "%c[%{public}s %{public}s]:%i FAILED: %s", v18, ClassName, Name, 829, "_keepAliveTransactionCount > 0");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = object_getClass(v1);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v26 = v21;
        __int16 v27 = 2082;
        __int16 v28 = object_getClassName(v1);
        __int16 v29 = 2082;
        __int16 v30 = sel_getName("_keepAliveTransactionRelease");
        __int16 v31 = 1024;
        int v32 = 829;
        __int16 v33 = 2080;
        __int16 v34 = "_keepAliveTransactionCount > 0";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i FAILED: %s", buf, 0x2Cu);
      }

      abort();
    }
    uint64_t v3 = v2 - 1;
    v1[15] = (id)v3;
    if (!v3)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v4 = NFLogGetLogger();
      if (v4)
      {
        os_activity_scope_state_s v5 = (void (*)(uint64_t, const char *, ...))v4;
        BOOL v6 = object_getClass(v1);
        BOOL v7 = class_isMetaClass(v6);
        uint64_t v8 = object_getClassName(v1);
        int v23 = sel_getName("_keepAliveTransactionRelease");
        uint64_t v9 = 45;
        if (v7) {
          uint64_t v9 = 43;
        }
        v5(6, "%c[%{public}s %{public}s]:%i releasing SELD keep alive transaction", v9, v8, v23, 832);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v10 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = object_getClass(v1);
        if (class_isMetaClass(v11)) {
          int v12 = 43;
        }
        else {
          int v12 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v26 = v12;
        __int16 v27 = 2082;
        __int16 v28 = object_getClassName(v1);
        __int16 v29 = 2082;
        __int16 v30 = sel_getName("_keepAliveTransactionRelease");
        __int16 v31 = 1024;
        int v32 = 832;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i releasing SELD keep alive transaction", buf, 0x22u);
      }

      id v13 = v1[14];
      v1[14] = 0;
    }
    return (id *)[v1[16] unlock];
  }
  return result;
}

void sub_10001A874(uint64_t a1)
{
  if (!a1 || (NFProductIsDevBoard() & 1) != 0 || IOPSGetPercentRemaining()) {
    return;
  }
  *(unsigned char *)(a1 + 155) = 0;
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "stopListeningForBatteryChanges", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)buf = 0;
  *(void *)__int16 v17 = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)buf);
  os_activity_scope_leave((os_activity_scope_state_t)buf);

  int v3 = *(_DWORD *)(a1 + 156);
  if (v3 == -1)
  {
    os_activity_scope_state_s v5 = (_DWORD *)(a1 + 160);
    int v4 = *(_DWORD *)(a1 + 160);
    if (v4 == -1) {
      return;
    }
  }
  else
  {
    notify_cancel(v3);
    os_activity_scope_state_s v5 = (_DWORD *)(a1 + 160);
    int v4 = *(_DWORD *)(a1 + 160);
    *(_DWORD *)(a1 + 156) = -1;
    if (v4 == -1) {
      goto LABEL_9;
    }
  }
  notify_cancel(v4);
  *os_activity_scope_state_s v5 = -1;
LABEL_9:
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass((id)a1);
    if (class_isMetaClass(Class)) {
      uint64_t v8 = 43;
    }
    else {
      uint64_t v8 = 45;
    }
    ClassName = object_getClassName((id)a1);
    Name = sel_getName("stopListeningForBatteryChanges");
    Logger(6, "%c[%{public}s %{public}s]:%i Stopped listening for battery notifications", v8, ClassName, Name, 209);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass((id)a1);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    __int16 v14 = object_getClassName((id)a1);
    uint64_t v15 = sel_getName("stopListeningForBatteryChanges");
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v13;
    *(_WORD *)__int16 v17 = 2082;
    *(void *)&v17[2] = v14;
    __int16 v18 = 2082;
    __int16 v19 = v15;
    __int16 v20 = 1024;
    int v21 = 209;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Stopped listening for battery notifications", buf, 0x22u);
  }

  sub_10001A57C((id *)a1);
}

void sub_10001AE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10001AEC4()
{
  self;
  if (qword_100060410 != -1) {
    dispatch_once(&qword_100060410, &stru_1000588B0);
  }
  v0 = (void *)qword_100060408;

  return v0;
}

void sub_10001AF1C(id a1)
{
  qword_100060408 = objc_alloc_init(_NFRemoteAdminManager);

  _objc_release_x1();
}

void sub_10001BBE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 184));
  _Unwind_Resume(a1);
}

void sub_10001BC04(uint64_t a1, void *a2, uint64_t a3)
{
  os_activity_scope_state_s v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    switch(a3)
    {
      case 1:
        BOOL v7 = "WiFi";
        break;
      case 2:
        BOOL v7 = "Cellular";
        break;
      case 4:
        BOOL v7 = "Wired";
        break;
      case 8:
        BOOL v7 = "Other";
        break;
      default:
        BOOL v7 = "Unknown";
        break;
    }
    nw_path_status_t status = nw_path_get_status(v5);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    __int16 v10 = (void (*)(uint64_t, const char *, ...))Logger;
    if (status == nw_path_status_satisfied)
    {
      if (Logger)
      {
        Class = object_getClass(WeakRetained);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(WeakRetained);
        Name = sel_getName(*(SEL *)(a1 + 40));
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i %s is enabled", v13, ClassName, Name, 347, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = object_getClass(WeakRetained);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        __int16 v17 = object_getClassName(WeakRetained);
        __int16 v18 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        int v57 = v16;
        __int16 v58 = 2082;
        v59 = v17;
        __int16 v60 = 2082;
        v61 = v18;
        __int16 v62 = 1024;
        int v63 = 347;
        __int16 v64 = 2080;
        v65 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s is enabled", buf, 0x2Cu);
      }

      if (nw_path_is_constrained(v5))
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v19 = NFLogGetLogger();
        if (v19)
        {
          __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
          int v21 = object_getClass(WeakRetained);
          BOOL v22 = class_isMetaClass(v21);
          v49 = object_getClassName(WeakRetained);
          v53 = sel_getName(*(SEL *)(a1 + 40));
          uint64_t v23 = 45;
          if (v22) {
            uint64_t v23 = 43;
          }
          v20(6, "%c[%{public}s %{public}s]:%i %s network is constrained", v23, v49, v53, 350, v7);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v24 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = object_getClass(WeakRetained);
          if (class_isMetaClass(v25)) {
            int v26 = 43;
          }
          else {
            int v26 = 45;
          }
          __int16 v27 = object_getClassName(WeakRetained);
          __int16 v28 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          int v57 = v26;
          __int16 v58 = 2082;
          v59 = v27;
          __int16 v60 = 2082;
          v61 = v28;
          __int16 v62 = 1024;
          int v63 = 350;
          __int16 v64 = 2080;
          v65 = v7;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s network is constrained", buf, 0x2Cu);
        }
      }
      if (nw_path_is_expensive(v5))
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v29 = NFLogGetLogger();
        if (v29)
        {
          __int16 v30 = (void (*)(uint64_t, const char *, ...))v29;
          __int16 v31 = object_getClass(WeakRetained);
          BOOL v32 = class_isMetaClass(v31);
          v50 = object_getClassName(WeakRetained);
          v54 = sel_getName(*(SEL *)(a1 + 40));
          uint64_t v33 = 45;
          if (v32) {
            uint64_t v33 = 43;
          }
          v30(6, "%c[%{public}s %{public}s]:%i %s network is expensive", v33, v50, v54, 354, v7);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v34 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = object_getClass(WeakRetained);
          if (class_isMetaClass(v35)) {
            int v36 = 43;
          }
          else {
            int v36 = 45;
          }
          int v37 = object_getClassName(WeakRetained);
          __int16 v38 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          int v57 = v36;
          __int16 v58 = 2082;
          v59 = v37;
          __int16 v60 = 2082;
          v61 = v38;
          __int16 v62 = 1024;
          int v63 = 354;
          __int16 v64 = 2080;
          v65 = v7;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s network is expensive", buf, 0x2Cu);
        }
      }
      uint64_t v39 = WeakRetained[27];
      WeakRetained[27] = v39 | a3;
      if ((v39 & a3) == 0) {
        sub_10001A0A0((atomic_uchar *)WeakRetained);
      }
    }
    else
    {
      if (Logger)
      {
        v40 = object_getClass(WeakRetained);
        BOOL v41 = class_isMetaClass(v40);
        v51 = object_getClassName(WeakRetained);
        v55 = sel_getName(*(SEL *)(a1 + 40));
        uint64_t v42 = 45;
        if (v41) {
          uint64_t v42 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i %s is disabled", v42, v51, v55, 366, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v43 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = object_getClass(WeakRetained);
        if (class_isMetaClass(v44)) {
          int v45 = 43;
        }
        else {
          int v45 = 45;
        }
        v46 = object_getClassName(WeakRetained);
        v47 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        int v57 = v45;
        __int16 v58 = 2082;
        v59 = v46;
        __int16 v60 = 2082;
        v61 = v47;
        __int16 v62 = 1024;
        int v63 = 366;
        __int16 v64 = 2080;
        v65 = v7;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s is disabled", buf, 0x2Cu);
      }

      WeakRetained[27] &= ~a3;
    }
  }
}

void sub_10001C1C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _os_activity_create((void *)&_mh_execute_header, "wifiMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C250(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _os_activity_create((void *)&_mh_execute_header, "cellularMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C2E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _os_activity_create((void *)&_mh_execute_header, "wiredMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C370(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _os_activity_create((void *)&_mh_execute_header, "otherMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C400(uint64_t a1)
{
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.apsInitTimer", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    os_activity_scope_state_s v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(WeakRetained);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(WeakRetained);
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(4, "%c[%{public}s %{public}s]:%i Timeout waiting for APS, initializing APS anyways.", v9, ClassName, Name, 423);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = object_getClass(WeakRetained);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(WeakRetained);
    __int16 v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v12;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v13;
    __int16 v17 = 2082;
    __int16 v18 = v14;
    __int16 v19 = 1024;
    int v20 = 423;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timeout waiting for APS, initializing APS anyways.", state, 0x22u);
  }

  sub_10001C5D0(WeakRetained);
}

void sub_10001C5D0(void *a1)
{
  if (a1)
  {
    uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "initAPSCompletionHandler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    *(void *)state = 0;
    *(void *)&state[8] = 0;
    os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
    os_activity_scope_leave((os_activity_scope_state_t)state);

    id v3 = a1;
    objc_sync_enter(v3);
    int v4 = *((unsigned __int8 *)v3 + 56);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v4)
    {
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v3);
        if (class_isMetaClass(Class)) {
          uint64_t v7 = 43;
        }
        else {
          uint64_t v7 = 45;
        }
        ClassName = object_getClassName(v3);
        Name = sel_getName("initAPSCompletionHandler");
        Logger(6, "%c[%{public}s %{public}s]:%i APS has initialized", v7, ClassName, Name, 454);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v10 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      int v11 = object_getClass(v3);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(v3);
      __int16 v14 = sel_getName("initAPSCompletionHandler");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v12;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v13;
      __int16 v51 = 2082;
      v52 = v14;
      __int16 v53 = 1024;
      int v54 = 454;
      uint64_t v15 = "%c[%{public}s %{public}s]:%i APS has initialized";
      int v16 = v10;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      __int16 v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v19)
      {
        int v20 = object_getClass(v3);
        if (class_isMetaClass(v20)) {
          uint64_t v21 = 43;
        }
        else {
          uint64_t v21 = 45;
        }
        BOOL v22 = object_getClassName(v3);
        uint64_t v23 = sel_getName("initAPSCompletionHandler");
        v19(6, "%c[%{public}s %{public}s]:%i Initializing APS", v21, v22, v23, 458);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = object_getClass(v3);
        if (class_isMetaClass(v25)) {
          int v26 = 43;
        }
        else {
          int v26 = 45;
        }
        __int16 v27 = object_getClassName(v3);
        __int16 v28 = sel_getName("initAPSCompletionHandler");
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v26;
        *(_WORD *)&state[8] = 2082;
        *(void *)&state[10] = v27;
        __int16 v51 = 2082;
        v52 = v28;
        __int16 v53 = 1024;
        int v54 = 458;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Initializing APS", state, 0x22u);
      }

      *((unsigned char *)v3 + 56) = 1;
      [v3[8] stopTimer];
      id v29 = v3[8];
      v3[8] = 0;

      int v30 = *((unsigned __int8 *)v3 + 8);
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if (v30)
      {
        __int16 v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v31)
        {
          BOOL v32 = object_getClass(v3);
          if (class_isMetaClass(v32)) {
            uint64_t v33 = 43;
          }
          else {
            uint64_t v33 = 45;
          }
          __int16 v34 = object_getClassName(v3);
          int v35 = sel_getName("initAPSCompletionHandler");
          v31(6, "%c[%{public}s %{public}s]:%i Runnning through delayed XPCs", v33, v34, v35, 464);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v36 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = object_getClass(v3);
          if (class_isMetaClass(v37)) {
            int v38 = 43;
          }
          else {
            int v38 = 45;
          }
          uint64_t v39 = object_getClassName(v3);
          v40 = sel_getName("initAPSCompletionHandler");
          *(_DWORD *)state = 67109890;
          *(_DWORD *)&state[4] = v38;
          *(_WORD *)&state[8] = 2082;
          *(void *)&state[10] = v39;
          __int16 v51 = 2082;
          v52 = v40;
          __int16 v53 = 1024;
          int v54 = 464;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Runnning through delayed XPCs", state, 0x22u);
        }

        [v3[21] enumerateObjectsUsingBlock:&stru_100058968];
        [v3[21] removeAllObjects];
        char v18 = 0;
        goto LABEL_37;
      }
      BOOL v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v41)
      {
        uint64_t v42 = object_getClass(v3);
        if (class_isMetaClass(v42)) {
          uint64_t v43 = 43;
        }
        else {
          uint64_t v43 = 45;
        }
        v44 = object_getClassName(v3);
        int v45 = sel_getName("initAPSCompletionHandler");
        v41(4, "%c[%{public}s %{public}s]:%i Skipped delayXPCs processing.", v43, v44, v45, 472);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v10 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        char v18 = 1;
LABEL_37:
        objc_sync_exit(v3);

        if (!((v4 != 0) | v18 & 1)) {
          sub_10001A0A0((atomic_uchar *)v3);
        }
        return;
      }
      v46 = object_getClass(v3);
      if (class_isMetaClass(v46)) {
        int v47 = 43;
      }
      else {
        int v47 = 45;
      }
      v48 = object_getClassName(v3);
      v49 = sel_getName("initAPSCompletionHandler");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v47;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v48;
      __int16 v51 = 2082;
      v52 = v49;
      __int16 v53 = 1024;
      int v54 = 472;
      uint64_t v15 = "%c[%{public}s %{public}s]:%i Skipped delayXPCs processing.";
      int v16 = v10;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, state, 0x22u);
    goto LABEL_14;
  }
}

void sub_10001CB24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CB70(void **a1)
{
  int v45 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v2 = sub_100039B5C(a1[3]);
  id v3 = [v2 allKeys];

  id v4 = [v3 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v45 addObject:v8];
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            __int16 v10 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(a1);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName("_subscribeToPushTopics");
            uint64_t v13 = 45;
            if (isMetaClass) {
              uint64_t v13 = 43;
            }
            v10(4, "%c[%{public}s %{public}s]:%i Discarding invalid entry (%{public}@) in registration dictionary", v13, ClassName, Name, 1920, v8);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v14 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = object_getClass(a1);
            if (class_isMetaClass(v15)) {
              int v16 = 43;
            }
            else {
              int v16 = 45;
            }
            os_log_type_t v17 = object_getClassName(a1);
            char v18 = sel_getName("_subscribeToPushTopics");
            *(_DWORD *)buf = 67110146;
            int v51 = v16;
            __int16 v52 = 2082;
            __int16 v53 = v17;
            __int16 v54 = 2082;
            v55 = v18;
            __int16 v56 = 1024;
            int v57 = 1920;
            __int16 v58 = 2114;
            v59 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Discarding invalid entry (%{public}@) in registration dictionary", buf, 0x2Cu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v5);
  }

  if (![v45 count])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      int v20 = (void (*)(uint64_t, const char *, ...))v19;
      uint64_t v21 = object_getClass(a1);
      BOOL v22 = class_isMetaClass(v21);
      uint64_t v23 = object_getClassName(a1);
      uint64_t v43 = sel_getName("_subscribeToPushTopics");
      uint64_t v24 = 45;
      if (v22) {
        uint64_t v24 = 43;
      }
      v20(6, "%c[%{public}s %{public}s]:%i No push topics registered, setting fake topic", v24, v23, v43, 1926);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = object_getClass(a1);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      __int16 v28 = object_getClassName(a1);
      id v29 = sel_getName("_subscribeToPushTopics");
      *(_DWORD *)buf = 67109890;
      int v51 = v27;
      __int16 v52 = 2082;
      __int16 v53 = v28;
      __int16 v54 = 2082;
      v55 = v29;
      __int16 v56 = 1024;
      int v57 = 1926;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No push topics registered, setting fake topic", buf, 0x22u);
    }

    [v45 addObject:@"com.apple.seld.fake"];
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v30 = NFLogGetLogger();
  if (v30)
  {
    __int16 v31 = (void (*)(uint64_t, const char *, ...))v30;
    BOOL v32 = object_getClass(a1);
    BOOL v33 = class_isMetaClass(v32);
    BOOL v41 = object_getClassName(a1);
    v44 = sel_getName("_subscribeToPushTopics");
    uint64_t v34 = 45;
    if (v33) {
      uint64_t v34 = 43;
    }
    v31(6, "%c[%{public}s %{public}s]:%i Subscribing to push topics: %{public}@", v34, v41, v44, 1930, v45);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v35 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = object_getClass(a1);
    if (class_isMetaClass(v36)) {
      int v37 = 43;
    }
    else {
      int v37 = 45;
    }
    int v38 = object_getClassName(a1);
    uint64_t v39 = sel_getName("_subscribeToPushTopics");
    *(_DWORD *)buf = 67110146;
    int v51 = v37;
    __int16 v52 = 2082;
    __int16 v53 = v38;
    __int16 v54 = 2082;
    v55 = v39;
    __int16 v56 = 1024;
    int v57 = 1930;
    __int16 v58 = 2114;
    v59 = v45;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Subscribing to push topics: %{public}@", buf, 0x2Cu);
  }

  [a1[6] _setEnabledTopics:v45];
}

void sub_10001D08C(id a1, id a2)
{
}

id sub_10001D098(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_opt_new();
    id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
    [v4 setLocale:v5];

    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
    v18[0] = @"APNClientConnected";
    unsigned int v6 = [*(id *)(a1 + 48) isConnected];
    uint64_t v7 = &off_10005B308;
    if (v6) {
      uint64_t v7 = &off_10005B2F0;
    }
    v19[0] = v7;
    v18[1] = @"APNTopicsRegistered";
    uint64_t v8 = [*(id *)(a1 + 48) enabledTopics];
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 48) enabledTopics];
    }
    else
    {
      uint64_t v9 = &__NSArray0__struct;
    }
    v19[1] = v9;
    v18[2] = @"CheckIn";
    if (v3) {
      CFStringRef v10 = v3;
    }
    else {
      CFStringRef v10 = @"manual";
    }
    v16[0] = @"Reason";
    v16[1] = @"PushRxTime";
    v17[0] = v10;
    int v11 = +[NSDate date];
    int v12 = [v4 stringFromDate:v11];
    v17[1] = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    v19[2] = v13;
    __int16 v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    if (v8) {
  }
    }
  else
  {
    __int16 v14 = 0;
  }

  return v14;
}

void sub_10001D388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001D3A0(uint64_t a1)
{
  if (a1)
  {
    *(unsigned char *)(a1 + 153) = 1;
    sub_10001D560((void *)a1);
    sub_10001D630(a1, 0.0);
    sub_10001D70C((void *)a1, (uint64_t)"com.apple.seld.alarm");
    sub_10001D70C((void *)a1, (uint64_t)"com.apple.seld.processing");
    sub_10001D70C((void *)a1, (uint64_t)"com.apple.seld.osupdate");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001DA34;
    handler[3] = &unk_1000589B8;
    handler[4] = a1;
    handler[5] = "_NFLoadSuccess";
    xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
    *(void *)(a1 + 144) = os_state_add_handler();
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 184));
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 192));
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 200));
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 208));
    sub_10001A0A0((atomic_uchar *)a1);
    *(unsigned char *)(a1 + 8) = 1;
    uint64_t v2 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = 0;
  }
}

void sub_10001D518(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[22];
    a1[22] = 0;

    sub_10001D560(a1);
  }
}

void sub_10001D560(void *a1)
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (!obj[4])
    {
      id v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.seld.tsmmanager"];
      id v2 = obj[4];
      obj[4] = v1;

      [obj[4] setDelegate:];
      [obj[4] _setQueue:obj[9]];
      [obj[4] resume];
    }
    objc_sync_exit(obj);
  }
}

void sub_10001D61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001D630(uint64_t a1, double a2)
{
  if (a1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100020194;
    v7[3] = &unk_100058AA0;
    v7[4] = a1;
    v7[5] = "_initializeWhenSEManagerIsReady:";
    id v4 = objc_retainBlock(v7);
    id v5 = v4;
    if (a2 == 0.0)
    {
      ((void (*)(void *))v4[2])(v4);
    }
    else
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
      dispatch_after(v6, *(dispatch_queue_t *)(a1 + 72), v5);
    }
  }
}

void sub_10001D70C(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = +[NSString stringWithCString:a2 encoding:4];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("cancelNetworkActivityWithName:");
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i Canceling activity [%@]", v8, ClassName, Name, 791, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = object_getClass(a1);
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v31 = v11;
      __int16 v32 = 2082;
      BOOL v33 = object_getClassName(a1);
      __int16 v34 = 2082;
      int v35 = sel_getName("cancelNetworkActivityWithName:");
      __int16 v36 = 1024;
      int v37 = 791;
      __int16 v38 = 2112;
      uint64_t v39 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Canceling activity [%@]", buf, 0x2Cu);
    }

    int v12 = +[BGSystemTaskScheduler sharedScheduler];
    id v29 = 0;
    unsigned __int8 v13 = [v12 cancelTaskRequestWithIdentifier:v3 error:&v29];
    id v14 = v29;

    if ((v13 & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v15 = NFLogGetLogger();
      if (v15)
      {
        int v16 = (void (*)(uint64_t, const char *, ...))v15;
        os_log_type_t v17 = object_getClass(a1);
        BOOL v18 = class_isMetaClass(v17);
        uint64_t v19 = object_getClassName(a1);
        __int16 v28 = sel_getName("cancelNetworkActivityWithName:");
        uint64_t v20 = 45;
        if (v18) {
          uint64_t v20 = 43;
        }
        v16(3, "%c[%{public}s %{public}s]:%i Error : Failed to cancel task named %@ : %@", v20, v19, v28, 793, v3, v14);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        BOOL v22 = object_getClass(a1);
        if (class_isMetaClass(v22)) {
          int v23 = 43;
        }
        else {
          int v23 = 45;
        }
        uint64_t v24 = object_getClassName(a1);
        id v25 = sel_getName("cancelNetworkActivityWithName:");
        *(_DWORD *)buf = 67110402;
        int v31 = v23;
        __int16 v32 = 2082;
        BOOL v33 = v24;
        __int16 v34 = 2082;
        int v35 = v25;
        __int16 v36 = 1024;
        int v37 = 793;
        __int16 v38 = 2112;
        uint64_t v39 = v3;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : Failed to cancel task named %@ : %@", buf, 0x36u);
      }
    }
  }
}

void sub_10001DA34(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  id v5 = (void (*)(uint64_t, const char *, ...))Logger;
  if (string)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i notif: %s", v8, ClassName, Name, 567, string);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      int v12 = object_getClassName(*(id *)(a1 + 32));
      unsigned __int8 v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v11;
      *(_WORD *)v68 = 2082;
      *(void *)&v68[2] = v12;
      *(_WORD *)&v68[10] = 2082;
      *(void *)&v68[12] = v13;
      *(_WORD *)&v68[20] = 1024;
      *(_DWORD *)&v68[22] = 567;
      *(_WORD *)&v68[26] = 2080;
      *(void *)&v68[28] = string;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i notif: %s", buf, 0x2Cu);
    }

    if (!strncmp("com.apple.nfcd.se.restricted", string, 0x1CuLL))
    {
      id v14 = *(void **)(a1 + 32);
      if (v14)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v15 = NFLogGetLogger();
        if (v15)
        {
          int v16 = (void (*)(uint64_t, const char *, ...))v15;
          os_log_type_t v17 = object_getClass(v14);
          BOOL v18 = class_isMetaClass(v17);
          uint64_t v19 = object_getClassName(v14);
          __int16 v62 = sel_getName("restrictedModeEntered:");
          uint64_t v20 = 45;
          if (v18) {
            uint64_t v20 = 43;
          }
          v16(6, "%c[%{public}s %{public}s]:%i ", v20, v19, v62, 1936);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v21 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v22 = object_getClass(v14);
          if (class_isMetaClass(v22)) {
            int v23 = 43;
          }
          else {
            int v23 = 45;
          }
          uint64_t v24 = object_getClassName(v14);
          id v25 = sel_getName("restrictedModeEntered:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v23;
          *(_WORD *)v68 = 2082;
          *(void *)&v68[2] = v24;
          *(_WORD *)&v68[10] = 2082;
          *(void *)&v68[12] = v25;
          *(_WORD *)&v68[20] = 1024;
          *(_DWORD *)&v68[22] = 1936;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
        }

        *(void *)buf = _NSConcreteStackBlock;
        *(void *)v68 = 3221225472;
        *(void *)&v68[8] = sub_10002D4C8;
        *(void *)&v68[16] = &unk_100058990;
        *(void *)&v68[24] = v14;
        sub_10001E258((uint64_t)v14, buf);
      }
    }
    if (!strncmp("com.apple.nfcd.se.restricted.exit", string, 0x21uLL))
    {
      int v26 = *(void **)(a1 + 32);
      if (v26)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v27 = NFLogGetLogger();
        if (v27)
        {
          __int16 v28 = (void (*)(uint64_t, const char *, ...))v27;
          id v29 = object_getClass(v26);
          BOOL v30 = class_isMetaClass(v29);
          int v31 = object_getClassName(v26);
          int v63 = sel_getName("restrictedModeExited");
          uint64_t v32 = 45;
          if (v30) {
            uint64_t v32 = 43;
          }
          v28(6, "%c[%{public}s %{public}s]:%i ", v32, v31, v63, 1948);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v33 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = object_getClass(v26);
          if (class_isMetaClass(v34)) {
            int v35 = 43;
          }
          else {
            int v35 = 45;
          }
          __int16 v36 = object_getClassName(v26);
          int v37 = sel_getName("restrictedModeExited");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v35;
          *(_WORD *)v68 = 2082;
          *(void *)&v68[2] = v36;
          *(_WORD *)&v68[10] = 2082;
          *(void *)&v68[12] = v37;
          *(_WORD *)&v68[20] = 1024;
          *(_DWORD *)&v68[22] = 1948;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
        }

        *(void *)buf = _NSConcreteStackBlock;
        *(void *)v68 = 3221225472;
        *(void *)&v68[8] = sub_10002D53C;
        *(void *)&v68[16] = &unk_100058990;
        *(void *)&v68[24] = v26;
        sub_10001E258((uint64_t)v26, buf);
      }
    }
    if (!strncmp("com.apple.nfcd.se.restrictedperformance", string, 0x27uLL))
    {
      __int16 v38 = *(void **)(a1 + 32);
      if (v38)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v39 = NFLogGetLogger();
        if (v39)
        {
          __int16 v40 = (void (*)(uint64_t, const char *, ...))v39;
          id v41 = object_getClass(v38);
          BOOL v42 = class_isMetaClass(v41);
          uint64_t v43 = object_getClassName(v38);
          __int16 v64 = sel_getName("restrictedPerformanceModeEntered:");
          uint64_t v44 = 45;
          if (v42) {
            uint64_t v44 = 43;
          }
          v40(6, "%c[%{public}s %{public}s]:%i ", v44, v43, v64, 1961);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v45 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          long long v46 = object_getClass(v38);
          if (class_isMetaClass(v46)) {
            int v47 = 43;
          }
          else {
            int v47 = 45;
          }
          long long v48 = object_getClassName(v38);
          long long v49 = sel_getName("restrictedPerformanceModeEntered:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v47;
          *(_WORD *)v68 = 2082;
          *(void *)&v68[2] = v48;
          *(_WORD *)&v68[10] = 2082;
          *(void *)&v68[12] = v49;
          *(_WORD *)&v68[20] = 1024;
          *(_DWORD *)&v68[22] = 1961;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
        }

        *(void *)buf = _NSConcreteStackBlock;
        *(void *)v68 = 3221225472;
        *(void *)&v68[8] = sub_10002D5AC;
        *(void *)&v68[16] = &unk_100058990;
        *(void *)&v68[24] = v38;
        sub_10001E258((uint64_t)v38, buf);
      }
    }
    if (!strncmp("com.apple.system.powermanagement.poweradapter", string, 0x2DuLL))
    {
      uint64_t v50 = *(void *)(a1 + 32);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_10001E1FC;
      v66[3] = &unk_100058990;
      v66[4] = v50;
      sub_10001E258(v50, v66);
    }
  }
  else
  {
    if (Logger)
    {
      int v51 = object_getClass(*(id *)(a1 + 32));
      BOOL v52 = class_isMetaClass(v51);
      __int16 v53 = object_getClassName(*(id *)(a1 + 32));
      v65 = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v54 = 45;
      if (v52) {
        uint64_t v54 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i No event name: skipping", v54, v53, v65, 564);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v56 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v56)) {
        int v57 = 43;
      }
      else {
        int v57 = 45;
      }
      __int16 v58 = object_getClassName(*(id *)(a1 + 32));
      v59 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v57;
      *(_WORD *)v68 = 2082;
      *(void *)&v68[2] = v58;
      *(_WORD *)&v68[10] = 2082;
      *(void *)&v68[12] = v59;
      *(_WORD *)&v68[20] = 1024;
      *(_DWORD *)&v68[22] = 564;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No event name: skipping", buf, 0x22u);
    }
  }
}

void sub_10001E1FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 155))
  {
    sub_10001A874(*(void *)(a1 + 32));
    if (!*(unsigned char *)(v1 + 155))
    {
      id v3 = *(atomic_uchar **)(a1 + 32);
      sub_10001A0A0(v3);
    }
  }
}

void sub_10001E258(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_100019D10(a1);
    sub_10001FD4C(a1);
    id v4 = +[NSDate now];
    id v5 = *(NSObject **)(a1 + 104);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000300E4;
    block[3] = &unk_100058D48;
    id v8 = v4;
    uint64_t v9 = a1;
    id v10 = v3;
    id v6 = v4;
    dispatch_async(v5, block);
  }
}

_DWORD *sub_10001E338(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1) {
    return 0;
  }
  id v2 = objc_opt_new();
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryRepresentation];
  [v2 setObject:v4 forKeyedSubscript:@"seldSettings"];

  id v5 = +[NFPowerAssertion sharedPowerAssertion];
  id v6 = [v5 dumpState];
  [v2 addEntriesFromDictionary:v6];

  uint64_t v7 = v1;
  objc_sync_enter(v7);
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7[21] count]);
  [v2 setObject:v8 forKeyedSubscript:@"QueuedXPC"];

  objc_sync_exit(v7);
  uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:v2 format:200 options:0 error:0];
  id v10 = [v9 length];
  int v11 = malloc_type_calloc(1uLL, (size_t)v10 + 200, 0xDFF089CuLL);
  *int v11 = 1;
  v11[1] = v10;
  __strlcpy_chk();
  id v12 = v9;
  memcpy(v11 + 50, [v12 bytes], (size_t)v10);

  return v11;
}

void sub_10001E4D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E4EC(void *a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    *(void *)state = 0;
    *(void *)&state[8] = 0;
    os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
    os_activity_scope_leave((os_activity_scope_state_t)state);

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class)) {
        uint64_t v5 = 43;
      }
      else {
        uint64_t v5 = 45;
      }
      ClassName = object_getClassName(a1);
      Name = sel_getName("start");
      Logger(6, "%c[%{public}s %{public}s]:%i Seld started", v5, ClassName, Name, 610);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = object_getClass(a1);
      if (class_isMetaClass(v9)) {
        int v10 = 43;
      }
      else {
        int v10 = 45;
      }
      int v11 = object_getClassName(a1);
      id v12 = sel_getName("start");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v10;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v11;
      __int16 v27 = 2082;
      __int16 v28 = v12;
      __int16 v29 = 1024;
      int v30 = 610;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Seld started", state, 0x22u);
    }

    unsigned __int8 v13 = a1;
    objc_sync_enter(v13);
    if (!*((unsigned char *)v13 + 8))
    {
      id v14 = +[NFPowerAssertion sharedPowerAssertion];
      [v14 setEnableDebug:NFIsInternalBuild()];

      if (([v13[5] registerForEvents] & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v15)
        {
          int v16 = object_getClass(v13);
          if (class_isMetaClass(v16)) {
            uint64_t v17 = 43;
          }
          else {
            uint64_t v17 = 45;
          }
          BOOL v18 = object_getClassName(v13);
          uint64_t v19 = sel_getName("start");
          v15(3, "%c[%{public}s %{public}s]:%i Failed to register for power events", v17, v18, v19, 618);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v20 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = object_getClass(v13);
          if (class_isMetaClass(v21)) {
            int v22 = 43;
          }
          else {
            int v22 = 45;
          }
          int v23 = object_getClassName(v13);
          uint64_t v24 = sel_getName("start");
          *(_DWORD *)state = 67109890;
          *(_DWORD *)&state[4] = v22;
          *(_WORD *)&state[8] = 2082;
          *(void *)&state[10] = v23;
          __int16 v27 = 2082;
          __int16 v28 = v24;
          __int16 v29 = 1024;
          int v30 = 618;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register for power events", state, 0x22u);
        }
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10001E88C;
      v25[3] = &unk_100058A08;
      v25[4] = v13;
      v25[5] = "start";
      +[NFHardwareManager sharedHardwareManager:v25];
    }
    objc_sync_exit(v13);
  }
}

void sub_10001E864(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E88C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 getHwSupport];
  if (v4 != 4)
  {
    if (v4 != 2)
    {
      [v3 registerEventListener:*(void *)(a1 + 32)];
      uint64_t v42 = os_transaction_create();
      uint64_t v43 = *(void *)(a1 + 32);
      uint64_t v44 = *(void **)(v43 + 176);
      *(void *)(v43 + 176) = v42;

      goto LABEL_48;
    }
    id v51 = v3;
    for (int i = 29; ; --i)
    {
      id v6 = *(unsigned char **)(a1 + 32);
      if (v6)
      {
        id v52 = 0;
        uint64_t v7 = +[NFSecureElement embeddedSecureElementWithError:&v52];
        id v8 = v52;
        uint64_t v9 = [v7 info];

        if (v9)
        {
          if (v6[9]) {
            unsigned __int8 v45 = 1;
          }
          else {
            unsigned __int8 v45 = [v9 restrictedMode];
          }
          id v3 = v51;
          v6[9] = v45;
          if (v6[10]) {
            unsigned __int8 v46 = 1;
          }
          else {
            unsigned __int8 v46 = [v9 restrictedPerformanceMode];
          }
          v6[10] = v46;

          sub_10001D3A0(*(void *)(a1 + 32));
          goto LABEL_48;
        }
        if (v8)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            int v11 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(v6);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(v6);
            Name = sel_getName("_validateESE");
            uint64_t v14 = 45;
            if (isMetaClass) {
              uint64_t v14 = 43;
            }
            v11(4, "%c[%{public}s %{public}s]:%i Failed to be eSE - %{public}@", v14, ClassName, Name, 849, v8);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v15 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = object_getClass(v6);
            if (class_isMetaClass(v16)) {
              int v17 = 43;
            }
            else {
              int v17 = 45;
            }
            BOOL v18 = object_getClassName(v6);
            uint64_t v19 = sel_getName("_validateESE");
            *(_DWORD *)buf = 67110146;
            int v54 = v17;
            __int16 v55 = 2082;
            __int16 v56 = v18;
            __int16 v57 = 2082;
            __int16 v58 = v19;
            __int16 v59 = 1024;
            int v60 = 849;
            __int16 v61 = 2114;
            id v62 = v8;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to be eSE - %{public}@", buf, 0x2Cu);
          }
        }
      }
      if (!i)
      {
        sub_10001D518(*(void **)(a1 + 32));
        id v3 = v51;
        goto LABEL_48;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v20 = NFLogGetLogger();
      if (v20)
      {
        uint64_t v21 = (void (*)(uint64_t, const char *, ...))v20;
        int v22 = object_getClass(*(id *)(a1 + 32));
        BOOL v23 = class_isMetaClass(v22);
        uint64_t v24 = object_getClassName(*(id *)(a1 + 32));
        long long v49 = sel_getName(*(SEL *)(a1 + 40));
        uint64_t v25 = 45;
        if (v23) {
          uint64_t v25 = 43;
        }
        v21(3, "%c[%{public}s %{public}s]:%i Failed to query JCOP, delaying check by %d seconds", v25, v24, v49, 636, 2);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v27)) {
          int v28 = 43;
        }
        else {
          int v28 = 45;
        }
        __int16 v29 = object_getClassName(*(id *)(a1 + 32));
        int v30 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        int v54 = v28;
        __int16 v55 = 2082;
        __int16 v56 = v29;
        __int16 v57 = 2082;
        __int16 v58 = v30;
        __int16 v59 = 1024;
        int v60 = 636;
        __int16 v61 = 1024;
        LODWORD(v62) = 2;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query JCOP, delaying check by %d seconds", buf, 0x28u);
      }

      sleep(2u);
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v31 = NFLogGetLogger();
  if (v31)
  {
    uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
    BOOL v33 = object_getClass(*(id *)(a1 + 32));
    BOOL v34 = class_isMetaClass(v33);
    int v35 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v50 = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v36 = 45;
    if (v34) {
      uint64_t v36 = 43;
    }
    v32(3, "%c[%{public}s %{public}s]:%i nfc not supported, bailing.", v36, v35, v50, 625);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v37 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    __int16 v38 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v38)) {
      int v39 = 43;
    }
    else {
      int v39 = 45;
    }
    __int16 v40 = object_getClassName(*(id *)(a1 + 32));
    id v41 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    int v54 = v39;
    __int16 v55 = 2082;
    __int16 v56 = v40;
    __int16 v57 = 2082;
    __int16 v58 = v41;
    __int16 v59 = 1024;
    int v60 = 625;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i nfc not supported, bailing.", buf, 0x22u);
  }

  sub_10001D518(*(void **)(a1 + 32));
LABEL_48:
}

void sub_10001ED8C(void *a1)
{
  if (!a1) {
    return;
  }
  id v2 = _os_activity_create((void *)&_mh_execute_header, "stop", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(a1);
    if (class_isMetaClass(Class)) {
      uint64_t v5 = 43;
    }
    else {
      uint64_t v5 = 45;
    }
    ClassName = object_getClassName(a1);
    Name = sel_getName("stop");
    Logger(6, "%c[%{public}s %{public}s]:%i Seld stopping", v5, ClassName, Name, 655);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v8 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = object_getClass(a1);
    if (class_isMetaClass(v9)) {
      int v10 = 43;
    }
    else {
      int v10 = 45;
    }
    int v11 = object_getClassName(a1);
    id v12 = sel_getName("stop");
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v10;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v11;
    __int16 v29 = 2082;
    int v30 = v12;
    __int16 v31 = 1024;
    int v32 = 655;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Seld stopping", state, 0x22u);
  }

  id v13 = a1;
  objc_sync_enter(v13);
  uint64_t v14 = sub_10001F100(v13);
  uint64_t v15 = v14;
  if (v14)
  {
    if ([v14 pendingImmediateRetry]) {
      goto LABEL_21;
    }
    uint64_t v16 = [v15 retryInterval];
    int v17 = (void *)v16;
    if (v16) {
      BOOL v18 = *(void **)(v16 + 16);
    }
    else {
      BOOL v18 = 0;
    }
    id v19 = v18;

    if (!v19) {
      goto LABEL_22;
    }
    uint64_t v20 = [v15 retryInterval];
    uint64_t v21 = (void *)v20;
    int v22 = v20 ? *(void **)(v20 + 16) : 0;
    id v23 = v22;
    [v23 timeIntervalSinceNow];
    double v25 = v24;

    if (v25 <= 120.0) {
LABEL_21:
    }
      sub_10001F588(v13, (uint64_t)"com.apple.seld.processing", 120.0);
    else {
      sub_10001FA6C(v13, v15);
    }
  }
LABEL_22:
  if (*((unsigned char *)v13 + 8))
  {
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v13 + 23));
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v13 + 24));
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v13 + 25));
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v13 + 26));
    [*((id *)v13 + 5) unregisterForEvents];
    [*((id *)v13 + 12) abort:3];
    int v26 = (id *)v13;
    objc_sync_enter(v26);
    [v26[4] suspend];
    [v26[4] invalidate];
    [v26[4] setDelegate:0];
    id v27 = v26[4];
    v26[4] = 0;

    objc_sync_exit(v26);
    *((unsigned char *)v13 + 8) = 0;
  }

  objc_sync_exit(v13);
}

void sub_10001F0CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001F100(void *a1)
{
  uint64_t v1 = a1;
  objc_sync_enter(v1);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v48 = v1;
  id v2 = sub_10003D0E0(v1[3]);
  id v3 = [v2 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v3)
  {
    unsigned int v4 = 0;
    uint64_t v5 = 0;
    id v6 = 0;
    uint64_t v7 = *(void *)v56;
    id obj = v2;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v8);
        uint64_t v10 = [v9 retryInterval:v48];

        uint64_t v5 = (void *)v10;
        if ([v9 pendingImmediateRetry])
        {
          id v24 = v9;

          goto LABEL_31;
        }
        if (v10) {
          int v11 = *(void **)(v10 + 16);
        }
        else {
          int v11 = 0;
        }
        id v12 = v11;
        BOOL v13 = v12 == 0;

        if (v13)
        {
          if (v10) {
            *(void *)(v10 + 8) = 0;
          }
          uint64_t v15 = +[NSDate date];
          if (v5) {
            objc_setProperty_nonatomic_copy(v5, v14, v15, 16);
          }

          [v9 updateNextRetryInterval:v5];
          [v9 save];
        }
        if (!v6
          || (!v4 ? (uint64_t v16 = 0) : (uint64_t v16 = (void *)v4[2]),
              (id v17 = v16, !v5) ? (v18 = 0) : (v18 = (void *)v5[2]),
              id v19 = v18,
              BOOL v20 = [v17 compare:v19] == (id)1,
              v19,
              v17,
              v20))
        {
          id v21 = v9;

          int v22 = v5;
          unsigned int v4 = v22;
          id v6 = v21;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v3 != v8);
      id v23 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
      id v3 = v23;
    }
    while (v23);

    if (!v6) {
      goto LABEL_33;
    }
    id v6 = v6;
    id v24 = v6;
LABEL_31:
    objc_sync_exit(v48);
  }
  else
  {

    uint64_t v5 = 0;
    unsigned int v4 = 0;
LABEL_33:
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    double v25 = sub_10003C400(v48[3]);
    int v26 = 0;
    id v27 = [v25 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v52;
      id obja = v25;
      do
      {
        __int16 v29 = 0;
        do
        {
          if (*(void *)v52 != v28) {
            objc_enumerationMutation(obja);
          }
          int v30 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v29);
          uint64_t v31 = [v30 retryInterval:v48];

          uint64_t v5 = (void *)v31;
          if ([v30 pendingImmediateRetry])
          {
            id v46 = v30;

            int v26 = v46;
            double v25 = obja;
            goto LABEL_58;
          }
          if (v31) {
            int v32 = *(void **)(v31 + 16);
          }
          else {
            int v32 = 0;
          }
          id v33 = v32;
          BOOL v34 = v33 == 0;

          if (!v34)
          {
            int v35 = v48[3];
            uint64_t v36 = [v30 serverIdentifier];
            int v37 = sub_10003AFD0(v35, v36);
            LOBYTE(v35) = v37 == 0;

            if ((v35 & 1) == 0)
            {
              if (!v26
                || (!v4 ? (__int16 v38 = 0) : (__int16 v38 = (void *)v4[2]),
                    (id v39 = v38, !v5) ? (v40 = 0) : (v40 = (void *)v5[2]),
                    id v41 = v40,
                    BOOL v42 = [v39 compare:v41] == (id)1,
                    v41,
                    v39,
                    v42))
              {
                id v43 = v30;

                uint64_t v44 = v5;
                unsigned int v4 = v44;
                int v26 = v43;
              }
            }
          }
          __int16 v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        double v25 = obja;
        id v45 = [obja countByEnumeratingWithState:&v51 objects:v59 count:16];
        id v27 = v45;
      }
      while (v45);
    }
LABEL_58:

    objc_sync_exit(v48);
    id v6 = v26;
    id v24 = v6;
  }

  return v24;
}

void sub_10001F558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10001F588(void *a1, uint64_t a2, double a3)
{
  if (a1)
  {
    uint64_t v5 = +[NSString stringWithCString:a2 encoding:4];
    unint64_t v6 = vcvtpd_u64_f64(a3);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(6, "%c[%{public}s %{public}s]:%i Scheduling [%@] for %lld seconds ", v12, ClassName, Name, 764, v5, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = object_getClass(a1);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110402;
      int v48 = v15;
      __int16 v49 = 2082;
      uint64_t v50 = object_getClassName(a1);
      __int16 v51 = 2082;
      long long v52 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
      __int16 v53 = 1024;
      int v54 = 764;
      __int16 v55 = 2112;
      long long v56 = v5;
      __int16 v57 = 2048;
      unint64_t v58 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Scheduling [%@] for %lld seconds ", buf, 0x36u);
    }

    uint64_t v16 = +[BGSystemTaskScheduler sharedScheduler];
    id v17 = [v16 taskRequestForIdentifier:v5];

    if (v17)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v18 = NFLogGetLogger();
      if (v18)
      {
        id v19 = (void (*)(uint64_t, const char *, ...))v18;
        BOOL v20 = object_getClass(a1);
        BOOL v21 = class_isMetaClass(v20);
        int v22 = object_getClassName(a1);
        uint64_t v44 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        uint64_t v23 = 45;
        if (v21) {
          uint64_t v23 = 43;
        }
        v19(4, "%c[%{public}s %{public}s]:%i Warning : activity already scheduled..", v23, v22, v44, 769);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v25 = object_getClass(a1);
        if (class_isMetaClass(v25)) {
          int v26 = 43;
        }
        else {
          int v26 = 45;
        }
        id v27 = object_getClassName(a1);
        uint64_t v28 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        *(_DWORD *)buf = 67109890;
        int v48 = v26;
        __int16 v49 = 2082;
        uint64_t v50 = v27;
        __int16 v51 = 2082;
        long long v52 = v28;
        __int16 v53 = 1024;
        int v54 = 769;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Warning : activity already scheduled..", buf, 0x22u);
      }
      id v29 = 0;
      id v30 = 0;
    }
    else
    {
      id v30 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:v5];
      [v30 setRequiresNetworkConnectivity:1];
      [v30 setRequiresExternalPower:0];
      [v30 setScheduleAfter:a3];
      [v30 setRequiresProtectionClass:4];
      [v30 setPriority:2];
      uint64_t v31 = +[BGSystemTaskScheduler sharedScheduler];
      id v46 = 0;
      unsigned __int8 v32 = [v31 submitTaskRequest:v30 error:&v46];
      id v29 = v46;

      if (v32) {
        goto LABEL_23;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFLogGetLogger();
      if (v33)
      {
        BOOL v34 = (void (*)(uint64_t, const char *, ...))v33;
        int v35 = object_getClass(a1);
        BOOL v36 = class_isMetaClass(v35);
        int v37 = object_getClassName(a1);
        id v45 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        uint64_t v38 = 45;
        if (v36) {
          uint64_t v38 = 43;
        }
        v34(3, "%c[%{public}s %{public}s]:%i Error : Failed to schedule task named %@ : %@", v38, v37, v45, 781, v5, v29);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v39 = object_getClass(a1);
        if (class_isMetaClass(v39)) {
          int v40 = 43;
        }
        else {
          int v40 = 45;
        }
        id v41 = object_getClassName(a1);
        BOOL v42 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        *(_DWORD *)buf = 67110402;
        int v48 = v40;
        __int16 v49 = 2082;
        uint64_t v50 = v41;
        __int16 v51 = 2082;
        long long v52 = v42;
        __int16 v53 = 1024;
        int v54 = 781;
        __int16 v55 = 2112;
        long long v56 = v5;
        __int16 v57 = 2112;
        unint64_t v58 = (unint64_t)v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : Failed to schedule task named %@ : %@", buf, 0x36u);
      }
    }

LABEL_23:
  }
}

void sub_10001FA6C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateFormat:@"dd.MM.YY HH:mm:ss"];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    if (class_isMetaClass(Class)) {
      uint64_t v8 = 43;
    }
    else {
      uint64_t v8 = 45;
    }
    uint64_t v31 = v8;
    ClassName = object_getClassName(a1);
    Name = sel_getName("scheduleCheckIn:");
    uint64_t v11 = [v3 retryInterval];
    uint64_t v12 = (void *)v11;
    if (v11) {
      BOOL v13 = *(void **)(v11 + 16);
    }
    else {
      BOOL v13 = 0;
    }
    id v14 = v13;
    int v15 = [v4 stringFromDate:v14];
    v6(6, "%c[%{public}s %{public}s]:%i Scheduling retry alarm (%s) for: %{public}@", v31, ClassName, Name, 802, "com.apple.seld.alarm", v15);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = object_getClass(a1);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    id v19 = object_getClassName(a1);
    BOOL v20 = sel_getName("scheduleCheckIn:");
    uint64_t v21 = [v3 retryInterval];
    int v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = *(void **)(v21 + 16);
    }
    else {
      uint64_t v23 = 0;
    }
    id v24 = v23;
    double v25 = [v4 stringFromDate:v24];
    *(_DWORD *)buf = 67110402;
    int v33 = v18;
    __int16 v34 = 2082;
    int v35 = v19;
    __int16 v36 = 2082;
    int v37 = v20;
    __int16 v38 = 1024;
    int v39 = 802;
    __int16 v40 = 2080;
    id v41 = "com.apple.seld.alarm";
    __int16 v42 = 2114;
    id v43 = v25;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Scheduling retry alarm (%s) for: %{public}@", buf, 0x36u);
  }
  uint64_t v26 = [v3 retryInterval];
  id v27 = (void *)v26;
  if (v26) {
    uint64_t v28 = *(void **)(v26 + 16);
  }
  else {
    uint64_t v28 = 0;
  }
  id v29 = v28;
  [v29 timeIntervalSinceNow];
  sub_10001F588(a1, (uint64_t)"com.apple.seld.alarm", v30);
}

void sub_10001FD4C(uint64_t a1)
{
  if (a1)
  {
    id v1 = +[NFPowerAssertion sharedPowerAssertion];
    [v1 holdPowerAssertion:@"RemoteAdmin"];
  }
}

void sub_10001FDA4(uint64_t a1)
{
  if (a1)
  {
    id v1 = +[NFPowerAssertion sharedPowerAssertion];
    [v1 releasePowerAssertion:@"RemoteAdmin"];
  }
}

void sub_10001FDFC(void *a1)
{
  if (a1)
  {
    sub_10001D70C(a1, (uint64_t)"com.apple.seld.processing");
    sub_10001F588(a1, (uint64_t)"com.apple.seld.processing", 120.0);
  }
}

void sub_10001FE54(uint64_t a1)
{
  id v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.alarmtriggered", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  sub_10001D70C(*(void **)(a1 + 32), (uint64_t)"com.apple.seld.alarm");
  id v3 = *(atomic_uchar **)(a1 + 32);
  if (v3[8]) {
    sub_10001A0A0(v3);
  }
}

id sub_10001FED8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = +[BGSystemTaskScheduler sharedScheduler];
  uint64_t v8 = *(void *)(a1 + 104);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000200C0;
  v12[3] = &unk_100058A50;
  id v9 = v5;
  id v13 = v9;
  id v10 = [v7 registerForTaskWithIdentifier:v6 usingQueue:v8 launchHandler:v12];

  return v10;
}

void sub_10001FFB8(uint64_t a1)
{
  id v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.processingtriggered", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  sub_10001D70C(*(void **)(a1 + 32), (uint64_t)"com.apple.seld.processing");
  id v3 = *(atomic_uchar **)(a1 + 32);
  if (v3[8]) {
    sub_10001A0A0(v3);
  }
}

void sub_10002003C(uint64_t a1)
{
  id v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.osupdatetriggered", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  sub_10001D70C(*(void **)(a1 + 32), (uint64_t)"com.apple.seld.osupdate");
  id v3 = *(atomic_uchar **)(a1 + 32);
  if (v3[8]) {
    sub_10001A0A0(v3);
  }
}

void sub_1000200C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setExpirationHandler:&stru_100058A28];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v3 setTaskCompleted];
}

void sub_10002012C(uint64_t a1)
{
  if (a1)
  {
    id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm"];
    byte_100060438 = [v1 BOOLForKey:@"LogTSM"];
  }
}

void sub_100020194(uint64_t a1)
{
  id v2 = +[NFHardwareManager sharedHardwareManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020230;
  v4[3] = &unk_100058A78;
  long long v5 = *(_OWORD *)(a1 + 32);
  id v3 = [v2 startSecureElementManagerSessionWithPriority:v4];
}

void sub_100020230(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)32)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        unsigned __int8 v32 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 40));
        uint64_t v36 = 45;
        if (isMetaClass) {
          uint64_t v36 = 43;
        }
        v32(3, "%c[%{public}s %{public}s]:%i Unexpected entitlement issue", v36, ClassName, Name, 887);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        __int16 v40 = object_getClassName(*(id *)(a1 + 32));
        id v41 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67109890;
        int v48 = v39;
        __int16 v49 = 2082;
        uint64_t v50 = v40;
        __int16 v51 = 2082;
        long long v52 = v41;
        __int16 v53 = 1024;
        int v54 = 887;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected entitlement issue", buf, 0x22u);
      }

      exit(1);
    }
    if ([v7 code] == (id)7 || objc_msgSend(v7, "code") == (id)13)
    {
      sub_10001D630(*(void *)(a1 + 32), 5.0);
      goto LABEL_26;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v8 = NFLogGetLogger();
    if (v8)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))v8;
      id v10 = object_getClass(*(id *)(a1 + 32));
      BOOL v11 = class_isMetaClass(v10);
      __int16 v42 = object_getClassName(*(id *)(a1 + 32));
      id v43 = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v12 = 45;
      if (v11) {
        uint64_t v12 = 43;
      }
      v9(4, "%c[%{public}s %{public}s]:%i Permissible error: %{public}@", v12, v42, v43, 899, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      uint64_t v16 = object_getClassName(*(id *)(a1 + 32));
      id v17 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      int v48 = v15;
      __int16 v49 = 2082;
      uint64_t v50 = v16;
      __int16 v51 = 2082;
      long long v52 = v17;
      __int16 v53 = 1024;
      int v54 = 899;
      __int16 v55 = 2114;
      long long v56 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Permissible error: %{public}@", buf, 0x2Cu);
    }
  }
  [v5 endSession];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFLogGetLogger();
  if (v18)
  {
    id v19 = (void (*)(uint64_t, const char *, ...))v18;
    BOOL v20 = object_getClass(*(id *)(a1 + 32));
    BOOL v21 = class_isMetaClass(v20);
    int v22 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v44 = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v23 = 45;
    if (v21) {
      uint64_t v23 = 43;
    }
    v19(6, "%c[%{public}s %{public}s]:%i secure element session is ready, initializing APS", v23, v22, v44, 903);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    double v25 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    id v27 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v28 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    int v48 = v26;
    __int16 v49 = 2082;
    uint64_t v50 = v27;
    __int16 v51 = 2082;
    long long v52 = v28;
    __int16 v53 = 1024;
    int v54 = 903;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i secure element session is ready, initializing APS", buf, 0x22u);
  }

  uint64_t v29 = *(void *)(a1 + 32);
  double v30 = *(NSObject **)(v29 + 80);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000206BC;
  block[3] = &unk_100058990;
  void block[4] = v29;
  dispatch_async(v30, block);
LABEL_26:
}

void sub_1000206BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v3 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass((id)v1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName((id)v1);
      Name = sel_getName("initAPS");
      uint64_t v7 = 45;
      if (isMetaClass) {
        uint64_t v7 = 43;
      }
      v3(6, "%c[%{public}s %{public}s]:%i APS init", v7, ClassName, Name, 415);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = object_getClass((id)v1);
      if (class_isMetaClass(v9)) {
        int v10 = 43;
      }
      else {
        int v10 = 45;
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v10;
      *(_WORD *)int v39 = 2082;
      *(void *)&v39[2] = object_getClassName((id)v1);
      *(_WORD *)&v39[10] = 2082;
      *(void *)&v39[12] = sel_getName("initAPS");
      *(_WORD *)&v39[20] = 1024;
      *(_DWORD *)&v39[22] = 415;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i APS init", buf, 0x22u);
    }

    objc_initWeak(&location, (id)v1);
    *(unsigned char *)(v1 + 56) = 0;
    id v11 = objc_alloc((Class)NFTimer);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)int v39 = 3221225472;
    *(void *)&v39[8] = sub_10001C400;
    *(void *)&v39[16] = &unk_100058928;
    objc_copyWeak((id *)&v39[24], &location);
    __int16 v40 = "initAPS";
    id v12 = [v11 initWithCallback:buf queue:*(void *)(v1 + 104)];
    id v13 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = v12;

    [*(id *)(v1 + 64) startTimer:12.0];
    id v14 = objc_alloc((Class)APSConnection);
    id v15 = [v14 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.seld.aps" queue:*(void *)(v1 + 104)];
    uint64_t v16 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = v15;

    id v17 = *(void **)(v1 + 48);
    if (!v17)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v18)
      {
        id v24 = object_getClass((id)v1);
        if (class_isMetaClass(v24)) {
          uint64_t v25 = 43;
        }
        else {
          uint64_t v25 = 45;
        }
        int v26 = object_getClassName((id)v1);
        id v27 = sel_getName("initAPS");
        v18(3, "%c[%{public}s %{public}s]:%i Unexpected result, exiting", v25, v26, v27, 436);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        BOOL v20 = object_getClass((id)v1);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        int v22 = object_getClassName((id)v1);
        uint64_t v23 = sel_getName("initAPS");
        *(_DWORD *)double v30 = 67109890;
        int v31 = v21;
        __int16 v32 = 2082;
        int v33 = v22;
        __int16 v34 = 2082;
        int v35 = v23;
        __int16 v36 = 1024;
        int v37 = 436;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected result, exiting", v30, 0x22u);
      }

      exit(1);
    }
    [v17 setDelegate:v1];
    sub_10001CB70((void **)v1);
    objc_destroyWeak((id *)&v39[24]);
    objc_destroyWeak(&location);
  }
}

void sub_100020A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020DB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002161C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_10002163C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002164C(uint64_t a1)
{
}

void sub_100021654(uint64_t a1)
{
}

void sub_100021668(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("didCloseXPCConnection:");
      int v10 = [v3 NF_userInfo];
      id v11 = [v10 objectForKeyedSubscript:@"ClientName"];
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i Removing connection for %{public}@ - %{public}@", v12, ClassName, Name, 1015, v11, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = object_getClass(a1);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      uint64_t v16 = object_getClassName(a1);
      id v17 = sel_getName("didCloseXPCConnection:");
      uint64_t v18 = [v3 NF_userInfo];
      id v19 = [v18 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110402;
      int v23 = v15;
      __int16 v24 = 2082;
      uint64_t v25 = v16;
      __int16 v26 = 2082;
      id v27 = v17;
      __int16 v28 = 1024;
      int v29 = 1015;
      __int16 v30 = 2114;
      int v31 = v19;
      __int16 v32 = 2114;
      id v33 = v3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing connection for %{public}@ - %{public}@", buf, 0x36u);
    }
    sub_1000218D4((uint64_t)a1, v3);
    BOOL v20 = [v3 NF_userInfo];
    int v21 = [v20 objectForKeyedSubscript:@"ProxyObjects"];
    [v21 removeAllObjects];
  }
}

void sub_1000218C0(uint64_t a1)
{
}

void sub_1000218D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    id v4 = *(id *)(a1 + 16);
    objc_sync_enter(v4);
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (int)[v6 processIdentifier]);
    [*(id *)(a1 + 16) removeObjectForKey:v5];

    objc_sync_exit(v4);
    id v3 = v6;
  }
}

void sub_100021974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021988(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100021A34;
    v5[3] = &unk_100058AF0;
    id v6 = v3;
    uint64_t v7 = a1;
    uint64_t v8 = "_queueNFRemoteAdminStateForServerIdentifiers:";
    sub_10001E258(a1, v5);
  }
}

void sub_100021A34(uint64_t a1)
{
  uint64_t v1 = a1;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v64 = [v2 countByEnumeratingWithState:&v67 objects:v85 count:16];
  if (v64)
  {
    char v3 = 0;
    uint64_t v63 = *(void *)v68;
    uint64_t v66 = v1;
    id obj = v2;
    do
    {
      id v4 = 0;
      do
      {
        if (*(void *)v68 != v63) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v4);
        id v6 = sub_10003BD48(*(void **)(*(void *)(v1 + 40) + 24), v5);
        uint64_t v7 = v6;
        if (v6)
        {
          uint64_t v8 = [v6 retryInterval];
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          v65 = v5;
          if (Logger)
          {
            int v10 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(Class)) {
              uint64_t v12 = 43;
            }
            else {
              uint64_t v12 = 45;
            }
            ClassName = object_getClassName(*(id *)(v1 + 40));
            Name = sel_getName(*(SEL *)(v1 + 48));
            int v15 = [v7 serverIdentifier];
            if (v8)
            {
              uint64_t v17 = v8[1];
              uint64_t v16 = (void *)v8[2];
            }
            else
            {
              uint64_t v17 = 0;
              uint64_t v16 = 0;
            }
            id v18 = v16;
            v10(6, "%c[%{public}s %{public}s]:%i serverState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", v12, ClassName, Name, 1038, v15, v17, v18);

            id v5 = v65;
            uint64_t v1 = v66;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v19 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v20 = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(v20)) {
              int v21 = 43;
            }
            else {
              int v21 = 45;
            }
            int v22 = object_getClassName(*(id *)(v1 + 40));
            int v23 = sel_getName(*(SEL *)(v1 + 48));
            __int16 v24 = [v7 serverIdentifier];
            if (v8)
            {
              uint64_t v26 = v8[1];
              uint64_t v25 = (void *)v8[2];
            }
            else
            {
              uint64_t v26 = 0;
              uint64_t v25 = 0;
            }
            id v27 = v25;
            *(_DWORD *)buf = 67110658;
            int v72 = v21;
            __int16 v73 = 2082;
            v74 = v22;
            __int16 v75 = 2082;
            v76 = v23;
            __int16 v77 = 1024;
            int v78 = 1038;
            __int16 v79 = 2114;
            v80 = v24;
            __int16 v81 = 2048;
            uint64_t v82 = v26;
            __int16 v83 = 2114;
            id v84 = v27;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i serverState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", buf, 0x40u);

            id v5 = v65;
            uint64_t v1 = v66;
          }

          char v3 = 1;
          [v7 setPendingImmediateRetry:1];
          [v7 save];
        }
        else
        {
          uint64_t v8 = 0;
        }
        __int16 v28 = sub_10003D59C(*(void **)(*(void *)(v1 + 40) + 24), v5);

        if (v28)
        {
          int v29 = [v28 retryInterval];

          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v30 = NFLogGetLogger();
          if (v30)
          {
            int v31 = (void (*)(uint64_t, const char *, ...))v30;
            __int16 v32 = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(v32)) {
              uint64_t v33 = 43;
            }
            else {
              uint64_t v33 = 45;
            }
            __int16 v34 = object_getClassName(*(id *)(v1 + 40));
            int v35 = sel_getName(*(SEL *)(v1 + 48));
            __int16 v36 = [v28 serverIdentifier];
            if (v29)
            {
              uint64_t v38 = v29[1];
              int v37 = (void *)v29[2];
            }
            else
            {
              uint64_t v38 = 0;
              int v37 = 0;
            }
            id v39 = v37;
            v31(6, "%c[%{public}s %{public}s]:%i redirectState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", v33, v34, v35, 1051, v36, v38, v39);

            uint64_t v1 = v66;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v40 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(v41)) {
              int v42 = 43;
            }
            else {
              int v42 = 45;
            }
            id v43 = object_getClassName(*(id *)(v1 + 40));
            uint64_t v44 = sel_getName(*(SEL *)(v1 + 48));
            id v45 = [v28 serverIdentifier];
            if (v29)
            {
              uint64_t v47 = v29[1];
              id v46 = (void *)v29[2];
            }
            else
            {
              uint64_t v47 = 0;
              id v46 = 0;
            }
            id v48 = v46;
            *(_DWORD *)buf = 67110658;
            int v72 = v42;
            __int16 v73 = 2082;
            v74 = v43;
            __int16 v75 = 2082;
            v76 = v44;
            __int16 v77 = 1024;
            int v78 = 1051;
            __int16 v79 = 2114;
            v80 = v45;
            __int16 v81 = 2048;
            uint64_t v82 = v47;
            __int16 v83 = 2114;
            id v84 = v48;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i redirectState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", buf, 0x40u);

            uint64_t v1 = v66;
          }

          char v3 = 1;
          [v28 setPendingImmediateRetry:1];
          [v28 save];
        }
        else
        {
          if (!v7)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v49 = NFLogGetLogger();
            if (v49)
            {
              uint64_t v50 = (void (*)(uint64_t, const char *, ...))v49;
              __int16 v51 = object_getClass(*(id *)(v1 + 40));
              BOOL isMetaClass = class_isMetaClass(v51);
              int v60 = object_getClassName(*(id *)(v1 + 40));
              __int16 v61 = sel_getName(*(SEL *)(v1 + 48));
              uint64_t v53 = 45;
              if (isMetaClass) {
                uint64_t v53 = 43;
              }
              v50(3, "%c[%{public}s %{public}s]:%i Unable to find state for registration: %{public}@", v53, v60, v61, 1058, v5);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            int v54 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              __int16 v55 = object_getClass(*(id *)(v1 + 40));
              if (class_isMetaClass(v55)) {
                int v56 = 43;
              }
              else {
                int v56 = 45;
              }
              __int16 v57 = object_getClassName(*(id *)(v66 + 40));
              unint64_t v58 = sel_getName(*(SEL *)(v66 + 48));
              *(_DWORD *)buf = 67110146;
              int v72 = v56;
              uint64_t v1 = v66;
              __int16 v73 = 2082;
              v74 = v57;
              __int16 v75 = 2082;
              v76 = v58;
              __int16 v77 = 1024;
              int v78 = 1058;
              __int16 v79 = 2114;
              v80 = v5;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to find state for registration: %{public}@", buf, 0x2Cu);
            }
          }
          int v29 = v8;
        }

        id v4 = (char *)v4 + 1;
      }
      while (v64 != v4);
      id v59 = [obj countByEnumeratingWithState:&v67 objects:v85 count:16];
      id v64 = v59;
    }
    while (v59);

    if (v3) {
      sub_10001A0A0(*(atomic_uchar **)(v1 + 40));
    }
  }
  else
  {
  }
}

void sub_10002234C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002258C(void *a1, void *a2)
{
  char v3 = a2;
  if (a1)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    if (*((unsigned char *)v4 + 56))
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v4);
        if (class_isMetaClass(Class)) {
          uint64_t v7 = 43;
        }
        else {
          uint64_t v7 = 45;
        }
        ClassName = object_getClassName(v4);
        Name = sel_getName("_executeNowOrDelayIfNotInitiatlized:");
        Logger(6, "%c[%{public}s %{public}s]:%i APS already initialized", v7, ClassName, Name, 1148);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v10 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = object_getClass(v4);
        if (class_isMetaClass(v11)) {
          int v12 = 43;
        }
        else {
          int v12 = 45;
        }
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v12;
        __int16 v19 = 2082;
        BOOL v20 = object_getClassName(v4);
        __int16 v21 = 2082;
        int v22 = sel_getName("_executeNowOrDelayIfNotInitiatlized:");
        __int16 v23 = 1024;
        int v24 = 1148;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i APS already initialized", (uint8_t *)&buf, 0x22u);
      }

      objc_sync_exit(v4);
      v3[2](v3, 0);
    }
    else
    {
      objc_initWeak(&buf, v4);
      id v13 = (void *)*((void *)v4 + 21);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100022848;
      v15[3] = &unk_100058B18;
      objc_copyWeak(v17, &buf);
      v17[1] = "_executeNowOrDelayIfNotInitiatlized:";
      uint64_t v16 = v3;
      id v14 = objc_retainBlock(v15);
      [v13 addObject:v14];

      objc_destroyWeak(v17);
      objc_destroyWeak(&buf);
      objc_sync_exit(v4);
    }
  }
}

void sub_10002280C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_100022848(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = WeakRetained;
  if (!WeakRetained)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(0);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(0);
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i \"self\" no longer exists.", v9, ClassName, Name, 1155);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(0);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      id v13 = object_getClassName(0);
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)id buf = 67109890;
      int v43 = v12;
      __int16 v44 = 2082;
      id v45 = v13;
      __int16 v46 = 2082;
      uint64_t v47 = v14;
      __int16 v48 = 1024;
      int v49 = 1155;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i \"self\" no longer exists.", buf, 0x22u);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = objc_alloc((Class)NSError);
    uint64_t v17 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    id v18 = +[NSString stringWithUTF8String:"Unknown Error"];
    id v41 = v18;
    __int16 v19 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    BOOL v20 = v16;
    __int16 v21 = v17;
    uint64_t v22 = 6;
    goto LABEL_24;
  }
  if (!*((unsigned char *)WeakRetained + 56))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      int v24 = (void (*)(uint64_t, const char *, ...))v23;
      uint64_t v25 = object_getClass(v3);
      BOOL v26 = class_isMetaClass(v25);
      id v27 = object_getClassName(v3);
      int v37 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v28 = 45;
      if (v26) {
        uint64_t v28 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i APS not initialized", v28, v27, v37, 1158);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v29 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = object_getClass(v3);
      if (class_isMetaClass(v30)) {
        int v31 = 43;
      }
      else {
        int v31 = 45;
      }
      __int16 v32 = object_getClassName(v3);
      uint64_t v33 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)id buf = 67109890;
      int v43 = v31;
      __int16 v44 = 2082;
      id v45 = v32;
      __int16 v46 = 2082;
      uint64_t v47 = v33;
      __int16 v48 = 1024;
      int v49 = 1158;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i APS not initialized", buf, 0x22u);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    id v34 = objc_alloc((Class)NSError);
    uint64_t v17 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    id v18 = +[NSString stringWithUTF8String:"Timeout"];
    id v39 = v18;
    __int16 v19 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    BOOL v20 = v34;
    __int16 v21 = v17;
    uint64_t v22 = 5;
LABEL_24:
    id v35 = [v20 initWithDomain:v21 code:v22 userInfo:v19];
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v35);

    goto LABEL_25;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_25:
}

void sub_100022F78(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v2 = *(void **)(a1 + 32);
    char v3 = *(void **)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    id v5 = v3;
    if (v2)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v2);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v2);
        Name = sel_getName("_setRegistrationInfo:primaryRegionTopic:");
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v7(6, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", v11, ClassName, Name, 1176, v4, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = object_getClass(v2);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        *(_DWORD *)id buf = 67110402;
        *(_DWORD *)&uint8_t buf[4] = v14;
        __int16 v20 = 2082;
        __int16 v21 = object_getClassName(v2);
        __int16 v22 = 2082;
        uint64_t v23 = sel_getName("_setRegistrationInfo:primaryRegionTopic:");
        __int16 v24 = 1024;
        int v25 = 1176;
        __int16 v26 = 2114;
        id v27 = v4;
        __int16 v28 = 2114;
        id v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", buf, 0x36u);
      }

      sub_10001CB70((void **)v2);
      if (v4 && v5)
      {
        if (v2[6])
        {
          uint64_t v15 = (void *)v2[3];
          id v16 = sub_10001D098((uint64_t)v2, 0);
          sub_10003B90C(v15, v16);

          *(void *)id buf = v5;
          uint64_t v17 = +[NSArray arrayWithObjects:buf count:1];
          sub_100021988((uint64_t)v2, v17);
        }
      }
    }
  }
}

void sub_1000232A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 1232, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
      id v16 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)id buf = 67110146;
      int v41 = v14;
      __int16 v42 = 2082;
      int v43 = v15;
      __int16 v44 = 2082;
      id v45 = v16;
      __int16 v46 = 1024;
      int v47 = 1232;
      __int16 v48 = 2114;
      id v49 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    sub_100037740();
    uint64_t v17 = (id *)objc_claimAutoreleasedReturnValue();
    id v18 = sub_10003C478(v17, *(void **)(a1 + 40), v5);

    if (v18)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v19 = NFLogGetLogger();
      if (v19)
      {
        __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
        __int16 v21 = object_getClass(*(id *)(a1 + 32));
        BOOL v22 = class_isMetaClass(v21);
        uint64_t v23 = object_getClassName(*(id *)(a1 + 32));
        int v37 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v24 = 45;
        if (v22) {
          uint64_t v24 = 43;
        }
        v20(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v24, v23, v37, 1239);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v26)) {
          int v27 = 43;
        }
        else {
          int v27 = 45;
        }
        __int16 v28 = object_getClassName(*(id *)(a1 + 32));
        id v29 = sel_getName(*(SEL *)(a1 + 56));
        *(_DWORD *)id buf = 67109890;
        int v41 = v27;
        __int16 v42 = 2082;
        int v43 = v28;
        __int16 v44 = 2082;
        id v45 = v29;
        __int16 v46 = 1024;
        int v47 = 1239;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
      }

      uint64_t v30 = *(void *)(a1 + 48);
      id v31 = objc_alloc((Class)NSError);
      __int16 v32 = +[NSString stringWithUTF8String:"seld"];
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      CFStringRef v39 = @"Failed to get next request.";
      uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v34 = [v31 initWithDomain:v32 code:12 userInfo:v33];
      (*(void (**)(uint64_t, void, id))(v30 + 16))(v30, 0, v34);
    }
    [v5 endSession];
  }
}

void sub_100023744(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    char v3 = *(void ***)(a1 + 32);
    id v4 = *(void **)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    id v6 = v4;
    if (!v3)
    {
LABEL_29:

      return;
    }
    id v7 = v5;
    if (v7)
    {
      uint64_t v8 = v7;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v3);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName("_nextRequestForServer:completion:");
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1220, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      uint64_t v15 = object_getClass(v3);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v16;
      *(_WORD *)NSErrorUserInfoKey v38 = 2082;
      *(void *)&v38[2] = object_getClassName(v3);
      *(_WORD *)&v38[10] = 2082;
      *(void *)&v38[12] = sel_getName("_nextRequestForServer:completion:");
      *(_WORD *)&v38[20] = 1024;
      *(_DWORD *)&v38[22] = 1220;
      *(_WORD *)&v38[26] = 2114;
      *(void *)&v38[28] = v8;
      uint64_t v17 = "%c[%{public}s %{public}s]:%i %{public}@";
    }
    else
    {
      uint64_t v18 = sub_10003B038(v3[3]);
      if (!v18)
      {
        id v30 = objc_alloc((Class)NSError);
        id v28 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        *(void *)id buf = @"No registration info.";
        id v31 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v41 count:1];
        id v32 = [v30 initWithDomain:v28 code:39 userInfo:v31];
        (*((void (**)(id, void, id))v6 + 2))(v6, 0, v32);

        goto LABEL_28;
      }
      uint64_t v8 = (void *)v18;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v19 = NFLogGetLogger();
      if (v19)
      {
        __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
        __int16 v21 = object_getClass(v3);
        BOOL v22 = class_isMetaClass(v21);
        id v34 = object_getClassName(v3);
        __int16 v36 = sel_getName("_nextRequestForServer:completion:");
        uint64_t v23 = 45;
        if (v22) {
          uint64_t v23 = 43;
        }
        v20(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v23, v34, v36, 1223, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

        __int16 v26 = +[NFHardwareManager sharedHardwareManager];
        *(void *)id buf = _NSConcreteStackBlock;
        *(void *)NSErrorUserInfoKey v38 = 3221225472;
        *(void *)&v38[8] = sub_1000232A0;
        *(void *)&v38[16] = &unk_100058B68;
        *(void *)&v38[24] = v3;
        NSErrorUserInfoKey v40 = "_nextRequestForServer:completion:";
        id v27 = v6;
        *(void *)&v38[32] = v8;
        id v39 = v27;
        id v28 = v8;
        id v29 = [v26 startSecureElementManagerSession:buf];

LABEL_28:
        goto LABEL_29;
      }
      uint64_t v24 = object_getClass(v3);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v25;
      *(_WORD *)NSErrorUserInfoKey v38 = 2082;
      *(void *)&v38[2] = object_getClassName(v3);
      *(_WORD *)&v38[10] = 2082;
      *(void *)&v38[12] = sel_getName("_nextRequestForServer:completion:");
      *(_WORD *)&v38[20] = 1024;
      *(_DWORD *)&v38[22] = 1223;
      *(_WORD *)&v38[26] = 2114;
      *(void *)&v38[28] = v8;
      uint64_t v17 = "%c[%{public}s %{public}s]:%i default = %{public}@";
    }
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x2Cu);
    goto LABEL_27;
  }
  id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v2();
}

void sub_100023BDC(uint64_t a1)
{
  id v2 = sub_10003D59C(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40));
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    id v4 = sub_10003BD48(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40));
    if (!v4)
    {
      uint64_t v23 = *(void *)(a1 + 56);
      id v24 = objc_alloc((Class)NSError);
      id v2 = +[NSString stringWithUTF8String:"seld"];
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      CFStringRef v37 = @"Unable to create server state";
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v25 = [v24 initWithDomain:v2 code:34 userInfo:v8];
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v25);

      goto LABEL_28;
    }
    id v2 = v4;
    [v4 setInitialClientRequestInfo:*(void *)(a1 + 48)];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  id v7 = sub_10001D098(v5, 0);
  sub_10003B90C(v6, v7);

  char v27 = 0;
  do
  {
    uint64_t v8 = sub_100023F34(*(void **)(a1 + 32), v2, 1, 0, &v27);
    if (v27)
    {
      uint64_t v9 = sub_10003D59C(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40));

      if (v9)
      {
        id v2 = (void *)v9;
      }
      else
      {
        int v10 = sub_10003BD48(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40));
        id v2 = v10;
        if (v10 == 0 || v3)
        {
          if (!v10)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              int v12 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(*(id *)(a1 + 32));
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(*(id *)(a1 + 32));
              Name = sel_getName(*(SEL *)(a1 + 64));
              if (isMetaClass) {
                uint64_t v16 = 43;
              }
              else {
                uint64_t v16 = 45;
              }
              v12(4, "%c[%{public}s %{public}s]:%i Missing expected state info", v16, ClassName, Name, 1324);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v17 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = object_getClass(*(id *)(a1 + 32));
              if (class_isMetaClass(v18)) {
                int v19 = 43;
              }
              else {
                int v19 = 45;
              }
              __int16 v20 = object_getClassName(*(id *)(a1 + 32));
              __int16 v21 = sel_getName(*(SEL *)(a1 + 64));
              *(_DWORD *)id buf = 67109890;
              int v29 = v19;
              __int16 v30 = 2082;
              id v31 = v20;
              __int16 v32 = 2082;
              uint64_t v33 = v21;
              __int16 v34 = 1024;
              int v35 = 1324;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing expected state info", buf, 0x22u);
            }

            id v2 = 0;
            char v27 = 0;
          }
        }
        else
        {
          [v10 setInitialClientRequestInfo:*(void *)(a1 + 48)];
          BOOL v3 = 0;
        }
      }
    }
    if (v8) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v27 == 0;
    }
  }
  while (!v22);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  sub_10001A0A0(*(atomic_uchar **)(a1 + 32));
LABEL_28:
}

id sub_100023F34(void *a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v9 = a2;
  id v186 = a4;
  if (!a1)
  {
LABEL_68:
    id v27 = 0;
    goto LABEL_69;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    if (class_isMetaClass(Class)) {
      uint64_t v13 = 43;
    }
    else {
      uint64_t v13 = 45;
    }
    ClassName = object_getClassName(a1);
    Name = sel_getName("_processRemoteAdminState:oneTime:secureElementManagerSession:outStateStorageUpdated:");
    uint64_t v16 = [v9 serverIdentifier];
    v11(6, "%c[%{public}s %{public}s]:%i serverIdentifier=%{public}@", v13, ClassName, Name, 2088, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = object_getClass(a1);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    __int16 v20 = object_getClassName(a1);
    __int16 v21 = sel_getName("_processRemoteAdminState:oneTime:secureElementManagerSession:outStateStorageUpdated:");
    BOOL v22 = [v9 serverIdentifier];
    *(_DWORD *)id buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v19;
    __int16 v189 = 2082;
    v190 = v20;
    __int16 v191 = 2082;
    v192 = v21;
    __int16 v193 = 1024;
    int v194 = 2088;
    __int16 v195 = 2114;
    uint64_t v196 = (uint64_t)v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i serverIdentifier=%{public}@", buf, 0x2Cu);
  }
  if (a5) {
    *a5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_10002E878((uint64_t)a1, v9, a3, v186);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  id v185 = v9;
  id v182 = v186;
  PLLogRegisteredEvent();
  uint64_t v23 = a1;
  objc_sync_enter(v23);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = [[NFRemoteAdminReaderSession alloc] initWithState:v185 oneTimeConnection:a3 secureElementManagerSession:v182];
    if (v24) {
      v24->_delegate = (NFRemoteAdminSessionDelegate *)v23;
    }
    id v25 = v23[12];
    v23[12] = v24;

    id v26 = v185;
  }
  else
  {
    id v28 = [[NFRemoteAdminRedirectSession alloc] initWithState:v185 oneTimeConnection:a3 secureElementManagerSession:v182];
    id v29 = v23[12];
    v23[12] = v28;

    id v26 = 0;
  }
  objc_sync_exit(v23);

  sub_10001A874((uint64_t)v23);
  if (*((unsigned char *)v23 + 155)) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = (uint64_t)[v23[12] run];
  }
  id v31 = v23;
  objc_sync_enter(v31);
  uint64_t v183 = v30;
  if ([v185 isComplete])
  {
    __int16 v32 = sub_100037740();
    sub_10003D1E8(v32, v185);
  }
  if (v26)
  {
    uint64_t v33 = [v26 stateUpdateOnSessionEndedCallback];
    BOOL v34 = v33 == 0;

    if (!v34)
    {
      int v35 = v31[12];
      if (v35) {
        uint64_t v36 = v35[19];
      }
      else {
        uint64_t v36 = 0;
      }
      CFStringRef v37 = [v26 stateUpdateOnSessionEndedCallback];
      ((void (**)(void, id, uint64_t))v37)[2](v37, v26, v36);

      [v26 setStateUpdateOnSessionEndedCallback:0];
    }
  }
  id v38 = v31[12];
  v31[12] = 0;

  objc_sync_exit(v31);
  PLLogRegisteredEvent();
  id v39 = [v26 spStatusCode];
  if (v39)
  {
    uint64_t v5 = [v26 spStatusCode];
    if (![v5 unsignedIntegerValue])
    {
LABEL_33:

      goto LABEL_34;
    }
  }
  __int16 v44 = [v26 spStatusCode];
  if (v44)
  {

    if (!v39) {
      goto LABEL_45;
    }
    goto LABEL_39;
  }
  id v45 = [v26 httpStatus];
  if (!v45)
  {
    if (!v39) {
      goto LABEL_45;
    }
LABEL_39:

    goto LABEL_45;
  }
  __int16 v46 = [v26 httpStatus];
  if ([v46 unsignedIntegerValue] == (id)200)
  {

    if (!v39) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v63 = [v26 httpStatus];
  id v64 = [v63 unsignedIntegerValue];

  if (v39)
  {

    if (v64 != (id)204) {
      goto LABEL_45;
    }
  }
  else if (v64 != (id)204)
  {
    goto LABEL_45;
  }
LABEL_34:
  NSErrorUserInfoKey v40 = [v26 parameters];
  if (!v40) {
    goto LABEL_44;
  }
  NSErrorUserInfoKey v41 = [v26 parameters];
  __int16 v42 = [v41 objectForKeyedSubscript:@"cardSessionToken"];
  BOOL v43 = v42 == 0;

  if (v43) {
LABEL_44:
  }
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_10005B4F0];
  else {
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_10005B4C8];
  }
LABEL_45:
  switch(v183)
  {
    case 0:
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v65)
        {
          uint64_t v66 = object_getClass(v31);
          if (class_isMetaClass(v66)) {
            uint64_t v67 = 43;
          }
          else {
            uint64_t v67 = 45;
          }
          long long v68 = object_getClassName(v31);
          long long v69 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          v65(6, "%c[%{public}s %{public}s]:%i [TSM] Success", v67, v68, v69, 2622);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v59 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          long long v70 = object_getClass(v31);
          if (class_isMetaClass(v70)) {
            int v71 = 43;
          }
          else {
            int v71 = 45;
          }
          int v72 = object_getClassName(v31);
          __int16 v73 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)id buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v71;
          __int16 v189 = 2082;
          v190 = v72;
          __int16 v191 = 2082;
          v192 = v73;
          __int16 v193 = 1024;
          int v194 = 2622;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Success", buf, 0x22u);
        }
        id v27 = 0;
        goto LABEL_60;
      }
      id v27 = 0;
      goto LABEL_61;
    case 1:
      if (!byte_100060438)
      {
        __int16 v57 = "Session aborted";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v74)
      {
        __int16 v75 = object_getClass(v31);
        if (class_isMetaClass(v75)) {
          uint64_t v76 = 43;
        }
        else {
          uint64_t v76 = 45;
        }
        __int16 v77 = object_getClassName(v31);
        int v78 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v74(6, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", v76, v77, v78, 2651);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v79 = object_getClass(v31);
        if (class_isMetaClass(v79)) {
          int v80 = 43;
        }
        else {
          int v80 = 45;
        }
        __int16 v81 = object_getClassName(v31);
        uint64_t v82 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v80;
        __int16 v189 = 2082;
        v190 = v81;
        __int16 v191 = 2082;
        v192 = v82;
        __int16 v193 = 1024;
        int v194 = 2651;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", buf, 0x22u);
      }
      __int16 v57 = "Session aborted";
      goto LABEL_58;
    case 2:
      if (!byte_100060438)
      {
        __int16 v57 = "Network unavailable";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v83 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v83)
      {
        id v84 = object_getClass(v31);
        if (class_isMetaClass(v84)) {
          uint64_t v85 = 43;
        }
        else {
          uint64_t v85 = 45;
        }
        v86 = object_getClassName(v31);
        v87 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v83(6, "%c[%{public}s %{public}s]:%i [TSM] Network Unavailable", v85, v86, v87, 2636);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v88 = object_getClass(v31);
        if (class_isMetaClass(v88)) {
          int v89 = 43;
        }
        else {
          int v89 = 45;
        }
        v90 = object_getClassName(v31);
        v91 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v89;
        __int16 v189 = 2082;
        v190 = v90;
        __int16 v191 = 2082;
        v192 = v91;
        __int16 v193 = 1024;
        int v194 = 2636;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Network Unavailable", buf, 0x22u);
      }
      __int16 v57 = "Network unavailable";
      goto LABEL_58;
    case 3:
    case 6:
    case 11:
    case 13:
      if (!byte_100060438)
      {
        __int16 v57 = "Unexpected result.";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v47)
      {
        __int16 v48 = object_getClass(v31);
        if (class_isMetaClass(v48)) {
          uint64_t v49 = 43;
        }
        else {
          uint64_t v49 = 45;
        }
        uint64_t v50 = object_getClassName(v31);
        __int16 v51 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v47(6, "%c[%{public}s %{public}s]:%i [TSM] Unexpected error %lu", v49, v50, v51, 2679, v183);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = object_getClass(v31);
        if (class_isMetaClass(v53)) {
          int v54 = 43;
        }
        else {
          int v54 = 45;
        }
        __int16 v55 = object_getClassName(v31);
        int v56 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v54;
        __int16 v189 = 2082;
        v190 = v55;
        __int16 v191 = 2082;
        v192 = v56;
        __int16 v193 = 1024;
        int v194 = 2679;
        __int16 v195 = 2048;
        uint64_t v196 = v183;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unexpected error %lu", buf, 0x2Cu);
      }
      __int16 v57 = "Unexpected result.";
      goto LABEL_58;
    case 4:
      if (!byte_100060438)
      {
        __int16 v57 = "Unable to connect. Long retry cycle";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v92 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v92)
      {
        v93 = object_getClass(v31);
        if (class_isMetaClass(v93)) {
          uint64_t v94 = 43;
        }
        else {
          uint64_t v94 = 45;
        }
        v95 = object_getClassName(v31);
        v96 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v92(6, "%c[%{public}s %{public}s]:%i [TSM] Long retry", v94, v95, v96, 2626);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v97 = object_getClass(v31);
        if (class_isMetaClass(v97)) {
          int v98 = 43;
        }
        else {
          int v98 = 45;
        }
        v99 = object_getClassName(v31);
        v100 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v98;
        __int16 v189 = 2082;
        v190 = v99;
        __int16 v191 = 2082;
        v192 = v100;
        __int16 v193 = 1024;
        int v194 = 2626;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Long retry", buf, 0x22u);
      }
      __int16 v57 = "Unable to connect. Long retry cycle";
      goto LABEL_58;
    case 5:
      if (!byte_100060438)
      {
        __int16 v57 = "Invalid parameter";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v101 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v101)
      {
        v102 = object_getClass(v31);
        if (class_isMetaClass(v102)) {
          uint64_t v103 = 43;
        }
        else {
          uint64_t v103 = 45;
        }
        v104 = object_getClassName(v31);
        v105 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v101(6, "%c[%{public}s %{public}s]:%i [TSM] Invalid parameter", v103, v104, v105, 2656);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v106 = object_getClass(v31);
        if (class_isMetaClass(v106)) {
          int v107 = 43;
        }
        else {
          int v107 = 45;
        }
        v108 = object_getClassName(v31);
        v109 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v107;
        __int16 v189 = 2082;
        v190 = v108;
        __int16 v191 = 2082;
        v192 = v109;
        __int16 v193 = 1024;
        int v194 = 2656;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Invalid parameter", buf, 0x22u);
      }
      __int16 v57 = "Invalid parameter";
      goto LABEL_58;
    case 7:
      if (!byte_100060438)
      {
        __int16 v57 = "External Tag Unavailable";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v110 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v110)
      {
        v111 = object_getClass(v31);
        if (class_isMetaClass(v111)) {
          uint64_t v112 = 43;
        }
        else {
          uint64_t v112 = 45;
        }
        v113 = object_getClassName(v31);
        v114 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v110(6, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", v112, v113, v114, 2631);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v115 = object_getClass(v31);
        if (class_isMetaClass(v115)) {
          int v116 = 43;
        }
        else {
          int v116 = 45;
        }
        v117 = object_getClassName(v31);
        v118 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v116;
        __int16 v189 = 2082;
        v190 = v117;
        __int16 v191 = 2082;
        v192 = v118;
        __int16 v193 = 1024;
        int v194 = 2631;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", buf, 0x22u);
      }
      __int16 v57 = "External Tag Unavailable";
      goto LABEL_58;
    case 8:
      if (!byte_100060438)
      {
        __int16 v57 = "Session Error";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v119 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v119)
      {
        v120 = object_getClass(v31);
        if (class_isMetaClass(v120)) {
          uint64_t v121 = 43;
        }
        else {
          uint64_t v121 = 45;
        }
        v122 = object_getClassName(v31);
        v123 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v119(6, "%c[%{public}s %{public}s]:%i [TSM] Session error", v121, v122, v123, 2661);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v124 = object_getClass(v31);
        if (class_isMetaClass(v124)) {
          int v125 = 43;
        }
        else {
          int v125 = 45;
        }
        v126 = object_getClassName(v31);
        v127 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v125;
        __int16 v189 = 2082;
        v190 = v126;
        __int16 v191 = 2082;
        v192 = v127;
        __int16 v193 = 1024;
        int v194 = 2661;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Session error", buf, 0x22u);
      }
      __int16 v57 = "Session Error";
      goto LABEL_58;
    case 9:
      if (!byte_100060438)
      {
        __int16 v57 = "Unsupported tag";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v128 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v128)
      {
        v129 = object_getClass(v31);
        if (class_isMetaClass(v129)) {
          uint64_t v130 = 43;
        }
        else {
          uint64_t v130 = 45;
        }
        v131 = object_getClassName(v31);
        v132 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v128(6, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", v130, v131, v132, 2666);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v133 = object_getClass(v31);
        if (class_isMetaClass(v133)) {
          int v134 = 43;
        }
        else {
          int v134 = 45;
        }
        v135 = object_getClassName(v31);
        v136 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v134;
        __int16 v189 = 2082;
        v190 = v135;
        __int16 v191 = 2082;
        v192 = v136;
        __int16 v193 = 1024;
        int v194 = 2666;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", buf, 0x22u);
      }
      __int16 v57 = "Unsupported tag";
      goto LABEL_58;
    case 10:
      if (!byte_100060438)
      {
        __int16 v57 = "Bad Command error";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v137 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v137)
      {
        v138 = object_getClass(v31);
        if (class_isMetaClass(v138)) {
          uint64_t v139 = 43;
        }
        else {
          uint64_t v139 = 45;
        }
        v140 = object_getClassName(v31);
        v141 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v137(6, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", v139, v140, v141, 2671);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v142 = object_getClass(v31);
        if (class_isMetaClass(v142)) {
          int v143 = 43;
        }
        else {
          int v143 = 45;
        }
        v144 = object_getClassName(v31);
        v145 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v143;
        __int16 v189 = 2082;
        v190 = v144;
        __int16 v191 = 2082;
        v192 = v145;
        __int16 v193 = 1024;
        int v194 = 2671;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", buf, 0x22u);
      }
      __int16 v57 = "Bad Command error";
      goto LABEL_58;
    case 12:
      if (!byte_100060438)
      {
        __int16 v57 = "Start new session";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v146 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v146)
      {
        v147 = object_getClass(v31);
        if (class_isMetaClass(v147)) {
          uint64_t v148 = 43;
        }
        else {
          uint64_t v148 = 45;
        }
        v149 = object_getClassName(v31);
        v150 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v146(6, "%c[%{public}s %{public}s]:%i [TSM] Start new session", v148, v149, v150, 2684);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v151 = object_getClass(v31);
        if (class_isMetaClass(v151)) {
          int v152 = 43;
        }
        else {
          int v152 = 45;
        }
        v153 = object_getClassName(v31);
        v154 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v152;
        __int16 v189 = 2082;
        v190 = v153;
        __int16 v191 = 2082;
        v192 = v154;
        __int16 v193 = 1024;
        int v194 = 2684;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Start new session", buf, 0x22u);
      }
      __int16 v57 = "Start new session";
      goto LABEL_58;
    case 14:
      if (!byte_100060438)
      {
        __int16 v57 = "SE is not available";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v155 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v155)
      {
        v156 = object_getClass(v31);
        if (class_isMetaClass(v156)) {
          uint64_t v157 = 43;
        }
        else {
          uint64_t v157 = 45;
        }
        v158 = object_getClassName(v31);
        v159 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v155(6, "%c[%{public}s %{public}s]:%i [TSM] SE is not avaliable", v157, v158, v159, 2646);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v160 = object_getClass(v31);
        if (class_isMetaClass(v160)) {
          int v161 = 43;
        }
        else {
          int v161 = 45;
        }
        v162 = object_getClassName(v31);
        v163 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v161;
        __int16 v189 = 2082;
        v190 = v162;
        __int16 v191 = 2082;
        v192 = v163;
        __int16 v193 = 1024;
        int v194 = 2646;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] SE is not avaliable", buf, 0x22u);
      }
      __int16 v57 = "SE is not available";
      goto LABEL_58;
    case 15:
      if (!byte_100060438)
      {
        __int16 v57 = "Other network error";
        goto LABEL_59;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v164 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v164)
      {
        v165 = object_getClass(v31);
        if (class_isMetaClass(v165)) {
          uint64_t v166 = 43;
        }
        else {
          uint64_t v166 = 45;
        }
        v167 = object_getClassName(v31);
        v168 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v164(6, "%c[%{public}s %{public}s]:%i [TSM] Other network error", v166, v167, v168, 2641);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v169 = object_getClass(v31);
        if (class_isMetaClass(v169)) {
          int v170 = 43;
        }
        else {
          int v170 = 45;
        }
        v171 = object_getClassName(v31);
        v172 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)id buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v170;
        __int16 v189 = 2082;
        v190 = v171;
        __int16 v191 = 2082;
        v192 = v172;
        __int16 v193 = 1024;
        int v194 = 2641;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Other network error", buf, 0x22u);
      }
      __int16 v57 = "Other network error";
      goto LABEL_58;
    case 16:
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v173 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v173)
        {
          v174 = object_getClass(v31);
          if (class_isMetaClass(v174)) {
            uint64_t v175 = 43;
          }
          else {
            uint64_t v175 = 45;
          }
          v176 = object_getClassName(v31);
          v177 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          v173(6, "%c[%{public}s %{public}s]:%i [TSM] XPC related error", v175, v176, v177, 2689);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        long long v52 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v178 = object_getClass(v31);
          if (class_isMetaClass(v178)) {
            int v179 = 43;
          }
          else {
            int v179 = 45;
          }
          v180 = object_getClassName(v31);
          v181 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)id buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v179;
          __int16 v189 = 2082;
          v190 = v180;
          __int16 v191 = 2082;
          v192 = v181;
          __int16 v193 = 1024;
          int v194 = 2689;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] XPC related error", buf, 0x22u);
        }
        __int16 v57 = "XPC related error";
LABEL_58:
      }
      else
      {
        __int16 v57 = "XPC related error";
      }
LABEL_59:
      id v58 = objc_alloc((Class)NSError);
      id v59 = +[NSString stringWithUTF8String:"seld"];
      NSErrorUserInfoKey v187 = NSLocalizedDescriptionKey;
      int v60 = +[NSString stringWithUTF8String:v57];
      *(void *)id buf = v60;
      __int16 v61 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v187 count:1];
      id v27 = [v58 initWithDomain:v59 code:v183 userInfo:v61];

LABEL_60:
LABEL_61:

      break;
    default:
      __int16 v57 = 0;
      id v27 = 0;
      if (!v183) {
        goto LABEL_61;
      }
      goto LABEL_59;
  }
LABEL_62:
  if (v27 && ([v27 code] == (id)11 || objc_msgSend(v27, "code") == (id)12))
  {
    if (a5) {
      *a5 = 1;
    }

    goto LABEL_68;
  }
LABEL_69:

  return v27;
}

void sub_10002576C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100025AD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 72));
    int v10 = [[*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing server connection request from %{public}@", v12, ClassName, Name, 1343, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    uint64_t v16 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v17 = sel_getName(*(SEL *)(a1 + 72));
    uint64_t v18 = [[*(id *)(a1 + 40) NF_userInfo];
    int v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)id buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v15;
    *(_WORD *)__int16 v75 = 2082;
    *(void *)&v75[2] = v16;
    *(_WORD *)&v75[10] = 2082;
    *(void *)&v75[12] = v17;
    *(_WORD *)&v75[20] = 1024;
    *(_DWORD *)&v75[22] = 1343;
    *(_WORD *)&v75[26] = 2114;
    *(void *)&v75[28] = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing server connection request from %{public}@", buf, 0x2Cu);
  }
  if (!v3)
  {
    __int16 v20 = *(void ***)(a1 + 32);
    __int16 v21 = *(void **)(a1 + 56);
    BOOL v22 = *(void **)(a1 + 64);
    id v23 = *(id *)(a1 + 48);
    id v24 = v21;
    id v25 = v22;
    if (!v20)
    {
LABEL_47:

      goto LABEL_48;
    }
    id v26 = v23;
    if (v26)
    {
      id v27 = v26;
      __int16 v73 = v24;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        id v29 = (void (*)(uint64_t, const char *, ...))v28;
        uint64_t v30 = object_getClass(v20);
        BOOL v31 = class_isMetaClass(v30);
        uint64_t v67 = object_getClassName(v20);
        long long v70 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        uint64_t v32 = 45;
        if (v31) {
          uint64_t v32 = 43;
        }
        v29(6, "%c[%{public}s %{public}s]:%i %{public}@", v32, v67, v70, 1267, v27);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v34 = object_getClass(v20);
        if (class_isMetaClass(v34)) {
          int v35 = 43;
        }
        else {
          int v35 = 45;
        }
        uint64_t v36 = object_getClassName(v20);
        CFStringRef v37 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        *(_DWORD *)id buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v35;
        *(_WORD *)__int16 v75 = 2082;
        *(void *)&v75[2] = v36;
        *(_WORD *)&v75[10] = 2082;
        *(void *)&v75[12] = v37;
        *(_WORD *)&v75[20] = 1024;
        *(_DWORD *)&v75[22] = 1267;
        *(_WORD *)&v75[26] = 2114;
        *(void *)&v75[28] = v27;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      id v38 = sub_10003AFD0(v20[3], v27);

      if (!v38)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v39 = NFLogGetLogger();
        if (v39)
        {
          NSErrorUserInfoKey v40 = (void (*)(uint64_t, const char *, ...))v39;
          NSErrorUserInfoKey v41 = object_getClass(v20);
          BOOL v42 = class_isMetaClass(v41);
          long long v68 = object_getClassName(v20);
          int v71 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
          uint64_t v43 = 45;
          if (v42) {
            uint64_t v43 = 43;
          }
          v40(4, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", v43, v68, v71, 1269, v27);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v44 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          id v45 = object_getClass(v20);
          if (class_isMetaClass(v45)) {
            int v46 = 43;
          }
          else {
            int v46 = 45;
          }
          int v47 = object_getClassName(v20);
          __int16 v48 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
          *(_DWORD *)id buf = 67110146;
          *(_DWORD *)&uint8_t buf[4] = v46;
          *(_WORD *)__int16 v75 = 2082;
          *(void *)&v75[2] = v47;
          *(_WORD *)&v75[10] = 2082;
          *(void *)&v75[12] = v48;
          *(_WORD *)&v75[20] = 1024;
          *(_DWORD *)&v75[22] = 1269;
          *(_WORD *)&v75[26] = 2114;
          *(void *)&v75[28] = v27;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", buf, 0x2Cu);
        }

        id v49 = objc_alloc((Class)NSError);
        uint64_t v50 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
        *(void *)id buf = @"No registered URL.";
        __int16 v51 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v79 count:1];
        id v52 = [v49 initWithDomain:v50 code:39 userInfo:v51];
        (*((void (**)(id, id))v25 + 2))(v25, v52);

        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v53 = sub_10003B038(v20[3]);
      if (!v53)
      {
        id v64 = objc_alloc((Class)NSError);
        id v27 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
        *(void *)id buf = @"No registration info.";
        v65 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v79 count:1];
        id v66 = [v64 initWithDomain:v27 code:39 userInfo:v65];
        (*((void (**)(id, id))v25 + 2))(v25, v66);

        goto LABEL_46;
      }
      id v27 = (id)v53;
      __int16 v73 = v24;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v54 = NFLogGetLogger();
      if (v54)
      {
        __int16 v55 = (void (*)(uint64_t, const char *, ...))v54;
        int v56 = object_getClass(v20);
        BOOL v57 = class_isMetaClass(v56);
        long long v69 = object_getClassName(v20);
        int v72 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        uint64_t v58 = 45;
        if (v57) {
          uint64_t v58 = 43;
        }
        v55(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v58, v69, v72, 1275, v27);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v59 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        int v60 = object_getClass(v20);
        if (class_isMetaClass(v60)) {
          int v61 = 43;
        }
        else {
          int v61 = 45;
        }
        id v62 = object_getClassName(v20);
        uint64_t v63 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        *(_DWORD *)id buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v61;
        *(_WORD *)__int16 v75 = 2082;
        *(void *)&v75[2] = v62;
        *(_WORD *)&v75[10] = 2082;
        *(void *)&v75[12] = v63;
        *(_WORD *)&v75[20] = 1024;
        *(_DWORD *)&v75[22] = 1275;
        *(_WORD *)&v75[26] = 2114;
        *(void *)&v75[28] = v27;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
      }
    }
    *(void *)id buf = _NSConcreteStackBlock;
    *(void *)__int16 v75 = 3221225472;
    *(void *)&v75[8] = sub_100023BDC;
    *(void *)&v75[16] = &unk_100058BB8;
    *(void *)&v75[24] = v20;
    *(void *)&v75[32] = v27;
    id v24 = v73;
    id v76 = v73;
    id v77 = v25;
    int v78 = "_connectToServer:initialClientRequestInfo:completion:";
    id v27 = v27;
    sub_10001E258((uint64_t)v20, buf);

LABEL_46:
    goto LABEL_47;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_48:
}

void sub_1000262D0(void **a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = v5;
    if (v7)
    {
      uint64_t v8 = v7;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName("_queueServerConnection:callback:");
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1358, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = object_getClass(a1);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)id buf = 67110146;
        int v60 = v16;
        __int16 v61 = 2082;
        id v62 = object_getClassName(a1);
        __int16 v63 = 2082;
        id v64 = sel_getName("_queueServerConnection:callback:");
        __int16 v65 = 1024;
        int v66 = 1358;
        __int16 v67 = 2114;
        long long v68 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      uint64_t v17 = sub_10003AFD0(a1[3], v8);

      if (!v17)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v18 = NFLogGetLogger();
        if (v18)
        {
          int v19 = (void (*)(uint64_t, const char *, ...))v18;
          __int16 v20 = object_getClass(a1);
          BOOL v21 = class_isMetaClass(v20);
          id v49 = object_getClassName(a1);
          id v52 = sel_getName("_queueServerConnection:callback:");
          uint64_t v22 = 45;
          if (v21) {
            uint64_t v22 = 43;
          }
          v19(4, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", v22, v49, v52, 1360, v8);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v23 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = object_getClass(a1);
          if (class_isMetaClass(v24)) {
            int v25 = 43;
          }
          else {
            int v25 = 45;
          }
          id v26 = object_getClassName(a1);
          id v27 = sel_getName("_queueServerConnection:callback:");
          *(_DWORD *)id buf = 67110146;
          int v60 = v25;
          __int16 v61 = 2082;
          id v62 = v26;
          __int16 v63 = 2082;
          id v64 = v27;
          __int16 v65 = 1024;
          int v66 = 1360;
          __int16 v67 = 2114;
          long long v68 = v8;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", buf, 0x2Cu);
        }

        if (v6)
        {
          id v28 = objc_alloc((Class)NSError);
          id v29 = +[NSString stringWithUTF8String:"seld"];
          NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
          CFStringRef v58 = @"No registered URL.";
          uint64_t v30 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          id v31 = [v28 initWithDomain:v29 code:39 userInfo:v30];
          v6[2](v6, v31);
        }
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v32 = sub_10003B038(a1[3]);
      if (!v32)
      {
        if (v6)
        {
          id v44 = objc_alloc((Class)NSError);
          id v45 = +[NSString stringWithUTF8String:"seld"];
          NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
          CFStringRef v56 = @"No registration info.";
          int v46 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v47 = [v44 initWithDomain:v45 code:39 userInfo:v46];
          v6[2](v6, v47);
        }
        uint64_t v8 = 0;
        goto LABEL_40;
      }
      uint64_t v8 = (void *)v32;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFLogGetLogger();
      if (v33)
      {
        BOOL v34 = (void (*)(uint64_t, const char *, ...))v33;
        int v35 = object_getClass(a1);
        BOOL v36 = class_isMetaClass(v35);
        uint64_t v50 = object_getClassName(a1);
        uint64_t v53 = sel_getName("_queueServerConnection:callback:");
        uint64_t v37 = 45;
        if (v36) {
          uint64_t v37 = 43;
        }
        v34(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v37, v50, v53, 1366, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v38 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = object_getClass(a1);
        if (class_isMetaClass(v39)) {
          int v40 = 43;
        }
        else {
          int v40 = 45;
        }
        *(_DWORD *)id buf = 67110146;
        int v60 = v40;
        __int16 v61 = 2082;
        id v62 = object_getClassName(a1);
        __int16 v63 = 2082;
        id v64 = sel_getName("_queueServerConnection:callback:");
        __int16 v65 = 1024;
        int v66 = 1366;
        __int16 v67 = 2114;
        long long v68 = v8;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
      }
    }
    NSErrorUserInfoKey v41 = a1[3];
    BOOL v42 = sub_10001D098((uint64_t)a1, 0);
    sub_10003B90C(v41, v42);

    uint64_t v54 = v8;
    uint64_t v43 = +[NSArray arrayWithObjects:&v54 count:1];
    sub_100021988((uint64_t)a1, v43);

    if (v6) {
      v6[2](v6, 0);
    }
    goto LABEL_40;
  }
LABEL_41:
}

void sub_100026BFC(uint64_t a1, uint64_t a2)
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    int v10 = [[*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v12, ClassName, Name, 1394, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v17 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v18 = [*(id *)(a1 + 40) NF_userInfo];
    int v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)id buf = 67110146;
    int v21 = v15;
    __int16 v22 = 2082;
    id v23 = v16;
    __int16 v24 = 2082;
    int v25 = v17;
    __int16 v26 = 1024;
    int v27 = 1394;
    __int16 v28 = 2114;
    id v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (!a2) {
    sub_1000262D0(*(void ***)(a1 + 32), *(void **)(a1 + 48), 0);
  }
}

void sub_100026E10(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v74 = objc_opt_new();
    id v7 = a1;
    objc_sync_enter(v7);
    int v8 = *((unsigned __int8 *)v7 + 56);
    objc_sync_exit(v7);

    if (v8)
    {
      __int16 v73 = v6;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id obj = v5;
      id v9 = [obj countByEnumeratingWithState:&v77 objects:v95 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v76 = *(void *)v78;
        while (2)
        {
          for (int i = 0; i != v10; int i = (char *)i + 1)
          {
            if (*(void *)v78 != v76) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(NSObject **)(*((void *)&v77 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v13 = sub_10003B0B8(v7[3], v12);
              if (!v13)
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t Logger = NFLogGetLogger();
                if (Logger)
                {
                  int v15 = (void (*)(uint64_t, const char *, ...))Logger;
                  Class = object_getClass(v7);
                  BOOL isMetaClass = class_isMetaClass(Class);
                  ClassName = object_getClassName(v7);
                  Name = sel_getName("_queueServerConnectionForApplets:completion:");
                  uint64_t v18 = 45;
                  if (isMetaClass) {
                    uint64_t v18 = 43;
                  }
                  v15(4, "%c[%{public}s %{public}s]:%i No server for applet: %{public}@", v18, ClassName, Name, 1425, v12);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                int v19 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  __int16 v20 = object_getClass(v7);
                  if (class_isMetaClass(v20)) {
                    int v21 = 43;
                  }
                  else {
                    int v21 = 45;
                  }
                  __int16 v22 = object_getClassName(v7);
                  id v23 = sel_getName("_queueServerConnectionForApplets:completion:");
                  *(_DWORD *)id buf = 67110146;
                  int v82 = v21;
                  __int16 v83 = 2082;
                  id v84 = v22;
                  __int16 v85 = 2082;
                  v86 = v23;
                  __int16 v87 = 1024;
                  int v88 = 1425;
                  __int16 v89 = 2114;
                  v90 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No server for applet: %{public}@", buf, 0x2Cu);
                }

                uint64_t v24 = sub_10003B038(v7[3]);
                if (!v24)
                {
                  id v6 = v73;
                  if (v73)
                  {
                    id v62 = objc_alloc((Class)NSError);
                    __int16 v63 = +[NSString stringWithUTF8String:"seld"];
                    NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
                    CFStringRef v94 = @"No registration info.";
                    id v64 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
                    id v65 = [v62 initWithDomain:v63 code:39 userInfo:v64];
                    v73[2](v73, v65);
                  }
                  goto LABEL_58;
                }
                uint64_t v13 = v24;
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v25 = NFLogGetLogger();
                if (v25)
                {
                  __int16 v26 = (void (*)(uint64_t, const char *, ...))v25;
                  int v27 = object_getClass(v7);
                  BOOL v28 = class_isMetaClass(v27);
                  __int16 v67 = object_getClassName(v7);
                  long long v70 = sel_getName("_queueServerConnectionForApplets:completion:");
                  uint64_t v29 = 45;
                  if (v28) {
                    uint64_t v29 = 43;
                  }
                  v26(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v29, v67, v70, 1427, v13);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v30 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  id v31 = object_getClass(v7);
                  if (class_isMetaClass(v31)) {
                    int v32 = 43;
                  }
                  else {
                    int v32 = 45;
                  }
                  uint64_t v33 = object_getClassName(v7);
                  BOOL v34 = sel_getName("_queueServerConnectionForApplets:completion:");
                  *(_DWORD *)id buf = 67110146;
                  int v82 = v32;
                  __int16 v83 = 2082;
                  id v84 = v33;
                  __int16 v85 = 2082;
                  v86 = v34;
                  __int16 v87 = 1024;
                  int v88 = 1427;
                  __int16 v89 = 2114;
                  v90 = v13;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
                }
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v35 = NFLogGetLogger();
              if (v35)
              {
                BOOL v36 = (void (*)(uint64_t, const char *, ...))v35;
                uint64_t v37 = object_getClass(v7);
                BOOL v38 = class_isMetaClass(v37);
                uint64_t v39 = object_getClassName(v7);
                int v71 = sel_getName("_queueServerConnectionForApplets:completion:");
                uint64_t v40 = 45;
                if (v38) {
                  uint64_t v40 = 43;
                }
                v36(6, "%c[%{public}s %{public}s]:%i %{public}@ => %{public}@", v40, v39, v71, 1436, v12, v13);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              NSErrorUserInfoKey v41 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v42 = object_getClass(v7);
                if (class_isMetaClass(v42)) {
                  int v43 = 43;
                }
                else {
                  int v43 = 45;
                }
                id v44 = object_getClassName(v7);
                id v45 = sel_getName("_queueServerConnectionForApplets:completion:");
                *(_DWORD *)id buf = 67110402;
                int v82 = v43;
                __int16 v83 = 2082;
                id v84 = v44;
                __int16 v85 = 2082;
                v86 = v45;
                __int16 v87 = 1024;
                int v88 = 1436;
                __int16 v89 = 2114;
                v90 = v12;
                __int16 v91 = 2114;
                v92 = v13;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ => %{public}@", buf, 0x36u);
              }

              [v74 addObject:v13];
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v46 = NFLogGetLogger();
              if (v46)
              {
                id v47 = (void (*)(uint64_t, const char *, ...))v46;
                __int16 v48 = object_getClass(v7);
                BOOL v49 = class_isMetaClass(v48);
                long long v68 = object_getClassName(v7);
                int v72 = sel_getName("_queueServerConnectionForApplets:completion:");
                uint64_t v50 = 45;
                if (v49) {
                  uint64_t v50 = 43;
                }
                v47(4, "%c[%{public}s %{public}s]:%i Skipping invalid aid string (%{public}@)", v50, v68, v72, 1420, v12);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v13 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                __int16 v51 = object_getClass(v7);
                if (class_isMetaClass(v51)) {
                  int v52 = 43;
                }
                else {
                  int v52 = 45;
                }
                uint64_t v53 = object_getClassName(v7);
                uint64_t v54 = sel_getName("_queueServerConnectionForApplets:completion:");
                *(_DWORD *)id buf = 67110146;
                int v82 = v52;
                __int16 v83 = 2082;
                id v84 = v53;
                __int16 v85 = 2082;
                v86 = v54;
                __int16 v87 = 1024;
                int v88 = 1420;
                __int16 v89 = 2114;
                v90 = v12;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping invalid aid string (%{public}@)", buf, 0x2Cu);
              }
            }
          }
          id v10 = [obj countByEnumeratingWithState:&v77 objects:v95 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      NSErrorUserInfoKey v55 = v7[3];
      CFStringRef v56 = sub_10001D098((uint64_t)v7, 0);
      sub_10003B90C(v55, v56);

      sub_100021988((uint64_t)v7, v74);
      id v6 = v73;
      if (v73) {
        v73[2](v73, 0);
      }
    }
    else if (v6)
    {
      id v57 = objc_alloc((Class)NSError);
      CFStringRef v58 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
      id v59 = +[NSString stringWithUTF8String:"Timeout"];
      v97 = v59;
      int v60 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      id v61 = [v57 initWithDomain:v58 code:5 userInfo:v60];
      v6[2](v6, v61);
    }
LABEL_58:
  }
}

void sub_100027950(uint64_t a1, uint64_t a2)
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    id v10 = [[*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v12, ClassName, Name, 1461, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v17 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v18 = [[*(id *)(a1 + 40) NF_userInfo];
    int v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)id buf = 67110146;
    int v21 = v15;
    __int16 v22 = 2082;
    id v23 = v16;
    __int16 v24 = 2082;
    uint64_t v25 = v17;
    __int16 v26 = 1024;
    int v27 = 1461;
    __int16 v28 = 2114;
    uint64_t v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (!a2) {
    sub_100026E10(*(void **)(a1 + 32), *(void **)(a1 + 48), 0);
  }
}

void sub_100027B64(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 spStatusCode];
  if (v6)
  {
    id v7 = [v5 spStatusCode];
    [v7 unsignedIntegerValue];
  }
  switch(a3)
  {
    case -1:
      if (!byte_100060438)
      {
        int v19 = "Unknown error";
        goto LABEL_105;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v9 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v9(6, "%c[%{public}s %{public}s]:%i [TSM] Unknown error", v13, ClassName, Name, 1563);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
        uint64_t v18 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v16;
        __int16 v118 = 2082;
        v119 = v17;
        __int16 v120 = 2082;
        uint64_t v121 = v18;
        __int16 v122 = 1024;
        int v123 = 1563;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unknown error", buf, 0x22u);
      }
      int v19 = "Unknown error";
      goto LABEL_104;
    case 0:
      if (!byte_100060438)
      {
        id v31 = 0;
        goto LABEL_107;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v20 = NFLogGetLogger();
      if (v20)
      {
        int v21 = (void (*)(uint64_t, const char *, ...))v20;
        __int16 v22 = object_getClass(*(id *)(a1 + 32));
        BOOL v23 = class_isMetaClass(v22);
        __int16 v24 = object_getClassName(*(id *)(a1 + 32));
        v106 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v25 = 45;
        if (v23) {
          uint64_t v25 = 43;
        }
        v21(6, "%c[%{public}s %{public}s]:%i [TSM] Success", v25, v24, v106, 1534);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v27)) {
          int v28 = 43;
        }
        else {
          int v28 = 45;
        }
        uint64_t v29 = object_getClassName(*(id *)(a1 + 32));
        uint64_t v30 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v28;
        __int16 v118 = 2082;
        v119 = v29;
        __int16 v120 = 2082;
        uint64_t v121 = v30;
        __int16 v122 = 1024;
        int v123 = 1534;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Success", buf, 0x22u);
      }
      id v31 = 0;
      goto LABEL_106;
    case 1:
      if (!byte_100060438)
      {
        int v19 = "Session aborted";
        goto LABEL_105;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v32 = NFLogGetLogger();
      if (v32)
      {
        uint64_t v33 = (void (*)(uint64_t, const char *, ...))v32;
        BOOL v34 = object_getClass(*(id *)(a1 + 32));
        BOOL v35 = class_isMetaClass(v34);
        BOOL v36 = object_getClassName(*(id *)(a1 + 32));
        int v107 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v37 = 45;
        if (v35) {
          uint64_t v37 = 43;
        }
        v33(6, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", v37, v36, v107, 1548);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v38 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        uint64_t v40 = object_getClassName(*(id *)(a1 + 32));
        NSErrorUserInfoKey v41 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v39;
        __int16 v118 = 2082;
        v119 = v40;
        __int16 v120 = 2082;
        uint64_t v121 = v41;
        __int16 v122 = 1024;
        int v123 = 1548;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", buf, 0x22u);
      }
      int v19 = "Session aborted";
      goto LABEL_104;
    case 2:
      if (!byte_100060438)
      {
        int v19 = "Network Error";
        goto LABEL_105;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        int v43 = (void (*)(uint64_t, const char *, ...))v42;
        id v44 = object_getClass(*(id *)(a1 + 32));
        BOOL v45 = class_isMetaClass(v44);
        uint64_t v46 = object_getClassName(*(id *)(a1 + 32));
        v108 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(6, "%c[%{public}s %{public}s]:%i [TSM] Network Error", v47, v46, v108, 1543);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v48 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v48)) {
          int v49 = 43;
        }
        else {
          int v49 = 45;
        }
        uint64_t v50 = object_getClassName(*(id *)(a1 + 32));
        __int16 v51 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v49;
        __int16 v118 = 2082;
        v119 = v50;
        __int16 v120 = 2082;
        uint64_t v121 = v51;
        __int16 v122 = 1024;
        int v123 = 1543;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Network Error", buf, 0x22u);
      }
      int v19 = "Network Error";
      goto LABEL_104;
    case 3:
      if (!byte_100060438)
      {
        int v19 = "External Tag Unavailable";
        goto LABEL_105;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v52 = NFLogGetLogger();
      if (v52)
      {
        uint64_t v53 = (void (*)(uint64_t, const char *, ...))v52;
        uint64_t v54 = object_getClass(*(id *)(a1 + 32));
        BOOL v55 = class_isMetaClass(v54);
        CFStringRef v56 = object_getClassName(*(id *)(a1 + 32));
        v109 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v57 = 45;
        if (v55) {
          uint64_t v57 = 43;
        }
        v53(6, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", v57, v56, v109, 1538);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v58 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v58)) {
          int v59 = 43;
        }
        else {
          int v59 = 45;
        }
        int v60 = object_getClassName(*(id *)(a1 + 32));
        id v61 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v59;
        __int16 v118 = 2082;
        v119 = v60;
        __int16 v120 = 2082;
        uint64_t v121 = v61;
        __int16 v122 = 1024;
        int v123 = 1538;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", buf, 0x22u);
      }
      int v19 = "External Tag Unavailable";
      goto LABEL_104;
    case 4:
      if (!byte_100060438)
      {
        int v19 = "Unsupported tag";
        goto LABEL_105;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v62 = NFLogGetLogger();
      if (v62)
      {
        __int16 v63 = (void (*)(uint64_t, const char *, ...))v62;
        id v64 = object_getClass(*(id *)(a1 + 32));
        BOOL v65 = class_isMetaClass(v64);
        int v66 = object_getClassName(*(id *)(a1 + 32));
        v110 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v67 = 45;
        if (v65) {
          uint64_t v67 = 43;
        }
        v63(6, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", v67, v66, v110, 1553);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v68 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v68)) {
          int v69 = 43;
        }
        else {
          int v69 = 45;
        }
        long long v70 = object_getClassName(*(id *)(a1 + 32));
        int v71 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v69;
        __int16 v118 = 2082;
        v119 = v70;
        __int16 v120 = 2082;
        uint64_t v121 = v71;
        __int16 v122 = 1024;
        int v123 = 1553;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", buf, 0x22u);
      }
      int v19 = "Unsupported tag";
      goto LABEL_104;
    case 5:
      if (!byte_100060438)
      {
        int v19 = "Tag access error";
        goto LABEL_105;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v72 = NFLogGetLogger();
      if (v72)
      {
        __int16 v73 = (void (*)(uint64_t, const char *, ...))v72;
        v74 = object_getClass(*(id *)(a1 + 32));
        BOOL v75 = class_isMetaClass(v74);
        uint64_t v76 = object_getClassName(*(id *)(a1 + 32));
        v111 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v77 = 45;
        if (v75) {
          uint64_t v77 = 43;
        }
        v73(6, "%c[%{public}s %{public}s]:%i [TSM] Tag access error", v77, v76, v111, 1568);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v78 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v78)) {
          int v79 = 43;
        }
        else {
          int v79 = 45;
        }
        long long v80 = object_getClassName(*(id *)(a1 + 32));
        __int16 v81 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v79;
        __int16 v118 = 2082;
        v119 = v80;
        __int16 v120 = 2082;
        uint64_t v121 = v81;
        __int16 v122 = 1024;
        int v123 = 1568;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Tag access error", buf, 0x22u);
      }
      int v19 = "Tag access error";
      goto LABEL_104;
    case 6:
      if (!byte_100060438)
      {
        int v19 = "Bad Command error";
        goto LABEL_105;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v82 = NFLogGetLogger();
      if (v82)
      {
        __int16 v83 = (void (*)(uint64_t, const char *, ...))v82;
        id v84 = object_getClass(*(id *)(a1 + 32));
        BOOL v85 = class_isMetaClass(v84);
        v86 = object_getClassName(*(id *)(a1 + 32));
        uint64_t v112 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v87 = 45;
        if (v85) {
          uint64_t v87 = 43;
        }
        v83(6, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", v87, v86, v112, 1558);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v88 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v88)) {
          int v89 = 43;
        }
        else {
          int v89 = 45;
        }
        v90 = object_getClassName(*(id *)(a1 + 32));
        __int16 v91 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v117 = v89;
        __int16 v118 = 2082;
        v119 = v90;
        __int16 v120 = 2082;
        uint64_t v121 = v91;
        __int16 v122 = 1024;
        int v123 = 1558;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", buf, 0x22u);
      }
      int v19 = "Bad Command error";
      goto LABEL_104;
    case 7:
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v92 = NFLogGetLogger();
        if (v92)
        {
          NSErrorUserInfoKey v93 = (void (*)(uint64_t, const char *, ...))v92;
          CFStringRef v94 = object_getClass(*(id *)(a1 + 32));
          BOOL v95 = class_isMetaClass(v94);
          NSErrorUserInfoKey v96 = object_getClassName(*(id *)(a1 + 32));
          v113 = sel_getName(*(SEL *)(a1 + 48));
          uint64_t v97 = 45;
          if (v95) {
            uint64_t v97 = 43;
          }
          v93(6, "%c[%{public}s %{public}s]:%i [TSM] Reader mode protection enabled", v97, v96, v113, 1573);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v14 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v98 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v98)) {
            int v99 = 43;
          }
          else {
            int v99 = 45;
          }
          v100 = object_getClassName(*(id *)(a1 + 32));
          v101 = sel_getName(*(SEL *)(a1 + 48));
          *(_DWORD *)id buf = 67109890;
          int v117 = v99;
          __int16 v118 = 2082;
          v119 = v100;
          __int16 v120 = 2082;
          uint64_t v121 = v101;
          __int16 v122 = 1024;
          int v123 = 1573;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reader mode protection enabled", buf, 0x22u);
        }
        int v19 = "Reader mode protection enabled";
LABEL_104:
      }
      else
      {
        int v19 = "Reader mode protection enabled";
      }
LABEL_105:
      id v102 = objc_alloc((Class)NSError);
      __int16 v26 = +[NSString stringWithUTF8String:"seld"];
      NSErrorUserInfoKey v114 = NSLocalizedDescriptionKey;
      uint64_t v103 = +[NSString stringWithUTF8String:v19];
      v115 = v103;
      v104 = +[NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      id v31 = [v102 initWithDomain:v26 code:a3 userInfo:v104];

LABEL_106:
LABEL_107:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      return;
    default:
      int v19 = 0;
      goto LABEL_105;
  }
}

void sub_100028814(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 step]);
    uint64_t v13 = +[NSNumber numberWithUnsignedInteger:a3];
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i state=%{public}@, spSessionStatus=%{public}@", v14, ClassName, Name, 1602, v12, v13);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    uint64_t v18 = object_getClassName(*(id *)(a1 + 32));
    int v19 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 step]);
    int v21 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)id buf = 67110402;
    int v31 = v17;
    __int16 v32 = 2082;
    uint64_t v33 = v18;
    __int16 v34 = 2082;
    BOOL v35 = v19;
    __int16 v36 = 1024;
    int v37 = 1602;
    __int16 v38 = 2114;
    int v39 = v20;
    __int16 v40 = 2114;
    NSErrorUserInfoKey v41 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i state=%{public}@, spSessionStatus=%{public}@", buf, 0x36u);
  }
  if ([v5 isComplete])
  {
    __int16 v22 = sub_100037740();
    sub_10003D160(v22, *(void **)(a1 + 40));

    [*(id *)(a1 + 32) handleCardIngestionStatus:11];
    sub_10001A0A0(*(atomic_uchar **)(a1 + 32));
  }
  else
  {
    uint64_t v23 = *(void *)(a1 + 48);
    id v24 = objc_alloc((Class)NSError);
    uint64_t v25 = +[NSString stringWithUTF8String:"seld"];
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Pending card ingestion exist";
    __int16 v26 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v27 = [v24 initWithDomain:v25 code:2 userInfo:v26];
    (*(void (**)(uint64_t, id, uint64_t))(v23 + 16))(v23, v27, -1);
  }
}

void sub_100028E14(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(Class)) {
      uint64_t v7 = 43;
    }
    else {
      uint64_t v7 = 45;
    }
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 64));
    id v10 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v7, ClassName, Name, 1630, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    int v15 = object_getClassName(*(id *)(a1 + 32));
    int v16 = sel_getName(*(SEL *)(a1 + 64));
    int v17 = [[*(id *)(a1 + 40) NF_userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)id buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v14;
    __int16 v157 = 2082;
    v158 = v15;
    __int16 v159 = 2082;
    v160 = v16;
    __int16 v161 = 1024;
    int v162 = 1630;
    __int16 v163 = 2114;
    id v164 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (!v3)
  {
    int v19 = *(void ***)(a1 + 32);
    uint64_t v20 = *(void **)(a1 + 48);
    int v21 = *(void **)(a1 + 56);
    id v146 = v20;
    id v22 = v21;
    if (!v19)
    {
LABEL_119:

      goto LABEL_120;
    }
    uint64_t v23 = [v146 serverIdentifier];
    unsigned int v24 = [v23 hasPrefix:@"http"];
    if (v23)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25)
      {
        __int16 v26 = object_getClass(v19);
        if (class_isMetaClass(v26)) {
          uint64_t v27 = 43;
        }
        else {
          uint64_t v27 = 45;
        }
        NSErrorUserInfoKey v28 = object_getClassName(v19);
        CFStringRef v29 = sel_getName("_ingestCard:callback:");
        v25(6, "%c[%{public}s %{public}s]:%i identifier : %{public}@", v27, v28, v29, 1477, v23);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = object_getClass(v19);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        uint64_t v33 = object_getClassName(v19);
        __int16 v34 = sel_getName("_ingestCard:callback:");
        *(_DWORD *)id buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v32;
        __int16 v157 = 2082;
        v158 = v33;
        __int16 v159 = 2082;
        v160 = v34;
        __int16 v161 = 1024;
        int v162 = 1477;
        __int16 v163 = 2114;
        id v164 = v23;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i identifier : %{public}@", buf, 0x2Cu);
      }

      if ((v24 & 1) == 0)
      {
        BOOL v35 = sub_10003AFD0(v19[3], v23);
        BOOL v36 = v35 == 0;

        if (v36)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v37)
          {
            __int16 v38 = object_getClass(v19);
            if (class_isMetaClass(v38)) {
              uint64_t v39 = 43;
            }
            else {
              uint64_t v39 = 45;
            }
            __int16 v40 = object_getClassName(v19);
            NSErrorUserInfoKey v41 = sel_getName("_ingestCard:callback:");
            v37(4, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", v39, v40, v41, 1479, v23);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v42 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            int v43 = object_getClass(v19);
            if (class_isMetaClass(v43)) {
              int v44 = 43;
            }
            else {
              int v44 = 45;
            }
            BOOL v45 = object_getClassName(v19);
            uint64_t v46 = sel_getName("_ingestCard:callback:");
            *(_DWORD *)id buf = 67110146;
            *(_DWORD *)&uint8_t buf[4] = v44;
            __int16 v157 = 2082;
            v158 = v45;
            __int16 v159 = 2082;
            v160 = v46;
            __int16 v161 = 1024;
            int v162 = 1479;
            __int16 v163 = 2114;
            id v164 = v23;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", buf, 0x2Cu);
          }

          id v47 = objc_alloc((Class)NSError);
          __int16 v48 = +[NSString stringWithUTF8String:"seld"];
          *(void *)&long long v165 = NSLocalizedDescriptionKey;
          *(void *)id buf = @"No registered URL.";
          int v49 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v165 count:1];
          id v50 = [v47 initWithDomain:v48 code:39 userInfo:v49];
          (*((void (**)(id, id, uint64_t))v22 + 2))(v22, v50, -1);

          goto LABEL_118;
        }
      }
    }
    else
    {
      uint64_t v23 = sub_10003B038(v19[3]);
      if (!v23)
      {
        id v73 = objc_alloc((Class)NSError);
        v74 = +[NSString stringWithUTF8String:"seld"];
        *(void *)&long long v165 = NSLocalizedDescriptionKey;
        *(void *)id buf = @"No registration info.";
        BOOL v75 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v165 count:1];
        id v76 = [v73 initWithDomain:v74 code:39 userInfo:v75];
        (*((void (**)(id, id, uint64_t))v22 + 2))(v22, v76, -1);

        uint64_t v23 = 0;
LABEL_118:

        goto LABEL_119;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v51)
      {
        uint64_t v52 = object_getClass(v19);
        if (class_isMetaClass(v52)) {
          uint64_t v53 = 43;
        }
        else {
          uint64_t v53 = 45;
        }
        uint64_t v54 = object_getClassName(v19);
        BOOL v55 = sel_getName("_ingestCard:callback:");
        v51(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v53, v54, v55, 1485, v23);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      CFStringRef v56 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v57 = object_getClass(v19);
        if (class_isMetaClass(v57)) {
          int v58 = 43;
        }
        else {
          int v58 = 45;
        }
        int v59 = object_getClassName(v19);
        int v60 = sel_getName("_ingestCard:callback:");
        *(_DWORD *)id buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v58;
        __int16 v157 = 2082;
        v158 = v59;
        __int16 v159 = 2082;
        v160 = v60;
        __int16 v161 = 1024;
        int v162 = 1485;
        __int16 v163 = 2114;
        id v164 = v23;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
      }
    }
    id v61 = [v146 uri];
    BOOL v62 = v61 == 0;

    if (v62)
    {
      id v68 = objc_alloc((Class)NSError);
      int v69 = +[NSString stringWithUTF8String:"seld"];
      *(void *)&long long v165 = NSLocalizedDescriptionKey;
      *(void *)id buf = @"Missing parameter";
      long long v70 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v165 count:1];
      id v71 = [v68 initWithDomain:v69 code:9 userInfo:v70];
      (*((void (**)(id, id, uint64_t))v22 + 2))(v22, v71, -1);
    }
    else
    {
      __int16 v63 = v19;
      objc_sync_enter(v63);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v64 = objc_alloc((Class)NSError);
        uint64_t v65 = +[NSString stringWithUTF8String:"seld"];
        *(void *)&long long v165 = NSLocalizedDescriptionKey;
        *(void *)id buf = @"Card ingestion is in progress";
        v145 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v165 count:1];
        id v66 = [v64 initWithDomain:v65 code:2 userInfo:v145];
        (*((void (**)(id, id, uint64_t))v22 + 2))(v22, v66, -1);
        id v144 = (id)v65;
        int v67 = 1;
      }
      else
      {
        id v150 = 0;
        uint64_t v72 = +[NFSecureElement embeddedSecureElementWithError:&v150];
        id v144 = v150;
        v145 = [v72 serialNumber];

        if (v145)
        {
          if (v24) {
            +[NSURL URLWithString:v23];
          }
          else {
          v140 = sub_10003AFD0(v63[3], v23);
          }
          id v90 = objc_alloc((Class)NSString);
          __int16 v91 = [v146 uri];
          id v142 = [v90 initWithFormat:@"v2/%@/%@", v145, v91];

          uint64_t v139 = [v140 URLByAppendingPathComponent:v142];
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v92 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v92)
          {
            NSErrorUserInfoKey v93 = object_getClass(v63);
            if (class_isMetaClass(v93)) {
              uint64_t v94 = 43;
            }
            else {
              uint64_t v94 = 45;
            }
            BOOL v95 = object_getClassName(v63);
            NSErrorUserInfoKey v96 = sel_getName("_ingestCard:callback:");
            v92(6, "%c[%{public}s %{public}s]:%i url: %{public}@", v94, v95, v96, 1519, v139);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v97 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            int v98 = object_getClass(v63);
            if (class_isMetaClass(v98)) {
              int v99 = 43;
            }
            else {
              int v99 = 45;
            }
            v100 = object_getClassName(v63);
            v101 = sel_getName("_ingestCard:callback:");
            *(_DWORD *)id buf = 67110146;
            *(_DWORD *)&uint8_t buf[4] = v99;
            __int16 v157 = 2082;
            v158 = v100;
            __int16 v159 = 2082;
            v160 = v101;
            __int16 v161 = 1024;
            int v162 = 1519;
            __int16 v163 = 2114;
            id v164 = v139;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i url: %{public}@", buf, 0x2Cu);
          }

          id v102 = [NFRemoteAdminReaderState alloc];
          uint64_t v103 = objc_opt_new();
          v104 = [v139 absoluteString];
          int v143 = [(NFRemoteAdminReaderState *)v102 initWithDictionary:v103 sourceURL:v104 originator:v23];

          [(NFRemoteAdminState *)v143 setPendingImmediateRetry:1];
          [(NFRemoteAdminReaderState *)v143 setRequestInfo:v146];
          v147[0] = _NSConcreteStackBlock;
          v147[1] = 3221225472;
          v147[2] = sub_100027B64;
          v147[3] = &unk_100058C30;
          v147[4] = v63;
          v149 = "_ingestCard:callback:";
          id v138 = v22;
          id v148 = v138;
          [(NFRemoteAdminReaderState *)v143 setStateUpdateOnSessionEndedCallback:v147];
          id v105 = v146;
          v141 = objc_opt_new();
          v106 = [v105 sessionToken];
          int v107 = v106;
          if (v106 && [v106 length]) {
            [v141 setObject:v107 forKeyedSubscript:@"cardSessionToken"];
          }
          v108 = [v105 cardServiceInfo];
          v109 = [v108 objectForKey:@"technology"];

          if (v109)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v109 length])
            {
              [v141 setObject:v109 forKeyedSubscript:@"technology"];
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v110 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v110)
              {
                v111 = object_getClass(v63);
                if (class_isMetaClass(v111)) {
                  uint64_t v112 = 43;
                }
                else {
                  uint64_t v112 = 45;
                }
                uint64_t v137 = v112;
                v113 = object_getClassName(v63);
                NSErrorUserInfoKey v114 = sel_getName("_generateReaderParamsFromRequest:");
                v110(4, "%c[%{public}s %{public}s]:%i Unexpected technology object type", v137, v113, v114, 1085);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v115 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
              {
                int v116 = object_getClass(v63);
                if (class_isMetaClass(v116)) {
                  int v117 = 43;
                }
                else {
                  int v117 = 45;
                }
                __int16 v118 = object_getClassName(v63);
                v119 = sel_getName("_generateReaderParamsFromRequest:");
                *(_DWORD *)id buf = 67109890;
                *(_DWORD *)&uint8_t buf[4] = v117;
                __int16 v157 = 2082;
                v158 = v118;
                __int16 v159 = 2082;
                v160 = v119;
                __int16 v161 = 1024;
                int v162 = 1085;
                _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected technology object type", buf, 0x22u);
              }
            }
          }
          __int16 v120 = [v105 cardServiceInfo];
          uint64_t v121 = [v120 objectForKey:@"version"];

          if (!v121 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            uint64_t v122 = +[NSNumber numberWithInt:2];

            uint64_t v121 = (void *)v122;
          }
          [v141 setObject:v121 forKeyedSubscript:@"version"];

          [(NFRemoteAdminReaderState *)v143 setParameters:v141];
          int v123 = v63[3];
          v124 = sub_10001D098((uint64_t)v63, @"seld");
          sub_10003B90C(v123, v124);

          long long v167 = 0u;
          long long v168 = 0u;
          long long v165 = 0u;
          long long v166 = 0u;
          int v125 = sub_100037740();
          v126 = sub_10003D0E0(v125);

          id v127 = [v126 countByEnumeratingWithState:&v165 objects:buf count:16];
          if (v127)
          {
            uint64_t v128 = *(void *)v166;
            while (2)
            {
              for (int i = 0; i != v127; int i = (char *)i + 1)
              {
                if (*(void *)v166 != v128) {
                  objc_enumerationMutation(v126);
                }
                uint64_t v130 = *(void **)(*((void *)&v165 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v132 = [v130 stateUpdateOnSessionEndedCallback];

                  if (v132)
                  {
                    id v133 = objc_alloc((Class)NSError);
                    int v134 = +[NSString stringWithUTF8String:"seld"];
                    NSErrorUserInfoKey v155 = NSLocalizedDescriptionKey;
                    v151[0] = @"Pending card ingestion exist";
                    v135 = +[NSDictionary dictionaryWithObjects:v151 forKeys:&v155 count:1];
                    id v136 = [v133 initWithDomain:v134 code:2 userInfo:v135];
                    (*((void (**)(id, id, uint64_t))v138 + 2))(v138, v136, -1);
                  }
                  else
                  {
                    [v130 setPendingImmediateRetry:1];
                    v151[0] = _NSConcreteStackBlock;
                    v151[1] = 3221225472;
                    v151[2] = sub_100028814;
                    v151[3] = &unk_100058C58;
                    v151[4] = v63;
                    v154 = "_ingestCard:callback:";
                    int v152 = v143;
                    id v153 = v138;
                    [v130 setStateUpdateOnSessionEndedCallback:v151];
                    sub_10001A0A0((atomic_uchar *)v63);
                  }
                  int v67 = 1;
                  goto LABEL_114;
                }
              }
              id v127 = [v126 countByEnumeratingWithState:&v165 objects:buf count:16];
              if (v127) {
                continue;
              }
              break;
            }
          }

          v131 = sub_100037740();
          sub_10003D160(v131, v143);

          [v63 handleCardIngestionStatus:11];
          int v67 = 0;
LABEL_114:

          id v89 = v139;
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v77)
          {
            long long v78 = object_getClass(v63);
            if (class_isMetaClass(v78)) {
              uint64_t v79 = 43;
            }
            else {
              uint64_t v79 = 45;
            }
            long long v80 = object_getClassName(v63);
            __int16 v81 = sel_getName("_ingestCard:callback:");
            v77(3, "%c[%{public}s %{public}s]:%i Missing primary SEID - %{public}@", v79, v80, v81, 1505, v144);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v82 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            __int16 v83 = object_getClass(v63);
            if (class_isMetaClass(v83)) {
              int v84 = 43;
            }
            else {
              int v84 = 45;
            }
            BOOL v85 = object_getClassName(v63);
            v86 = sel_getName("_ingestCard:callback:");
            *(_DWORD *)id buf = 67110146;
            *(_DWORD *)&uint8_t buf[4] = v84;
            __int16 v157 = 2082;
            v158 = v85;
            __int16 v159 = 2082;
            v160 = v86;
            __int16 v161 = 1024;
            int v162 = 1505;
            __int16 v163 = 2114;
            id v164 = v144;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing primary SEID - %{public}@", buf, 0x2Cu);
          }

          id v87 = objc_alloc((Class)NSError);
          uint64_t v88 = +[NSString stringWithUTF8String:"seld"];
          *(void *)&long long v165 = NSLocalizedDescriptionKey;
          *(void *)id buf = @"Missing SEID";
          id v142 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v165 count:1];
          id v89 = [v87 initWithDomain:v88 code:15 userInfo:v142];
          (*((void (**)(id, id, uint64_t))v22 + 2))(v22, v89, -1);
          v140 = (void *)v88;
          int v67 = 1;
        }

        id v66 = v140;
      }

      objc_sync_exit(v63);
      if (!v67) {
        sub_10001A0A0((atomic_uchar *)v63);
      }
    }
    goto LABEL_118;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_120:
}

void sub_10002A0F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002A3FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(Class)) {
      uint64_t v7 = 43;
    }
    else {
      uint64_t v7 = 45;
    }
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    id v10 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v7, ClassName, Name, 1675, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    int v15 = object_getClassName(*(id *)(a1 + 32));
    int v16 = sel_getName(*(SEL *)(a1 + 56));
    int v17 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)id buf = 67110146;
    int v39 = v14;
    __int16 v40 = 2082;
    NSErrorUserInfoKey v41 = v15;
    __int16 v42 = 2082;
    int v43 = v16;
    __int16 v44 = 1024;
    int v45 = 1675;
    __int16 v46 = 2114;
    id v47 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v19 = *(void **)(a1 + 32);
    uint64_t v20 = (void (**)(id, void))*(id *)(a1 + 48);
    if (v19)
    {
      int v21 = v19;
      objc_sync_enter(v21);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v21[12] abort:1];
LABEL_26:
        objc_sync_exit(v21);

        v20[2](v20, 0);
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v22 = sub_100037740();
        uint64_t v23 = sub_10003D0E0(v22);

        id v24 = [v23 countByEnumeratingWithState:&v32 objects:buf count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v33;
          while (2)
          {
            __int16 v26 = 0;
            do
            {
              if (*(void *)v33 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v27 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v26);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v27 setStep:4];
                [v27 save];

                goto LABEL_26;
              }
              __int16 v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            id v24 = [v23 countByEnumeratingWithState:&v32 objects:buf count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        objc_sync_exit(v21);
        id v28 = objc_alloc((Class)NSError);
        CFStringRef v29 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
        CFStringRef v37 = @"No pending ReaderSession";
        uint64_t v30 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        id v31 = [v28 initWithDomain:v29 code:12 userInfo:v30];
        ((void (**)(id, id))v20)[2](v20, v31);
      }
    }
  }
}

void sub_10002A814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002A83C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 1691, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      int v15 = object_getClassName(*(id *)(a1 + 32));
      int v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)id buf = 67110146;
      int v50 = v14;
      __int16 v51 = 2082;
      uint64_t v52 = v15;
      __int16 v53 = 2082;
      uint64_t v54 = v16;
      __int16 v55 = 1024;
      int v56 = 1691;
      __int16 v57 = 2114;
      id v58 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    sub_100037740();
    int v17 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = sub_10003C478(v17, &stru_100059418, v5);

    if (v18)
    {
      id v19 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v18];
      uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 48) publicToken];
      if (v20)
      {
        int v21 = v20;
        id v22 = [v20 NF_asHexString];
        [v19 setObject:v22 forKey:@"APNTokenUpdateInfo"];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        uint64_t v37 = *(void *)(a1 + 40);
        id v38 = objc_alloc((Class)NSError);
        int v39 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
        CFStringRef v46 = @"Failed getting token info";
        __int16 v40 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v41 = [v38 initWithDomain:v39 code:40 userInfo:v40];
        (*(void (**)(uint64_t, void, id))(v37 + 16))(v37, 0, v41);

        int v21 = 0;
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v23 = NFLogGetLogger();
      if (v23)
      {
        id v24 = (void (*)(uint64_t, const char *, ...))v23;
        uint64_t v25 = object_getClass(*(id *)(a1 + 32));
        BOOL v26 = class_isMetaClass(v25);
        uint64_t v27 = object_getClassName(*(id *)(a1 + 32));
        __int16 v44 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v28 = 45;
        if (v26) {
          uint64_t v28 = 43;
        }
        v24(3, "%c[%{public}s %{public}s]:%i Failed getting SELD info", v28, v27, v44, 1698);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      CFStringRef v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v30)) {
          int v31 = 43;
        }
        else {
          int v31 = 45;
        }
        long long v32 = object_getClassName(*(id *)(a1 + 32));
        long long v33 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)id buf = 67109890;
        int v50 = v31;
        __int16 v51 = 2082;
        uint64_t v52 = v32;
        __int16 v53 = 2082;
        uint64_t v54 = v33;
        __int16 v55 = 1024;
        int v56 = 1698;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed getting SELD info", buf, 0x22u);
      }

      uint64_t v34 = *(void *)(a1 + 40);
      id v35 = objc_alloc((Class)NSError);
      id v19 = +[NSString stringWithUTF8String:"seld"];
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      CFStringRef v48 = @"Failed getting SELD info";
      int v21 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      id v36 = [v35 initWithDomain:v19 code:12 userInfo:v21];
      (*(void (**)(uint64_t, void, id))(v34 + 16))(v34, 0, v36);
    }
    [v5 endSession];
  }
}

void sub_10002AFD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    id v10 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v12, ClassName, Name, 1722, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    int v17 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v18 = [*(id *)(a1 + 40) NF_userInfo];
    id v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)id buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v15;
    *(_WORD *)uint64_t v25 = 2082;
    *(void *)&v25[2] = v16;
    *(_WORD *)&v25[10] = 2082;
    *(void *)&v25[12] = v17;
    *(_WORD *)&v25[20] = 1024;
    *(_DWORD *)&v25[22] = 1722;
    *(_WORD *)&v25[26] = 2114;
    *(void *)&v25[28] = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    if (v20)
    {
      id v22 = +[NFHardwareManager sharedHardwareManager];
      *(void *)id buf = _NSConcreteStackBlock;
      *(void *)uint64_t v25 = 3221225472;
      *(void *)&v25[8] = sub_10002A83C;
      *(void *)&v25[16] = &unk_100058CD0;
      *(void *)&v25[24] = v20;
      BOOL v26 = "_getSELDInfoForBrokerWithCompletion:";
      *(void *)&v25[32] = v21;
      id v23 = [v22 startSecureElementManagerSession:buf];
    }
  }
}

void sub_10002B2A8(void **a1, int a2, void *a3)
{
  uint64_t v82 = a3;
  if (a1)
  {
    uint64_t v110 = 0;
    v111 = &v110;
    uint64_t v112 = 0x3032000000;
    v113 = sub_10002163C;
    NSErrorUserInfoKey v114 = sub_10002164C;
    id v115 = 0;
    uint64_t v104 = 0;
    id v105 = &v104;
    uint64_t v106 = 0x3032000000;
    int v107 = sub_10002163C;
    v108 = sub_10002164C;
    id v109 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = +[NFHardwareManager sharedHardwareManager];
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_10002BE70;
    v100[3] = &unk_100058CF8;
    id v102 = &v110;
    uint64_t v103 = &v104;
    dispatch_semaphore_t dsema = v4;
    dispatch_semaphore_t v101 = dsema;
    id v6 = [v5 startSecureElementManagerSession:v100];

    char v7 = 0;
    do
    {
      while (1)
      {
        dispatch_time_t v8 = dispatch_time(0, 300000000000);
        intptr_t v9 = dispatch_semaphore_wait(dsema, v8);
        if (v7 & 1 | (v9 == 0)) {
          break;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(a1);
          if (class_isMetaClass(Class)) {
            uint64_t v12 = 43;
          }
          else {
            uint64_t v12 = 45;
          }
          ClassName = object_getClassName(a1);
          Name = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          Logger(3, "%c[%{public}s %{public}s]:%i Exceeded session acquisition time expectation.", v12, ClassName, Name, 1755);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = object_getClass(a1);
          if (class_isMetaClass(v16)) {
            int v17 = 43;
          }
          else {
            int v17 = 45;
          }
          uint64_t v18 = object_getClassName(a1);
          id v19 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          int buf = 67109890;
          int v119 = v17;
          __int16 v120 = 2082;
          uint64_t v121 = v18;
          __int16 v122 = 2082;
          int v123 = v19;
          __int16 v124 = 1024;
          int v125 = 1755;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Exceeded session acquisition time expectation.", (uint8_t *)&buf, 0x22u);
        }

        uint64_t v20 = sub_10001AEC4();
        sub_10001FDA4((uint64_t)v20);

        char v7 = 1;
      }
    }
    while (v9);
    if (v7)
    {
      id v21 = sub_10001AEC4();
      sub_10001FD4C((uint64_t)v21);
    }
    if (v111[5] || (long long v33 = (void *)v105[5]) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v22)
      {
        id v23 = object_getClass(a1);
        if (class_isMetaClass(v23)) {
          uint64_t v24 = 43;
        }
        else {
          uint64_t v24 = 45;
        }
        uint64_t v25 = object_getClassName(a1);
        BOOL v26 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        v22(3, "%c[%{public}s %{public}s]:%i Unable to start session: %{public}@", v24, v25, v26, 1767, v111[5]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v27 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = object_getClass(a1);
        if (class_isMetaClass(v28)) {
          int v29 = 43;
        }
        else {
          int v29 = 45;
        }
        uint64_t v30 = object_getClassName(a1);
        int v31 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        long long v32 = (void *)v111[5];
        int buf = 67110146;
        int v119 = v29;
        __int16 v120 = 2082;
        uint64_t v121 = v30;
        __int16 v122 = 2082;
        int v123 = v31;
        __int16 v124 = 1024;
        int v125 = 1767;
        __int16 v126 = 2114;
        id v127 = v32;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to start session: %{public}@", (uint8_t *)&buf, 0x2Cu);
      }

      v82[2](v82, v111[5]);
    }
    else
    {
      if (a2 == 8 || a2 == 4)
      {
        uint64_t v99 = 0;
        uint64_t v34 = (id *)&v99;
        [v33 deleteAllAppletsOfType:queueConnection:error:];
      }
      else
      {
        uint64_t v98 = 0;
        uint64_t v34 = (id *)&v98;
        [v33 deleteAllApplets:0 error:&v98];
      }
      id v81 = *v34;
      id v35 = sub_100039B5C(a1[3]);
      id v36 = [v35 allKeys];

      if ([v36 count])
      {
        uint64_t v37 = a1[3];
        id v38 = sub_10001D098((uint64_t)a1, 0);
        sub_10003B90C(v37, v38);
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v39 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v39)
        {
          __int16 v40 = object_getClass(a1);
          if (class_isMetaClass(v40)) {
            uint64_t v41 = 43;
          }
          else {
            uint64_t v41 = 45;
          }
          __int16 v42 = object_getClassName(a1);
          int v43 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          v39(5, "%c[%{public}s %{public}s]:%i No registered server identifiers", v41, v42, v43, 1783);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v38 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v44 = object_getClass(a1);
          if (class_isMetaClass(v44)) {
            int v45 = 43;
          }
          else {
            int v45 = 45;
          }
          CFStringRef v46 = object_getClassName(a1);
          NSErrorUserInfoKey v47 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          int buf = 67109890;
          int v119 = v45;
          __int16 v120 = 2082;
          uint64_t v121 = v46;
          __int16 v122 = 2082;
          int v123 = v47;
          __int16 v124 = 1024;
          int v125 = 1783;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No registered server identifiers", (uint8_t *)&buf, 0x22u);
        }
      }

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      CFStringRef v48 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v48)
      {
        int v49 = object_getClass(a1);
        if (class_isMetaClass(v49)) {
          uint64_t v50 = 43;
        }
        else {
          uint64_t v50 = 45;
        }
        __int16 v51 = object_getClassName(a1);
        uint64_t v52 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        v48(6, "%c[%{public}s %{public}s]:%i registeredIdArray=%{public}@", v50, v51, v52, 1789, v36);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v53 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v54 = object_getClass(a1);
        if (class_isMetaClass(v54)) {
          int v55 = 43;
        }
        else {
          int v55 = 45;
        }
        int v56 = object_getClassName(a1);
        __int16 v57 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        int buf = 67110146;
        int v119 = v55;
        __int16 v120 = 2082;
        uint64_t v121 = v56;
        __int16 v122 = 2082;
        int v123 = v57;
        __int16 v124 = 1024;
        int v125 = 1789;
        __int16 v126 = 2114;
        id v127 = v36;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i registeredIdArray=%{public}@", (uint8_t *)&buf, 0x2Cu);
      }

      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v58 = v36;
      id v59 = [v58 countByEnumeratingWithState:&v94 objects:v117 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v95;
        do
        {
          for (int i = 0; i != v59; int i = (char *)i + 1)
          {
            if (*(void *)v95 != v60) {
              objc_enumerationMutation(v58);
            }
            BOOL v62 = sub_10003BD48(a1[3], *(void **)(*((void *)&v94 + 1) + 8 * i));
            [v62 setPendingImmediateRetry:1];
            [v62 save];
          }
          id v59 = [v58 countByEnumeratingWithState:&v94 objects:v117 count:16];
        }
        while (v59);
      }

      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id obj = v58;
      id v63 = [obj countByEnumeratingWithState:&v90 objects:v116 count:16];
      if (v63)
      {
        id v88 = 0;
        uint64_t v85 = *(void *)v91;
        do
        {
          id v86 = v63;
          for (j = 0; j != v86; j = (char *)j + 1)
          {
            if (*(void *)v91 != v85) {
              objc_enumerationMutation(obj);
            }
            uint64_t v65 = *(void **)(*((void *)&v90 + 1) + 8 * (void)j);
            id v66 = sub_10003BD48(a1[3], v65);
            char v89 = 0;
            do
            {
              int v67 = sub_100023F34(a1, v66, 1, (void *)v105[5], &v89);
              if (v89)
              {
                uint64_t v68 = sub_10003D59C(a1[3], v65);

                id v66 = (void *)v68;
                if (!v68)
                {
                  id v66 = sub_10003BD48(a1[3], v65);
                  if (!v66)
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    int v69 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                    if (v69)
                    {
                      long long v70 = object_getClass(a1);
                      if (class_isMetaClass(v70)) {
                        uint64_t v71 = 43;
                      }
                      else {
                        uint64_t v71 = 45;
                      }
                      uint64_t v72 = object_getClassName(a1);
                      id v73 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
                      v69(4, "%c[%{public}s %{public}s]:%i Missing expected state info", v71, v72, v73, 1813);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v74 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                    {
                      BOOL v75 = object_getClass(a1);
                      if (class_isMetaClass(v75)) {
                        int v76 = 43;
                      }
                      else {
                        int v76 = 45;
                      }
                      uint64_t v77 = object_getClassName(a1);
                      long long v78 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
                      int buf = 67109890;
                      int v119 = v76;
                      __int16 v120 = 2082;
                      uint64_t v121 = v77;
                      __int16 v122 = 2082;
                      int v123 = v78;
                      __int16 v124 = 1024;
                      int v125 = 1813;
                      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing expected state info", (uint8_t *)&buf, 0x22u);
                    }

                    id v66 = 0;
                    char v89 = 0;
                  }
                }
              }
              if (v67) {
                BOOL v79 = 1;
              }
              else {
                BOOL v79 = v89 == 0;
              }
            }
            while (!v79);
            if (v67)
            {
              id v80 = v67;

              id v88 = v80;
            }
          }
          id v63 = [obj countByEnumeratingWithState:&v90 objects:v116 count:16];
        }
        while (v63);
      }
      else
      {
        id v88 = 0;
      }

      [(id)v105[5] endSession];
      if (!v88 && v81) {
        id v88 = v81;
      }
      ((void (**)(id, id))v82)[2](v82, v88);
    }
    _Block_object_dispose(&v104, 8);

    _Block_object_dispose(&v110, 8);
  }
}

void sub_10002BDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_10002BE70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002C1B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    id v10 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v12, ClassName, Name, 1836, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    int v17 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v18 = [*(id *)(a1 + 40) NF_userInfo];
    id v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)int buf = 67110146;
    int v24 = v15;
    __int16 v25 = 2082;
    BOOL v26 = v16;
    __int16 v27 = 2082;
    uint64_t v28 = v17;
    __int16 v29 = 1024;
    int v30 = 1836;
    __int16 v31 = 2114;
    long long v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002C448;
    v21[3] = &unk_100058D20;
    v21[4] = v20;
    id v22 = *(id *)(a1 + 48);
    sub_10001E258(v20, v21);
  }
}

void sub_10002C448(uint64_t a1)
{
}

void sub_10002C70C(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    id v10 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v12, ClassName, Name, 1854, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    int v17 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v18 = [[*(id *)(a1 + 40) NF_userInfo];
    id v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)int buf = 67110146;
    int v24 = v15;
    __int16 v25 = 2082;
    BOOL v26 = v16;
    __int16 v27 = 2082;
    uint64_t v28 = v17;
    __int16 v29 = 1024;
    int v30 = 1854;
    __int16 v31 = 2114;
    long long v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002C99C;
    v21[3] = &unk_100058D20;
    v21[4] = v20;
    id v22 = *(id *)(a1 + 48);
    sub_10001E258(v20, v21);
  }
}

void sub_10002C99C(uint64_t a1)
{
}

void sub_10002CC60(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    id v10 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v12, ClassName, Name, 1873, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    int v17 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v18 = [[*(id *)(a1 + 40) NF_userInfo];
    id v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)int buf = 67110146;
    int v24 = v15;
    __int16 v25 = 2082;
    BOOL v26 = v16;
    __int16 v27 = 2082;
    uint64_t v28 = v17;
    __int16 v29 = 1024;
    int v30 = 1873;
    __int16 v31 = 2114;
    long long v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002CEF0;
    v21[3] = &unk_100058D20;
    v21[4] = v20;
    id v22 = *(id *)(a1 + 48);
    sub_10001E258(v20, v21);
  }
}

void sub_10002CEF0(uint64_t a1)
{
}

void sub_10002D1B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    id v10 = [*(id *)(a1 + 40) NF_userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ClientName"];
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v12, ClassName, Name, 1904, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    int v17 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v18 = [[*(id *)(a1 + 40) NF_userInfo];
    id v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)int buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v15;
    __int16 v28 = 2082;
    __int16 v29 = v16;
    __int16 v30 = 2082;
    __int16 v31 = v17;
    __int16 v32 = 1024;
    int v33 = 1904;
    __int16 v34 = 2114;
    id v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);
  }
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = (void (**)(id, void *, void))*(id *)(a1 + 48);
    if (v20)
    {
      id v22 = [*(id *)(v20 + 48) publicToken];
      if (v22)
      {
        v21[2](v21, v22, 0);
      }
      else
      {
        id v23 = objc_alloc((Class)NSError);
        int v24 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
        *(void *)int buf = @"Missing default token";
        __int16 v25 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v36 count:1];
        id v26 = [v23 initWithDomain:v24 code:40 userInfo:v25];
        ((void (**)(id, void *, id))v21)[2](v21, 0, v26);
      }
    }
  }
}

void sub_10002D4C8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  dispatch_semaphore_t v4 = sub_10001D098(v2, @"seld");
  sub_10003B90C(v3, v4);

  id v5 = *(atomic_uchar **)(a1 + 32);

  sub_10001A0A0(v5);
}

void sub_10002D53C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  dispatch_semaphore_t v4 = sub_10001D098(v2, @"seld");
  sub_10003B90C(v3, v4);

  id v5 = *(atomic_uchar **)(a1 + 32);

  sub_10001A0A0(v5);
}

void sub_10002D5AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 10))
  {
    *(unsigned char *)(v1 + 10) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_semaphore_t v4 = *(void **)(v3 + 24);
    id v5 = sub_10001D098(v3, @"seld");
    sub_10003B90C(v4, v5);

    uint64_t v6 = *(atomic_uchar **)(a1 + 32);
    sub_10001A0A0(v6);
  }
}

void sub_10002E0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002E224(_Unwind_Exception *exception_object)
{
}

void sub_10002E4E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002E854(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10002E878(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v188 = a4;
  PLLogRegisteredEvent();
  id v8 = (id)a1;
  objc_sync_enter(v8);
  if (*(void *)(a1 + 96))
  {
LABEL_191:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v8);
      if (class_isMetaClass(Class)) {
        uint64_t v184 = 43;
      }
      else {
        uint64_t v184 = 45;
      }
      ClassName = object_getClassName(v8);
      Name = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      Logger(3, "%c[%{public}s %{public}s]:%i FAILED: %s", v184, ClassName, Name, 2400, "_activeSession == ((void *)0)");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v178 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
    {
      int v179 = object_getClass(v8);
      if (class_isMetaClass(v179)) {
        int v180 = 43;
      }
      else {
        int v180 = 45;
      }
      v181 = object_getClassName(v8);
      id v182 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      *(_DWORD *)int buf = 67110146;
      int v207 = v180;
      __int16 v208 = 2082;
      v209 = v181;
      __int16 v210 = 2082;
      v211 = v182;
      __int16 v212 = 1024;
      int v213 = 2400;
      __int16 v214 = 2080;
      v215 = "_activeSession == ((void *)0)";
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i FAILED: %s", buf, 0x2Cu);
    }

    abort();
  }
  id v189 = 0;
  uint64_t v9 = 0;
  uint64_t v187 = 0;
  while (1)
  {
    while (1)
    {
      id v10 = [v7 sourceUrl];
      BOOL v11 = v10 == 0;

      if (v11)
      {
        uint64_t v12 = *(void **)(a1 + 24);
        uint64_t v13 = [v7 serverIdentifier];
        int v14 = sub_10003AFD0(v12, v13);

        if (v14)
        {
          int v15 = [v14 absoluteString];
          [v7 setSourceUrl:v15];
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v16)
          {
            int v17 = object_getClass(v8);
            if (class_isMetaClass(v17)) {
              uint64_t v18 = 43;
            }
            else {
              uint64_t v18 = 45;
            }
            id v19 = object_getClassName(v8);
            uint64_t v20 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
            id v21 = [v7 serverIdentifier];
            v16(6, "%c[%{public}s %{public}s]:%i Unknown server identifier:%{public}@", v18, v19, v20, 2409, v21);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v22 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = object_getClass(v8);
            if (class_isMetaClass(v23)) {
              int v24 = 43;
            }
            else {
              int v24 = 45;
            }
            __int16 v25 = object_getClassName(v8);
            id v26 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
            __int16 v27 = [v7 serverIdentifier];
            *(_DWORD *)int buf = 67110146;
            int v207 = v24;
            __int16 v208 = 2082;
            v209 = v25;
            __int16 v210 = 2082;
            v211 = v26;
            __int16 v212 = 1024;
            int v213 = 2409;
            __int16 v214 = 2114;
            v215 = v27;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unknown server identifier:%{public}@", buf, 0x2Cu);
          }
          id v28 = objc_alloc((Class)NSError);
          int v15 = +[NSString stringWithUTF8String:"seld"];
          NSErrorUserInfoKey v204 = NSLocalizedDescriptionKey;
          CFStringRef v205 = @"Unknown server identifier";
          __int16 v29 = +[NSDictionary dictionaryWithObjects:&v205 forKeys:&v204 count:1];
          id v30 = [v28 initWithDomain:v15 code:5 userInfo:v29];

          uint64_t v9 = 5;
          id v189 = v30;
        }
      }
      __int16 v31 = [v7 sourceUrl];
      if (v31)
      {
        __int16 v32 = [v7 sourceUrl];
        int v33 = +[NSURL URLWithString:v32];

        if (v33)
        {
          __int16 v34 = objc_alloc_init(NFRemoteAdminSession);
          uint64_t v35 = (uint64_t)v34;
          if (v34) {
            v34->_delegate = (NFRemoteAdminSessionDelegate *)v8;
          }
          sub_1000376AC((uint64_t)v34, v7);
          sub_1000376BC(v35, v33);
          sub_100031994(v35, v188);
          NSErrorUserInfoKey v36 = *(void **)(a1 + 96);
          *(void *)(a1 + 96) = v35;
        }
      }
      objc_sync_exit(v8);

      if (*(void *)(a1 + 96))
      {
        sub_10001A874((uint64_t)v8);
        if (*(unsigned char *)(a1 + 155)) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = (uint64_t)[*(id *)(a1 + 96) run];
        }
        id v37 = v8;
        objc_sync_enter(v37);
        id v38 = *(void **)(a1 + 96);
        *(void *)(a1 + 96) = 0;

        objc_sync_exit(v37);
      }
      if (v9 != 3)
      {
        switch(v9)
        {
          case 0:
          case 11:
            if (byte_100060438)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              int v56 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v56)
              {
                __int16 v57 = object_getClass(v8);
                if (class_isMetaClass(v57)) {
                  uint64_t v58 = 43;
                }
                else {
                  uint64_t v58 = 45;
                }
                id v59 = object_getClassName(v8);
                uint64_t v60 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v56(6, "%c[%{public}s %{public}s]:%i [TSM] Success", v58, v59, v60, 2514);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v61 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v62 = object_getClass(v8);
                if (class_isMetaClass(v62)) {
                  int v63 = 43;
                }
                else {
                  int v63 = 45;
                }
                id v64 = object_getClassName(v8);
                uint64_t v65 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)int buf = 67109890;
                int v207 = v63;
                __int16 v208 = 2082;
                v209 = v64;
                __int16 v210 = 2082;
                v211 = v65;
                __int16 v212 = 1024;
                int v213 = 2514;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Success", buf, 0x22u);
              }
            }
            sub_100031388(v7);
            [v7 save];
            if (v9 != 11) {
              goto LABEL_68;
            }
            id v173 = objc_alloc((Class)NSError);
            v174 = +[NSString stringWithUTF8String:"seld"];
            NSErrorUserInfoKey v194 = NSLocalizedDescriptionKey;
            CFStringRef v195 = @"Need to proceed with redirect";
            uint64_t v175 = +[NSDictionary dictionaryWithObjects:&v195 forKeys:&v194 count:1];
            id v176 = [v173 initWithDomain:v174 code:11 userInfo:v175];

            break;
          case 1:
            if (byte_100060438)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v77)
              {
                long long v78 = object_getClass(v8);
                if (class_isMetaClass(v78)) {
                  uint64_t v79 = 43;
                }
                else {
                  uint64_t v79 = 45;
                }
                id v80 = object_getClassName(v8);
                id v81 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v77(6, "%c[%{public}s %{public}s]:%i [TSM] Aborted", v79, v80, v81, 2446);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v82 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v83 = object_getClass(v8);
                if (class_isMetaClass(v83)) {
                  int v84 = 43;
                }
                else {
                  int v84 = 45;
                }
                uint64_t v85 = object_getClassName(v8);
                id v86 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)int buf = 67109890;
                int v207 = v84;
                __int16 v208 = 2082;
                v209 = v85;
                __int16 v210 = 2082;
                v211 = v86;
                __int16 v212 = 1024;
                int v213 = 2446;
                _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Aborted", buf, 0x22u);
              }
            }
            [v7 save];
            id v87 = objc_alloc((Class)NSError);
            id v88 = +[NSString stringWithUTF8String:"seld"];
            NSErrorUserInfoKey v202 = NSLocalizedDescriptionKey;
            CFStringRef v203 = @"Aborted";
            char v89 = +[NSDictionary dictionaryWithObjects:&v203 forKeys:&v202 count:1];
            id v176 = [v87 initWithDomain:v88 code:1 userInfo:v89];

            goto LABEL_126;
          case 2:
            if (byte_100060438)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v100 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v100)
              {
                dispatch_semaphore_t v101 = object_getClass(v8);
                if (class_isMetaClass(v101)) {
                  uint64_t v102 = 43;
                }
                else {
                  uint64_t v102 = 45;
                }
                uint64_t v103 = object_getClassName(v8);
                uint64_t v104 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v100(6, "%c[%{public}s %{public}s]:%i [TSM] Network unavailable", v102, v103, v104, 2452);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v105 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v106 = object_getClass(v8);
                if (class_isMetaClass(v106)) {
                  int v107 = 43;
                }
                else {
                  int v107 = 45;
                }
                v108 = object_getClassName(v8);
                id v109 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)int buf = 67109890;
                int v207 = v107;
                __int16 v208 = 2082;
                v209 = v108;
                __int16 v210 = 2082;
                v211 = v109;
                __int16 v212 = 1024;
                int v213 = 2452;
                _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Network unavailable", buf, 0x22u);
              }
            }
            [v7 setPendingImmediateRetry:1];
            [v7 save];
            id v110 = objc_alloc((Class)NSError);
            v111 = +[NSString stringWithUTF8String:"seld"];
            NSErrorUserInfoKey v200 = NSLocalizedDescriptionKey;
            CFStringRef v201 = @"Network unavailable.";
            uint64_t v112 = +[NSDictionary dictionaryWithObjects:&v201 forKeys:&v200 count:1];
            id v176 = [v110 initWithDomain:v111 code:2 userInfo:v112];

            goto LABEL_126;
          case 4:
            if (a3) {
              goto LABEL_68;
            }
            goto LABEL_141;
          case 5:
            if (byte_100060438)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              long long v90 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v90)
              {
                long long v91 = object_getClass(v8);
                if (class_isMetaClass(v91)) {
                  uint64_t v92 = 43;
                }
                else {
                  uint64_t v92 = 45;
                }
                long long v93 = object_getClassName(v8);
                long long v94 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v90(6, "%c[%{public}s %{public}s]:%i [TSM] Invalid remote admin state", v92, v93, v94, 2440);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              long long v95 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                long long v96 = object_getClass(v8);
                if (class_isMetaClass(v96)) {
                  int v97 = 43;
                }
                else {
                  int v97 = 45;
                }
                uint64_t v98 = object_getClassName(v8);
                uint64_t v99 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)int buf = 67109890;
                int v207 = v97;
                __int16 v208 = 2082;
                v209 = v98;
                __int16 v210 = 2082;
                v211 = v99;
                __int16 v212 = 1024;
                int v213 = 2440;
                _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Invalid remote admin state", buf, 0x22u);
              }
            }
            sub_100031388(v7);
            [v7 save];
            goto LABEL_177;
          case 14:
            goto LABEL_129;
          default:
            v113 = +[NSAssertionHandler currentHandler];
            [v113 handleFailureInMethod:@"_connectToServer:oneTimeConnection:secureElementManagerSession:" object:v8 file:@"_NFRemoteAdminManager.m" lineNumber:2525 description:@"Unknown result: %lu"

            id v114 = objc_alloc((Class)NSError);
            id v115 = +[NSString stringWithUTF8String:"seld"];
            NSErrorUserInfoKey v192 = NSLocalizedDescriptionKey;
            CFStringRef v193 = @"Unexpected result.";
            int v116 = +[NSDictionary dictionaryWithObjects:&v193 forKeys:&v192 count:1];
            id v117 = [v114 initWithDomain:v115 code:v9 userInfo:v116];

            sub_100031388(v7);
            [v7 save];
            goto LABEL_176;
        }
        goto LABEL_126;
      }
      if ((a3 & 1) == 0) {
        break;
      }
LABEL_68:
      if ((unint64_t)(v9 - 3) > 1 || (a3 & 1) == 0) {
        goto LABEL_177;
      }
      if (v187 == 3)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v160 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v160)
        {
          __int16 v161 = object_getClass(v8);
          if (class_isMetaClass(v161)) {
            uint64_t v162 = 43;
          }
          else {
            uint64_t v162 = 45;
          }
          __int16 v163 = object_getClassName(v8);
          id v164 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          v160(3, "%c[%{public}s %{public}s]:%i Out of short retry attempts", v162, v163, v164, 2540);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        long long v165 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
        {
          long long v166 = object_getClass(v8);
          if (class_isMetaClass(v166)) {
            int v167 = 43;
          }
          else {
            int v167 = 45;
          }
          long long v168 = object_getClassName(v8);
          v169 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)int buf = 67109890;
          int v207 = v167;
          __int16 v208 = 2082;
          v209 = v168;
          __int16 v210 = 2082;
          v211 = v169;
          __int16 v212 = 1024;
          int v213 = 2540;
          _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Out of short retry attempts", buf, 0x22u);
        }

        id v170 = objc_alloc((Class)NSError);
        v171 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v190 = NSLocalizedDescriptionKey;
        CFStringRef v191 = @"Short retry attempts failed";
        v172 = +[NSDictionary dictionaryWithObjects:&v191 forKeys:&v190 count:1];
        id v176 = [v170 initWithDomain:v171 code:3 userInfo:v172];

LABEL_126:
        id v189 = v176;
        goto LABEL_177;
      }
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v66 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v66)
        {
          int v67 = object_getClass(v8);
          if (class_isMetaClass(v67)) {
            uint64_t v68 = 43;
          }
          else {
            uint64_t v68 = 45;
          }
          int v69 = object_getClassName(v8);
          long long v70 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          v66(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", v68, v69, v70, 2536, dword_100045128[v187]);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v71 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v72 = object_getClass(v8);
          if (class_isMetaClass(v72)) {
            int v73 = 43;
          }
          else {
            int v73 = 45;
          }
          v74 = object_getClassName(v8);
          BOOL v75 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          unsigned int v76 = dword_100045128[v187];
          *(_DWORD *)int buf = 67110146;
          int v207 = v73;
          __int16 v208 = 2082;
          v209 = v74;
          __int16 v210 = 2082;
          v211 = v75;
          __int16 v212 = 1024;
          int v213 = 2536;
          __int16 v214 = 1024;
          LODWORD(v215) = v76;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", buf, 0x28u);
        }
      }
      sleep(dword_100045128[v187++]);
      objc_sync_enter(v8);
      a3 = 1;
      if (*(void *)(a1 + 96)) {
        goto LABEL_191;
      }
    }
    int v39 = [v7 retryInterval];
    __int16 v40 = v39;
    if (v39)
    {
      if (v39[1] >= 3uLL) {
        break;
      }
    }
    if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v41)
      {
        __int16 v42 = object_getClass(v8);
        if (class_isMetaClass(v42)) {
          uint64_t v43 = 43;
        }
        else {
          uint64_t v43 = 45;
        }
        __int16 v44 = object_getClassName(v8);
        int v45 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
        if (v40) {
          uint64_t v46 = v40[1];
        }
        else {
          uint64_t v46 = 0;
        }
        v41(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", v43, v44, v45, 2465, dword_100045128[v46]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      NSErrorUserInfoKey v47 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v48 = object_getClass(v8);
        if (class_isMetaClass(v48)) {
          int v49 = 43;
        }
        else {
          int v49 = 45;
        }
        uint64_t v50 = object_getClassName(v8);
        __int16 v51 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
        if (v40) {
          uint64_t v52 = v40[1];
        }
        else {
          uint64_t v52 = 0;
        }
        unsigned int v53 = dword_100045128[v52];
        *(_DWORD *)int buf = 67110146;
        int v207 = v49;
        __int16 v208 = 2082;
        v209 = v50;
        __int16 v210 = 2082;
        v211 = v51;
        __int16 v212 = 1024;
        int v213 = 2465;
        __int16 v214 = 1024;
        LODWORD(v215) = v53;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", buf, 0x28u);
      }
    }
    if (v40)
    {
      uint64_t v54 = v40[1];
      v40[1] = v54 + 1;
      sleep(dword_100045128[v54]);
      objc_setProperty_nonatomic_copy(v40, v55, 0, 16);
    }
    else
    {
      sleep(2u);
    }
    [v7 updateNextRetryInterval:v40];

    objc_sync_enter(v8);
    a3 = 0;
    uint64_t v9 = 3;
    if (*(void *)(a1 + 96)) {
      goto LABEL_191;
    }
  }

LABEL_129:
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v118 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v118)
    {
      int v119 = object_getClass(v8);
      if (class_isMetaClass(v119)) {
        uint64_t v120 = 43;
      }
      else {
        uint64_t v120 = 45;
      }
      uint64_t v121 = object_getClassName(v8);
      __int16 v122 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      v118(6, "%c[%{public}s %{public}s]:%i [TSM] SE is unavailable", v120, v121, v122, 2476);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v123 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v124 = object_getClass(v8);
      if (class_isMetaClass(v124)) {
        int v125 = 43;
      }
      else {
        int v125 = 45;
      }
      __int16 v126 = object_getClassName(v8);
      id v127 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      *(_DWORD *)int buf = 67109890;
      int v207 = v125;
      __int16 v208 = 2082;
      v209 = v126;
      __int16 v210 = 2082;
      v211 = v127;
      __int16 v212 = 1024;
      int v213 = 2476;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] SE is unavailable", buf, 0x22u);
    }
  }
LABEL_141:
  [v7 setPendingImmediateRetry:0];
  uint64_t v128 = [v7 retryInterval];
  uint64_t v130 = (void *)v128;
  if (v128)
  {
    unint64_t v131 = *(void *)(v128 + 8);
    if (v131)
    {
      if (v131 > 0x1B)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v132 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v132)
        {
          id v133 = object_getClass(v8);
          if (class_isMetaClass(v133)) {
            uint64_t v134 = 43;
          }
          else {
            uint64_t v134 = 45;
          }
          v135 = object_getClassName(v8);
          id v136 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          v132(3, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", v134, v135, v136, 2499);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v137 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
        {
          id v138 = object_getClass(v8);
          if (class_isMetaClass(v138)) {
            int v139 = 43;
          }
          else {
            int v139 = 45;
          }
          v140 = object_getClassName(v8);
          v141 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)int buf = 67109890;
          int v207 = v139;
          __int16 v208 = 2082;
          v209 = v140;
          __int16 v210 = 2082;
          v211 = v141;
          __int16 v212 = 1024;
          int v213 = 2499;
          _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", buf, 0x22u);
        }

        sub_100031388(v7);
        goto LABEL_172;
      }
    }
    else
    {
      unint64_t v131 = 3;
      *(void *)(v128 + 8) = 3;
    }
    *(void *)(v128 + 8) = v131 + 1;
  }
  else
  {
    unint64_t v131 = 0;
  }
  LODWORD(v129) = dword_100045128[v131];
  double v142 = (double)v129;
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v143 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v143)
    {
      id v144 = object_getClass(v8);
      if (class_isMetaClass(v144)) {
        uint64_t v145 = 43;
      }
      else {
        uint64_t v145 = 45;
      }
      id v146 = object_getClassName(v8);
      v147 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      v143(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d minute(s)", v145, v146, v147, 2495, (int)(v142 / 60.0));
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v148 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
    {
      v149 = object_getClass(v8);
      if (class_isMetaClass(v149)) {
        int v150 = 43;
      }
      else {
        int v150 = 45;
      }
      v151 = object_getClassName(v8);
      int v152 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      *(_DWORD *)int buf = 67110146;
      int v207 = v150;
      __int16 v208 = 2082;
      v209 = v151;
      __int16 v210 = 2082;
      v211 = v152;
      __int16 v212 = 1024;
      int v213 = 2495;
      __int16 v214 = 1024;
      LODWORD(v215) = (int)(v142 / 60.0);
      _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d minute(s)", buf, 0x28u);
    }
  }
  v154 = +[NSDate dateWithTimeIntervalSinceNow:v142];
  if (v130) {
    objc_setProperty_nonatomic_copy(v130, v153, v154, 16);
  }

  [v7 updateNextRetryInterval:v130];
LABEL_172:
  [v7 save];
  id v155 = objc_alloc((Class)NSError);
  v156 = +[NSString stringWithUTF8String:"seld"];
  if (v9 == 14)
  {
    NSErrorUserInfoKey v198 = NSLocalizedDescriptionKey;
    CFStringRef v199 = @"SE is unavailable.";
    __int16 v157 = +[NSDictionary dictionaryWithObjects:&v199 forKeys:&v198 count:1];
    id v158 = [v155 initWithDomain:v156 code:14 userInfo:v157];
  }
  else
  {
    NSErrorUserInfoKey v196 = NSLocalizedDescriptionKey;
    CFStringRef v197 = @"Unable to connect.";
    __int16 v157 = +[NSDictionary dictionaryWithObjects:&v197 forKeys:&v196 count:1];
    id v158 = [v155 initWithDomain:v156 code:v9 userInfo:v157];
  }
  id v117 = v158;

LABEL_176:
  id v189 = v117;
LABEL_177:
  PLLogRegisteredEvent();

  return v189;
}

void sub_100030064(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id *sub_1000300E4(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v3 = v2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v3 < -300.0 || v4 < -300.0)
  {
    id v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v7 = +[NSThread callStackSymbols];
      int v8 = 136315650;
      uint64_t v9 = "-[_NFRemoteAdminManager _dispatchOnSessionQueue:]_block_invoke";
      __int16 v10 = 1024;
      BOOL v11 = v3 < -300.0;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s: beforeBlockExec=%d\n%@", (uint8_t *)&v8, 0x1Cu);
    }
  }
  sub_10001FDA4(*(void *)(a1 + 40));
  return sub_10001A57C(*(id **)(a1 + 40));
}

void sub_10003022C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 136))
    {
      *(unsigned char *)(v1 + 136) = 0;
      sub_10001A57C((id *)v1);
    }
    atomic_store(0, (unsigned __int8 *)(v1 + 154));
    if (*(unsigned char *)(v1 + 8))
    {
      double v2 = +[NFHardwareManager sharedHardwareManager];
      unsigned int v3 = [v2 areSessionsAllowed];

      if (v3)
      {
        if (!*(void *)(v1 + 216))
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            __int16 v10 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass((id)v1);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName((id)v1);
            Name = sel_getName("_startNextSession");
            uint64_t v14 = 45;
            if (isMetaClass) {
              uint64_t v14 = 43;
            }
            v10(5, "%c[%{public}s %{public}s]:%i Network is not available.  A session will not be started.", v14, ClassName, Name, 2241);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v15 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = object_getClass((id)v1);
            if (class_isMetaClass(v16)) {
              int v17 = 43;
            }
            else {
              int v17 = 45;
            }
            *(_DWORD *)int buf = 67109890;
            int v172 = v17;
            __int16 v173 = 2082;
            v174 = object_getClassName((id)v1);
            __int16 v175 = 2082;
            id v176 = sel_getName("_startNextSession");
            __int16 v177 = 1024;
            int v178 = 2241;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Network is not available.  A session will not be started.", buf, 0x22u);
          }
          goto LABEL_178;
        }
        double v4 = sub_10001F100((void *)v1);
        p_name = &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks.name;
        uint64_t v6 = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
        if (byte_100060400)
        {
          uint64_t v7 = 0;
          double v8 = 0.0;
          goto LABEL_125;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v18 = NFLogGetLogger();
        if (v18)
        {
          id v19 = (void (*)(uint64_t, const char *, ...))v18;
          uint64_t v20 = object_getClass((id)v1);
          BOOL v21 = class_isMetaClass(v20);
          id v22 = object_getClassName((id)v1);
          __int16 v157 = sel_getName("_startNextSession");
          uint64_t v23 = 45;
          if (v21) {
            uint64_t v23 = 43;
          }
          v19(6, "%c[%{public}s %{public}s]:%i Perform OS update system check", v23, v22, v157, 2257);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v24 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v25 = object_getClass((id)v1);
          if (class_isMetaClass(v25)) {
            int v26 = 43;
          }
          else {
            int v26 = 45;
          }
          *(_DWORD *)int buf = 67109890;
          int v172 = v26;
          __int16 v173 = 2082;
          v174 = object_getClassName((id)v1);
          __int16 v175 = 2082;
          id v176 = sel_getName("_startNextSession");
          __int16 v177 = 1024;
          int v178 = 2257;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Perform OS update system check", buf, 0x22u);
        }

        __int16 v27 = +[NFHardwareManager sharedHardwareManager];
        [v27 refreshSecureElementsWithError:0];

        id v28 = sub_100037740();
        __int16 v29 = sub_10003B038(v28);

        if (!v29)
        {
          uint64_t v7 = 0;
          double v8 = 0.0;
LABEL_124:

LABEL_125:
          if (v4)
          {
            if (*((unsigned char *)v6 + 1080))
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v112 = NFLogGetLogger();
              if (v112)
              {
                v113 = (void (*)(uint64_t, const char *, ...))v112;
                id v114 = object_getClass((id)v1);
                BOOL v115 = class_isMetaClass(v114);
                id v155 = object_getClassName((id)v1);
                id v164 = sel_getName("_startNextSession");
                uint64_t v116 = 45;
                if (v115) {
                  uint64_t v116 = 43;
                }
                v113(6, "%c[%{public}s %{public}s]:%i [TSM] NextState=%@", v116, v155, v164, 2313, v4);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v117 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v118 = object_getClass((id)v1);
                if (class_isMetaClass(v118)) {
                  int v119 = 43;
                }
                else {
                  int v119 = 45;
                }
                uint64_t v120 = object_getClassName((id)v1);
                uint64_t v121 = sel_getName("_startNextSession");
                *(_DWORD *)int buf = 67110146;
                int v172 = v119;
                __int16 v173 = 2082;
                v174 = v120;
                __int16 v175 = 2082;
                id v176 = v121;
                __int16 v177 = 1024;
                int v178 = 2313;
                __int16 v179 = 2112;
                double v180 = *(double *)&v4;
                _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] NextState=%@", buf, 0x2Cu);
              }
            }
            if ([v4 pendingImmediateRetry]) {
              goto LABEL_151;
            }
            uint64_t v122 = [v4 retryInterval];
            int v123 = (void *)v122;
            __int16 v124 = v122 ? *(void **)(v122 + 16) : 0;
            id v125 = v124;
            [v125 timeIntervalSinceNow];
            double v127 = v126;

            if (v127 <= 0.0)
            {
LABEL_151:
              [v4 refreshRetryInterval];
              sub_10001F588((void *)v1, (uint64_t)"com.apple.seld.processing", 120.0);
              int v15 = sub_100023F34((void *)v1, v4, v7, 0, 0);
              sub_10001D70C((void *)v1, (uint64_t)"com.apple.seld.processing");
              if (v15)
              {
                if ([v15 code] == (id)2)
                {
                  *(unsigned char *)(v1 + 136) = 1;
                  sub_100019D10(v1);
                }
                if (v7)
                {
                  sub_10001D70C((void *)v1, (uint64_t)"com.apple.seld.osupdate");
                  *((unsigned char *)p_name + 1024) = 0;
                  double v139 = 86400.0;
                  if (v8 != 0.0) {
                    double v139 = v8;
                  }
                  sub_10001F588((void *)v1, (uint64_t)"com.apple.seld.osupdate", v139);
                  *((unsigned char *)p_name + 1024) = 1;
                }
                if ([v15 code] == (id)1
                  || [v15 code] == (id)2
                  || [v15 code] == (id)5)
                {
                  goto LABEL_177;
                }
              }
              else if (v7)
              {
                sub_10001D70C((void *)v1, (uint64_t)"com.apple.seld.osupdate");
                *((unsigned char *)p_name + 1024) = 0;
              }
              sub_10001A0A0(v1);
LABEL_177:

LABEL_178:
              return;
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v128 = NFLogGetLogger();
            if (v128)
            {
              unint64_t v129 = (void (*)(uint64_t, const char *, ...))v128;
              uint64_t v130 = object_getClass((id)v1);
              BOOL v131 = class_isMetaClass(v130);
              v132 = object_getClassName((id)v1);
              long long v165 = sel_getName("_startNextSession");
              uint64_t v133 = 45;
              if (v131) {
                uint64_t v133 = 43;
              }
              v129(6, "%c[%{public}s %{public}s]:%i Handling internal retry delay of %f seconds", v133, v132, v165, 2320, *(void *)&v127);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v134 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
            {
              v135 = object_getClass((id)v1);
              if (class_isMetaClass(v135)) {
                int v136 = 43;
              }
              else {
                int v136 = 45;
              }
              uint64_t v137 = object_getClassName((id)v1);
              id v138 = sel_getName("_startNextSession");
              *(_DWORD *)int buf = 67110146;
              int v172 = v136;
              __int16 v173 = 2082;
              v174 = v137;
              __int16 v175 = 2082;
              id v176 = v138;
              __int16 v177 = 1024;
              int v178 = 2320;
              __int16 v179 = 2048;
              double v180 = v127;
              _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Handling internal retry delay of %f seconds", buf, 0x2Cu);
            }

            sub_10001FA6C((void *)v1, v4);
          }
          else if (*((unsigned char *)v6 + 1080))
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v140 = NFLogGetLogger();
            if (v140)
            {
              v141 = (void (*)(uint64_t, const char *, ...))v140;
              double v142 = object_getClass((id)v1);
              BOOL v143 = class_isMetaClass(v142);
              id v144 = object_getClassName((id)v1);
              long long v166 = sel_getName("_startNextSession");
              uint64_t v145 = 45;
              if (v143) {
                uint64_t v145 = 43;
              }
              v141(6, "%c[%{public}s %{public}s]:%i [TSM] No remaining sessions.", v145, v144, v166, 2309);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v146 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
            {
              v147 = object_getClass((id)v1);
              if (class_isMetaClass(v147)) {
                int v148 = 43;
              }
              else {
                int v148 = 45;
              }
              v149 = object_getClassName((id)v1);
              int v150 = sel_getName("_startNextSession");
              *(_DWORD *)int buf = 67109890;
              int v172 = v148;
              __int16 v173 = 2082;
              v174 = v149;
              __int16 v175 = 2082;
              id v176 = v150;
              __int16 v177 = 1024;
              int v178 = 2309;
              _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] No remaining sessions.", buf, 0x22u);
            }
          }
          int v15 = 0;
          goto LABEL_177;
        }
        id v30 = sub_100037740();
        int v31 = sub_10003B4A8((uint64_t)v30);

        if (v31)
        {
          id v170 = 0;
          __int16 v32 = +[NFSecureElement embeddedSecureElementWithError:&v170];
          id v33 = v170;

          long long v168 = v33;
          if (v32)
          {
            int v34 = 1;
            goto LABEL_44;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v35 = NFLogGetLogger();
          if (v35)
          {
            NSErrorUserInfoKey v36 = (void (*)(uint64_t, const char *, ...))v35;
            id v37 = object_getClass((id)v1);
            BOOL v38 = class_isMetaClass(v37);
            v151 = object_getClassName((id)v1);
            id v158 = sel_getName("_startNextSession");
            uint64_t v39 = 45;
            if (v38) {
              uint64_t v39 = 43;
            }
            v36(4, "%c[%{public}s %{public}s]:%i SE not present but JCOP update info available - %{public}@", v39, v151, v158, 2265, v33);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v40 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = object_getClass((id)v1);
            if (class_isMetaClass(v41)) {
              int v42 = 43;
            }
            else {
              int v42 = 45;
            }
            uint64_t v43 = object_getClassName((id)v1);
            __int16 v44 = sel_getName("_startNextSession");
            *(_DWORD *)int buf = 67110146;
            int v172 = v42;
            __int16 v173 = 2082;
            v174 = v43;
            __int16 v175 = 2082;
            id v176 = v44;
            __int16 v177 = 1024;
            int v178 = 2265;
            __int16 v179 = 2114;
            double v180 = *(double *)&v33;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SE not present but JCOP update info available - %{public}@", buf, 0x2Cu);
          }
        }
        else
        {
          long long v168 = 0;
        }
        int v34 = 0;
LABEL_44:
        int v45 = sub_100037740();
        uint64_t v46 = sub_10003B7B0(v45);

        int v47 = *(unsigned __int8 *)(v1 + 9);
        int v48 = *(unsigned __int8 *)(v1 + 10);
        int v49 = +[NFSecureElement embeddedSecureElementWithError:0];
        uint64_t v50 = [v49 info];

        v169 = v50;
        if ([v50 migrationState] == (id)1)
        {
          if (v46) {
            char v51 = 1;
          }
          else {
            char v51 = v34;
          }
          uint64_t v6 = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
          if ((v51 & 1) != 0 || v48 | v47)
          {
LABEL_71:
            if (v34 && *((unsigned char *)v6 + 1080))
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v66 = NFLogGetLogger();
              if (v66)
              {
                int v67 = (void (*)(uint64_t, const char *, ...))v66;
                uint64_t v68 = object_getClass((id)v1);
                BOOL v69 = class_isMetaClass(v68);
                long long v70 = object_getClassName((id)v1);
                v160 = sel_getName("_startNextSession");
                BOOL v59 = !v69;
                uint64_t v6 = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
                uint64_t v71 = 45;
                if (!v59) {
                  uint64_t v71 = 43;
                }
                v67(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting SE version change to TSM", v71, v70, v160, 2286);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v72 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                int v73 = object_getClass((id)v1);
                if (class_isMetaClass(v73)) {
                  int v74 = 43;
                }
                else {
                  int v74 = 45;
                }
                BOOL v75 = object_getClassName((id)v1);
                unsigned int v76 = sel_getName("_startNextSession");
                *(_DWORD *)int buf = 67109890;
                int v172 = v74;
                __int16 v173 = 2082;
                v174 = v75;
                uint64_t v6 = &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks.name;
                __int16 v175 = 2082;
                id v176 = v76;
                __int16 v177 = 1024;
                int v178 = 2286;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting SE version change to TSM", buf, 0x22u);
              }
            }
            if (v46)
            {
              double v8 = 1800.0;
              p_name = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
              if (*((unsigned char *)v6 + 1080))
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v77 = NFLogGetLogger();
                if (v77)
                {
                  long long v78 = (void (*)(uint64_t, const char *, ...))v77;
                  uint64_t v79 = object_getClass((id)v1);
                  BOOL v80 = class_isMetaClass(v79);
                  id v81 = object_getClassName((id)v1);
                  __int16 v161 = sel_getName("_startNextSession");
                  uint64_t v82 = 45;
                  if (v80) {
                    uint64_t v82 = 43;
                  }
                  int v152 = v81;
                  uint64_t v6 = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
                  v78(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting APN token change to TSM", v82, v152, v161, 2289);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                __int16 v83 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                {
                  int v84 = object_getClass((id)v1);
                  if (class_isMetaClass(v84)) {
                    int v85 = 43;
                  }
                  else {
                    int v85 = 45;
                  }
                  id v86 = object_getClassName((id)v1);
                  id v87 = sel_getName("_startNextSession");
                  *(_DWORD *)int buf = 67109890;
                  int v172 = v85;
                  uint64_t v6 = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
                  __int16 v173 = 2082;
                  v174 = v86;
                  __int16 v175 = 2082;
                  id v176 = v87;
                  __int16 v177 = 1024;
                  int v178 = 2289;
                  _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting APN token change to TSM", buf, 0x22u);
                }
              }
            }
            else
            {
              double v8 = 0.0;
              p_name = &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks.name;
            }
            if (v47)
            {
              if (*((unsigned char *)v6 + 1080))
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v88 = NFLogGetLogger();
                if (v88)
                {
                  char v89 = (void (*)(uint64_t, const char *, ...))v88;
                  long long v90 = object_getClass((id)v1);
                  BOOL v91 = class_isMetaClass(v90);
                  uint64_t v92 = object_getClassName((id)v1);
                  uint64_t v162 = sel_getName("_startNextSession");
                  uint64_t v93 = 45;
                  if (v91) {
                    uint64_t v93 = 43;
                  }
                  id v153 = v92;
                  uint64_t v6 = &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks.name;
                  v89(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting restricted mode to TSM", v93, v153, v162, 2293);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                long long v94 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  long long v95 = object_getClass((id)v1);
                  if (class_isMetaClass(v95)) {
                    int v96 = 43;
                  }
                  else {
                    int v96 = 45;
                  }
                  int v97 = object_getClassName((id)v1);
                  uint64_t v98 = sel_getName("_startNextSession");
                  *(_DWORD *)int buf = 67109890;
                  int v172 = v96;
                  __int16 v173 = 2082;
                  v174 = v97;
                  __int16 v175 = 2082;
                  id v176 = v98;
                  __int16 v177 = 1024;
                  int v178 = 2293;
                  _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting restricted mode to TSM", buf, 0x22u);
                }
              }
              *(unsigned char *)(v1 + 9) = 0;
            }
            if (v48)
            {
              if (*((unsigned char *)v6 + 1080))
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v99 = NFLogGetLogger();
                if (v99)
                {
                  v100 = (void (*)(uint64_t, const char *, ...))v99;
                  dispatch_semaphore_t v101 = object_getClass((id)v1);
                  BOOL v102 = class_isMetaClass(v101);
                  uint64_t v103 = object_getClassName((id)v1);
                  __int16 v163 = sel_getName("_startNextSession");
                  uint64_t v104 = 45;
                  if (v102) {
                    uint64_t v104 = 43;
                  }
                  v154 = v103;
                  uint64_t v6 = &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks.name;
                  v100(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting performance mode to TSM", v104, v154, v163, 2297);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                id v105 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v106 = object_getClass((id)v1);
                  if (class_isMetaClass(v106)) {
                    int v107 = 43;
                  }
                  else {
                    int v107 = 45;
                  }
                  v108 = object_getClassName((id)v1);
                  id v109 = sel_getName("_startNextSession");
                  *(_DWORD *)int buf = 67109890;
                  int v172 = v107;
                  __int16 v173 = 2082;
                  v174 = v108;
                  __int16 v175 = 2082;
                  id v176 = v109;
                  __int16 v177 = 1024;
                  int v178 = 2297;
                  _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting performance mode to TSM", buf, 0x22u);
                }
              }
              *(unsigned char *)(v1 + 10) = 0;
            }
            id v110 = sub_100037740();
            v111 = sub_10003BD48(v110, v29);

            uint64_t v7 = 1;
            [v111 setPendingImmediateRetry:1];
            double v4 = v111;
            goto LABEL_123;
          }
        }
        else
        {
          id v52 = [v50 migrationState];
          if (v46) {
            char v53 = 1;
          }
          else {
            char v53 = v34;
          }
          uint64_t v6 = &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks.name;
          if (v48 || (v53 & 1) != 0 || v47 || v52)
          {
            if (v52 && byte_100060438)
            {
              int v167 = v48;
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v54 = NFLogGetLogger();
              if (v54)
              {
                SEL v55 = (void (*)(uint64_t, const char *, ...))v54;
                int v56 = object_getClass((id)v1);
                BOOL v57 = class_isMetaClass(v56);
                uint64_t v58 = object_getClassName((id)v1);
                __int16 v159 = sel_getName("_startNextSession");
                BOOL v59 = !v57;
                uint64_t v6 = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
                uint64_t v60 = 45;
                if (!v59) {
                  uint64_t v60 = 43;
                }
                v55(6, "%c[%{public}s %{public}s]:%i [TSM] Reaching out to TSM when eSE migation state is not IDLE", v60, v58, v159, 2283);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v61 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v62 = object_getClass((id)v1);
                if (class_isMetaClass(v62)) {
                  int v63 = 43;
                }
                else {
                  int v63 = 45;
                }
                id v64 = object_getClassName((id)v1);
                uint64_t v65 = sel_getName("_startNextSession");
                *(_DWORD *)int buf = 67109890;
                int v172 = v63;
                __int16 v173 = 2082;
                v174 = v64;
                uint64_t v6 = &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks.name;
                __int16 v175 = 2082;
                id v176 = v65;
                __int16 v177 = 1024;
                int v178 = 2283;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reaching out to TSM when eSE migation state is not IDLE", buf, 0x22u);
              }

              int v48 = v167;
            }
            goto LABEL_71;
          }
        }
        uint64_t v7 = 0;
        double v8 = 0.0;
        p_name = (char **)(&OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks + 8);
LABEL_123:

        goto LABEL_124;
      }
    }
  }
}

void sub_100031388(void *a1)
{
  id v1 = a1;
  [v1 setPendingImmediateRetry:0];
  [v1 clearRetryInterval];
  [v1 setSourceUrl:0];
  [v1 setInitialClientRequestInfo:0];
}

void sub_100031504(const char *a1, void *a2)
{
  size_t v4 = strlen(a1);
  id v5 = [a2 description];
  size_t v6 = (size_t)[v5 length];
  if ([v5 length])
  {
    unint64_t v7 = 0;
    size_t v8 = 951 - v4;
    do
    {
      if (v6 > v8)
      {
        uint64_t v9 = +[NSCharacterSet newlineCharacterSet];
        __int16 v10 = (char *)[v5 rangeOfCharacterFromSet:v9 options:4 range:v7, v8];

        if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          size_t v6 = 951 - v4;
        }
        else
        {
          size_t v6 = (size_t)&v10[-v7];
          if (!v6)
          {
            ++v7;
            size_t v6 = 950 - v4;
          }
        }
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        __int16 v12 = (void (*)(uint64_t, const char *, ...))Logger;
        [v5 substringWithRange:v7, v6];
        id v13 = objc_claimAutoreleasedReturnValue();
        v12(6, "%s:%i %s %s", "NFLogLargeTSMDescription", 67, a1, (const char *)[v13 UTF8String]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        [v5 substringWithRange:v7, v6];
        id v15 = objc_claimAutoreleasedReturnValue();
        id v16 = [v15 UTF8String];
        *(_DWORD *)int buf = 136446978;
        uint64_t v18 = "NFLogLargeTSMDescription";
        __int16 v19 = 1024;
        int v20 = 67;
        __int16 v21 = 2080;
        id v22 = a1;
        __int16 v23 = 2080;
        id v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s %s", buf, 0x26u);
      }
      v7 += v6;
      size_t v6 = (size_t)[v5 length] - v7;
    }
    while (v7 < (unint64_t)[v5 length]);
  }
}

void sub_10003196C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031994(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 24) = v4 == 0;
    id v5 = v4;
    objc_storeStrong((id *)(a1 + 16), a2);
    id v4 = v5;
  }
}

void sub_10003697C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_sync_exit(v29);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000369D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000369E0(uint64_t a1)
{
}

void sub_1000369E8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_sync_enter(v8);
  if (v7 || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (v7 && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(Class)) {
          uint64_t v11 = 43;
        }
        else {
          uint64_t v11 = 45;
        }
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 64));
        Logger(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 601, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        int v17 = object_getClassName(*(id *)(a1 + 32));
        uint64_t v18 = sel_getName(*(SEL *)(a1 + 64));
        *(_DWORD *)int buf = 67110146;
        int v20 = v16;
        __int16 v21 = 2082;
        id v22 = v17;
        __int16 v23 = 2082;
        id v24 = v18;
        __int16 v25 = 1024;
        int v26 = 601;
        __int16 v27 = 2114;
        id v28 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  }
  objc_sync_exit(v8);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100036BF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037668(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000376AC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

void sub_1000376BC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

id sub_100037740()
{
  self;
  if (qword_100060420 != -1) {
    dispatch_once(&qword_100060420, &stru_100059010);
  }
  v0 = (void *)qword_100060418;

  return v0;
}

void sub_100037798(id a1)
{
  qword_100060418 = objc_opt_new();

  _objc_release_x1();
}

void sub_100038B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,SEL sel,id a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int buf,int a44,__int16 a45,int a46,__int16 a47,__int16 a48,__int16 a49,int a50,int a51,__int16 a52,__int16 a53,__int16 a54,__int16 a55)
{
}

void sub_100038F58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      Class v32 = object_getClass(v5);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v8(4, "%c[%{public}s %{public}s]:%i Invalid key: %{public}@", v13, ClassName, Name, 83, v32);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    id v15 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    int v17 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v18 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)int buf = 67110146;
    int v35 = v16;
    __int16 v36 = 2082;
    id v37 = v17;
    __int16 v38 = 2082;
    uint64_t v39 = v18;
    __int16 v40 = 1024;
    int v41 = 83;
    __int16 v42 = 2114;
    Class v43 = object_getClass(v5);
    __int16 v19 = v43;
    int v20 = "%c[%{public}s %{public}s]:%i Invalid key: %{public}@";
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      id v22 = (void (*)(uint64_t, const char *, ...))v21;
      __int16 v23 = object_getClass(*(id *)(a1 + 32));
      BOOL v24 = class_isMetaClass(v23);
      __int16 v25 = object_getClassName(*(id *)(a1 + 32));
      int v26 = sel_getName(*(SEL *)(a1 + 40));
      Class v33 = object_getClass(v6);
      uint64_t v27 = 45;
      if (v24) {
        uint64_t v27 = 43;
      }
      v22(4, "%c[%{public}s %{public}s]:%i Invalid admin state: %{public}@", v27, v25, v26, 85, v33);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    id v28 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v28)) {
      int v29 = 43;
    }
    else {
      int v29 = 45;
    }
    id v30 = object_getClassName(*(id *)(a1 + 32));
    int v31 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)int buf = 67110146;
    int v35 = v29;
    __int16 v36 = 2082;
    id v37 = v30;
    __int16 v38 = 2082;
    uint64_t v39 = v31;
    __int16 v40 = 1024;
    int v41 = 85;
    __int16 v42 = 2114;
    Class v43 = object_getClass(v6);
    __int16 v19 = v43;
    int v20 = "%c[%{public}s %{public}s]:%i Invalid admin state: %{public}@";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v20, buf, 0x2Cu);

LABEL_23:
    goto LABEL_24;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v6 forKey:v5];
LABEL_24:
}

void sub_1000392B0(id *a1)
{
  id v37 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v2 = [a1[3] allKeys];
  id v3 = [v2 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v39;
    do
    {
      for (int i = 0; i != v4; int i = (char *)i + 1)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [a1[3] NF_objectForKey:v7 expectedClass:objc_opt_class()];
          uint64_t v9 = [v8 sourceUrl];
          if (v9)
          {
          }
          else
          {
            id v22 = [v8 serverIdentifier];
            __int16 v23 = sub_100039E8C(a1, v22);

            if (!v23) {
              [v37 addObject:v7];
            }
          }
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(a1);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName("_fixupAdminStates");
            uint64_t v36 = objc_opt_class();
            uint64_t v16 = 45;
            if (isMetaClass) {
              uint64_t v16 = 43;
            }
            v11(3, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", v16, ClassName, Name, 177, v36);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v8 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v17 = object_getClass(a1);
            if (class_isMetaClass(v17)) {
              int v18 = 43;
            }
            else {
              int v18 = 45;
            }
            __int16 v19 = object_getClassName(a1);
            int v20 = sel_getName("_fixupAdminStates");
            uint64_t v21 = objc_opt_class();
            *(_DWORD *)int buf = 67110146;
            int v43 = v18;
            __int16 v44 = 2082;
            int v45 = v19;
            __int16 v46 = 2082;
            int v47 = v20;
            __int16 v48 = 1024;
            int v49 = 177;
            __int16 v50 = 2114;
            uint64_t v51 = v21;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", buf, 0x2Cu);
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v4);
  }

  if ([v37 count])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      __int16 v25 = (void (*)(uint64_t, const char *, ...))v24;
      int v26 = object_getClass(a1);
      BOOL v27 = class_isMetaClass(v26);
      int v34 = object_getClassName(a1);
      int v35 = sel_getName("_fixupAdminStates");
      uint64_t v28 = 45;
      if (v27) {
        uint64_t v28 = 43;
      }
      v25(5, "%c[%{public}s %{public}s]:%i Removing ghost admin states: %{public}@", v28, v34, v35, 189, v37);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v29 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = object_getClass(a1);
      if (class_isMetaClass(v30)) {
        int v31 = 43;
      }
      else {
        int v31 = 45;
      }
      Class v32 = object_getClassName(a1);
      Class v33 = sel_getName("_fixupAdminStates");
      *(_DWORD *)int buf = 67110146;
      int v43 = v31;
      __int16 v44 = 2082;
      int v45 = v32;
      __int16 v46 = 2082;
      int v47 = v33;
      __int16 v48 = 1024;
      int v49 = 189;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v37;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing ghost admin states: %{public}@", buf, 0x2Cu);
    }

    [a1[3] removeObjectsForKeys:v37];
    sub_100039BDC(a1);
  }
}

void sub_10003970C(id *a1)
{
  long long v38 = sub_100039B5C(a1);
  if (!v38)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v28 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("_updateAdminStatesURL");
      uint64_t v32 = 45;
      if (isMetaClass) {
        uint64_t v32 = 43;
      }
      v28(4, "%c[%{public}s %{public}s]:%i Empty registration info", v32, ClassName, Name, 142);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    double v2 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      Class v33 = object_getClass(a1);
      if (class_isMetaClass(v33)) {
        int v34 = 43;
      }
      else {
        int v34 = 45;
      }
      *(_DWORD *)int buf = 67109890;
      int v44 = v34;
      __int16 v45 = 2082;
      __int16 v46 = object_getClassName(a1);
      __int16 v47 = 2082;
      __int16 v48 = sel_getName("_updateAdminStatesURL");
      __int16 v49 = 1024;
      int v50 = 142;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Empty registration info", buf, 0x22u);
    }
    goto LABEL_38;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v2 = [a1[3] allValues];
  id v3 = [v2 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (!v3)
  {
LABEL_38:

    goto LABEL_39;
  }
  id v4 = v3;
  char v37 = 0;
  uint64_t v5 = *(void *)v40;
  do
  {
    for (int i = 0; i != v4; int i = (char *)i + 1)
    {
      if (*(void *)v40 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 serverIdentifier];
        uint64_t v9 = [v38 NF_stringForKey:v8];

        __int16 v10 = [v7 sourceUrl];
        uint64_t v11 = v10;
        if (v10) {
          BOOL v12 = v9 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
        }
        else
        {
          __int16 v25 = [v7 sourceUrl];
          id v26 = [v9 compare:v25];

          if (v26)
          {
            [v7 setSourceUrl:v9];
            char v37 = 1;
          }
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v13 = NFLogGetLogger();
        if (v13)
        {
          uint64_t v14 = (void (*)(uint64_t, const char *, ...))v13;
          id v15 = object_getClass(a1);
          BOOL v16 = class_isMetaClass(v15);
          int v17 = object_getClassName(a1);
          int v18 = sel_getName("_updateAdminStatesURL");
          uint64_t v36 = objc_opt_class();
          uint64_t v19 = 45;
          if (v16) {
            uint64_t v19 = 43;
          }
          v14(3, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", v19, v17, v18, 152, v36);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v9 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v20 = object_getClass(a1);
          if (class_isMetaClass(v20)) {
            int v21 = 43;
          }
          else {
            int v21 = 45;
          }
          id v22 = object_getClassName(a1);
          __int16 v23 = sel_getName("_updateAdminStatesURL");
          uint64_t v24 = objc_opt_class();
          *(_DWORD *)int buf = 67110146;
          int v44 = v21;
          __int16 v45 = 2082;
          __int16 v46 = v22;
          __int16 v47 = 2082;
          __int16 v48 = v23;
          __int16 v49 = 1024;
          int v50 = 152;
          __int16 v51 = 2114;
          uint64_t v52 = v24;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", buf, 0x2Cu);
        }
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v39 objects:v53 count:16];
  }
  while (v4);

  if (v37) {
    sub_100039BDC(a1);
  }
LABEL_39:
}

id sub_100039B5C(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    double v2 = [v1[1] dictionaryForKey:@"RegistrationInfo"];
    objc_sync_exit(v1);
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

void sub_100039BC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100039BDC(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    double v2 = +[NSKeyedArchiver archivedDataWithRootObject:v1[3] requiringSecureCoding:1 error:0];
    if (v2)
    {
      [v1[1] setObject:v2 forKey:@"ServerStates"];
      [v1[1] synchronize];
    }

    objc_sync_exit(v1);
  }
}

void sub_100039CAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, SEL sel, int buf, int a16, long long a17, int a18, int a19, long long a20)
{
  sela = v21;
  if (a2)
  {
    if (a2 == 2)
    {
      id v22 = objc_begin_catch(exception_object);
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v20);
        class_isMetaClass(Class);
        object_getClassName(v20);
        sel_getName(sela);
        int v31 = [v22 description];
        Logger(3, "%c[%{public}s %{public}s]:%i archive failed:%{public}@");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = object_getClass(v20);
        if (class_isMetaClass(v26)) {
          int v27 = 43;
        }
        else {
          int v27 = 45;
        }
        ClassName = object_getClassName(v20);
        Name = sel_getName(sela);
        id v30 = [v22 description];
        int buf = 67110146;
        a16 = v27;
        LOWORD(a17) = 2082;
        *(void *)((char *)&a17 + 2) = ClassName;
        WORD5(a17) = 2082;
        *(void *)((char *)&a17 + 12) = Name;
        LOWORD(a19) = 1024;
        *(int *)((char *)&a19 + 2) = 553;
        WORD1(a20) = 2114;
        *(void *)((char *)&a20 + 4) = v30;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i archive failed:%{public}@", (uint8_t *)&buf, 0x2Cu);
      }
      objc_end_catch();
      JUMPOUT(0x100039C64);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id sub_100039E8C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100039B5C(a1);
  uint64_t v5 = [v4 NF_stringForKey:v3];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("serverURLStringForIdentifier:");
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i No URL for %{public}@", v11, ClassName, Name, 368, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)int buf = 67110146;
      int v19 = v14;
      __int16 v20 = 2082;
      int v21 = object_getClassName(a1);
      __int16 v22 = 2082;
      __int16 v23 = sel_getName("serverURLStringForIdentifier:");
      __int16 v24 = 1024;
      int v25 = 368;
      __int16 v26 = 2114;
      id v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No URL for %{public}@", buf, 0x2Cu);
    }
  }

  return v5;
}

void sub_10003A07C(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    double v2 = +[NSKeyedArchiver archivedDataWithRootObject:v1[4] requiringSecureCoding:1 error:0];
    if (v2)
    {
      [v1[1] setObject:v2 forKey:@"RedirectStates"];
      [v1[1] synchronize];
    }

    objc_sync_exit(v1);
  }
}

void sub_10003A14C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, SEL sel, int buf, int a16, long long a17, int a18, int a19, long long a20)
{
  sela = v21;
  if (a2)
  {
    if (a2 == 2)
    {
      id v22 = objc_begin_catch(exception_object);
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v20);
        class_isMetaClass(Class);
        object_getClassName(v20);
        sel_getName(sela);
        int v31 = [v22 description];
        Logger(3, "%c[%{public}s %{public}s]:%i archive failed:%{public}@");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = object_getClass(v20);
        if (class_isMetaClass(v26)) {
          int v27 = 43;
        }
        else {
          int v27 = 45;
        }
        ClassName = object_getClassName(v20);
        Name = sel_getName(sela);
        id v30 = [v22 description];
        int buf = 67110146;
        a16 = v27;
        LOWORD(a17) = 2082;
        *(void *)((char *)&a17 + 2) = ClassName;
        WORD5(a17) = 2082;
        *(void *)((char *)&a17 + 12) = Name;
        LOWORD(a19) = 1024;
        *(int *)((char *)&a19 + 2) = 672;
        WORD1(a20) = 2114;
        *(void *)((char *)&a20 + 4) = v30;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i archive failed:%{public}@", (uint8_t *)&buf, 0x2Cu);
      }
      objc_end_catch();
      JUMPOUT(0x10003A104);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_10003A32C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

uint64_t sub_10003A384(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    uint64_t v38 = 0;
    goto LABEL_58;
  }
  uint64_t v7 = a1;
  objc_sync_enter(v7);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v7);
    if (class_isMetaClass(Class)) {
      uint64_t v10 = 43;
    }
    else {
      uint64_t v10 = 45;
    }
    ClassName = object_getClassName(v7);
    Name = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
    Logger(6, "%c[%{public}s %{public}s]:%i %{public}@ %{public}@", v10, ClassName, Name, 314, v5, v6);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(v7);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)int buf = 67110402;
    int v80 = v15;
    __int16 v81 = 2082;
    uint64_t v82 = object_getClassName(v7);
    __int16 v83 = 2082;
    int v84 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
    __int16 v85 = 1024;
    int v86 = 314;
    __int16 v87 = 2114;
    id v88 = v5;
    __int16 v89 = 2114;
    id v90 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ %{public}@", buf, 0x36u);
  }

  if (!v5)
  {
    [v7[1] removeObjectForKey:@"RegistrationInfo"];
    [v7[1] removeObjectForKey:@"PrimaryRegionTopic"];
    sub_1000392B0(v7);
    goto LABEL_44;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  BOOL v16 = [v5 allKeys];
  id v17 = [v16 countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (!v17)
  {

    goto LABEL_46;
  }
  int v18 = 0;
  uint64_t v19 = *(void *)v74;
  do
  {
    for (int i = 0; i != v17; int i = (char *)i + 1)
    {
      if (*(void *)v74 != v19) {
        objc_enumerationMutation(v16);
      }
      int v21 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v28)
        {
          int v29 = object_getClass(v7);
          if (class_isMetaClass(v29)) {
            uint64_t v30 = 43;
          }
          else {
            uint64_t v30 = 45;
          }
          int v31 = object_getClassName(v7);
          uint64_t v32 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          v28(3, "%c[%{public}s %{public}s]:%i Invalid type for info dictionary key", v30, v31, v32, 320);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Class v33 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          int v34 = object_getClass(v7);
          if (class_isMetaClass(v34)) {
            int v35 = 43;
          }
          else {
            int v35 = 45;
          }
          uint64_t v36 = object_getClassName(v7);
          char v37 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          *(_DWORD *)int buf = 67109890;
          int v80 = v35;
          __int16 v81 = 2082;
          uint64_t v82 = v36;
          __int16 v83 = 2082;
          int v84 = v37;
          __int16 v85 = 1024;
          int v86 = 320;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid type for info dictionary key", buf, 0x22u);
        }

        goto LABEL_56;
      }
      v18 |= [v21 isEqualToString:v6];
    }
    id v17 = [v16 countByEnumeratingWithState:&v73 objects:v78 count:16];
  }
  while (v17);

  if ((v18 & 1) == 0)
  {
LABEL_46:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v39 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v39)
    {
      long long v40 = object_getClass(v7);
      if (class_isMetaClass(v40)) {
        uint64_t v41 = 43;
      }
      else {
        uint64_t v41 = 45;
      }
      long long v42 = object_getClassName(v7);
      int v43 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
      v39(3, "%c[%{public}s %{public}s]:%i Registration info does not contain %{public}@", v41, v42, v43, 329, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v44 = object_getClass(v7);
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      __int16 v46 = object_getClassName(v7);
      __int16 v47 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
      *(_DWORD *)int buf = 67110146;
      int v80 = v45;
      __int16 v81 = 2082;
      uint64_t v82 = v46;
      __int16 v83 = 2082;
      int v84 = v47;
      __int16 v85 = 1024;
      int v86 = 329;
      __int16 v87 = 2114;
      id v88 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Registration info does not contain %{public}@", buf, 0x2Cu);
    }
LABEL_56:

    uint64_t v38 = 0;
    goto LABEL_57;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  BOOL v16 = [v5 allValues];
  id v22 = [v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (!v22) {
    goto LABEL_31;
  }
  uint64_t v23 = *(void *)v70;
  while (2)
  {
    uint64_t v24 = 0;
    while (2)
    {
      if (*(void *)v70 != v23) {
        objc_enumerationMutation(v16);
      }
      uint64_t v25 = *(void *)(*((void *)&v69 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v49)
        {
          int v50 = object_getClass(v7);
          if (class_isMetaClass(v50)) {
            uint64_t v51 = 43;
          }
          else {
            uint64_t v51 = 45;
          }
          uint64_t v52 = object_getClassName(v7);
          char v53 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          v49(3, "%c[%{public}s %{public}s]:%i Invalid type for info dictionary value", v51, v52, v53, 335);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v54 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          goto LABEL_80;
        }
        SEL v55 = object_getClass(v7);
        if (class_isMetaClass(v55)) {
          int v56 = 43;
        }
        else {
          int v56 = 45;
        }
        BOOL v57 = object_getClassName(v7);
        uint64_t v58 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
        *(_DWORD *)int buf = 67109890;
        int v80 = v56;
        __int16 v81 = 2082;
        uint64_t v82 = v57;
        __int16 v83 = 2082;
        int v84 = v58;
        __int16 v85 = 1024;
        int v86 = 335;
        BOOL v59 = "%c[%{public}s %{public}s]:%i Invalid type for info dictionary value";
        goto LABEL_79;
      }
      __int16 v26 = +[NSURL URLWithString:v25];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v60)
        {
          id v61 = object_getClass(v7);
          if (class_isMetaClass(v61)) {
            uint64_t v62 = 43;
          }
          else {
            uint64_t v62 = 45;
          }
          int v63 = object_getClassName(v7);
          id v64 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          v60(3, "%c[%{public}s %{public}s]:%i Invalid URL value", v62, v63, v64, 339);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v54 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          goto LABEL_80;
        }
        uint64_t v65 = object_getClass(v7);
        if (class_isMetaClass(v65)) {
          int v66 = 43;
        }
        else {
          int v66 = 45;
        }
        int v67 = object_getClassName(v7);
        uint64_t v68 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
        *(_DWORD *)int buf = 67109890;
        int v80 = v66;
        __int16 v81 = 2082;
        uint64_t v82 = v67;
        __int16 v83 = 2082;
        int v84 = v68;
        __int16 v85 = 1024;
        int v86 = 339;
        BOOL v59 = "%c[%{public}s %{public}s]:%i Invalid URL value";
LABEL_79:
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v59, buf, 0x22u);
LABEL_80:

        goto LABEL_56;
      }
      if (v22 != (id)++v24) {
        continue;
      }
      break;
    }
    id v22 = [v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_31:

  [v7[1] setObject:v5 forKey:@"RegistrationInfo"];
  [v7[1] setObject:v6 forKey:@"PrimaryRegionTopic"];
  sub_10003970C(v7);
LABEL_44:
  [v7[1] synchronize];
  uint64_t v38 = 1;
LABEL_57:
  objc_sync_exit(v7);

LABEL_58:
  return v38;
}

void sub_10003AC04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003AC74(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      Class v35 = object_getClass(v7);
      uint64_t v29 = 45;
      if (isMetaClass) {
        uint64_t v29 = 43;
      }
      v24(4, "%c[%{public}s %{public}s]:%i Invalid AID type: %{public}@", v29, ClassName, Name, 268, v35);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    uint64_t v30 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    uint64_t v32 = object_getClassName(*(id *)(a1 + 32));
    Class v33 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)int buf = 67110146;
    int v37 = v31;
    __int16 v38 = 2082;
    long long v39 = v32;
    __int16 v40 = 2082;
    uint64_t v41 = v33;
    __int16 v42 = 1024;
    int v43 = 268;
    __int16 v44 = 2114;
    Class v45 = object_getClass(v7);
    int v21 = v45;
    id v22 = "%c[%{public}s %{public}s]:%i Invalid AID type: %{public}@";
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v9 = NFLogGetLogger();
    if (v9)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))v9;
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      BOOL v12 = class_isMetaClass(v11);
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      int v14 = sel_getName(*(SEL *)(a1 + 48));
      Class v34 = object_getClass(v8);
      uint64_t v15 = 45;
      if (v12) {
        uint64_t v15 = 43;
      }
      v10(4, "%c[%{public}s %{public}s]:%i Invalid Topic type: %{public}@", v15, v13, v14, 272, v34);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    id v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    uint64_t v19 = object_getClassName(*(id *)(a1 + 32));
    __int16 v20 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)int buf = 67110146;
    int v37 = v18;
    __int16 v38 = 2082;
    long long v39 = v19;
    __int16 v40 = 2082;
    uint64_t v41 = v20;
    __int16 v42 = 1024;
    int v43 = 272;
    __int16 v44 = 2114;
    Class v45 = object_getClass(v8);
    int v21 = v45;
    id v22 = "%c[%{public}s %{public}s]:%i Invalid Topic type: %{public}@";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v22, buf, 0x2Cu);

LABEL_22:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

id sub_10003AFD0(void *a1, void *a2)
{
  if (a1)
  {
    double v2 = sub_100039E8C(a1, a2);
    id v3 = +[NSURL URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_10003B038(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    double v2 = [v1[1] stringForKey:@"PrimaryRegionTopic"];
    objc_sync_exit(v1);
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

void sub_10003B0A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10003B0B8(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    id v5 = [v4[2] objectForKey:v3];
    objc_sync_exit(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_10003B138(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003B14C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v6)
    {
      id v8 = a1;
      objc_sync_enter(v8);
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class)) {
          uint64_t v11 = 43;
        }
        else {
          uint64_t v11 = 45;
        }
        ClassName = object_getClassName(v8);
        Name = sel_getName("setServerIdentifier:forAppletID:");
        Logger(6, "%c[%{public}s %{public}s]:%i %{public}@ = %{public}@", v11, ClassName, Name, 399, v5, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = object_getClass(v8);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)int buf = 67110402;
        int v28 = v16;
        __int16 v29 = 2082;
        uint64_t v30 = object_getClassName(v8);
        __int16 v31 = 2082;
        uint64_t v32 = sel_getName("setServerIdentifier:forAppletID:");
        __int16 v33 = 1024;
        int v34 = 399;
        __int16 v35 = 2114;
        id v36 = v5;
        __int16 v37 = 2114;
        __int16 v38 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ = %{public}@", buf, 0x36u);
      }

      Class isa = v8[2].isa;
      if (v5) {
        [(objc_class *)isa setObject:v5 forKey:v7];
      }
      else {
        [(objc_class *)isa removeObjectForKey:v7];
      }
      [(objc_class *)v8[1].isa setObject:v8[2].isa forKey:@"ServersForApplets"];
      [(objc_class *)v8[1].isa synchronize];
      objc_sync_exit(v8);
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v18 = NFLogGetLogger();
      if (v18)
      {
        uint64_t v19 = (void (*)(uint64_t, const char *, ...))v18;
        __int16 v20 = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(v20);
        uint64_t v25 = object_getClassName(a1);
        __int16 v26 = sel_getName("setServerIdentifier:forAppletID:");
        uint64_t v22 = 45;
        if (isMetaClass) {
          uint64_t v22 = 43;
        }
        v19(3, "%c[%{public}s %{public}s]:%i Invalid ID, %{public}@", v22, v25, v26, 394, 0);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = object_getClass(a1);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        *(_DWORD *)int buf = 67110146;
        int v28 = v24;
        __int16 v29 = 2082;
        uint64_t v30 = object_getClassName(a1);
        __int16 v31 = 2082;
        uint64_t v32 = sel_getName("setServerIdentifier:forAppletID:");
        __int16 v33 = 1024;
        int v34 = 394;
        __int16 v35 = 2114;
        id v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid ID, %{public}@", buf, 0x2Cu);
      }
    }
  }
}

void sub_10003B480(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10003B4A8(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    double v2 = +[NFSecureElement embeddedSecureElementWithError:0];
    id v3 = [v2 info];

    if (v3)
    {
      id v4 = [v3 sequenceCounter];
      uint64_t v1 = [v4 unsignedIntegerValue] != *(id *)(v1 + 48);
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

void sub_10003B534(void *a1, char a2)
{
  if (a1 && (a2 & 1) == 0)
  {
    id v3 = +[NFSecureElement embeddedSecureElementWithError:0];
    id v4 = [v3 info];

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("setHasJCOPUpdated:");
      uint64_t v11 = a1[6];
      BOOL v12 = [v4 sequenceCounter];
      id v24 = [v12 unsignedIntValue];
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i Update counter changed %d => %d", v13, ClassName, Name, 429, v11, v24);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = object_getClass(a1);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(a1);
      uint64_t v18 = sel_getName("setHasJCOPUpdated:");
      uint64_t v19 = a1[6];
      __int16 v20 = [v4 sequenceCounter];
      *(_DWORD *)int buf = 67110402;
      int v26 = v16;
      __int16 v27 = 2082;
      int v28 = v17;
      __int16 v29 = 2082;
      uint64_t v30 = v18;
      __int16 v31 = 1024;
      int v32 = 429;
      __int16 v33 = 1024;
      int v34 = v19;
      __int16 v35 = 1024;
      unsigned int v36 = [v20 unsignedIntValue];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Update counter changed %d => %d", buf, 0x2Eu);
    }
    int v21 = +[NSUserDefaults standardUserDefaults];
    uint64_t v22 = [v4 sequenceCounter];
    [v21 setInteger:objc_msgSend(v22, "unsignedIntegerValue") forKey:@"SecureElementSequenceCounter"];

    uint64_t v23 = [v4 sequenceCounter];
    a1[6] = [v23 unsignedIntegerValue];
  }
}

id sub_10003B7B0(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    id v2 = v1[5];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_10003B810(void *a1, void *a2)
{
  id v6 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    id v4 = [v6 copy];
    id v5 = (void *)v3[5];
    v3[5] = v4;

    objc_sync_exit(v3);
  }
}

void sub_10003B884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10003B898(void *a1)
{
  uint64_t v1 = a1;
  objc_sync_enter(v1);
  id v2 = [v1[1] dictionaryForKey:@"APNConnectionRequestManual"];
  objc_sync_exit(v1);

  return v2;
}

void sub_10003B8F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003B90C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    id v4 = a1;
    objc_sync_enter(v4);
    id v5 = v4[1];
    if (v7)
    {
      id v6 = [v5 objectForKey:@"APNConnectionRequestManual"];

      if (!v6) {
        [v4[1] setObject:v7 forKey:@"APNConnectionRequestManual"];
      }
    }
    else
    {
      [v5 removeObjectForKey:@"APNConnectionRequestManual"];
    }
    [v4[1] synchronize];
    objc_sync_exit(v4);

    id v3 = v7;
  }
}

void sub_10003B9C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003B9D4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = a1;
    objc_sync_enter(v7);
    if (v6)
    {
      id v8 = sub_10003BD48(v7, v6);
      uint64_t v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 APNConnectionRequesterFirst];

        if (v10) {
          [v9 setAPNConnectionRequesterLatest:v5];
        }
        else {
          [v9 setAPNConnectionRequesterFirst:v5];
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v7);
          if (class_isMetaClass(Class)) {
            uint64_t v20 = 43;
          }
          else {
            uint64_t v20 = 45;
          }
          ClassName = object_getClassName(v7);
          Name = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
          Logger(4, "%c[%{public}s %{public}s]:%i No state for topic %{public}@", v20, ClassName, Name, 501, v6);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v23 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = object_getClass(v7);
          if (class_isMetaClass(v24)) {
            int v25 = 43;
          }
          else {
            int v25 = 45;
          }
          *(_DWORD *)int buf = 67110146;
          int v27 = v25;
          __int16 v28 = 2082;
          __int16 v29 = object_getClassName(v7);
          __int16 v30 = 2082;
          __int16 v31 = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
          __int16 v32 = 1024;
          int v33 = 501;
          __int16 v34 = 2114;
          id v35 = v6;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No state for topic %{public}@", buf, 0x2Cu);
        }

        uint64_t v9 = 0;
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v11)
      {
        BOOL v12 = object_getClass(v7);
        if (class_isMetaClass(v12)) {
          uint64_t v13 = 43;
        }
        else {
          uint64_t v13 = 45;
        }
        int v14 = object_getClassName(v7);
        uint64_t v15 = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
        v11(6, "%c[%{public}s %{public}s]:%i No identifier", v13, v14, v15, 489);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = object_getClass(v7);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        *(_DWORD *)int buf = 67109890;
        int v27 = v17;
        __int16 v28 = 2082;
        __int16 v29 = object_getClassName(v7);
        __int16 v30 = 2082;
        __int16 v31 = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
        __int16 v32 = 1024;
        int v33 = 489;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No identifier", buf, 0x22u);
      }
    }

    objc_sync_exit(v7);
  }
}

void sub_10003BD14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NFRemoteAdminState *sub_10003BD48(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      int v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:"serverStateForIdentifier:", a1, @"NFRemoteAdminStorage.m", 533, @"Invalid parameter not satisfying: %@", @"theIdentifier != nil" object file lineNumber description];
    }
    id v5 = a1;
    objc_sync_enter(v5);
    [v5[3] NF_objectForKey:v4 expectedClass:objc_opt_class()];
    id v6 = (NFRemoteAdminState *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v5);
        if (class_isMetaClass(Class)) {
          uint64_t v9 = 43;
        }
        else {
          uint64_t v9 = 45;
        }
        ClassName = object_getClassName(v5);
        Name = sel_getName("serverStateForIdentifier:");
        Logger(6, "%c[%{public}s %{public}s]:%i Init state for %{public}@", v9, ClassName, Name, 538, v4);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = object_getClass(v5);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        *(_DWORD *)int buf = 67110146;
        int v18 = v14;
        __int16 v19 = 2082;
        uint64_t v20 = object_getClassName(v5);
        __int16 v21 = 2082;
        uint64_t v22 = sel_getName("serverStateForIdentifier:");
        __int16 v23 = 1024;
        int v24 = 538;
        __int16 v25 = 2114;
        int v26 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Init state for %{public}@", buf, 0x2Cu);
      }

      id v6 = [[NFRemoteAdminState alloc] initWithIdentifier:v4 sourceURL:0 retryDate:0];
      [v5[3] setObject:v6 forKey:v4];
    }
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_10003BFC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003BFF0(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v1);
      if (class_isMetaClass(Class)) {
        uint64_t v4 = 43;
      }
      else {
        uint64_t v4 = 45;
      }
      ClassName = object_getClassName(v1);
      Name = sel_getName("resetAPNConnectionRequest");
      Logger(6, "%c[%{public}s %{public}s]:%i Resetting all APN connection states", v4, ClassName, Name, 509);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = object_getClass(v1);
      if (class_isMetaClass(v8)) {
        int v9 = 43;
      }
      else {
        int v9 = 45;
      }
      *(_DWORD *)int buf = 67109890;
      int v32 = v9;
      __int16 v33 = 2082;
      __int16 v34 = object_getClassName(v1);
      __int16 v35 = 2082;
      unsigned int v36 = sel_getName("resetAPNConnectionRequest");
      __int16 v37 = 1024;
      int v38 = 509;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting all APN connection states", buf, 0x22u);
    }

    sub_10003B90C(v1, 0);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v1[3] allValues];
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        for (int i = 0; i != v11; int i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v10);
          }
          int v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v14 setAPNConnectionRequesterFirst:0];
            [v14 setAPNConnectionRequesterLatest:0];
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v15)
            {
              int v16 = object_getClass(v1);
              if (class_isMetaClass(v16)) {
                uint64_t v17 = 43;
              }
              else {
                uint64_t v17 = 45;
              }
              int v18 = object_getClassName(v1);
              __int16 v19 = sel_getName("resetAPNConnectionRequest");
              uint64_t v20 = objc_opt_class();
              v15(4, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", v17, v18, v19, 515, v20);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            __int16 v21 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = object_getClass(v1);
              if (class_isMetaClass(v22)) {
                int v23 = 43;
              }
              else {
                int v23 = 45;
              }
              int v24 = object_getClassName(v1);
              __int16 v25 = sel_getName("resetAPNConnectionRequest");
              uint64_t v26 = objc_opt_class();
              *(_DWORD *)int buf = 67110146;
              int v32 = v23;
              __int16 v33 = 2082;
              __int16 v34 = v24;
              __int16 v35 = 2082;
              unsigned int v36 = v25;
              __int16 v37 = 1024;
              int v38 = 515;
              __int16 v39 = 2114;
              uint64_t v40 = v26;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", buf, 0x2Cu);
            }
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v11);
    }

    objc_sync_exit(v1);
  }
}

void sub_10003C3C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10003C400(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    id v2 = [v1[3] allValues];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_10003C464(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10003C478(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v119 = a3;
  __int16 v124 = a1;
  if (a1)
  {
    id v6 = &CC_SHA256_ptr;
    id v7 = objc_opt_new();
    if ([v5 length])
    {
      id v8 = sub_10003BD48(a1, v5);
    }
    else
    {
      id v8 = 0;
    }
    int v9 = [v8 unsentScriptResponse];

    if (v9)
    {
      uint64_t v10 = [v8 unsentScriptResponse];
      [v7 addEntriesFromDictionary:v10];
    }
    else if (v119)
    {
      id obj = [v119 stateInformation];
      if (![obj count])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          __int16 v44 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v124);
          __int16 v46 = v8;
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v124);
          Name = sel_getName("nextRequestForServer:session:");
          BOOL v49 = !isMetaClass;
          id v8 = v46;
          uint64_t v50 = 45;
          if (!v49) {
            uint64_t v50 = 43;
          }
          v44(3, "%c[%{public}s %{public}s]:%i Failed to get state info", v50, ClassName, Name, 581);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v51 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = object_getClass(v124);
          if (class_isMetaClass(v52)) {
            int v53 = 43;
          }
          else {
            int v53 = 45;
          }
          *(_DWORD *)int buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v53;
          *(_WORD *)id v138 = 2082;
          *(void *)&v138[2] = object_getClassName(v124);
          __int16 v139 = 2082;
          uint64_t v140 = sel_getName("nextRequestForServer:session:");
          __int16 v141 = 1024;
          int v142 = 581;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get state info", buf, 0x22u);
        }

        id v36 = 0;
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v116 = v8;
      int v38 = +[NFSecureElement embeddedSecureElementWithError:0];
      __int16 v39 = [v38 info];

      v113 = v7;
      id v114 = v5;
      if (v39
        && ([v39 sequenceCounter],
            uint64_t v40 = objc_claimAutoreleasedReturnValue(),
            id v41 = [v40 unsignedIntegerValue],
            id v42 = v124[6],
            v40,
            v41 != v42))
      {
        v146[0] = @"osUpdateInfo";
        id v54 = objc_alloc((Class)NSString);
        SEL v55 = [v39 sequenceCounter];
        id v56 = [v54 initWithFormat:@"%04X", [v55 unsignedIntValue]];
        *(void *)int buf = v56;
        v146[1] = @"seAppletStateMap";
        id v57 = objc_alloc((Class)NSString);
        id v105 = [v39 appletMap];
        uint64_t v58 = v57;
        id v6 = &CC_SHA256_ptr;
        id v59 = [[v58 initWithFormat:@"%04X" v105];
        *(void *)id v138 = v59;
        uint64_t v121 = +[NSDictionary dictionaryWithObjects:buf forKeys:v146 count:2];
      }
      else
      {
        uint64_t v121 = 0;
      }

      uint64_t v60 = +[NSNumber numberWithInteger:2];
      v111 = +[NSMutableDictionary dictionaryWithObject:v60 forKey:@"kVersion"];

      __int16 v118 = objc_opt_new();
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id obja = obj;
      id v61 = [obja countByEnumeratingWithState:&v130 objects:v145 count:16];
      uint64_t v62 = v124;
      if (v61)
      {
        id v63 = v61;
        CFStringRef v64 = @"secureElementType";
        uint64_t v65 = *(void *)v131;
        uint64_t v117 = *(void *)v131;
        do
        {
          int v66 = 0;
          id v120 = v63;
          do
          {
            if (*(void *)v131 != v65) {
              objc_enumerationMutation(obja);
            }
            int v67 = *(void **)(*((void *)&v130 + 1) + 8 * (void)v66);
            uint64_t v68 = [v67 NF_stringForKey:v64];
            if ([v68 isEqualToString:@"JCOP"])
            {
              id v69 = [objc_alloc((Class)v6[180]) initWithDictionary:v67];
              long long v70 = v69;
              if (v121)
              {
                [v69 addEntriesFromDictionary:v121];
                long long v71 = [v70 NF_stringForKey:@"osUpdateInfo"];
                long long v72 = v71;
                if (v71)
                {
                  long long v73 = [v71 uppercaseString];
                  [v70 setObject:v73 forKeyedSubscript:@"osUpdateInfo"];
                }
              }
              CFStringRef v74 = v64;
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v75 = NFLogGetLogger();
              if (v75)
              {
                long long v76 = (void (*)(uint64_t, const char *, ...))v75;
                uint64_t v77 = object_getClass(v62);
                BOOL v78 = class_isMetaClass(v77);
                uint64_t v79 = object_getClassName(v62);
                v108 = sel_getName("nextRequestForServer:session:");
                uint64_t v80 = 45;
                if (v78) {
                  uint64_t v80 = 43;
                }
                v76(6, "%c[%{public}s %{public}s]:%i Calling into SES to get PT key information", v80, v79, v108, 610);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              __int16 v81 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v82 = object_getClass(v62);
                if (class_isMetaClass(v82)) {
                  int v83 = 43;
                }
                else {
                  int v83 = 45;
                }
                int v84 = object_getClassName(v124);
                __int16 v85 = sel_getName("nextRequestForServer:session:");
                *(_DWORD *)int buf = 67109890;
                *(_DWORD *)&uint8_t buf[4] = v83;
                uint64_t v62 = v124;
                *(_WORD *)id v138 = 2082;
                *(void *)&v138[2] = v84;
                __int16 v139 = 2082;
                uint64_t v140 = v85;
                __int16 v141 = 1024;
                int v142 = 610;
                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Calling into SES to get PT key information", buf, 0x22u);
              }

              int v86 = [v67 objectForKeyedSubscript:@"SEID"];
              uint64_t v129 = 0;
              __int16 v87 = SESEndPointTSMDictionary();
              id v88 = 0;

              if (v88 || !v87)
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v89 = NFLogGetLogger();
                if (v89)
                {
                  id v90 = (void (*)(uint64_t, const char *, ...))v89;
                  BOOL v91 = object_getClass(v62);
                  BOOL v92 = class_isMetaClass(v91);
                  uint64_t v106 = object_getClassName(v62);
                  id v109 = sel_getName("nextRequestForServer:session:");
                  uint64_t v93 = 45;
                  if (v92) {
                    uint64_t v93 = 43;
                  }
                  id v6 = &CC_SHA256_ptr;
                  v90(3, "%c[%{public}s %{public}s]:%i Failed to get PT Key Info from SESD? %{public}@", v93, v106, v109, 614, v88);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                long long v94 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                {
                  long long v95 = object_getClass(v62);
                  if (class_isMetaClass(v95)) {
                    int v96 = 43;
                  }
                  else {
                    int v96 = 45;
                  }
                  int v97 = object_getClassName(v124);
                  uint64_t v98 = sel_getName("nextRequestForServer:session:");
                  *(_DWORD *)int buf = 67110146;
                  *(_DWORD *)&uint8_t buf[4] = v96;
                  uint64_t v62 = v124;
                  *(_WORD *)id v138 = 2082;
                  *(void *)&v138[2] = v97;
                  __int16 v139 = 2082;
                  uint64_t v140 = v98;
                  __int16 v141 = 1024;
                  int v142 = 614;
                  __int16 v143 = 2114;
                  uint64_t v144 = (uint64_t)v88;
                  _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get PT Key Info from SESD? %{public}@", buf, 0x2Cu);
                }

                CFStringRef v64 = v74;
              }
              else
              {
                [v70 addEntriesFromDictionary:v87];
                CFStringRef v64 = v74;
              }
              [v118 addObject:v70];

              id v63 = v120;
              uint64_t v65 = v117;
            }

            int v66 = (char *)v66 + 1;
          }
          while (v63 != v66);
          id v63 = [obja countByEnumeratingWithState:&v130 objects:v145 count:16];
        }
        while (v63);
      }

      [v111 setObject:v118 forKey:@"SEStateInformation"];
      uint64_t v99 = sub_10003B7B0(v62);
      v100 = v99;
      if (v99)
      {
        dispatch_semaphore_t v101 = [v99 NF_asHexString];
        [v111 setObject:v101 forKey:@"APNTokenUpdateInfo"];
      }
      BOOL v102 = [v116 initialClientRequestInfo];
      id v103 = [v102 count];

      id v8 = v116;
      id v7 = v113;
      id v5 = v114;
      if (v103)
      {
        uint64_t v104 = [v116 initialClientRequestInfo];
        [v111 setObject:v104 forKey:@"ClientRequestInfo"];

        id v8 = v116;
        [v116 setInitialClientRequestInfo:0];
      }
      [v113 addEntriesFromDictionary:v111];
    }
    id obj = (id)objc_opt_new();
    if (obj)
    {
      BOOL v115 = v8;
      uint64_t v112 = v7;
      id v11 = sub_10003B898(v124);

      if (v11)
      {
        uint64_t v12 = sub_10003B898(v124);
        [obj addObject:v12];
      }
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      uint64_t v13 = [v124[3] allValues];
      id v14 = [v13 countByEnumeratingWithState:&v125 objects:v136 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v126;
        do
        {
          for (int i = 0; i != v15; int i = (char *)i + 1)
          {
            if (*(void *)v126 != v16) {
              objc_enumerationMutation(v13);
            }
            int v18 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v23 = NFLogGetLogger();
              if (v23)
              {
                int v24 = (void (*)(uint64_t, const char *, ...))v23;
                __int16 v25 = object_getClass(v124);
                BOOL v26 = class_isMetaClass(v25);
                long long v27 = object_getClassName(v124);
                long long v28 = sel_getName("nextRequestForServer:session:");
                uint64_t v110 = objc_opt_class();
                uint64_t v29 = 45;
                if (v26) {
                  uint64_t v29 = 43;
                }
                v24(4, "%c[%{public}s %{public}s]:%i Unexected state object, %{public}@", v29, v27, v28, 646, v110);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v22 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                long long v30 = object_getClass(v124);
                if (class_isMetaClass(v30)) {
                  int v31 = 43;
                }
                else {
                  int v31 = 45;
                }
                int v32 = object_getClassName(v124);
                __int16 v33 = sel_getName("nextRequestForServer:session:");
                uint64_t v34 = objc_opt_class();
                *(_DWORD *)int buf = 67110146;
                *(_DWORD *)&uint8_t buf[4] = v31;
                *(_WORD *)id v138 = 2082;
                *(void *)&v138[2] = v32;
                __int16 v139 = 2082;
                uint64_t v140 = v33;
                __int16 v141 = 1024;
                int v142 = 646;
                __int16 v143 = 2114;
                uint64_t v144 = v34;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexected state object, %{public}@", buf, 0x2Cu);
              }
              goto LABEL_29;
            }
            __int16 v19 = [v18 APNConnectionRequesterFirst];

            if (v19)
            {
              uint64_t v20 = [v18 APNConnectionRequesterFirst];
              [obj addObject:v20];
            }
            __int16 v21 = [v18 APNConnectionRequesterLatest];

            if (v21)
            {
              uint64_t v22 = [v18 APNConnectionRequesterLatest];
              [obj addObject:v22];
LABEL_29:

              continue;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v125 objects:v136 count:16];
        }
        while (v15);
      }

      CFStringRef v134 = @"APNState";
      id v135 = obj;
      __int16 v35 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
      id v7 = v112;
      [v112 addEntriesFromDictionary:v35];

      id v8 = v115;
    }
    id v36 = v7;
    goto LABEL_34;
  }
  id v36 = 0;
LABEL_35:

  return v36;
}

id sub_10003D0E0(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    id v2 = [objc_alloc((Class)NSArray) initWithArray:v1[4]];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_10003D14C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003D160(void *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    [v3[4] addObject:v4];
    objc_sync_exit(v3);

    sub_10003A07C(v3);
  }
}

void sub_10003D1D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003D1E8(void *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    [v3[4] removeObject:v4];
    objc_sync_exit(v3);

    sub_10003A07C(v3);
  }
}

void sub_10003D25C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10003D270(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v26 = v3;
  if (a1 && v3)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v4[4];
    id v5 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v28;
      do
      {
        for (int i = 0; i != v5; int i = (char *)i + 1)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v9 = [v8 taskId];
            unsigned __int8 v10 = [v26 isEqualToString:v9];

            if (v10)
            {
              id v23 = v8;
              goto LABEL_26;
            }
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (Logger)
            {
              Class = object_getClass(v4);
              if (class_isMetaClass(Class)) {
                uint64_t v13 = 43;
              }
              else {
                uint64_t v13 = 45;
              }
              ClassName = object_getClassName(v4);
              Name = sel_getName("redirectStateForTaskID:");
              uint64_t v16 = objc_opt_class();
              Logger(4, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", v13, ClassName, Name, 714, v16);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v17 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              int v18 = object_getClass(v4);
              if (class_isMetaClass(v18)) {
                int v19 = 43;
              }
              else {
                int v19 = 45;
              }
              uint64_t v20 = object_getClassName(v4);
              __int16 v21 = sel_getName("redirectStateForTaskID:");
              uint64_t v22 = objc_opt_class();
              *(_DWORD *)int buf = 67110146;
              int v32 = v19;
              __int16 v33 = 2082;
              uint64_t v34 = v20;
              __int16 v35 = 2082;
              id v36 = v21;
              __int16 v37 = 1024;
              int v38 = 714;
              __int16 v39 = 2114;
              uint64_t v40 = v22;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", buf, 0x2Cu);
            }
          }
        }
        id v5 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v5);
    }
    id v23 = 0;
LABEL_26:

    objc_sync_exit(v4);
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

void sub_10003D56C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10003D59C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v13 = +[NSAssertionHandler currentHandler];
      [v13 handleFailureInMethod:"redirectStateForIdentifier:", a1, @"NFRemoteAdminStorage.m", 728, @"Invalid parameter not satisfying: %@", @"theIdentifier != nil" object file lineNumber description];
    }
    id v5 = a1;
    objc_sync_enter(v5);
    uint64_t v6 = [v5[4] objectEnumerator];
    id v7 = 0;
    while (1)
    {
      id v8 = [v6 nextObject];

      if (!v8) {
        break;
      }
      int v9 = [v8 serverIdentifier];
      unsigned int v10 = [v9 isEqualToString:v4];

      id v7 = v8;
      if (v10)
      {
        id v11 = v8;
        break;
      }
    }

    objc_sync_exit(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_10003D6CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003D758(uint64_t a1)
{
  id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  [v3 setTimeoutIntervalForRequest:30.0];
  [v3 setTimeoutIntervalForResource:120.0];
  [v3 setHTTPCookieAcceptPolicy:0];
  [v3 setHTTPShouldSetCookies:1];
  [v3 setAllowsCellularAccess:1];
  [v3 setRequestCachePolicy:1];
  [v3 setWaitsForConnectivity:0];
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.seld.network", v4);

  if (!v5)
  {
    int v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"NFRemoteAdminConnectionHTTP.m" lineNumber:78 description:@"networkCallbackQueue is nil"];
  }
  uint64_t v6 = objc_opt_new();
  [v6 setUnderlyingQueue:v5];
  uint64_t v7 = +[NSURLSession sessionWithConfiguration:v3 delegate:*(void *)(a1 + 32) delegateQueue:v6];
  id v8 = (void *)qword_100060430;
  qword_100060430 = v7;
}

void sub_10003DBF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003E6E0(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,SEL sel,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  if (a2 == 1)
  {
    id v47 = objc_begin_catch(exc_buf);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(a30);
      class_isMetaClass(Class);
      object_getClassName(a30);
      sel_getName(sel);
      Logger(3, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v50 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = object_getClass(a30);
      if (class_isMetaClass(v51)) {
        int v52 = 43;
      }
      else {
        int v52 = 45;
      }
      ClassName = object_getClassName(a30);
      Name = sel_getName(sel);
      *(_DWORD *)(v45 - 224) = 67110146;
      *(_DWORD *)(v45 - 220) = v52;
      *(_WORD *)(v45 - 216) = 2082;
      uint64_t v55 = v45 - 224;
      *(void *)(v55 + 10) = ClassName;
      *(_WORD *)(v45 - 206) = 2082;
      *(void *)(v55 + 20) = Name;
      *(_WORD *)(v45 - 196) = 1024;
      *(_DWORD *)(v55 + 30) = 277;
      *(_WORD *)(v45 - 190) = 2114;
      *(void *)(v55 + 36) = v47;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@", (uint8_t *)(v45 - 224), 0x2Cu);
    }

    objc_end_catch();
    JUMPOUT(0x10003E49CLL);
  }
  _Block_object_dispose((const void *)(v45 - 176), 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 256), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_10003E8E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003E8F4(uint64_t a1)
{
}

void sub_10003E8FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v137 = a2;
  id v7 = a3;
  id v139 = a4;
  id v8 = v7;
  uint64_t v138 = (uint64_t)[v8 statusCode];
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(Class)) {
        uint64_t v12 = 43;
      }
      else {
        uint64_t v12 = 45;
      }
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 88));
      id v15 = [v8 allHeaderFields];
      v10(6, "%c[%{public}s %{public}s]:%i [TSM] Response Header: %@", v12, ClassName, Name, 315, v15);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      int v19 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v20 = sel_getName(*(SEL *)(a1 + 88));
      __int16 v21 = [v8 allHeaderFields];
      *(_DWORD *)int buf = 67110146;
      int v148 = v18;
      __int16 v149 = 2082;
      int v150 = v19;
      __int16 v151 = 2082;
      int v152 = v20;
      __int16 v153 = 1024;
      int v154 = 315;
      __int16 v155 = 2112;
      uint64_t v156 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Response Header: %@", buf, 0x2Cu);
    }
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v22 = [&off_10005B540 countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v142;
    do
    {
      for (int i = 0; i != v22; int i = (char *)i + 1)
      {
        if (*(void *)v142 != v23) {
          objc_enumerationMutation(&off_10005B540);
        }
        uint64_t v25 = *(void *)(*((void *)&v141 + 1) + 8 * i);
        BOOL v26 = [v8 allHeaderFields];
        long long v27 = [v26 valueForKey:v25];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v27 length]) {
          [*(id *)(a1 + 40) setObject:v27 forKey:v25];
        }
      }
      id v22 = [&off_10005B540 countByEnumeratingWithState:&v141 objects:v159 count:16];
    }
    while (v22);
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = mach_continuous_time();
  long long v28 = *(uint64_t **)(a1 + 96);
  if (v28) {
    *long long v28 = v138;
  }
  id v29 = [v139 copy];
  uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
  int v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  if (v139)
  {
    if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v32)
      {
        __int16 v33 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v33)) {
          uint64_t v34 = 43;
        }
        else {
          uint64_t v34 = 45;
        }
        __int16 v35 = object_getClassName(*(id *)(a1 + 32));
        id v36 = sel_getName(*(SEL *)(a1 + 88));
        __int16 v37 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) description];
        v32(6, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", v34, v35, v36, 336, v37);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v38 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v39 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v39)) {
          int v40 = 43;
        }
        else {
          int v40 = 45;
        }
        id v41 = object_getClassName(*(id *)(a1 + 32));
        id v42 = sel_getName(*(SEL *)(a1 + 88));
        int v43 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) description];
        *(_DWORD *)int buf = 67110146;
        int v148 = v40;
        __int16 v149 = 2082;
        int v150 = v41;
        __int16 v151 = 2082;
        int v152 = v42;
        __int16 v153 = 1024;
        int v154 = 336;
        __int16 v155 = 2112;
        uint64_t v156 = (uint64_t)v43;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", buf, 0x2Cu);
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v44)
    {
      uint64_t v45 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v45)) {
        uint64_t v46 = 43;
      }
      else {
        uint64_t v46 = 45;
      }
      id v47 = object_getClassName(*(id *)(a1 + 32));
      __int16 v48 = sel_getName(*(SEL *)(a1 + 88));
      BOOL v49 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v139 code]);
      uint64_t v50 = [v139 localizedDescription];
      v44(3, "%c[%{public}s %{public}s]:%i Client error: %{public}@ - %{public}@", v46, v47, v48, 337, v49, v50);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v51 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      int v52 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v52)) {
        int v53 = 43;
      }
      else {
        int v53 = 45;
      }
      id v54 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v55 = sel_getName(*(SEL *)(a1 + 88));
      id v56 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v139 code]);
      id v57 = [v139 localizedDescription];
      *(_DWORD *)int buf = 67110402;
      int v148 = v53;
      __int16 v149 = 2082;
      int v150 = v54;
      __int16 v151 = 2082;
      int v152 = v55;
      __int16 v153 = 1024;
      int v154 = 337;
      __int16 v155 = 2114;
      uint64_t v156 = (uint64_t)v56;
      __int16 v157 = 2114;
      id v158 = v57;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Client error: %{public}@ - %{public}@", buf, 0x36u);
    }
    if ([v139 code] == (id)-1009) {
      int v58 = 25;
    }
    else {
      int v58 = 17;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v58;
    goto LABEL_125;
  }
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v59 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v59)
    {
      uint64_t v60 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v60)) {
        uint64_t v61 = 43;
      }
      else {
        uint64_t v61 = 45;
      }
      uint64_t v62 = object_getClassName(*(id *)(a1 + 32));
      id v63 = sel_getName(*(SEL *)(a1 + 88));
      CFStringRef v64 = [v8 URL];
      uint64_t v65 = [v64 description];
      v59(6, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", v61, v62, v63, 349, v65);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v66 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      int v67 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v67)) {
        int v68 = 43;
      }
      else {
        int v68 = 45;
      }
      id v69 = object_getClassName(*(id *)(a1 + 32));
      long long v70 = sel_getName(*(SEL *)(a1 + 88));
      long long v71 = [v8 URL];
      long long v72 = [v71 description];
      *(_DWORD *)int buf = 67110146;
      int v148 = v68;
      __int16 v149 = 2082;
      int v150 = v69;
      __int16 v151 = 2082;
      int v152 = v70;
      __int16 v153 = 1024;
      int v154 = 349;
      __int16 v155 = 2112;
      uint64_t v156 = (uint64_t)v72;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", buf, 0x2Cu);
    }
  }
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v73 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v73)
    {
      CFStringRef v74 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v74)) {
        uint64_t v75 = 43;
      }
      else {
        uint64_t v75 = 45;
      }
      long long v76 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v77 = sel_getName(*(SEL *)(a1 + 88));
      v73(6, "%c[%{public}s %{public}s]:%i [TSM] Server response HTTP status: %ld", v75, v76, v77, 350, v138);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v78 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v79 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v79)) {
        int v80 = 43;
      }
      else {
        int v80 = 45;
      }
      __int16 v81 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v82 = sel_getName(*(SEL *)(a1 + 88));
      *(_DWORD *)int buf = 67110146;
      int v148 = v80;
      __int16 v149 = 2082;
      int v150 = v81;
      __int16 v151 = 2082;
      int v152 = v82;
      __int16 v153 = 1024;
      int v154 = 350;
      __int16 v155 = 2048;
      uint64_t v156 = v138;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Server response HTTP status: %ld", buf, 0x2Cu);
    }
  }
  if (v138 != 200)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v86 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v86)
    {
      __int16 v87 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v87)) {
        uint64_t v88 = 43;
      }
      else {
        uint64_t v88 = 45;
      }
      uint64_t v89 = object_getClassName(*(id *)(a1 + 32));
      id v90 = sel_getName(*(SEL *)(a1 + 88));
      BOOL v91 = +[NSNumber numberWithInteger:v138];
      v86(6, "%c[%{public}s %{public}s]:%i HTTP status: %{public}@", v88, v89, v90, 354, v91);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v92 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v93 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v93)) {
        int v94 = 43;
      }
      else {
        int v94 = 45;
      }
      long long v95 = object_getClassName(*(id *)(a1 + 32));
      int v96 = sel_getName(*(SEL *)(a1 + 88));
      int v97 = +[NSNumber numberWithInteger:v138];
      *(_DWORD *)int buf = 67110146;
      int v148 = v94;
      __int16 v149 = 2082;
      int v150 = v95;
      __int16 v151 = 2082;
      int v152 = v96;
      __int16 v153 = 1024;
      int v154 = 354;
      __int16 v155 = 2114;
      uint64_t v156 = (uint64_t)v97;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HTTP status: %{public}@", buf, 0x2Cu);
    }
    if (v138 <= 411)
    {
      int v98 = 0;
      if (v138 == 204 || v138 == 404) {
        goto LABEL_124;
      }
    }
    else
    {
      switch(v138)
      {
        case 503:
          int v98 = 19;
          goto LABEL_124;
        case 500:
          int v98 = 20;
          goto LABEL_124;
        case 412:
          int v98 = 3;
LABEL_124:
          *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v98;
LABEL_125:
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24));
          goto LABEL_126;
      }
    }
    int v98 = 18;
    goto LABEL_124;
  }
  int v83 = [v8 MIMEType];
  if ([v83 isEqualToString:@"application/json"])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    if ([v137 length])
    {
      id v140 = 0;
      int v84 = +[NSJSONSerialization JSONObjectWithData:v137 options:0 error:&v140];
      id v85 = v140;
      if (v84)
      {
        [*(id *)(a1 + 48) addEntriesFromDictionary:v84];
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v119 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v119)
        {
          id v120 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v120)) {
            uint64_t v121 = 43;
          }
          else {
            uint64_t v121 = 45;
          }
          uint64_t v122 = object_getClassName(*(id *)(a1 + 32));
          int v123 = sel_getName(*(SEL *)(a1 + 88));
          __int16 v124 = [v85 description];
          v119(3, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@", v121, v122, v123, 401, v124);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        long long v125 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          long long v126 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v126)) {
            int v127 = 43;
          }
          else {
            int v127 = 45;
          }
          long long v128 = object_getClassName(*(id *)(a1 + 32));
          uint64_t v129 = sel_getName(*(SEL *)(a1 + 88));
          long long v130 = [v85 description];
          *(_DWORD *)int buf = 67110146;
          int v148 = v127;
          __int16 v149 = 2082;
          int v150 = v128;
          __int16 v151 = 2082;
          int v152 = v129;
          __int16 v153 = 1024;
          int v154 = 401;
          __int16 v155 = 2114;
          uint64_t v156 = (uint64_t)v130;
          _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@", buf, 0x2Cu);
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 23;
        id v131 = objc_alloc((Class)NSError);
        long long v132 = +[NSString stringWithUTF8String:"seld"];
        NSErrorUserInfoKey v145 = NSLocalizedDescriptionKey;
        CFStringRef v146 = @"Decoding Error";
        long long v133 = +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
        id v134 = [v131 initWithDomain:v132 code:23 userInfo:v133];
        uint64_t v135 = *(void *)(*(void *)(a1 + 64) + 8);
        int v136 = *(void **)(v135 + 40);
        *(void *)(v135 + 40) = v134;
      }
    }
    else if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v109 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v109)
      {
        uint64_t v110 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v110)) {
          uint64_t v111 = 43;
        }
        else {
          uint64_t v111 = 45;
        }
        uint64_t v112 = object_getClassName(*(id *)(a1 + 32));
        v113 = sel_getName(*(SEL *)(a1 + 88));
        v109(6, "%c[%{public}s %{public}s]:%i [TSM] Received 0 bytes, empty body.", v111, v112, v113, 417);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v114 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v115 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v115)) {
          int v116 = 43;
        }
        else {
          int v116 = 45;
        }
        uint64_t v117 = object_getClassName(*(id *)(a1 + 32));
        __int16 v118 = sel_getName(*(SEL *)(a1 + 88));
        *(_DWORD *)int buf = 67109890;
        int v148 = v116;
        __int16 v149 = 2082;
        int v150 = v117;
        __int16 v151 = 2082;
        int v152 = v118;
        __int16 v153 = 1024;
        int v154 = 417;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Received 0 bytes, empty body.", buf, 0x22u);
      }
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v99 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v99)
    {
      v100 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v100)) {
        uint64_t v101 = 43;
      }
      else {
        uint64_t v101 = 45;
      }
      BOOL v102 = object_getClassName(*(id *)(a1 + 32));
      id v103 = sel_getName(*(SEL *)(a1 + 88));
      v99(3, "%c[%{public}s %{public}s]:%i Unexpected content type: %{public}@", v101, v102, v103, 387, v83);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v104 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      id v105 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v105)) {
        int v106 = 43;
      }
      else {
        int v106 = 45;
      }
      int v107 = object_getClassName(*(id *)(a1 + 32));
      v108 = sel_getName(*(SEL *)(a1 + 88));
      *(_DWORD *)int buf = 67110146;
      int v148 = v106;
      __int16 v149 = 2082;
      int v150 = v107;
      __int16 v151 = 2082;
      int v152 = v108;
      __int16 v153 = 1024;
      int v154 = 387;
      __int16 v155 = 2114;
      uint64_t v156 = (uint64_t)v83;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected content type: %{public}@", buf, 0x2Cu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 18;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24));

LABEL_126:
}

void sub_10003F9AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,NSErrorUserInfoKey a27,const __CFString *a28,uint64_t a29,uint64_t a30,int buf,int a32,long long a33,int a34,int a35,long long a36)
{
  if (a2 == 1)
  {
    id v37 = objc_begin_catch(exception_object);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(*(id *)(v36 + 32));
      class_isMetaClass(Class);
      object_getClassName(*(id *)(v36 + 32));
      sel_getName(*(SEL *)(v36 + 88));
      int v52 = [v37 description];
      Logger(3, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v40 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = object_getClass(*(id *)(v36 + 32));
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      ClassName = object_getClassName(*(id *)(v36 + 32));
      Name = sel_getName(*(SEL *)(v36 + 88));
      uint64_t v45 = [v37 description];
      int buf = 67110146;
      a32 = v42;
      LOWORD(a33) = 2082;
      *(void *)((char *)&a33 + 2) = ClassName;
      WORD5(a33) = 2082;
      *(void *)((char *)&a33 + 12) = Name;
      LOWORD(a35) = 1024;
      *(int *)((char *)&a35 + 2) = 410;
      WORD1(a36) = 2114;
      *(void *)((char *)&a36 + 4) = v45;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@", (uint8_t *)&buf, 0x2Cu);
    }
    *(_DWORD *)(*(void *)(*(void *)(v36 + 80) + 8) + 24) = 23;
    id v46 = objc_alloc((Class)NSError);
    id v47 = +[NSString stringWithUTF8String:"seld"];
    a27 = NSLocalizedDescriptionKey;
    a28 = @"Decoding Error";
    __int16 v48 = +[NSDictionary dictionaryWithObjects:&a28 forKeys:&a27 count:1];
    id v49 = [v46 initWithDomain:v47 code:23 userInfo:v48];
    uint64_t v50 = *(void *)(*(void *)(v36 + 64) + 8);
    uint64_t v51 = *(void **)(v50 + 40);
    *(void *)(v50 + 40) = v49;

    objc_end_catch();
    JUMPOUT(0x10003F994);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10003FC10(uint64_t a1, int a2, char a3, CFErrorRef err)
{
  if (err)
  {
    CFStringRef v7 = CFErrorCopyDescription(err);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Not trusted, error=%{public}@", v12, ClassName, Name, 503, err);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      uint64_t v16 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)int buf = 67110146;
      int v72 = v15;
      __int16 v73 = 2082;
      CFStringRef v74 = v16;
      __int16 v75 = 2082;
      long long v76 = v17;
      __int16 v77 = 1024;
      int v78 = 503;
      __int16 v79 = 2114;
      CFErrorRef v80 = err;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not trusted, error=%{public}@", buf, 0x2Cu);
    }

    CFRelease(v7);
  }
  if ((a3 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      int v19 = (void (*)(uint64_t, const char *, ...))v18;
      uint64_t v20 = object_getClass(*(id *)(a1 + 32));
      BOOL v21 = class_isMetaClass(v20);
      id v22 = object_getClassName(*(id *)(a1 + 32));
      int v67 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Not trusted", v23, v22, v67, 519);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      long long v27 = object_getClassName(*(id *)(a1 + 32));
      long long v28 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)int buf = 67109890;
      int v72 = v26;
      __int16 v73 = 2082;
      CFStringRef v74 = v27;
      __int16 v75 = 2082;
      long long v76 = v28;
      __int16 v77 = 1024;
      int v78 = 519;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not trusted", buf, 0x22u);
    }

    id v29 = *(void **)(a1 + 32);
    if (v29
      && os_variant_has_internal_content()
      && (BOOL v30 = CFPreferencesGetAppBooleanValue(@"PKBypassCertValidation", kCFPreferencesAnyApplication, 0) != 0,
          CFPreferencesGetAppBooleanValue(@"PKBypassEVCertValidation", kCFPreferencesAnyApplication, 0) | v30))
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        int v32 = (void (*)(uint64_t, const char *, ...))v31;
        __int16 v33 = object_getClass(v29);
        BOOL v34 = class_isMetaClass(v33);
        __int16 v35 = object_getClassName(v29);
        int v68 = sel_getName("_canBypassTrustExtendedValidation");
        uint64_t v36 = 45;
        if (v34) {
          uint64_t v36 = 43;
        }
        v32(6, "%c[%{public}s %{public}s]:%i Allowing bypass of extended trust validation by preference on internal build", v36, v35, v68, 485);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = object_getClass(v29);
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        int v40 = object_getClassName(v29);
        id v41 = sel_getName("_canBypassTrustExtendedValidation");
        *(_DWORD *)int buf = 67109890;
        int v72 = v39;
        __int16 v73 = 2082;
        CFStringRef v74 = v40;
        __int16 v75 = 2082;
        long long v76 = v41;
        __int16 v77 = 1024;
        int v78 = 485;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Allowing bypass of extended trust validation by preference on internal build", buf, 0x22u);
      }

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        int v43 = (void (*)(uint64_t, const char *, ...))v42;
        __int16 v44 = object_getClass(*(id *)(a1 + 32));
        BOOL v45 = class_isMetaClass(v44);
        id v46 = object_getClassName(*(id *)(a1 + 32));
        id v69 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(6, "%c[%{public}s %{public}s]:%i Internal trust bypass", v47, v46, v69, 523);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v48 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      id v49 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v49)) {
        int v50 = 43;
      }
      else {
        int v50 = 45;
      }
      uint64_t v51 = object_getClassName(*(id *)(a1 + 32));
      int v52 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)int buf = 67109890;
      int v72 = v50;
      __int16 v73 = 2082;
      CFStringRef v74 = v51;
      __int16 v75 = 2082;
      long long v76 = v52;
      __int16 v77 = 1024;
      int v78 = 523;
      int v53 = "%c[%{public}s %{public}s]:%i Internal trust bypass";
    }
    else
    {
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 49)) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v54 = NFLogGetLogger();
      if (v54)
      {
        uint64_t v55 = (void (*)(uint64_t, const char *, ...))v54;
        id v56 = object_getClass(*(id *)(a1 + 32));
        BOOL v57 = class_isMetaClass(v56);
        int v58 = object_getClassName(*(id *)(a1 + 32));
        long long v70 = sel_getName(*(SEL *)(a1 + 48));
        uint64_t v59 = 45;
        if (v57) {
          uint64_t v59 = 43;
        }
        v55(6, "%c[%{public}s %{public}s]:%i Override EV trust validation", v59, v58, v70, 530);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v48 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      uint64_t v60 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v60)) {
        int v61 = 43;
      }
      else {
        int v61 = 45;
      }
      uint64_t v62 = object_getClassName(*(id *)(a1 + 32));
      id v63 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)int buf = 67109890;
      int v72 = v61;
      __int16 v73 = 2082;
      CFStringRef v74 = v62;
      __int16 v75 = 2082;
      long long v76 = v63;
      __int16 v77 = 1024;
      int v78 = 530;
      int v53 = "%c[%{public}s %{public}s]:%i Override EV trust validation";
    }
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v53, buf, 0x22u);
LABEL_54:
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100040774(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [*(id *)(a1 + 32) serverTrust]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
  else
  {
    id v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 2, 0);
  }
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

uint64_t CFRunLoopRunSpecific()
{
  return _CFRunLoopRunSpecific();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

uint64_t GetElapsedTimeInMillisecondsFromMachTime()
{
  return _GetElapsedTimeInMillisecondsFromMachTime();
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NFBuildVersion()
{
  return _NFBuildVersion();
}

uint64_t NFGetProductType()
{
  return _NFGetProductType();
}

uint64_t NFIsInternalBuild()
{
  return _NFIsInternalBuild();
}

uint64_t NFIsSimulator()
{
  return _NFIsSimulator();
}

uint64_t NFLogGetLogger()
{
  return _NFLogGetLogger();
}

uint64_t NFProductIsDevBoard()
{
  return _NFProductIsDevBoard();
}

uint64_t NFSetThreadPriority()
{
  return _NFSetThreadPriority();
}

uint64_t NFSharedLogGetLogger()
{
  return _NFSharedLogGetLogger();
}

uint64_t NFSimulateCrash()
{
  return _NFSimulateCrash();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t SESEndPointAppletCleanup()
{
  return _SESEndPointAppletCleanup();
}

uint64_t SESEndPointDeleteWithSession()
{
  return _SESEndPointDeleteWithSession();
}

uint64_t SESEndPointRemoteTerminationRequestFromTSM()
{
  return _SESEndPointRemoteTerminationRequestFromTSM();
}

uint64_t SESEndPointTSMDictionary()
{
  return _SESEndPointTSMDictionary();
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return _SecTrustEvaluateAsyncWithError(trust, queue, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

BOOL class_isMetaClass(Class cls)
{
  return _class_isMetaClass(cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return _nw_path_is_constrained(path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return _nw_path_is_expensive(path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return _nw_path_monitor_create_with_type(required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_APNConnectionRequesterFirst(void *a1, const char *a2, ...)
{
  return [a1 APNConnectionRequesterFirst];
}

id objc_msgSend_APNConnectionRequesterLatest(void *a1, const char *a2, ...)
{
  return [a1 APNConnectionRequesterLatest];
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return [a1 MIMEType];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__checkForCathayIngestion(void *a1, const char *a2, ...)
{
  return [a1 _checkForCathayIngestion];
}

id objc_msgSend__checkForMercuryIngestion(void *a1, const char *a2, ...)
{
  return [a1 _checkForMercuryIngestion];
}

id objc_msgSend__closeSession(void *a1, const char *a2, ...)
{
  return [a1 _closeSession];
}

id objc_msgSend__doFinalTSMCheckIn(void *a1, const char *a2, ...)
{
  return [a1 _doFinalTSMCheckIn];
}

id objc_msgSend__doInitialRequest(void *a1, const char *a2, ...)
{
  return [a1 _doInitialRequest];
}

id objc_msgSend__doReaderModeRedirect(void *a1, const char *a2, ...)
{
  return [a1 _doReaderModeRedirect];
}

id objc_msgSend__gatherCardStateInfo(void *a1, const char *a2, ...)
{
  return [a1 _gatherCardStateInfo];
}

id objc_msgSend__getRequireServiceV1List(void *a1, const char *a2, ...)
{
  return [a1 _getRequireServiceV1List];
}

id objc_msgSend__getSessionSystemCode(void *a1, const char *a2, ...)
{
  return [a1 _getSessionSystemCode];
}

id objc_msgSend__openSession(void *a1, const char *a2, ...)
{
  return [a1 _openSession];
}

id objc_msgSend__performReaderModeRequest(void *a1, const char *a2, ...)
{
  return [a1 _performReaderModeRequest];
}

id objc_msgSend__preValidateCardForCathay(void *a1, const char *a2, ...)
{
  return [a1 _preValidateCardForCathay];
}

id objc_msgSend__preValidateCardForMercury(void *a1, const char *a2, ...)
{
  return [a1 _preValidateCardForMercury];
}

id objc_msgSend__redirectResult(void *a1, const char *a2, ...)
{
  return [a1 _redirectResult];
}

id objc_msgSend__restoreRFSettingForCathayIngestion(void *a1, const char *a2, ...)
{
  return [a1 _restoreRFSettingForCathayIngestion];
}

id objc_msgSend__restoreRFSettingForMercuryIngestion(void *a1, const char *a2, ...)
{
  return [a1 _restoreRFSettingForMercuryIngestion];
}

id objc_msgSend__validateCard(void *a1, const char *a2, ...)
{
  return [a1 _validateCard];
}

id objc_msgSend__validateCardForFelica(void *a1, const char *a2, ...)
{
  return [a1 _validateCardForFelica];
}

id objc_msgSend_aborted(void *a1, const char *a2, ...)
{
  return [a1 aborted];
}

id objc_msgSend_abortedReason(void *a1, const char *a2, ...)
{
  return [a1 abortedReason];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allSystemCodes(void *a1, const char *a2, ...)
{
  return [a1 allSystemCodes];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowSleep(void *a1, const char *a2, ...)
{
  return [a1 allowSleep];
}

id objc_msgSend_appletMap(void *a1, const char *a2, ...)
{
  return [a1 appletMap];
}

id objc_msgSend_areSessionsAllowed(void *a1, const char *a2, ...)
{
  return [a1 areSessionsAllowed];
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return [a1 asDictionary];
}

id objc_msgSend_atqa(void *a1, const char *a2, ...)
{
  return [a1 atqa];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_batchId(void *a1, const char *a2, ...)
{
  return [a1 batchId];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cardServiceInfo(void *a1, const char *a2, ...)
{
  return [a1 cardServiceInfo];
}

id objc_msgSend_clearRetryInterval(void *a1, const char *a2, ...)
{
  return [a1 clearRetryInterval];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_closeConnection(void *a1, const char *a2, ...)
{
  return [a1 closeConnection];
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return [a1 closeSession];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_delegateQueue(void *a1, const char *a2, ...)
{
  return [a1 delegateQueue];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_disconnectTag(void *a1, const char *a2, ...)
{
  return [a1 disconnectTag];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dumpState(void *a1, const char *a2, ...)
{
  return [a1 dumpState];
}

id objc_msgSend_enabledTopics(void *a1, const char *a2, ...)
{
  return [a1 enabledTopics];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return [a1 endSession];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_forwardDataToSP(void *a1, const char *a2, ...)
{
  return [a1 forwardDataToSP];
}

id objc_msgSend_generateUUID(void *a1, const char *a2, ...)
{
  return [a1 generateUUID];
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return [a1 getHwSupport];
}

id objc_msgSend_getNextRequest(void *a1, const char *a2, ...)
{
  return [a1 getNextRequest];
}

id objc_msgSend_getTimestamp(void *a1, const char *a2, ...)
{
  return [a1 getTimestamp];
}

id objc_msgSend_historicalBytes(void *a1, const char *a2, ...)
{
  return [a1 historicalBytes];
}

id objc_msgSend_httpHeaderInfo(void *a1, const char *a2, ...)
{
  return [a1 httpHeaderInfo];
}

id objc_msgSend_httpStatus(void *a1, const char *a2, ...)
{
  return [a1 httpStatus];
}

id objc_msgSend_incrementLongRetry(void *a1, const char *a2, ...)
{
  return [a1 incrementLongRetry];
}

id objc_msgSend_incrementStep(void *a1, const char *a2, ...)
{
  return [a1 incrementStep];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_initialClientRequestInfo(void *a1, const char *a2, ...)
{
  return [a1 initialClientRequestInfo];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isProductionSigned(void *a1, const char *a2, ...)
{
  return [a1 isProductionSigned];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_maxDetectionTimeout(void *a1, const char *a2, ...)
{
  return [a1 maxDetectionTimeout];
}

id objc_msgSend_maxNetworkResponseTime(void *a1, const char *a2, ...)
{
  return [a1 maxNetworkResponseTime];
}

id objc_msgSend_migrationState(void *a1, const char *a2, ...)
{
  return [a1 migrationState];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return [a1 openSession];
}

id objc_msgSend_outFailureResponseDetected(void *a1, const char *a2, ...)
{
  return [a1 outFailureResponseDetected];
}

id objc_msgSend_outFinalSWStatus(void *a1, const char *a2, ...)
{
  return [a1 outFinalSWStatus];
}

id objc_msgSend_outIncompleteExecution(void *a1, const char *a2, ...)
{
  return [a1 outIncompleteExecution];
}

id objc_msgSend_outTotalAPDUExecutionDuration(void *a1, const char *a2, ...)
{
  return [a1 outTotalAPDUExecutionDuration];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_pendingImmediateRetry(void *a1, const char *a2, ...)
{
  return [a1 pendingImmediateRetry];
}

id objc_msgSend_performCheckIn(void *a1, const char *a2, ...)
{
  return [a1 performCheckIn];
}

id objc_msgSend_performRedirect(void *a1, const char *a2, ...)
{
  return [a1 performRedirect];
}

id objc_msgSend_performRequest(void *a1, const char *a2, ...)
{
  return [a1 performRequest];
}

id objc_msgSend_performanceMetrics(void *a1, const char *a2, ...)
{
  return [a1 performanceMetrics];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return [a1 publicToken];
}

id objc_msgSend_reconnectTag(void *a1, const char *a2, ...)
{
  return [a1 reconnectTag];
}

id objc_msgSend_redirectResponse(void *a1, const char *a2, ...)
{
  return [a1 redirectResponse];
}

id objc_msgSend_redirectState(void *a1, const char *a2, ...)
{
  return [a1 redirectState];
}

id objc_msgSend_redirectStepError(void *a1, const char *a2, ...)
{
  return [a1 redirectStepError];
}

id objc_msgSend_redirectUrl(void *a1, const char *a2, ...)
{
  return [a1 redirectUrl];
}

id objc_msgSend_refreshRetryInterval(void *a1, const char *a2, ...)
{
  return [a1 refreshRetryInterval];
}

id objc_msgSend_registerForEvents(void *a1, const char *a2, ...)
{
  return [a1 registerForEvents];
}

id objc_msgSend_remoteAdminAccess(void *a1, const char *a2, ...)
{
  return [a1 remoteAdminAccess];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return [a1 requestInfo];
}

id objc_msgSend_restrictedMode(void *a1, const char *a2, ...)
{
  return [a1 restrictedMode];
}

id objc_msgSend_restrictedPerformanceMode(void *a1, const char *a2, ...)
{
  return [a1 restrictedPerformanceMode];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retryInterval(void *a1, const char *a2, ...)
{
  return [a1 retryInterval];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sak(void *a1, const char *a2, ...)
{
  return [a1 sak];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_seid(void *a1, const char *a2, ...)
{
  return [a1 seid];
}

id objc_msgSend_sequenceCounter(void *a1, const char *a2, ...)
{
  return [a1 sequenceCounter];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serverIdentifier(void *a1, const char *a2, ...)
{
  return [a1 serverIdentifier];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_sessionCardServiceInfo(void *a1, const char *a2, ...)
{
  return [a1 sessionCardServiceInfo];
}

id objc_msgSend_sessionToken(void *a1, const char *a2, ...)
{
  return [a1 sessionToken];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedCALogger(void *a1, const char *a2, ...)
{
  return [a1 sharedCALogger];
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return [a1 sharedHardwareManager];
}

id objc_msgSend_sharedPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 sharedPowerAssertion];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_skipMifareClassification(void *a1, const char *a2, ...)
{
  return [a1 skipMifareClassification];
}

id objc_msgSend_sourceUrl(void *a1, const char *a2, ...)
{
  return [a1 sourceUrl];
}

id objc_msgSend_spStatusCode(void *a1, const char *a2, ...)
{
  return [a1 spStatusCode];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startNewSession(void *a1, const char *a2, ...)
{
  return [a1 startNewSession];
}

id objc_msgSend_stateInformation(void *a1, const char *a2, ...)
{
  return [a1 stateInformation];
}

id objc_msgSend_stateUpdateOnSessionEndedCallback(void *a1, const char *a2, ...)
{
  return [a1 stateUpdateOnSessionEndedCallback];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return [a1 step];
}

id objc_msgSend_stopPolling(void *a1, const char *a2, ...)
{
  return [a1 stopPolling];
}

id objc_msgSend_stopTimer(void *a1, const char *a2, ...)
{
  return [a1 stopTimer];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tagID(void *a1, const char *a2, ...)
{
  return [a1 tagID];
}

id objc_msgSend_targetSEID(void *a1, const char *a2, ...)
{
  return [a1 targetSEID];
}

id objc_msgSend_targetTagType(void *a1, const char *a2, ...)
{
  return [a1 targetTagType];
}

id objc_msgSend_taskId(void *a1, const char *a2, ...)
{
  return [a1 taskId];
}

id objc_msgSend_technology(void *a1, const char *a2, ...)
{
  return [a1 technology];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_totalAPDUTime(void *a1, const char *a2, ...)
{
  return [a1 totalAPDUTime];
}

id objc_msgSend_totalNetworkResponseTime(void *a1, const char *a2, ...)
{
  return [a1 totalNetworkResponseTime];
}

id objc_msgSend_totalResponsesWithBody(void *a1, const char *a2, ...)
{
  return [a1 totalResponsesWithBody];
}

id objc_msgSend_totalSessionTime(void *a1, const char *a2, ...)
{
  return [a1 totalSessionTime];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unregisterForEvents(void *a1, const char *a2, ...)
{
  return [a1 unregisterForEvents];
}

id objc_msgSend_unsentScriptResponse(void *a1, const char *a2, ...)
{
  return [a1 unsentScriptResponse];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_uri(void *a1, const char *a2, ...)
{
  return [a1 uri];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return [a1 urlString];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whitelistedInstances(void *a1, const char *a2, ...)
{
  return [a1 whitelistedInstances];
}

id objc_msgSend_withRelyingParty_relyingPartyAccountHash_fidoKeyHash_(void *a1, const char *a2, ...)
{
  return [a1 withRelyingParty:relyingPartyAccountHash:fidoKeyHash:];
}