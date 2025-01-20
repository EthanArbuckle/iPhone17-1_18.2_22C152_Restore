void _registerObservers(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t vars8;

  if (a2[2])
  {
    v2 = a2;
    [v2 setShouldRegisterForZoomListeners:1];
    [v2 setRegisteredForZoomListener:0];
    [v2 setRegisteredForZoomAttributeListeners:0];
    [v2 _zoomChanged:0];
  }
}

void sub_22162E4DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

double ZOTMainScreenSize()
{
  if (ZOTMainScreenSize_onceToken != -1) {
    dispatch_once(&ZOTMainScreenSize_onceToken, &__block_literal_global_676);
  }
  return *(double *)&ZOTMainScreenSize_ScreenSize_0;
}

void __ZOTMainScreenSize_block_invoke()
{
  ZOTMainScreenSize_ScreenSize_0 = MEMORY[0x223C86740]();
  ZOTMainScreenSize_ScreenSize_1 = v0;
}

double ZOTMainScreenRect()
{
  return 0.0;
}

id ZOTWindowServerDisplay()
{
  uint64_t v0 = (void *)ZOTWindowServerDisplay_kZOTWindowServerDisplay;
  if (!ZOTWindowServerDisplay_kZOTWindowServerDisplay)
  {
    v1 = [MEMORY[0x263F15920] server];
    uint64_t v2 = [v1 displays];
    uint64_t v3 = [v2 firstObject];
    v4 = (void *)ZOTWindowServerDisplay_kZOTWindowServerDisplay;
    ZOTWindowServerDisplay_kZOTWindowServerDisplay = v3;

    uint64_t v0 = (void *)ZOTWindowServerDisplay_kZOTWindowServerDisplay;
  }
  return v0;
}

uint64_t ZOTDeviceRotation()
{
  uint64_t result = ZOTDeviceRotation_Rotation;
  if (ZOTDeviceRotation_Rotation == -1)
  {
    uint64_t result = MGCopyAnswer();
    if (result)
    {
      CFRelease((CFTypeRef)result);
      GSMainScreenOrientation();
      double v2 = fabsf(v1);
      if (v2 < 0.001)
      {
        uint64_t result = 0;
        ZOTDeviceRotation_Rotation = 0;
        return result;
      }
      if (fabs(v2 + -4.71238898) < 0.001)
      {
        uint64_t result = 2;
LABEL_10:
        ZOTDeviceRotation_Rotation = result;
        return result;
      }
      if (fabs(v2 + -1.57079633) < 0.001)
      {
        uint64_t result = 1;
        goto LABEL_10;
      }
      return ZOTDeviceRotation_Rotation;
    }
  }
  return result;
}

uint64_t ZOTDisplayMainScreenSize()
{
  return ZOTDeviceRotation();
}

uint64_t ZOTRotateToScreen(char a1)
{
  if ((a1 & 1) == 0)
  {
    ZOTMainScreenSize();
    ZOTDeviceRotation();
  }
  return ZOTDeviceRotation();
}

uint64_t ZOTRotateFromScreen(char a1)
{
  if ((a1 & 1) == 0)
  {
    ZOTMainScreenSize();
    ZOTDeviceRotation();
  }
  return ZOTDeviceRotation();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXProcessGetName()
{
  return MEMORY[0x270F0A288]();
}

uint64_t AXProcessIsAXSettingsShortcutsPlugin()
{
  return MEMORY[0x270F0A290]();
}

uint64_t AXProcessIsAXUIServer()
{
  return MEMORY[0x270F0A298]();
}

uint64_t AXProcessIsBackboard()
{
  return MEMORY[0x270F0A2A8]();
}

uint64_t AXProcessIsPreferences()
{
  return MEMORY[0x270F0A2C8]();
}

uint64_t AXProcessIsSetup()
{
  return MEMORY[0x270F0A2D8]();
}

uint64_t AXProcessIsSiri()
{
  return MEMORY[0x270F0A2E0]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F0A2E8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

uint64_t GSMainScreenOrientation()
{
  return MEMORY[0x270F30668]();
}

uint64_t GSMainScreenSize()
{
  return MEMORY[0x270F30688]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x270EF2BB0](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t ZOOMLogCommon()
{
  return MEMORY[0x270F0A3E0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F0A408]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}