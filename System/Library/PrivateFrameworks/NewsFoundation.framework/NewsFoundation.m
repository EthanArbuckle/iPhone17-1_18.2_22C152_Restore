uint64_t NFSeedBuild()
{
  return 0;
}

void __NFDevicePlatform_block_invoke()
{
  size_t size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v0 = malloc_type_malloc(size, 0x789F8471uLL);
  sysctlbyname("hw.machine", v0, &size, 0, 0);
  uint64_t v1 = [[NSString alloc] initWithUTF8String:v0];
  v2 = (void *)NFDevicePlatform_s_platformString;
  NFDevicePlatform_s_platformString = v1;

  free(v0);
}

void sub_21DE456A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NFDeviceHasExtendedColorDisplay()
{
  if (NFDeviceHasExtendedColorDisplay_onceToken != -1) {
    dispatch_once(&NFDeviceHasExtendedColorDisplay_onceToken, &__block_literal_global_50_0);
  }
  return NFDeviceHasExtendedColorDisplay_hasExtendedColorDisplay;
}

void __zalgoIfMain_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.news.promises.zalgoIfMain", v2);
  uint64_t v1 = (void *)zalgoIfMain_queue;
  zalgoIfMain_queue = (uint64_t)v0;
}

id NFDevicePlatform()
{
  if (NFDevicePlatform_onceToken != -1) {
    dispatch_once(&NFDevicePlatform_onceToken, &__block_literal_global_9);
  }
  dispatch_queue_t v0 = (void *)NFDevicePlatform_s_platformString;
  return v0;
}

void __zalgo_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.news.promises.zalgo", v2);
  uint64_t v1 = (void *)zalgo_queue;
  zalgo_queue = (uint64_t)v0;
}

uint64_t NFStoreDemoMode()
{
  if (NFStoreDemoMode_onceToken != -1) {
    dispatch_once(&NFStoreDemoMode_onceToken, &__block_literal_global_3);
  }
  return NFStoreDemoMode_storeDemoMode;
}

uint64_t NFInternalBuild()
{
  if (NFInternalBuild_onceToken != -1) {
    dispatch_once(&NFInternalBuild_onceToken, &__block_literal_global);
  }
  return NFInternalBuild_internalBuild;
}

void sub_21DE47B10(void *a1, int a2)
{
  id v4 = objc_begin_catch(a1);
  if (a2 != 2)
  {
    v5 = [MEMORY[0x263F087E8] errorWithDomain:kNFPromiseErrorDomain code:kNFPromiseSealingErrorCode userInfo:0];
    (*(void (**)(void))(*(void *)(v2 + 48) + 16))();

    objc_end_catch();
    JUMPOUT(0x21DE47AF4);
  }
  objc_exception_throw(v4);
}

void sub_21DE47B80(_Unwind_Exception *a1)
{
}

void NFPromiseInvokeOnQueue(void *a1, void *a2)
{
  v7 = a1;
  v3 = a2;
  id v4 = zalgo();

  if (v4 == v7) {
    goto LABEL_4;
  }
  v5 = zalgoIfMain();

  v6 = v7;
  if (v5 == v7)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
LABEL_4:
      v3[2](v3);
      goto LABEL_7;
    }
    v6 = MEMORY[0x263EF83A0];
  }
  dispatch_async(v6, v3);
LABEL_7:
}

id zalgo()
{
  if (zalgo_token != -1) {
    dispatch_once(&zalgo_token, &__block_literal_global_0);
  }
  dispatch_queue_t v0 = (void *)zalgo_queue;
  return v0;
}

id zalgoIfMain()
{
  if (zalgoIfMain_token != -1) {
    dispatch_once(&zalgoIfMain_token, &__block_literal_global_4);
  }
  dispatch_queue_t v0 = (void *)zalgoIfMain_queue;
  return v0;
}

uint64_t __NFInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  NFInternalBuild_internalBuild = result;
  return result;
}

uint64_t __NFDeviceHasExtendedColorDisplay_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  NFDeviceHasExtendedColorDisplay_hasExtendedColorDisplay = result;
  return result;
}

id NFDeviceOSVersion()
{
  dispatch_queue_t v0 = (void *)MGCopyAnswer();
  return v0;
}

uint64_t __NFStoreDemoMode_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  NFStoreDemoMode_storeDemoMode = v2;
  return result;
}

