void sub_228A1BA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_228A1C930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKMediaObjectManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __ChatKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26484DE88;
    uint64_t v6 = 0;
    ChatKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!ChatKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CKMediaObjectManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getCKMediaObjectManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCKMediaObjectManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ChatKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_228A1D550(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getMRUNowPlayingViewControllerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getMRUNowPlayingViewControllerClass_softClass;
  uint64_t v7 = getMRUNowPlayingViewControllerClass_softClass;
  if (!getMRUNowPlayingViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMRUNowPlayingViewControllerClass_block_invoke;
    v3[3] = &unk_26484DE68;
    v3[4] = &v4;
    __getMRUNowPlayingViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_228A1DB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMRUVisualStylingProviderClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getMRUVisualStylingProviderClass_softClass;
  uint64_t v7 = getMRUVisualStylingProviderClass_softClass;
  if (!getMRUVisualStylingProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMRUVisualStylingProviderClass_block_invoke;
    v3[3] = &unk_26484DE68;
    v3[4] = &v4;
    __getMRUVisualStylingProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_228A1DC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMRPlatterViewControllerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getMRPlatterViewControllerClass_softClass;
  uint64_t v7 = getMRPlatterViewControllerClass_softClass;
  if (!getMRPlatterViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMRPlatterViewControllerClass_block_invoke;
    v3[3] = &unk_26484DE68;
    v3[4] = &v4;
    __getMRPlatterViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_228A1DD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_228A1DE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMRUNowPlayingViewControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MRUNowPlayingViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMRUNowPlayingViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMRUNowPlayingViewControllerClass_block_invoke_cold_1();
    MediaControlsLibrary();
  }
}

void MediaControlsLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!MediaControlsLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __MediaControlsLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26484DF30;
    uint64_t v3 = 0;
    MediaControlsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!MediaControlsLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaControlsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaControlsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getMRUVisualStylingProviderClass_block_invoke(uint64_t a1)
{
  MediaControlsLibrary();
  Class result = objc_getClass("MRUVisualStylingProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMRUVisualStylingProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getMRUVisualStylingProviderClass_block_invoke_cold_1();
    return (Class)__getMRPlatterViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getMRPlatterViewControllerClass_block_invoke(uint64_t a1)
{
  MediaControlsLibrary();
  Class result = objc_getClass("MRPlatterViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMRPlatterViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getMRPlatterViewControllerClass_block_invoke_cold_1();
    return (Class)__getMTVisualStylingProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getMTVisualStylingProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __MaterialKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26484DF48;
    uint64_t v6 = 0;
    MaterialKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!MaterialKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MTVisualStylingProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getMTVisualStylingProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMTVisualStylingProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MaterialKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MaterialKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MediaRemoteLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_26484DF60;
    uint64_t v7 = 0;
    MediaRemoteLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)MediaRemoteLibraryCore_frameworkLibrary;
    if (MediaRemoteLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)MediaRemoteLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaRemoteLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaRemoteLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_228A20F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKTextBalloonViewClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ChatKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26484DFA8;
    uint64_t v5 = 0;
    ChatKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!ChatKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
LABEL_8:
      __getCKTextBalloonViewClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CKTextBalloonView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getCKTextBalloonViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ChatKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t __getCKMediaObjectManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_1(v0);
}

uint64_t __getMRUNowPlayingViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMRUVisualStylingProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getMRUVisualStylingProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMRPlatterViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getMRPlatterViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMTVisualStylingProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getMTVisualStylingProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SCKPMessageCardSectionViewController messageCardSectionAttachmentTapped:](v0);
}

void __getCKTextBalloonViewClass_block_invoke_cold_1()
{
  uint64_t v0 = (CGImage *)abort_report_np();
  CGImageRelease(v0);
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

uint64_t CRLogInitIfNeeded()
{
  return MEMORY[0x270F15AA0]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}