uint64_t lockdownArrivalCallback()
{
  int v0;
  uint64_t vars8;

  SCLog();
  sub_34DC();
  CFRunLoopSourceInvalidate((CFRunLoopSourceRef)qword_8070);
  CFRelease((CFTypeRef)qword_8070);
  qword_8070 = 0;
  CFMachPortInvalidate((CFMachPortRef)qword_8078);
  CFRelease((CFTypeRef)qword_8078);
  qword_8078 = 0;
  v0 = dword_8080;

  return notify_cancel(v0);
}

uint64_t _usb_device_configuration_add_interface(uint64_t a1, const char *a2, _DWORD *a3)
{
  CFStringRef v4 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, a2, 0x8000100u, kCFAllocatorNull);
  *a3 = 0;
  if (v4)
  {
    CFStringRef v5 = v4;
    pthread_mutex_lock(&stru_8000);
    CFArrayRef v6 = (const __CFArray *)qword_8088;
    v9.length = CFArrayGetCount((CFArrayRef)qword_8088);
    v9.location = 0;
    if (CFArrayGetFirstIndexOfValue(v6, v9, v5) == -1)
    {
      CFArrayAppendValue((CFMutableArrayRef)qword_8088, v5);
      CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, (CFArrayRef)qword_8088);
      pthread_mutex_unlock(&stru_8000);
      *a3 = sub_2F30();
      CFRelease(Copy);
      pthread_mutex_lock(&stru_8000);
    }
    pthread_mutex_unlock(&stru_8000);
    CFRelease(v5);
  }
  return 0;
}

BOOL sub_2F30()
{
  int v0 = IOUSBDeviceControllerCreate();
  if (!v0)
  {
    uint64_t v1 = IOUSBDeviceDescriptionCreateFromController();
    if (v1)
    {
      v2 = (const void *)v1;
      if (IOUSBDeviceDescriptionGetMatchingConfiguration()) {
        int v0 = IOUSBDeviceControllerSetPreferredConfiguration();
      }
      else {
        int v0 = 0;
      }
      CFRelease(v2);
    }
    else
    {
      int v0 = 0;
    }
    CFRelease((CFTypeRef)0xAAAAAAAAAAAAAAAALL);
  }
  return v0 == 0;
}

uint64_t _usb_device_configuration_remove_interface(uint64_t a1, const char *a2, _DWORD *a3)
{
  CFStringRef v4 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, a2, 0x8000100u, kCFAllocatorNull);
  *a3 = 0;
  if (v4)
  {
    CFStringRef v5 = v4;
    pthread_mutex_lock(&stru_8000);
    CFArrayRef v6 = (const __CFArray *)qword_8088;
    v10.length = CFArrayGetCount((CFArrayRef)qword_8088);
    v10.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v6, v10, v5);
    if (FirstIndexOfValue != -1)
    {
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_8088, FirstIndexOfValue);
      CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, (CFArrayRef)qword_8088);
      pthread_mutex_unlock(&stru_8000);
      *a3 = sub_2F30();
      CFRelease(Copy);
      pthread_mutex_lock(&stru_8000);
    }
    pthread_mutex_unlock(&stru_8000);
    CFRelease(v5);
  }
  return 0;
}

uint64_t start()
{
  uint64_t state64 = 0;
  if (notify_register_mach_port("com.apple.mobile.lockdown", (mach_port_t *)&dword_8090, 0, &dword_8080)
    || notify_get_state(dword_8080, &state64))
  {
    SCLog();
    uint64_t state64 = 1;
  }
  else if (!state64)
  {
    SCLog();
    qword_8078 = _SC_CFMachPortCreateWithPort();
    qword_8070 = (uint64_t)CFMachPortCreateRunLoopSource(kCFAllocatorDefault, (CFMachPortRef)qword_8078, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)qword_8070, kCFRunLoopDefaultMode);
    goto LABEL_5;
  }
  SCLog();
  sub_34DC();
