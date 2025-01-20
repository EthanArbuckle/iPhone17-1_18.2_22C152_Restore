void sub_100001744(uint64_t a1)
{
  NSLog(@"MSVXPCTestServer %@ invalidated", *(void *)(a1 + 32));
}

void sub_100001774(uint64_t a1)
{
}

void start()
{
  v0 = objc_alloc_init(MADXPCDelegate);
  id v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mediaartworkd.xpc"];
  [v1 setDelegate:v0];
  [v1 resume];
  dispatch_main();
}

void sub_100001A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001AAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = WeakRetained;
    v4 = [v3 operationError];
    v5 = [v3 debugMessage];
    v6 = [v3 colorAnalysis];

    if (v5)
    {
      v7 = sub_100002624(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v19 = v8;
        __int16 v20 = 2114;
        v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Artwork color analysis request: %p -- %{public}@", buf, 0x16u);
      }
    }
    if (v4)
    {
      v9 = sub_100002624(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v19 = v10;
        __int16 v20 = 2114;
        v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed artwork color analysis request: %p with error: %{public}@", buf, 0x16u);
      }
      goto LABEL_14;
    }
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v9 = sub_100002624(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Completed artwork color analysis request: %p", buf, 0xCu);
  }
  v4 = 0;
LABEL_14:

  v12 = *(void **)(a1 + 48);
  if (v12)
  {
    v13 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001D48;
    block[3] = &unk_100004208;
    id v17 = v12;
    id v15 = v6;
    id v16 = v4;
    dispatch_async(v13, block);
  }
}

uint64_t sub_100001D48(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100001F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001FAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = WeakRetained;
    v4 = [v3 operationError];
    v5 = [v3 debugMessage];

    if (v5)
    {
      v6 = sub_100002624(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v17 = v7;
        __int16 v18 = 2114;
        uint64_t v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Artwork request: %p -- %{public}@", buf, 0x16u);
      }
    }
    if (v4)
    {
      uint64_t v8 = sub_100002624(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v17 = v9;
        __int16 v18 = 2114;
        uint64_t v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed artwork request: %p with error: %{public}@", buf, 0x16u);
      }
      goto LABEL_14;
    }
  }
  else
  {
    v5 = 0;
  }
  uint64_t v8 = sub_100002624(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Completed artwork request: %p", buf, 0xCu);
  }
  v4 = 0;
LABEL_14:

  uint64_t v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100002220;
    v13[3] = &unk_1000041B8;
    id v15 = v11;
    id v14 = v4;
    dispatch_async(v12, v13);
  }
}

uint64_t sub_100002220(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100002460(uint64_t a1)
{
  v2 = sub_100002624(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(int *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "[MADXPCDelegate] Connection interrupted (pid = %ld)", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000250C(uint64_t a1)
{
  v2 = sub_100002624(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(int *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "[MADXPCDelegate] Connection invalidated (pid = %ld)", (uint8_t *)&v4, 0xCu);
  }
}

id sub_100002624(int a1)
{
  if (qword_100008BF8 != -1) {
    dispatch_once(&qword_100008BF8, &stru_100004268);
  }
  v2 = (void *)qword_100008BD8[a1];
  return v2;
}

void sub_100002688(id a1)
{
  os_log_t v1 = os_log_create("com.apple.amp.mediaartworkd", "Default");
  v2 = (void *)qword_100008BD8[0];
  qword_100008BD8[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.amp.mediaartworkd", "Default_Oversize");
  int v4 = (void *)qword_100008BE0;
  qword_100008BE0 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.amp.mediaartworkd", "XPC");
  v6 = (void *)qword_100008BE8;
  qword_100008BE8 = (uint64_t)v5;

  qword_100008BF0 = (uint64_t)os_log_create("com.apple.amp.mediaartworkd", "XPC-Oversize");
  _objc_release_x1();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_artworkService(void *a1, const char *a2, ...)
{
  return [a1 artworkService];
}

id objc_msgSend_artworkServiceQueue(void *a1, const char *a2, ...)
{
  return [a1 artworkServiceQueue];
}

id objc_msgSend_colorAnalysis(void *a1, const char *a2, ...)
{
  return [a1 colorAnalysis];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugMessage(void *a1, const char *a2, ...)
{
  return [a1 debugMessage];
}

id objc_msgSend_operationClass(void *a1, const char *a2, ...)
{
  return [a1 operationClass];
}

id objc_msgSend_operationError(void *a1, const char *a2, ...)
{
  return [a1 operationError];
}

id objc_msgSend_operationPriority(void *a1, const char *a2, ...)
{
  return [a1 operationPriority];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceInterface(void *a1, const char *a2, ...)
{
  return [a1 serviceInterface];
}

id objc_msgSend_setQueuePriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueuePriority:");
}