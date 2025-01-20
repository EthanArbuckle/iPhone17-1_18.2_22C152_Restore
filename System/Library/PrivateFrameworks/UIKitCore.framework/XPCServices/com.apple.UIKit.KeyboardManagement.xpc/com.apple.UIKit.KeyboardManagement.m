void sub_100001A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001A24(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

void sub_100001AB8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 owner];
  [v4 updateSceneClientSettings:v3];
}

void sub_100001CD0()
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void (*)(void))off_100008A10;
  v9 = off_100008A10;
  if (!off_100008A10)
  {
    v1 = sub_1000022D0();
    v7[3] = (uint64_t)dlsym(v1, "_UIArbiterLog");
    off_100008A10 = (_UNKNOWN *)v7[3];
    v0 = (void (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    v2 = v0();
    id v3 = v2;
  }
  else
  {
    id v4 = +[NSAssertionHandler currentHandler];
    v5 = +[NSString stringWithUTF8String:"os_log_t _Local_UIArbiterLog(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"_UIKeyboardManagement.m", 16, @"%s", dlerror());

    __break(1u);
  }
}

void sub_100001E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100002280(uint64_t a1)
{
  v2 = sub_1000022D0();
  uint64_t result = dlsym(v2, "_UIKeyboardArbiter_SceneIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100008A00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000022D0()
{
  v4[0] = 0;
  if (!qword_100008A08)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_100002424;
    v4[4] = &unk_100004260;
    v4[5] = v4;
    long long v5 = off_100004248;
    uint64_t v6 = 0;
    qword_100008A08 = _sl_dlopen();
  }
  v0 = (void *)qword_100008A08;
  if (!qword_100008A08)
  {
    v0 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"void *KeyboardArbiterLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"_UIKeyboardManagement.m", 15, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100002424()
{
  uint64_t result = _sl_dlopen();
  qword_100008A08 = result;
  return result;
}

void *sub_100002498(uint64_t a1)
{
  v2 = sub_1000022D0();
  uint64_t result = dlsym(v2, "_UIArbiterLog");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100008A10 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t start()
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v0 = (void *)qword_100008A20;
  uint64_t v21 = qword_100008A20;
  if (!qword_100008A20)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000271C;
    v17[3] = &unk_100004228;
    v17[4] = &v18;
    sub_10000271C((uint64_t)v17);
    v0 = (void *)v19[3];
  }
  v1 = v0;
  _Block_object_dispose(&v18, 8);
  id v2 = [v1 alloc];
  id v3 = objc_opt_new();
  id v4 = [v2 initWithLink:v3];

  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1000026EC;
  v15 = &unk_100004288;
  id v16 = v4;
  uint64_t v5 = qword_100008A30;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&qword_100008A30, &stru_1000042E0);
  }
  id v7 = [&v12 copy];
  uint64_t v8 = (void *)qword_100008A18;
  id v9 = objc_retainBlock(v7);
  v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 31, v12, v13, v14, v15);
  [v8 setObject:v9 forKey:v10];

  signal(31, (void (__cdecl *)(int))sub_1000029BC);
  [v6 resume];

  return 1;
}

void sub_1000026D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000026EC(uint64_t a1)
{
}

Class sub_10000271C(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100008A28)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_100002908;
    v6[4] = &unk_100004260;
    v6[5] = v6;
    long long v7 = off_1000042A8;
    uint64_t v8 = 0;
    qword_100008A28 = _sl_dlopen();
  }
  if (!qword_100008A28)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:"void *KeyboardArbiterLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"main.m", 15, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("_UIKeyboardArbiter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"Class get_UIKeyboardArbiterClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"main.m", 16, @"Unable to find class %s", "_UIKeyboardArbiter");

LABEL_10:
    __break(1u);
  }
  qword_100008A20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002908()
{
  uint64_t result = _sl_dlopen();
  qword_100008A28 = result;
  return result;
}

void sub_10000297C(id a1)
{
  qword_100008A18 = +[NSMutableDictionary dictionary];
  _objc_release_x1();
}

void sub_1000029BC(uint64_t a1)
{
  id v2 = (void *)qword_100008A18;
  id v3 = +[NSNumber numberWithInt:a1];
  id v4 = [v2 objectForKey:v3];

  if (v4) {
    v4[2]();
  }
  else {
    NSLog(@"Unexpected signal %i", a1);
  }
}

uint64_t FBSWorkspaceInitialize()
{
  return _FBSWorkspaceInitialize();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_activateClients(void *a1, const char *a2, ...)
{
  return [a1 activateClients];
}

id objc_msgSend_attemptConnection(void *a1, const char *a2, ...)
{
  return [a1 attemptConnection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 defaultShellEndpoint];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_owner(void *a1, const char *a2, ...)
{
  return [a1 owner];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_updateSceneClientSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSceneClientSettings:");
}