LABEL_5:
  pthread_mutex_lock(&stru_8000);
  if (!qword_8098)
  {
    pthread_t v3 = (pthread_t)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v0 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v5.__opaque[24] = v0;
    *(_OWORD *)&v5.__opaque[40] = v0;
    *(_OWORD *)&v5.__sig = v0;
    *(_OWORD *)&v5.__opaque[8] = v0;
    pthread_attr_init(&v5);
    pthread_attr_setdetachstate(&v5, 2);
    pthread_create(&v3, &v5, (void *(__cdecl *)(void *))sub_32E0, 0);
    pthread_attr_destroy(&v5);
    while (qword_8098)
      pthread_cond_wait(&stru_8040, &stru_8000);
  }
  return pthread_mutex_unlock(&stru_8000);
}

uint64_t sub_32E0()
{
  mach_port_t sp = -1431655766;
  CStringPtr = CFStringGetCStringPtr(@"com.apple.SystemConfiguration.USBDeviceConfig", 0);
  if (!bootstrap_check_in(bootstrap_port, CStringPtr, &sp))
  {
    qword_80A0 = IOMIGMachPortCreate();
    if (qword_80A0)
    {
      IOMIGMachPortRegisterDemuxCallback();
      CFRunLoopGetCurrent();
      IOMIGMachPortScheduleWithRunLoop();
    }
  }
  pthread_mutex_lock(&stru_8000);
  qword_8088 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  qword_8098 = (uint64_t)CFRunLoopGetCurrent();
  pthread_mutex_unlock(&stru_8000);
  pthread_cond_signal(&stru_8040);
  CFRunLoopRun();
  if (qword_80A0)
  {
    CFRunLoopGetCurrent();
    IOMIGMachPortUnscheduleFromRunLoop();
    mach_port_name_t Port = IOMIGMachPortGetPort();
    CFRelease((CFTypeRef)qword_80A0);
    if (Port) {
      mach_port_mod_refs(mach_task_self_, Port, 1u, -1);
    }
    qword_80A0 = 0;
  }
  pthread_mutex_lock(&stru_8000);
  if (qword_8088)
  {
    CFRelease((CFTypeRef)qword_8088);
    qword_8088 = 0;
  }
  pthread_mutex_unlock(&stru_8000);
  return 0;
}

void stop(__CFRunLoopSource *a1)
{
  pthread_mutex_lock(&stru_8000);
  if (qword_8098) {
    CFRunLoopStop((CFRunLoopRef)qword_8098);
  }
  pthread_mutex_unlock(&stru_8000);

  CFRunLoopSourceSignal(a1);
}

uint64_t sub_34DC()
{
  SCLog();
  CFRunLoopRef Current = CFRunLoopGetCurrent();

  return _IOUSBDeviceControllerRegisterArrivalCallback(sub_353C, 0, Current, kCFRunLoopDefaultMode);
}

void sub_353C()
{
  SCLog();
  SCLog();
  if (IOUSBDeviceControllerCreate())
  {
    SCLog();
LABEL_3:
    SCLog();
    goto LABEL_11;
  }
  uint64_t v0 = IOUSBDeviceDescriptionCreateFromDefaultsAndController();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    CFStringRef v2 = (const __CFString *)MGCopyAnswer();
    if (v2)
    {
      CFStringRef v3 = v2;
      MutableCFArrayRef Copy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v2);
      v6.length = CFStringGetLength(v3);
      v6.location = 0;
      CFStringFindAndReplace(MutableCopy, @"-", &stru_43B0, v6, 0);
      IOUSBDeviceDescriptionSetSerialString();
      CFRelease(MutableCopy);
      IOUSBDeviceDescriptionSetUDIDString();
      CFRelease(v3);
      if (IOUSBDeviceControllerSetDescription())
      {
        SCLog();
        CFRelease(v1);
        CFRelease(0);
        goto LABEL_3;
      }
    }
    else
    {
      SCLog();
    }
    CFRelease(v1);
  }
  CFRelease(0);
