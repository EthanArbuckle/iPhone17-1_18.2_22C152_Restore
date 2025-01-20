void sub_25C115F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C116434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void *__getUIApplicationDidBecomeActiveNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)UIKitLibrary();
  result = dlsym(v2, "UIApplicationDidBecomeActiveNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26B34E3B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __UIKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2654ACA30;
    uint64_t v5 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v1 = (void *)v3[0];
    uint64_t v0 = UIKitLibraryCore_frameworkLibrary;
    if (UIKitLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return UIKitLibraryCore_frameworkLibrary;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getUIApplicationWillResignActiveNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIApplicationWillResignActiveNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26B34E3B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getUIImageViewClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIImageView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_26B34E3C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getUIImageClass_block_invoke(v3);
  }
  return result;
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_26B34E3C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getUICollectionViewCellClass_block_invoke(v3);
  }
  return result;
}

Class __getUICollectionViewCellClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UICollectionViewCell");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_26B34E3D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getUITableViewCellClass_block_invoke(v3);
  }
  return result;
}

Class __getUITableViewCellClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UITableViewCell");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_26B34E3D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke(v3, v4);
  }
  return result;
}

os_log_t __SRLogBundleRecord_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensorKit", "SRBundleRecord");
  qword_26B34E408 = (uint64_t)result;
  return result;
}

void sub_25C1171F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25C1182D4(_Unwind_Exception *a1)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26B34E420)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __UIKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2654ACB98;
    uint64_t v6 = 0;
    qword_26B34E420 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_26B34E420)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("UIApplication");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_26B34E418 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  qword_26B34E420 = result;
  return result;
}

BOOL isAreaOccupied(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v13 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  double width = v13.size.width;
  double height = v13.size.height;
  return !CGRectIsNull(v13) && width * height >= a8 * (a7 * 0.5);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

void dispatch_release(dispatch_object_t object)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}