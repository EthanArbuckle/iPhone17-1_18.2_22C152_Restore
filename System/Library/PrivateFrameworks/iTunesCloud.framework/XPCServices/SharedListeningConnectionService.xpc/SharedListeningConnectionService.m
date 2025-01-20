void sub_1000012F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v30 - 144));
  _Unwind_Resume(a1);
}

id sub_100001348()
{
  if (qword_100008BB8 != -1) {
    dispatch_once(&qword_100008BB8, &stru_1000041B8);
  }
  v0 = (void *)qword_100008BB0;

  return v0;
}

void sub_10000139C(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v4 = sub_100001348();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICSharedListeningService: %p: invalidated.", (uint8_t *)&v8, 0xCu);
    }

    if (v3)
    {
      v5 = sub_100001348();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [v3 xpcConnection];
        int v8 = 134218242;
        id v9 = WeakRetained;
        __int16 v10 = 2112;
        v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICSharedListeningService: %p: Removing controller for connection %@.", (uint8_t *)&v8, 0x16u);
      }
      v7 = [a1[4] controllers];
      [v7 removeObject:v3];
    }
  }
}

void sub_100001504(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v4 = sub_100001348();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICSharedListeningService: %p: connection interrupted.", (uint8_t *)&v8, 0xCu);
    }

    if (v3)
    {
      v5 = sub_100001348();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [v3 xpcConnection];
        int v8 = 134218242;
        id v9 = WeakRetained;
        __int16 v10 = 2112;
        v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICSharedListeningService: %p: Removing controller for connection %@.", (uint8_t *)&v8, 0x16u);
      }
      v7 = [a1[4] controllers];
      [v7 removeObject:v3];
    }
  }
}

void sub_10000166C(id a1)
{
  qword_100008BB0 = (uint64_t)os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");

  _objc_release_x1();
}

uint64_t start()
{
  v0 = sub_100001348();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "ICSharedListeningService starting.", (uint8_t *)v6, 2u);
  }

  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v1 = (void *)qword_100008BC0;
  uint64_t v10 = qword_100008BC0;
  if (!qword_100008BC0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000018DC;
    v6[3] = &unk_1000042D8;
    v6[4] = &v7;
    sub_1000018DC((uint64_t)v6);
    v1 = (void *)v8[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v7, 8);
  id v3 = +[NSXPCListener serviceListener];
  v4 = objc_opt_new();
  [v3 setDelegate:v4];
  [v3 resume];

  return 0;
}

void sub_1000018C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000018DC(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100008BC8)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_100001AC8;
    v6[4] = &unk_100004310;
    v6[5] = v6;
    long long v7 = off_1000041D8;
    uint64_t v8 = 0;
    qword_100008BC8 = _sl_dlopen();
  }
  if (!qword_100008BC8)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    v4 = +[NSString stringWithUTF8String:"void *iTunesCloudLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"main.m", 23, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("ICLiveLinkIdentity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    v5 = +[NSString stringWithUTF8String:"Class getICLiveLinkIdentityClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"main.m", 24, @"Unable to find class %s", "ICLiveLinkIdentity");

LABEL_10:
    __break(1u);
  }
  qword_100008BC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100001AC8()
{
  uint64_t result = _sl_dlopen();
  qword_100008BC8 = result;
  return result;
}

void sub_100001F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001F6C(uint64_t a1)
{
  sub_100002034();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_ICLLProtocolMessage");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100008BF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class get_ICLLProtocolMessageClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICHostedSharedListeningConnectionController.m", 22, @"Unable to find class %s", "_ICLLProtocolMessage");

    __break(1u);
  }
}

void sub_100002034()
{
  v3[0] = 0;
  if (!qword_100008BE8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100002184;
    v3[4] = &unk_100004310;
    v3[5] = v3;
    long long v4 = off_1000042F8;
    uint64_t v5 = 0;
    qword_100008BE8 = _sl_dlopen();
  }
  if (!qword_100008BE8)
  {
    v1 = +[NSAssertionHandler currentHandler];
    id v2 = +[NSString stringWithUTF8String:"void *iTunesCloudLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"ICHostedSharedListeningConnectionController.m", 19, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100002184()
{
  uint64_t result = _sl_dlopen();
  qword_100008BE8 = result;
  return result;
}

id sub_1000022F4()
{
  if (qword_100008BD8 != -1) {
    dispatch_once(&qword_100008BD8, &stru_1000042B0);
  }
  v0 = (void *)qword_100008BD0;

  return v0;
}

void sub_100002348(id a1)
{
  qword_100008BD0 = (uint64_t)os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");

  _objc_release_x1();
}

void sub_100002570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100002590(uint64_t a1)
{
  sub_100002034();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ICSharedListeningConnectionController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100008BE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getICSharedListeningConnectionControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICHostedSharedListeningConnectionController.m", 20, @"Unable to find class %s", "ICSharedListeningConnectionController");

    __break(1u);
  }
}

uint64_t MSVBundleIDForAuditToken()
{
  return _MSVBundleIDForAuditToken();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_connectionController(void *a1, const char *a2, ...)
{
  return [a1 connectionController];
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return [a1 controllers];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_inviteURL(void *a1, const char *a2, ...)
{
  return [a1 inviteURL];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_sessionToken(void *a1, const char *a2, ...)
{
  return [a1 sessionToken];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}