LABEL_11:
  pthread_mutex_lock(&stru_8000);
  if (qword_8088) {
    CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, (CFArrayRef)qword_8088);
  }
  else {
    CFArrayRef Copy = 0;
  }
  pthread_mutex_unlock(&stru_8000);
  sub_2F30();
  if (Copy) {
    CFRelease(Copy);
  }
}

uint64_t sub_3720(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  int v3 = a2[5];
  if (v3 >= 30050 && v3 < 30052) {
    LOBYTE(result) = usb_device_configuration_server(a2, a3);
  }
  else {
    LOBYTE(result) = 0;
  }
  return result;
}

uint64_t usb_device_configuration_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 30052) >= 0xFFFFFFFE) {
    return (uint64_t)*(&_usb_device_configuration_subsystem + 5 * (v1 - 30050) + 5);
  }
  else {
    return 0;
  }
}

const char *sub_37A4(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x128
    || ((unsigned int v5 = *((_DWORD *)result + 9), v5 <= 0x100) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  uint64_t result = (const char *)_usb_device_configuration_add_interface(*((unsigned int *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v9 = NDR_record;
  if (result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_3874(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x128
    || ((unsigned int v5 = *((_DWORD *)result + 9), v5 <= 0x100) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  uint64_t result = (const char *)_usb_device_configuration_remove_interface(*((unsigned int *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v9 = NDR_record;
  if (result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t usb_device_configuration_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 30052) >= 0xFFFFFFFE
    && (unsigned int v5 = (void (*)(void))*(&_usb_device_configuration_subsystem + 5 * (v4 - 30050) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return _CFStringFindAndReplace(theString, stringToFind, replacementString, rangeToSearch, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

uint64_t IOMIGMachPortCreate()
{
  return _IOMIGMachPortCreate();
}

uint64_t IOMIGMachPortGetPort()
{
  return _IOMIGMachPortGetPort();
}

uint64_t IOMIGMachPortRegisterDemuxCallback()
{
  return _IOMIGMachPortRegisterDemuxCallback();
}

uint64_t IOMIGMachPortScheduleWithRunLoop()
{
  return _IOMIGMachPortScheduleWithRunLoop();
}

uint64_t IOMIGMachPortUnscheduleFromRunLoop()
{
  return _IOMIGMachPortUnscheduleFromRunLoop();
}

uint64_t IOUSBDeviceControllerCreate()
{
  return _IOUSBDeviceControllerCreate();
}

uint64_t IOUSBDeviceControllerSetDescription()
{
  return _IOUSBDeviceControllerSetDescription();
}

uint64_t IOUSBDeviceControllerSetPreferredConfiguration()
{
  return _IOUSBDeviceControllerSetPreferredConfiguration();
}

uint64_t IOUSBDeviceDescriptionCreateFromController()
{
  return _IOUSBDeviceDescriptionCreateFromController();
}

uint64_t IOUSBDeviceDescriptionCreateFromDefaultsAndController()
{
  return _IOUSBDeviceDescriptionCreateFromDefaultsAndController();
}

uint64_t IOUSBDeviceDescriptionGetMatchingConfiguration()
{
  return _IOUSBDeviceDescriptionGetMatchingConfiguration();
}

uint64_t IOUSBDeviceDescriptionSetSerialString()
{
  return _IOUSBDeviceDescriptionSetSerialString();
}

uint64_t IOUSBDeviceDescriptionSetUDIDString()
{
  return _IOUSBDeviceDescriptionSetUDIDString();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t SCLog()
{
  return _SCLog();
}

uint64_t _SC_CFMachPortCreateWithPort()
{
  return __SC_CFMachPortCreateWithPort();
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return _notify_register_mach_port(name, notify_port, flags, out_token);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}