__CFString *NFGeneralDeviceString()
{
  dispatch_queue_t v0 = (void *)MGCopyAnswer();
  BOOL v1 = @"iPhone";
  if (([v0 hasPrefix:@"iPhone"] & 1) == 0)
  {
    BOOL v1 = @"iPad";
    if (([v0 hasPrefix:@"iPad"] & 1) == 0)
    {
      BOOL v1 = @"iPod";
      if (([v0 hasPrefix:@"iPod"] & 1) == 0)
      {
        if ([v0 hasPrefix:@"Apple Watch"])
        {
          BOOL v1 = @"Watch";
        }
        else if ([v0 hasPrefix:@"Apple TV"])
        {
          BOOL v1 = @"TV";
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            NFGeneralDeviceString_cold_1((uint64_t)v0);
          }
          BOOL v1 = 0;
        }
      }
    }
  }

  return v1;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void NFArchiverCopyFileFinishedHandler(uint64_t a1, const char *a2)
{
  BOMCopierUserData();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v3 stringWithFileSystemRepresentation:a2 length:strlen(a2)];

  [v5 addObject:v4];
}

void NFLockSync(void *a1, void *a2)
{
  v3 = a2;
  id v4 = a1;
  [v4 lock];
  v3[2](v3);

  [v4 unlock];
}

void sub_21DE4C2BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

double _UIValueCGRectValue(void *a1)
{
  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL);
  return *(double *)v2;
}

void *_getNSValueBytes(void *a1, void *a2, size_t a3)
{
  sizep[1] = *MEMORY[0x263EF8340];
  sizep[0] = 0;
  id v5 = a1;
  v6 = NSGetSizeAndAlignment((const char *)[v5 objCType], sizep, 0);
  MEMORY[0x270FA5388](v6);
  v8 = (char *)sizep - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v5 getValue:v8];

  return memcpy(a2, v8, a3);
}

double _UIValueCGPointValue(void *a1)
{
  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL);
  return *(double *)v2;
}

uint64_t NFDeviceIsA7()
{
  if (NFDeviceIsA7_onceToken != -1) {
    dispatch_once(&NFDeviceIsA7_onceToken, &__block_literal_global_2);
  }
  return NFDeviceIsA7_result;
}

uint64_t __NFDeviceIsA7_block_invoke()
{
  uint64_t result = MGGetProductType();
  if (NFDeviceIsA7_result)
  {
    char v1 = 1;
    goto LABEL_3;
  }
  char v1 = 1;
  if (result <= 2048538370)
  {
    if (result <= 344862119)
    {
      if (result == 23433786) {
        goto LABEL_3;
      }
      uint64_t v2 = 173258742;
    }
    else
    {
      if (result == 344862120 || result == 776033019) {
        goto LABEL_3;
      }
      uint64_t v2 = 1701146937;
    }
  }
  else if (result > 3933982783)
  {
    if (result == 3933982784 || result == 4055323051) {
      goto LABEL_3;
    }
    uint64_t v2 = 4232256925;
  }
  else
  {
    if (result == 2048538371 || result == 3637438250) {
      goto LABEL_3;
    }
    uint64_t v2 = 3865922942;
  }
  if (result != v2) {
    char v1 = 0;
  }
LABEL_3:
  NFDeviceIsA7_uint64_t result = v1;
  return result;
}

uint64_t NFDeviceIsA8()
{
  if (NFDeviceIsA8_onceToken != -1) {
    dispatch_once(&NFDeviceIsA8_onceToken, &__block_literal_global_2);
  }
  return NFDeviceIsA8_result;
}

uint64_t __NFDeviceIsA8_block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  NFDeviceIsA8_uint64_t result = result;
  return result;
}

id NFDeviceModelString()
{
  dispatch_queue_t v0 = (void *)MGCopyAnswer();
  return v0;
}

id NFSystemName()
{
  dispatch_queue_t v0 = (void *)MGCopyAnswer();
  char v1 = v0;
  if (v0) {
    id v2 = v0;
  }
  else {
    id v2 = (id)MGCopyAnswer();
  }
  v3 = v2;

  return v3;
}

void NFGeneralDeviceString_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v1 = (void *)[[NSString alloc] initWithFormat:@"Encountered an unknown device model: %@", a1];
  *(_DWORD *)buf = 136315906;
  v3 = "NSString *NFGeneralDeviceString()";
  __int16 v4 = 2080;
  id v5 = "NFDevice.m";
  __int16 v6 = 1024;
  int v7 = 104;
  __int16 v8 = 2114;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_21DE44000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x270F126B0]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x270F126C0]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x270F126C8]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x270F126D8]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x270F12708]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x270F12710]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x270EE5598](typePtr, sizep, alignp);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x270EF8988](path);
}

BOOL nw_path_is_equal(nw_path_t path, nw_path_t other_path)
{
  return MEMORY[0x270EF89A8](path, other_path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x270EF89B8](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
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

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x270EF8A58](path, *(void *)&interface_type);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}