void sub_1000025D4()
{
  if (qword_1000088D8 != -1) {
    dispatch_once(&qword_1000088D8, &stru_100004230);
  }
}

void sub_1000025FC(id a1)
{
  qword_1000088E0 = (uint64_t)os_log_create("com.apple.networkQuality", "netqual");
  _objc_release_x1();
}

uint64_t start()
{
  v0 = objc_opt_new();
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

void sub_100002894(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)NSProgress);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  id v6 = objc_alloc_init((Class)NSOperationQueue);
  [v6 setUnderlyingQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  [v6 setMaxConcurrentOperationCount:1];
  id v7 = [objc_alloc((Class)NetworkQualityAssessment) initWithConfiguration:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32) delegateQueue:v6];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000029F0;
  v8[3] = &unk_100004258;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 48);
  [v7 runWithCompletionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void sub_1000029D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000029F0(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  WeakRetained[16] = 1;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002B58(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = +[NSProcessInfo processInfo];
  v5 = [v4 hostName];

  id v6 = nw_parameters_create();
  nw_parameters_set_include_peer_to_peer(v6, 1);
  bonjour_service = nw_browse_descriptor_create_bonjour_service("_nq._tcp", 0);
  v8 = nw_browser_create(bonjour_service, v6);
  id v9 = dispatch_get_global_queue(33, 0);
  nw_browser_set_queue(v8, v9);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002CD4;
  handler[3] = &unk_1000042A8;
  id v10 = *(id *)(a1 + 32);
  id v15 = v3;
  id v16 = v10;
  id v14 = v5;
  id v11 = v3;
  id v12 = v5;
  nw_browser_set_browse_results_changed_handler(v8, handler);
  nw_browser_start(v8);
}

void sub_100002CD4(uint64_t a1, NSObject *a2, void *a3, int a4)
{
  id v7 = a3;
  nw_browse_result_change_t changes = nw_browse_result_get_changes(a2, v7);
  if (changes)
  {
    if (changes)
    {
      sub_1000025D4();
      id v14 = qword_1000088E0;
      if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 90;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:%u - nw_browse_result_change_identical, returning", (uint8_t *)&v17, 0x12u);
      }
    }
    else
    {
      id v9 = nw_browse_result_copy_endpoint(v7);
      sub_1000025D4();
      id v10 = qword_1000088E0;
      if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 95;
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:%u - Adding %@", (uint8_t *)&v17, 0x1Cu);
      }
      bonjour_service_name = nw_endpoint_get_bonjour_service_name(v9);
      if (bonjour_service_name)
      {
        id v12 = +[NSString stringWithUTF8String:bonjour_service_name];
        if (([v12 isEqualToString:*(void *)(a1 + 32)] & 1) == 0) {
          [*(id *)(a1 + 40) addObject:v12];
        }
      }
      else
      {
        sub_1000025D4();
        id v15 = qword_1000088E0;
        if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315650;
          v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke";
          __int16 v19 = 1024;
          int v20 = 99;
          __int16 v21 = 2112;
          v22 = v9;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - NULL service_name for %@", (uint8_t *)&v17, 0x1Cu);
        }
      }
      if (a4)
      {
        id v16 = objc_alloc_init((Class)NetworkQualityServersResult);
        [v16 setServers:*(void *)(a1 + 40)];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
  else
  {
    sub_1000025D4();
    v13 = qword_1000088E0;
    if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke_2";
      __int16 v19 = 1024;
      int v20 = 85;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%u - nw_browse_result_change_invalid, returning", (uint8_t *)&v17, 0x12u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return _nw_browse_descriptor_create_bonjour_service(type, domain);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return _nw_browse_result_copy_endpoint(result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return _nw_browse_result_get_changes(old_result, new_result);
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return _nw_browser_create(descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_bonjour_service_name(endpoint);
}

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_hostName(void *a1, const char *a2, ...)
{
  return [a1 hostName];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
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