void _PRHandleSelfCacheDidChange(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  NSObject *v5;
  BOOL v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x263EF8340];
  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = [v2 hasVendedData];
    v5 = _PRGetLogSystem();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        v7 = 136315394;
        v8 = "_PRHandleSelfCacheDidChange";
        v9 = 1024;
        v10 = 930;
        _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Rebroadcasting PRSelfLikenessesDidChangeNotification\"", (uint8_t *)&v7, 0x12u);
      }

      v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 postNotificationName:@"PRSelfLikenessesDidChangeNotification" object:v3];
    }
    else if (v6)
    {
      v7 = 136315650;
      v8 = "_PRHandleSelfCacheDidChange";
      v9 = 1024;
      v10 = 926;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Store %@ has never vended data. Not broadcasting local change notifications.\"", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void _PRHandleOtherCacheDidChange(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = v2;
  if (v2)
  {
    char v4 = [v2 hasVendedData];
    v5 = _PRGetLogSystem();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        int v7 = 136315394;
        v8 = "_PRHandleOtherCacheDidChange";
        __int16 v9 = 1024;
        int v10 = 947;
        _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Rebroadcasting PROtherLikenessesDidChangeNotification\"", (uint8_t *)&v7, 0x12u);
      }

      v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 postNotificationName:@"PROtherLikenessesDidChangeNotification" object:v3];
    }
    else if (v6)
    {
      int v7 = 136315650;
      v8 = "_PRHandleOtherCacheDidChange";
      __int16 v9 = 1024;
      int v10 = 943;
      __int16 v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Store %@ has never vended data. Not broadcasting local change notifications.\"", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

id _PRGetLogSystem()
{
  if (_PRGetLogSystem_onceToken != -1) {
    dispatch_once(&_PRGetLogSystem_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_PRGetLogSystem_log;
  return v0;
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6770](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}