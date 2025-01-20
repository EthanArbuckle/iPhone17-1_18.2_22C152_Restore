void __XCTTargetBootstrap_block_invoke()
{
  NSObject *v0;
  id v1;
  id v2;
  id v3;
  uint8_t buf[16];

  v0 = XCTTBDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212A06000, v0, OS_LOG_TYPE_DEFAULT, "Registering for test daemon availability notify post.", buf, 2u);
  }

  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dt.testmanagerd.availability.%d", getpid());
  v1 = objc_claimAutoreleasedReturnValue();
  XCTPerformBootstrap((const char *)[v1 UTF8String], @"com.apple.dt.testmanagerd.uiprocess");

  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dt.xctestd.availability.%d", getpid());
  v2 = objc_claimAutoreleasedReturnValue();
  XCTPerformBootstrap((const char *)[v2 UTF8String], @"com.apple.dt.xctestd.target");

  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dt.xctest.remote.availability.%d", getpid());
  v3 = objc_claimAutoreleasedReturnValue();
  XCTPerformBootstrap((const char *)[v3 UTF8String], @"com.apple.dt.xctestd.remote.target");
}

void XCTPerformBootstrap(const char *a1, void *a2)
{
  id v3 = a2;
  int v4 = XCTRegisterForBootstrap(a1, v3, 0);
  int out_token = -1;
  if (!notify_register_check(a1, &out_token))
  {
    uint64_t state64 = 0;
    if (notify_get_state(out_token, &state64))
    {
      v13 = XCTTBDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        XCTPerformBootstrap_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      notify_cancel(out_token);
      uint64_t v21 = state64;
      v13 = XCTTBDefaultLog();
      BOOL v22 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v21 == 1)
      {
        if (v22)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_212A06000, v13, OS_LOG_TYPE_DEFAULT, "Test daemon availability confirmed via notify_get_state.", v23, 2u);
        }

        v5 = [NSString stringWithUTF8String:a1];
        XCTConnectToDaemon(v3, v5);
        notify_cancel(v4);
        goto LABEL_4;
      }
      if (v22)
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_212A06000, v13, OS_LOG_TYPE_DEFAULT, "notify_get_state check indicated test daemon not ready.", v23, 2u);
      }
    }

    goto LABEL_9;
  }
  v5 = XCTTBDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    XCTPerformBootstrap_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
  }
LABEL_4:

LABEL_9:
}

id XCTTBDefaultLog()
{
  if (XCTTBDefaultLog_onceToken != -1) {
    dispatch_once(&XCTTBDefaultLog_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)XCTTBDefaultLog_defaultLog;

  return v0;
}

uint64_t XCTRegisterForBootstrap(const char *a1, void *a2, int a3)
{
  id v5 = a2;
  int out_token = 0;
  id v6 = (id)targetSessionsByServiceName;
  objc_sync_enter(v6);
  if (a3) {
    [(id)targetSessionsByServiceName setObject:0 forKeyedSubscript:v5];
  }
  objc_sync_exit(v6);

  uint64_t v7 = [NSString stringWithUTF8String:a1];
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __XCTRegisterForBootstrap_block_invoke;
  handler[3] = &unk_264198568;
  id v23 = v5;
  id v24 = v7;
  id v9 = v7;
  id v10 = v5;
  uint32_t v11 = notify_register_dispatch(a1, &out_token, v8, handler);

  if (v11)
  {
    uint64_t v12 = XCTTBDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      XCTRegisterForBootstrap_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  uint64_t v20 = out_token;

  return v20;
}

void sub_212A07544(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void XCTTargetBootstrap()
{
  if (XCTTargetBootstrap_onceToken != -1) {
    dispatch_once(&XCTTargetBootstrap_onceToken, &__block_literal_global);
  }
}

uint64_t __XCTTBDefaultLog_block_invoke()
{
  XCTTBDefaultLog_defaultLog = (uint64_t)os_log_create("com.apple.dt.xctest", "Default");

  return MEMORY[0x270F9A758]();
}

void XCTConnectToDaemon(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (XCTConnectToDaemon_onceToken != -1) {
    dispatch_once(&XCTConnectToDaemon_onceToken, &__block_literal_global_19);
  }
  id v5 = (id)targetSessionsByServiceName;
  objc_sync_enter(v5);
  id v6 = [(id)targetSessionsByServiceName objectForKeyedSubscript:v3];
  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [XCTTargetSession alloc];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __XCTConnectToDaemon_block_invoke_2;
    uint64_t v13 = &unk_264198590;
    id v14 = v4;
    id v9 = v3;
    id v15 = v9;
    uint64_t v7 = [(XCTTargetSession *)v8 initWithServiceName:v9 registrationHandler:&v10];
    objc_msgSend((id)targetSessionsByServiceName, "setObject:forKeyedSubscript:", v7, v9, v10, v11, v12, v13);
  }
  objc_sync_exit(v5);

  if (v7) {
    [(XCTTargetSession *)v7 connect];
  }
}

void sub_212A07734(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __XCTRegisterForBootstrap_block_invoke(uint64_t a1, int a2)
{
  id v4 = XCTTBDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_212A06000, v4, OS_LOG_TYPE_DEFAULT, "Got availability notification from test daemon.", v5, 2u);
  }

  notify_cancel(a2);
  XCTConnectToDaemon(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __XCTConnectToDaemon_block_invoke()
{
  targetSessionsByServiceName = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

uint64_t __XCTConnectToDaemon_block_invoke_2(uint64_t a1)
{
  return XCTRegisterForBootstrap([*(id *)(a1 + 32) UTF8String], *(void *)(a1 + 40), 1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_212A07D50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_212A08724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id XCTSharedDaemonConnectionProvider()
{
  v0 = objc_opt_class();
  objc_sync_enter(v0);
  v1 = (void *)_sharedDaemonConnectionProvider;
  if (!_sharedDaemonConnectionProvider)
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = (void *)_sharedDaemonConnectionProvider;
    _sharedDaemonConnectionProvider = v2;

    v1 = (void *)_sharedDaemonConnectionProvider;
  }
  id v4 = v1;
  objc_sync_exit(v0);

  return v4;
}

void sub_212A08CC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void XCTSetSharedDaemonConnectionProvider(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v2 = (void *)_sharedDaemonConnectionProvider;
  _sharedDaemonConnectionProvider = (uint64_t)v1;

  objc_sync_exit(obj);
}

void XCTPerformBootstrap_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void XCTPerformBootstrap_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void XCTRegisterForBootstrap_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}