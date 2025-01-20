void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id URTLog()
{
  if (URTLog_onceToken != -1) {
    dispatch_once(&URTLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)URTLog_logger;
  return v0;
}

uint64_t __URTLog_block_invoke()
{
  URTLog_logger = (uint64_t)os_log_create("com.apple.UserAlerts", "UserAlerts");
  return MEMORY[0x270F9A758]();
}

void sub_2262C5228(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2262C532C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2262C53A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t _URTUserNotificationRunLoopCallback(uint64_t a1, uint64_t a2)
{
  v4 = URTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _URTUserNotificationRunLoopCallback_cold_1(a2, v4);
  }

  return +[URTUserNotificationPresentation invokeHandlerForUserNotification:a1 responseFlags:a2];
}

void sub_2262C5A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *URTDescriptionForAlertPresentationStyle(uint64_t a1)
{
  v1 = @"default";
  if (a1 == 1) {
    v1 = @"modal";
  }
  if (a1 == 2) {
    return @"full sheet";
  }
  else {
    return v1;
  }
}

void sub_2262C66EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2262C6E04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

__CFString *URTDescriptionForAlertDestination(uint64_t a1)
{
  v1 = @"default";
  if (a1 == 1) {
    v1 = @"CarPlay";
  }
  if (a1 == 2) {
    return @"Previews";
  }
  else {
    return v1;
  }
}

__CFString *URTMachPortNameForAlertDestination(uint64_t a1)
{
  v1 = @"com.apple.CarPlayApp.user-alerts-service";
  if (a1 != 1) {
    v1 = 0;
  }
  if (a1 == 2) {
    return @"com.apple.preview-shell.user-alerts-service";
  }
  else {
    return v1;
  }
}

void sub_2262C7EF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

id URTVerifyString(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    uint64_t v3 = URTLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      URTVerifyString_cold_1((uint64_t)v1, v3);
    }

    id v2 = 0;
  }

  return v2;
}

id URTVerifyClass(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    v5 = URTLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      URTVerifyClass_cold_1((uint64_t)v3, a2, v5);
    }

    id v4 = 0;
  }

  return v4;
}

URTAlertPresenter *URTAlertCreate(uint64_t a1, _DWORD *a2, void *a3)
{
  id v5 = a3;
  v6 = objc_alloc_init(URTAlertPresenter);
  [(URTAlertPresenter *)v6 _addDefaultDestinationAlertFromUserNotificationContents:v5 flags:a1];
  v7 = [v5 objectForKeyedSubscript:@"URTAlertCarPlayHeaderKey"];
  uint64_t v8 = URTVerifyString(v7);

  v9 = [v5 objectForKeyedSubscript:@"URTAlertCarPlayMessageKey"];
  uint64_t v10 = URTVerifyString(v9);

  if (v8 | v10)
  {
    objc_initWeak(&location, v6);
    v11 = [[URTAlert alloc] initWithTitle:v8 message:v10];
    v12 = [v5 objectForKeyedSubscript:@"URTAlertCarPlayDefaultButtonTitleKey"];
    v13 = URTVerifyString(v12);

    if (v13)
    {
      v14 = [URTAlertAction alloc];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __URTAlertCreate_block_invoke;
      v32[3] = &unk_26479AA90;
      objc_copyWeak(&v33, &location);
      v15 = [(URTAlertAction *)v14 initWithTitle:v13 handler:v32];
      [(URTAlert *)v11 setDefaultAction:v15];

      objc_destroyWeak(&v33);
    }
    v16 = [v5 objectForKeyedSubscript:@"URTAlertCarPlayCancelButtonTitleKey"];
    v17 = URTVerifyString(v16);

    if (v17)
    {
      v18 = [URTAlertAction alloc];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __URTAlertCreate_block_invoke_2;
      v30[3] = &unk_26479AA90;
      objc_copyWeak(&v31, &location);
      v19 = [(URTAlertAction *)v18 initWithTitle:v17 handler:v30];
      [(URTAlert *)v11 setCancelAction:v19];

      objc_destroyWeak(&v31);
    }
    v20 = [v5 objectForKeyedSubscript:@"SBUserNotificationAllowedApplications"];
    uint64_t v21 = objc_opt_class();
    v22 = URTVerifyClass(v20, v21);

    [(URTAlert *)v11 setAllowedApplicationBundleIDs:v22];
    [(URTAlertPresenter *)v6 addAlert:v11 forDestination:1];

    objc_destroyWeak(&location);
  }
  id v23 = [v5 objectForKeyedSubscript:@"URTAlertShowInPreviewsKey"];
  if (!v23) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = URTLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      URTAlertCreate_cold_1((uint64_t)v23, v25);
    }

LABEL_14:
    goto LABEL_15;
  }
  int v24 = [v23 BOOLValue];

  if (v24) {
    [(URTAlertPresenter *)v6 _addFromUserNotificationContents:v5 toServiceDestination:2];
  }
LABEL_15:
  [(URTAlertPresenter *)v6 present];
  v26 = [(URTAlertPresenter *)v6 userNotificationPresentation];
  int v27 = [v26 error];

  if (v27)
  {
    v28 = 0;
    if (a2) {
      *a2 = v27;
    }
  }
  else
  {
    v28 = v6;
  }

  return v28;
}

void sub_2262C91E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __URTAlertCreate_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCallbackForResponseFlags:0];
}

void __URTAlertCreate_block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCallbackForResponseFlags:1];
}

uint64_t URTAlertReceiveResponse()
{
  return 0;
}

uint64_t URTAlertCreateRunLoopSource(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  [v5 setCompatibilityCallback:a2];
  v6 = [v5 userNotificationPresentation];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __URTAlertCreateRunLoopSource_block_invoke;
  v10[3] = &unk_26479AB18;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = [v6 createRunLoopSourceOrdered:a3 handler:v10];

  return v8;
}

uint64_t __URTAlertCreateRunLoopSource_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUserNotificationResponse:");
}

void sub_2262C9670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2262C9870(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _URTUserNotificationRunLoopCallback_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2262C3000, a2, OS_LOG_TYPE_DEBUG, "CFUserNotification callback response flags: %lu", (uint8_t *)&v2, 0xCu);
}

void URTVerifyString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2262C3000, a2, OS_LOG_TYPE_ERROR, "object %@ is not a string", (uint8_t *)&v2, 0xCu);
}

void URTVerifyClass_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2262C3000, log, OS_LOG_TYPE_ERROR, "object %@ is not of class %@", (uint8_t *)&v3, 0x16u);
}

void URTAlertCreate_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2262C3000, a2, OS_LOG_TYPE_ERROR, "object %@ is not a BOOL number", (uint8_t *)&v2, 0xCu);
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x270F10750]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x270F10770]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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