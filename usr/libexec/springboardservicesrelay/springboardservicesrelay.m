void start()
{
  int *v0;

  secure_lockdown_checkin();
  v0 = __error();
  NSLog(@"lockdown_checkin() failed: %d", *v0);
  exit(-1);
}

uint64_t sub_100003488(vm_address_t address, vm_size_t size)
{
  return vm_deallocate(mach_task_self_, address, size);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return _CFAllocatorCreate(allocator, context);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

void CFRelease(CFTypeRef cf)
{
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBGetHomeScreenIconMetrics()
{
  return _SBGetHomeScreenIconMetrics();
}

uint64_t SBGetIconState()
{
  return _SBGetIconState();
}

uint64_t SBGetInterfaceOrientation()
{
  return _SBGetInterfaceOrientation();
}

uint64_t SBGetPendingIconState()
{
  return _SBGetPendingIconState();
}

uint64_t SBSCopyIconImagePNGDataForDisplayIdentifier()
{
  return _SBSCopyIconImagePNGDataForDisplayIdentifier();
}

uint64_t SBSSpringBoardBackgroundServerPort()
{
  return _SBSSpringBoardBackgroundServerPort();
}

uint64_t SBSSpringBoardServerPort()
{
  return _SBSSpringBoardServerPort();
}

uint64_t SBSUIWallpaperGetCurrentHomeScreenImage()
{
  return _SBSUIWallpaperGetCurrentHomeScreenImage();
}

uint64_t SBSUIWallpaperGetCurrentLockScreenImage()
{
  return _SBSUIWallpaperGetCurrentLockScreenImage();
}

uint64_t SBSetIconState()
{
  return _SBSetIconState();
}

uint64_t UIApplicationInitialize()
{
  return _UIApplicationInitialize();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t _UISharedImageSetPreferredImageScale()
{
  return __UISharedImageSetPreferredImageScale();
}

int *__error(void)
{
  return ___error();
}

void exit(int a1)
{
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_wallpaperImage(void *a1, const char *a2, ...)
{
  return [a1 wallpaperImage];
}

id objc_msgSend_wallpaperType(void *a1, const char *a2, ...)
{
  return [a1 wallpaperType];
}