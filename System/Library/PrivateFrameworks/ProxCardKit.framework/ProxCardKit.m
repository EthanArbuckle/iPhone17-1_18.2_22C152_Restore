uint64_t PRXSupportedInterfaceOrientations(void *a1, int a2)
{
  void *v3;
  void *v4;

  v3 = [a1 view];
  v4 = [v3 window];

  if (!v4) {
    return 30;
  }
  if (PRXIsPad() || a2) {
    return 1 << [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
  }
  return 2;
}

void sub_21C6DF578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PRXCardDefaultSize()
{
  return _PRXDefaultCardWidthForDevice();
}

BOOL _PRXDefaultCardWidthForDevice()
{
  BOOL result = PRXIsPad();
  if (!result)
  {
    v1 = [MEMORY[0x263F1C920] mainScreen];
    [v1 nativeBounds];

    v2 = [MEMORY[0x263F1C920] mainScreen];
    [v2 nativeScale];

    PRXIsPad();
    return PRXIsPad();
  }
  return result;
}

BOOL PRXCardShortSize()
{
  return _PRXDefaultCardWidthForDevice();
}

BOOL PRXCardCompactSize()
{
  return _PRXDefaultCardWidthForDevice();
}

double PRXCardPreferredSize(uint64_t a1, unint64_t a2)
{
  if (a2 > 1)
  {
    double v4 = *MEMORY[0x263F001B0];
  }
  else
  {
    _PRXDefaultCardWidthForDevice();
    double v4 = v3;
  }
  if (a1 == 1) {
    _PRXDefaultCardWidthForDevice();
  }
  return v4;
}

uint64_t PRXCardPreferredSizeClassForContainerBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGFloat Height = CGRectGetHeight(v12);
  BOOL v10 = Width > Height;
  if (Height >= 375.0) {
    BOOL v10 = 0;
  }
  return Width < 375.0 || v10;
}

double PRXPreferredPickerRowHeight()
{
  v0 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v0 pointSize];
  double v2 = v1 + 11.0;

  return v2;
}

BOOL PRXExpectedCardWidthForStyle(uint64_t a1)
{
  double v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;

  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v4;
  v12.size.height = v6;
  double Width = CGRectGetWidth(v12);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = v4;
  v13.size.height = v6;
  CGFloat Height = CGRectGetHeight(v13);
  BOOL v9 = Width > Height;
  if (Height >= 375.0) {
    BOOL v9 = 0;
  }
  unint64_t v10 = Width < 375.0 || v9;
  PRXCardPreferredSize(a1, v10);
  return PRXIsPad();
}

BOOL PRXExpectedCardWidthForStyleInContainerOfSize(uint64_t a1, unint64_t a2)
{
  return PRXIsPad();
}

double PRXCardContainerDefaultLayoutMargins()
{
  BOOL v0 = PRXIsPad();
  double result = 80.0;
  if (!v0) {
    return 6.0;
  }
  return result;
}

BOOL PRXIsPad()
{
  BOOL v0 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

BOOL PRXIsEdgeToEdgePhone()
{
  if (PRXIsPad()) {
    return 0;
  }
  BOOL v1 = [MEMORY[0x263F1C920] mainScreen];
  double v2 = [v1 traitCollection];
  [v2 displayCornerRadius];
  BOOL v0 = v3 > 0.0;

  return v0;
}

void sub_21C6E8980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C6E8D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = (void *)FrontBoardServicesLibrary();
  double result = dlsym(v2, "FBSOpenApplicationOptionKeyUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t FrontBoardServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264418318;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = FrontBoardServicesLibraryCore_frameworkLibrary;
  BOOL v1 = (void *)v3[0];
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    BOOL v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = (void *)FrontBoardServicesLibrary();
  uint64_t result = dlsym(v2, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CoreServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264418350;
    uint64_t v6 = 0;
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!CoreServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LSApplicationWorkspace");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)__getLSApplicationWorkspaceClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLSApplicationWorkspaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21C6EB48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C6EB614(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C6EB770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PRXDefaultLog()
{
  if (PRXDefaultLog_onceToken != -1) {
    dispatch_once(&PRXDefaultLog_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)PRXDefaultLog_log;
  return v0;
}

uint64_t __PRXDefaultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ProxCardKit", "Default");
  uint64_t v1 = PRXDefaultLog_log;
  PRXDefaultLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PRXCardContainerView setPreferredContentSize:](v0);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

void objc_exception_throw(id exception)
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}